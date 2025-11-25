-- filename: @E:/Pack/Branch/OBT10_Geili\Content/Script/BluePrints\UI\WBP\ActivityJJGame\WBP_Activity_JJGame_NormalTask_Base_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("EMCache.EMCache")
local r1_0 = "JJGameTask_Normal_Reddot"
local r2_0 = "JJGameTask_Normal_New"
local r3_0 = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})
local r4_0 = {
  Daily = {
    1,
    2
  },
  Cycle = 3,
  Achievement = 4,
}
function r3_0.Construct(r0_1)
  -- line: [23, 65] id: 1
  r0_1.MidTermConst = DataMgr.MidTermGoalConstant
  r0_1.Text_TaskScoreTodayTitle:SetText(GText("UI_Event_MidTerm_PointView"))
  r0_1.Text_NeedScore:SetText(GText("UI_Event_MidTerm_NoPoint"))
  r0_1.Text_NextDay:SetText(GText("UI_Event_MidTerm_Prize"))
  r0_1.Text_GetBigReward:SetText(GText("UI_Event_MidTerm_GetPrize"))
  r0_1.Text_TaskScoreToday_Total:SetText(r0_1.MidTermConst.MaxPrizePoint.ConstantValue)
  r0_1.Text_NextDay:SetText(GText("UI_Event_MidTerm_Prize"))
  r0_1.Text_NeedScore:SetText(GText("UI_Event_MidTerm_NoPoint"))
  r0_1.Text_BottomOneClickTitle:SetText(GText("UI_Event_MidTerm_Overflow"))
  r0_1.Text_Empty:SetText(GText("UI_Event_MidTerm_End"))
  r0_1.Btn_OneClickGet.Text_GetReward:SetText(GText("UI_CTL_ClaimALL"))
  r0_1.Btn_OneClickGet.Btn_GetReward.OnClicked:Add(r0_1, r0_1.GetAllTaskScores)
  r0_1.Btn_GetBigReward.OnClicked:Add(r0_1, r0_1.GetBigReward)
  r0_1.TaskScroll:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_1.CurFocusTask = nil
  r0_1:InitListenEvent()
  r0_1:RefreshBaseInfo()
  r0_1.Key_GetBigReward:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "X",
      }
    },
  })
  r0_1.Btn_OneClickGet.Key_GetReward:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "Y",
      }
    },
  })
  r0_1.Key_Title:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "LS",
      }
    },
  })
end
function r3_0.Destruct(r0_2)
  -- line: [67, 73] id: 2
  r0_2.Btn_GetBigReward.OnClicked:Clear()
  r0_2.Btn_OneClickGet.Btn_GetReward.OnClicked:Clear()
  r0_2:UnbindFromAnimationFinished(r0_2.Percent, {
    r0_2,
    function()
      -- line: [70, 72] id: 3
      r0_2:PlayAnimation(r0_2.Percent_VX)
    end
  })
