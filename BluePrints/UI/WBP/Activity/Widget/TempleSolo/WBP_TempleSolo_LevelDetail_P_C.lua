-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Activity\Widget\TempleSolo\WBP_TempleSolo_LevelDetail_P_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "Blueprints.UI.BP_UIState_C"
})
function r0_0.Construct(r0_1)
  -- line: [17, 47] id: 1
  r0_1.TempleEventType = nil
  r0_1.TextName = nil
  r0_1.Level = 1
  r0_1.IsHardMode = false
  r0_1.TempleId = nil
  r0_1.CurrentSelectTabContent = nil
  r0_1.EventId = 108001
  r0_1.TempleTypeId2Items = {}
  r0_1.TempleId2Items = {}
  r0_1:SetFocus()
  r0_1:InitCommonTab()
  r0_1:InitListTab()
  r0_1:BindButtonPerformances()
  r0_1:PlayAnimation(r0_1.In)
  r0_1.Reward:InitController()
  r0_1.Reward.Owner = r0_1
  r0_1.Reward.Text_Reward:SetText(GText("UI_TempleEvent_RewardProgress"))
  r0_1.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(r0_1)
  r0_1:RefreshOpInfoByInputDevice(r0_1.GameInputModeSubsystem:GetCurrentInputType(), r0_1.GameInputModeSubsystem:GetCurrentGamepadName())
  if CommonUtils.GetDeviceTypeByPlatformName(r0_1) == "PC" then
    r0_1:AddInputMethodChangedListen()
  end
  if not ReddotManager.GetTreeNode("TempleSoloEventReward") then
    ReddotManager.AddNodeEx("TempleSoloEventReward")
  end
  ReddotManager.AddListenerEx("TempleSoloEventReward", r0_1, r0_1.RefreshReddot)
end
function r0_0.Destruct(r0_2)
  -- line: [49, 52] id: 2
  r0_2:UnbindButtonPerformances()
  ReddotManager.RemoveListener("TempleSoloEventReward", r0_2)
end
function r0_0.BindButtonPerformances(r0_3)
  -- line: [54, 58] id: 3
  r0_3.Reward.Btn_Click.OnClicked:Add(r0_3, r0_3.Reward.OnClicked)
  r0_3.Btn_Start.Btn_Click.OnClicked:Add(r0_3, r0_3.GoToTemple)
  r0_3.List_Tab.BP_OnItemSelectionChanged:Add(r0_3, r0_3.OnTabSelectionChanged)
end
function r0_0.UnbindButtonPerformances(r0_4)
  -- line: [60, 63] id: 4
  r0_4.Reward.Btn_Click.OnClicked:Clear()
  r0_4.Btn_Start.Btn_Click.OnClicked:Clear()
end
function r0_0.AddInputMethodChangedListen(r0_5)
  -- line: [65, 69] id: 5
  if IsValid(r0_5.GameInputModeSubsystem) then
    r0_5.GameInputModeSubsystem.OnInputMethodChanged:Add(r0_5, r0_5.RefreshOpInfoByInputDevice)
  end
end
function r0_0.RemoveInputMethodChangedListen(r0_6)
  -- line: [71, 75] id: 6
  if IsValid(r0_6.GameInputModeSubsystem) then
    r0_6.GameInputModeSubsystem.OnInputMethodChanged:Remove(r0_6, r0_6.RefreshOpInfoByInputDevice)
  end
end
function r0_0.InitCommonTab(r0_7)
  -- line: [77, 118] id: 7
  local r1_7 = r0_7.Tab
  local r3_7 = {
    DynamicNode = {
      "Back",
      "BottomKey"
    },
    BottomKeyInfo = {},
    TitleName = GText("Event_Title_108001"),
    StyleName = "Text",
    OwnerPanel = r0_7,
  }
  r3_7.BottomKeyInfo = {
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = r0_7.CloseSelf,
          Owner = r0_7,
        }
      },
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
        }
      },
      Desc = GText("UI_BACK"),
    },
    {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "RV",
        }
      },
      Desc = GText("UI_Controller_Slide"),
    }
  }
  r3_7.BackCallback = r0_7.CloseSelf
  r1_7:Init(r3_7)
  if CommonUtils.GetDeviceTypeByPlatformName(r0_7) ~= "Mobile" then
    r0_7.Controller_L:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "LT",
        }
      },
    })
    r0_7.Controller_R:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "RT",
        }
      },
    })
  end
