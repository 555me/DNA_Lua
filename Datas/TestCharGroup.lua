-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\TestCharGroup.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    [102401] = 1010201,
    [105101] = 1020301,
  },
  RT_2 = {
    [101101] = 1010101,
  },
}
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [10, 10] id: 1
  return r1_1
end
local r4_0 = {
  [1101] = {
    CharGroupId = 1101,
    PhantomRuleIdList = r0_0.RT_1,
    TemplateRuleId = r0_0.RT_2,
  },
}
r4_0[2101] = {
  CharGroupId = 2101,
  PhantomRuleIdList = r0_0.RT_1,
  TemplateRuleId = {
    [102101] = 1010101,
  },
}
r4_0[2301] = {
  CharGroupId = 2301,
  PhantomRuleIdList = r0_0.RT_1,
  TemplateRuleId = {
    [102301] = 1010101,
  },
}
r4_0[2401] = {
  CharGroupId = 2401,
  PhantomRuleIdList = {
    [103102] = 1010201,
    [105101] = 1020301,
  },
  TemplateRuleId = {
    [102401] = 1010101,
  },
}
r4_0[3101] = {
  CharGroupId = 3101,
  PhantomRuleIdList = r0_0.RT_1,
  TemplateRuleId = {
    [103101] = 1010101,
  },
}
r4_0[3102] = {
  CharGroupId = 3102,
  PhantomRuleIdList = r0_0.RT_1,
  TemplateRuleId = {
    [103102] = 1010101,
  },
}
r4_0[4201] = {
  CharGroupId = 4201,
  PhantomRuleIdList = r0_0.RT_1,
  TemplateRuleId = {
    [104201] = 1010101,
  },
}
r4_0[5101] = {
  CharGroupId = 5101,
  PhantomRuleIdList = {
    [102401] = 1010201,
    [103102] = 1020301,
  },
  TemplateRuleId = {
    [105101] = 1010101,
  },
}
r4_0[5301] = {
  CharGroupId = 5301,
  PhantomRuleIdList = r0_0.RT_1,
  TemplateRuleId = {
    [105301] = 1010101,
  },
}
r4_0[9999] = {
  CharGroupId = 9999,
  PhantomRuleIdList = {
    [102101] = 1010202,
    [105301] = 1010103,
  },
  TemplateRuleId = r0_0.RT_2,
}
return r1_0("TestCharGroup", r4_0)
