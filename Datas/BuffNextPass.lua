-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\BuffNextPass.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    Width = 2,
  },
}
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [6, 6] id: 1
  return r1_1
end
local r4_0 = {}
r4_0.Dafu_Passive_Ranged = {
  MaterialPath = "/Game/Asset/Char/Player/Char026_Dafu/Materials/MI_Dafu_EffectOL01.MI_Dafu_EffectOL01",
  NextPassKey = "Dafu_Passive_Ranged",
  Params = {
    Width = 0.2,
  },
}
r4_0.Kezhou_Skill02_Body = {
  MaterialPath = "/Game/Asset/Char/Player/Char030_Kezhou/Materials/MI_Kezhou_EffectOL01.MI_Kezhou_EffectOL01",
  NextPassKey = "Kezhou_Skill02_Body",
  Params = {
    Width = 0.5,
  },
}
r4_0.Mon_Strong_Double = {
  MaterialPath = "/Game/Asset/Effect/Material/Object/MI_Monster_Common1.MI_Monster_Common1",
  NextPassKey = "Mon_Strong_Double",
  Params = r0_0.RT_1,
}
r4_0.Mon_Strong_Single = {
  MaterialPath = "/Game/Asset/Effect/Material/Object/MI_Monster_Common.MI_Monster_Common",
  NextPassKey = "Mon_Strong_Single",
  Params = r0_0.RT_1,
}
r4_0.Mon_Strong_Tripple = {
  MaterialPath = "/Game/Asset/Effect/Material/Object/MI_Monster_Common2.MI_Monster_Common2",
  NextPassKey = "Mon_Strong_Tripple",
  Params = r0_0.RT_1,
}
r4_0.Tuosi_Skill02_Body = {
  MaterialPath = "/Game/Asset/Char/Player/Char025_Tuosi/Materials/MI_Tuosi_EffectOL01.MI_Tuosi_EffectOL01",
  NextPassKey = "Tuosi_Skill02_Body",
}
return r1_0("BuffNextPass", r4_0)
