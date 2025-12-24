-- filename: @C:/Pack/Branch/geili11\Content/Script/UnLuaHotReload.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = "HOT_RELOAD"
local r1_0 = setmetatable({}, {
  __mode = "v",
})
local r2_0 = {}
local r3_0 = {
  debug = true,
  script_root_path = UE.UUnLuaFunctionLibrary.GetScriptRootPath(),
  ignore_modules = r2_0,
}
local r4_0 = {
  module_loaded = nil,
}
local r5_0 = {
  config = r3_0,
  hook = r4_0,
}
local function r6_0(r0_1, r1_1)
  -- line: [28, 70] id: 1
  local r4_1 = nil	-- notice: implicit variable refs by block#[0]
  local r2_1 = string.rep
  local r3_1 = {}
  function r4_1(r0_2, r1_2)
    -- line: [31, 64] id: 2
    if not r1_2 then
      r1_2 = 0
    end
    if type(r0_2) ~= "table" then
      return tostring(r0_2)
    end
    if r1_1 < r1_2 then
      return tostring(r0_2)
    end
    if r3_1[r0_2] then
      return ""
    end
    r3_1[r0_2] = true
    local r2_2 = r2_1(" ", r1_2) .. "{\r\n"
    r1_2 = r1_2 + 2
    for r7_2, r8_2 in pairs(r0_2) do
      r2_2 = r2_2 .. r2_1(" ", r1_2)
      if type(r7_2) == "number" then
        r2_2 = r2_2 .. "[" .. r7_2 .. "] = "
      elseif type(r7_2) == "string" then
        r2_2 = r2_2 .. r7_2 .. " = "
      else
        r2_2 = r2_2 .. tostring(r7_2) .. " = "
      end
      if type(r8_2) == "number" then
        r2_2 = r2_2 .. r8_2 .. ",\r\n"
      elseif type(r8_2) == "string" then
        r2_2 = r2_2 .. "\"" .. r8_2 .. "\",\r\n"
      elseif type(r8_2) == "table" then
        r2_2 = r2_2 .. tostring(r8_2) .. r4_1(r8_2, r1_2 + 2) .. ",\r\n"
      else
        r2_2 = r2_2 .. "\"" .. tostring(r8_2) .. "\",\r\n"
      end
    end
    -- close: r3_2
    return r2_2 .. r2_1(" ", r1_2 + -2) .. "}"
  end
  if r1_1 == nil then
    r1_1 = 64
  end
  return r4_1(r0_1)
end
local function r7_0(...)
  -- line: [72, 76] id: 3
  if r3_0.debug then
    UEPrint("HotReload ", ...)
  end
end
local r8_0 = table
local r9_0 = debug
local r10_0 = pairs
local r11_0 = require
local function r12_0(r0_4)
  -- line: [83, 94] id: 4
  local r1_4 = r10_0
  local r1_4, r2_4, r3_4 = r1_4(r0_4)
  return function(r0_5, r1_5)
    -- line: [85, 92] id: 5
    local r2_5, r3_5, r4_5, r5_5 = pcall(r1_4, r0_5, r1_5)
    if r2_5 then
      return r3_5, r4_5, r5_5
    else
      return nil
    end
  end, r2_4, r3_4
end
local function r13_0(r0_6)
  -- line: [96, 103] id: 6
  local r1_6 = r0_6 .. "\n" .. r9_0.traceback()
  if ScreenPrint then
    ScreenPrint(r1_6, 100)
  else
    r7_0(r1_6)
  end
end
local function r14_0(r0_7, ...)
  -- line: [105, 114] id: 7
  local r1_7 = r4_0[r0_7]
  if not r1_7 then
    return 
  end
  local r2_7, r3_7 = pcall(r1_7, ...)
  if not r2_7 then
    r7_0(string.format("calling hook function \'%s\' failed : %s", r0_7, r3_7))
  end
end
local r15_0 = {}
local function r16_0(r0_8)
  -- line: [120, 123] id: 8
  return UE.UUnLuaFunctionLibrary.GetFileLastModifiedTimestamp(r3_0.script_root_path .. r0_8:gsub("%.", "/") .. ".lua")
