-- filename: @C:/Pack/Branch/geili11\Content/Script/StoryCreator\StoryFiles\ActiveQuest\ActiveThea\Gossip\51105809.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "1761560736802343929",
      startPort = "StoryStart",
      endStory = "1761560736802343931",
      endPort = "In",
    },
    {
      startStory = "1761560736802343931",
      startPort = "Success",
      endStory = "1761560736802343930",
      endPort = "StoryEnd",
    }
  },
}
local r1_0 = {}
local r2_0 = {
  isStoryNode = true,
  key = "1761560736802343929",
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
r1_0["1761560736802343929"] = r2_0
r2_0 = {
  isStoryNode = true,
  key = "1761560736802343930",
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
r1_0["1761560736802343930"] = r2_0
r2_0 = {
  isStoryNode = true,
  key = "1761560736802343931",
  type = "StoryNode",
  name = "任务节点",
  pos = {
    x = 1612,
    y = 304,
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
      startQuest = "1761560736802343932",
      startPort = "QuestStart",
      endQuest = "1761560736802343935",
      endPort = "In",
    },
    {
      startQuest = "1761560736802343935",
      startPort = "Out",
      endQuest = "1761560736802343933",
      endPort = "Success",
    }
  },
}
local r4_0 = {}
r4_0["1761560736802343932"] = {
  key = "1761560736802343932",
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
r4_0["1761560736802343933"] = {
  key = "1761560736802343933",
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
r4_0["1761560736802343934"] = {
  key = "1761560736802343934",
  type = "QuestFailNode",
  name = "QuestFail",
  pos = {
    x = 2800,
    y = 700,
  },
  propsData = {},
}
local r5_0 = {
  key = "1761560736802343935",
  type = "TalkNode",
  name = "对话节点",
  pos = {
    x = 1698.5714285714287,
    y = 363.7142857142858,
  },
}
r5_0.propsData = {
  IsNpcNode = false,
  FirstDialogueId = 51105809,
  FlowAssetPath = "",
  TalkType = "Bubble",
  BubblePlayType = "StayOnLast",
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
r4_0["1761560736802343935"] = r5_0
r3_0.nodeData = r4_0
r3_0.commentData = {}
r2_0.questNodeData = r3_0
r1_0["1761560736802343931"] = r2_0
r0_0.storyNodeData = r1_0
r0_0.commentData = {}
return r0_0
