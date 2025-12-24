-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\WalnutSelectDungeon.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    2,
    3
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [7, 7] id: 1
  return r1_1
end
local r3_0 = "WalnutSelectDungeon"
local r4_0 = {}
r4_0[1] = {
  DungeonId = {
    60102,
    60202,
    60302,
    60402,
    60502,
    60602,
    60702,
    60802,
    60902,
    61002,
    61102
  },
  DungeonRandomNum = r0_0.RT_1,
  Sequence = 1,
  WalnutType = 1,
}
r4_0[2] = {
  DungeonId = {
    62102,
    62202,
    62302,
    62402,
    62502,
    62602,
    62702,
    62802,
    62902,
    63002,
    63102
  },
  DungeonRandomNum = r0_0.RT_1,
  Sequence = 2,
  WalnutType = 2,
}
r4_0[3] = {
  DungeonId = {
    64102,
    64202,
    64302,
    64402,
    64502,
    64602,
    64702,
    64802,
    64902,
    65002,
    65102
  },
  DungeonRandomNum = r0_0.RT_1,
  Sequence = 3,
  WalnutType = 3,
}
return r2_0(r3_0, r4_0)
