-- filename: @C:/Pack/Branch/geili11\Content/Script/LuaMemoryManager.lua
-- version: lua54
-- line: [0, 0] id: 0
return {
  LastGCMemory = collectgarbage("count"),
  EnableLuaMemoryMonitor = function(r0_1)
    -- line: [11, 47] id: 1
    r0_1:DisableLuaMemoryMonitor()
    if IsDedicatedServer(GWorld.GameInstance) then
      return 
    end
    local r1_1 = 51200
    local r2_1 = 600
    local r3_1 = false
    if UE4.UUIFunctionLibrary.GetDevicePlatformName(GWorld.GameInstance) == "IOS" then
      r1_1 = 0
      r2_1 = 60
      r3_1 = true
    end
    print(_G.LogTag, "EnableLuaMemoryMonitor")
    r0_1.Monitor = UE4.UKismetSystemLibrary.K2_SetTimerDelegate({
      GWorld.GameInstance,
      function()
        -- line: [28, 45] id: 2
        local r0_2 = collectgarbage("count")
        print(_G.LogTag, "Lua Memor6y Cost Now: ", r0_2)
        if r0_2 < r0_1.LastGCMemory then
          r0_1.LastGCMemory = r0_2
          return 
        end
        if not r3_1 then
          if r1_1 <= r0_2 - r0_1.LastGCMemory then
            print(_G.LogTag, "Lua Memory has increased more than 50 or 20(In ios) MB. Full GC manually.")
            r0_1:FullGC()
          end
        else
          r0_1:FullGC()
        end
      end
    }, r2_1, true)
  end,
  DisableLuaMemoryMonitor = function(r0_3)
    -- line: [49, 55] id: 3
    print(_G.LogTag, "DisableLuaMemoryMonitor")
    if r0_3.Monitor == nil then
      return 
    end
    UE4.UKismetSystemLibrary.K2_ClearAndInvalidateTimerHandle(GWorld.GameInstance, r0_3.Monitor)
  end,
  FullGC = function(r0_4, r1_4)
    -- line: [57, 65] id: 4
    if r1_4 then
      DataMgr.CleanAllTable()
    end
    local r2_4 = collectgarbage("count")
    collectgarbage("collect")
    r0_4.LastGCMemory = collectgarbage("count")
    print(_G.LogTag, "Lua Memory FullGC, Pre Memory: ", r2_4, " Now Memory: ", r0_4.LastGCMemory)
  end,
}