end
local r18_0 = (function()
  -- line: [125, 232] id: 9
  local r0_9 = nil
  local r1_9 = nil
  local r2_9 = setmetatable({}, {
    __index = _G,
    __newindex = _G,
  })
  local r3_9 = {
    __index = r2_9,
    __newindex = r2_9,
  }
  local function r4_9(r0_10)
    -- line: [131, 149] id: 10
    local r1_10 = nil
    local r2_10 = nil
    for r7_10, r8_10 in ipairs(package.searchers) do
      r2_10 = r8_10(r0_10)
      if type(r2_10) == "function" then
        r1_10 = true
        break
      end
    end
    -- close: r3_10
    if not r1_10 then
      return 
    end
    local r3_10 = {}
    setmetatable(r3_10, r3_9)
    r9_0.setupvalue(r2_10, 1, r3_10)
    return r2_10, r3_10
  end
  local function r6_9(r0_13, ...)
    -- line: [159, 189] id: 13
    if package.loaded[r0_13] ~= nil then
      return package.loaded[r0_13], nil
    end
    local r1_13 = r1_0[r0_13]
    if r1_13 then
      if package.loaded[r0_13] == nil then
        package.loaded[r0_13] = r1_13
      end
      return r1_13, nil
    end
    local r2_13, r3_13 = r4_9(r0_13)
    if r2_13 then
      local r4_13, r5_13 = xpcall(r2_13, r13_0, ...)
      if r1_0[r0_13] == nil then
        r1_0[r0_13] = r5_13
        package.loaded[r0_13] = r5_13
        r15_0[r0_13] = r16_0(r0_13)
        r14_0("module_loaded", r5_13, r0_13, false)
        return r5_13, nil
      end
    else
      return r11_0(r0_13, ...)
    end
    return r3_13, nil
  end
  function r2_9.require(r0_17, ...)
    -- line: [210, 222] id: 17
    if r0_9 and r1_9[r0_17] ~= nil then
      return r1_9[r0_17]
    end
    local r1_17 = r6_9(r0_17, ...)
    if r0_9 then
      r1_9[r0_17] = r1_17
      r1_9[r1_17] = r0_17
    end
    return r1_17
  end
  return {
    enter = function(r0_14)
      -- line: [191, 199] id: 14
      r0_9 = true
      r1_9 = setmetatable({}, {
        __mode = "kv",
      })
      for r5_14, r6_14 in r10_0(r0_14) do
        r1_9[r5_14] = r6_14
        r1_9[r6_14] = r5_14
      end
      -- close: r1_14
    end,
    exit = function()
      -- line: [201, 204] id: 15
      r0_9 = false
      r1_9 = setmetatable({}, {
        __mode = "kv",
      })
    end,
    load = r4_9,
    load_str = function(r0_11)
      -- line: [151, 157] id: 11
      local function r1_11()
        -- line: [152, 152] id: 12
        return _G.load(r0_11)()
      end
      local r2_11 = {}
      setmetatable(r2_11, r3_9)
      r9_0.setupvalue(r1_11, 1, r2_11)
      return r1_11, r2_11
    end,
    require = r6_9,
    is_loaded = function(r0_16)
      -- line: [206, 208] id: 16
      return r1_9[r0_16] ~= nil
    end,
  }
end)()
local function r19_0(r0_18)
  -- line: [236, 269] id: 18
  for r5_18, r6_18 in ipairs(r0_18) do
    assert(r6_18.old_module)
    for r11_18, r12_18 in ipairs(r6_18.values) do
      for r17_18, r18_18 in r10_0(r12_18) do
        for r23_18, r24_18 in r10_0(r18_18) do
          if r23_18 == nil and not r18_0.is_loaded(r24_18) then
            r6_18.old_module[r17_18] = r24_18
          elseif type(r24_18) == "table" and not r18_0.is_loaded(r24_18) then
            r7_0("COPY", tostring(r24_18), tostring(r23_18))
            for r29_18, r30_18 in r10_0(r24_18) do
              r23_18[r29_18] = r30_18
            end
            -- close: r25_18
          elseif type(r24_18) == "function" then
            local r25_18 = 1
            while true do
              local r26_18, r27_18 = r9_0.getupvalue(r24_18, r25_18)
              if r26_18 ~= nil and r26_18 ~= "" then
                local r29_18 = r6_18.upvalue_map[r9_0.upvalueid(r24_18, r25_18)]
                if r29_18 then
                  r7_0("SET UV :", r25_18, tostring(r24_18), r26_18, tostring(r29_18.replaced_upvalue))
                  r9_0.setupvalue(r24_18, r25_18, r29_18.replaced_upvalue)
                end
                r25_18 = r25_18 + 1
              else
                break
              end
            end
          end
        end
        -- close: r19_18
      end
      -- close: r13_18
    end
    -- close: r7_18
  end
  -- close: r1_18