end
function r0_0.InitListTab(r0_8)
  -- line: [120, 149] id: 8
  r0_8.List_Tab:ClearListItems()
  r0_8.List_Tab:DisableScroll(true)
  for r6_8, r7_8 in pairs(DataMgr.TempleEventType) do
    local r8_8 = NewObject(UIUtils.GetCommonItemContentClass())
    r8_8.TempleTypeId = r6_8
    r8_8.EventId = r7_8.EventId
    r8_8.TempleTypeName = r7_8.TempleTypeName
    r8_8.GUIPath = r7_8.GUIPath
    r8_8.Parent = r0_8
    r8_8.NormalStar, r8_8.MaxNormalStar, r8_8.HardStar, r8_8.MaxHardStar = r0_8:GetTempleTypeFinished(r6_8)
    r8_8.ParentWidget = r0_8
    r8_8.Index = r0_8.List_Tab:GetNumItems() + 1
    r0_8.List_Tab:AddItem(r8_8)
    if not r0_8.TextName then
      r0_8.TextName = r7_8.TempleTypeName
    end
    r0_8.TempleTypeId2Items[r6_8] = r8_8
  end
  -- close: r2_8
  r0_8:AddTimer(0.01, function()
    -- line: [142, 148] id: 9
    local r0_9, r1_9 = r0_8:GetFirstUnfinishedSubTabIndex()
    local r2_9 = r0_8.TempleTypeId2Items[r0_9] and r0_8.List_Tab:GetItemAt(0)
    if r2_9 then
      r0_8:OnTabItemClicked(r2_9, r1_9)
    end
  end)
end
function r0_0.InitListSubTab(r0_10, r1_10)
  -- line: [151, 193] id: 10
  r0_10.List_SubTab:ClearListItems()
  r0_10.List_SubTab:DisableScroll(true)
  local r3_10 = {}
  for r8_10, r9_10 in pairs(DataMgr.TempleEventLevel) do
    if r9_10.TempleTypeId == r0_10.TempleEventType then
      table.insert(r3_10, {
        TempleId = r8_10,
        Data = r9_10,
      })
    end
  end
  -- close: r4_10
  table.sort(r3_10, function(r0_11, r1_11)
    -- line: [165, 167] id: 11
    return r0_11.TempleId < r1_11.TempleId
  end)
  r0_10.TempleId2Items = {}
  for r8_10, r9_10 in ipairs(r3_10) do
    local r10_10 = NewObject(UIUtils.GetCommonItemContentClass())
    r10_10.TempleId = r9_10.TempleId
    r10_10.TempleTypeId = r9_10.Data.TempleTypeId
    r10_10.IsHardMode = r9_10.Data.IsHardMode
    r10_10.Level = r8_10
    r10_10.Parent = r0_10
    r10_10.EventId = r0_10.EventId
    r10_10.Index = r8_10
    r0_10.List_SubTab:AddItem(r10_10)
    r0_10.TempleId2Items[r9_10.TempleId] = r10_10
  end
  -- close: r4_10
  if not r1_10 then
    r1_10 = r0_10:GetTargetSubTabIndex(r0_10.TempleId2Items)
  end
  r0_10:AddTimer(0.02, function()
    -- line: [187, 192] id: 12
    local r0_12 = r0_10.TempleId2Items[r1_10] and r0_10.List_SubTab:GetItemAt(0)
    if r0_12 then
      r0_10:OnSubTabItemClicked(r0_12, true)
    end
  end)
