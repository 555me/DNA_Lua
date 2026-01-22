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
  -- line: [310, 387] id: 22
  if type(r0_22) ~= "table" then
    r0_22 = {
      r0_22
    }
  end
  if not r1_22 then
    r1_22 = 10
  end
  local r2_22 = {
    ["0"] = "",
  }
  local r9_22 = nil	-- notice: implicit variable refs by block#[9]
  for r6_22 = 1, r1_22 + 2, 1 do
    local r7_22 = tostring(r6_22)
    local r8_22 = r2_22[tostring(r6_22 + -1)] and ""
    r9_22 = "\t"
    r2_22[r7_22] = r8_22 .. r9_22
  end
  local function r3_22(r0_23)
    -- line: [323, 325] id: 23
    local r1_23 = type(r0_23)
    if r1_23 == "string" then
      r1_23 = #r0_23
      if r1_23 == 14 then
        r1_23 = string.byte(r0_23, 1) == 0
      end
    else
      goto label_15	-- block#3 is visited secondly
    end
    return r1_23
  end
  local function r4_22(r0_24)
    -- line: [328, 336] id: 24
    if r0_24 == nil then
      return ""
    end
    local r1_24 = {}
    for r5_24 = 3, #r0_24, 1 do
      r1_24[#r1_24 + 1] = string.format("%02X", string.byte(r0_24, r5_24))
    end
    return "ObjectId(\'" .. table.concat(r1_24) .. "\')"
  end
  local r5_22 = {}
  local function r6_22(...)
    -- line: [339, 344] id: 25
    for r4_25 = 1, select("#", ...), 1 do
      r5_22[#r5_22 + 1] = select(r4_25, ...)
    end
  end
  local r7_22 = {}
  local function r8_22(r0_26)
    -- line: [348, 353] id: 26
    if type(r0_26) == "string" and r3_22(r0_26) then
      return r4_22(r0_26)
    end
    return tostring(r0_26)
  end
  function r9_22(r0_27, r1_27)
    -- line: [355, 380] id: 27
    if r7_22[r0_27] then
      r6_22(r2_22[tostring(r1_27)], "<cycle> (table)\n")
      return 
    end
    r7_22[r0_27] = true
    local r2_27 = r2_22[tostring(r1_27)] and ""
    for r7_27, r8_27 in pairs(r0_27) do
      local r9_27 = type(r7_27)
      if r9_27 == "string" then
        r9_27 = r3_22(r7_27) and r4_22(r7_27) and tostring(r7_27)
      else
        goto label_42	-- block#8 is visited secondly
      end
      r6_22(r2_27, r9_27, " (", type(r7_27), ")", ": ", r8_22(r8_27), " (", type(r8_27), ")\n")
      if type(r8_27) == "table" and r1_27 < r1_22 then
        r9_22(r8_27, r1_27 + 1)
      end
    end
    -- close: r3_27
    r7_22[r0_27] = nil
  end
  r6_22("PrintTable: ", tostring(r0_22), "\n")
  if r0_22 and type(r0_22) == "table" then
    r9_22(r0_22, 1)
  end
  return table.concat(r5_22)
end
function r0_0.TraverseFromTheMiddleOfTheArrayToBothSides(r0_28, r1_28, r2_28)
  -- line: [391, 409] id: 28
  if r1_28 <= #r0_28 // 2 then
    for r6_28 = r1_28, #r0_28, 1 do
      if r2_28(r0_28[r6_28]) then
        return 
      end
      local r7_28 = r1_28 * 2 - r6_28
      if r7_28 <= #r0_28 and r7_28 > 0 and r7_28 ~= r6_28 and r2_28(r0_28[r1_28 * 2 - r6_28]) then
        return 
      end
    end
  else
    for r6_28 = r1_28, 1, -1 do
      if r2_28(r0_28[r6_28]) then
        return 
      end
      local r7_28 = r1_28 * 2 - r6_28
      if r7_28 <= #r0_28 and r7_28 > 0 and r7_28 ~= r6_28 and r2_28(r0_28[r1_28 * 2 - r6_28]) then
        return 
      end
    end
  end
end
function r0_0.MathConcat(r0_29, r1_29)
  -- line: [411, 423] id: 29
  return r0_29 * 10 ^ (function(r0_30)
    -- line: [412, 418] id: 30
    if r0_30 == 0 then
      return 1
    end
    return math.floor(math.log(r0_30) / math.log(10)) + 1
  end)(r1_29) + r1_29
end
function r0_0.Copy(r0_31)
  -- line: [425, 437] id: 31
  local r1_31 = nil	-- notice: implicit variable refs by block#[0]
  function r1_31(r0_32)
    -- line: [426, 435] id: 32
    if type(r0_32) ~= "table" then
      return r0_32
    end
    local r1_32 = {}
    for r6_32, r7_32 in pairs(r0_32) do
      r1_32[r1_31(r6_32)] = r1_31(r7_32)
    end
    -- close: r2_32
    return r1_32
  end
  return r1_31(r0_31)
end
function r0_0.GetTimeZone()
  -- line: [439, 451] id: 33
  return math.floor((os.time(os.date("*t")) - os.time(os.date("!*t"))) / 3600)
end
function r0_0.Remap(r0_34, r1_34, r2_34, r3_34, r4_34)
  -- line: [453, 455] id: 34
  return (r0_34 - r1_34) / (r2_34 - r1_34) * (r4_34 - r3_34) + r3_34
end
function r0_0.IsEqual(r0_35, r1_35)
  -- line: [457, 478] id: 35
  if #r0_35 ~= #r1_35 then
    return false
  end
  for r6_35, r7_35 in ipairs(r0_35) do
    local r8_35 = r1_35[r6_35]
    if type(r7_35) ~= type(r8_35) then
      return false
    end
    if type(r7_35) == "table" and not r0_0.IsEqual(r7_35, r8_35) then
      return false
    elseif r7_35 ~= r1_35[r6_35] then
      return false
    end
  end
  -- close: r2_35
  return true
end
function r0_0.AttrValueToString(r0_36, r1_36, r2_36, r3_36)
  -- line: [482, 517] id: 36
  if not r0_36 then
    return r1_36
  end
  if r0_36.NumCorrect and not r2_36 then
    r1_36 = r1_36 * r0_36.NumCorrect
  end
  local r4_36 = ""
  if r0_36.IsPercent or r2_36 then
    r1_36 = r1_36 * 100
    r4_36 = "%"
  end
  if r3_36 then
    return tostring(r1_36) .. r4_36
  end
  local r5_36, r6_36 = math.modf(r1_36)
  if math.abs(r6_36 + 0) >= 0.00001 and math.abs(r6_36 + -1) >= 0.00001 then
    local r7_36 = math.floor((r6_36 * 100 + 0.5)) / 100
    if r7_36 ~= 0 then
      r5_36 = r5_36 + r7_36
    end
  elseif r6_36 > 0.5 then
    r5_36 = r5_36 + 1
  end
  local r7_36 = tostring(r5_36)
  local r8_36 = nil
  repeat
    r7_36, r8_36 = string.gsub(r7_36, "^(-?%d+)(%d%d%d)", "%1,%2")
  until r8_36 == 0
  return r7_36 .. r4_36
end
function r0_0.RandomNumList(r0_37, r1_37, r2_37)
  -- line: [519, 537] id: 37
  local r3_37 = {}
  for r7_37 = r0_37, r1_37, 1 do
    table.insert(r3_37, r7_37)
  end
  if r1_37 - r0_37 + 1 < r2_37 then
    return r3_37
  end
  local r4_37 = 0
  local r5_37 = {}
  while r2_37 > 0 do
    r4_37 = math.random(1, r1_37 - r0_37 + 1)
    table.insert(r5_37, r3_37[r4_37])
    table.remove(r3_37, r4_37)
    r2_37 = r2_37 + -1
    r0_37 = r0_37 + 1
  end
  return r5_37
end
function r0_0.RemoveValue(r0_38, r1_38)
  -- line: [539, 555] id: 38
  if type(r0_38) ~= "table" then
    return 
  end
  local r2_38 = nil
  for r7_38, r8_38 in ipairs(r0_38) do
    if r8_38 == r1_38 then
      r2_38 = r7_38
      break
    end
  end
  -- close: r3_38
  if r2_38 then
    table.remove(r0_38, r2_38)
    return true
  end
  return false
end
function r0_0.HasValue(r0_39, r1_39)
  -- line: [557, 570] id: 39
  if not r0_39 then
    return false
  end
  if type(r0_39) ~= "table" then
    return false
  end
  for r6_39, r7_39 in pairs(r0_39) do
    if r7_39 == r1_39 then
      return true
    end
  end
  -- close: r2_39
  return false
end
function r0_0.Size(r0_40)
  -- line: [572, 581] id: 40
  if type(r0_40) ~= "table" then
    return 0
  end
  local r1_40 = 0
  for r6_40, r7_40 in pairs(r0_40) do
    r1_40 = r1_40 + 1
  end
  -- close: r2_40
  return r1_40
end
function r0_0.IsEmpty(r0_41)
  -- line: [583, 591] id: 41
  if type(r0_41) ~= "table" then
    return true
  end
  for r5_41, r6_41 in pairs(r0_41) do
    return false
  end
  -- close: r1_41
  return true
end
function r0_0.GetFixLocation(r0_42, r1_42, r2_42, r3_42, r4_42, r5_42)
  -- line: [594, 597] id: 42
  if not r5_42 then
    r5_42 = "TraceCreatureHit"
  end
  local r6_42 = UE4.URuntimeCommonFunctionLibrary.GetFixLocation
  local r7_42 = r0_42
  local r8_42 = r1_42
  local r9_42 = r2_42 and 50
  local r10_42 = r3_42 and 200
  return r6_42(r7_42, r8_42, r9_42, r10_42, r4_42 and -1500, Const.FixTraceChannel[r5_42])
end
function r0_0.CopyTable(r0_43)
  -- line: [599, 609] id: 43
  local r1_43 = {}
  for r6_43, r7_43 in pairs(r0_43) do
    if type(r7_43) == "table" then
      r1_43[r6_43] = r0_0.CopyTable(r7_43)
    else
      r1_43[r6_43] = r7_43
    end
  end
  -- close: r2_43
  return r1_43
end
function r0_0.GetFixLocationOld(r0_44, r1_44, r2_44, r3_44, r4_44, r5_44)
  -- line: [611, 632] id: 44
  if not r5_44 then
    r5_44 = "TraceCreatureHit"
  end
  local r6_44 = r1_44
  for r11_44, r12_44 in pairs(Const.SummonOffset) do
    local r15_44 = FHitResult()
    local r16_44 = FVector(r1_44.X + r12_44[1], r1_44.Y + r12_44[2], r1_44.Z)
    local r17_44 = UE4.UKismetSystemLibrary.LineTraceSingle
    local r18_44 = r0_44
    if r17_44(r18_44, r16_44 + FVector(0, 0, (r3_44 and 200)), r16_44 + FVector(0, 0, (r4_44 and -1500)), Const.FixTraceChannel[r5_44], false, TArray(AActor), 0, r15_44, true, UE4.FLinearColor(math.random(0, 1), math.random(0, 1), math.random(0, 1), 1), UE4.FLinearColor(math.random(0, 1), math.random(0, 1), math.random(0, 1), 1), 50) and r15_44.ImpactPoint ~= r16_44 then
      r6_44 = r15_44.ImpactPoint
      break
    end
  end
  -- close: r7_44
  return FVector(r6_44.X, r6_44.Y, r6_44.Z + (r2_44 and 50))
end
function r0_0.GetCapFixLocation(r0_45, r1_45, r2_45, r3_45, r4_45, r5_45)
  -- line: [634, 657] id: 45
  if not r5_45 then
    r5_45 = "TraceCreatureHit"
  end
  local r6_45 = r1_45
  local r7_45 = r0_45.CapsuleComponent
  if r7_45 then
    r7_45 = r0_45.CapsuleComponent:GetScaledCapsuleRadius() and 0
  else
    goto label_12	-- block#4 is visited secondly
  end
  local r8_45 = r0_45.CapsuleComponent
  if r8_45 then
    r8_45 = r0_45.CapsuleComponent:GetScaledCapsuleHalfHeight() and 0
  else
    goto label_21	-- block#7 is visited secondly
  end
  for r13_45, r14_45 in pairs(Const.SummonOffset) do
    local r17_45 = FHitResult()
    local r18_45 = FVector(r1_45.X + r14_45[1], r1_45.Y + r14_45[2], r1_45.Z)
    local r19_45 = UE4.UKismetSystemLibrary.CapsuleTraceSingle
    local r20_45 = r0_45
    if r19_45(r20_45, r18_45 + FVector(0, 0, (r3_45 and 0)), r18_45 + FVector(0, 0, (r4_45 and -1500)), r7_45, r8_45, Const.FixTraceChannel[r5_45], false, nil, 0, r17_45, true, UE4.FLinearColor(1, 0, 0, 1), UE4.FLinearColor(0, 1, 0, 1), 5) and r17_45.Location ~= r18_45 then
      r6_45 = r17_45.Location
      break
    end
  end
  -- close: r9_45
  return FVector(r6_45.X, r6_45.Y, r6_45.Z + (r2_45 and 50))
end
function r0_0.GetEliteLocation(r0_46, r1_46, r2_46, r3_46)
  -- line: [660, 674] id: 46
  local r4_46 = DataMgr.EliteTeamData[r0_46]
  if not r4_46 or not r4_46.LocationCheckParam then
    return r2_46
  end
  local r5_46 = r4_46.LocationCheckParam
  local r6_46 = r5_46.HalfHeight and 40
  local r7_46 = r5_46.Radius and 20
  local r8_46 = r5_46.StepHeight and 100
  local r9_46 = r5_46.WalkableFloorAngle and 45
  local r10_46 = r5_46.MaxLength and 200
  local r11_46 = r5_46.MaxWidth and 50
  if r3_46 == nil or not r3_46 then
    r3_46 = false
  end
  return URuntimeCommonFunctionLibrary.GetValidLocationBySimulateMovement(r1_46:K2_GetActorLocation(), r2_46, r6_46, r7_46, r8_46, r9_46, false, r10_46, r11_46, r3_46)
end
r0_0.GetDeviceTypeByPlatformName = GetDeviceTypeByPlatformName
function r0_0.GetCurrentInputType()
  -- line: [717, 720] id: 47
  return UGameInputModeSubsystem.GetGameInputModeSubsystem(GWorld.GameInstance):GetCurrentInputType()
end
function r0_0.ChooseOptionByPlatform(r0_48, r1_48)
  -- line: [722, 735] id: 48
  if r0_0.GetDeviceTypeByPlatformName(self) == "PC" then
    if r0_48 == nil then
      DebugPrint("ERROR: ChooseOptionByPlatform, PCOption == nil")
    end
    return r0_48
  else
    if r1_48 == nil then
      DebugPrint("ERROR: ChooseOptionByPlatform, MoblieOption == nil, return PCOption")
      return r0_48
    end
    return r1_48
  end
end
function r0_0.Shuffle(r0_49)
  -- line: [737, 742] id: 49
  for r4_49 = #r0_49, 2, -1 do
    local r5_49 = math.random(1, r4_49)
    r0_49[r5_49] = r0_49[r4_49]
    r0_49[r4_49] = r0_49[r5_49]
  end
end
function r0_0.Reverse(r0_50)
  -- line: [744, 758] id: 50
  local r1_50 = #r0_50
  if r1_50 <= 1 then
    return 
  end
  local r2_50 = nil
  if r1_50 % 2 == 0 then
    r2_50 = r1_50 / 2
  else
    r2_50 = (r1_50 + -1) / 2
  end
  for r6_50 = 1, r2_50, 1 do
    r0_50[r1_50 + 1 - r6_50] = r0_50[r6_50]
    r0_50[r6_50] = r0_50[r1_50 + 1 - r6_50]
  end
end
function r0_0.Bind(r0_51, r1_51)
  -- line: [760, 764] id: 51
  return function(...)
    -- line: [761, 763] id: 52
    return r1_51(r0_51, ...)
  end
end
function r0_0.Intersection_Table(r0_53, r1_53)
  -- line: [767, 779] id: 53
  local r2_53 = {}
  for r7_53, r8_53 in pairs(r0_53) do
    r2_53[r8_53] = 1
  end
  -- close: r3_53
  local r3_53 = {}
  for r8_53, r9_53 in pairs(r1_53) do
    if r2_53[r9_53] then
      table.insert(r3_53, r9_53)
    end
  end
  -- close: r4_53
  return r3_53
end
function r0_0.VectorToTable(r0_54)
  -- line: [781, 787] id: 54
  return {
    X = r0_54.X,
    Y = r0_54.Y,
    Z = r0_54.Z,
  }
end
function r0_0.TableToVector(r0_55)
  -- line: [789, 791] id: 55
  return FVector(r0_55.X, r0_55.Y, r0_55.Z)
end
function r0_0.AngleBetweenVectors(r0_56, r1_56)
  -- line: [793, 812] id: 56
  if r1_0.VectorA then
    r1_0.VectorA.X = r0_56.X
    r1_0.VectorA.Y = r0_56.Y
    r1_0.VectorA.Z = r0_56.Z
  else
    r1_0.VectorA = FVector(r0_56.X, r0_56.Y, r0_56.Z)
  end
  if r1_0.VectorB then
    r1_0.VectorB.X = r1_56.X
    r1_0.VectorB.Y = r1_56.Y
    r1_0.VectorB.Z = r1_56.Z
  else
    r1_0.VectorB = FVector(r1_56.X, r1_56.Y, r1_56.Z)
  end
  r1_0.VectorA:Normalize()
  r1_0.VectorB:Normalize()
  return UE4.UKismetMathLibrary.Acos(UE4.UKismetMathLibrary.Dot_VectorVector(r1_0.VectorA, r1_0.VectorB))
end
function r0_0.CheckIsTarget(r0_57)
  -- line: [814, 816] id: 57
  return UCharacterFunctionLibrary.IsEffectSource(r0_57)
end
function r0_0.NewEmptyProxy()
  -- line: [818, 833] id: 58
  local r0_58 = {}
  setmetatable(r0_58, {
    __call = function()
      -- line: [821, 823] id: 59
      return nil
    end,
    __index = function()
      -- line: [824, 826] id: 60
      return r0_58
    end,
    __newindex = function(r0_61, r1_61, r2_61)
      -- line: [827, 830] id: 61
      rawset(r0_58, r1_61, r2_61)
      return nil
    end,
  })
  return r0_58
end
r0_0.EmptyProxy = r0_0.NewEmptyProxy()
function r0_0.Keys(r0_62)
  -- line: [837, 843] id: 62
  local r1_62 = {}
  for r6_62, r7_62 in pairs(r0_62) do
    table.insert(r1_62, r6_62)
  end
  -- close: r2_62
  return r1_62
end
function r0_0.TableLength(r0_63)
  -- line: [845, 854] id: 63
  if not r0_63 then
    return 0
  end
  local r1_63 = 0
  for r6_63, r7_63 in pairs(r0_63) do
    r1_63 = r1_63 + 1
  end
  -- close: r2_63
  return r1_63
end
function r0_0.GetCountStr(r0_64, r1_64, r2_64)
  -- line: [856, 883] id: 64
  r0_64 = math.floor(r0_64 and 0)
  if not r1_64 then
    r1_64 = 3
  end
  if not r2_64 then
    r2_64 = ","
  end
  local r3_64 = ""
  local r4_64 = r0_64
  if r4_64 < 0 then
    r4_64 = r4_64 * -1
    r3_64 = "-"
  end
  local r5_64 = ""
  local r6_64 = 0
  while r4_64 ~= 0 do
    r5_64 = r5_64 .. r4_64 % 10
    r4_64 = r4_64 // 10
    r6_64 = r6_64 + 1
    if r4_64 > 0 and r6_64 % r1_64 == 0 then
      r5_64 = r5_64 .. r2_64
    end
  end
  if r5_64 == nil or r5_64 == "" then
    return "0"
  end
  return r3_64 .. string.reverse(r5_64)
end
function r0_0.RandomSeed(r0_65)
  -- line: [885, 887] id: 65
  math.randomseed(tostring(os.time()):reverse():sub(1, 7))
end
function r0_0.RandomFloat(r0_66)
  -- line: [890, 893] id: 66
  r0_66:RandomSeed()
  return math.random()
end
function r0_0.RandomReverseFloat(r0_67)
  -- line: [896, 899] id: 67
  r0_67:RandomSeed()
  return 1 - math.random()
end
function r0_0.RandomInt(r0_68, r1_68, r2_68)
  -- line: [902, 905] id: 68
  r0_68:RandomSeed()
  return math.random(r1_68, r2_68)
end
function r0_0.GetCharMaxLevel(r0_69)
  -- line: [907, 913] id: 69
  local r1_69 = 0
  for r6_69, r7_69 in pairs(DataMgr.LevelUp) do
    r1_69 = math.max(r6_69, r1_69)
  end
  -- close: r2_69
  return r1_69
end
function r0_0.ToStringEx(r0_70, r1_70)
  -- line: [915, 926] id: 70
  local r2_70 = type(r1_70)
  if r2_70 == "table" then
    return r0_0:TableToStr(r1_70)
  elseif r2_70 == "string" then
    return "\"" .. r1_70 .. "\""
  elseif r2_70 == "number" or r2_70 == "boolean" then
    return tostring(r1_70)
  else
    return "\"" .. tostring(r1_70) .. "\""
  end
end
function r0_0.TableToStr(r0_71, r1_71)
  -- line: [928, 958] id: 71
  if r1_71 == nil then
    return ""
  end
  local r2_71 = "{"
  local r3_71 = 1
  for r8_71, r9_71 in pairs(r1_71) do
    local r10_71 = ","
    if r3_71 == 1 then
      r10_71 = ""
    end
    if r8_71 == r3_71 then
      r2_71 = r2_71 .. r10_71 .. r0_0:ToStringEx(r9_71)
    elseif type(r8_71) == "number" or type(r8_71) == "string" then
      r2_71 = r2_71 .. r10_71 .. "[" .. r0_0:ToStringEx(r8_71) .. "]=" .. r0_0:ToStringEx(r9_71)
    elseif type(r8_71) == "userdata" then
      r2_71 = r2_71 .. r10_71 .. "*s" .. r0_0:TableToStr(getmetatable(r8_71)) .. "*e" .. "=" .. r0_0:ToStringEx(r9_71)
    else
      r2_71 = r2_71 .. r10_71 .. r8_71 .. ":" .. r0_0:ToStringEx(r9_71)
    end
    r3_71 = r3_71 + 1
  end
  -- close: r4_71
  return r2_71 .. "}"
end
function r0_0.StrToTable(r0_72, r1_72)
  -- line: [960, 966] id: 72
  if r1_72 == nil or type(r1_72) ~= "string" or r1_72 == "" then
    return {}
  end
  return load("return " .. r1_72)()
end
function r0_0.Round(r0_73)
  -- line: [968, 972] id: 73
  if r0_73 == 0 then
    return 0
  end
  if r0_73 > 0 then
    return math.floor(r0_73 + 0.5)
  else
    return -r0_0.Round(-r0_73)
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
function r0_0.ShouldDisplayAttr(r0_74, r1_74, r2_74, r3_74, r4_74, r5_74)
  -- line: [986, 1017] id: 74
  local r6_74 = DataMgr.AttrConfig[r1_74]
  if r6_74 and r6_74.ShowInInspector then
    if r3_74 == "Weapon" then
      local r7_74 = r5_74 and DataMgr.BattleWeapon[r5_74].UIHiddenAttrs
      if r7_74 then
        for r12_74, r13_74 in ipairs(r7_74) do
          if r1_74 == r13_74 then
            return false
          end
        end
        -- close: r8_74
      end
      local r8_74 = DataMgr.BattleWeaponAttr[r1_74]
      if r8_74 then
        if not r8_74[(r4_74 .. "WeaponAttrDisplay")] or r8_74[r4_74 .. "WeaponAttrDisplay"] == "AlwaysTrue" then
          return true
        elseif r8_74[r4_74 .. "WeaponAttrDisplay"] == "OnlyModified" and r2_74 ~= nil and r8_74.DefaultValue ~= r2_74 then
          return true
        end
      end
    else
      local r7_74 = DataMgr.BattleCharAttr[r1_74]
      if r7_74 then
        if not r7_74.RoleAttrDisplay or r7_74.RoleAttrDisplay == "AlwaysTrue" then
          return true
        elseif r7_74.RoleAttrDisplay == "OnlyModified" and r2_74 ~= nil and r7_74.DefaultValue ~= r2_74 then
          return true
        end
      end
    end
  end
end
function r0_0.CheckBirthday(r0_75, r1_75, r2_75)
  -- line: [1020, 1038] id: 75
  if r1_75 < 1 or r1_75 > 12 or r2_75 < 1 then
    return false
  end
  if (r1_75 == 4 or r1_75 == 6 or r1_75 == 9 or r1_75 == 11) and r2_75 > 30 then
    return false
  elseif r1_75 == 2 and r2_75 > 29 then
    return false
  elseif r2_75 > 31 then
    return false
  end
  return true
end
function r0_0.GetActionMappingKeyName(r0_76, r1_76, r2_76)
  -- line: [1043, 1064] id: 76
  local r3_76 = GWorld:GetAvatar()
  if r3_76 and r3_76.ActionMapping:Length() > 0 and r3_76.ActionMapping[r1_76] and not r2_76 then
    return r3_76.ActionMapping[r1_76]
  else
    local r4_76 = UE4.UInputSettings.GetInputSettings()
    local r5_76 = UE4.TArray(UE4.FInputActionKeyMapping)
    r4_76:GetActionMappingByName(r1_76, r5_76)
    for r10_76, r11_76 in pairs(r5_76) do
      if r2_76 and string.find(r11_76.Key.KeyName, "Gamepad") ~= nil then
        return r11_76.Key.KeyName
      elseif string.find(r11_76.Key.KeyName, "Gamepad") == nil then
        return r11_76.Key.KeyName
      end
    end
    -- close: r6_76
  end
  return ""
end
function r0_0.GetKeyText(r0_77, r1_77)
  -- line: [1068, 1074] id: 77
  local r2_77 = DataMgr.KeyboardText[r1_77]
  if r2_77 and r2_77.KeyText then
    return GText(r2_77.KeyText)
  end
  return r1_77
end
function r0_0.GetWASDKeyName(r0_78, r1_78)
  -- line: [1078, 1086] id: 78
  local r2_78 = r1_78 and ""
  if not r1_78 then
    return r2_78
  end
  local r3_78 = GWorld:GetAvatar()
  if r3_78 and r3_78.ActionMapping:Length() > 0 and r3_78.ActionMapping[r1_78] then
    r2_78 = r3_78.ActionMapping[r1_78]
  end
  return r2_78
end
function r0_0.StringReplaceActionName(r0_79, r1_79)
  -- line: [1088, 1096] id: 79
  local r2_79 = Split(r1_79, "&")
  for r6_79 = 2, #r2_79, 2 do
    r1_79 = string.gsub(r1_79, "&" .. r2_79[r6_79] .. "&", r0_0:GetKeyText(r0_0:GetActionMappingKeyName(r2_79[r6_79])))
  end
  return r1_79
end
function r0_0.GetKeyName(r0_80, r1_80)
  -- line: [1098, 1118] id: 80
  local r2_80 = UE4.UInputSettings.GetInputSettings()
  local r3_80 = UE4.TArray(UE4.FInputActionKeyMapping)
  r2_80:GetActionMappingByName(r1_80, r3_80)
  local r4_80 = {
    "KeyboardKey",
    "MouseButton"
  }
  for r9_80, r10_80 in pairs(r3_80) do
    local r11_80 = r10_80.Key
    for r16_80, r17_80 in pairs(r4_80) do
      if UE4.UKismetInputLibrary["Key_Is" .. r17_80](r11_80) then
        local r18_80 = string.gsub(UE4.UFormulaFunctionLibrary.Key_GetFName(r11_80), " ", "_")
        if r17_80 == "KeyboardKey" and DataMgr.TextMap[r18_80] then
          r18_80 = GText(r18_80)
        end
        return r18_80, r17_80
      end
    end
    -- close: r12_80
  end
  -- close: r5_80
  return nil, nil
end
function r0_0.MergeTables(r0_81, r1_81)
  -- line: [1119, 1143] id: 81
  local function r2_81(r0_82)
    -- line: [1120, 1127] id: 82
    local r1_82 = 0
    for r6_82 in pairs(r0_82) do
      r1_82 = r1_82 + 1
      if r0_82[r1_82] == nil then
        return false
      end
    end
    -- close: r2_82
    return true
  end
  for r7_81, r8_81 in pairs(r1_81) do
    if type(r8_81) == "table" and type(r0_81[r7_81]) == "table" then
      if r2_81(r8_81) and r2_81(r0_81[r7_81]) then
        r0_81[r7_81] = r8_81
      else
        r0_0.MergeTables(r0_81[r7_81], r8_81)
      end
    else
      r0_81[r7_81] = r8_81
    end
  end
  -- close: r3_81
  return r0_81
end
function r0_0.GetCurrentAspectRatioAndFOV(r0_83)
  -- line: [1145, 1157] id: 83
  local r1_83 = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  local r2_83 = nil
  local r3_83 = nil
  local r4_83 = nil
  if IsValid(r1_83) then
    r2_83 = r1_83.CharCameraComponent.AspectRatio
    r3_83 = r1_83.CharCameraComponent.FieldOfView
    r4_83 = r1_83.CharCameraComponent.bConstrainAspectRatio
  end
  return r2_83, r3_83, r4_83
end
function r0_0.SetActorTickableWhenPaused(r0_84, r1_84, r2_84)
  -- line: [1160, 1177] id: 84
  if r1_84 ~= nil and IsValid(r1_84) then
    r1_84:SetTickableWhenPaused(r2_84)
    local r3_84 = r1_84:K2_GetComponentsByClass(UActorComponent:StaticClass())
    if r3_84 then
      for r8_84, r9_84 in pairs(r3_84) do
        URuntimeCommonFunctionLibrary.SetComponentTickableWhenPaused(r9_84, r2_84)
      end
      -- close: r4_84
    end
    if URuntimeCommonFunctionLibrary.ObjIsChildOf(r1_84, ACharacterBase) then
      local r4_84 = r1_84:GetAllAttaches()
      if r4_84 then
        r0_84:SetActorsTickableWhenPaused(r4_84, r2_84)
      end
    end
  end
end
function r0_0.SetActorsTickableWhenPaused(r0_85, r1_85, r2_85)
  -- line: [1179, 1187] id: 85
  if not r1_85 then
    return 
  end
  for r7_85, r8_85 in pairs(r1_85) do
    r0_85:SetActorTickableWhenPaused(r8_85, r2_85)
  end
  -- close: r3_85
end
function r0_0.PerfectPolarityCost(r0_86, r1_86)
  -- line: [1190, 1192] id: 86
  return math.ceil(r1_86 * DataMgr.GlobalConstant.PerfectModPolarity.ConstantValue)
end
function r0_0.WrongPolarityCost(r0_87, r1_87)
  -- line: [1195, 1197] id: 87
  return math.ceil(r1_87 * DataMgr.GlobalConstant.WrongModPolarity.ConstantValue)
end
function r0_0.GetFrontNum(r0_88, r1_88, r2_88)
  -- line: [1200, 1204] id: 88
  return r1_88 // math.floor(10 ^ (r0_0:GetIntNumLength(r1_88) - r2_88))
end
function r0_0.GetIntNumLength(r0_89, r1_89)
  -- line: [1207, 1214] id: 89
  local r2_89 = 0
  while r1_89 > 0 do
    r1_89 = r1_89 // 10
    r2_89 = r2_89 + 1
  end
  return r2_89
end
function r0_0.DataToFTransform(r0_90, r1_90)
  -- line: [1216, 1221] id: 90
  local r2_90 = r1_90.Rotation
  if r2_90 then
    r2_90 = UE4.FRotator(r1_90.Rotation[2], r1_90.Rotation[3], r1_90.Rotation[1]) and FRotator(0, 0, 0)
  else
    goto label_14	-- block#2 is visited secondly
  end
  local r3_90 = r1_90.Location
  if r3_90 then
    r3_90 = FVector(r1_90.Location[1], r1_90.Location[2], r1_90.Location[3]) and FVector(0, 0, 0)
  else
    goto label_32	-- block#5 is visited secondly
  end
  local r4_90 = r1_90.scale
  if r4_90 then
    r4_90 = FVector(r1_90.scale[1], r1_90.scale[2], r1_90.scale[3]) and FVector(1, 1, 1)
  else
    goto label_50	-- block#8 is visited secondly
  end
  return FTransform(r2_90:ToQuat(), r3_90, r4_90)
end
function r0_0.CloseGuideTouchIfExist(r0_91, r1_91)
  -- line: [1223, 1230] id: 91
  local r3_91 = UE4.UGameplayStatics.GetGameInstance(r1_91):GetGameUIManager()
  local r4_91 = r3_91:GetUIObj(r3_91.CurGuideTouchName)
  if r4_91 then
    r4_91:PlayOutAnimation()
  end
end
function r0_0.IfExistSystemGuideUI(r0_92, r1_92)
  -- line: [1233, 1249] id: 92
  local r3_92 = (UE4.UGameplayStatics.GetGameInstance(r1_92) and GWorld.GameInstance):GetGameUIManager()
  if r3_92:GetUIObj(r3_92.CurGuideTouchName) then
    return true
  end
  if r3_92:GetUIObj("GuideTextBox") then
    return true
  end
  if r3_92:GetUIObj("GuideMain") then
    return true
  end
  return false
end
function r0_0.SerializeFTransform(r0_93, r1_93)
  -- line: [1251, 1255] id: 93
  return r1_93.Translation.X .. "," .. r1_93.Translation.Y .. "," .. r1_93.Translation.Z .. "|" .. r1_93.Rotation.X .. "," .. r1_93.Rotation.Y .. "," .. r1_93.Rotation.Z .. "," .. r1_93.Rotation.W .. "|" .. r1_93.Scale3D.X .. "," .. r1_93.Scale3D.Y .. "," .. r1_93.Scale3D.Z
end
function r0_0.UnSerializeFTransform(r0_94, r1_94)
  -- line: [1257, 1264] id: 94
  local r2_94, r3_94, r4_94 = table.unpack(r0_94.Split(r1_94, "|"))
  local r5_94 = FTransform()
  r5_94.Translation.X, r5_94.Translation.Y, r5_94.Translation.Z = table.unpack(r0_94.Split(r2_94, ","))
  r5_94.Rotation.X, r5_94.Rotation.Y, r5_94.Rotation.Z, r5_94.Rotation.W = table.unpack(r0_94.Split(r3_94, ","))
  r5_94.Scale3D.X, r5_94.Scale3D.Y, r5_94.Scale3D.Z = table.unpack(r0_94.Split(r4_94, ","))
  return r5_94
end
function r0_0.FocalLengthToFOV(r0_95, r1_95)
  -- line: [1266, 1268] id: 95
  return math.atan(36 / r1_95 * 2) * 2 * 180 / math.pi
end
function r0_0.FuzzySearch(r0_96, r1_96, r2_96)
  -- line: [1271, 1287] id: 96
  local r3_96 = {}
  if r0_96 and r1_96 then
    for r8_96, r9_96 in pairs(r0_96) do
      if not r3_96[r8_96] then
        local r10_96, r11_96 = r0_0.IsInContent(r9_96, r1_96, r2_96)
        if r10_96 then
          if r2_96 then
            r9_96 = r0_0.HighLightContent(r9_96, "<Highlight>", r11_96)
          end
          r3_96[r8_96] = r9_96
        end
      end
    end
    -- close: r4_96
  end
  return r3_96
end
function r0_0.CheckFuzzySearchWithSinglePhase(r0_97, r1_97, r2_97)
  -- line: [1289, 1310] id: 97
  local r3_97 = false
  if r2_97 then
    r3_97 = true
    for r8_97, r9_97 in ipairs(r0_97) do
      local r10_97, r11_97 = r0_0.IsInContent(r9_97, r1_97)
      if not r10_97 then
        r3_97 = false
        break
      end
    end
    -- close: r4_97
  else
    for r8_97, r9_97 in ipairs(r0_97) do
      local r10_97, r11_97 = r0_0.IsInContent(r9_97, r1_97)
      if r10_97 then
        r3_97 = true
        break
      end
    end
    -- close: r4_97
  end
  return r3_97
end
function r0_0.IsInContent(r0_98, r1_98, r2_98)
  -- line: [1313, 1351] id: 98
  local r3_98 = {}
  for r9_98, r10_98 in ipairs({
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
    local r11_98 = string.gsub(r1_98, "%" .. r10_98, "%%%1")
    r1_98 = r11_98
  end
  -- close: r5_98
  for r9_98 in string.gmatch(r1_98, ".[\x80-\xbf]*") do
    table.insert(r3_98, r9_98)
  end
  -- close: r5_98
  local r5_98 = {}
  local r6_98 = 1
  for r11_98, r12_98 in ipairs(r3_98) do
    if r11_98 > 1 then
      local r13_98 = r3_98[r11_98 + -1]
      if r13_98 == "%" then
        local r14_98 = r12_98
        r13_98 = "%" .. r14_98
        r12_98 = r13_98
      end
    elseif r12_98 == "%" then
      r12_98 = nil
    end
    if r12_98 then
      local r13_98, r14_98 = string.find(r0_98, r12_98, r6_98)
      if r2_98 and r13_98 and r14_98 then
        table.insert(r5_98, {
          [1] = r13_98,
          [2] = r14_98,
        })
      end
      if r13_98 then
        r6_98 = r14_98 + 1
      else
        local r15_98 = false
        return r15_98
      end
    end
  end
  -- close: r7_98
  if r2_98 then
    return true, r5_98
  else
    return true
  end
end
function r0_0.HighLightWord(r0_99, r1_99, r2_99, r3_99)
  -- line: [1353, 1360] id: 99
  return string.format("%s%s%s%s%s", string.sub(r1_99, 1, r2_99 + -1), r0_99, string.sub(r1_99, r2_99, r3_99), "</>", string.sub(r1_99, r3_99 + 1, -1))
end
function r0_0.HighLightContent(r0_100, r1_100, r2_100)
  -- line: [1363, 1373] id: 100
  local r3_100 = r1_100
  local r4_100 = "</>"
  local r5_100 = r0_100
  for r10_100, r11_100 in pairs(r2_100) do
    local r13_100 = (string.len(r3_100) + string.len(r4_100)) * (r10_100 + -1)
    r5_100 = r0_0.HighLightWord(r1_100, r5_100, r11_100[1] + r13_100, r11_100[2] + r13_100)
  end
  -- close: r6_100
  return r5_100
end
function r0_0.CheckDestroyReason(r0_101, r1_101)
  -- line: [1375, 1389] id: 101
  local r2_101 = EDestroyReason:GetNameByValue(r0_101)
  local r3_101 = DataMgr.DestroyReason[r2_101]
  if not r3_101 then
    ScreenPrint("销毁时传入的DestroyReason没有填写在DestroyReason表中。DestroyReason:" .. r2_101)
    return false
  end
  local r4_101 = r3_101[r1_101]
  if r4_101 == nil then
    return false
  end
  return r4_101
end
function r0_0.IsWidgetHide(r0_102, r1_102)
  -- line: [1391, 1399] id: 102
  if r1_102:GetVisibility() == UE4.ESlateVisibility.Collapsed or r1_102:GetVisibility() == UE4.ESlateVisibility.Hidden or r1_102:GetRenderOpacity() == 0 and r1_102:Cast(UE4.UButton) == nil then
    return true
  end
  if r1_102:GetParent() == nil then
    return false
  end
  return r0_0:IsWidgetHide(r1_102:GetParent())
end
function r0_0.Compare(r0_103, r1_103, r2_103, r3_103)
  -- line: [1402, 1408] id: 103
  if not r3_103 then
    r3_103 = CommonConst.DESC
  end
  if r3_103 == CommonConst.DESC then
    return r2_103 < r1_103
  end
  return r1_103 < r2_103
end
function r0_0.DisableScroll(r0_104, r1_104, r2_104)
  -- line: [1410, 1417] id: 104
  r1_104:DisableDrag(r2_104)
  if r2_104 then
    r1_104:SetWheelScrollMultiplier(0)
  else
    r1_104:SetWheelScrollMultiplier(1)
  end
end
function r0_0.TeleportToCloestTeleportPoint(r0_105, r1_105)
  -- line: [1419, 1438] id: 105
end
function r0_0.GetClientTimerStructRemainTime(r0_106)
  -- line: [1440, 1451] id: 106
  local r1_106 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if not r1_106 then
    return 0
  end
  local r2_106 = r1_106.ClientTimerStruct:GetTimerInfo(r0_106)
  if r2_106.IsRealTime then
    return r2_106.Time - r1_106.ReplicatedRealTimeSeconds - r2_106.RealTimeSeconds
  else
    return r2_106.Time - r1_106.ReplicatedTimeSeconds - r2_106.TimeSeconds
  end
end
function r0_0.GetClientTimerStructTotalTime(r0_107)
  -- line: [1453, 1464] id: 107
  local r1_107 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if not r1_107 then
    return 0
  end
  local r2_107 = r1_107.ClientTimerStruct:GetTimerInfo(r0_107)
  if r2_107 and r2_107.Time then
    return r2_107.Time
  else
    return 0
  end
end
function r0_0.GetClientTimerStructPassedTime(r0_108)
  -- line: [1466, 1477] id: 108
  local r1_108 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if not r1_108 then
    return 0
  end
  local r2_108 = r1_108.ClientTimerStruct:GetTimerInfo(r0_108)
  if r2_108.IsRealTime then
    return r1_108.ReplicatedRealTimeSeconds - r2_108.RealTimeSeconds
  else
    return r1_108.ReplicatedTimeSeconds - r2_108.TimeSeconds
  end
end
function r0_0.HasClientTimerStruct(r0_109)
  -- line: [1479, 1489] id: 109
  if not r0_109 then
    return false
  end
  local r1_109 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if not r1_109 then
    return false
  end
  return r1_109.ClientTimerStruct:GetTimerInfo(r0_109).Key ~= "None"
end
function r0_0.GetDungeonUIParams(r0_110)
  -- line: [1491, 1524] id: 110
  local r1_110 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if not r1_110:IsInRegion() then
    return false, nil
  end
  local r2_110 = r1_110.CurDungeonUIParamID
  if not r0_110 then
    return false, nil
  end
  if not r2_110 then
    return false, nil
  end
  local r3_110 = DataMgr.DungeonUIParams[r2_110]
  if not r3_110 then
    return false, nil
  end
  local r4_110 = 0
  for r9_110, r10_110 in pairs(r3_110.UIName) do
    if r10_110 == r0_110 then
      r4_110 = r9_110
      break
    end
  end
  -- close: r5_110
  if r4_110 == 0 then
    return false, nil
  end
  return true, r3_110.UIParams[r4_110]
end
function r0_0.HasGamePlayTag(r0_111, r1_111)
  -- line: [1526, 1543] id: 111
  if not r0_111 then
    return false
  end
  if type(r0_111) ~= "table" then
    return string.find(r0_111, r1_111)
  end
  for r5_111 = 1, #r0_111, 1 do
    if string.find(r0_111[r5_111], r1_111) then
      return true
    end
  end
  return false
end
function r0_0.CalcNameLength(r0_112)
  -- line: [1545, 1559] id: 112
  local function r1_112(r0_113)
    -- line: [1547, 1549] id: 113
    local r1_113 = nil	-- notice: implicit variable refs by block#[6]
    if r0_113 < 65 or r0_113 > 90 then
      if r0_113 >= 97 then
        r1_113 = r0_113 <= 122
      else
        goto label_8	-- block#4 is visited secondly
      end
    else
      goto label_9	-- block#5 is visited secondly
    end
    return r1_113
  end
  local r2_112 = 0
  for r7_112, r8_112 in utf8.codes(r0_112) do
    if r1_112(r8_112) then
      r2_112 = r2_112 + 1
    else
      r2_112 = r2_112 + 2
    end
  end
  -- close: r3_112
  return r2_112
end
function r0_0.TableToString2(r0_114, r1_114)
  -- line: [1577, 1639] id: 114
  local r9_114 = nil	-- notice: implicit variable refs by block#[0]
  local r2_114 = {}
  local r3_114 = 1
  local r4_114 = "    "
  local r5_114 = {
    ["0"] = "",
  }
  local function r6_114(r0_115)
    -- line: [1584, 1589] id: 115
    if not r5_114[r0_115] then
      r5_114[r0_115] = r4_114:rep(r0_115)
    end
    return r5_114[r0_115]
  end
  local function r7_114(r0_116)
    -- line: [1591, 1593] id: 116
    r2_114[#r2_114 + 1] = r0_116
  end
  local function r8_114(r0_117)
    -- line: [1595, 1601] id: 117
    r0_117 = string.format("%q", r0_117)
    r0_117 = r0_117:gsub("\\\n", "\\n")
    r0_117 = r0_117:gsub("\r", "")
    r0_117 = r0_117:gsub(string.char(26), "\"..string.char(26)..\"")
    return r0_117
  end
  function r9_114(r0_118, r1_118)
    -- line: [1603, 1626] id: 118
    if type(r0_118) == "number" then
      r7_114(tostring(r0_118))
    else
      local r3_118 = nil	-- notice: implicit variable refs by block#[6]
      if type(r0_118) == "boolean" then
        local r2_118 = r7_114
        if r0_118 then
          r3_118 = "true"
          if not r3_118 then
            ::label_22::
            r3_118 = "false"
          end
        else
          goto label_22	-- block#5 is visited secondly
        end
        r2_118(r3_118)
      elseif type(r0_118) == "string" then
        r7_114(r8_114(r0_118))
      elseif type(r0_118) == "table" then
        local r2_118 = r7_114
        r3_118 = "{"
        local r4_118 = r1_114
        if r4_118 then
          r4_118 = "" and "\n"
        else
          goto label_49	-- block#12 is visited secondly
        end
        r2_118(r3_118 .. r4_118)
        r2_118 = r1_118 + 1
        r3_118 = r6_114(r2_118)
        for r8_118, r9_118 in pairs(r0_118) do
          local r10_118 = r7_114
          local r11_118 = r1_114
          if r11_118 then
            r11_118 = "" and r3_118
          else
            goto label_68	-- block#16 is visited secondly
          end
          r10_118(r11_118 .. "[")
          r9_114(r8_118, r2_118)
          r10_118 = r7_114
          r11_118 = "]"
          local r12_118 = r1_114
          if r12_118 then
            r12_118 = "=" and " = "
          else
            goto label_84	-- block#19 is visited secondly
          end
          r10_118(r11_118 .. r12_118)
          r9_114(r9_118, r2_118)
          r10_118 = r7_114
          r11_118 = ","
          r12_118 = r1_114
          if r12_118 then
            r12_118 = "" and "\n"
          else
            goto label_99	-- block#22 is visited secondly
          end
          r10_118(r11_118 .. r12_118)
        end
        -- close: r4_118
        r4_118 = r7_114
        local r5_118 = r1_114
        if r5_118 then
          r5_118 = "" and r6_114(r1_118)
        else
          goto label_112	-- block#27 is visited secondly
        end
        r4_118(r5_118 .. "}")
      else
        print("unable to serialize data: " .. tostring(r0_118))
        local r2_118 = r7_114
        r3_118 = "nil,"
        local r4_118 = r1_114
        if r4_118 then
          r4_118 = "" and " -- ***ERROR: unsupported data type: " .. type(r0_118) .. "!***"
        else
          goto label_134	-- block#31 is visited secondly
        end
        r2_118(r3_118 .. r4_118)
      end
    end
  end
  local r10_114 = r7_114
  local r11_114 = "return {"
  local r12_114 = nil	-- notice: implicit variable refs by block#[3]
  if r1_114 then
    r12_114 = ""
    if not r12_114 then
      ::label_18::
      r12_114 = "\n"
    end
  else
    goto label_18	-- block#2 is visited secondly
  end
  r10_114(r11_114 .. r12_114)
  for r14_114, r15_114 in pairs(r0_114) do
    local r16_114 = r7_114
    local r17_114 = nil	-- notice: implicit variable refs by block#[7]
    if r1_114 then
      r17_114 = ""
      if not r17_114 then
        ::label_31::
        r17_114 = r6_114(r3_114)
      end
    else
      goto label_31	-- block#6 is visited secondly
    end
    r16_114(r17_114 .. "[")
    r9_114(r14_114, r3_114)
    r16_114 = r7_114
    r17_114 = "]"
    local r18_114 = nil	-- notice: implicit variable refs by block#[10, 13]
    if r1_114 then
      r18_114 = "="
      if not r18_114 then
        ::label_48::
        r18_114 = " = "
      end
    else
      goto label_48	-- block#9 is visited secondly
    end
    r16_114(r17_114 .. r18_114)
    r9_114(r15_114, r3_114)
    r16_114 = r7_114
    r17_114 = ","
    if r1_114 then
      r18_114 = ""
      if not r18_114 then
        ::label_62::
        r18_114 = "\n"
      end
    else
      goto label_62	-- block#12 is visited secondly
    end
    r16_114(r17_114 .. r18_114)
  end
  -- close: r10_114
  r7_114("}")
  return table.concat(r2_114)
end
function r0_0.ConvertServerList(r0_119)
  -- line: [1641, 1664] id: 119
  local r1_119 = {
    hostnum = r0_119.hostnum,
  }
  if r0_119.server_area == "Asian" then
    r1_119.area = "Asia"
  else
    r1_119.area = r0_119.server_area
  end
  r1_119.name = r0_119.name
  if r0_119.login_ip and r0_119.login_port then
    r1_119.ip = r0_119.login_ip
    r1_119.port = r0_119.login_port
  else
    r1_119.ip = r0_119.outer_ip
    r1_119.port = r0_119.gate_port
  end
  if r0_119.is_recommend then
    r1_119.is_recommend = true
  else
    r1_119.is_recommend = false
  end
  r1_119.recommend_weight = r0_119.recommend_weight and 0
  return r1_119
end
function r0_0.UploadStrToCDN(r0_120, r1_120, r2_120)
  -- line: [1666, 1728] id: 120
  local r3_120 = require("socket.http")
  local r4_120 = require("ltn12")
  local r5_120 = {}
  local r6_120, r7_120, r8_120 = r3_120.request({
    url = r0_120,
    method = "GET",
    sink = r4_120.sink.table(r5_120),
  })
  if r7_120 ~= 200 or not r5_120 then
    print("HTTP request failed with status:", r7_120)
    return 
  end
  local r9_120 = Json.decode(table.concat(r5_120))
  if not r9_120 then
    print("Json decode failed")
    return 
  end
  local r14_120 = "----WebKitFormBoundary7MA4YWxkTrZu0gW"
  local r15_120 = "--" .. r14_120 .. "\r\n" .. "Content-Disposition: form-data; name=\"OSSAccessKeyId\"\r\n\r\n" .. r9_120.accessid .. "\r\n" .. "--" .. r14_120 .. "\r\n" .. "Content-Disposition: form-data; name=\"policy\"\r\n\r\n" .. r9_120.policy .. "\r\n" .. "--" .. r14_120 .. "\r\n" .. "Content-Disposition: form-data; name=\"signature\"\r\n\r\n" .. r9_120.signature .. "\r\n" .. "--" .. r14_120 .. "\r\n" .. "Content-Disposition: form-data; name=\"key\"\r\n\r\n" .. r2_120 .. "\r\n" .. "--" .. r14_120 .. "\r\n" .. "Content-Disposition: form-data; name=\"file\"; filename=\"" .. r2_120 .. "\"\r\n" .. "Content-Type: text/plain\r\n\r\n" .. r1_120 .. "\r\n" .. "--" .. r14_120 .. "--\r\n"
  local r16_120 = {}
  r3_120.request({
    method = "POST",
    url = r9_120.host,
    source = r4_120.source.string(r15_120),
    headers = {
      ["Content-Type"] = "multipart/form-data; boundary=" .. r14_120,
      ["Content-Length"] = #r15_120,
    },
    sink = r4_120.sink.table(r16_120),
  })
  print("response_body:", table.concat(r16_120))
end
function r0_0.TableToString3(r0_121)
  -- line: [1735, 1808] id: 121
  local r6_121 = nil	-- notice: implicit variable refs by block#[0]
  local r1_121 = {}
  local function r3_121(r0_123)
    -- line: [1742, 1745] id: 123
    r0_123 = string.format("%q", r0_123)
    return r0_123:gsub("\\\n", "\\n"):gsub("\r", "")
  end
  local function r4_121(r0_124)
    -- line: [1748, 1750] id: 124
    local r1_124 = type(r0_124)
    if r1_124 == "string" then
      r1_124 = r0_124:match("^[a-zA-Z_][a-zA-Z0-9_]*$") ~= nil
    else
      goto label_10	-- block#2 is visited secondly
    end
    return r1_124
  end
  local function r5_121(r0_125)
    -- line: [1752, 1766] id: 125
    local r1_125 = {}
    local r2_125 = true
    for r7_125 in pairs(r0_125) do
      if type(r7_125) ~= "number" then
        r2_125 = false
      end
      table.insert(r1_125, r7_125)
    end
    -- close: r3_125
    if r2_125 then
      table.sort(r1_125)
    else
      table.sort(r1_125, function(r0_126, r1_126)
        -- line: [1763, 1763] id: 126
        return tostring(r0_126) < tostring(r1_126)
      end)
    end
    return r1_125
  end
  function r6_121(r0_127, r1_127)
    -- line: [1768, 1805] id: 127
    if type(r0_127) == "number" then
      return tostring(r0_127)
    else
      local r2_127 = type(r0_127)
      if r2_127 == "boolean" then
        if r0_127 then
          r2_127 = "true" and "false"
        else
          goto label_20	-- block#5 is visited secondly
        end
        return r2_127
      elseif type(r0_127) == "string" then
        return r3_121(r0_127)
      elseif type(r0_127) == "table" then
        r2_127 = {}
        local r3_127 = r1_127 == 1
        for r9_127, r10_127 in ipairs(r5_121(r0_127)) do
          local r11_127 = r0_127[r10_127]
          local r12_127 = nil
          if type(r10_127) == "string" and r4_121(r10_127) then
            r12_127 = r10_127
          else
            r12_127 = "[" .. r6_121(r10_127, r1_127 + 1) .. "]"
          end
          local r13_127 = r6_121(r11_127, r1_127 + 1)
          if r3_127 then
            table.insert(r2_127, "    " .. r12_127 .. " = " .. r13_127 .. ",")
          else
            table.insert(r2_127, r12_127 .. " = " .. r13_127)
          end
        end
        -- close: r5_127
        if r3_127 then
          return "{\n" .. table.concat(r2_127, "\n") .. "\n}"
        else
          return "{ " .. table.concat(r2_127, ", ") .. " }"
        end
      else
        return "nil"
      end
    end
  end
  (function(r0_122)
    -- line: [1738, 1740] id: 122
    r1_121[#r1_121 + 1] = r0_122
  end)("return " .. r6_121(r0_121, 1) .. "\n")
  return table.concat(r1_121)
end
function r0_0.RotationToTable(r0_128)
  -- line: [1810, 1816] id: 128
  return {
    Pitch = r0_128.Pitch,
    Yaw = r0_128.Yaw,
    Roll = r0_128.Roll,
  }
end
function r0_0.LocationToTable(r0_129)
  -- line: [1818, 1824] id: 129
  return {
    X = r0_129.X,
    Y = r0_129.Y,
    Z = r0_129.Z,
  }
end
function r0_0.GetWeaponTypeById(r0_130)
  -- line: [1826, 1836] id: 130
  local r1_130 = DataMgr.BattleWeapon[r0_130]
  if not r1_130 then
    return 
  end
  if r0_0.HasValue(r1_130.WeaponTag, CommonConst.WeaponType.MeleeWeapon) then
    return CommonConst.WeaponType.MeleeWeapon
  elseif r0_0.HasValue(r1_130.WeaponTag, CommonConst.WeaponType.RangedWeapon) then
    return CommonConst.WeaponType.RangedWeapon
  end
end
function r0_0.IsOpenVersion(r0_131)
  -- line: [1839, 1849] id: 131
  if not r0_131 then
    return false
  end
  if DataMgr.CombatVersionOpenList[r0_131] then
    return true
  else
    return false
  end
end
function r0_0.IsCurrentVersionRealease(r0_132, r1_132)
  -- line: [1852, 1861] id: 132
  local r2_132 = DataMgr[r0_132] and DataMgr[r0_132][r1_132]
  if not r2_132 then
    return 
  end
  if not DataMgr.GlobalConstant.CurrentVersion or not r2_132.ReleaseVersion then
    return true
  end
  return r2_132.ReleaseVersion <= DataMgr.GlobalConstant.CurrentVersion.ConstantValue
end
function r0_0.IsCurrentVersionNewRealease(r0_133, r1_133)
  -- line: [1864, 1873] id: 133
  local r2_133 = DataMgr[r0_133] and DataMgr[r0_133][r1_133]
  if not r2_133 then
    return 
  end
  if not DataMgr.GlobalConstant.CurrentVersion or not r2_133.ReleaseVersion then
    return 
  end
  return DataMgr.GlobalConstant.CurrentVersion.ConstantValue == r2_133.ReleaseVersion
end
return r0_0
