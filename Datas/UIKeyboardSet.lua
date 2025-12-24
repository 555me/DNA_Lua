-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\UIKeyboardSet.lua
-- version: lua54
-- line: [0, 0] id: 0
local r1_0 = (DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end
local r2_0 = "UIKeyboardSet"
local r3_0 = {}
r3_0.BattleFort = {
  ActionNameList = {
    "Attack",
    "Fire",
    "QuitChallenge",
    "OpenMenu"
  },
  IsWhiteList = true,
  KeyboardSetName = "BattleFort",
}
r3_0.BlackScreen = {
  IsWhiteList = true,
  KeyboardSetName = "BlackScreen",
}
r3_0.Dead = {
  ActionNameList = {
    "OpenMenu",
    "Recovery"
  },
  IsWhiteList = true,
  KeyboardSetName = "Dead",
}
r3_0.DeadInRegion = {
  ActionNameList = {
    "Recovery"
  },
  IsWhiteList = true,
  KeyboardSetName = "DeadInRegion",
}
r3_0.InBattleWheel = {
  ActionNameList = {
    "OpenBattleWheel"
  },
  IsWhiteList = true,
  KeyboardSetName = "InBattleWheel",
}
r3_0.InDeliver = {
  IsWhiteList = true,
  KeyboardSetName = "InDeliver",
}
r3_0.Invitation = {
  IsWhiteList = true,
  KeyboardSetName = "Invitation",
}
r3_0.LoadingReconnect = {
  IsWhiteList = true,
  KeyboardSetName = "LoadingReconnect",
}
r3_0.PopupConfirm = {
  ActionNameList = {
    "BulletJump"
  },
  KeyboardSetName = "PopupConfirm",
}
return r1_0(r2_0, r3_0)
