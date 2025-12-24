-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\FollowCommunityEvent.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    4,
    5,
    6,
    7,
    8
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [10, 10] id: 1
  return r1_1
end
local r3_0 = "FollowCommunityEvent"
local r4_0 = {
  AbroadCN = {
    CommunityList = r0_0.RT_1,
    Languagetype = "AbroadCN",
  },
  AbroadDE = {
    CommunityList = r0_0.RT_1,
    Languagetype = "AbroadDE",
  },
}
r4_0.AbroadEN = {
  CommunityList = {
    4,
    6,
    5,
    7,
    8,
    9,
    10,
    11
  },
  Languagetype = "AbroadEN",
}
r4_0.AbroadES = {
  CommunityList = r0_0.RT_1,
  Languagetype = "AbroadES",
}
r4_0.AbroadFR = {
  CommunityList = r0_0.RT_1,
  Languagetype = "AbroadFR",
}
r4_0.AbroadJP = {
  CommunityList = {
    4,
    6,
    5,
    7,
    8,
    11
  },
  Languagetype = "AbroadJP",
}
r4_0.AbroadKR = {
  CommunityList = {
    4,
    6,
    5,
    7,
    12,
    8
  },
  Languagetype = "AbroadKR",
}
r4_0.AbroadTC = {
  CommunityList = r0_0.RT_1,
  Languagetype = "AbroadTC",
}
r4_0.ChinaCN = {
  CommunityList = {
    1,
    2,
    3
  },
  Languagetype = "ChinaCN",
}
return r2_0(r3_0, r4_0)
