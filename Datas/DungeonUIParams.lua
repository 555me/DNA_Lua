-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\DungeonUIParams.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    CoDefence_1 = "DUNGEON_DEFENCE_114",
    CoDefence_2 = "DUNGEON_DEFENCE_115",
    CoDefence_3 = "DUNGEON_DEFENCE_116",
    CoDefence_4 = "DUNGEON_DEFENCE_117",
    CoDefence_5 = "DUNGEON_DEFENCE_118",
    CoDefence_6 = "DUNGEON_DEFENCE_119",
    CoDefence_7 = "DUNGEON_DEFENCE_120",
    TotalPointNums = 3,
  },
}
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [13, 13] id: 1
  return r1_1
end
local r4_0 = {}
local r6_0 = {
  UIName = {
    [1] = "DungenonDefenseProFloat",
    [2] = "GuideCountDown",
    [3] = "WaveStartBP",
  },
  UIParamID = 1000,
}
r6_0.UIParams = {
  [1] = {
    mytestkey = "mytestvalue",
  },
  [2] = {
    mytestkey1 = "mytestvalue1",
  },
  [3] = {
    mytestkey2 = "mytestvalue2",
  },
}
r4_0[1000] = r6_0
r6_0 = {
  UIName = {
    [1] = "RegionMultiDestroyProgress",
  },
  UIParamID = 1002,
}
r6_0.UIParams = {
  [1] = {
    MultiDestroy_1 = "DUNGEON_ENGINE_102",
    MultiDestroy_2 = "DUNGEON_ENGINE_104",
    MultiDestroy_3 = "DUNGEON_ENGINE_101",
    MultiDestroy_4 = "DUNGEON_ENGINE_103",
    TotalPointNums = 4,
  },
}
r4_0[1002] = r6_0
r6_0 = {
  UIName = {
    [1] = "RegionCoDefenceProgress",
    [2] = "DungenonDefenseProFloat",
  },
  UIParamID = 1003,
}
r6_0.UIParams = {
  [1] = r0_0.RT_1,
  [2] = {
    DefenceProSubTitle = "UI_Mail_Date_Remain",
    DefenceProTitle = "DUNGEON_NAME_20003",
  },
}
r4_0[1003] = r6_0
r6_0 = {
  UIName = {
    [1] = "RegionHijackFloatPanel",
  },
  UIParamID = 1004,
}
r6_0.UIParams = {
  [1] = {
    HijackPanel_1 = "DUNGEON_PAOTAI_201",
    HijackPanel_2 = "DUNGEON_PAOTAI_202",
  },
}
r4_0[1004] = r6_0
r4_0[1005] = {
  UIName = {
    [1] = "RegionCoDefenceProgress",
  },
  UIParamID = 1005,
  UIParams = {
    [1] = r0_0.RT_1,
  },
}
return r1_0("DungeonUIParams", r4_0)
