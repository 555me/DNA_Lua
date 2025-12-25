-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\TaskPanel\WBP_Task_Main_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class("BluePrints.UI.BP_UIState_C")
local r1_0 = require("Utils.UIUtils")
local r2_0 = require("EMCache.EMCache")
local r3_0 = require("Utils.TimeUtils")
local r4_0 = require("BluePrints.UI.TaskPanel.TaskUtils")
local r5_0 = require("BluePrints.UI.WBP.DetectiveMinigame.ReasoningUtils")
local r6_0 = require("BluePrints.UI.TaskPanel/QuestGuidePointLocData")
local r7_0 = 99
local r8_0 = {
  Lock = 0,
  Doing = 1,
  Finished = 2,
  InProgress = -1,
}
local r9_0 = {}
function r0_0.Initialize(r0_1, r1_1)
  -- line: [31, 46] id: 1
  r0_1.Super.Initialize(r0_1)
  r0_1.AllTabInfo = {}
  r0_1.CurTabId = nil
  r0_1.SaveTabId = nil
  r0_1.CurSelectQuest = nil
  r0_1.CurTrackingQuest = nil
  r0_1.TrackingQuestId = nil
  r0_1.IsTracking = false
  r0_1.IsFristOpen = true
  r0_1.CurPlayerCharacterLevel = 0
  r0_1.JumpQuestChainId = nil
  r0_1.PlatformName = nil
  r0_1.CurFocusWidget = nil
  r0_1.IsCanCloseByHotKey = false
end
function r0_0.Construct(r0_2)
  -- line: [48, 54] id: 2
  r0_2:InitListenEvent()
  ReddotManager.AddListener("DetectiveQuestion", r0_2, r0_2.UpdateReasoningRedDot)
  ReddotManager.AddListener("DetectiveAnswer", r0_2, r0_2.UpdateReasoningRedDot)
  EventManager:AddEvent(EventID.CheckShowMap, r0_2, r0_2.CheckNeedShowLevelMap)
end
function r0_0.OnLoaded(r0_3, ...)
  -- line: [56, 90] id: 3
  local r2_3 = nil	-- notice: implicit variable refs by block#[0]
  r0_3.Super.OnLoaded(r0_3, ...)
  ... = ... -- error: untaken top expr
  ... = ... -- error: untaken top expr
  local r1_3 = nil	-- notice: implicit variable refs by block#[1]
  if r2_3 ~= nil then
    r2_3 = tonumber(r1_3)
    r0_3.JumpQuestChainId = r2_3
  end
  r0_3.IsCanReceive = true
  r0_3:RenameWidget()
  r0_3:InitDetailInfo()
  r0_3:InitTrackingButton()
  r0_3:InitTabInfo()
  r0_3:UpdateListViewScrollMultiplier(r0_3.RootWidget.List_Task, 10)
  r2_3 = r0_3.RootWidget.List_Task.ListItems:Num()
  if r2_3 ~= 0 then
    r0_3.RootWidget.List_Task:SetScrollbarVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    r0_3.RootWidget.List_Task:SetScrollbarVisibility(UE4.ESlateVisibility.Collapsed)
  end
  r0_3.RootWidget.Btn_Jump:BindEventOnClicked(r0_3, r0_3.OnClickJumpBtn)
  r2_3 = UE4.UGameplayStatics.GetPlayerCharacter(r0_3, 0)
  r0_3.CurPlayerCharacterLevel = r2_3:GetAttr("Level")
  if r0_3:IsAnimationPlaying(r0_3.In) then
    return 
  end
  r0_3:PlayAnimation(r0_3.In)
  AudioManager(r0_3):PlayUISound(r0_3, "event:/ui/armory/open", "OpenTaskMain", nil)
  r0_3.RootWidget.List_Task:SetNavigationRuleCustom(EUINavigation.Right, {
    r0_3,
    r0_3.OnNavigationRight
  })
  r0_3.RootWidget.Group_TaskDetail:SetNavigationRuleCustom(UE4.EUINavigation.Left, {
    r0_3,
    function()
      -- line: [84, 88] id: 4
      if r0_3.CurFocusWidget then
        r0_3.CurFocusWidget.Task_SubItem:SetFocus()
      end
    end
  })
end
function r0_0.InitTabInfo(r0_5)
  -- line: [94, 200] id: 5
  local function r1_5(r0_6)
    -- line: [95, 103] id: 6
    for r5_6, r6_6 in pairs(DataMgr.QuestTab) do
      if r6_6 and r6_6.QuestType == r0_6 then
        return r6_6
      end
    end
    -- close: r1_6
    return nil
  end
  r0_5.TempQuestTabData = {
    [1] = r1_5(Const.AllQuestChainType),
    [2] = r1_5(Const.MainQuestChainType),
    [3] = r1_5(Const.MainActivityQuestChainType),
    [4] = r1_5(Const.LimTimeQuestChainType),
    [5] = r1_5(Const.SpecialSideQuestChainType),
    [6] = r1_5(Const.SideQuestChainType),
    [7] = r1_5(Const.DailyQuestChainType),
  }
  local r2_5 = 1
  for r7_5, r8_5 in pairs(r0_5.TempQuestTabData) do
    if r8_5 then
      r9_0[r7_5] = r8_5
      r7_5 = r7_5 + 1
    end
  end
  -- close: r3_5
  for r7_5, r8_5 in pairs(r9_0) do
    local r9_5 = r8_5
    if r9_5 then
      table.insert(r0_5.AllTabInfo, {
        Text = GText(r9_5.TabName),
        TabId = r7_5,
        IconPath = r9_5.Icon,
      })
    end
  end
  -- close: r3_5
  local r3_5 = r0_5.CommonTabWidget
  local r5_5 = {
    TitleName = GText("MAIN_UI_QUEST"),
    LeftKey = "Q",
    RightKey = "E",
    Tabs = r0_5.AllTabInfo,
    DynamicNode = {
      "Back",
      "BottomKey"
    },
  }
  local r6_5 = {
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = r10_5,
          Owner = r0_5,
        }
      },
      Desc = GText("UI_BACK"),
    }
  }
  local r10_5 = r0_5.OnReturnKeyDown
  r5_5.BottomKeyInfo = r6_5
  r5_5.StyleName = "Text"
  r5_5.OwnerPanel = r0_5
  r5_5.BackCallback = r0_5.OnReturnKeyDown
  r3_5:Init(r5_5)
  for r7_5, r8_5 in pairs(r0_5.TempQuestTabData) do
    if r8_5 then
      local r9_5 = r8_5.TabName
      r10_5 = r8_5.TabId
      ReddotManager.AddListenerEx(r9_5, r0_5, function(r0_7, r1_7, r2_7, r3_7)
        -- line: [149, 155] id: 7
        if r1_7 > 0 then
          r0_7.CommonTabWidget:ShowTabRedDotByTabId(r10_5, true, false, false)
        else
          r0_7.CommonTabWidget:ShowTabRedDotByTabId(r10_5, false, false, false)
        end
      end)
      -- close: r9_5
    end
  end
  -- close: r3_5
  r0_5.CommonTabWidget:BindEventOnTabSelected(r0_5, r0_5.OnTabChange)
  r3_5 = r2_0:Get("QuestPantlTab", true)
  if r3_5 ~= nil and false then
    r0_5.CommonTabWidget:SelectTab(r3_5)
  else
    r0_5.CommonTabWidget:SelectTab(1)
  end
  local r4_5 = GWorld:GetAvatar()
  if not r4_5 then
    return false
  end
  r5_5 = r4_5.DetectiveGameUnlockedQuestions
  if r5_5 ~= nil then
    r6_5 = 0
    for r11_5, r12_5 in pairs(r5_5) do
      r6_5 = r6_5 + 1
    end
    -- close: r7_5
    if r6_5 > 0 then
      r0_5.CommonTabWidget.Pos_Reasoning:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      local r8_5 = UIManager(r0_5)
      r10_5 = "WidgetBlueprint\'/Game/UI/WBP/Reasoning/Widget/WBP_Reasoning_Entrance.WBP_Reasoning_Entrance\'"
      r0_5.CommonTabWidget.ReasoningEntrance = r8_5:CreateWidget(r10_5, true)
      r10_5 = "Minigame_Textmap_100304"
      r0_5.CommonTabWidget.ReasoningEntrance.Text:SetText(GText(r10_5))
      r0_5.CommonTabWidget.Pos_Reasoning:ClearChildren()
      r0_5.CommonTabWidget.Pos_Reasoning:AddChildToOverlay(r0_5.CommonTabWidget.ReasoningEntrance)
      r10_5 = r0_5.OnClickReasoningEntrance
      r0_5.CommonTabWidget.ReasoningEntrance.Btn_Click.OnClicked:Add(r0_5, r10_5)
      local r7_5 = r0_5.CommonTabWidget.ReasoningEntrance.Key_GamePad
      local r9_5 = {}
      r10_5 = {}
      local r11_5 = {
        Type = "Img",
        ImgShortPath = "Menu",
      }
      -- setlist for #10 failed
      r9_5.KeyInfoList = r10_5
      r7_5:CreateCommonKey(r9_5)
      if r0_5.UsingGamepad then
        r0_5.CommonTabWidget.ReasoningEntrance.Key_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      end
    end
  end
  r0_5:UpdateReasoningRedDot()
end
function r0_0.UpdateTabWidgetReddot(r0_8)
  -- line: [202, 270] id: 8
