-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Activity\Widget\JumpToOtherPage\ActivityJumpPageBase.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("Utils.TimeUtils")
local r1_0 = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local r2_0 = require("Blueprints.UI.WBP.Activity.ActivityReddotHelper")
local r3_0 = Class()
function r3_0.GetPageName(r0_1)
  -- line: [15, 17] id: 1
  return DataMgr.EventTab[r0_1.ParentTabId].EventTabName
end
function r3_0.GetActivityId(r0_2)
  -- line: [19, 21] id: 2
  return r0_2.CurActivityId
end
function r3_0.GetParentTabId(r0_3)
  -- line: [23, 25] id: 3
  return r0_3.ParentTabId
end
function r3_0.GetPageConfigData(r0_4)
  -- line: [27, 29] id: 4
  return DataMgr.EventPortal[r0_4.CurActivityId]
end
function r3_0.ResetVariable(r0_5)
  -- line: [31, 34] id: 5
  r0_5.FocusWidgetName = nil
end
function r3_0.InitPage(r0_6, r1_6, r2_6, r3_6, r4_6)
  -- line: [36, 73] id: 6
  r0_6.CurActivityId = r1_6
  r0_6.ParentTabId = r2_6
  r0_6.ParentWidget = r4_6
  if GWorld:GetAvatar() == nil then
    return 
  end
  local r6_6 = DataMgr.EventMain[r0_6.CurActivityId]
  local r7_6 = r6_6.EventEndTime
  if r7_6 then
    r7_6 = r6_6.EventEndTime and r6_6.PermanenEventTime
  else
    goto label_19	-- block#4 is visited secondly
  end
  r0_6.ActivityEndTime = r7_6
  r0_6.RewardEndTime = r6_6.RewardEndTime
  r0_6.FinishCondition = r6_6.EventEndCondition
  r0_6:RefreshPageStaticView(r6_6, DataMgr.EventPortal[r0_6.CurActivityId], r0_6.ViewInfoBtnClick, r0_6.GoToShopClick, r0_6.GoToTargetPageClick, r0_6.OnStuffDetailOpenChanged, r0_6.GoToTaskClick, r0_6.GoToMoreClick)
  r0_6:RefreshPageDynamicView()
  r0_6.IsComplete = false
  local r8_6 = GWorld:GetAvatar()
  if r8_6 and r0_6.FinishCondition then
    r0_6.IsComplete = ConditionUtils.CheckCondition(r8_6, r0_6.FinishCondition)
  end
  r0_6:InitTimeInfo()
  ReddotManager.AddListener("TheaterEventReward", r0_6, r0_6.UpdateTheaterTaskReddot)
  r0_6.ScrollBox_Desc.OnUserScrolled:Add(r0_6, r0_6.OnUserScrolled)
  r0_6.Group_TextScrollTop:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_6.Group_TextScrollBottom:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_6:AddTimer(0.05, function()
    -- line: [70, 72] id: 7
    r0_6:OnUserScrolled()
  end, false, 0, "RefreshScrollBoxArrow", true)
end
function r3_0.OnUserScrolled(r0_8)
  -- line: [75, 77] id: 8
  UIUtils.UpdateScrollBoxArrow(r0_8.ScrollBox_Desc, r0_8.List_ArrowTop, r0_8.List_ArrowBottom)
end
function r3_0.CleanSelf(r0_9, r1_9)
  -- line: [79, 85] id: 9
  ReddotManager.RemoveListener("TheaterEventReward", r0_9)
  r0_9:RemoveTimer("RefreshLeftTime")
  if r1_9 then
    r0_9:RemoveFromParent()
  end
end
function r3_0.InitTimeInfo(r0_10)
  -- line: [87, 95] id: 10
  if (r0_10.ActivityEndTime ~= nil or r0_10.RewardEndTime ~= nil or r0_10.IsComplete) and r0_10.Activity_Time then
    local r1_10 = true
    r1_0.RefreshLeftTime(r0_10, r0_10.Activity_Time, r1_10)
    r0_10:AddTimer(1, r1_0.RefreshLeftTime, true, 0, "RefreshLeftTime", true, r0_10.Activity_Time, r1_10)
  else
    r1_0.SetLeftTimeView(r0_10.Activity_Time, true)
  end
end
function r3_0.ViewInfoBtnClick(r0_11)
  -- line: [98, 109] id: 11
  local r1_11 = DataMgr.EventMain[r0_11.CurActivityId]
  if not r1_11.EventRule then
    DebugPrint("ViewInfoBtn Click, EventRule is nil, EventId is", r0_11.CurActivityId)
    return 
  end
  UIManager(r0_11):ShowCommonPopupUI(100192, {
    LongText = GText(r1_11.EventRule),
    ShowBKeyClose = true,
  }, r0_11)
