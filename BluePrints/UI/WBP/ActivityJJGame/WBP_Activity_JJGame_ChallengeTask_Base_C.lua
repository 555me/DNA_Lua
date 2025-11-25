-- filename: @E:/Pack/Branch/OBT10_Geili\Content/Script/BluePrints\UI\WBP\ActivityJJGame\WBP_Activity_JJGame_ChallengeTask_Base_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})
local r1_0 = "JJGameTask_Challenge_Reddot"
local r2_0 = "JJGameTask_Challenge_New"
local r3_0 = {
  Daily = {
    1,
    2
  },
  Cycle = 3,
  Achievement = 4,
}
function r0_0.Construct(r0_1)
  -- line: [24, 54] id: 1
  r0_1.MidTermConst = DataMgr.MidTermGoalConstant
  r0_1.AchievementRewardPoint = r0_1.MidTermConst.AchievementRewardPoint.ConstantValue
  r0_1.MidTermGoalEventId = r0_1.MidTermConst.MidTermGoalEventId.ConstantValue
  r0_1.AchievementPrize = DataMgr.AchievementPrize
  r0_1.Text_Empty:SetText(GText("UI_Event_MidTerm_End"))
  r0_1.Text_TaskScoreTodayTitle:SetText(GText("UI_Event_MidTerm_ChallengePoint"))
  r0_1.Text_TaskScoreToday_Total:SetText(r0_1.MidTermConst.MaxPrizePoint.ConstantValue)
  r0_1.Text_TaskScoreToday_Total:SetText(50)
  r0_1.Btn_OneClickGet.Text_GetReward:SetText(GText("UI_CTL_ClaimALL"))
  r0_1.Btn_OneClickGet.Btn_GetReward.OnClicked:Add(r0_1, r0_1.GetAllTaskScores)
  r0_1.Btn_Score.OnClicked:Add(r0_1, function()
    -- line: [35, 47] id: 2
    AudioManager(r0_1):PlayUISound(r0_1, "event:/ui/activity/wenmingboyi_challenge_btn_click", nil, nil)
    UIManager(r0_1):ShowCommonPopupUI(100101, {
      Count = r0_1.Count,
      Index = r0_1.Index,
      ActivityId = r0_1.MidTermGoalEventId,
      BackFocusWidget = r0_1.List_Challenge,
      OnCloseCallbackFunction = function()
        -- line: [42, 44] id: 3
        r0_1.List_Challenge:SetFocus()
      end,
    }, r0_1)
  end)
  r0_1._Avatar = GWorld:GetAvatar()
  r0_1:InitListenEvent()
  r0_1:RefreshBaseInfo()
  r0_1.List_Challenge:SetScrollBarVisibility(UIConst.VisibilityOp.Hidden)
  r0_1.List_Challenge:SetControlScrollbarInside(true)
  r0_1.CurFocusTask = nil
end
function r0_0.Destruct(r0_4)
  -- line: [56, 61] id: 4
  if r0_4.HasNewTask then
    r0_4:TryClearChallengeTaskNewReddot()
  end
  r0_4.Btn_OneClickGet.Btn_GetReward.OnClicked:Clear()
