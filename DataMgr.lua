-- filename: @C:/Pack/Branch/geili11\Content/Script/DataMgr.lua
-- version: lua54
-- line: [0, 0] id: 0
DataMgr = setmetatable({}, {
  __index = function(r0_1, r1_1)
    -- line: [2, 4] id: 1
    return require("Datas." .. r1_1)
  end,
})
DataMgr.Print_t = function(r0_2)
  -- line: [7, 40] id: 2
  local r2_2 = nil	-- notice: implicit variable refs by block#[0]
  local r1_2 = {}
  function r2_2(r0_3, r1_3)
    -- line: [10, 31] id: 3
    if r1_2[tostring(r0_3)] then
      print(r1_3 .. "*" .. tostring(r0_3))
    else
      r1_2[tostring(r0_3)] = true
      if type(r0_3) == "table" then
        for r6_3, r7_3 in pairs(r0_3) do
          if type(r7_3) == "table" then
            print(r1_3 .. "[" .. r6_3 .. "] => " .. tostring(r0_3) .. " {")
            r2_2(r7_3, r1_3 .. string.rep(" ", string.len(r6_3) + 8))
            print(r1_3 .. string.rep(" ", string.len(r6_3) + 6) .. "}")
          elseif type(r7_3) == "string" then
            print(r1_3 .. "[" .. r6_3 .. "] => \"" .. r7_3 .. "\"")
          else
            print(r1_3 .. "[" .. r6_3 .. "] => " .. tostring(r7_3))
          end
        end
        -- close: r2_3
      else
        print(r1_3 .. tostring(r0_3))
      end
    end
  end
  if type(r0_2) == "table" then
    print(tostring(r0_2) .. " {")
    r2_2(r0_2, "  ")
    print("}")
  else
    r2_2(r0_2, "  ")
  end
  print()
end
DataMgr.GetData = function(r0_4)
  -- line: [42, 50] id: 4
  local r2_4 = io.open(UE4.UKismetSystemLibrary.GetProjectContentDirectory() .. "../Datas/" .. r0_4 .. ".json", "r")
  local r3_4 = r2_4:read("*a")
  r2_4:close()
  return require("rapidjson").decode(r3_4)
end
DataMgr.GetLevelLoaderJsonData = function(r0_5)
  -- line: [52, 62] id: 5
  return require("rapidjson").decode(UE4.URuntimeCommonFunctionLibrary.LoadFile(UE4.UKismetSystemLibrary.GetProjectContentDirectory() .. "Script/Datas/Houdini_data/" .. r0_5 .. ".json"))
end
DataMgr.PreLoad = function()
  -- line: [65, 70] id: 6
  for r5_6, r6_6 in pairs(require("Datas.DataNames")) do
    require("Datas." .. r6_6)
  end
  -- close: r1_6
end
local r0_0 = {}
DataMgr.CollectTable = function(r0_7)
  -- line: [74, 86] id: 7
  for r5_7, r6_7 in pairs(r0_0) do
    if r6_7 == r0_7 then
      r0_0[r5_7] = nil
      for r11_7, r12_7 in pairs(r6_7) do
        if type(r12_7) == "table" then
          DataMgr.CollectTable(r12_7)
        end
      end
      -- close: r7_7
      break
    end
  end
  -- close: r1_7
end
DataMgr.PartitionCache = {
  Cache = {},
  MaxPartitionsPerFile = 10,
}
GetMaxPartitionsByFileName = function(r0_8)
  -- line: [93, 114] id: 8
  local r1_8 = DataMgr.PartitionCache.MaxPartitionsPerFile
  if not r0_8 or r0_8 == "" then
    return r1_8
  end
  for r7_8, r8_8 in pairs({
    Talk_Sound = 10,
    Dialogue_Content = 2,
    DialogueConvert = 2,
  }) do
    if string.find(r0_8, r7_8, 1, true) then
      r1_8 = r8_8
    end
  end
  -- close: r3_8
  return r1_8
end
DataMgr.BinarySearch = function(r0_9, r1_9)
  -- line: [118, 132] id: 9
  local r2_9 = 1
  local r3_9 = #r1_9
  while r2_9 <= r3_9 do
    local r4_9 = math.floor((r2_9 + r3_9) / 2)
    local r5_9 = r1_9[r4_9]
    if r5_9.MinKey <= r0_9 and r0_9 <= r5_9.MaxKey then
      return r5_9.Loader(), r5_9.MinKey, r5_9.MaxKey
    end
    if r0_9 < r5_9.MinKey then
      r3_9 = r4_9 + -1
    else
      r2_9 = r4_9 + 1
    end
  end
  return nil
