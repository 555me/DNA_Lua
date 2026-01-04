-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Play\Widget\Task\NewPlayer\WBP_Play_NewPlayerTask_P_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.BP_UIState_C"
})
r0_0._components = {
  "BluePrints.UI.WBP.Play.Widget.Task.NewPlayer.NewPlayerTaskView"
}
function r0_0.Initialize(r0_1, r1_1)
  -- line: [19, 27] id: 1
  r0_0.Super.Initialize(r0_1)
  r0_1.NodeName = "StarterQuest"
  r0_1.CurPhaseId = nil
  r0_1.PlayerPhaseId = nil
  r0_1.IsCurrentPhaseRedPoint = nil
  r0_1.AllQuestServerData = {}
  r0_1.AllQuestConfigData = {}
end
function r0_0.Destruct(r0_2)
  -- line: [28, 32] id: 2
  r0_2.List_Task.OnCreateEmptyContent:Unbind()
  ReddotManager.RemoveListener(r0_2.NodeName, r0_2)
  r0_2.Super.Destruct(r0_2)
end
function r0_0.InitContent(r0_3, r1_3)
  -- line: [33, 88] id: 3
  r0_3.InitKey = nil
  local r2_3 = GWorld:GetAvatar()
  if r2_3 == nil then
    return 
  end
  r0_3.Parent = r1_3
  r0_3.Mobile = CommonUtils.GetDeviceTypeByPlatformName(r0_3) == "Mobile"
  r0_3:AddInputMethodChangedListen()
  r0_3:InitQuestData()
  r0_3:FillWithQuestData(r2_3)
  r0_3.MaxPhaseIndex = #r0_3.QuestTabInfo
  if r0_3.Mobile then
    r0_3.Btn_CheckReward.Key_RewardPreview:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_3.TaskObjectClass = LoadClass("/Game/UI/WBP/Play/Mobile/Task/NewPlayer/WBP_Play_NewPlayerTaskItem_M.WBP_Play_NewPlayerTaskItem_M")
  else
    r0_3.TaskObjectClass = LoadClass("/Game/UI/WBP/Play/PC/Task/NewPlayer/WBP_Play_NewPlayerTaskItem_P.WBP_Play_NewPlayerTaskItem_P")
  end
  r0_3.List_Task.OnCreateEmptyContent:Bind(r0_3, function(r0_4)
    -- line: [50, 55] id: 4
    local r1_4 = NewObject(r0_4.TaskObjectClass)
    r1_4.QuestId = -1
    r1_4.Parent = r0_4
    return r1_4
  end)
  if not ReddotManager.GetTreeNode(r0_3.NodeName) then
    ReddotManager.AddNode(r0_3.NodeName)
  end
  r0_3.Text_NewPlayerSubTitle:SetText(GText("MAIN_UI_STARTERQUEST01"))
  r0_3.Text_NewPlayerMainTitle:SetText(GText("MAIN_UI_STARTERQUEST02"))
  r0_3:RefreshPhaseIndex(r0_3.PlayerPhaseId)
  r0_3:BindAllClickFunction()
  r0_3.List_Task:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  r0_3.List_Task:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  r0_3.List_Task:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  r0_3.List_Task:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  r0_3:AddDispatcher(EventID.UnLoadUI, r0_3, function(r0_5, r1_5)
    -- line: [67, 73] id: 5
    if r1_5 == "GetItemPage" and not r0_5.List_Task:HasFocusedDescendants() then
      r0_5.List_Task:SetFocus()
    elseif r1_5 == "ArmoryMain" then
      r0_5:HideNpc(false)
    end
  end)
  r0_3:AddDispatcher(EventID.LoadUI, r0_3, function(r0_6, r1_6)
    -- line: [74, 78] id: 6
    if r1_6 == "ArmoryMain" then
      r0_6:HideNpc(true)
    end
  end)
  r0_3:AddDispatcher(EventID.AllDailyTaskRewardKey, r0_3, r0_3.OnAllDailyTaskRewardKey)
  r0_3:AddDispatcher(EventID.EntryReceiveEnterState, r0_3, function()
    -- line: [80, 86] id: 7
    local r0_7 = UIManager(r0_3):GetUIObj("StyleOfPlay")
    if r0_7 and r0_7:BP_GetDesiredFocusTarget() == r0_3 then
      r0_3:RefreshPhaseIndex(r0_3.CurPhaseId)
      r0_3:SetFocus()
    end
  end)
  r0_3.Left_Reddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