end
function r0_0.TriggerLevelHardWarningUIShow(r0_9, r1_9, r2_9)
  -- line: [272, 284] id: 9
  local r3_9 = r4_0:GetQuestDetail(r1_9, r2_9)
  local r4_9 = nil
  if r3_9 ~= nil then
    r4_9 = r4_0:GetQuestDetail(r1_9, r2_9).RecommendLevel
  end
  if r4_9 ~= nil and r0_9.CurPlayerCharacterLevel < r4_9 then
    r0_9.RootWidget.Text_HardWarning:SetText(GText("UI_QUEST_TOOHARD"))
    r0_9.RootWidget.HB_HardWarning:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    r0_9.RootWidget.HB_HardWarning:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r0_0.OnTabChange(r0_10, r1_10)
  -- line: [286, 432] id: 10
  EventManager:FireEvent(EventID.OnSelectQuestSubItem, nil)
  local r2_10 = r1_10.Idx
  r0_10.CurTabId = r2_10
  local r3_10 = r0_10:GetQuestData(r2_10) and {}
  r0_10.RootWidget.List_Task:ClearListItems()
  r0_10.CurSelectQuest = nil
  local r4_10 = r0_10:GetCurTabFirstQuestId(r3_10, r2_10)
  r0_10.CurSelectId = 0
  if r0_10.TrackingQuestId and r0_10:IsInTab(r0_10.TrackingQuestId, r2_10) then
    r0_10.CurSelectId = r0_10.TrackingQuestId
  else
    local r5_10 = r4_0.TaskMainLastSelectId
    if r5_10 == 0 or r5_10 == nil then
      r0_10.CurSelectId = r4_10
    else
      r0_10.CurSelectId = r5_10
    end
  end
  if r0_10.JumpQuestChainId ~= nil then
    r0_10.CurSelectId = r0_10.JumpQuestChainId
    r0_10.JumpQuestChainId = nil
  end
  local r5_10 = 0
  local r6_10 = false
  for r11_10, r12_10 in pairs(r3_10) do
    for r16_10 = 1, #r12_10, 1 do
      local r17_10 = false
      local r18_10 = r12_10[r16_10]
      if r16_10 == 1 then
        r17_10 = true
      end
      local r19_10 = nil
      if r12_10[1] and r12_10[1].QuestChainId == -1 then
        local r20_10 = r4_0
        local r22_10 = {
          DoingQuestId = -1,
          QuestChainId = -1,
          CompletedQuestId = -1,
          OwnerWidget = r0_10,
          State = 1,
          IsShowType = r17_10,
          IsTracking = false,
          IsSelectDoingQuest = r18_10.QuestChainId == r0_10.CurSelectId,
          UI = nil,
        }
        r19_10 = r20_10:CreateListItemContent(r22_10)
      else
        local r20_10 = r4_0
        local r22_10 = {
          DoingQuestId = r18_10.DoingQuestId,
          QuestChainId = r18_10.QuestChainId,
          CompletedQuestId = r18_10.CompleteQuestId,
          OwnerWidget = r0_10,
          State = r18_10.State,
          IsShowType = r17_10,
          IsTracking = r0_10.TrackingQuestId and r0_10.TrackingQuestId == r18_10.QuestChainId,
          IsSelectDoingQuest = r18_10.QuestChainId == r0_10.CurSelectId,
          UI = nil,
        }
        r19_10 = r20_10:CreateListItemContent(r22_10)
      end
      if r19_10.IsSelectDoingQuest then
        r6_10 = true
      end
      r0_10.RootWidget.List_Task:AddItem(r19_10)
      r5_10 = r5_10 + 2
    end
  end
  -- close: r7_10
  local r7_10 = nil
  for r12_10, r13_10 in ipairs(r0_10.RootWidget.List_Task:GetListItems():ToTable()) do
    r13_10.PreItem = r7_10
    r7_10 = r13_10
    local r14_10 = r0_10.RootWidget.List_Task:GetItemAt(r12_10)
    if r14_10 then
      r13_10.NextItem = r14_10
    else
      r13_10.NextItem = nil
    end
  end
  -- close: r8_10
  if not r6_10 then
    r0_10.CurSelectId = r4_10
  end
  if r0_10.PlatformName == "PC" then
    r0_10.RootWidget.Group_TaskList:SetWidthOverride(r0_10.RootWidget.Size_Group_TaskList_P)
  elseif r0_10.PlatformName == "Mobile" then
    r0_10.RootWidget.Group_TaskList:SetWidthOverride(r0_10.RootWidget.Size_Group_TaskList_M)
  end
  if r5_10 > 0 then
    r0_10.IsTaskEmpty = false
    r0_10.RootWidget.Group_TaskDetail_Empty:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_10.RootWidget.Group_TaskDetail:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_10.RootWidget.Group_TaskList:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_10.RootWidget.List_Task:SetScrollbarVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_10.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
  else
    r0_10.IsTaskEmpty = true
    r0_10.RootWidget.Group_TaskDetail_Empty:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_10.RootWidget.Group_TaskDetail:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_10.RootWidget.Group_TaskList:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_10.RootWidget.Text_MailDetail_Empry:SetText(GText("UI_QUEST_CLEAR"))
    r0_10.RootWidget.List_Task:SetScrollbarVisibility(UE4.ESlateVisibility.Collapsed)
    r0_10.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
    if r0_10.UsingGamepad then
      r0_10:InitTabPadKeyInfoForBack()
    end
  end
  r0_10:InitDetailInfo()
  r0_10.RootWidget:BindToAnimationFinished(r0_10.RootWidget.Tab_Change, {
    r0_10,
    function()
      -- line: [425, 428] id: 11
      r0_10:ScrollToSelectedWidget(r0_10.CurSelectId)
      r0_10.RootWidget:UnbindAllFromAnimationFinished(r0_10.RootWidget.Tab_Change)
    end
  })
  r0_10.RootWidget:PlayAnimation(r0_10.RootWidget.Tab_Change)
  r0_10.CurTrackWidget = nil
  r0_10:RefreshOpInfoByInputDevice(r0_10.GameInputModeSubsystem:GetCurrentInputType(), r0_10.GameInputModeSubsystem:GetCurrentGamepadName())
end
function r0_0.GetQuestData(r0_12, r1_12)
  -- line: [436, 514] id: 12
  local r2_12 = GWorld:GetAvatar()
  if not r2_12 then
    return 
  end
  local r3_12 = r2_12.QuestChains and {}
  local r4_12 = {}
  r0_12.HasToBeContinued = true
  local r5_12 = r9_0[r1_12].QuestType
  if r5_12 == -1 or r5_12 == 1 then
    for r10_12, r11_12 in pairs(r3_12) do
      if DataMgr.QuestChain[r10_12] then
        local r12_12 = DataMgr.QuestChain[r10_12].QuestChainType
        local r13_12 = r0_12:CheckQuestIsShowByCheckState(r10_12, r11_12)
        if r11_12.State ~= 3 and r11_12.CanShow and r13_12 then
          local r14_12 = DataMgr.QuestChain[r10_12].QuestChainType
          if r14_12 == 1 or r14_12 == 6 then
            r0_12.HasToBeContinued = false
            break
          end
        end
      end
    end
    -- close: r6_12
  else
    r0_12.HasToBeContinued = false
  end
  if r0_12.HasToBeContinued then
    r4_12[1] = r4_12[1] and {}
    table.insert(r4_12[1], {
      QuestChainId = -1,
    })
  end
  local r6_12 = 0
  if r5_12 == -1 then
    for r11_12, r12_12 in pairs(r3_12) do
      if DataMgr.QuestChain[r11_12] then
        local r13_12 = DataMgr.QuestChain[r11_12].QuestChainType
        local r14_12 = r0_12:CheckQuestIsShowByCheckState(r11_12, r12_12)
        if r12_12.State ~= 3 and r12_12.CanShow and r14_12 then
          r4_12[r13_12] = r4_12[r13_12] and {}
          table.insert(r4_12[r13_12], r12_12)
        end
      else
        UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, UE.EStoryLogType.Quest, "账号已有任务服务器数据，但任务表内数据已不存在", string.format("任务面板不显示任务： %s", r11_12))
      end
    end
    -- close: r7_12
  else
    for r11_12, r12_12 in pairs(r3_12) do
      if DataMgr.QuestChain[r11_12] then
        local r13_12 = DataMgr.QuestChain[r11_12].QuestChainType
        local r14_12 = r0_12:CheckQuestIsShowByCheckState(r11_12, r12_12)
        if r12_12.State ~= 3 and r12_12.CanShow and r13_12 == r5_12 and r14_12 then
          r4_12[r13_12] = r4_12[r13_12] and {}
          table.insert(r4_12[r13_12], r12_12)
        end
      else
        UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, UE.EStoryLogType.Quest, "账号已有任务服务器数据，但任务表内数据已不存在", string.format("任务面板不显示任务: %s", r11_12))
      end
    end
    -- close: r7_12
  end
  for r11_12, r12_12 in pairs(r4_12) do
    table.sort(r4_12[r11_12], function(r0_13, r1_13)
      -- line: [500, 500] id: 13
      return r0_13.QuestChainId < r1_13.QuestChainId
    end)
  end
  -- close: r7_12
  if r1_12 ~= 1 then
    return r4_12
  end
  local r7_12 = {}
  for r12_12, r13_12 in pairs(r9_0) do
    if r13_12 and r13_12.QuestType and r13_12.QuestType ~= Const.AllQuestChainType and r4_12[r13_12.QuestType] then
      table.insert(r7_12, r4_12[r13_12.QuestType])
    end
  end
  -- close: r8_12
  return r7_12
