-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\DailyLogin.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    1010012,
    1010012,
    1010013,
    1010012,
    1010012,
    1010012,
    1010014
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [12, 12] id: 1
  return r1_1
end
local r3_0 = "DailyLogin"
local r4_0 = {
  [101001] = {
    EventId = 101001,
    EventReward = r0_0.RT_1,
    LoginDuration = 7,
    RewardBannerBP = "/Game/UI/WBP/Activity/Widget/SevenDay/Saiqi/WBP_Activity_SevenDayItems.WBP_Activity_SevenDayItems",
  },
  [101002] = {
    EventId = 101002,
    EventReward = r0_0.RT_1,
    LoginDuration = 7,
    RewardBannerBP = "/Game/UI/WBP/Activity/Widget/SevenDay/Baiheng/WBP_Activity_SevenDayItems.WBP_Activity_SevenDayItems",
  },
  [101003] = {
    EventId = 101003,
    EventReward = r0_0.RT_1,
    LoginDuration = 7,
    RewardBannerBP = "/Game/UI/WBP/Activity/Widget/SevenDay/Baiheng/WBP_Activity_SevenDayItems.WBP_Activity_SevenDayItems",
  },
}
r4_0[101004] = {
  EventId = 101004,
  EventReward = {
    1010041,
    1010042,
    1010043,
    1010044,
    1010045
  },
  LoginDuration = 5,
}
r4_0[101005] = {
  EventId = 101005,
  EventReward = r0_0.RT_1,
  LoginDuration = 7,
  RewardBannerBP = "/Game/UI/WBP/Activity/Widget/SevenDay/Baiheng/WBP_Activity_SevenDayItems.WBP_Activity_SevenDayItems",
}
return r2_0(r3_0, r4_0)