end
function r3_0.Init(r0_4, r1_4)
  -- line: [75, 131] id: 4
  r0_4.Params = r1_4
  r0_4.Owner = r1_4.Owner
  r0_4.EventDay = r1_4.EventDay
  r0_4.EventEndTime = r1_4.EventEndTime
  r0_4._Avatar = GWorld:GetAvatar()
  r0_4.MidTermTask = r0_4._Avatar.MidTermTasks
  r0_4.MidTermTasksRecord = r0_4._Avatar.MidTermTasksRecord
  r0_4.MidTermAchvProgressRewarded = r0_4._Avatar.MidTermAchvProgressRewarded
  r0_4.MidTermScores = r0_4._Avatar.MidTermScores
  r0_4.MidTermScoresRewards = r0_4._Avatar.MidTermScoresRewards
  r0_4.MidTermGoalEventId = r0_4.MidTermConst.MidTermGoalEventId.ConstantValue
  r0_4.RewardEndTime = DataMgr.EventMain[r0_4.MidTermGoalEventId].RewardEndTime
  if CommonUtils.Size(r0_4.MidTermScoresRewards) > 0 then
    r0_4.Group_Score:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_4.Group_Progress:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_4:TryIncreaceNormalRewardReddot("ScoresRewards")
    if r0_4.EventEndTime < TimeUtils.NowTime() then
      r0_4.Text_BigRewardTitle:SetText(GText("UI_Event_MidTerm_Settled_End"))
    else
      r0_4.Text_BigRewardTitle:SetText(GText("UI_Event_MidTerm_Settled"))
    end
    r0_4.YesterdayRewardGot = false
    r0_4:InitYesterdayRewardList()
    r0_4.Btn_OneClickGet.Btn_GetReward:SetForbidden(true)
    r0_4.Btn_OneClickGet.Key_GetReward:SetForbidKey(true)
    r0_4:PlayAnimation(r0_4.VX_Reminder)
  else
    r0_4.Group_Score:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r0_4.Group_Progress:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r0_4.Text_BigRewardTitle:SetText(GText("UI_Event_MidTerm_NormalPreview"))
    r0_4.YesterdayRewardGot = true
    r0_4.Btn_OneClickGet.Btn_GetReward:SetForbidden(false)
    r0_4.Btn_OneClickGet.Key_GetReward:SetForbidKey(false)
  end
  r0_4:UpdateTaskScoreToday(r0_4.MidTermScores)
  r0_4:InitTaskList()
  r0_4:PlayAnimation(r0_4.In)
  if r0_4.EventEndTime < TimeUtils.NowTime() then
    r0_4:TryClearNormalTaskRewardReddot()
    r0_4.WS_Right:SetActiveWidgetIndex(1)
    if r0_4.YesterdayRewardGot or r0_4.RewardEndTime < TimeUtils.NowTime() then
      r0_4:TryClearNormalRewardReddot()
      r0_4.WS_Btn:SetActiveWidgetIndex(1)
      r0_4.Text_NeedScore:SetText(GText("UI_Event_MidTerm_PrizeEnd"))
      for r6_4, r7_4 in pairs(r0_4.List_BigReward:GetListItems()) do
        r7_4.bShadow = true
        r7_4.BonusType = nil
      end
      -- close: r2_4
      r0_4.List_BigReward:RegenerateAllEntries()
    end
  end
  r0_4:SetFocus()
end
function r3_0.TryIncreaceNormalRewardReddot(r0_5, r1_5)
  -- line: [133, 140] id: 5
  local r2_5 = r1_0 .. r1_5
  local r3_5 = ReddotManager.GetLeafNodeCacheDetail(r1_0)
  if r3_5 and r3_5[r2_5] == nil then
    r3_5[r2_5] = true
    ReddotManager.IncreaseLeafNodeCount(r1_0)
  end
end
function r3_0.TrySubNormalRewardReddot(r0_6, r1_6)
  -- line: [142, 149] id: 6
  local r2_6 = r1_0 .. r1_6
  local r3_6 = ReddotManager.GetLeafNodeCacheDetail(r1_0)
  if r3_6 and r3_6[r2_6] then
    r3_6[r2_6] = nil
    ReddotManager.DecreaseLeafNodeCount(r1_0)
  end
end
function r3_0.TryClearNormalRewardReddot(r0_7)
  -- line: [151, 159] id: 7
  local r1_7 = ReddotManager.GetLeafNodeCacheDetail(r1_0)
  if r1_7 then
    for r6_7, r7_7 in pairs(r1_7) do
      r1_7[r6_7] = nil
    end
    -- close: r2_7
  end
  ReddotManager.ClearLeafNodeCount(r1_0)
