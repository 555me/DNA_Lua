-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Common\BP_NewLevelLoader_C.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("Utils.MiscUtils")
local r1_0 = Class("BluePrints.Common.BP_LevelLoader_C")
function r1_0.LoadLevelByBPArrow(r0_1, r1_1, r2_1)
  -- line: [38, 74] id: 1
  if r0_0.IsSimulatedProxy(r1_1) then
    return 
  end
  if r0_1.DungeonMinimumLevel then
    r0_1:StartMinimumLoad(r1_1, r2_1)
    return 
  end
  local r3_1 = UGameplayStatics.GetPlayerControllerID(r1_1:GetController())
  local r4_1 = r1_1.CurrentLevelId:GetRef(1)
  if r2_1.LevelId ~= r4_1 and r2_1.OtherLevelId ~= r4_1 then
    print(_G.LogTag, "WARNING: character level id ERROR from BPArrow:" .. r2_1.DisplayName .. "  LevelId:" .. r2_1.LevelID .. "  Character level ID:" .. r4_1)
    return 
  end
  local r5_1 = r4_1
  local r6_1 = r4_1
  if r4_1 == r2_1.LevelId then
    r5_1 = r2_1.OtherLevelId
  else
    r5_1 = r2_1.LevelId
  end
  if not r0_1.ConnectedLevel or not r0_1.ConnectedLevel[r5_1] then
    r0_1:GetConnectedLevel(r5_1)
  end
  local r7_1 = r0_1:GetPlayerLevels(r3_1)
  if r0_1.ConnectedLevel[r5_1] then
    for r12_1, r13_1 in pairs(r0_1.ConnectedLevel[r5_1]) do
      if r13_1 ~= r6_1 and not r0_1:IsCapturePathLevel(r13_1) then
        r0_1:QueueLoadArtLevel(r13_1)
        r7_1[r13_1] = true
      end
    end
    -- close: r8_1
  end
end
function r1_0.UnloadLevelByBPArrow(r0_2, r1_2, r2_2)
  -- line: [76, 141] id: 2
  if r0_0.IsSimulatedProxy(r1_2) then
    return 
  end
  if r0_2.DungeonMinimumLevel then
    r0_2:EndMinimumLoad(r1_2, r2_2)
    return 
  end
  local r3_2 = UGameplayStatics.GetPlayerControllerID(r1_2:GetController())
  local r4_2 = r1_2.CurrentLevelId:GetRef(1)
  if r2_2.LevelId ~= r4_2 and r2_2.OtherLevelId ~= r4_2 then
    print(_G.LogTag, "WARNING: character level id ERROR from BPArrow:" .. r2_2.DisplayName .. "  LevelId:" .. r2_2.LevelID .. "  Character level ID:" .. r4_2)
    return 
  end
  local r5_2 = r4_2
  local r6_2 = r4_2
  if r4_2 == r2_2.LevelId then
    r5_2 = r2_2.OtherLevelId
  else
    r5_2 = r2_2.LevelId
  end
  if not r0_2.ConnectedLevel or not r0_2.ConnectedLevel[r5_2] then
    r0_2:GetConnectedLevel(r5_2)
  end
  if not r0_2.ConnectedLevel[r5_2] then
    print(_G.LogTag, "WARNING: cant find level by levelid:" .. r5_2)
    return 
  end
  local r7_2 = r0_2:GetPlayerLevels(r3_2)
  if IsDedicatedServer(r0_2) then
    local r8_2 = {}
    for r13_2, r14_2 in pairs(r0_2.ConnectedLevel[r5_2]) do
      table.insert(r8_2, r14_2)
    end
    -- close: r9_2
    for r13_2, r14_2 in pairs(r0_2.PlayerLevels) do
      if r13_2 ~= r3_2 then
        local r15_2 = 1
        for r19_2 = 1, #r8_2, 1 do
          if r8_2[r15_2] and r14_2[r8_2[r15_2]] then
            table.remove(r8_2, r15_2)
            r15_2 = r15_2 + -1
          end
          r15_2 = r15_2 + 1
        end
      else
        for r19_2, r20_2 in pairs(r0_2.ConnectedLevel[r5_2]) do
          if r20_2 ~= r6_2 and not r0_2:IsCapturePathLevel(r20_2) then
            r14_2[r20_2] = false
          end
        end
        -- close: r15_2
      end
    end
    -- close: r9_2
    for r13_2, r14_2 in pairs(r8_2) do
      if r14_2 ~= r6_2 and not r0_2:IsCapturePathLevel(r14_2) then
        r1_0.Super.UnloadArtLevel(r0_2, r14_2)
      end
    end
    -- close: r9_2
  else
    for r12_2, r13_2 in pairs(r0_2.ConnectedLevel[r5_2]) do
      if r13_2 ~= r6_2 and not r0_2:IsCapturePathLevel(r13_2) then
        r1_0.Super.UnloadArtLevel(r0_2, r13_2)
      end
    end
    -- close: r8_2
  end