end
local function r1_0(r0_10, r1_10)
  -- line: [135, 149] id: 10
  local r2_10 = DataMgr.PartitionCache.Cache[r0_10]
  if not r2_10 then
    return 
  end
  for r7_10, r8_10 in ipairs(r2_10.LRUQueue) do
    if r8_10 == r1_10 then
      table.remove(r2_10.LRUQueue, r7_10)
      break
    end
  end
  -- close: r3_10
  table.insert(r2_10.LRUQueue, 1, r1_10)
end
DataMgr.QueryTable = function(r0_11, r1_11, r2_11)
  -- line: [151, 196] id: 11
  local r3_11 = DataMgr.PartitionCache
  local r4_11 = r3_11.Cache[r1_11]
  if not r4_11 then
    r4_11 = {
      Partitions = {},
      LRUQueue = {},
      MaxPartitions = GetMaxPartitionsByFileName(r1_11),
    }
    r3_11.Cache[r1_11] = r4_11
  end
  for r9_11, r10_11 in pairs(r4_11.Partitions) do
    if r10_11.MinKey <= r0_11 and r0_11 <= r10_11.MaxKey then
      r1_0(r1_11, r9_11)
      return r10_11.Data[r0_11]
    end
  end
  -- close: r5_11
  local r5_11, r6_11, r7_11 = DataMgr.BinarySearch(r0_11, r2_11)
  if not r5_11 or not r5_11[r0_11] then
    return nil
  end
  local r8_11 = r6_11 .. ":" .. r7_11
  r4_11.Partitions[r8_11] = {
    Data = r5_11,
    MinKey = r6_11,
    MaxKey = r7_11,
  }
  r1_0(r1_11, r8_11)
  if r4_11.MaxPartitions < #r4_11.LRUQueue then
    r4_11.Partitions[table.remove(r4_11.LRUQueue)] = nil
  end
  return r5_11[r0_11]
end
DataMgr.GetPartitionData = function(r0_12, r1_12)
  -- line: [198, 204] id: 12
  local r2_12, r3_12, r4_12 = DataMgr.BinarySearch(r0_12, r1_12)
  if not r2_12 or not r2_12[r0_12] then
    return nil
  end
  return r2_12
end
DataMgr.ReadOnly_NewIndex = function(r0_13, r1_13, r2_13)
  -- line: [206, 210] id: 13
  local r3_13 = rawset
  local r4_13 = getmetatable
  error("没法对导表数据【" .. tostring(r0_13.__name) .. "】中字段【" .. tostring(r1_13) .. "】进行写操作")
end
DataMgr.CleanAllTable = function()
  -- line: [212, 222] id: 14
  r0_0 = {}
  local r0_14 = require("Datas.DataNames")
  local r2_14 = rawget(require("HotFix"), "data_module_table")
  for r7_14, r8_14 in pairs(r0_14) do
    if not r2_14 or not r2_14[r8_14] then
      require("UnLuaHotReload").RemoveLoadedModule("Datas." .. r8_14)
    end
  end
  -- close: r3_14
end
read_only = function(r0_15, r1_15)
  -- line: [223, 253] id: 15
  if not r0_0[r1_15] then
    local r2_15 = getmetatable(r1_15)
    if not r2_15 then
      r2_15 = {}
      setmetatable(r1_15, r2_15)
    end
    local r3_15 = r2_15.__read_only_proxy
    if not r3_15 then
      r3_15 = {
        __name = r0_15,
      }
      r2_15.__read_only_proxy = r3_15
      setmetatable(r3_15, {
        __index = r1_15,
        __newindex = DataMgr.ReadOnly_NewIndex,
        __pairs = function(r0_16)
          -- line: [238, 238] id: 16
          return pairs(r1_15)
        end,
        __len = function(r0_17)
          -- line: [240, 240] id: 17
          return #r1_15
        end,
        __read_only_proxy = r3_15,
      })
    end
    r0_0[r1_15] = r3_15
    for r8_15, r9_15 in pairs(r1_15) do
      if type(r9_15) == "table" then
        r1_15[r8_15] = read_only(r0_15, r9_15)
      end
    end
    -- close: r4_15
  end
  return r0_0[r1_15]
end
if URuntimeCommonFunctionLibrary.IsDebugDataTable() then
  DataMgr.ReadOnly = read_only
else
  DataMgr.ReadOnly = function(r0_18, r1_18)
    -- line: [258, 260] id: 18
    return r1_18
  end
end
return DataMgr
