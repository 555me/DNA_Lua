-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\KawaiiParams.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    Damping = 0.9,
    LimitAngle = 0,
    Radius = 3,
    Stiffness = 0.7,
    Width = 5,
    WordDampingLocation = 0.9,
    WordDampingRotation = 0.5,
  },
  RT_2 = {
    Damping = 0.8,
    LimitAngle = 0,
    Radius = 3,
    Stiffness = 0.6,
    Width = 5,
    WordDampingLocation = 0.9,
    WordDampingRotation = 0.5,
  },
  RT_3 = {
    Damping = 0.8,
    LimitAngle = 0,
    Radius = 3,
    Stiffness = 0.8,
    Width = 5,
    WordDampingLocation = 0.9,
    WordDampingRotation = 0.5,
  },
  RT_4 = {
    Damping = 0.9,
    LimitAngle = 0,
    Radius = 3,
    Stiffness = 0.8,
    Width = 5,
    WordDampingLocation = 0.9,
    WordDampingRotation = 0.5,
  },
  RT_5 = {
    Damping = 0.1,
    LimitAngle = 0,
    Radius = 3,
    Stiffness = 0.8,
    Width = 5,
    WordDampingLocation = 0.9,
    WordDampingRotation = 0.5,
  },
  RT_6 = {
    Damping = 0.6,
    LimitAngle = 0,
    Radius = 3,
    Stiffness = 0.3,
    Width = 5,
    WordDampingLocation = 0.9,
    WordDampingRotation = 0.5,
  },
}
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [57, 57] id: 1
  return r1_1
