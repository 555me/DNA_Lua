-- filename: @C:/Pack/Branch/geili11\Content/Script/MemDump.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  GetCurrentDir = function(r0_1)
    -- line: [9, 15] id: 1
    return string.match(debug.getinfo(1).source, "^(.*)/")
  end,
}
r0_0.file = io.open(r0_0:GetCurrentDir() .. "/MemDump_" .. os.time() .. ".txt", "w+")
r0_0.NextLine = "\n"
io.output(r0_0.file)
io.write("CurrentLuaMemory(KBytes): " .. collectgarbage("count") .. r0_0.NextLine)
io.write("Global" .. r0_0.NextLine)
function r0_0.Dump(r0_2, r1_2, r2_2)
  -- line: [23, 49] id: 2
  if not r2_2 then
    r2_2 = 1
  end
  if r2_2 > 4 then
    return 
  end
  local r3_2 = ""
  for r7_2 = 1, r2_2, 1 do
    r3_2 = r3_2 .. "  "
  end
  r3_2 = r3_2 .. "L_" .. tostring(r2_2)
  pcall(function()
    -- line: [34, 48] id: 3
    for r4_3, r5_3 in pairs(r1_2) do
      if type(r5_3) ~= "function" then
        io.write(r3_2 .. "[key]" .. r4_3 .. " [value]" .. "[" .. type(r5_3) .. "]" .. tostring(r5_3) .. r0_2.NextLine)
        if type(r5_3) == "table" and not r0_2:CheckTable(r5_3) then
          r0_2:Dump(r5_3, r2_2 + 1)
        end
      end
    end
    -- close: r0_3
    io.write(r0_2.NextLine)
    r0_2:MarkTable(r1_2)
  end)
end
r0_0.Mark = {}
function r0_0.MarkTable(r0_4, r1_4)
  -- line: [52, 59] id: 4
  if type(r1_4) ~= "table" then
    return 
  end
  r0_4.Mark[tostring(r1_4)] = true
end
function r0_0.CheckTable(r0_5, r1_5)
  -- line: [61, 64] id: 5
  return r0_5.Mark[tostring(r1_5)]
end
r0_0:Dump(_G)
io.close(r0_0.file)
