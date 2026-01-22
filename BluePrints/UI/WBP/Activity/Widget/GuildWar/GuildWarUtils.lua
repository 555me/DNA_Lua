-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Activity\Widget\GuildWar\GuildWarUtils.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("Utils.TimeUtils")
local r1_0 = {
  ReddotNodeKey = "Acti_SoloRaidSub",
  ReddotRewardKey = "RaidReward",
  ShopCacheKey = "RaidShopCache",
  EntranceCacheKey = "RaidEntranceCache",
  RewardGotCacheKey = "RaidRewardCache",
  IsEventTime = function()
    -- line: [14, 25] id: 1
    local r0_1, r1_1 = r1_0.GetSeasonAndEventData()
    if not r0_1 or not r1_1 then
      return false
    end
    local r3_1 = r1_1.EventEndTime
    local r4_1 = r0_0.NowTime()
    local r5_1 = nil	-- notice: implicit variable refs by block#[7]
    if r1_1.EventStartTime <= r4_1 then
      r5_1 = r4_1 <= r3_1
    else
      goto label_16	-- block#5 is visited secondly
    end
    return r5_1
  end,
  IsRaidTime = function()
    -- line: [28, 39] id: 2
    local r0_2, r1_2 = r1_0.GetSeasonAndEventData()
    if not r0_2 or not r1_2 then
      return false
    end
    local r2_2 = r1_2.EventStartTime
    local r3_2 = r2_2 + r0_2.PreRaidTime * 3600 + r0_2.RaidTime * 3600
    local r4_2 = r0_0.NowTime()
    local r5_2 = nil	-- notice: implicit variable refs by block#[7]
    if r2_2 <= r4_2 then
      r5_2 = r4_2 <= r3_2
    else
      goto label_25	-- block#5 is visited secondly
    end
    return r5_2
  end,
  IsPreRaidTime = function()
    -- line: [42, 53] id: 3
    local r0_3, r1_3 = r1_0.GetSeasonAndEventData()
    if not r0_3 or not r1_3 then
      return false
    end
    local r2_3 = r1_3.EventStartTime
    local r3_3 = r2_3 + r0_3.PreRaidTime * 3600
    local r4_3 = r0_0.NowTime()
    local r5_3 = nil	-- notice: implicit variable refs by block#[7]
    if r2_3 <= r4_3 then
      r5_3 = r4_3 <= r3_3
    else
      goto label_20	-- block#5 is visited secondly
    end
    return r5_3
  end,
  IsOfficalRaidTime = function()
    -- line: [56, 67] id: 4
    local r0_4, r1_4 = r1_0.GetSeasonAndEventData()
    if not r0_4 or not r1_4 then
      return false
    end
    local r2_4 = r1_4.EventStartTime + r0_4.PreRaidTime * 3600
    local r3_4 = r2_4 + r0_4.RaidTime * 3600
    local r4_4 = r0_0.NowTime()
    local r5_4 = nil	-- notice: implicit variable refs by block#[7]
    if r2_4 <= r4_4 then
      r5_4 = r4_4 <= r3_4
    else
      goto label_25	-- block#5 is visited secondly
    end
    return r5_4
  end,
  GetSeasonAndEventData = function()
    -- line: [70, 88] id: 5
    local r0_5 = GWorld:GetAvatar()
    if not r0_5 then
      return 
    end
    local r1_5 = DataMgr.RaidSeason[r0_5.CurrentRaidSeasonId]
    if not r1_5 then
      return 
    end
    local r2_5 = DataMgr.EventMain[r1_5.EventId]
    if not r2_5 then
      return 
    end
    return r1_5, r2_5
  end,
  GetDungeonTicketInfo = function(r0_6)
    -- line: [95, 132] id: 6
    local r1_6 = GWorld:GetAvatar()
    if not r1_6 then
      return 0, 0, 0
    end
    local r2_6 = DataMgr.RaidDungeon[r0_6]
    if not r2_6 then
      return 0, 0, 0
    end
    if r2_6.RaidDungeonType == 1 then
      return 0, 0, 0
    end
    local r4_6 = r2_6.TicketNum
    if not r4_6 then
      return 0, 0, 0
    end
    local r5_6 = 0
    local r6_6 = 0
    for r11_6, r12_6 in pairs(r4_6) do
      r5_6 = r11_6
      r6_6 = r12_6
      break
    end
    -- close: r7_6
    if r5_6 > 0 then
      local r7_6 = r1_6.Resources[r5_6]
      if r7_6 then
        r7_6 = r1_6.Resources[r5_6].Count and 0
      else
        goto label_59	-- block#17 is visited secondly
      end
      return r5_6, r6_6, r7_6
    end
    return 0, 0, 0
  end,
  EnterEventDungeon = function(r0_7, r1_7)
    -- line: [137, 175] id: 7
    local r2_7 = GWorld:GetAvatar()
    if not r2_7 then
      return false
    end
    local r3_7 = DataMgr.RaidDungeon[r0_7]
    if not r3_7 then
      return false
    end
    local r4_7 = GWorld.GameInstance:GetGameUIManager()
    local r5_7 = r3_7.RaidDungeonType == 1
    if r5_7 and not r1_0.IsPreRaidTime() then
      r4_7:ShowUITip(UIConst.Tip_CommonToast, GText("RaidDungeon_PreRaid_End"))
      return false
    elseif not r1_0.IsOfficalRaidTime() then
      r4_7:ShowUITip(UIConst.Tip_CommonToast, GText("RaidDungeon_PreRaid_End"))
      return false
    end
    if not r5_7 then
      local r6_7, r7_7, r8_7 = r1_0.GetDungeonTicketInfo(r0_7)
      if r6_7 > 0 and r8_7 < r7_7 then
        local r9_7 = DataMgr.Resource[r6_7]
        if r9_7 then
          r4_7:ShowUITip(UIConst.Tip_CommonToast, string.format(GText("RaidDungeon_NoTicket_Toast"), GText(r9_7.ResourceName)))
        else
          r4_7:ShowUITip(UIConst.Tip_CommonToast, GText("RaidDungeon_NoTicket_Toast"))
        end
        return false
      end
    end
    r2_7:EnterDungeonAgain()
    return true
  end,
  IsEmptyTable = function(r0_8)
    -- line: [178, 187] id: 8
    if type(r0_8) ~= "table" then
      return true
    end
    for r5_8 in pairs(r0_8) do
      return false
    end
    -- close: r1_8
    return true
  end,
  GetShopSubTabId = function(r0_9)
    -- line: [190, 200] id: 9
    local r1_9 = nil
    for r6_9, r7_9 in pairs(DataMgr.ShopItem2ShopSubId.Resource[r0_9] and {}) do
      local r8_9 = r7_9[1]
      if r8_9 then
        r1_9 = r8_9.SubTabId
        break
      else
        break
      end
    end
    -- close: r2_9
    return r1_9
  end,
  GetCoinId = function(r0_10)
    -- line: [203, 210] id: 10
    local r1_10 = r1_0.GetShopSubTabId(r0_10)
    if not r1_10 then
      return 
    end
    return DataMgr.ShopTabSub[r1_10].TabCoin[1]
  end,
  RefreshShopReddot = function()
    -- line: [213, 273] id: 11
    local r0_11 = GWorld:GetAvatar()
    if not r0_11 then
      return 
    end
    local r1_11 = r0_11.RaidSeasons[r0_11.CurrentRaidSeasonId]
    if not r1_11 then
      return 
    end
    local r2_11 = r1_11.EventId
    local r3_11 = ReddotManager.GetLeafNodeCacheDetail(r1_0.ReddotNodeKey)
    if not r3_11[r2_11] then
      return 
    end
    local r4_11 = false
    pcall(function()
      -- line: [231, 258] id: 12
      local r1_12 = tonumber(r0_11:GetResourceNum(r1_0.GetCoinId(r1_11.Shop)) and 0) and 0
      local r2_12 = r1_0.IsPreRaidTime()
      if r2_12 then
        r2_12 = r1_11.MaxPreRaidScore and r1_11.MaxRaidScore
      else
        goto label_23	-- block#6 is visited secondly
      end
      r2_12 = tonumber(r2_12) and 0
      local r3_12 = r1_0.GetShopSubTabId(r1_11.Shop)
      for r8_12, r9_12 in pairs(DataMgr.ShopItem) do
        if r9_12.SubTabId == r3_12 and ShopUtils:GetShopItemCanShow(r8_12) and ShopUtils:GetShopItemPurchaseLimit(r9_12.ItemId) ~= 0 and not r0_11:CheckShopItemUnique(r9_12.ItemId) then
          local r11_12 = tonumber(r9_12.UnlockRaidPoint) and 0
          if (tonumber(r9_12.Price) and 0) <= r1_12 and r11_12 <= r2_12 then
            r4_11 = true
            break
          end
        end
      end
      -- close: r4_12
    end)
    if r4_11 and not r3_11[r2_11][r1_0.ShopCacheKey] then
      r3_11[r2_11][r1_0.ShopCacheKey] = 1
      ReddotManager.IncreaseLeafNodeCount(r1_0.ReddotNodeKey)
    elseif r3_11[r2_11][r1_0.ShopCacheKey] then
      ReddotManager.DecreaseLeafNodeCount(r1_0.ReddotNodeKey)
      r3_11[r2_11][r1_0.ShopCacheKey] = nil
    end
  end,
  RefreshQuestReddot = function(r0_13)
    -- line: [276, 335] id: 13
    local r1_13 = GWorld:GetAvatar()
    if not r1_13 then
      return 
    end
    local r2_13 = r1_13.RaidSeasons[r1_13.CurrentRaidSeasonId]
    if not r2_13 then
      return 
    end
    local r3_13 = r2_13.EventId
    local r4_13 = r1_13.CommonQuestActivity[r3_13]
    if not r4_13 then
      return 
    end
    pcall(function()
      -- line: [293, 334] id: 14
      if not ReddotManager.GetTreeNode(r1_0.ReddotRewardKey) then
        ReddotManager.AddNodeEx(r1_0.ReddotRewardKey)
      end
      if r0_13 then
        ReddotManager.ClearLeafNodeCount(r1_0.ReddotRewardKey)
        ReddotManager._GetLeafNodeCache(r1_0.ReddotRewardKey).Detail = {}
      end
      local r1_14 = ReddotManager.GetLeafNodeCacheDetail(r1_0.ReddotRewardKey)
      for r6_14, r7_14 in pairs(DataMgr.CommonQuestPhase) do
        if r7_14.EventId == r3_13 then
          for r12_14, r13_14 in pairs(DataMgr.CommonQuestDetail) do
            if r13_14.QuestPhaseId == r6_14 then
              local r14_14 = r4_13[r12_14]
              if r14_14 and r14_14.Progress and r14_14.Target and r14_14.Target <= r14_14.Progress and not r14_14.RewardsGot then
                if not r1_14[r6_14] then
                  r1_14[r6_14] = {}
                end
                if not r1_14[r6_14][r12_14] then
                  ReddotManager.IncreaseLeafNodeCount(r1_0.ReddotRewardKey)
                  r1_14[r6_14][r12_14] = 1
                end
              end
            end
          end
          -- close: r8_14
        end
      end
      -- close: r2_14
    end)
  end,
  RefreshEntranceReddot = function()
    -- line: [338, 372] id: 15
    local r0_15 = GWorld:GetAvatar()
    if not r0_15 then
      return 
    end
    local r1_15 = r0_15.RaidSeasons[r0_15.CurrentRaidSeasonId]
    if not r1_15 then
      return 
    end
    local r2_15 = ReddotManager.GetLeafNodeCacheDetail(r1_0.ReddotNodeKey)
    if not r2_15 then
      return 
    end
    pcall(function()
      -- line: [353, 371] id: 16
      local r0_16 = false
      if r1_0.IsPreRaidTime() then
        r0_16 = r1_15.MaxPreRaidScore == 0
      elseif r1_0.IsOfficalRaidTime() then
        r0_16 = r1_15.MaxRaidScore == 0
      end
      local r1_16 = r1_15.EventId
      if r0_16 and r2_15[r1_16][r1_0.EntranceCacheKey] == nil then
        r2_15[r1_16][r1_0.EntranceCacheKey] = 1
        ReddotManager.IncreaseLeafNodeCount(r1_0.ReddotNodeKey)
      elseif r2_15[r1_16][r1_0.EntranceCacheKey] then
        ReddotManager.DecreaseLeafNodeCount(r1_0.ReddotNodeKey)
        r2_15[r1_16][r1_0.EntranceCacheKey] = nil
      end
    end)
  end,
  RefreshRewardGotReddot = function()
    -- line: [375, 411] id: 17
    if r1_0.IsPreRaidTime() then
      return 
    end
    local r0_17 = GWorld:GetAvatar()
    if not r0_17 then
      return 
    end
    local r1_17 = r0_17.RaidSeasons[r0_17.CurrentRaidSeasonId]
    if not r1_17 then
      return 
    end
    local r2_17 = r1_17.EventId
    local r3_17 = ReddotManager.GetLeafNodeCacheDetail(r1_0.ReddotNodeKey)
    if not r3_17[r2_17] then
      return 
    end
    pcall(function()
      -- line: [397, 410] id: 18
      -- notice: unreachable block#3
      local r0_18 = r1_17.PreRaidGroupId
      if r0_18 > 0 then
        r0_18 = not r1_17:IsPreRaidRewardGot()
      else
        r0_18 = false
      end
      if r0_18 and r3_17[r2_17][r1_0.RewardGotCacheKey] == nil then
        r3_17[r2_17][r1_0.RewardGotCacheKey] = 1
        ReddotManager.IncreaseLeafNodeCount(r1_0.ReddotNodeKey)
      elseif r3_17[r2_17][r1_0.RewardGotCacheKey] then
        ReddotManager.DecreaseLeafNodeCount(r1_0.ReddotNodeKey)
        r3_17[r2_17][r1_0.RewardGotCacheKey] = nil
      end
    end)
  end,
}
return r1_0
