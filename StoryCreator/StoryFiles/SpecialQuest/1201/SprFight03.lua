-- filename: @C:/Pack/Branch/geili11\Content/Script/StoryCreator\StoryFiles\SpecialQuest\1201\SprFight03.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17632944219613284363",
      startPort = "StoryStart",
      endStory = "17632944219613284365",
      endPort = "In",
    },
    {
      startStory = "17632944219613284365",
      startPort = "Success",
      endStory = "17632944219613284364",
      endPort = "StoryEnd",
    }
  },
}
local r1_0 = {}
local r2_0 = {
  isStoryNode = true,
  key = "17632944219613284363",
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
r1_0["17632944219613284363"] = r2_0
r2_0 = {
  isStoryNode = true,
  key = "17632944219613284364",
  type = "StoryEndNode",
  name = "StoryEnd",
  pos = {
    x = 1588,
    y = 334,
  },
  propsData = {},
}
r2_0.questNodeData = {
  lineData = {},
  nodeData = {},
  commentData = {},
}
r1_0["17632944219613284364"] = r2_0
r2_0 = {
  isStoryNode = true,
  key = "17632944219613284365",
  type = "StoryNode",
  name = "任务节点",
  pos = {
    x = 1240,
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
      startQuest = "17632944219613284366",
      startPort = "QuestStart",
      endQuest = "17632944219613284369",
      endPort = "In",
    },
    {
      startQuest = "17632944219613284366",
      startPort = "QuestStart",
      endQuest = "17632942520992012404",
      endPort = "In",
    },
    {
      startQuest = "17632944219613284366",
      startPort = "QuestStart",
      endQuest = "17632942520992012407",
      endPort = "In",
    },
    {
      startQuest = "17632942520992012404",
      startPort = "Out",
      endQuest = "17633837509732692842",
      endPort = "In",
    },
    {
      startQuest = "17633837509732692842",
      startPort = "Out",
      endQuest = "17632942520992012406",
      endPort = "In",
    },
    {
      startQuest = "17632942520992012406",
      startPort = "Out",
      endQuest = "17633837701022693332",
      endPort = "In",
    },
    {
      startQuest = "17633845984814714377",
      startPort = "Out",
      endQuest = "17632944219613284368",
      endPort = "Fail",
    },
    {
      startQuest = "17632942520992012404",
      startPort = "Out",
      endQuest = "176345992914915522663",
      endPort = "In",
    },
    {
      startQuest = "17632944219613284369",
      startPort = "Out",
      endQuest = "176345995674415522902",
      endPort = "In",
    },
    {
      startQuest = "176345995674415522902",
      startPort = "Out",
      endQuest = "17633845984814714377",
      endPort = "In",
    },
    {
      startQuest = "17633837701022693332",
      startPort = "Out",
      endQuest = "176345996519515523220",
      endPort = "In",
    },
    {
      startQuest = "176345996519515523220",
      startPort = "Out",
      endQuest = "17649331239801275650",
      endPort = "In",
    },
    {
      startQuest = "17649331239801275650",
      startPort = "Out",
      endQuest = "17632944219613284370",
      endPort = "In",
    },
    {
      startQuest = "17632944219613284366",
      startPort = "QuestStart",
      endQuest = "17649332319901912270",
      endPort = "In",
    },
    {
      startQuest = "17632944219613284366",
      startPort = "QuestStart",
      endQuest = "17659769233961282451",
      endPort = "In",
    }
  },
}
local r4_0 = {}
r4_0["17632942520992012404"] = {
  key = "17632942520992012404",
  type = "GoToNode",
  name = "前往",
  pos = {
    x = 1218.1912127462074,
    y = 249.84916324590026,
  },
  propsData = {
    GuideUIEnable = true,
    StaticCreatorId = 2110303,
    GuideType = "M",
    GuidePointName = "Mechanism_QuestTrigger_2110303",
  },
}
r4_0["17632942520992012406"] = {
  key = "17632942520992012406",
  type = "KillMonsterNode",
  name = "击杀怪物",
  pos = {
    x = 1800.8862289428253,
    y = 249.21705233621532,
  },
  propsData = {
    KillMonsterType = "Nums",
    MonsterNeedNums = 40,
    IsShow = false,
    GuideType = "P",
    GuideName = "",
  },
}
r4_0["17632942520992012407"] = {
  key = "17632942520992012407",
  type = "UpdateTaskBarAndTaskMainNode",
  name = "更新任务目标节点",
  pos = {
    x = 1212.970839452801,
    y = 31.702570089414024,
  },
  propsData = {
    NewDescription = "Description_120103_11_3",
    NewDetail = "Content_120103_11_3",
    SubTaskTargetIndex = 0,
  },
}
r4_0["17632944219613284366"] = {
  key = "17632944219613284366",
  type = "QuestStartNode",
  name = "QuestStart",
  pos = {
    x = 830,
    y = 257.3684210526316,
  },
  propsData = {
    ModeType = 0,
  },
}
r4_0["17632944219613284367"] = {
  key = "17632944219613284367",
  type = "QuestSuccessNode",
  name = "QuestSuccess",
  pos = {
    x = 2779.4736842105262,
    y = 557.3684210526317,
  },
  propsData = {
    ModeType = 0,
  },
}
r4_0["17632944219613284368"] = {
  key = "17632944219613284368",
  type = "QuestFailNode",
  name = "QuestFail",
  pos = {
    x = 1839.329519450801,
    y = 598.1064073226544,
  },
  propsData = {},
}
r4_0["17632944219613284369"] = {
  key = "17632944219613284369",
  type = "WaitingSpecialQuestFailNode",
  name = "等待特殊任务失败",
  pos = {
    x = 1218.7597254004577,
    y = 568.7048054919908,
  },
  propsData = {},
}
r4_0["17632944219613284370"] = {
  key = "17632944219613284370",
  type = "SpecialQuestSuccessNode",
  name = "成功完成特殊任务",
  pos = {
    x = 2951.4027459954227,
    y = 250.16361556064072,
  },
  propsData = {},
}
r4_0["17633837509732692842"] = {
  key = "17633837509732692842",
  type = "SendMessageNode",
  name = "发送消息",
  pos = {
    x = 1509.8478260869565,
    y = 258.9130434782609,
  },
  propsData = {
    MessageType = "GameMode",
    MessageContent = "OnCreateSprMon",
    UnitId = -1,
  },
}
r4_0["17633837701022693332"] = {
  key = "17633837701022693332",
  type = "SendMessageNode",
  name = "发送消息",
  pos = {
    x = 2074.804347826087,
    y = 257.1521739130435,
  },
  propsData = {
    MessageType = "GameMode",
    MessageContent = "OnDestroySprMon",
    UnitId = -1,
  },
}
r4_0["17633845984814714377"] = {
  key = "17633845984814714377",
  type = "SendMessageNode",
  name = "发送消息",
  pos = {
    x = 1564,
    y = 636,
  },
  propsData = {
    MessageType = "GameMode",
    MessageContent = "OnDestroySprMon",
    UnitId = -1,
  },
}
local r5_0 = {
  key = "176345992914915522663",
  type = "ChangeStaticCreatorNode",
  name = "生成助战NPC",
  pos = {
    x = 1502,
    y = 48,
  },
}
r5_0.propsData = {
  ActiveEnable = true,
  EnableBlackScreenSync = false,
  EnableFadeIn = false,
  EnableFadeOut = false,
  NewTargetPointName = "",
  StaticCreatorIdList = {
    2110296,
    2110297,
    2110298,
    2110299
  },
}
r4_0["176345992914915522663"] = r5_0
r5_0 = {
  key = "176345995674415522902",
  type = "ChangeStaticCreatorNode",
  name = "销毁助战NPC",
  pos = {
    x = 1492,
    y = 452,
  },
}
r5_0.propsData = {
  ActiveEnable = false,
  EnableBlackScreenSync = false,
  EnableFadeIn = false,
  EnableFadeOut = false,
  NewTargetPointName = "",
  StaticCreatorIdList = {
    2110296,
    2110297,
    2110298,
    2110299
  },
}
r4_0["176345995674415522902"] = r5_0
r5_0 = {
  key = "176345996519515523220",
  type = "ChangeStaticCreatorNode",
  name = "销毁助战NPC",
  pos = {
    x = 2336.7826086956525,
    y = 252.8695652173913,
  },
}
r5_0.propsData = {
  ActiveEnable = false,
  EnableBlackScreenSync = false,
  EnableFadeIn = false,
  EnableFadeOut = false,
  NewTargetPointName = "",
  StaticCreatorIdList = {
    2110296,
    2110297,
    2110298,
    2110299
  },
}
r4_0["176345996519515523220"] = r5_0
r4_0["17649331239801275650"] = {
  key = "17649331239801275650",
  type = "PlayOrStopBGMNode",
  name = "BGM节点音效",
  pos = {
    x = 2628,
    y = 260,
  },
  propsData = {
    SoundStateType = 3,
    SoundPriority = 0,
    SoundType = 1,
  },
}
r4_0["17649332319901912270"] = {
  key = "17649332319901912270",
  type = "SendMessageNode",
  name = "发送消息-天气",
  pos = {
    x = 1215.875,
    y = -152.2510103583768,
  },
  propsData = {
    MessageType = "GameMode",
    MessageContent = "SprFightEnvStart",
    UnitId = -1,
  },
}
r5_0 = {
  key = "17659769233961282451",
  type = "PlayOrStopBGMNode",
  name = "BGM节点音效",
  pos = {
    x = 1212,
    y = -314.8235294117647,
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
r4_0["17659769233961282451"] = r5_0
r3_0.nodeData = r4_0
r3_0.commentData = {}
r2_0.questNodeData = r3_0
r1_0["17632944219613284365"] = r2_0
r0_0.storyNodeData = r1_0
r0_0.commentData = {}
return r0_0
