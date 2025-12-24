-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\CharCostumeTemplate.lua
-- version: lua54
-- line: [0, 0] id: 0
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end
local r2_0 = "CharCostumeTemplate"
local r3_0 = {
  [210101] = {
    CharCostumeId = 210101,
    SkinId = 210102,
  },
  [240101] = {
    CharCostumeId = 240101,
    SkinId = 240101,
  },
  [510101] = {
    CharCostumeId = 510101,
    SkinId = 510101,
  },
}
r3_0[530100] = {
  BackAccessory = 40001,
  CharCostumeId = 530100,
  ColorId = {
    1001,
    1001,
    1001,
    1001
  },
  FaceAccessory = 20001,
  HeadAccessory = 10001,
  SkinId = 210102,
  WaistAccessory = 30001,
}
r3_0[530101] = {
  CharCostumeId = 530101,
  SkinId = 530101,
}
return r1_0(r2_0, r3_0)
