-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\BattlePassTab.lua
-- version: lua54
-- line: [0, 0] id: 0
return ((DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end)("BattlePassTab", {
  BattlePassMission = {
    Sequence = 90,
    TabIcon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_BattlePass_Task.T_Tab_BattlePass_Task",
    TabName = "UI_BattlePass_MissionTab",
    WidgetUI = "BattlePassMission",
  },
  BattlePassPetSelection = {
    Sequence = 80,
    TabIcon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_BattlePass_ChoosePet.T_Tab_BattlePass_ChoosePet",
    TabName = "UI_BattlePass_PetSelectionTab",
    WidgetUI = "BattlePassPetSelection",
  },
  BattlePassReward = {
    Sequence = 100,
    TabIcon = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_BattlePass_Reward.T_Tab_BattlePass_Reward",
    TabName = "UI_BattlePass_RewardTab",
    WidgetUI = "BattlePassReward",
  },
})