end
function r3_0.TryClearNormalTaskRewardReddot(r0_8)
  -- line: [161, 181] id: 8
  local r1_8 = ReddotManager.GetLeafNodeCacheDetail(r1_0)
  if r1_8 then
    for r6_8, r7_8 in pairs(r0_8._Avatar.MidTermTasks) do
      local r8_8 = DataMgr.MidTermTask[r7_8.UniqueID]
      if not r8_8 then
        Utils.ScreenPrint("MidTermTask表中不存在UniqueID为" .. r7_8.UniqueID .. "的任务，请检查配置")
      elseif r8_8.TaskType ~= r4_0.Achievement then
        local r9_8 = r1_0 .. r7_8.UniqueID
        if r1_8[r9_8] then
          r1_8[r9_8] = nil
          ReddotManager.DecreaseLeafNodeCount(r1_0)
        end
      end
    end
    -- close: r2_8
  end
end
function r3_0.TrySubNormalTaskNewReddot(r0_9, r1_9)
  -- line: [183, 190] id: 9
  local r2_9 = r1_9
  local r3_9 = ReddotManager.GetLeafNodeCacheDetail(r2_0)
  if r3_9 and r3_9[r2_9] then
    r3_9[r2_9] = false
    ReddotManager.DecreaseLeafNodeCount(r2_0)
  end
end
function r3_0.UpdateTaskScoreToday(r0_10, r1_10)
  -- line: [192, 245] id: 10
  local r2_10 = r0_10._Avatar.MidTermScores
  r0_10.Text_TaskScoreToday:SetText(r2_10)
  if IsValid(r0_10.Owner.Owner) then
    r0_10.Owner.Owner.Text_TaskScoreToday:SetText(r2_10)
  end
  local r3_10 = r0_10.MidTermConst.MaxPrizePoint.ConstantValue
  local r4_10 = r0_10.previousProgressPercent and 0
  local r5_10 = false
  if r4_10 * r3_10 < r3_10 and r3_10 < r2_10 then
    r5_10 = true
  end
  if r2_10 <= r3_10 or r5_10 then
    local r6_10 = r0_10.previousProgressPercent
    if not r6_10 then
      r0_10.previousProgressPercent = 0
    end
    if r5_10 then
      r6_10 = r3_10 and r2_10
    else
      goto label_45	-- block#13 is visited secondly
    end
    local r7_10 = math.max(0, math.min(1, r6_10 / r3_10))
    local r8_10 = r0_10.previousProgressPercent * r0_10.Percent:GetEndTime()
    local r9_10 = r7_10 * r0_10.Percent:GetEndTime()
    if r9_10 == 0 then
      r9_10 = 0.001
    end
    if r9_10 <= r8_10 then
      r8_10 = r9_10 - 0.001
    end
    r0_10:PlayAnimationTimeRange(r0_10.Percent, r8_10, r9_10)
    if r5_10 then
      r0_10:BindToAnimationFinished(r0_10.Percent, {
        r0_10,
        function()
          -- line: [222, 228] id: 11
          r0_10:PlayAnimation(r0_10.Percent_VX)
          r0_10.previousProgressPercent = 1
          r0_10:AddTimer(0.1, function()
            -- line: [225, 227] id: 12
            r0_10:UpdateTaskScoreToday(r2_10)
          end)
        end
      })
    else
      r0_10:BindToAnimationFinished(r0_10.Percent, {
        r0_10,
        function()
          -- line: [230, 232] id: 13
          r0_10:PlayAnimation(r0_10.Percent_VX)
        end
      })
    end
    if not r5_10 then
      r0_10.previousProgressPercent = r7_10
    end
  end
  if r0_10.YesterdayRewardGot then
    r0_10:UpdateRewardList(r2_10)
  end
  r0_10:UpdateBtnState(r2_10)
end
function r3_0.InitTaskList(r0_14)
  -- line: [247, 251] id: 14
  r0_14:UpdateNormalTaskList()
  r0_14:UpdateCycleTaskList()
  r0_14:UpdateOneClickBtnState()
end
function r3_0.UpdateNormalTaskList(r0_15)
  -- line: [253, 261] id: 15
  r0_15.NormalItem:Init({
    Name = "UI_Event_MidTerm_DailyTask",
    TaskType = r4_0.Daily,
    YesterdayRewardGot = r0_15.YesterdayRewardGot,
    Owner = r0_15,
  })
