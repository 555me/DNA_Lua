-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\UIScreenEffect.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    HaveShield = 0,
    Time = "Now",
    Value2Strength = 1,
  },
  RT_2 = {
    "Battle"
  },
  RT_3 = {
    1006
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [14, 14] id: 1
  return r1_1
end
local r3_0 = "UIScreenEffect"
local r4_0 = {}
r4_0[1001] = {
  LastTime = -1,
  MutexUIEffectId = {
    1005,
    1006
  },
  PlayMode = "Replace",
  UIEffectId = 1001,
  UIEffectParam = r0_0.RT_1,
  UIEffectPriority = 100,
  UIEffectTag = r0_0.RT_2,
  UIEffectTypeName = "BloodEffect",
}
r4_0[1002] = {
  LastTime = 0.4,
  MutexUIEffectId = r0_0.RT_3,
  PlayMode = "Modify",
  UIEffectId = 1002,
  UIEffectParam = {
    HaveShield = 0,
    Time = "Now",
    Value2Strength = 0,
  },
  UIEffectPriority = 100,
  UIEffectTag = r0_0.RT_2,
  UIEffectTypeName = "BloodEffect",
}
r4_0[1003] = {
  LastTime = 0.4,
  MutexUIEffectId = r0_0.RT_3,
  PlayMode = "Modify",
  UIEffectId = 1003,
  UIEffectParam = {
    HaveShield = 1,
    Time = "Now",
    Value2Strength = 0,
  },
  UIEffectPriority = 100,
  UIEffectTag = r0_0.RT_2,
  UIEffectTypeName = "ShieldAttack",
}
r4_0[1004] = {
  LastTime = 0.4,
  MutexUIEffectId = r0_0.RT_3,
  PlayMode = "Add",
  UIEffectId = 1004,
  UIEffectPriority = 100,
  UIEffectTag = r0_0.RT_2,
  UIEffectTypeName = "ShieldBroken",
}
r4_0[1005] = {
  LastTime = -1,
  MutexUIEffectId = {
    1001
  },
  PlayMode = "Replace",
  UIEffectId = 1005,
  UIEffectPriority = 90,
  UIEffectTag = r0_0.RT_2,
  UIEffectTypeName = "Warning",
}
r4_0[1006] = {
  LastTime = -1,
  MutexUIEffectId = {
    1001,
    1002,
    1003
  },
  PlayMode = "Replace",
  UIEffectId = 1006,
  UIEffectParam = r0_0.RT_1,
  UIEffectPriority = 100,
  UIEffectTag = r0_0.RT_2,
  UIEffectTypeName = "VitaminEffect",
}
return r2_0(r3_0, r4_0)
