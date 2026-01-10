-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\UI_PC\RougeLike\WBP_Rouge_DifficultySelection_C.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("Utils.TimeUtils")
local r1_0 = require("BluePrints.UI.UI_PC.RougeLike.PC.Contract.WBP_Rouge_Contract_Model")
local r2_0 = require("EMCache.EMCache")
local r3_0 = Class({
  "BluePrints.UI.BP_UIState_C"
})
function r3_0.Construct(r0_1)
  -- line: [7, 13] id: 1
  r0_1:Init()
  r0_1.RoomIndex = nil
  r0_1.Score = nil
  r0_1.IsInSelectState = false
  r0_1:AddDispatcher(EventID.CurrentSquadChange, r0_1, r0_1.OnCurrentSquadChange)
end
function r3_0.Destruct(r0_2)
  -- line: [15, 18] id: 2
  r0_2:ClearListenEvent()
  EventManager:RemoveEvent(EventID.OnRougeLikeInfoUpdate, r0_2)
end
function r3_0.InitParent(r0_3, r1_3)
  -- line: [20, 22] id: 3
  r0_3.Parent = r1_3
end
function r3_0.Init(r0_4)
  -- line: [24, 65] id: 4
  r1_0:InitModel(GWorld:GetAvatar())
  r0_4.Btn_Enter.Button_Area.OnClicked:Add(r0_4, r0_4.OnBtnClicked)
  r0_4.Btn_Enter.Button_Area.OnHovered:Add(r0_4, r0_4.OnBtnHovered)
  r0_4.Btn_Out.Button_Area.OnClicked:Add(r0_4, r0_4.EarlySettlement)
  r0_4.Btn_Out.Button_Area.OnHovered:Add(r0_4, r0_4.OnBtnHovered)
  r0_4.Btn_Start.OnClicked:Add(r0_4, r0_4.OnBtnClicked)
  r0_4.Btn_Heat.OnClicked:Add(r0_4, r0_4.OpenContractPanel)
  r0_4.Btn_Heat.OnHovered:Add(r0_4, r0_4.OnBtnHeatHovered)
  r0_4.Text_Start:SetText(GText("System_Name_Rouge_Enter_2"))
  r0_4.Text_Clear:SetText(GText("Rouge_CompeleScore"))
  r0_4.Text_Reward:SetText(GText("Rouge_FirstTimeReward"))
  r0_4.Text_HeatName:SetText(GText("UI_Rougelike_Contract_Name"))
  r0_4.Text_Lock:SetText(GText("UI_RL_DifficultyLocked"))
  r0_4.Text_Progress:SetText(GText("UI_RL_CurrentProgress"))
  r0_4.Text_Points:SetText(GText("UI_Rougelike_Contract_ScoreBonus"))
  r0_4.Btn_Out.Text_Button:SetText(GText("UI_RL_BtnFinish"))
  r0_4.Title_Level:SetText(GText("UI_RL_SecondTitle"))
  r0_4.Text_Tip:SetText(GText("UI_Rougelike_MODTip"))
  r0_4.Btn_Enter.Img_Slot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_4.Btn_Out.Img_Slot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_4.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(UE4.UGameplayStatics.GetPlayerController(r0_4, 0))
  if IsValid(r0_4.GameInputModeSubsystem) then
    r0_4:RefreshOpInfoByInputDevice(r0_4.GameInputModeSubsystem:GetCurrentInputType(), r0_4.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  r0_4:InitListenEvent()
  r0_4:InitWidgetInfoInGamePad()
  if not r0_4.Weekly_Points then
    local r3_4 = GWorld.GameInstance:GetGameUIManager():GetUIObj("StyleOfPlay")
    if r3_4.Rouge_Points then
      r0_4.Weekly_Points = r3_4.Rouge_Points
    end
  end
  if r0_4.Weekly_Points then
    r0_4.Weekly_Points.Text_Points:SetText(GText("UI_RL_WeeklyScore"))
    EventManager:AddEvent(EventID.OnRougeLikeInfoUpdate, r0_4, r0_4.UpdateRougeLikeScore)
    r0_4:UpdateRougeLikeScore()
  end
  r0_4:UpdateRougeLikeInfoAbstract()
end
function r3_0.InitWidgetInfoInGamePad(r0_5)
  -- line: [67, 118] id: 5
  if r0_5.Icon_Key_Reward then
    r0_5.Icon_Key_Reward:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "LS",
        }
      },
    })
  end
  if r0_5.Icon_Key_Heat then
    r0_5.Icon_Key_Heat:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "X",
        }
      },
    })
  end
  if r0_5.Btn_Enter.Img_GamePad then
    r0_5.Btn_Enter.Img_GamePad:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "A",
        }
      },
    })
  end
  if r0_5.Btn_Out.Img_GamePad then
    r0_5.Btn_Out.Img_GamePad:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "Y",
        }
      },
    })
  end
  if r0_5.Key_Controller_Start then
    r0_5.Key_Controller_Start:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "A",
        }
      },
    })
  end
