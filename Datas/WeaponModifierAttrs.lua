-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\WeaponModifierAttrs.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    "AttackRange_Bullet"
  },
  RT_2 = {
    "AttackRange_Normal"
  },
  RT_3 = {
    "AttackSpeed_FallAttack"
  },
  RT_4 = {
    "AttackSpeed_HeavyAttack"
  },
  RT_5 = {
    "AttackSpeed_Normal",
    "AttackSpeed_Reload",
    "AttackSpeed_FallAttack",
    "AttackSpeed_HeavyAttack",
    "AttackSpeed_SlideAttack"
  },
  RT_6 = {
    "AttackSpeed_Normal"
  },
  RT_7 = {
    "AttackSpeed_Reload"
  },
  RT_8 = {
    "AttackSpeed_SlideAttack"
  },
  RT_9 = {
    "MultiShoot"
  },
  RT_10 = {
    "TriggerProbability"
  },
  RT_11 = {
    "CRD"
  },
  RT_12 = {
    "CRI"
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [43, 43] id: 1
  return r1_1
end
local r3_0 = "WeaponModifierAttrs"
local r4_0 = {
  AttackRangeModifierRate_Bullet = {
    AttrNames = r0_0.RT_1,
    RateAttr = "AttackRangeModifierRate_Bullet",
    ValueAttr = "AttackRangeModifierValue_Bullet",
    WeaponModifierAttr = "AttackRangeModifierRate_Bullet",
  },
  AttackRangeModifierRate_Normal = {
    AttrNames = r0_0.RT_2,
    RateAttr = "AttackRangeModifierRate_Normal",
    ValueAttr = "AttackRangeModifierValue_Normal",
    WeaponModifierAttr = "AttackRangeModifierRate_Normal",
  },
  AttackRangeModifierRate_Ultra = {
    AttrNames = r0_0.RT_2,
    RateAttr = "AttackRangeModifierRate_Ultra",
    ValueAttr = "AttackRangeModifierValue_Ultra",
    WeaponModifierAttr = "AttackRangeModifierRate_Ultra",
    WeaponTag = "Ultra",
  },
  AttackRangeModifierValue_Bullet = {
    AttrNames = r0_0.RT_1,
    RateAttr = "AttackRangeModifierRate_Bullet",
    ValueAttr = "AttackRangeModifierValue_Bullet",
    WeaponModifierAttr = "AttackRangeModifierValue_Bullet",
  },
  AttackRangeModifierValue_Normal = {
    AttrNames = r0_0.RT_2,
    RateAttr = "AttackRangeModifierRate_Normal",
    ValueAttr = "AttackRangeModifierValue_Normal",
    WeaponModifierAttr = "AttackRangeModifierValue_Normal",
  },
  AttackRangeModifierValue_Ultra = {
    AttrNames = r0_0.RT_2,
    RateAttr = "AttackRangeModifierRate_Ultra",
    ValueAttr = "AttackRangeModifierValue_Ultra",
    WeaponModifierAttr = "AttackRangeModifierValue_Ultra",
    WeaponTag = "Ultra",
  },
  AttackSpeedModifierRate_FallAttack = {
    AttrNames = r0_0.RT_3,
    RateAttr = "AttackSpeedModifierRate_FallAttack",
    ValueAttr = "AttackSpeedModifierValue_FallAttack",
    WeaponModifierAttr = "AttackSpeedModifierRate_FallAttack",
  },
  AttackSpeedModifierRate_HeavyAttack = {
    AttrNames = r0_0.RT_4,
    RateAttr = "AttackSpeedModifierRate_HeavyAttack",
    ValueAttr = "AttackSpeedModifierValue_HeavyAttack",
    WeaponModifierAttr = "AttackSpeedModifierRate_HeavyAttack",
  },
  AttackSpeedModifierRate_Melee = {
    AttrNames = r0_0.RT_5,
    RateAttr = "AttackSpeedModifierRate_Melee",
    ValueAttr = "AttackSpeedModifierValue_Melee",
    WeaponModifierAttr = "AttackSpeedModifierRate_Melee",
    WeaponTag = "Melee",
  },
  AttackSpeedModifierRate_Normal = {
    AttrNames = r0_0.RT_6,
    RateAttr = "AttackSpeedModifierRate_Normal",
    ValueAttr = "AttackSpeedModifierValue_Normal",
    WeaponModifierAttr = "AttackSpeedModifierRate_Normal",
  },
  AttackSpeedModifierRate_Ranged = {
    AttrNames = r0_0.RT_5,
    RateAttr = "AttackSpeedModifierRate_Ranged",
    ValueAttr = "AttackSpeedModifierValue_Ranged",
    WeaponModifierAttr = "AttackSpeedModifierRate_Ranged",
    WeaponTag = "Ranged",
  },
  AttackSpeedModifierRate_Reload = {
    AttrNames = r0_0.RT_7,
    RateAttr = "AttackSpeedModifierRate_Reload",
    ValueAttr = "AttackSpeedModifierValue_Reload",
    WeaponModifierAttr = "AttackSpeedModifierRate_Reload",
  },
  AttackSpeedModifierRate_SlideAttack = {
    AttrNames = r0_0.RT_8,
    RateAttr = "AttackSpeedModifierRate_SlideAttack",
    ValueAttr = "AttackSpeedModifierValue_SlideAttack",
    WeaponModifierAttr = "AttackSpeedModifierRate_SlideAttack",
  },
  AttackSpeedModifierValue_FallAttack = {
    AttrNames = r0_0.RT_3,
    RateAttr = "AttackSpeedModifierRate_FallAttack",
    ValueAttr = "AttackSpeedModifierValue_FallAttack",
    WeaponModifierAttr = "AttackSpeedModifierValue_FallAttack",
  },
  AttackSpeedModifierValue_HeavyAttack = {
    AttrNames = r0_0.RT_4,
    RateAttr = "AttackSpeedModifierRate_HeavyAttack",
    ValueAttr = "AttackSpeedModifierValue_HeavyAttack",
    WeaponModifierAttr = "AttackSpeedModifierValue_HeavyAttack",
  },
  AttackSpeedModifierValue_Melee = {
    AttrNames = r0_0.RT_5,
    RateAttr = "AttackSpeedModifierRate_Melee",
    ValueAttr = "AttackSpeedModifierValue_Melee",
    WeaponModifierAttr = "AttackSpeedModifierValue_Melee",
    WeaponTag = "Melee",
  },
  AttackSpeedModifierValue_Normal = {
    AttrNames = r0_0.RT_6,
    RateAttr = "AttackSpeedModifierRate_Normal",
    ValueAttr = "AttackSpeedModifierValue_Normal",
    WeaponModifierAttr = "AttackSpeedModifierValue_Normal",
  },
  AttackSpeedModifierValue_Ranged = {
    AttrNames = r0_0.RT_5,
    RateAttr = "AttackSpeedModifierRate_Ranged",
    ValueAttr = "AttackSpeedModifierValue_Ranged",
    WeaponModifierAttr = "AttackSpeedModifierValue_Ranged",
    WeaponTag = "Ranged",
  },
  AttackSpeedModifierValue_Reload = {
    AttrNames = r0_0.RT_7,
    RateAttr = "AttackSpeedModifierRate_Reload",
    ValueAttr = "AttackSpeedModifierValue_Reload",
    WeaponModifierAttr = "AttackSpeedModifierValue_Reload",
  },
  AttackSpeedModifierValue_SlideAttack = {
    AttrNames = r0_0.RT_8,
    RateAttr = "AttackSpeedModifierRate_SlideAttack",
    ValueAttr = "AttackSpeedModifierValue_SlideAttack",
    WeaponModifierAttr = "AttackSpeedModifierValue_SlideAttack",
  },
  MultiShootModifierRate_Melee = {
    AttrNames = r0_0.RT_9,
    RateAttr = "MultiShootModifierRate_Melee",
    ValueAttr = "MultiShootModifierValue_Melee",
    WeaponModifierAttr = "MultiShootModifierRate_Melee",
    WeaponTag = "Melee",
  },
  MultiShootModifierRate_Normal = {
    AttrNames = r0_0.RT_9,
    RateAttr = "MultiShootModifierRate_Normal",
    ValueAttr = "MultiShootModifierValue_Normal",
    WeaponModifierAttr = "MultiShootModifierRate_Normal",
  },
  MultiShootModifierRate_Ranged = {
    AttrNames = r0_0.RT_9,
    RateAttr = "MultiShootModifierRate_Ranged",
    ValueAttr = "MultiShootModifierValue_Ranged",
    WeaponModifierAttr = "MultiShootModifierRate_Ranged",
    WeaponTag = "Ranged",
  },
  MultiShootModifierValue_Melee = {
    AttrNames = r0_0.RT_9,
    RateAttr = "MultiShootModifierRate_Melee",
    ValueAttr = "MultiShootModifierValue_Melee",
    WeaponModifierAttr = "MultiShootModifierValue_Melee",
    WeaponTag = "Melee",
  },
  MultiShootModifierValue_Normal = {
    AttrNames = r0_0.RT_9,
    RateAttr = "MultiShootModifierRate_Normal",
    ValueAttr = "MultiShootModifierValue_Normal",
    WeaponModifierAttr = "MultiShootModifierValue_Normal",
  },
  MultiShootModifierValue_Ranged = {
    AttrNames = r0_0.RT_9,
    RateAttr = "MultiShootModifierRate_Ranged",
    ValueAttr = "MultiShootModifierValue_Ranged",
    WeaponModifierAttr = "MultiShootModifierValue_Ranged",
    WeaponTag = "Ranged",
  },
  TriggerProbModifierRate_Melee = {
    AttrNames = r0_0.RT_10,
    RateAttr = "TriggerProbModifierRate_Melee",
    ValueAttr = "TriggerProbModifierValue_Melee",
    WeaponModifierAttr = "TriggerProbModifierRate_Melee",
    WeaponTag = "Melee",
  },
  TriggerProbModifierRate_Normal = {
    AttrNames = r0_0.RT_10,
    RateAttr = "TriggerProbModifierRate_Normal",
    ValueAttr = "TriggerProbModifierValue_Normal",
    WeaponModifierAttr = "TriggerProbModifierRate_Normal",
  },
  TriggerProbModifierRate_Ranged = {
    AttrNames = r0_0.RT_10,
    RateAttr = "TriggerProbModifierRate_Ranged",
    ValueAttr = "TriggerProbModifierValue_Ranged",
    WeaponModifierAttr = "TriggerProbModifierRate_Ranged",
    WeaponTag = "Ranged",
  },
  TriggerProbModifierRate_Ultra = {
    AttrNames = r0_0.RT_10,
    RateAttr = "TriggerProbModifierRate_Ultra",
    ValueAttr = "TriggerProbModifierValue_Ultra",
    WeaponModifierAttr = "TriggerProbModifierRate_Ultra",
    WeaponTag = "Ultra",
  },
  TriggerProbModifierValue_Melee = {
    AttrNames = r0_0.RT_10,
    RateAttr = "TriggerProbModifierRate_Melee",
    ValueAttr = "TriggerProbModifierValue_Melee",
    WeaponModifierAttr = "TriggerProbModifierValue_Melee",
    WeaponTag = "Melee",
  },
  TriggerProbModifierValue_Normal = {
    AttrNames = r0_0.RT_10,
    RateAttr = "TriggerProbModifierRate_Normal",
    ValueAttr = "TriggerProbModifierValue_Normal",
    WeaponModifierAttr = "TriggerProbModifierValue_Normal",
  },
  TriggerProbModifierValue_Ranged = {
    AttrNames = r0_0.RT_10,
    RateAttr = "TriggerProbModifierRate_Ranged",
    ValueAttr = "TriggerProbModifierValue_Ranged",
    WeaponModifierAttr = "TriggerProbModifierValue_Ranged",
    WeaponTag = "Ranged",
  },
  TriggerProbModifierValue_Ultra = {
    AttrNames = r0_0.RT_10,
    RateAttr = "TriggerProbModifierRate_Ultra",
    ValueAttr = "TriggerProbModifierValue_Ultra",
    WeaponModifierAttr = "TriggerProbModifierValue_Ultra",
    WeaponTag = "Ultra",
  },
}
r4_0.WeaponATKModifierRate = {
  AttrNames = {
    "ATK_Default",
    "ATK_Water",
    "ATK_Fire",
    "ATK_Wind",
    "ATK_Thunder",
    "ATK_Slash",
    "ATK_Spike",
    "ATK_Smash"
  },
  RateAttr = "WeaponATKModifierRate",
  ValueAttr = "WeaponATKModifierValue",
  WeaponModifierAttr = "WeaponATKModifierRate",
}
r4_0.WeaponCRDModifierRate_Melee = {
  AttrNames = r0_0.RT_11,
  RateAttr = "WeaponCRDModifierRate_Melee",
  ValueAttr = "WeaponCRDModifierValue_Melee",
  WeaponModifierAttr = "WeaponCRDModifierRate_Melee",
  WeaponTag = "Melee",
}
r4_0.WeaponCRDModifierRate_Normal = {
  AttrNames = r0_0.RT_11,
  RateAttr = "WeaponCRDModifierRate_Normal",
  ValueAttr = "WeaponCRDModifierValue_Normal",
  WeaponModifierAttr = "WeaponCRDModifierRate_Normal",
}
r4_0.WeaponCRDModifierRate_Ranged = {
  AttrNames = r0_0.RT_11,
  RateAttr = "WeaponCRDModifierRate_Ranged",
  ValueAttr = "WeaponCRDModifierValue_Ranged",
  WeaponModifierAttr = "WeaponCRDModifierRate_Ranged",
  WeaponTag = "Ranged",
}
r4_0.WeaponCRDModifierValue_Melee = {
  AttrNames = r0_0.RT_11,
  RateAttr = "WeaponCRDModifierRate_Melee",
  ValueAttr = "WeaponCRDModifierValue_Melee",
  WeaponModifierAttr = "WeaponCRDModifierValue_Melee",
  WeaponTag = "Melee",
}
r4_0.WeaponCRDModifierValue_Normal = {
  AttrNames = r0_0.RT_11,
  RateAttr = "WeaponCRDModifierRate_Normal",
  ValueAttr = "WeaponCRDModifierValue_Normal",
  WeaponModifierAttr = "WeaponCRDModifierValue_Normal",
}
r4_0.WeaponCRDModifierValue_Ranged = {
  AttrNames = r0_0.RT_11,
  RateAttr = "WeaponCRDModifierRate_Ranged",
  ValueAttr = "WeaponCRDModifierValue_Ranged",
  WeaponModifierAttr = "WeaponCRDModifierValue_Ranged",
  WeaponTag = "Ranged",
}
r4_0.WeaponCRIModifierRate_Melee = {
  AttrNames = r0_0.RT_12,
  RateAttr = "WeaponCRIModifierRate_Melee",
  ValueAttr = "WeaponCRIModifierValue_Melee",
  WeaponModifierAttr = "WeaponCRIModifierRate_Melee",
  WeaponTag = "Melee",
}
r4_0.WeaponCRIModifierRate_Normal = {
  AttrNames = r0_0.RT_12,
  RateAttr = "WeaponCRIModifierRate_Normal",
  ValueAttr = "WeaponCRIModifierValue_Normal",
  WeaponModifierAttr = "WeaponCRIModifierRate_Normal",
}
r4_0.WeaponCRIModifierRate_Ranged = {
  AttrNames = r0_0.RT_12,
  RateAttr = "WeaponCRIModifierRate_Ranged",
  ValueAttr = "WeaponCRIModifierValue_Ranged",
  WeaponModifierAttr = "WeaponCRIModifierRate_Ranged",
  WeaponTag = "Ranged",
}
r4_0.WeaponCRIModifierValue_Melee = {
  AttrNames = r0_0.RT_12,
  RateAttr = "WeaponCRIModifierRate_Melee",
  ValueAttr = "WeaponCRIModifierValue_Melee",
  WeaponModifierAttr = "WeaponCRIModifierValue_Melee",
  WeaponTag = "Melee",
}
r4_0.WeaponCRIModifierValue_Normal = {
  AttrNames = r0_0.RT_12,
  RateAttr = "WeaponCRIModifierRate_Normal",
  ValueAttr = "WeaponCRIModifierValue_Normal",
  WeaponModifierAttr = "WeaponCRIModifierValue_Normal",
}
r4_0.WeaponCRIModifierValue_Ranged = {
  AttrNames = r0_0.RT_12,
  RateAttr = "WeaponCRIModifierRate_Ranged",
  ValueAttr = "WeaponCRIModifierValue_Ranged",
  WeaponModifierAttr = "WeaponCRIModifierValue_Ranged",
  WeaponTag = "Ranged",
}
return r2_0(r3_0, r4_0)