end
function r0_0.Init(r0_5, r1_5)
  -- line: [63, 106] id: 5
  r0_5.Params = r1_5
  r0_5.Owner = r1_5.Owner
  r0_5.EventDay = r1_5.EventDay
  r0_5._Avatar = GWorld:GetAvatar()
  r0_5.MidTermTask = r0_5._Avatar.MidTermTasks
  r0_5.MidTermAchvProgressRewarded = r0_5._Avatar.MidTermAchvProgressRewarded
  r0_5.EventEndTime = r1_5.EventEndTime
  r0_5:InitTaskList()
  r0_5:InitChallengeScoreItem()
  r0_5.ChallengeTaskScore = r0_5:CalChallengeTaskScore()
  r0_5:UpdateChallengeTaskScore(r0_5.ChallengeTaskScore)
  r0_5:PlayAnimation(r0_5.In)
  if r1_5.RemainDays ~= false then
    r0_5.Text_BottomOneClickTitle:SetText(string.format(GText("UI_Event_MidTerm_NewChallenge"), r1_5.RemainDays, r1_5.RemainHours))
  else
    r0_5.Text_BottomOneClickTitle:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if r0_5.EventEndTime < TimeUtils.NowTime() then
    r0_5:ClearChallengeReddot()
    r0_5.WS_Right:SetActiveWidgetIndex(1)
  end
  if CommonUtils.GetDeviceTypeByPlatformName() ~= "Mobile" then
    r0_5.Key_TitleScore:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "X",
        }
      },
    })
  end
  r0_5.Btn_OneClickGet.Key_GetReward:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "Y",
      }
    },
  })
  r0_5:SetFocus()
end
function r0_0.CalChallengeTaskScore(r0_6)
  -- line: [108, 118] id: 6
  return GWorld:GetAvatar().MidTermAchvScores
end
function r0_0.UpdateChallengeTaskScore(r0_7, r1_7)
  -- line: [120, 123] id: 7
  r0_7.Text_TaskScoreToday:SetText(r1_7)
  r0_7:UpdateChallengeScoreItem(r1_7)
end
function r0_0.InitTaskList(r0_8)
  -- line: [125, 128] id: 8
  r0_8:UpdateChallengeTaskList()
  r0_8:UpdateOneClickBtnState()
end
function r0_0.UpdateChallengeTaskList(r0_9)
  -- line: [130, 159] id: 9
  r0_9.List_Challenge:ClearListItems()
  r0_9.ChallengeTaskList = {}
  for r6_9, r7_9 in pairs(r0_9:SortTaskList(r0_9._Avatar.MidTermTasks)) do
    local r8_9 = DataMgr.MidTermTask[r7_9.UniqueID]
    if not r8_9 then
      print("TaskData is nil, Task.UniqueID = ", r7_9.UniqueID)
      Utils.ScreenPrint("MidTermTask表中不存在UniqueID为" .. r7_9.UniqueID .. "的任务，请检查配置")
    elseif r0_9.EventDay >= r8_9.EnableDay then
      local r9_9 = nil
      if r8_9.TaskType == r3_0.Achievement then
        r9_9 = r0_9:NewItemContent(r8_9.TaskType, r8_9.TaskId, r0_9.MidTermConst.AchievementRewardPoint.ConstantValue, r8_9.TaskDes)
      end
      if r9_9 then
        r9_9.TaskProp = r7_9
        r9_9.TaskConfig = r8_9
        r0_9.List_Challenge:AddItem(r9_9)
        table.insert(r0_9.ChallengeTaskList, r9_9)
      end
    end
  end
  -- close: r2_9
  r0_9.List_Challenge:RequestPlayEntriesAnim()
  r0_9.List_Challenge:SetFocus()
  r0_9:TryIncreaceChallengeTaskNewReddot()
end
function r0_0.SortTaskList(r0_10, r1_10)
  -- line: [161, 190] id: 10
  local r2_10 = {}
  local r3_10 = {}
  for r8_10, r9_10 in pairs(r1_10) do
    local r10_10 = tonumber(r8_10)
    if r9_10.RewardsGot then
      table.insert(r3_10, {
        key = r10_10,
        value = r9_10,
      })
    else
      table.insert(r2_10, {
        key = r10_10,
        value = r9_10,
      })
    end
  end
  -- close: r4_10
  table.sort(r2_10, function(r0_11, r1_11)
    -- line: [174, 176] id: 11
    return r0_11.key < r1_11.key
  end)
  table.sort(r3_10, function(r0_12, r1_12)
    -- line: [177, 179] id: 12
    return r0_12.key < r1_12.key
  end)
  local r4_10 = {}
  for r9_10, r10_10 in ipairs(r2_10) do
    table.insert(r4_10, r10_10.value)
  end
  -- close: r5_10
  for r9_10, r10_10 in ipairs(r3_10) do
    table.insert(r4_10, r10_10.value)
  end
  -- close: r5_10
  return r4_10