end
function r0_0.InitDetail(r0_13, r1_13, r2_13, r3_13)
  -- line: [195, 300] id: 13
  r0_13.Name.Text_Name:SetText(GText(r0_13.TextName))
  r0_13.Name.Text_Num:SetText(r2_13)
  local r4_13 = r0_13.Name.Text_Difficulty
  local r6_13 = nil	-- notice: implicit variable refs by block#[3]
  if r3_13 then
    r6_13 = GText("UI_TempleEvent_HardMode")
    if not r6_13 then
      ::label_22::
      r6_13 = GText("UI_TempleEvent_NormalMode")
    end
  else
    goto label_22	-- block#2 is visited secondly
  end
  r4_13:SetText(r6_13)
  r0_13.Text_Title_Description:SetText(GText("UI_TempleEvent_LevelDes"))
  r0_13.Text_Description01:SetText(GText("UI_TEMPLE_" .. r1_13))
  r0_13.Text_Description02:SetText(GText("UI_TEMPLE_DES_" .. r1_13))
  if r0_13.EMScrollBox_0 then
    r0_13.EMScrollBox_0:ScrollToStart()
  end
  r4_13 = DataMgr.Temple[r1_13]
  local r5_13 = GWorld:GetAvatar()
  r6_13 = 0
  if r5_13 and r5_13.Temple[r0_13.EventId] and r5_13.Temple[r0_13.EventId].FinishStars[r1_13] then
    r6_13 = r5_13.Temple[r0_13.EventId].FinishStars[r1_13]
  end
  local r7_13 = ""
  if r4_13.SucRule == "Time" or r4_13.SucRule == "CountDown" then
    r7_13 = "SECONDS"
  elseif r4_13.SucRule == "Score" then
    r7_13 = "SCORE"
  elseif r4_13.SucRule == "Collect" then
    r7_13 = "COUNT"
  end
  r0_13.Text_Title_Rule:SetText(GText("UI_TempleEvent_LevelRule"))
  r0_13.WBox_Rule:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_13.Text_Title_Target:SetText(GText("UI_TempleEvent_LevelTarget"))
  r0_13.Text_Progress:SetText(r6_13 .. "/" .. (#r4_13.RatingRange and 0))
  for r11_13 = 1, 3, 1 do
    local r12_13 = ""
    local r13_13 = r4_13.RatingRange[r11_13]
    if r13_13 == nil then
      r0_13["Target0" .. r11_13]:SetVisibility(UE4.ESlateVisibility.Collapsed)
    else
      if r13_13 == 0 then
        r12_13 = GText("UI_TEMPLE_SUCRULE_ZERO")
      elseif r4_13.SucRule == "CountDown" and r4_13.UIShowType and r4_13.UIShowType > 0 then
        r12_13 = string.format(GText("UI_TEMPLE_SUCRULE_COUNTDOWN_" .. r4_13.UIShowType), 100 - r13_13)
      elseif r7_13 == "SCORE" or r7_13 == "COUNT" then
        r12_13 = GText("UI_TEMPLE_SUCRULE_" .. string.upper(r4_13.SucRule)) .. r13_13
      else
        r12_13 = GText("UI_TEMPLE_SUCRULE_" .. string.upper(r4_13.SucRule)) .. r13_13 .. GText("UI_TEMPLE_MEASURE_" .. r7_13)
      end
      r0_13["Target0" .. r11_13]:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      r0_13["Target0" .. r11_13].Text_Target:SetText(r12_13)
      if r11_13 <= r6_13 then
        r0_13["Target0" .. r11_13].WS_Type:SetActiveWidgetIndex(1)
      else
        r0_13["Target0" .. r11_13].WS_Type:SetActiveWidgetIndex(0)
      end
    end
  end
  local r8_13 = {}
  local r9_13 = DataMgr.Dungeon[r1_13]
  if r9_13.FbdRule then
    for r14_13, r15_13 in pairs(r9_13.FbdRule) do
      table.insert(r8_13, {
        RuleId = r14_13,
        RuleValue = r15_13,
        RuleText = GText("UI_TEMPLE_RULE_" .. r14_13),
      })
    end
    -- close: r10_13
  end
  if #r8_13 == 0 then
    r0_13.Panel_Rule:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    r0_13.Panel_Rule:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_13.WBox_Rule:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    for r13_13 = 1, 4, 1 do
      if r8_13[r13_13] then
        r0_13["Rule_" .. r13_13]:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
        r0_13["Rule_" .. r13_13].Text_Rule:SetText(r8_13[r13_13].RuleText)
      else
        r0_13["Rule_" .. r13_13]:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
    end
  end
  local r10_13 = nil
  local r11_13 = nil
  if r3_13 then
    r10_13 = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Activity/Temple/Solo/T_Activity_Temple_Solo_Star_Challenge.T_Activity_Temple_Solo_Star_Challenge")
    r11_13 = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Activity/Temple/Solo/T_Activity_Temple_Solo_Star_Challenge_Empty.T_Activity_Temple_Solo_Star_Challenge_Empty")
  else
    r10_13 = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Activity/Temple/Solo/T_Activity_Temple_Solo_Star.T_Activity_Temple_Solo_Star")
    r11_13 = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Activity/Temple/Solo/T_Activity_Temple_Solo_Star_Empty.T_Activity_Temple_Solo_Star_Empty")
  end
  for r15_13 = 1, 3, 1 do
    r0_13["Target0" .. r15_13].Image_Star:SetBrushFromTexture(r10_13)
    r0_13["Target0" .. r15_13].Image_Empty:SetBrushFromTexture(r11_13)
  end
  r0_13:CheckTempleState()
end
function r0_0.OnKeyDown(r0_14, r1_14, r2_14)
  -- line: [302, 326] id: 14
  local r4_14 = UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_14))
  local r5_14 = false
  if r4_14 == "Escape" or r4_14 == "Gamepad_FaceButton_Right" then
    r5_14 = true
    r0_14:CloseSelf()
  elseif r4_14 == "Gamepad_FaceButton_Left" then
    r0_14:GoToTemple()
    r5_14 = true
  elseif r4_14 == "Gamepad_LeftTrigger" then
    r0_14:SwitchSubTab(-1)
    r5_14 = true
  elseif r4_14 == "Gamepad_RightTrigger" then
    r0_14:SwitchSubTab(1)
    r5_14 = true
  elseif r4_14 == "Gamepad_FaceButton_Top" then
    r0_14.Reward:OnClicked()
    r5_14 = true
  end
  if r5_14 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end
