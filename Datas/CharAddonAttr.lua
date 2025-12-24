-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\CharAddonAttr.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    AttrName = "ATK",
    Rate = 0.2,
  },
  RT_2 = {
    AttrName = "ATK",
    Rate = 0.3,
  },
  RT_3 = {
    AttrName = "SkillEfficiency",
    Rate = 0.05,
  },
  RT_4 = {
    AttrName = "SkillEfficiency",
    Rate = 0.075,
  },
  RT_5 = {
    AttrName = "SkillSustain",
    Rate = 0.06,
  },
  RT_6 = {
    AttrName = "SkillSustain",
    Rate = 0.09,
  },
  RT_7 = {
    AttrName = "SkillRange",
    Rate = 0.12,
  },
  RT_8 = {
    AttrName = "SkillRange",
    Rate = 0.18,
  },
  RT_9 = {
    AttrName = "SkillIntensity",
    Rate = 0.08,
  },
  RT_10 = {
    AttrName = "SkillIntensity",
    Rate = 0.12,
  },
  RT_11 = {
    AttrName = "MaxHp",
    Rate = 0.2,
  },
  RT_12 = {
    AttrName = "MaxHp",
    Rate = 0.3,
  },
}
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [51, 51] id: 1
  return r1_1
end
local r4_0 = {
  [110101] = {
    AddAttrs = r0_0.RT_1,
    AttrId = 110101,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_110101_NAME",
  },
  [110102] = {
    AddAttrs = r0_0.RT_2,
    AttrId = 110102,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_110102_NAME",
  },
  [110103] = {
    AddAttrs = r0_0.RT_3,
    AttrId = 110103,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_13",
    Name = "ADDONATTR_110103_NAME",
  },
  [110104] = {
    AddAttrs = r0_0.RT_4,
    AttrId = 110104,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_13",
    Name = "ADDONATTR_110104_NAME",
  },
  [110301] = {
    AddAttrs = r0_0.RT_1,
    AttrId = 110301,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_110301_NAME",
  },
  [110302] = {
    AddAttrs = r0_0.RT_2,
    AttrId = 110302,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_110302_NAME",
  },
  [110303] = {
    AddAttrs = r0_0.RT_3,
    AttrId = 110303,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_13",
    Name = "ADDONATTR_110303_NAME",
  },
  [110304] = {
    AddAttrs = r0_0.RT_4,
    AttrId = 110304,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_13",
    Name = "ADDONATTR_110304_NAME",
  },
  [150101] = {
    AddAttrs = r0_0.RT_1,
    AttrId = 150101,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_150101_NAME",
  },
  [150102] = {
    AddAttrs = r0_0.RT_2,
    AttrId = 150102,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_150102_NAME",
  },
  [150103] = {
    AddAttrs = r0_0.RT_5,
    AttrId = 150103,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
    Name = "ADDONATTR_150103_NAME",
  },
  [150104] = {
    AddAttrs = r0_0.RT_6,
    AttrId = 150104,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
    Name = "ADDONATTR_150104_NAME",
  },
  [150201] = {
    AddAttrs = r0_0.RT_1,
    AttrId = 150201,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_150201_NAME",
  },
  [150202] = {
    AddAttrs = r0_0.RT_2,
    AttrId = 150202,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_150202_NAME",
  },
  [150203] = {
    AddAttrs = r0_0.RT_7,
    AttrId = 150203,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_10",
    Name = "ADDONATTR_150203_NAME",
  },
  [150204] = {
    AddAttrs = r0_0.RT_8,
    AttrId = 150204,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_10",
    Name = "ADDONATTR_150204_NAME",
  },
  [150301] = {
    AddAttrs = r0_0.RT_1,
    AttrId = 150301,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_150301_NAME",
  },
  [150302] = {
    AddAttrs = r0_0.RT_2,
    AttrId = 150302,
    Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
    Name = "ADDONATTR_150302_NAME",
  },
}
r4_0[150303] = {
  AddAttrs = {
    AttrName = "WeaponCRIModifierRate",
    Value = 0.2,
  },
  AttrId = 150303,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_03",
  Name = "ADDONATTR_150303_NAME",
}
r4_0[150304] = {
  AddAttrs = {
    AttrName = "WeaponCRIModifierRate",
    Value = 0.3,
  },
  AttrId = 150304,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_03",
  Name = "ADDONATTR_150304_NAME",
}
r4_0[160101] = {
  AddAttrs = r0_0.RT_5,
  AttrId = 160101,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
  Name = "ADDONATTR_160101_NAME",
}
r4_0[160102] = {
  AddAttrs = r0_0.RT_6,
  AttrId = 160102,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
  Name = "ADDONATTR_160102_NAME",
}
r4_0[160103] = {
  AddAttrs = r0_0.RT_7,
  AttrId = 160103,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_10",
  Name = "ADDONATTR_160103_NAME",
}
r4_0[160104] = {
  AddAttrs = r0_0.RT_8,
  AttrId = 160104,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_10",
  Name = "ADDONATTR_160104_NAME",
}
r4_0[180101] = {
  AddAttrs = r0_0.RT_7,
  AttrId = 180101,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_10",
  Name = "ADDONATTR_180101_NAME",
}
r4_0[180102] = {
  AddAttrs = r0_0.RT_8,
  AttrId = 180102,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_10",
  Name = "ADDONATTR_180102_NAME",
}
r4_0[180103] = {
  AddAttrs = r0_0.RT_5,
  AttrId = 180103,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
  Name = "ADDONATTR_180103_NAME",
}
r4_0[180104] = {
  AddAttrs = r0_0.RT_6,
  AttrId = 180104,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
  Name = "ADDONATTR_180104_NAME",
}
r4_0[210101] = {
  AddAttrs = r0_0.RT_1,
  AttrId = 210101,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
  Name = "ADDONATTR_210101_NAME",
}
r4_0[210102] = {
  AddAttrs = r0_0.RT_2,
  AttrId = 210102,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
  Name = "ADDONATTR_210102_NAME",
}
r4_0[210103] = {
  AddAttrs = r0_0.RT_7,
  AttrId = 210103,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_10",
  Name = "ADDONATTR_210103_NAME",
}
r4_0[210104] = {
  AddAttrs = r0_0.RT_8,
  AttrId = 210104,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_10",
  Name = "ADDONATTR_210104_NAME",
}
r4_0[230101] = {
  AddAttrs = r0_0.RT_1,
  AttrId = 230101,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
  Name = "ADDONATTR_230101_NAME",
}
r4_0[230102] = {
  AddAttrs = r0_0.RT_2,
  AttrId = 230102,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
  Name = "ADDONATTR_230102_NAME",
}
r4_0[230103] = {
  AddAttrs = r0_0.RT_5,
  AttrId = 230103,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
  Name = "ADDONATTR_230103_NAME",
}
r4_0[230104] = {
  AddAttrs = r0_0.RT_6,
  AttrId = 230104,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
  Name = "ADDONATTR_230104_NAME",
}
r4_0[240101] = {
  AddAttrs = r0_0.RT_5,
  AttrId = 240101,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
  Name = "ADDONATTR_240101_NAME",
}
r4_0[240102] = {
  AddAttrs = r0_0.RT_6,
  AttrId = 240102,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
  Name = "ADDONATTR_240102_NAME",
}
r4_0[240103] = {
  AddAttrs = r0_0.RT_9,
  AttrId = 240103,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_12",
  Name = "ADDONATTR_240103_NAME",
}
r4_0[240104] = {
  AddAttrs = r0_0.RT_10,
  AttrId = 240104,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_12",
  Name = "ADDONATTR_240104_NAME",
}
r4_0[310101] = {
  AddAttrs = r0_0.RT_1,
  AttrId = 310101,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
  Name = "ADDONATTR_310101_NAME",
}
r4_0[310102] = {
  AddAttrs = r0_0.RT_2,
  AttrId = 310102,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
  Name = "ADDONATTR_310102_NAME",
}
r4_0[310103] = {
  AddAttrs = r0_0.RT_5,
  AttrId = 310103,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
  Name = "ADDONATTR_310103_NAME",
}
r4_0[310104] = {
  AddAttrs = r0_0.RT_6,
  AttrId = 310104,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
  Name = "ADDONATTR_310104_NAME",
}
r4_0[310201] = {
  AddAttrs = r0_0.RT_1,
  AttrId = 310201,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
  Name = "ADDONATTR_310201_NAME",
}
r4_0[310202] = {
  AddAttrs = r0_0.RT_2,
  AttrId = 310202,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
  Name = "ADDONATTR_310202_NAME",
}
r4_0[310203] = {
  AddAttrs = {
    AttrName = "MultiShootModifierRate",
    Value = 0.15,
  },
  AttrId = 310203,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_06",
  Name = "ADDONATTR_310203_NAME",
}
r4_0[310204] = {
  AddAttrs = {
    AttrName = "MultiShootModifierRate",
    Value = 0.225,
  },
  AttrId = 310204,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_06",
  Name = "ADDONATTR_310204_NAME",
}
r4_0[310301] = {
  AddAttrs = r0_0.RT_1,
  AttrId = 310301,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
  Name = "ADDONATTR_310301_NAME",
}
r4_0[310302] = {
  AddAttrs = r0_0.RT_2,
  AttrId = 310302,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
  Name = "ADDONATTR_310302_NAME",
}
r4_0[310303] = {
  AddAttrs = r0_0.RT_9,
  AttrId = 310303,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_12",
  Name = "ADDONATTR_310303_NAME",
}
r4_0[310304] = {
  AddAttrs = r0_0.RT_10,
  AttrId = 310304,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_12",
  Name = "ADDONATTR_310304_NAME",
}
r4_0[320101] = {
  AddAttrs = r0_0.RT_11,
  AttrId = 320101,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_14",
  Name = "ADDONATTR_320101_NAME",
}
r4_0[320102] = {
  AddAttrs = r0_0.RT_12,
  AttrId = 320102,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_14",
  Name = "ADDONATTR_320102_NAME",
}
r4_0[320103] = {
  AddAttrs = r0_0.RT_5,
  AttrId = 320103,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
  Name = "ADDONATTR_320103_NAME",
}
r4_0[320104] = {
  AddAttrs = r0_0.RT_6,
  AttrId = 320104,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
  Name = "ADDONATTR_320104_NAME",
}
r4_0[320201] = {
  AddAttrs = r0_0.RT_1,
  AttrId = 320201,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
  Name = "ADDONATTR_320201_NAME",
}
r4_0[320202] = {
  AddAttrs = r0_0.RT_2,
  AttrId = 320202,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
  Name = "ADDONATTR_320202_NAME",
}
r4_0[320203] = {
  AddAttrs = r0_0.RT_9,
  AttrId = 320203,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_12",
  Name = "ADDONATTR_320203_NAME",
}
r4_0[320204] = {
  AddAttrs = r0_0.RT_10,
  AttrId = 320204,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_12",
  Name = "ADDONATTR_320204_NAME",
}
r4_0[330101] = {
  AddAttrs = r0_0.RT_1,
  AttrId = 330101,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
  Name = "ADDONATTR_330101_NAME",
}
r4_0[330102] = {
  AddAttrs = r0_0.RT_2,
  AttrId = 330102,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
  Name = "ADDONATTR_330102_NAME",
}
r4_0[330103] = {
  AddAttrs = r0_0.RT_7,
  AttrId = 330103,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_10",
  Name = "ADDONATTR_330103_NAME",
}
r4_0[330104] = {
  AddAttrs = r0_0.RT_8,
  AttrId = 330104,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_10",
  Name = "ADDONATTR_330104_NAME",
}
r4_0[410101] = {
  AddAttrs = r0_0.RT_1,
  AttrId = 410101,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
  Name = "ADDONATTR_410101_NAME",
}
r4_0[410102] = {
  AddAttrs = r0_0.RT_2,
  AttrId = 410102,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
  Name = "ADDONATTR_410102_NAME",
}
r4_0[410103] = {
  AddAttrs = r0_0.RT_7,
  AttrId = 410103,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_10",
  Name = "ADDONATTR_410103_NAME",
}
r4_0[410104] = {
  AddAttrs = r0_0.RT_8,
  AttrId = 410104,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_10",
  Name = "ADDONATTR_410104_NAME",
}
r4_0[410201] = {
  AddAttrs = {
    AttrName = "StrongValue",
    Value = 0.06,
  },
  AttrId = 410201,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_02",
  Name = "ADDONATTR_410201_NAME",
}
r4_0[410202] = {
  AddAttrs = {
    AttrName = "StrongValue",
    Value = 0.09,
  },
  AttrId = 410202,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_02",
  Name = "ADDONATTR_410202_NAME",
}
r4_0[410203] = {
  AddAttrs = r0_0.RT_9,
  AttrId = 410203,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_12",
  Name = "ADDONATTR_410203_NAME",
}
r4_0[410204] = {
  AddAttrs = r0_0.RT_10,
  AttrId = 410204,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_12",
  Name = "ADDONATTR_410204_NAME",
}
r4_0[420101] = {
  AddAttrs = r0_0.RT_1,
  AttrId = 420101,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
  Name = "ADDONATTR_420101_NAME",
}
r4_0[420102] = {
  AddAttrs = r0_0.RT_2,
  AttrId = 420102,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
  Name = "ADDONATTR_420102_NAME",
}
r4_0[420103] = {
  AddAttrs = r0_0.RT_9,
  AttrId = 420103,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_03",
  Name = "ADDONATTR_420103_NAME",
}
r4_0[420104] = {
  AddAttrs = r0_0.RT_10,
  AttrId = 420104,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_03",
  Name = "ADDONATTR_420104_NAME",
}
r4_0[420201] = {
  AddAttrs = {
    AttrName = "DEF",
    Rate = 0.2,
  },
  AttrId = 420201,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_07",
  Name = "ADDONATTR_420201_NAME",
}
r4_0[420202] = {
  AddAttrs = {
    AttrName = "DEF",
    Rate = 0.3,
  },
  AttrId = 420202,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_07",
  Name = "ADDONATTR_420202_NAME",
}
r4_0[420203] = {
  AddAttrs = r0_0.RT_5,
  AttrId = 420203,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
  Name = "ADDONATTR_420203_NAME",
}
r4_0[420204] = {
  AddAttrs = r0_0.RT_6,
  AttrId = 420204,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
  Name = "ADDONATTR_420204_NAME",
}
r4_0[430101] = {
  AddAttrs = r0_0.RT_11,
  AttrId = 430101,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_14",
  Name = "ADDONATTR_430101_NAME",
}
r4_0[430102] = {
  AddAttrs = r0_0.RT_12,
  AttrId = 430102,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_14",
  Name = "ADDONATTR_430102_NAME",
}
r4_0[430103] = {
  AddAttrs = r0_0.RT_9,
  AttrId = 430103,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_12",
  Name = "ADDONATTR_430103_NAME",
}
r4_0[430104] = {
  AddAttrs = r0_0.RT_10,
  AttrId = 430104,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_12",
  Name = "ADDONATTR_430104_NAME",
}
r4_0[510101] = {
  AddAttrs = r0_0.RT_11,
  AttrId = 510101,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_14",
  Name = "ADDONATTR_510101_NAME",
}
r4_0[510102] = {
  AddAttrs = r0_0.RT_12,
  AttrId = 510102,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_14",
  Name = "ADDONATTR_510102_NAME",
}
r4_0[510103] = {
  AddAttrs = r0_0.RT_5,
  AttrId = 510103,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
  Name = "ADDONATTR_510103_NAME",
}
r4_0[510104] = {
  AddAttrs = r0_0.RT_6,
  AttrId = 510104,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
  Name = "ADDONATTR_510104_NAME",
}
r4_0[510201] = {
  AddAttrs = r0_0.RT_1,
  AttrId = 510201,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
  Name = "ADDONATTR_510201_NAME",
}
r4_0[510202] = {
  AddAttrs = r0_0.RT_2,
  AttrId = 510202,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
  Name = "ADDONATTR_510202_NAME",
}
r4_0[510203] = {
  AddAttrs = r0_0.RT_5,
  AttrId = 510203,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
  Name = "ADDONATTR_510203_NAME",
}
r4_0[510204] = {
  AddAttrs = r0_0.RT_6,
  AttrId = 510204,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_11",
  Name = "ADDONATTR_510204_NAME",
}
r4_0[530101] = {
  AddAttrs = {
    AttrName = "EnmityValue",
    Value = 0.02,
  },
  AttrId = 530101,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_05",
  Name = "ADDONATTR_530101_NAME",
}
r4_0[530102] = {
  AddAttrs = {
    AttrName = "EnmityValue",
    Value = 0.03,
  },
  AttrId = 530102,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_05",
  Name = "ADDONATTR_530102_NAME",
}
r4_0[530103] = {
  AddAttrs = r0_0.RT_9,
  AttrId = 530103,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_12",
  Name = "ADDONATTR_530103_NAME",
}
r4_0[530104] = {
  AddAttrs = r0_0.RT_10,
  AttrId = 530104,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_12",
  Name = "ADDONATTR_530104_NAME",
}
r4_0[540101] = {
  AddAttrs = r0_0.RT_1,
  AttrId = 540101,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
  Name = "ADDONATTR_540101_NAME",
}
r4_0[540102] = {
  AddAttrs = r0_0.RT_2,
  AttrId = 540102,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_08",
  Name = "ADDONATTR_540102_NAME",
}
r4_0[540103] = {
  AddAttrs = r0_0.RT_7,
  AttrId = 540103,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_10",
  Name = "ADDONATTR_540103_NAME",
}
r4_0[540104] = {
  AddAttrs = r0_0.RT_8,
  AttrId = 540104,
  Icon = "/Game/UI/Texture/Dynamic/Atlas/Skill/T_SkillTalent_10",
  Name = "ADDONATTR_540104_NAME",
}
return r1_0("CharAddonAttr", r4_0)
