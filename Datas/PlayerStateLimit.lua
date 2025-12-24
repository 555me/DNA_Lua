-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\PlayerStateLimit.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    Breakable = true,
    Radius = 60,
  },
  RT_2 = {
    "Controlled"
  },
  RT_3 = {
    "Controlled",
    "Hit"
  },
  RT_4 = {
    "Interactive"
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [17, 17] id: 1
  return r1_1
end
local r3_0 = "PlayerStateLimit"
local r4_0 = {}
r4_0.Avoid = {
  ActionMode = 0,
  SourceTag = "Avoid",
  TagType = {
    "Move",
    "Avoid"
  },
}
r4_0.BulletJump = {
  ActionMode = 0,
  BreakableItem = r0_0.RT_1,
  SourceTag = "BulletJump",
  TagType = {
    "Move"
  },
}
r4_0.Crouch = {
  ActionMode = 0,
  SourceTag = "Crouch",
  TagType = {
    "Move",
    "Crouch"
  },
}
r4_0.Dead = {
  ActionMode = 1,
  ForbidInput = 1,
  SourceTag = "Dead",
  TagType = r0_0.RT_2,
}
r4_0.Falling = {
  ActionMode = 0,
  SourceTag = "Falling",
}
r4_0.GrabHit = {
  ActionMode = 1,
  ForbidInput = 1,
  SourceTag = "GrabHit",
  TagType = r0_0.RT_2,
}
r4_0.HeavyHit = {
  ActionMode = 1,
  ForbidInput = 1,
  SourceTag = "HeavyHit",
  TagType = r0_0.RT_3,
}
r4_0.HitFly = {
  ActionMode = 1,
  BreakableItem = r0_0.RT_1,
  ForbidInput = 1,
  SourceTag = "HitFly",
  TagType = r0_0.RT_3,
}
r4_0.HitRepel = {
  ActionMode = 1,
  ForbidInput = 1,
  SourceTag = "HitRepel",
}
r4_0.Hook = {
  SourceTag = "Hook",
  TagType = r0_0.RT_4,
}
r4_0.Idle = {
  SourceTag = "Idle",
}
r4_0.Interactive = {
  ActionMode = 1,
  ForbidInput = 1,
  SourceTag = "Interactive",
  TagType = r0_0.RT_4,
}
r4_0.LandHeavy = {
  ActionMode = 1,
  BreakableItem = {
    Breakable = true,
    Radius = 250,
  },
  SourceTag = "LandHeavy",
  TagType = {
    "Move",
    "LandHeavy"
  },
}
r4_0.LevelEnter = {
  ActionMode = 1,
  ForbidInput = 1,
  SourceTag = "LevelEnter",
}
r4_0.LevelFinish = {
  ActionMode = 1,
  ForbidInput = 1,
  SourceTag = "LevelFinish",
}
r4_0.LightHit = {
  ActionMode = 1,
  ForbidInput = 1,
  SourceTag = "LightHit",
  TagType = r0_0.RT_3,
}
r4_0.LightHitRanged = {
  ActionMode = 1,
  ForbidInput = 1,
  SourceTag = "LightHitRanged",
  TagType = r0_0.RT_3,
}
r4_0.Recovery = {
  ActionMode = 1,
  ForbidInput = 1,
  SourceTag = "Recovery",
}
r4_0.Seating = {
  ActionMode = 0,
  SourceTag = "Seating",
  TagType = {
    "Seating"
  },
}
r4_0.Shooting = {
  ActionMode = 0,
  SourceTag = "Shooting",
  TagType = {
    "Shooting"
  },
}
r4_0.Skill = {
  ActionMode = 0,
  SourceTag = "Skill",
  TagType = {
    "Skill"
  },
}
r4_0.Slide = {
  ActionMode = 0,
  BreakableItem = r0_0.RT_1,
  SourceTag = "Slide",
  TagType = {
    "Move",
    "Slide"
  },
}
r4_0.Stun = {
  ActionMode = 1,
  ForbidInput = 1,
  SourceTag = "Stun",
  TagType = r0_0.RT_2,
}
return r2_0(r3_0, r4_0)
