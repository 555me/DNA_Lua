-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\AfterLoadingFSM.lua
-- version: lua54
-- line: [0, 0] id: 0
return ((DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end)("AfterLoadingFSM", {
  BeginState = {
    FSMState = "BeginState",
    NextState = "JumpToRogueMain",
  },
  DungeonUI = {
    FSMState = "DungeonUI",
    NextState = "OpenForcePopup",
  },
  DynamicQuest = {
    FSMState = "DynamicQuest",
    NextState = "EndState",
  },
  EndState = {
    FSMState = "EndState",
  },
  GameplayReward = {
    FSMState = "GameplayReward",
    NextState = "SystemUnlock",
  },
  JumpToRogueMain = {
    FSMState = "JumpToRogueMain",
    NextState = "GameplayReward",
  },
  LayoutPlan = {
    FSMState = "LayoutPlan",
    NextState = "DynamicQuest",
  },
  MainLineQuest = {
    FSMState = "MainLineQuest",
    NextState = "LayoutPlan",
  },
  OpenForcePopup = {
    FSMState = "OpenForcePopup",
    NextState = "MainLineQuest",
  },
  SystemUnlock = {
    FSMState = "SystemUnlock",
    NextState = "TriggerGuide",
  },
  TriggerGuide = {
    FSMState = "TriggerGuide",
    NextState = "DungeonUI",
  },
})