function r0_0.OnAnalogValueChanged(r0_15, r1_15, r2_15)
  -- line: [328, 340] id: 15
  local r4_15 = UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_15))
  local r5_15 = UKismetInputLibrary.GetAnalogValue(r2_15) * 5
  if r4_15 == "Gamepad_RightY" then
    r0_15.EMScrollBox_0:SetScrollOffset(math.clamp(r0_15.EMScrollBox_0:GetScrollOffset() - r5_15, 0, r0_15.EMScrollBox_0:GetScrollOffsetOfEnd()))
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end
function r0_0.OnTabItemClicked(r0_16, r1_16, r2_16)
  -- line: [342, 391] id: 16
  if r0_16.TempleEventType == r1_16.TempleTypeId then
    return 
  end
  if r0_16.CurrentSelectTabContent then
    UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(r0_16.List_Tab, r0_16.List_Tab:GetIndexForItem(r0_16.CurrentSelectTabContent)):SetSelected(false)
  end
  r0_16.CurrentSelectTabContent = r1_16
  local r3_16 = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(r0_16.List_Tab, r0_16.List_Tab:GetIndexForItem(r0_16.CurrentSelectTabContent))
  if r3_16 then
    r3_16:SetSelected(true)
  else
    r0_16.List_Tab:GetItemAt(r1_16.Index + -1).DelaySelected = true
  end
  if r0_16.BG then
    r0_16.BG:PlayAnimation(r0_16.BG.Out)
  end
  if r1_16.TempleTypeId == 1080011 then
    r0_16.WS_BG:SetActiveWidgetIndex(0)
    AudioManager(r0_16):PlayUISound(r0_16, "event:/ui/activity/lingniao_sub_anim_3", nil, nil)
    r0_16.BG = r0_16.BG_01
  elseif r1_16.TempleTypeId == 1080012 then
    r0_16.WS_BG:SetActiveWidgetIndex(1)
    AudioManager(r0_16):PlayUISound(r0_16, "event:/ui/activity/lingniao_sub_anim_1", nil, nil)
    r0_16.BG = r0_16.BG_02
  elseif r1_16.TempleTypeId == 1080013 then
    r0_16.WS_BG:SetActiveWidgetIndex(2)
    AudioManager(r0_16):PlayUISound(r0_16, "event:/ui/activity/lingniao_sub_anim_2", nil, nil)
    r0_16.BG = r0_16.BG_03
  end
  r0_16.TempleEventType = r1_16.TempleTypeId
  r0_16.TextName = r1_16.TempleTypeName
  r0_16.TempleId = nil
  r0_16:InitListSubTab(r2_16)
  r0_16:PlayAnimation(r0_16.Change_2)
  r0_16:PlayBGAnimations()
  AudioManager(r0_16):PlayUISound(nil, "event:/ui/activity/lingniao_btn_click_level_01", nil, nil)
end
function r0_0.OnSubTabItemClicked(r0_17, r1_17, r2_17)
  -- line: [393, 418] id: 17
  if r0_17.TempleId == r1_17.TempleId then
    return 
  end
  if r0_17.CurrentSelectSubTabContent then
    local r3_17 = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(r0_17.List_SubTab, r0_17.List_SubTab:GetIndexForItem(r0_17.CurrentSelectSubTabContent))
    if r3_17 then
      r3_17:SetSelected(false)
    end
  end
  r0_17.CurrentSelectSubTabContent = r1_17
  local r3_17 = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(r0_17.List_SubTab, r0_17.List_SubTab:GetIndexForItem(r0_17.CurrentSelectSubTabContent))
  if r3_17 then
    r3_17:SetSelected(true)
  else
    r0_17.List_SubTab:GetItemAt(r1_17.Index + -1).DelaySelected = true
  end
  r0_17.TempleId = r1_17.TempleId
  r0_17:InitDetail(r1_17.TempleId, r1_17.Level, r1_17.IsHardMode)
  r0_17:PlayAnimation(r0_17.Change)
  if not r2_17 then
    AudioManager(r0_17):PlayUISound(nil, "event:/ui/activity/lingniao_btn_click_level_02", nil, nil)
  end