end
function r0_0.CheckQuestIsShowByCheckState(r0_14, r1_14, r2_14)
  -- line: [516, 576] id: 14
  local r3_14 = 0
  if DataMgr.QuestChain[r1_14] and DataMgr.QuestChain[r1_14].QuestChainType then
    r3_14 = DataMgr.QuestChain[r1_14].QuestChainType
  end
  if not GWorld:GetAvatar() then
    return false
  end
  if r2_14.State == 3 then
    return false
  end
  local r5_14 = r3_0.NowTime()
  local r6_14 = DataMgr.QuestChain[r1_14].StartTime
  local r7_14 = DataMgr.QuestChain[r1_14].EndTime
  if r6_14 and r7_14 and (r5_14 < r6_14 or r7_14 < r5_14) and (r3_14 == Const.LimTimeQuestChainType or r3_14 == Const.MainActivityQuestChainType) then
    return false
  end
  if r6_14 and r5_14 < r6_14 and (r3_14 == Const.LimTimeQuestChainType or r3_14 == Const.MainActivityQuestChainType) then
    return false
  end
  if r2_14.CanShow == false and (r3_14 == Const.LimTimeQuestChainType or r3_14 == Const.MainActivityQuestChainType) then
    return false
  end
  if r2_14.State == 0 then
    if (r3_14 == Const.LimTimeQuestChainType or r3_14 == Const.MainActivityQuestChainType) and r2_14.CanShow == false then
      return false
    elseif (r3_14 == Const.LimTimeQuestChainType or r3_14 == Const.MainActivityQuestChainType) and r2_14.CanShow == true then
      return true
    end
    return true
  end
  local r8_14 = DataMgr.STLExportQuestChain[r1_14]
  if r8_14 == nil or r8_14.Quests == nil or r8_14.Quests[r2_14.DoingQuestId] == nil then
    return false
  end
  if r8_14.Quests[r2_14.DoingQuestId].IsPreQuest then
    return false
  else
    return true
  end
end
function r0_0.InitDetailInfo(r0_15)
  -- line: [578, 583] id: 15
  r0_15.RootWidget.VB_TaskDetails:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_15.RootWidget.Group_TaskTitle:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_15.RootWidget.HB_Reward:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_15.RootWidget.Common_Button_Text_PC:SetVisibility(UE4.ESlateVisibility.Collapsed)
end
function r0_0.ShowQuestDetailInfo(r0_16, r1_16)
  -- line: [587, 861] id: 16
  if not r1_16 then
    return 
  end
  if r1_16.OwnerWidget.QuestChainId == -1 then
    r0_16.CurSelectQuest = r1_16
    r0_16.RootWidget.VB_TaskDetails:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_16.RootWidget.Group_TaskTitle:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_16.RootWidget.Common_Button_Text_PC:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_16.RootWidget.Text_TaskTitle:SetText(GText("Quest_ToBeContinued"))
    r0_16.RootWidget.Text_TaskTitle:SetRenderOpacity(0)
    r0_16:AddTimer(0.01, function()
      -- line: [600, 604] id: 17
      r0_16.RootWidget.Text_TaskTitle:SetTextByPixelWidth(GText("Quest_ToBeContinued"), UIManager(r0_16):GetWidgetRenderSize(r0_16.RootWidget.Text_TaskTitle).X)
      r0_16.RootWidget.Text_TaskTitle:SetRenderOpacity(1)
    end, false, 0, "DelayToShowText")
    r0_16.RootWidget.HB_Position:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_16.RootWidget.Group_Title_UnlockTask:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_16.RootWidget.VB_UnlockCondition:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_16.RootWidget.Text_TaskDetail:SetText(GText("AllQuest_Over_Description"))
    r0_16.RootWidget.Text_TaskObject:SetText(GText("UI_QUEST_CONTENT"))
    r0_16.RootWidget.Text_TaskRewards:SetText(GText("UI_QUEST_REWARDS"))
    r0_16.RootWidget.ListView_Rewards:ClearListItems()
    r0_16.RootWidget.ListView_Rewards:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_16.RootWidget.VB_TaskReward:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_16.RootWidget.WS_Bottom:SetActiveWidgetIndex(1)
    r0_16.RootWidget.Group_TimeRemaining:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_16:SetTrackButtonText(false)
    return 
  end
  r0_16.RootWidget.VB_TaskReward:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_16.RootWidget.WS_Bottom:SetActiveWidgetIndex(0)
  r0_16.RootWidget.HB_Position:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_16.CurSelectQuest = r1_16
  local r2_16 = r1_16.QuestID
  local r3_16 = r1_16.OwnerWidget.QuestChainId
  local r4_16 = DataMgr.QuestChain[r3_16].QuestChainReward
  local r5_16 = DataMgr.QuestChain[r3_16].UnlockCondition
  local r6_16 = DataMgr.QuestChain[r3_16].UnlockTitle
  local r7_16 = DataMgr.QuestChain[r3_16].UnlockContent
  local r8_16 = nil
  if r5_16 then
    r8_16 = DataMgr.Condition[r5_16].ConditionMap
  end
  if r1_16.OwnerWidget.bAdvance then
    r0_16.RootWidget.Btn_Qa:Init({
      OwnerWidget = r0_16,
      MenuPlacement = EMenuPlacement.MenuPlacement_AboveAnchor,
      TextContent = GText("UI_FAKEQUEST_TIPS"),
    })
    r0_16.RootWidget.Group_IsDoneSign:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_16.RootWidget.Text_IsDone:SetText(GText("UI_FAKEQUEST_TEXT"))
    r0_16.RootWidget.Btn_QaClick.OnClicked:Add(r0_16, r0_16.OpenTips)
  else
    r0_16.RootWidget.Group_IsDoneSign:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  r0_16.RootWidget.VB_TaskDetails:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_16.RootWidget.Group_TaskTitle:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_16.RootWidget.Common_Button_Text_PC:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  local r9_16 = GWorld:GetAvatar()
  if not r9_16 then
    return 
  end
  if not r4_0:GetQuestDetail(r3_16, r2_16) then
    return 
  end
  if r1_16.State == r8_0.Lock and r6_16 and r7_16 then
    r0_16.RootWidget.Text_TaskTitle:SetText(GText(r6_16))
    r0_16.RootWidget.Text_TaskDetail:SetText(GText(r7_16))
  else
    r0_16.RootWidget.Text_TaskTitle:SetText(r1_16.QuestName)
    r0_16.RootWidget.Text_TaskTitle:SetRenderOpacity(0)
    r0_16:AddTimer(0.01, function()
      -- line: [671, 675] id: 18
      r0_16.RootWidget.Text_TaskTitle:SetTextByPixelWidth(r1_16.QuestName, UIManager(r0_16):GetWidgetRenderSize(r0_16.RootWidget.Text_TaskTitle).X)
      r0_16.RootWidget.Text_TaskTitle:SetRenderOpacity(1)
    end, false, 0, "DelayToShowText")
    r0_16.RootWidget.Text_TaskDetail:SetText(r1_16.QuestDeatil)
  end
  r0_16.RootWidget.Text_TaskObject:SetText(GText("UI_QUEST_CONTENT"))
  if r1_16.State == r8_0.Doing then
    r0_16.RootWidget.Group_TimeRemaining:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    r0_16.RootWidget.Group_TimeRemaining:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if r1_16.QuestPosition ~= "" then
    r0_16.RootWidget.HB_Position:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_16.RootWidget.Text_Position:SetText(r1_16.QuestPosition)
  else
    r0_16.RootWidget.HB_Position:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if not r4_16 then
    r0_16.RootWidget.Group_Title_Rewards:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_16.RootWidget.ListView_Rewards:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_16.RootWidget.HB_Reward:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    r0_16.RootWidget.Group_Title_Rewards:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_16.RootWidget.Text_TaskRewards:SetText(GText("UI_QUEST_REWARDS"))
    r0_16.RootWidget.ListView_Rewards:ClearListItems()
    r0_16.RootWidget.ListView_Rewards:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_16:SortReward(r4_16, r1_16.OwnerWidget.bAdvance)
  end
  local r11_16 = r9_16 and r9_16:CheckCondition(r5_16)
  if not r5_16 then
    r11_16 = false
  end
  r0_16.RootWidget.VB_UnlockCondition:ClearChildren()
  if r1_16.State == r8_0.Doing and r8_16 and not r11_16 then
    r0_16.RootWidget.Group_Title_UnlockTask:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_16.RootWidget.VB_UnlockCondition:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_16.RootWidget.Text_UnlockTask:SetText(GText("UI_QUEST_CONDITIONREQUEST"))
    for r16_16, r17_16 in pairs(r8_16) do
      for r21_16 = 1, #r17_16, 1 do
        local r22_16 = r17_16[r21_16]
        local r23_16 = ConditionUtils["Judge" .. r16_16](r9_16, r22_16)
        local r24_16 = r0_16:CreateWidgetNew("TaskUnlockCondition")
        r0_16.RootWidget.VB_UnlockCondition:AddChildToVerticalBox(r24_16)
        r24_16.bIsFocusable = true
        r24_16:Init(r23_16, r0_16)
        r24_16:SetConditionText(r16_16, r23_16, r22_16)
        if r16_16 == "TrueQuestChain" or r16_16 == "QuestChain" then
          local r25_16 = "QuestChain"
          if r0_16["ConditionJump" .. r25_16] and not r23_16 then
            r24_16.CanClick = true
            r24_16:BindEventOnClicked(r0_16, r0_16["ConditionJump" .. r25_16], r22_16)
          end
        end
        r24_16:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      end
    end
    -- close: r12_16
  elseif r1_16.State == r8_0.Lock and r8_16 and not r11_16 then
    r0_16.RootWidget.Group_Title_UnlockTask:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_16.RootWidget.VB_UnlockCondition:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_16.RootWidget.Text_UnlockTask:SetText(GText("UI_QUEST_CONDITIONREQUEST"))
    for r16_16, r17_16 in pairs(r8_16) do
      for r21_16 = 1, #r17_16, 1 do
        local r22_16 = r17_16[r21_16]
        local r23_16 = ConditionUtils["Judge" .. r16_16](r9_16, r22_16)
        local r24_16 = r0_16:CreateWidgetNew("TaskUnlockCondition")
        r24_16:Init(r23_16, r0_16)
        r24_16:SetConditionText(r16_16, r23_16, r22_16)
        if r16_16 == "TrueQuestChain" or r16_16 == "QuestChain" then
          local r25_16 = "QuestChain"
          if r0_16["ConditionJump" .. r25_16] and not r23_16 then
            r24_16.CanClick = true
            r24_16:BindEventOnClicked(r0_16, r0_16["ConditionJump" .. r25_16], r22_16)
          end
        end
        r0_16.RootWidget.VB_UnlockCondition:AddChildToVerticalBox(r24_16)
        r24_16:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      end
    end
    -- close: r12_16
  else
    r0_16.RootWidget.Group_Title_UnlockTask:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_16.RootWidget.VB_UnlockCondition:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if r0_16.RootWidget.VB_UnlockCondition:GetAllChildren():Length() > 0 then
    local r12_16 = r0_16.RootWidget.VB_UnlockCondition:GetAllChildren():Length()
    for r17_16, r18_16 in pairs(r0_16.RootWidget.VB_UnlockCondition:GetAllChildren()) do
      r18_16:SetNavigationRuleCustom(EUINavigation.Left, {
        r0_16,
        function()
          -- line: [767, 769] id: 19
          r0_16.CurFocusWidget.Task_SubItem:SetFocus()
        end
      })
      if r17_16 == 1 then
        r18_16:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
        r18_16:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
        local r19_16 = r0_16.RootWidget.VB_UnlockCondition:GetChildAt(r17_16)
        if r19_16 then
          r18_16:SetNavigationRuleExplicit(EUINavigation.Down, r19_16)
        else
          r18_16:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
        end
      elseif r17_16 == r12_16 then
        r18_16:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
        r18_16:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
        local r19_16 = r0_16.RootWidget.VB_UnlockCondition:GetChildAt(r17_16 + -2)
        if r19_16 then
          r18_16:SetNavigationRuleExplicit(EUINavigation.Up, r19_16)
        else
          r18_16:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
        end
      else
        local r19_16 = r0_16.RootWidget.VB_UnlockCondition:GetChildAt(r17_16 + -2)
        if r19_16 then
          r18_16:SetNavigationRuleExplicit(EUINavigation.Up, r19_16)
        end
        local r20_16 = r0_16.RootWidget.VB_UnlockCondition:GetChildAt(r17_16)
        if r20_16 then
          r18_16:SetNavigationRuleExplicit(EUINavigation.Down, r20_16)
        else
          r18_16:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
        end
      end
    end
    -- close: r13_16
  end
  if not r11_16 then
    r0_16.RootWidget.Common_Button_Text_PC:ForbidBtn(true)
    if not r0_16.IsForbiddenButton then
      r0_16.RootWidget.Common_Button_Text_PC:PlayAnimation(r0_16.RootWidget.Common_Button_Text_PC.Btn_Forbidden)
    end
    r0_16.IsForbiddenButton = true
    r0_16:SetTrackButtonText(false)
  else
    r0_16.RootWidget.Common_Button_Text_PC:ForbidBtn(false)
    if r0_16.IsForbiddenButton then
      r0_16.RootWidget.Common_Button_Text_PC:PlayAnimation(r0_16.RootWidget.Common_Button_Text_PC.Btn_Normal)
    end
    r0_16.IsForbiddenButton = false
    r0_16:SetTrackButtonText(r0_16.TrackingQuestId == r3_16)
  end
  if r0_16.TrackingQuestId == r3_16 and not r0_16.CurTrackingQuest then
    r0_16.CurTrackingQuest = r0_16.CurSelectQuest
  end
  if DataMgr.QuestChain[r3_16] and DataMgr.QuestChain[r3_16].QuestChainType == Const.LimTimeQuestChainType then
    r0_16.RootWidget.Group_TimeRemaining:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_16.RootWidget.Com_Time:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_16:UpdateComTime(r3_16)
  else
    r0_16.RootWidget.Group_TimeRemaining:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r0_0.OpenTips(r0_20)
  -- line: [863, 872] id: 20
  r0_20.RootWidget.Btn_Qa:PlayAnimation(r0_20.RootWidget.Btn_Qa.Click)
  r0_20.RootWidget.Btn_Qa.Btn_Click:SetChecked(true)
  r0_20.RootWidget.Btn_Qa.TipsDetail:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  r0_20.RootWidget.Btn_Qa.TipsDetail:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  r0_20.RootWidget.Btn_Qa.TipsDetail:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  r0_20.RootWidget.Btn_Qa.TipsDetail:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  r0_20.RootWidget.Btn_Qa.TipsDetail:SetNavigationRuleBase(EUINavigation.Next, EUINavigationRule.Stop)
  r0_20.RootWidget.Btn_Qa.TipsDetail:SetNavigationRuleBase(EUINavigation.Previous, EUINavigationRule.Stop)
