-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Client\CustomTypes\DailyPack.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = _G.TypeClass
local r1_0 = require("BluePrints.Client.CustomTypes.BaseTypes")
local r2_0 = require("BluePrints.Client.CustomTypes.CustomTypes")
local r3_0 = require("NetworkEngine.Common.Prop")
local r5_0 = r0_0("DailyPack", r2_0.CustomAttr)
r5_0.__Props__ = {
  DailyPackId = r3_0.prop("Int", "client save"),
  LoginDays = r3_0.prop("Int", "client save", 0),
  ExpiredTime = r3_0.prop("Int", "client save", 0),
  Count = r3_0.prop("Int", "client save", 0),
  State = r3_0.prop("Int", "client save", 0),
  RewardGot = r3_0.prop("Int2IntDict", "client save"),
  LastRefreshTime = r3_0.prop("Int", "client save"),
  RewardRecord = r3_0.prop("Int2IntListDict", "save", {}),
  RewardPeriod = r3_0.getter("Data", "RewardPeriod"),
  RewardMailId = r3_0.getter("Data", "RewardMailId"),
  Reward = r3_0.getter("Data", "Reward"),
  LoginRequire = r3_0.getter("Data", "LoginRequire"),
  BuyReward = r3_0.getter("Data", "BuyReward"),
}
function r5_0.Init(r0_1, r1_1)
  -- line: [33, 36] id: 1
  r0_1.DailyPackId = r1_1
  r0_1.LoginDays = 1
end
function r5_0.Data(r0_2)
  -- line: [38, 40] id: 2
  return DataMgr.DailyPack[r0_2.DailyPackId]
end
function r5_0.Active(r0_3)
  -- line: [42, 52] id: 3
  local r1_3 = TimeUtils.NowTime()
  if r0_3.State == 1 and r1_3 < r0_3.ExpiredTime then
    r0_3.ExpiredTime = r0_3.ExpiredTime + r0_3.RewardPeriod * CommonConst.DayTime
  else
    r0_3.ExpiredTime = TimeUtils.NextDailyRefreshTime(r1_3) + (r0_3.RewardPeriod + -1) * CommonConst.DayTime
    r0_3:Reset()
  end
  r0_3.State = 1
  r0_3.Count = r0_3.Count + 1
end
function r5_0.Reset(r0_4)
  -- line: [54, 58] id: 4
  r0_4.RewardGot = {}
  r0_4.Count = 0
  r0_4.LoginDays = 1
end
function r5_0.IsActive(r0_5)
  -- line: [60, 62] id: 5
  local r1_5 = r0_5.State
  if r1_5 == 1 then
    r1_5 = TimeUtils.NowTime() < r0_5.ExpiredTime
  else
    goto label_9	-- block#2 is visited secondly
  end
  return r1_5
end
function r5_0.LoginAdd(r0_6)
  -- line: [64, 66] id: 6
  r0_6.LoginDays = r0_6.LoginDays + 1
end
function r5_0.SetRewardGot(r0_7)
  -- line: [68, 71] id: 7
  r0_7.RewardGot[r0_7.LoginDays] = 1
  r0_7.LastRefreshTime = TimeUtils.NowTime()
end
function r5_0.GetRewardMailId(r0_8)
  -- line: [73, 75] id: 8
  return r0_8.RewardMailId
end
function r5_0.SetRewardRecord(r0_9, r1_9, r2_9)
  -- line: [77, 80] id: 9
  r0_9.RewardRecord[CommonUtils.Size(r0_9.RewardRecord) + 1] = {
    r0_9.LoginDays,
    r1_9,
    r2_9
  }
end
function r5_0.HasGetDailyReward(r0_10)
  -- line: [82, 84] id: 10
  return TimeUtils.GetIntervalDay(r0_10.LastRefreshTime, TimeUtils.NowTime()) < 1
end
function r5_0.GetLoginRewardId(r0_11)
  -- line: [86, 88] id: 11
  return r0_11.Reward[1]
end
require("NetworkEngine.Common.Assemble").FormatProperties(r5_0)
local r6_0 = r0_0("DailyPackDict", r2_0.CustomDict)
r6_0.KeyType = r1_0.Int
r6_0.ValueType = r5_0
function r6_0.GetDailyPack(r0_12, r1_12)
  -- line: [96, 98] id: 12
  return r0_12[r1_12]
end
function r6_0.GetNewDailyPack(r0_13, r1_13)
  -- line: [100, 105] id: 13
  if not r0_13[r1_13] then
    r0_13[r1_13] = r0_13:NewDailyPack(r1_13)
  end
  return r0_13[r1_13]
end
function r6_0.NewDailyPack(r0_14, r1_14)
  -- line: [107, 109] id: 14
  return r5_0(r1_14)
end
return {
  DailyPackDict = r6_0,
  DailyPack = r5_0,
}
