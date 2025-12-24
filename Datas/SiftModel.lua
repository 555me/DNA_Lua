-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\SiftModel.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    1,
    5,
    2,
    3,
    4
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [10, 10] id: 1
  return r1_1
end
local r3_0 = "SiftModel"
local r4_0 = {
  [666] = {
    SiftModelId = 666,
    SiftModelName = "ModSift",
    SubId = r0_0.RT_1,
  },
}
r4_0[1001] = {
  SiftModelId = 1001,
  SiftModelName = "BackpackResoureSift",
  SubId = {
    100101
  },
}
r4_0[1002] = {
  SiftModelId = 1002,
  SiftModelName = "BackpackModSift",
  SubId = r0_0.RT_1,
}
r4_0[1003] = {
  SiftModelId = 1003,
  SiftModelName = "BackpackMeeleSift",
  SubId = {
    100302
  },
}
r4_0[1004] = {
  SiftModelId = 1004,
  SiftModelName = "BackpackRangedSift",
  SubId = {
    100402
  },
}
r4_0[1005] = {
  SiftModelId = 1005,
  SiftModelName = "ForgeModSift",
  SubId = {
    2,
    3,
    4
  },
}
r4_0[1006] = {
  SiftModelId = 1006,
  SubId = {
    100601,
    100602,
    100603,
    100604
  },
}
return r2_0(r3_0, r4_0)
