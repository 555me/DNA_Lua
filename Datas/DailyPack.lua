-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\DailyPack.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    [1] = 1,
    [2] = 2,
    [3] = 3,
    [4] = 4,
    [5] = 5,
  },
}
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [10, 10] id: 1
  return r1_1
end
local r4_0 = {}
r4_0[9001] = {
  BannerCharId = 2401,
  BannerId = 116,
  BuyReward = 12108,
  DailyPackId = 9001,
  GoodsId = "com.hero.dna.Pay_DailyCharaShards_fushu",
  LoginRequire = r0_0.RT_1,
  MainRewardCount = 20,
  MainRewardId = 1001101,
  Name = "DailyPack_Name_1",
  Reward = {
    [1] = 12109,
    [2] = 12109,
    [3] = 12109,
    [4] = 12109,
    [5] = 12109,
  },
  RewardMailId = 10037,
  RewardPeriod = 5,
}
r4_0[9002] = {
  BannerCharId = 1503,
  BannerId = 125,
  BuyReward = 12117,
  DailyPackId = 9002,
  GoodsId = "com.hero.dna.Pay_DailyCharaShards_kezhou",
  LoginRequire = r0_0.RT_1,
  MainRewardCount = 20,
  MainRewardId = 1001101,
  Name = "DailyPack_Name_1",
  Reward = {
    [1] = 12118,
    [2] = 12118,
    [3] = 12118,
    [4] = 12118,
    [5] = 12118,
  },
  RewardMailId = 10037,
  RewardPeriod = 5,
}
return r1_0("DailyPack", r4_0)