end
function r0_0.HideNpc(r0_8, r1_8)
  -- line: [89, 93] id: 8
  UE4.UGameplayStatics.GetGameInstance(r0_8):GetGameUIManager():HideNpcActor(r1_8, "StyleOfPlay")
end
function r0_0.OnUpdateActivityByAction(r0_9, r1_9, ...)
  -- line: [95, 120] id: 9
  ... = ... -- error: untaken top expr
  local r2_9 = nil	-- notice: implicit variable refs by block#[3, 6, 7, 9]
  if r1_9 == "QuestGetReward" or r1_9 == "QuestComplete" then
    local r3_9 = GWorld:GetAvatar()
    if r3_9 ~= nil then
      local r6_9 = DataMgr.StarterQuestDetail[r2_9].QuestPhaseId
      r0_9.AllQuestServerData[r6_9][r2_9] = r3_9.StarterQuests[r2_9]
      r0_9:RefreshTabItemInfo(r6_9)
    end
  elseif r1_9 == "QuestGetAllReward" then
    local r3_9 = GWorld:GetAvatar()
    if r3_9 ~= nil then
      for r9_9, r10_9 in ipairs(DataMgr.StarterQuestPhaseMap[r2_9]) do
        r0_9.AllQuestServerData[r2_9][r10_9] = r3_9.StarterQuests[r10_9]
      end
      -- close: r5_9
      r0_9:RefreshTabItemInfo(r2_9)
    end
  elseif r1_9 == "QuestRefreshReddot" then
    r0_9:RefreshRightBtnReddot()
  end
end
function r0_0.RefreshOpInfoByInputDevice(r0_10, r1_10, r2_10)
  -- line: [121, 132] id: 10
  if r1_10 == ECommonInputType.Touch then
    return 
  end
  if r1_10 == ECommonInputType.Gamepad and UIUtils.HasAnyFocus(r0_10) and not UIUtils.HasAnyFocus(r0_10.List_Task) then
    r0_10.List_Task:SetFocus()
  end
  r0_10:UpdateUIStyleInPlatform()
  r0_10.Super.RefreshOpInfoByInputDevice(r0_10, r1_10, r2_10)
end
function r0_0.TryNavigateToIndex(r0_11, r1_11)
  -- line: [133, 142] id: 11
  if not r1_11 then
    r1_11 = 0
  end
  r0_11:AddTimer(0.1, function()
    -- line: [135, 141] id: 12
    if r0_11:HasAnyFocus() or r0_11:HasFocusedDescendants() then
      r0_11.List_Task:NavigateToIndex(r1_11)
    else
      r0_11:ClearLastFocusedWidget()
    end
  end)
end
function r0_0.SwitchIn(r0_13)
  -- line: [143, 146] id: 13
  r0_13:TryNavigateToIndex(0)
  r0_13:UpdateUIStyleInPlatform()
end
function r0_0.OnKeyDown(r0_14, r1_14, r2_14)
  -- line: [147, 159] id: 14
  local r3_14 = UE4.UKismetInputLibrary.GetKey(r2_14)
  local r4_14 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_14)
  local r5_14 = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_14) then
    r5_14 = r0_14:OnGamePadDown(r4_14)
  end
  if r5_14 then
    return UWidgetBlueprintLibrary.Handled()
  else
    return UWidgetBlueprintLibrary.UnHandled()
  end
end
function r0_0.OnPreviewKeyDown(r0_15, r1_15, r2_15)
  -- line: [160, 179] id: 15
  local r4_15 = UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_15))
  local r5_15 = false
  if r4_15 == Const.GamepadDPadLeft and r0_15.Key_Left:IsVisible() then
    r0_15:RefreshPhaseIndex(r0_15.CurPhaseId + -1)
    r5_15 = true
  elseif r4_15 == Const.GamepadDPadRight and r0_15.Key_Right:IsVisible() then
    r0_15:RefreshPhaseIndex(r0_15.CurPhaseId + 1)
    r5_15 = true
  end
  if r5_15 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end
function r0_0.OnGamePadDown(r0_16, r1_16)
  -- line: [180, 193] id: 16
  local r2_16 = false
  if r1_16 == Const.GamepadFaceButtonLeft then
    r0_16:PreviewRewardBtnClick()
    r2_16 = true
  elseif r1_16 == Const.GamepadFaceButtonUp and r0_16.Btn_Reward:GetVisibility() ~= UIConst.VisibilityOp.Collapsed then
    r0_16:GetAllRewardBtnClick()
    r2_16 = true
  end
  return r2_16
