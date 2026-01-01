-- filename: @C:/Pack/Branch/geili11\Content/Script/StoryCreator\StoryFiles\BubbleTalk\51101001.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17582901223992913763",
      startPort = "StoryStart",
      endStory = "17582901267342913894",
      endPort = "In",
    },
    {
      startStory = "17582901267342913894",
      startPort = "Success",
      endStory = "17582901223992913766",
      endPort = "StoryEnd",
    }
  },
}
local r1_0 = {}
local r2_0 = {
  isStoryNode = true,
  key = "17582901223992913763",
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
r1_0["17582901223992913763"] = r2_0
r2_0 = {
  isStoryNode = true,
  key = "17582901223992913766",
  type = "StoryEndNode",
  name = "StoryEnd",
  pos = {
    x = 2430,
    y = 320,
  },
  propsData = {},
}
r2_0.questNodeData = {
  lineData = {},
  nodeData = {},
  commentData = {},
}
r1_0["17582901223992913766"] = r2_0
r2_0 = {
  isStoryNode = true,
  key = "17582901267342913894",
  type = "StoryNode",
  name = "任务节点",
  pos = {
    x = 1652,
    y = 368,
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
      startQuest = "17582901396542914199",
      startPort = "Out",
      endQuest = "17582901267342913898",
      endPort = "Success",
    },
    {
      startQuest = "17582901267342913895",
      startPort = "QuestStart",
      endQuest = "17582901396542914199",
      endPort = "In",
    }
  },
}
local r4_0 = {}
r4_0["17582901267342913895"] = {
  key = "17582901267342913895",
  type = "QuestStartNode",
  name = "QuestStart",
  pos = {
    x = 1247.6923076923076,
    y = 353.0769230769231,
  },
  propsData = {
    ModeType = 0,
  },
}
r4_0["17582901267342913898"] = {
  key = "17582901267342913898",
  type = "QuestSuccessNode",
  name = "QuestSuccess",
  pos = {
    x = 1990,
    y = 362.1428571428571,
  },
  propsData = {
    ModeType = 0,
  },
}
r4_0["17582901267342913901"] = {
  key = "17582901267342913901",
  type = "QuestFailNode",
  name = "QuestFail",
  pos = {
    x = 2800,
    y = 700,
  },
  propsData = {},
}
local r5_0 = {
  key = "17582901396542914199",
  type = "TalkNode",
  name = "对话节点",
  pos = {
    x = 1648,
    y = 370,
  },
}
r5_0.propsData = {
  IsNpcNode = false,
  FirstDialogueId = 51101001,
  FlowAssetPath = "",
  TalkType = "Bubble",
  BubblePlayType = "Once",
  UseProceduralCamera = false,
  ProceduralCameraId = 1,
  ShowSkipButton = true,
  ShowAutoPlayButton = true,
  ShowReviewButton = true,
  bBubblePlayCDEnable = false,
  BeginNewTargetPointName = "",
  EndNewTargetPointName = "",
  CameraLookAtTartgetPoint = "",
  RestoreStand = false,
  TalkActors = {},
  OverrideFailBlend = false,
}
r4_0["17582901396542914199"] = r5_0
r3_0.nodeData = r4_0
r3_0.commentData = {}
r2_0.questNodeData = r3_0
r1_0["17582901267342913894"] = r2_0
r0_0.storyNodeData = r1_0
r0_0.commentData = {}
return r0_0
