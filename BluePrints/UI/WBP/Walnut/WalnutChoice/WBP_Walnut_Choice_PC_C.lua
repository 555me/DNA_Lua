-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Walnut\WalnutChoice\WBP_Walnut_Choice_PC_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.BP_UIState_C"
})
local r1_0 = {
  WalnutList = 0,
  TeamList = 1,
  PlayerBubble = 2,
  WalnutReward = 3,
  WalnutRewardPercent = 4,
  WalnutRewardDetail = 5,
  Access = 6,
}
function r0_0.Construct(r0_1)
  -- line: [29, 31] id: 1
  r0_1:CommonConstruct()
end
function r0_0.Destruct(r0_2)
  -- line: [33, 35] id: 2
  TeamController:UnRegisterEvent(r0_2)
end
function r0_0.OnLoaded(r0_3, ...)
  -- line: [36, 43] id: 3
  r0_0.Super.OnLoaded(r0_3, ...)
  r0_3:Init(...)
  r0_3:AddTimer(0.3, function()
    -- line: [40, 42] id: 4
    r0_3.List_WalnutItem:SetFocus()
  end, false, 0, "NextFrameFocus")
end
function r0_0.Init(r0_5, r1_5, ...)
  -- line: [45, 64] id: 5
  if not r1_5 or r1_5 == "" then
    return 
  end
  if not r0_5._components then
    if r1_5 == CommonConst.WalnutUser.Depute then
      r0_5._components = {
        "BluePrints.UI.WBP.Walnut.WalnutChoice.WBP_Depute_Walnut_ChoiceComp_C"
      }
    elseif r1_5 == CommonConst.WalnutUser.Dungeon then
      r0_5._components = {
        "BluePrints.UI.WBP.Walnut.WalnutChoice.WBP_Dungeon_Walnut_ChoiceComp_C"
      }
    elseif r1_5 == CommonConst.WalnutUser.Settlement then
      r0_5._components = {
        "BluePrints.UI.WBP.Walnut.WalnutChoice.WBP_Settlement_Walnut_ChoiceComp_C"
      }
    end
    AssembleComponents(r0_5)
  end
  r0_5:InitComp(...)
end
function r0_0.CommonConstruct(r0_6)
  -- line: [67, 108] id: 6
  AudioManager(r0_6):PlayUISound(r0_6, "event:/ui/common/mihan_level_before_choose_show", "WalnutChoiceShow", nil)
  r0_6.Btn_No:SetText(GText("UI_Walnut_Giveup"))
  r0_6.Btn_Yes:SetText(GText("UI_CONFIRM_SELECTION"))
  r0_6.Text_Choose_Single:SetText(GText("UI_Walnut_Choice"))
  r0_6.Text_Choose_Multi:SetText(GText("UI_Walnut_Choice"))
  r0_6.Text_Selected:SetText(GText("UI_Walnut_Select"))
  r0_6.State_Mine.Text_State:SetText(GText("UI_Walnut_Selecting"))
  r0_6.WBP_Walnut_PlayerState_1.Text_State:SetText(GText("UI_Walnut_Selecting"))
  r0_6.WBP_Walnut_PlayerState_2.Text_State:SetText(GText("UI_Walnut_Selecting"))
  r0_6.WBP_Walnut_PlayerState.Text_State:SetText(GText("UI_Walnut_Selecting"))
  r0_6.GameState = UE4.UGameplayStatics.GetGameState(r0_6)
  if r0_6.GameState:IsInDungeon() then
    r0_6.IsInDungeon = true
    r0_6.Panel_No:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    r0_6.IsInDungeon = false
    r0_6.Panel_No:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  if GWorld.GameInstance:IsInTempScene() then
    r0_6.IsInSettlement = true
    r0_6.Panel_No:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  r0_6.HasSelect = false
  r0_6.WalnutPlate:SetNoWalnut(false)
  r0_6.CurrentSelectContent = nil
  r0_6.RealChoice = nil
  r0_6.List_WalnutItem:ClearListItems()
  r0_6.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  r0_6.Panel_Multi:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_6.Panel_Yes:SetVisibility(ESlateVisibility.Visible)
  r0_6.State = 0
  r0_6:InitCommonKey()
  r0_6.WalnutChoiceFinish = 0
  TeamController:RegisterEvent(r0_6, function(r0_7, r1_7, ...)
    -- line: [103, 107] id: 7
    if r1_7 == TeamCommon.EventId.TeamOnInit or r1_7 == TeamCommon.EventId.TeamLeave then
      r0_7:Close()
    end
  end)