end
function r3_0.InitListenEvent(r0_6)
  -- line: [120, 124] id: 6
  if IsValid(r0_6.GameInputModeSubsystem) then
    r0_6.GameInputModeSubsystem.OnInputMethodChanged:Add(r0_6, r0_6.RefreshOpInfoByInputDevice)
  end
end
function r3_0.ClearListenEvent(r0_7)
  -- line: [126, 130] id: 7
  if IsValid(r0_7.GameInputModeSubsystem) then
    r0_7.GameInputModeSubsystem.OnInputMethodChanged:Remove(r0_7, r0_7.RefreshOpInfoByInputDevice)
  end
end
function r3_0.HandleKeyDown(r0_8, r1_8, r2_8)
  -- line: [132, 173] id: 8
  local r3_8 = UE4.UKismetInputLibrary.GetKey(r2_8)
  local r4_8 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_8)
  local r5_8 = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_8) then
    if not r0_8.DefaultList.Preview.IsExpand then
      if r4_8 == UIConst.GamePadKey.FaceButtonBottom then
        r5_8 = true
        r0_8:OnBtnClicked()
      elseif r4_8 == UIConst.GamePadKey.FaceButtonLeft then
        r5_8 = true
        r0_8:OpenContractPanelByGamePad()
      elseif r4_8 == UIConst.GamePadKey.LeftThumb then
        r5_8 = true
        r0_8:EnterSelectMode()
      elseif r4_8 == UIConst.GamePadKey.FaceButtonTop then
        r5_8 = true
        r0_8:EarlySettlement()
      elseif r4_8 == UIConst.GamePadKey.FaceButtonRight and r0_8.IsInSelectState then
        r5_8 = true
        r0_8:LeaveSelectMode()
      end
    elseif r4_8 == UIConst.GamePadKey.FaceButtonRight and r0_8.DefaultList:GetVisibility() == ESlateVisibility.SelfHitTestInvisible and r0_8.DefaultList.IsShow then
      r5_8 = true
      r0_8.DefaultList:OnCloseSquadGamepad()
      r0_8:UpdateTabDifficultySelection()
      r0_8:FocusOnFirstItem()
    end
  elseif r4_8 == "Escape" then
    r5_8 = true
    r0_8:OnClickEsc()
  end
  return r5_8
end
function r3_0.OnClickEsc(r0_9)
  -- line: [175, 182] id: 9
  if r0_9.DefaultList:GetVisibility() == ESlateVisibility.SelfHitTestInvisible and r0_9.DefaultList.IsShow then
    r0_9.DefaultList:OnCloseSquadGamepad()
    r0_9:UpdateTabDifficultySelection()
  else
    r0_9.Parent:BackToRougeMain()
  end
end
function r3_0.RefreshOpInfoByInputDevice(r0_10, r1_10, r2_10)
  -- line: [184, 190] id: 10
  if r1_10 == ECommonInputType.Touch then
    return 
  end
  r0_10:UpdateUIStyleInPlatform(r1_10 == ECommonInputType.MouseAndKeyboard)
end
function r3_0.UpdateUIStyleInPlatform(r0_11, r1_11)
  -- line: [192, 198] id: 11
  if r1_11 then
    r0_11:InitKeyboardView()
  else
    r0_11:InitGamepadView()
  end
end
function r3_0.InitGamepadView(r0_12)
  -- line: [200, 214] id: 12
  if r0_12.Controller_Reward then
    r0_12.Controller_Reward:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if r0_12.Controller_Heat then
    r0_12.Controller_Heat:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  r0_12.Btn_Enter.Img_GamePad:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_12.Btn_Enter.Icon:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_12.Btn_Out.Img_GamePad:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_12.Btn_Out.Icon:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if UIUtils.HasAnyFocus(r0_12) then
    r0_12:SetFocusWhenSwitch()
  end
