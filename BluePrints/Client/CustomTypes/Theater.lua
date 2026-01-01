-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Client\CustomTypes\Theater.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = _G.TypeClass
local r1_0 = require("BluePrints.Client.CustomTypes.BaseTypes")
local r2_0 = require("BluePrints.Client.CustomTypes.CustomTypes")
local r3_0 = require("NetworkEngine.Common.Prop")
local r5_0 = r0_0("Theater", r2_0.CustomAttr)
r5_0.__Props__ = {
  EventId = r3_0.prop("Int", "client save"),
  Tasks = r3_0.prop("TargetCounter.TargetCounterDict", "client save"),
  RewardTimes = r3_0.prop("Int", "client save"),
  PerformRewardRecord = r3_0.prop("IntSet", ""),
  DonatePrizeMailsGet = r3_0.prop("Int2IntDict", "client save"),
}
function r5_0.Init(r0_1, r1_1)
  -- line: [20, 23] id: 1
  r0_1.EventId = r1_1
  r0_1:InitTheaterTasks()
end
function r5_0.InitTheaterTasks(r0_2)
  -- line: [25, 29] id: 2
  for r5_2, r6_2 in pairs(DataMgr.TheaterTask) do
    r0_2.Tasks:NewTargetCounter(r5_2, r6_2)
  end
  -- close: r1_2
end
function r5_0.ResetTask(r0_3, r1_3)
  -- line: [31, 36] id: 3
  if not r0_3.Tasks[r1_3] then
    return 
  end
  r0_3.Tasks[r1_3]:Reset()
end
function r5_0.GetTask(r0_4, r1_4)
  -- line: [38, 40] id: 4
  return r0_4.Tasks[r1_4]
end
function r5_0.RefreshProgress(r0_5, r1_5, r2_5, r3_5, r4_5)
  -- line: [42, 44] id: 5
  r0_5.Tasks[r1_5]:TargetRefreshProgress(r2_5, r3_5, r4_5)
end
function r5_0.SetRewardsGot(r0_6, r1_6)
  -- line: [46, 48] id: 6
  r0_6.Tasks[r1_6].RewardsGot = true
end
function r5_0.IsPerformRewardGot(r0_7, r1_7)
  -- line: [50, 52] id: 7
  return r0_7.PerformRewardRecord:HasElement(r1_7)
end
function r5_0.SetPerformRewardGot(r0_8, r1_8)
  -- line: [54, 56] id: 8
  r0_8.PerformRewardRecord:AddElement(r1_8)
end
function r5_0.IsMailRewarded(r0_9, r1_9)
  -- line: [58, 60] id: 9
  return r0_9.DonatePrizeMailsGet[r1_9] == 1
end
function r5_0.SetMailRewarded(r0_10, r1_10)
  -- line: [62, 64] id: 10
  r0_10.DonatePrizeMailsGet[r1_10] = 1
end
require("NetworkEngine.Common.Assemble").FormatProperties(r5_0)
local r6_0 = r0_0("TheaterDict", r2_0.CustomDict)
r6_0.KeyType = r1_0.Int
r6_0.ValueType = r5_0
function r6_0.GetTheater(r0_11, r1_11)
  -- line: [72, 74] id: 11
  return r0_11[r1_11]
end
function r6_0.NewTheater(r0_12, r1_12)
  -- line: [76, 78] id: 12
  return r5_0(r1_12)
end
function r6_0.GetNewTheater(r0_13, r1_13)
  -- line: [80, 86] id: 13
  if not r0_13[r1_13] then
    r0_13[r1_13] = r0_13:NewTheater(r1_13)
  end
  return r0_13[r1_13]
end
return {
  Theater = r5_0,
  TheaterDict = r6_0,
}