end
function r0_0.StandaloneConstruct(r0_8)
  -- line: [110, 114] id: 8
  r0_8.Panel_Multi:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_8.Text_Choose_Single:SetText(GText("UI_Walnut_Choice"))
  r0_8.Panel_Text_Single:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end
function r0_0.MultiConstruct(r0_9)
  -- line: [116, 119] id: 9
  r0_9.Panel_Multi:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_9.Panel_Text_Single:SetVisibility(UE4.ESlateVisibility.Collapsed)
end
function r0_0.ShowTimerPanel(r0_10, r1_10)
  -- line: [121, 127] id: 10
  if r1_10 then
    r0_10.Panel_Text_Multi:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    r0_10.Panel_Text_Multi:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r0_0.InitWalnuts(r0_11)
  -- line: [129, 178] id: 11
  local r1_11 = GWorld:GetAvatar()
  if r1_11 == nil then
    return 
  end
  r0_11:CreateAndAddForbidItem()
  local r2_11 = 1
  local r3_11 = {}
  r0_11.WalnutsInBag = r1_11.Walnuts.WalnutBag
  for r8_11, r9_11 in pairs(r0_11.WalnutsInBag) do
    if r9_11 > 0 then
      local r10_11 = DataMgr.Walnut[r8_11]
      if r10_11 then
        for r17_11, r18_11 in pairs(DataMgr.WalnutSelectDungeon[r10_11.WalnutType].DungeonId) do
          if r18_11 == r0_11.CurrentDungeonId then
            table.insert(r3_11, {
              WalnutId = r8_11,
              Number = r9_11,
              WalnutData = r10_11,
            })
            break
          end
        end
        -- close: r13_11
      end
    end
  end
  -- close: r4_11
  table.sort(r3_11, function(r0_12, r1_12)
    -- line: [162, 164] id: 12
    return r0_12.WalnutId < r1_12.WalnutId
  end)
  for r8_11, r9_11 in ipairs(r3_11) do
    r0_11:CreateAndAddWalnutItem(r9_11.WalnutId, r9_11.Number)
  end
  -- close: r4_11
  r0_11:AddTimer(0.01, function()
    -- line: [171, 177] id: 13
    local r0_13 = r0_11.List_WalnutItem:GetDisplayedEntryWidgets()
    for r5_13 = 1, UIUtils.GetListViewContentMaxCount(r0_11.List_WalnutItem, r0_13, true) - r0_13:Length(), 1 do
      r0_11:CreateAndAddEmptyItem()
    end
  end, false, 0, "PaddingWalnutListView")
end
function r0_0.ShowChooseSuccessToast(r0_14, r1_14)
  -- line: [180, 199] id: 14
  DebugPrint("ShowChooseSuccessToast")
  if not r0_14.HasSelect then
    r0_14.HasSelect = true
  end
  r0_14:SetWalnutContentRealChoice(r0_14.RealChoice, false)
  r0_14:SetWalnutContentRealChoice(r1_14, true)
  r0_14.RealChoice = r1_14
  r0_14.Btn_Yes:SetText(GText("UI_CONFIRM_SELECTION"))
  if r0_14.RealChoice == r0_14.CurrentSelectContent then
    r0_14.WidgetSwitcher_State:SetActiveWidgetIndex(1)
  end
end
function r0_0.SetWalnutContentRealChoice(r0_15, r1_15, r2_15)
  -- line: [201, 212] id: 15
  if r1_15 then
    local r3_15 = nil
    if r2_15 then
      r3_15 = GText("UI_Walnut_Select")
    end
    r1_15.SelectNeedCount = r3_15
    if r1_15.SelfWidget then
      r1_15.SelfWidget:SetSelectNum(r3_15)
    end
  end