end
function r3_0.UpdateCycleTaskList(r0_16)
  -- line: [263, 272] id: 16
  r0_16.CycleItem:Init({
    Name = "UI_Event_MidTerm_RepeatTask",
    MidTermTasksRecord = r0_16.MidTermTasksRecord,
    TaskType = r4_0.Cycle,
    YesterdayRewardGot = r0_16.YesterdayRewardGot,
    Owner = r0_16,
  })
end
function r3_0.InitYesterdayRewardList(r0_17)
  -- line: [274, 285] id: 17
  r0_17.List_BigReward:ClearListItems()
  for r5_17, r6_17 in pairs(r0_17.MidTermScoresRewards) do
    local r7_17 = DataMgr.Reward[r5_17]
    for r12_17, r13_17 in ipairs(r7_17.Id) do
      r0_17.List_BigReward:AddItem(r0_17:NewItemContent(r7_17.Type[1], r13_17, ItemUtils.GetItemIconPath(r13_17, CommonConst.ItemType.Resource), DataMgr.Resource[r13_17].Rarity and 1, r7_17.Count[r12_17][1] * r6_17))
    end
    -- close: r8_17
  end
  -- close: r1_17
end
function r3_0.UpdateRewardList(r0_18, r1_18)
  -- line: [287, 336] id: 18
  r0_18.List_BigReward:ClearListItems()
  local r2_18 = {}
  if r1_18 <= r0_18.MidTermConst.MaxPrizePoint.ConstantValue then
    local r4_18 = r1_18 / r0_18.MidTermConst.MaxPrizePoint.ConstantValue
    local r5_18 = DataMgr.Reward[r0_18.MidTermConst.BaseRewardId.ConstantValue]
    for r10_18, r11_18 in ipairs(r5_18.Id) do
      table.insert(r2_18, r0_18:NewItemContent(r5_18.Type[1], r11_18, ItemUtils.GetItemIconPath(r11_18, CommonConst.ItemType.Resource), DataMgr.Resource[r11_18].Rarity and 1, r5_18.Count[r10_18][1] * r4_18))
    end
    -- close: r6_18
  else
    local r3_18 = r0_18.MidTermConst.MaxPrizePoint.ConstantValue
    local r5_18 = (r1_18 - r3_18) / r3_18
    local r7_18 = DataMgr.Reward[r0_18.MidTermConst.OFRewardId.ConstantValue]
    for r12_18, r13_18 in ipairs(r7_18.Id) do
      local r16_18 = r0_18:NewItemContent(r7_18.Type[1], r13_18, ItemUtils.GetItemIconPath(r13_18, CommonConst.ItemType.Resource), DataMgr.Resource[r13_18].Rarity and 1, r7_18.Count[r12_18][1] * r5_18)
      r16_18.BonusType = 1
      table.insert(r2_18, r16_18)
    end
    -- close: r8_18
    local r9_18 = DataMgr.Reward[r0_18.MidTermConst.BaseRewardId.ConstantValue]
    for r14_18, r15_18 in ipairs(r9_18.Id) do
      table.insert(r2_18, r0_18:NewItemContent(r9_18.Type[1], r15_18, ItemUtils.GetItemIconPath(r15_18, CommonConst.ItemType.Resource), DataMgr.Resource[r15_18].Rarity and 1, r9_18.Count[r14_18][1]))
    end
    -- close: r10_18
  end
  for r7_18, r8_18 in ipairs(r2_18) do
    r0_18.List_BigReward:AddItem(r8_18)
  end
  -- close: r3_18
