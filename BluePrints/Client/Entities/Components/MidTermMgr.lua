local r0_0 = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local r1_0 = {}
local r2_0 = "JJGameTask_Normal_Reddot"
local r3_0 = "JJGameTask_Challenge_Reddot"
local r4_0 = DataMgr.MidTermGoalConstant.MidTermGoalEventId.ConstantValue
local r5_0 = {
  Daily = {
    1,
    2
  },
  Cycle = 3,
  Achievement = 4,
}
function r1_0.MidTermGetScoresRewards(r0_1, r1_1)
  -- line: [12, 21] id: 1
  r0_1.logger.info("MidTermGetScoresRewards")
  r0_1:CallServer("MidTermGetScoresRewards", function(r0_2, r1_2)
    -- line: [14, 19] id: 2
    DebugPrint("MidTermGetScoresRewards", ErrorCode:Name(r0_2))
    if r1_1 then
      r1_1(r0_2, r1_2)
    end
  end)
end
function r1_0.MidTermGetAllAchvScores(r0_3, r1_3)
  -- line: [23, 32] id: 3
  r0_3.logger.info("MidTermGetAllAchvScores")
  r0_3:CallServer("MidTermGetAllAchvScores", function(r0_4, r1_4)
    -- line: [25, 30] id: 4
    DebugPrint("MidTermGetAllAchvScores", ErrorCode:Name(r0_4))
    if r1_3 then
      r1_3(r0_4, r1_4)
    end
  end)
end
function r1_0.MidTermGetAllNormalScores(r0_5, r1_5)
  -- line: [34, 43] id: 5
  r0_5.logger.info("MidTermGetAllNormalScores")
  r0_5:CallServer("MidTermGetAllNormalScores", function(r0_6, r1_6)
    -- line: [36, 41] id: 6
    DebugPrint("MidTermGetAllNormalScores", ErrorCode:Name(r0_6))
    if r1_5 then
      r1_5(r0_6, r1_6)
    end
  end)
end
function r1_0.MidTermGetProgressReward(r0_7, r1_7)
  -- line: [45, 54] id: 7
  r0_7.logger.info("MidTermGetProgressReward")
  r0_7:CallServer("MidTermGetProgressReward", function(r0_8, r1_8)
    -- line: [47, 52] id: 8
    DebugPrint("MidTermGetProgressReward", ErrorCode:Name(r0_8))
    if r1_7 then
      r1_7(r0_8, r1_8)
    end
  end)
end
function r1_0.MidTermGetTaskReward(r0_9, r1_9, r2_9)
  -- line: [56, 65] id: 9
  r0_9.logger.info("MidTermGetTaskReward", r1_9)
  r0_9:CallServer("MidTermGetTaskReward", function(r0_10)
    -- line: [58, 63] id: 10
    DebugPrint("MidTermGetTaskReward", ErrorCode:Name(r0_10))
    if r2_9 then
      r2_9(r0_10)
    end
  end, r1_9)
end
function r1_0.NotifyMidTermTaskComplete(r0_11, r1_11)
  -- line: [67, 72] id: 11
  r0_11.logger.info("NotifyMidTermTaskComplete", r1_11)
  EventManager:FireEvent(EventID.OnMidTermTaskComplete, r1_11)
  r0_11:UpdateJJGameReddot(r1_11)
end
function r1_0.NotifyMidTermTaskProgressChange(r0_12, r1_12, r2_12)
  -- line: [74, 77] id: 12
  r0_12.logger.info("NotifyMidTermTaskProgressChange", r1_12, r2_12)
  EventManager:FireEvent(EventID.OnMidTermTaskProgressChange, r1_12, r2_12)
end
function r1_0.UpdateJJGameReddot(r0_13, r1_13)
  -- line: [79, 105] id: 13
  if not r0_0.CheckEventIsOpen(r4_0, nil, true) then
    return 
  end
  local r2_13 = r0_13.MidTermTasks[r1_13]
  if r2_13 then
    local r3_13 = DataMgr.MidTermTask[r2_13.UniqueID]
    if r3_13 and r3_13.TaskType == r5_0.Achievement and r3_13.EnableDay <= TimeUtils.GetIntervalDay(DataMgr.EventMain[DataMgr.MidTermGoalConstant.MidTermGoalEventId.ConstantValue].EventStartTime, TimeUtils.NowTime()) + 1 then
      r0_13:TryIncreaceChallengeTaskRewardReddot(r1_13)
    elseif TimeUtils.NowTime() < DataMgr.EventMain[r4_0].EventEndTime then
      r0_13:TryIncreaceNormalRewardReddot(r1_13)
    end
  end
end
function r1_0.TryIncreaceChallengeTaskRewardReddot(r0_14, r1_14)
  -- line: [107, 114] id: 14
  local r2_14 = r3_0 .. r1_14
  local r3_14 = ReddotManager.GetLeafNodeCacheDetail(r3_0)
  if r3_14 and r3_14[r2_14] == nil then
    r3_14[r2_14] = true
    ReddotManager.IncreaseLeafNodeCount(r3_0)
  end
end
function r1_0.TryIncreaceNormalRewardReddot(r0_15, r1_15)
  -- line: [116, 123] id: 15
  local r2_15 = r2_0 .. r1_15
  local r3_15 = ReddotManager.GetLeafNodeCacheDetail(r2_0)
  if r3_15 and r3_15[r2_15] == nil then
    r3_15[r2_15] = true
    ReddotManager.IncreaseLeafNodeCount(r2_0)
  end
end
return r1_0