end
function r0_0.OnListItemClicked(r0_16, r1_16)
  -- line: [214, 255] id: 16
  if r1_16.IsEmpty then
    return 
  end
  if r0_16.RealChoice == r1_16 and r0_16.HasSelect then
    r0_16.WidgetSwitcher_State:SetActiveWidgetIndex(1)
  else
    local r2_16 = UGameplayStatics.GetGameState(r0_16)
    if not r0_16.HasSelect or not r2_16:IsInDungeon() then
      r0_16.WidgetSwitcher_State:SetActiveWidgetIndex(0)
    end
  end
  if r0_16.CurrentSelectContent == r1_16 then
    return 
  end
  if r0_16.CurrentSelectContent then
    r0_16.CurrentSelectContent.IsSelect = false
    if r0_16.CurrentSelectContent.SelfWidget then
      r0_16.CurrentSelectContent.SelfWidget:SetSelected(false, true)
    end
  end
  if r1_16 then
    r1_16.IsSelect = true
    if r1_16.SelfWidget then
      r1_16.SelfWidget:SetSelected(true, true)
      if r1_16.IsForbid then
        AudioManager(r0_16):PlayUISound(r0_16, "event:/ui/common/mihan_level_before_choose_select_none", nil, nil)
      else
        AudioManager(r0_16):PlayUISound(r0_16, "event:/ui/common/mihan_level_before_choose_select", nil, nil)
      end
    end
  end
  r0_16.CurrentSelectContent = r1_16
  if not r1_16.Id then
    r0_16.WalnutPlate:SetNoWalnut(true)
  else
    r0_16.WalnutPlate:SetWalnutContent(r1_16.Id, true)
  end
end
function r0_0.BindEvents(r0_17)
  -- line: [257, 278] id: 17
  r0_17.Btn_Yes.Button_Area.OnClicked:Clear()
  r0_17.Btn_No.Button_Area.OnClicked:Clear()
  r0_17.Btn_Yes.Button_Area.OnClicked:Add(r0_17, r0_17.OnClickButtonYes)
  r0_17.Btn_No.Button_Area.OnClicked:Add(r0_17, r0_17.OnClickButtonNo)
  r0_17.List_WalnutItem.BP_OnItemClicked:Add(r0_17, r0_17.OnListItemClicked)
  r0_17.WalnutPlate.Ordinal_1st.MainUI = r0_17
  r0_17.WalnutPlate.Ordinal_2nd.MainUI = r0_17
  r0_17.WalnutPlate.Ordinal_3rd.MainUI = r0_17
  r0_17.WalnutPlate.MainUI = r0_17
  r0_17.WalnutPlate.Reward_1st.MainUI = r0_17
  r0_17.WalnutPlate.Reward_2nd.MainUI = r0_17
  r0_17.WalnutPlate.Reward_2nd_2.MainUI = r0_17
  r0_17.WalnutPlate.Reward_3rd_1.MainUI = r0_17
  r0_17.WalnutPlate.Reward_3rd_2.MainUI = r0_17
  r0_17.WalnutPlate.Reward_3rd_3.MainUI = r0_17
  r0_17:AddDispatcher(EventID.InterruptWalnutSelect, r0_17, r0_17.OnInterruptWalnutSelect)
end
function r0_0.CreateAndAddForbidItem(r0_18)
  -- line: [280, 294] id: 18
  local r1_18 = NewObject(UIUtils.GetCommonItemContentClass())
  r1_18.Icon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Forbid.T_Armory_Forbid"
  r1_18.IsSelect = true
  r1_18.Id = -1
  r1_18.ItemName = GText("UI_Walnut_Not_Select")
  r1_18.IsForbid = true
  r1_18.bDisableCommonClick = true
  r0_18.List_WalnutItem:AddItem(r1_18)
  r0_18.CurrentSelectContent = r1_18
  r0_18.RealChoice = r0_18.CurrentSelectContent
  r0_18:OnListItemClicked(r1_18)
end
function r0_0.CreateAndAddEmptyItem(r0_19)
  -- line: [296, 300] id: 19
  local r1_19 = NewObject(UIUtils.GetCommonItemContentClass())
  r1_19.IsEmpty = true
  r0_19.List_WalnutItem:AddItem(r1_19)
end
function r0_0.CreateAndAddWalnutItem(r0_20, r1_20, r2_20)
  -- line: [302, 317] id: 20
  DebugPrint("CreateAndAddWalnutItem WalnutId: ", r1_20, "Number: ", r2_20)
  local r3_20 = NewObject(UIUtils.GetCommonItemContentClass())
  local r4_20 = DataMgr.Walnut[r1_20]
  local r6_20 = DataMgr.WalnutType[r4_20.WalnutType]
  r3_20.Rarity = r4_20.Rarity and 1
  r3_20.Icon = r6_20.Icon
  r3_20.Parent = r0_20
  r3_20.Count = r2_20
  r3_20.Id = r1_20
  r3_20.ItemType = "Walnut"
  r3_20.bDisableCommonClick = true
  r0_20.List_WalnutItem:AddItem(r3_20)
