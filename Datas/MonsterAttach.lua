-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\MonsterAttach.lua
-- version: lua54
-- line: [0, 0] id: 0
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end
local r2_0 = "MonsterAttach"
local r3_0 = {}
r3_0[7001] = {
  AttachRuleId = 7001,
  IgnorePhysicAndGravity = true,
  IgnoreRVO = true,
  RelativeOffset = {
    20,
    0,
    160
  },
  RelativeRotation = 0,
  SetPositionAndRotate = true,
  SourceSocketName = "pelvis",
  TargetSocketName = "pelvis",
  bRelativeUseLocalSpace = false,
}
r3_0[7002] = {
  AttachRuleId = 7002,
  IgnorePhysicAndGravity = true,
  IgnoreRVO = true,
  RelativeOffset = {
    20,
    0,
    -50
  },
  RelativeRotation = 0,
  SetPositionAndRotate = true,
  SourceSocketName = "root",
  TargetSocketName = "hand_l",
  bRelativeUseLocalSpace = false,
}
return r1_0(r2_0, r3_0)