end
function r3_0.GoToTargetPageClick(r0_12)
  -- line: [111, 130] id: 12
  if r0_12.ParentWidget and type(r0_12.ParentWidget.CheckIsInCloseSelfState) == "function" and r0_12.ParentWidget:CheckIsInCloseSelfState() then
    DebugPrint("CommonActivityJump= GoToTargetPageClick, ParentWidget is in close self state, So return")
    return 
  end
  local r1_12 = DataMgr.EventPortal[r0_12.CurActivityId]
  if r1_12.JumpUIId then
    PageJumpUtils:JumpToTargetPageByJumpId(r1_12.JumpUIId)
  else
    local r2_12 = UIManager(r0_12):GetUIObj("ActivityMain")
    if r2_12 then
      local r3_12 = r2_12.WidgetBGAnchor:GetChildAt(0)
      if r3_12 then
        r3_12:FocusUI()
      end
    end
  end
end
function r3_0.GoToShopClick(r0_13)
  -- line: [132, 144] id: 13
  if r0_13.ParentWidget and type(r0_13.ParentWidget.CheckIsInCloseSelfState) == "function" and r0_13.ParentWidget:CheckIsInCloseSelfState() then
    DebugPrint("CommonActivityJump= GoToShopClick, ParentWidget is in close self state, So return")
    return 
  end
  local r1_13 = DataMgr.EventPortal[r0_13.CurActivityId]
  if not r1_13.EventShop then
    return 
  end
  PageJumpUtils:JumpToTargetPageByJumpId(r1_13.EventShop)
end
function r3_0.GoToTaskClick(r0_14)
  -- line: [147, 154] id: 14
  local r1_14 = r0_14:MakeRewardData()
  if not r1_14 then
    DebugPrint("JLY 没有剧院任务数据")
    return 
  end
  UIManager(r0_14):ShowCommonPopupUI(100258, r1_14)
end
function r3_0.MakeRewardData(r0_15)
  -- line: [156, 253] id: 15
  local r2_15 = GWorld:GetAvatar().TheaterActivity[r0_15.CurActivityId]
  if not r2_15 then
    DebugPrint("JLY 没有剧院任务数据")
    return 
  end
  local r3_15 = {
    ConfigData = {},
  }
  r3_15.ConfigData.TabInfo = {}
  r3_15.ConfigData.Items = {}
  r3_15.ConfigData.HasTab = true
  r3_15.ConfigData.Datas = {}
  local r4_15 = DataMgr.TheaterTask
  local r5_15 = {
    GText("TheaterOnline_Task_Daily"),
    GText("TheaterOnline_Task_Total")
  }
  local r6_15 = {}
  for r10_15 = 1, #r5_15, 1 do
    table.insert(r3_15.ConfigData.TabInfo, {
      Index = r10_15,
      Type = r10_15,
      Title = GText(r5_15[r10_15]),
      IsShowIcon = true,
      ReddotName = "TheaterEventReward",
    })
    r3_15.ConfigData.Datas[r10_15] = {
      ShowIcon = false,
      NowNum = 1,
      NumMax = 2,
      ReceiveAllCallBack = r0_15.GetAllRewards,
      ReceiveAllParam = {
        Index = r10_15,
      },
      Type = r5_15[r10_15],
      Text_Total = string.format(GText("UI_ModGuideBook_Task_Collecting")),
      ReceiveButtonText = GText("UI_Archive_CollectionClaimAll"),
      Items = {},
    }
    r6_15[r10_15] = {
      NowNum = 0,
      NumMax = 0,
    }
  end
  for r11_15, r12_15 in pairs(r2_15.Tasks) do
    local r13_15 = r4_15[r11_15]
    if r13_15 then
      local r14_15 = {
        ItemId = r11_15,
        CanReceive = r12_15.Target <= r12_15.Progress,
      }
      local r16_15 = r13_15.IsDaily
      if r16_15 then
        r16_15 = 1 and 2
      else
        goto label_124	-- block#13 is visited secondly
      end
      r14_15.Type = r16_15
      r14_15.RewardsGot = r12_15.RewardsGot
      r14_15.ReddotName = "TheaterEventReward"
      r14_15.NotreachText = GText("UI_Archive_CollectionInProgress")
      r16_15 = r13_15.Des
      if r16_15 then
        r16_15 = string.format(GText(r13_15.Des), r12_15.Progress .. "/" .. r12_15.Target) and string.format(GText("UI_Archive_CollectionTarget"), r12_15.Progress .. "/" .. r12_15.Target)
      else
        goto label_148	-- block#16 is visited secondly
      end
      r14_15.Hint = r16_15
      r14_15.Num = r12_15.Target
      r14_15.ReceiveCallBack = r0_15.GetRewards
      r14_15.ReceiveParm = {
        RewardModel = r0_15,
      }
      r16_15 = {}
      local r18_15 = DataMgr.Reward[r13_15.RewardId]
      if r18_15 then
        local r19_15 = r18_15.Id and {}
        local r20_15 = r18_15.Count and {}
        local r21_15 = r18_15.Type and {}
        for r25_15 = 1, #r19_15, 1 do
          local r26_15 = r19_15[r25_15]
          table.insert(r16_15, {
            ItemType = r21_15[r25_15],
            ItemId = r26_15,
            Count = RewardUtils:GetCount(r20_15[r25_15]),
            Rarity = ItemUtils.GetItemRarity(r26_15, r21_15[r25_15]),
          })
        end
      end
      r14_15.Rewards = r16_15
      table.insert(r3_15.ConfigData.Datas[r14_15.Type].Items, r14_15)
      local r19_15 = r6_15[r14_15.Type]
      local r20_15 = r6_15[r14_15.Type].NowNum
      local r21_15 = r14_15.CanReceive
      if r21_15 then
        r21_15 = 1 and 0
      else
        goto label_238	-- block#29 is visited secondly
      end
      r19_15.NowNum = r20_15 + r21_15
      r6_15[r14_15.Type].NumMax = r6_15[r14_15.Type].NumMax + 1
    end
  end
  -- close: r7_15
  for r10_15 = 1, #r5_15, 1 do
    r3_15.ConfigData.Datas[r10_15].NowNum = r6_15[r10_15].NowNum
    r3_15.ConfigData.Datas[r10_15].NumMax = r6_15[r10_15].NumMax
  end
  r3_15.ConfigData.Type = r3_15.ConfigData.TabInfo[1].Type
  return r3_15
