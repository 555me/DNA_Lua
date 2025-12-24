-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\BattleCamera.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    "10.0"
  },
  RT_2 = {
    "3.0"
  },
  RT_3 = {
    "1.0"
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [12, 12] id: 1
  return r1_1
end
local r3_0 = "BattleCamera"
local r4_0 = {
  CameraFadeAngleEnd = {
    ParamentName = "CameraFadeAngleEnd",
    ParamentValue = r0_0.RT_1,
  },
}
r4_0.CameraFadeAngleStart = {
  ParamentName = "CameraFadeAngleStart",
  ParamentValue = {
    "30.0"
  },
}
r4_0.CameraPitchLimitMax = {
  ParamentName = "CameraPitchLimitMax",
  ParamentValue = {
    "89.9"
  },
}
r4_0.CameraPitchLimitMin = {
  ParamentName = "CameraPitchLimitMin",
  ParamentValue = {
    "-89.9"
  },
}
r4_0.EnterCollisionSpeed = {
  ParamentName = "EnterCollisionSpeed",
  ParamentValue = r0_0.RT_1,
}
r4_0.LeaveCollisionSpeed = {
  ParamentName = "LeaveCollisionSpeed",
  ParamentValue = {
    "2.0"
  },
}
r4_0.ResetPitchMaxSpeed = {
  ParamentName = "ResetPitchMaxSpeed",
  ParamentValue = r0_0.RT_2,
}
r4_0.ResetSocketOffsetMaxSpeed = {
  ParamentName = "ResetSocketOffsetMaxSpeed",
  ParamentValue = {
    "4.0"
  },
}
r4_0.ResetSpringArmMaxSpeed = {
  ParamentName = "ResetSpringArmMaxSpeed",
  ParamentValue = r0_0.RT_2,
}
r4_0.TagAndTimeForResetPitch = {
  ParamentName = "TagAndTimeForResetPitch",
  ParamentValue = {
    "Idle:3"
  },
}
r4_0.TagAndTimeForResetSpringArm = {
  ParamentName = "TagAndTimeForResetSpringArm",
  ParamentValue = {
    "Idle:1.5"
  },
}
r4_0.TimeToResetPitchMaxSpeed = {
  ParamentName = "TimeToResetPitchMaxSpeed",
  ParamentValue = r0_0.RT_3,
}
r4_0.TimeToResetSocketOffsetMaxSpeed = {
  ParamentName = "TimeToResetSocketOffsetMaxSpeed",
  ParamentValue = r0_0.RT_3,
}
r4_0.TimeToResetSpringArmMaxSpeed = {
  ParamentName = "TimeToResetSpringArmMaxSpeed",
  ParamentValue = r0_0.RT_3,
}
return r2_0(r3_0, r4_0)