end
function r3_0.UpdateBtnState(r0_19, r1_19)
  -- line: [338, 353] id: 19
  if not r0_19.YesterdayRewardGot then
    r0_19.WS_Btn:SetActiveWidgetIndex(0)
    return 
  end
  if r1_19 == 0 then
    r0_19.WS_Btn:SetActiveWidgetIndex(1)
  elseif r0_19.NeedTorrow then
    r0_19.WS_Btn:SetActiveWidgetIndex(2)
  else
    r0_19.WS_Btn:SetActiveWidgetIndex(3)
  end
end
function r3_0.UpdateOneClickBtnState(r0_20)
  -- line: [355, 418] id: 20
  local r1_20 = false
  local function r2_20(r0_21)
    -- line: [358, 372] id: 21
    -- notice: unreachable block#10
    if not r0_21 or not r0_21.TaskProp or not r0_21.TaskConfig then
      return false
    end
    local r1_21 = r0_21.TaskProp
    local r2_21 = r0_21.TaskConfig.TaskType
    if type(r4_0.Daily) == "table" and (r2_21 == r4_0.Daily[1] or r2_21 == r4_0.Daily[2]) then
      local r3_21 = r1_21.Progress
      if r1_21.Target <= r3_21 then
        r3_21 = not r1_21.RewardsGot
      else
        r3_21 = false
      end
      return r3_21
    end
    if r2_21 == r4_0.Cycle then
      local r3_21 = r0_20._Avatar and r0_20._Avatar.MidTermTasksRecord and r0_20._Avatar.MidTermTasksRecord[r1_21.UniqueID]
      return r3_21 and r3_21.FinishCount and r3_21.FinishCount > 0
    end
    return false
  end
  if r0_20.NormalItem and r0_20.NormalItem.TaskContentList then
    for r7_20, r8_20 in pairs(r0_20.NormalItem.TaskContentList) do
      if r2_20(r8_20) then
        r1_20 = true
        break
      end
    end
    -- close: r3_20
  end
  if not r1_20 and r0_20.CycleItem and r0_20.CycleItem.TaskContentList then
    for r7_20, r8_20 in pairs(r0_20.CycleItem.TaskContentList) do
      if r2_20(r8_20) then
        r1_20 = true
        break
      end
    end
    -- close: r3_20
  end
  if r0_20.EventEndTime < TimeUtils.NowTime() then
    r1_20 = false
  end
  if r1_20 then
    if r0_20.YesterdayRewardGot then
      r0_20.Btn_OneClickGet.Btn_GetReward:SetForbidden(false)
      r0_20.Btn_OneClickGet.Key_GetReward:SetForbidKey(false)
    end
    if CommonUtils.GetDeviceTypeByPlatformName() ~= "Mobile" then
      r0_20.Owner.Com_Tab:UpdateBottomKeyInfo({
        {
          KeyInfoList = {
            {
              Type = "Text",
              Text = "SpaceBar",
              ClickCallback = r0_20.GetAllTaskScores,
              Owner = r0_20,
            }
          },
          GamePadInfoList = {
            {
              Type = "Img",
              ImgShortPath = "Y",
              ClickCallback = r0_20.GetAllTaskScores,
            }
          },
          Desc = GText("UI_CTL_ClaimALL"),
          bLongPress = false,
        },
        {
          KeyInfoList = {
            {
              Type = "Text",
              Text = "Escape",
              ClickCallback = r0_20.CloseSelf,
              Owner = r0_20,
            }
          },
          GamePadInfoList = {
            {
              Type = "Img",
              ImgShortPath = "B",
              ClickCallback = r0_20.CloseSelf,
            }
          },
          Desc = GText("UI_BACK"),
          bLongPress = false,
        }
      })
    end
  else
    r0_20.Btn_OneClickGet.Btn_GetReward:SetForbidden(true)
    r0_20.Btn_OneClickGet.Key_GetReward:SetForbidKey(true)
    if CommonUtils.GetDeviceTypeByPlatformName() ~= "Mobile" then
      r0_20.Owner.Com_Tab:UpdateBottomKeyInfo({
        {
          KeyInfoList = {
            {
              Type = "Text",
              Text = "Escape",
              ClickCallback = r0_20.CloseSelf,
              Owner = r0_20,
            }
          },
          GamePadInfoList = {
            {
              Type = "Img",
              ImgShortPath = "B",
              ClickCallback = r0_20.CloseSelf,
            }
          },
          Desc = GText("UI_BACK"),
          bLongPress = false,
        }
      })
    end
  end