end
function r0_0.UpdateComTime(r0_21, r1_21)
  -- line: [875, 883] id: 21
  if DataMgr.QuestChain[r1_21] and DataMgr.QuestChain[r1_21].StartTime and DataMgr.QuestChain[r1_21].EndTime and DataMgr.QuestChain[r1_21].EndTime - r3_0.NowTime() > 0 then
    local r3_21, r4_21 = r1_0.GetLeftTimeStrStyle2(DataMgr.QuestChain[r1_21].EndTime, r3_0.NowTime())
    r0_21.RootWidget.Com_Time:SetTimeText(GText(""), r3_21)
  end
end
function r0_0.OnKeyUp(r0_22, r1_22, r2_22)
  -- line: [885, 902] id: 22
  local r3_22 = UE4.UKismetInputLibrary.GetKey(r2_22)
  local r4_22 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_22)
  local r5_22 = false
  if not UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_22) and r4_22 == CommonUtils:GetActionMappingKeyName("OpenTask") then
    r0_22.IsCanCloseByHotKey = true
  end
  if r5_22 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end
function r0_0.OnKeyDown(r0_23, r1_23, r2_23)
  -- line: [904, 1000] id: 23
  if CommonUtils:IfExistSystemGuideUI(r0_23) then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  local r3_23 = false
  local r5_23 = UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_23))
  if r5_23 == "Q" then
    r0_23.CommonTabWidget:TabToLeft()
  elseif r5_23 == "E" then
    r0_23.CommonTabWidget:TabToRight()
  elseif r5_23 == "Escape" then
    r0_23:OnReturnKeyDown()
  elseif r5_23 == CommonUtils:GetActionMappingKeyName("OpenTask") and r0_23.IsCanCloseByHotKey then
    r0_23:PlayOutAnim()
  elseif r5_23 == "Gamepad_LeftThumbstick" then
    if r0_23.IsTaskEmpty == true then
      return 
    end
    r0_23.RootWidget.ListView_Rewards:NavigateToIndex(0)
    r0_23:IsShowGamePad(false)
    r0_23:InitTabPadKeyInfoForReward()
  elseif r5_23 == "Gamepad_RightThumbstick" then
    if r0_23.RootWidget.Group_IsDoneSign:GetVisibility() == ESlateVisibility.Collapsed then
      return 
    end
    r0_23:OpenTips()
    r0_23:IsShowGamePad(false)
    r0_23:InitTabPadKeyInfoForTips()
  elseif r5_23 == "Gamepad_Special_Right" and r0_23.CommonTabWidget.ReasoningEntrance then
    r0_23:OnClickReasoningEntrance()
  elseif r5_23 == "Gamepad_FaceButton_Top" then
    if r0_23.IsTaskEmpty == true then
      return 
    end
    if r0_23.RootWidget.ListView_Rewards:HasFocusedDescendants() then
      return 
    elseif r0_23.RootWidget.VB_UnlockCondition:HasFocusedDescendants() then
      return 
    elseif r0_23.RootWidget.Btn_Qa:HasFocusedDescendants() then
      return 
    end
    if r0_23.RootWidget.Group_Jump:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
      r0_23:OnClickJumpBtn()
    end
  elseif r5_23 == "Gamepad_FaceButton_Left" then
    if r0_23.IsTaskEmpty == true then
      return 
    end
    if r0_23.RootWidget.ListView_Rewards:HasFocusedDescendants() then
      return 
    elseif r0_23.RootWidget.VB_UnlockCondition:HasFocusedDescendants() then
      return 
    elseif r0_23.RootWidget.Btn_Qa:HasFocusedDescendants() then
      return 
    end
    if r0_23.RootWidget.Common_Button_Text_PC.IsForbidden then
      UIManager(r0_23):ShowUITip("CommonToastMain", GText("UI_QUEST_TRACK_LOCK"), 1.5)
      return 
    end
    r0_23:OnTrackButtonClicked()
  elseif r5_23 == "Gamepad_FaceButton_Right" then
    if r0_23.IsTaskEmpty == true then
      r0_23:OnReturnKeyDown()
    elseif r0_23.RootWidget.List_Task:HasFocusedDescendants() then
      r0_23:OnReturnKeyDown()
    elseif r0_23.RootWidget.ListView_Rewards:HasFocusedDescendants() or r0_23.RootWidget.ListView_Rewards:HasAnyUserFocus() then
      r0_23.CurFocusWidget.Task_SubItem:SetFocus()
    elseif r0_23.RootWidget.VB_UnlockCondition:HasFocusedDescendants() then
      r0_23.CurFocusWidget.Task_SubItem:SetFocus()
    elseif r0_23.RootWidget.Btn_Qa:HasFocusedDescendants() then
      r0_23.CurFocusWidget.Task_SubItem:SetFocus()
    elseif r0_23.RootWidget:HasAnyUserFocus() then
      r0_23:OnReturnKeyDown()
    end
  elseif r5_23 == "Gamepad_LeftShoulder" or r5_23 == "Gamepad_RightShoulder" then
    if r0_23.RootWidget.ListView_Rewards:HasFocusedDescendants() or r0_23.RootWidget.ListView_Rewards:HasAnyUserFocus() then
      return 
    elseif r0_23.RootWidget.VB_UnlockCondition:HasFocusedDescendants() then
      return 
    elseif r0_23.RootWidget.Btn_Qa:HasFocusedDescendants() then
      return 
    end
    r3_23 = r0_23.CommonTabWidget:Handle_KeyEventOnGamePad(r5_23)
  end
  if r3_23 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end
