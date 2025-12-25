-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\TalkTrigger.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    QuestId = 11010107,
  },
}
r0_0.RT_2 = {
  QuestStart = r0_0.RT_1,
}
r0_0.RT_3 = {
  QuestId = 11010108,
}
r0_0.RT_4 = {
  QuestUnstart = r0_0.RT_3,
}
r0_0.RT_5 = {
  r0_0.RT_2,
  r0_0.RT_4
}
r0_0.RT_6 = {
  And = r0_0.RT_5,
}
r0_0.RT_7 = {
  QuestId = 11010305,
}
r0_0.RT_8 = {
  QuestStart = r0_0.RT_7,
}
r0_0.RT_9 = {
  QuestId = 11010306,
}
r0_0.RT_10 = {
  QuestUnstart = r0_0.RT_9,
}
r0_0.RT_11 = {
  r0_0.RT_8,
  r0_0.RT_10
}
r0_0.RT_12 = {
  And = r0_0.RT_11,
}
r0_0.RT_13 = {
  QuestId = 11010109,
}
r0_0.RT_14 = {
  QuestStart = r0_0.RT_13,
}
r0_0.RT_15 = {
  QuestId = 11010301,
}
r0_0.RT_16 = {
  QuestUnstart = r0_0.RT_15,
}
r0_0.RT_17 = {
  r0_0.RT_14,
  r0_0.RT_16
}
r0_0.RT_18 = {
  And = r0_0.RT_17,
}
r0_0.RT_19 = {
  QuestId = 10030104,
}
r0_0.RT_20 = {
  QuestStart = r0_0.RT_19,
}
r0_0.RT_21 = {
  QuestId = 10030105,
}
r0_0.RT_22 = {
  QuestUnstart = r0_0.RT_21,
}
r0_0.RT_23 = {
  r0_0.RT_20,
  r0_0.RT_22
}
r0_0.RT_24 = {
  And = r0_0.RT_23,
}
r0_0.RT_25 = {
  TalkTriggerId = 510033,
}
r0_0.RT_26 = {
  ImprUncomp = r0_0.RT_25,
}
r0_0.RT_27 = {
  TalkTriggerId = 510016,
}
r0_0.RT_28 = {
  QuestChainId = 100208,
}
r0_0.RT_29 = {
  QuestChainFinish = r0_0.RT_28,
}
r0_0.RT_30 = {
  TalkTriggerId = 510022,
}
r0_0.RT_31 = {
  QuestId = 20021004,
}
r0_0.RT_32 = {
  QuestFinish = r0_0.RT_31,
}
r0_0.RT_33 = {
  TalkTriggerId = 510023,
}
r0_0.RT_34 = {
  ImprComp = r0_0.RT_33,
}
r0_0.RT_35 = {
  QuestId = 20020309,
}
r0_0.RT_36 = {
  QuestFinish = r0_0.RT_35,
}
r0_0.RT_37 = {
  QuestChainId = 200205,
}
r0_0.RT_38 = {
  QuestId = 20020608,
}
r0_0.RT_39 = {
  QuestFinish = r0_0.RT_38,
}
r0_0.RT_40 = {
  QuestId = 20020706,
}
r0_0.RT_41 = {
  QuestFinish = r0_0.RT_40,
}
r0_0.RT_42 = {
  QuestId = 20021301,
}
r0_0.RT_43 = {
  QuestFinish = r0_0.RT_42,
}
r0_0.RT_44 = {
  TalkTriggerId = 510102,
}
r0_0.RT_45 = {
  ImprComp = r0_0.RT_44,
}
r0_0.RT_46 = {
  TalkTriggerId = 510103,
}
r0_0.RT_47 = {
  ImprComp = r0_0.RT_46,
}
r0_0.RT_48 = {
  QuestChainId = 100307,
}
r0_0.RT_49 = {
  QuestChainFinish = r0_0.RT_48,
}
r0_0.RT_50 = {
  TalkTriggerId = 510104,
}
r0_0.RT_51 = {
  ImprComp = r0_0.RT_50,
}
r0_0.RT_52 = {
  QuestChainId = 100204,
}
r0_0.RT_53 = {
  QuestChainFinish = r0_0.RT_52,
}
r0_0.RT_54 = {
  ExploreGroupId = 7013098,
}
r0_0.RT_55 = {
  ExploreGroupInActive = r0_0.RT_54,
}
r0_0.RT_56 = {
  ExploreGroupComp = r0_0.RT_54,
}
r0_0.RT_57 = {
  ExploreGroupId = 7013101,
}
r0_0.RT_58 = {
  ExploreGroupComp = r0_0.RT_57,
}
r0_0.RT_59 = {
  QuestChainId = 990103,
}
r0_0.RT_60 = {
  QuestChainFinish = r0_0.RT_59,
}
r0_0.RT_61 = {
  QuestChainId = 110109,
}
r0_0.RT_62 = {
  QuestChainId = 100306,
}
r0_0.RT_63 = {
  QuestChainUnFinish = r0_0.RT_62,
}
r0_0.RT_64 = {
  QuestChainFinish = r0_0.RT_62,
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [199, 199] id: 1
  return r1_1
end
local r3_0 = "TalkTrigger"
local r4_0 = {
  [-1] = {
    DialogueId = 10010111,
    TalkTriggerId = -1,
    TalkType = "ForgingGuide",
  },
  [105] = {
    StoryLinePath = "105.story",
    TalkId = 105,
    TalkTriggerId = 105,
  },
  [107] = {
    StoryLinePath = "107.story",
    TalkId = 107,
    TalkTriggerId = 107,
    Type = "Impression",
  },
  [1001] = {
    StoryLinePath = "Common/LeaveHintTrigger.story",
    TalkId = 1001,
    TalkTriggerId = 1001,
  },
  [1002] = {
    DialogueId = 10012502,
    TalkTriggerId = 1002,
    TalkType = "SpecialQuestFail",
  },
  [3001] = {
    DialogueId = 90000001,
    TalkTriggerId = 3001,
    TalkType = "ForgingGuide",
  },
  [10101] = {
    DialogueId = 60140001,
    TalkTriggerId = 10101,
    TalkType = "AudioOnly",
  },
  [10102] = {
    DialogueId = 60140002,
    TalkTriggerId = 10102,
    TalkType = "AudioOnly",
  },
  [10103] = {
    DialogueId = 60140003,
    TalkTriggerId = 10103,
    TalkType = "AudioOnly",
  },
  [10104] = {
    DialogueId = 60140004,
    TalkTriggerId = 10104,
    TalkType = "AudioOnly",
  },
  [10105] = {
    DialogueId = 60140005,
    TalkTriggerId = 10105,
    TalkType = "AudioOnly",
  },
  [10106] = {
    DialogueId = 60140006,
    TalkTriggerId = 10106,
    TalkType = "AudioOnly",
  },
  [10201] = {
    DialogueId = 60140201,
    TalkTriggerId = 10201,
    TalkType = "AudioOnly",
  },
  [10202] = {
    DialogueId = 60140202,
    TalkTriggerId = 10202,
    TalkType = "AudioOnly",
  },
  [10203] = {
    DialogueId = 60140203,
    TalkTriggerId = 10203,
    TalkType = "AudioOnly",
  },
  [10204] = {
    DialogueId = 60140204,
    TalkTriggerId = 10204,
    TalkType = "AudioOnly",
  },
  [10205] = {
    DialogueId = 60140205,
    TalkTriggerId = 10205,
    TalkType = "AudioOnly",
  },
  [10206] = {
    DialogueId = 60140206,
    TalkTriggerId = 10206,
    TalkType = "AudioOnly",
  },
  [10207] = {
    DialogueId = 60140207,
    TalkTriggerId = 10207,
    TalkType = "AudioOnly",
  },
  [20101] = {
    DialogueId = 60140001,
    TalkTriggerId = 20101,
    TalkType = "Boss",
  },
  [20102] = {
    DialogueId = 60140002,
    TalkTriggerId = 20102,
    TalkType = "Boss",
  },
  [20103] = {
    DialogueId = 60140003,
    TalkTriggerId = 20103,
    TalkType = "Boss",
  },
  [20104] = {
    DialogueId = 60140004,
    TalkTriggerId = 20104,
    TalkType = "Boss",
  },
  [20105] = {
    DialogueId = 60140005,
    TalkTriggerId = 20105,
    TalkType = "Boss",
  },
  [20106] = {
    DialogueId = 60140006,
    TalkTriggerId = 20106,
    TalkType = "Boss",
  },
  [20201] = {
    DialogueId = 60140201,
    TalkTriggerId = 20201,
    TalkType = "Boss",
  },
  [20202] = {
    DialogueId = 60140202,
    TalkTriggerId = 20202,
    TalkType = "Boss",
  },
  [20203] = {
    DialogueId = 60140203,
    TalkTriggerId = 20203,
    TalkType = "Boss",
  },
  [20204] = {
    DialogueId = 60140204,
    TalkTriggerId = 20204,
    TalkType = "Boss",
  },
  [20205] = {
    DialogueId = 60140205,
    TalkTriggerId = 20205,
    TalkType = "Boss",
  },
  [20206] = {
    DialogueId = 60140206,
    TalkTriggerId = 20206,
    TalkType = "Boss",
  },
  [20207] = {
    DialogueId = 60140207,
    TalkTriggerId = 20207,
    TalkType = "Boss",
  },
  [20301] = {
    DialogueId = 60149001,
    TalkTriggerId = 20301,
    TalkType = "UnimportGuide",
  },
  [20302] = {
    DialogueId = 60149002,
    TalkTriggerId = 20302,
    TalkType = "UnimportGuide",
  },
  [20303] = {
    DialogueId = 60149003,
    TalkTriggerId = 20303,
    TalkType = "UnimportGuide",
  },
  [20304] = {
    DialogueId = 60149004,
    TalkTriggerId = 20304,
    TalkType = "UnimportGuide",
  },
  [20305] = {
    DialogueId = 60149005,
    TalkTriggerId = 20305,
    TalkType = "UnimportGuide",
  },
  [20306] = {
    DialogueId = 60149006,
    TalkTriggerId = 20306,
    TalkType = "UnimportGuide",
  },
  [20307] = {
    DialogueId = 60149007,
    TalkTriggerId = 20307,
    TalkType = "UnimportGuide",
  },
  [20308] = {
    DialogueId = 60149008,
    TalkTriggerId = 20308,
    TalkType = "UnimportGuide",
  },
  [20309] = {
    DialogueId = 60149009,
    TalkTriggerId = 20309,
    TalkType = "UnimportGuide",
  },
  [20310] = {
    DialogueId = 60149010,
    TalkTriggerId = 20310,
    TalkType = "UnimportGuide",
  },
  [20311] = {
    DialogueId = 60149011,
    TalkTriggerId = 20311,
    TalkType = "UnimportGuide",
  },
  [20312] = {
    DialogueId = 60149012,
    TalkTriggerId = 20312,
    TalkType = "UnimportGuide",
  },
  [20313] = {
    DialogueId = 60149013,
    TalkTriggerId = 20313,
    TalkType = "UnimportGuide",
  },
  [20314] = {
    DialogueId = 60149014,
    TalkTriggerId = 20314,
    TalkType = "UnimportGuide",
  },
  [20315] = {
    DialogueId = 60149015,
    TalkTriggerId = 20315,
    TalkType = "UnimportGuide",
  },
  [20401] = {
    DialogueId = 60140401,
    TalkTriggerId = 20401,
    TalkType = "Boss",
  },
  [20402] = {
    DialogueId = 60140402,
    TalkTriggerId = 20402,
    TalkType = "Boss",
  },
  [20403] = {
    DialogueId = 60140403,
    TalkTriggerId = 20403,
    TalkType = "Boss",
  },
  [20404] = {
    DialogueId = 60140404,
    TalkTriggerId = 20404,
    TalkType = "Boss",
  },
  [20405] = {
    DialogueId = 60140405,
    TalkTriggerId = 20405,
    TalkType = "Boss",
  },
  [20406] = {
    DialogueId = 60140406,
    TalkTriggerId = 20406,
    TalkType = "Boss",
  },
  [20407] = {
    DialogueId = 60140407,
    TalkTriggerId = 20407,
    TalkType = "Boss",
  },
  [20408] = {
    DialogueId = 60140408,
    TalkTriggerId = 20408,
    TalkType = "Boss",
  },
  [20409] = {
    DialogueId = 60140409,
    TalkTriggerId = 20409,
    TalkType = "Boss",
  },
  [20501] = {
    DialogueId = 60140501,
    TalkTriggerId = 20501,
    TalkType = "Boss",
  },
  [20502] = {
    DialogueId = 60140502,
    TalkTriggerId = 20502,
    TalkType = "Boss",
  },
  [20503] = {
    DialogueId = 60140503,
    TalkTriggerId = 20503,
    TalkType = "Boss",
  },
  [20504] = {
    DialogueId = 60140504,
    TalkTriggerId = 20504,
    TalkType = "Boss",
  },
  [20505] = {
    DialogueId = 60140505,
    TalkTriggerId = 20505,
    TalkType = "Boss",
  },
  [20506] = {
    DialogueId = 60140506,
    TalkTriggerId = 20506,
    TalkType = "Boss",
  },
  [20507] = {
    DialogueId = 60140507,
    TalkTriggerId = 20507,
    TalkType = "Boss",
  },
  [20508] = {
    DialogueId = 60140508,
    TalkTriggerId = 20508,
    TalkType = "Boss",
  },
  [20601] = {
    DialogueId = 60150001,
    TalkTriggerId = 20601,
    TalkType = "AudioOnly",
  },
  [20602] = {
    DialogueId = 60150002,
    TalkTriggerId = 20602,
    TalkType = "AudioOnly",
  },
  [20603] = {
    DialogueId = 60150003,
    TalkTriggerId = 20603,
    TalkType = "AudioOnly",
  },
  [20604] = {
    DialogueId = 60150004,
    TalkTriggerId = 20604,
    TalkType = "AudioOnly",
  },
  [20605] = {
    DialogueId = 60150005,
    TalkTriggerId = 20605,
    TalkType = "AudioOnly",
  },
  [20606] = {
    DialogueId = 60150006,
    TalkTriggerId = 20606,
    TalkType = "AudioOnly",
  },
  [20701] = {
    DialogueId = 60160001,
    TalkTriggerId = 20701,
    TalkType = "UnimportGuide",
  },
  [20702] = {
    DialogueId = 60160002,
    TalkTriggerId = 20702,
    TalkType = "UnimportGuide",
  },
  [20703] = {
    DialogueId = 60160003,
    TalkTriggerId = 20703,
    TalkType = "UnimportGuide",
  },
  [20704] = {
    DialogueId = 60160004,
    TalkTriggerId = 20704,
    TalkType = "UnimportGuide",
  },
  [20705] = {
    DialogueId = 60160005,
    TalkTriggerId = 20705,
    TalkType = "UnimportGuide",
  },
  [20801] = {
    DialogueId = 60170001,
    TalkTriggerId = 20801,
    TalkType = "Boss",
  },
  [20802] = {
    DialogueId = 60170002,
    TalkTriggerId = 20802,
    TalkType = "Boss",
  },
  [20803] = {
    DialogueId = 60170003,
    TalkTriggerId = 20803,
    TalkType = "Boss",
  },
  [20901] = {
    DialogueId = 60180001,
    TalkTriggerId = 20901,
    TalkType = "Boss",
  },
  [20902] = {
    DialogueId = 60180002,
    TalkTriggerId = 20902,
    TalkType = "Boss",
  },
  [20903] = {
    DialogueId = 60180003,
    TalkTriggerId = 20903,
    TalkType = "Boss",
  },
  [20904] = {
    DialogueId = 60180004,
    TalkTriggerId = 20904,
    TalkType = "Boss",
  },
  [20905] = {
    DialogueId = 60180005,
    TalkTriggerId = 20905,
    TalkType = "Boss",
  },
  [20906] = {
    DialogueId = 60180006,
    TalkTriggerId = 20906,
    TalkType = "Boss",
  },
  [100125] = {
    StoryLinePath = "Common/100125.story",
    TalkId = 100125,
    TalkTriggerId = 100125,
  },
  [100142] = {
    StoryLinePath = "Other/100142.story",
    TalkTriggerId = 100142,
  },
}
local r5_0 = 100143
local r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/AogeTraceEnlik.story",
  TalkId = 100143,
  TalkTriggerId = 100143,
}
r6_0.TriggerCondition = {
  And = {
    {
      QuestStart = {
        QuestId = 10020652,
      },
    },
    {
      QuestUnstart = {
        QuestId = 10020604,
      },
    }
  },
}
r4_0[r5_0] = r6_0
r5_0 = 100144
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/EnlikeIcelake.story",
  TalkId = 100144,
  TalkTriggerId = 100144,
}
r6_0.TriggerCondition = {
  And = {
    {
      QuestStart = {
        QuestId = 10020608,
      },
    },
    {
      QuestUnstart = {
        QuestId = 10020611,
      },
    }
  },
}
r4_0[r5_0] = r6_0
r4_0[100295] = {
  TalkId = 100295,
  TalkTriggerId = 100295,
}
r4_0[101043] = {
  StoryLinePath = "Other/101043.story",
  TalkTriggerId = 101043,
}
r4_0[101050] = {
  DialogueId = 10105001,
  TalkTriggerId = 101050,
  TalkType = "Guide",
}
r4_0[101051] = {
  DialogueId = 10105101,
  TalkTriggerId = 101051,
  TalkType = "Guide",
}
r4_0[101052] = {
  DialogueId = 10105201,
  TalkId = 101052,
  TalkTriggerId = 101052,
  TalkType = "Guide",
}
r4_0[101120] = {
  DialogueId = 10112001,
  TalkTriggerId = 101120,
  TalkType = "Guide",
}
r4_0[101180] = {
  StoryLinePath = "Other/101180.story",
  TalkId = 101180,
  TalkTriggerId = 101180,
}
r5_0 = 110118
r6_0 = {
  StoryLinePath = "Impression/EX01Fort/Gossip/Kajia1.story",
  TalkId = 110118,
  TalkTriggerId = 110118,
}
r6_0.TriggerCondition = {
  And = {
    {
      QuestStart = {
        QuestId = 11010510,
      },
    },
    {
      QuestUnstart = {
        QuestId = 11010521,
      },
    }
  },
}
r4_0[r5_0] = r6_0
r6_0 = {
  StoryLinePath = "Impression/EX01Fort/Gossip/LaiAng.story",
  TalkId = 110119,
  TalkTriggerId = 110119,
}
r6_0.TriggerCondition = {
  QuestFinish = {
    QuestId = 11010508,
  },
}
r4_0[110119] = r6_0
r4_0[110120] = {
  StoryLinePath = "Impression/EX01Fort/Task/impression09.story",
  TalkId = 110120,
  TalkTriggerId = 110120,
  TriggerCondition = r0_0.RT_6,
  Type = "Impression",
}
r4_0[110121] = {
  StoryLinePath = "Impression/EX01Fort/Task/impression10.story",
  TalkId = 110121,
  TalkTriggerId = 110121,
  TriggerCondition = r0_0.RT_6,
  Type = "Impression",
}
r5_0 = 110122
r6_0 = {
  StoryLinePath = "Impression/EX01Fort/Task/impression03.story",
  TalkTriggerId = 110122,
}
r6_0.TriggerCondition = {
  And = {
    {
      QuestStart = {
        QuestId = 11010516,
      },
    },
    {
      QuestUnstart = {
        QuestId = 11010517,
      },
    }
  },
}
r6_0.Type = "Impression"
r4_0[r5_0] = r6_0
r4_0[110123] = {
  StoryLinePath = "Impression/EX01Fort/Gossip/AwaTalk1.story",
  TalkId = 110123,
  TalkTriggerId = 110123,
  TriggerCondition = r0_0.RT_12,
}
r6_0 = {
  StoryLinePath = "Impression/EX01Fort/Gossip/AwaTalk2.story",
  TalkId = 110124,
  TalkTriggerId = 110124,
}
r6_0.TriggerCondition = {
  QuestStart = {
    QuestId = 11010511,
  },
}
r4_0[110124] = r6_0
r4_0[110125] = {
  StoryLinePath = "Impression/EX01Fort/Gossip/Monica1.story",
  TalkId = 110125,
  TalkTriggerId = 110125,
  TriggerCondition = r0_0.RT_12,
}
r4_0[110126] = {
  StoryLinePath = "Impression/EX01Fort/Gossip/HurtBubble01.story",
  TalkId = 110126,
  TalkTriggerId = 110126,
  TriggerCondition = r0_0.RT_18,
}
r4_0[110127] = {
  StoryLinePath = "Impression/EX01Fort/Gossip/HurtBubble02.story",
  TalkId = 110127,
  TalkTriggerId = 110127,
  TriggerCondition = r0_0.RT_18,
}
r4_0[110128] = {
  StoryLinePath = "TalkGossip/110128_Dafu.story",
  TalkId = 110128,
  TalkTriggerId = 110128,
  TriggerCondition = r0_0.RT_6,
}
r4_0[110129] = {
  StoryLinePath = "Impression/EX01Fort/Gossip/SoldierBubble01.story",
  TalkId = 110129,
  TalkTriggerId = 110129,
  TriggerCondition = r0_0.RT_6,
}
r4_0[110130] = {
  StoryLinePath = "Impression/EX01Fort/Gossip/SoldierBubble02.story",
  TalkId = 110130,
  TalkTriggerId = 110130,
  TriggerCondition = r0_0.RT_6,
}
r4_0[110131] = {
  StoryLinePath = "Impression/EX01Fort/Gossip/SoldierBubble03.story",
  TalkId = 110131,
  TalkTriggerId = 110131,
  TriggerCondition = r0_0.RT_6,
}
r6_0 = {
  StoryLinePath = "Impression/EX01Fort/Gossip/MonikaWeike.story",
  TalkId = 110132,
  TalkTriggerId = 110132,
}
r6_0.TriggerCondition = {
  VarEqual = {
    Name = "Weike110103",
    Value = 1,
  },
}
r4_0[110132] = r6_0
r4_0[110133] = {
  StoryLinePath = "Impression/EX01Fort/Gossip/SoldierBubble04.story",
  TalkId = 110133,
  TalkTriggerId = 110133,
  TriggerCondition = r0_0.RT_6,
}
r4_0[110134] = {
  StoryLinePath = "Impression/EX01Fort/Gossip/SoldierBubble05.story",
  TalkId = 110134,
  TalkTriggerId = 110134,
  TriggerCondition = r0_0.RT_6,
}
r4_0[110135] = {
  StoryLinePath = "Impression/EX01Fort/Gossip/SoldierBubble06.story",
  TalkId = 110135,
  TalkTriggerId = 110135,
  TriggerCondition = r0_0.RT_6,
}
r5_0 = 110136
r6_0 = {
  StoryLinePath = "Impression/EX01Fort/Gossip/DafuLinshi.story",
  TalkId = 110136,
  TalkTriggerId = 110136,
}
r6_0.TriggerCondition = {
  And = {
    {
      QuestStart = r0_0.RT_15,
    },
    {
      QuestUnstart = {
        QuestId = 11010308,
      },
    }
  },
}
r4_0[r5_0] = r6_0
r4_0[120106] = {
  StoryLinePath = "Impression/East01/Gossip/120106.story",
  TalkId = 120106,
  TalkTriggerId = 120106,
}
r4_0[120250] = {
  StoryLinePath = "Impression/East01/Talk_Gossip/120250.story",
  TalkId = 120250,
  TalkTriggerId = 120250,
}
r4_0[120251] = {
  StoryLinePath = "Impression/East01/Talk_Gossip/120251.story",
  TalkId = 120251,
  TalkTriggerId = 120251,
}
r4_0[120252] = {
  StoryLinePath = "Impression/East01/Talk_Gossip/120252.story",
  TalkId = 120252,
  TalkTriggerId = 120252,
}
r4_0[120253] = {
  StoryLinePath = "Impression/East01/Talk_Gossip/120253.story",
  TalkId = 120253,
  TalkTriggerId = 120253,
}
r4_0[120254] = {
  StoryLinePath = "Impression/East01/Talk_Gossip/120254.story",
  TalkId = 120254,
  TalkTriggerId = 120254,
}
r4_0[120255] = {
  StoryLinePath = "Impression/East01/Talk_Gossip/120255.story",
  TalkId = 120255,
  TalkTriggerId = 120255,
}
r4_0[120256] = {
  StoryLinePath = "Impression/East01/Talk_Gossip/120256.story",
  TalkId = 120256,
  TalkTriggerId = 120256,
}
r4_0[120257] = {
  StoryLinePath = "Impression/East01/Talk_Gossip/120257.story",
  TalkId = 120257,
  TalkTriggerId = 120257,
}
r4_0[120258] = {
  StoryLinePath = "Impression/East01/Talk_Gossip/120258.story",
  TalkId = 120258,
  TalkTriggerId = 120258,
}
r4_0[120259] = {
  StoryLinePath = "Impression/East01/Talk_Gossip/120259.story",
  TalkId = 120259,
  TalkTriggerId = 120259,
}
r4_0[120260] = {
  StoryLinePath = "Impression/East01/Talk_Gossip/120260.story",
  TalkId = 120260,
  TalkTriggerId = 120260,
}
r4_0[120261] = {
  StoryLinePath = "Impression/East01/Talk_Gossip/120261.story",
  TalkId = 120261,
  TalkTriggerId = 120261,
}
r4_0[120262] = {
  StoryLinePath = "Impression/East01/Talk_Gossip/120262.story",
  TalkId = 120262,
  TalkTriggerId = 120262,
}
r4_0[120263] = {
  StoryLinePath = "Impression/East01/Talk_Gossip/120263.story",
  TalkId = 120263,
  TalkTriggerId = 120263,
}
r4_0[120264] = {
  StoryLinePath = "Impression/East01/Talk_Gossip/120264.story",
  TalkId = 120264,
  TalkTriggerId = 120264,
}
r4_0[120265] = {
  StoryLinePath = "Impression/East01/Talk_Gossip/120265.story",
  TalkId = 120265,
  TalkTriggerId = 120265,
}
r4_0[120266] = {
  StoryLinePath = "Impression/East01/Talk_Gossip/120266.story",
  TalkId = 120266,
  TalkTriggerId = 120266,
}
r4_0[120267] = {
  StoryLinePath = "Impression/East01/Talk_Gossip/120267.story",
  TalkId = 120267,
  TalkTriggerId = 120267,
}
r4_0[120268] = {
  StoryLinePath = "Impression/East01/Talk_Gossip/120268.story",
  TalkId = 120268,
  TalkTriggerId = 120268,
}
r4_0[120269] = {
  StoryLinePath = "Impression/East01/Talk_Gossip/120269.story",
  TalkId = 120269,
  TalkTriggerId = 120269,
}
r4_0[120270] = {
  StoryLinePath = "Impression/East01/Talk_Gossip/120270.story",
  TalkId = 120270,
  TalkTriggerId = 120270,
}
r4_0[120271] = {
  StoryLinePath = "Impression/East01/Talk_Gossip/120271.story",
  TalkId = 120271,
  TalkTriggerId = 120271,
}
r6_0 = {
  StoryLinePath = "TalkGossip/AfterQuest/200102_1_End.story",
  TalkId = 200008,
  TalkTriggerId = 200008,
}
r6_0.TriggerCondition = {
  QuestFinish = {
    QuestId = 20010201,
  },
}
r4_0[200008] = r6_0
r5_0 = 200009
r6_0 = {
  StoryLinePath = "TalkGossip/AfterQuest/200102_2_End.story",
  TalkId = 200009,
  TalkTriggerId = 200009,
}
r6_0.TriggerCondition = {
  And = {
    {
      QuestChainFinish = {
        QuestChainId = 200102,
      },
    },
    {
      QuestUnstart = {
        QuestId = 10020607,
      },
    }
  },
}
r4_0[r5_0] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/200104_1_End.story",
  TalkId = 200010,
  TalkTriggerId = 200010,
}
r6_0.TriggerCondition = {
  QuestChainFinish = {
    QuestChainId = 200104,
  },
}
r4_0[200010] = r6_0
r5_0 = 200011
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/200103_End.story",
  TalkId = 200011,
  TalkTriggerId = 200011,
}
r6_0.TriggerCondition = {
  And = {
    {
      QuestChainFinish = {
        QuestChainId = 200103,
      },
    },
    {
      QuestUnstart = {
        QuestId = 10020302,
      },
    }
  },
}
r4_0[r5_0] = r6_0
r6_0 = {
  StoryLinePath = "BubbleTalk/51105129.story",
  TalkId = 200012,
  TalkTriggerId = 200012,
}
r6_0.TriggerCondition = {
  QuestChainFinish = {
    QuestChainId = 200305,
  },
}
r4_0[200012] = r6_0
r4_0[300100] = {
  StoryLinePath = "BubbleTalk/10030001.story",
  TalkId = 300100,
  TalkTriggerId = 300100,
  TriggerCondition = r0_0.RT_24,
}
r4_0[300101] = {
  StoryLinePath = "BubbleTalk/10030001.story",
  TalkId = 300101,
  TalkTriggerId = 300101,
  TriggerCondition = r0_0.RT_24,
}
r4_0[300102] = {
  StoryLinePath = "BubbleTalk/10030001.story",
  TalkId = 300102,
  TalkTriggerId = 300102,
  TriggerCondition = r0_0.RT_24,
}
r4_0[300103] = {
  StoryLinePath = "BubbleTalk/10030001.story",
  TalkId = 300103,
  TalkTriggerId = 300103,
  TriggerCondition = r0_0.RT_24,
}
r4_0[300104] = {
  StoryLinePath = "BubbleTalk/10030001.story",
  TalkId = 300104,
  TalkTriggerId = 300104,
  TriggerCondition = r0_0.RT_24,
}
r4_0[300105] = {
  StoryLinePath = "BubbleTalk/10030001.story",
  TalkId = 300105,
  TalkTriggerId = 300105,
  TriggerCondition = r0_0.RT_24,
}
r6_0 = {
  StoryLinePath = "BubbleTalk/10030510.story",
  TalkId = 300106,
  TalkTriggerId = 300106,
}
r6_0.TriggerCondition = {
  QuestFinish = {
    QuestId = 10030398,
  },
}
r4_0[300106] = r6_0
r4_0[300107] = {
  StoryLinePath = "BubbleTalk/10030511.story",
  TalkId = 300107,
  TalkTriggerId = 300107,
}
r4_0[300108] = {
  StoryLinePath = "BubbleTalk/10030512.story",
  TalkId = 300108,
  TalkTriggerId = 300108,
}
r4_0[300109] = {
  StoryLinePath = "BubbleTalk/10030001.story",
  TalkId = 300109,
  TalkTriggerId = 300109,
}
r4_0[300110] = {
  StoryLinePath = "BubbleTalk/10030001.story",
  TalkId = 300110,
  TalkTriggerId = 300110,
}
r4_0[300111] = {
  StoryLinePath = "BubbleTalk/10030001.story",
  TalkId = 300111,
  TalkTriggerId = 300111,
}
r4_0[300112] = {
  StoryLinePath = "BubbleTalk/10030001.story",
  TalkId = 300112,
  TalkTriggerId = 300112,
}
r4_0[300113] = {
  StoryLinePath = "BubbleTalk/10030001.story",
  TalkId = 300113,
  TalkTriggerId = 300113,
}
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500001.story",
  TalkId = 500001,
  TalkTriggerId = 500001,
}
r6_0.TriggerCondition = {
  QuestFinish = {
    QuestId = 20021200,
  },
}
r4_0[500001] = r6_0
r4_0[500002] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500002.story",
  TalkId = 500002,
  TalkTriggerId = 500002,
}
r4_0[500003] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500003.story",
  TalkId = 500003,
  TalkTriggerId = 500003,
}
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500004.story",
  TalkId = 500004,
  TalkTriggerId = 500004,
}
r6_0.TriggerCondition = {
  ImprUncomp = {
    TalkTriggerId = 510008,
  },
}
r4_0[500004] = r6_0
r4_0[500005] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500005.story",
  TalkId = 500005,
  TalkTriggerId = 500005,
}
r4_0[500006] = {
  TalkId = 500006,
  TalkTriggerId = 500006,
}
r4_0[500007] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500007.story",
  TalkId = 500007,
  TalkTriggerId = 500007,
}
r4_0[500008] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500008.story",
  TalkId = 500008,
  TalkTriggerId = 500008,
}
r4_0[500009] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500009.story",
  TalkId = 500009,
  TalkTriggerId = 500009,
}
r4_0[500010] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500010.story",
  TalkId = 500010,
  TalkTriggerId = 500010,
}
r4_0[500011] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500011.story",
  TalkId = 500011,
  TalkTriggerId = 500011,
}
r4_0[500012] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500012.story",
  TalkId = 500012,
  TalkTriggerId = 500012,
}
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500013.story",
  TalkId = 500013,
  TalkTriggerId = 500013,
}
r6_0.TriggerCondition = {
  VarEqual = {
    Name = "XiAoStage",
    Value = 0,
  },
}
r4_0[500013] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500014.story",
  TalkId = 500014,
  TalkTriggerId = 500014,
}
r6_0.TriggerCondition = {
  VarEqual = {
    Name = "XiAoStage",
    Value = 1,
  },
}
r4_0[500014] = r6_0
r4_0[500015] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500015.story",
  TalkId = 500015,
  TalkTriggerId = 500015,
}
r4_0[500016] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500016.story",
  TalkId = 500016,
  TalkTriggerId = 500016,
}
r4_0[500017] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500017.story",
  TalkId = 500017,
  TalkTriggerId = 500017,
}
r4_0[500018] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500018.story",
  TalkId = 500018,
  TalkTriggerId = 500018,
  TriggerCondition = r0_0.RT_26,
}
r4_0[500019] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500019.story",
  TalkId = 500019,
  TalkTriggerId = 500019,
}
r4_0[500020] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500020.story",
  TalkId = 500020,
  TalkTriggerId = 500020,
}
r4_0[500021] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500021.story",
  TalkId = 500021,
  TalkTriggerId = 500021,
}
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500022.story",
  TalkId = 500022,
  TalkTriggerId = 500022,
}
r6_0.TriggerCondition = {
  QuestFinish = {
    QuestId = 20020104,
  },
}
r4_0[500022] = r6_0
r4_0[500023] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500023.story",
  TalkId = 500023,
  TalkTriggerId = 500023,
}
r4_0[500024] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500024.story",
  TalkId = 500024,
  TalkTriggerId = 500024,
}
r4_0[500025] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500025.story",
  TalkId = 500025,
  TalkTriggerId = 500025,
}
r4_0[500026] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500026.story",
  TalkId = 500026,
  TalkTriggerId = 500026,
}
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500027.story",
  TalkId = 500027,
  TalkTriggerId = 500027,
}
r6_0.TriggerCondition = {
  VarEqual = {
    Name = "DaDunStage",
    Value = 0,
  },
}
r4_0[500027] = r6_0
r4_0[500028] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500028.story",
  TalkId = 500028,
  TalkTriggerId = 500028,
  TriggerCondition = {
    ImprUncomp = r0_0.RT_27,
  },
}
r4_0[500029] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500029.story",
  TalkId = 500029,
  TalkTriggerId = 500029,
}
r4_0[500030] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500030.story",
  TalkId = 500030,
  TalkTriggerId = 500030,
}
r4_0[500031] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500031.story",
  TalkId = 500031,
  TalkTriggerId = 500031,
}
r4_0[500032] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500032.story",
  TalkId = 500032,
  TalkTriggerId = 500032,
}
r4_0[500033] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500033.story",
  TalkId = 500033,
  TalkTriggerId = 500033,
}
r4_0[500034] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500034.story",
  TalkId = 500034,
  TalkTriggerId = 500034,
}
r4_0[500035] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500035.story",
  TalkId = 500035,
  TalkTriggerId = 500035,
}
r4_0[500036] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500036.story",
  TalkId = 500036,
  TalkTriggerId = 500036,
}
r4_0[500037] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500037.story",
  TalkId = 500037,
  TalkTriggerId = 500037,
  TriggerCondition = r0_0.RT_26,
}
r4_0[500038] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500038.story",
  TalkId = 500038,
  TalkTriggerId = 500038,
}
r4_0[500039] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500039.story",
  TalkId = 500039,
  TalkTriggerId = 500039,
}
r4_0[500040] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500040.story",
  TalkId = 500040,
  TalkTriggerId = 500040,
}
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500041.story",
  TalkId = 500041,
  TalkTriggerId = 500041,
}
r6_0.TriggerCondition = {
  ImprUncomp = {
    TalkTriggerId = 510018,
  },
}
r4_0[500041] = r6_0
r4_0[500042] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500042.story",
  TalkId = 500042,
  TalkTriggerId = 500042,
}
r4_0[500043] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500043.story",
  TalkId = 500043,
  TalkTriggerId = 500043,
  TriggerCondition = r0_0.RT_29,
}
r4_0[500044] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500044.story",
  TalkId = 500044,
  TalkTriggerId = 500044,
}
r4_0[500045] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500045.story",
  TalkId = 500045,
  TalkTriggerId = 500045,
}
r4_0[500046] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500046.story",
  TalkId = 500046,
  TalkTriggerId = 500046,
}
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500047.story",
  TalkId = 500047,
  TalkTriggerId = 500047,
}
r6_0.TriggerCondition = {
  ImprUncomp = {
    TalkTriggerId = 510020,
  },
}
r4_0[500047] = r6_0
r4_0[500048] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500048.story",
  TalkId = 500048,
  TalkTriggerId = 500048,
  TriggerCondition = {
    ImprComp = r0_0.RT_30,
  },
}
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500049.story",
  TalkId = 500049,
  TalkTriggerId = 500049,
}
r6_0.TriggerCondition = {
  ImprUncomp = {
    TalkTriggerId = 510053,
  },
}
r4_0[500049] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500050.story",
  TalkId = 500050,
  TalkTriggerId = 500050,
}
r6_0.TriggerCondition = {
  ImprUncomp = {
    TalkTriggerId = 510042,
  },
}
r4_0[500050] = r6_0
r4_0[500051] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500051.story",
  TalkId = 500051,
  TalkTriggerId = 500051,
  TriggerCondition = r0_0.RT_32,
}
r4_0[500052] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500052.story",
  TalkId = 500052,
  TalkTriggerId = 500052,
}
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500053.story",
  TalkId = 500053,
  TalkTriggerId = 500053,
}
r6_0.TriggerCondition = {
  ImprUncomp = {
    TalkTriggerId = 510070,
  },
}
r4_0[500053] = r6_0
r4_0[500054] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500054.story",
  TalkId = 500054,
  TalkTriggerId = 500054,
}
r4_0[500055] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500055.story",
  TalkId = 500055,
  TalkTriggerId = 500055,
}
r4_0[500056] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500056.story",
  TalkId = 500056,
  TalkTriggerId = 500056,
}
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500057.story",
  TalkId = 500057,
  TalkTriggerId = 500057,
}
r6_0.TriggerCondition = {
  VarEqual = {
    Name = "XiAoStage",
    Value = 2,
  },
}
r4_0[500057] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500058.story",
  TalkId = 500058,
  TalkTriggerId = 500058,
}
r6_0.TriggerCondition = {
  VarEqual = {
    Name = "DaDunStage",
    Value = 1,
  },
}
r4_0[500058] = r6_0
r4_0[500059] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/500059.story",
  TalkId = 500059,
  TalkTriggerId = 500059,
}
r4_0[500080] = {
  StoryLinePath = "Impression/IceLakeCity/500080_Hesite.story",
  TalkId = 500080,
  TalkTriggerId = 500080,
  Type = "Impression",
}
r4_0[501036] = {
  StoryLinePath = "Impression/East01/Gossip/501036.story",
  TalkId = 501036,
  TalkTriggerId = 501036,
}
r4_0[501037] = {
  StoryLinePath = "Impression/East01/Gossip/501037.story",
  TalkId = 501037,
  TalkTriggerId = 501037,
}
r4_0[501038] = {
  StoryLinePath = "Impression/East01/Gossip/501038.story",
  TalkId = 501038,
  TalkTriggerId = 501038,
}
r4_0[501039] = {
  StoryLinePath = "Impression/East01/Gossip/501039.story",
  TalkId = 501039,
  TalkTriggerId = 501039,
}
r4_0[501040] = {
  StoryLinePath = "Impression/East01/Gossip/501040.story",
  TalkId = 501040,
  TalkTriggerId = 501040,
}
r4_0[501041] = {
  StoryLinePath = "Impression/East01/Gossip/501041.story",
  TalkId = 501041,
  TalkTriggerId = 501041,
}
r4_0[501042] = {
  StoryLinePath = "Impression/East01/Gossip/501042.story",
  TalkId = 501042,
  TalkTriggerId = 501042,
}
r4_0[501043] = {
  StoryLinePath = "Impression/East01/Gossip/501043.story",
  TalkId = 501043,
  TalkTriggerId = 501043,
}
r4_0[501044] = {
  StoryLinePath = "Impression/East01/Gossip/501044.story",
  TalkId = 501044,
  TalkTriggerId = 501044,
}
r4_0[501045] = {
  StoryLinePath = "Impression/East01/Gossip/501045.story",
  TalkId = 501045,
  TalkTriggerId = 501045,
}
r4_0[501046] = {
  StoryLinePath = "Impression/East01/Gossip/501046.story",
  TalkId = 501046,
  TalkTriggerId = 501046,
}
r4_0[501047] = {
  StoryLinePath = "Impression/East01/Gossip/501047.story",
  TalkId = 501047,
  TalkTriggerId = 501047,
}
r4_0[501048] = {
  StoryLinePath = "Impression/East01/Gossip/501048.story",
  TalkId = 501048,
  TalkTriggerId = 501048,
}
r4_0[501049] = {
  StoryLinePath = "Impression/East01/Gossip/501049.story",
  TalkId = 501049,
  TalkTriggerId = 501049,
}
r4_0[501050] = {
  StoryLinePath = "Impression/East01/Gossip/501050.story",
  TalkId = 501050,
  TalkTriggerId = 501050,
}
r4_0[501051] = {
  StoryLinePath = "Impression/East01/Gossip/501051.story",
  TalkId = 501051,
  TalkTriggerId = 501051,
}
r4_0[501052] = {
  StoryLinePath = "Impression/East01/Gossip/501052.story",
  TalkId = 501052,
  TalkTriggerId = 501052,
}
r4_0[501053] = {
  StoryLinePath = "Impression/East01/Gossip/501053.story",
  TalkId = 501053,
  TalkTriggerId = 501053,
}
r4_0[501054] = {
  StoryLinePath = "Impression/East01/Gossip/501054.story",
  TalkId = 501054,
  TalkTriggerId = 501054,
}
r4_0[501055] = {
  StoryLinePath = "Impression/East01/Gossip/501055.story",
  TalkId = 501055,
  TalkTriggerId = 501055,
}
r4_0[501056] = {
  StoryLinePath = "Impression/East01/Gossip/501056.story",
  TalkId = 501056,
  TalkTriggerId = 501056,
}
r4_0[501057] = {
  StoryLinePath = "Impression/East01/Gossip/501057.story",
  TalkId = 501057,
  TalkTriggerId = 501057,
}
r4_0[501058] = {
  StoryLinePath = "Impression/East01/Gossip/501058.story",
  TalkId = 501058,
  TalkTriggerId = 501058,
}
r4_0[501059] = {
  StoryLinePath = "Impression/East01/Gossip/501059.story",
  TalkId = 501059,
  TalkTriggerId = 501059,
}
r4_0[501060] = {
  StoryLinePath = "Impression/East01/Gossip/501060.story",
  TalkId = 501060,
  TalkTriggerId = 501060,
}
r4_0[501061] = {
  StoryLinePath = "Impression/East01/Gossip/501061.story",
  TalkId = 501061,
  TalkTriggerId = 501061,
}
r4_0[501062] = {
  StoryLinePath = "Impression/East01/Gossip/501062.story",
  TalkId = 501062,
  TalkTriggerId = 501062,
}
r4_0[501063] = {
  StoryLinePath = "Impression/East01/Gossip/501063.story",
  TalkId = 501063,
  TalkTriggerId = 501063,
}
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510002_XilinFuren.story",
  TalkId = 510002,
  TalkTriggerId = 510002,
}
r6_0.TriggerCondition = {
  QuestChainStart = {
    QuestChainId = 200201,
  },
}
r6_0.Type = "Impression"
r4_0[510002] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510005_Aiersha_2.story",
  TalkId = 510005,
  TalkTriggerId = 510005,
}
r6_0.TriggerCondition = {
  QuestFinish = {
    QuestId = 20020306,
  },
}
r6_0.Type = "Impression"
r4_0[510005] = r6_0
r6_0 = {
  RewardId = 4000003,
  StoryLinePath = "Impression/IceLakeCity/510007_Alice_1.story",
  TalkId = 510007,
  TalkTriggerId = 510007,
}
r6_0.TriggerCondition = {
  QuestFinish = {
    QuestId = 20020313,
  },
}
r6_0.Type = "Impression"
r4_0[510007] = r6_0
r6_0 = {
  TalkId = 510009,
  TalkTriggerId = 510009,
}
r6_0.TriggerCondition = {
  QuestChainFinish = {
    QuestChainId = 100201,
  },
}
r6_0.Type = "Impression"
r4_0[510009] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510010_Jiexika.story",
  TalkId = 510010,
  TalkTriggerId = 510010,
}
r6_0.TriggerCondition = {
  QuestFinish = {
    QuestId = 20020202,
  },
}
r6_0.Type = "Impression"
r4_0[510010] = r6_0
r6_0 = {
  RewardId = 4000002,
  StoryLinePath = "Impression/IceLakeCity/510011_Alice_Mading_1.story",
  TalkId = 510011,
  TalkTriggerId = 510011,
}
r6_0.TriggerCondition = {
  QuestStart = {
    QuestId = 20020305,
  },
}
r6_0.Type = "Impression"
r4_0[510011] = r6_0
r4_0[510012] = {
  StoryLinePath = "Impression/IceLakeCity/510012_Kenong.story",
  TalkId = 510012,
  TalkTriggerId = 510012,
  Type = "Impression",
}
r4_0[510014] = {
  StoryLinePath = "Impression/IceLakeCity/510014_Sangni.story",
  TalkId = 510014,
  TalkTriggerId = 510014,
  Type = "Impression",
}
r4_0[510015] = {
  TalkId = 510015,
  TalkTriggerId = 510015,
  Type = "Impression",
}
r4_0[510016] = {
  StoryLinePath = "Impression/IceLakeCity/510016_Yagebu.story",
  TalkId = 510016,
  TalkTriggerId = 510016,
  Type = "Impression",
}
r4_0[510017] = {
  StoryLinePath = "Impression/IceLakeCity/510017_Dadun.story",
  TalkId = 510017,
  TalkTriggerId = 510017,
  Type = "Impression",
}
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510019_Wells_Quarrel.story",
  TalkId = 5100182,
  TalkTriggerId = 510019,
}
r6_0.TriggerCondition = {
  QuestFinish = {
    QuestId = 20020403,
  },
}
r6_0.Type = "Impression"
r4_0[510019] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510022_Blue_2.story",
  TalkId = 5100192,
  TalkTriggerId = 510022,
}
r6_0.TriggerCondition = {
  QuestFinish = {
    QuestId = 20020510,
  },
}
r6_0.Type = "Impression"
r4_0[510022] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510026_Kaiwen_1.story",
  TalkId = 510026,
  TalkTriggerId = 510026,
}
r6_0.TriggerCondition = {
  QuestStart = {
    QuestId = 20021202,
  },
}
r6_0.Type = "Impression"
r4_0[510026] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510029_Kami_1.story",
  TalkId = 510029,
  TalkTriggerId = 510029,
}
r6_0.TriggerCondition = {
  QuestStart = {
    QuestId = 20020600,
  },
}
r6_0.Type = "Impression"
r4_0[510029] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510030_Bake_1.story",
  TalkId = 510030,
  TalkTriggerId = 510030,
}
r6_0.TriggerCondition = {
  QuestChainStart = {
    QuestChainId = 200206,
  },
}
r6_0.Type = "Impression"
r4_0[510030] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510033_Anuo_1.story",
  TalkId = 510033,
  TalkTriggerId = 510033,
}
r6_0.TriggerCondition = {
  QuestFinish = {
    QuestId = 20020606,
  },
}
r6_0.Type = "Impression"
r4_0[510033] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510035_Aima_1.story",
  TalkId = 510035,
  TalkTriggerId = 510035,
}
r6_0.TriggerCondition = {
  QuestChainStart = {
    QuestChainId = 200207,
  },
}
r6_0.Type = "Impression"
r4_0[510035] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510036_Beilinda_1.story",
  TalkId = 510036,
  TalkTriggerId = 510036,
}
r6_0.TriggerCondition = {
  QuestFinish = {
    QuestId = 20020703,
  },
}
r6_0.Type = "Impression"
r4_0[510036] = r6_0
r6_0 = {
  RewardId = 4000004,
  StoryLinePath = "Impression/IceLakeCity/510037_Beilinda_2.story",
  TalkId = 510037,
  TalkTriggerId = 510037,
}
r6_0.TriggerCondition = {
  QuestFinish = {
    QuestId = 20020705,
  },
}
r6_0.Type = "Impression"
r4_0[510037] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510039_Faye_2.story",
  TalkId = 510039,
  TalkTriggerId = 510039,
}
r6_0.TriggerCondition = {
  QuestFinish = {
    QuestId = 20021101,
  },
}
r6_0.Type = "Impression"
r4_0[510039] = r6_0
r6_0 = {
  RewardId = 4000006,
  StoryLinePath = "Impression/IceLakeCity/510041_Faye_3.story",
  TalkId = 510041,
  TalkTriggerId = 510041,
}
r6_0.TriggerCondition = {
  QuestFinish = {
    QuestId = 20021104,
  },
}
r6_0.Type = "Impression"
r4_0[510041] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510042_Heerluo.story",
  TalkId = 510042,
  TalkTriggerId = 510042,
}
r6_0.TriggerCondition = {
  QuestFinish = {
    QuestId = 20021007,
  },
}
r6_0.Type = "Impression"
r4_0[510042] = r6_0
r5_0 = 510050
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510050_Laina.story",
  TalkId = 510050,
  TalkTriggerId = 510050,
}
r6_0.TriggerCondition = {
  And = {
    r0_0.RT_29,
    r0_0.RT_43
  },
}
r6_0.Type = "Impression"
r4_0[r5_0] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510058_dean.story",
  TalkId = 510058,
  TalkTriggerId = 510058,
}
r6_0.TriggerCondition = {
  QuestChainFinish = {
    QuestChainId = 100202,
  },
}
r6_0.Type = "Impression"
r4_0[510058] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510070_Liande.story",
  TalkId = 510070,
  TalkTriggerId = 510070,
}
r6_0.TriggerCondition = {
  QuestFinish = {
    QuestId = 20021901,
  },
}
r6_0.Type = "Impression"
r4_0[510070] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510075_Xueli1.story",
  TalkId = 510075,
  TalkTriggerId = 510075,
}
r6_0.TriggerCondition = {
  QuestFinish = {
    QuestId = 20022105,
  },
}
r6_0.Type = "Impression"
r4_0[510075] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510076_Xueli2.story",
  TalkId = 510076,
  TalkTriggerId = 510076,
}
r6_0.TriggerCondition = {
  QuestFinish = {
    QuestId = 20022102,
  },
}
r6_0.Type = "Impression"
r4_0[510076] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510079_Dadun_EndTalk.story",
  TalkId = 510080,
  TalkTriggerId = 510080,
}
r6_0.TriggerCondition = {
  QuestChainFinish = {
    QuestChainId = 200222,
  },
}
r4_0[510080] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510096_Lars.story",
  TalkId = 510096,
  TalkTriggerId = 510096,
}
r6_0.TriggerCondition = {
  QuestStart = {
    QuestId = 20023100,
  },
}
r4_0[510096] = r6_0
r4_0[510102] = {
  StoryLinePath = "Impression/IceLakeCity/510102_Liliko_1.story",
  TalkId = 510102,
  TalkTriggerId = 510102,
  Type = "Impression",
}
r5_0 = 510103
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510103_Liliko_2.story",
  TalkId = 510103,
  TalkTriggerId = 510103,
}
r6_0.TriggerCondition = {
  And = {
    r0_0.RT_45,
    r0_0.RT_29
  },
}
r6_0.Type = "Impression"
r4_0[r5_0] = r6_0
r5_0 = 510104
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510104_Liliko_3.story",
  TalkId = 510104,
  TalkTriggerId = 510104,
}
r6_0.TriggerCondition = {
  And = {
    r0_0.RT_47,
    r0_0.RT_49
  },
}
r6_0.Type = "Impression"
r4_0[r5_0] = r6_0
r4_0[510105] = {
  StoryLinePath = "Impression/IceLakeCity/510105_Kaiwen.story",
  TalkId = 510105,
  TalkTriggerId = 510105,
  Type = "Impression",
}
r4_0[510106] = {
  StoryLinePath = "Impression/IceLakeCity/510106_Jimu.story",
  TalkId = 510106,
  TalkTriggerId = 510106,
  Type = "Impression",
}
r4_0[510107] = {
  StoryLinePath = "Impression/IceLakeCity/510107_Beiguanjiaojiao.story",
  TalkId = 510107,
  TalkTriggerId = 510107,
  Type = "Impression",
}
r4_0[510108] = {
  StoryLinePath = "Impression/IceLakeCity/510108_Daixi.story",
  TalkId = 510108,
  TalkTriggerId = 510108,
  Type = "Impression",
}
r4_0[510109] = {
  StoryLinePath = "Impression/IceLakeCity/510109_Walun.story",
  TalkId = 510109,
  TalkTriggerId = 510109,
  Type = "Impression",
}
r4_0[510110] = {
  StoryLinePath = "Impression/IceLakeCity/510110_Halan.story",
  TalkId = 510110,
  TalkTriggerId = 510110,
  Type = "Impression",
}
r4_0[510111] = {
  StoryLinePath = "Impression/IceLakeCity/510111_Kongkongjiaojiao.story",
  TalkId = 510111,
  TalkTriggerId = 510111,
  Type = "Impression",
}
r4_0[510112] = {
  StoryLinePath = "Impression/IceLakeCity/510112_Ailisha.story",
  TalkId = 510112,
  TalkTriggerId = 510112,
  TriggerCondition = r0_0.RT_53,
  Type = "Impression",
}
r4_0[510113] = {
  StoryLinePath = "Impression/IceLakeCity/510113_Miya.story",
  TalkId = 510113,
  TalkTriggerId = 510113,
  TriggerCondition = r0_0.RT_53,
  Type = "Impression",
}
r4_0[510114] = {
  StoryLinePath = "Impression/IceLakeCity/510114_Yinyudeshaonian.story",
  TalkId = 510114,
  TalkTriggerId = 510114,
  TriggerCondition = r0_0.RT_53,
  Type = "Impression",
}
r4_0[510115] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/510115.story",
  TalkId = 510115,
  TalkTriggerId = 510115,
}
r4_0[510116] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/510116.story",
  TalkId = 510116,
  TalkTriggerId = 510116,
}
r4_0[510117] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/510117.story",
  TalkId = 510117,
  TalkTriggerId = 510117,
}
r4_0[510118] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/510118.story",
  TalkId = 510118,
  TalkTriggerId = 510118,
}
r4_0[510119] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/510119.story",
  TalkId = 510119,
  TalkTriggerId = 510119,
}
r4_0[510120] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/510120.story",
  TalkId = 510120,
  TalkTriggerId = 510120,
}
r4_0[510122] = {
  StoryLinePath = "Impression/IceLakeCity/510122_Cat.story",
  TalkId = 510122,
  TalkTriggerId = 510122,
  Type = "Impression",
}
r4_0[510123] = {
  StoryLinePath = "Impression/East01/701005_LinghuNing",
  TalkId = 510123,
  TalkTriggerId = 510123,
  Type = "Impression",
}
r4_0[510124] = {
  StoryLinePath = "Impression/East01/701006_DuPing",
  TalkId = 510124,
  TalkTriggerId = 510124,
  Type = "Impression",
}
r4_0[510125] = {
  StoryLinePath = "Impression/East01/701007_YiSheng",
  TalkId = 510125,
  TalkTriggerId = 510125,
  Type = "Impression",
}
r4_0[510126] = {
  StoryLinePath = "Impression/East01/701008_LaMeng",
  TalkId = 510126,
  TalkTriggerId = 510126,
  Type = "Impression",
}
r4_0[510127] = {
  StoryLinePath = "Impression/East01/701009_MrCheng",
  TalkId = 510127,
  TalkTriggerId = 510127,
  Type = "Impression",
}
r4_0[510128] = {
  StoryLinePath = "Impression/East01/701011_JiangZhengyi",
  TalkId = 510128,
  TalkTriggerId = 510128,
  Type = "Impression",
}
r4_0[510129] = {
  StoryLinePath = "Impression/East01/701012_SaMi",
  TalkId = 510129,
  TalkTriggerId = 510129,
  Type = "Impression",
}
r4_0[510130] = {
  StoryLinePath = "Impression/East01/701013_LiShi",
  TalkId = 510130,
  TalkTriggerId = 510130,
  Type = "Impression",
}
r4_0[510131] = {
  StoryLinePath = "Impression/East01/701014_WuYe",
  TalkId = 510131,
  TalkTriggerId = 510131,
  Type = "Impression",
}
r4_0[510132] = {
  StoryLinePath = "Impression/East01/701015_Yang",
  TalkId = 510132,
  TalkTriggerId = 510132,
  Type = "Impression",
}
r4_0[510133] = {
  StoryLinePath = "Impression/East01/701019_XiaoYun",
  TalkId = 510133,
  TalkTriggerId = 510133,
  Type = "Impression",
}
r4_0[510134] = {
  StoryLinePath = "Impression/East01/701020_JuMu",
  TalkId = 510134,
  TalkTriggerId = 510134,
  Type = "Impression",
}
r4_0[510135] = {
  StoryLinePath = "Impression/East01/701021_LanYe",
  TalkId = 510135,
  TalkTriggerId = 510135,
  Type = "Impression",
}
r4_0[510136] = {
  StoryLinePath = "Impression/East01/701024_QingQing",
  TalkId = 510136,
  TalkTriggerId = 510136,
  Type = "Impression",
}
r4_0[510137] = {
  StoryLinePath = "Impression/East01/701026_QuanDoutong",
  TalkId = 510137,
  TalkTriggerId = 510137,
  Type = "Impression",
}
r4_0[510138] = {
  StoryLinePath = "Impression/East01/701027_DrHuang",
  TalkId = 510138,
  TalkTriggerId = 510138,
  Type = "Impression",
}
r4_0[510139] = {
  StoryLinePath = "Impression/East01/701029_YuXia",
  TalkId = 510139,
  TalkTriggerId = 510139,
  Type = "Impression",
}
r4_0[510140] = {
  StoryLinePath = "Impression/East01/701031_JiuPiaoZi",
  TalkId = 510140,
  TalkTriggerId = 510140,
  Type = "Impression",
}
r4_0[510141] = {
  StoryLinePath = "Impression/East01/701032_FengDeng",
  TalkId = 510141,
  TalkTriggerId = 510141,
  Type = "Impression",
}
r4_0[510142] = {
  StoryLinePath = "Impression/East01/701033_MysteryWhite",
  TalkId = 510142,
  TalkTriggerId = 510142,
  Type = "Impression",
}
r6_0 = {
  StoryLinePath = "Impression/East01/701006_DuPing_2",
  TalkId = 510143,
  TalkTriggerId = 510143,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 510124,
  },
}
r4_0[510143] = r6_0
r6_0 = {
  StoryLinePath = "Impression/East01/701008_LaMeng_2",
  TalkId = 510144,
  TalkTriggerId = 510144,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 510126,
  },
}
r4_0[510144] = r6_0
r6_0 = {
  StoryLinePath = "Impression/East01/701009_MrCheng_2",
  TalkId = 510145,
  TalkTriggerId = 510145,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 510127,
  },
}
r4_0[510145] = r6_0
r6_0 = {
  StoryLinePath = "Impression/East01/701011_JiangZhengyi_2",
  TalkId = 510146,
  TalkTriggerId = 510146,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 510128,
  },
}
r4_0[510146] = r6_0
r6_0 = {
  StoryLinePath = "Impression/East01/701012_SaMi_2",
  TalkId = 510147,
  TalkTriggerId = 510147,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 510129,
  },
}
r4_0[510147] = r6_0
r6_0 = {
  StoryLinePath = "Impression/East01/701013_LiShi_2",
  TalkId = 510148,
  TalkTriggerId = 510148,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 510130,
  },
}
r4_0[510148] = r6_0
r6_0 = {
  StoryLinePath = "Impression/East01/701015_Yang_2",
  TalkId = 510149,
  TalkTriggerId = 510149,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 51013201,
  },
}
r4_0[510149] = r6_0
r6_0 = {
  StoryLinePath = "Impression/East01/701019_XiaoYun_2",
  TalkId = 510150,
  TalkTriggerId = 510150,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 510133,
  },
}
r4_0[510150] = r6_0
r6_0 = {
  StoryLinePath = "Impression/East01/701020_JuMu_2",
  TalkId = 510151,
  TalkTriggerId = 510151,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 510134,
  },
}
r4_0[510151] = r6_0
r4_0[511010] = {
  StoryLinePath = "BubbleTalk/51101001.story",
  TalkId = 511010,
  TalkTriggerId = 511010,
}
r4_0[511252] = {
  StoryLinePath = "Impression/East01/Gossip/511252.story",
  TalkId = 511252,
  TalkTriggerId = 511252,
}
r4_0[511253] = {
  StoryLinePath = "Impression/East01/Gossip/511253.story",
  TalkId = 511253,
  TalkTriggerId = 511253,
}
r4_0[511254] = {
  StoryLinePath = "Impression/East01/Gossip/511254.story",
  TalkId = 511254,
  TalkTriggerId = 511254,
}
r4_0[511255] = {
  StoryLinePath = "Impression/East01/Gossip/511255.story",
  TalkId = 511255,
  TalkTriggerId = 511255,
  Type = "Impression",
}
r4_0[511256] = {
  StoryLinePath = "Impression/East01/Gossip/511256.story",
  TalkId = 511256,
  TalkTriggerId = 511256,
  Type = "Impression",
}
r4_0[511257] = {
  StoryLinePath = "Impression/East01/Gossip/511257.story",
  TalkId = 511257,
  TalkTriggerId = 511257,
}
r4_0[511258] = {
  StoryLinePath = "Impression/East01/Gossip/511258.story",
  TalkId = 511258,
  TalkTriggerId = 511258,
  Type = "Impression",
}
r4_0[511259] = {
  StoryLinePath = "Impression/East01/Gossip/511259.story",
  TalkId = 511259,
  TalkTriggerId = 511259,
}
r4_0[511260] = {
  StoryLinePath = "Impression/East01/Gossip/511260.story",
  TalkId = 511260,
  TalkTriggerId = 511260,
  Type = "Impression",
}
r4_0[511261] = {
  StoryLinePath = "Impression/East01/Gossip/511261.story",
  TalkId = 511261,
  TalkTriggerId = 511261,
}
r4_0[511262] = {
  StoryLinePath = "Impression/East01/Gossip/511262.story",
  TalkId = 511262,
  TalkTriggerId = 511262,
}
r4_0[511263] = {
  StoryLinePath = "Impression/East01/Gossip/511263.story",
  TalkId = 511263,
  TalkTriggerId = 511263,
}
r4_0[511264] = {
  StoryLinePath = "Impression/East01/Gossip/511264.story",
  TalkId = 511264,
  TalkTriggerId = 511264,
}
r4_0[511265] = {
  StoryLinePath = "Impression/East01/Gossip/511265.story",
  TalkId = 511265,
  TalkTriggerId = 511265,
}
r4_0[511266] = {
  StoryLinePath = "Impression/East01/Gossip/511266.story",
  TalkId = 511266,
  TalkTriggerId = 511266,
}
r4_0[511267] = {
  StoryLinePath = "Impression/East01/Gossip/511267.story",
  TalkId = 511267,
  TalkTriggerId = 511267,
}
r4_0[511268] = {
  StoryLinePath = "Impression/East01/Gossip/511268.story",
  TalkId = 511268,
  TalkTriggerId = 511268,
}
r4_0[511269] = {
  StoryLinePath = "Impression/East01/Gossip/511269.story",
  TalkId = 511269,
  TalkTriggerId = 511269,
}
r4_0[511270] = {
  StoryLinePath = "Impression/East01/Gossip/511270.story",
  TalkId = 511270,
  TalkTriggerId = 511270,
}
r4_0[511271] = {
  StoryLinePath = "Impression/East01/Gossip/511271.story",
  TalkId = 511271,
  TalkTriggerId = 511271,
  Type = "Impression",
}
r4_0[511272] = {
  StoryLinePath = "Impression/East01/Gossip/511272.story",
  TalkId = 511272,
  TalkTriggerId = 511272,
}
r4_0[511273] = {
  StoryLinePath = "Impression/East01/Gossip/511273.story",
  TalkId = 511273,
  TalkTriggerId = 511273,
  Type = "Impression",
}
r4_0[511274] = {
  StoryLinePath = "Impression/East01/Gossip/511274.story",
  TalkId = 511274,
  TalkTriggerId = 511274,
}
r4_0[511275] = {
  StoryLinePath = "Impression/East01/Gossip/511275.story",
  TalkId = 511275,
  TalkTriggerId = 511275,
  Type = "Impression",
}
r4_0[511276] = {
  StoryLinePath = "Impression/East01/Gossip/511276.story",
  TalkId = 511276,
  TalkTriggerId = 511276,
}
r4_0[511277] = {
  StoryLinePath = "Impression/East01/Gossip/511277.story",
  TalkId = 511277,
  TalkTriggerId = 511277,
}
r4_0[511278] = {
  StoryLinePath = "Impression/East01/Gossip/511278.story",
  TalkId = 511278,
  TalkTriggerId = 511278,
}
r4_0[511279] = {
  StoryLinePath = "Impression/East01/Gossip/511279.story",
  TalkId = 511279,
  TalkTriggerId = 511279,
  Type = "Impression",
}
r4_0[511280] = {
  StoryLinePath = "Impression/East01/Gossip/511280.story",
  TalkId = 511280,
  TalkTriggerId = 511280,
  Type = "Impression",
}
r4_0[511282] = {
  StoryLinePath = "Impression/East01/Gossip/511282.story",
  TalkId = 511282,
  TalkTriggerId = 511282,
  Type = "Impression",
}
r6_0 = {
  StoryLinePath = "Impression/East01/Gossip/511512_BaiJL.story",
  TalkId = 511512,
  TalkTriggerId = 511512,
}
r6_0.TriggerCondition = {
  QuestFinish = {
    QuestId = 12010203,
  },
}
r4_0[511512] = r6_0
r4_0[511514] = {
  StoryLinePath = "Impression/East01/Gossip/511514_BaiDD.story",
  TalkId = 511514,
  TalkTriggerId = 511514,
}
r4_0[600101] = {
  DialogueId = 60010101,
  TalkTriggerId = 600101,
  TalkType = "Guide",
}
r4_0[600102] = {
  DialogueId = 60010201,
  TalkTriggerId = 600102,
  TalkType = "Guide",
}
r4_0[600103] = {
  DialogueId = 60010301,
  TalkTriggerId = 600103,
  TalkType = "Guide",
}
r4_0[600104] = {
  DialogueId = 60010401,
  TalkTriggerId = 600104,
  TalkType = "Guide",
}
r4_0[600105] = {
  DialogueId = 60010501,
  TalkTriggerId = 600105,
  TalkType = "Guide",
}
r4_0[600106] = {
  DialogueId = 60010601,
  TalkTriggerId = 600106,
  TalkType = "Guide",
}
r4_0[600107] = {
  DialogueId = 60010701,
  TalkTriggerId = 600107,
  TalkType = "Guide",
}
r4_0[600201] = {
  DialogueId = 60020101,
  TalkTriggerId = 600201,
  TalkType = "Guide",
}
r4_0[600202] = {
  DialogueId = 60020201,
  TalkTriggerId = 600202,
  TalkType = "Guide",
}
r4_0[600203] = {
  DialogueId = 60020301,
  TalkTriggerId = 600203,
  TalkType = "Guide",
}
r4_0[600204] = {
  DialogueId = 60020401,
  TalkTriggerId = 600204,
  TalkType = "Guide",
}
r4_0[600205] = {
  DialogueId = 60020501,
  TalkTriggerId = 600205,
  TalkType = "Guide",
}
r4_0[600206] = {
  DialogueId = 60020601,
  TalkTriggerId = 600206,
  TalkType = "Guide",
}
r4_0[600207] = {
  DialogueId = 60020701,
  TalkTriggerId = 600207,
  TalkType = "Guide",
}
r4_0[600208] = {
  DialogueId = 60020801,
  TalkTriggerId = 600208,
  TalkType = "Guide",
}
r4_0[600209] = {
  DialogueId = 60020901,
  TalkTriggerId = 600209,
  TalkType = "Guide",
}
r4_0[600301] = {
  DialogueId = 60030101,
  TalkTriggerId = 600301,
  TalkType = "Guide",
}
r4_0[600302] = {
  DialogueId = 60030201,
  TalkTriggerId = 600302,
  TalkType = "Guide",
}
r4_0[600303] = {
  DialogueId = 60030301,
  TalkTriggerId = 600303,
  TalkType = "Guide",
}
r4_0[600304] = {
  DialogueId = 60030401,
  TalkTriggerId = 600304,
  TalkType = "Guide",
}
r4_0[600305] = {
  DialogueId = 60030501,
  TalkTriggerId = 600305,
  TalkType = "Guide",
}
r4_0[600306] = {
  DialogueId = 60030601,
  TalkTriggerId = 600306,
  TalkType = "Guide",
}
r4_0[600307] = {
  DialogueId = 60030701,
  TalkTriggerId = 600307,
  TalkType = "Guide",
}
r4_0[600308] = {
  DialogueId = 60030801,
  TalkTriggerId = 600308,
  TalkType = "Guide",
}
r4_0[600309] = {
  DialogueId = 60030901,
  TalkTriggerId = 600309,
  TalkType = "Guide",
}
r4_0[600310] = {
  DialogueId = 60031001,
  TalkTriggerId = 600310,
  TalkType = "Guide",
}
r4_0[600311] = {
  DialogueId = 60031101,
  TalkTriggerId = 600311,
  TalkType = "Guide",
}
r4_0[600312] = {
  DialogueId = 60031201,
  TalkTriggerId = 600312,
  TalkType = "Guide",
}
r4_0[600401] = {
  DialogueId = 60040101,
  TalkTriggerId = 600401,
  TalkType = "Guide",
}
r4_0[600402] = {
  DialogueId = 60040201,
  TalkTriggerId = 600402,
  TalkType = "Guide",
}
r4_0[600403] = {
  DialogueId = 60040301,
  TalkTriggerId = 600403,
  TalkType = "Guide",
}
r4_0[600404] = {
  DialogueId = 60040401,
  TalkTriggerId = 600404,
  TalkType = "Guide",
}
r4_0[600405] = {
  DialogueId = 60040501,
  TalkTriggerId = 600405,
  TalkType = "Guide",
}
r4_0[600406] = {
  DialogueId = 60040601,
  TalkTriggerId = 600406,
  TalkType = "Guide",
}
r4_0[600407] = {
  DialogueId = 60040701,
  TalkTriggerId = 600407,
  TalkType = "Guide",
}
r4_0[600408] = {
  DialogueId = 60040801,
  TalkTriggerId = 600408,
  TalkType = "Guide",
}
r4_0[600501] = {
  DialogueId = 60050101,
  TalkTriggerId = 600501,
  TalkType = "Guide",
}
r4_0[600502] = {
  DialogueId = 60050201,
  TalkTriggerId = 600502,
  TalkType = "Guide",
}
r4_0[600601] = {
  DialogueId = 60060101,
  TalkTriggerId = 600601,
  TalkType = "Guide",
}
r4_0[600602] = {
  DialogueId = 60060201,
  TalkTriggerId = 600602,
  TalkType = "Guide",
}
r4_0[600603] = {
  DialogueId = 60060301,
  TalkTriggerId = 600603,
  TalkType = "Guide",
}
r4_0[600604] = {
  DialogueId = 60060401,
  TalkTriggerId = 600604,
  TalkType = "Guide",
}
r4_0[600605] = {
  DialogueId = 60060501,
  TalkTriggerId = 600605,
  TalkType = "Guide",
}
r4_0[600606] = {
  DialogueId = 60060601,
  TalkTriggerId = 600606,
  TalkType = "Guide",
}
r4_0[600607] = {
  DialogueId = 60060701,
  TalkTriggerId = 600607,
  TalkType = "Guide",
}
r4_0[600608] = {
  DialogueId = 60060801,
  TalkTriggerId = 600608,
  TalkType = "Guide",
}
r4_0[600609] = {
  DialogueId = 60060901,
  TalkTriggerId = 600609,
  TalkType = "Guide",
}
r4_0[601101] = {
  DialogueId = 60110101,
  TalkTriggerId = 601101,
  TalkType = "Guide",
}
r4_0[601102] = {
  DialogueId = 60110201,
  TalkTriggerId = 601102,
  TalkType = "Guide",
}
r4_0[601103] = {
  DialogueId = 60110301,
  TalkTriggerId = 601103,
  TalkType = "Guide",
}
r4_0[601105] = {
  DialogueId = 60110501,
  TalkTriggerId = 601105,
  TalkType = "Guide",
}
r4_0[601106] = {
  DialogueId = 60110601,
  TalkTriggerId = 601106,
  TalkType = "Guide",
}
r4_0[601107] = {
  DialogueId = 60110701,
  TalkTriggerId = 601107,
  TalkType = "Guide",
}
r4_0[601201] = {
  DialogueId = 60120101,
  TalkTriggerId = 601201,
  TalkType = "Guide",
}
r4_0[601202] = {
  DialogueId = 60120201,
  TalkTriggerId = 601202,
  TalkType = "Guide",
}
r4_0[601203] = {
  DialogueId = 60120301,
  TalkTriggerId = 601203,
  TalkType = "Guide",
}
r4_0[601204] = {
  DialogueId = 60120401,
  TalkTriggerId = 601204,
  TalkType = "Guide",
}
r4_0[601205] = {
  DialogueId = 60120501,
  TalkTriggerId = 601205,
  TalkType = "Guide",
}
r4_0[601206] = {
  DialogueId = 60120601,
  TalkTriggerId = 601206,
  TalkType = "Guide",
}
r4_0[601301] = {
  DialogueId = 60130101,
  TalkTriggerId = 601301,
  TalkType = "Guide",
}
r4_0[601302] = {
  DialogueId = 60130201,
  TalkTriggerId = 601302,
  TalkType = "Guide",
}
r4_0[601303] = {
  DialogueId = 60130301,
  TalkTriggerId = 601303,
  TalkType = "Guide",
}
r4_0[601304] = {
  DialogueId = 60130401,
  TalkTriggerId = 601304,
  TalkType = "Guide",
}
r4_0[601305] = {
  DialogueId = 60130501,
  TalkTriggerId = 601305,
  TalkType = "Guide",
}
r4_0[601306] = {
  DialogueId = 60130601,
  TalkTriggerId = 601306,
  TalkType = "Guide",
}
r4_0[601307] = {
  DialogueId = 60130701,
  TalkTriggerId = 601307,
  TalkType = "Guide",
}
r4_0[601308] = {
  DialogueId = 60130801,
  TalkTriggerId = 601308,
  TalkType = "Guide",
}
r4_0[602001] = {
  DialogueId = 60200101,
  TalkTriggerId = 602001,
  TalkType = "Guide",
}
r4_0[602002] = {
  DialogueId = 60200201,
  TalkTriggerId = 602002,
  TalkType = "Guide",
}
r4_0[602003] = {
  DialogueId = 60200301,
  TalkTriggerId = 602003,
  TalkType = "Guide",
}
r4_0[602004] = {
  DialogueId = 60200401,
  TalkTriggerId = 602004,
  TalkType = "Guide",
}
r4_0[602005] = {
  DialogueId = 60200501,
  TalkTriggerId = 602005,
  TalkType = "Guide",
}
r4_0[602101] = {
  DialogueId = 60210101,
  TalkTriggerId = 602101,
  TalkType = "Guide",
}
r4_0[602102] = {
  DialogueId = 60210201,
  TalkTriggerId = 602102,
  TalkType = "Guide",
}
r4_0[602103] = {
  DialogueId = 60210301,
  TalkTriggerId = 602103,
  TalkType = "Guide",
}
r4_0[602201] = {
  DialogueId = 60220101,
  TalkTriggerId = 602201,
  TalkType = "Guide",
}
r4_0[602202] = {
  DialogueId = 60220201,
  TalkTriggerId = 602202,
  TalkType = "Guide",
}
r4_0[602203] = {
  DialogueId = 60220301,
  TalkTriggerId = 602203,
  TalkType = "Guide",
}
r4_0[602204] = {
  DialogueId = 60220401,
  TalkTriggerId = 602204,
  TalkType = "Guide",
}
r4_0[602205] = {
  DialogueId = 60220501,
  TalkTriggerId = 602205,
  TalkType = "Guide",
}
r4_0[602206] = {
  DialogueId = 60220601,
  TalkTriggerId = 602206,
  TalkType = "Guide",
}
r4_0[602207] = {
  DialogueId = 60220701,
  TalkTriggerId = 602207,
  TalkType = "Guide",
}
r4_0[602208] = {
  DialogueId = 60220801,
  TalkTriggerId = 602208,
  TalkType = "Guide",
}
r4_0[602209] = {
  DialogueId = 60220901,
  TalkTriggerId = 602209,
  TalkType = "Guide",
}
r4_0[602210] = {
  DialogueId = 60221001,
  TalkTriggerId = 602210,
  TalkType = "Guide",
}
r4_0[602211] = {
  DialogueId = 60221101,
  TalkTriggerId = 602211,
  TalkType = "Guide",
}
r4_0[602212] = {
  DialogueId = 60221201,
  TalkTriggerId = 602212,
  TalkType = "Guide",
}
r4_0[602213] = {
  DialogueId = 60221301,
  TalkTriggerId = 602213,
  TalkType = "Guide",
}
r4_0[602214] = {
  DialogueId = 60221401,
  TalkTriggerId = 602214,
  TalkType = "Guide",
}
r4_0[602215] = {
  DialogueId = 60221501,
  TalkTriggerId = 602215,
  TalkType = "Guide",
}
r4_0[602216] = {
  DialogueId = 60221601,
  TalkTriggerId = 602216,
  TalkType = "Guide",
}
r4_0[602301] = {
  DialogueId = 60230101,
  TalkTriggerId = 602301,
  TalkType = "Guide",
}
r4_0[602302] = {
  DialogueId = 60230201,
  TalkTriggerId = 602302,
  TalkType = "Guide",
}
r4_0[602303] = {
  DialogueId = 60230301,
  TalkTriggerId = 602303,
  TalkType = "Guide",
}
r4_0[602304] = {
  DialogueId = 60230401,
  TalkTriggerId = 602304,
  TalkType = "Guide",
}
r4_0[603001] = {
  DialogueId = 60300101,
  TalkTriggerId = 603001,
  TalkType = "Guide",
}
r4_0[608001] = {
  DialogueId = 60800101,
  TalkTriggerId = 608001,
  TalkType = "Guide",
}
r4_0[699901] = {
  StoryLinePath = "Rogue/Test_1.story",
  TalkId = 699901,
  TalkTriggerId = 699901,
}
r4_0[699902] = {
  StoryLinePath = "Rogue/Test_2.story",
  TalkId = 699902,
  TalkTriggerId = 699902,
}
r4_0[699903] = {
  StoryLinePath = "Rogue/Test_3.story",
  TalkId = 699903,
  TalkTriggerId = 699903,
}
r4_0[699991] = {
  StoryLinePath = "Rogue/699991_Shop_1_Bubble.story",
  TalkId = 699991,
  TalkTriggerId = 699991,
}
r4_0[699992] = {
  StoryLinePath = "Rogue/699992_Shop_1.story",
  TalkId = 699992,
  TalkTriggerId = 699992,
}
r4_0[700001] = {
  DialogueId = 10038101,
  TalkTriggerId = 700001,
  TalkType = "Black",
}
r4_0[700101] = {
  StoryLinePath = "Observe/Village.story",
  TalkId = 700101,
  TalkTriggerId = 700101,
}
r4_0[700102] = {
  StoryLinePath = "Observe/Village.story",
  TalkId = 700102,
  TalkTriggerId = 700102,
}
r4_0[700103] = {
  StoryLinePath = "Observe/Village.story",
  TalkId = 700103,
  TalkTriggerId = 700103,
}
r4_0[700104] = {
  StoryLinePath = "Observe/Village.story",
  TalkId = 700104,
  TalkTriggerId = 700104,
}
r4_0[700105] = {
  StoryLinePath = "Observe/Village.story",
  TalkId = 700105,
  TalkTriggerId = 700105,
}
r4_0[700106] = {
  StoryLinePath = "Observe/Village.story",
  TalkId = 700106,
  TalkTriggerId = 700106,
}
r4_0[700107] = {
  StoryLinePath = "Observe/Village.story",
  TalkId = 700107,
  TalkTriggerId = 700107,
}
r4_0[700108] = {
  StoryLinePath = "Observe/Village.story",
  TalkId = 700108,
  TalkTriggerId = 700108,
}
r4_0[700109] = {
  StoryLinePath = "Observe/Village.story",
  TalkId = 700109,
  TalkTriggerId = 700109,
}
r4_0[700110] = {
  StoryLinePath = "Observe/IceLakeCity_1.story",
  TalkId = 700110,
  TalkTriggerId = 700110,
}
r4_0[700111] = {
  StoryLinePath = "Observe/IceLakeCity_1.story",
  TalkId = 700111,
  TalkTriggerId = 700111,
}
r4_0[700112] = {
  StoryLinePath = "Observe/IceLakeCity_1.story",
  TalkId = 700112,
  TalkTriggerId = 700112,
}
r4_0[700113] = {
  StoryLinePath = "Observe/IceLakeCity_1.story",
  TalkId = 700113,
  TalkTriggerId = 700113,
}
r4_0[700114] = {
  StoryLinePath = "Observe/IceLakeCity_1.story",
  TalkId = 700114,
  TalkTriggerId = 700114,
}
r4_0[700115] = {
  StoryLinePath = "Observe/IceLakeCity_1.story",
  TalkId = 700115,
  TalkTriggerId = 700115,
}
r4_0[700116] = {
  StoryLinePath = "Observe/IceLakeCity_1.story",
  TalkId = 700116,
  TalkTriggerId = 700116,
}
r4_0[700117] = {
  StoryLinePath = "Observe/IceLakeCity_1.story",
  TalkId = 700117,
  TalkTriggerId = 700117,
}
r4_0[700118] = {
  StoryLinePath = "Observe/IceLakeCity_1.story",
  TalkId = 700118,
  TalkTriggerId = 700118,
}
r4_0[700119] = {
  StoryLinePath = "Observe/IceLakeCity_1.story",
  TalkId = 700119,
  TalkTriggerId = 700119,
}
r4_0[700120] = {
  StoryLinePath = "Observe/IceLakeCity_1.story",
  TalkId = 700120,
  TalkTriggerId = 700120,
}
r4_0[700121] = {
  StoryLinePath = "Observe/IceLakeCity_1.story",
  TalkId = 700121,
  TalkTriggerId = 700121,
}
r4_0[700122] = {
  StoryLinePath = "Observe/IceLakeCity_1.story",
  TalkId = 700122,
  TalkTriggerId = 700122,
}
r4_0[700123] = {
  StoryLinePath = "Observe/IceLakeCity_1.story",
  TalkId = 700123,
  TalkTriggerId = 700123,
}
r4_0[700124] = {
  StoryLinePath = "Observe/IceLakeCity_1.story",
  TalkId = 700124,
  TalkTriggerId = 700124,
}
r4_0[700125] = {
  StoryLinePath = "Observe/IceLakeCity_1.story",
  TalkId = 700125,
  TalkTriggerId = 700125,
}
r4_0[700126] = {
  StoryLinePath = "Observe/IceLakeCity_1.story",
  TalkId = 700126,
  TalkTriggerId = 700126,
}
r4_0[700127] = {
  StoryLinePath = "Observe/IceLakeCity_1.story",
  TalkId = 700127,
  TalkTriggerId = 700127,
}
r4_0[700128] = {
  StoryLinePath = "Observe/IceLakeCity_1.story",
  TalkId = 700128,
  TalkTriggerId = 700128,
}
r4_0[700129] = {
  StoryLinePath = "Observe/IceLakeCity_1.story",
  TalkId = 700129,
  TalkTriggerId = 700129,
}
r4_0[700130] = {
  StoryLinePath = "Observe/IceLakeCity_1.story",
  TalkId = 700130,
  TalkTriggerId = 700130,
}
r4_0[700131] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700131,
  TalkTriggerId = 700131,
}
r4_0[700132] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700132,
  TalkTriggerId = 700132,
}
r4_0[700133] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700133,
  TalkTriggerId = 700133,
}
r4_0[700134] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700134,
  TalkTriggerId = 700134,
}
r4_0[700135] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700135,
  TalkTriggerId = 700135,
}
r4_0[700136] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700136,
  TalkTriggerId = 700136,
}
r4_0[700137] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700137,
  TalkTriggerId = 700137,
}
r4_0[700138] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700138,
  TalkTriggerId = 700138,
}
r4_0[700139] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700139,
  TalkTriggerId = 700139,
}
r4_0[700140] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700140,
  TalkTriggerId = 700140,
}
r4_0[700141] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700141,
  TalkTriggerId = 700141,
}
r4_0[700142] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700142,
  TalkTriggerId = 700142,
}
r4_0[700143] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700143,
  TalkTriggerId = 700143,
}
r4_0[700144] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700144,
  TalkTriggerId = 700144,
}
r4_0[700145] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700145,
  TalkTriggerId = 700145,
}
r4_0[700146] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700146,
  TalkTriggerId = 700146,
}
r4_0[700147] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700147,
  TalkTriggerId = 700147,
}
r4_0[700148] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700148,
  TalkTriggerId = 700148,
}
r4_0[700149] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700149,
  TalkTriggerId = 700149,
}
r4_0[700150] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700150,
  TalkTriggerId = 700150,
}
r4_0[700151] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700151,
  TalkTriggerId = 700151,
}
r4_0[700152] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700152,
  TalkTriggerId = 700152,
}
r4_0[700153] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700153,
  TalkTriggerId = 700153,
}
r4_0[700154] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700154,
  TalkTriggerId = 700154,
}
r4_0[700155] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700155,
  TalkTriggerId = 700155,
}
r4_0[700156] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700156,
  TalkTriggerId = 700156,
}
r4_0[700157] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700157,
  TalkTriggerId = 700157,
}
r4_0[700158] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700158,
  TalkTriggerId = 700158,
}
r4_0[700159] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700159,
  TalkTriggerId = 700159,
}
r4_0[700160] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700160,
  TalkTriggerId = 700160,
}
r4_0[700161] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700161,
  TalkTriggerId = 700161,
}
r4_0[700162] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700162,
  TalkTriggerId = 700162,
}
r4_0[700163] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700163,
  TalkTriggerId = 700163,
}
r4_0[700164] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700164,
  TalkTriggerId = 700164,
}
r4_0[700165] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700165,
  TalkTriggerId = 700165,
}
r4_0[700166] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700166,
  TalkTriggerId = 700166,
}
r4_0[700167] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700167,
  TalkTriggerId = 700167,
}
r4_0[700168] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700168,
  TalkTriggerId = 700168,
}
r4_0[700169] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700169,
  TalkTriggerId = 700169,
}
r4_0[700170] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700170,
  TalkTriggerId = 700170,
}
r4_0[700171] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700171,
  TalkTriggerId = 700171,
}
r4_0[700172] = {
  StoryLinePath = "Observe/EX01.story",
  TalkId = 700172,
  TalkTriggerId = 700172,
}
r4_0[700173] = {
  StoryLinePath = "Observe/EX01.story",
  TalkId = 700173,
  TalkTriggerId = 700173,
}
r4_0[700174] = {
  StoryLinePath = "Observe/EX01.story",
  TalkId = 700174,
  TalkTriggerId = 700174,
}
r4_0[700175] = {
  StoryLinePath = "Observe/EX01.story",
  TalkId = 700175,
  TalkTriggerId = 700175,
}
r4_0[700176] = {
  StoryLinePath = "Observe/EX01.story",
  TalkId = 700176,
  TalkTriggerId = 700176,
}
r4_0[700177] = {
  StoryLinePath = "Observe/EX01.story",
  TalkId = 700177,
  TalkTriggerId = 700177,
}
r4_0[700178] = {
  StoryLinePath = "Observe/EX01.story",
  TalkId = 700178,
  TalkTriggerId = 700178,
}
r4_0[700179] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700179,
  TalkTriggerId = 700179,
}
r4_0[700180] = {
  StoryLinePath = "Observe/EX01.story",
  TalkId = 700180,
  TalkTriggerId = 700180,
}
r4_0[700181] = {
  StoryLinePath = "Observe/IceLake.story",
  TalkId = 700181,
  TalkTriggerId = 700181,
}
r4_0[700182] = {
  StoryLinePath = "Observe/IceLake.story",
  TalkId = 700182,
  TalkTriggerId = 700182,
}
r4_0[700183] = {
  StoryLinePath = "Observe/IceLake.story",
  TalkId = 700183,
  TalkTriggerId = 700183,
}
r4_0[700184] = {
  StoryLinePath = "Observe/East01_Sce.story",
  TalkId = 700184,
  TalkTriggerId = 700184,
}
r4_0[700185] = {
  StoryLinePath = "Observe/East01_Sce.story",
  TalkId = 700185,
  TalkTriggerId = 700185,
}
r4_0[700200] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700200,
  TalkTriggerId = 700200,
}
r4_0[700300] = {
  StoryLinePath = "Observe/IceLakeCity_2.story",
  TalkId = 700300,
  TalkTriggerId = 700300,
}
r4_0[710005] = {
  StoryLinePath = "DynStory/Talk.story",
  TalkId = 710005,
  TalkTriggerId = 710005,
}
r4_0[720000] = {
  StoryLinePath = "Explore/A_PanTalk_Prologue.story",
  TalkId = 710000,
  TalkTriggerId = 720000,
}
r4_0[720002] = {
  StoryLinePath = "Explore/A_PanTalk_Prologue.story",
  TalkId = 720002,
  TalkTriggerId = 720002,
}
r4_0[720003] = {
  StoryLinePath = "Explore/A_PanTalk_Prologue.story",
  TalkId = 720003,
  TalkTriggerId = 720003,
}
r4_0[720004] = {
  StoryLinePath = "Explore/A_PanTalk_Prologue.story",
  TalkId = 720004,
  TalkTriggerId = 720004,
}
r4_0[720005] = {
  StoryLinePath = "Explore/A_PanTalk_Prologue.story",
  TalkId = 720005,
  TalkTriggerId = 720005,
}
r4_0[720006] = {
  StoryLinePath = "Explore/A_PanTalk_EX01.story",
  TalkId = 720006,
  TalkTriggerId = 720006,
}
r4_0[720007] = {
  StoryLinePath = "Explore/A_PanTalk_EX01.story",
  TalkId = 720007,
  TalkTriggerId = 720007,
}
r4_0[720008] = {
  StoryLinePath = "Explore/A_PanTalk_EX01.story",
  TalkId = 720008,
  TalkTriggerId = 720008,
}
r4_0[720009] = {
  StoryLinePath = "Explore/A_PanTalk_EX01.story",
  TalkId = 720009,
  TalkTriggerId = 720009,
}
r4_0[720010] = {
  StoryLinePath = "Explore/A_PanTalk_Icelake.story",
  TalkId = 720010,
  TalkTriggerId = 720010,
}
r4_0[720011] = {
  StoryLinePath = "Explore/A_PanTalk_Icelake.story",
  TalkId = 720011,
  TalkTriggerId = 720011,
}
r4_0[720012] = {
  StoryLinePath = "Explore/A_PanTalk_Icelake.story",
  TalkId = 720012,
  TalkTriggerId = 720012,
}
r4_0[720013] = {
  StoryLinePath = "Explore/A_PanTalk_Icelake.story",
  TalkId = 720013,
  TalkTriggerId = 720013,
}
r4_0[720014] = {
  StoryLinePath = "Explore/A_PanTalk_Icelake.story",
  TalkId = 720014,
  TalkTriggerId = 720014,
}
r4_0[720015] = {
  StoryLinePath = "Explore/A_PanTalk_Icelake.story",
  TalkId = 720015,
  TalkTriggerId = 720015,
}
r4_0[720016] = {
  StoryLinePath = "Explore/A_PanTalk_Icelake.story",
  TalkId = 720016,
  TalkTriggerId = 720016,
}
r4_0[720017] = {
  StoryLinePath = "Explore/A_PanTalk_Icelake.story",
  TalkId = 720017,
  TalkTriggerId = 720017,
}
r4_0[720018] = {
  StoryLinePath = "Explore/A_PanTalk_Icelake.story",
  TalkId = 720018,
  TalkTriggerId = 720018,
}
r4_0[720019] = {
  StoryLinePath = "Explore/A_PanTalk_Icelake.story",
  TalkId = 720019,
  TalkTriggerId = 720019,
}
r4_0[720020] = {
  StoryLinePath = "Explore/A_PanTalk_Icelake.story",
  TalkId = 720020,
  TalkTriggerId = 720020,
}
r4_0[720021] = {
  StoryLinePath = "Explore/A_PanTalk_Icelake.story",
  TalkId = 720021,
  TalkTriggerId = 720021,
}
r4_0[720022] = {
  StoryLinePath = "Explore/A_PanTalk_Icelake.story",
  TalkId = 720022,
  TalkTriggerId = 720022,
}
r4_0[720023] = {
  StoryLinePath = "Explore/A_PanTalk_Icelake.story",
  TalkId = 720023,
  TalkTriggerId = 720023,
}
r4_0[720024] = {
  StoryLinePath = "Explore/A_PanTalk_Icelake.story",
  TalkId = 720024,
  TalkTriggerId = 720024,
}
r4_0[720025] = {
  StoryLinePath = "Explore/A_PanTalk_Icelake.story",
  TalkId = 720025,
  TalkTriggerId = 720025,
}
r4_0[720026] = {
  StoryLinePath = "Explore/A_PanTalk_Icelake.story",
  TalkId = 720026,
  TalkTriggerId = 720026,
}
r4_0[720027] = {
  StoryLinePath = "Explore/A_PanTalk_Icelake.story",
  TalkId = 720027,
  TalkTriggerId = 720027,
}
r4_0[720028] = {
  StoryLinePath = "Explore/A_PanTalk_Icelake.story",
  TalkId = 720028,
  TalkTriggerId = 720028,
}
r4_0[720029] = {
  StoryLinePath = "Explore/A_PanTalk_Sew.story",
  TalkId = 720029,
  TalkTriggerId = 720029,
}
r4_0[720030] = {
  StoryLinePath = "Explore/A_PanTalk_Sew.story",
  TalkId = 720030,
  TalkTriggerId = 720030,
}
r4_0[720031] = {
  StoryLinePath = "Explore/A_PanTalk_EX01.story",
  TalkId = 720031,
  TalkTriggerId = 720031,
}
r4_0[720032] = {
  StoryLinePath = "Explore/A_PanTalk_EX01.story",
  TalkId = 720032,
  TalkTriggerId = 720032,
}
r4_0[720033] = {
  StoryLinePath = "Explore/A_PanTalk_EX01.story",
  TalkId = 720033,
  TalkTriggerId = 720033,
}
r4_0[720034] = {
  RewardId = 3011,
  StoryLinePath = "Explore/A_PanTalk_EX01.story",
  TalkId = 720034,
  TalkTriggerId = 720034,
  Type = "Impression",
}
r4_0[720035] = {
  StoryLinePath = "Explore/A_PanTalk_EX01.story",
  TalkId = 720035,
  TalkTriggerId = 720035,
}
r4_0[720036] = {
  StoryLinePath = "Explore/A_PanTalk_EX01.story",
  TalkId = 720036,
  TalkTriggerId = 720036,
}
r4_0[720037] = {
  RewardId = 3011,
  StoryLinePath = "Explore/A_PanTalk_EX01.story",
  TalkId = 720037,
  TalkTriggerId = 720037,
  Type = "Impression",
}
r4_0[720038] = {
  StoryLinePath = "Explore/A_PanTalk_Prologue.story",
  TalkId = 720038,
  TalkTriggerId = 720038,
}
r4_0[720039] = {
  StoryLinePath = "Explore/A_PanTalk_Prologue.story",
  TalkId = 720039,
  TalkTriggerId = 720039,
}
r4_0[720040] = {
  StoryLinePath = "Explore/A_PanTalk_KuangKeng.story",
  TalkId = 720040,
  TalkTriggerId = 720040,
}
r4_0[720041] = {
  StoryLinePath = "Explore/A_PanTalk_KuangKeng.story",
  TalkId = 720041,
  TalkTriggerId = 720041,
}
r4_0[720042] = {
  StoryLinePath = "Explore/A_PanTalk_KuangKeng.story",
  TalkId = 720042,
  TalkTriggerId = 720042,
}
r4_0[720043] = {
  StoryLinePath = "Explore/A_PanTalk_Sew.story",
  TalkId = 720043,
  TalkTriggerId = 720043,
}
r4_0[720044] = {
  StoryLinePath = "Explore/A_PanTalk_Sew.story",
  TalkId = 720044,
  TalkTriggerId = 720044,
}
r4_0[720045] = {
  StoryLinePath = "Explore/A_PanTalk_Sew.story",
  TalkId = 720045,
  TalkTriggerId = 720045,
}
r4_0[720046] = {
  StoryLinePath = "Explore/A_PanTalk_Sew.story",
  TalkId = 720046,
  TalkTriggerId = 720046,
}
r4_0[721001] = {
  StoryLinePath = "Explore/A_WuyouTalk_Yanjindu.story",
  TalkId = 721001,
  TalkTriggerId = 721001,
}
r4_0[721002] = {
  StoryLinePath = "Explore/A_WuyouTalk_Yanjindu.story",
  TalkId = 721002,
  TalkTriggerId = 721002,
}
r4_0[721003] = {
  StoryLinePath = "Explore/A_WuyouTalk_Yanjindu.story",
  TalkId = 721003,
  TalkTriggerId = 721003,
}
r4_0[721004] = {
  StoryLinePath = "Explore/A_WuyouTalk_Yanjindu.story",
  TalkId = 721004,
  TalkTriggerId = 721004,
}
r4_0[721005] = {
  StoryLinePath = "Explore/A_WuyouTalk_Yanjindu.story",
  TalkId = 721005,
  TalkTriggerId = 721005,
}
r4_0[721006] = {
  StoryLinePath = "Explore/A_WuyouTalk_Yanjindu.story",
  TalkId = 721006,
  TalkTriggerId = 721006,
}
r4_0[721007] = {
  StoryLinePath = "Explore/A_WuyouTalk_Yanjindu.story",
  TalkId = 721007,
  TalkTriggerId = 721007,
}
r4_0[721008] = {
  StoryLinePath = "Explore/A_WuyouTalk_Yanjindu.story",
  TalkId = 721008,
  TalkTriggerId = 721008,
}
r4_0[721009] = {
  StoryLinePath = "Explore/A_WuyouTalk_Yanjindu.story",
  TalkId = 721009,
  TalkTriggerId = 721009,
}
r4_0[721010] = {
  StoryLinePath = "Explore/A_WuyouTalk_Yanjindu.story",
  TalkId = 721010,
  TalkTriggerId = 721010,
}
r4_0[721011] = {
  StoryLinePath = "Explore/A_WuyouTalk_Yanjindu.story",
  TalkId = 721011,
  TalkTriggerId = 721011,
}
r4_0[721012] = {
  StoryLinePath = "Explore/A_WuyouTalk_Haojing.story",
  TalkId = 721012,
  TalkTriggerId = 721012,
}
r4_0[721013] = {
  StoryLinePath = "Explore/A_WuyouTalk_Yanjindu.story",
  TalkId = 721013,
  TalkTriggerId = 721013,
}
r4_0[721014] = {
  StoryLinePath = "Explore/A_WuyouTalk_Yanjindu.story",
  TalkId = 721014,
  TalkTriggerId = 721014,
}
r4_0[721015] = {
  StoryLinePath = "Explore/A_WuyouTalk_Yanjindu.story",
  TalkId = 721015,
  TalkTriggerId = 721015,
}
r4_0[721016] = {
  StoryLinePath = "Explore/A_WuyouTalk_Yanjindu.story",
  TalkId = 721016,
  TalkTriggerId = 721016,
}
r4_0[721017] = {
  StoryLinePath = "Explore/A_WuyouTalk_Yanjindu.story",
  TalkId = 721017,
  TalkTriggerId = 721017,
}
r4_0[730006] = {
  DialogueId = 73000601,
  TalkTriggerId = 730006,
  TalkType = "Guide",
}
r4_0[730007] = {
  DialogueId = 73000701,
  TalkTriggerId = 730007,
  TalkType = "Guide",
}
r4_0[730008] = {
  DialogueId = 73000801,
  TalkTriggerId = 730008,
  TalkType = "Guide",
}
r4_0[730009] = {
  DialogueId = 73000901,
  TalkTriggerId = 730009,
  TalkType = "Guide",
}
r4_0[730010] = {
  DialogueId = 73001001,
  TalkTriggerId = 730010,
  TalkType = "Guide",
}
r4_0[830001] = {
  StoryLinePath = "Explore/ExploreGroup.story",
  TalkId = 830001,
  TalkTriggerId = 830001,
}
r4_0[830002] = {
  StoryLinePath = "Explore/ExploreGroup.story",
  TalkId = 830002,
  TalkTriggerId = 830002,
}
r4_0[830003] = {
  StoryLinePath = "Explore/ExploreGroup.story",
  TalkId = 830003,
  TalkTriggerId = 830003,
}
r4_0[830004] = {
  StoryLinePath = "Explore/ExploreGroup.story",
  TalkId = 830004,
  TalkTriggerId = 830004,
}
r4_0[830005] = {
  StoryLinePath = "Explore/ExploreGroup.story",
  TalkId = 830005,
  TalkTriggerId = 830005,
}
r4_0[830006] = {
  StoryLinePath = "Explore/ExploreGroup.story",
  TalkId = 830006,
  TalkTriggerId = 830006,
}
r4_0[830007] = {
  StoryLinePath = "Explore/ExploreGroup.story",
  TalkId = 830007,
  TalkTriggerId = 830007,
}
r4_0[830008] = {
  StoryLinePath = "Explore/ExploreGroup.story",
  TalkId = 830008,
  TalkTriggerId = 830008,
}
r4_0[830009] = {
  StoryLinePath = "Explore/ExploreGroup.story",
  TalkId = 830009,
  TalkTriggerId = 830009,
}
r4_0[830010] = {
  StoryLinePath = "Explore/ExploreGroup.story",
  TalkId = 830010,
  TalkTriggerId = 830010,
}
r4_0[830011] = {
  StoryLinePath = "Explore/ExploreGroup.story",
  TalkId = 830011,
  TalkTriggerId = 830011,
}
r4_0[830012] = {
  StoryLinePath = "Explore/ExploreGroup.story",
  TalkId = 830012,
  TalkTriggerId = 830012,
}
r4_0[830013] = {
  StoryLinePath = "Explore/ExploreGroup.story",
  TalkId = 830013,
  TalkTriggerId = 830013,
}
r4_0[830014] = {
  StoryLinePath = "Explore/ExploreGroup.story",
  TalkId = 830014,
  TalkTriggerId = 830014,
}
r4_0[830015] = {
  StoryLinePath = "Explore/ExploreGroup.story",
  TalkId = 830015,
  TalkTriggerId = 830015,
}
r4_0[830016] = {
  StoryLinePath = "Explore/ExploreGroup.story",
  TalkId = 830016,
  TalkTriggerId = 830016,
}
r4_0[830017] = {
  StoryLinePath = "Explore/ExploreGroup.story",
  TalkId = 830017,
  TalkTriggerId = 830017,
}
r4_0[830018] = {
  StoryLinePath = "Explore/ExploreGroup.story",
  TalkId = 830018,
  TalkTriggerId = 830018,
}
r4_0[900101] = {
  StoryLinePath = "TalkGossip/900101_Duanzao_Bubble.story",
  TalkId = 900101,
  TalkTriggerId = 900101,
}
r4_0[900102] = {
  StoryLinePath = "TalkGossip/900102_Duanzao.story",
  TalkId = 900102,
  TalkTriggerId = 900102,
}
r4_0[900201] = {
  StoryLinePath = "TalkGossip/900201_Shangdian_Bubble.story",
  TalkId = 900201,
  TalkTriggerId = 900201,
}
r4_0[900202] = {
  StoryLinePath = "TalkGossip/900202_Shangdian.story",
  TalkId = 900202,
  TalkTriggerId = 900202,
}
r4_0[900301] = {
  StoryLinePath = "TalkGossip/900301_Heitao.story",
  TalkId = 900301,
  TalkTriggerId = 900301,
}
r4_0[900401] = {
  StoryLinePath = "TalkGossip/900401_Shuimu.story",
  TalkId = 900401,
  TalkTriggerId = 900401,
}
r4_0[900501] = {
  StoryLinePath = "TalkGossip/900501_Zhangyu.story",
  TalkId = 900501,
  TalkTriggerId = 900501,
}
r4_0[900601] = {
  StoryLinePath = "TalkGossip/900601_Haier.story",
  TalkId = 900601,
  TalkTriggerId = 900601,
}
r4_0[900701] = {
  TalkTriggerId = 900701,
  TriggerCondition = r0_0.RT_60,
}
r4_0[900801] = {
  StoryLinePath = "TalkGossip/900801_Landi.story",
  TalkId = 900801,
  TalkTriggerId = 900801,
}
r4_0[900901] = {
  StoryLinePath = "TalkGossip/900901_Xibi.story",
  TalkId = 900901,
  TalkTriggerId = 900901,
}
r4_0[901001] = {
  StoryLinePath = "TalkGossip/901001_Saiqi.story",
  TalkId = 901001,
  TalkTriggerId = 901001,
}
r4_0[901101] = {
  StoryLinePath = "TalkGossip/901101_Baiheng.story",
  TalkId = 901101,
  TalkTriggerId = 901101,
}
r4_0[901201] = {
  StoryLinePath = "TalkGossip/901201_Songlu.story",
  TalkId = 901201,
  TalkTriggerId = 901201,
}
r4_0[901301] = {
  StoryLinePath = "TalkGossip/901301_Linen.story",
  TalkId = 901301,
  TalkTriggerId = 901301,
}
r4_0[901401] = {
  TalkTriggerId = 901401,
  TriggerCondition = r0_0.RT_60,
}
r4_0[901501] = {
  StoryLinePath = "TalkGossip/901501_Feina.story",
  TalkId = 901501,
  TalkTriggerId = 901501,
}
r4_0[901601] = {
  StoryLinePath = "TalkGossip/901601_Aote.story",
  TalkId = 901601,
  TalkTriggerId = 901601,
}
r4_0[901701] = {
  StoryLinePath = "TalkGossip/901701_Maer.story",
  TalkId = 901701,
  TalkTriggerId = 901701,
}
r4_0[901801] = {
  StoryLinePath = "TalkGossip/901801_Yeer.story",
  TalkId = 901801,
  TalkTriggerId = 901801,
}
r4_0[901901] = {
  StoryLinePath = "TalkGossip/901901_James.story",
  TalkId = 901901,
  TalkTriggerId = 901901,
}
r4_0[902001] = {
  StoryLinePath = "TalkGossip/902001_Jack.story",
  TalkId = 902001,
  TalkTriggerId = 902001,
}
r4_0[902101] = {
  StoryLinePath = "TalkGossip/902101_Emily.story",
  TalkId = 902101,
  TalkTriggerId = 902101,
}
r4_0[902501] = {
  StoryLinePath = "TalkGossip/902501_Nifu.story",
  TalkId = 902501,
  TalkTriggerId = 902501,
}
r4_0[902601] = {
  TalkTriggerId = 902601,
  TriggerCondition = r0_0.RT_60,
}
r4_0[902701] = {
  StoryLinePath = "TalkGossip/902701_Kezhou.story",
  TalkId = 902701,
  TalkTriggerId = 902701,
}
r4_0[902901] = {
  StoryLinePath = "TalkGossip/902901_Baonu.story",
  TalkId = 902901,
  TalkTriggerId = 902901,
}
r4_0[910101] = {
  StoryLinePath = "TalkGossip/LongIdleBubble/HeitaoIdleBubble.story",
  TalkId = 910101,
  TalkTriggerId = 910101,
}
r4_0[910102] = {
  StoryLinePath = "TalkGossip/LongIdleBubble/ShuimuIdleBubble.story",
  TalkId = 910102,
  TalkTriggerId = 910102,
}
r4_0[910103] = {
  StoryLinePath = "TalkGossip/LongIdleBubble/ZhangyuIdleBubble.story",
  TalkId = 910103,
  TalkTriggerId = 910103,
}
r4_0[910104] = {
  StoryLinePath = "TalkGossip/LongIdleBubble/HaierIdleBubble.story",
  TalkId = 910104,
  TalkTriggerId = 910104,
}
r4_0[910105] = {
  TalkTriggerId = 910105,
  TriggerCondition = r0_0.RT_60,
}
r4_0[910106] = {
  StoryLinePath = "TalkGossip/LongIdleBubble/LandiIdleBubble.story",
  TalkId = 910106,
  TalkTriggerId = 910106,
}
r4_0[910107] = {
  StoryLinePath = "TalkGossip/LongIdleBubble/XibiIdleBubble.story",
  TalkId = 910107,
  TalkTriggerId = 910107,
}
r4_0[910108] = {
  StoryLinePath = "TalkGossip/LongIdleBubble/SaiqiIdleBubble.story",
  TalkId = 910108,
  TalkTriggerId = 910108,
}
r4_0[910109] = {
  StoryLinePath = "TalkGossip/LongIdleBubble/FushuIdleBubble.story",
  TalkId = 910109,
  TalkTriggerId = 910109,
}
r4_0[910110] = {
  StoryLinePath = "TalkGossip/LongIdleBubble/SongluIdleBubble.story",
  TalkId = 910110,
  TalkTriggerId = 910110,
}
r4_0[910111] = {
  StoryLinePath = "TalkGossip/LongIdleBubble/LinenIdleBubble.story",
  TalkId = 910111,
  TalkTriggerId = 910111,
}
r4_0[910112] = {
  TalkTriggerId = 910112,
  TriggerCondition = r0_0.RT_60,
}
r4_0[910113] = {
  StoryLinePath = "TalkGossip/LongIdleBubble/FeinaIdleBubble.story",
  TalkId = 910113,
  TalkTriggerId = 910113,
}
r4_0[910114] = {
  StoryLinePath = "TalkGossip/LongIdleBubble/AoteIdleBubble.story",
  TalkId = 910114,
  TalkTriggerId = 910114,
}
r4_0[910115] = {
  StoryLinePath = "TalkGossip/LongIdleBubble/MaerIdleBubble.story",
  TalkId = 910115,
  TalkTriggerId = 910115,
}
r4_0[910116] = {
  StoryLinePath = "TalkGossip/LongIdleBubble/YeerIdleBubble.story",
  TalkId = 910116,
  TalkTriggerId = 910116,
}
r4_0[910117] = {
  StoryLinePath = "TalkGossip/LongIdleBubble/DafuIdleBubble.story",
  TalkId = 910117,
  TalkTriggerId = 910117,
}
r4_0[910118] = {
  StoryLinePath = "TalkGossip/LongIdleBubble/TuosiIdleBubble.story",
  TalkId = 910118,
  TalkTriggerId = 910118,
}
r4_0[910119] = {
  StoryLinePath = "TalkGossip/LongIdleBubble/LiseIdleBubble.story",
  TalkId = 910119,
  TalkTriggerId = 910119,
}
r4_0[910120] = {
  StoryLinePath = "TalkGossip/LongIdleBubble/NifuIdleBubble.story",
  TalkId = 910120,
  TalkTriggerId = 910120,
}
r4_0[910121] = {
  TalkTriggerId = 910121,
  TriggerCondition = r0_0.RT_60,
}
r4_0[910122] = {
  StoryLinePath = "TalkGossip/LongIdleBubble/KezhouIdleBubble.story",
  TalkId = 910122,
  TalkTriggerId = 910122,
}
r4_0[910123] = {
  StoryLinePath = "TalkGossip/LongIdleBubble/BaonuIdleBubble.story",
  TalkId = 910123,
  TalkTriggerId = 910123,
}
r4_0[920101] = {
  TalkTriggerId = 920101,
  TriggerCondition = r0_0.RT_60,
}
r4_0[920102] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/HeitaoSonglu.story",
  TalkId = 920102,
  TalkTriggerId = 920102,
}
r4_0[920103] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/HeitaoXibi.story",
  TalkId = 920103,
  TalkTriggerId = 920103,
}
r4_0[920104] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/HeitaoAote.story",
  TalkId = 920104,
  TalkTriggerId = 920104,
}
r4_0[920105] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/ShuimuHaier.story",
  TalkId = 920105,
  TalkTriggerId = 920105,
}
r4_0[920106] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/ShuimuZhangyu.story",
  TalkId = 920106,
  TalkTriggerId = 920106,
}
r4_0[920107] = {
  TalkTriggerId = 920107,
  TriggerCondition = r0_0.RT_60,
}
r4_0[920108] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/ZhangyuHaier.story",
  TalkId = 920108,
  TalkTriggerId = 920108,
}
r4_0[920109] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/ZhangyuShuimu.story",
  TalkId = 920109,
  TalkTriggerId = 920109,
}
r4_0[920110] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/ZhangyuBaonu.story",
  TalkId = 920110,
  TalkTriggerId = 920110,
}
r4_0[920111] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/HaierXibi.story",
  TalkId = 920111,
  TalkTriggerId = 920111,
}
r4_0[920112] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/HaierShuimu.story",
  TalkId = 920112,
  TalkTriggerId = 920112,
}
r4_0[920113] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/HaierLandi.story",
  TalkId = 920113,
  TalkTriggerId = 920113,
}
r4_0[920114] = {
  TalkTriggerId = 920114,
  TriggerCondition = r0_0.RT_60,
}
r4_0[920115] = {
  TalkTriggerId = 920115,
  TriggerCondition = r0_0.RT_60,
}
r4_0[920116] = {
  TalkTriggerId = 920116,
  TriggerCondition = r0_0.RT_60,
}
r4_0[920117] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/LandiXibi.story",
  TalkId = 920117,
  TalkTriggerId = 920117,
}
r4_0[920118] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/LandiLinen.story",
  TalkId = 920118,
  TalkTriggerId = 920118,
}
r4_0[920119] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/LandiHeitao.story",
  TalkId = 920119,
  TalkTriggerId = 920119,
}
r4_0[920120] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/XibiDafu.story",
  TalkId = 920120,
  TalkTriggerId = 920120,
}
r4_0[920121] = {
  TalkTriggerId = 920121,
  TriggerCondition = r0_0.RT_60,
}
r4_0[920122] = {
  TalkTriggerId = 920122,
  TriggerCondition = r0_0.RT_60,
}
r4_0[920123] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/XibiAote.story",
  TalkId = 920123,
  TalkTriggerId = 920123,
}
r4_0[920124] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/XibiLandi.story",
  TalkId = 920124,
  TalkTriggerId = 920124,
}
r4_0[920125] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/SaiqiAote.story",
  TalkId = 920125,
  TalkTriggerId = 920125,
}
r4_0[920126] = {
  TalkTriggerId = 920126,
  TriggerCondition = r0_0.RT_60,
}
r4_0[920127] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/SaiqiSonglu.story",
  TalkId = 920127,
  TalkTriggerId = 920127,
}
r4_0[920128] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/FushuLandi.story",
  TalkId = 920128,
  TalkTriggerId = 920128,
}
r4_0[920129] = {
  TalkTriggerId = 920129,
  TriggerCondition = r0_0.RT_60,
}
r4_0[920130] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/FushuYeer.story",
  TalkId = 920130,
  TalkTriggerId = 920130,
}
r4_0[920131] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/SongluMaer.story",
  TalkId = 920131,
  TalkTriggerId = 920131,
}
r4_0[920132] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/SongluLinen.story",
  TalkId = 920132,
  TalkTriggerId = 920132,
}
r4_0[920133] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/SongluBaonu.story",
  TalkId = 920133,
  TalkTriggerId = 920133,
}
r4_0[920134] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/LinenLandi.story",
  TalkId = 920134,
  TalkTriggerId = 920134,
}
r4_0[920135] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/LinenXibi.story",
  TalkId = 920135,
  TalkTriggerId = 920135,
}
r4_0[920136] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/LinenLise.story",
  TalkId = 920136,
  TalkTriggerId = 920136,
}
r4_0[920137] = {
  TalkTriggerId = 920137,
  TriggerCondition = r0_0.RT_60,
}
r4_0[920138] = {
  TalkTriggerId = 920138,
  TriggerCondition = r0_0.RT_60,
}
r4_0[920139] = {
  TalkTriggerId = 920139,
  TriggerCondition = r0_0.RT_60,
}
r4_0[920140] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/FeinaAote.story",
  TalkId = 920140,
  TalkTriggerId = 920140,
}
r4_0[920141] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/FeinaSonglu.story",
  TalkId = 920141,
  TalkTriggerId = 920141,
}
r4_0[920142] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/FeinaBaonu.story",
  TalkId = 920142,
  TalkTriggerId = 920142,
}
r4_0[920143] = {
  TalkTriggerId = 920143,
  TriggerCondition = r0_0.RT_60,
}
r4_0[920144] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/AoteFeina.story",
  TalkId = 920144,
  TalkTriggerId = 920144,
}
r4_0[920145] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/AoteSaiqi.story",
  TalkId = 920145,
  TalkTriggerId = 920145,
}
r4_0[920146] = {
  TalkTriggerId = 920146,
  TriggerCondition = r0_0.RT_60,
}
r4_0[920147] = {
  TalkTriggerId = 920147,
  TriggerCondition = r0_0.RT_60,
}
r4_0[920148] = {
  TalkTriggerId = 920148,
  TriggerCondition = r0_0.RT_60,
}
r4_0[920149] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/MaerFeina.story",
  TalkId = 920149,
  TalkTriggerId = 920149,
}
r4_0[920150] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/MaerHaier.story",
  TalkId = 920150,
  TalkTriggerId = 920150,
}
r4_0[920151] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/MaerLinen.story",
  TalkId = 920151,
  TalkTriggerId = 920151,
}
r4_0[920152] = {
  TalkTriggerId = 920152,
  TriggerCondition = r0_0.RT_60,
}
r4_0[920153] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/YeerTuosi.story",
  TalkId = 920153,
  TalkTriggerId = 920153,
}
r4_0[920154] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/YeerSonglu.story",
  TalkId = 920154,
  TalkTriggerId = 920154,
}
r4_0[920155] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/YeerHaier.story",
  TalkId = 920155,
  TalkTriggerId = 920155,
}
r4_0[920156] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/DafuFushu.story",
  TalkId = 920156,
  TalkTriggerId = 920156,
}
r4_0[920157] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/DafuHaier.story",
  TalkId = 920157,
  TalkTriggerId = 920157,
}
r4_0[920158] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/DafuXibi.story",
  TalkId = 920158,
  TalkTriggerId = 920158,
}
r4_0[920159] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/DafuTuosi.story",
  TalkId = 920159,
  TalkTriggerId = 920159,
}
r4_0[920160] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/TuosiLise.story",
  TalkId = 920160,
  TalkTriggerId = 920160,
}
r4_0[920161] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/TuosiFeina.story",
  TalkId = 920161,
  TalkTriggerId = 920161,
}
r4_0[920162] = {
  TalkTriggerId = 920162,
  TriggerCondition = r0_0.RT_60,
}
r4_0[920163] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/TuosiZhangyu.story",
  TalkId = 920163,
  TalkTriggerId = 920163,
}
r4_0[920164] = {
  TalkTriggerId = 920164,
  TriggerCondition = r0_0.RT_60,
}
r4_0[920165] = {
  TalkTriggerId = 920165,
  TriggerCondition = r0_0.RT_60,
}
r4_0[920166] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/LiseLandi.story",
  TalkId = 920166,
  TalkTriggerId = 920166,
}
r4_0[920167] = {
  TalkTriggerId = 920167,
  TriggerCondition = r0_0.RT_60,
}
r4_0[920168] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/NifuAote.story",
  TalkId = 920168,
  TalkTriggerId = 920168,
}
r4_0[920169] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/NifuFushu.story",
  TalkId = 920169,
  TalkTriggerId = 920169,
}
r4_0[920170] = {
  TalkTriggerId = 920170,
  TriggerCondition = r0_0.RT_60,
}
r4_0[920171] = {
  TalkTriggerId = 920171,
  TriggerCondition = r0_0.RT_60,
}
r4_0[920172] = {
  TalkTriggerId = 920172,
  TriggerCondition = r0_0.RT_60,
}
r4_0[920173] = {
  TalkTriggerId = 920173,
  TriggerCondition = r0_0.RT_60,
}
r4_0[920174] = {
  TalkTriggerId = 920174,
  TriggerCondition = r0_0.RT_60,
}
r4_0[920175] = {
  TalkTriggerId = 920175,
  TriggerCondition = r0_0.RT_60,
}
r4_0[920176] = {
  TalkTriggerId = 920176,
  TriggerCondition = r0_0.RT_60,
}
r4_0[920177] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/KezhouBaonu.story",
  TalkId = 920177,
  TalkTriggerId = 920177,
}
r4_0[920178] = {
  TalkTriggerId = 920178,
  TriggerCondition = r0_0.RT_60,
}
r4_0[920179] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/BaonuZhangyu.story",
  TalkId = 920179,
  TalkTriggerId = 920179,
}
r4_0[920180] = {
  StoryLinePath = "TalkGossip/EasterEggBubble/BaonuLinen.story",
  TalkId = 920180,
  TalkTriggerId = 920180,
}
r4_0[920181] = {
  TalkTriggerId = 920181,
  TriggerCondition = r0_0.RT_60,
}
r4_0[5100032] = {
  StoryLinePath = "Impression/IceLakeCity/510003_XilinFuren_1_EndTalk.story",
  TalkId = 5100032,
  TalkTriggerId = 5100032,
  TriggerCondition = r0_0.RT_34,
}
r5_0 = 5100042
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510004_Aiersha_EndTalk.story",
  TalkId = 5100042,
  TalkTriggerId = 5100042,
}
r6_0.TriggerCondition = {
  And = {
    {
      QuestFinish = {
        QuestId = 20020300,
      },
    },
    {
      QuestChainUnFinish = {
        QuestChainId = 200203,
      },
    }
  },
}
r4_0[r5_0] = r6_0
r4_0[5100043] = {
  StoryLinePath = "Impression/IceLakeCity/510004_Aiersha_EndTalk2.story",
  TalkId = 5100043,
  TalkTriggerId = 5100043,
  TriggerCondition = r0_0.RT_36,
}
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510007_Alice_EndTalk.story",
  TalkId = 5100072,
  TalkTriggerId = 5100072,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 510007,
  },
}
r4_0[5100072] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510008_Alice_EndTalk_1.story",
  TalkId = 5100082,
  TalkTriggerId = 5100082,
}
r6_0.TriggerCondition = {
  QuestFinish = {
    QuestId = 20020310,
  },
}
r4_0[5100082] = r6_0
r4_0[5100083] = {
  StoryLinePath = "Impression/IceLakeCity/510008_Alice_EndTalk_2.story",
  TalkId = 5100083,
  TalkTriggerId = 5100083,
  TriggerCondition = r0_0.RT_36,
}
r6_0 = {
  TalkId = 5100092,
  TalkTriggerId = 5100092,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 510009,
  },
}
r4_0[5100092] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510010_Jiexika_EndTalk.story",
  TalkId = 5100102,
  TalkTriggerId = 5100102,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 510010,
  },
}
r4_0[5100102] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510012_Kenong_EndTalk.story",
  TalkId = 5100122,
  TalkTriggerId = 5100122,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 510012,
  },
}
r4_0[5100122] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510014_Sangni_EndTalk.story",
  TalkId = 5100142,
  TalkTriggerId = 5100142,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 510014,
  },
}
r4_0[5100142] = r6_0
r6_0 = {
  TalkId = 5100152,
  TalkTriggerId = 5100152,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 510015,
  },
}
r4_0[5100152] = r6_0
r4_0[5100162] = {
  StoryLinePath = "Impression/IceLakeCity/510016_Yagebu_EndTalk.story",
  TalkId = 5100162,
  TalkTriggerId = 5100162,
  TriggerCondition = {
    ImprComp = r0_0.RT_27,
  },
}
r4_0[5100172] = {
  StoryLinePath = "Impression/IceLakeCity/510017_Dadun_EndTalk.story",
  TalkId = 5100172,
  TalkTriggerId = 5100172,
}
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510019_Wells_End.story",
  TalkId = 5100183,
  TalkTriggerId = 5100192,
}
r6_0.TriggerCondition = {
  QuestFinish = {
    QuestId = 20020405,
  },
}
r4_0[5100192] = r6_0
r5_0 = 5100202
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510020_Blue_1_End.story",
  TalkId = 5100193,
  TalkTriggerId = 5100202,
}
r6_0.TriggerCondition = {
  And = {
    {
      ImprUncomp = r0_0.RT_30,
    },
    {
      QuestChainStart = r0_0.RT_37,
    }
  },
}
r4_0[r5_0] = r6_0
r4_0[5100222] = {
  StoryLinePath = "Impression/IceLakeCity/510022_Blue_2_End.story",
  TalkId = 5100194,
  TalkTriggerId = 5100222,
  TriggerCondition = {
    QuestChainFinish = r0_0.RT_37,
  },
}
r4_0[5100232] = {
  StoryLinePath = "Impression/IceLakeCity/510023_Shali_EndTalk.story",
  TalkId = 5100232,
  TalkTriggerId = 5100232,
  TriggerCondition = r0_0.RT_34,
}
r4_0[5100341] = {
  StoryLinePath = "Impression/IceLakeCity/510034_Anuo_EndTalk.story",
  TalkId = 5100341,
  TalkTriggerId = 5100341,
  TriggerCondition = r0_0.RT_39,
}
r4_0[5100342] = {
  StoryLinePath = "Impression/IceLakeCity/510034_Bake_EndTalk.story",
  TalkId = 5100342,
  TalkTriggerId = 5100342,
  TriggerCondition = r0_0.RT_39,
}
r4_0[5100371] = {
  StoryLinePath = "Impression/IceLakeCity/510037_Aima_EndTalk.story",
  TalkId = 5100371,
  TalkTriggerId = 5100371,
  TriggerCondition = r0_0.RT_41,
}
r4_0[5100372] = {
  StoryLinePath = "Impression/IceLakeCity/510037_Beilinda_EndTalk.story",
  TalkId = 5100372,
  TalkTriggerId = 5100372,
  TriggerCondition = r0_0.RT_41,
}
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510041_Faye_EndTalk.story",
  TalkId = 5100411,
  TalkTriggerId = 5100411,
}
r6_0.TriggerCondition = {
  QuestFinish = {
    QuestId = 20021105,
  },
}
r4_0[5100411] = r6_0
r4_0[5100421] = {
  StoryLinePath = "Impression/IceLakeCity/510042_Heerluo_EndTalk.story",
  TalkId = 5100421,
  TalkTriggerId = 5100421,
  TriggerCondition = r0_0.RT_32,
}
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510049_Luna_EndTalk.story",
  TalkId = 5100491,
  TalkTriggerId = 5100491,
}
r6_0.TriggerCondition = {
  QuestFinish = {
    QuestId = 20020901,
  },
}
r4_0[5100491] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510050_Laina_EndTalk.story",
  TalkId = 5100501,
  TalkTriggerId = 5100501,
}
r6_0.TriggerCondition = {
  QuestFinish = {
    QuestId = 20020803,
  },
}
r4_0[5100501] = r6_0
r4_0[5100511] = {
  StoryLinePath = "Impression/IceLakeCity/510051_Maer_EndTalk.story",
  TalkId = 5100511,
  TalkTriggerId = 5100511,
  TriggerCondition = r0_0.RT_43,
}
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510052_Maer_EndTalk.story",
  TalkId = 5100521,
  TalkTriggerId = 5100521,
}
r6_0.TriggerCondition = {
  QuestChainFinish = {
    QuestChainId = 200213,
  },
}
r4_0[5100521] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510053_Makusi_EndTalk.story",
  TalkId = 5100531,
  TalkTriggerId = 5100531,
}
r6_0.TriggerCondition = {
  QuestFinish = {
    QuestId = 20021500,
  },
}
r4_0[5100531] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510055_Makusi_EndTalk.story",
  TalkId = 5100551,
  TalkTriggerId = 5100551,
}
r6_0.TriggerCondition = {
  QuestFinish = {
    QuestId = 20021504,
  },
}
r4_0[5100551] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510059_Sanxiongdi_EndTalk.story",
  TalkId = 510059,
  TalkTriggerId = 5100591,
}
r6_0.TriggerCondition = {
  QuestChainFinish = {
    QuestChainId = 200216,
  },
}
r4_0[5100591] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510067_Waiter_EndTalk.story",
  TalkId = 5100671,
  TalkTriggerId = 5100671,
}
r6_0.TriggerCondition = {
  QuestChainFinish = {
    QuestChainId = 200220,
  },
}
r4_0[5100671] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510068_Nifu_EndTalk.story",
  TalkId = 5100681,
  TalkTriggerId = 5100681,
}
r6_0.TriggerCondition = {
  QuestChainFinish = {
    QuestChainId = 200218,
  },
}
r4_0[5100681] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510071_Jiexi_EndTalk.story",
  TalkId = 5100711,
  TalkTriggerId = 5100711,
}
r6_0.TriggerCondition = {
  QuestChainFinish = {
    QuestChainId = 200219,
  },
}
r4_0[5100711] = r6_0
r5_0 = 5101022
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510102_Liliko_1_EndTalk.story",
  TalkId = 5101022,
  TalkTriggerId = 5101022,
}
r6_0.TriggerCondition = {
  And = {
    r0_0.RT_45,
    {
      QuestChainUnFinish = r0_0.RT_28,
    }
  },
}
r4_0[r5_0] = r6_0
r4_0[5101023] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/510102.story",
  TalkId = 5101023,
  TalkTriggerId = 5101023,
  TriggerCondition = {
    ImprUncomp = r0_0.RT_44,
  },
}
r5_0 = 5101032
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510103_Liliko_2_EndTalk.story",
  TalkId = 5101032,
  TalkTriggerId = 5101032,
}
r6_0.TriggerCondition = {
  And = {
    r0_0.RT_47,
    {
      QuestChainUnFinish = r0_0.RT_48,
    }
  },
}
r4_0[r5_0] = r6_0
r5_0 = 5101033
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/510103.story",
  TalkId = 5101033,
  TalkTriggerId = 5101033,
}
r6_0.TriggerCondition = {
  And = {
    r0_0.RT_45,
    r0_0.RT_29,
    {
      ImprUncomp = r0_0.RT_46,
    }
  },
}
r4_0[r5_0] = r6_0
r4_0[5101042] = {
  StoryLinePath = "Impression/IceLakeCity/510104_Liliko_3_EndTalk.story",
  TalkId = 5101042,
  TalkTriggerId = 5101042,
  TriggerCondition = r0_0.RT_51,
}
r5_0 = 5101043
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/510104.story",
  TalkId = 5101043,
  TalkTriggerId = 5101043,
}
r6_0.TriggerCondition = {
  And = {
    r0_0.RT_47,
    r0_0.RT_49,
    {
      ImprUncomp = r0_0.RT_50,
    }
  },
}
r4_0[r5_0] = r6_0
r4_0[5101044] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/5101044.story",
  TalkId = 5101044,
  TalkTriggerId = 5101044,
  TriggerCondition = r0_0.RT_51,
}
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510105_Kaiwen_EndTalk.story",
  TalkId = 5101052,
  TalkTriggerId = 5101052,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 510105,
  },
}
r4_0[5101052] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510106_Jimu_EndTalk.story",
  TalkId = 5101062,
  TalkTriggerId = 5101062,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 510106,
  },
}
r4_0[5101062] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510107_Beiguanjiaojiao_EndTalk.story",
  TalkId = 5101072,
  TalkTriggerId = 5101072,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 510107,
  },
}
r4_0[5101072] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510108_Daixi_EndTalk.story",
  TalkId = 5101082,
  TalkTriggerId = 5101082,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 510108,
  },
}
r4_0[5101082] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510109_Walun_EndTalk.story",
  TalkId = 5101092,
  TalkTriggerId = 5101092,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 510109,
  },
}
r4_0[5101092] = r6_0
r6_0 = {
  StoryLinePath = "Impression/IceLakeCity/510110_Halan_EndTalk.story",
  TalkId = 5101102,
  TalkTriggerId = 5101102,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 510110,
  },
}
r4_0[5101102] = r6_0
r6_0 = {
  StoryLinePath = "Impression/East01/Gossip/511255_EndTalk.story",
  TalkId = 5112552,
  TalkTriggerId = 5112552,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 511255,
  },
}
r4_0[5112552] = r6_0
r6_0 = {
  StoryLinePath = "Impression/East01/Gossip/511256_EndTalk.story",
  TalkId = 5112562,
  TalkTriggerId = 5112562,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 511256,
  },
}
r4_0[5112562] = r6_0
r6_0 = {
  StoryLinePath = "Impression/East01/Gossip/511257_EndTalk.story",
  TalkId = 5112572,
  TalkTriggerId = 5112572,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 511257,
  },
}
r4_0[5112572] = r6_0
r6_0 = {
  StoryLinePath = "Impression/East01/Gossip/511258_EndTalk.story",
  TalkId = 5112582,
  TalkTriggerId = 5112582,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 511258,
  },
}
r4_0[5112582] = r6_0
r6_0 = {
  StoryLinePath = "Impression/East01/Gossip/511260_EndTalk.story",
  TalkId = 5112602,
  TalkTriggerId = 5112602,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 511260,
  },
}
r4_0[5112602] = r6_0
r6_0 = {
  StoryLinePath = "Impression/East01/Gossip/511261_EndTalk.story",
  TalkId = 5112612,
  TalkTriggerId = 5112612,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 511261,
  },
}
r4_0[5112612] = r6_0
r6_0 = {
  StoryLinePath = "Impression/East01/Gossip/511264_EndTalk.story",
  TalkId = 5112642,
  TalkTriggerId = 5112642,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 511264,
  },
}
r4_0[5112642] = r6_0
r6_0 = {
  StoryLinePath = "Impression/East01/Gossip/511269_EndTalk.story",
  TalkId = 5112692,
  TalkTriggerId = 5112692,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 511269,
  },
}
r4_0[5112692] = r6_0
r6_0 = {
  StoryLinePath = "Impression/East01/Gossip/511270_EndTalk.story",
  TalkId = 5112702,
  TalkTriggerId = 5112702,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 511270,
  },
}
r4_0[5112702] = r6_0
r6_0 = {
  StoryLinePath = "Impression/East01/Gossip/511271_EndTalk.story",
  TalkId = 5112712,
  TalkTriggerId = 5112712,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 511271,
  },
}
r4_0[5112712] = r6_0
r6_0 = {
  StoryLinePath = "Impression/East01/Gossip/511273_EndTalk.story",
  TalkId = 5112732,
  TalkTriggerId = 5112732,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 511273,
  },
}
r4_0[5112732] = r6_0
r6_0 = {
  StoryLinePath = "Impression/East01/Gossip/511275_EndTalk.story",
  TalkId = 5112752,
  TalkTriggerId = 5112752,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 511275,
  },
}
r4_0[5112752] = r6_0
r6_0 = {
  StoryLinePath = "Impression/East01/Gossip/511276_EndTalk.story",
  TalkId = 5112762,
  TalkTriggerId = 5112762,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 511276,
  },
}
r4_0[5112762] = r6_0
r6_0 = {
  StoryLinePath = "Impression/East01/Gossip/511280_EndTalk.story",
  TalkId = 5112802,
  TalkTriggerId = 5112802,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 511280,
  },
}
r4_0[5112802] = r6_0
r6_0 = {
  StoryLinePath = "Impression/East01/Gossip/511282_EndTalk.story",
  TalkId = 5112822,
  TalkTriggerId = 5112822,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 511282,
  },
}
r4_0[5112822] = r6_0
r4_0[7001581] = {
  StoryLinePath = "Observe/East01.story",
  TalkId = 7001581,
  TalkTriggerId = 7001581,
}
r4_0[7001591] = {
  StoryLinePath = "Observe/East01.story",
  TalkId = 7001591,
  TalkTriggerId = 7001591,
}
r4_0[7001621] = {
  StoryLinePath = "Observe/East01.story",
  TalkId = 7001621,
  TalkTriggerId = 7001621,
}
r4_0[7001631] = {
  StoryLinePath = "Observe/East01.story",
  TalkId = 7001631,
  TalkTriggerId = 7001631,
}
r4_0[7001641] = {
  StoryLinePath = "Observe/East01.story",
  TalkId = 7001641,
  TalkTriggerId = 7001641,
}
r4_0[7001651] = {
  StoryLinePath = "Observe/East01.story",
  TalkId = 7001651,
  TalkTriggerId = 7001651,
}
r4_0[7001661] = {
  StoryLinePath = "Observe/East01.story",
  TalkId = 7001661,
  TalkTriggerId = 7001661,
}
r4_0[7001671] = {
  StoryLinePath = "Observe/East01.story",
  TalkId = 7001671,
  TalkTriggerId = 7001671,
}
r4_0[7001681] = {
  StoryLinePath = "Observe/East01.story",
  TalkId = 7001681,
  TalkTriggerId = 7001681,
}
r4_0[7001691] = {
  StoryLinePath = "Observe/East01.story",
  TalkId = 7001691,
  TalkTriggerId = 7001691,
}
r4_0[7001701] = {
  StoryLinePath = "Observe/East01.story",
  TalkId = 7001701,
  TalkTriggerId = 7001701,
}
r4_0[7001711] = {
  StoryLinePath = "Observe/East01.story",
  TalkId = 7001711,
  TalkTriggerId = 7001711,
}
r4_0[7001721] = {
  StoryLinePath = "Observe/East01.story",
  TalkId = 7001721,
  TalkTriggerId = 7001721,
}
r4_0[7001731] = {
  StoryLinePath = "Observe/East01.story",
  TalkId = 7001731,
  TalkTriggerId = 7001731,
}
r4_0[7001741] = {
  StoryLinePath = "Observe/East01.story",
  TalkId = 7001741,
  TalkTriggerId = 7001741,
}
r4_0[7001751] = {
  StoryLinePath = "Observe/East01.story",
  TalkId = 7001751,
  TalkTriggerId = 7001751,
}
r4_0[8200011] = {
  StoryLinePath = "Explore/Laser.story",
  TalkId = 8200011,
  TalkTriggerId = 8200011,
  Type = "Impression",
}
r5_0 = 8200012
r6_0 = {
  StoryLinePath = "Explore/Laser.story",
  TalkId = 8200012,
  TalkTriggerId = 8200012,
}
r6_0.TriggerCondition = {
  And = {
    {
      ImprComp = {
        TalkTriggerId = 8200011,
      },
    },
    r0_0.RT_55
  },
}
r4_0[r5_0] = r6_0
r4_0[8200013] = {
  StoryLinePath = "Explore/Laser.story",
  TalkId = 8200013,
  TalkTriggerId = 8200013,
}
r4_0[8200014] = {
  StoryLinePath = "Explore/Laser.story",
  TalkId = 8200014,
  TalkTriggerId = 8200014,
}
r4_0[8200021] = {
  StoryLinePath = "Explore/Laser.story",
  TalkId = 8200021,
  TalkTriggerId = 8200021,
  TriggerCondition = r0_0.RT_56,
  Type = "Impression",
}
r5_0 = 8200022
r6_0 = {
  StoryLinePath = "Explore/Laser.story",
  TalkId = 8200022,
  TalkTriggerId = 8200022,
}
r6_0.TriggerCondition = {
  And = {
    {
      ImprComp = {
        TalkTriggerId = 8200021,
      },
    },
    r0_0.RT_56,
    {
      ExploreGroupInActive = r0_0.RT_57,
    }
  },
}
r4_0[r5_0] = r6_0
r4_0[8200023] = {
  StoryLinePath = "Explore/Laser.story",
  TalkId = 8200023,
  TalkTriggerId = 8200023,
}
r4_0[8200024] = {
  StoryLinePath = "Explore/Laser.story",
  TalkId = 8200024,
  TalkTriggerId = 8200024,
}
r4_0[8200031] = {
  StoryLinePath = "Explore/Laser.story",
  TalkId = 8200031,
  TalkTriggerId = 8200031,
  TriggerCondition = r0_0.RT_58,
  Type = "Impression",
}
r5_0 = 8200032
r6_0 = {
  StoryLinePath = "Explore/Laser.story",
  TalkId = 8200032,
  TalkTriggerId = 8200032,
}
r6_0.TriggerCondition = {
  And = {
    {
      ImprComp = {
        TalkTriggerId = 8200031,
      },
    },
    r0_0.RT_58,
    {
      ExploreGroupInActive = {
        ExploreGroupId = 7013100,
      },
    }
  },
}
r4_0[r5_0] = r6_0
r4_0[8200033] = {
  StoryLinePath = "Explore/Laser.story",
  TalkId = 8200033,
  TalkTriggerId = 8200033,
  Type = "Impression",
}
r4_0[8200034] = {
  StoryLinePath = "Explore/Laser.story",
  TalkId = 8200034,
  TalkTriggerId = 8200034,
}
r5_0 = 8200042
r6_0 = {
  StoryLinePath = "Explore/Laser.story",
  TalkId = 8200042,
  TalkTriggerId = 8200042,
}
r6_0.TriggerCondition = {
  And = {
    {
      ImprComp = {
        TalkTriggerId = 8200033,
      },
    },
    r0_0.RT_55
  },
}
r4_0[r5_0] = r6_0
r4_0[9022011] = {
  StoryLinePath = "TalkGossip/902201_Dafu_B4Ex01.story",
  TalkId = 9022011,
  TalkTriggerId = 9022011,
  TriggerCondition = {
    QuestChainUnFinish = r0_0.RT_61,
  },
}
r4_0[9022012] = {
  StoryLinePath = "TalkGossip/902201_Dafu_AFTEx01.story",
  TalkId = 9022012,
  TalkTriggerId = 9022012,
  TriggerCondition = {
    QuestChainFinish = r0_0.RT_61,
  },
}
r4_0[9023011] = {
  StoryLinePath = "TalkGossip/902301_Tuosi_B4Ch02.story",
  TalkId = 9023011,
  TalkTriggerId = 9023011,
  TriggerCondition = r0_0.RT_63,
}
r4_0[9023012] = {
  StoryLinePath = "TalkGossip/902301_Tuosi_AFTCh02.story",
  TalkId = 9023012,
  TalkTriggerId = 9023012,
  TriggerCondition = r0_0.RT_64,
}
r4_0[9024011] = {
  StoryLinePath = "TalkGossip/902401_Lise_B4Ch02.story",
  TalkId = 9024011,
  TalkTriggerId = 9024011,
  TriggerCondition = r0_0.RT_63,
}
r4_0[9024012] = {
  StoryLinePath = "TalkGossip/902401_Lise_AFTCh02.story",
  TalkId = 9024012,
  TalkTriggerId = 9024012,
  TriggerCondition = r0_0.RT_64,
}
r4_0[10010104] = {
  StoryLinePath = "Common/10010104.story",
  TalkId = 10010104,
  TalkTriggerId = 10010104,
}
r4_0[10032501] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/10032501.story",
  TalkId = 10032501,
  TalkTriggerId = 10032501,
}
r4_0[10032601] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/10032601.story",
  TalkId = 10032601,
  TalkTriggerId = 10032601,
}
r4_0[10032701] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/10032701.story",
  TalkId = 10032701,
  TalkTriggerId = 10032701,
}
r4_0[10032801] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/10032801.story",
  TalkId = 10032801,
  TalkTriggerId = 10032801,
}
r4_0[10032901] = {
  StoryLinePath = "Impression/IceLakeCity/Gossip/10032901.story",
  TalkId = 10032901,
  TalkTriggerId = 10032901,
}
r4_0[10122401] = {
  DialogueId = 10122401,
  TalkTriggerId = 10122401,
  TalkType = "Guide",
}
r4_0[10122402] = {
  DialogueId = 10122402,
  TalkTriggerId = 10122402,
  TalkType = "Guide",
}
r4_0[10122701] = {
  DialogueId = 10122701,
  TalkTriggerId = 10122701,
  TalkType = "Guide",
}
r6_0 = {
  StoryLinePath = "Impression/East01/701015_Yang_3",
  TalkId = 51013201,
  TalkTriggerId = 51013201,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 510132,
  },
}
r6_0.Type = "Impression"
r4_0[51013201] = r6_0
r4_0[51013601] = {
  StoryLinePath = "Impression/East01/701024_QingQing_2",
  TalkId = 51013601,
  TalkTriggerId = 51013601,
  Type = "Impression",
}
r6_0 = {
  StoryLinePath = "Impression/East01/701024_QingQing_3",
  TalkId = 51013602,
  TalkTriggerId = 51013602,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 51013601,
  },
}
r6_0.Type = "Impression"
r4_0[51013602] = r6_0
r6_0 = {
  StoryLinePath = "Impression/East01/701026_QuanDoutong_2",
  TalkId = 51013701,
  TalkTriggerId = 51013701,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 510137,
  },
}
r4_0[51013701] = r6_0
r6_0 = {
  StoryLinePath = "Impression/East01/701027_DrHuang_2",
  TalkId = 51013801,
  TalkTriggerId = 51013801,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 510138,
  },
}
r4_0[51013801] = r6_0
r6_0 = {
  StoryLinePath = "Impression/East01/701031_JiuPiaoZi_2",
  TalkId = 51014001,
  TalkTriggerId = 51014001,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 510140,
  },
}
r4_0[51014001] = r6_0
r6_0 = {
  StoryLinePath = "Impression/East01/701032_FengDeng_2",
  TalkId = 51014101,
  TalkTriggerId = 51014101,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 510141,
  },
}
r4_0[51014101] = r6_0
r6_0 = {
  StoryLinePath = "Impression/East01/701033_MysteryWhite_2",
  TalkId = 51014201,
  TalkTriggerId = 51014201,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 510142,
  },
}
r4_0[51014201] = r6_0
r4_0[51105801] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105801.story",
  TalkId = 51105801,
  TalkTriggerId = 51105801,
}
r4_0[51105802] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105802.story",
  TalkId = 51105802,
  TalkTriggerId = 51105802,
}
r4_0[51105803] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105803.story",
  TalkId = 51105803,
  TalkTriggerId = 51105803,
}
r4_0[51105804] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105804.story",
  TalkId = 51105804,
  TalkTriggerId = 51105804,
}
r4_0[51105805] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105805.story",
  TalkId = 51105805,
  TalkTriggerId = 51105805,
}
r4_0[51105806] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105806.story",
  TalkId = 51105806,
  TalkTriggerId = 51105806,
}
r4_0[51105807] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105807.story",
  TalkId = 51105807,
  TalkTriggerId = 51105807,
}
r4_0[51105808] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105808.story",
  TalkId = 51105808,
  TalkTriggerId = 51105808,
}
r4_0[51105809] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105809.story",
  TalkId = 51105809,
  TalkTriggerId = 51105809,
}
r4_0[51105810] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105810.story",
  TalkId = 51105810,
  TalkTriggerId = 51105810,
}
r4_0[51105811] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105811.story",
  TalkId = 51105811,
  TalkTriggerId = 51105811,
}
r4_0[51105812] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105812.story",
  TalkId = 51105812,
  TalkTriggerId = 51105812,
}
r4_0[51105813] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105813.story",
  TalkId = 51105813,
  TalkTriggerId = 51105813,
}
r4_0[51105814] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105814.story",
  TalkId = 51105814,
  TalkTriggerId = 51105814,
}
r4_0[51105815] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105815.story",
  TalkId = 51105815,
  TalkTriggerId = 51105815,
}
r4_0[51105816] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105816.story",
  TalkId = 51105816,
  TalkTriggerId = 51105816,
}
r4_0[51105817] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105817.story",
  TalkId = 51105817,
  TalkTriggerId = 51105817,
}
r4_0[51105818] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105818.story",
  TalkId = 51105818,
  TalkTriggerId = 51105818,
}
r4_0[51105819] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105819.story",
  TalkId = 51105819,
  TalkTriggerId = 51105819,
}
r4_0[51105820] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105820.story",
  TalkId = 51105820,
  TalkTriggerId = 51105820,
}
r4_0[51105821] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105821.story",
  TalkId = 51105821,
  TalkTriggerId = 51105821,
}
r4_0[51105822] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105822.story",
  TalkId = 51105822,
  TalkTriggerId = 51105822,
}
r4_0[51105823] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105823.story",
  TalkId = 51105823,
  TalkTriggerId = 51105823,
}
r4_0[51105824] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105824.story",
  TalkId = 51105824,
  TalkTriggerId = 51105824,
}
r4_0[51105825] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105825.story",
  TalkId = 51105825,
  TalkTriggerId = 51105825,
}
r4_0[51105826] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105826.story",
  TalkId = 51105826,
  TalkTriggerId = 51105826,
}
r4_0[51105827] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105827.story",
  TalkId = 51105827,
  TalkTriggerId = 51105827,
}
r4_0[51105828] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105828.story",
  TalkId = 51105828,
  TalkTriggerId = 51105828,
}
r4_0[51105829] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105829.story",
  TalkId = 51105829,
  TalkTriggerId = 51105829,
}
r4_0[51105830] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105830.story",
  TalkId = 51105830,
  TalkTriggerId = 51105830,
}
r4_0[51105831] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105831.story",
  TalkId = 51105831,
  TalkTriggerId = 51105831,
}
r4_0[51105832] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105832.story",
  TalkId = 51105832,
  TalkTriggerId = 51105832,
}
r4_0[51105833] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105833.story",
  TalkId = 51105833,
  TalkTriggerId = 51105833,
}
r4_0[51105834] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105834.story",
  TalkId = 51105834,
  TalkTriggerId = 51105834,
}
r4_0[51105835] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105835.story",
  TalkId = 51105835,
  TalkTriggerId = 51105835,
}
r4_0[51105836] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105836.story",
  TalkId = 51105836,
  TalkTriggerId = 51105836,
}
r4_0[51105837] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105837.story",
  TalkId = 51105837,
  TalkTriggerId = 51105837,
}
r4_0[51105838] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105838.story",
  TalkId = 51105838,
  TalkTriggerId = 51105838,
}
r4_0[51105839] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105839.story",
  TalkId = 51105839,
  TalkTriggerId = 51105839,
}
r4_0[51105840] = {
  StoryLinePath = "ActiveQuest/ActiveThea/Gossip/51105840.story",
  TalkId = 51105840,
  TalkTriggerId = 51105840,
}
r4_0[74114700] = {
  StoryLinePath = "QuestTest/FacialTest.story",
  TalkTriggerId = 74114700,
}
r4_0[74114701] = {
  StoryLinePath = "QuestTest/74114701.story",
  TalkTriggerId = 74114701,
}
r4_0[74114702] = {
  StoryLinePath = "QuestTest/74114702.story",
  TalkTriggerId = 74114702,
}
r4_0[74114703] = {
  StoryLinePath = "QuestTest/74114703.story",
  TalkTriggerId = 74114703,
}
r4_0[74114704] = {
  StoryLinePath = "QuestTest/74114704.story",
  TalkTriggerId = 74114704,
}
r4_0[74114705] = {
  StoryLinePath = "QuestTest/74114705.story",
  TalkTriggerId = 74114705,
}
r4_0[74114706] = {
  StoryLinePath = "QuestTest/74114706.story",
  TalkTriggerId = 74114706,
}
r4_0[74114707] = {
  StoryLinePath = "QuestTest/74114707.story",
  TalkTriggerId = 74114707,
}
r4_0[74114708] = {
  StoryLinePath = "QuestTest/74114708.story",
  TalkTriggerId = 74114708,
}
r4_0[74114709] = {
  StoryLinePath = "QuestTest/74114709.story",
  TalkTriggerId = 74114709,
}
r4_0[74114710] = {
  StoryLinePath = "QuestTest/74114710.story",
  TalkTriggerId = 74114710,
}
r4_0[74114711] = {
  StoryLinePath = "QuestTest/74114711.story",
  TalkTriggerId = 74114711,
}
r4_0[74114712] = {
  StoryLinePath = "QuestTest/74114712.story",
  TalkTriggerId = 74114712,
}
r4_0[74114713] = {
  StoryLinePath = "QuestTest/74114713.story",
  TalkTriggerId = 74114713,
}
r4_0[74114714] = {
  StoryLinePath = "QuestTest/74114714.story",
  TalkTriggerId = 74114714,
}
r4_0[74114715] = {
  StoryLinePath = "QuestTest/74114715.story",
  TalkTriggerId = 74114715,
}
r4_0[74114716] = {
  StoryLinePath = "QuestTest/74114716.story",
  TalkTriggerId = 74114716,
}
r4_0[74114717] = {
  StoryLinePath = "QuestTest/74114717.story",
  TalkTriggerId = 74114717,
}
r4_0[74114718] = {
  StoryLinePath = "QuestTest/74114718.story",
  TalkTriggerId = 74114718,
}
r4_0[74114719] = {
  StoryLinePath = "QuestTest/74114719.story",
  TalkTriggerId = 74114719,
}
r4_0[74114720] = {
  StoryLinePath = "QuestTest/74114720.story",
  TalkTriggerId = 74114720,
}
r4_0[74114721] = {
  StoryLinePath = "QuestTest/74114721.story",
  TalkTriggerId = 74114721,
}
r4_0[74114722] = {
  StoryLinePath = "QuestTest/74114722.story",
  TalkTriggerId = 74114722,
}
r4_0[74114723] = {
  StoryLinePath = "QuestTest/74114723.story",
  TalkTriggerId = 74114723,
}
r4_0[74114724] = {
  StoryLinePath = "QuestTest/74114724.story",
  TalkTriggerId = 74114724,
}
r4_0[74114725] = {
  StoryLinePath = "QuestTest/74114725.story",
  TalkTriggerId = 74114725,
}
r4_0[74114726] = {
  StoryLinePath = "QuestTest/74114726.story",
  TalkTriggerId = 74114726,
}
r4_0[74114727] = {
  StoryLinePath = "QuestTest/74114727.story",
  TalkTriggerId = 74114727,
}
r4_0[74114728] = {
  StoryLinePath = "QuestTest/74114728.story",
  TalkTriggerId = 74114728,
}
r4_0[74114729] = {
  StoryLinePath = "QuestTest/74114729.story",
  TalkTriggerId = 74114729,
  Type = "Impression",
}
r4_0[74114730] = {
  StoryLinePath = "QuestTest/74114730.story",
  TalkTriggerId = 74114730,
  Type = "Impression",
}
r4_0[74114731] = {
  StoryLinePath = "QuestTest/74114731.story",
  TalkTriggerId = 74114731,
}
r4_0[74114732] = {
  StoryLinePath = "QuestTest/74114732.story",
  TalkTriggerId = 74114732,
}
r4_0[74114733] = {
  StoryLinePath = "QuestTest/74114733.story",
  TalkTriggerId = 74114733,
}
r4_0[74114734] = {
  StoryLinePath = "QuestTest/74114734.story",
  TalkTriggerId = 74114734,
}
r4_0[74114735] = {
  StoryLinePath = "QuestTest/74114735.story",
  TalkTriggerId = 74114735,
}
r4_0[74114736] = {
  StoryLinePath = "QuestTest/74114736.story",
  TalkTriggerId = 74114736,
}
r4_0[74114737] = {
  StoryLinePath = "QuestTest/74114737.story",
  TalkTriggerId = 74114737,
}
r4_0[74114738] = {
  StoryLinePath = "QuestTest/74114738.story",
  TalkTriggerId = 74114738,
}
r4_0[74114739] = {
  StoryLinePath = "QuestTest/74114739.story",
  TalkTriggerId = 74114739,
}
r4_0[74114740] = {
  StoryLinePath = "QuestTest/74114740.story",
  TalkTriggerId = 74114740,
}
r4_0[74114741] = {
  StoryLinePath = "QuestTest/74114741.story",
  TalkTriggerId = 74114741,
}
r4_0[74114742] = {
  StoryLinePath = "QuestTest/74114742.story",
  TalkTriggerId = 74114742,
}
r4_0[74114743] = {
  StoryLinePath = "QuestTest/74114743.story",
  TalkTriggerId = 74114743,
}
r4_0[74114744] = {
  StoryLinePath = "QuestTest/74114744.story",
  TalkTriggerId = 74114744,
}
r4_0[75000002] = {
  StoryLinePath = "QuestTest/75000002.story",
  TalkTriggerId = 75000002,
}
r4_0[76000014] = {
  StoryLinePath = "QuestTest/FacialTest_LNM.story",
  TalkTriggerId = 76000014,
}
r4_0[76000015] = {
  StoryLinePath = "QuestTest/FacialTest_LNF.story",
  TalkTriggerId = 76000015,
}
r4_0[76000016] = {
  StoryLinePath = "QuestTest/FacialTest_ZNM.story",
  TalkTriggerId = 76000016,
}
r4_0[76000017] = {
  StoryLinePath = "QuestTest/FacialTest_ZNF.story",
  TalkTriggerId = 76000017,
}
r4_0[76000018] = {
  StoryLinePath = "QuestTest/FacialTest_QNM.story",
  TalkTriggerId = 76000018,
}
r4_0[76000019] = {
  StoryLinePath = "QuestTest/FacialTest_QNF.story",
  TalkTriggerId = 76000019,
}
r4_0[76000020] = {
  StoryLinePath = "QuestTest/FacialTest_YN.story",
  TalkTriggerId = 76000020,
}
r4_0[80001001] = {
  StoryLinePath = "Dungeon\\EventFeina\\EventFeina_01_Intro.story",
  TalkId = 80001001,
  TalkTriggerId = 80001001,
}
r4_0[80001004] = {
  DialogueId = 80001004,
  TalkTriggerId = 80001004,
  TalkType = "Guide",
}
r4_0[80001005] = {
  StoryLinePath = "Dungeon\\EventFeina\\EventFeina_Guide_01.story",
  TalkId = 80001005,
  TalkTriggerId = 80001005,
}
r4_0[80001007] = {
  DialogueId = 80001007,
  TalkTriggerId = 80001007,
  TalkType = "Guide",
}
r4_0[80001008] = {
  StoryLinePath = "Dungeon\\EventFeina\\EventFeina_Guide_02.story",
  TalkId = 80001008,
  TalkTriggerId = 80001008,
}
r4_0[80001010] = {
  DialogueId = 80001010,
  TalkTriggerId = 80001010,
  TalkType = "Guide",
}
r4_0[80001011] = {
  DialogueId = 80001011,
  TalkTriggerId = 80001011,
  TalkType = "Guide",
}
r4_0[80001012] = {
  DialogueId = 80001012,
  TalkTriggerId = 80001012,
  TalkType = "Guide",
}
r4_0[80001013] = {
  DialogueId = 80001013,
  TalkTriggerId = 80001013,
  TalkType = "Guide",
}
r4_0[80001014] = {
  DialogueId = 80001014,
  TalkTriggerId = 80001014,
  TalkType = "Guide",
}
r4_0[80001015] = {
  DialogueId = 80001015,
  TalkTriggerId = 80001015,
  TalkType = "Guide",
}
r4_0[80001017] = {
  DialogueId = 80001017,
  TalkTriggerId = 80001017,
  TalkType = "Guide",
}
r4_0[80001018] = {
  DialogueId = 80001018,
  TalkTriggerId = 80001018,
  TalkType = "Guide",
}
r4_0[80001019] = {
  DialogueId = 80001019,
  TalkTriggerId = 80001019,
  TalkType = "Guide",
}
r4_0[80001021] = {
  DialogueId = 80001021,
  TalkTriggerId = 80001021,
  TalkType = "Guide",
}
r4_0[80001022] = {
  StoryLinePath = "Dungeon\\EventFeina\\EventFeina_01_Aote.story",
  TalkTriggerId = 80001022,
}
r4_0[80001024] = {
  StoryLinePath = "Dungeon\\EventFeina\\EventFeina_01_Feather.story",
  TalkId = 80001024,
  TalkTriggerId = 80001024,
}
r4_0[80002001] = {
  DialogueId = 80002001,
  TalkTriggerId = 80002001,
  TalkType = "Guide",
}
r4_0[80002003] = {
  DialogueId = 80002003,
  TalkTriggerId = 80002003,
  TalkType = "Guide",
}
r4_0[80002004] = {
  DialogueId = 80002004,
  TalkTriggerId = 80002004,
  TalkType = "Guide",
}
r4_0[80002005] = {
  DialogueId = 80002005,
  TalkTriggerId = 80002005,
  TalkType = "Guide",
}
r4_0[80002006] = {
  DialogueId = 80002006,
  TalkTriggerId = 80002006,
  TalkType = "Guide",
}
r4_0[80002007] = {
  DialogueId = 80002007,
  TalkTriggerId = 80002007,
  TalkType = "Guide",
}
r4_0[80002008] = {
  DialogueId = 80002008,
  TalkTriggerId = 80002008,
  TalkType = "Guide",
}
r4_0[80002009] = {
  DialogueId = 80002009,
  TalkTriggerId = 80002009,
  TalkType = "Guide",
}
r4_0[80002010] = {
  DialogueId = 80002010,
  TalkTriggerId = 80002010,
  TalkType = "Guide",
}
r4_0[80002012] = {
  DialogueId = 80002012,
  TalkTriggerId = 80002012,
  TalkType = "Guide",
}
r4_0[80002013] = {
  DialogueId = 80002013,
  TalkTriggerId = 80002013,
  TalkType = "Guide",
}
r4_0[80002014] = {
  StoryLinePath = "Dungeon\\EventFeina\\EventFeina_02_Unicorn.story",
  TalkTriggerId = 80002014,
}
r4_0[80002016] = {
  DialogueId = 80002016,
  TalkTriggerId = 80002016,
  TalkType = "Guide",
}
r4_0[80002017] = {
  DialogueId = 80002017,
  TalkTriggerId = 80002017,
  TalkType = "Guide",
}
r4_0[80002018] = {
  DialogueId = 80002018,
  TalkTriggerId = 80002018,
  TalkType = "Guide",
}
r4_0[80002019] = {
  DialogueId = 80002019,
  TalkTriggerId = 80002019,
  TalkType = "Guide",
}
r4_0[80002020] = {
  DialogueId = 80002020,
  TalkTriggerId = 80002020,
  TalkType = "Guide",
}
r4_0[80002021] = {
  DialogueId = 80002021,
  TalkTriggerId = 80002021,
  TalkType = "Guide",
}
r4_0[80002022] = {
  DialogueId = 80002022,
  TalkTriggerId = 80002022,
  TalkType = "Guide",
}
r4_0[80002023] = {
  DialogueId = 80002023,
  TalkTriggerId = 80002023,
  TalkType = "Guide",
}
r4_0[80002024] = {
  DialogueId = 80002024,
  TalkTriggerId = 80002024,
  TalkType = "Guide",
}
r4_0[80002025] = {
  DialogueId = 80002025,
  TalkTriggerId = 80002025,
  TalkType = "Guide",
}
r4_0[80002027] = {
  DialogueId = 80002027,
  TalkTriggerId = 80002027,
  TalkType = "Guide",
}
r4_0[80002029] = {
  StoryLinePath = "Dungeon\\EventFeina\\EventFeina_02_Feather.story",
  TalkTriggerId = 80002029,
}
r4_0[80003100] = {
  StoryLinePath = "Dungeon\\EventFeina\\EventFeina_031_Init.story",
  TalkTriggerId = 80003100,
}
r4_0[80003101] = {
  DialogueId = 80003101,
  TalkTriggerId = 80003101,
  TalkType = "Guide",
}
r4_0[80003102] = {
  DialogueId = 80003102,
  TalkTriggerId = 80003102,
  TalkType = "Guide",
}
r4_0[80003103] = {
  DialogueId = 80003103,
  TalkTriggerId = 80003103,
  TalkType = "Guide",
}
r4_0[80003104] = {
  DialogueId = 80003104,
  TalkTriggerId = 80003104,
  TalkType = "Guide",
}
r4_0[80003105] = {
  StoryLinePath = "Dungeon\\EventFeina\\EventFeina_Guide_04.story",
  TalkTriggerId = 80003105,
}
r4_0[80003106] = {
  DialogueId = 80003106,
  TalkTriggerId = 80003106,
  TalkType = "Guide",
}
r4_0[80003107] = {
  DialogueId = 80003107,
  TalkTriggerId = 80003107,
  TalkType = "Guide",
}
r4_0[80003108] = {
  DialogueId = 80003108,
  TalkTriggerId = 80003108,
  TalkType = "Guide",
}
r4_0[80003109] = {
  DialogueId = 80003109,
  TalkTriggerId = 80003109,
  TalkType = "Guide",
}
r4_0[80003110] = {
  DialogueId = 80003110,
  TalkTriggerId = 80003110,
  TalkType = "Guide",
}
r4_0[80003111] = {
  StoryLinePath = "Dungeon\\EventFeina\\EventFeina_Guide_06.story",
  TalkTriggerId = 80003111,
}
r4_0[80003112] = {
  DialogueId = 80003112,
  TalkTriggerId = 80003112,
  TalkType = "Guide",
}
r4_0[80003113] = {
  DialogueId = 80003113,
  TalkTriggerId = 80003113,
  TalkType = "Guide",
}
r4_0[80003114] = {
  DialogueId = 80003114,
  TalkTriggerId = 80003114,
  TalkType = "Guide",
}
r4_0[80003115] = {
  DialogueId = 80003115,
  TalkTriggerId = 80003115,
  TalkType = "Guide",
}
r4_0[80003116] = {
  StoryLinePath = "Dungeon\\EventFeina\\EventFeina_031_Boat.story",
  TalkTriggerId = 80003116,
}
r4_0[80003117] = {
  StoryLinePath = "Dungeon\\EventFeina\\EventFeina_031_Feather.story",
  TalkTriggerId = 80003117,
}
r4_0[80003200] = {
  StoryLinePath = "Dungeon\\EventFeina\\EventFeina_032_InitBoat.story",
  TalkTriggerId = 80003200,
}
r4_0[80003201] = {
  DialogueId = 80003201,
  TalkTriggerId = 80003201,
  TalkType = "Guide",
}
r4_0[80003202] = {
  DialogueId = 80003202,
  TalkTriggerId = 80003202,
  TalkType = "Guide",
}
r4_0[80003203] = {
  DialogueId = 80003203,
  TalkTriggerId = 80003203,
  TalkType = "Guide",
}
r4_0[80003204] = {
  DialogueId = 80003204,
  TalkTriggerId = 80003204,
  TalkType = "Guide",
}
r4_0[80003205] = {
  DialogueId = 80003205,
  TalkTriggerId = 80003205,
  TalkType = "Guide",
}
r4_0[80003206] = {
  DialogueId = 80003206,
  TalkTriggerId = 80003206,
  TalkType = "Guide",
}
r4_0[80003207] = {
  DialogueId = 80003207,
  TalkTriggerId = 80003207,
  TalkType = "Guide",
}
r4_0[80003208] = {
  DialogueId = 80003208,
  TalkTriggerId = 80003208,
  TalkType = "Guide",
}
r4_0[80003209] = {
  DialogueId = 80003209,
  TalkTriggerId = 80003209,
  TalkType = "Guide",
}
r4_0[80003210] = {
  StoryLinePath = "Dungeon\\EventFeina\\EventFeina_032_Hehua.story",
  TalkTriggerId = 80003210,
}
r4_0[80003211] = {
  StoryLinePath = "Dungeon\\EventFeina\\EventFeina_032_Tengman.story",
  TalkTriggerId = 80003211,
}
r4_0[80003212] = {
  StoryLinePath = "Dungeon\\EventFeina\\EventFeina_032_Boat.story",
  TalkTriggerId = 80003212,
}
r4_0[80003213] = {
  StoryLinePath = "Dungeon\\EventFeina\\EventFeina_032_Shizhu.story",
  TalkTriggerId = 80003213,
}
r4_0[80003214] = {
  StoryLinePath = "Dungeon\\EventFeina\\EventFeina_032_Feather.story",
  TalkTriggerId = 80003214,
}
r4_0[80004101] = {
  DialogueId = 80004101,
  TalkTriggerId = 80004101,
  TalkType = "Guide",
}
r4_0[80004102] = {
  DialogueId = 80004102,
  TalkTriggerId = 80004102,
  TalkType = "Guide",
}
r4_0[80004103] = {
  StoryLinePath = "Dungeon\\EventFeina\\EventFeina_Guide_07.story",
  TalkId = 80004103,
  TalkTriggerId = 80004103,
}
r4_0[80004104] = {
  DialogueId = 80004104,
  TalkTriggerId = 80004104,
  TalkType = "Guide",
}
r4_0[80004105] = {
  DialogueId = 80004105,
  TalkTriggerId = 80004105,
  TalkType = "Guide",
}
r4_0[80004106] = {
  DialogueId = 80004106,
  TalkTriggerId = 80004106,
  TalkType = "Guide",
}
r4_0[80004107] = {
  DialogueId = 80004107,
  TalkTriggerId = 80004107,
  TalkType = "Guide",
}
r4_0[80004108] = {
  DialogueId = 80004108,
  TalkTriggerId = 80004108,
  TalkType = "Guide",
}
r4_0[80004109] = {
  StoryLinePath = "Dungeon\\EventFeina\\EventFeina_Guide_08.story",
  TalkId = 80004109,
  TalkTriggerId = 80004109,
}
r4_0[80004110] = {
  StoryLinePath = "Dungeon\\EventFeina\\EventFeina_041_Feather.story",
  TalkTriggerId = 80004110,
}
r4_0[80004201] = {
  DialogueId = 80004201,
  TalkTriggerId = 80004201,
  TalkType = "Guide",
}
r4_0[80004202] = {
  DialogueId = 80004202,
  TalkTriggerId = 80004202,
  TalkType = "Guide",
}
r4_0[80004203] = {
  DialogueId = 80004203,
  TalkTriggerId = 80004203,
  TalkType = "Guide",
}
r4_0[80004204] = {
  DialogueId = 80004204,
  TalkTriggerId = 80004204,
  TalkType = "Guide",
}
r4_0[80004205] = {
  DialogueId = 80004205,
  TalkTriggerId = 80004205,
  TalkType = "Guide",
}
r4_0[80004206] = {
  DialogueId = 80004206,
  TalkTriggerId = 80004206,
  TalkType = "Guide",
}
r4_0[80004207] = {
  DialogueId = 80004207,
  TalkTriggerId = 80004207,
  TalkType = "Guide",
}
r4_0[80004208] = {
  DialogueId = 80004208,
  TalkTriggerId = 80004208,
  TalkType = "Guide",
}
r4_0[80004209] = {
  DialogueId = 80004209,
  TalkTriggerId = 80004209,
  TalkType = "Guide",
}
r4_0[80004210] = {
  StoryLinePath = "Dungeon\\EventFeina\\EventFeina_042_Zhanzhuang.story",
  TalkId = 80004210,
  TalkTriggerId = 80004210,
}
r4_0[80004211] = {
  StoryLinePath = "Dungeon\\EventFeina\\EventFeina_042_Zhanzhuang.story",
  TalkId = 80004211,
  TalkTriggerId = 80004211,
}
r4_0[80004212] = {
  StoryLinePath = "Dungeon\\EventFeina\\EventFeina_042_Zhanzhuang.story",
  TalkId = 80004212,
  TalkTriggerId = 80004212,
}
r4_0[80004213] = {
  StoryLinePath = "Dungeon\\EventFeina\\EventFeina_042_End.story",
  TalkTriggerId = 80004213,
}
r4_0[80004214] = {
  StoryLinePath = "Dungeon\\EventFeina\\EventFeina_042_Feather.story",
  TalkTriggerId = 80004214,
}
r4_0[80004250] = {
  DialogueId = 80004250,
  TalkTriggerId = 80004250,
  TalkType = "Guide",
}
r4_0[80004251] = {
  DialogueId = 80004251,
  TalkTriggerId = 80004251,
  TalkType = "Guide",
}
r4_0[80004252] = {
  DialogueId = 80004252,
  TalkTriggerId = 80004252,
  TalkType = "Guide",
}
r4_0[80004253] = {
  DialogueId = 80004253,
  TalkTriggerId = 80004253,
  TalkType = "Guide",
}
r4_0[80004254] = {
  StoryLinePath = "Dungeon\\EventFeina\\EventFeina_Guide_05.story",
  TalkTriggerId = 80004254,
}
r4_0[80004255] = {
  StoryLinePath = "Dungeon\\EventFeina\\EventFeina_Guide_09.story",
  TalkTriggerId = 80004255,
}
r4_0[80004256] = {
  StoryLinePath = "Dungeon\\EventFeina\\EventFeina_Guide_10.story",
  TalkTriggerId = 80004256,
}
r4_0[80004257] = {
  StoryLinePath = "Dungeon\\EventFeina\\EventFeina_Guide_11.story",
  TalkTriggerId = 80004257,
}
r4_0[80004258] = {
  StoryLinePath = "Dungeon\\EventFeina\\EventFeina_Guide_12.story",
  TalkTriggerId = 80004258,
}
r4_0[80004259] = {
  StoryLinePath = "Dungeon\\EventFeina\\EventFeina_Guide_03.story",
  TalkTriggerId = 80004259,
}
r6_0 = {
  StoryLinePath = "Explore/Home_Cat.story",
  TalkId = 88888801,
  TalkTriggerId = 88888801,
}
r6_0.TriggerCondition = {
  ImprComp = {
    TalkTriggerId = 510122,
  },
}
r4_0[88888801] = r6_0
return r2_0(r3_0, r4_0)