end
function r0_0.TryIncreaceChallengeTaskNewReddot(r0_13)
  -- line: [192, 204] id: 13
  for r5_13, r6_13 in pairs(r0_13.ChallengeTaskList) do
    local r7_13 = r6_13.TaskProp.UniqueID
    local r8_13 = ReddotManager.GetLeafNodeCacheDetail(r2_0)
    if r8_13 and r8_13[r7_13] == nil then
      r8_13[r7_13] = true
      ReddotManager.IncreaseLeafNodeCount(r2_0)
    end
    if r8_13 and r8_13[r7_13] == true then
      r0_13.HasNewTask = true
    end
  end
  -- close: r1_13
end
function r0_0.TryClearChallengeTaskNewReddot(r0_14)
  -- line: [206, 215] id: 14
  local r1_14 = ReddotManager.GetLeafNodeCacheDetail(r2_0)
  if r1_14 then
    for r6_14, r7_14 in pairs(r1_14) do
      r1_14[r6_14] = false
    end
    -- close: r2_14
  end
  ReddotManager.ClearLeafNodeCount(r2_0)
  r0_14.HasNewTask = false
end
function r0_0.InitChallengeScoreItem(r0_15)
  -- line: [217, 232] id: 15
  for r5_15, r6_15 in pairs(r0_15.AchievementPrize) do
    local r7_15 = math.floor(r5_15 / 10)
    local r8_15 = {
      Owner = r0_15,
      Count = r5_15,
      Index = r7_15,
      RewardId = r6_15,
    }
    local r9_15 = r0_15.MidTermAchvProgressRewarded[r5_15]
    if r9_15 then
      r9_15 = true and false
    else
      goto label_22	-- block#3 is visited secondly
    end
    r8_15.CanGet = r9_15
    r8_15.IsReceived = r0_15.MidTermAchvProgressRewarded[r5_15] == 1
    r8_15.CacheKey = "ChallengeScoreItem" .. r5_15
    r0_15["ChallengeScoreItem_" .. r7_15]:Init(r8_15)
  end
  -- close: r1_15
end
function r0_0.TryIncreaceChallengeRewardReddot(r0_16, r1_16)
  -- line: [234, 241] id: 16
  local r2_16 = "ChallengeScoreItem" .. r1_16
  local r3_16 = ReddotManager.GetLeafNodeCacheDetail(r1_0)
  if r3_16 and r3_16[r2_16] == nil then
    r3_16[r2_16] = true
    ReddotManager.IncreaseLeafNodeCount(r1_0)
  end
end
function r0_0.TrySubChallengeRewardReddot(r0_17, r1_17)
  -- line: [243, 250] id: 17
  local r2_17 = "ChallengeScoreItem" .. r1_17
  local r3_17 = ReddotManager.GetLeafNodeCacheDetail(r1_0)
  if r3_17 and r3_17[r2_17] then
    r3_17[r2_17] = nil
    ReddotManager.DecreaseLeafNodeCount(r1_0)
  end
end
function r0_0.TryIncreaceChallengeTaskRewardReddot(r0_18, r1_18)
  -- line: [252, 259] id: 18
  local r2_18 = r1_0 .. r1_18
  local r3_18 = ReddotManager.GetLeafNodeCacheDetail(r1_0)
  if r3_18 and r3_18[r2_18] == nil then
    r3_18[r2_18] = true
    ReddotManager.IncreaseLeafNodeCount(r1_0)
  end
end
function r0_0.TrySubChallengeTaskRewardReddot(r0_19, r1_19)
  -- line: [261, 268] id: 19
  local r2_19 = r1_0 .. r1_19
  local r3_19 = ReddotManager.GetLeafNodeCacheDetail(r1_0)
  if r3_19 and r3_19[r2_19] then
    r3_19[r2_19] = nil
    ReddotManager.DecreaseLeafNodeCount(r1_0)
  end
