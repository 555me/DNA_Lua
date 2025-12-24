-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\TestCharGroupPool.lua
-- version: lua54
-- line: [0, 0] id: 0
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end
local r2_0 = "TestCharGroupPool"
local r3_0 = {}
r3_0[1] = {
  PoolId = 1,
  RuleIdList = {
    "101101:1010101",
    "102101:1010201",
    "102301:1010101",
    "102401:1020502",
    "103101:1020203",
    "104201:1010203"
  },
}
return r1_0(r2_0, r3_0)
