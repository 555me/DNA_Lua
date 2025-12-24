-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\MapMarkIcon.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end
local r3_0 = {}
r3_0[1] = {
  MarkIconID = 1,
  MarkIconPath = {
    Panel = "/Game/UI/Texture/Dynamic/Atlas/Map/T_Map_MarkIcon_Star.T_Map_MarkIcon_Star",
    Point = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Mark_Star.T_Gp_Mark_Star",
  },
}
r3_0[2] = {
  MarkIconID = 2,
  MarkIconPath = {
    Panel = "/Game/UI/Texture/Dynamic/Atlas/Map/T_Map_MarkIcon_Mission.T_Map_MarkIcon_Mission",
    Point = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Mark_Mission.T_Gp_Mark_Mission",
  },
}
r3_0[3] = {
  MarkIconID = 3,
  MarkIconPath = {
    Panel = "/Game/UI/Texture/Dynamic/Atlas/Map/T_Map_MarkIcon_Enemy.T_Map_MarkIcon_Enemy",
    Point = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Mark_Enemy.T_Gp_Mark_Enemy",
  },
}
r3_0[4] = {
  MarkIconID = 4,
  MarkIconPath = {
    Panel = "/Game/UI/Texture/Dynamic/Atlas/Map/T_Map_MarkIcon_Collect.T_Map_MarkIcon_Collect",
    Point = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Mark_Collect.T_Gp_Mark_Collect",
  },
}
r3_0[5] = {
  MarkIconID = 5,
  MarkIconPath = {
    Panel = "/Game/UI/Texture/Dynamic/Atlas/Map/T_Map_MarkIcon_Fish.T_Map_MarkIcon_Fish",
    Point = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Mark_Fish.T_Gp_Mark_Fish",
  },
}
r3_0[6] = {
  MarkIconID = 6,
  MarkIconPath = {
    Panel = "/Game/UI/Texture/Dynamic/Atlas/Map/T_Map_MarkIcon_Mining.T_Map_MarkIcon_Mining",
    Point = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Mark_Mining.T_Gp_Mark_Mining",
  },
}
r3_0[7] = {
  MarkIconID = 7,
  MarkIconPath = {
    Panel = "/Game/UI/Texture/Dynamic/Atlas/Map/T_Map_MarkIcon_Pet.T_Map_MarkIcon_Pet",
    Point = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Mark_Pet.T_Gp_Mark_Pet",
  },
}
return r0_0("MapMarkIcon", r3_0)
