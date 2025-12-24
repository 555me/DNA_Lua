-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\Desc2ProperTerm.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    [1] = "TERM_Common_OverES",
  },
  RT_2 = {
    [1] = "TERM_Common_AdditionalDmg",
  },
  RT_3 = {
    [1] = "TERM_Common_Taunt",
  },
}
return ((DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [11, 11] id: 1
  return r1_1
end)("Desc2ProperTerm", {
  [404] = r0_0.RT_1,
  [414] = r0_0.RT_1,
  [426] = r0_0.RT_2,
  [160102] = r0_0.RT_1,
  [160192] = r0_0.RT_1,
  [180103] = r0_0.RT_2,
  [240102] = r0_0.RT_1,
  [240103] = {
    [1] = "TERM_Common_SkillSpeed",
  },
  [320102] = r0_0.RT_3,
  [320104] = r0_0.RT_3,
  [410201] = r0_0.RT_1,
  [420202] = r0_0.RT_1,
  [420203] = r0_0.RT_1,
  [510202] = r0_0.RT_1,
  [530102] = r0_0.RT_1,
})