end
function r0_0.ChangeListSubTab(r0_18)
  -- line: [420, 421] id: 18
end
function r0_0.ChangeListTab(r0_19)
  -- line: [423, 424] id: 19
end
function r0_0.GoToTemple(r0_20)
  -- line: [426, 443] id: 20
  AudioManager(r0_20):PlayUISound(nil, "event:/ui/activity/large_btn_click", nil, nil)
  local r1_20 = UIManager(r0_20):GetUIObj("ActivityMain")
  local r2_20 = 1
  if r1_20 then
    r2_20 = r1_20.CurTabId
  end
  GWorld.GameInstance:SetExitDungeonData({
    Type = "Temple",
    CurTabIndex = r2_20,
  })
  local r4_20 = GWorld:GetAvatar()
  if r4_20 then
    r4_20:EnterEventDungeon(nil, r0_20.TempleId, nil, 108001)
  end
end
function r0_0.GetTempleTypeFinished(r0_21, r1_21)
  -- line: [445, 462] id: 21
  local r2_21 = 0
  local r3_21 = 0
  local r4_21 = 0
  local r5_21 = 0
  local r6_21 = DataMgr.TempleEventLevel
  local r7_21 = GWorld:GetAvatar()
  if not r7_21 then
    return 
  end
  for r12_21, r13_21 in pairs(r6_21) do
    if r13_21.TempleTypeId == r1_21 then
      if r13_21.IsHardMode then
        r5_21 = r5_21 + 3
        local r14_21 = r7_21.Temple[r0_21.EventId]
        if r14_21 then
          r14_21 = r7_21.Temple[r0_21.EventId].FinishStars[r12_21] and 0
        else
          goto label_36	-- block#7 is visited secondly
        end
        r4_21 = r4_21 + r14_21
      else
        r3_21 = r3_21 + 3
        local r14_21 = r7_21.Temple[r0_21.EventId]
        if r14_21 then
          r14_21 = r7_21.Temple[r0_21.EventId].FinishStars[r12_21] and 0
        else
          goto label_54	-- block#11 is visited secondly
        end
        r2_21 = r2_21 + r14_21
      end
    end
  end
  -- close: r8_21
  return r2_21, r3_21, r4_21, r5_21
end
function r0_0.CheckTempleState(r0_22)
  -- line: [464, 500] id: 22
  local r1_22 = DataMgr.TempleEventLevel[r0_22.TempleId]
  if not r1_22 then
    return 
  end
  local r2_22 = r1_22.UnlockDate
  if r2_22 and TimeUtils.NowTime() < r2_22 then
    local r3_22, r4_22 = UIUtils.GetLeftTimeStrStyle1(r2_22)
    r0_22.Btn_Start.Text_Lock:SetText(string.format(GText("UI_TempleEvent_Lock_Time"), r3_22))
    r0_22.Btn_Start.WS_Type:SetActiveWidgetIndex(1)
    r0_22.ChekcTempleStateTimer = r0_22:AddTimer(1, function()
      -- line: [475, 477] id: 23
      r0_22:CheckTempleState()
    end)
    return false
  elseif not r0_22:CheckPreDungeonPass(r1_22.PreDungeon) then
    r0_22.Btn_Start.Text_Lock:SetText(GText("UI_TempleEvent_Lock_Progress"))
    r0_22.Btn_Start.WorldText_Lock:SetText(EnText("UI_TempleEvent_Lock_Progress"))
    r0_22.Btn_Start.WS_Type:SetActiveWidgetIndex(1)
    return false
  else
    r0_22.Btn_Start.Text:SetText(GText("UI_TempleEvent_EntryLevel"))
    r0_22.Btn_Start.WorldText:SetText(EnText("UI_TempleEvent_EntryLevel"))
    r0_22.Btn_Start.WS_Type:SetActiveWidgetIndex(0)
    r0_22:AddDelayFrameFunc(function()
      -- line: [489, 497] id: 24
      local r0_24 = r0_22.TempleId2Items[r0_22.TempleId]
      if r0_24 then
        local r1_24 = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(r0_22.List_SubTab, r0_24.Index + -1)
        if r1_24 and r1_24.State == "Lock" then
          r1_24:SetState()
        end
      end
    end, 3)
    return true
  end