end
function r0_0.TrySubChallengeTaskNewReddot(r0_20, r1_20)
  -- line: [270, 277] id: 20
  local r2_20 = r1_20
  local r3_20 = ReddotManager.GetLeafNodeCacheDetail(r2_0)
  if r3_20 and r3_20[r2_20] then
    r3_20[r2_20] = false
    ReddotManager.DecreaseLeafNodeCount(r2_0)
  end
end
function r0_0.UpdateChallengeScoreItem(r0_21, r1_21)
  -- line: [279, 310] id: 21
  local r2_21 = false
  for r7_21, r8_21 in pairs(r0_21.AchievementPrize) do
    local r10_21 = r0_21["ChallengeScoreItem_" .. math.floor(r7_21 / 10)]
    if r7_21 <= r1_21 then
      if r0_21._Avatar.MidTermAchvProgressRewarded[r7_21] == 1 then
        r10_21:StopAnimation(r10_21.Reward)
        r10_21:PlayAnimation(r10_21.Recived)
      else
        r10_21:StopAnimation(r10_21.Forbidden)
        r10_21:PlayAnimation(r10_21.In_Reward)
        r10_21:PlayAnimation(r10_21.Reward, 0, 0)
        r10_21.CanGet = true
        r2_21 = true
        r0_21:TryIncreaceChallengeRewardReddot(r7_21)
      end
    else
      r10_21:PlayAnimation(r10_21.Forbidden)
    end
  end
  -- close: r3_21
  r0_21.RewardCanGet = r2_21
  if r0_21.RewardCanGet and r0_21.CurInputDevice == ECommonInputType.Gamepad then
    r0_21.Text_TaskScoreTodayTitle:SetText(GText("UI_Event_MidTerm_GetPrize"))
  elseif r0_21.CurInputDevice == ECommonInputType.Gamepad then
    r0_21.Text_TaskScoreTodayTitle:SetText(GText("UI_Event_MidTerm_GotoPreview"))
  end
end
function r0_0.UpdateOneClickBtnState(r0_22)
  -- line: [312, 356] id: 22
  local r1_22 = false
  local function r2_22(r0_23)
    -- line: [315, 320] id: 23
    -- notice: unreachable block#6
    if not r0_23 or not r0_23.TaskProp then
      return false
    end
    local r1_23 = r0_23.TaskProp
    local r2_23 = r1_23.Progress
    if r1_23.Target <= r2_23 then
      r2_23 = not r1_23.RewardsGot
    else
      r2_23 = false
    end
    return r2_23
  end
  if r0_22.ChallengeTaskList then
    for r7_22, r8_22 in pairs(r0_22.ChallengeTaskList) do
      if r2_22(r8_22) then
        r1_22 = true
        break
      end
    end
    -- close: r3_22
  end
  if r0_22.EventEndTime < TimeUtils.NowTime() then
    r1_22 = false
  end
  if r1_22 then
    r0_22.Btn_OneClickGet.Btn_GetReward:SetForbidden(false)
    r0_22.Btn_OneClickGet.Key_GetReward:SetForbidKey(false)
    if CommonUtils.GetDeviceTypeByPlatformName() ~= "Mobile" then
      r0_22.Owner.Com_Tab:UpdateBottomKeyInfo({
        {
          KeyInfoList = {
            {
              Type = "Text",
              Text = "SpaceBar",
              ClickCallback = r0_22.GetAllTaskScores,
              Owner = r0_22,
            }
          },
          GamePadInfoList = {
            {
              Type = "Img",
              ImgShortPath = "Y",
              ClickCallback = r0_22.GetAllTaskScores,
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
              ClickCallback = r0_22.CloseSelf,
              Owner = r0_22,
            }
          },
          GamePadInfoList = {
            {
              Type = "Img",
              ImgShortPath = "B",
              ClickCallback = r0_22.CloseSelf,
            }
          },
          Desc = GText("UI_BACK"),
          bLongPress = false,
        }
      })
    end
  else
    r0_22.Btn_OneClickGet.Btn_GetReward:SetForbidden(true)
    r0_22.Btn_OneClickGet.Key_GetReward:SetForbidKey(true)
    if CommonUtils.GetDeviceTypeByPlatformName() ~= "Mobile" then
      r0_22.Owner.Com_Tab:UpdateBottomKeyInfo({
        {
          KeyInfoList = {
            {
              Type = "Text",
              Text = "Escape",
              ClickCallback = r0_22.CloseSelf,
              Owner = r0_22,
            }
          },
          GamePadInfoList = {
            {
              Type = "Img",
              ImgShortPath = "B",
              ClickCallback = r0_22.CloseSelf,
            }
          },
          Desc = GText("UI_BACK"),
          bLongPress = false,
        }
      })
    end
  end
  r0_22.canReceive = r1_22