end
function r0_0.OnAnimationFinished(r0_21, r1_21)
  -- line: [319, 327] id: 21
  if r1_21 == r0_21.Auto_Out then
    if not r0_21.IsInDungeon and r0_21.IsStandAlone and r0_21.SelectYes then
      EventManager:FireEvent(EventID.SelectedWalnut)
    elseif r0_21.IsInSettlement and r0_21.IsStandAlone and r0_21.SelectYes then
      EventManager:FireEvent(EventID.SelectedWalnut)
    end
  end
end
function r0_0.ChangeStateIcon(r0_22, r1_22, r2_22, r3_22)
  -- line: [329, 337] id: 22
  if r2_22 then
    r1_22.Panel_Img:SetActiveWidgetIndex(4)
  else
    r1_22.Img_Item:GetDynamicMaterial():SetTextureParameterValue("IconMap", LoadObject(r3_22))
    r1_22.Panel_Img:SetActiveWidgetIndex(0)
  end
end
function r0_0.OnItemWalnutClicked(r0_23, r1_23)
  -- line: [339, 349] id: 23
  local r2_23 = r1_23.WalnutId
  if not r2_23 or r2_23 <= 0 then
    return 
  end
  if not UIManager(r0_23):GetUIObj("WalnutRewardDialog") then
    r0_23.DetailWidget = UIManager(r0_23):LoadUINew("WalnutRewardDialog", r2_23, "WalnutChoice")
    r0_23.DetailWidget.WalnutChoice = true
  end
end
function r0_0.ChangeSelectedHead(r0_24, r1_24)
  -- line: [351, 359] id: 24
  if r1_24 == r0_24.SelectedHead then
    return 
  end
  if r0_24.SelectedHead then
    r0_24.SelectedHead:OnReleaseSelected(true)
  end
  r0_24.SelectedHead = r1_24
end
function r0_0.InitComp(r0_25, ...)
  -- line: [363, 364] id: 25
end
function r0_0.InitTeamHeads(r0_26, ...)
  -- line: [367, 368] id: 26
end
function r0_0.ReceiveTeammateChoose(r0_27, ...)
  -- line: [371, 372] id: 27
end
function r0_0.PlayWalnutReady(r0_28)
  -- line: [375, 376] id: 28
end
function r0_0.OnClickButtonNo(r0_29)
  -- line: [378, 380] id: 29
  AudioManager(r0_29):PlayUISound(r0_29, "event:/ui/common/click_btn_cancel", nil, nil)
end
function r0_0.OnClickButtonYes(r0_30)
  -- line: [382, 394] id: 30
  AudioManager(r0_30):PlayUISound(r0_30, "event:/ui/common/click_btn_confirm", nil, nil)
  local r1_30 = r0_30.CurrentSelectContent.Id
  if r1_30 == nil then
    r1_30 = -1
  end
  GWorld:GetAvatar():SelectWalnut(r0_30:ShowChooseSuccessToast(r0_30.CurrentSelectContent), r0_30.CurrentDungeonId, r1_30)
end
function r0_0.SelectWalnutById(r0_31, r1_31)
  -- line: [396, 413] id: 31
  local r2_31 = r0_31.List_WalnutItem:GetListItems()
  for r6_31 = 1, r2_31:Length(), 1 do
    local r7_31 = r2_31:Get(r6_31)
    if r7_31 and r7_31.Id and r7_31.Id == r1_31 then
      r0_31.List_WalnutItem:SetSelectedIndex(r6_31 + -1)
      r0_31:OnListItemClicked(r7_31)
      r0_31.List_WalnutItem:ScrollIndexIntoView(r6_31 + -1)
      return true
    end
  end
  return false
end
function r0_0.OnInterruptWalnutSelect(r0_32)
  -- line: [415, 417] id: 32
  r0_32:Close()
end
function r0_0.InitGameInputMode(r0_33)
  -- line: [438, 451] id: 33
  DebugPrint("InitGameInputMode")
  if not r0_33.Panel_Key_GamePad then
    return 
  end
  r0_33.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(UE4.UGameplayStatics.GetPlayerController(r0_33, 0))
  r0_33.IsFocusInit = false
  if IsValid(r0_33.GameInputModeSubsystem) then
    r0_33:InitCommonKey()
    r0_33:RefreshOpInfoByInputDevice(r0_33.GameInputModeSubsystem:GetCurrentInputType(), r0_33.GameInputModeSubsystem:GetCurrentGamepadName())
    r0_33.GameInputModeSubsystem.OnInputMethodChanged:Add(r0_33, r0_33.RefreshOpInfoByInputDevice)
  end