end
function r0_0.CheckPreDungeonPass(r0_25, r1_25)
  -- line: [502, 517] id: 25
  if not r1_25 then
    return true
  end
  local r2_25 = GWorld:GetAvatar()
  if not r2_25 then
    return false
  end
  if not r2_25.Dungeons[r1_25] then
    return false
  end
  return CommonConst.TemplePassNeedStar <= r2_25.Temple[r0_25.EventId].FinishStars[r1_25]
end
function r0_0.CloseSelf(r0_26)
  -- line: [519, 525] id: 26
  if not r0_26.IsClosing then
    r0_26:PlayAnimation(r0_26.Out)
    r0_26.IsClosing = true
  end
  EventManager:FireEvent(EventID.OnActivityEntryShowVisible)
end
function r0_0.OnAnimationFinished(r0_27, r1_27)
  -- line: [527, 531] id: 27
  if r1_27 == r0_27.Out then
    r0_27:Close()
  end
end
function r0_0.RefreshOpInfoByInputDevice(r0_28, r1_28, r2_28)
  -- line: [534, 549] id: 28
  if r0_28.CurInputDeviceType == r1_28 then
    return 
  elseif r1_28 == ECommonInputType.Touch then
    return 
  end
  if r1_28 == ECommonInputType.MouseAndKeyboard then
    r0_28:GamepadToPC()
  else
    r0_28:PCToGamepad()
  end
  r0_28.CurInputDeviceType = r1_28
end
function r0_0.PCToGamepad(r0_29)
  -- line: [551, 576] id: 29
  r0_29:AddTimer(0.01, function()
    -- line: [552, 566] id: 30
    r0_29.List_Tab:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
    r0_29.List_Tab:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
    r0_29.List_Tab:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
    r0_29.List_Tab:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
    local r0_30 = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(r0_29.List_Tab, 0)
    if r0_30 then
      r0_30:SetFocus()
    else
      r0_29.List_Tab:SetFocus()
    end
  end)
  r0_29.Controller_L:SetVisibility(UE4.ESlateVisibility.Visible)
  r0_29.Controller_R:SetVisibility(UE4.ESlateVisibility.Visible)
  r0_29.Btn_Start.Controller:SetVisibility(UE4.ESlateVisibility.Visible)
  r0_29.Reward.Controller:SetVisibility(UE4.ESlateVisibility.Visible)
  if r0_29.EMScrollBox_0 then
    r0_29.EMScrollBox_0:SetScrollBarVisibility(ESlateVisibility.Visable)
    r0_29.EMScrollBox_0:SetControlScrollbarInside(false)
  end
end
function r0_0.GamepadToPC(r0_31)
  -- line: [578, 590] id: 31
  if r0_31.Controller_L then
    r0_31.Controller_L:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_31.Controller_R:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_31.Btn_Start.Controller:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_31.Reward.Controller:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if r0_31.EMScrollBox_0 then
    r0_31.EMScrollBox_0:SetControlScrollbarInside(true)
    r0_31.EMScrollBox_0:SetScrollBarVisibility(ESlateVisibility.Collapsed)
  end
end
function r0_0.OnTabSelectionChanged(r0_32, r1_32, r2_32)
  -- line: [592, 599] id: 32
  if r2_32 and r1_32 then
    r0_32:OnTabItemClicked(r1_32)
  end
end
function r0_0.SwitchSubTab(r0_33, r1_33)
  -- line: [603, 629] id: 33
  local r2_33 = r0_33.List_SubTab:GetNumItems()
  if r2_33 <= 1 then
    return 
  end
  local r3_33 = 0
  for r7_33 = 0, r2_33 + -1, 1 do
    local r8_33 = r0_33.List_SubTab:GetItemAt(r7_33)
    if r8_33 and r8_33.TempleId == r0_33.TempleId then
      r3_33 = r7_33
      break
    end
  end
  local r4_33 = r3_33 + r1_33
  if r4_33 < 0 then
    r4_33 = r2_33 + -1
  elseif r2_33 <= r4_33 then
    r4_33 = 0
  end
  local r5_33 = r0_33.List_SubTab:GetItemAt(r4_33)
  if r5_33 then
    r0_33:OnSubTabItemClicked(r5_33)
  end
