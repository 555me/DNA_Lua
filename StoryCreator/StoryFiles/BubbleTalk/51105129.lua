-- filename: @C:/Pack/Branch/geili11\Content/Script/StoryCreator\StoryFiles\BubbleTalk\51105129.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  storyName = "Home",
  storyDescription = "",
  lineData = {
    {
      startStory = "17636296718021022183",
      startPort = "StoryStart",
      endStory = "17636296718021022185",
      endPort = "In",
    },
    {
      startStory = "17636296718021022185",
      startPort = "Success",
      endStory = "17636296718021022184",
      endPort = "StoryEnd",
    }
  },
}
local r1_0 = {}
local r2_0 = {
  isStoryNode = true,
  key = "17636296718021022183",
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
r1_0["17636296718021022183"] = r2_0
r2_0 = {
  isStoryNode = true,
  key = "17636296718021022184",
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
r1_0["17636296718021022184"] = r2_0
r2_0 = {
  isStoryNode = true,
  key = "17636296718021022185",
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
      startQuest = "17636296718021022189",
      startPort = "Out",
      endQuest = "17636296718021022187",
      endPort = "Success",
    },
    {
      startQuest = "17636296718021022186",
      startPort = "QuestStart",
      endQuest = "1758541511093443",
      endPort = "In",
    },
    {
      startQuest = "1758541511093443",
      startPort = "Branch_1",
      endQuest = "17636296718021022189",
      endPort = "In",
    }
  },
}
local r4_0 = {}
local r5_0 = {
  key = "1758541511093443",
  type = "BranchTriggerNode",
  name = "触发分支节点",
  pos = {
    x = 1294,
    y = 292,
  },
}
r5_0.propsData = {
  Branches = {
    200012
  },
}
r4_0["1758541511093443"] = r5_0
r4_0["17636296718021022186"] = {
  key = "17636296718021022186",
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
r4_0["17636296718021022187"] = {
  key = "17636296718021022187",
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
r4_0["17636296718021022188"] = {
  key = "17636296718021022188",
  type = "QuestFailNode",
  name = "QuestFail",
  pos = {
    x = 2800,
    y = 700,
  },
  propsData = {},
}
r5_0 = {
  key = "17636296718021022189",
  type = "TalkNode",
  name = "对话节点",
  pos = {
    x = 1648,
    y = 370,
  },
}
r5_0.propsData = {
  IsNpcNode = false,
  IsPlayerTurnToNPC = true,
  IsNPCTurnToPlayer = true,
  FirstDialogueId = 51105129,
  FlowAssetPath = "",
  TalkType = "FreeSimple",
  BlendInTime = 0,
  BlendOutTime = 0,
  InType = "BlendIn",
  OutType = "BlendOut",
  BlendEaseExp = 2,
  UseProceduralCamera = false,
  ProceduralCameraId = 1,
  HideNpcs = false,
  HideMonsters = true,
  HideAllBattleEntity = true,
  HideMechanismsFX = true,
  ShowSkipButton = true,
  ShowAutoPlayButton = true,
  ShowReviewButton = true,
  ShowWikiButton = true,
  SkipToOption = false,
  DisableNpcOptimization = false,
  DoNotReceiveCharacterShadow = false,
  BeginNewTargetPointName = "",
  EndNewTargetPointName = "",
  CameraLookAtTartgetPoint = "",
  RestoreStand = false,
  PauseNpcBT = true,
  TalkActors = {},
  OptionType = "normal",
  FreezeWorldComposition = false,
  bTravelFullLoadWorldComposition = false,
  SwitchToMaster = "None",
  PlayerSwitchEmoIdle = true,
  NormalOptions = {},
  OverrideFailBlend = false,
}
r4_0["17636296718021022189"] = r5_0
r3_0.nodeData = r4_0
r3_0.commentData = {}
r2_0.questNodeData = r3_0
r1_0["17636296718021022185"] = r2_0
r0_0.storyNodeData = r1_0
r0_0.commentData = {}
return r0_0
