-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\TheaterDonateStep.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    [1] = 15000000,
    [2] = 10000000,
    [3] = 2000000,
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [8, 8] id: 1
  return r1_1
end
local r3_0 = "TheaterDonateStep"
local r4_0 = {}
local r5_0 = 103011
local r6_0 = {}
r6_0[1] = {
  EventId = 103011,
  Expectation = {
    0,
    0.3,
    0.7,
    1
  },
  MailId = 10034,
  Num = {
    [1] = 15000000,
    [2] = 15000000,
    [3] = 2000000,
  },
  Resource = {
    [1] = 20009,
    [2] = 20012,
    [3] = 4030001,
  },
  RewardViewId = 1030080,
  StepId = 1,
}
r6_0[2] = {
  EventId = 103011,
  Expectation = {
    0,
    0,
    0,
    0.1,
    0.4,
    0.7,
    1
  },
  MailId = 10035,
  Num = r0_0.RT_1,
  Resource = {
    [1] = 20002,
    [2] = 20004,
    [3] = 4030001,
  },
  RewardViewId = 1030081,
  StepId = 2,
}
r6_0[3] = {
  EventId = 103011,
  Expectation = {
    0,
    0,
    0,
    0,
    0,
    0,
    0.1,
    0.4,
    0.7,
    1
  },
  MailId = 10036,
  Num = r0_0.RT_1,
  Resource = {
    [1] = 20005,
    [2] = 20016,
    [3] = 4030001,
  },
  RewardViewId = 1030082,
  StepId = 3,
}
r4_0[r5_0] = r6_0
return r2_0(r3_0, r4_0)