end
function r0_0.SetBGColor(r0_34, r1_34)
  -- line: [631, 664] id: 34
  r0_34.Name.Text_Name:SetColorAndOpacity(r0_34.Name["Title_" .. r1_34])
  r0_34.Name.Text_Num:SetColorAndOpacity(r0_34.Name["Title_" .. r1_34])
  r0_34.Name.Text_Difficulty:SetColorAndOpacity(r0_34.Name["SubTitle_" .. r1_34])
  r0_34.Name.Square01:SetColorAndOpacity(r0_34.Name["Square_" .. r1_34])
  r0_34.Name.Square02:SetColorAndOpacity(r0_34.Name["Square_" .. r1_34])
  r0_34.Text_Title_Description:SetColorAndOpacity(r0_34["Title_" .. r1_34])
  r0_34.Text_Description01:SetColorAndOpacity(r0_34["Content_" .. r1_34])
  r0_34.Text_Description02:SetColorAndOpacity(r0_34["Content_" .. r1_34])
  r0_34.Text_Title_Rule:SetColorAndOpacity(r0_34["Title_" .. r1_34])
  r0_34.Text_Title_Target:SetColorAndOpacity(r0_34["Title_" .. r1_34])
  r0_34.Text_Progress:SetColorAndOpacity(r0_34["Title_" .. r1_34])
  for r5_34 = 1, 3, 1 do
    r0_34["Target0" .. r5_34].Text_Target:SetColorAndOpacity(r0_34["Target0" .. r5_34]["Text_" .. r1_34])
  end
  for r5_34 = 1, 4, 1 do
    r0_34["Rule_" .. r5_34].Text_Rule:SetColorAndOpacity(r0_34["Rule_" .. r5_34]["Color_" .. r1_34])
  end
  r0_34.Btn_Start.Text:SetColorAndOpacity(r0_34.Btn_Start["Text_" .. r1_34])
  r0_34.Btn_Start.Text_Lock:SetColorAndOpacity(r0_34.Btn_Start["Text_" .. r1_34])
  r0_34.Btn_Start.Star_L_Lock:SetColorAndOpacity(r0_34.Btn_Start["Star_" .. r1_34])
  r0_34.Btn_Start.Star_R_Lock:SetColorAndOpacity(r0_34.Btn_Start["Star_" .. r1_34])
  r0_34.Btn_Start.Star_L:SetColorAndOpacity(r0_34.Btn_Start["Star_" .. r1_34])
  r0_34.Btn_Start.Star_R:SetColorAndOpacity(r0_34.Btn_Start["Star_" .. r1_34])
  r0_34.BG_SubTab:SetColorAndOpacity(r0_34["BG_List_" .. r1_34])
  r0_34.Btn_Start.BG_Hover:SetColorAndOpacity(r0_34.Btn_Start["Star_" .. r1_34])
end
function r0_0.PlayBGAnimations(r0_35)
  -- line: [666, 694] id: 35
  local r1_35 = r0_35.BG
  if not r1_35 or not r1_35.In or not r1_35.Loop then
    return 
  end
  r1_35:StopAllAnimations()
  if r1_35.Loop then
    r1_35:UnbindAllFromAnimationFinished(r1_35.Loop)
  end
  if r1_35.Loop_2 then
    r1_35:UnbindAllFromAnimationFinished(r1_35.Loop_2)
  end
  r1_35:UnbindAllFromAnimationFinished(r1_35.In)
  r1_35:BindToAnimationFinished(r1_35.In, {
    r0_35,
    function()
      -- line: [675, 679] id: 36
      if r1_35 ~= r0_35.BG then
        return 
      end
      if r1_35.Loop then
        r1_35:PlayAnimation(r1_35.Loop)
      end
      if r1_35.Loop_2 then
        r1_35:PlayAnimation(r1_35.Loop_2)
      end
    end
  })
  r1_35:BindToAnimationFinished(r1_35.Loop, {
    r0_35,
    function()
      -- line: [681, 684] id: 37
      if r1_35 ~= r0_35.BG then
        return 
      end
      r1_35:PlayAnimation(r1_35.Loop)
    end
  })
  if r1_35.Loop_2 then
    r1_35:BindToAnimationFinished(r1_35.Loop_2, {
      r0_35,
      function()
        -- line: [687, 690] id: 38
        if r1_35 ~= r0_35.BG then
          return 
        end
        r1_35:PlayAnimation(r1_35.Loop_2)
      end
    })
  end
  r1_35:PlayAnimation(r1_35.In)
