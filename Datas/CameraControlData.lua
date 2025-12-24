-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\CameraControlData.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    0,
    0,
    0
  },
  RT_2 = {
    0,
    0,
    40
  },
  RT_3 = {
    0,
    0,
    25
  },
  RT_4 = {
    0,
    0,
    120
  },
  RT_5 = {
    0,
    0,
    60
  },
  RT_6 = {
    50,
    0,
    0
  },
  RT_7 = {
    4,
    0,
    0
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [38, 38] id: 1
  return r1_1
end
local r3_0 = "CameraControlData"
local r4_0 = {}
r4_0.Arm120OffsetZM40 = {
  ArmLength = 120,
  ArmPos = r0_0.RT_1,
  CameraName = "Arm120OffsetZM40",
  ProbeSize = 12,
  SocketOffset = {
    0,
    0,
    -40
  },
  TimelineFloatCurve = "CameraCurve",
  bIncrementArmLength = true,
  bIncrementArmPos = true,
  bIncrementSocketOffset = true,
}
r4_0.Arm150OffsetZ40 = {
  ArmLength = 150,
  ArmPos = r0_0.RT_1,
  CameraName = "Arm150OffsetZ40",
  ProbeSize = 12,
  SocketOffset = r0_0.RT_2,
  TimelineFloatCurve = "CameraCurve",
  bIncrementArmLength = true,
  bIncrementArmPos = true,
  bIncrementSocketOffset = true,
}
r4_0.Arm90OffsetZ20 = {
  ArmLength = 90,
  ArmPos = r0_0.RT_1,
  CameraName = "Arm90OffsetZ20",
  ProbeSize = 12,
  SocketOffset = {
    0,
    0,
    20
  },
  TimelineFloatCurve = "CameraCurve",
  bIncrementArmLength = true,
  bIncrementArmPos = true,
  bIncrementSocketOffset = true,
}
r4_0.BossHeilongDefault = {
  ArmLength = 3600,
  ArmPos = r0_0.RT_3,
  CameraName = "BossHeilongDefault",
  ProbeSize = 12,
  SocketOffset = {
    3000,
    0,
    200
  },
  TimelineFloatCurve = "CameraCurve",
  bIncrementArmLength = false,
  bIncrementArmPos = false,
  bIncrementSocketOffset = true,
}
r4_0.BossLinenDefault = {
  ArmLength = 550,
  ArmPos = r0_0.RT_3,
  CameraName = "BossLinenDefault",
  ProbeSize = 12,
  SocketOffset = r0_0.RT_4,
  TimelineFloatCurve = "CameraCurve",
  bIncrementArmLength = false,
  bIncrementArmPos = false,
  bIncrementSocketOffset = false,
}
r4_0.BossMapSkill = {
  ArmLength = 0,
  ArmPos = r0_0.RT_5,
  CameraName = "BossMapSkill",
  ProbeSize = 12,
  SocketOffset = r0_0.RT_2,
  TimelineFloatCurve = "CameraCurve",
  bIncrementArmLength = true,
  bIncrementArmPos = false,
  bIncrementSocketOffset = false,
}
r4_0.BossShijingzheSkill15 = {
  ArmLength = 800,
  ArmPos = r0_0.RT_3,
  CameraName = "BossShijingzheSkill15",
  ProbeSize = 12,
  SocketOffset = r0_0.RT_4,
  TimelineFloatCurve = "CameraCurve",
  bIncrementArmLength = false,
  bIncrementArmPos = false,
  bIncrementSocketOffset = false,
}
r4_0.Default = {
  ArmLength = 360,
  ArmPos = r0_0.RT_3,
  CameraName = "Default",
  ProbeSize = 12,
  SocketOffset = {
    0,
    35,
    55
  },
  TimelineFloatCurve = "CameraCurve",
  bIncrementArmLength = false,
  bIncrementArmPos = false,
  bIncrementSocketOffset = false,
}
r4_0.FallAttack = {
  ArmLength = 60,
  ArmPos = r0_0.RT_1,
  CameraName = "FallAttack",
  LagMaxDistance = r0_0.RT_6,
  LagSpeed = r0_0.RT_7,
  ProbeSize = 12,
  SocketOffset = r0_0.RT_1,
  TimelineFloatCurve = "CameraCurve",
  bIncrementArmLength = true,
  bIncrementArmPos = true,
  bIncrementSocketOffset = true,
}
r4_0.FuluoSkill01 = {
  ArmLength = 420,
  ArmPos = r0_0.RT_1,
  CameraName = "FuluoSkill01",
  ProbeSize = 12,
  SocketOffset = {
    0,
    0,
    50
  },
  TimelineFloatCurve = "CameraCurve",
  bIncrementArmLength = true,
  bIncrementArmPos = true,
  bIncrementSocketOffset = true,
}
r4_0.FuluoSkill02 = {
  ArmLength = 300,
  ArmPos = r0_0.RT_1,
  CameraName = "FuluoSkill02",
  LagMaxDistance = r0_0.RT_6,
  LagSpeed = r0_0.RT_7,
  ProbeSize = 12,
  SocketOffset = r0_0.RT_4,
  TimelineFloatCurve = "CameraCurve",
  bIncrementArmLength = true,
  bIncrementArmPos = true,
  bIncrementSocketOffset = false,
}
r4_0.IncrementDefault = {
  ArmLength = 0,
  ArmPos = r0_0.RT_1,
  CameraName = "IncrementDefault",
  ProbeSize = 12,
  SocketOffset = r0_0.RT_1,
  TimelineFloatCurve = "CameraCurve",
  bIncrementArmLength = true,
  bIncrementArmPos = true,
  bIncrementSocketOffset = true,
}
r4_0.KezhouSkill02 = {
  ArmLength = 120,
  ArmPos = r0_0.RT_1,
  CameraName = "KezhouSkill02",
  ProbeSize = 12,
  SocketOffset = r0_0.RT_3,
  TimelineFloatCurve = "CameraCurve",
  bIncrementArmLength = true,
  bIncrementArmPos = true,
  bIncrementSocketOffset = true,
}
r4_0.SongluSkill02 = {
  ArmLength = 0,
  ArmPos = r0_0.RT_5,
  CameraName = "SongluSkill02",
  LagMaxDistance = r0_0.RT_6,
  LagSpeed = r0_0.RT_7,
  ProbeSize = 12,
  SocketOffset = {
    0,
    0,
    -80
  },
  TimelineFloatCurve = "CameraCurve",
  bIncrementArmLength = true,
  bIncrementArmPos = true,
  bIncrementSocketOffset = true,
}
r4_0.SpringArm200 = {
  ArmLength = 200,
  ArmPos = r0_0.RT_1,
  CameraName = "SpringArm200",
  ProbeSize = 12,
  SocketOffset = r0_0.RT_1,
  TimelineFloatCurve = "CameraCurve",
  bIncrementArmLength = true,
  bIncrementArmPos = true,
  bIncrementSocketOffset = true,
}
r4_0.StoryCamera03 = {
  ArmLength = 140,
  ArmPos = r0_0.RT_1,
  CameraName = "StoryCamera03",
  ProbeSize = 12,
  SocketOffset = {
    45,
    40,
    40
  },
  TimelineFloatCurve = "CameraCurve",
  bIncrementArmLength = false,
  bIncrementArmPos = false,
  bIncrementSocketOffset = false,
}
r4_0.StoryDefault = {
  ArmLength = 800,
  ArmPos = r0_0.RT_1,
  CameraName = "StoryDefault",
  ProbeSize = 12,
  SocketOffset = {
    0,
    0,
    225
  },
  TimelineFloatCurve = "CameraCurve",
  bIncrementArmLength = false,
  bIncrementArmPos = false,
  bIncrementSocketOffset = false,
}
r4_0.StoryEast01Nai01 = {
  ArmLength = 200,
  ArmPos = r0_0.RT_1,
  CameraName = "StoryEast01Nai01",
  ProbeSize = 12,
  SocketOffset = {
    0,
    40,
    35
  },
  TimelineFloatCurve = "CameraCurve",
  bIncrementArmLength = false,
  bIncrementArmPos = false,
  bIncrementSocketOffset = false,
}
r4_0.StoryEast01Nai02 = {
  ArmLength = 200,
  ArmPos = r0_0.RT_1,
  CameraName = "StoryEast01Nai02",
  ProbeSize = 12,
  SocketOffset = {
    0,
    40,
    43
  },
  TimelineFloatCurve = "CameraCurve",
  bIncrementArmLength = false,
  bIncrementArmPos = false,
  bIncrementSocketOffset = false,
}
r4_0.SuyiSkill01JetRush = {
  ArmLength = 180,
  ArmPos = r0_0.RT_1,
  CameraName = "SuyiSkill01JetRush",
  ProbeSize = 12,
  SocketOffset = r0_0.RT_1,
  TimelineFloatCurve = "CameraCurve",
  bIncrementArmLength = true,
  bIncrementArmPos = true,
  bIncrementSocketOffset = true,
}
r4_0.SuyiSkill02Attack = {
  ArmLength = 120,
  ArmPos = r0_0.RT_1,
  CameraName = "SuyiSkill02Attack",
  ProbeSize = 12,
  SocketOffset = {
    0,
    150,
    150
  },
  TimelineFloatCurve = "CameraCurve",
  bIncrementArmLength = true,
  bIncrementArmPos = true,
  bIncrementSocketOffset = true,
}
r4_0.TuosiSkill02 = {
  ArmLength = 150,
  ArmPos = r0_0.RT_1,
  CameraName = "TuosiSkill02",
  LagMaxDistance = r0_0.RT_6,
  LagSpeed = r0_0.RT_7,
  ProbeSize = 12,
  SocketOffset = r0_0.RT_2,
  TimelineFloatCurve = "CameraCurve",
  bIncrementArmLength = true,
  bIncrementArmPos = true,
  bIncrementSocketOffset = true,
}
return r2_0(r3_0, r4_0)
