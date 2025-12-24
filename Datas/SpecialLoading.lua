-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\SpecialLoading.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end
local r3_0 = {}
local r4_0 = {
  Id = 1,
  LoadingId = 101001,
  Region = {
    From = "Main",
    To = "Fantasy",
  },
}
r4_0.TriggerCondition = {
  QuestUnstart = {
    QuestId = 10020802,
  },
}
r3_0[1] = r4_0
r3_0[2] = {
  Id = 2,
  LoadingId = 102001,
  Region = {
    From = "Main",
    To = "EX",
  },
}
r3_0[3] = {
  Id = 3,
  LoadingId = 103001,
  Region = {
    From = "EX",
    To = "Main",
  },
}
r3_0[10001] = {
  Id = 10001,
  LoadingId = 10410801,
  Region = {
    SpawnPoint = 1,
    SubId = 104108,
  },
}
r3_0[10002] = {
  Id = 10002,
  LoadingId = 10410802,
  Region = {
    SpawnPoint = 2,
    SubId = 104108,
  },
}
r3_0[10003] = {
  Id = 10003,
  LoadingId = 10410701,
  Region = {
    SpawnPoint = 1,
    SubId = 104107,
  },
}
r3_0[10004] = {
  Id = 10004,
  LoadingId = 10411001,
  Region = {
    SpawnPoint = 1,
    SubId = 104110,
  },
}
r3_0[10005] = {
  Id = 10005,
  LoadingId = 10410301,
  Region = {
    SpawnPoint = 1,
    SubId = 104103,
  },
}
r3_0[10006] = {
  Id = 10006,
  LoadingId = 10410901,
  Region = {
    SubId = 104109,
  },
}
r3_0[10007] = {
  Id = 10007,
  LoadingId = 10410201,
  Region = {
    SpawnPoint = 1,
    SubId = 104102,
  },
}
r3_0[10008] = {
  Id = 10008,
  LoadingId = 10410501,
  Region = {
    SpawnPoint = 1,
    SubId = 104105,
  },
}
r3_0[10009] = {
  Id = 10009,
  LoadingId = 10410702,
  Region = {
    SpawnPoint = 2,
    SubId = 104107,
  },
}
r3_0[10010] = {
  Id = 10010,
  LoadingId = 10410401,
  Region = {
    SpawnPoint = 1,
    SubId = 104104,
  },
}
r3_0[10011] = {
  Id = 10011,
  LoadingId = 10410601,
  Region = {
    SpawnPoint = 1,
    SubId = 104106,
  },
}
r3_0[10012] = {
  Id = 10012,
  LoadingId = 10570101,
  Region = {
    SubId = 105701,
  },
}
r3_0[10013] = {
  Id = 10013,
  LoadingId = 10430101,
  Region = {
    SubId = 104301,
  },
}
r3_0[10014] = {
  Id = 10014,
  LoadingId = 10440101,
  Region = {
    SubId = 104401,
  },
}
r3_0[10015] = {
  Id = 10015,
  LoadingId = 10500101,
  Region = {
    SubId = 105001,
  },
}
r3_0[10016] = {
  Id = 10016,
  LoadingId = 10420101,
  Region = {
    SubId = 104201,
  },
}
r3_0[10017] = {
  Id = 10017,
  LoadingId = 10460101,
  Region = {
    SubId = 104601,
  },
}
r3_0[10018] = {
  Id = 10018,
  LoadingId = 10470101,
  Region = {
    SubId = 104701,
  },
}
r3_0[10019] = {
  Id = 10019,
  LoadingId = 10490101,
  Region = {
    SubId = 104901,
  },
}
r3_0[10020] = {
  Id = 10020,
  LoadingId = 10410702,
  Region = {
    SpawnPoint = 3,
    SubId = 104107,
  },
}
r3_0[10021] = {
  Id = 10021,
  LoadingId = 10410702,
  Region = {
    SpawnPoint = 4,
    SubId = 104107,
  },
}
return r0_0("SpecialLoading", r3_0)
