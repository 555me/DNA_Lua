-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\GamepadSet.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  RT_1 = {
    [1] = "Combo1",
  },
  RT_2 = {
    [1] = "WB_Key_L",
  },
  RT_3 = {
    [1] = "WB_Key_R",
  },
  RT_4 = {
    [1] = "WB_Key_Direc",
  },
  RT_5 = {
    [1] = "Combo2",
  },
}
local r2_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [18, 18] id: 1
  return r1_1
end
local r3_0 = "GamepadSet"
local r4_0 = {
  ActiveGuide = {
    ActionName = "ActiveGuide",
    IsAction = true,
    KeyRegion = r0_0.RT_1,
    KeyText = "UI_Keyboard_Map_ActiveGuide",
    Order = 11,
  },
}
r4_0.Attack = {
  ActionName = "Attack",
  IsAction = true,
  KeyRegion = {
    [1] = "WB_Key_XYBA",
    [2] = "WB_Key_RBT",
    [3] = "WB_Key_XYBA",
    [4] = "WB_Key_XYBA",
  },
  KeyText = "UI_Keyboard_Map_Attack",
  Order = 4,
  TextHighLight = true,
}
r4_0.Avoid = {
  ActionName = "Avoid",
  IsAction = true,
  KeyRegion = {
    [1] = "WB_Key_XYBA",
    [2] = "WB_Key_XYBA",
    [3] = "WB_Key_XYBA",
    [4] = "WB_Key_RBT",
  },
  KeyText = "UI_Keyboard_Map_Avoid",
  Order = 7,
  TextHighLight = true,
}
r4_0.BulletJump = {
  ActionName = "BulletJump",
  IsAction = true,
  KeyRegion = r0_0.RT_2,
  KeyText = "UI_CTL_BulletJump",
  Order = 21,
}
r4_0.Camera = {
  ActionName = "Camera",
  GamepadIcon = {
    "R"
  },
  KeyRegion = r0_0.RT_3,
  KeyText = "UI_CTL_Camera",
  Order = 22,
}
r4_0.ChangeCameraLengthDown = {
  ActionName = "ChangeCameraLengthDown",
  IsAction = true,
  KeyRegion = r0_0.RT_1,
  KeyText = "UI_CTL_ZoomOut",
  Order = 10,
}
r4_0.ChangeCameraLengthUp = {
  ActionName = "ChangeCameraLengthUp",
  IsAction = true,
  KeyRegion = r0_0.RT_1,
  KeyText = "UI_CTL_ZoomIn",
  Order = 9,
}
r4_0.ChangeSelect = {
  ActionName = "ChangeSelect",
  GamepadIcon = {
    "Vertical"
  },
  KeyRegion = r0_0.RT_4,
  KeyText = "UI_CTL_Switch",
  Order = 18,
}
r4_0.ChargeBullet = {
  ActionName = "ChargeBullet",
  IsAction = true,
  KeyRegion = r0_0.RT_1,
  KeyText = "UI_Keyboard_Map_ChargeBullet",
  Order = 16,
}
r4_0.Fire = {
  ActionName = "Fire",
  IsAction = true,
  KeyRegion = {
    [1] = "WB_Key_RBT",
  },
  KeyText = "UI_Keyboard_Map_Fire",
  Order = 2,
}
r4_0.GamepadOpenSystem = {
  ActionName = "GamepadOpenSystem",
  IsAction = true,
  KeyRegion = r0_0.RT_4,
  KeyText = "UI_CTL_OpenSystem",
  Order = 17,
}
r4_0.GamepadUseSkill = {
  ActionName = "GamepadUseSkill",
  IsAction = true,
  KeyRegion = {
    [1] = "WB_Key_LBT",
    [2] = "WB_Key_LBT",
    [3] = "WB_Key_XYBA",
    [4] = "WB_Key_XYBA",
  },
  KeyText = "UI_CTL_UseSkill",
  Order = 8,
  TextHighLight = true,
}
r4_0.Interactive = {
  ActionName = "Interactive",
  IsAction = true,
  KeyRegion = {
    [1] = "WB_Key_XYBA",
    [2] = "WB_Key_XYBA",
    [3] = "WB_Key_XYBA",
    [4] = "WB_Key_XYBA",
  },
  KeyText = "UI_Keyboard_Map_Interactive",
  Order = 5,
}
r4_0.Jump = {
  ActionName = "Jump",
  IsAction = true,
  KeyRegion = {
    [1] = "WB_Key_XYBA",
    [2] = "WB_Key_XYBA",
    [3] = "WB_Key_RBT",
    [4] = "WB_Key_XYBA",
  },
  KeyText = "UI_Keyboard_Map_Jump",
  Order = 6,
  TextHighLight = true,
}
r4_0.LockMonster = {
  ActionName = "LockMonster",
  IsAction = true,
  KeyRegion = r0_0.RT_3,
  KeyText = "UI_Keyboard_Map_LockMonster",
  Order = 23,
}
r4_0.Move = {
  ActionName = "Move",
  GamepadIcon = {
    "L"
  },
  KeyRegion = r0_0.RT_2,
  KeyText = "UI_CTL_Move",
  Order = 20,
}
r4_0.OpenArmory = {
  ActionName = "OpenArmory",
  IsAction = true,
  KeyRegion = r0_0.RT_5,
  KeyText = "MAIN_UI_ARMORY",
  Order = 28,
}
r4_0.OpenBag = {
  ActionName = "OpenBag",
  IsAction = true,
  KeyRegion = r0_0.RT_5,
  KeyText = "MAIN_UI_BAG",
  Order = 31,
}
r4_0.OpenBattlePass = {
  ActionName = "OpenBattlePass",
  IsAction = true,
  KeyRegion = r0_0.RT_5,
  KeyText = "MAIN_UI_BATTLEPASS",
  Order = 26,
}
r4_0.OpenBattleWheel = {
  ActionName = "OpenBattleWheel",
  IsAction = true,
  KeyRegion = {
    [1] = "WB_Key_LBT",
  },
  KeyText = "MAIN_UI_BATTLEWHEEL",
  Order = 1,
}
r4_0.OpenEvent = {
  ActionName = "OpenEvent",
  IsAction = true,
  KeyRegion = r0_0.RT_5,
  KeyText = "MAIN_UI_GAMEEVENT",
  Order = 29,
}
r4_0.OpenForge = {
  ActionName = "OpenForge",
  IsAction = true,
  KeyRegion = r0_0.RT_5,
  KeyText = "MAIN_UI_FORGE",
  Order = 33,
}
r4_0.OpenGacha = {
  ActionName = "OpenGacha",
  IsAction = true,
  KeyRegion = r0_0.RT_5,
  KeyText = "MAIN_UI_GACHA",
  Order = 32,
}
r4_0.OpenGuideBook = {
  ActionName = "OpenGuideBook",
  IsAction = true,
  KeyRegion = r0_0.RT_1,
  KeyText = "MAIN_UI_GUIDEBOOK",
  Order = 12,
}
r4_0.OpenMap = {
  ActionName = "OpenMap",
  IsAction = true,
  KeyRegion = {
    [1] = "WB_Key_View",
  },
  KeyText = "MAIN_UI_MAP",
  Order = 24,
}
r4_0.OpenMenu = {
  ActionName = "OpenMenu",
  IsAction = true,
  KeyRegion = {
    [1] = "WB_Key_Menu",
  },
  KeyText = "MAIN_UI_MENU",
  Order = 25,
}
r4_0.OpenPlay = {
  ActionName = "OpenPlay",
  IsAction = true,
  KeyRegion = r0_0.RT_5,
  KeyText = "MAIN_UI_PLAY",
  Order = 30,
}
r4_0.OpenTask = {
  ActionName = "OpenTask",
  IsAction = true,
  KeyRegion = r0_0.RT_5,
  KeyText = "MAIN_UI_QUEST",
  Order = 27,
}
r4_0.ShowTeamInfo = {
  ActionName = "ShowTeamInfo",
  IsAction = true,
  KeyRegion = r0_0.RT_4,
  KeyText = "UI_Keyboard_TeamInfo",
  Order = 19,
}
r4_0.Skill1 = {
  ActionName = "Skill1",
  IsAction = true,
  KeyRegion = r0_0.RT_1,
  KeyText = "UI_Keyboard_Map_Skill1",
  Order = 13,
}
r4_0.Skill2 = {
  ActionName = "Skill2",
  IsAction = true,
  KeyRegion = r0_0.RT_1,
  KeyText = "UI_Keyboard_Map_Skill2",
  Order = 14,
}
r4_0.Skill3 = {
  ActionName = "Skill3",
  IsAction = true,
  KeyRegion = r0_0.RT_1,
  KeyText = "UI_Keyboard_Map_Skill3",
  Order = 15,
}
r4_0.Slide = {
  ActionName = "Slide",
  IsAction = true,
  KeyRegion = {
    [1] = "WB_Key_RBT",
    [2] = "WB_Key_XYBA",
    [3] = "WB_Key_LBT",
    [4] = "WB_Key_LBT",
  },
  KeyText = "UI_Keyboard_Map_Slide",
  Order = 3,
  TextHighLight = true,
}
return r2_0(r3_0, r4_0)
