-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\AlertData.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    0,
    120
  },
  RT_2 = {
    120,
    240
  },
  RT_3 = {
    0,
    240
  },
}
r0_0.RT_4 = {
  AlertRange = r0_0.RT_1,
  AlertRangeDownSpeed = -40,
  AlertRangeHearId = 1,
  AlertRangeSightId = 1,
  AlertRangeUpSpeed = 40,
}
r0_0.RT_5 = {
  AlertRange = r0_0.RT_2,
  AlertRangeDownSpeed = -24,
  AlertRangeHearId = 2,
  AlertRangeSightId = 2,
  AlertRangeUpSpeed = 60,
}
r0_0.RT_6 = {
  [1] = r0_0.RT_4,
  [2] = r0_0.RT_5,
}
r0_0.RT_7 = {
  AlertRange = r0_0.RT_1,
  AlertRangeDownSpeed = -40,
  AlertRangeHearId = 1,
  AlertRangeSightId = 6003001,
  AlertRangeUpSpeed = 40,
}
r0_0.RT_8 = {
  AlertRange = r0_0.RT_1,
  AlertRangeDownSpeed = 0,
  AlertRangeHearId = 1,
  AlertRangeSightId = 1,
  AlertRangeUpSpeed = 9999,
}
r0_0.RT_9 = {
  AlertRange = r0_0.RT_2,
  AlertRangeDownSpeed = 0,
  AlertRangeHearId = 2,
  AlertRangeSightId = 2,
  AlertRangeUpSpeed = 9999,
}
r0_0.RT_10 = {
  [1] = r0_0.RT_8,
  [2] = r0_0.RT_9,
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [58, 58] id: 1
  return r1_1
end
local r3_0 = "AlertData"
local r4_0 = {}
local r5_0 = {
  AlertId = 1,
}
r5_0.AlertRanges = {
  [1] = {
    AlertRange = r0_0.RT_1,
    AlertRangeDownSpeed = -40,
    AlertRangeHearId = 1,
    AlertRangeSightId = 1,
    AlertRangeUpSpeed = 80,
  },
  [2] = {
    AlertRange = r0_0.RT_2,
    AlertRangeDownSpeed = -24,
    AlertRangeHearId = 2,
    AlertRangeSightId = 2,
    AlertRangeUpSpeed = 120,
  },
}
r5_0.AlertResetChange = 0
r5_0.BroadCastAlertValue = 40
r5_0.BroadCastDis = 1500
r5_0.CanBroadCastAlert = true
r5_0.CommonAlertHearId = 2
r5_0.CommonAlertSetValue = 99
r5_0.CommonAlertSightId = 2
r5_0.FightStateBroarCastTime = 0.5
r5_0.MaxAlertValue = 240
r4_0[1] = r5_0
r5_0 = {
  AlertId = 10,
}
r5_0.AlertRanges = {
  [1] = {
    AlertRange = r0_0.RT_3,
    AlertRangeDownSpeed = 0,
    AlertRangeHearId = 10,
    AlertRangeSightId = 10,
    AlertRangeUpSpeed = 120,
  },
}
r5_0.AlertResetChange = 0
r5_0.BroadCastAlertValue = 40
r5_0.BroadCastDis = 500
r5_0.CanBroadCastAlert = true
r5_0.CommonAlertHearId = 10
r5_0.CommonAlertSetValue = 99
r5_0.CommonAlertSightId = 10
r5_0.FightStateBroarCastTime = 0.5
r5_0.MaxAlertValue = 240
r4_0[10] = r5_0
r5_0 = {
  AlertId = 11,
}
r5_0.AlertRanges = {
  [1] = {
    AlertRange = r0_0.RT_3,
    AlertRangeDownSpeed = 0,
    AlertRangeHearId = 10,
    AlertRangeSightId = 11,
    AlertRangeUpSpeed = 120,
  },
}
r5_0.AlertResetChange = 0
r5_0.BroadCastAlertValue = 40
r5_0.BroadCastDis = 10000
r5_0.CanBroadCastAlert = true
r5_0.CommonAlertHearId = 10
r5_0.CommonAlertSetValue = 99
r5_0.CommonAlertSightId = 11
r5_0.FightStateBroarCastTime = 0.5
r5_0.MaxAlertValue = 240
r4_0[11] = r5_0
r4_0[101] = {
  AlarmMode = "UseAlarmMechanism",
  AlertId = 101,
  AlertRanges = r0_0.RT_6,
  AlertResetChange = 0,
  BroadCastAlertValue = 40,
  BroadCastDis = 2000,
  CanBroadCastAlert = true,
  CommonAlertHearId = 2,
  CommonAlertRequestTime = 1,
  CommonAlertSetValue = 99,
  CommonAlertSightId = 2,
  FightStateBroarCastTime = 0.5,
  MaxAlertValue = 240,
  RequestFightDistance = 5000,
}
r4_0[102] = {
  AlertId = 102,
  AlertRanges = r0_0.RT_6,
  AlertResetChange = 0,
  BroadCastAlertValue = 40,
  BroadCastDis = 2000,
  CanBroadCastAlert = true,
  CommonAlertHearId = 2,
  CommonAlertRequestTime = 1,
  CommonAlertSetValue = 99,
  CommonAlertSightId = 2,
  FightStateBroarCastTime = 0.5,
  MaxAlertValue = 240,
  RequestFightDistance = 5000,
}
r5_0 = {
  AlertId = 103,
}
r5_0.AlertRanges = {
  [1] = {
    AlertRange = r0_0.RT_1,
    AlertRangeDownSpeed = -40,
    AlertRangeHearId = 103,
    AlertRangeSightId = 103,
    AlertRangeUpSpeed = 40,
  },
  [2] = {
    AlertRange = r0_0.RT_2,
    AlertRangeDownSpeed = -24,
    AlertRangeHearId = 103,
    AlertRangeSightId = 103,
    AlertRangeUpSpeed = 20,
  },
}
r5_0.AlertResetChange = 0
r5_0.BroadCastAlertValue = 40
r5_0.BroadCastDis = 3000
r5_0.CanBroadCastAlert = true
r5_0.CommonAlertHearId = 103
r5_0.CommonAlertSetValue = 99
r5_0.CommonAlertSightId = 103
r5_0.FightStateBroarCastTime = 0.5
r5_0.MaxAlertValue = 240
r5_0.RequestFightDistance = 5000
r4_0[103] = r5_0
r4_0[104] = {
  AlertId = 104,
  AlertRanges = r0_0.RT_6,
  AlertResetChange = 0,
  BroadCastDis = 0,
  CommonAlertHearId = 2,
  CommonAlertSetValue = 99,
  CommonAlertSightId = 2,
  MaxAlertValue = 240,
}
r5_0 = {
  AlertId = 105,
}
r5_0.AlertRanges = {
  [1] = {
    AlertRange = r0_0.RT_1,
    AlertRangeDownSpeed = 0,
    AlertRangeHearId = 4,
    AlertRangeSightId = 4,
    AlertRangeUpSpeed = 9999,
  },
  [2] = {
    AlertRange = r0_0.RT_2,
    AlertRangeDownSpeed = 0,
    AlertRangeHearId = 4,
    AlertRangeSightId = 4,
    AlertRangeUpSpeed = 9999,
  },
}
r5_0.AlertResetChange = 0
r5_0.BroadCastAlertValue = 40
r5_0.BroadCastDis = 2000
r5_0.CanBroadCastAlert = true
r5_0.CommonAlertHearId = 4
r5_0.CommonAlertSetValue = 99
r5_0.CommonAlertSightId = 4
r5_0.FightStateBroarCastTime = 0.5
r5_0.MaxAlertValue = 240
r5_0.RequestFightDistance = 5000
r4_0[105] = r5_0
r5_0 = {
  AlertId = 201,
}
r5_0.AlertRanges = {
  [1] = {
    AlertRange = r0_0.RT_1,
    AlertRangeDownSpeed = -40,
    AlertRangeHearId = 3,
    AlertRangeSightId = 3,
    AlertRangeUpSpeed = 40,
  },
  [2] = {
    AlertRange = r0_0.RT_2,
    AlertRangeDownSpeed = -24,
    AlertRangeHearId = 3,
    AlertRangeSightId = 3,
    AlertRangeUpSpeed = 60,
  },
}
r5_0.AlertResetChange = 0
r5_0.BroadCastAlertValue = 40
r5_0.BroadCastDis = 1500
r5_0.CanBroadCastAlert = true
r5_0.CommonAlertHearId = 2
r5_0.CommonAlertSetValue = 99
r5_0.CommonAlertSightId = 2
r5_0.FightStateBroarCastTime = 0.5
r5_0.MaxAlertValue = 240
r4_0[201] = r5_0
r4_0[202] = {
  AlertId = 202,
  AlertRanges = r0_0.RT_6,
  AlertResetChange = 0,
  BroadCastAlertValue = 40,
  BroadCastDis = 7000,
  CanBroadCastAlert = true,
  CommonAlertHearId = 2,
  CommonAlertSetValue = 99,
  CommonAlertSightId = 2,
  FightStateBroarCastTime = 0.5,
  MaxAlertValue = 240,
}
r4_0[203] = {
  AlertId = 203,
  AlertRanges = r0_0.RT_6,
  AlertResetChange = 0,
  BroadCastAlertValue = 40,
  BroadCastDis = 7000,
  CanBroadCastAlert = true,
  CommonAlertHearId = 2,
  CommonAlertRequestTime = 1,
  CommonAlertSetValue = 99,
  CommonAlertSightId = 2,
  FightStateBroarCastTime = 0.5,
  MaxAlertValue = 240,
  RequestFightDistance = 5000,
}
local r6_0 = {
  AlertId = 6001005,
}
r6_0.AlertRanges = {
  [1] = {
    AlertRange = r0_0.RT_1,
    AlertRangeDownSpeed = -40,
    AlertRangeHearId = 1,
    AlertRangeSightId = 1,
    AlertRangeUpSpeed = 30,
  },
  [2] = r0_0.RT_5,
}
r6_0.AlertResetChange = 0
r6_0.BroadCastAlertValue = 40
r6_0.BroadCastDis = 800
r6_0.CanBroadCastAlert = true
r6_0.CommonAlertHearId = 2
r6_0.CommonAlertSetValue = 99
r6_0.CommonAlertSightId = 2
r6_0.FightStateBroarCastTime = 0.5
r6_0.MaxAlertValue = 240
r6_0.RequestFightDistance = 1000
r4_0[6001005] = r6_0
r6_0 = {
  AlertId = 6001006,
}
r6_0.AlertRanges = {
  [1] = {
    AlertRange = r0_0.RT_1,
    AlertRangeDownSpeed = -40,
    AlertRangeHearId = 1,
    AlertRangeSightId = 1,
    AlertRangeUpSpeed = 240,
  },
  [2] = {
    AlertRange = r0_0.RT_2,
    AlertRangeDownSpeed = -24,
    AlertRangeHearId = 2,
    AlertRangeSightId = 2,
    AlertRangeUpSpeed = 240,
  },
}
r6_0.AlertResetChange = 0
r6_0.BroadCastAlertValue = 40
r6_0.BroadCastDis = 1700
r6_0.CanBroadCastAlert = true
r6_0.CommonAlertHearId = 2
r6_0.CommonAlertSetValue = 99
r6_0.CommonAlertSightId = 2
r6_0.FightStateBroarCastTime = 0.5
r6_0.MaxAlertValue = 240
r6_0.RequestFightDistance = 1000
r4_0[6001006] = r6_0
r6_0 = {
  AlertId = 6002002,
}
r6_0.AlertRanges = {
  [1] = {
    AlertRange = r0_0.RT_1,
    AlertRangeDownSpeed = -40,
    AlertRangeHearId = 1,
    AlertRangeSightId = 6002002,
    AlertRangeUpSpeed = 30,
  },
  [2] = r0_0.RT_5,
}
r6_0.AlertResetChange = 0
r6_0.BroadCastAlertValue = 40
r6_0.BroadCastDis = 500
r6_0.CanBroadCastAlert = true
r6_0.CommonAlertHearId = 2
r6_0.CommonAlertSetValue = 99
r6_0.CommonAlertSightId = 2
r6_0.FightStateBroarCastTime = 0.5
r6_0.MaxAlertValue = 240
r6_0.RequestFightDistance = 1000
r4_0[6002002] = r6_0
r4_0[6003001] = {
  AlertId = 6003001,
  AlertRanges = {
    [1] = r0_0.RT_7,
    [2] = r0_0.RT_5,
  },
  AlertResetChange = 0,
  BroadCastAlertValue = 40,
  BroadCastDis = 500,
  CanBroadCastAlert = true,
  CommonAlertHearId = 2,
  CommonAlertSetValue = 99,
  CommonAlertSightId = 2,
  FightStateBroarCastTime = 0.5,
  MaxAlertValue = 240,
  RequestFightDistance = 1000,
}
r4_0[7001001] = {
  AlertId = 7001001,
  AlertRanges = r0_0.RT_6,
  AlertResetChange = 0,
  BroadCastAlertValue = 40,
  BroadCastDis = 0,
  CommonAlertHearId = 2,
  CommonAlertSetValue = 99,
  CommonAlertSightId = 2,
  FightStateBroarCastTime = 0.5,
  MaxAlertValue = 240,
}
r6_0 = {
  AlertId = 7001101,
}
r6_0.AlertRanges = {
  [1] = {
    AlertRange = r0_0.RT_3,
    AlertRangeDownSpeed = -24,
    AlertRangeHearId = 7001101,
    AlertRangeSightId = 7001101,
    AlertRangeUpSpeed = 9999,
  },
}
r6_0.AlertResetChange = 0
r6_0.BroadCastAlertValue = 40
r6_0.BroadCastDis = 1000
r6_0.CanBroadCastAlert = true
r6_0.CommonAlertHearId = 2
r6_0.CommonAlertSetValue = 99
r6_0.CommonAlertSightId = 2
r6_0.FightStateBroarCastTime = 0.5
r6_0.MaxAlertValue = 240
r4_0[7001101] = r6_0
r4_0[7002102] = {
  AlertId = 7002102,
  AlertRanges = r0_0.RT_6,
  AlertResetChange = 0,
  BroadCastAlertValue = 40,
  BroadCastDis = 0,
  CommonAlertHearId = 2,
  CommonAlertSetValue = 99,
  CommonAlertSightId = 2,
  MaxAlertValue = 240,
}
r4_0[7002103] = {
  AlertId = 7002103,
  AlertRanges = r0_0.RT_10,
  AlertResetChange = 0,
  BroadCastAlertValue = 40,
  BroadCastDis = 0,
  CommonAlertHearId = 2,
  CommonAlertSetValue = 99,
  CommonAlertSightId = 2,
  MaxAlertValue = 240,
}
r6_0 = {
  AlertId = 7002104,
}
r6_0.AlertRanges = {
  [1] = {
    AlertRange = r0_0.RT_3,
    AlertRangeDownSpeed = -24,
    AlertRangeHearId = 7001101,
    AlertRangeSightId = 7001101,
    AlertRangeUpSpeed = 240,
  },
}
r6_0.AlertResetChange = 0
r6_0.BroadCastAlertValue = 40
r6_0.BroadCastDis = 1000
r6_0.CanBroadCastAlert = true
r6_0.CommonAlertHearId = 2
r6_0.CommonAlertSetValue = 99
r6_0.CommonAlertSightId = 2
r6_0.FightStateBroarCastTime = 0.5
r6_0.MaxAlertValue = 240
r4_0[7002104] = r6_0
r4_0[7003051] = {
  AlertId = 7003051,
  AlertRanges = r0_0.RT_10,
  AlertResetChange = 0,
  BroadCastAlertValue = 40,
  BroadCastDis = 0,
  CommonAlertHearId = 2,
  CommonAlertSetValue = 99,
  CommonAlertSightId = 2,
  MaxAlertValue = 240,
}
r6_0 = {
  AlertId = 7008001,
}
r6_0.AlertRanges = {
  [1] = {
    AlertRange = r0_0.RT_1,
    AlertRangeDownSpeed = -40,
    AlertRangeHearId = 1,
    AlertRangeSightId = 7008001,
    AlertRangeUpSpeed = 40,
  },
  [2] = r0_0.RT_5,
}
r6_0.AlertResetChange = 0
r6_0.BroadCastAlertValue = 40
r6_0.BroadCastDis = 0
r6_0.CommonAlertHearId = 2
r6_0.CommonAlertSetValue = 99
r6_0.CommonAlertSightId = 2
r6_0.FightStateBroarCastTime = 0.5
r6_0.MaxAlertValue = 240
r4_0[7008001] = r6_0
r6_0 = {
  AlertId = 8504002,
}
r6_0.AlertRanges = {
  [1] = {
    AlertRange = r0_0.RT_3,
    AlertRangeDownSpeed = 0,
    AlertRangeHearId = 10,
    AlertRangeSightId = 3,
    AlertRangeUpSpeed = 120,
  },
}
r6_0.AlertResetChange = 0
r6_0.BroadCastAlertValue = 40
r6_0.BroadCastDis = 500
r6_0.CommonAlertHearId = 3
r6_0.CommonAlertSetValue = 99
r6_0.CommonAlertSightId = 3
r6_0.FightStateBroarCastTime = 0.5
r6_0.MaxAlertValue = 240
r4_0[8504002] = r6_0
r6_0 = {
  AlertId = 9501001,
}
r6_0.AlertRanges = {
  [1] = r0_0.RT_7,
  [2] = {
    AlertRange = r0_0.RT_2,
    AlertRangeDownSpeed = -24,
    AlertRangeHearId = 2,
    AlertRangeSightId = 6003001,
    AlertRangeUpSpeed = 60,
  },
}
r6_0.AlertResetChange = 0
r6_0.BroadCastAlertValue = 40
r6_0.BroadCastDis = 2000
r6_0.CanBroadCastAlert = true
r6_0.CommonAlertHearId = 2
r6_0.CommonAlertSetValue = 99
r6_0.CommonAlertSightId = 6003001
r6_0.FightStateBroarCastTime = 0.5
r6_0.MaxAlertValue = 240
r6_0.RequestFightDistance = 1000
r4_0[9501001] = r6_0
r5_0 = 9800001
r6_0 = {
  AlertId = 9800001,
}
local r7_0 = {
  [1] = {
    AlertRange = r0_0.RT_1,
    AlertRangeDownSpeed = 0,
    AlertRangeHearId = 1,
    AlertRangeSightId = 9800001,
    AlertRangeUpSpeed = 240,
  },
}
r7_0[2] = {
  AlertRange = {
    120,
    9999
  },
  AlertRangeDownSpeed = 0,
  AlertRangeUpSpeed = 0,
}
r6_0.AlertRanges = r7_0
r6_0.AlertResetChange = 0
r6_0.BroadCastDis = 0
r6_0.MaxAlertValue = 9999
r4_0[r5_0] = r6_0
r6_0 = {
  AlertId = 9802001,
}
r6_0.AlertRanges = {
  [1] = {
    AlertRange = r0_0.RT_1,
    AlertRangeDownSpeed = 0,
    AlertRangeHearId = 9802001,
    AlertRangeSightId = 9802001,
    AlertRangeUpSpeed = 0,
  },
}
r6_0.AlertResetChange = 0
r6_0.BroadCastDis = 0
r6_0.MaxAlertValue = 240
r4_0[9802001] = r6_0
return r2_0(r3_0, r4_0)