function r0_0.OnReturnKeyDown(r0_24, r1_24)
  -- line: [1002, 1006] id: 24
  if not r0_24:IsAnimationPlaying(r0_24.In) then
    r0_24:PlayOutAnim(r1_24)
  end
end
function r0_0.PlayOutAnim(r0_25, r1_25)
  -- line: [1008, 1026] id: 25
  if r0_25:IsAnimationPlaying(r0_25.Out) then
    return 
  end
  if r0_25:IsAnimationPlaying(r0_25.In) then
    return 
  end
  r0_25:UnbindAllFromAnimationFinished(r0_25.Out)
  if r1_25 == nil or r1_25 == true then
    r0_25:BindToAnimationFinished(r0_25.Out, {
      r0_25,
      r0_25.Close
    })
  else
    r0_25:BindToAnimationFinished(r0_25.Out, {
      r0_25,
      r0_25.SetTrackingQuestInfoToServer
    })
  end
  r0_25:PlayAnimation(r0_25.Out)
end
function r0_0.Close(r0_26)
  -- line: [1028, 1133] id: 26
  r2_0:Set("QuestPantlTab", r0_26.SaveTabId and r0_26.CurTabId, true)
  r0_26.Super.Close(r0_26)
  local r1_26 = GWorld:GetAvatar()
  if not r1_26 then
    return 
  end
  if r0_26.CurSelectQuest then
    r4_0.TaskMainLastSelectId = r0_26.CurSelectQuest.QuestChainId
  else
    r4_0.TaskMainLastSelectId = nil
  end
  EventManager:FireEvent(EventID.OnReceiveNewQuest)
  r0_26.RootWidget.List_Task:ClearListItems()
  local r2_26 = r1_26.TrackingQuestChainId
  local r3_26 = r0_26.TrackingQuestId
  if r2_26 ~= r3_26 then
    if r1_26.QuestChains[r0_26.TrackingQuestId] then
      r4_0:ResumQuestTaskBarOnTrack(r2_26, r3_26, r1_26.QuestChains[r0_26.TrackingQuestId].DoingQuestId)
    else
      r4_0:ResumQuestTaskBarOnTrack(r2_26, nil, nil)
    end
  end
  if r2_26 and not r3_26 then
    r1_26:CancelQuestTracking(r2_26)
  end
  if r0_26.CurTrackingQuest and r0_26.CurTrackingQuest.SubRegionId <= 0 then
    r0_26:SetTrackingQuestInfoToServer()
  end
end
function r0_0.CheckNeedShowLevelMap(r0_27)
  -- line: [1135, 1221] id: 27
  if r4_0:GetQuestInterfaceJump(r0_27.CurSelectQuest.QuestID) then
    return 
  end
  local r1_27 = false
  local r2_27 = GWorld:GetAvatar()
  if not r2_27 then
    return 
  end
  local r3_27 = Const.HomeBaseSubRegionId
  local function r4_27(r0_28, r1_28)
    -- line: [1146, 1158] id: 28
    if r1_28 == 0 then
      return false
    end
    if r0_28 == r1_28 and r1_28 == r3_27 then
      return false
    end
    if r0_28 ~= r1_28 and r1_28 == r3_27 then
      return true
    end
    return true
  end
  local r6_27 = UE4.UGameplayStatics.GetGameInstance(r0_27):GetGameUIManager()
  local r7_27 = r4_0:GetTrackingQuestDetailInfo()
  local r8_27 = false
  if r7_27 and r7_27.IsFairyLand then
    r8_27 = r7_27.IsFairyLand
  end
  local r9_27 = 0
  if r0_27.CurTrackingQuest then
    r9_27 = MissionIndicatorManager:GetTargetTaskSubRegionId(r0_27.CurTrackingQuest.QuestChainId, r2_27.QuestChains[r0_27.CurTrackingQuest.QuestChainId].DoingQuestId)
  end
  local r10_27 = not r4_0:CheckIsNeedLoadLevelMap(r9_27, r2_27.CurrentRegionId)
  if r0_27.IsTrackingButtonClicked and r0_27.CurTrackingQuest and r8_27 == false and r0_27:CheckIsInSameRegion(r2_27.CurrentRegionId, r9_27) then
    local r11_27, r12_27 = r4_0:GetQuestMapInfo(r0_27.CurTrackingQuest.QuestChainId)
    if not r12_27 then
      return 
    end
    if not r12_27 or not DataMgr.RegionMap[r12_27] or not DataMgr.RegionMap[r12_27].RegionId then
      return 
    end
    local r13_27 = DataMgr.RegionMap[r12_27].RegionId
    if r10_27 == false then
      r1_27 = true
      local r14_27 = r6_27:LoadUINew("LevelMapMain", true)
      if r14_27 then
        r14_27.RealWildMap:ChangeRegionForSmartIndicator(r9_27, r0_27.CurTrackingQuest.QuestChainId)
      end
    else
      EventManager:FireEvent(EventID.OnSetQuestTracking, r0_27.CurSelectQuest.QuestChainId)
      EventManager:FireEvent(EventID.PlayLoopAnimAfterBarAnim)
    end
  elseif r0_27.CurTrackingQuest and r0_27.CurSelectQuest then
    EventManager:FireEvent(EventID.OnSetQuestTracking, r0_27.CurSelectQuest.QuestChainId)
  end
  if r1_27 == false then
    r0_27:Close()
  end
end
function r0_0.CheckIsInSameRegion(r0_29, r1_29, r2_29)
  -- line: [1223, 1237] id: 29
  local r3_29 = Const.HomeBaseSubRegionId
  if r2_29 == 0 then
    return false
  end
  if r1_29 == r2_29 and r2_29 == r3_29 then
    return false
  end
  if r1_29 ~= r2_29 and r2_29 == r3_29 then
    return true
  end
  return true
end
function r0_0.ShowDeliverPopupUI(r0_30, r1_30, r2_30)
  -- line: [1240, 1264] id: 30
  local r3_30 = GWorld:GetAvatar()
  if not r3_30 then
    return 
  end
  r0_30:SetTrackingQuestInfoToServer()
  if r3_30.CurrentRegionId ~= r1_30 then
    local r4_30 = GWorld.GameInstance:GetGameUIManager()
    if not DataMgr.QuestChain[r2_30] then
      return 
    end
    r4_30:ShowCommonPopupUI(100160, {
      ShortText = string.format("%s <H>%s</>", GText("UI_Prompt_QuestTrans"), GText(DataMgr.QuestChain[r2_30].QuestChainName)),
      LeftCallbackObj = r0_30,
      LeftCallbackFunction = r0_30.CancelDeliverTo,
      RightCallbackObj = r0_30,
      RightCallbackFunction = r0_30.DoDeliverTo,
      CloseBtnCallbackObj = r0_30,
      CloseBtnCallbackFunction = r0_30.CancelDeliverTo,
    })
  end
end
function r0_0.CancelDeliverTo(r0_31)
  -- line: [1266, 1268] id: 31
end
function r0_0.DoDeliverTo(r0_32)
  -- line: [1270, 1278] id: 32
  local r1_32 = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if r0_32.CurTrackingQuest and r0_32.CurTrackingQuest.QuestChainId and r0_32.CurTrackingQuest.QuestID then
    local r2_32 = r4_0:GetQuestDetail(r0_32.CurTrackingQuest.QuestChainId, r0_32.CurTrackingQuest.QuestID)
    if IsValid(r1_32) and r2_32 and r2_32.SubRegionId > 0 then
      r1_32:HandleLevelDeliver(UE4.EModeType.ModeRegion, r2_32.SubRegionId, r2_32.FairyLandDeliverIndex, true)
    end
  end
end
function r0_0.CheckAvatarIsInQuestSubRegion(r0_33)
  -- line: [1280, 1297] id: 33
  local r1_33 = GWorld:GetAvatar()
  if not r1_33 then
    return false
  end
  local r3_33, r4_33 = require("BluePrints.UI.TaskPanel.TaskUtils"):GetTrackingQuestMapInfo()
  if not r4_33 then
    return false
  end
  if not r4_33 or not DataMgr.RegionMap[r4_33] or not DataMgr.RegionMap[r4_33].RegionId then
    return false
  end
  local r5_33 = DataMgr.RegionMap[r4_33].RegionId
  return r1_33.CurrentRegionId and r5_33 == DataMgr.SubRegion[r1_33.CurrentRegionId].RegionId
end
function r0_0.Destruct(r0_34)
  -- line: [1299, 1315] id: 34
  if IsValid(r0_34.GameInputModeSubsystem) then
    r0_34.GameInputModeSubsystem.OnInputMethodChanged:Remove(r0_34, r0_34.RefreshOpInfoByInputDevice)
  end
  EventManager:RemoveEvent(EventID.CheckShowMap, r0_34)
  AudioManager(r0_34):SetEventSoundParam(r0_34, "OpenTaskMain", {
    ToEnd = 1,
  })
  r0_34.RootWidget.Btn_Reasoning.OnClicked:Clear()
  for r5_34, r6_34 in pairs(r0_34.TempQuestTabData) do
    if r6_34 then
      ReddotManager.RemoveListener(r6_34.TabName, r0_34)
    end
  end
  -- close: r1_34
  ReddotManager.RemoveListener("DetectiveQuestion", r0_34)
  ReddotManager.RemoveListener("DetectiveAnswer", r0_34)
  r0_0.Super.Destruct(r0_34)
end
function r0_0.GetListItemById(r0_35, r1_35)
  -- line: [1317, 1332] id: 35
  local r2_35 = r0_35.RootWidget.List_Task:GetListItems() and {}
  local r3_35 = nil
  local r4_35 = nil
  for r9_35, r10_35 in pairs(r2_35) do
    if r10_35.QuestChainId == r1_35 then
      r3_35 = r10_35
      r4_35 = r9_35
      break
    end
  end
  -- close: r5_35
  if r3_35 then
    return r4_35, r3_35
  end