end
function r3_0.SetFocusWhenSwitch(r0_13)
  -- line: [216, 222] id: 13
  if r0_13.DefaultList.Preview.IsExpand then
    r0_13.DefaultList.List_Default:NavigateToIndex(0)
  else
    r0_13:FocusOnFirstItem()
  end
end
function r3_0.InitKeyboardView(r0_14)
  -- line: [224, 236] id: 14
  r0_14:LeaveSelectMode()
  if r0_14.Controller_Reward then
    r0_14.Controller_Reward:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if r0_14.Controller_Heat then
    r0_14.Controller_Heat:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  r0_14.Btn_Enter.Img_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_14.Btn_Enter.Icon:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_14.Btn_Out.Img_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_14.Btn_Out.Icon:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end
function r3_0.FocusOnFirstItem(r0_15)
  -- line: [238, 242] id: 15
  if IsValid(r0_15.GameInputModeSubsystem) then
    r0_15.GameInputModeSubsystem:SetTargetUIFocusWidget(r0_15.SelectCell)
  end
end
function r3_0.EnterSelectMode(r0_16)
  -- line: [244, 254] id: 16
  if r0_16.IsInSelectState then
    return 
  end
  r0_16:UpdateUIStyleInPlatform(true)
  r0_16:InitSelectTab()
  if IsValid(r0_16.GameInputModeSubsystem) then
    r0_16.GameInputModeSubsystem:SetTargetUIFocusWidget(r0_16.List_Prop)
  end
  r0_16.IsInSelectState = true
end
function r3_0.LeaveSelectMode(r0_17)
  -- line: [256, 264] id: 17
  if not r0_17.IsInSelectState then
    return 
  end
  r0_17:UpdateUIStyleInPlatform(false)
  r0_17:InitNormalTab()
  r0_17:FocusOnFirstItem()
  r0_17.IsInSelectState = false
end
function r3_0.OnUINavigation(r0_18, r1_18)
  -- line: [266, 279] id: 18
  local r2_18 = nil
  if r0_18.SelectCell then
    r2_18 = r0_18.ScrollBox_List:GetChildIndex(r0_18.SelectCell)
  end
  if r2_18 then
    if r1_18 == EUINavigation.Up then
      return r0_18:OnNavigationToIndex(r2_18 + -1)
    elseif r1_18 == EUINavigation.Down then
      return r0_18:OnNavigationToIndex(r2_18 + 1)
    end
  end
  return nil
end
function r3_0.OnNavigationToIndex(r0_19, r1_19)
  -- line: [281, 292] id: 19
  local r2_19 = r0_19.ScrollBox_List:GetChildAt(r1_19)
  if r2_19 then
    if r2_19:OnSubCellClicked() then
      return r2_19
    else
      return r0_19.SelectCell
    end
  end
  return nil
end
function r3_0.UpdateRougeLikeScore(r0_20)
  -- line: [294, 309] id: 20
  local r1_20 = GWorld:GetAvatar()
  if r1_20 then
    local r3_20 = DataMgr.RougeLikeReward[r1_20.RougeLike.WeeklyRewardId]
    if r3_20 and r3_20.Reward and r3_20.EachGradePoints then
      r0_20.CurWeeklyMaxScore = r1_20.RougeLike.WeeklyTotalScore
      local r4_20 = #r3_20.Reward * r3_20.EachGradePoints
      if r4_20 < r0_20.CurWeeklyMaxScore then
        r0_20.CurWeeklyMaxScore = r4_20
      end
      r0_20.Weekly_Points.Text_Has:SetText(r0_20.CurWeeklyMaxScore)
      r0_20.Weekly_Points.Text_Total:SetText(r4_20)
    end
  end
end
function r3_0.UpdateRougeLikeInfoAbstract(r0_21)
  -- line: [311, 322] id: 21
  local r1_21 = GWorld:GetAvatar()
  if r1_21 then
    r1_21:GetProgressingRougeLikeAbstract(function(r0_22)
      -- line: [314, 319] id: 22
      r0_21.RoomIndex = r0_22.RoomIndex
      r0_21.Score = r0_22.Score
      r0_21.Panel_Progress:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      r0_21.Text_Now:SetText(r0_21.RoomIndex)
    end)
  end
