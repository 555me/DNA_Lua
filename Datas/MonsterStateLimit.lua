-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\MonsterStateLimit.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    "Hit"
  },
  RT_2 = {
    "Skill"
  },
  RT_3 = {
    "Controlled"
  },
}
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [12, 12] id: 1
  return r1_1
end
local r4_0 = {
  Birth = {
    ActionMode = 1,
    SourceTag = "Birth",
  },
  CaptureSuccess = {
    ActionMode = 1,
    InterruptNavLink = true,
    SourceTag = "CaptureSuccess",
  },
  Cover = {
    ActionMode = 0,
    SourceTag = "Cover",
  },
  Crouch = {
    ActionMode = 0,
    SourceTag = "Crouch",
  },
  Dead = {
    ActionMode = 1,
    ForbidAI = 1,
    InterruptNavLink = true,
    SourceTag = "Dead",
  },
  Defeated = {
    ActionMode = 1,
    InterruptNavLink = true,
    SourceTag = "Defeated",
  },
  Falling = {
    ActionMode = 0,
    SourceTag = "Falling",
  },
  HeavyHit = {
    ActionMode = 1,
    InterruptNavLink = true,
    SourceTag = "HeavyHit",
    TagType = r0_0.RT_1,
  },
}
r4_0.HitFly = {
  ActionMode = 1,
  BreakableItem = {
    Breakable = true,
  },
  InterruptNavLink = true,
  SourceTag = "HitFly",
  TagType = r0_0.RT_1,
}
r4_0.Idle = {
  ActionMode = 0,
  SourceTag = "Idle",
}
r4_0.LandHeavy = {
  ActionMode = 0,
  SourceTag = "LandHeavy",
}
r4_0.LightHit = {
  ActionMode = 1,
  InterruptNavLink = true,
  SourceTag = "LightHit",
  TagType = r0_0.RT_1,
}
r4_0.LightHitRanged = {
  ActionMode = 1,
  InterruptNavLink = true,
  SourceTag = "LightHitRanged",
  TagType = r0_0.RT_1,
}
r4_0.Shooting = {
  ActionMode = 0,
  SourceTag = "Shooting",
  TagType = r0_0.RT_2,
}
r4_0.Skill = {
  ActionMode = 0,
  SourceTag = "Skill",
  TagType = r0_0.RT_2,
}
r4_0.Slide = {
  ActionMode = 0,
  SourceTag = "Slide",
}
r4_0.Stun = {
  ActionMode = 1,
  InterruptNavLink = true,
  SourceTag = "Stun",
  TagType = r0_0.RT_3,
}
r4_0.StunFloat = {
  ActionMode = 1,
  InterruptNavLink = true,
  SourceTag = "StunFloat",
  TagType = r0_0.RT_3,
}
r4_0.WaitForCaught = {
  ActionMode = 1,
  InterruptNavLink = true,
  SourceTag = "WaitForCaught",
}
return r1_0("MonsterStateLimit", r4_0)
