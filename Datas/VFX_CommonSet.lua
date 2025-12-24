-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\VFX_CommonSet.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end
local r3_0 = {}
local r4_0 = {
  EffectId = {
    [1] = 900002,
  },
}
r4_0.EffectParam = {
  [1] = {
    IsAttached = false,
  },
}
r4_0.VFXId = 1
r3_0[1] = r4_0
r3_0[2] = {
  EffectId = {
    [1] = 900004,
  },
  VFXId = 2,
}
r3_0[3] = {
  EffectId = {
    [1] = 900007,
    [2] = 900008,
  },
  VFXId = 3,
}
return r0_0("VFX_CommonSet", r3_0)