end
function r0_0.GetAllTaskScores(r0_24)
  -- line: [358, 389] id: 24
  if r0_24.EventEndTime < TimeUtils.NowTime() then
    return 
  end
  if r0_24.Btn_OneClickGet.Btn_GetReward:GetForbidden() then
    return 
  end
  AudioManager(r0_24):PlayUISound(r0_24, "event:/ui/activity/wenmingboyi_all_btn_click", nil, nil)
  local function r1_24(r0_25, r1_25)
    -- line: [362, 386] id: 25
    DebugPrint("GetAllChallengeTaskScores", ErrorCode:Name(r0_25))
    if r0_25 == ErrorCode.RET_SUCCESS then
      r0_24:UpdateChallengeTaskList()
      r0_24.ChallengeTaskScore = r0_24:CalChallengeTaskScore()
      r0_24:UpdateChallengeTaskScore(r0_24.ChallengeTaskScore)
      r0_24:UpdateOneClickBtnState()
      r0_24:ClearChallengeTaskReddot()
      if r0_24.ChallengeTaskList then
        for r6_25, r7_25 in pairs(r0_24.ChallengeTaskList) do
          if r7_25.TaskProp and r7_25.TaskProp.RewardsGot then
            r0_24:TrySubChallengeTaskRewardReddot(r7_25.TaskProp.UniqueID)
          end
        end
        -- close: r2_25
      end
      r0_24:PlayAnimation(r0_24.Up)
      AudioManager(r0_24):PlayUISound(r0_24, "event:/ui/activity/wenmingboyi_challenge_score_add", nil, nil)
    end
    r0_24.Owner:BlockAllUIInput(false)
  end
  r0_24.Owner:BlockAllUIInput(true)
  r0_24._Avatar:MidTermGetAllAchvScores(r1_24)
end
function r0_0.NewItemContent(r0_26, r1_26, r2_26, r3_26, r4_26)
  -- line: [391, 399] id: 26
  local r5_26 = NewObject(UIUtils.GetCommonItemContentClass())
  r5_26.Owner = r0_26
  r5_26.TaskType = r1_26
  r5_26.TaskId = r2_26
  r5_26.Point = r3_26
  r5_26.Desc = r4_26
  return r5_26
end
function r0_0.OnAchvFinished(r0_27, r1_27)
  -- line: [401, 410] id: 27
  if not r0_27.ChallengeTaskList then
    return 
  end
  for r6_27, r7_27 in pairs(r0_27.ChallengeTaskList) do
    if r7_27.SelfWidget and r7_27.SelfWidget.OnAchvFinished then
      r7_27.SelfWidget:OnAchvFinished(r1_27)
    end
  end
  -- close: r2_27
  r0_27:UpdateOneClickBtnState()
