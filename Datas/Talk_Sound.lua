-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\Talk_Sound.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0, r1_0 = pcall(require, "CommonConst")
if not r0_0 then
  r1_0 = {
    SystemVoice = "CN",
  }
end
return setmetatable({}, {
  __index = function(r0_1, r1_1)
    -- line: [6, 12] id: 1
    if r1_0.ArmoryVoice then
      return DataMgr["Talk_Sound" .. r1_0.ArmoryVoice][r1_1]
    else
      return DataMgr["Talk_Sound" .. r1_0.SystemVoice][r1_1]
    end
  end,
  __pairs = function(r0_2)
    -- line: [13, 26] id: 2
    local r1_2 = nil
    if r1_0.ArmoryVoice then
      r1_2 = DataMgr["Talk_Sound" .. r1_0.ArmoryVoice]
    else
      r1_2 = DataMgr["Talk_Sound" .. r1_0.SystemVoice]
    end
    local r2_2 = getmetatable(r1_2)
    if r2_2 and r2_2.__pairs then
      return r2_2.__pairs(r1_2)
    else
      return next, r1_2, nil
    end
  end,
})
