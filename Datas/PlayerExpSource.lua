-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\PlayerExpSource.lua
-- version: lua54
-- line: [0, 0] id: 0
return ((DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end)("PlayerExpSource", {
  [1] = {
    ID = 1,
    Sequence = 100,
    SourceName = "PlayerLevel_CharProgress",
  },
  [2] = {
    ID = 2,
    Sequence = 90,
    SourceName = "PlayerLevel_WeaponProgress",
  },
  [3] = {
    ID = 3,
    Sequence = 80,
    SourceName = "PlayerLevel_PetProgress",
  },
  [4] = {
    ID = 4,
    Sequence = 70,
    SourceName = "PlayerLevel_ModProgress",
  },
  [5] = {
    ID = 5,
    Sequence = 60,
    SourceName = "PlayerLevel_OtherExpSource",
  },
})