end
function r0_0.InitTrackingButton(r0_36)
  -- line: [1334, 1348] id: 36
  local r1_36 = GWorld:GetAvatar()
  if not r1_36 then
    return 
  end
  r0_36.TrackingQuestId = r1_36.TrackingQuestChainId
  r0_36:ReSwitchTaskBarTrackingQuest(r0_36.TrackingQuestId)
  local r2_36 = r0_36.TrackingQuestId
  if r2_36 then
    r2_36 = r2_0:Get("QuestPantlTab", true) and nil
  else
    goto label_21	-- block#4 is visited secondly
  end
  r0_36.SaveTabId = r2_36
  r0_36:SetTrackButtonText(r0_36.TrackingQuestId ~= nil)
  r0_36.RootWidget.Common_Button_Text_PC:BindEventOnClicked(r0_36, r0_36.OnTrackButtonClicked)
  r0_36.RootWidget.Common_Button_Text_PC:BindForbidStateExecuteEvent(r0_36, function()
    -- line: [1344, 1346] id: 37
    UIManager(r0_36):ShowUITip("CommonToastMain", GText("UI_QUEST_TRACK_LOCK"), 1.5)
  end)
  r0_36.RootWidget.Common_Button_Text_PC:SetVisibility(UE4.ESlateVisibility.Collapsed)
end
function r0_0.ReSwitchTaskBarTrackingQuest(r0_38, r1_38)
  -- line: [1350, 1373] id: 38
  local r2_38 = GWorld:GetAvatar()
  if not r2_38 then
    return 
  end
  if r2_38.QuestChains[r1_38] then
    local r4_38 = r4_0:GetQuestExtraInfo(r1_38, r2_38.QuestChains[r1_38].DoingQuestId)
    if r4_38 and not IsEmptyTable(r4_38) then
      for r9_38, r10_38 in pairs(r4_38) do
        if r10_38.Node then
          r10_38.Node:OnCancelTrack()
        end
      end
      -- close: r5_38
    end
  end
  local r3_38 = r4_0:GetTaskBarWidget()
  if r3_38 and r1_38 > 0 then
    r3_38:SwitchTaskBarContentByTracking(true, false)
  end
end
function r0_0.OnTrackButtonClicked(r0_39)
  -- line: [1376, 1421] id: 39
  if not r4_0:JudgeCanTrack() then
    UIManager(r0_39):ShowUITip(UIConst.Tip_CommonTop, GText("Quest_Tips_QuestTrackLock"))
    return 
  end
  r0_39.CurSelectId = r0_39.CurSelectQuest.QuestChainId
  if r0_39.CurSelectId == -1 then
    UIManager(r0_39):ShowUITip(UIConst.Tip_CommonTop, GText("AllQuest_OverTips"))
    return 
  end
  if r0_39.TrackingQuestId == nil or r0_39.TrackingQuestId ~= r0_39.CurSelectId then
    if r0_39.CurTrackingQuest then
      r0_39.CurTrackingQuest:CancelTracking()
    end
    r0_39.TrackingQuestId = r0_39.CurSelectId
    r0_39.SaveTabId = r0_39.CurTabId
    r0_39.CurTrackingQuest = r0_39.CurSelectQuest
    r0_39.CurTrackingQuest:OnTracking(r0_39.TrackingQuestId)
    r0_39.IsTrackingButtonClicked = true
    local r1_39 = r4_0:GetQuestDetail(r0_39.CurTrackingQuest.QuestChainId, r0_39.CurTrackingQuest.QuestID)
    if r1_39 and r1_39.IsFairyLand and r1_39.SubRegionId > 0 then
      r0_39:SetTrackButtonText(r0_39.TrackingQuestId ~= nil)
      r0_39:ShowDeliverPopupUI(r1_39.SubRegionId, r0_39.CurSelectQuest.QuestChainId)
      return 
    end
    if r4_0:GetQuestInterfaceJump(r0_39.CurSelectQuest.QuestID) then
      r0_39:SetTrackingQuestInfoToServer()
      PageJumpUtils:JumpToTargetPageByJumpId(r4_0:GetQuestInterfaceJumpId(r0_39.CurSelectQuest.QuestID))
    elseif r0_39.CurTrackingQuest.SubRegionId > 0 then
      r0_39:SetTrackingQuestInfoToServer()
    end
  elseif r0_39.TrackingQuestId == r0_39.CurSelectId then
    r0_39.CurSelectQuest:CancelTracking()
    r0_39.TrackingQuestId = nil
    r0_39.SaveTabId = nil
    r0_39.CurTrackingQuest = nil
  else
    r0_39.CurTrackingQuest:CancelTracking()
    r0_39.TrackingQuestId = nil
    r0_39.SaveTabId = nil
    r0_39.CurTrackingQuest = nil
  end
  r0_39:SetTrackButtonText(r0_39.TrackingQuestId ~= nil)
end
function r0_0.OnClickJumpBtn(r0_40)
  -- line: [1423, 1448] id: 40
  if not r4_0:JudgeCanTrack() then
    UIManager(r0_40):ShowUITip(UIConst.Tip_CommonTop, GText("Quest_Tips_QuestTrackLock"))
    return 
  end
  r0_40.CurSelectId = r0_40.CurSelectQuest.QuestChainId
  if r0_40.TrackingQuestId ~= nil and r0_40.TrackingQuestId == r0_40.CurSelectId then
    r0_40.TrackingQuestId = r0_40.CurSelectId
    r0_40.CurTrackingQuest = r0_40.CurSelectQuest
    r0_40.IsTrackingButtonClicked = true
    local r1_40 = r4_0:GetQuestDetail(r0_40.CurTrackingQuest.QuestChainId, r0_40.CurTrackingQuest.QuestID)
    if r1_40 and r1_40.IsFairyLand and r1_40.SubRegionId > 0 then
      r0_40:SetTrackButtonText(r0_40.TrackingQuestId ~= nil)
      r0_40:ShowDeliverPopupUI(r1_40.SubRegionId, r0_40.CurSelectQuest.QuestChainId)
      return 
    end
    if r4_0:GetQuestInterfaceJump(r0_40.CurSelectQuest.QuestID) then
      r0_40:SetTrackingQuestInfoToServer()
      PageJumpUtils:JumpToTargetPageByJumpId(r4_0:GetQuestInterfaceJumpId(r0_40.CurSelectQuest.QuestID))
    elseif r0_40.CurTrackingQuest.SubRegionId > 0 then
      r0_40:SetTrackingQuestInfoToServer()
    end
  end
end
function r0_0.SetTrackButtonText(r0_41, r1_41)
  -- line: [1450, 1464] id: 41
  if r1_41 then
    r0_41.RootWidget.Common_Button_Text_PC:SetText(GText("UI_QUEST_STOPTRACK"))
    r0_41.RootWidget.Group_Jump:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    if r0_41.UsingGamepad then
      r0_41.RootWidget.Key_Map:SetVisibility(UE4.ESlateVisibility.Visible)
    end
  else
    r0_41.RootWidget.Common_Button_Text_PC:SetText(GText("UI_QUEST_TRACK"))
    r0_41.RootWidget.Group_Jump:SetVisibility(UE4.ESlateVisibility.Collapsed)
    if r0_41.UsingGamepad then
      r0_41.RootWidget.Key_Map:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
end
function r0_0.ScrollToSelectedWidget(r0_42, r1_42)
  -- line: [1466, 1486] id: 42
  local r2_42 = r0_42.RootWidget.List_Task:GetDisplayedEntryWidgets()
  if r2_42 == nil or r2_42:Num() == 0 then
    return 
  end
  local r3_42 = r1_0.GetListViewContentMaxCount(r0_42.RootWidget.List_Task, r2_42)
  local r4_42 = r0_42.RootWidget.List_Task.ListItems:ToTable()
  if r3_42 <= #r4_42 then
    r0_42.RootWidget.List_Task:SetScrollbarVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    r0_42.RootWidget.List_Task:SetScrollbarVisibility(UE4.ESlateVisibility.Collapsed)
  end
  for r9_42, r10_42 in pairs(r4_42) do
    local r11_42 = r0_42.RootWidget.List_Task:GetIndexForItem(r10_42) + 1
    if r10_42.QuestChainId == r1_42 and r3_42 < r11_42 then
      r0_42.RootWidget.List_Task:NavigateToIndex(r11_42 + -1)
      return 
    end
  end
  -- close: r5_42
end
function r0_0.RenameWidget(r0_43)
  -- line: [1488, 1496] id: 43
  r0_43.PlatformName = CommonUtils.GetDeviceTypeByPlatformName(r0_43)
  if r0_43.PlatformName == "PC" then
    r0_43.CommonTabWidget = r0_43.Common_Tab
  elseif r0_43.PlatformName == "Mobile" then
    r0_43.CommonTabWidget = r0_43.WBP_Com_Tab_M
  end
  r0_43.RootWidget = r0_43.WBP_Task_Root
