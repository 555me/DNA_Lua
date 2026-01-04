-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Client\Entities\Components\TheaterActivity.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {}
local r1_0 = require("BluePrints.UI.WBP.Activity.ActivityReddotHelper")
local r2_0 = require("Blueprints.UI.WBP.Activity.ActivityUtils")
function r0_0.EnterWorld(r0_1)
  -- line: [5, 7] id: 1
  r0_1:RefreshTheaterEventRewardReddot()
end
function r0_0.TheaterGetTaskReward(r0_2, r1_2, r2_2)
  -- line: [10, 19] id: 2
  r0_2.logger.info("TheaterGetTaskReward", r1_2)
  r0_2:CallServer("TheaterGetTaskReward", function(r0_3, r1_3)
    -- line: [12, 17] id: 3
    DebugPrint("TheaterGetTaskReward", ErrorCode:Name(r0_3))
    if r2_2 then
      r2_2(r0_3, r1_3)
    end
  end, r1_2)
end
function r0_0.TheaterGetAllTaskReward(r0_4, r1_4, r2_4)
  -- line: [22, 31] id: 4
  r0_4.logger.info("TheaterGetAllTaskReward", r1_4)
  r0_4:CallServer("TheaterGetAllTaskReward", function(r0_5, r1_5)
    -- line: [24, 29] id: 5
    DebugPrint("TheaterGetAllTaskReward", ErrorCode:Name(r0_5))
    if r2_4 then
      r2_4(r0_5, r1_5)
    end
  end, r1_4)
end
function r0_0.TheaterDonate(r0_6, r1_6, r2_6, r3_6)
  -- line: [34, 43] id: 6
  r0_6.logger.info("TheaterDonate", r1_6, r2_6)
  r0_6:CallServer("TheaterDonate", function(r0_7, r1_7)
    -- line: [36, 41] id: 7
    DebugPrint("TheaterDonate", ErrorCode:Name(r0_7))
    if r3_6 then
      r3_6(r0_7, r1_7)
    end
  end, r1_6, r2_6)
end
function r0_0.TheaterJoinPerformGame(r0_8, r1_8)
  -- line: [46, 55] id: 8
  r0_8.logger.info("TheaterJoinPerformGame")
  r0_8:CallServer("TheaterJoinPerformGame", function(r0_9, r1_9)
    -- line: [48, 53] id: 9
    DebugPrint("TheaterJoinPerformGame", ErrorCode:Name(r0_9))
    if r1_8 then
      r1_8(r0_9, r1_9)
    end
  end)
end
function r0_0.TheaterPerform(r0_10, r1_10, r2_10, r3_10)
  -- line: [58, 67] id: 10
  r0_10.logger.info("TheaterPerform", r1_10, r2_10)
  r0_10:CallServer("TheaterPerform", function(r0_11, r1_11)
    -- line: [60, 65] id: 11
    DebugPrint("TheaterPerform", ErrorCode:Name(r0_11))
    if r3_10 then
      r3_10(r0_11, r1_11)
    end
  end, math.tointeger(r1_10), r2_10)
end
function r0_0.TheaterPerformGameStart(r0_12, r1_12, r2_12)
  -- line: [70, 73] id: 12
  r0_12.logger.info("TheaterPerformGameStart", r1_12, r2_12)
  EventManager:FireEvent(EventID.OnTheaterPerformGameStart, r1_12, r2_12)
end
function r0_0.TheaterPerformGameNotice(r0_13, r1_13)
  -- line: [76, 79] id: 13
  r0_13.logger.info("TheaterPerformGameNotice", r1_13)
  EventManager:FireEvent(EventID.OnTheaterPerformGameNotice, r1_13)
end
function r0_0.TheaterPerformGameEnd(r0_14, r1_14)
  -- line: [82, 85] id: 14
  r0_14.logger.info("TheaterPerformGameEnd", r1_14)