end
function r3_0.GetBigReward(r0_22)
  -- line: [421, 438] id: 22
  AudioManager(r0_22):PlayUISound(r0_22, "event:/ui/activity/wenmingboyi_all_btn_click", nil, nil)
  local function r1_22(r0_23, r1_23)
    -- line: [423, 435] id: 23
    DebugPrint("GetBigReward", ErrorCode:Name(r0_23))
    if r0_23 == ErrorCode.RET_SUCCESS then
      r0_22.YesterdayRewardGot = true
      r0_22:UpdateTaskScoreToday(r0_22._Avatar.MidTermScores)
      r0_22:TrySubNormalRewardReddot("ScoresRewards")
      UIManager(GWorld.GameInstance):LoadUI(UIConst.LoadInConfig, "GetItemPage", nil, nil, nil, nil, r1_23, r0_22.OnGetItemPageClosed, r0_22)
    else
      UIManager(r0_22):ShowUITip(UIConst.Tip_CommonToast, GText(DataMgr.ErrorCode[r0_23].ErrorCodeContent))
    end
    r0_22.Owner:BlockAllUIInput(false)
  end
  r0_22.Owner:BlockAllUIInput(true)
  r0_22._Avatar:MidTermGetScoresRewards(r1_22)
end
function r3_0.OnGetItemPageClosed(r0_24)
  -- line: [440, 462] id: 24
  local r1_24 = r0_24.CurFocusTask and r0_24.NormalItem.List_Task:GetItemAt(0) and r0_24.CycleItem.List_Task:GetItemAt(0)
  if r1_24.TaskType == r4_0.Cycle then
    r0_24.CycleItem.List_Task:BP_NavigateToItem(r1_24)
  else
    r0_24.NormalItem.List_Task:BP_NavigateToItem(r1_24)
  end
  r0_24.Group_Score:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_24.Group_Progress:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_24:InitTaskList()
  if r0_24.EventEndTime < TimeUtils.NowTime() then
    r0_24:TryClearNormalRewardReddot()
    r0_24.WS_Btn:SetActiveWidgetIndex(1)
    r0_24.Text_NeedScore:SetText(GText("UI_Event_MidTerm_PrizeEnd"))
    for r6_24, r7_24 in pairs(r0_24.List_BigReward:GetListItems()) do
      r7_24.bShadow = true
      r7_24.BonusType = nil
    end
    -- close: r2_24
    r0_24.List_BigReward:RegenerateAllEntries()
  end
end
function r3_0.GetAllTaskScores(r0_25)
  -- line: [464, 486] id: 25
  if r0_25.EventEndTime < TimeUtils.NowTime() then
    return 
  end
  if r0_25.Btn_OneClickGet.Btn_GetReward:GetForbidden() then
    return 
  end
  AudioManager(r0_25):PlayUISound(r0_25, "event:/ui/activity/wenmingboyi_all_btn_click", nil, nil)
  local function r1_25(r0_26, r1_26)
    -- line: [468, 483] id: 26
    DebugPrint("GetAllTaskScores", ErrorCode:Name(r0_26))
    if r0_26 == ErrorCode.RET_SUCCESS then
      r0_25:UpdateNormalTaskList()
      r0_25:UpdateCycleTaskList()
      r0_25:UpdateTaskScoreToday(r0_25._Avatar.MidTermScores)
      r0_25:UpdateOneClickBtnState()
      r0_25:TryClearNormalTaskRewardReddot()
      r0_25:PlayAnimation(r0_25.Up)
      AudioManager(r0_25):PlayUISound(r0_25, "event:/ui/activity/wenmingboyi_jiaojiao_score_add", nil, nil)
    end
    r0_25.Owner:BlockAllUIInput(false)
  end
  r0_25.Owner:BlockAllUIInput(true)
  r0_25._Avatar:MidTermGetAllNormalScores(r1_25)
