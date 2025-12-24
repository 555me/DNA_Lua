-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\TalkTag.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    [1] = 0,
    [2] = 1,
  },
}
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [7, 7] id: 1
  return r1_1
end
local r4_0 = {
  Huozai04Tag = {
    TalkTagId = "Huozai04Tag",
    Value = r0_0.RT_1,
  },
}
r4_0.TestTag = {
  TalkTagId = "TestTag",
  Value = {
    [1] = 0,
    [2] = 1,
    [3] = 2,
    [4] = 3,
    [5] = 4,
  },
}
r4_0.XiAoTag = {
  TalkTagId = "XiAoTag",
  Value = r0_0.RT_1,
}
return r1_0("TalkTag", r4_0)