end
function r0_0.OnMidTermTaskProgressChange(r0_28, r1_28, r2_28)
  -- line: [412, 421] id: 28
  if not r0_28.ChallengeTaskList then
    return 
  end
  for r7_28, r8_28 in pairs(r0_28.ChallengeTaskList) do
    if r8_28.SelfWidget and r8_28.SelfWidget.OnMidTermTaskProgressChange then
      r8_28.SelfWidget:OnMidTermTaskProgressChange(r1_28, r2_28)
    end
  end
  -- close: r3_28
  r0_28:UpdateOneClickBtnState()
end
function r0_0.OnTaskGet(r0_29, r1_29)
  -- line: [423, 439] id: 29
  r1_29.WS_Btn:SetActiveWidgetIndex(3)
  r1_29:PlayAnimation(r1_29.In_Got)
  r1_29.Content.CanGet = false
  r0_29.ChallengeTaskScore = r0_29:CalChallengeTaskScore()
  r0_29:TrySubChallengeTaskRewardReddot(r1_29.TaskProp.UniqueID)
  r0_29:TrySubChallengeTaskNewReddot(r1_29.TaskProp.UniqueID)
  r1_29.New:SetVisibility(UIConst.VisibilityOp.Hidden)
  r0_29:UpdateChallengeTaskScore(r0_29.ChallengeTaskScore)
  r0_29:UpdateOneClickBtnState()
  r0_29:AddTimer(0.1, function()
    -- line: [435, 438] id: 30
    AudioManager(r0_29):PlayUISound(r0_29, "event:/ui/activity/wenmingboyi_challenge_score_add", nil, nil)
    r0_29:PlayAnimation(r0_29.Up)
  end)
end
function r0_0.OnChallengeRewardGet(r0_31)
  -- line: [442, 473] id: 31
  local function r1_31(r0_32, r1_32)
    -- line: [444, 470] id: 32
    if r0_32 == ErrorCode.RET_SUCCESS then
      UIManager(GWorld.GameInstance):LoadUI(UIConst.LoadInConfig, "GetItemPage", nil, nil, nil, nil, r1_32, function()
        -- line: [446, 451] id: 33
        r0_31:AddTimer(0.1, function()
          -- line: [447, 450] id: 34
          r0_31.List_Challenge:BP_NavigateToItem(r0_31.CurFocusTask and r0_31.List_Challenge:GetItemAt(0))
        end)
      end)
      r0_31:UpdateChallengeScoreItem(r0_31:CalChallengeTaskScore())
      r0_31:ClearChallengeReddot()
    else
      UIManager(r0_31):ShowCommonPopupUI(100101, {
        Count = r0_31.Count,
        Index = r0_31.Index,
        ActivityId = r0_31.MidTermGoalEventId,
        BackFocusWidget = r0_31.List_Challenge,
        OnCloseCallbackFunction = function()
          -- line: [460, 465] id: 35
          r0_31:AddTimer(0.1, function()
            -- line: [461, 464] id: 36
            r0_31.List_Challenge:BP_NavigateToItem(r0_31.CurFocusTask and r0_31.List_Challenge:GetItemAt(0))
          end)
        end,
      }, r0_31)
    end
    r0_31.Owner:BlockAllUIInput(false)
  end
  r0_31.Owner:BlockAllUIInput(true)
  r0_31._Avatar:MidTermGetProgressReward(r1_31)
end
function r0_0.ClearChallengeReddot(r0_37)
  -- line: [475, 483] id: 37
  local r1_37 = ReddotManager.GetLeafNodeCacheDetail(r1_0)
  if r1_37 then
    for r6_37, r7_37 in pairs(r1_37) do
      r1_37[r6_37] = nil
    end
    -- close: r2_37
  end
  ReddotManager.ClearLeafNodeCount(r1_0)
end
function r0_0.ClearChallengeTaskReddot(r0_38)
  -- line: [485, 493] id: 38
  local r1_38 = ReddotManager.GetLeafNodeCacheDetail(r2_0)
  if r1_38 then
    for r6_38, r7_38 in pairs(r0_38.ChallengeTaskList) do
      r1_38[r7_38.TaskProp.UniqueID] = false
    end
    -- close: r2_38
  end