end
function r3_0.NewItemContent(r0_27, r1_27, r2_27, r3_27, r4_27, r5_27, r6_27, r7_27)
  -- line: [490, 502] id: 27
  local r8_27 = NewObject(UIUtils.GetCommonItemContentClass())
  r8_27.ItemType = r1_27
  r8_27.ItemId = r2_27
  r8_27.UnitId = r2_27
  r8_27.Rarity = r4_27
  r8_27.Icon = r3_27
  r8_27.IsShowDetails = true
  r8_27.OnMenuOpenChangedEvents = {
    Obj = r0_27,
    Callback = r7_27,
  }
  r8_27.UIName = "ActivityJJGameNormalTask"
  r8_27.Count = r5_27
  return r8_27
end
function r3_0.OnAchvFinished(r0_28, r1_28)
  -- line: [504, 514] id: 28
  if r0_28.NormalItem and r0_28.NormalItem.OnAchvFinished then
    r0_28.NormalItem:OnAchvFinished(r1_28)
  end
  if r0_28.CycleItem and r0_28.CycleItem.OnAchvFinished then
    r0_28.CycleItem:OnAchvFinished(r1_28)
  end
  r0_28:UpdateOneClickBtnState()
  r0_28:TryIncreaceNormalRewardReddot(r1_28)
end
function r3_0.OnMidTermTaskProgressChange(r0_29, r1_29, r2_29)
  -- line: [516, 525] id: 29
  if r0_29.NormalItem and r0_29.NormalItem.OnMidTermTaskProgressChange then
    r0_29.NormalItem:OnMidTermTaskProgressChange(r1_29, r2_29)
  end
  if r0_29.CycleItem and r0_29.CycleItem.OnMidTermTaskProgressChange then
    r0_29.CycleItem:OnMidTermTaskProgressChange(r1_29, r2_29)
  end
  r0_29:UpdateOneClickBtnState()
end
function r3_0.OnTaskGet(r0_30, r1_30)
  -- line: [527, 547] id: 30
  r1_30.Content.CanGet = false
  if r1_30.Content.TaskType == r4_0.Cycle then
    r1_30.WS_Btn:SetActiveWidgetIndex(1)
    r1_30:UpdateInfinityNum(r0_30._Avatar.MidTermTasksRecord[r1_30.TaskId].FinishCount)
  else
    r1_30.WS_Btn:SetActiveWidgetIndex(3)
    r1_30:PlayAnimation(r1_30.In_Got)
  end
  r0_30:UpdateTaskScoreToday(r0_30._Avatar.MidTermScores)
  r0_30:UpdateOneClickBtnState()
  r0_30:TrySubNormalRewardReddot(r1_30.TaskProp.UniqueID)
  r0_30:TrySubNormalTaskNewReddot(r1_30.TaskProp.UniqueID)
  r1_30.New:SetVisibility(UIConst.VisibilityOp.Hidden)
  r0_30:AddTimer(0.1, function()
    -- line: [543, 546] id: 31
    AudioManager(r0_30):PlayUISound(r0_30, "event:/ui/activity/wenmingboyi_jiaojiao_score_add", nil, nil)
    r0_30:PlayAnimation(r0_30.Up)
  end)
end
function r3_0.InitListenEvent(r0_32)
  -- line: [550, 557] id: 32
  r0_32.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(r0_32:GetOwningPlayer())
  if IsValid(r0_32.GameInputModeSubsystem) then
    r0_32.GameInputModeSubsystem.OnInputMethodChanged:Add(r0_32, r0_32.RefreshOpInfoByInputDevice)
  end
  r0_32:InitNavigationRules()