end
local function r20_0(r0_19)
  -- line: [273, 304] id: 19
  local r1_19 = nil	-- notice: implicit variable refs by block#[0]
  function r1_19(r0_20, r1_20)
    -- line: [274, 295] id: 20
    assert(type(r0_20) == "function")
    local r2_20 = 1
    while true do
      local r3_20, r4_20 = r9_0.getupvalue(r0_20, r2_20)
      if r3_20 ~= nil and r3_20 ~= "" then
        if not r3_20:find("^[_%w]") then
          error("Invalid upvalue : " .. r8_0.concat(nil, "."))
        end
        if not r1_20[r3_20] then
          r1_20[r3_20] = r4_20
          if type(r4_20) == "function" then
            r1_19(r4_20, r1_20)
          end
        end
        r2_20 = r2_20 + 1
      else
        break
      end
    end
  end
  local r2_19 = {}
  for r7_19, r8_19 in r10_0(r0_19) do
    if type(r8_19) == "function" then
      r1_19(r8_19, r2_19)
    end
  end
  -- close: r3_19
  return r2_19
end
local function r21_0(r0_21)
  -- line: [306, 318] id: 21
  local r1_21 = {}
  if r18_0.is_loaded(r0_21) then
    return r1_21
  end
  for r6_21, r7_21 in r10_0(r0_21) do
    if not r18_0.is_loaded(r7_21) and type(r7_21) == "function" then
      r8_0.insert(r1_21, {
        name = r6_21,
        value = r7_21,
      })
    end
  end
  -- close: r2_21
  return r1_21
end
local function r22_0(r0_22, r1_22)
  -- line: [323, 333] id: 22
  local r2_22 = {}
  for r7_22, r8_22 in ipairs(r0_22) do
    local r9_22 = rawget(r1_22, r8_22.name)
    if r9_22 and r9_22 ~= r8_22.value then
      r8_0.insert(r2_22, {
        [r8_22.name] = {
          [r9_22] = r8_22.value,
        },
      })
    end
  end
  -- close: r3_22
  return r2_22
end
local function r23_0(r0_23, r1_23)
  -- line: [338, 387] id: 23
  local r2_23 = {}
  for r7_23, r8_23 in ipairs(r0_23) do
    for r13_23, r14_23 in r10_0(r8_23) do
      for r19_23, r20_23 in r10_0(r14_23) do
        if type(r20_23) == "function" then
          local r21_23 = 1
          while true do
            local r22_23, r23_23 = r9_0.getupvalue(r20_23, r21_23)
            if r22_23 ~= nil and r22_23 ~= "" then
              local r24_23 = r9_0.upvalueid(r20_23, r21_23)
              if not r2_23[r24_23] then
                local r25_23 = nil
                if r1_23[r22_23] ~= nil then
                  r25_23 = r23_23
                else
                  r7_0("ADD NEW UPVALUE : ", tostring(r20_23), r22_23, tostring(r23_23))
                  if type(r23_23) == "table" or type(r23_23) == "function" and r0_23[r23_23] ~= nil then
                    r25_23 = r0_23[r23_23]
                  else
                    r25_23 = r23_23
                  end
                end
                if r25_23 then
                  r2_23[r24_23] = {
                    replaced_upvalue = r25_23,
                  }
                end
              end
              r21_23 = r21_23 + 1
            else
              break
            end
          end
        end
      end
      -- close: r15_23
    end
    -- close: r9_23
  end
  -- close: r3_23
  return r2_23
