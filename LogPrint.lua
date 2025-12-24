-- filename: @C:/Pack/Branch/geili11\Content/Script/LogPrint.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = UE4.URuntimeCommonFunctionLibrary.IsDistribution()
local r1_0 = UE4.URuntimeCommonFunctionLibrary.EnableLogInShipping()
local function r2_0()
  -- line: [5, 5] id: 1
end
local r3_0 = _G
local r4_0 = nil	-- notice: implicit variable refs by block#[4, 8]
if r0_0 and not r1_0 then
  r4_0 = r2_0
  if r4_0 then
    ::label_17::
    function r4_0(...)
      -- line: [6, 18] id: 2
      for r4_2, r5_2 in ipairs(table.pack(...)) do
        if r5_2 == ErrorTag then
          LogError(_G.LogTag, " [Debug Log]: ", ...)
          return 
        end
        if r5_2 == WarningTag then
          LogWarn(_G.LogTag, " [Debug Log]: ", ...)
          return 
        end
      end
      -- close: r0_2
      print(_G.LogTag, " [Debug Log]: ", ...)
    end
  end
else
  goto label_17	-- block#3 is visited secondly
end
r3_0.DebugPrint = r4_0
r3_0 = _G
if r0_0 and not r1_0 then
  r4_0 = r2_0
  if r4_0 then
    ::label_26::
    function r4_0(...)
      -- line: [20, 22] id: 3
      netprint(_G.LogTag, " [Debug Log]: ", ...)
    end
  end
else
  goto label_26	-- block#7 is visited secondly
end
r3_0.DebugNetPrint = r4_0
_G.LXYTag = "lxy#"
_G.TXTTag = "txt#"
function r3_0(r0_4, r1_4)
  -- line: [29, 35] id: 4
  local r2_4 = ""
  for r6_4 = 1, r0_4, 1 do
    r2_4 = r2_4 .. r1_4
  end
  return r2_4
end
function r4_0(r0_5, r1_5, r2_5, r3_5)
  -- line: [37, 52] id: 5
  if r3_5 and r3_5 < r1_5 then
    return 
  end
  for r8_5, r9_5 in pairs(r2_5) do
    if type(r9_5) == "table" then
      DebugPrint(string.format("%s%q : %q", r3_0(r1_5, "---"), tostring(r8_5), tostring(r9_5)))
      if r0_5[r9_5] == nil then
        r0_5[r9_5] = true
        r4_0(r0_5, r1_5 + 1, r9_5, r3_5)
      end
    else
      DebugPrint(string.format("%s%q : %q", r3_0(r1_5, "---"), tostring(r8_5), tostring(r9_5)))
    end
  end
  -- close: r4_5
end
local r5_0 = _G
local r6_0 = nil	-- notice: implicit variable refs by block#[12]
if r0_0 and not r1_0 then
  r6_0 = r2_0
  if r6_0 then
    ::label_41::
    function r6_0(r0_6, r1_6)
      -- line: [54, 63] id: 6
      local r2_6 = {
        [r0_6] = true,
      }
      if type(r0_6) ~= "table" then
        error(tostring(r0_6) .. " is not a table!")
        return 
      end
      DebugPrint(string.format("Print Table: %q", tostring(r0_6)))
      r4_0(r2_6, 1, r0_6, r1_6)
    end
  end
else
  goto label_41	-- block#11 is visited secondly
end
r5_0.DebugPrintTable = r6_0