end
function r3_0.GetAllRewards(r0_16, r1_16)
  -- line: [255, 276] id: 16
  local r2_16 = GWorld:GetAvatar()
  if r2_16 then
    r2_16:TheaterGetAllTaskReward(r1_16.Index == 1, function(r0_17, r1_17)
      -- line: [258, 273] id: 17
      if r0_17 == 0 then
        for r5_17 = 0, r1_16.SelfWidget.List_Item:GetNumItems() + -1, 1 do
          local r6_17 = r1_16.SelfWidget.List_Item:GetItemAt(r5_17)
          if r6_17.ConfigData.CanReceive then
            r6_17.ConfigData.CanReceive = false
            r6_17.ConfigData.RewardsGot = true
            if r6_17.SelfWidget then
              r6_17.SelfWidget:RefreshBtn(true)
            end
          end
        end
        r1_16.SelfWidget:RefreshButton(false)
        UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, r1_17, false, nil, r1_16.SelfWidget, true)
      end
    end)
  end
end
function r3_0.CheckHaveRewardToGet(r0_18, r1_18)
  -- line: [278, 304] id: 18
  if not r1_18 then
    return false
  end
  local r2_18 = GWorld:GetAvatar()
  if not r2_18 then
    return false
  end
  local r3_18 = r2_18.TheaterActivity and r2_18.TheaterActivity[r0_18.CurActivityId]
  if not r3_18 or not r3_18.Tasks then
    return false
  end
  local r4_18 = DataMgr.TheaterTask
  if not r4_18 then
    return false
  end
  for r9_18, r10_18 in pairs(r3_18.Tasks) do
    local r11_18 = r4_18[r9_18]
    if r11_18 then
      local r12_18 = r11_18.IsDaily
      if r12_18 then
        r12_18 = 1 and 2
      else
        goto label_43	-- block#15 is visited secondly
      end
      if r12_18 == r1_18 and r10_18.Target <= r10_18.Progress and not r10_18.RewardsGot then
        return true
      end
    end
  end
  -- close: r5_18
  return false
end
function r3_0.GetRewards(r0_19, r1_19)
  -- line: [306, 322] id: 19
  local r2_19 = GWorld:GetAvatar()
  if r2_19 then
    r2_19:TheaterGetTaskReward(r1_19.ConfigData.ItemId, function(r0_20, r1_20)
      -- line: [309, 319] id: 20
      if r0_20 == 0 then
        r1_19.ConfigData.CanReceive = false
        r1_19.ConfigData.RewardsGot = true
        r1_19.SelfWidget:RefreshBtn(true)
        r1_19.Owner:RefreshButton(r1_19.ConfigData.ReceiveParm.RewardModel:CheckHaveRewardToGet(r1_19.ConfigData.Type))
        UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, r1_20, false, function()
          -- line: [315, 317] id: 21
          r0_19:SetFocus()
        end, r0_19)
      end
    end)
  end