end
function r0_0.ConditionJumpQuestChain(r0_44, r1_44)
  -- line: [1499, 1590] id: 44
  local r2_44 = DataMgr.QuestChain[r1_44]
  if not r1_44 or not r2_44 then
    return 
  end
  local r3_44 = GWorld:GetAvatar()
  if not r3_44 then
    return 
  end
  local r4_44 = nil
  local r5_44 = r3_44.QuestChains and {}
  if r3_44.QuestChains[r1_44] == nil then
    return 
  end
  local r6_44 = false
  local r7_44 = false
  for r12_44, r13_44 in pairs(r5_44) do
    if r12_44 == r1_44 then
      r4_44 = DataMgr.QuestChain[r12_44].QuestChainType
      local r14_44 = r0_44:CheckQuestIsShowByCheckState(r12_44, r13_44)
      if r13_44.State ~= 3 and r13_44.CanShow and r14_44 then
        r6_44 = true
        break
      end
    end
  end
  -- close: r8_44
  if not r6_44 then
    for r12_44, r13_44 in pairs(DataMgr.QuestChain) do
      if r13_44 ~= nil and r13_44.SpecialQuestDisplayName ~= nil and r13_44.QuestNpcId ~= nil and r13_44.QuestChainType == Const.SpecialSideQuestChainType and r3_44.QuestChains[r12_44] and r3_44.QuestChains[r12_44].State == 1 and r6_0[r13_44.SpecialQuestDisplayName] and r6_0[r13_44.SpecialQuestDisplayName].SubRegionId > 0 then
        r7_44 = true
        break
      end
    end
    -- close: r8_44
  end
  if not r6_44 and not r7_44 then
    DebugPrint("ERROR::", "任务:" .. r1_44 .. "在任务面板和地图中都不存在")
  elseif r6_44 then
    local function r8_44()
      -- line: [1557, 1565] id: 45
      for r5_45, r6_45 in pairs(r0_44.RootWidget.List_Task:GetDisplayedEntryWidgets():ToTable() and {}) do
        if r6_45.QuestChainId == r1_44 then
          r6_45.Task_SubItem:SelectQuestProactively()
          break
        end
      end
      -- close: r1_45
    end
    local r9_44 = 1
    for r14_44, r15_44 in pairs(r9_0) do
      if r15_44.QuestType == r4_44 then
        r9_44 = r14_44
        break
      end
    end
    -- close: r10_44
    if r9_44 ~= r0_44.CurTabId then
      r0_44.JumpQuestChainId = r1_44
      r0_44.CommonTabWidget:SelectTab(r9_44)
    else
      r8_44()
    end
  elseif not r6_44 and r7_44 then
    local r8_44 = MissionIndicatorManager:GetTargetTaskSubRegionId(r1_44, r3_44.QuestChains[r1_44].DoingQuestId)
    local r11_44 = UE4.UGameplayStatics.GetGameInstance(r0_44):GetGameUIManager():LoadUINew("LevelMapMain")
    if r11_44 then
      r11_44.RealWildMap:ChangeRegionForSmartIndicator(r8_44, r1_44)
    end
  end
end
function r0_0.IsInTab(r0_46, r1_46, r2_46)
  -- line: [1592, 1605] id: 46
  local r3_46 = DataMgr.QuestChain[r1_46]
  if not r3_46 then
    return false
  end
  local r4_46 = 1
  for r9_46, r10_46 in pairs(r9_0) do
    if r9_46 == r2_46 then
      r4_46 = r10_46.QuestType
      break
    end
  end
  -- close: r5_46
  local r5_46 = r3_46.QuestChainType
  if r5_46 ~= r4_46 then
    r5_46 = r2_46 == 1
  else
    goto label_25	-- block#9 is visited secondly
  end
  return r5_46
end
function r0_0.GetCurTabFirstQuestId(r0_47, r1_47, r2_47)
  -- line: [1607, 1629] id: 47
  local r3_47 = -1
  if r9_0[r2_47] and r9_0[r2_47].QuestType then
    r3_47 = r9_0[r2_47].QuestType
  end
  if r3_47 ~= -1 then
    if r1_47[r3_47] then
      for r8_47, r9_47 in ipairs(r1_47[r3_47]) do
        return r9_47.QuestChainId and 0
      end
      -- close: r4_47
    end
  else
    for r8_47, r9_47 in pairs(r1_47) do
      if r9_47 and #r9_47 > 0 then
        for r14_47, r15_47 in ipairs(r9_47) do
          return r15_47.QuestChainId and 0
        end
        -- close: r10_47
      end
    end
    -- close: r4_47
  end
  return 0
end
function r0_0.GetQuestInfoString(r0_48, r1_48)
  -- line: [1631, 1634] id: 48
  return GText(r1_48)
end
function r0_0.SetTrackingQuestInfoToServer(r0_49)
  -- line: [1636, 1657] id: 49
  local r1_49 = GWorld:GetAvatar()
  if not r1_49 then
    return 
  end
  local r2_49 = r1_49.TrackingQuestChainId
  local r3_49 = r0_49.TrackingQuestId
  if r2_49 ~= r3_49 then
    if r1_49.QuestChains[r0_49.TrackingQuestId] then
      r4_0:ResumQuestTaskBarOnTrack(r2_49, r3_49, r1_49.QuestChains[r0_49.TrackingQuestId].DoingQuestId)
    else
      r4_0:ResumQuestTaskBarOnTrack(r2_49, nil, nil)
    end
  end
  if r2_49 and not r3_49 then
    r1_49:CancelQuestTracking(r2_49)
  elseif r2_49 ~= r3_49 then
    r1_49:SetQuestTracking(r3_49, r0_49.CurTrackingQuest.SubRegionId)
  else
    r1_49:SetQuestTracking(r3_49, r0_49.CurTrackingQuest.SubRegionId)
  end
end
function r0_0.SortReward(r0_50, r1_50, r2_50)
  -- line: [1660, 1743] id: 50
  local r3_50 = {}
  local r4_50 = {}
  for r9_50, r10_50 in pairs(r1_50) do
    local r11_50 = DataMgr.Reward[r10_50]
    if r11_50 then
      local r12_50 = r11_50.Id and {}
      local r13_50 = r11_50.Count and {}
      local r14_50 = r11_50.Type and {}
      for r18_50 = 1, #r12_50, 1 do
        table.insert(r4_50, r12_50[r18_50])
        r3_50[r12_50[r18_50]] = {
          ItemId = r12_50[r18_50],
          Count = RewardUtils:GetCount(r13_50[r18_50]),
          Icon = ItemUtils.GetItemIconPath(r12_50[r18_50], r14_50[r18_50]),
          Rarity = ItemUtils.GetItemRarity(r12_50[r18_50], r14_50[r18_50]),
          ItemType = r14_50[r18_50],
        }
      end
    end
  end
  -- close: r5_50
  table.sort(r4_50, function(r0_51, r1_51)
    -- line: [1681, 1725] id: 51
    local r2_51 = r3_50[r0_51].ItemType
    local r3_51 = r3_50[r1_51].ItemType
    if r2_51 == "Reward" and r3_51 ~= "Reward" then
      return false
    end
    if r3_51 == "Reward" and r2_51 ~= "Reward" then
      return true
    end
    local r4_51 = r3_50[r0_51].Rarity
    local r5_51 = r3_50[r1_51].Rarity
    local r6_51 = r3_50[r0_51].ItemId
    local r7_51 = r3_50[r1_51].ItemId
    if r2_51 == "Reward" and r3_51 == "Reward" then
      if r4_51 == r5_51 then
        return r6_51 < r7_51
      else
        return r5_51 < r4_51
      end
    end
    local r8_51 = DataMgr.RewardType[r2_51].DungeonRewardSeq
    local r9_51 = DataMgr.RewardType[r3_51].DungeonRewardSeq
    if r4_51 == r5_51 then
      if r8_51 == r9_51 then
        return r6_51 < r7_51
      elseif r8_51 == nil and r9_51 then
        return r9_51
      elseif r9_51 == nil and r8_51 then
        return r8_51
      else
        return r9_51 < r8_51
      end
    else
      return r5_51 < r4_51
    end
  end)
  for r9_50, r10_50 in pairs(r4_50) do
    local r16_50 = r4_0:CreateRewardContent({
      Id = r3_50[r10_50].ItemId,
      Count = r3_50[r10_50].Count,
      OwnerWidget = r0_50,
      Icon = r3_50[r10_50].Icon,
      Rarity = r3_50[r10_50].Rarity,
      IsShowDetails = true,
      ItemType = r3_50[r10_50].ItemType,
    })
    r16_50.bHasGot = r2_50
    function r16_50.AfterInitCallback(r0_52)
      -- line: [1737, 1739] id: 52
      r0_52:BindEvents(r0_50, {
        OnMenuOpenChanged = r0_50.OnRewardMenuOpenChanged,
      })
    end
    r0_50.RootWidget.ListView_Rewards:AddItem(r16_50)
  end
  -- close: r5_50
  r0_50.RootWidget.ListView_Rewards:RequestPlayEntriesAnim()
end
function r0_0.OnRewardMenuOpenChanged(r0_53, r1_53)
  -- line: [1745, 1751] id: 53
  if r1_53 and r0_53.UsingGamepad then
    r0_53.CommonTabWidget:UpdateBottomKeyInfo({})
  elseif not r1_53 and r0_53.UsingGamepad then
    r0_53:InitTabPadKeyInfoForReward()
  end
end
function r0_0.InitListenEvent(r0_54)
  -- line: [1755, 1759] id: 54
  if IsValid(r0_54.GameInputModeSubsystem) then
    r0_54.GameInputModeSubsystem.OnInputMethodChanged:Add(r0_54, r0_54.RefreshOpInfoByInputDevice)
  end