end
function r3_0.OnClickedLevelCell(r0_23, r1_23)
  -- line: [324, 341] id: 23
  local r2_23 = GWorld:GetAvatar()
  if r2_23 and r2_23:IsRougeLikeInProgress() and r2_23.RougeLike.ProgressingDifficultyId ~= r1_23.DifficultyId then
    GWorld.GameInstance:GetGameUIManager():ShowUITip(UIConst.Tip_CommonToast, GText("UI_RL_InRouge"))
    return false
  else
    if r0_23.SelectCell ~= nil then
      r0_23.SelectCell:UnSelected()
      r0_23:PlayAnimation(r0_23.Switch)
    end
    r0_23.SelectCell = r1_23
    r0_23.SelectCell:Selected()
    r0_23.CurCellDifficultyId = r1_23.DifficultyId
    r0_23:RefreshDifficultyInfo(r1_23.DifficultyId)
    return true
  end
end
function r3_0.SetInfo(r0_24)
  -- line: [343, 406] id: 24
  r0_24.CurCellDifficultyId = nil
  r0_24.SelectCell = nil
  r0_24.SeasonId = nil
  r0_24:RefreshHeatValue()
  r0_24.ScrollBox_List:ClearChildren()
  local r1_24 = GWorld:GetAvatar()
  if r1_24 then
    r0_24.SeasonId = r1_24.RougeLike.ProgressingSeasonId
  end
  local r2_24 = DataMgr.RougeLikeSeason[r0_24.SeasonId].DifficultyId
  if r2_24 then
    r0_24.HighestDiffcultyId = r2_24[#r2_24]
  end
  local r3_24 = DataMgr.RougeLikeDifficulty
  local r4_24 = GWorld.GameInstance:GetGameUIManager()
  local r5_24 = nil
  local r6_24 = nil
  local r7_24 = {}
  if r1_24 then
    for r11_24 = 1, #r2_24, 1 do
      local r12_24 = r3_24[r2_24[r11_24]].UnlockCondition
      local r13_24 = false
      if r12_24 then
        r13_24 = r1_24:CheckCondition(r12_24)
      else
        r13_24 = true
      end
      r7_24[r2_24[r11_24]] = r13_24
      if r5_24 and r7_24[r2_24[r11_24]] and r3_24[r2_24[r5_24]].UnlockLevel <= r3_24[r2_24[r11_24]].UnlockLevel then
        r5_24 = r11_24
      elseif r7_24[r2_24[r11_24]] then
        r5_24 = r11_24
      end
    end
    if r1_24:IsRougeLikeInProgress() then
      r1_24:GetProgressingRougeLikeAbstract()
      r6_24 = r1_24.RougeLike.ProgressingDifficultyId
    elseif not r5_24 then
      r5_24 = 1
    end
    if r6_24 then
      r5_24 = nil
    end
  end
  for r11_24 = 1, #r2_24, 1 do
    local r12_24 = r4_24:_CreateWidgetNew("RougeDifficultyListItem")
    r0_24.ScrollBox_List:AddChild(r12_24)
    r12_24:BindEventOnClicked(r0_24, r0_24.OnClickedLevelCell, r12_24)
    r12_24:ItemSetNavigationRuleCustom(r0_24, r0_24.OnUINavigation)
    r12_24:InitInfo(r2_24[r11_24], r11_24, r7_24[r2_24[r11_24]])
    if r6_24 == r2_24[r11_24] or r5_24 == r11_24 then
      r0_24:OnClickedLevelCell(r12_24)
    end
  end
  r0_24:RefreshSquad()
end
function r3_0.RefreshDifficultyInfo(r0_25, r1_25)
  -- line: [408, 443] id: 25
  local r2_25 = DataMgr.RougeLikeDifficulty
  r0_25.Text_Point:SetText(r2_25[r1_25].CompleteScore)
  r0_25.Text_Total:SetText(r2_25[r1_25].RoomTotal)
  if r0_25.SelectCell.Unlock then
    local r3_25 = GWorld:GetAvatar()
    if r3_25 and r3_25:IsRougeLikeInProgress() then
      r0_25.Switch_Btn:SetActiveWidgetIndex(0)
      r0_25.Heat_Button:SetVisibility(UIConst.VisibilityOp.Collapsed)
      if r0_25.RoomIndex then
        r0_25.Panel_Progress:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
        r0_25.Text_Now:SetText(r0_25.RoomIndex)
      else
        r0_25.Panel_Progress:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
      r0_25.Text_Tip:SetVisibility(UIConst.VisibilityOp.Collapsed)
      r0_25.Btn_Out:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      r0_25.Btn_Enter.Text_Button:SetText(GText("UI_RL_BtnContinue"))
    else
      r0_25.Switch_Btn:SetActiveWidgetIndex(2)
      if r1_25 == r0_25.HighestDiffcultyId then
        r0_25.Heat_Button:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      else
        r0_25.Heat_Button:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
      r0_25.Panel_Progress:SetVisibility(UIConst.VisibilityOp.Collapsed)
      r0_25.Text_Tip:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    end
  else
    r0_25.Switch_Btn:SetActiveWidgetIndex(1)
    r0_25.Text_Lock:SetText(string.format(GText("UI_RL_UnlockLevel"), r2_25[r1_25].UnlockLevel))
    r0_25.Heat_Button:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_25.Panel_Progress:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  r0_25:RefreshRewardsList(r1_25)
end
function r3_0.RefreshRewardsList(r0_26, r1_26)
  -- line: [445, 484] id: 26
  local r2_26 = GWorld:GetAvatar()
  local r3_26 = false
  if r2_26 and r2_26.RougeLike.PassCount and r2_26.RougeLike.PassCount[r1_26] and r2_26.RougeLike.PassCount[r1_26] >= 1 then
    r3_26 = true
  end
  local r5_26 = {
    DataMgr.RougeLikeDifficulty[r1_26].FirstTimeReward
  }
  r0_26.List_Prop:ClearListItems()
  r0_26.List_Prop:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  for r10_26, r11_26 in pairs(r5_26) do
    local r12_26 = DataMgr.Reward[r11_26]
    if r12_26 then
      local r13_26 = r12_26.Id and {}
      local r14_26 = r12_26.Count and {}
      local r15_26 = r12_26.Type and {}
      for r19_26 = 1, #r13_26, 1 do
        local r20_26 = NewObject(UIUtils.GetCommonItemContentClass())
        local r21_26 = r13_26[r19_26]
        r20_26.UIName = "RougeDifficultySelection"
        r20_26.IsShowDetails = true
        r20_26.bIsResetFocus = true
        r20_26.Id = r21_26
        r20_26.Count = RewardUtils:GetCount(r14_26[r19_26])
        r20_26.Icon = ItemUtils.GetItemIconPath(r21_26, r15_26[r19_26])
        r20_26.Rarity = ItemUtils.GetItemRarity(r21_26, r15_26[r19_26])
        r20_26.ItemType = r15_26[r19_26]
        r20_26.Parent = r0_26
        r20_26.bHasGot = r3_26
        r20_26.OnMenuOpenChangedEvents = {
          Obj = r0_26,
          Callback = r0_26.OnMenuOpenChanged,
        }
        r0_26.List_Prop:AddItem(r20_26)
      end
    end
  end
  -- close: r6_26
end
function r3_0.OnBtnClicked(r0_27)
  -- line: [486, 529] id: 27
  if r0_27.IsInSelectState then
    return 
  end
  if not r0_27.SelectCell.Unlock then
    return 
  end
  AudioManager(r0_27):PlayUISound(r0_27, "event:/ui/roguelike/confirm_btn_click", nil, nil)
  local r1_27 = GWorld:GetAvatar()
  if r1_27 then
    local function r2_27(r0_28)
      -- line: [496, 512] id: 28
      r0_27:BlockAllUIInput(false)
      if r0_28 == ErrorCode.RET_SUCCESS then
        GWorld.GameInstance:SetExitDungeonData({
          Type = "Rouge",
        })
      end
    end
    if not r0_27:CheckSeasonTimeValid(r0_27.SeasonId) then
      GWorld.GameInstance:GetGameUIManager():ShowUITip(UIConst.Tip_CommonToast, GText("UI_Rou_Toast_27005"))
      return 
    end
    if DataMgr.RougeLikeDifficulty[r0_27.CurCellDifficultyId] and r0_27.SelectCell and r0_27.SelectCell.Unlock then
      r0_27:BlockAllUIInput(true)
      r1_27:EnterRougeLike(r2_27, r0_27.CurCellDifficultyId, r0_27.SquadId)
    else
      GWorld.GameInstance:GetGameUIManager():ShowUITip(UIConst.Tip_CommonToast, GText("UI_Rou_Toast_27027"))
    end
  end
end
function r3_0.OnBtnHovered(r0_29)
  -- line: [531, 533] id: 29
  AudioManager(r0_29):PlayUISound(r0_29, "event:/ui/roguelike/confirm_btn_hover", nil, nil)
end
function r3_0.EarlySettlement(r0_30)
  -- line: [535, 558] id: 30
  if not r0_30.Score then
    return 
  end
  AudioManager(r0_30):PlayUISound(r0_30, "event:/ui/roguelike/confirm_btn_click", nil, nil)
  GWorld.GameInstance:GetGameUIManager():ShowCommonPopupUI(100144, {
    Tips = {
      string.format(GText(DataMgr.CommonPopupUIContext[100144].Tip[1]), r0_30.Score, math.floor(r0_30.Score / DataMgr.RougeLikeSeason[r0_30.SeasonId].TalentPointsTransform))
    },
    RightCallbackFunction = function()
      -- line: [546, 556] id: 31
      r0_30:BlockAllUIInput(true)
      GWorld:GetAvatar():InterruptRougeLike()
      EventManager:AddEvent(EventID.OnRougeLikeInfoUpdate, r0_30, function()
        -- line: [550, 555] id: 32
        r0_30:BlockAllUIInput(false)
        r0_30.Score = nil
        r0_30:RefreshListItemAndSelectedInfo()
        EventManager:RemoveEvent(EventID.OnRougeLikeInfoUpdate, r0_30)
      end)
    end,
  }, r0_30)
end
function r3_0.CheckSeasonTimeValid(r0_33, r1_33)
  -- line: [560, 570] id: 33
  if not r1_33 then
    return false
  end
  if not DataMgr.RougeLikeSeason[r1_33] then
    return false
  end
  local r2_33 = DataMgr.RougeLikeSeason[r1_33]
  local r3_33 = r0_0.NowTime()
  local r4_33 = r2_33.SeasonStartTime
  if r4_33 <= r3_33 then
    r4_33 = r3_33 <= r2_33.SeasonEndTime
  else
    goto label_22	-- block#6 is visited secondly
  end
  return r4_33
end
function r3_0.OpenContractPanelByGamePad(r0_34)
  -- line: [572, 580] id: 34
  if r0_34.IsInSelectState then
    return 
  end
  if r0_34.Heat_Button:GetVisibility() == UIConst.VisibilityOp.Collapsed then
    return 
  end
  r0_34:OpenContractPanel()
end
function r3_0.OpenContractPanel(r0_35)
  -- line: [582, 586] id: 35
  AudioManager(r0_35):PlayUISound(r0_35, "event:/ui/roguelike/btn_black_mid_click", nil, nil)
  GWorld.GameInstance:GetGameUIManager():LoadUINew("RougeLikeContractPanel", r0_35)
end
function r3_0.OnBtnHeatHovered(r0_36)
  -- line: [588, 590] id: 36
  AudioManager(r0_36):PlayUISound(r0_36, "event:/ui/roguelike/btn_black_hover", nil, nil)
end
function r3_0.RefreshHeatValue(r0_37)
  -- line: [592, 603] id: 37
  local r1_37 = r1_0:GetCurrentHeatValue()
  r0_37.Text_HeatPoints:SetText(r1_0:GetCurrentHeatValue())
  r0_37.Text_Bouns:SetText(math.floor(r1_0:GetCurrentContractPointRate() * 100))
  if r1_37 == 0 then
    r0_37:HideHeatPointBouns(true)
  else
    r0_37:HideHeatPointBouns(false)
  end
end
function r3_0.HideHeatPointBouns(r0_38, r1_38)
  -- line: [605, 616] id: 38
  local r2_38 = UIConst.VisibilityOp.Visible
  if r1_38 then
    r2_38 = UIConst.VisibilityOp.Collapsed
  end
  r0_38.Text_01:SetVisibility(r2_38)
  r0_38.Text_Points:SetVisibility(r2_38)
  r0_38.Text_Plus:SetVisibility(r2_38)
  r0_38.Text_Bouns:SetVisibility(r2_38)
  r0_38.Text_Percent:SetVisibility(r2_38)
  r0_38.Text_02:SetVisibility(r2_38)
end
function r3_0.RefreshListItemAndSelectedInfo(r0_39)
  -- line: [618, 625] id: 39
  local r1_39 = r0_39.ScrollBox_List:GetAllChildren()
  for r5_39 = 1, r1_39:Length(), 1 do
    r1_39:GetRef(r5_39):RefreshState()
  end
  r0_39:RefreshDifficultyInfo(r0_39.SelectCell.DifficultyId)
end
function r3_0.SetVisibility(r0_40, r1_40)
  -- line: [627, 632] id: 40
  r0_40.Overridden.SetVisibility(r0_40, r1_40)
  if r0_40.Weekly_Points then
    r0_40.Weekly_Points:SetVisibility(r1_40)
  end
end
function r3_0.HideWeeklyPoints(r0_41)
  -- line: [634, 638] id: 41
  if r0_41.Weekly_Points then
    r0_41.Weekly_Points:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r3_0.HideSquad(r0_42)
  -- line: [640, 644] id: 42
  if r0_42.DefaultList then
    r0_42.DefaultList:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r3_0.RefreshSquad(r0_43)
  -- line: [646, 657] id: 43
  r0_43.DefaultList:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  local r1_43 = GWorld:GetAvatar()
  r0_43.SquadId = 0
  if r1_43 then
    local r2_43 = r1_43.DungeonSquad.Rouge
    if r2_43 and r2_43 > 0 then
      r0_43.SquadId = r2_43
    end
  end
  r0_43.DefaultList:Init(r0_43, true, r0_43.SquadId)
end
function r3_0.OnCurrentSquadChange(r0_44, r1_44, r2_44)
  -- line: [659, 662] id: 44
  r0_44.SquadId = r1_44
end
function r3_0.OnPreviewKeyDown(r0_45, r1_45, r2_45)
  -- line: [664, 692] id: 45
  if r0_45.DefaultList:GetVisibility() == ESlateVisibility.SelfHitTestInvisible and r0_45.DefaultList.IsShow then
    return UWidgetBlueprintLibrary.UnHandled()
  end
  local r3_45 = UE4.UKismetInputLibrary.GetKey(r2_45)
  local r4_45 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_45)
  local r5_45 = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_45) and not r0_45.DefaultList.Preview.IsExpand then
    if r4_45 == "Gamepad_DPad_Up" then
      r5_45 = true
      if r0_45.DefaultList:GetVisibility() ~= ESlateVisibility.SelfHitTestInvisible then
        return 
      end
      if r0_45.IsInSelectState then
        r0_45:LeaveSelectMode()
      end
      r0_45.DefaultList:OnOpenSquadGamepad()
    elseif r4_45 == "Gamepad_DPad_Down" then
      r5_45 = true
    end
  end
  if r5_45 then
    return UWidgetBlueprintLibrary.Handled()
  else
    return UWidgetBlueprintLibrary.UnHandled()
  end
