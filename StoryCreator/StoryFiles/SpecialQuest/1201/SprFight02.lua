-- filename: @C:/Pack/Branch/geili11\Content/Script/StoryCreator\StoryFiles\SpecialQuest\1201\SprFight02.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17632932865311",
      startPort = "StoryStart",
      endStory = "1763293292174113",
      endPort = "In",
    },
    {
      startStory = "1763293292174113",
      startPort = "Success",
      endStory = "17632932865315",
      endPort = "StoryEnd",
    }
  },
}
local r1_0 = {}
local r2_0 = {
  isStoryNode = true,
  key = "17632932865311",
  type = "StoryStartNode",
  name = "StoryStart",
  pos = {
    x = 800,
    y = 300,
  },
  propsData = {
    QuestChainId = 0,
  },
}
r2_0.questNodeData = {
  lineData = {},
  nodeData = {},
  commentData = {},
}
r1_0["17632932865311"] = r2_0
r2_0 = {
  isStoryNode = true,
  key = "17632932865315",
  type = "StoryEndNode",
  name = "StoryEnd",
  pos = {
    x = 1864,
    y = 322,
  },
  propsData = {},
}
r2_0.questNodeData = {
  lineData = {},
  nodeData = {},
  commentData = {},
}
r1_0["17632932865315"] = r2_0
r2_0 = {
  isStoryNode = true,
  key = "1763293292174113",
  type = "StoryNode",
  name = "任务节点",
  pos = {
    x = 1230,
    y = 322,
  },
}
r2_0.propsData = {
  QuestId = 0,
  QuestDescriptionComment = "",
  QuestDescription = "",
  QuestDeatil = "",
  TaskRegionReName = "",
  TaskSubRegionReName = "",
  RecommendLevel = -1,
  bIsStartQuest = false,
  bIsEndQuest = false,
  bIsNotifyGameMode = true,
  bIsStartChapter = false,
  bIsEndChapter = false,
  bIsShowOnComplete = true,
  bIsPlayBlackScreenOnComplete = false,
  bIsPlayBlackScreenOnFail = false,
  bIsDynamicEvent = false,
  ResurgencePoint = "",
  bUseQuestCoordinate = false,
  bDeadTriggerQuestFail = false,
  IsFairyLand = false,
  SubRegionId = 0,
  SubRegionIdList = {},
  StoryGuideType = "Point",
  StoryGuidePointName = "",
  JumpId = 0,
}
local r3_0 = {
  lineData = {
    {
      startQuest = "1763293292174114",
      startPort = "QuestStart",
      endQuest = "1763293301439393",
      endPort = "In",
    },
    {
      startQuest = "1763293292174114",
      startPort = "QuestStart",
      endQuest = "1763293310976590",
      endPort = "In",
    },
    {
      startQuest = "1763293301439393",
      startPort = "Out",
      endQuest = "1763293292175128",
      endPort = "Fail",
    },
    {
      startQuest = "1763293292174114",
      startPort = "QuestStart",
      endQuest = "17632945543993355508",
      endPort = "In",
    },
    {
      startQuest = "17632945543993355508",
      startPort = "Out",
      endQuest = "17632945730403355818",
      endPort = "In",
    },
    {
      startQuest = "17632946346163356192",
      startPort = "Out",
      endQuest = "17632947516523356748",
      endPort = "In",
    },
    {
      startQuest = "1763293292174114",
      startPort = "QuestStart",
      endQuest = "17633855198056066090",
      endPort = "In",
    },
    {
      startQuest = "17633855198056066090",
      startPort = "Out",
      endQuest = "1763293310976588",
      endPort = "In",
    },
    {
      startQuest = "1763293310976588",
      startPort = "Out",
      endQuest = "176355736158618609727",
      endPort = "In",
    },
    {
      startQuest = "1763293292174114",
      startPort = "QuestStart",
      endQuest = "1764314556031643299",
      endPort = "In",
    },
    {
      startQuest = "176355736158618609727",
      startPort = "Out",
      endQuest = "1764314568797643543",
      endPort = "In",
    },
    {
      startQuest = "1764314568797643543",
      startPort = "Out",
      endQuest = "1763293306134452",
      endPort = "In",
    },
    {
      startQuest = "1763293292174114",
      startPort = "QuestStart",
      endQuest = "17649333912923185496",
      endPort = "In",
    },
    {
      startQuest = "1763293292174114",
      startPort = "QuestStart",
      endQuest = "1765976903507642269",
      endPort = "In",
    }
  },
}
local r4_0 = {}
r4_0["1763293292174114"] = {
  key = "1763293292174114",
  type = "QuestStartNode",
  name = "QuestStart",
  pos = {
    x = 800,
    y = 300,
  },
  propsData = {
    ModeType = 0,
  },
}
r4_0["1763293292175121"] = {
  key = "1763293292175121",
  type = "QuestSuccessNode",
  name = "QuestSuccess",
  pos = {
    x = 2800,
    y = 300,
  },
  propsData = {
    ModeType = 0,
  },
}
r4_0["1763293292175128"] = {
  key = "1763293292175128",
  type = "QuestFailNode",
  name = "QuestFail",
  pos = {
    x = 1591.4251012145749,
    y = 779.9271255060728,
  },
  propsData = {},
}
r4_0["1763293301439393"] = {
  key = "1763293301439393",
  type = "WaitingSpecialQuestFailNode",
  name = "等待特殊任务失败",
  pos = {
    x = 1300.8259109311741,
    y = 769.9271255060728,
  },
  propsData = {},
}
r4_0["1763293306134452"] = {
  key = "1763293306134452",
  type = "SpecialQuestSuccessNode",
  name = "成功完成特殊任务",
  pos = {
    x = 2509.7900786448886,
    y = 325.8813520871143,
  },
  propsData = {},
}
r4_0["1763293310976588"] = {
  key = "1763293310976588",
  type = "GoToNode",
  name = "前往",
  pos = {
    x = 1614.0463413628117,
    y = 306.9650546821599,
  },
  propsData = {
    GuideUIEnable = true,
    StaticCreatorId = 1930085,
    GuideType = "M",
    GuidePointName = "Mechanism_QuestTrigger_1930085",
  },
}
local r5_0 = {
  key = "1763293310976589",
  type = "ChangeStaticCreatorNode",
  name = "生成秽兽",
  pos = {
    x = 1615.1683889059116,
    y = -839.5160723779145,
  },
}
r5_0.propsData = {
  ActiveEnable = true,
  EnableBlackScreenSync = false,
  EnableFadeIn = false,
  EnableFadeOut = false,
  NewTargetPointName = "",
  StaticCreatorIdList = {
    2110065,
    2110066,
    2110067
  },
}
r4_0["1763293310976589"] = r5_0
r4_0["1763293310976590"] = {
  key = "1763293310976590",
  type = "UpdateTaskBarAndTaskMainNode",
  name = "更新任务目标节点",
  pos = {
    x = 1281.9033418184963,
    y = -399.5556979570138,
  },
  propsData = {
    NewDescription = "Description_120103_11_1",
    NewDetail = "",
    SubTaskTargetIndex = 0,
  },
}
r5_0 = {
  key = "17632944390453355057",
  type = "TalkNode",
  name = "对话节点",
  pos = {
    x = 2192.8995215311006,
    y = -661.2057416267943,
  },
}
r5_0.propsData = {
  IsNpcNode = false,
  FirstDialogueId = 12022813,
  FlowAssetPath = "",
  TalkType = "Guide",
  bIsStandalone = true,
  GuideMeshIndexList = {},
  IsPlayStartSound = false,
  GuideTalkStyle = "Normal",
  OverrideFailBlend = false,
}
r4_0["17632944390453355057"] = r5_0
r4_0["17632945543993355508"] = {
  key = "17632945543993355508",
  type = "GoToNode",
  name = "前往",
  pos = {
    x = 1273.9102870813394,
    y = -213.5305023923445,
  },
  propsData = {
    GuideUIEnable = false,
    StaticCreatorId = 2110265,
    GuideType = "M",
    GuidePointName = "Mechanism_QuestTrigger_2110265",
  },
}
r5_0 = {
  key = "17632945730403355818",
  type = "TalkNode",
  name = "对话节点",
  pos = {
    x = 1605.1758138662165,
    y = -223.43179305214898,
  },
}
r5_0.propsData = {
  IsNpcNode = false,
  FirstDialogueId = 12022816,
  FlowAssetPath = "",
  TalkType = "Guide",
  bIsStandalone = true,
  GuideMeshIndexList = {},
  IsPlayStartSound = false,
  GuideTalkStyle = "Normal",
  OverrideFailBlend = false,
}
r4_0["17632945730403355818"] = r5_0
r4_0["17632946346163356192"] = {
  key = "17632946346163356192",
  type = "GoToNode",
  name = "前往",
  pos = {
    x = 1622.9258138662167,
    y = -661.10583611435,
  },
  propsData = {
    GuideUIEnable = false,
    StaticCreatorId = 2110266,
    GuideType = "M",
    GuidePointName = "Mechanism_QuestTrigger_2110266",
  },
}
r5_0 = {
  key = "17632947516523356748",
  type = "TalkNode",
  name = "对话节点",
  pos = {
    x = 1929.0422412984337,
    y = -662.2015298942542,
  },
}
r5_0.propsData = {
  IsNpcNode = false,
  FirstDialogueId = 12022818,
  FlowAssetPath = "",
  TalkType = "Guide",
  bIsStandalone = true,
  GuideMeshIndexList = {},
  IsPlayStartSound = false,
  GuideTalkStyle = "Normal",
  OverrideFailBlend = false,
}
r4_0["17632947516523356748"] = r5_0
r5_0 = {
  key = "17633855198056066090",
  type = "ChangeStaticCreatorNode",
  name = "生成/销毁节点",
  pos = {
    x = 1267.7931034482758,
    y = 305.9310344827586,
  },
}
r5_0.propsData = {
  ActiveEnable = true,
  EnableBlackScreenSync = false,
  EnableFadeIn = false,
  EnableFadeOut = false,
  NewTargetPointName = "",
  StaticCreatorIdList = {
    142110288,
    142110289,
    142110290,
    142110291,
    142110292,
    142110293,
    142110294,
    142110295
  },
}
r4_0["17633855198056066090"] = r5_0
r5_0 = {
  key = "176355736158618609727",
  type = "ChangeStaticCreatorNode",
  name = "生成/销毁节点",
  pos = {
    x = 1914.1193216013198,
    y = 316.68797932966294,
  },
}
r5_0.propsData = {
  ActiveEnable = false,
  EnableBlackScreenSync = false,
  EnableFadeIn = false,
  EnableFadeOut = false,
  NewTargetPointName = "",
  StaticCreatorIdList = {
    142110288,
    142110289,
    142110290,
    142110291,
    142110292,
    142110293,
    142110294,
    142110295
  },
}
r4_0["176355736158618609727"] = r5_0
r5_0 = {
  key = "1764314556031643299",
  type = "ChangeStaticCreatorNode",
  name = "生成止流",
  pos = {
    x = 1263.578947368421,
    y = 134.10526315789463,
  },
}
r5_0.propsData = {
  ActiveEnable = true,
  EnableBlackScreenSync = false,
  EnableFadeIn = false,
  EnableFadeOut = false,
  NewTargetPointName = "",
  StaticCreatorIdList = {
    2110050
  },
}
r4_0["1764314556031643299"] = r5_0
r5_0 = {
  key = "1764314568797643543",
  type = "ChangeStaticCreatorNode",
  name = "生成止流",
  pos = {
    x = 2197.8881578947367,
    y = 317.26315789473676,
  },
}
r5_0.propsData = {
  ActiveEnable = false,
  EnableBlackScreenSync = false,
  EnableFadeIn = false,
  EnableFadeOut = false,
  NewTargetPointName = "",
  StaticCreatorIdList = {
    2110050
  },
}
r4_0["1764314568797643543"] = r5_0
r4_0["17649333912923185496"] = {
  key = "17649333912923185496",
  type = "SendMessageNode",
  name = "发送消息-天气",
  pos = {
    x = 1276,
    y = -537.1260103583768,
  },
  propsData = {
    MessageType = "GameMode",
    MessageContent = "SprFightEnvStart",
    UnitId = -1,
  },
}
r5_0 = {
  key = "1765976903507642269",
  type = "PlayOrStopBGMNode",
  name = "BGM节点音效",
  pos = {
    x = 1264,
    y = 512,
  },
}
r5_0.propsData = {
  SoundStateType = 0,
  SoundPriority = 0,
  SoundType = 1,
  SoundPath = "event:/ambience/common/pad_noise_rain_plain_heavy",
  ParamKey = "",
  ParamValue = 0,
  RelatedRegionId = {},
  ClientRelatedRegionId = {
    104110,
    104107
  },
  bStoreToServer = false,
}
r4_0["1765976903507642269"] = r5_0
r3_0.nodeData = r4_0
r3_0.commentData = {}
r2_0.questNodeData = r3_0
r1_0["1763293292174113"] = r2_0
r0_0.storyNodeData = r1_0
r0_0.commentData = {}
return r0_0
