-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\ZhiLiuEntrust.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    6001001,
    6002001,
    6003001,
    6004001
  },
}
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [9, 9] id: 1
  return r1_1
end
local r4_0 = {}
local r5_0 = {
  ChildClass = 1,
  EntrustText = "ZhiLiuEntrustText01",
  EntrustType = 1,
  Key = 101,
}
r5_0.Resource = {
  [1] = {
    [4010001] = 2,
  },
  [2] = {
    [4010002] = 2,
  },
}
r5_0.RewardId = 110001
r4_0[101] = r5_0
r4_0[102] = {
  EntrustMonsters = r0_0.RT_1,
  EntrustText = "ZhiLiuEntrustText02",
  EntrustType = 2,
  Key = 102,
  QuestChainId = 400101,
  RewardId = 110002,
}
r5_0 = {
  ChildClass = 1,
  EntrustText = "ZhiLiuEntrustText01",
  EntrustType = 1,
  Key = 201,
}
r5_0.Resource = {
  [1] = {
    [4010003] = 2,
  },
  [2] = {
    [4010004] = 2,
  },
}
r5_0.RewardId = 110003
r4_0[201] = r5_0
r4_0[202] = {
  EntrustMonsters = r0_0.RT_1,
  EntrustText = "ZhiLiuEntrustText02",
  EntrustType = 2,
  Key = 202,
  QuestChainId = 400102,
  RewardId = 110004,
}
local r6_0 = {
  ChildClass = 1,
  EntrustText = "ZhiLiuEntrustText01",
  EntrustType = 1,
  Key = 301,
}
r6_0.Resource = {
  [1] = {
    [4010005] = 2,
  },
  [2] = {
    [4010006] = 2,
  },
  [3] = {
    [4010007] = 2,
  },
}
r6_0.RewardId = 110005
r4_0[301] = r6_0
r4_0[302] = {
  EntrustMonsters = r0_0.RT_1,
  EntrustText = "ZhiLiuEntrustText02",
  EntrustType = 2,
  Key = 302,
  QuestChainId = 400103,
  RewardId = 110006,
}
r6_0 = {
  ChildClass = 1,
  EntrustText = "ZhiLiuEntrustText01",
  EntrustType = 1,
  Key = 401,
}
r6_0.Resource = {
  [1] = {
    [4010008] = 2,
  },
  [2] = {
    [4010009] = 2,
  },
  [3] = {
    [4010012] = 2,
  },
}
r6_0.RewardId = 110007
r4_0[401] = r6_0
r4_0[402] = {
  EntrustMonsters = r0_0.RT_1,
  EntrustText = "ZhiLiuEntrustText02",
  EntrustType = 2,
  Key = 402,
  QuestChainId = 400104,
  RewardId = 110008,
}
r6_0 = {
  ChildClass = 1,
  EntrustText = "ZhiLiuEntrustText01",
  EntrustType = 1,
  Key = 501,
}
r6_0.Resource = {
  [1] = {
    [4010010] = 2,
  },
  [2] = {
    [4010011] = 2,
  },
}
r6_0.RewardId = 110009
r4_0[501] = r6_0
r4_0[502] = {
  EntrustMonsters = r0_0.RT_1,
  EntrustText = "ZhiLiuEntrustText02",
  EntrustType = 2,
  Key = 502,
  QuestChainId = 400105,
  RewardId = 110010,
}
r6_0 = {
  ChildClass = 1,
  EntrustText = "ZhiLiuEntrustText01",
  EntrustType = 1,
  Key = 601,
}
r6_0.Resource = {
  [1] = {
    [4010013] = 2,
  },
  [2] = {
    [4020001] = 2,
  },
  [3] = {
    [4020002] = 2,
  },
}
r6_0.RewardId = 110011
r4_0[601] = r6_0
r4_0[602] = {
  EntrustMonsters = r0_0.RT_1,
  EntrustText = "ZhiLiuEntrustText02",
  EntrustType = 2,
  Key = 602,
  QuestChainId = 400106,
  RewardId = 110012,
}
r6_0 = {
  ChildClass = 1,
  EntrustText = "ZhiLiuEntrustText01",
  EntrustType = 1,
  Key = 701,
}
r6_0.Resource = {
  [1] = {
    [4020003] = 2,
  },
  [2] = {
    [4020004] = 2,
  },
  [3] = {
    [4020005] = 2,
  },
}
r6_0.RewardId = 110013
r4_0[701] = r6_0
r4_0[702] = {
  EntrustMonsters = r0_0.RT_1,
  EntrustText = "ZhiLiuEntrustText02",
  EntrustType = 2,
  Key = 702,
  QuestChainId = 400107,
  RewardId = 110014,
}
return r1_0("ZhiLiuEntrust", r4_0)