end
function r0_0.RefreshOpInfoByInputDevice(r0_34, r1_34, r2_34)
  -- line: [453, 477] id: 34
  DebugPrint("RefreshOpInfoByInputDevice", r1_34, r2_34)
  if r0_34.CurInputDeviceType == r1_34 then
    return 
  end
  if r1_34 == ECommonInputType.MouseAndKeyboard then
    r0_34:GamePadToPC()
    if r0_34._ItemSelectionChangeBound then
      r0_34.List_WalnutItem.BP_OnItemSelectionChanged:Remove(r0_34, r0_34.OnListItemClicked)
      r0_34._ItemSelectionChangeBound = false
    end
  else
    r0_34:PCToGamepad()
    if not r0_34._ItemSelectionChangeBound or r0_34._ItemSelectionChangeBound == false then
      r0_34.List_WalnutItem.BP_OnItemSelectionChanged:Add(r0_34, r0_34.OnListItemClicked)
      r0_34._ItemSelectionChangeBound = true
    end
  end
  r0_34.CurInputDeviceType = r1_34
  r0_34.Super.RefreshOpInfoByInputDevice(r0_34, r1_34, r2_34)
end
function r0_0.InitCommonKey(r0_35)
  -- line: [479, 488] id: 35
  if not r0_35.Panel_Key_GamePad then
    return 
  end
  r0_35.Panel_Key_GamePad:ClearChildren()
  for r4_35 = 1, 3, 1 do
    r0_35.Panel_Key_GamePad:AddChild(r0_35:CreateWidgetNew("ComKeyTextDesc"))
  end
end
function r0_0.UpdateCommonKeys(r0_36, ...)
  -- line: [490, 512] id: 36
  if not r0_36.Panel_Key_GamePad then
    return 
  end
  local r1_36 = {
    ...
  }
  for r5_36 = 0, 2, 1 do
    local r6_36 = r0_36.Panel_Key_GamePad:GetChildAt(r5_36)
    if r1_36[r5_36 * 2 + 1] ~= nil and r1_36[r5_36 * 2 + 2] ~= nil then
      r6_36:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      r6_36:CreateCommonKey({
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = r1_36[r5_36 * 2 + 1],
          }
        },
        Desc = r1_36[r5_36 * 2 + 2],
      })
    else
      r6_36:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
end
function r0_0.GamePadToPC(r0_37)
  -- line: [514, 519] id: 37
  if not r0_37.Panel_Key_GamePad then
    return 
  end
  r0_37.Panel_Key_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
end
function r0_0.PCToGamepad(r0_38)
  -- line: [521, 558] id: 38
  if not r0_38.Panel_Key_GamePad then
    return 
  end
  r0_38.Panel_Key_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  if r0_38.DetailWidget and r0_38.DetailWidget.WalnutChoice == true then
    r0_38.DetailWidget.State = 0
    r0_38.DetailWidget:PCToGamepad()
    r0_38.DetailWidget:SetFocus()
  else
    r0_38.State = 0
    r0_38.List_WalnutItem:SetFocus()
  end
  if r0_38.State == 0 then
    if r0_38.IsStandAlone then
      r0_38:UpdateCommonKeys("LS", GText("UI_Controller_CheckReward"))
    else
      r0_38:UpdateCommonKeys("LS", GText("UI_Controller_CheckReward"), "RS", GText("UI_Controller_CheckTeam"))
    end
  end