end
local r4_0 = {}
local r6_0 = {
  KawaiiId = 1001,
}
r6_0.KawaiiParament = {
  EnterJump = {
    Damping = 0.8,
    LimitAngle = 0,
    Radius = 3,
    Stiffness = 0.7,
    Width = 5,
    WordDampingLocation = 0.9,
    WordDampingRotation = 0.5,
  },
  EnterSecJump = r0_0.RT_1,
  Idle = r0_0.RT_2,
  InAir = r0_0.RT_1,
  Land = r0_0.RT_3,
  LevelEnter = r0_0.RT_2,
  RunLoop = {
    Damping = 0.9,
    LimitAngle = 0,
    Radius = 3,
    Stiffness = 0.65,
    Width = 5,
    WordDampingLocation = 0.9,
    WordDampingRotation = 0.5,
  },
  RunStart = r0_0.RT_2,
  RunStop = r0_0.RT_3,
  SlideToIdle = r0_0.RT_2,
  StartSlide = r0_0.RT_2,
}
r6_0.KawaiiType = "hair"
r4_0[1001] = r6_0
r6_0 = {
  KawaiiId = 1002,
}
r6_0.KawaiiParament = {
  EnterJump = {
    Damping = 0.8,
    LimitAngle = 0,
    Radius = 3,
    Stiffness = 0.6,
    Width = 5,
    WordDampingLocation = 0.7,
    WordDampingRotation = 0.5,
  },
  EnterSecJump = {
    Damping = 0.8,
    LimitAngle = 0,
    Radius = 3,
    Stiffness = 0.5,
    Width = 5,
    WordDampingLocation = 0.7,
    WordDampingRotation = 0.5,
  },
  Idle = r0_0.RT_3,
  InAir = {
    Damping = 0.7,
    LimitAngle = 0,
    Radius = 3,
    Stiffness = 0.5,
    Width = 5,
    WordDampingLocation = 0.7,
    WordDampingRotation = 0.5,
  },
  Land = r0_0.RT_4,
  LevelEnter = {
    Damping = 0.8,
    LimitAngle = 0,
    Radius = 3,
    Stiffness = 0.8,
    Width = 5,
    WordDampingLocation = 0.7,
    WordDampingRotation = 0.5,
  },
  RunLoop = r0_0.RT_3,
  RunStart = r0_0.RT_3,
  RunStop = r0_0.RT_3,
  SlideToIdle = r0_0.RT_3,
  StartSlide = r0_0.RT_3,
}
r6_0.KawaiiType = "cloak"
r4_0[1002] = r6_0
r4_0[1003] = {
  KawaiiId = 1003,
  KawaiiParament = {
    EnterJump = r0_0.RT_3,
    EnterSecJump = r0_0.RT_3,
    Idle = r0_0.RT_3,
    InAir = r0_0.RT_3,
    Land = r0_0.RT_3,
    LevelEnter = r0_0.RT_3,
    RunLoop = r0_0.RT_3,
    RunStart = r0_0.RT_3,
    RunStop = r0_0.RT_3,
    SlideToIdle = r0_0.RT_3,
    StartSlide = r0_0.RT_3,
  },
  KawaiiType = "skirt",
}
r4_0[1004] = {
  KawaiiId = 1004,
  KawaiiParament = {
    EnterJump = r0_0.RT_5,
    EnterSecJump = r0_0.RT_5,
    Idle = r0_0.RT_5,
    InAir = r0_0.RT_5,
    Land = r0_0.RT_5,
    LevelEnter = r0_0.RT_5,
    RunLoop = r0_0.RT_5,
    RunStart = r0_0.RT_5,
    RunStop = r0_0.RT_5,
    SlideToIdle = r0_0.RT_5,
    StartSlide = r0_0.RT_5,
  },
  KawaiiType = "hair",
}
r6_0 = {
  KawaiiId = 1005,
}
r6_0.KawaiiParament = {
  EnterJump = r0_0.RT_6,
  EnterSecJump = r0_0.RT_6,
  Idle = r0_0.RT_6,
  InAir = {
    Damping = 0.7,
    LimitAngle = 0,
    Radius = 3,
    Stiffness = 0.5,
    Width = 5,
    WordDampingLocation = 0.8,
    WordDampingRotation = 0.5,
  },
  Land = {
    Damping = 0.7,
    LimitAngle = 0,
    Radius = 3,
    Stiffness = 0.3,
    Width = 5,
    WordDampingLocation = 0.9,
    WordDampingRotation = 0.5,
  },
  LevelEnter = r0_0.RT_6,
  RunLoop = {
    Damping = 0.6,
    LimitAngle = 0,
    Radius = 3,
    Stiffness = 0.3,
    Width = 5,
    WordDampingLocation = 0.8,
    WordDampingRotation = 0.5,
  },
  RunStart = r0_0.RT_6,
  RunStop = r0_0.RT_6,
  SlideToIdle = r0_0.RT_6,
  StartSlide = {
    Damping = 0.6,
    LimitAngle = 0,
    Radius = 3,
    Stiffness = 0.3,
    Width = 5,
    WordDampingLocation = 0.7,
    WordDampingRotation = 0.5,
  },
}
r6_0.KawaiiType = "cloak"
r4_0[1005] = r6_0
r6_0 = {
  KawaiiId = 1006,
}
r6_0.KawaiiParament = {
  EnterJump = r0_0.RT_3,
  EnterSecJump = r0_0.RT_3,
  Idle = r0_0.RT_3,
  InAir = {
    Damping = 0.9,
    LimitAngle = 0,
    Radius = 3,
    Stiffness = 0.9,
    Width = 5,
    WordDampingLocation = 0.9,
    WordDampingRotation = 0.5,
  },
  Land = r0_0.RT_3,
  LevelEnter = r0_0.RT_3,
  RunLoop = r0_0.RT_3,
  RunStart = r0_0.RT_3,
  RunStop = r0_0.RT_4,
  SlideToIdle = r0_0.RT_3,
  StartSlide = r0_0.RT_3,
}
r6_0.KawaiiType = "hair"
r4_0[1006] = r6_0
r6_0 = {
  KawaiiId = 1007,
}
r6_0.KawaiiParament = {
  EnterJump = r0_0.RT_2,
  EnterSecJump = r0_0.RT_2,
  Idle = r0_0.RT_2,
  InAir = {
    Damping = 0.7,
    LimitAngle = 0,
    Radius = 3,
    Stiffness = 0.6,
    Width = 5,
    WordDampingLocation = 0.9,
    WordDampingRotation = 0.5,
  },
  Land = r0_0.RT_2,
  LevelEnter = r0_0.RT_2,
  RunLoop = r0_0.RT_2,
  RunStart = r0_0.RT_2,
  RunStop = r0_0.RT_2,
  SlideToIdle = r0_0.RT_2,
  StartSlide = r0_0.RT_2,
}
r6_0.KawaiiType = "cloak"
r4_0[1007] = r6_0
return r1_0("KawaiiParams", r4_0)
