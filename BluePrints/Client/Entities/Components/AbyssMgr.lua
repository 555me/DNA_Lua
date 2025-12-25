-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Client\Entities\Components\AbyssMgr.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("EMCache.EMCache")
return {
  EnterWorld = function(r0_1)
    -- line: [4, 8] id: 1
    r0_1:RefreshAbyssRewardReddot()
    r0_1:InitEntryNode("AbyssEntry1")
    r0_1:InitEntryNode("AbyssEntry2")
  end,
  InitEntryNode = function(r0_2, r1_2)
    -- line: [10, 24] id: 2
    if not ReddotManager.GetTreeNode(r1_2) then
      local r2_2 = ReddotManager.AddNode(r1_2, nil, 1)
    end
    ReddotManager.ClearLeafNodeCount(r1_2)
    local r3_2 = ReddotManager.GetLeafNodeCacheDetail(r1_2)
    if r3_2 then
      for r8_2, r9_2 in pairs(r3_2) do
        if r9_2 then
          ReddotManager.IncreaseLeafNodeCount(r1_2)
        end
      end
      -- close: r4_2
    end
  end,
  ClearEntryNode = function(r0_3, r1_3)
    -- line: [26, 28] id: 3
    ReddotManager.ClearLeafNodeCount(r1_3, true)
  end,
  GetAbyssSeasonBestAbyssId = function(r0_4, r1_4)
    -- line: [31, 53] id: 4
    if not r1_4 or not DataMgr.AbyssSeasonList[r1_4] then
      return nil
    end
    local r2_4 = DataMgr.AbyssSeasonList[r1_4]
    if not r2_4.Abyss then
      return nil
    end
    local r3_4 = r2_4.Abyss.Infinite
    local r4_4 = r0_4.Abysses[r3_4]
    if r4_4 and r4_4:GetAllPassRoomCount() > 0 then
      return r3_4
    else
      local r5_4 = r2_4.Abyss.Rotate
      local r6_4 = r0_4.Abysses[r5_4]
      if r6_4 and r6_4:GetAllPassRoomCount() > 0 then
        return r5_4
      end
    end
    return nil
  end,
  CheckAbyssCanJump = function(r0_5, r1_5, r2_5)
    -- line: [56, 101] id: 5
    local r3_5 = r0_5.Abysses[r1_5]
    if not r1_5 or not r3_5 then
      return false
    end
    if not r3_5:IsLoopAbyss() then
      return false
    end
    local r4_5 = DataMgr.AbyssSeasonList[r0_5.CurrentAbyssSeasonId]
    if not r4_5 or not r4_5.LastSeason then
      return false
    end
    local r6_5 = DataMgr.AbyssSeasonList[r4_5.LastSeason].Abyss.Infinite
    if not r6_5 then
      return false
    end
    local r7_5 = r3_5:Data()
    if r7_5.InfiniteNode then
      local r8_5 = r0_5.Abysses[r6_5]
      if not r8_5 then
        return false
      end
      local r9_5 = r8_5.MaxAbyssProgress[1] + -1
      if r9_5 <= r2_5 or r2_5 <= 0 then
        return false
      end
      local r10_5 = r7_5.InfiniteNode[1]
      if r2_5 % r10_5 ~= 0 then
        return false
      end
      local r11_5 = r3_5.AbyssLevelList[r2_5 - r10_5]
      if r2_5 - r10_5 > 0 and not r11_5 then
        return false
      end
      if r11_5 and not r11_5:IsAbyssLevelPass() then
        return false
      end
      if math.min(r9_5 // r10_5, r7_5.InfiniteNode[2]) <= r3_5.AlreadyJumpLevelTimes then
        return false
      end
      return true
    end
    return false
  end,
  SaveAbyssTeam = function(r0_6, r1_6, r2_6, r3_6, r4_6)
    -- line: [108, 117] id: 6
    r0_6.logger.debug("SaveAbyssTeam Begin", r2_6, r3_6, r4_6)
    r0_6:CallServer("SaveAbyssTeam", function(r0_7)
      -- line: [110, 115] id: 7
      r0_6.logger.debug("SaveAbyssTeam Callback", r0_7, r2_6, r3_6, r4_6)
      if r1_6 then
        r1_6(r0_7)
      end
    end, r2_6, r3_6, r4_6)
  end,
  UnLockAbyssTeam = function(r0_8, r1_8, r2_8, r3_8)
    -- line: [120, 130] id: 8
    r0_8.logger.debug("UnLockAbyssTeam Begin", r2_8, r3_8)
    r0_8:CallServer("UnLockAbyssTeam", function(r0_9)
      -- line: [122, 128] id: 9
      r0_8.logger.debug("UnLockAbyssTeam Callback", r0_9, r2_8, r3_8)
      if r1_8 then
        r1_8(r0_9)
      end
    end, r2_8, r3_8)
  end,
  TriggerEnterAbyss = function(r0_10, r1_10, r2_10, r3_10, r4_10)
    -- line: [133, 143] id: 10
    r0_10.logger.debug("TriggerEnterAbyss Begin", r2_10, r3_10, r4_10)
    r0_10:CallServer("TriggerEnterAbyss", function(r0_11)
      -- line: [135, 141] id: 11
      r0_10.logger.debug("TriggerEnterAbyss Callback", r0_11, r2_10, r3_10, r4_10)
      if r1_10 then
        r1_10(r0_11)
      end
    end, r2_10, r3_10, r4_10)
  end,
  TriggerReEnterAbyss = function(r0_12)
    -- line: [146, 177] id: 12
    r0_12.logger.debug("TriggerReEnterAbyss Begin")
    local r1_12 = GWorld.GameInstance:GetCurrentGameMode()
    if r1_12 then
      if r1_12.IsAbyssTeleporting then
        r0_12.logger.debug("TriggerReEnterAbyss 正在传送")
        return 
      end
      if not r1_12.EMGameState:CheckGameModeStateEnable() then
        r0_12.logger.debug("TriggerReEnterAbyss 副本已结算")
        return 
      end
      r1_12:TriggerDungeonComponentFun("SetReEnteringAbyss")
      r1_12:FlushRewards()
    end
    r0_12:CallServer("TriggerReEnterAbyss", function(r0_13)
      -- line: [167, 175] id: 13
      r0_12.logger.debug("TriggerReEnterAbyss Callback", r0_13)
      if not ErrorCode:Check(r0_13) then
        if r1_12 then
          r1_12:TriggerDungeonFailed()
        end
        return 
      end
    end)
  end,
  TriggerCompleteAbyssRoom = function(r0_14, r1_14, r2_14)
    -- line: [180, 187] id: 14
    r0_14.logger.debug("TriggerCompleteAbyssRoom Begin", r1_14, r2_14)
    r0_14:CallServer("TriggerCompleteAbyssRoom", function(r0_15)
      -- line: [182, 185] id: 15
      r0_14:TryIncreaceAbyssRewardReddot()
      r0_14.logger.debug("TriggerCompleteAbyssRoom Callback", r0_15, r1_14, r2_14)
    end, r1_14, r2_14)
  end,
  OnAbyssEnd = function(r0_16, r1_16, r2_16, r3_16, r4_16, r5_16)
    -- line: [190, 199] id: 16
    r0_16.logger.debug("OnAbyssEnd", r1_16, r2_16, r3_16, r4_16, r5_16)
    GWorld.GameInstance:PushLogicServerCallbackInfo(r4_16, r1_16, r2_16, r3_16, r5_16)
    local r6_16 = GWorld:GetMainPlayer()
    if r6_16 then
      r6_16:EnableBattleWheel()
    end
  end,
  GetAbyssReward = function(r0_17, r1_17, r2_17, r3_17)
    -- line: [203, 221] id: 17
    r0_17.logger.debug("GetAbyssReward Begin", r1_17, r2_17)
    r0_17:CallServer("GetAbyssReward", function(r0_18, r1_18)
      -- line: [205, 219] id: 18
      r0_17.logger.debug("GetAbyssReward Callback", r0_18, r1_17, r2_17, r1_18)
      if r0_18 == 0 then
        local r3_18 = r0_17.Abysses[r1_17]:GetAbyssRewardIdByStar(r2_17)
        if DataMgr.Reward[r3_18] then
          local r4_18 = DataMgr.Reward[r3_18]
          UIManager(GWorld.GameInstance):LoadUI(UIConst.LoadInConfig, "GetItemPage", nil, r4_18.Type[1], r4_18.Id[1], r4_18.Count[1][1], r1_18)
        end
        r0_17:TryDecreaceAbyssRewardReddot(r1_17, r2_17)
        if r3_17 then
          r3_17(r0_18, r1_18)
        end
      end
    end, r1_17, r2_17)
  end,
  GetAbyssAllReward = function(r0_19, r1_19, r2_19)
    -- line: [224, 241] id: 19
    r0_19.logger.debug("GetAbyssAllReward Begin", r1_19)
    r0_19:CallServer("GetAbyssAllReward", function(r0_20, r1_20)
      -- line: [226, 239] id: 20
      r0_19.logger.debug("GetAbyssAllReward Callback", r0_20, r1_19, r1_20)
      if r0_20 == 0 then
        UIManager(GWorld.GameInstance):LoadUI(UIConst.LoadInConfig, "GetItemPage", nil, nil, nil, nil, r1_20)
        r0_19:TryDecreaceAbyssRewardReddot(r1_19)
        if r2_19 then
          r2_19(r0_20, r1_20)
        end
      end
    end, r1_19)
  end,
  OnAbyssSeasonEnd = function(r0_21, r1_21)
    -- line: [243, 246] id: 21
    r0_21.logger.debug("OnAbyssSeasonEnd", r1_21)
    EventManager:FireEvent(EventID.OnAbyssSeasonEnd, r1_21)
  end,
  TryIncreaceAbyssRewardReddot = function(r0_22)
    -- line: [248, 270] id: 22
    if not ReddotManager.GetTreeNode("AbyssReward") then
      ReddotManager.AddNode("AbyssReward")
    end
    for r6_22, r7_22 in pairs(r0_22.Abysses) do
      if not r7_22.AbyssSeasonId or r7_22.AbyssSeasonId == r0_22.CurrentAbyssSeasonId then
        local r8_22 = r7_22:GetAllPassRoomCount()
        if r7_22:CheckRewardCanGet(r8_22) then
          local r9_22 = ReddotManager.GetLeafNodeCacheDetail("AbyssReward")
          if not r9_22[r6_22] then
            r9_22[r6_22] = {}
            r9_22[r6_22].Count = 0
          end
          if not r9_22[r6_22][r8_22] then
            r9_22[r6_22][r8_22] = 1
            r9_22[r6_22].Count = r9_22[r6_22].Count + 1
            ReddotManager.IncreaseLeafNodeCount("AbyssReward")
          end
        end
      end
    end
    -- close: r2_22
  end,
  TryDecreaceAbyssRewardReddot = function(r0_23, r1_23, r2_23)
    -- line: [272, 294] id: 23
    if not ReddotManager.GetTreeNode("AbyssReward") then
      ReddotManager.AddNode("AbyssReward")
    end
    local r4_23 = ReddotManager.GetLeafNodeCacheDetail("AbyssReward")
    if r4_23[r1_23] then
      r4_23[r1_23] = nil
      ReddotManager.DecreaseLeafNodeCount("AbyssReward", r4_23[r1_23].Count)
    end
    -- warn: not visited block [5, 6, 7]
    -- block#5:
    -- r4_23[r1_23][r2_23] = nil
    -- r4_23[r1_23].Count = r4_23[r1_23].Count + -1
    -- if r4_23[r1_23].Count <= 0
    -- block#6:
    -- r4_23[r1_23] = nil
    -- block#7:
    -- _ENV.ReddotManager.DecreaseLeafNodeCount("AbyssReward")
    -- goto label_49
  end,
  _OnPropChangeCurrentAbyssSeasonId = function(r0_24, r1_24)
    -- line: [296, 302] id: 24
    r0_24:ClearEntryNode("AbyssEntry1")
    r0_24:ClearEntryNode("AbyssEntry2")
    r0_24:RefreshAbyssRewardReddot()
    r0_0:Remove("LastUnlockNodeLevel")
    EventManager:FireEvent(EventID.OnCurrentAbyssSeasonIdChange)
  end,
  RefreshAbyssRewardReddot = function(r0_25)
    -- line: [304, 332] id: 25
    if not ReddotManager.GetTreeNode("AbyssReward") then
      ReddotManager.AddNode("AbyssReward")
    end
    ReddotManager.ClearLeafNodeCount("AbyssReward", true)
    local r1_25 = ReddotManager.GetLeafNodeCacheDetail("AbyssReward")
    local r2_25 = 0
    for r7_25, r8_25 in pairs(r0_25.Abysses) do
      if not r8_25.AbyssSeasonId or r8_25.AbyssSeasonId == r0_25.CurrentAbyssSeasonId then
        for r13_25 = 1, r8_25:GetAllPassRoomCount(), 1 do
          if r8_25:CheckRewardCanGet(r13_25) then
            if not r1_25[r7_25] then
              r1_25[r7_25] = {}
              r1_25[r7_25].Count = 0
            end
            if not r1_25[r7_25][r13_25] then
              r1_25[r7_25][r13_25] = 1
              r1_25[r7_25].Count = r1_25[r7_25].Count + 1
              r2_25 = r2_25 + 1
            end
          end
        end
      end
    end
    -- close: r3_25
    if r2_25 > 0 then
      ReddotManager.IncreaseLeafNodeCount("AbyssReward", r2_25)
    end
  end,
}
