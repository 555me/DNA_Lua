-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\QuestActiveSkill.lua
-- version: lua54
-- line: [0, 0] id: 0
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end
local r2_0 = "QuestActiveSkill"
local r3_0 = {}
r3_0[10010101] = {
  ActiveType = "Lock",
  InactiveorActive = "Inactive",
  QuestId = 10010101,
  QuestStartorSuccess = "Success",
  SkillId = {
    "Attack",
    "Jump",
    "Slide",
    "BulletJump",
    "Skill1",
    "Skill2",
    "Skill3",
    "Fire",
    "Avoid",
    "Crouch"
  },
}
r3_0[10010105] = {
  ActiveType = "Lock",
  InactiveorActive = "Active",
  QuestId = 10010105,
  QuestStartorSuccess = "Success",
  SkillId = {
    "Jump",
    "Slide",
    "BulletJump",
    "Crouch"
  },
}
r3_0[10010107] = {
  ActiveType = "Lock",
  InactiveorActive = "Active",
  QuestId = 10010107,
  QuestStartorSuccess = "Success",
  SkillId = {
    "Attack",
    "Avoid"
  },
}
r3_0[10010111] = {
  ActiveType = "Lock",
  InactiveorActive = "Active",
  QuestId = 10010111,
  QuestStartorSuccess = "Success",
  SkillId = {
    "Fire"
  },
}
r3_0[10010212] = {
  ActiveType = "Lock",
  InactiveorActive = "Active",
  QuestId = 10010212,
  QuestStartorSuccess = "Success",
  SkillId = {
    "Skill1"
  },
}
r3_0[10010306] = {
  ActiveType = "Lock",
  InactiveorActive = "Active",
  QuestId = 10010306,
  QuestStartorSuccess = "Success",
  SkillId = {
    "Skill2"
  },
}
r3_0[20010305] = {
  ActiveType = "Lock",
  InactiveorActive = "Active",
  QuestId = 20010305,
  QuestStartorSuccess = "Success",
  SkillId = {
    "Skill3"
  },
}
return r1_0(r2_0, r3_0)
