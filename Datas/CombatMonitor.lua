-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\CombatMonitor.lua
-- version: lua54
-- line: [0, 0] id: 0
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end
local r2_0 = "CombatMonitor"
local r3_0 = {}
r3_0[1] = {
  MonitorId = 1,
  MonitorType = "Damage",
  ServerMark = false,
  SubId = {
    "OneDamage"
  },
  Value = 10000000,
}
r3_0[2] = {
  MonitorId = 2,
  MonitorType = "Time",
  ServerMark = true,
  SubId = {
    "Capture"
  },
  Value = 15,
}
r3_0[3] = {
  MonitorId = 3,
  MonitorType = "Time",
  ServerMark = true,
  SubId = {
    "Sabotage"
  },
  Value = 15,
}
r3_0[4] = {
  MonitorId = 4,
  MonitorType = "Time",
  ServerMark = true,
  SubId = {
    "Rescue"
  },
  Value = 15,
}
r3_0[5] = {
  MonitorId = 5,
  MonitorType = "Time",
  ServerMark = true,
  SubId = {
    "Exterminate"
  },
  Value = 10,
}
r3_0[6] = {
  MonitorId = 6,
  MonitorType = "Time",
  ServerMark = true,
  SubId = {
    "Hijack"
  },
  Value = 80,
}
r3_0[7] = {
  MonitorId = 7,
  MonitorType = "Time",
  ServerMark = true,
  SubId = {
    "Rouge"
  },
  Value = 4,
}
r3_0[8] = {
  MonitorId = 8,
  MonitorType = "Resource",
  ServerMark = true,
  SubId = {
    "RougeToken"
  },
  Value = 8000,
}
r3_0[9] = {
  MonitorId = 9,
  MonitorType = "OverTime",
  ServerMark = true,
  SubId = {
    "AbyssMaxTime"
  },
  Value = 300,
}
return r1_0(r2_0, r3_0)
