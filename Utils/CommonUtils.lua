-- filename: @C:/Pack/Branch/geili11\Content/Script/Utils\CommonUtils.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {}
local r1_0 = r0_0
function r0_0.IsObjId(r0_1)
  -- line: [7, 12] id: 1
  if #r0_1 == 14 and string.byte(string.sub(r0_1, 1, 1)) == 0 then
    return true
  end
  return false
end
function r0_0.IsObjIdStr(r0_2)
  -- line: [14, 22] id: 2
  if string.len(r0_2) ~= 36 then
    return false
  end
  if string.sub(r0_2, 1, 8) ~= "ObjectId" then
    return false
  end
  return true
end
function r0_0.ObjId2Str(r0_3)
  -- line: [24, 32] id: 3
  return table.concat({
    "ObjectId(\'",
    r1_0.ObjId2Str2(r0_3),
    "\')"
  }, "")
end
function r0_0.ToHex(r0_4, r1_4)
  -- line: [34, 41] id: 4
  local r2_4 = math.min(#r0_4, r1_4 and #r0_4)
  local r3_4 = {}
  for r7_4 = 1, r2_4, 1 do
    r3_4[r7_4] = string.format("%02X", string.byte(r0_4, r7_4))
  end
  return table.concat(r3_4, " ")
end
function r0_0.BinaryDump(r0_5)
  -- line: [46, 55] id: 5
  if r0_5 == nil then
    return "nil"
  end
  if type(r0_5) == "table" and r0_5.binary_dump then
    return r0_5:binary_dump(r0_5)
  end
  return r0_5
end
function r0_0.ObjId2Str2(r0_6)
  -- line: [57, 68] id: 6
  local r1_6 = ""
  if r0_6 == nil then
    return ""
  end
  r1_6 = {}
  for r5_6 = 3, #r0_6, 1 do
    r1_6[r5_6 + -2] = string.format("%02X", string.byte(string.sub(r0_6, r5_6, r5_6)))
  end
  return table.concat(r1_6, "")
end
function r0_0.Str2ObjId(r0_7)
  -- line: [70, 81] id: 7
  if not r0_7 then
    return ""
  end
  if r0_7 == "" then
    return ""
  end
  if not r0_0.IsObjIdStr(r0_7) then
    return ""
  end
  return bson.str2objectid(string.sub(r0_7, 11, 34))
end
function r0_0.Split(r0_8, r1_8)
  -- line: [83, 92] id: 8
  local r2_8 = {}
  if not r0_8 then
    return r2_8
  end
  string.gsub(r0_8, "[^" .. r1_8 .. "]+", function(r0_9)
    -- line: [88, 90] id: 9
    table.insert(r2_8, r0_9)
  end)
  return r2_8
end
function r0_0.DeepCopy(r0_10)
  -- line: [94, 106] id: 10
  local r1_10 = nil	-- notice: implicit variable refs by block#[0]
  function r1_10(r0_11)
    -- line: [95, 104] id: 11
    if type(r0_11) ~= "table" then
      return r0_11
    end
    local r1_11 = {}
    for r6_11, r7_11 in pairs(r0_11) do
      r1_11[r1_10(r6_11)] = r1_10(r7_11)
    end
    -- close: r2_11
    return setmetatable(r1_11, getmetatable(r0_11))
  end
  return r1_10(r0_10)
end
function r0_0.GenDeclareUpvaluesCode(r0_12, r1_12, r2_12)
  -- line: [108, 126] id: 12
  if not r0_12 then
    return 
  end
  local r3_12 = r0_12.__Class__ and r0_12
  if not r3_12[r1_12] or type(r3_12[r1_12]) ~= "function" then
    return ""
  end
  local r4_12 = "local %s = CommonUtils.GetUpvalues(%s.%s, \"%s\")"
  local r5_12 = ""
  local r6_12 = 1
  while true do
    local r7_12, r8_12 = debug.getupvalue(r3_12[r1_12], r6_12)
    if r7_12 ~= nil then
      r6_12 = r6_12 + 1
      if r7_12 ~= "_ENV" then
        r5_12 = r5_12 .. string.format(r4_12, r7_12, r2_12, r1_12, r7_12) .. "\n"
      end
    else
      break
    end
  end
  return r5_12
end
function r0_0.ReloadPakFromDisk(r0_13)
  -- line: [128, 136] id: 13
  local r1_13, r2_13 = package.searchpath(r0_13, package.path)
  DebugPrint("CommonUtils.ReloadPakFromDisk searchpath", r1_13, r2_13)
  if not r1_13 then
    return package.loaded[r1_13]
  end
  package.loaded[r1_13] = r0_0.DoFile(r1_13)
  return package.loaded[r1_13]
end
function r0_0.DoFile(r0_14)
  -- line: [138, 144] id: 14
  local r1_14 = io.open(r0_14, "r")
  local r2_14 = r1_14:read("*a")
  r1_14:close()
  local r3_14, r4_14 = load(r2_14)
  return r3_14()
end
function r0_0.LoadNewFuncStr(r0_15, r1_15)
  -- line: [146, 187] id: 15
  local r2_15 = r0_15.__Class__
  if not r2_15[r1_15] then
    return nil, nil, "no function " .. r1_15 .. " in entity"
  end
  local r3_15 = debug.getinfo(r2_15[r1_15], "S")
  if r3_15.what ~= "Lua" then
    return nil, nil, "Cannot extract source for C functions."
  end
  local r4_15 = r3_15.source:sub(2)
  local r5_15 = r0_0.DoFile(r4_15)
  if r5_15 == nil then
    return nil, nil, "no file:" .. r4_15
  end
  local r6_15 = r5_15[r1_15]
  if not r6_15 then
    return nil, nil, "no function:" .. r1_15 .. " in file:" .. r4_15
  end
  local r7_15 = debug.getinfo(r6_15, "S")
  local r8_15 = {}
  for r13_15 in io.lines(r4_15) do
    table.insert(r8_15, r13_15)
  end
  -- close: r9_15
  return "\n" .. "\tlocal ClassMgr = require \"NetworkEngine.Common.ClassManager\"\n\tlocal _class_ = ClassMgr:GetType(\"" .. r0_15.__Class__.__Name__ .. "\")\n\t" .. "\n" .. r0_0.GenDeclareUpvaluesCode(r2_15, r1_15, "_class_") .. "\n" .. r0_0.ConvertFuncString(table.concat(r8_15, "\n", r7_15.linedefined, r7_15.lastlinedefined), r1_15, "_class_"), r3_15.source
end
function r0_0.LoadNewFuncStrProp(r0_16, r1_16)
  -- line: [189, 233] id: 16
  local r2_16 = string.match(r0_16, "([^.]+)$")
  local r4_16 = require("NetworkEngine.Common.ClassManager"):GetType(r0_16)
  if not r4_16[r1_16] then
    return nil, nil, "no function " .. r1_16 .. " in entity"
  end
  local r5_16 = debug.getinfo(r4_16[r1_16], "S")
  if r5_16.what ~= "Lua" then
    return nil, nil, "Cannot extract source for C functions."
  end
  local r6_16 = r5_16.source:sub(2)
  local r7_16 = r0_0.DoFile(r6_16)
  if r7_16 == nil then
    return nil, nil, "no file:" .. r6_16
  end
  local r8_16 = r7_16[r2_16][r1_16]
  if not r8_16 then
    return nil, nil, "no function:" .. r1_16 .. " in file:" .. r6_16
  end
  local r9_16 = debug.getinfo(r8_16, "S")
  local r10_16 = {}
  for r15_16 in io.lines(r6_16) do
    table.insert(r10_16, r15_16)
  end
  -- close: r11_16
  return "\n" .. "\tlocal ClassMgr = require \"NetworkEngine.Common.ClassManager\"\n\tlocal prop_class_ = ClassMgr:GetType(\"" .. r0_16 .. "\")\n\t" .. "\n" .. r0_0.GenDeclareUpvaluesCode(r4_16, r1_16, "prop_class_") .. "\n" .. r0_0.ConvertFuncString(table.concat(r10_16, "\n", r9_16.linedefined, r9_16.lastlinedefined), r1_16, "prop_class_"), r5_16.source
end
function r0_0.ConvertFuncString(r0_17, r1_17, r2_17)
  -- line: [235, 265] id: 17
  local function r3_17(r0_18)
    -- line: [236, 246] id: 18
    local r1_18 = r0_18:match("%b()")
    if not r1_18 then
      return false
    end
    return r1_18:gsub("%s+", "") ~= "()"
  end
  if not r2_17 then
    r2_17 = "self"
  end
  local r4_17 = r0_17:match("^(.-)\n") and r0_17
  local r5_17 = ""
  if string.find(r4_17, "%:") then
    if r3_17(r4_17) then
      r5_17 = r2_17 .. "." .. r1_17 .. " = function (self,"
    else
      r5_17 = r2_17 .. "." .. r1_17 .. " = function (self"
    end
  elseif string.find(r4_17, "%.") then
    r5_17 = r2_17 .. "." .. r1_17 .. " = function ("
  end
  local r6_17 = string.find(r0_17, "%(")
  if r6_17 then
    r0_17 = string.sub(r0_17, r6_17 + 1)
  end
  return r5_17 .. r0_17
end
function r0_0.GetUpvalues(r0_19, r1_19)
  -- line: [268, 281] id: 19
  if not r0_19 then
    return 
  end
  local r2_19 = 1
  while true do
    local r3_19, r4_19 = debug.getupvalue(r0_19, r2_19)
    if r3_19 then
      if r3_19 == r1_19 then
        return r4_19
      end
      r2_19 = r2_19 + 1
    else
      break
    end
  end
end
function r0_0.OrderedNumberKeyPairs(r0_20)
  -- line: [287, 307] id: 20
  local r1_20 = {}
  for r6_20 in pairs(r0_20) do
    if type(r6_20) == "number" then
      table.insert(r1_20, r6_20)
    end
  end
  -- close: r2_20
  table.sort(r1_20)
  local r2_20 = 0
  return function()
    -- line: [301, 306] id: 21
    r2_20 = r2_20 + 1
    if r1_20[r2_20] then
      return r1_20[r2_20], r0_20[r1_20[r2_20]]
    end
  end
end
function r0_0.TableToString(r0_22, r1_22)
  -- line: [310, 377] id: 22
  if type(r0_22) ~= "table" then
    r0_22 = {
      r0_22
    }
  end
  if not r1_22 then
    r1_22 = 10
  end
  local r2_22 = {
    IsObjId = function(r0_23)
      -- line: [318, 326] id: 23
      if type(r0_23) ~= "string" then
        return false
      end
      if #r0_23 == 14 and string.byte(string.sub(r0_23, 1, 1)) == 0 then
        return true
      end
      return false
    end,
    ObjId2Str2 = function(r0_24)
      -- line: [327, 337] id: 24
      local r1_24 = ""
      if r0_24 == nil then
        return ""
      end
      for r5_24 = 3, #r0_24, 1 do
        r1_24 = r1_24 .. string.format("%02X", string.byte(string.sub(r0_24, r5_24, r5_24)))
      end
      return r1_24
    end,
  }
  local function r3_22(r0_25)
    -- line: [338, 342] id: 25
    return "ObjectId(\'" .. r2_22.ObjId2Str2(r0_25) .. "\')"
  end
  r2_22.ObjId2Str = r3_22
  function r3_22(r0_26, r1_26)
    -- line: [345, 371] id: 26
    local r2_26 = ""
    for r7_26, r8_26 in pairs(r0_26) do
      for r12_26 = 1, r1_26, 1 do
        r2_26 = r2_26 .. "\t"
      end
      local r9_26 = nil
      local r10_26 = nil
      if type(r7_26) == "string" and r2_22.IsObjId(r7_26) then
        r9_26 = r2_22.ObjId2Str(r7_26)
      else
        r9_26 = tostring(r7_26)
      end
      if type(r8_26) == "string" and r2_22.IsObjId(r8_26) then
        r10_26 = r2_22.ObjId2Str(r8_26)
      else
        r10_26 = tostring(r8_26)
      end
      r2_26 = r2_26 .. r9_26 .. " (" .. tostring(type(r7_26)) .. ")" .. ": " .. r10_26 .. " (" .. tostring(type(r8_26)) .. ")" .. "\n"
      if type(r8_26) == "table" and r1_26 < r1_22 then
        r2_26 = r2_26 .. r3_22(r8_26, r1_26 + 1)
      end
    end
    -- close: r3_26
    return r2_26
  end
  local r4_22 = "PrintTable: " .. tostring(r0_22) .. "\n"
  if r0_22 and type(r0_22) == "table" then
    r4_22 = r4_22 .. r3_22(r0_22, 1)
  end
  return r4_22
end
function r0_0.TraverseFromTheMiddleOfTheArrayToBothSides(r0_27, r1_27, r2_27)
  -- line: [380, 398] id: 27
  if r1_27 <= #r0_27 // 2 then
    for r6_27 = r1_27, #r0_27, 1 do
      if r2_27(r0_27[r6_27]) then
        return 
      end
      local r7_27 = r1_27 * 2 - r6_27
      if r7_27 <= #r0_27 and r7_27 > 0 and r7_27 ~= r6_27 and r2_27(r0_27[r1_27 * 2 - r6_27]) then
        return 
      end
    end
  else
    for r6_27 = r1_27, 1, -1 do
      if r2_27(r0_27[r6_27]) then
        return 
      end
      local r7_27 = r1_27 * 2 - r6_27
      if r7_27 <= #r0_27 and r7_27 > 0 and r7_27 ~= r6_27 and r2_27(r0_27[r1_27 * 2 - r6_27]) then
        return 
      end
    end
  end
end
function r0_0.MathConcat(r0_28, r1_28)
  -- line: [400, 412] id: 28
  return r0_28 * 10 ^ (function(r0_29)
    -- line: [401, 407] id: 29
    if r0_29 == 0 then
      return 1
    end
    return math.floor(math.log(r0_29) / math.log(10)) + 1
  end)(r1_28) + r1_28
end
function r0_0.Copy(r0_30)
  -- line: [414, 426] id: 30
  local r1_30 = nil	-- notice: implicit variable refs by block#[0]
  function r1_30(r0_31)
    -- line: [415, 424] id: 31
    if type(r0_31) ~= "table" then
      return r0_31
    end
    local r1_31 = {}
    for r6_31, r7_31 in pairs(r0_31) do
      r1_31[r1_30(r6_31)] = r1_30(r7_31)
    end
    -- close: r2_31
    return r1_31
  end
  return r1_30(r0_30)
end
function r0_0.GetTimeZone()
  -- line: [428, 440] id: 32
  return math.floor((os.time(os.date("*t")) - os.time(os.date("!*t"))) / 3600)
end
function r0_0.Remap(r0_33, r1_33, r2_33, r3_33, r4_33)
  -- line: [442, 444] id: 33
  return (r0_33 - r1_33) / (r2_33 - r1_33) * (r4_33 - r3_33) + r3_33
end
function r0_0.IsEqual(r0_34, r1_34)
  -- line: [446, 467] id: 34
  if #r0_34 ~= #r1_34 then
    return false
  end
  for r6_34, r7_34 in ipairs(r0_34) do
    local r8_34 = r1_34[r6_34]
    if type(r7_34) ~= type(r8_34) then
      return false
    end
    if type(r7_34) == "table" and not r0_0.IsEqual(r7_34, r8_34) then
      return false
    elseif r7_34 ~= r1_34[r6_34] then
      return false
    end
  end
  -- close: r2_34
  return true
end
function r0_0.AttrValueToString(r0_35, r1_35, r2_35, r3_35)
  -- line: [471, 506] id: 35
  if not r0_35 then
    return r1_35
  end
  if r0_35.NumCorrect and not r2_35 then
    r1_35 = r1_35 * r0_35.NumCorrect
  end
  local r4_35 = ""
  if r0_35.IsPercent or r2_35 then
    r1_35 = r1_35 * 100
    r4_35 = "%"
  end
  if r3_35 then
    return tostring(r1_35) .. r4_35
  end
  local r5_35, r6_35 = math.modf(r1_35)
  if math.abs(r6_35 + 0) >= 0.00001 and math.abs(r6_35 + -1) >= 0.00001 then
    local r7_35 = math.floor((r6_35 * 100 + 0.5)) / 100
    if r7_35 ~= 0 then
      r5_35 = r5_35 + r7_35
    end
  elseif r6_35 > 0.5 then
    r5_35 = r5_35 + 1
  end
  local r7_35 = tostring(r5_35)
  local r8_35 = nil
  repeat
    r7_35, r8_35 = string.gsub(r7_35, "^(-?%d+)(%d%d%d)", "%1,%2")
  until r8_35 == 0
  return r7_35 .. r4_35
end
function r0_0.RandomNumList(r0_36, r1_36, r2_36)
  -- line: [508, 526] id: 36
  local r3_36 = {}
  for r7_36 = r0_36, r1_36, 1 do
    table.insert(r3_36, r7_36)
  end
  if r1_36 - r0_36 + 1 < r2_36 then
    return r3_36
  end
  local r4_36 = 0
  local r5_36 = {}
  while r2_36 > 0 do
    r4_36 = math.random(1, r1_36 - r0_36 + 1)
    table.insert(r5_36, r3_36[r4_36])
    table.remove(r3_36, r4_36)
    r2_36 = r2_36 + -1
    r0_36 = r0_36 + 1
  end
  return r5_36
end
function r0_0.RemoveValue(r0_37, r1_37)
  -- line: [528, 544] id: 37
  if type(r0_37) ~= "table" then
    return 
  end
  local r2_37 = nil
  for r7_37, r8_37 in ipairs(r0_37) do
    if r8_37 == r1_37 then
      r2_37 = r7_37
      break
    end
  end
  -- close: r3_37
  if r2_37 then
    table.remove(r0_37, r2_37)
    return true
  end
  return false
end
function r0_0.HasValue(r0_38, r1_38)
  -- line: [546, 559] id: 38
  if not r0_38 then
    return false
  end
  if type(r0_38) ~= "table" then
    return false
  end
  for r6_38, r7_38 in pairs(r0_38) do
    if r7_38 == r1_38 then
      return true
    end
  end
  -- close: r2_38
  return false
end
function r0_0.Size(r0_39)
  -- line: [561, 570] id: 39
  if type(r0_39) ~= "table" then
    return 0
  end
  local r1_39 = 0
  for r6_39, r7_39 in pairs(r0_39) do
    r1_39 = r1_39 + 1
  end
  -- close: r2_39
  return r1_39
end
function r0_0.IsEmpty(r0_40)
  -- line: [572, 580] id: 40
  if type(r0_40) ~= "table" then
    return true
  end
  for r5_40, r6_40 in pairs(r0_40) do
    return false
  end
  -- close: r1_40
  return true
end
function r0_0.GetFixLocation(r0_41, r1_41, r2_41, r3_41, r4_41, r5_41)
  -- line: [583, 586] id: 41
  if not r5_41 then
    r5_41 = "TraceCreatureHit"
  end
  local r6_41 = UE4.URuntimeCommonFunctionLibrary.GetFixLocation
  local r7_41 = r0_41
  local r8_41 = r1_41
  local r9_41 = r2_41 and 50
  local r10_41 = r3_41 and 200
  return r6_41(r7_41, r8_41, r9_41, r10_41, r4_41 and -1500, Const.FixTraceChannel[r5_41])
end
function r0_0.CopyTable(r0_42)
  -- line: [588, 598] id: 42
  local r1_42 = {}
  for r6_42, r7_42 in pairs(r0_42) do
    if type(r7_42) == "table" then
      r1_42[r6_42] = r0_0.CopyTable(r7_42)
    else
      r1_42[r6_42] = r7_42
    end
  end
  -- close: r2_42
  return r1_42
end
function r0_0.GetFixLocationOld(r0_43, r1_43, r2_43, r3_43, r4_43, r5_43)
  -- line: [600, 621] id: 43
  if not r5_43 then
    r5_43 = "TraceCreatureHit"
  end
  local r6_43 = r1_43
  for r11_43, r12_43 in pairs(Const.SummonOffset) do
    local r15_43 = FHitResult()
    local r16_43 = FVector(r1_43.X + r12_43[1], r1_43.Y + r12_43[2], r1_43.Z)
    local r17_43 = UE4.UKismetSystemLibrary.LineTraceSingle
    local r18_43 = r0_43
    if r17_43(r18_43, r16_43 + FVector(0, 0, (r3_43 and 200)), r16_43 + FVector(0, 0, (r4_43 and -1500)), Const.FixTraceChannel[r5_43], false, TArray(AActor), 0, r15_43, true, UE4.FLinearColor(math.random(0, 1), math.random(0, 1), math.random(0, 1), 1), UE4.FLinearColor(math.random(0, 1), math.random(0, 1), math.random(0, 1), 1), 50) and r15_43.ImpactPoint ~= r16_43 then
      r6_43 = r15_43.ImpactPoint
      break
    end
  end
  -- close: r7_43
  return FVector(r6_43.X, r6_43.Y, r6_43.Z + (r2_43 and 50))
end
function r0_0.GetCapFixLocation(r0_44, r1_44, r2_44, r3_44, r4_44, r5_44)
  -- line: [623, 646] id: 44
  if not r5_44 then
    r5_44 = "TraceCreatureHit"
  end
  local r6_44 = r1_44
  local r7_44 = r0_44.CapsuleComponent
  if r7_44 then
    r7_44 = r0_44.CapsuleComponent:GetScaledCapsuleRadius() and 0
  else
    goto label_12	-- block#4 is visited secondly
  end
  local r8_44 = r0_44.CapsuleComponent
  if r8_44 then
    r8_44 = r0_44.CapsuleComponent:GetScaledCapsuleHalfHeight() and 0
  else
    goto label_21	-- block#7 is visited secondly
  end
  for r13_44, r14_44 in pairs(Const.SummonOffset) do
    local r17_44 = FHitResult()
    local r18_44 = FVector(r1_44.X + r14_44[1], r1_44.Y + r14_44[2], r1_44.Z)
    local r19_44 = UE4.UKismetSystemLibrary.CapsuleTraceSingle
    local r20_44 = r0_44
    if r19_44(r20_44, r18_44 + FVector(0, 0, (r3_44 and 0)), r18_44 + FVector(0, 0, (r4_44 and -1500)), r7_44, r8_44, Const.FixTraceChannel[r5_44], false, nil, 0, r17_44, true, UE4.FLinearColor(1, 0, 0, 1), UE4.FLinearColor(0, 1, 0, 1), 5) and r17_44.Location ~= r18_44 then
      r6_44 = r17_44.Location
      break
    end
  end
  -- close: r9_44
  return FVector(r6_44.X, r6_44.Y, r6_44.Z + (r2_44 and 50))
end
function r0_0.GetEliteLocation(r0_45, r1_45, r2_45, r3_45)
  -- line: [649, 663] id: 45
  local r4_45 = DataMgr.EliteTeamData[r0_45]
  if not r4_45 or not r4_45.LocationCheckParam then
    return r2_45
  end
  local r5_45 = r4_45.LocationCheckParam
  local r6_45 = r5_45.HalfHeight and 40
  local r7_45 = r5_45.Radius and 20
  local r8_45 = r5_45.StepHeight and 100
  local r9_45 = r5_45.WalkableFloorAngle and 45
  local r10_45 = r5_45.MaxLength and 200
  local r11_45 = r5_45.MaxWidth and 50
  if r3_45 == nil or not r3_45 then
    r3_45 = false
  end
  return URuntimeCommonFunctionLibrary.GetValidLocationBySimulateMovement(r1_45:K2_GetActorLocation(), r2_45, r6_45, r7_45, r8_45, r9_45, false, r10_45, r11_45, r3_45)
end
r0_0.GetDeviceTypeByPlatformName = GetDeviceTypeByPlatformName
function r0_0.GetCurrentInputType()
  -- line: [706, 709] id: 46
  return UGameInputModeSubsystem.GetGameInputModeSubsystem(GWorld.GameInstance):GetCurrentInputType()
end
function r0_0.ChooseOptionByPlatform(r0_47, r1_47)
  -- line: [711, 724] id: 47
  if r0_0.GetDeviceTypeByPlatformName(self) == "PC" then
    if r0_47 == nil then
      DebugPrint("ERROR: ChooseOptionByPlatform, PCOption == nil")
    end
    return r0_47
  else
    if r1_47 == nil then
      DebugPrint("ERROR: ChooseOptionByPlatform, MoblieOption == nil, return PCOption")
      return r0_47
    end
    return r1_47
  end
end
function r0_0.Shuffle(r0_48)
  -- line: [726, 731] id: 48
  for r4_48 = #r0_48, 2, -1 do
    local r5_48 = math.random(1, r4_48)
    r0_48[r5_48] = r0_48[r4_48]
    r0_48[r4_48] = r0_48[r5_48]
  end
end
function r0_0.Reverse(r0_49)
  -- line: [733, 747] id: 49
  local r1_49 = #r0_49
  if r1_49 <= 1 then
    return 
  end
  local r2_49 = nil
  if r1_49 % 2 == 0 then
    r2_49 = r1_49 / 2
  else
    r2_49 = (r1_49 + -1) / 2
  end
  for r6_49 = 1, r2_49, 1 do
    r0_49[r1_49 + 1 - r6_49] = r0_49[r6_49]
    r0_49[r6_49] = r0_49[r1_49 + 1 - r6_49]
  end
end
function r0_0.Bind(r0_50, r1_50)
  -- line: [749, 753] id: 50
  return function(...)
    -- line: [750, 752] id: 51
    return r1_50(r0_50, ...)
  end
end
function r0_0.Intersection_Table(r0_52, r1_52)
  -- line: [756, 768] id: 52
  local r2_52 = {}
  for r7_52, r8_52 in pairs(r0_52) do
    r2_52[r8_52] = 1
  end
  -- close: r3_52
  local r3_52 = {}
  for r8_52, r9_52 in pairs(r1_52) do
    if r2_52[r9_52] then
      table.insert(r3_52, r9_52)
    end
  end
  -- close: r4_52
  return r3_52
end
function r0_0.VectorToTable(r0_53)
  -- line: [770, 776] id: 53
  return {
    X = r0_53.X,
    Y = r0_53.Y,
    Z = r0_53.Z,
  }
end
function r0_0.TableToVector(r0_54)
  -- line: [778, 780] id: 54
  return FVector(r0_54.X, r0_54.Y, r0_54.Z)
end
function r0_0.AngleBetweenVectors(r0_55, r1_55)
  -- line: [782, 801] id: 55
  if r1_0.VectorA then
    r1_0.VectorA.X = r0_55.X
    r1_0.VectorA.Y = r0_55.Y
    r1_0.VectorA.Z = r0_55.Z
  else
    r1_0.VectorA = FVector(r0_55.X, r0_55.Y, r0_55.Z)
  end
  if r1_0.VectorB then
    r1_0.VectorB.X = r1_55.X
    r1_0.VectorB.Y = r1_55.Y
    r1_0.VectorB.Z = r1_55.Z
  else
    r1_0.VectorB = FVector(r1_55.X, r1_55.Y, r1_55.Z)
  end
  r1_0.VectorA:Normalize()
  r1_0.VectorB:Normalize()
  return UE4.UKismetMathLibrary.Acos(UE4.UKismetMathLibrary.Dot_VectorVector(r1_0.VectorA, r1_0.VectorB))
end
function r0_0.CheckIsTarget(r0_56)
  -- line: [803, 805] id: 56
  return UCharacterFunctionLibrary.IsEffectSource(r0_56)
end
function r0_0.NewEmptyProxy()
  -- line: [807, 822] id: 57
  local r0_57 = {}
  setmetatable(r0_57, {
    __call = function()
      -- line: [810, 812] id: 58
      return nil
    end,
    __index = function()
      -- line: [813, 815] id: 59
      return r0_57
    end,
    __newindex = function(r0_60, r1_60, r2_60)
      -- line: [816, 819] id: 60
      rawset(r0_57, r1_60, r2_60)
      return nil
    end,
  })
  return r0_57
end
r0_0.EmptyProxy = r0_0.NewEmptyProxy()
function r0_0.Keys(r0_61)
  -- line: [826, 832] id: 61
  local r1_61 = {}
  for r6_61, r7_61 in pairs(r0_61) do
    table.insert(r1_61, r6_61)
  end
  -- close: r2_61
  return r1_61
end
function r0_0.TableLength(r0_62)
  -- line: [834, 843] id: 62
  if not r0_62 then
    return 0
  end
  local r1_62 = 0
  for r6_62, r7_62 in pairs(r0_62) do
    r1_62 = r1_62 + 1
  end
  -- close: r2_62
  return r1_62
end
function r0_0.GetCountStr(r0_63, r1_63, r2_63)
  -- line: [845, 872] id: 63
  r0_63 = math.floor(r0_63 and 0)
  if not r1_63 then
    r1_63 = 3
  end
  if not r2_63 then
    r2_63 = ","
  end
  local r3_63 = ""
  local r4_63 = r0_63
  if r4_63 < 0 then
    r4_63 = r4_63 * -1
    r3_63 = "-"
  end
  local r5_63 = ""
  local r6_63 = 0
  while r4_63 ~= 0 do
    r5_63 = r5_63 .. r4_63 % 10
    r4_63 = r4_63 // 10
    r6_63 = r6_63 + 1
    if r4_63 > 0 and r6_63 % r1_63 == 0 then
      r5_63 = r5_63 .. r2_63
    end
  end
  if r5_63 == nil or r5_63 == "" then
    return "0"
  end
  return r3_63 .. string.reverse(r5_63)
end
function r0_0.RandomSeed(r0_64)
  -- line: [874, 876] id: 64
  math.randomseed(tostring(os.time()):reverse():sub(1, 7))
end
function r0_0.RandomFloat(r0_65)
  -- line: [879, 882] id: 65
  r0_65:RandomSeed()
  return math.random()
end
function r0_0.RandomReverseFloat(r0_66)
  -- line: [885, 888] id: 66
  r0_66:RandomSeed()
  return 1 - math.random()
end
function r0_0.RandomInt(r0_67, r1_67, r2_67)
  -- line: [891, 894] id: 67
  r0_67:RandomSeed()
  return math.random(r1_67, r2_67)
end
function r0_0.GetCharMaxLevel(r0_68)
  -- line: [896, 902] id: 68
  local r1_68 = 0
  for r6_68, r7_68 in pairs(DataMgr.LevelUp) do
    r1_68 = math.max(r6_68, r1_68)
  end
  -- close: r2_68
  return r1_68
end
function r0_0.ToStringEx(r0_69, r1_69)
  -- line: [904, 915] id: 69
  local r2_69 = type(r1_69)
  if r2_69 == "table" then
    return r0_0:TableToStr(r1_69)
  elseif r2_69 == "string" then
    return "\"" .. r1_69 .. "\""
  elseif r2_69 == "number" or r2_69 == "boolean" then
    return tostring(r1_69)
  else
    return "\"" .. tostring(r1_69) .. "\""
  end
end
function r0_0.TableToStr(r0_70, r1_70)
  -- line: [917, 947] id: 70
  if r1_70 == nil then
    return ""
  end
  local r2_70 = "{"
  local r3_70 = 1
  for r8_70, r9_70 in pairs(r1_70) do
    local r10_70 = ","
    if r3_70 == 1 then
      r10_70 = ""
    end
    if r8_70 == r3_70 then
      r2_70 = r2_70 .. r10_70 .. r0_0:ToStringEx(r9_70)
    elseif type(r8_70) == "number" or type(r8_70) == "string" then
      r2_70 = r2_70 .. r10_70 .. "[" .. r0_0:ToStringEx(r8_70) .. "]=" .. r0_0:ToStringEx(r9_70)
    elseif type(r8_70) == "userdata" then
      r2_70 = r2_70 .. r10_70 .. "*s" .. r0_0:TableToStr(getmetatable(r8_70)) .. "*e" .. "=" .. r0_0:ToStringEx(r9_70)
    else
      r2_70 = r2_70 .. r10_70 .. r8_70 .. ":" .. r0_0:ToStringEx(r9_70)
    end
    r3_70 = r3_70 + 1
  end
  -- close: r4_70
  return r2_70 .. "}"
end
function r0_0.StrToTable(r0_71, r1_71)
  -- line: [949, 955] id: 71
  if r1_71 == nil or type(r1_71) ~= "string" or r1_71 == "" then
    return {}
  end
  return load("return " .. r1_71)()
end
function r0_0.Round(r0_72)
  -- line: [957, 961] id: 72
  if r0_72 == 0 then
    return 0
  end
  if r0_72 > 0 then
    return math.floor(r0_72 + 0.5)
  else
    return -r0_0.Round(-r0_72)
  end
end
r0_0.AttrConvert = {
  Hp = r0_0.Round,
  MaxHp = r0_0.Round,
  ES = r0_0.Round,
  MaxES = r0_0.Round,
  MagazineCapacity = r0_0.Round,
  MagazineBulletNum = r0_0.Round,
  Sp = r0_0.Round,
  MaxSp = r0_0.Round,
  BulletNum = r0_0.Round,
}
function r0_0.ShouldDisplayAttr(r0_73, r1_73, r2_73, r3_73, r4_73, r5_73)
  -- line: [975, 1006] id: 73
  local r6_73 = DataMgr.AttrConfig[r1_73]
  if r6_73 and r6_73.ShowInInspector then
    if r3_73 == "Weapon" then
      local r7_73 = r5_73 and DataMgr.BattleWeapon[r5_73].UIHiddenAttrs
      if r7_73 then
        for r12_73, r13_73 in ipairs(r7_73) do
          if r1_73 == r13_73 then
            return false
          end
        end
        -- close: r8_73
      end
      local r8_73 = DataMgr.BattleWeaponAttr[r1_73]
      if r8_73 then
        if not r8_73[(r4_73 .. "WeaponAttrDisplay")] or r8_73[r4_73 .. "WeaponAttrDisplay"] == "AlwaysTrue" then
          return true
        elseif r8_73[r4_73 .. "WeaponAttrDisplay"] == "OnlyModified" and r2_73 ~= nil and r8_73.DefaultValue ~= r2_73 then
          return true
        end
      end
    else
      local r7_73 = DataMgr.BattleCharAttr[r1_73]
      if r7_73 then
        if not r7_73.RoleAttrDisplay or r7_73.RoleAttrDisplay == "AlwaysTrue" then
          return true
        elseif r7_73.RoleAttrDisplay == "OnlyModified" and r2_73 ~= nil and r7_73.DefaultValue ~= r2_73 then
          return true
        end
      end
    end
  end
end
function r0_0.CheckBirthday(r0_74, r1_74, r2_74)
  -- line: [1009, 1027] id: 74
  if r1_74 < 1 or r1_74 > 12 or r2_74 < 1 then
    return false
  end
  if (r1_74 == 4 or r1_74 == 6 or r1_74 == 9 or r1_74 == 11) and r2_74 > 30 then
    return false
  elseif r1_74 == 2 and r2_74 > 29 then
    return false
  elseif r2_74 > 31 then
    return false
  end
  return true
end
function r0_0.GetActionMappingKeyName(r0_75, r1_75, r2_75)
  -- line: [1032, 1053] id: 75
  local r3_75 = GWorld:GetAvatar()
  if r3_75 and r3_75.ActionMapping:Length() > 0 and r3_75.ActionMapping[r1_75] and not r2_75 then
    return r3_75.ActionMapping[r1_75]
  else
    local r4_75 = UE4.UInputSettings.GetInputSettings()
    local r5_75 = UE4.TArray(UE4.FInputActionKeyMapping)
    r4_75:GetActionMappingByName(r1_75, r5_75)
    for r10_75, r11_75 in pairs(r5_75) do
      if r2_75 and string.find(r11_75.Key.KeyName, "Gamepad") ~= nil then
        return r11_75.Key.KeyName
      elseif string.find(r11_75.Key.KeyName, "Gamepad") == nil then
        return r11_75.Key.KeyName
      end
    end
    -- close: r6_75
  end
  return ""
end
function r0_0.GetKeyText(r0_76, r1_76)
  -- line: [1057, 1063] id: 76
  local r2_76 = DataMgr.KeyboardText[r1_76]
  if r2_76 and r2_76.KeyText then
    return GText(r2_76.KeyText)
  end
  return r1_76
end
function r0_0.GetWASDKeyName(r0_77, r1_77)
  -- line: [1067, 1075] id: 77
  local r2_77 = r1_77 and ""
  if not r1_77 then
    return r2_77
  end
  local r3_77 = GWorld:GetAvatar()
  if r3_77 and r3_77.ActionMapping:Length() > 0 and r3_77.ActionMapping[r1_77] then
    r2_77 = r3_77.ActionMapping[r1_77]
  end
  return r2_77
end
function r0_0.StringReplaceActionName(r0_78, r1_78)
  -- line: [1077, 1085] id: 78
  local r2_78 = Split(r1_78, "&")
  for r6_78 = 2, #r2_78, 2 do
    r1_78 = string.gsub(r1_78, "&" .. r2_78[r6_78] .. "&", r0_0:GetKeyText(r0_0:GetActionMappingKeyName(r2_78[r6_78])))
  end
  return r1_78
end
function r0_0.GetKeyName(r0_79, r1_79)
  -- line: [1087, 1107] id: 79
  local r2_79 = UE4.UInputSettings.GetInputSettings()
  local r3_79 = UE4.TArray(UE4.FInputActionKeyMapping)
  r2_79:GetActionMappingByName(r1_79, r3_79)
  local r4_79 = {
    "KeyboardKey",
    "MouseButton"
  }
  for r9_79, r10_79 in pairs(r3_79) do
    local r11_79 = r10_79.Key
    for r16_79, r17_79 in pairs(r4_79) do
      if UE4.UKismetInputLibrary["Key_Is" .. r17_79](r11_79) then
        local r18_79 = string.gsub(UE4.UFormulaFunctionLibrary.Key_GetFName(r11_79), " ", "_")
        if r17_79 == "KeyboardKey" and DataMgr.TextMap[r18_79] then
          r18_79 = GText(r18_79)
        end
        return r18_79, r17_79
      end
    end
    -- close: r12_79
  end
  -- close: r5_79
  return nil, nil
end
function r0_0.MergeTables(r0_80, r1_80)
  -- line: [1108, 1132] id: 80
  local function r2_80(r0_81)
    -- line: [1109, 1116] id: 81
    local r1_81 = 0
    for r6_81 in pairs(r0_81) do
      r1_81 = r1_81 + 1
      if r0_81[r1_81] == nil then
        return false
      end
    end
    -- close: r2_81
    return true
  end
  for r7_80, r8_80 in pairs(r1_80) do
    if type(r8_80) == "table" and type(r0_80[r7_80]) == "table" then
      if r2_80(r8_80) and r2_80(r0_80[r7_80]) then
        r0_80[r7_80] = r8_80
      else
        r0_0.MergeTables(r0_80[r7_80], r8_80)
      end
    else
      r0_80[r7_80] = r8_80
    end
  end
  -- close: r3_80
  return r0_80
end
function r0_0.GetCurrentAspectRatioAndFOV(r0_82)
  -- line: [1134, 1146] id: 82
  local r1_82 = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  local r2_82 = nil
  local r3_82 = nil
  local r4_82 = nil
  if IsValid(r1_82) then
    r2_82 = r1_82.CharCameraComponent.AspectRatio
    r3_82 = r1_82.CharCameraComponent.FieldOfView
    r4_82 = r1_82.CharCameraComponent.bConstrainAspectRatio
  end
  return r2_82, r3_82, r4_82
end
function r0_0.SetActorTickableWhenPaused(r0_83, r1_83, r2_83)
  -- line: [1149, 1166] id: 83
  if r1_83 ~= nil and IsValid(r1_83) then
    r1_83:SetTickableWhenPaused(r2_83)
    local r3_83 = r1_83:K2_GetComponentsByClass(UActorComponent:StaticClass())
    if r3_83 then
      for r8_83, r9_83 in pairs(r3_83) do
        URuntimeCommonFunctionLibrary.SetComponentTickableWhenPaused(r9_83, r2_83)
      end
      -- close: r4_83
    end
    if URuntimeCommonFunctionLibrary.ObjIsChildOf(r1_83, ACharacterBase) then
      local r4_83 = r1_83:GetAllAttaches()
      if r4_83 then
        r0_83:SetActorsTickableWhenPaused(r4_83, r2_83)
      end
    end
  end
end
function r0_0.SetActorsTickableWhenPaused(r0_84, r1_84, r2_84)
  -- line: [1168, 1176] id: 84
  if not r1_84 then
    return 
  end
  for r7_84, r8_84 in pairs(r1_84) do
    r0_84:SetActorTickableWhenPaused(r8_84, r2_84)
  end
  -- close: r3_84
end
function r0_0.PerfectPolarityCost(r0_85, r1_85)
  -- line: [1179, 1181] id: 85
  return math.ceil(r1_85 * DataMgr.GlobalConstant.PerfectModPolarity.ConstantValue)
end
function r0_0.WrongPolarityCost(r0_86, r1_86)
  -- line: [1184, 1186] id: 86
  return math.ceil(r1_86 * DataMgr.GlobalConstant.WrongModPolarity.ConstantValue)
end
function r0_0.GetFrontNum(r0_87, r1_87, r2_87)
  -- line: [1189, 1193] id: 87
  return r1_87 // math.floor(10 ^ (r0_0:GetIntNumLength(r1_87) - r2_87))
end
function r0_0.GetIntNumLength(r0_88, r1_88)
  -- line: [1196, 1203] id: 88
  local r2_88 = 0
  while r1_88 > 0 do
    r1_88 = r1_88 // 10
    r2_88 = r2_88 + 1
  end
  return r2_88
end
function r0_0.DataToFTransform(r0_89, r1_89)
  -- line: [1205, 1210] id: 89
  local r2_89 = r1_89.Rotation
  if r2_89 then
    r2_89 = UE4.FRotator(r1_89.Rotation[2], r1_89.Rotation[3], r1_89.Rotation[1]) and FRotator(0, 0, 0)
  else
    goto label_14	-- block#2 is visited secondly
  end
  local r3_89 = r1_89.Location
  if r3_89 then
    r3_89 = FVector(r1_89.Location[1], r1_89.Location[2], r1_89.Location[3]) and FVector(0, 0, 0)
  else
    goto label_32	-- block#5 is visited secondly
  end
  local r4_89 = r1_89.scale
  if r4_89 then
    r4_89 = FVector(r1_89.scale[1], r1_89.scale[2], r1_89.scale[3]) and FVector(1, 1, 1)
  else
    goto label_50	-- block#8 is visited secondly
  end
  return FTransform(r2_89:ToQuat(), r3_89, r4_89)
end
function r0_0.CloseGuideTouchIfExist(r0_90, r1_90)
  -- line: [1212, 1219] id: 90
  local r3_90 = UE4.UGameplayStatics.GetGameInstance(r1_90):GetGameUIManager()
  local r4_90 = r3_90:GetUIObj(r3_90.CurGuideTouchName)
  if r4_90 then
    r4_90:PlayOutAnimation()
  end
end
function r0_0.IfExistSystemGuideUI(r0_91, r1_91)
  -- line: [1222, 1238] id: 91
  local r3_91 = (UE4.UGameplayStatics.GetGameInstance(r1_91) and GWorld.GameInstance):GetGameUIManager()
  if r3_91:GetUIObj(r3_91.CurGuideTouchName) then
    return true
  end
  if r3_91:GetUIObj("GuideTextBox") then
    return true
  end
  if r3_91:GetUIObj("GuideMain") then
    return true
  end
  return false
end
function r0_0.SerializeFTransform(r0_92, r1_92)
  -- line: [1240, 1244] id: 92
  return r1_92.Translation.X .. "," .. r1_92.Translation.Y .. "," .. r1_92.Translation.Z .. "|" .. r1_92.Rotation.X .. "," .. r1_92.Rotation.Y .. "," .. r1_92.Rotation.Z .. "," .. r1_92.Rotation.W .. "|" .. r1_92.Scale3D.X .. "," .. r1_92.Scale3D.Y .. "," .. r1_92.Scale3D.Z
end
function r0_0.UnSerializeFTransform(r0_93, r1_93)
  -- line: [1246, 1253] id: 93
  local r2_93, r3_93, r4_93 = table.unpack(r0_93.Split(r1_93, "|"))
  local r5_93 = FTransform()
  r5_93.Translation.X, r5_93.Translation.Y, r5_93.Translation.Z = table.unpack(r0_93.Split(r2_93, ","))
  r5_93.Rotation.X, r5_93.Rotation.Y, r5_93.Rotation.Z, r5_93.Rotation.W = table.unpack(r0_93.Split(r3_93, ","))
  r5_93.Scale3D.X, r5_93.Scale3D.Y, r5_93.Scale3D.Z = table.unpack(r0_93.Split(r4_93, ","))
  return r5_93
end
function r0_0.FocalLengthToFOV(r0_94, r1_94)
  -- line: [1255, 1257] id: 94
  return math.atan(36 / r1_94 * 2) * 2 * 180 / math.pi
end
function r0_0.FuzzySearch(r0_95, r1_95, r2_95)
  -- line: [1260, 1276] id: 95
  local r3_95 = {}
  if r0_95 and r1_95 then
    for r8_95, r9_95 in pairs(r0_95) do
      if not r3_95[r8_95] then
        local r10_95, r11_95 = r0_0.IsInContent(r9_95, r1_95, r2_95)
        if r10_95 then
          if r2_95 then
            r9_95 = r0_0.HighLightContent(r9_95, "<Highlight>", r11_95)
          end
          r3_95[r8_95] = r9_95
        end
      end
    end
    -- close: r4_95
  end
  return r3_95
end
function r0_0.CheckFuzzySearchWithSinglePhase(r0_96, r1_96, r2_96)
  -- line: [1278, 1299] id: 96
  local r3_96 = false
  if r2_96 then
    r3_96 = true
    for r8_96, r9_96 in ipairs(r0_96) do
      local r10_96, r11_96 = r0_0.IsInContent(r9_96, r1_96)
      if not r10_96 then
        r3_96 = false
        break
      end
    end
    -- close: r4_96
  else
    for r8_96, r9_96 in ipairs(r0_96) do
      local r10_96, r11_96 = r0_0.IsInContent(r9_96, r1_96)
      if r10_96 then
        r3_96 = true
        break
      end
    end
    -- close: r4_96
  end
  return r3_96
end
function r0_0.IsInContent(r0_97, r1_97, r2_97)
  -- line: [1302, 1340] id: 97
  local r3_97 = {}
  for r9_97, r10_97 in ipairs({
    "%",
    ".",
    "*",
    "+",
    "-",
    "?",
    "[",
    "]",
    "(",
    ")",
    "^",
    "$"
  }) do
    local r11_97 = string.gsub(r1_97, "%" .. r10_97, "%%%1")
    r1_97 = r11_97
  end
  -- close: r5_97
  for r9_97 in string.gmatch(r1_97, ".[\x80-\xbf]*") do
    table.insert(r3_97, r9_97)
  end
  -- close: r5_97
  local r5_97 = {}
  local r6_97 = 1
  for r11_97, r12_97 in ipairs(r3_97) do
    if r11_97 > 1 then
      local r13_97 = r3_97[r11_97 + -1]
      if r13_97 == "%" then
        local r14_97 = r12_97
        r13_97 = "%" .. r14_97
        r12_97 = r13_97
      end
    elseif r12_97 == "%" then
      r12_97 = nil
    end
    if r12_97 then
      local r13_97, r14_97 = string.find(r0_97, r12_97, r6_97)
      if r2_97 and r13_97 and r14_97 then
        table.insert(r5_97, {
          [1] = r13_97,
          [2] = r14_97,
        })
      end
      if r13_97 then
        r6_97 = r14_97 + 1
      else
        local r15_97 = false
        return r15_97
      end
    end
  end
  -- close: r7_97
  if r2_97 then
    return true, r5_97
  else
    return true
  end
end
function r0_0.HighLightWord(r0_98, r1_98, r2_98, r3_98)
  -- line: [1342, 1349] id: 98
  return string.format("%s%s%s%s%s", string.sub(r1_98, 1, r2_98 + -1), r0_98, string.sub(r1_98, r2_98, r3_98), "</>", string.sub(r1_98, r3_98 + 1, -1))
end
function r0_0.HighLightContent(r0_99, r1_99, r2_99)
  -- line: [1352, 1362] id: 99
  local r3_99 = r1_99
  local r4_99 = "</>"
  local r5_99 = r0_99
  for r10_99, r11_99 in pairs(r2_99) do
    local r13_99 = (string.len(r3_99) + string.len(r4_99)) * (r10_99 + -1)
    r5_99 = r0_0.HighLightWord(r1_99, r5_99, r11_99[1] + r13_99, r11_99[2] + r13_99)
  end
  -- close: r6_99
  return r5_99
end
function r0_0.CheckDestroyReason(r0_100, r1_100)
  -- line: [1364, 1378] id: 100
  local r2_100 = EDestroyReason:GetNameByValue(r0_100)
  local r3_100 = DataMgr.DestroyReason[r2_100]
  if not r3_100 then
    ScreenPrint("销毁时传入的DestroyReason没有填写在DestroyReason表中。DestroyReason:" .. r2_100)
    return false
  end
  local r4_100 = r3_100[r1_100]
  if r4_100 == nil then
    return false
  end
  return r4_100
end
function r0_0.IsWidgetHide(r0_101, r1_101)
  -- line: [1380, 1388] id: 101
  if r1_101:GetVisibility() == UE4.ESlateVisibility.Collapsed or r1_101:GetVisibility() == UE4.ESlateVisibility.Hidden or r1_101:GetRenderOpacity() == 0 and r1_101:Cast(UE4.UButton) == nil then
    return true
  end
  if r1_101:GetParent() == nil then
    return false
  end
  return r0_0:IsWidgetHide(r1_101:GetParent())
end
function r0_0.Compare(r0_102, r1_102, r2_102, r3_102)
  -- line: [1391, 1397] id: 102
  if not r3_102 then
    r3_102 = CommonConst.DESC
  end
  if r3_102 == CommonConst.DESC then
    return r2_102 < r1_102
  end
  return r1_102 < r2_102
end
function r0_0.DisableScroll(r0_103, r1_103, r2_103)
  -- line: [1399, 1406] id: 103
  r1_103:DisableDrag(r2_103)
  if r2_103 then
    r1_103:SetWheelScrollMultiplier(0)
  else
    r1_103:SetWheelScrollMultiplier(1)
  end
end
function r0_0.TeleportToCloestTeleportPoint(r0_104, r1_104)
  -- line: [1408, 1427] id: 104
end
function r0_0.GetClientTimerStructRemainTime(r0_105)
  -- line: [1429, 1440] id: 105
  local r1_105 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if not r1_105 then
    return 0
  end
  local r2_105 = r1_105.ClientTimerStruct:GetTimerInfo(r0_105)
  if r2_105.IsRealTime then
    return r2_105.Time - r1_105.ReplicatedRealTimeSeconds - r2_105.RealTimeSeconds
  else
    return r2_105.Time - r1_105.ReplicatedTimeSeconds - r2_105.TimeSeconds
  end
end
function r0_0.GetClientTimerStructTotalTime(r0_106)
  -- line: [1442, 1453] id: 106
  local r1_106 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if not r1_106 then
    return 0
  end
  local r2_106 = r1_106.ClientTimerStruct:GetTimerInfo(r0_106)
  if r2_106 and r2_106.Time then
    return r2_106.Time
  else
    return 0
  end
end
function r0_0.GetClientTimerStructPassedTime(r0_107)
  -- line: [1455, 1466] id: 107
  local r1_107 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if not r1_107 then
    return 0
  end
  local r2_107 = r1_107.ClientTimerStruct:GetTimerInfo(r0_107)
  if r2_107.IsRealTime then
    return r1_107.ReplicatedRealTimeSeconds - r2_107.RealTimeSeconds
  else
    return r1_107.ReplicatedTimeSeconds - r2_107.TimeSeconds
  end
end
function r0_0.HasClientTimerStruct(r0_108)
  -- line: [1468, 1478] id: 108
  if not r0_108 then
    return false
  end
  local r1_108 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if not r1_108 then
    return false
  end
  return r1_108.ClientTimerStruct:GetTimerInfo(r0_108).Key ~= "None"
end
function r0_0.GetDungeonUIParams(r0_109)
  -- line: [1480, 1513] id: 109
  local r1_109 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if not r1_109:IsInRegion() then
    return false, nil
  end
  local r2_109 = r1_109.CurDungeonUIParamID
  if not r0_109 then
    return false, nil
  end
  if not r2_109 then
    return false, nil
  end
  local r3_109 = DataMgr.DungeonUIParams[r2_109]
  if not r3_109 then
    return false, nil
  end
  local r4_109 = 0
  for r9_109, r10_109 in pairs(r3_109.UIName) do
    if r10_109 == r0_109 then
      r4_109 = r9_109
      break
    end
  end
  -- close: r5_109
  if r4_109 == 0 then
    return false, nil
  end
  return true, r3_109.UIParams[r4_109]
end
function r0_0.HasGamePlayTag(r0_110, r1_110)
  -- line: [1515, 1532] id: 110
  if not r0_110 then
    return false
  end
  if type(r0_110) ~= "table" then
    return string.find(r0_110, r1_110)
  end
  for r5_110 = 1, #r0_110, 1 do
    if string.find(r0_110[r5_110], r1_110) then
      return true
    end
  end
  return false
end
function r0_0.CalcNameLength(r0_111)
  -- line: [1534, 1548] id: 111
  local function r1_111(r0_112)
    -- line: [1536, 1538] id: 112
    local r1_112 = nil	-- notice: implicit variable refs by block#[6]
    if r0_112 < 65 or r0_112 > 90 then
      if r0_112 >= 97 then
        r1_112 = r0_112 <= 122
      else
        goto label_8	-- block#4 is visited secondly
      end
    else
      goto label_9	-- block#5 is visited secondly
    end
    return r1_112
  end
  local r2_111 = 0
  for r7_111, r8_111 in utf8.codes(r0_111) do
    if r1_111(r8_111) then
      r2_111 = r2_111 + 1
    else
      r2_111 = r2_111 + 2
    end
  end
  -- close: r3_111
  return r2_111
end
function r0_0.TableToString2(r0_113, r1_113)
  -- line: [1566, 1628] id: 113
  local r9_113 = nil	-- notice: implicit variable refs by block#[0]
  local r2_113 = {}
  local r3_113 = 1
  local r4_113 = "    "
  local r5_113 = {
    ["0"] = "",
  }
  local function r6_113(r0_114)
    -- line: [1573, 1578] id: 114
    if not r5_113[r0_114] then
      r5_113[r0_114] = r4_113:rep(r0_114)
    end
    return r5_113[r0_114]
  end
  local function r7_113(r0_115)
    -- line: [1580, 1582] id: 115
    r2_113[#r2_113 + 1] = r0_115
  end
  local function r8_113(r0_116)
    -- line: [1584, 1590] id: 116
    r0_116 = string.format("%q", r0_116)
    r0_116 = r0_116:gsub("\\\n", "\\n")
    r0_116 = r0_116:gsub("\r", "")
    r0_116 = r0_116:gsub(string.char(26), "\"..string.char(26)..\"")
    return r0_116
  end
  function r9_113(r0_117, r1_117)
    -- line: [1592, 1615] id: 117
    if type(r0_117) == "number" then
      r7_113(tostring(r0_117))
    else
      local r3_117 = nil	-- notice: implicit variable refs by block#[6]
      if type(r0_117) == "boolean" then
        local r2_117 = r7_113
        if r0_117 then
          r3_117 = "true"
          if not r3_117 then
            ::label_22::
            r3_117 = "false"
          end
        else
          goto label_22	-- block#5 is visited secondly
        end
        r2_117(r3_117)
      elseif type(r0_117) == "string" then
        r7_113(r8_113(r0_117))
      elseif type(r0_117) == "table" then
        local r2_117 = r7_113
        r3_117 = "{"
        local r4_117 = r1_113
        if r4_117 then
          r4_117 = "" and "\n"
        else
          goto label_49	-- block#12 is visited secondly
        end
        r2_117(r3_117 .. r4_117)
        r2_117 = r1_117 + 1
        r3_117 = r6_113(r2_117)
        for r8_117, r9_117 in pairs(r0_117) do
          local r10_117 = r7_113
          local r11_117 = r1_113
          if r11_117 then
            r11_117 = "" and r3_117
          else
            goto label_68	-- block#16 is visited secondly
          end
          r10_117(r11_117 .. "[")
          r9_113(r8_117, r2_117)
          r10_117 = r7_113
          r11_117 = "]"
          local r12_117 = r1_113
          if r12_117 then
            r12_117 = "=" and " = "
          else
            goto label_84	-- block#19 is visited secondly
          end
          r10_117(r11_117 .. r12_117)
          r9_113(r9_117, r2_117)
          r10_117 = r7_113
          r11_117 = ","
          r12_117 = r1_113
          if r12_117 then
            r12_117 = "" and "\n"
          else
            goto label_99	-- block#22 is visited secondly
          end
          r10_117(r11_117 .. r12_117)
        end
        -- close: r4_117
        r4_117 = r7_113
        local r5_117 = r1_113
        if r5_117 then
          r5_117 = "" and r6_113(r1_117)
        else
          goto label_112	-- block#27 is visited secondly
        end
        r4_117(r5_117 .. "}")
      else
        print("unable to serialize data: " .. tostring(r0_117))
        local r2_117 = r7_113
        r3_117 = "nil,"
        local r4_117 = r1_113
        if r4_117 then
          r4_117 = "" and " -- ***ERROR: unsupported data type: " .. type(r0_117) .. "!***"
        else
          goto label_134	-- block#31 is visited secondly
        end
        r2_117(r3_117 .. r4_117)
      end
    end
  end
  local r10_113 = r7_113
  local r11_113 = "return {"
  local r12_113 = nil	-- notice: implicit variable refs by block#[3]
  if r1_113 then
    r12_113 = ""
    if not r12_113 then
      ::label_18::
      r12_113 = "\n"
    end
  else
    goto label_18	-- block#2 is visited secondly
  end
  r10_113(r11_113 .. r12_113)
  for r14_113, r15_113 in pairs(r0_113) do
    local r16_113 = r7_113
    local r17_113 = nil	-- notice: implicit variable refs by block#[7]
    if r1_113 then
      r17_113 = ""
      if not r17_113 then
        ::label_31::
        r17_113 = r6_113(r3_113)
      end
    else
      goto label_31	-- block#6 is visited secondly
    end
    r16_113(r17_113 .. "[")
    r9_113(r14_113, r3_113)
    r16_113 = r7_113
    r17_113 = "]"
    local r18_113 = nil	-- notice: implicit variable refs by block#[10, 13]
    if r1_113 then
      r18_113 = "="
      if not r18_113 then
        ::label_48::
        r18_113 = " = "
      end
    else
      goto label_48	-- block#9 is visited secondly
    end
    r16_113(r17_113 .. r18_113)
    r9_113(r15_113, r3_113)
    r16_113 = r7_113
    r17_113 = ","
    if r1_113 then
      r18_113 = ""
      if not r18_113 then
        ::label_62::
        r18_113 = "\n"
      end
    else
      goto label_62	-- block#12 is visited secondly
    end
    r16_113(r17_113 .. r18_113)
  end
  -- close: r10_113
  r7_113("}")
  return table.concat(r2_113)
end
function r0_0.ConvertServerList(r0_118)
  -- line: [1630, 1653] id: 118
  local r1_118 = {
    hostnum = r0_118.hostnum,
  }
  if r0_118.server_area == "Asian" then
    r1_118.area = "Asia"
  else
    r1_118.area = r0_118.server_area
  end
  r1_118.name = r0_118.name
  if r0_118.login_ip and r0_118.login_port then
    r1_118.ip = r0_118.login_ip
    r1_118.port = r0_118.login_port
  else
    r1_118.ip = r0_118.outer_ip
    r1_118.port = r0_118.gate_port
  end
  if r0_118.is_recommend then
    r1_118.is_recommend = true
  else
    r1_118.is_recommend = false
  end
  r1_118.recommend_weight = r0_118.recommend_weight and 0
  return r1_118
end
function r0_0.UploadStrToCDN(r0_119, r1_119, r2_119)
  -- line: [1655, 1717] id: 119
  local r3_119 = require("socket.http")
  local r4_119 = require("ltn12")
  local r5_119 = {}
  local r6_119, r7_119, r8_119 = r3_119.request({
    url = r0_119,
    method = "GET",
    sink = r4_119.sink.table(r5_119),
  })
  if r7_119 ~= 200 or not r5_119 then
    print("HTTP request failed with status:", r7_119)
    return 
  end
  local r9_119 = Json.decode(table.concat(r5_119))
  if not r9_119 then
    print("Json decode failed")
    return 
  end
  local r14_119 = "----WebKitFormBoundary7MA4YWxkTrZu0gW"
  local r15_119 = "--" .. r14_119 .. "\r\n" .. "Content-Disposition: form-data; name=\"OSSAccessKeyId\"\r\n\r\n" .. r9_119.accessid .. "\r\n" .. "--" .. r14_119 .. "\r\n" .. "Content-Disposition: form-data; name=\"policy\"\r\n\r\n" .. r9_119.policy .. "\r\n" .. "--" .. r14_119 .. "\r\n" .. "Content-Disposition: form-data; name=\"signature\"\r\n\r\n" .. r9_119.signature .. "\r\n" .. "--" .. r14_119 .. "\r\n" .. "Content-Disposition: form-data; name=\"key\"\r\n\r\n" .. r2_119 .. "\r\n" .. "--" .. r14_119 .. "\r\n" .. "Content-Disposition: form-data; name=\"file\"; filename=\"" .. r2_119 .. "\"\r\n" .. "Content-Type: text/plain\r\n\r\n" .. r1_119 .. "\r\n" .. "--" .. r14_119 .. "--\r\n"
  local r16_119 = {}
  r3_119.request({
    method = "POST",
    url = r9_119.host,
    source = r4_119.source.string(r15_119),
    headers = {
      ["Content-Type"] = "multipart/form-data; boundary=" .. r14_119,
      ["Content-Length"] = #r15_119,
    },
    sink = r4_119.sink.table(r16_119),
  })
  print("response_body:", table.concat(r16_119))
end
function r0_0.TableToString3(r0_120)
  -- line: [1724, 1797] id: 120
  local r6_120 = nil	-- notice: implicit variable refs by block#[0]
  local r1_120 = {}
  local function r3_120(r0_122)
    -- line: [1731, 1734] id: 122
    r0_122 = string.format("%q", r0_122)
    return r0_122:gsub("\\\n", "\\n"):gsub("\r", "")
  end
  local function r4_120(r0_123)
    -- line: [1737, 1739] id: 123
    local r1_123 = type(r0_123)
    if r1_123 == "string" then
      r1_123 = r0_123:match("^[a-zA-Z_][a-zA-Z0-9_]*$") ~= nil
    else
      goto label_10	-- block#2 is visited secondly
    end
    return r1_123
  end
  local function r5_120(r0_124)
    -- line: [1741, 1755] id: 124
    local r1_124 = {}
    local r2_124 = true
    for r7_124 in pairs(r0_124) do
      if type(r7_124) ~= "number" then
        r2_124 = false
      end
      table.insert(r1_124, r7_124)
    end
    -- close: r3_124
    if r2_124 then
      table.sort(r1_124)
    else
      table.sort(r1_124, function(r0_125, r1_125)
        -- line: [1752, 1752] id: 125
        return tostring(r0_125) < tostring(r1_125)
      end)
    end
    return r1_124
  end
  function r6_120(r0_126, r1_126)
    -- line: [1757, 1794] id: 126
    if type(r0_126) == "number" then
      return tostring(r0_126)
    else
      local r2_126 = type(r0_126)
      if r2_126 == "boolean" then
        if r0_126 then
          r2_126 = "true" and "false"
        else
          goto label_20	-- block#5 is visited secondly
        end
        return r2_126
      elseif type(r0_126) == "string" then
        return r3_120(r0_126)
      elseif type(r0_126) == "table" then
        r2_126 = {}
        local r3_126 = r1_126 == 1
        for r9_126, r10_126 in ipairs(r5_120(r0_126)) do
          local r11_126 = r0_126[r10_126]
          local r12_126 = nil
          if type(r10_126) == "string" and r4_120(r10_126) then
            r12_126 = r10_126
          else
            r12_126 = "[" .. r6_120(r10_126, r1_126 + 1) .. "]"
          end
          local r13_126 = r6_120(r11_126, r1_126 + 1)
          if r3_126 then
            table.insert(r2_126, "    " .. r12_126 .. " = " .. r13_126 .. ",")
          else
            table.insert(r2_126, r12_126 .. " = " .. r13_126)
          end
        end
        -- close: r5_126
        if r3_126 then
          return "{\n" .. table.concat(r2_126, "\n") .. "\n}"
        else
          return "{ " .. table.concat(r2_126, ", ") .. " }"
        end
      else
        return "nil"
      end
    end
  end
  (function(r0_121)
    -- line: [1727, 1729] id: 121
    r1_120[#r1_120 + 1] = r0_121
  end)("return " .. r6_120(r0_120, 1) .. "\n")
  return table.concat(r1_120)
end
function r0_0.RotationToTable(r0_127)
  -- line: [1799, 1805] id: 127
  return {
    Pitch = r0_127.Pitch,
    Yaw = r0_127.Yaw,
    Roll = r0_127.Roll,
  }
end
function r0_0.LocationToTable(r0_128)
  -- line: [1807, 1813] id: 128
  return {
    X = r0_128.X,
    Y = r0_128.Y,
    Z = r0_128.Z,
  }
end
function r0_0.GetWeaponTypeById(r0_129)
  -- line: [1815, 1825] id: 129
  local r1_129 = DataMgr.BattleWeapon[r0_129]
  if not r1_129 then
    return 
  end
  if r0_0.HasValue(r1_129.WeaponTag, CommonConst.WeaponType.MeleeWeapon) then
    return CommonConst.WeaponType.MeleeWeapon
  elseif r0_0.HasValue(r1_129.WeaponTag, CommonConst.WeaponType.RangedWeapon) then
    return CommonConst.WeaponType.RangedWeapon
  end
end
function r0_0.IsOpenVersion(r0_130)
  -- line: [1828, 1838] id: 130
  if not r0_130 then
    return false
  end
  if DataMgr.CombatVersionOpenList[r0_130] then
    return true
  else
    return false
  end
end
function r0_0.IsCurrentVersionRealease(r0_131, r1_131)
  -- line: [1841, 1850] id: 131
  local r2_131 = DataMgr[r0_131] and DataMgr[r0_131][r1_131]
  if not r2_131 then
    return 
  end
  if not DataMgr.GlobalConstant.CurrentVersion or not r2_131.ReleaseVersion then
    return true
  end
  return r2_131.ReleaseVersion <= DataMgr.GlobalConstant.CurrentVersion.ConstantValue
end
function r0_0.IsCurrentVersionNewRealease(r0_132, r1_132)
  -- line: [1853, 1862] id: 132
  local r2_132 = DataMgr[r0_132] and DataMgr[r0_132][r1_132]
  if not r2_132 then
    return 
  end
  if not DataMgr.GlobalConstant.CurrentVersion or not r2_132.ReleaseVersion then
    return 
  end
  return DataMgr.GlobalConstant.CurrentVersion.ConstantValue == r2_132.ReleaseVersion
end
return r0_0