end
function r3_0.UpdateTabDifficultySelection(r0_46)
  -- line: [694, 704] id: 46
  r0_46.Parent.Root:UpdateOtherPageTab({
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = r0_46.OnClickEsc,
          Owner = r0_46,
        }
      },
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
        }
      },
      Desc = GText("UI_BACK"),
      bLongPress = false,
    }
  })
end
function r3_0.InitSelectTab(r0_47)
  -- line: [706, 721] id: 47
  r0_47.Parent.Root:UpdateOtherPageTab({
    {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "A",
        }
      },
      Desc = GText("UI_Tips_Ensure"),
      bLongPress = false,
    },
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = r0_47.OnClickEsc,
          Owner = r0_47,
        }
      },
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
        }
      },
      Desc = GText("UI_BACK"),
      bLongPress = false,
    }
  })
end
function r3_0.InitNormalTab(r0_48)
  -- line: [723, 725] id: 48
  r0_48:UpdateTabDifficultySelection()
end
function r3_0.InitMenuOpenTab(r0_49)
  -- line: [727, 736] id: 49
  r0_49.Parent.Root:UpdateOtherPageTab({
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
        }
      },
      Desc = GText("UI_BACK"),
      bLongPress = false,
    }
  })
end
function r3_0.OnMenuOpenChanged(r0_50, r1_50)
  -- line: [738, 748] id: 50
  if r1_50 then
    r0_50:InitMenuOpenTab()
  elseif r0_50.IsInSelectState then
    r0_50:InitSelectTab()
  else
    r0_50:InitNormalTab()
  end
end
function r3_0.BP_GetDesiredFocusTarget(r0_51)
  -- line: [750, 752] id: 51
  r0_51:FocusOnFirstItem()
end
return r3_0