end
function r1_0.LoadArtLevel(r0_3, r1_3, r2_3, r3_3)
  -- line: [143, 144] id: 3
end
function r1_0.UnloadArtLevel(r0_4, r1_4)
  -- line: [146, 147] id: 4
end
function r1_0.QueueLoadArtLevel(r0_5, r1_5)
  -- line: [149, 164] id: 5
  if r0_5.showAllLevel then
    r1_0.Super.LoadArtLevel(r0_5, r1_5)
    return 
  end
  if not r1_5 or r0_5:GetLevelLoaded(r1_5) then
    return 
  end
  table.insert(r0_5.LevelLoadQueue, r1_5)
  DebugPrint("NewLevelLoader", "LevelLoadQueue In", r1_5)
  if #r0_5.LevelLoadQueue > 1 then
    return 
  elseif #r0_5.LevelLoadQueue == 1 then
    r1_0.Super.LoadArtLevel(r0_5, r0_5.LevelLoadQueue[1])
  end
end
function r1_0.RemoveQueueArtLevel(r0_6, r1_6)
  -- line: [166, 179] id: 6
  if not r1_6 then
    return 
  end
  local r2_6 = {}
  for r7_6, r8_6 in pairs(r0_6.LevelLoadQueue) do
    if not r1_6[r8_6] or r7_6 == 1 then
      table.insert(r2_6, r8_6)
    else
      DebugPrint("NewLevelLoader", "LevelLoadQueue RemoveQueueArtLevel", r8_6)
    end
  end
  -- close: r3_6
  r0_6.LevelLoadQueue = r2_6
end
function r1_0.SetLevelDoor(r0_7, r1_7)
  -- line: [181, 184] id: 7
  r1_0.Super.SetLevelDoor(r0_7, r1_7)
  r1_7.LoadLevelByBPArrow = true
end
function r1_0.GetConnectedLevel(r0_8, r1_8)
  -- line: [186, 192] id: 8
  if not r0_8.ConnectedLevel then
    r0_8.ConnectedLevel = {}
  end
  r0_8.ConnectedLevel[r1_8] = r0_8.LevelPathfinding:GetConnectedLevelID(r1_8):ToTable()
end
function r1_0.OnPreloadComplete(r0_9)
  -- line: [194, 242] id: 9
  r1_0.Super.OnPreloadComplete(r0_9)
  r1_0.Super.LoadArtLevel(r0_9, r0_9.enterLevelID)
  if not r0_9.ConnectedLevel or not r0_9.ConnectedLevel[r0_9.enterLevelID] then
    r0_9:GetConnectedLevel(r0_9.enterLevelID)
  end
  r0_9.StartLevels = {}
  table.insert(r0_9.StartLevels, r0_9.enterLevelID)
  if r0_9.ConnectedLevel[r0_9.enterLevelID] then
    for r5_9, r6_9 in pairs(r0_9.ConnectedLevel[r0_9.enterLevelID]) do
      r1_0.Super.LoadArtLevel(r0_9, r6_9)
      if IsDedicatedServer(r0_9) then
        table.insert(r0_9.StartLevels, r6_9)
      end
    end
    -- close: r1_9
  end
  if r0_9.enterNextLevelID then
    if not r0_9.ConnectedLevel or not r0_9.ConnectedLevel[r0_9.enterNextLevelID] then
      r0_9:GetConnectedLevel(r0_9.enterNextLevelID)
    end
    if r0_9.ConnectedLevel[r0_9.enterNextLevelID] then
      for r5_9, r6_9 in pairs(r0_9.ConnectedLevel[r0_9.enterNextLevelID]) do
        if r6_9 ~= r0_9.enterLevelID then
          r1_0.Super.LoadArtLevel(r0_9, r6_9)
          if IsDedicatedServer(r0_9) then
            table.insert(r0_9.StartLevels, r6_9)
          end
        end
      end
      -- close: r1_9
    end
  end
  if r0_9.CapturePathLevel then
    for r5_9, r6_9 in pairs(r0_9.CapturePathLevel) do
      r1_0.Super.LoadArtLevel(r0_9, r6_9)
    end
    -- close: r1_9
  end
  if IsDedicatedServer(r0_9) then
    local r1_9 = UE4.UGameplayStatics.GetGameMode(r0_9)
    if r1_9 then
      for r5_9 = 0, r1_9:GetPlayerNum() + -1, 1 do
        r0_9:GetPlayerLevels(r5_9)
      end
    end
  end
