-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\Dialogue.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0, r1_0 = pcall(require, "CommonConst")
if not r0_0 then
  r1_0 = {
    SystemLanguage = "TextMapContent",
  }
end
return setmetatable({}, {
  __index = function(r0_1, r1_1)
    -- line: [7, 9] id: 1
    return DataMgr["Dialogue_" .. r1_0.SystemLanguage][r1_1]
  end,
  __pairs = function(r0_2)
    -- line: [10, 18] id: 2
    local r1_2 = DataMgr["Dialogue_" .. r1_0.SystemLanguage]
    local r2_2 = getmetatable(r1_2)
    if r2_2 and r2_2.__pairs then
      return r2_2.__pairs(r1_2)
    else
      return next, r1_2, nil
    end
  end,
})