end
function r0_0.RefreshBaseInfo(r0_55)
  -- line: [1761, 1768] id: 55
  r0_55.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(UE4.UGameplayStatics.GetPlayerController(r0_55, 0))
  if IsValid(r0_55.GameInputModeSubsystem) then
    r0_55:RefreshOpInfoByInputDevice(r0_55.GameInputModeSubsystem:GetCurrentInputType(), r0_55.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end
function r0_0.RefreshOpInfoByInputDevice(r0_56, r1_56, r2_56)
  -- line: [1770, 1793] id: 56
  if r1_56 == ECommonInputType.Touch then
    return 
  end
  if r1_56 == ECommonInputType.MouseAndKeyboard then
    r0_56.UsingGamepad = false
    r0_56.RootWidget:SetFocus()
    r0_56.RootWidget.Key_Map:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_56.RootWidget.Key_Title_Rewards:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_56:IsShowGamePad(false)
    if r0_56.CommonTabWidget.SizeBox_Left then
      r0_56.CommonTabWidget.SizeBox_Left:SetVisibility(UE4.ESlateVisibility.Visible)
      r0_56.CommonTabWidget.SizeBox_Right:SetVisibility(UE4.ESlateVisibility.Visible)
    end
  else
    r0_56.UsingGamepad = true
    r0_56:InitPadKeyInfo()
    r0_56:SetFocusOnTrackWidget(r0_56.CurSelectId)
  end
end
function r0_0.InitPadKeyInfo(r0_57)
  -- line: [1795, 1836] id: 57
  r0_57.RootWidget.Key_Map:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "Y",
      }
    },
  })
  r0_57.RootWidget.Key_Title_Rewards:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "LS",
      }
    },
  })
  if r0_57.CommonTabWidget.ReasoningEntrance then
    r0_57.CommonTabWidget.ReasoningEntrance.Key_GamePad:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "Menu",
        }
      },
    })
    r0_57.CommonTabWidget.ReasoningEntrance.Key_GamePad:SetVisibility(UE4.ESlateVisibility.Visible)
  end
  r0_57.RootWidget.Key_Qa:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "RS",
      }
    },
  })
  r0_57.RootWidget.GroupKey:SetVisibility(UE4.ESlateVisibility.Visible)
  r0_57.RootWidget.Key_Title_Rewards:SetVisibility(UE4.ESlateVisibility.Visible)
  r0_57.RootWidget.Key_Map:SetVisibility(UE4.ESlateVisibility.Visible)
  r0_57.RootWidget.Common_Button_Text_PC:SetGamePadImg("X")
end
function r0_0.InitTabPadKeyInfo(r0_58)
  -- line: [1838, 1858] id: 58
  if r0_58.PlatformName == "Mobile" then
    return 
  end
  r0_58.CommonTabWidget:UpdateBottomKeyInfo({
    {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "A",
        }
      },
      Desc = GText("UI_CTL_Squad_Expand"),
      bLongPress = false,
    },
    {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
        }
      },
      Desc = GText("UI_BACK"),
    }
  })
end
function r0_0.InitTabPadKeyInfoForReward(r0_59)
  -- line: [1861, 1881] id: 59
  if r0_59.PlatformName == "Mobile" then
    return 
  end
  r0_59.CommonTabWidget:UpdateBottomKeyInfo({
    {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "A",
        }
      },
      Desc = GText("UI_Controller_CheckDetails"),
      bLongPress = false,
    },
    {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
        }
      },
      Desc = GText("UI_BACK"),
    }
  })
end
function r0_0.InitTabPadKeyInfoForBack(r0_60)
  -- line: [1885, 1898] id: 60
  if r0_60.PlatformName == "Mobile" then
    return 
  end
  r0_60.CommonTabWidget:UpdateBottomKeyInfo({
    {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
        }
      },
      Desc = GText("UI_BACK"),
    }
  })
end
function r0_0.InitTabPadKeyInfoForTips(r0_61)
  -- line: [1900, 1913] id: 61
  if r0_61.PlatformName == "Mobile" then
    return 
  end
  r0_61.CommonTabWidget:UpdateBottomKeyInfo({
    {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
        }
      },
      Desc = GText("UI_FAKEQUEST_TIPS_CLOSE"),
    }
  })
end
function r0_0.InitTabPadKeyInfoForCondition(r0_62)
  -- line: [1915, 1935] id: 62
  if r0_62.PlatformName == "Mobile" then
    return 
  end
  r0_62.CommonTabWidget:UpdateBottomKeyInfo({
    {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "A",
        }
      },
      Desc = GText("UI_LOGIN_ENSURE"),
      bLongPress = false,
    },
    {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
        }
      },
      Desc = GText("UI_BACK"),
    }
  })
end
function r0_0.GetCurTrackWidget(r0_63, r1_63)
  -- line: [1939, 1951] id: 63
  if r1_63 == nil then
    return 
  end
  for r6_63, r7_63 in pairs(r0_63.RootWidget.List_Task:GetListItems():ToTable()) do
    local r8_63 = r0_63.RootWidget.List_Task:GetIndexForItem(r7_63) + 1
    if r7_63.QuestChainId == r1_63 then
      return r7_63
    end
  end
  -- close: r2_63
  return nil
end
function r0_0.SetFocusOnTrackWidget(r0_64, r1_64)
  -- line: [1953, 1968] id: 64
  local r2_64 = r0_64:GetCurTrackWidget(r1_64)
  if r2_64 == nil then
    local r3_64 = r0_64:GetCurTrackWidget(r0_64.CurSelectQuest)
    if r3_64 then
      r0_64.RootWidget.List_Task:NavigateToIndex(r0_64.RootWidget.List_Task:GetIndexForItem(r3_64))
    else
      r0_64.RootWidget.List_Task:NavigateToIndex(0)
    end
  else
    r0_64.RootWidget.List_Task:NavigateToIndex(r0_64.RootWidget.List_Task:GetIndexForItem(r2_64))
  end
end
function r0_0.OnLeftStickUp(r0_65)
  -- line: [1972, 1975] id: 65
end
function r0_0.OnNavigationRight(r0_66)
  -- line: [1977, 1988] id: 66
  if r0_66.RootWidget.VB_UnlockCondition:GetChildrenCount() <= 0 then
    return 
  else
    for r5_66, r6_66 in pairs(r0_66.RootWidget.VB_UnlockCondition:GetAllChildren()) do
      if not r6_66.Finish then
        return r6_66
      end
    end
    -- close: r1_66
  end
end
function r0_0.IsShowGamePad(r0_67, r1_67)
  -- line: [1990, 2015] id: 67
  if r0_67.PlatformName == "Mobile" then
    return 
  end
  if r1_67 then
    r0_67.CommonTabWidget.SizeBox_Left:SetVisibility(UE4.ESlateVisibility.Visible)
    r0_67.CommonTabWidget.SizeBox_Right:SetVisibility(UE4.ESlateVisibility.Visible)
    r0_67.RootWidget.Key_Title_Rewards:SetVisibility(UE4.ESlateVisibility.Visible)
    r0_67.RootWidget.Key_Map:SetVisibility(UE4.ESlateVisibility.Visible)
    r0_67.RootWidget.Common_Button_Text_PC:SetGamePadVisibility(UE4.ESlateVisibility.Visible)
    r0_67.RootWidget.GroupKey:SetVisibility(UE4.ESlateVisibility.Visible)
    if r0_67.CommonTabWidget.ReasoningEntrance then
      r0_67.CommonTabWidget.ReasoningEntrance.Key_GamePad:SetVisibility(UE4.ESlateVisibility.Visible)
    end
  else
    r0_67.CommonTabWidget.SizeBox_Left:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_67.CommonTabWidget.SizeBox_Right:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_67.RootWidget.Key_Title_Rewards:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_67.RootWidget.Common_Button_Text_PC:SetGamePadVisibility(UE4.ESlateVisibility.Collapsed)
    r0_67.RootWidget.Key_Map:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_67.RootWidget.GroupKey:SetVisibility(UE4.ESlateVisibility.Collapsed)
    if r0_67.CommonTabWidget.ReasoningEntrance then
      r0_67.CommonTabWidget.ReasoningEntrance.Key_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
end
function r0_0.ReceiveEnterState(r0_68, r1_68)
  -- line: [2018, 2032] id: 68
  r0_0.Super.ReceiveEnterState(r0_68, r1_68)
  if r0_68.IsCanReceive == true then
    if r0_68.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
      r0_68:InitPadKeyInfo()
    end
    if r0_68.CurFocusWidget and r0_68.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
      r0_68.CurFocusWidget.Task_SubItem:SetFocus()
    end
  end
  if r0_68.AutoClose and r1_68 == 1 then
    r0_68.AutoClose = false
    r0_68:Close()
  end
end
function r0_0.OnClickReasoningEntrance(r0_69)
  -- line: [2034, 2038] id: 69
  AudioManager(r0_69):PlayUISound(r0_69, "event:/ui/common/click_btn_confirm", nil, nil)
  r0_69:GetGameInstance():GetGameUIManager():LoadUINew("DetectiveMinigame")
end
function r0_0.UpdateReasoningRedDot(r0_70)
  -- line: [2040, 2057] id: 70
  local r1_70 = r5_0:IsHasNewQuestionOrClue()
  if r0_70.CommonTabWidget and r0_70.CommonTabWidget.ReasoningEntrance then
    if r1_70 == 2 then
      r0_70.CommonTabWidget.ReasoningEntrance.Text_Clue:SetText(GText("Minigame_Textmap_100303"))
      r0_70.CommonTabWidget.ReasoningEntrance.Panel_Clue:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      r0_70.CommonTabWidget.ReasoningEntrance.New:SetVisibility(UE4.ESlateVisibility.Collapsed)
    elseif r1_70 == 1 then
      r0_70.CommonTabWidget.ReasoningEntrance.Panel_Clue:SetVisibility(UE4.ESlateVisibility.Collapsed)
      r0_70.CommonTabWidget.ReasoningEntrance.New:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    else
      r0_70.CommonTabWidget.ReasoningEntrance.Panel_Clue:SetVisibility(UE4.ESlateVisibility.Collapsed)
      r0_70.CommonTabWidget.ReasoningEntrance.New:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
end
function r0_0.ShouldShowReasoningEntrance(r0_71)
  -- line: [2059, 2068] id: 71
  local r1_71 = GWorld:GetAvatar()
  if not r1_71 then
    return false
  end
  if not r1_71.DetectiveGameUnlockedQuestions then
    local r2_71 = {}
  end
  if not r1_71.DetectiveGameUnlockedResult then
    local r3_71 = {}
  end
  return false
end
return r0_0