end
function r0_0.InitListenEvent(r0_39)
  -- line: [496, 503] id: 39
  r0_39.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(r0_39:GetOwningPlayer())
  if IsValid(r0_39.GameInputModeSubsystem) then
    r0_39.GameInputModeSubsystem.OnInputMethodChanged:Add(r0_39, r0_39.RefreshOpInfoByInputDevice)
  end
  r0_39:InitNavigationRules()
end
function r0_0.RefreshBaseInfo(r0_40)
  -- line: [505, 509] id: 40
  if IsValid(r0_40.GameInputModeSubsystem) then
    r0_40:RefreshOpInfoByInputDevice(r0_40.GameInputModeSubsystem:GetCurrentInputType(), r0_40.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end
function r0_0.RefreshOpInfoByInputDevice(r0_41, r1_41, r2_41)
  -- line: [511, 533] id: 41
  r0_41.CurGamepadName = r2_41
  if r1_41 == ECommonInputType.Gamepad then
    if CommonUtils.GetDeviceTypeByPlatformName() ~= "Mobile" then
      r0_41.Key_TitleScore:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
    if r0_41.RewardCanGet then
      r0_41.Text_TaskScoreTodayTitle:SetText(GText("UI_Event_MidTerm_GetPrize"))
    else
      r0_41.Text_TaskScoreTodayTitle:SetText(GText("UI_Event_MidTerm_GotoPreview"))
    end
    r0_41.Btn_OneClickGet.Key_GetReward:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    if CommonUtils.GetDeviceTypeByPlatformName() ~= "Mobile" then
      r0_41.Key_TitleScore:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    r0_41.Text_TaskScoreTodayTitle:SetText(GText("UI_Event_MidTerm_ChallengePoint"))
    r0_41.Btn_OneClickGet.Key_GetReward:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  r0_41.CurInputDevice = r1_41
end
function r0_0.InitNavigationRules(r0_42)
  -- line: [535, 538] id: 42
  r0_42.List_Challenge:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  r0_42.List_Challenge:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
end
function r0_0.BP_GetDesiredFocusTarget(r0_43)
  -- line: [540, 548] id: 43
  if r0_43.CurFocusTask ~= nil then
    return r0_43.CurFocusTask.SelfWidget
  elseif r0_43.List_Challenge:GetItemAt(0) then
    return r0_43.List_Challenge:GetItemAt(0).SelfWidget
  else
    return nil
  end
end
function r0_0.OnKeyDown(r0_44, r1_44, r2_44)
  -- line: [550, 568] id: 44
  local r3_44 = UE4.UKismetInputLibrary.GetKey(r2_44)
  local r4_44 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_44)
  local r5_44 = true
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_44) then
    r5_44 = r0_44:OnGamePadDown(r4_44)
  elseif r4_44 == "Escape" then
    r5_44 = false
  elseif r4_44 == "Q" then
    r5_44 = false
  elseif r4_44 == "E" then
    r5_44 = false
  elseif r4_44 == "SpaceBar" then
    r0_44:GetAllTaskScores()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end
function r0_0.OnGamePadDown(r0_45, r1_45)
  -- line: [570, 589] id: 45
  local r2_45 = true
  if r1_45 == Const.GamepadFaceButtonLeft then
    r0_45:OnChallengeRewardGet()
  elseif r1_45 == Const.GamepadFaceButtonUp then
    r0_45:GetAllTaskScores()
  elseif r1_45 == Const.GamepadFaceButtonRight then
    r2_45 = false
  elseif r1_45 == Const.GamepadLeftShoulder then
    r2_45 = false
  elseif r1_45 == Const.GamepadRightShoulder then
    r2_45 = false
  end
  if r2_45 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
end
return r0_0
