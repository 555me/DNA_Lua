-- filename: @C:/Pack/Branch/geili11\Content/Script/StoryCreator\StoryFiles\ActiveQuest\ActiveThea\Gossip\51105840.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1762928061409344274",
      startPort = "StoryStart",
      endStory = "1762928061409344276",
      endPort = "In",
    },
    {
      startStory = "1762928061409344276",
      startPort = "Success",
      endStory = "1762928061409344275",
      endPort = "StoryEnd",
    }
  },
}
local r1_0 = {}
local r2_0 = {
  isStoryNode = true,
  key = "1762928061409344274",
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
r1_0["1762928061409344274"] = r2_0
r2_0 = {
  isStoryNode = true,
  key = "1762928061409344275",
  type = "StoryEndNode",
  name = "StoryEnd",
  pos = {
    x = 2800,
    y = 300,
  },
  propsData = {},
}
r2_0.questNodeData = {
  lineData = {},
  nodeData = {},
  commentData = {},
}
r1_0["1762928061409344275"] = r2_0
r2_0 = {
  isStoryNode = true,
  key = "1762928061409344276",
  type = "StoryNode",
  name = "任务节点",
  pos = {
    x = 1612,
    y = 366,
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
      startQuest = "1762928061409344277",
      startPort = "QuestStart",
      endQuest = "1762928061409344280",
      endPort = "In",
    },
    {
      startQuest = "1762928061409344280",
      startPort = "Out",
      endQuest = "1762928061409344278",
      endPort = "Success",
    }
  },
}
local r4_0 = {}
r4_0["1762928061409344277"] = {
  key = "1762928061409344277",
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
r4_0["1762928061409344278"] = {
  key = "1762928061409344278",
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
r4_0["1762928061409344279"] = {
  key = "1762928061409344279",
  type = "QuestFailNode",
  name = "QuestFail",
  pos = {
    x = 2800,
    y = 700,
  },
  propsData = {},
}
local r5_0 = {
  key = "1762928061409344280",
  type = "TalkNode",
  name = "对话节点",
  pos = {
    x = 1591.4117647058824,
    y = 371.0588235294119,
  },
}
r5_0.propsData = {
  IsNpcNode = false,
  FirstDialogueId = 51105840,
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
r4_0["1762928061409344280"] = r5_0
r3_0.nodeData = r4_0
r3_0.commentData = {}
r2_0.questNodeData = r3_0
r1_0["1762928061409344276"] = r2_0
r0_0.storyNodeData = r1_0
r0_0.commentData = {}
return r0_0