end
function r0_0.OnAllDailyTaskRewardKey(r0_17)
  -- line: [194, 198] id: 17
  if r0_17.Btn_Reward:GetVisibility() ~= UIConst.VisibilityOp.Collapsed then
    r0_17:GetAllRewardBtnClick()
  end
end
function r0_0.ReGetDesiredFocusTarget(r0_18)
  -- line: [200, 205] id: 18
  if r0_18.SelectItem and r0_18.SelectItem.FocusTypeName ~= "SelfWidget" then
    r0_18.SelectItem:UpdatKeyDisplay("SelfWidget")
  end
  return r0_18.List_Task
end
function r0_0.SwitchGamepadKeyShow(r0_19, r1_19, r2_19)
  -- line: [207, 233] id: 19
  if not r0_19.InitKey then
    r0_19.InitKey = true
    r0_19.Key_Left:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "Left",
        }
      },
    })
    r0_19.Key_Right:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "Right",
        }
      },
    })
    local function r3_19(r0_20, r1_20)
      -- line: [212, 220] id: 20
      local r2_20 = UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad
      local r3_20 = r0_19.PhaseId2TabId[r0_19.CurPhaseId]
      if r0_20 == r0_19.Key_Left then
        r0_19:SetTabWidgetState(r0_20, r3_20 > 1, true, r2_20)
      else
        r0_19:SetTabWidgetState(r0_19.Key_Right, r3_20 < r0_19.MaxPhaseIndex, true, r2_20)
      end
    end
    r0_19.Key_Left.SetForbidKey = r3_19
    r0_19.Key_Right.SetForbidKey = r3_19
    r0_19.Btn_Reward:SetGamePadImg("Y")
    r0_19.Btn_CheckReward.Key_RewardPreview:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "X",
        }
      },
    })
  end
  r0_19.Btn_Reward:SetGamePadIconVisible(r1_19 and r2_19 == "RewardWidget")
  local r4_19 = r0_19.CurPhaseId
  r0_19:SetTabWidgetState(r0_19.Key_Left, r0_19.PhaseId2TabId[r4_19] > 1, true, r1_19)
  r0_19:SetTabWidgetState(r0_19.Key_Right, r3_19 < r0_19.MaxPhaseIndex, true, r1_19)
  if r1_19 then
    r4_19 = UIConst.VisibilityOp.SelfHitTestInvisible and UIConst.VisibilityOp.Collapsed
  else
    goto label_91	-- block#14 is visited secondly
  end
  r0_19.Btn_CheckReward.Key_RewardPreview:SetVisibility(r4_19)
  r0_19.Parent:SwitchGamepadKeyShow(r1_19)
end
function r0_0.UpdateUIStyleInPlatform(r0_21)
  -- line: [234, 262] id: 21
  if r0_21.Mobile then
    return 
  end
  local r1_21 = UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad
  local r2_21 = not r1_21
  r0_21:SwitchGamepadKeyShow(r1_21)
  local r3_21 = UIManager(r0_21):GetUIObj("StyleOfPlay")
  if r3_21 then
    local r4_21 = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = r0_21.CloseSelf,
            Owner = r0_21,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = r0_21,
          }
        },
        Desc = GText("UI_BACK"),
        bLongPress = false,
      }
    }
    if r2_21 and r0_21.Btn_Reward:GetVisibility() ~= UIConst.VisibilityOp.Collapsed then
      table.insert(r4_21, 1, {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Space",
            ClickCallback = r0_21.OnAllDailyTaskRewardKey,
            Owner = r0_21,
          }
        },
        Desc = GText("UI_GameEvent_ClaimAll"),
        bLongPress = false,
      })
    end
    r3_21:UpdateOtherPageTab(r4_21)
  end
end
function r0_0.OnSelectChange(r0_22, r1_22)
  -- line: [263, 274] id: 22
  if r0_22.SelectItem == r1_22 then
    return 
  end
  if r0_22.SelectItem then
    r0_22.SelectItem:OnUnselect()
  end
  if r1_22 then
    r1_22:OnSelect()
  end
  r0_22.SelectItem = r1_22
end
function r0_0.CloseSelf(r0_23)
  -- line: [275, 279] id: 23
  local r1_23 = UIManager(r0_23):GetUIObj("StyleOfPlay")
  r0_23:PlayAnimation(r0_23.Out)
  r1_23:OnClickBack()
end
AssembleComponents(r0_0)
return r0_0
