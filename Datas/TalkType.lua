-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\TalkType.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    bComplexCameraBlend = true,
    bNeedStage = true,
  },
  RT_2 = {
    bBlendDialogueCamera = true,
    bNeedStage = true,
  },
}
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [11, 11] id: 1
  return r1_1
end
local r4_0 = {
  AudioOnly = {
    BasicType = "Audio",
    ShowInStoryReview = false,
    TalkType = "AudioOnly",
  },
  Black = {
    BasicType = "Black",
    CameraType = "EmptyCamera",
    GameInput = false,
    SetPlayerInvincible = true,
    ShowGameUI = false,
    ShowInStoryReview = true,
    TalkType = "Black",
    UICanInteractive = false,
    UIName = "BlackTalkUI",
  },
}
r4_0.BlackISS = {
  BasicType = "Black",
  CameraType = "EmptyCamera",
  ExtraParams = {
    bBlackScreenSameScreen = true,
  },
  GameInput = false,
  SetPlayerInvincible = true,
  ShowGameUI = false,
  ShowInStoryReview = true,
  TalkType = "BlackISS",
  UICanInteractive = false,
  UIName = "BlackTalkUI",
}
r4_0.Boss = {
  BasicType = "Boss",
  CameraType = "PlayerCamera",
  GameInput = true,
  ShowGameUI = true,
  ShowInStoryReview = false,
  TalkType = "Boss",
  UICanInteractive = false,
}
r4_0.Bubble = {
  BasicType = "Bubble",
  CameraType = "PlayerCamera",
  GameInput = true,
  ShowGameUI = true,
  ShowInStoryReview = false,
  TalkType = "Bubble",
  UICanInteractive = false,
}
r4_0.Cinematic = {
  BasicType = "Cinematic",
  CameraType = "SequenceCamera",
  ExtraParams = r0_0.RT_1,
  GameInput = false,
  SetPlayerInvincible = true,
  ShowGameUI = false,
  ShowInStoryReview = true,
  TalkType = "Cinematic",
  UICanInteractive = true,
  UIName = "CinematicUI",
}
r4_0.FaultBlack = {
  BasicType = "Black",
  CameraType = "EmptyCamera",
  GameInput = false,
  SetPlayerInvincible = true,
  ShowGameUI = false,
  ShowInStoryReview = true,
  TalkType = "FaultBlack",
  UICanInteractive = false,
  UIName = "FaultBlackTalkUI",
}
r4_0.FixSimple = {
  BasicType = "FixSimple",
  CameraType = "FixedCamera",
  ExtraParams = r0_0.RT_2,
  GameInput = false,
  SetPlayerInvincible = true,
  ShowGameUI = false,
  ShowInStoryReview = true,
  TalkType = "FixSimple",
  UICanInteractive = true,
  UIName = "SimpleTalkUI",
}
r4_0.ForgingGuide = {
  BasicType = "Guide",
  CameraType = "PlayerCamera",
  GameInput = true,
  ShowGameUI = true,
  ShowInStoryReview = false,
  TalkType = "ForgingGuide",
  UICanInteractive = false,
  UIName = "TalkGuideUI",
}
r4_0.FreeSimple = {
  BasicType = "FreeSimple",
  CameraType = "FreeCamera",
  GameInput = false,
  SetPlayerInvincible = true,
  ShowGameUI = false,
  ShowInStoryReview = true,
  TalkType = "FreeSimple",
  UICanInteractive = true,
  UIName = "SimpleTalkUI",
}
r4_0.Guide = {
  BasicType = "Guide",
  CameraType = "PlayerCamera",
  GameInput = true,
  ShowGameUI = true,
  ShowInStoryReview = true,
  TalkType = "Guide",
  UICanInteractive = false,
  UIName = "TalkGuideUI",
}
r4_0.HintGuide = {
  BasicType = "Guide",
  CameraType = "PlayerCamera",
  GameInput = true,
  ShowGameUI = true,
  ShowInStoryReview = true,
  TalkType = "HintGuide",
  UICanInteractive = false,
  UIName = "TalkGuideUI",
}
r4_0.Impression = {
  BasicType = "Impression",
  CameraType = "FreeCamera",
  GameInput = false,
  SetPlayerInvincible = true,
  ShowGameUI = false,
  ShowInStoryReview = true,
  TalkType = "Impression",
  UICanInteractive = true,
  UIName = "ImpressionMainUI",
}
r4_0.LevelSequence = {
  BasicType = "Cinematic",
  CameraType = "SequenceCamera",
  ExtraParams = r0_0.RT_1,
  GameInput = false,
  SetPlayerInvincible = true,
  ShowGameUI = false,
  ShowInStoryReview = true,
  TalkType = "LevelSequence",
  UICanInteractive = true,
  UIName = "CinematicUI",
}
r4_0.NoIntFixSimple = {
  BasicType = "FixSimple",
  CameraType = "FixedCamera",
  ExtraParams = r0_0.RT_2,
  GameInput = false,
  SetPlayerInvincible = true,
  ShowGameUI = false,
  ShowInStoryReview = true,
  TalkType = "NoIntFixSimple",
  UICanInteractive = true,
  UIName = "SimpleTalkUI",
}
r4_0.PanFixSimple = {
  BasicType = "FixSimple",
  CameraType = "FixedCamera",
  ExtraParams = r0_0.RT_2,
  GameInput = false,
  SetPlayerInvincible = true,
  ShowGameUI = false,
  ShowInStoryReview = true,
  TalkType = "PanFixSimple",
  UICanInteractive = true,
  UIName = "SimpleTalkUI",
}
r4_0.QuestImpression = {
  BasicType = "FixSimple",
  CameraType = "FixedCamera",
  ExtraParams = r0_0.RT_2,
  GameInput = false,
  SetPlayerInvincible = true,
  ShowGameUI = false,
  ShowInStoryReview = true,
  TalkType = "QuestImpression",
  UICanInteractive = true,
  UIName = "ImpressionMainUI",
}
r4_0.QueueGuide = {
  BasicType = "Guide",
  CameraType = "PlayerCamera",
  GameInput = true,
  ShowGameUI = true,
  ShowInStoryReview = true,
  TalkType = "QueueGuide",
  UICanInteractive = false,
  UIName = "TalkGuideUI",
}
r4_0.RougeLike = {
  BasicType = "RougeLike",
  CameraType = "PlayerCamera",
  GameInput = true,
  ShowGameUI = true,
  ShowInStoryReview = false,
  TalkType = "RougeLike",
  UICanInteractive = false,
}
r4_0.SpecialQuestFail = {
  BasicType = "Black",
  CameraType = "EmptyCamera",
  GameInput = false,
  SetPlayerInvincible = true,
  ShowGameUI = false,
  ShowInStoryReview = true,
  TalkType = "SpecialQuestFail",
  UICanInteractive = false,
  UIName = "BlackTalkUI",
}
r4_0.UnimportGuide = {
  BasicType = "Guide",
  CameraType = "PlayerCamera",
  GameInput = true,
  ShowGameUI = true,
  ShowInStoryReview = true,
  TalkType = "UnimportGuide",
  UICanInteractive = false,
  UIName = "TalkGuideUI",
}
r4_0.White = {
  BasicType = "Black",
  CameraType = "EmptyCamera",
  GameInput = false,
  SetPlayerInvincible = true,
  ShowGameUI = false,
  ShowInStoryReview = true,
  TalkType = "White",
  UICanInteractive = false,
  UIName = "WhiteTalkUI",
}
return r1_0("TalkType", r4_0)
