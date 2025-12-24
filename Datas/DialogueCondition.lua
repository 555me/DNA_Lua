-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\DialogueCondition.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    QuestChainId = 100306,
  },
}
r0_0.RT_2 = {
  QuestChainFinish = r0_0.RT_1,
}
r0_0.RT_3 = {
  QuestChainUnFinish = r0_0.RT_1,
}
r0_0.RT_4 = {}
r0_0.RT_5 = {
  TalkTriggerId = 500080,
}
r0_0.RT_6 = {
  ImprComp = r0_0.RT_5,
}
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [19, 19] id: 1
  return r1_1
end
local r4_0 = {
  [51007572] = r0_0.RT_6,
  [51007574] = r0_0.RT_6,
  [800305081] = {
    IsBoy = r0_0.RT_4,
  },
  [800305082] = {
    IsGirl = r0_0.RT_4,
  },
}
r4_0[901900015] = {
  QuestChainFinish = {
    QuestChainId = 110109,
  },
}
r4_0[902000011] = r0_0.RT_2
r4_0[902000012] = r0_0.RT_2
r4_0[902100011] = r0_0.RT_3
r4_0[902100012] = r0_0.RT_3
r4_0[902100013] = r0_0.RT_3
r4_0[902100015] = r0_0.RT_2
r4_0[902100016] = r0_0.RT_2
r4_0[902100017] = r0_0.RT_2
return r1_0("DialogueCondition", r4_0)