end
local function r24_0(r0_24)
  -- line: [389, 503] id: 24
  local r4_24 = nil	-- notice: implicit variable refs by block#[0]
  local r1_24 = coroutine.running()
  local r2_24 = {
    [r9_0] = true,
    [coroutine] = true,
    [io] = true,
    [r2_24] = true,
    [r5_0] = true,
    [r18_0] = true,
    [r0_24] = true,
  }
  local r3_24 = nil
  function r4_24(r0_25, r1_25)
    -- line: [403, 435] id: 25
    local r2_25 = r9_0.getinfo(r0_25, r1_25 + 1, "f")
    if r2_25 == nil then
      return 
    end
    r2_25 = nil
    r3_24(r2_25.func)
    local r4_25 = 1
    while true do
      local r5_25, r6_25 = r9_0.getlocal(r0_25, r1_25 + 1, r4_25)
      if r5_25 == nil then
        if r4_25 > 0 then
          r4_25 = -1
          goto label_28
        else
          break
        end
      else
        ::label_28::
        ::label_28::
        local r7_25 = r0_24[r6_25]
        if r7_25 then
          r9_0.setlocal(r0_25, r1_25 + 1, r4_25, r7_25)
          r3_24(r7_25)
        else
          r3_24(r6_25)
        end
        if r4_25 > 0 then
          r4_25 = r4_25 + 1
        else
          r4_25 = r4_25 + -1
        end
      end
    end
    return r4_24(r0_25, r1_25 + 1)
  end
  function r3_24(r0_26)
    -- line: [437, 498] id: 26
    if r0_26 == nil or r2_24[r0_26] then
      return 
    end
    r2_24[r0_26] = true
    local r1_26 = type(r0_26)
    if r1_26 == "table" then
      if rawget(r0_26, "__Dict__") then
        return 
      end
      local r2_26 = getmetatable(r0_26)
      if r2_26 then
        r3_24(r2_26)
      end
      local r3_26 = {}
      for r8_26, r9_26 in r12_0(r0_26) do
        local r10_26 = r0_24[r9_26]
        if r10_26 then
          rawset(r0_26, r8_26, r10_26)
          r3_24(r10_26)
        else
          r3_24(r9_26)
        end
        r10_26 = r0_24[r8_26]
        if r10_26 then
          r3_26[r8_26] = r10_26
        end
      end
      -- close: r4_26
      for r8_26, r9_26 in r10_0(r3_26) do
        r0_26[r9_26] = r0_26[r8_26]
        r0_26[r8_26] = nil
        r3_24(r9_26)
      end
      -- close: r4_26
    elseif r1_26 == "userdata" then
      local r2_26 = getmetatable(r0_26)
      if r2_26 then
        r3_24(r2_26)
      end
      local r3_26 = r9_0.getuservalue(r0_26)
      if r3_26 then
        local r4_26 = r0_24[r3_26]
        if r4_26 then
          r9_0.setuservalue(r0_26, r3_26)
          r3_24(r4_26)
        else
          r3_24(r3_26)
        end
      end
    elseif r1_26 == "function" then
      local r2_26 = 1
      while true do
        local r3_26, r4_26 = r9_0.getupvalue(r0_26, r2_26)
        if r3_26 ~= nil then
          local r5_26 = r0_24[r4_26]
          if r5_26 then
            r3_24(r5_26)
          else
            r3_24(r4_26)
          end
          r2_26 = r2_26 + 1
        else
          break
        end
      end
    end
  end
  r4_24(r1_24, 2)
  r3_24(_G)
  r3_24(r9_0.getregistry())
