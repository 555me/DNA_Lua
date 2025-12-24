-- filename: @C:/Pack/Branch/geili11\Content/Script/Hotfix.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  ShowUpValue = function(r0_1)
    -- line: [5, 17] id: 1
    DebugPrint("---------ShowUpValue Start---------")
    local r1_1 = 1
    while true do
      local r2_1, r3_1 = debug.getupvalue(r0_1, r1_1)
      DebugPrint("upvalue", r2_1, r1_1, r3_1)
      if r2_1 ~= nil and r2_1 ~= "" then
        r1_1 = r1_1 + 1
      else
        break
      end
    end
    DebugPrint("---------ShowUpValue End---------")
  end,
  HotFixFunction = function(r0_2, r1_2)
    -- line: [19, 41] id: 2
    DebugPrint("HotFixFunction", r0_2, r1_2)
    local r2_2 = 1
    while true do
      local r3_2, r4_2 = debug.getupvalue(r1_2, r2_2)
      if r3_2 ~= nil and r3_2 ~= "" then
        DebugPrint("setupvalue,name:", r3_2, ",i:", r2_2, ",old_function:", r0_2, ",new_upvalue:", r4_2)
        debug.setupvalue(r0_2, r2_2, r4_2)
        r2_2 = r2_2 + 1
      else
        break
      end
    end
    debug.replace_function(r0_2, r1_2)
  end,
  HotFixReference = function(r0_3, r1_3, r2_3)
    -- line: [43, 53] id: 3
    local r3_3 = r0_3.ref_tables
    if not r3_3 then
      return 
    end
    for r8_3, r9_3 in ipairs(r3_3) do
      r9_3[r1_3] = r2_3
    end
    -- close: r4_3
  end,
  NewValues = {},
  HotFix = function(r0_4, r1_4, r2_4)
    -- line: [56, 86] id: 4
    table.insert(r0_0.NewValues, r2_4)
    local r3_4 = r0_4[r1_4]
    if r3_4 == r2_4 then
      return true
    end
    if r3_4 == nil or r2_4 == nil then
      r0_4[r1_4] = r2_4
      if type(r3_4) == "function" or type(r2_4) == "function" then
        r0_0.HotFixReference(r0_4, r1_4, r2_4)
      end
    elseif type(r3_4) ~= "function" then
      r0_4[r1_4] = r2_4
    elseif type(r2_4) ~= "function" then
      r0_4[r1_4] = r2_4
    else
      local r4_4, r5_4 = pcall(r0_0.HotFixFunction, r3_4, r2_4)
      if not r4_4 then
        ScreenPrint("HotFix执行失败!name:[" .. tostring(r1_4) .. "],ret:" .. tostring(r5_4))
        r0_0.Success = false
        return false
      end
    end
    return true
  end,
  ExecHotFix = function(r0_5, r1_5)
    -- line: [88, 137] id: 5
    local r4_5 = "return function(HotFixModule, HotFix)\n" .. "\t\tHotFixModule.Success = true\n\t\tHotFix(_G, \"Get_G\", function(...)\n\t\t\treturn _G\n\t\tend)\n\t\tHotFix(DataMgr, \"ReadOnly_NewIndex\", function(t, k, v)\n\t\t\tlocal mt = getmetatable(t)\n\t\t\tif type(v) == \'table\' then\n\t\t\t\tv = DataMgr.ReadOnly(\'Hotfix\', v)\n\t\t\tend\n\t\t\trawset(mt.__index, k, v)\n\t\tend)\n\t\tlocal data_module_names = {}\n\t\tHotFixModule.data_module_table = {}\n\t\tlocal mt = getmetatable(DataMgr)\n\t\tlocal old_index = mt.__index\n\t\tmt.__index = function(t, key)\n\t\t\ttable.insert(data_module_names, key)\n\t\t\tHotFixModule.data_module_table[key] = 1\n\t        return require(\"Datas.\"..key)\n\t    end\n\t    setmetatable(DataMgr, mt)\n\t" .. r1_5 .. "\n" .. "\t\tmt.__index = old_index\n\t    setmetatable(DataMgr, mt)\n\t    if data_module_names then\n\t    \tGWorld.GameInstance:ReloadDataTablesByModuleName(data_module_names)\n\t    end\n\t\treturn HotFixModule.Success\n\t" .. "\nend"
    local r5_5, r6_5 = pcall(_G.load, r4_5)
    if not r5_5 then
      ScreenPrint("HotFix执行失败1,请检查HotFix代码编写是否正确:[" .. tostring(r4_5) .. "]" .. tostring(r6_5))
      return 
    end
    local r7_5, r8_5 = pcall(r6_5)
    if not r7_5 then
      ScreenPrint("HotFix执行失败2,请检查HotFix代码编写是否正确:[" .. tostring(r4_5) .. "]" .. tostring(r8_5))
      return 
    end
    if not r8_5(r0_0, r0_0.HotFix) then
      return 
    end
    print(LogTag, "HotFix执行成功:[" .. tostring(r4_5) .. "]")
  end,
}
return r0_0
