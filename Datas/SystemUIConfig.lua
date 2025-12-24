-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\SystemUIConfig.lua
-- version: lua54
-- line: [0, 0] id: 0
return ((DataMgr and {}).ReadOnly and function(r0_1, r1_1)
  -- line: [2, 2] id: 1
  return r1_1
end)("SystemUIConfig", {
  BattleHitDirection = {
    AllowMulti = true,
    ConfigName = "BattleHitDirection",
    LimitCount = 4,
  },
  Default = {
    ConfigName = "Default",
  },
  MultiAndNotAddToStack = {
    AddToStack = false,
    AllowMulti = true,
    ConfigName = "MultiAndNotAddToStack",
  },
  OnlyAddToStack = {
    AddToStack = true,
    ConfigName = "OnlyAddToStack",
  },
  OnlyAllowMulti = {
    AllowMulti = true,
    ConfigName = "OnlyAllowMulti",
  },
  OnlyForceShow = {
    ConfigName = "OnlyForceShow",
    SpecialVisibleMode = "forceshow",
  },
  OnlyUIMode = {
    ConfigName = "OnlyUIMode",
    NeedUIMode = true,
  },
  StackAndFullScreen = {
    AddToStack = true,
    ConfigName = "StackAndFullScreen",
    NeedUIMode = true,
    StopWorldRender = true,
  },
  StackAndMulti = {
    AddToStack = true,
    AllowMulti = true,
    ConfigName = "StackAndMulti",
  },
  StackAndUIMode = {
    AddToStack = true,
    ConfigName = "StackAndUIMode",
    NeedUIMode = true,
  },
  UIModeAndForceShow = {
    ConfigName = "UIModeAndForceShow",
    NeedUIMode = true,
    SpecialVisibleMode = "forceshow",
  },
  UIModeAndMulti = {
    AllowMulti = true,
    ConfigName = "UIModeAndMulti",
    NeedUIMode = true,
  },
  UIModeAndMultiStack = {
    AddToStack = true,
    AllowMulti = true,
    ConfigName = "UIModeAndMultiStack",
    NeedUIMode = true,
  },
  UIModeAndNotAddToStack = {
    AddToStack = false,
    ConfigName = "UIModeAndNotAddToStack",
    NeedUIMode = true,
  },
})