end
function r3_0.RefreshBaseInfo(r0_33)
  -- line: [559, 563] id: 33
  if IsValid(r0_33.GameInputModeSubsystem) then
    r0_33:RefreshOpInfoByInputDevice(r0_33.GameInputModeSubsystem:GetCurrentInputType(), r0_33.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end
function r3_0.RefreshOpInfoByInputDevice(r0_34, r1_34, r2_34)
  -- line: [565, 583] id: 34
  r0_34.CurGamepadName = r2_34
  if r1_34 == ECommonInputType.Gamepad then
    r0_34.Key_GetBigReward:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r0_34.Btn_OneClickGet.Key_GetReward:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r0_34.Key_Title:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    r0_34.Key_GetBigReward:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_34.Btn_OneClickGet.Key_GetReward:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_34.Key_Title:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  r0_34.CurInputDevice = r1_34
end
function r3_0.InitNavigationRules(r0_35)
  -- line: [585, 594] id: 35
  r0_35.NormalItem:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  r0_35.NormalItem:SetNavigationRuleExplicit(EUINavigation.Down, r0_35.CycleItem)
  r0_35.CycleItem:SetNavigationRuleExplicit(EUINavigation.Up, r0_35.NormalItem)
  r0_35.CycleItem:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  r0_35.CycleItem:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  r0_35.List_BigReward:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  r0_35.List_BigReward:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
end
function r3_0.BP_GetDesiredFocusTarget(r0_36)
  -- line: [596, 606] id: 36
  if r0_36.CurFocusTask ~= nil then
    return r0_36.CurFocusTask.SelfWidget
  elseif r0_36.NormalItem.List_Task:GetItemAt(0) then
    return r0_36.NormalItem.List_Task:GetItemAt(0).SelfWidget
  elseif r0_36.CycleItem.List_Task:GetItemAt(0) then
    return r0_36.CycleItem.List_Task:GetItemAt(0).SelfWidget
  else
    return nil
  end
end
function r3_0.OnKeyDown(r0_37, r1_37, r2_37)
  -- line: [608, 626] id: 37
  local r3_37 = UE4.UKismetInputLibrary.GetKey(r2_37)
  local r4_37 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_37)
  local r5_37 = true
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_37) then
    r5_37 = r0_37:OnGamePadDown(r4_37)
  elseif r4_37 == "Escape" then
    r5_37 = false
  elseif r4_37 == "Q" then
    r5_37 = false
  elseif r4_37 == "E" then
    r5_37 = false
  elseif r4_37 == "SpaceBar" then
    r0_37:GetAllTaskScores()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end
function r3_0.OnGamePadDown(r0_38, r1_38)
  -- line: [628, 662] id: 38
  local r2_38 = true
  if r1_38 == "Gamepad_LeftThumbstick" then
    r0_38.List_BigReward:SetFocus()
    r0_38.IsFocusBigReward = true
  elseif r1_38 == Const.GamepadFaceButtonUp then
    r0_38:GetAllTaskScores()
  elseif r1_38 == Const.GamepadFaceButtonLeft then
    r2_38 = false
    r0_38:GetBigReward()
  elseif r1_38 == Const.GamepadFaceButtonRight then
    if r0_38.IsFocusBigReward then
      local r3_38 = r0_38.CurFocusTask and r0_38.NormalItem.List_Task:GetItemAt(0) and r0_38.CycleItem.List_Task:GetItemAt(0)
      if not r3_38 then
        return 
      end
      if r3_38.TaskType == r4_0.Cycle then
        r0_38.CycleItem.List_Task:BP_NavigateToItem(r3_38)
      else
        r0_38.NormalItem.List_Task:BP_NavigateToItem(r3_38)
      end
    else
      r2_38 = false
    end
  elseif r1_38 == Const.GamepadLeftShoulder then
    r2_38 = false
  elseif r1_38 == Const.GamepadRightShoulder then
    r2_38 = false
  end
  if r2_38 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
end
return r3_0