end
function r0_0.GetRewards(r0_39, r1_39)
  -- line: [696, 711] id: 39
  local r2_39 = GWorld:GetAvatar()
  local r3_39 = r2_39.Temple
  local r4_39 = r1_39.ConfigData.ItemId
  if r2_39 then
    r2_39:TempleGetReward(r4_39, function(r0_40, r1_40)
      -- line: [701, 708] id: 40
      r1_39.ConfigData.CanReceive = false
      r1_39.ConfigData.RewardsGot = true
      r1_39.SelfWidget:RefreshBtn(r0_40 == 0)
      r1_39.SelfWidget:RefreshReddotInfo()
      r1_39.Owner:RealRefreshListRewardInfo(r1_39.ConfigData.Type)
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, r1_40, false, nil, nil, false)
    end)
  end
end
function r0_0.GetAllRewards(r0_41, r1_41)
  -- line: [713, 735] id: 41
  local r2_41 = GWorld:GetAvatar()
  if r2_41 then
    r2_41:TempleGetAllModeReward(108001, r1_41.IsHardMode, function(r0_42, r1_42)
      -- line: [716, 731] id: 42
      local r2_42 = false
      for r6_42 = 0, r1_41.SelfWidget.List_Item:GetNumItems() + -1, 1 do
        local r7_42 = r1_41.SelfWidget.List_Item:GetItemAt(r6_42)
        if r7_42.ConfigData.CanReceive == true then
          r7_42.ConfigData.CanReceive = false
          r7_42.ConfigData.RewardsGot = true
        end
        if r7_42.SelfWidget then
          r7_42.SelfWidget:RefreshBtn(r7_42.ConfigData.RewardsGot)
        end
      end
      r1_41.SelfWidget:RefreshBtnGetAll(r1_41.SelfWidget)
      r1_41.SelfWidget:RefreshReddotInfo()
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, r1_42, false, nil, nil, false)
    end)
  end
end
function r0_0.RefreshReddot(r0_43)
  -- line: [737, 748] id: 43
  local r1_43 = ReddotManager.GetTreeNode("TempleSoloEventReward")
  if not r1_43 then
    r0_43.Reward.Reddot:SetVisibility(ESlateVisibility.Collapsed)
    return 
  end
  if r1_43.Count and r1_43.Count > 0 then
    r0_43.Reward.Reddot:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    r0_43.Reward.Reddot:SetVisibility(ESlateVisibility.Collapsed)
  end
end
function r0_0.GetFirstUnfinishedSubTabIndex(r0_44)
  -- line: [750, 783] id: 44
  local r1_44 = GWorld:GetAvatar()
  if not r1_44 then
    return 
  end
  if not r1_44.Temple[r0_44.EventId] then
    return 
  end
  local r2_44 = {}
  for r7_44, r8_44 in pairs(DataMgr.TempleEventLevel) do
    table.insert(r2_44, {
      TempleId = r7_44,
      Data = r8_44,
    })
  end
  -- close: r3_44
  table.sort(r2_44, function(r0_45, r1_45)
    -- line: [759, 761] id: 45
    return r0_45.TempleId < r1_45.TempleId
  end)
  local r3_44 = 0
  local r4_44 = 0
  for r8_44 = 0, 2, 1 do
    local r9_44 = r0_44.List_Tab:GetItemAt(r8_44)
    for r14_44, r15_44 in pairs(r2_44) do
      if r15_44.Data.TempleTypeId == r9_44.TempleTypeId and (r1_44.Temple[r0_44.EventId].FinishStars[r15_44.TempleId] and 0) < 3 then
        local r17_44 = r15_44.Data.UnlockDate
        if not r17_44 or TimeUtils.NowTime() >= r17_44 then
          r3_44 = r15_44.Data.TempleTypeId
          r4_44 = r15_44.TempleId
          return r3_44, r4_44
        else
          break
        end
      end
    end
    -- close: r10_44
  end
  return r3_44, r4_44
end
function r0_0.GetTargetSubTabIndex(r0_46, r1_46)
  -- line: [785, 804] id: 46
  local r2_46 = {}
  for r7_46, r8_46 in pairs(r1_46) do
    table.insert(r2_46, {
      TempleId = r7_46,
      Data = r8_46,
    })
  end
  -- close: r3_46
  table.sort(r2_46, function(r0_47, r1_47)
    -- line: [790, 792] id: 47
    return r0_47.TempleId < r1_47.TempleId
  end)
  local r3_46 = 0
  local r4_46 = GWorld:GetAvatar()
  if not r4_46 then
    return 
  end
  if not r4_46.Temple[r0_46.EventId] then
    return 
  end
  for r9_46, r10_46 in pairs(r2_46) do
    if (r4_46.Temple[r0_46.EventId].FinishStars[r10_46.TempleId] and 0) < 3 then
      r3_46 = r10_46.TempleId
      return r3_46
    end
  end
  -- close: r5_46
end
return r0_0
