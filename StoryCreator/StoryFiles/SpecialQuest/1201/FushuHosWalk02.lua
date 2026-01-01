-- filename: @C:/Pack/Branch/geili11\Content/Script/StoryCreator\StoryFiles\SpecialQuest\1201\FushuHosWalk02.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17636379316421",
      startPort = "StoryStart",
      endStory = "176363793557488",
      endPort = "In",
    },
    {
      startStory = "176363793557488",
      startPort = "Success",
      endStory = "17636379316435",
      endPort = "StoryEnd",
    }
  },
}
local r1_0 = {}
local r2_0 = {
  isStoryNode = true,
  key = "17636379316421",
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
r1_0["17636379316421"] = r2_0
r2_0 = {
  isStoryNode = true,
  key = "17636379316435",
  type = "StoryEndNode",
  name = "StoryEnd",
  pos = {
    x = 1800,
    y = 302,
  },
  propsData = {},
}
r2_0.questNodeData = {
  lineData = {},
  nodeData = {},
  commentData = {},
}
r1_0["17636379316435"] = r2_0
r2_0 = {
  isStoryNode = true,
  key = "176363793557488",
  type = "StoryNode",
  name = "任务节点",
  pos = {
    x = 1284,
    y = 300,
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
      startQuest = "1763637947466448",
      startPort = "Out",
      endQuest = "1763637947466447",
      endPort = "In",
    },
    {
      startQuest = "1763637947466447",
      startPort = "Out",
      endQuest = "1763637947466449",
      endPort = "In",
    },
    {
      startQuest = "176363793557489",
      startPort = "QuestStart",
      endQuest = "1763637947466448",
      endPort = "In",
    },
    {
      startQuest = "1763637947466449",
      startPort = "Out",
      endQuest = "1763637964358698",
      endPort = "In",
    },
    {
      startQuest = "1763637972711929",
      startPort = "Out",
      endQuest = "1763637935574103",
      endPort = "Fail",
    },
    {
      startQuest = "1763637969070769",
      startPort = "Out",
      endQuest = "1763637972711929",
      endPort = "In",
    },
    {
      startQuest = "176363793557489",
      startPort = "QuestStart",
      endQuest = "1763637969070769",
      endPort = "In",
    },
    {
      startQuest = "176363793557489",
      startPort = "QuestStart",
      endQuest = "176537194275455835729",
      endPort = "In",
    }
  },
}
local r4_0 = {}
r4_0["176363793557489"] = {
  key = "176363793557489",
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
r4_0["176363793557496"] = {
  key = "176363793557496",
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
r4_0["1763637935574103"] = {
  key = "1763637935574103",
  type = "QuestFailNode",
  name = "QuestFail",
  pos = {
    x = 2230,
    y = 660,
  },
  propsData = {},
}
r4_0["1763637947466447"] = {
  key = "1763637947466447",
  type = "GoToNode",
  name = "前往",
  pos = {
    x = 1492.7754377543733,
    y = 284.65582611832605,
  },
  propsData = {
    GuideUIEnable = true,
    StaticCreatorId = 1930095,
    GuideType = "M",
    GuidePointName = "Mechanism_QuestTrigger_1930095",
  },
}
local r5_0 = {
  key = "1763637947466448",
  type = "ChangeStaticCreatorNode",
  name = "生成扶疏魅影",
  pos = {
    x = 1216.5074675324672,
    y = 286.58163829166244,
  },
}
r5_0.propsData = {
  ActiveEnable = true,
  EnableBlackScreenSync = false,
  EnableFadeIn = false,
  EnableFadeOut = false,
  NewTargetPointName = "",
  StaticCreatorIdList = {
    2070211
  },
}
r4_0["1763637947466448"] = r5_0
r5_0 = {
  key = "1763637947466449",
  type = "ChangeStaticCreatorNode",
  name = "销毁扶疏魅影",
  pos = {
    x = 1789.4925324675323,
    y = 293.9186512786756,
  },
}
r5_0.propsData = {
  ActiveEnable = false,
  EnableBlackScreenSync = false,
  EnableFadeIn = false,
  EnableFadeOut = false,
  NewTargetPointName = "",
  StaticCreatorIdList = {
    2070211
  },
}
r4_0["1763637947466449"] = r5_0
r4_0["1763637964358698"] = {
  key = "1763637964358698",
  type = "SpecialQuestSuccessNode",
  name = "成功完成特殊任务",
  pos = {
    x = 2106,
    y = 278,
  },
  propsData = {},
}
r4_0["1763637969070769"] = {
  key = "1763637969070769",
  type = "WaitingSpecialQuestFailNode",
  name = "等待特殊任务失败",
  pos = {
    x = 1592,
    y = 632,
  },
  propsData = {},
}
r5_0 = {
  key = "1763637972711929",
  type = "ChangeStaticCreatorNode",
  name = "销毁扶疏魅影",
  pos = {
    x = 1898,
    y = 648,
  },
}
r5_0.propsData = {
  ActiveEnable = false,
  EnableBlackScreenSync = false,
  EnableFadeIn = false,
  EnableFadeOut = false,
  NewTargetPointName = "",
  StaticCreatorIdList = {
    2070211
  },
}
r4_0["1763637972711929"] = r5_0
r5_0 = {
  key = "176537194275455835729",
  type = "ChangeStaticCreatorNode",
  name = "生成女孩",
  pos = {
    x = 1198.6297729618166,
    y = 138.33307533539738,
  },
}
r5_0.propsData = {
  ActiveEnable = true,
  EnableBlackScreenSync = false,
  EnableFadeIn = false,
  EnableFadeOut = false,
  NewTargetPointName = "",
  StaticCreatorIdList = {
    2070207
  },
}
r4_0["176537194275455835729"] = r5_0
r3_0.nodeData = r4_0
r3_0.commentData = {}
r2_0.questNodeData = r3_0
r1_0["176363793557488"] = r2_0
r0_0.storyNodeData = r1_0
r0_0.commentData = {}
return r0_0