end
function r0_0.TheaterPerformStateGet(r0_15, r1_15)
  -- line: [87, 96] id: 15
  r0_15.logger.info("TheaterPerformStateGet")
  r0_15:CallServer("TheaterPerformStateGet", function(r0_16, r1_16)
    -- line: [89, 94] id: 16
    DebugPrint("TheaterPerformStateGet", ErrorCode:Name(r0_16))
    if r1_15 then
      r1_15(r0_16, r1_16)
    end
  end)
end
function r0_0.TheaterDonationGet(r0_17, r1_17)
  -- line: [99, 108] id: 17
  r0_17.logger.info("TheaterDonationGet")
  r0_17:CallServer("TheaterDonationGet", function(r0_18, r1_18)
    -- line: [101, 106] id: 18
    DebugPrint("TheaterDonationGet", ErrorCode:Name(r0_18))
    if r1_17 then
      r1_17(r0_18, r1_18)
    end
  end)
end
function r0_0._OnPropChangeTheaterActivity(r0_19, r1_19)
  -- line: [110, 112] id: 19
  r0_19:RefreshTheaterEventRewardReddot()
end
function r0_0.RefreshTheaterEventRewardReddot(r0_20)
  -- line: [114, 152] id: 20
  local r1_20 = {
    false,
    false
  }
  local r2_20 = DataMgr.TheaterTask
  local r3_20 = DataMgr.TheaterConstant.EventId.ConstantValue
  local r4_20 = r0_20.TheaterActivity
  if r4_20 then
    r4_20 = r0_20.TheaterActivity[r3_20] and nil
  else
    goto label_18	-- block#2 is visited secondly
  end
  if not r4_20 then
    return 
  end
  local r5_20 = ReddotManager.GetLeafNodeCacheDetail("TheaterEventReward") and {}
  local r6_20 = true
  local r7_20 = ReddotManager.GetTreeNode("TheaterEventReward")
  for r12_20, r13_20 in pairs(r4_20.Tasks) do
    local r15_20 = r13_20.Target
    if r15_20 <= r13_20.Progress and not r13_20.RewardsGot then
      r6_20 = false
      if not r7_20 then
        ReddotManager.AddNode("TheaterEventReward")
      end
      if r2_20[r12_20].IsDaily then
        r15_20 = 1 and 2
      else
        goto label_61	-- block#14 is visited secondly
      end
      ReddotManager.GetLeafNodeCacheDetail("TheaterEventReward")[r15_20] = true
      r1_20[r15_20] = true
    end
  end
  -- close: r8_20
  for r11_20 = 1, #r1_20, 1 do
    r5_20[r11_20] = r1_20[r11_20]
  end
  if not r6_20 then
    r1_0.TryAddReddotCount(r2_0, r3_20, "Red")
  else
    r1_0.TrySubReddotCount(r2_0, r3_20, "Red")
  end
  if r7_20 then
    ReddotManager.IncreaseLeafNodeCount("TheaterEventReward", 1)
  end
end
function r0_0.TheaterPerformGameReward(r0_21, r1_21)
  -- line: [155, 179] id: 21
  r0_21.logger.info("TheaterPerformGameReward")
  local r2_21 = {}
  for r8_21, r9_21 in pairs(DataMgr.RewardType) do
    local r10_21 = r1_21[r8_21 .. "s"]
    if not IsEmptyTable(r10_21) then
      for r15_21, r16_21 in pairs(r10_21) do
        local r17_21 = r15_21
        table.insert(r2_21, {
          ItemType = r8_21,
          ItemId = r17_21,
          Count = r16_21["1"],
          Rarity = ItemUtils.GetItemRarity(r17_21, r8_21),
        })
      end
      -- close: r11_21
    end
  end
  -- close: r4_21
  UIUtils.ShowHudReward(GText("UI_COMMON_REWARD"), r2_21)
end
return r0_0
