-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\DamageType.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end
local r3_0 = {}
r3_0.Dark = {
  AdditionalBuff = {
    BuffId = 101,
    LastTime = 6,
  },
  DamageTypeUIIconPath = "/Game/UI/Texture/Dynamic/Atlas/Battle/T_Battle_Type_Dark02.T_Battle_Type_Dark02",
  ID = "Dark",
  ParticipationTrigger = true,
  ShildCalPriority = 2,
  WeaknessIcon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Light.T_Armory_Light",
  WeaknessTypeID = 1,
}
r3_0.Default = {
  ID = "Default",
  ShildCalPriority = 2,
  WeaknessTypeID = 0,
}
r3_0.EsDamage = {
  DisableAddColor = 1,
  ID = "EsDamage",
  IgnoreHp = 1,
  ShildCalPriority = 2,
}
r3_0.Fire = {
  AdditionalBuff = {
    BuffId = 103,
    LastTime = 6,
  },
  DamageTypeUIIconPath = "/Game/UI/Texture/Dynamic/Atlas/Battle/T_Battle_Type_Fire02.T_Battle_Type_Fire02",
  DamageTypeUIIndex = 2,
  ID = "Fire",
  ParticipationTrigger = true,
  ShildCalPriority = 2,
  WeaknessIcon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Wind.T_Armory_Wind",
  WeaknessTypeID = 3,
}
r3_0.HpConsume = {
  DisableAddColor = 1,
  DisablePassiveEffect = true,
  DisableUIEffect = 1,
  ID = "HpConsume",
  IgnoreDamageRate = true,
  IgnoreEnergyShield = true,
  IgnoreInvincible = true,
  ShildCalPriority = 2,
}
r3_0.Light = {
  AdditionalBuff = {
    BuffId = 106,
    LastTime = 6,
  },
  DamageTypeUIIconPath = "/Game/UI/Texture/Dynamic/Atlas/Battle/T_Battle_Type_Light02.T_Battle_Type_Light02",
  ID = "Light",
  ParticipationTrigger = true,
  ShildCalPriority = 2,
  WeaknessIcon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Dark.T_Armory_Dark",
  WeaknessTypeID = 6,
}
r3_0.SaiqiHpConsume = {
  DisableAddColor = 1,
  DisableUIEffect = 1,
  ID = "SaiqiHpConsume",
  IgnoreDamageRate = true,
  IgnoreEnergyShield = true,
  IgnoreInvincible = true,
  ShildCalPriority = 2,
}
r3_0.Slash = {
  DamageTypeUIIconPath = "/Game/UI/Texture/Dynamic/Atlas/Battle/T_Battle_Type_Slash02.T_Battle_Type_Slash02",
  DamageTypeUIIndex = 5,
  ESRate = 1,
  ID = "Slash",
  ParticipationTrigger = true,
  ShildCalPriority = 1,
}
r3_0.Smash = {
  CutToughnessRate = 1,
  DamageTypeUIIconPath = "/Game/UI/Texture/Dynamic/Atlas/Battle/T_Battle_Type_Smash02.T_Battle_Type_Smash02",
  DamageTypeUIIndex = 7,
  ID = "Smash",
  ParticipationTrigger = true,
  ShildCalPriority = 2,
}
r3_0.Spike = {
  DamageTypeUIIconPath = "/Game/UI/Texture/Dynamic/Atlas/Battle/T_Battle_Type_Spike02.T_Battle_Type_Spike02",
  DamageTypeUIIndex = 6,
  HpRate = 0.5,
  ID = "Spike",
  ParticipationTrigger = true,
  ShildCalPriority = 3,
}
r3_0.Thunder = {
  AdditionalBuff = {
    BuffId = 104,
    LastTime = 6,
  },
  DamageTypeUIIconPath = "/Game/UI/Texture/Dynamic/Atlas/Battle/T_Battle_Type_Thunder02.T_Battle_Type_Thunder02",
  DamageTypeUIIndex = 3,
  ID = "Thunder",
  ParticipationTrigger = true,
  ShildCalPriority = 2,
  WeaknessIcon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Water.T_Armory_Water",
  WeaknessTypeID = 4,
}
r3_0.TrueDamage = {
  DisableAddColor = 1,
  DisablePassiveEffect = true,
  ID = "TrueDamage",
  IgnoreDamageRate = true,
  IgnoreEnergyShield = true,
  ShildCalPriority = 2,
}
r3_0.Water = {
  AdditionalBuff = {
    BuffId = 102,
    LastTime = 6,
  },
  DamageTypeUIIconPath = "/Game/UI/Texture/Dynamic/Atlas/Battle/T_Battle_Type_Water02.T_Battle_Type_Water02",
  DamageTypeUIIndex = 4,
  ID = "Water",
  ParticipationTrigger = true,
  ShildCalPriority = 2,
  WeaknessIcon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Fire.T_Armory_Fire",
  WeaknessTypeID = 2,
}
r3_0.Wind = {
  AdditionalBuff = {
    BuffId = 105,
    LastTime = 6,
  },
  DamageTypeUIIconPath = "/Game/UI/Texture/Dynamic/Atlas/Battle/T_Battle_Type_Wind02.T_Battle_Type_Wind02",
  DamageTypeUIIndex = 1,
  ID = "Wind",
  ParticipationTrigger = true,
  ShildCalPriority = 2,
  WeaknessIcon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Thunder.T_Armory_Thunder",
  WeaknessTypeID = 5,
}
return r0_0("DamageType", r3_0)
