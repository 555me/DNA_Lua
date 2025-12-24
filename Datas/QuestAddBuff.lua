-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\QuestAddBuff.lua
-- version: lua54
-- line: [0, 0] id: 0
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end
local r2_0 = "QuestAddBuff"
local r3_0 = {}
r3_0[10010108] = {
  AddorRemove = "Add",
  BuffId = {
    304,
    309
  },
  QuestId = 10010108,
  QuestStartorSuccess = "Start",
}
r3_0[10010212] = {
  AddorRemove = "Add",
  BuffId = {
    99
  },
  QuestId = 10010212,
  QuestStartorSuccess = "Start",
}
r3_0[10010305] = {
  AddorRemove = "Add",
  BuffId = {
    306
  },
  QuestId = 10010305,
  QuestStartorSuccess = "Success",
}
r3_0[10010306] = {
  AddorRemove = "Remove",
  BuffId = {
    304,
    99,
    306,
    309
  },
  QuestId = 10010306,
  QuestStartorSuccess = "Success",
}
return r1_0(r2_0, r3_0)
