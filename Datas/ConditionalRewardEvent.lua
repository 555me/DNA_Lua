-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\ConditionalRewardEvent.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    "CharTitle"
  },
}
return ((DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [6, 6] id: 1
  return r1_1
end)("ConditionalRewardEvent", {
  [107001] = {
    EventId = 107001,
    EventReward = 107001,
    HideBPNode = r0_0.RT_1,
    RewardClaimCondition = 6014,
  },
  [107002] = {
    EventId = 107002,
    EventReward = 107002,
    HideBPNode = r0_0.RT_1,
    RewardClaimCondition = 6015,
  },
  [107003] = {
    EventId = 107003,
    EventReward = 107006,
    HideBPNode = r0_0.RT_1,
    RewardClaimCondition = 6022,
    RewardUnlockTips = "UI_RewardUnlockTips_107003",
  },
})