end
function r1_0.CheckLevelCount(r0_10)
  -- line: [244, 251] id: 10
  local r1_10 = 0
  for r6_10, r7_10 in pairs(r0_10.ArtLevelLoaded:ToTable()) do
    if r7_10 then
      r1_10 = r1_10 + 1
    end
  end
  -- close: r2_10
end
function r1_0.GetPlayerLevels(r0_11, r1_11)
  -- line: [253, 267] id: 11
  if not r0_11.PlayerLevels then
    r0_11.PlayerLevels = {}
  end
  if not r0_11.PlayerLevels[r1_11] then
    local r2_11 = {}
    if r0_11.StartLevels then
      for r7_11, r8_11 in pairs(r0_11.StartLevels) do
        r2_11[r8_11] = true
      end
      -- close: r3_11
    end
    r0_11.PlayerLevels[r1_11] = r2_11
  end
  return r0_11.PlayerLevels[r1_11]
end
function r1_0.StartMinimumLoad(r0_12, r1_12, r2_12)
  -- line: [269, 329] id: 12
  local r4_12 = r0_12:GetPlayerLevels(UGameplayStatics.GetPlayerControllerID(r1_12:GetController()))
  if not r0_12.ConnectedLevel or not r0_12.ConnectedLevel[r2_12.LevelId] then
    r0_12:GetConnectedLevel(r2_12.LevelId)
  end
  if not r0_12.ConnectedLevel or not r0_12.ConnectedLevel[r2_12.OtherLevelId] then
    r0_12:GetConnectedLevel(r2_12.OtherLevelId)
  end
  local r6_12 = r0_12.ConnectedLevel[r2_12.OtherLevelId]
  local r7_12 = TArray("")
  local r8_12 = TArray("")
  for r13_12, r14_12 in pairs(r0_12.ConnectedLevel[r2_12.LevelId]) do
    if r2_12.OtherLevelId ~= r14_12 then
      r7_12:Add(r14_12)
    end
  end
  -- close: r9_12
  for r13_12, r14_12 in pairs(r6_12) do
    if r14_12 ~= r2_12.LevelId then
      r8_12:Add(r14_12)
    end
  end
  -- close: r9_12
  r0_12.LevelPathfinding:GetDoorSortedLevels(r7_12, r2_12.LevelId, r8_12, r2_12.OtherLevelId, r2_12.DisplayName, r0_12.MinimumLoadLevelPool)
  local r9_12 = {}
  local r10_12 = 0
  for r15_12, r16_12 in pairs(r7_12:ToTable()) do
    if r16_12 ~= r2_12.LevelId and r16_12 ~= r2_12.OtherLevelId then
      r10_12 = r10_12 + 1
      if r10_12 <= r0_12.MinimumLoadMaxLevelNum + -2 then
        r0_12:QueueLoadArtLevel(r16_12)
        DebugPrint("NewLevelLoader", "StartMinimumLoad:" .. r16_12 .. " By:" .. r2_12.LevelId .. ".." .. r2_12.OtherLevelId .. ".." .. r2_12.DisplayName)
        r4_12[r16_12] = true
      elseif not IsDedicatedServer(r0_12) then
        r9_12[r16_12] = true
      end
    end
  end
  -- close: r11_12
  r0_12:RemoveQueueArtLevel(r9_12)
  for r15_12, r16_12 in pairs(r9_12) do
    r1_0.Super.UnloadArtLevel(r0_12, r15_12)
    r0_12.MinimumLoadLevelPool:Remove(r15_12)
    DebugPrint("NewLevelLoader", "StartMinimumUnload:" .. r15_12 .. " By:" .. r2_12.LevelId .. ".." .. r2_12.OtherLevelId .. ".." .. r2_12.DisplayName)
  end
  -- close: r11_12