end
function r3_0.UpdateTheaterTaskReddot(r0_22)
  -- line: [324, 347] id: 22
  local r2_22 = GWorld:GetAvatar().TheaterActivity[DataMgr.TheaterConstant.EventId.ConstantValue]
  if not r2_22 then
    DebugPrint("JLY 没有剧院任务数据")
    return 
  end
  if r0_22.CurActivityId ~= DataMgr.TheaterConstant.EventId.ConstantValue then
    return 
  end
  local r3_22 = true
  for r8_22, r9_22 in pairs(r2_22.Tasks) do
    if r9_22.Target <= r9_22.Progress and not r9_22.RewardsGot then
      r3_22 = false
      break
    end
  end
  -- close: r4_22
  if r3_22 then
    r2_0.TrySubReddotCount(r1_0, r0_22.CurActivityId, "Red")
    r0_22.TaskReddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    r0_22.TaskReddot:SetVisibility(UIConst.VisibilityOp.Visible)
  end
end
function r3_0.GoToMoreClick(r0_23)
  -- line: [349, 437] id: 23
  if r0_23.CurActivityId == DataMgr.TheaterConstant.EventId.ConstantValue then
    local r1_23 = {}
    r1_23.DataMap = {
      Tabs = {},
    }
    r1_23.TabConfigData = {
      PlatformName = CommonUtils.GetDeviceTypeByPlatformName(r0_23),
      LeftKey = "A",
      RightKey = "D",
      Tabs = {
        [1] = {
          Text = GText("TheaterOnline_Game_Name"),
          TabId = 1,
        },
        [2] = {
          Text = GText("TheaterOnline_Game_Interactor"),
          TabId = 2,
        },
      },
      SoundFunc = function()
        -- line: [367, 369] id: 24
        AudioManager(r0_23):PlayUISound(r0_23, "event:/ui/common/click_level_01", nil, nil)
      end,
    }
    local r3_23 = {
      "低级奖励",
      "高级奖励"
    }
    local r4_23 = {}
    for r8_23 = 1, #r3_23, 1 do
      local r10_23 = DataMgr.Reward[DataMgr.TheaterConstant["Reward" .. r8_23].ConstantValue]
      if r10_23 then
        local r11_23 = r10_23.Id
        local r12_23 = r10_23.Count
        local r13_23 = r10_23.Type
        local r14_23 = {}
        for r18_23 = 1, #r11_23, 1 do
          local r19_23 = {
            ItemId = r11_23[r18_23],
            Count = RewardUtils:GetCount(r12_23[r18_23]),
          }
          r19_23.Icon = ItemUtils.GetItemIconPath(r19_23.ItemId, r13_23[r18_23])
          r19_23.Rarity = ItemUtils.GetItemRarity(r19_23.ItemId, r13_23[r18_23])
          r19_23.ItemType = r13_23[r18_23]
          table.insert(r14_23, r19_23)
        end
        if not r4_23[r3_23[r8_23]] then
          r4_23[r3_23[r8_23]] = {}
        end
        r4_23[r3_23[r8_23]] = r14_23
      end
    end
    r1_23.DataMap.Tabs[1] = r4_23
    local r5_23 = DataMgr.TheaterDonateStep[r0_23.CurActivityId]
    r4_23 = {}
    for r9_23 = 1, #r5_23, 1 do
      local r11_23 = DataMgr.RewardView[r5_23[r9_23].RewardViewId]
      if r11_23 then
        local r12_23 = r11_23.Id
        local r13_23 = r11_23.Quantity
        local r14_23 = r11_23.Type
        local r15_23 = {}
        for r19_23 = 1, #r12_23, 1 do
          local r20_23 = {
            ItemId = r12_23[r19_23],
            Count = RewardUtils:GetCount(r13_23[r19_23]),
          }
          r20_23.Icon = ItemUtils.GetItemIconPath(r20_23.ItemId, r14_23[r19_23])
          r20_23.Rarity = ItemUtils.GetItemRarity(r20_23.ItemId, r14_23[r19_23])
          r20_23.ItemType = r14_23[r19_23]
          table.insert(r15_23, r20_23)
        end
        local r16_23 = string.format(GText("TheaterOnline_Donate_Step"), r9_23)
        if not r4_23[r16_23] then
          r4_23[r16_23] = {}
        end
        r4_23[r16_23] = r15_23
      end
    end
    r1_23.DataMap.Tabs[2] = r4_23
    UIManager(r0_23):ShowCommonPopupUI(100257, r1_23)
    return true
  end
  return false
end
return r3_0
