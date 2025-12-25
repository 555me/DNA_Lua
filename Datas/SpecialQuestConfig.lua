-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\SpecialQuestConfig.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    304
  },
  RT_2 = {
    101101,
    101103
  },
  RT_3 = {
    1
  },
  RT_4 = {
    102101
  },
  RT_5 = {
    102104
  },
  RT_6 = {
    101401
  },
  RT_7 = {
    103201
  },
  RT_8 = {
    101402
  },
  RT_9 = {
    101901
  },
  RT_10 = {
    101103
  },
  RT_11 = {
    101101
  },
  RT_12 = {
    104108
  },
  RT_13 = {
    104103
  },
  RT_14 = {
    105701
  },
  RT_15 = {
    104105
  },
  RT_16 = {
    104110
  },
  RT_17 = {
    104106
  },
  RT_18 = {
    104104
  },
  RT_19 = {
    101105
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [61, 61] id: 1
  return r1_1
end
local r3_0 = "SpecialQuestConfig"
local r4_0 = {
  [101] = {
    FailCustomEvent = "Hunt3Fail",
    QuestChainId = 100205,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 101,
    StoryPath = "SpecialQuest\\1002\\IcelakeHunting.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1180295,
    UniversalConfigId = 101,
  },
  [102] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100208,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 102,
    StoryPath = "SpecialQuest\\1002\\SaiqiDream1.story",
    SubRegionIds = r0_0.RT_6,
    UniversalConfigId = 102,
  },
  [103] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100208,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 103,
    StoryPath = "SpecialQuest\\1002\\SaiqiDream2.story",
    SubRegionIds = r0_0.RT_6,
    UniversalConfigId = 103,
  },
  [104] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100208,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 104,
    StoryPath = "SpecialQuest\\1002\\SaiqiDreamBoss1.story",
    SubRegionIds = r0_0.RT_8,
    UniversalConfigId = 104,
  },
  [105] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100208,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 105,
    StoryPath = "SpecialQuest\\1002\\SaiqiDreamBoss2.story",
    SubRegionIds = r0_0.RT_8,
    UniversalConfigId = 105,
  },
  [106] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100206,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 106,
    StoryPath = "SpecialQuest\\1002\\SaiqiWalk.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1240108,
    UniversalConfigId = 106,
  },
  [107] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100206,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 107,
    StoryPath = "SpecialQuest\\1002\\SaiqiWalk2.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1240260,
    UniversalConfigId = 107,
  },
  [109] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100203,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 109,
    StoryPath = "SpecialQuest\\1002\\KKPart02.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1380018,
    UniversalConfigId = 109,
  },
  [110] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100203,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 110,
    StoryPath = "SpecialQuest\\1002\\SJZBOSS.story",
    TriggerBoxStaticCreatorId = 1440071,
    UniversalConfigId = 110,
  },
  [111] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100207,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 111,
    StoryPath = "SpecialQuest\\1002\\IcelakeBoss.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1240109,
    UniversalConfigId = 111,
  },
  [114] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100202,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 114,
    StoryPath = "SpecialQuest\\1002\\SewThief3.story",
    TriggerBoxStaticCreatorId = 1730063,
    UniversalConfigId = 112,
  },
  [115] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100207,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 115,
    StoryPath = "SpecialQuest\\1002\\FindSaiqi1.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1180431,
    UniversalConfigId = 113,
  },
  [116] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100207,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 116,
    StoryPath = "SpecialQuest\\1002\\FindSaiqi2.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1240290,
    UniversalConfigId = 114,
  },
  [117] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100207,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 117,
    StoryPath = "SpecialQuest\\1002\\IcelakeBoss2.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1240690,
    UniversalConfigId = 117,
  },
  [118] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100201,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 118,
    StoryPath = "SpecialQuest\\1002\\TrafficwayFight.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1241024,
    UniversalConfigId = 118,
  },
  [120] = {
    FailCustomEvent = "Fail",
    QuestChainId = 100206,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 120,
    StoryPath = "SpecialQuest\\1002\\TraceEnlike.story",
    SubRegionIds = r0_0.RT_11,
    TalkTriggerId = 1001,
    UniversalConfigId = 120,
  },
  [1001] = {
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1001,
    TalkTriggerId = 1001,
    UniversalConfigId = 1001,
  },
  [1002] = {
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1002,
    TalkTriggerId = 1001,
  },
  [1003] = {
    QuestChainId = 110101,
    QuestFailTalkTriggerId = 1002,
    ServerEffectId = r0_0.RT_3,
    SpecialConfigId = 1003,
    StoryPath = "SpecialQuest\\1101\\110102boss.story",
    SubRegionIds = r0_0.RT_4,
    TalkTriggerId = 1001,
    UniversalConfigId = 1003,
  },
  [1004] = {
    QuestChainId = 110101,
    QuestFailTalkTriggerId = 1002,
    ServerEffectId = r0_0.RT_3,
    SpecialConfigId = 1004,
    StoryPath = "SpecialQuest\\1101\\ProtectDafu.story",
    SubRegionIds = r0_0.RT_4,
    TalkTriggerId = 1001,
    UniversalConfigId = 1004,
  },
  [1005] = {
    QuestChainId = 110103,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1005,
    StoryPath = "SpecialQuest\\1101\\DestroyPower.story",
    SubRegionIds = r0_0.RT_4,
    TalkTriggerId = 1001,
    UniversalConfigId = 1005,
  },
  [1006] = {
    QuestChainId = 110107,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1006,
    StoryPath = "SpecialQuest\\1101\\110110boss.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1650074,
    UniversalConfigId = 1006,
  },
  [1008] = {
    FailCustomEvent = "TuicheFail",
    QuestChainId = 110105,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1008,
    StoryPath = "SpecialQuest\\1101\\Tuiche.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1650073,
    UniversalConfigId = 1008,
  },
  [1009] = {
    FailCustomEvent = "PaotaiSPQuestFail",
    QuestChainId = 110105,
    QuestFailTalkTriggerId = 1002,
    SpecialConfigId = 1009,
    StoryPath = "SpecialQuest\\1101\\Paoji.story",
    TalkTriggerId = 1001,
    TriggerBoxStaticCreatorId = 1650072,
    UniversalConfigId = 1009,
  },
}
r4_0[1010] = {
  QuestChainId = 110101,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 1010,
  StoryPath = "SpecialQuest\\1101\\void.story",
  SubRegionIds = {
    100104
  },
  TalkTriggerId = 1001,
  UniversalConfigId = 1010,
}
r4_0[1011] = {
  QuestChainId = 110101,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 1011,
  StoryPath = "SpecialQuest\\1101\\HelpDafu.story",
  SubRegionIds = r0_0.RT_4,
  TalkTriggerId = 1001,
  UniversalConfigId = 1011,
}
r4_0[1012] = {
  FailCustomEvent = "EXChapter01_SewWarm_Baohujiguan_Fail",
  QuestChainId = 110108,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 1012,
  StoryPath = "SpecialQuest\\1101\\Sew.story",
  TalkTriggerId = 1001,
  TriggerBoxStaticCreatorId = 1670017,
  UniversalConfigId = 1012,
}
r4_0[1013] = {
  QuestChainId = 110108,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 1013,
  StoryPath = "SpecialQuest\\1101\\SewBegin.story",
  SubRegionIds = {
    102103
  },
  TalkTriggerId = 1001,
  UniversalConfigId = 1013,
}
r4_0[1014] = {
  QuestChainId = 110109,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 1014,
  StoryPath = "SpecialQuest\\1101\\Shenpan01.story",
  SubRegionIds = r0_0.RT_5,
  TalkTriggerId = 1001,
  UniversalConfigId = 1014,
}
r4_0[1015] = {
  QuestChainId = 110109,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 1015,
  StoryPath = "SpecialQuest\\1101\\HaierBoss3.story",
  SubRegionIds = r0_0.RT_5,
  TalkTriggerId = 1001,
  UniversalConfigId = 1015,
}
r4_0[1017] = {
  QuestChainId = 110107,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 1017,
  StoryPath = "SpecialQuest\\1101\\Wake.story",
  SubRegionIds = {
    102102
  },
  TalkTriggerId = 1001,
  UniversalConfigId = 1017,
}
r4_0[1018] = {
  QuestChainId = 110108,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 1018,
  StoryPath = "SpecialQuest\\1101\\Maifu.story",
  TalkTriggerId = 1001,
  TriggerBoxStaticCreatorId = 1650281,
  UniversalConfigId = 1018,
}
r4_0[1019] = {
  QuestChainId = 110107,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 1019,
  StoryPath = "SpecialQuest\\1101\\ZhongKongJIGUAN.story",
  TalkTriggerId = 1001,
  TriggerBoxStaticCreatorId = 1650329,
  UniversalConfigId = 1019,
}
r4_0[1021] = {
  QuestChainId = 110103,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 1021,
  StoryPath = "SpecialQuest\\1101\\SmallRoomBattle.story",
  SubRegionIds = r0_0.RT_4,
  TalkTriggerId = 1001,
  UniversalConfigId = 1021,
}
r4_0[1023] = {
  QuestChainId = 110103,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 1023,
  StoryPath = "SpecialQuest\\1101\\StopPower.story",
  SubRegionIds = r0_0.RT_4,
  TalkTriggerId = 1001,
  UniversalConfigId = 1023,
}
r4_0[1024] = {
  QuestChainId = 110109,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 1024,
  StoryPath = "SpecialQuest\\1101\\Shenpan02.story",
  SubRegionIds = r0_0.RT_5,
  TalkTriggerId = 1001,
  UniversalConfigId = 1024,
}
r4_0[1025] = {
  BuffId = r0_0.RT_1,
  QuestChainId = 110109,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 1025,
  StoryPath = "SpecialQuest\\1101\\Shenpan03.story",
  SubRegionIds = r0_0.RT_5,
  TalkTriggerId = 1001,
  UniversalConfigId = 1025,
}
r4_0[1026] = {
  QuestChainId = 110105,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 1026,
  StoryPath = "SpecialQuest\\1101\\GuidaoMaiFu.story",
  SubRegionIds = r0_0.RT_4,
  TalkTriggerId = 1001,
  UniversalConfigId = 1026,
}
r4_0[1028] = {
  FailCustomEvent = "Fail",
  QuestChainId = 100305,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 1028,
  StoryPath = "SpecialQuest\\1003\\100305battle1pre.story",
  SubRegionIds = r0_0.RT_7,
  TalkTriggerId = 1001,
  UniversalConfigId = 1030,
}
r4_0[1029] = {
  FailCustomEvent = "Fail",
  QuestChainId = 100305,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 1029,
  StoryPath = "SpecialQuest\\1003\\100305escape.story",
  SubRegionIds = r0_0.RT_7,
  TalkTriggerId = 1001,
  UniversalConfigId = 1030,
}
r4_0[1030] = {
  FailCustomEvent = "Fail",
  QuestChainId = 100305,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 1030,
  StoryPath = "SpecialQuest\\1003\\100305battle.story",
  SubRegionIds = r0_0.RT_7,
  TalkTriggerId = 1001,
  UniversalConfigId = 1030,
}
r4_0[1031] = {
  FailCustomEvent = "Fail",
  QuestChainId = 100305,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 1031,
  StoryPath = "SpecialQuest\\1003\\100305battle2.story",
  SubRegionIds = r0_0.RT_7,
  TalkTriggerId = 1001,
  UniversalConfigId = 1030,
}
r4_0[1032] = {
  FailCustomEvent = "Fail",
  QuestChainId = 100305,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 1032,
  StoryPath = "SpecialQuest\\1003\\100305battle3.story",
  SubRegionIds = r0_0.RT_7,
  TalkTriggerId = 1001,
  UniversalConfigId = 1030,
}
r4_0[1033] = {
  FailCustomEvent = "Fail",
  QuestChainId = 100305,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 1033,
  StoryPath = "SpecialQuest\\1003\\100305battle4.story",
  SubRegionIds = r0_0.RT_7,
  TalkTriggerId = 1001,
  UniversalConfigId = 1035,
}
r4_0[1034] = {
  FailCustomEvent = "Fail",
  QuestChainId = 100305,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 1034,
  StoryPath = "SpecialQuest\\1003\\100305battle5.story",
  SubRegionIds = r0_0.RT_7,
  TalkTriggerId = 1001,
  UniversalConfigId = 1035,
}
r4_0[1035] = {
  FailCustomEvent = "100302defencecorebreak",
  QuestChainId = 100302,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 1035,
  StoryPath = "SpecialQuest\\1003\\100302sewsp1.story",
  TalkTriggerId = 1001,
  TriggerBoxStaticCreatorId = 1730090,
  UniversalConfigId = 1032,
}
r4_0[1036] = {
  FailCustomEvent = "Fail",
  QuestChainId = 100302,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 1036,
  StoryPath = "SpecialQuest\\1003\\100302sewsp2.story",
  TalkTriggerId = 1001,
  TriggerBoxStaticCreatorId = 1720202,
  UniversalConfigId = 1033,
}
r4_0[1037] = {
  FailCustomEvent = "Fail",
  QuestChainId = 100302,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 1037,
  StoryPath = "SpecialQuest\\1003\\100302sewsp3.story",
  TalkTriggerId = 1001,
  TriggerBoxStaticCreatorId = 1720209,
  UniversalConfigId = 1036,
}
r4_0[1040] = {
  FailCustomEvent = "Fail",
  QuestChainId = 100103,
  QuestFailTalkTriggerId = 100125,
  SpecialConfigId = 1040,
  StoryPath = "SpecialQuest\\1001\\XibiBoss.story",
  SubRegionIds = {
    100103
  },
  TalkTriggerId = 1001,
  UniversalConfigId = 1040,
}
r4_0[1041] = {
  FailCustomEvent = "Fail",
  QuestChainId = 100305,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 1041,
  StoryPath = "SpecialQuest\\1003\\100306thea.story",
  SubRegionIds = r0_0.RT_9,
  TalkTriggerId = 1001,
  UniversalConfigId = 1034,
}
r4_0[1042] = {
  FailCustomEvent = "Fail",
  QuestChainId = 100306,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 1042,
  StoryPath = "SpecialQuest\\1003\\100306thea2.story",
  SubRegionIds = r0_0.RT_9,
  TalkTriggerId = 1001,
  UniversalConfigId = 1034,
}
r4_0[1043] = {
  FailCustomEvent = "Fail",
  QuestChainId = 100304,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 1043,
  StoryPath = "SpecialQuest\\1003\\100303ilc.story",
  SubRegionIds = r0_0.RT_2,
  TalkTriggerId = 1001,
  UniversalConfigId = 1037,
}
r4_0[1044] = {
  FailCustomEvent = "Fail",
  QuestChainId = 100304,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 1044,
  StoryPath = "SpecialQuest\\1003\\100303sew3spmain.story",
  SubRegionIds = {
    101701,
    101702,
    101703
  },
  TalkTriggerId = 1001,
  UniversalConfigId = 1036,
}
r4_0[1045] = {
  FailCustomEvent = "Fail",
  QuestChainId = 100304,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 1045,
  StoryPath = "SpecialQuest\\1003\\100304secroutsideboss.story",
  TalkTriggerId = 1001,
  TriggerBoxStaticCreatorId = 1180564,
  UniversalConfigId = 1035,
}
r4_0[1046] = {
  FailCustomEvent = "Fail",
  QuestChainId = 100305,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 1046,
  StoryPath = "SpecialQuest\\1003\\100306theaout.story",
  TalkTriggerId = 1001,
  TriggerBoxStaticCreatorId = 1191418,
  UniversalConfigId = 1034,
}
r4_0[1047] = {
  FailCustomEvent = "Fail",
  QuestChainId = 200212,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 1047,
  StoryPath = "SpecialQuest\\Side\\200212_LaLiBattleSide.story",
  TalkTriggerId = 1001,
  TriggerBoxStaticCreatorId = 1191274,
  UniversalConfigId = 1047,
}
r4_0[1048] = {
  QuestChainId = 110108,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 1048,
  StoryPath = "SpecialQuest\\1101\\ShenpanPre.story",
  SubRegionIds = r0_0.RT_5,
  TalkTriggerId = 1001,
  UniversalConfigId = 1048,
}
r4_0[1049] = {
  FailCustomEvent = "Fail",
  QuestChainId = 200230,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 1049,
  StoryPath = "SpecialQuest\\Side\\200230_Huozai01BattleSide.story",
  TalkTriggerId = 1001,
  TriggerBoxStaticCreatorId = 1191515,
  UniversalConfigId = 1049,
}
r4_0[1050] = {
  FailCustomEvent = "Fail",
  QuestChainId = 200231,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 1050,
  StoryPath = "SpecialQuest\\Side\\200231_Huozai02Battle1.story",
  TalkTriggerId = 1001,
  TriggerBoxStaticCreatorId = 1240888,
  UniversalConfigId = 1050,
}
r4_0[1051] = {
  FailCustomEvent = "Fail",
  QuestChainId = 200231,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 1051,
  StoryPath = "SpecialQuest\\Side\\200231_Huozai02Battle2.story",
  SubRegionIds = {
    101301
  },
  TalkTriggerId = 1001,
  UniversalConfigId = 1051,
}
r4_0[1052] = {
  FailCustomEvent = "Fail",
  QuestChainId = 200233,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 1052,
  StoryPath = "SpecialQuest\\Side\\200233_Huozai04Battle.story",
  TalkTriggerId = 1001,
  TriggerBoxStaticCreatorId = 1240954,
  UniversalConfigId = 1052,
}
r4_0[1053] = {
  FailCustomEvent = "Fail",
  QuestChainId = 100305,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 1053,
  StoryPath = "SpecialQuest\\1003\\100306thea1.story",
  SubRegionIds = r0_0.RT_9,
  TalkTriggerId = 1001,
  UniversalConfigId = 1034,
}
r4_0[1054] = {
  FailCustomEvent = "Fail",
  QuestChainId = 200103,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 1054,
  StoryPath = "SpecialQuest\\Side\\200103_Pet01Battle01.story",
  SubRegionIds = r0_0.RT_10,
  TalkTriggerId = 1001,
  UniversalConfigId = 1054,
}
r4_0[1055] = {
  FailCustomEvent = "Fail",
  QuestChainId = 200232,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 1055,
  StoryPath = "SpecialQuest\\Side\\200232_Huozai03Battle.story",
  TalkTriggerId = 1001,
  TriggerBoxStaticCreatorId = 1240987,
  UniversalConfigId = 1055,
}
r4_0[1056] = {
  FailCustomEvent = "Fail",
  QuestChainId = 200104,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 1056,
  StoryPath = "SpecialQuest\\Side\\200104_Pet01Battle02.story",
  TalkTriggerId = 1001,
  TriggerBoxStaticCreatorId = 1730261,
  UniversalConfigId = 1056,
}
r4_0[1057] = {
  FailCustomEvent = "Fail",
  QuestChainId = 110109,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 1057,
  StoryPath = "SpecialQuest\\1101\\ShenpanWaitDafu.story",
  SubRegionIds = r0_0.RT_5,
  TalkTriggerId = 1001,
  UniversalConfigId = 1057,
}
r4_0[2001] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120104,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2001,
  StoryPath = "SpecialQuest\\1201\\Nai01.story",
  SubRegionIds = {
    104301
  },
  TalkTriggerId = 1001,
  UniversalConfigId = 2001,
}
r4_0[2002] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120104,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2002,
  StoryPath = "SpecialQuest\\1201\\Nai02.story",
  SubRegionIds = {
    104401
  },
  TalkTriggerId = 1001,
  UniversalConfigId = 2002,
}
r4_0[2003] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120104,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2003,
  StoryPath = "SpecialQuest\\1201\\Nai03.story",
  SubRegionIds = {
    105001
  },
  TalkTriggerId = 1001,
  UniversalConfigId = 2003,
}
r4_0[2004] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120101,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 2004,
  StoryPath = "SpecialQuest\\1201\\Port01.story",
  TalkTriggerId = 1001,
  TriggerBoxStaticCreatorId = 2090061,
  UniversalConfigId = 2004,
}
r4_0[2005] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120102,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 2005,
  StoryPath = "SpecialQuest\\1201\\Cav01.story",
  SubRegionIds = r0_0.RT_13,
  TalkTriggerId = 1001,
  UniversalConfigId = 2005,
}
r4_0[2006] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120102,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 2006,
  StoryPath = "SpecialQuest\\1201\\Cav02.story",
  SubRegionIds = r0_0.RT_13,
  TalkTriggerId = 1001,
  UniversalConfigId = 2007,
}
r4_0[2007] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120102,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 2007,
  StoryPath = "SpecialQuest\\1201\\Cav02.story",
  SubRegionIds = r0_0.RT_13,
  TalkTriggerId = 1001,
  UniversalConfigId = 2005,
}
r4_0[2008] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120105,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 2008,
  StoryPath = "SpecialQuest\\1201\\Batt01.story",
  SubRegionIds = {
    104201
  },
  TalkTriggerId = 1001,
  UniversalConfigId = 2006,
}
r4_0[2009] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120105,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 2009,
  StoryPath = "SpecialQuest\\1201\\Batt02.story",
  SubRegionIds = {
    104601
  },
  TalkTriggerId = 1001,
  UniversalConfigId = 2006,
}
r4_0[2010] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120105,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 2010,
  StoryPath = "SpecialQuest\\1201\\Batt03.story",
  SubRegionIds = {
    104701
  },
  TalkTriggerId = 1001,
  UniversalConfigId = 2006,
}
r4_0[2011] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120105,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 2011,
  StoryPath = "SpecialQuest\\1201\\YumingBossFight.story",
  SubRegionIds = {
    104102
  },
  TalkTriggerId = 1001,
  UniversalConfigId = 2011,
}
r4_0[2012] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120106,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 2012,
  StoryPath = "SpecialQuest\\1201\\HeilongBossFight.story",
  SubRegionIds = r0_0.RT_14,
  TalkTriggerId = 1001,
  UniversalConfigId = 2012,
}
r4_0[2013] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120101,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2013,
  StoryPath = "SpecialQuest\\1201\\PortJiebei.story",
  SubRegionIds = r0_0.RT_12,
  TalkTriggerId = 1001,
  UniversalConfigId = 2013,
}
r4_0[2014] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120106,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2014,
  StoryPath = "SpecialQuest\\1201\\HeilongBossHook.story",
  SubRegionIds = r0_0.RT_14,
  TalkTriggerId = 1001,
  UniversalConfigId = 2014,
}
r4_0[2015] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120106,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2015,
  StoryPath = "SpecialQuest\\1201\\HeilongBossWalk.story",
  SubRegionIds = r0_0.RT_14,
  TalkTriggerId = 1001,
  UniversalConfigId = 2015,
}
r4_0[2016] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120103,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 2016,
  StoryPath = "SpecialQuest\\1201\\Shi01Fight.story",
  SubRegionIds = {
    104109
  },
  TalkTriggerId = 1001,
  UniversalConfigId = 2016,
}
r4_0[2017] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120103,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2017,
  StoryPath = "SpecialQuest\\1201\\FilWalk01.story",
  SubRegionIds = r0_0.RT_15,
  TalkTriggerId = 1001,
  UniversalConfigId = 2017,
}
r4_0[2018] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120103,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 2018,
  StoryPath = "SpecialQuest\\1201\\FilFight01.story",
  SubRegionIds = r0_0.RT_15,
  TalkTriggerId = 1001,
  UniversalConfigId = 2018,
}
r4_0[2019] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120103,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2019,
  StoryPath = "SpecialQuest\\1201\\FilWalk02.story",
  SubRegionIds = r0_0.RT_15,
  TalkTriggerId = 1001,
  UniversalConfigId = 2019,
}
r4_0[2020] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120103,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 2020,
  StoryPath = "SpecialQuest\\1201\\SprFight01.story",
  SubRegionIds = {
    104107
  },
  TalkTriggerId = 1001,
  UniversalConfigId = 2020,
}
r4_0[2021] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120103,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 2021,
  StoryPath = "SpecialQuest\\1201\\SprFight02.story",
  SubRegionIds = r0_0.RT_16,
  TalkTriggerId = 1001,
  UniversalConfigId = 2021,
}
r4_0[2022] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120103,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 2022,
  StoryPath = "SpecialQuest\\1201\\SprFight03.story",
  SubRegionIds = r0_0.RT_16,
  TalkTriggerId = 1001,
  UniversalConfigId = 2022,
}
r4_0[2023] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120103,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 2023,
  StoryPath = "SpecialQuest\\1201\\FilMech.story",
  SubRegionIds = r0_0.RT_15,
  TalkTriggerId = 1001,
  UniversalConfigId = 2023,
}
r4_0[2024] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120104,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2024,
  StoryPath = "SpecialQuest\\1201\\FushuHosWalk01.story",
  SubRegionIds = r0_0.RT_17,
  TalkTriggerId = 1001,
  UniversalConfigId = 2024,
}
r4_0[2025] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120104,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 2025,
  StoryPath = "SpecialQuest\\1201\\FushuHosWalk02.story",
  SubRegionIds = r0_0.RT_17,
  TalkTriggerId = 1001,
  UniversalConfigId = 2025,
}
r4_0[2026] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120104,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 2026,
  StoryPath = "SpecialQuest\\1201\\FushuCenWuyou01Mech.story",
  SubRegionIds = r0_0.RT_18,
  TalkTriggerId = 1001,
  UniversalConfigId = 2026,
}
r4_0[2027] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120104,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 2027,
  StoryPath = "SpecialQuest\\1201\\FushuCenWuyou01Walk.story",
  SubRegionIds = r0_0.RT_18,
  TalkTriggerId = 1001,
  UniversalConfigId = 2027,
}
r4_0[2028] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120104,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 2028,
  StoryPath = "SpecialQuest\\1201\\FushuCenWuyou02Mech.story",
  SubRegionIds = r0_0.RT_18,
  TalkTriggerId = 1001,
  UniversalConfigId = 2028,
}
r4_0[2029] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120104,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 2029,
  StoryPath = "SpecialQuest\\1201\\FushuCenWuyou02Walk.story",
  SubRegionIds = r0_0.RT_18,
  TalkTriggerId = 1001,
  UniversalConfigId = 2029,
}
r4_0[2030] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120104,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 2030,
  StoryPath = "SpecialQuest\\1201\\FushuCenWuyou03Mech.story",
  SubRegionIds = r0_0.RT_18,
  TalkTriggerId = 1001,
  UniversalConfigId = 2030,
}
r4_0[2031] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120104,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 2031,
  StoryPath = "SpecialQuest\\1201\\FushuCenWuyou03Walk.story",
  SubRegionIds = r0_0.RT_18,
  TalkTriggerId = 1001,
  UniversalConfigId = 2031,
}
r4_0[2051] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120111,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2051,
  StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay01Home.story",
  SubRegionIds = r0_0.RT_19,
  TalkTriggerId = 1001,
  UniversalConfigId = 2051,
}
r4_0[2052] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120111,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2052,
  StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay01Walk.story",
  SubRegionIds = r0_0.RT_11,
  TalkTriggerId = 1001,
  UniversalConfigId = 2052,
}
r4_0[2053] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120111,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2053,
  StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay01Catch01.story",
  SubRegionIds = r0_0.RT_11,
  TalkTriggerId = 1001,
  UniversalConfigId = 2053,
}
r4_0[2054] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120111,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2054,
  StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay01Catch02.story",
  SubRegionIds = r0_0.RT_11,
  TalkTriggerId = 1001,
  UniversalConfigId = 2054,
}
r4_0[2055] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120111,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2055,
  StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay01Catch03.story",
  SubRegionIds = r0_0.RT_11,
  TalkTriggerId = 1001,
  UniversalConfigId = 2055,
}
r4_0[2056] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120111,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2056,
  StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay01Back.story",
  SubRegionIds = r0_0.RT_11,
  TalkTriggerId = 1001,
  UniversalConfigId = 2056,
}
r4_0[2057] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120111,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2057,
  StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay01Sleep.story",
  SubRegionIds = r0_0.RT_19,
  TalkTriggerId = 1001,
  UniversalConfigId = 2057,
}
r4_0[2058] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120112,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2058,
  StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay02Home.story",
  SubRegionIds = r0_0.RT_19,
  TalkTriggerId = 1001,
  UniversalConfigId = 2058,
}
r4_0[2059] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120112,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2059,
  StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay02Walk.story",
  SubRegionIds = r0_0.RT_11,
  TalkTriggerId = 1001,
  UniversalConfigId = 2059,
}
r4_0[2060] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120112,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2060,
  StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay02Survey01.story",
  SubRegionIds = r0_0.RT_11,
  TalkTriggerId = 1001,
  UniversalConfigId = 2060,
}
r4_0[2061] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120112,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2061,
  StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay02Survey02.story",
  SubRegionIds = r0_0.RT_11,
  TalkTriggerId = 1001,
  UniversalConfigId = 2061,
}
r4_0[2062] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120112,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2062,
  StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay02Back01.story",
  SubRegionIds = r0_0.RT_11,
  TalkTriggerId = 1001,
  UniversalConfigId = 2062,
}
r4_0[2063] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120112,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2063,
  StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay02Back02.story",
  SubRegionIds = r0_0.RT_19,
  TalkTriggerId = 1001,
  UniversalConfigId = 2063,
}
r4_0[2064] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120113,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2064,
  StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay03Home.story",
  SubRegionIds = r0_0.RT_19,
  TalkTriggerId = 1001,
  UniversalConfigId = 2064,
}
r4_0[2065] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120113,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2065,
  StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay03Walk.story",
  SubRegionIds = r0_0.RT_11,
  TalkTriggerId = 1001,
  UniversalConfigId = 2065,
}
r4_0[2066] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120113,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2066,
  StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay03Catch.story",
  SubRegionIds = r0_0.RT_11,
  TalkTriggerId = 1001,
  UniversalConfigId = 2066,
}
r4_0[2067] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120113,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2067,
  StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay03HomeBook.story",
  SubRegionIds = r0_0.RT_19,
  TalkTriggerId = 1001,
  UniversalConfigId = 2067,
}
r4_0[2070] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120114,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2070,
  StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay04Home.story",
  SubRegionIds = r0_0.RT_19,
  TalkTriggerId = 1001,
  UniversalConfigId = 2070,
}
r4_0[2071] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120114,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2071,
  StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay04Walk01.story",
  SubRegionIds = r0_0.RT_11,
  TalkTriggerId = 1001,
  UniversalConfigId = 2071,
}
r4_0[2072] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120114,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2072,
  StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay04Walk02.story",
  SubRegionIds = r0_0.RT_11,
  TalkTriggerId = 1001,
  UniversalConfigId = 2072,
}
r4_0[2073] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120114,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2073,
  StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay04HomeCry.story",
  SubRegionIds = r0_0.RT_19,
  TalkTriggerId = 1001,
  UniversalConfigId = 2073,
}
r4_0[2074] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120114,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2074,
  StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay04Find01.story",
  SubRegionIds = r0_0.RT_11,
  TalkTriggerId = 1001,
  UniversalConfigId = 2074,
}
r4_0[2075] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120114,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2075,
  StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay04Find02.story",
  SubRegionIds = r0_0.RT_10,
  TalkTriggerId = 1001,
  UniversalConfigId = 2075,
}
r4_0[2076] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120114,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2076,
  StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay04Thief.story",
  SubRegionIds = r0_0.RT_10,
  TalkTriggerId = 1001,
  UniversalConfigId = 2076,
}
r4_0[2077] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120114,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2077,
  StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay04Fight.story",
  SubRegionIds = r0_0.RT_10,
  TalkTriggerId = 1001,
  UniversalConfigId = 2077,
}
r4_0[2078] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120114,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2078,
  StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay04BackCity01.story",
  SubRegionIds = r0_0.RT_10,
  TalkTriggerId = 1001,
  UniversalConfigId = 2078,
}
r4_0[2079] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120114,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2079,
  StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay04BackCity02.story",
  SubRegionIds = r0_0.RT_11,
  TalkTriggerId = 1001,
  UniversalConfigId = 2079,
}
r4_0[2080] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120114,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2080,
  StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay04Back.story",
  SubRegionIds = r0_0.RT_19,
  TalkTriggerId = 1001,
  UniversalConfigId = 2080,
}
r4_0[2081] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120114,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2081,
  StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay04HomeParty.story",
  SubRegionIds = r0_0.RT_19,
  TalkTriggerId = 1001,
  UniversalConfigId = 2081,
}
r4_0[2082] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120114,
  QuestFailTalkTriggerId = 1002,
  ServerEffectId = r0_0.RT_3,
  SpecialConfigId = 2082,
  StoryPath = "SpecialQuest\\ActiveFina\\FeinaDay04StoryEnd.story",
  SubRegionIds = r0_0.RT_19,
  TalkTriggerId = 1001,
  UniversalConfigId = 2082,
}
r4_0[10000] = {
  BuffId = r0_0.RT_1,
  FailCustomEvent = "Fail",
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 10000,
  StoryPath = "TestSpecialQuest.story",
  SubRegionIds = r0_0.RT_2,
  TalkTriggerId = 1001,
  UniversalConfigId = 1001,
}
r4_0[12000208] = {
  FailCustomEvent = "Fail",
  QuestChainId = 120002,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 12000208,
  StoryPath = "SpecialQuest\\1200\\ZhiliuWalk.story",
  TalkTriggerId = 1001,
  TriggerBoxStaticCreatorId = 1191197,
  UniversalConfigId = 12000208,
}
r4_0[12000307] = {
  FailCustomEvent = "East00SteathEnd",
  QuestChainId = 120003,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 12000307,
  StoryPath = "SpecialQuest\\1200\\East00Stealth.story",
  TalkTriggerId = 1001,
  TriggerBoxStaticCreatorId = 1191130,
  UniversalConfigId = 12000307,
}
r4_0[20020901] = {
  FailCustomEvent = "Fail",
  QuestChainId = 200209,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 20020901,
  StoryPath = "SpecialQuest\\Side\\200209_LunaBattle.story",
  TalkTriggerId = 1001,
  TriggerBoxStaticCreatorId = 1191807,
  UniversalConfigId = 20020901,
}
r4_0[20030401] = {
  FailCustomEvent = "Fail",
  QuestChainId = 200304,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 20030401,
  StoryPath = "SpecialQuest\\Side\\200304_MuXiBattle01.story",
  SubRegionIds = r0_0.RT_12,
  TalkTriggerId = 1001,
  UniversalConfigId = 20030401,
}
r4_0[20030402] = {
  FailCustomEvent = "Fail",
  QuestChainId = 200304,
  QuestFailTalkTriggerId = 1002,
  SpecialConfigId = 20030402,
  StoryPath = "SpecialQuest\\Side\\200304_MuXiBattle02.story",
  SubRegionIds = r0_0.RT_12,
  TalkTriggerId = 1001,
  UniversalConfigId = 20030402,
}
return r2_0(r3_0, r4_0)