end
local function r25_0(r0_27, r1_27, r2_27)
  -- line: [505, 599] id: 27
  r7_0("HOT RELOAD START")
  local r3_27 = {}
  for r8_27, r9_27 in ipairs(r0_27) do
    local r10_27 = r1_27[r8_27]
    local r11_27 = r21_0(r10_27)
    r7_0("--------------Print NewModuleInfo--------------")
    r7_0(r6_0(r11_27))
    local r12_27 = r20_0(r9_27)
    r7_0("--------------Print OldModuleUpValue--------------")
    r7_0(r6_0(r12_27, 6))
    local r13_27 = {
      values = {},
      upvalue_map = {},
      old_module = r9_27,
    }
    r13_27.values = r22_0(r11_27, r9_27)
    r8_0.insert(r13_27.values, {
      [r10_27] = {
        [r9_27] = r10_27,
      },
    })
    r7_0("--------------Print ValueMap--------------")
    r7_0(r6_0(r13_27.values))
    r13_27.upvalue_map = r23_0(r13_27.values, r12_27)
    r7_0("--------------Print UVMap--------------")
    r7_0(r6_0(r13_27.upvalue_map, 10))
    r3_27[r8_27] = r13_27
  end
  -- close: r4_27
  r19_0(r3_27)
  local r4_27 = {}
  for r9_27, r10_27 in ipairs(r3_27) do
    for r15_27, r16_27 in ipairs(r10_27.values) do
      for r21_27, r22_27 in r10_0(r16_27) do
        for r27_27, r28_27 in r10_0(r22_27) do
          r4_27[r27_27] = r28_27
        end
        -- close: r23_27
      end
      -- close: r17_27
    end
    -- close: r11_27
  end
  -- close: r5_27
  r7_0("--------------Print AllValueMap--------------")
  r7_0(r6_0(r4_27))
  r24_0(r4_27)
  r7_0("HOT RELOAD END")
end
local function r26_0(r0_28)
  -- line: [602, 655] id: 28
  if not r0_28 or #r0_28 == 0 then
    return 
  end
  local r1_28 = {}
  for r6_28, r7_28 in ipairs(r0_28) do
    if r1_0[r7_28] then
      r1_28[r7_28] = r1_0[r7_28]
    end
  end
  -- close: r2_28
  r18_0.enter(r1_28)
  local r2_28 = {}
  local r3_28 = {}
  local r4_28 = {}
  for r9_28, r10_28 in ipairs(r0_28) do
    if r1_0[r10_28] == nil then
      r18_0.require(r10_28)
    else
      local r11_28, r12_28 = r18_0.load(r10_28)
      if r11_28 ~= nil then
        local r13_28, r14_28 = xpcall(r11_28, r13_0)
        if not r13_28 then
          r18_0.exit()
          return 
        end
        if r14_28 then
          for r19_28, r20_28 in r10_0(r12_28) do
            r14_28[r19_28] = r20_28
          end
          -- close: r15_28
        else
          r14_28 = r12_28
        end
        if string.sub(r10_28, 1, string.len("Datas.")) == "Datas." then
          package.loaded[r10_28] = r14_28
        else
          r2_28[#r2_28 + 1] = r1_0[r10_28]
          r3_28[#r3_28 + 1] = r14_28
          r4_28[#r4_28 + 1] = r12_28
          r14_0("module_loaded", r14_28, r10_28, true)
        end
      else
        r18_0.exit()
        return 
      end
    end
  end
  -- close: r5_28
  r25_0(r2_28, r3_28, r4_28)
  r18_0.exit()
end
function r5_0.reload(r0_29)
  -- line: [658, 679] id: 29
  if r0_29 then
    r26_0(r0_29)
    return 
  end
  local r1_29 = {}
  for r6_29, r7_29 in r10_0(r15_0) do
    if not r2_0[r6_29] then
      local r8_29 = r16_0(r6_29)
      if r8_29 ~= r7_29 then
        r1_29[#r1_29 + 1] = r6_29
        r15_0[r6_29] = r8_29
      end
    end
  end
  -- close: r2_29
  r7_0("modified modules:", r6_0(r1_29))
  if #r1_29 > 0 then
    r26_0(r1_29)
  end
end
function r5_0.RemoveLoadedModule(r0_30)
  -- line: [681, 684] id: 30
  r1_0[r0_30] = nil
  package.loaded[r0_30] = nil
end
r5_0.require = r18_0.require
return r5_0