end
function r1_0.EndMinimumLoad(r0_13, r1_13, r2_13)
  -- line: [331, 420] id: 13
  local r4_13 = r0_13:GetPlayerLevels(UGameplayStatics.GetPlayerControllerID(r1_13:GetController()))
  local r5_13 = r1_13.CurrentLevelId:GetRef(1)
  if not r0_13:CheckLocationInGridframeByLevelId(r5_13, r1_13.CurrentLocation) then
    r5_13 = r0_13:GetLevelIdByLocation(r1_13.CurrentLocation)
  end
  if r2_13.LevelId ~= r5_13 and r2_13.OtherLevelId ~= r5_13 then
    print(_G.LogTag, "WARNING: character level id ERROR from BPArrow:" .. r2_13.DisplayName .. "  LevelId:" .. r2_13.LevelID .. "  Character level ID:" .. r5_13)
    return 
  end
  if r5_13 == r2_13.OtherLevelId then
    local r6_13 = r2_13.LevelId
  end
  if not r0_13.ConnectedLevel or not r0_13.ConnectedLevel[r5_13] then
    r0_13:GetConnectedLevel(r5_13)
  end
  local r7_13 = r0_13.ConnectedLevel[r5_13]
  local r8_13 = r0_13.MinimumLoadLevelPool:Num()
  if r0_13.MinimumLoadLevelPool:Find(r5_13) then
    r8_13 = r8_13 + -1
  end
  local r9_13 = 0
  local r10_13 = {}
  for r14_13 = 1, #r7_13, 1 do
    if not r0_13.MinimumLoadLevelPool:Find(r7_13[r14_13]) then
      r9_13 = r9_13 + 1
    else
      r10_13[r7_13[r14_13]] = true
    end
  end
  r9_13 = r9_13 + r8_13 - r0_13.MinimumLoadMaxLevelNum + -1
  local r11_13 = {}
  if r9_13 > 0 and not IsDedicatedServer(r0_13) then
    local r12_13 = r0_13.MinimumLoadLevelPool:Keys()
    for r16_13 = r12_13:Num(), 1, -1 do
      local r17_13 = r12_13:Get(r16_13)
      if r17_13 ~= r5_13 and not r10_13[r17_13] then
        r11_13[r17_13] = true
        r0_13.MinimumLoadLevelPool:Remove(r17_13)
        if r9_13 + -1 == 0 then
          break
        end
      end
    end
  end
  for r16_13, r17_13 in pairs(r7_13) do
    local r18_13, r19_13 = r0_13.LevelPathfinding:GetLevelDoor(r5_13, r17_13)
    if r19_13 then
      r0_13:QueueLoadArtLevel(r17_13)
      r0_13.MinimumLoadLevelPool:Add(r17_13, r0_13.LevelPathfinding.Name2BpArrowPos:FindRef(r18_13))
      r4_13[r17_13] = true
      DebugPrint("NewLevelLoader", "EndMinimumLoad:" .. r17_13 .. " By:" .. r2_13.LevelId .. ".." .. r2_13.OtherLevelId .. ".." .. r2_13.DisplayName)
    else
      error("EndMinimumLoad Find No Door !!!!! LevelId:", r5_13, r17_13)
    end
  end
  -- close: r12_13
  r0_13:RemoveQueueArtLevel(r11_13)
  for r16_13, r17_13 in pairs(r11_13) do
    r1_0.Super.UnloadArtLevel(r0_13, r16_13)
    DebugPrint("NewLevelLoader", "EndMinimumUnload:" .. r16_13 .. " By:" .. r2_13.LevelId .. ".." .. r2_13.OtherLevelId .. ".." .. r2_13.DisplayName)
  end
  -- close: r12_13