end
function r0_0.OnKeyDown(r0_39, r1_39, r2_39)
  -- line: [605, 722] id: 39
  local r3_39 = UE4.UKismetInputLibrary.GetKey(r2_39)
  local r4_39 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_39)
  local r5_39 = false
  r0_39.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(UE4.UGameplayStatics.GetPlayerController(r0_39, 0))
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_39) then
    if r0_39.WalnutChoiceFinish == 1 then
      if r4_39 == "Gamepad_RightThumbstick" then
        r0_39.NavigateWidget = r0_39.GameInputModeSubsystem:GetNavigateWidget()
        r0_39.NavigateWidget:SetRenderOpacity(1)
        if not r0_39.IsStandAlone and r0_39.State == 0 then
          r0_39.State_Mine.Team_Head.Head_Team.Button_Area:SetFocus()
          r0_39.State = 7
          r0_39:UpdateCommonKeys("A", GText("UI_Controller_CheckPlayer"))
          r5_39 = true
        end
      elseif r4_39 == "Gamepad_FaceButton_Right" then
        r5_39 = true
      end
    elseif r4_39 ~= "Gamepad_Special_Right" then
      if r4_39 == "Gamepad_LeftThumbstick" and r0_39.State == 0 then
        if r0_39.CurrentSelectContent.Id ~= nil and r0_39.CurrentSelectContent.Id ~= -1 then
          r0_39.WalnutPlate.Reward_1st.Button_Area:SetFocus()
          r0_39.State = 2
          r0_39:UpdateCommonKeys("A", GText("UI_Controller_CheckDetails"), "B", GText("UI_Tips_Close"))
        end
        r5_39 = true
      elseif r4_39 == "Gamepad_RightThumbstick" then
        if not r0_39.IsStandAlone and r0_39.State == 0 then
          r0_39.State_Mine.Team_Head.Head_Team.Button_Area:SetFocus()
          r0_39.State = 7
          r0_39.Btn_No:SetGamePadVisibility(UE4.ESlateVisibility.Collapsed)
          r0_39.Btn_Yes:SetGamePadVisibility(UE4.ESlateVisibility.Collapsed)
          r0_39:UpdateCommonKeys("A", GText("UI_Controller_CheckPlayer"), "B", GText("UI_Tips_Close"))
          r5_39 = true
        end
        r5_39 = true
      elseif r4_39 == "Gamepad_FaceButton_Right" then
        if r0_39.State == 2 or r0_39.State == 7 then
          r0_39.State = 0
          r0_39.List_WalnutItem:SetFocus()
          r0_39.Btn_No:SetGamePadVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
          r0_39.Btn_Yes:SetGamePadVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
          if r0_39.IsStandAlone then
            r0_39:UpdateCommonKeys("LS", GText("UI_Controller_CheckReward"))
          else
            r0_39:UpdateCommonKeys("LS", GText("UI_Controller_CheckReward"), "RS", GText("UI_Controller_CheckTeam"))
          end
        elseif r0_39.State == 4 then
          r0_39.State = 7
          r0_39:UpdateCommonKeys("A", GText("UI_Controller_CheckPlayer"), "B", GText("UI_Tips_Close"))
          if r0_39.State_Mine.Team_Head.Head_Anchor:HasFocusedDescendants() then
            r0_39.State_Mine.Team_Head.Head_Team.Button_Area:SetFocus()
          elseif r0_39.WBP_Walnut_PlayerState_1.Team_Head.Head_Anchor:HasFocusedDescendants() then
            r0_39.WBP_Walnut_PlayerState_1.Team_Head.Head_Team.Button_Area:SetFocus()
          elseif r0_39.WBP_Walnut_PlayerState_2.Team_Head.Head_Anchor:HasFocusedDescendants() then
            r0_39.WBP_Walnut_PlayerState_2.Team_Head.Head_Team.Button_Area:SetFocus()
          elseif r0_39.WBP_Walnut_PlayerState.Team_Head.Head_Anchor:HasFocusedDescendants() then
            r0_39.WBP_Walnut_PlayerState.Team_Head.Head_Team.Button_Area:SetFocus()
          end
        elseif r0_39.State == 1 then
          if r0_39.WalnutPlate.Ordinal_1st.Tips_MenuAnchor:HasFocusedDescendants() then
            r0_39.WalnutPlate.Ordinal_1st:SetFocus()
          elseif r0_39.WalnutPlate.Ordinal_2nd.Tips_MenuAnchor:HasFocusedDescendants() then
            r0_39.WalnutPlate.Ordinal_2nd:SetFocus()
          elseif r0_39.WalnutPlate.Ordinal_3rd.Tips_MenuAnchor:HasFocusedDescendants() then
            r0_39.WalnutPlate.Ordinal_3rd:SetFocus()
          else
            r0_39.State = 0
            r0_39.List_WalnutItem:SetFocus()
            if r0_39.IsStandAlone then
              r0_39:UpdateCommonKeys("LS", GText("UI_Controller_CheckReward"))
            else
              r0_39:UpdateCommonKeys("LS", GText("UI_Controller_CheckReward"), "RS", GText("UI_Controller_CheckTeam"))
            end
          end
        elseif r0_39.State == 0 then
          r0_39:OnClickButtonNo()
        end
        r5_39 = true
      end
    end
  elseif r4_39 == "Escape" and r0_39.CloseByEscape and r0_39:CloseByEscape() then
    r5_39 = true
  end
  if r5_39 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end