end
function r1_0.LoadNextArtLevel(r0_14)
  -- line: [422, 435] id: 14
  PrintTable(r0_14.LevelLoadQueue)
  if #r0_14.LevelLoadQueue > 0 then
    table.remove(r0_14.LevelLoadQueue, 1)
    if #r0_14.LevelLoadQueue > 0 then
      if r0_14:GetLevelLoaded(r0_14.LevelLoadQueue[1]) then
        r0_14:LoadNextArtLevel()
      else
        DebugPrint("NewLevelLoader", "LoadNextArtLevel", r0_14.LevelLoadQueue[1], "CurrentQueueNum", #r0_14.LevelLoadQueue)
        r1_0.Super.LoadArtLevel(r0_14, r0_14.LevelLoadQueue[1])
      end
    end
  end
end
function r1_0.LoadLevelByServerBPArrow(r0_15, r1_15, r2_15, r3_15, r4_15)
  -- line: [437, 461] id: 15
  if r0_0.IsSimulatedProxy(r4_15) then
    return 
  end
  if not r0_15.LevelId2Doors[r1_15] then
    GWorld.logger.error("LoadLevelByServerBPArrow But CurrentLevelId Error! ", r1_15)
    return 
  end
  local r5_15 = nil
  for r10_15, r11_15 in pairs(r0_15.LevelId2Doors[r1_15]) do
    if r11_15.LevelId == r1_15 and r11_15.OtherLevelId == r2_15 then
      r5_15 = r11_15
      break
    end
  end
  -- close: r6_15
  if not r5_15 then
    GWorld.logger.error("LoadLevelByServerBPArrow But Can\'t Find BPArrow! ", r1_15, r2_15)
    return 
  end
  if r3_15 then
    r0_15:StartMinimumLoad(r4_15, r5_15)
  else
    r0_15:EndMinimumLoad(r4_15, r5_15)
  end
end
function r1_0.TeleportInDedicatedServer(r0_16, r1_16, r2_16, r3_16)
  -- line: [463, 535] id: 16
  if IsDedicatedServer(r0_16) then
    local r4_16 = r0_16:GetLevelIdByLocation(r2_16)
    if not r0_16.ConnectedLevel[r4_16] then
      r0_16:GetConnectedLevel(r4_16)
    end
    r0_16:QueueLoadArtLevel(r4_16)
    for r9_16, r10_16 in pairs(r0_16.ConnectedLevel[r4_16]) do
      r0_16:QueueLoadArtLevel(r10_16)
    end
    -- close: r5_16
    r1_16:K2_TeleportTo(r2_16, r3_16, false, nil, false)
    r1_16:MulticastSetPlayerRotation(r3_16)
    r1_16.RPCComponent:TeleportInDedicatedServer(r2_16, r3_16)
    r1_16:UpdateCurrentLevelId()
    r1_16:GetEMPlayerState():SetIsDedicatedServerTeleporting(true)
    DebugPrint("NewLevelLoader", "SetIsDedicatedServerTeleporting true")
  elseif IsClient(r0_16) then
    local r4_16 = r0_16:GetLevelIdByLocation(r2_16)
    if not r0_16.ConnectedLevel[r4_16] then
      r0_16:GetConnectedLevel(r4_16)
    end
    local r5_16 = r0_16.ArtLevelLoaded:ToTable()
    for r10_16, r11_16 in pairs(r5_16) do
      if r11_16 and not CommonUtils.HasValue(r0_16.ConnectedLevel[r4_16], r10_16) and r10_16 ~= r4_16 then
        r1_0.Super.UnloadArtLevel(r0_16, r10_16)
        DebugPrint("NewLevelLoader", "Unload By TeleportInDedicatedServer", r10_16, r4_16)
      end
    end
    -- close: r6_16
    if not r5_16[r4_16] then
      r0_16:QueueLoadArtLevel(r4_16)
      DebugPrint("NewLevelLoader", "Load By TeleportInDedicatedServer", r4_16)
    end
    for r10_16, r11_16 in pairs(r0_16.ConnectedLevel[r4_16]) do
      if not r5_16[r11_16] then
        r0_16:QueueLoadArtLevel(r11_16)
        DebugPrint("NewLevelLoader", "Load By TeleportInDedicatedServer", r11_16, r4_16)
      end
    end
    -- close: r6_16
    r0_16.LoadingUI = GWorld.GameInstance:ShowLoadingUI(UIConst.COMMONCHANGESCENE)
    r0_16:AddTimer(0.1, function()
      -- line: [502, 533] id: 17
      local r0_17 = r0_16.ArtLevelLoaded:ToTable()
      local r1_17 = #r0_16.ConnectedLevel[r4_16] + 1
      local r2_17 = 0
      if not r0_17[r4_16] then
        DebugPrint("NewLevelLoader", "Not Loaded:", r4_16)
      else
        r2_17 = r2_17 + 1
      end
      for r7_17, r8_17 in pairs(r0_16.ConnectedLevel[r4_16]) do
        if not r0_17[r8_17] then
          DebugPrint("NewLevelLoader", "Not Loaded:", r8_17)
        else
          r2_17 = r2_17 + 1
        end
      end
      -- close: r3_17
      DebugPrint("NewLevelLoader", "SetLoadProgress", r2_17, r1_17, r2_17 / r1_17 * 2)
      r0_16:SetLoadProgress(r2_17 / r1_17 * 2)
      if r2_17 ~= r1_17 then
        return 
      end
      DebugPrint("NewLevelLoader", "TeleportInDedicatedServer End!!!!!!!!!!!")
      if IsValid(r1_16) then
        r1_16.RPCComponent:TeleportInDedicatedServerEnd()
      end
      local r3_17 = UE4.UGameplayStatics.GetGameState(r0_16)
      if r3_17.ShouldStopHookInDungeonDelivery then
        r3_17.ShouldStopHookInDungeonDelivery = false
      end
      EventManager:FireEvent(EventID.ForceUpdatePlayerCurrentLevelId)
      r0_16:RemoveTimer("TeleportInDedicatedServerHandle")
    end, true, 0, "TeleportInDedicatedServerHandle")
    -- close: r4_16
  end
end
return r1_0