function r0_0.Close(r0_40)
  -- line: [724, 735] id: 40
  if r0_40.DetailWidget and r0_40.DetailWidget.WalnutChoice then
    r0_40.DetailWidget:Close()
  end
  if CommonUtils.GetDeviceTypeByPlatformName(r0_40) ~= "Mobile" then
    r0_40.NavigateWidget = r0_40.GameInputModeSubsystem:GetNavigateWidget()
    r0_40.NavigateWidget:SetRenderOpacity(1)
  end
  AudioManager(r0_40):SetEventSoundParam(r0_40, "WalnutChoiceShow", {
    ToEnd = 1,
  })
  r0_40.Super.Close(r0_40)
end
function r0_0.OnClickYes(r0_41)
  -- line: [737, 743] id: 41
  if r0_41.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad and r0_41.State == 0 then
    r0_41:OnClickButtonYes()
  end
end
function r0_0.FocusOnWalnut(r0_42)
  -- line: [745, 765] id: 42
  local r1_42 = r0_42.List_WalnutItem:GetDisplayedEntryWidgets()[1]
  if r0_42.List_WalnutItem:HasFocusedDescendants() then
    if r1_42:HasAnyUserFocus() then
      if r0_42.IsStandAlone == true then
        r0_42:UpdateCommonKeys()
      else
        r0_42:UpdateCommonKeys("RS", GText("UI_Controller_CheckTeam"))
      end
    elseif r0_42.IsStandAlone == true then
      r0_42:UpdateCommonKeys("LS", GText("UI_Controller_CheckReward"))
    else
      r0_42:UpdateCommonKeys("LS", GText("UI_Controller_CheckReward"), "RS", GText("UI_Controller_CheckTeam"))
    end
  end
end
function r0_0.NavigateP1Right(r0_43)
  -- line: [767, 781] id: 43
  if r0_43.State_Mine.Team_Head.Head_Team.Button_Area:HasAnyUserFocus() then
    if r0_43.State_Mine.Item_Walnut.State ~= nil and r0_43.State_Mine.Item_Walnut.State == 1 then
      r0_43.State_Mine.Item_Walnut.Button_Area:SetFocus()
      r0_43:UpdateCommonKeys("A", GText("UI_Controller_CheckDetails"), "B", GText("UI_Tips_Close"))
    else
      r0_43.WBP_Walnut_PlayerState_1.Team_Head.Head_Team.Button_Area:SetFocus()
      r0_43:UpdateCommonKeys("A", GText("UI_Controller_CheckPlayer"), "B", GText("UI_Tips_Close"))
    end
  else
    r0_43.WBP_Walnut_PlayerState_1.Team_Head.Head_Team.Button_Area:SetFocus()
    r0_43:UpdateCommonKeys("A", GText("UI_Controller_CheckPlayer"), "B", GText("UI_Tips_Close"))
  end
  return true
end
function r0_0.NavigateP2Right(r0_44)
  -- line: [783, 797] id: 44
  if r0_44.WBP_Walnut_PlayerState_1.Team_Head.Head_Team.Button_Area:HasAnyUserFocus() then
    if r0_44.WBP_Walnut_PlayerState_1.Item_Walnut.State ~= nil and r0_44.WBP_Walnut_PlayerState_1.Item_Walnut.State == 1 then
      r0_44.WBP_Walnut_PlayerState_1.Item_Walnut.Button_Area:SetFocus()
      r0_44:UpdateCommonKeys("A", GText("UI_Controller_CheckDetails"), "B", GText("UI_Tips_Close"))
    else
      r0_44.WBP_Walnut_PlayerState_2.Team_Head.Head_Team.Button_Area:SetFocus()
      r0_44:UpdateCommonKeys("A", GText("UI_Controller_CheckPlayer"), "B", GText("UI_Tips_Close"))
    end
  else
    r0_44.WBP_Walnut_PlayerState_2.Team_Head.Head_Team.Button_Area:SetFocus()
    r0_44:UpdateCommonKeys("A", GText("UI_Controller_CheckPlayer"), "B", GText("UI_Tips_Close"))
  end
  return true
end
function r0_0.NavigateP2Left(r0_45)
  -- line: [799, 813] id: 45
  if r0_45.WBP_Walnut_PlayerState_1.Item_Walnut.Button_Area:HasAnyUserFocus() then
    r0_45.WBP_Walnut_PlayerState_1.Team_Head.Head_Team.Button_Area:SetFocus()
    r0_45:UpdateCommonKeys("A", GText("UI_Controller_CheckPlayer"), "B", GText("UI_Tips_Close"))
  elseif r0_45.State_Mine.Item_Walnut.State ~= nil and r0_45.State_Mine.Item_Walnut.State == 1 then
    r0_45.State_Mine.Item_Walnut.Button_Area:SetFocus()
    r0_45:UpdateCommonKeys("A", GText("UI_Controller_CheckDetails"), "B", GText("UI_Tips_Close"))
  else
    r0_45.State_Mine.Team_Head.Head_Team.Button_Area:SetFocus()
    r0_45:UpdateCommonKeys("A", GText("UI_Controller_CheckPlayer"), "B", GText("UI_Tips_Close"))
  end
  return true
end
function r0_0.NavigateP3Right(r0_46)
  -- line: [815, 829] id: 46
  if r0_46.WBP_Walnut_PlayerState_2.Team_Head.Head_Team.Button_Area:HasAnyUserFocus() then
    if r0_46.WBP_Walnut_PlayerState_2.Item_Walnut.State ~= nil and r0_46.WBP_Walnut_PlayerState_2.Item_Walnut.State == 1 then
      r0_46.WBP_Walnut_PlayerState_2.Item_Walnut.Button_Area:SetFocus()
      r0_46:UpdateCommonKeys("A", GText("UI_Controller_CheckDetails"), "B", GText("UI_Tips_Close"))
    else
      r0_46.WBP_Walnut_PlayerState.Team_Head.Head_Team.Button_Area:SetFocus()
      r0_46:UpdateCommonKeys("A", GText("UI_Controller_CheckPlayer"), "B", GText("UI_Tips_Close"))
    end
  else
    r0_46.WBP_Walnut_PlayerState.Team_Head.Head_Team.Button_Area:SetFocus()
    r0_46:UpdateCommonKeys("A", GText("UI_Controller_CheckPlayer"), "B", GText("UI_Tips_Close"))
  end
  return true
end
function r0_0.NavigateP3Left(r0_47)
  -- line: [831, 845] id: 47
  if r0_47.WBP_Walnut_PlayerState_2.Item_Walnut.Button_Area:HasAnyUserFocus() then
    r0_47.WBP_Walnut_PlayerState_2.Team_Head.Head_Team.Button_Area:SetFocus()
    r0_47:UpdateCommonKeys("A", GText("UI_Controller_CheckPlayer"), "B", GText("UI_Tips_Close"))
  elseif r0_47.WBP_Walnut_PlayerState_1.Item_Walnut.State ~= nil and r0_47.WBP_Walnut_PlayerState_1.Item_Walnut.State == 1 then
    r0_47.WBP_Walnut_PlayerState_1.Item_Walnut.Button_Area:SetFocus()
    r0_47:UpdateCommonKeys("A", GText("UI_Controller_CheckDetails"), "B", GText("UI_Tips_Close"))
  else
    r0_47.WBP_Walnut_PlayerState_1.Team_Head.Head_Team.Button_Area:SetFocus()
    r0_47:UpdateCommonKeys("A", GText("UI_Controller_CheckPlayer"), "B", GText("UI_Tips_Close"))
  end
  return true
end
function r0_0.NavigateP4Left(r0_48)
  -- line: [847, 861] id: 48
  if r0_48.WBP_Walnut_PlayerState.Item_Walnut.Button_Area:HasAnyUserFocus() then
    r0_48.WBP_Walnut_PlayerState.Team_Head.Head_Team.Button_Area:SetFocus()
    r0_48:UpdateCommonKeys("A", GText("UI_Controller_CheckPlayer"), "B", GText("UI_Tips_Close"))
  elseif r0_48.WBP_Walnut_PlayerState_2.Item_Walnut.State ~= nil and r0_48.WBP_Walnut_PlayerState_2.Item_Walnut.State == 1 then
    r0_48.WBP_Walnut_PlayerState_2.Item_Walnut.Button_Area:SetFocus()
    r0_48:UpdateCommonKeys("A", GText("UI_Controller_CheckDetails"), "B", GText("UI_Tips_Close"))
  else
    r0_48.WBP_Walnut_PlayerState_2.Team_Head.Head_Team.Button_Area:SetFocus()
    r0_48:UpdateCommonKeys("A", GText("UI_Controller_CheckPlayer"), "B", GText("UI_Tips_Close"))
  end
  return true
end
return r0_0
