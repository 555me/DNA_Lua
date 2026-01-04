-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\Forge\WBP_ForgeMain_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("Utils.CommonUtils")
local r1_0 = require("CommonConst")
local r2_0 = require("Blueprints.UI.Forge.ForgeDataModel")
local r3_0 = require("Blueprints.UI.Forge.ForgeConst")
local r4_0 = require("Utils.UIUtils")
local r5_0 = require("Blueprints.UI.ControllerFSM")
local r6_0 = 8
local r7_0 = 900001
local r8_0 = 910001
local r9_0 = Class("BluePrints.UI.BP_UIState_C")
function r9_0.Initialize(r0_1, r1_1)
  -- line: [17, 19] id: 1
  r0_1.Super.Initialize(r0_1)
end
function r9_0.OnLoaded(r0_2, ...)
  -- line: [21, 203] id: 2
  local r1_2 = {}
  r1_2[r3_0.BottomKeyTypes.BottomKey_Keyboard_Space] = {
    KeyInfoList = {
      {
        Type = "Text",
        Text = "Space",
        Owner = r0_2,
        ClickCallback = r0_2.TryBatchComplete,
      }
    },
    Desc = GText("UI_Mail_Recieveall"),
  }
  r1_2[r3_0.BottomKeyTypes.BottomKey_Keyboard_Esc] = {
    KeyInfoList = {
      {
        Type = "Text",
        Text = "Esc",
        Owner = r0_2,
        ClickCallback = r0_2.OnClose,
      }
    },
    Desc = GText("UI_BACK"),
  }
  r0_2.KeyboardKeyConfig = r1_2
  r1_2 = {}
  r1_2[r3_0.BottomKeyTypes.BottomKey_Back] = {
    GamePadInfoList = {
      {
        Type = "Img",
        ImgShortPath = UIConst.GamePadImgKey.FaceButtonRight,
        Owner = r0_2,
      }
    },
    Desc = GText("UI_BACK"),
  }
  r1_2[r3_0.BottomKeyTypes.BottomKey_Confirm] = {
    GamePadInfoList = {
      {
        Type = "Img",
        ImgShortPath = UIConst.GamePadImgKey.FaceButtonBottom,
        Owner = r0_2,
      }
    },
    Desc = GText("UI_Tips_Ensure"),
  }
  r1_2[r3_0.BottomKeyTypes.BottomKey_ShowItem] = {
    GamePadInfoList = {
      {
        Type = "Img",
        ImgShortPath = UIConst.GamePadImgKey.SpecialLeft,
        Owner = r0_2,
      }
    },
    Desc = GText("UI_Controller_CheckItems"),
  }
  r1_2[r3_0.BottomKeyTypes.BottomKey_ShowDetails] = {
    GamePadInfoList = {
      {
        Type = "Img",
        ImgShortPath = UIConst.GamePadImgKey.FaceButtonBottom,
        Owner = r0_2,
      }
    },
    Desc = GText("UI_Controller_CheckDetails"),
  }
  r1_2[r3_0.BottomKeyTypes.BottomKey_SetTarget] = {
    GamePadInfoList = {
      {
        Type = "Img",
        ImgShortPath = UIConst.GamePadImgKey.FaceButtonLeft,
        Owner = r0_2,
      }
    },
    Desc = GText("UI_CTL_Forging_Set"),
  }
  local r2_2 = r3_0.BottomKeyTypes.BottomKey_UnSetTarget
  r1_2[r2_2] = {
    GamePadInfoList = {
      {
        Type = "Img",
        ImgShortPath = UIConst.GamePadImgKey.FaceButtonLeft,
        Owner = r0_2,
      }
    },
    Desc = GText("UI_CTL_Forging_Unset"),
  }
  r0_2.GamepadKeyCofig = r1_2
  r0_2.ControllerFSM = r5_0.New(r0_2, {
    [r3_0.ControllerFSMStates.NormalPage_NoFocus] = {
      OnEnter = r0_2.OnEnterState_NormalPage_NoFocus,
    },
    [r3_0.ControllerFSMStates.NormalPage_FocusItem] = {
      OnEnter = r0_2.OnEnterSttae_NormalPage_FocusItem,
    },
    [r3_0.ControllerFSMStates.NormalPage_ShowItem] = {
      OnEnter = r0_2.OnEnterState_NormalPage_ShowItem,
      OnLeave = r0_2.OnLeaveState_NormalPage_ShowItem,
    },
    [r3_0.ControllerFSMStates.NormalPage_FocusSort] = {
      OnEnter = r0_2.OnEnterState_NormalPage_FocusSort,
      OnLeave = r0_2.OnLeaveState_NormalPage_FocusSort,
    },
    [r3_0.ControllerFSMStates.PathPage_Normal] = {
      OnEnter = r0_2.OnEnterState_PathPage_Normal,
      OnLeave = r0_2.OnLeaveState_PathPage_Normal,
    },
  })
  r1_2 = UIManager(r0_2):GetGameInputModeSubsystem()
  if r1_2 then
    r0_2.GameInputModeSubsystem = r1_2
  end
  r0_2.Super.OnLoaded(r0_2, ...)
  ... = ... -- error: untaken top expr
  r0_2:ParseLoadParams(r2_2)
  r0_2.Sort:Init(r0_2, {
    GText("UI_Select_Kind"),
    GText("UI_Select_Unique")
  }, r1_0.DESC, {
    OnGetBackFocusWidget = function()
      -- line: [115, 119] id: 3
      r0_2.ControllerFSM:Enter(r3_0.ControllerFSMStates.NormalPage_FocusItem)
      return r0_2.ForgeContent
    end,
  })
  r0_2.Sort:BindEventOnSelectionsChanged(r0_2, r0_2.OnSortMethodChanged)
  r0_2.Sort:BindEventOnSortTypeChanged(r0_2, r0_2.OnSortMethodChanged)
  r0_2:InitListenEvent()
  r0_2:InitKeySetting()
  r0_2:InitTabContent()
  r0_2:SetFocus()
  r0_2:EnableTickWhenPaused(true)
  r0_2:HideDraftPathView()
  r0_2:CheckScrollbarVisibility(r0_2.ForgeContent:GetNumItems())
  local r3_2 = UE4.UGameplayStatics.GetPlayerCharacter(r0_2, 0)
  r3_2:SetActorHideTag("Forge", true)
  r3_2:SetCanInteractiveTrigger(false)
  r0_2:SwitchCamera(true)
  if GWorld:GetAvatar():CheckSubRegionType(nil, r1_0.SubRegionType.Home) then
    local r6_2 = UE4.ANpcCharacter.GetNpc(r0_2, r7_0)
    if r6_2 then
      if r6_2.NPCNameWidgetComponent then
        local r7_2 = r6_2.NPCNameWidgetComponent:GetWidget()
        if r7_2 then
          r7_2:SetVisibility(UE4.ESlateVisibility.Collapsed)
        end
      end
      if r6_2.BubbleWidgetComponent then
        local r7_2 = r6_2.BubbleWidgetComponent:GetWidget()
        if r7_2 then
          r7_2:SetVisibility(UE4.ESlateVisibility.Collapsed)
        end
      end
      r6_2:PlayUITalkAction(21000201)
    end
  else
    UIManager(r0_2):GetUINpcActor(r8_0):PlayUITalkAction(21000201)
  end
  AudioManager(r0_2):PlayUISound(r0_2, "event:/ui/armory/open", "ForgeMainIn", nil)
  if not r0_2.RefreshTimer then
    r0_2.RefreshTimer = r0_2:AddTimer(0.5, function()
      -- line: [176, 178] id: 4
      r0_2:TickRefreshItemsView(r3_0.DraftState.InProgress)
    end, true)
  end
  r0_2.Text_Sift:SetText(GText("ModFilter_Title"))
  r0_2.Sift:SetSiftPreviewSideWidget(true)
  r0_2.Sift:SetSiftModelId(1005)
  r0_2.Sift:BindEventOnSelectionsChanged(r0_2, r0_2.OnModFilterChanged)
  r0_2.Sift:ClearSiftSelection()
  r0_2.Sift:SetGamepadKeyVisibility(UE4.ESlateVisibility.Collapsed)
  r0_2.Btn_Receive:SetText(GText("UI_Mail_Recieveall"))
  r0_2.Btn_Receive:SetDefaultGamePadImg("Y")
  r0_2:PlayAnimation(r0_2.In)
  r0_2.Tab:PlayInAnim()
  r0_2.Forging_Path_PC.HasPreInit = false
  r0_2.Entrance_Compendium:Init(r0_2, r0_2.OnCompendiumClicked)
  r0_2.CurInputDeviceType = r4_0.UtilsGetCurrentInputType()
  r0_2.CurGamepadName = r4_0.UtilsGetCurrentGamepadName()
  r0_2:InitViewByDeviceType()
end
function r9_0.BP_GetDesiredFocusTarget(r0_5)
  -- line: [207, 218] id: 5
  if r4_0.IsGamepadInput() then
    if r0_5.ControllerFSM:Current() == r3_0.ControllerFSMStates.PathPage_Normal then
      return r0_5.Forging_Path_PC:GetDesiredFocusTarget()
    else
      return r0_5.ForgeContent
    end
  else
    return r0_5
  end
end
function r9_0.SetFocus_Lua(r0_6)
  -- line: [220, 222] id: 6
  return r0_6:BP_GetDesiredFocusTarget()
end
function r9_0.RefreshOpInfoByInputDevice(r0_7, r1_7, r2_7)
  -- line: [224, 229] id: 7
  r0_7.CurInputDeviceType = r4_0.UtilsGetCurrentInputType()
  r0_7.CurGamepadName = r4_0.UtilsGetCurrentGamepadName()
  r0_7:InitViewByDeviceType()
  r0_7:HandleGamepadRefocus()
end
function r9_0.InitViewByDeviceType(r0_8)
  -- line: [231, 239] id: 8
  if r4_0.IsGamepadInput() then
    r0_8:InitGamepadView()
  elseif r4_0.IsMobileInput() then
    r0_8:InitMobileView()
  else
    r0_8:InitKeyboardView()
  end
end
function r9_0.HandleGamepadRefocus(r0_9)
  -- line: [242, 256] id: 9
  if r4_0.IsGamepadInput() then
    if r0_9.IsShowingDraftPathView then
      r0_9.ControllerFSM:Enter(r3_0.ControllerFSMStates.PathPage_Normal)
      if r0_9:HasAnyFocus() then
        r0_9.Forging_Path_PC:SetGamepadFocus()
      end
    else
      r0_9.ControllerFSM:Enter(r3_0.ControllerFSMStates.NormalPage_FocusItem)
      if r0_9:HasAnyFocus() then
        r0_9:NavigateToFirstEntry()
      end
    end
  end
end
function r9_0.InitKeyboardView(r0_10)
  -- line: [258, 275] id: 10
  r0_10.Btn_Receive:SetGamePadIconVisible(false)
  if r0_10.CanBatchComplete then
    r0_10:UpdateKeyboardBottomKeyInfo({
      r3_0.BottomKeyTypes.BottomKey_Keyboard_Space,
      r3_0.BottomKeyTypes.BottomKey_Keyboard_Esc
    })
  else
    r0_10:UpdateKeyboardBottomKeyInfo({
      r3_0.BottomKeyTypes.BottomKey_Keyboard_Esc
    })
  end
end
function r9_0.InitMobileView(r0_11)
  -- line: [277, 279] id: 11
  r0_11.Btn_Receive:SetGamePadIconVisible(false)
end
function r9_0.InitGamepadView(r0_12)
  -- line: [281, 283] id: 12
  r0_12.Btn_Receive:SetGamePadIconVisible(true)
end
function r9_0.InitNormalPageState(r0_13)
  -- line: [285, 296] id: 13
  r0_13:AddDelayFrameFunc(function()
    -- line: [286, 295] id: 14
    if r0_13.CurInputDeviceType == UE4.ECommonInputType.Gamepad then
      if not r0_13.IsDraftInfosEmpty then
        r0_13.ControllerFSM:Enter(r3_0.ControllerFSMStates.NormalPage_FocusItem)
        r0_13:NavigateToFirstEntry()
      else
        r0_13.ControllerFSM:Enter(r3_0.ControllerFSMStates.NormalPage_NoFocus)
      end
    end
  end, 10)
end
function r9_0.NavigateToFirstEntry(r0_15)
  -- line: [298, 324] id: 15
  if r0_15.ControllerNotAutoFocus then
    r0_15.ControllerNotAutoFocus = nil
    return 
  end
  local r1_15 = r0_15.ForgeContent:GetDisplayedEntryWidgets()
  local r2_15 = r0_15.ForgeContent:GetNumItems()
  local r3_15 = r1_15:Num()
  local r4_15 = -1
  for r8_15 = 1, r3_15, 1 do
    local r10_15 = r0_15.ForgeContent:GetIndexForItem(r1_15:GetRef(r8_15).Content)
    if r10_15 ~= -1 then
      if r4_15 == -1 then
        r4_15 = r10_15
      else
        r4_15 = math.min(r4_15, r10_15)
      end
    end
  end
  r4_15 = math.clamp(r4_15, 0, r2_15 + -1)
  if not r0_0:IfExistSystemGuideUI(r0_15) then
    r0_15.ForgeContent:NavigateToIndex(r4_15)
    r0_15.ForgeContent:SetFocus()
  end
end
function r9_0.OnEnterSttae_NormalPage_FocusItem(r0_16)
  -- line: [327, 329] id: 16
  r0_16:UpdateGamepadBottomKeyInfo({
    r3_0.BottomKeyTypes.BottomKey_ShowItem,
    r3_0.BottomKeyTypes.BottomKey_Back
  })
end
function r9_0.OnEnterState_NormalPage_ShowItem(r0_17)
  -- line: [332, 343] id: 17
  if r0_17.CurrentGamepadSelectedItem then
    r0_17:UpdateGamepadBottomKeyInfo({
      r3_0.BottomKeyTypes.BottomKey_ShowDetails,
      r3_0.BottomKeyTypes.BottomKey_Back
    })
    local r1_17 = r0_17:GetEntryFromItem(r0_17.CurrentGamepadSelectedItem)
    if r1_17 then
      r1_17:EnterShowItemView()
    end
  else
    DebugPrint(LogTag.Error, "进入聚焦模式失败，找不到需要聚焦的铸造条目")
    r0_17.ControllerFSM:Enter(r3_0.ControllerFSMStates.NormalPage_FocusItem)
  end
end
function r9_0.OnLeaveState_NormalPage_ShowItem(r0_18, r1_18)
  -- line: [345, 355] id: 18
  local r2_18 = r0_18:GetEntryFromItem(r0_18.CurrentGamepadSelectedItem)
  if r2_18 then
    r2_18:LeaveShowItemView()
    r0_18:AddTimer(0.1, function()
      -- line: [351, 353] id: 19
      r2_18:SetFocus()
    end)
  end
end
function r9_0.OnEnterState_NormalPage_FocusSort(r0_20)
  -- line: [357, 364] id: 20
  r0_20.Sort:SetFocus()
  r0_20.Sort:SetControllerKeyHidden(true)
  r0_20.Tab.WBP_Com_Tab_ResourceBar:HideGamePadKey(true)
  r0_20.Entrance_Compendium:HideGamepadKeyTip(true)
  r0_20.Btn_Receive:SetGamePadIconVisible(false)
  r0_20:UpdateGamepadBottomKeyInfo({
    r3_0.BottomKeyTypes.BottomKey_Confirm,
    r3_0.BottomKeyTypes.BottomKey_Back
  })
end
function r9_0.OnLeaveState_NormalPage_FocusSort(r0_21, r1_21)
  -- line: [366, 371] id: 21
  r0_21.Sort:SetControllerKeyHidden(false)
  r0_21.Tab.WBP_Com_Tab_ResourceBar:HideGamePadKey(false)
  r0_21.Entrance_Compendium:HideGamepadKeyTip(false)
  r0_21.Btn_Receive:SetGamePadIconVisible(true)
end
function r9_0.OnEnterState_NormalPage_NoFocus(r0_22)
  -- line: [373, 376] id: 22
  r0_22:UpdateGamepadBottomKeyInfo({
    r3_0.BottomKeyTypes.BottomKey_Back
  })
  r0_22.CurrentGamepadSelectedItem = nil
end
function r9_0.OnEnterState_PathPage_Normal(r0_23)
  -- line: [378, 380] id: 23
  r0_23:UpdateGamepadBottomKeyInfo({
    r3_0.BottomKeyTypes.BottomKey_Back
  })
end
function r9_0.OnLeaveState_PathPage_Normal(r0_24, r1_24)
  -- line: [382, 383] id: 24
end
function r9_0.UpdateGamepadBottomKeyInfo(r0_25, r1_25)
  -- line: [385, 392] id: 25
  local r2_25 = {}
  for r7_25, r8_25 in ipairs(r1_25) do
    table.insert(r2_25, r0_25.GamepadKeyCofig[r8_25])
  end
  -- close: r3_25
  r0_25.Tab:UpdateBottomKeyInfo(r2_25)
end
function r9_0.UpdateKeyboardBottomKeyInfo(r0_26, r1_26)
  -- line: [394, 400] id: 26
  local r2_26 = {}
  for r7_26, r8_26 in ipairs(r1_26) do
    table.insert(r2_26, r0_26.KeyboardKeyConfig[r8_26])
  end
  -- close: r3_26
  r0_26.Tab:UpdateBottomKeyInfo(r2_26)
end
function r9_0.OnForgeItemReceiveFocus(r0_27, r1_27)
  -- line: [402, 414] id: 27
  if r0_27.CurrentGamepadSelectedItem == r1_27.Content then
    return 
  end
  if r0_27.CurrentGamepadSelectedItem then
    local r2_27 = r0_27:GetEntryFromItem(r0_27.CurrentGamepadSelectedItem)
    if r2_27 then
      r2_27:SetGamepadFocus(false)
    end
  end
  r1_27:SetGamepadFocus(true)
  r0_27.CurrentGamepadSelectedItem = r1_27.Content
  r0_27:UpdateFocusItemSetTargetState()
end
function r9_0.HandleGamepadSetTarget(r0_28)
  -- line: [417, 426] id: 28
  if not r0_28.CurrentGamepadSelectedItem then
    return 
  end
  if r0_28.ControllerFSM:Current() == r3_0.ControllerFSMStates.NormalPage_FocusItem and r0_28.CurrentGamepadSelectedItem.State == r3_0.DraftState.NotStarted then
    r0_28:GetEntryFromItem(r0_28.CurrentGamepadSelectedItem):UpdateSetTargetBtn(not r0_28.CurrentGamepadSelectedItem.IsSetTarget)
  end
  r0_28:UpdateFocusItemSetTargetState()
end
function r9_0.HandleGamepadBatchComplete(r0_29)
  -- line: [429, 431] id: 29
  r0_29:TryBatchComplete()
end
function r9_0.HandleGamepadHideDraftPathView(r0_30)
  -- line: [434, 436] id: 30
  r0_30.ControllerFSM:Enter(r3_0.ControllerFSMStates.NormalPage_FocusItem)
end
function r9_0.UpdateFocusItemSetTargetState(r0_31)
  -- line: [439, 453] id: 31
  if not r0_31.CurrentGamepadSelectedItem then
    return 
  end
  if r0_31.ControllerFSM:Current() == r3_0.ControllerFSMStates.NormalPage_FocusItem then
    if r0_31.CurrentGamepadSelectedItem.State == r3_0.DraftState.NotStarted then
      if r0_31.CurrentGamepadSelectedItem.IsSetTarget then
        r0_31:UpdateGamepadBottomKeyInfo({
          r3_0.BottomKeyTypes.BottomKey_UnSetTarget,
          r3_0.BottomKeyTypes.BottomKey_ShowItem,
          r3_0.BottomKeyTypes.BottomKey_Back
        })
      else
        r0_31:UpdateGamepadBottomKeyInfo({
          r3_0.BottomKeyTypes.BottomKey_SetTarget,
          r3_0.BottomKeyTypes.BottomKey_ShowItem,
          r3_0.BottomKeyTypes.BottomKey_Back
        })
      end
    else
      r0_31:UpdateGamepadBottomKeyInfo({
        r3_0.BottomKeyTypes.BottomKey_ShowItem,
        r3_0.BottomKeyTypes.BottomKey_Back
      })
    end
  end
end
function r9_0.OnMenuOpenChanged(r0_32, r1_32)
  -- line: [456, 465] id: 32
  if r0_32.CurInputDeviceType == UE4.ECommonInputType.Gamepad then
    r0_32.Tab:UpdateUIStyleInPlatform(not r1_32)
    r0_32.Tab:SetBottomKeyInfoVisible(not r1_32)
    r0_32.SubTab_List:UpdateUIStyleInPlatform(not r1_32)
    r0_32.Sort:SetControllerKeyHidden(r1_32)
    r0_32.Btn_Receive:SetGamePadIconVisible(not r1_32)
    r0_32.Entrance_Compendium:HideGamepadKeyTip(r1_32)
  end
end
function r9_0.OnForgeItemLostFocus(r0_33, r1_33)
  -- line: [467, 472] id: 33
  r1_33:SetGamepadFocus(false)
  if r0_33.CurrentGamepadSelectedItem == r1_33.Content then
    r0_33.CurrentGamepadSelectedItem = nil
  end
end
function r9_0.OnForgeItemNavigateUp(r0_34, r1_34)
  -- line: [474, 476] id: 34
end
function r9_0.OnForgeItemNavigateDown(r0_35, r1_35)
  -- line: [478, 480] id: 35
end
function r9_0.OnForgeItemWidgetClicked(r0_36, r1_36)
  -- line: [483, 494] id: 36
  local r2_36 = r1_36.Content.Id
  if r1_36.Content.IsNotSeen then
    r1_36.Content.IsNotSeen = false
    r2_0:MarkDraftAsSeen(r2_36)
    r0_36:RefreshSingleItemData(r1_36.Content)
    r1_36:RefreshView()
  end
end
function r9_0.OnSortMethodChanged(r0_37)
  -- line: [499, 501] id: 37
  r0_37:UpdateForgeContent()
end
function r9_0.ParseLoadParams(r0_38, r1_38)
  -- line: [503, 508] id: 38
  if not r1_38 then
    return 
  end
  if r1_38.NotDelayAddListItem then
    r0_38:SetNotDelayAddListItem(true)
  end
end
function r9_0.ReceiveEnterState(r0_39, r1_39)
  -- line: [510, 527] id: 39
  r0_39.Super.ReceiveEnterState(r0_39, r1_39)
  AudioManager(r0_39):PlaySystemUIBGM("event:/bgm/cbt02/0041_story_jiaojiao_tiejiang", nil, "ForgeMain")
  if r0_39.IsShowingDraftPathView then
    r0_39.Forging_Path_PC:Refresh()
  else
    r0_39:TickRefreshItemsView()
  end
  if r0_39.ControllerFSM and r0_39.ControllerFSM:Current() == r3_0.ControllerFSMStates.NormalPage_ShowItem then
    r0_39.ControllerFSM:Enter(r3_0.ControllerFSMStates.NormalPage_FocusItem)
  end
end
function r9_0.ReceiveExitState(r0_40, r1_40)
  -- line: [529, 531] id: 40
  r0_40.Super.ReceiveExitState(r0_40, r1_40)
end
function r9_0.RefreshSingleItemData(r0_41, r1_41)
  -- line: [533, 551] id: 41
  if r1_41 then
    if r1_41.IsEmptyWidget then
      return 
    end
    local r2_41 = r0_41:GetCurrentTabType()
    local r3_41 = r2_0:CheckState(r1_41.Id)
    if not r3_41 or r2_41 == r3_0.TabType.Producing and r3_41.State == r3_0.DraftState.NotStarted or r3_41.State == r3_0.DraftState.NotStarted and r3_41.Count <= 0 and not r3_41.IsInfinity then
      r1_41.State = nil
      r0_41.ForgeContent:RemoveItem(r1_41)
    else
      r1_41 = r2_0:ConstructForgeItemContent(r1_41, r3_41)
    end
  end
end
function r9_0.TickRefreshItemsView(r0_42, r1_42)
  -- line: [554, 570] id: 42
  if r0_42.IsShowingDraftPathView then
    r0_42.Forging_Path_PC:TickRefreshDetails()
  else
    local r2_42 = r0_42.ForgeContent:GetDisplayedEntryWidgets()
    for r7_42 = 1, r2_42:Length(), 1 do
      local r8_42 = r2_42:GetRef(r7_42)
      if not r8_42.Content.IsEmptyWidget then
        if not r1_42 or r8_42.WidgetCurrentState == r1_42 then
          r0_42:RefreshSingleItemData(r8_42.Content)
          r8_42:RefreshView()
        end
      else
        break
      end
    end
  end
end
function r9_0.RefreshItemsView(r0_43)
  -- line: [573, 603] id: 43
  if r0_43.IsShowingDraftPathView then
    r0_43.Forging_Path_PC:Refresh()
  else
    local r1_43 = r0_43.ForgeContent:GetListItems()
    for r5_43 = 1, r1_43:Length(), 1 do
      r0_43:RefreshSingleItemData(r1_43:GetRef(r5_43))
    end
    local r2_43 = r0_43.ForgeContent:GetDisplayedEntryWidgets()
    for r7_43 = 1, r2_43:Length(), 1 do
      local r8_43 = r2_43:GetRef(r7_43)
      if not r8_43.Content.IsEmptyWidget then
        r8_43:RefreshView()
      else
        break
      end
    end
    local r4_43, r5_43 = r2_0:GetDatasByFilter(r0_43:GetCurrentTabType(), r0_43:GetCurrentSubTabType(), r0_43.CommonFilterData)
    r0_43:ShowEmptyPage(#r4_43 <= 0, r5_43)
    r0_43:CheckScrollbarVisibility(#r4_43)
    r0_43:CheckShouldAddEmptyItem()
    r0_43:UpdateBatchCompleteButton()
  end
end
function r9_0.UpdateBatchCompleteButton(r0_44)
  -- line: [606, 634] id: 44
  local r1_44 = r0_44:GetCurrentTabType()
  local r2_44 = r0_44.DraftInfosCache
  if #r0_44.DraftInfosCache <= 0 then
    r0_44.Btn_Receive:ForbidBtn(true)
    return 
  end
  for r8_44, r9_44 in pairs(r2_44) do
    local r11_44 = r2_0:CheckState(r9_44.Id)
    if r11_44 and r11_44.State == r3_0.DraftState.Complete then
      r0_44.CanBatchComplete = true
      r0_44.Btn_Receive:ForbidBtn(false)
      if r4_0.IsKeyboardInput() then
        r0_44:UpdateKeyboardBottomKeyInfo({
          r3_0.BottomKeyTypes.BottomKey_Keyboard_Space,
          r3_0.BottomKeyTypes.BottomKey_Keyboard_Esc
        })
      end
      return 
    end
  end
  -- close: r4_44
  r0_44.CanBatchComplete = false
  r0_44.Btn_Receive:ForbidBtn(true)
  if r4_0.IsKeyboardInput() then
    r0_44:UpdateKeyboardBottomKeyInfo({
      r3_0.BottomKeyTypes.BottomKey_Keyboard_Esc
    })
  end
end
function r9_0.UpdateSiftButton(r0_45)
  -- line: [637, 644] id: 45
  if r0_45:GetCurrentTabType() == r3_0.TabType.Mod then
    r0_45.Panel_Sift:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    r0_45.Panel_Sift:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r9_0.InitListenEvent(r0_46)
  -- line: [647, 658] id: 46
  r0_46:AddDispatcher(EventID.OnStartProduce, r0_46, r0_46.OnStartProduce)
  r0_46:AddDispatcher(EventID.OnCompleteProduce, r0_46, r0_46.OnCompleteProduce)
  r0_46:AddDispatcher(EventID.OnCompleteBatchProduce, r0_46, r0_46.OnCompleteProduce)
  r0_46:AddDispatcher(EventID.OnAccerateProduce, r0_46, r0_46.OnAccerateProduce)
  r0_46:AddDispatcher(EventID.OnCancelProduce, r0_46, r0_46.OnCancelProduce)
  r0_46:AddDispatcher(EventID.OnBlueComplete, r0_46, r0_46.OnBlueComplete)
  r0_46.Btn_Receive:BindEventOnClicked(r0_46, r0_46.RequestBatchComplete)
  r0_46.ForgeContent.BP_OnEntryInitialized:Add(r0_46, r0_46.OnForgeContentEntryInit)
  r0_46.ForgeContent.BP_OnItemClicked:Add(r0_46, r0_46.OnForgeContentItemClicked)
end
function r9_0.InitKeySetting(r0_47)
  -- line: [661, 680] id: 47
  r0_47.SwitchTab_LeftKey = "Q"
  r0_47.SwitchTab_RightKey = "E"
  r0_47.SwitchSubTab_LeftKey = "A"
  r0_47.SwitchSubTab_RightKey = "D"
  r0_47.LeftMouseButton = "LeftMouseButton"
  r0_47.RightMouseButton = "RightMouseButton"
  r0_47.EscapeKey = "Escape"
  r0_47.OpenForgeKey = DataMgr.KeyboardMap.OpenForge.Key
  r0_47.BatchCompeleteKey = "SpaceBar"
  r0_47.KeyDownEvent = {}
  r0_47.KeyDownEvent[r0_47.EscapeKey] = r0_47.OnReturnKeyDown
  r0_47.KeyDownEvent[r0_47.OpenForgeKey] = r0_47.OnReturnKeyDown
  r0_47.KeyDownEvent[r0_47.BatchCompeleteKey] = r0_47.TryBatchComplete
  r0_47.KeyDownEvent[r0_47.SwitchTab_LeftKey] = function()
    -- line: [676, 676] id: 48
    r0_47.Tab:TabToLeft()
  end
  r0_47.KeyDownEvent[r0_47.SwitchTab_RightKey] = function()
    -- line: [677, 677] id: 49
    r0_47.Tab:TabToRight()
  end
  r0_47.KeyDownEvent[r0_47.SwitchSubTab_LeftKey] = function()
    -- line: [678, 678] id: 50
    r0_47.SubTab_List:TabToLeft()
  end
  r0_47.KeyDownEvent[r0_47.SwitchSubTab_RightKey] = function()
    -- line: [679, 679] id: 51
    r0_47.SubTab_List:TabToRight()
  end
end
function r9_0.ShowDraftPathView(r0_52, r1_52)
  -- line: [682, 697] id: 52
  r0_52.Panel_List:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_52.Panel_Path:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_52.Forging_Path_PC:Init(r1_52, r0_52, r2_0)
  r0_52.Forging_Path_PC.OnClosedCallback = {
    r0_52,
    r0_52.HandleCloseDraftPathView
  }
  r0_52.Forging_Path_PC.OnDetailsViewBtnStartClickedCallback = {
    r0_52,
    r0_52.OnDraftBtnStartClicked
  }
  r0_52.Forging_Path_PC.OnDetailsViewBtnCancelClickedCallback = {
    r0_52,
    r0_52.OnDraftBtnCancelClicked
  }
  r0_52.Forging_Path_PC.OnFocusToDetailsView = {
    r0_52,
    r0_52.OnFocusToPathDetailsView
  }
  r0_52.Forging_Path_PC.OnFocusToPathView = {
    r0_52,
    r0_52.OnFocusToPathView
  }
  r0_52.IsShowingDraftPathView = true
  if r0_52.CurInputDeviceType == UE4.ECommonInputType.Gamepad then
    r0_52.ControllerFSM:Enter(r3_0.ControllerFSMStates.PathPage_Normal)
    r0_52.Forging_Path_PC:SetGamepadFocus()
  end
end
function r9_0.HandleCloseDraftPathView(r0_53)
  -- line: [699, 705] id: 53
  if r4_0.IsGamepadInput() then
    r0_53:HandleGamepadHideDraftPathView()
  end
  r0_53:HideDraftPathView()
end
function r9_0.HideDraftPathView(r0_54)
  -- line: [707, 716] id: 54
  if r0_54.CurInputDeviceType == UE4.ECommonInputType.Gamepad then
    r0_54.ForgeContent:SetFocus()
  end
  r0_54.Panel_List:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_54.Panel_Path:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_54.IsShowingDraftPathView = false
  r0_54:TickRefreshItemsView()
end
function r9_0.Handle_PreviewKeyDownOnGamePad(r0_55, r1_55)
  -- line: [718, 744] id: 55
  local r2_55 = false
  local r3_55 = r0_55.ControllerFSM:Current()
  if r3_55 == r3_0.ControllerFSMStates.NormalPage_FocusItem then
    if r1_55 == Const.GamepadSpecialLeft and r0_55.CurrentGamepadSelectedItem then
      r0_55.ControllerFSM:Enter(r3_0.ControllerFSMStates.NormalPage_ShowItem)
      r2_55 = true
    elseif r1_55 == Const.GamepadFaceButtonLeft and r0_55.CurrentGamepadSelectedItem then
      if r0_55.CurrentGamepadSelectedItem.State == r3_0.DraftState.InProgress then
        r0_55:OnDraftBtnCancelClicked(r0_55.CurrentGamepadSelectedItem.Id)
      else
        r0_55:HandleGamepadSetTarget()
      end
      r2_55 = true
    end
  elseif r3_55 == r3_0.ControllerFSMStates.NormalPage_ShowItem and (r1_55 == Const.GamepadDPadUp or r1_55 == Const.GamepadDPadDown) then
    r2_55 = true
  end
  return r2_55
end
function r9_0.Handle_KeyDownOnGamePad(r0_56, r1_56)
  -- line: [746, 798] id: 56
  DebugPrint("Tianyi@ HandleKeyDownOnGamePad", r1_56, r0_56.ControllerFSM:Current())
  local r2_56 = false
  local r3_56 = r0_56.ControllerFSM:Current()
  if r3_56 == r3_0.ControllerFSMStates.NormalPage_ShowItem and r1_56 == Const.GamepadFaceButtonRight then
    r0_56.ControllerFSM:Enter(r3_0.ControllerFSMStates.NormalPage_FocusItem)
    r0_56.ForgeContent:SetFocus()
    r2_56 = true
  elseif r3_56 == r3_0.ControllerFSMStates.NormalPage_FocusItem or r3_56 == r3_0.ControllerFSMStates.NormalPage_NoFocus then
    if r1_56 == Const.GamepadLeftTrigger then
      if r0_56.TabIdx2SubTabType[r0_56.TabIndex] then
        r0_56.SubTab_List:TabToLeft()
      end
      r2_56 = true
    elseif r1_56 == Const.GamepadRightTrigger then
      if r0_56.TabIdx2SubTabType[r0_56.TabIndex] then
        r0_56.SubTab_List:TabToRight()
      end
      r2_56 = true
    elseif r1_56 == Const.GamepadLeftThumbstick then
      r0_56.ControllerFSM:Enter(r3_0.ControllerFSMStates.NormalPage_FocusSort)
      r2_56 = true
    elseif r1_56 == Const.GamepadSpecialRight then
      r0_56:OnCompendiumClicked()
      r2_56 = true
    elseif r1_56 == Const.GamepadFaceButtonUp then
      r0_56:HandleGamepadBatchComplete()
      r2_56 = true
    end
  elseif r3_56 == r3_0.ControllerFSMStates.NormalPage_FocusSort then
    if r1_56 == Const.GamepadFaceButtonRight then
      r0_56.ControllerFSM:Enter(r3_0.ControllerFSMStates.NormalPage_FocusItem)
      r0_56.ForgeContent:SetFocus()
      r2_56 = true
    elseif r1_56 == Const.GamepadRightThumbstick then
      r2_56 = true
    end
  elseif r3_56 == r3_0.ControllerFSMStates.PathPage_Normal and r1_56 == Const.GamepadFaceButtonUp then
    r2_56 = r0_56.Forging_Path_PC:HandleTipPreviewDetails(r1_56)
  end
  if not r2_56 then
    r2_56 = r0_56.Tab:Handle_KeyEventOnGamePad(r1_56)
  end
  return r2_56
end
function r9_0.OnPreviewKeyDown(r0_57, r1_57, r2_57)
  -- line: [800, 812] id: 57
  local r3_57 = UE4.UKismetInputLibrary.GetKey(r2_57)
  local r4_57 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_57)
  local r5_57 = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_57) then
    r5_57 = r0_57:Handle_PreviewKeyDownOnGamePad(r4_57)
  end
  if r5_57 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end
function r9_0.OnKeyDown(r0_58, r1_58, r2_58)
  -- line: [814, 836] id: 58
  if r0_0:IfExistSystemGuideUI(r0_58) then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  local r3_58 = UE4.UKismetInputLibrary.GetKey(r2_58)
  local r4_58 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_58)
  local r5_58 = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_58) then
    r5_58 = r0_58:Handle_KeyDownOnGamePad(r4_58)
  elseif r0_58.KeyDownEvent[r4_58] then
    r0_58.KeyDownEvent[r4_58](r0_58)
    r5_58 = true
  end
  if r5_58 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end
function r9_0.BindReddotTreeEvents(r0_59)
  -- line: [840, 862] id: 59
  ReddotManager.AddListener(r3_0.NewdotNodeName.Root, r0_59, r0_59.UpdateNewReddotState)
  for r5_59, r6_59 in pairs(r0_59.TabIdx2TabType) do
    local r7_59 = r0_59.TabIdx2SubTabType[r5_59]
    if r7_59 then
      for r12_59, r13_59 in pairs(r7_59) do
        ReddotManager.AddListener(r3_0.ReddotNodeName[r13_59], r0_59, function()
          -- line: [846, 848] id: 60
          r0_59:UpdateSubTabReddot(r5_59, r12_59)
        end)
        ReddotManager.AddListener(r3_0.NewdotNodeName[r13_59], r0_59, function()
          -- line: [849, 851] id: 61
          r0_59:UpdateSubTabReddot(r5_59, r12_59)
        end)
        -- close: r12_59
      end
      -- close: r8_59
    end
    ReddotManager.AddListener(r3_0.ReddotNodeName[r6_59], r0_59, function()
      -- line: [855, 857] id: 62
      r0_59:UpdateTabReddot(r5_59)
    end)
    ReddotManager.AddListener(r3_0.NewdotNodeName[r6_59], r0_59, function()
      -- line: [858, 860] id: 63
      r0_59:UpdateTabReddot(r5_59)
    end)
    -- close: r5_59
  end
  -- close: r1_59
end
function r9_0.UnBindReddotTreeEvents(r0_64)
  -- line: [864, 872] id: 64
  for r5_64, r6_64 in pairs(r3_0.ReddotNodeName) do
    ReddotManager.RemoveListener(r6_64, r0_64)
  end
  -- close: r1_64
  for r5_64, r6_64 in pairs(r3_0.NewdotNodeName) do
    ReddotManager.RemoveListener(r6_64, r0_64)
  end
  -- close: r1_64
end
function r9_0.UpdateNewReddotState(r0_65)
  -- line: [875, 882] id: 65
  if ReddotManager.GetTreeNode(r3_0.NewdotNodeName.Root).Count > 0 then
    r0_65.Entrance_Compendium.New:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    r0_65.Entrance_Compendium.New:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r9_0.UpdateTabReddot(r0_66, r1_66)
  -- line: [885, 895] id: 66
  DebugPrint("Tianyi@ UpdateTabReddot", r1_66)
  local r2_66 = r0_66.TabIdx2TabType[r1_66]
  local r3_66 = ReddotManager.GetTreeNode(r3_0.ReddotNodeName[r2_66])
  local r4_66 = ReddotManager.GetTreeNode(r3_0.NewdotNodeName[r2_66])
  local r5_66 = r3_66.Count > 0
  r0_66.Tab:ShowTabRedDot(r1_66, r4_66.Count > 0 and not r5_66, r5_66)
end
function r9_0.UpdateSubTabReddot(r0_67, r1_67, r2_67)
  -- line: [898, 913] id: 67
  DebugPrint("Tianyi@ UpdateSubTabReddot", r1_67, r2_67)
  if r0_67.TabIndex ~= r1_67 or not r0_67.TabIdx2SubTabType[r1_67] or not r0_67.TabIdx2SubTabType[r1_67][r2_67] then
    return 
  end
  local r3_67 = r0_67.TabIdx2SubTabType[r1_67][r2_67]
  local r4_67 = ReddotManager.GetTreeNode(r3_0.ReddotNodeName[r3_67])
  local r5_67 = ReddotManager.GetTreeNode(r3_0.NewdotNodeName[r3_67])
  local r6_67 = r4_67.Count > 0
  r0_67.SubTab_List:ShowTabRedDot(r2_67, r5_67.Count > 0 and not r6_67, r6_67)
end
function r9_0.InitTabContent(r0_68)
  -- line: [917, 971] id: 68
  local r1_68 = {}
  r0_68.TabIdx2DataIdx = {}
  r0_68.TabIdx2TabType = {}
  r0_68.TabIdx2SubTabType = {}
  for r5_68 = 1, #DataMgr.ForgeTab, 1 do
    table.insert(r0_68.TabIdx2DataIdx, r5_68)
  end
  table.sort(r0_68.TabIdx2DataIdx, function(r0_69, r1_69)
    -- line: [929, 931] id: 69
    return DataMgr.ForgeTab[r1_69].Sequence < DataMgr.ForgeTab[r0_69].Sequence
  end)
  for r5_68 = 1, #DataMgr.ForgeTab, 1 do
    local r7_68 = DataMgr.ForgeTab[r0_68.TabIdx2DataIdx[r5_68]]
    r0_68.TabIdx2TabType[r5_68] = r7_68.ProductType
    r0_68.TabIdx2SubTabType[r5_68] = r3_0.TabType2SubTabType[r7_68.ProductType]
    table.insert(r1_68, {
      Text = GText(r7_68.TabName),
      TabId = r5_68,
      IconPath = r7_68.Icon,
    })
  end
  r0_68.Tab:Init({
    TitleName = GText("MAIN_UI_FORGE"),
    LeftKey = "Q",
    RightKey = "E",
    StyleName = "Text",
    Tabs = r1_68,
    DynamicNode = {
      "Back",
      "ResourceBar",
      "BottomKey"
    },
    BackCallback = r0_68.OnClose,
    BottomKeyInfo = {},
    OwnerPanel = r0_68,
  })
  r0_68.Tab:BindEventOnTabSelected(r0_68, r0_68.OnTabItemSelected)
  r0_68.SubTab_List:Init({
    LeftKey = "A",
    RightKey = "D",
    Tabs = {},
  })
  r0_68.SubTab_List:BindEventOnTabSelected(r0_68, r0_68.OnSubTabItemSelected)
  r0_68.Tab:SelectTab(1)
  r0_68:BindReddotTreeEvents()
end
function r9_0.SetTargetSubTabIndex(r0_70, r1_70)
  -- line: [973, 975] id: 70
  r0_70.TargetSubTabIndex = r1_70
end
function r9_0.GetTargetSubTabIndex(r0_71)
  -- line: [977, 979] id: 71
  return r0_71.TargetSubTabIndex
end
function r9_0.OnTabItemSelected(r0_72, r1_72)
  -- line: [981, 1025] id: 72
  local r2_72 = r0_72:GetCurrentTabType()
  r0_72.TabIndex = r1_72.Idx
  if r0_72.TabIdx2SubTabType[r0_72.TabIndex] then
    local r3_72 = {}
    for r8_72, r9_72 in ipairs(r0_72.TabIdx2SubTabType[r0_72.TabIndex]) do
      local r10_72 = ReddotManager.GetTreeNode(r3_0.ReddotNodeName[r9_72])
      local r11_72 = ReddotManager.GetTreeNode(r3_0.NewdotNodeName[r9_72])
      local r12_72 = r10_72.Count > 0
      table.insert(r3_72, {
        Text = GText(r3_0.SubTabTitleName[r9_72]),
        TabId = r8_72,
        ShowRedDot = r12_72,
        IsNew = r11_72.Count > 0,
      })
    end
    -- close: r4_72
    r0_72.SubTab_List:UpdateTabs(r3_72)
    if r0_72:GetTargetSubTabIndex() then
      r0_72.SubTab_List:SelectTab(r0_72.TargetSubTabIndex)
      r0_72:SetTargetSubTabIndex(false)
    else
      r0_72.SubTab_List:SelectTab(1)
    end
    r0_72:AddWidgetHiddenTag(r0_72.Panel_SubTab, false, "ShowSubTab")
    r0_72:AddWidgetHiddenTag(r0_72.Spacer_Up, false, "ShowSubTab")
  else
    r0_72.SubTabIndex = nil
    r0_72.SubTab_List:UpdateTabs({})
    r0_72:UpdateForgeContent()
    r0_72:AddWidgetHiddenTag(r0_72.Panel_SubTab, true, "ShowSubTab")
    r0_72:AddWidgetHiddenTag(r0_72.Spacer_Up, true, "ShowSubTab")
  end
  if r0_72.IsShowingDraftPathView then
    r0_72.Forging_Path_PC:OnClose()
  end
  r0_72.Sift:ClearSiftSelection()
end
function r9_0.OnSubTabItemSelected(r0_73, r1_73)
  -- line: [1027, 1030] id: 73
  r0_73.SubTabIndex = r1_73.Idx
  r0_73:UpdateForgeContent()
end
function r9_0.UpdateForgeContent(r0_74)
  -- line: [1032, 1057] id: 74
  if r0_74.TabIndex then
    r0_74.CurrentGamepadSelectedItem = nil
    local r1_74 = r0_74:GetCurrentTabType()
    local r2_74 = r0_74:GetCurrentSubTabType()
    local r3_74 = nil
    if r1_74 == r3_0.TabType.Mod then
      r3_74 = r0_74.CommonFilterData
    end
    local r4_74, r5_74 = r2_0:GetDatasByFilter(r1_74, r2_74, r3_74)
    r0_74.IsDraftInfosEmpty = #r4_74 <= 0
    if not r0_74.IsDraftInfosEmpty then
      local r6_74, r7_74 = r0_74.Sort:GetSortInfos()
      r2_0:SortDraftDatas(r4_74, r1_74, r2_74, r6_74, r7_74)
    end
    r0_74:ShowEmptyPage(r0_74.IsDraftInfosEmpty, r5_74)
    r0_74:BeginAddForgeContentItem(r4_74)
    r0_74:UpdateBatchCompleteButton()
    r0_74:UpdateSiftButton()
    r0_74:InitNormalPageState()
  end
end
function r9_0.GetMaxItemNumPerPanel(r0_75)
  -- line: [1059, 1075] id: 75
  if r0_75.MaxItemNumPerPanel then
    return r0_75.MaxItemNumPerPanel
  end
  if r0_75.ForgeContent:GetNumItems() > 0 then
    local r1_75 = r0_75.ForgeContent:GetDisplayedEntryWidgets()
    if r1_75:Length() ~= 0 then
      r0_75.MaxItemNumPerPanel = r4_0.GetListViewContentMaxCount(r0_75.ForgeContent, r1_75)
      return r0_75.MaxItemNumPerPanel
    else
      return r6_0
    end
  else
    return r6_0
  end
end
function r9_0.CheckScrollbarVisibility(r0_76, r1_76)
  -- line: [1077, 1083] id: 76
  if r1_76 <= r0_76:GetMaxItemNumPerPanel() then
    r0_76.ForgeContent:SetScrollbarVisibility(UE4.ESlateVisibility.Collapsed)
  else
    r0_76.ForgeContent:SetScrollbarVisibility(UE4.ESlateVisibility.Visible)
  end
end
function r9_0.CheckShouldAddEmptyItem(r0_77)
  -- line: [1086, 1099] id: 77
  if r0_77:IsDelayAddingForgeContentItem() then
    return 
  end
  local r1_77 = r0_77.ForgeContent:GetNumItems()
  local r2_77 = r0_77:GetMaxItemNumPerPanel()
  while r1_77 < r2_77 do
    local r3_77 = NewObject(r0_77.ForgeItemContentClass)
    r3_77.IsEmptyWidget = true
    r0_77.ForgeContent:AddItem(r3_77)
    r1_77 = r1_77 + 1
    DebugPrint("Tianyi@ Items num not enough. Add empty item")
  end
end
function r9_0.ShowEmptyPage(r0_78, r1_78, r2_78)
  -- line: [1101, 1145] id: 78
  local r3_78 = r0_78.CurInputDeviceType == UE4.ECommonInputType.Gamepad
  if r1_78 then
    r0_78.ForgeContent:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_78.Panel_Empty:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    if not r2_78.HasFilterItem then
      r0_78:AddWidgetHiddenTag(r0_78.Panel_Bottom, true, "EmptyPage")
      r0_78:AddWidgetHiddenTag(r0_78.Panel_SubTab, true, "EmptyPage")
      r0_78:AddWidgetHiddenTag(r0_78.Spacer_Up, true, "EmptyPage")
      r0_78:AddWidgetHiddenTag(r0_78.Spacer_Down, true, "EmptyPage")
    end
    local r4_78 = r0_78:GetCurrentTabType()
    if r4_78 == r3_0.TabType.Producing then
      r0_78.Text_EmptyText:SetText(GText("UI_FORGE_NOFORGING"))
      r0_78.Text_WorldText:SetText(EnText("UI_FORGE_NOFORGING"))
    elseif r4_78 == r3_0.TabType.ToBeProduced then
      r0_78.Text_EmptyText:SetText(GText("UI_FORGE_NOREADY"))
      r0_78.Text_WorldText:SetText(EnText("UI_FORGE_NOREADY"))
    elseif r0_78.Sift:IsSifted() then
      r0_78.Text_EmptyText:SetText(GText("Forge_Blueprint_ConditionsAreNot"))
      r0_78.Text_WorldText:SetText(EnText("Forge_Blueprint_ConditionsAreNot"))
    else
      r0_78.Text_EmptyText:SetText(GText("UI_FORGING_EMPTY"))
      r0_78.Text_WorldText:SetText(EnText("UI_FORGING_EMPTY"))
    end
    if r3_78 then
      r0_78.GameInputModeSubsystem:SetNavigateWidgetVisibility(false)
    end
  else
    r0_78:AddWidgetHiddenTag(r0_78.Panel_Bottom, false, "EmptyPage")
    r0_78:AddWidgetHiddenTag(r0_78.Panel_SubTab, false, "EmptyPage")
    r0_78:AddWidgetHiddenTag(r0_78.Spacer_Up, false, "EmptyPage")
    r0_78:AddWidgetHiddenTag(r0_78.Spacer_Down, false, "EmptyPage")
    r0_78.Panel_Empty:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_78.ForgeContent:SetVisibility(UE4.ESlateVisibility.Visible)
    if r3_78 then
      r0_78.GameInputModeSubsystem:SetNavigateWidgetVisibility(true)
    end
  end
end
function r9_0.SetNotDelayAddListItem(r0_79, r1_79)
  -- line: [1148, 1150] id: 79
  r0_79.NotDelayAddListItem = r1_79
end
function r9_0.GetNotDelayAddListItem(r0_80)
  -- line: [1152, 1154] id: 80
  return r0_80.NotDelayAddListItem
end
function r9_0.AddSingleItemToContent(r0_81, r1_81, r2_81)
  -- line: [1156, 1184] id: 81
  local r3_81 = NewObject(r0_81.ForgeItemContentClass)
  if r2_81 then
    r3_81.IsEmptyWidget = true
    r0_81.ForgeContent:AddItem(r3_81)
  else
    r3_81 = r2_0:ConstructForgeItemContent(r3_81, r1_81)
    r3_81.IsEmptyWidget = false
    function r3_81.OnReceiveFocus(r0_82)
      -- line: [1164, 1166] id: 82
      r0_81:OnForgeItemReceiveFocus(r0_82)
    end
    function r3_81.OnLostFocus(r0_83)
      -- line: [1167, 1169] id: 83
      r0_81:OnForgeItemLostFocus(r0_83)
    end
    function r3_81.OnNavigateUp(r0_84)
      -- line: [1170, 1172] id: 84
      r0_81:OnForgeItemNavigateUp(r0_84)
    end
    function r3_81.OnNavigateDown(r0_85)
      -- line: [1173, 1175] id: 85
      r0_81:OnForgeItemNavigateDown(r0_85)
    end
    function r3_81.OnMenuOpenChanged(r0_86)
      -- line: [1176, 1178] id: 86
      r0_81:OnMenuOpenChanged(r0_86)
    end
    function r3_81.OnItemWidgetClicked(r0_87)
      -- line: [1179, 1181] id: 87
      r0_81:OnForgeItemWidgetClicked(r0_87)
    end
    r0_81.ForgeContent:AddItem(r3_81)
  end
end
function r9_0.BeginAddForgeContentItem(r0_88, r1_88)
  -- line: [1186, 1201] id: 88
  r0_88.ForgeContent:ClearListItems()
  r0_88.DraftInfosCache = r1_88
  if #r1_88 <= 0 then
    return 
  end
  if r0_88.DelayToShowContentItemTimer then
    r0_88:RemoveTimer(r0_88.DelayToShowContentItemTimer)
  end
  if r0_88:GetNotDelayAddListItem() then
    r0_88:AddForgeContentItem(r1_88)
    r0_88:SetNotDelayAddListItem(false)
  else
    r0_88:DelayAddForgeContentItem(r1_88)
  end
end
function r9_0.AddForgeContentItem(r0_89, r1_89)
  -- line: [1204, 1215] id: 89
  local r2_89 = r0_89:GetMaxItemNumPerPanel()
  for r7_89, r8_89 in ipairs(r1_89) do
    r0_89:AddSingleItemToContent(r8_89, false)
  end
  -- close: r3_89
  for r6_89 = #r1_89 + 1, r2_89, 1 do
    r0_89:AddSingleItemToContent({}, true)
  end
  r0_89:CheckScrollbarVisibility(#r1_89)
end
function r9_0.DelayAddForgeContentItem(r0_90, r1_90)
  -- line: [1218, 1238] id: 90
  r0_90.DelayItemIndex = 1
  r0_90.DelayToShowContentItemTimer = r0_90:AddTimer(0.06, function()
    -- line: [1220, 1237] id: 91
    local r0_91 = r0_90.DraftInfosCache[r0_90.DelayItemIndex]
    if #r0_90.DraftInfosCache < r0_90.DelayItemIndex then
      if r0_90.DelayItemIndex <= r0_90:GetMaxItemNumPerPanel() then
        r0_90:AddSingleItemToContent(r0_91, true)
        r0_90.DelayItemIndex = r0_90.DelayItemIndex + 1
      else
        r0_90.ForgeContent:SetEmptyGridItemCount(r0_90:GetMaxItemNumPerPanel() - #r0_90.DraftInfosCache)
        r0_90:RemoveTimer(r0_90.DelayToShowContentItemTimer)
        r0_90.DelayToShowContentItemTimer = nil
      end
      return 
    end
    r0_90:CheckScrollbarVisibility(#r0_90.DraftInfosCache)
    r0_90:AddSingleItemToContent(r0_91, false)
    r0_90.DelayItemIndex = r0_90.DelayItemIndex + 1
  end, true)
end
function r9_0.IsDelayAddingForgeContentItem(r0_92)
  -- line: [1241, 1243] id: 92
  return r0_92.DelayToShowContentItemTimer
end
function r9_0.OnForgeContentEntryInit(r0_93, r1_93, r2_93)
  -- line: [1245, 1253] id: 93
  function r2_93.EventStartProduce()
    -- line: [1246, 1246] id: 94
    r0_93:OnDraftBtnStartClicked(r1_93.ID)
  end
  function r2_93.EventCancelProduce()
    -- line: [1247, 1247] id: 95
    r0_93:OnDraftBtnCancelClicked(r1_93.ID)
  end
  function r2_93.EventShowPath()
    -- line: [1248, 1248] id: 96
    r0_93:OnDraftShowPath(r1_93.ID)
  end
  r0_93:RefreshSingleItemData(r1_93)
  r2_93.Content = r1_93
  r2_93:InitializeView()
end
function r9_0.OnForgeContentItemClicked(r0_97, r1_97)
  -- line: [1255, 1259] id: 97
  if r1_97.State == r3_0.DraftState.Complete then
    r0_97:RequestCompleteProduce(r1_97.Id)
  end
end
function r9_0.SetEnableBtnStartClicked(r0_98, r1_98)
  -- line: [1262, 1264] id: 98
  r0_98.DisableBtnStartClicked = not r1_98
end
function r9_0.OnDraftBtnStartClicked(r0_99, r1_99)
  -- line: [1267, 1295] id: 99
  if r0_99.DisableBtnStartClicked then
    return 
  end
  DebugPrint("Tianyi@ OnDraftBtnStartClicked, DraftId = " .. r1_99)
  local r2_99 = r2_0:CheckState(r1_99)
  if r2_99 then
    if r2_99.State == r3_0.DraftState.NotStarted and r2_99.CanProduce then
      local r3_99 = nil
      if r2_99.ModAsMaterial then
        r3_99 = r2_0:ChooseCostItems(r1_99)
        if r3_99 == nil then
          DebugPrint(ErrorTag, "CostModList is nil, there must be something wrong!")
          return 
        end
      end
      r0_99:ShowStartProduceConfirmWindowWithItem(r1_99, r3_99)
    elseif r2_99.State == r3_0.DraftState.InProgress then
      r0_99:ShowAccerateProduceConfirmWindow(r1_99)
    elseif r2_99.State == r3_0.DraftState.Complete then
      r0_99:RequestCompleteProduce(r1_99)
    end
  else
    DebugPrint("Tianyi@ Can not Found DraftInfo! It must be something wrong!")
  end
end
function r9_0.OnDraftShowPath(r0_100, r1_100)
  -- line: [1298, 1301] id: 100
  DebugPrint("Tianyi@ OnDraftShowPath, DraftId = " .. r1_100)
  r0_100:ShowDraftPathView(r1_100)
end
function r9_0.OnDraftBtnCancelClicked(r0_101, r1_101)
  -- line: [1304, 1309] id: 101
  local r2_101 = r2_0:CheckState(r1_101)
  if r2_101 and r2_101.State == r3_0.DraftState.InProgress then
    r0_101:ShowCancelProduceConfirmWindow(r1_101)
  end
end
function r9_0.OnFocusToPathDetailsView(r0_102)
  -- line: [1311, 1313] id: 102
  r0_102:UpdateGamepadBottomKeyInfo({
    r3_0.BottomKeyTypes.BottomKey_Confirm,
    r3_0.BottomKeyTypes.BottomKey_Back
  })
end
function r9_0.OnFocusToPathView(r0_103)
  -- line: [1315, 1317] id: 103
  r0_103:UpdateGamepadBottomKeyInfo({
    r3_0.BottomKeyTypes.BottomKey_Back
  })
end
function r9_0.NavigateToTab(r0_104, r1_104, r2_104)
  -- line: [1321, 1326] id: 104
  if r0_104.Tab.CurrentTab == r1_104 then
    return 
  end
  r0_104:SetNotDelayAddListItem(true)
  r0_104:SetTargetSubTabIndex(r2_104)
  r0_104.Tab:SelectTab(r1_104)
end
function r9_0.NavigateToTargetDraft(r0_105, r1_105)
  -- line: [1329, 1366] id: 105
  local r2_105 = r0_105.CurInputDeviceType == UE4.ECommonInputType.Gamepad
  if r0_105.IsShowingDraftPathView then
    r0_105:HideDraftPathView()
  end
  r0_105.ControllerNotAutoFocus = true
  r0_105:NavigateToTab(1)
  local r3_105 = r0_105.ForgeContent:GetListItems()
  local r4_105 = r3_105:Num()
  r0_105:AddTimer(0.1, function()
    -- line: [1341, 1365] id: 106
    local r0_106 = nil
    for r4_106 = 1, r4_105, 1 do
      local r5_106 = r3_105:GetRef(r4_106)
      if r5_106.Id == r1_105 then
        if r2_105 then
          r0_105.ForgeContent:NavigateToIndex(r4_106 + -1)
        else
          r0_105.ForgeContent:ScrollIndexIntoView(r4_106 + -1)
        end
        r0_106 = r5_106
        r0_105:AddTimer(0.1, function()
          -- line: [1353, 1361] id: 107
          local r0_107 = r0_106.Widget
          r0_105:PlayEntryScanlineAnim(r0_107)
          if r2_105 then
            r0_107:SetFocus()
            r0_105.ControllerFSM:Enter(r3_0.ControllerFSMStates.NormalPage_FocusItem)
            r0_105:UpdateFocusItemSetTargetState()
          end
        end)
        break
      end
    end
  end)
end
function r9_0.PlayEntryScanlineAnim(r0_108, r1_108)
  -- line: [1368, 1381] id: 108
  if not r1_108 then
    return 
  end
  if r0_108:IsAnimationPlaying(r0_108.In) then
    r0_108:BindToAnimationFinished(r0_108.In, {
      r0_108,
      function()
        -- line: [1372, 1377] id: 109
        if r1_108 then
          r1_108:PlayScanlineAnim()
        end
        r0_108:UnbindAllFromAnimationFinished(r0_108.In)
      end
    })
  else
    r1_108:PlayScanlineAnim()
  end
end
function r9_0.ContinueCoroutine(r0_110, r1_110, ...)
  -- line: [1386, 1391] id: 110
  if r1_110 then
    local r2_110, r3_110 = coroutine.resume(r1_110, ...)
    assert(r2_110, r3_110)
  end
end
function r9_0.ShowStartProduceConfirmWindow(r0_111, r1_111, r2_111, r3_111)
  -- line: [1393, 1415] id: 111
  local r4_111 = {}
  local r5_111 = DataMgr.Draft[r1_111]
  local r7_111 = DataMgr.CommonPopupUIContext[Const.Popup_StartProduce].PopoverText
  local r8_111 = GText(r2_0:GetProductNameByTypeAndId(r5_111.ProductType, r5_111.ProductId))
  if r5_111.ProductNum and r5_111.ProductNum > 1 then
    r8_111 = r8_111 .. " x" .. tostring(r5_111.ProductNum)
  end
  r4_111.ShortText = string.format(GText(r7_111), r8_111)
  r4_111.HideItemTips = not r2_111
  function r4_111.RightCallbackFunction()
    -- line: [1406, 1408] id: 112
    r0_111:ContinueCoroutine(r3_111, true, 1)
  end
  function r4_111.LeftCallbackFunction()
    -- line: [1410, 1412] id: 113
    r0_111:ContinueCoroutine(r3_111, false)
  end
  r0_111:ShowConfirmWindow(Const.Popup_StartProduce, r4_111, r0_111)
end
function r9_0.ShowStartBatchProduceConfirmWindow(r0_114, r1_114, r2_114)
  -- line: [1418, 1445] id: 114
  local r3_114 = {}
  local r4_114 = DataMgr.Draft[r1_114]
  local r5_114 = DataMgr.CommonPopupUIContext[Const.Popup_BatchStartProduce]
  local r6_114 = GText(r2_0:GetProductNameByTypeAndId(r4_114.ProductType, r4_114.ProductId))
  if r4_114.ProductNum and r4_114.ProductNum > 1 then
    r6_114 = r6_114 .. " x" .. tostring(r4_114.ProductNum)
  end
  local r7_114 = r2_0:CheckState(r1_114)
  r3_114.ForgeItemContent = r2_0:ConstructForgeItemContent({}, r7_114)
  r3_114.DraftInfo = r7_114
  function r3_114.RightCallbackFunction(r0_115, r1_115)
    -- line: [1433, 1437] id: 115
    r0_114:ContinueCoroutine(r2_114, true, r1_115.Content_1.Count and 1)
  end
  function r3_114.LeftCallbackFunction()
    -- line: [1439, 1441] id: 116
    r0_114:ContinueCoroutine(r2_114, false)
  end
  r3_114.BindScript = "BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_LuaModel.Common_Dialog_LuaModel_BatchProduce"
  r0_114:ShowConfirmWindow(Const.Popup_BatchStartProduce, r3_114, r0_114)
end
function r9_0.ShowStartProduceConfirmWindowWithItem(r0_117, r1_117, r2_117)
  -- line: [1447, 1512] id: 117
  if not r2_117 then
    r2_117 = {}
  end
  local r3_117 = {}
  local r4_117 = false
  local r5_117 = false
  local r6_117 = false
  local r7_117 = false
  local r8_117 = DataMgr.Draft[r1_117].Batch
  for r13_117, r14_117 in ipairs(r2_117) do
    local r15_117 = false
    if r14_117.Type == "Mod" then
      r4_117 = true
      if r14_117.IsLock then
        r5_117 = true
        r15_117 = true
      end
      if r14_117.Level > 0 then
        r6_117 = true
        r15_117 = true
      end
      if r14_117.IsEquipped then
        r7_117 = true
      end
      if r15_117 then
        table.insert(r3_117, r14_117)
      end
    end
  end
  -- close: r9_117
  local r10_117, r11_117 = coroutine.resume(coroutine.create(function()
    -- line: [1480, 1508] id: 118
    local r0_118 = coroutine.running()
    local r1_118 = nil
    local r2_118 = nil
    if r4_117 then
      if r5_117 then
        r0_117:ShowHasLockedModConfirmWindow(r1_117, r3_117, r7_117, r0_118)
        r1_118, r2_118 = coroutine.yield()
        if r1_118 == false then
          return 
        end
      elseif r6_117 then
        r0_117:ShowHasUpgradedModConfirmWindow(r1_117, r3_117, r7_117, r0_118)
        r1_118, r2_118 = coroutine.yield()
        if r1_118 == false then
          return 
        end
      else
        r0_117:ShowStartProduceConfirmWindow(r1_117, r7_117, r0_118)
        r1_118, r2_118 = coroutine.yield()
        if r1_118 == false then
          return 
        end
      end
    elseif r8_117 then
      r0_117:ShowStartBatchProduceConfirmWindow(r1_117, r0_118)
      r1_118, r2_118 = coroutine.yield()
      if r1_118 == false then
        return 
      end
    else
      r0_117:ShowStartProduceConfirmWindow(r1_117, false, r0_118)
      if coroutine.yield() == false then
        return 
      end
    end
    local r3_118 = r0_117
    local r5_118 = r1_117
    local r6_118 = r2_117 and {}
    r3_118:RequestStartProduce(r5_118, r6_118, r2_118 and 1)
  end))
  assert(r10_117, r11_117)
end
function r9_0.ShowImportantItemCostConfirmWindow(r0_119, r1_119, r2_119, r3_119, r4_119, r5_119)
  -- line: [1514, 1546] id: 119
  local r6_119 = {}
  local r7_119 = DataMgr.Draft[r1_119]
  local r9_119 = DataMgr.CommonPopupUIContext[r3_119].PopoverText
  local r10_119 = GText(r2_0:GetProductNameByTypeAndId(r7_119.ProductType, r7_119.ProductId))
  if r7_119.ProductNum and r7_119.ProductNum > 1 then
    r10_119 = r10_119 .. " x" .. tostring(r7_119.ProductNum)
  end
  r6_119.ItemList = {}
  for r15_119, r16_119 in ipairs(r2_119) do
    table.insert(r6_119.ItemList, {
      ItemType = "Mod",
      ItemId = r16_119.Id,
      ItemUuid = r16_119.Uuid,
      ItemNum = r16_119.Count,
      ItemInstance = r16_119.Instance,
    })
  end
  -- close: r11_119
  r6_119.LargeSizeItem = true
  r6_119.ShortText = string.format(GText(r9_119), r10_119)
  r6_119.HideItemTips = not r4_119
  function r6_119.RightCallbackFunction()
    -- line: [1538, 1540] id: 120
    r0_119:ContinueCoroutine(r5_119, true)
  end
  function r6_119.LeftCallbackFunction()
    -- line: [1541, 1543] id: 121
    r0_119:ContinueCoroutine(r5_119, false)
  end
  r0_119:ShowConfirmWindow(r3_119, r6_119, r0_119)
end
function r9_0.ShowHasLockedModConfirmWindow(r0_122, r1_122, r2_122, r3_122, r4_122)
  -- line: [1549, 1551] id: 122
  r0_122:ShowImportantItemCostConfirmWindow(r1_122, r2_122, Const.Popup_ConfirmLockedMod, r3_122, r4_122)
end
function r9_0.ShowHasUpgradedModConfirmWindow(r0_123, r1_123, r2_123, r3_123, r4_123)
  -- line: [1554, 1556] id: 123
  r0_123:ShowImportantItemCostConfirmWindow(r1_123, r2_123, Const.Popup_ConfirmUpgradedMod, r3_123, r4_123)
end
function r9_0.ShowCancelProduceConfirmWindow(r0_124, r1_124)
  -- line: [1558, 1604] id: 124
  local r2_124 = {}
  local r3_124 = {
    ReturnItemList = {},
  }
  local r4_124 = r2_0:GetDraftInfoById(r1_124)
  local r5_124 = r4_124.DraftCompleteNum
  local r6_124 = r4_124.DraftDoingNum
  local r7_124 = DataMgr.Draft[r1_124]
  for r12_124, r13_124 in ipairs(r7_124.Resource) do
    table.insert(r3_124.ReturnItemList, {
      ItemId = r13_124.Id,
      ItemNum = r13_124.Num * r6_124,
      ItemType = r13_124.Type and "Resource",
    })
  end
  -- close: r8_124
  for r12_124, r13_124 in pairs(r7_124.FoundryCost) do
    table.insert(r3_124.ReturnItemList, {
      ItemId = r12_124,
      ItemNum = r13_124 * r6_124,
      ItemType = "Resource",
    })
  end
  -- close: r8_124
  if r5_124 > 0 then
    r3_124.CompleteItem = {
      ItemId = r7_124.ProductId,
      ItemNum = r7_124.ProductNum * r5_124,
      ItemType = r7_124.ProductType,
    }
  end
  r2_124.CancelParams = r3_124
  function r2_124.RightCallbackFunction()
    -- line: [1599, 1601] id: 125
    r0_124:RequestCancelProduce(r1_124)
  end
  r0_124:ShowConfirmWindow(Const.Popup_CancelProduce, r2_124, r0_124)
end
function r9_0.ShowAccerateProduceConfirmWindow(r0_126, r1_126)
  -- line: [1606, 1619] id: 126
  r0_126:ShowConfirmWindow(Const.Popup_AccerateProduce, {
    ShortText = string.format(GText(DataMgr.CommonPopupUIContext[Const.Popup_AccerateProduce].PopoverText), GText(r2_0:GetProductNameByTypeAndId("Resource", DataMgr.GlobalConstant.AccelerateCostType.ConstantValue)), r2_0:GetAccerateCost(r1_126)),
    RightCallbackFunction = function()
      -- line: [1615, 1617] id: 127
      r0_126:RequestAccerateProduce(r1_126)
    end,
  }, r0_126)
end
function r9_0.ShowCompleteProduceWindow(r0_128, r1_128)
  -- line: [1621, 1646] id: 128
  local r2_128 = {}
  local r3_128 = {}
  for r8_128, r9_128 in pairs(r1_128) do
    local r10_128 = DataMgr.Draft[r8_128]
    local r11_128 = r10_128.ProductId
    local r12_128 = r10_128.ProductNum * r9_128
    local r13_128 = r10_128.ProductType .. "s"
    if r10_128.ProductType == "Weapon" then
      local r14_128 = DataMgr.Weapon[r11_128]
      if r14_128 and r14_128.WeaponRarity >= 5 then
        table.insert(r3_128, r11_128)
      end
    end
    r2_128[r13_128] = r2_128[r13_128] and {}
    r2_128[r13_128][r11_128] = r12_128
  end
  -- close: r4_128
  r0_128:SetEnableBtnStartClicked(false)
  r0_128:ShowGetItemWindow(r2_128, function()
    -- line: [1640, 1644] id: 129
    r0_128:RefreshItemsView()
    r0_128:SetInputUIOnly(true)
    r0_128:SetEnableBtnStartClicked(true)
  end)
end
function r9_0.ShowCancelProduceWindow(r0_130, r1_130, r2_130, r3_130)
  -- line: [1648, 1686] id: 130
  local r4_130 = {}
  local r5_130 = DataMgr.Draft[r1_130]
  if r3_130 and r3_130 > 0 then
    local r6_130 = r5_130.ProductId
    local r7_130 = r5_130.ProductNum
    local r8_130 = r5_130.ProductType .. "s"
    r4_130[r8_130] = r4_130[r8_130] and {}
    r4_130[r8_130][r6_130] = r7_130
  end
  if r2_130 and r2_130 > 0 then
    for r10_130, r11_130 in ipairs(r5_130.Resource) do
      local r12_130 = r11_130.Id
      local r13_130 = (r11_130.Type and "Resource") .. "s"
      local r14_130 = r11_130.Num * r2_130
      r4_130[r13_130] = r4_130[r13_130] and {}
      r4_130[r13_130][r12_130] = r14_130
    end
    -- close: r6_130
    for r10_130, r11_130 in pairs(r5_130.FoundryCost) do
      r4_130.Resources = r4_130.Resources and {}
      r4_130.Resources[r10_130] = r11_130 * r2_130
    end
    -- close: r6_130
  end
  r0_130:ShowGetItemWindow(r4_130, function()
    -- line: [1680, 1683] id: 131
    r0_130:RefreshItemsView()
    r0_130:SetInputUIOnly(true)
  end)
end
function r9_0.ShowConfirmWindow(r0_132, r1_132, r2_132, r3_132)
  -- line: [1689, 1693] id: 132
  UE4.UGameplayStatics.GetGameInstance(r0_132):GetGameUIManager():ShowCommonPopupUI(r1_132, r2_132, r3_132)
end
function r9_0.ShowGetItemWindow(r0_133, r1_133, r2_133)
  -- line: [1695, 1699] id: 133
  local r4_133 = UE4.UGameplayStatics.GetGameInstance(r0_133):GetGameUIManager()
  r4_0.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, r1_133, false, r2_133, r0_133)
end
function r9_0.RequestStartProduce(r0_134, r1_134, r2_134, r3_134)
  -- line: [1702, 1727] id: 134
  local r4_134 = GWorld:GetAvatar()
  local r5_134 = {}
  if r2_134 and #r2_134 > 0 then
    for r10_134, r11_134 in ipairs(r2_134) do
      if r11_134.Type == "Mod" then
        if not r5_134.Mod then
          r5_134.Mod = {}
        end
        r5_134.Mod[r11_134.Id] = r5_134.Mod[r11_134.Id] and {}
        r5_134.Mod[r11_134.Id][r11_134.Uuid] = r11_134.Count
        DebugPrint("Tianyi@ Uuid = " .. r0_0.Str2ObjId(r11_134.Uuid))
      end
    end
    -- close: r6_134
    DebugPrint("Tianyi@ RequstStartProduce, CostItemList = ")
    PrintTable(r5_134, 10)
  end
  r4_134:StartProduct(r1_134, r5_134, r3_134)
  r0_134:BlockAllUIInput(true)
  if r2_0:IsDraftSetTarget(r1_134) then
    r2_0:RemoveDraftFromTarget(r1_134)
  end
end
function r9_0.TryBatchComplete(r0_135)
  -- line: [1729, 1733] id: 135
  if r0_135.CanBatchComplete then
    r0_135:RequestBatchComplete()
  end
end
function r9_0.RequestBatchComplete(r0_136)
  -- line: [1735, 1749] id: 136
  local r1_136 = {}
  local r2_136 = r0_136.ForgeContent:GetListItems()
  for r6_136 = 1, r2_136:Num(), 1 do
    local r7_136 = r2_136:GetRef(r6_136)
    local r8_136 = r2_0:CheckState(r7_136.Id)
    if r8_136 and r8_136.State == r3_0.DraftState.Complete then
      table.insert(r1_136, r7_136.Id)
    end
  end
  GWorld:GetAvatar():GetAllDraftCompleteReward(r1_136)
  r0_136:BlockAllUIInput(true)
end
function r9_0.RequestCancelProduce(r0_137, r1_137)
  -- line: [1751, 1755] id: 137
  GWorld:GetAvatar():CancelProduct(r1_137)
  r0_137:BlockAllUIInput(true)
end
function r9_0.RequestAccerateProduce(r0_138, r1_138)
  -- line: [1757, 1762] id: 138
  GWorld:GetAvatar():AccelerateProduct(r1_138)
  r0_138:BlockAllUIInput(true)
end
function r9_0.RequestCompleteProduce(r0_139, r1_139)
  -- line: [1764, 1768] id: 139
  GWorld:GetAvatar():CompleteProduct(r1_139)
  r0_139:BlockAllUIInput(true)
end
function r9_0.OnStartProduce(r0_140, r1_140, r2_140)
  -- line: [1770, 1778] id: 140
  if not ErrorCode:Check(r2_140) then
    r0_140:BlockAllUIInput(false)
    return 
  end
  r2_0:OnDraftStartProduce(r1_140)
  r0_140:RefreshItemsView()
  r0_140:BlockAllUIInput(false)
end
function r9_0.OnCompleteProduce(r0_141, r1_141, r2_141)
  -- line: [1780, 1789] id: 141
  if not ErrorCode:Check(r2_141) then
    r0_141:BlockAllUIInput(false)
    return 
  end
  r0_141:ShowCompleteProduceWindow(r1_141)
  r0_141:UpdateBatchCompleteButton()
  r0_141:BlockAllUIInput(false)
end
function r9_0.OnCancelProduce(r0_142, r1_142, r2_142, r3_142, r4_142)
  -- line: [1791, 1800] id: 142
  if not ErrorCode:Check(r2_142) then
    r0_142:BlockAllUIInput(false)
    return 
  end
  r2_0:OnDraftCancelProduce(r1_142)
  r0_142:RefreshItemsView()
  r0_142:ShowCancelProduceWindow(r1_142, r3_142, r4_142)
  r0_142:BlockAllUIInput(false)
end
function r9_0.OnBlueComplete(r0_143, r1_143)
  -- line: [1802, 1806] id: 143
  r0_143:RefreshItemsView()
  r0_143:UpdateBatchCompleteButton()
end
function r9_0.OnAccerateProduce(r0_144, r1_144, r2_144)
  -- line: [1808, 1816] id: 144
  if not ErrorCode:Check(r2_144) then
    r0_144:BlockAllUIInput(false)
    return 
  end
  r0_144:RefreshItemsView()
  r0_144:UpdateBatchCompleteButton()
  r0_144:BlockAllUIInput(false)
end
function r9_0.OnReturnKeyDown(r0_145)
  -- line: [1818, 1824] id: 145
  if r0_145.IsShowingDraftPathView then
    r0_145.Forging_Path_PC:OnBtnCloseClicked()
  else
    r0_145:OnClose()
  end
end
function r9_0.SwitchCamera(r0_146, r1_146)
  -- line: [1826, 1834] id: 146
  if GWorld:GetAvatar():CheckSubRegionType(nil, r1_0.SubRegionType.Home) then
    UIManager(r0_146):SwitchFixedCamera(r1_146, r7_0, "Forge", r0_146, "ForgeMain")
  else
    UIManager(r0_146):SwitchUINpcCamera(r1_146, "ForgeMain", r8_0, {
      bDestroyNpc = true,
      IsHaveInOutAnim = false,
    })
  end
end
function r9_0.OnClose(r0_147)
  -- line: [1838, 1878] id: 147
  if r0_147:IsAnimationPlaying(r0_147.In) then
    return 
  end
  if r0_147.IsClosing then
    return 
  end
  r0_147.IsClosing = true
  r0_147:PlayAnimation(r0_147.Out)
  UE4.UGameplayStatics.GetPlayerCharacter(r0_147, 0):SetActorHideTag("Forge", false)
  if GWorld:GetAvatar():CheckSubRegionType(nil, r1_0.SubRegionType.Home) then
    r0_147:SwitchCamera()
    local r4_147 = UE4.ANpcCharacter.GetNpc(r0_147, r7_0)
    if r4_147 then
      if r4_147.NPCNameWidgetComponent then
        local r5_147 = r4_147.NPCNameWidgetComponent:GetWidget()
        if r5_147 then
          r5_147:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
        end
      end
      if r4_147.BubbleWidgetComponent then
        local r5_147 = r4_147.BubbleWidgetComponent:GetWidget()
        if r5_147 then
          r5_147:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
        end
      end
      r4_147:PlayUITalkAction(21000202)
    end
  else
    r0_147:SwitchCamera()
  end
  AudioManager(r0_147):SetEventSoundParam(r0_147, "ForgeMainIn", {
    ToEnd = 1,
  })
  r2_0:ClearNewRedDots()
end
function r9_0.OnAnimationFinished(r0_148, r1_148)
  -- line: [1880, 1887] id: 148
  if r1_148 == r0_148.Out then
    local r3_148 = GWorld:GetAvatar():CheckSubRegionType(nil, r1_0.SubRegionType.Home)
    r0_148:Close()
  end
end
function r9_0.OnModFilterChanged(r0_149, r1_149, r2_149)
  -- line: [1889, 1898] id: 149
  r0_149.CommonFilterData = {
    FilterSelectedItems = r1_149,
    FilterItemDatas = r2_149,
  }
  if r0_149:GetCurrentTabType() == r3_0.TabType.Mod then
    r0_149:UpdateForgeContent()
  end
end
function r9_0.Close(r0_150)
  -- line: [1900, 1908] id: 150
  r0_150:RemoveDispatcher(EventID.OnStartProduce)
  r0_150:RemoveDispatcher(EventID.OnCompleteProduce)
  r0_150:RemoveDispatcher(EventID.OnAccerateProduce)
  r0_150:UnBindReddotTreeEvents()
  EventManager:FireEvent(EventID.OnMainUIReddotUpdate)
  r0_150.Super.Close(r0_150)
end
function r9_0.Destruct(r0_151)
  -- line: [1910, 1920] id: 151
  AudioManager(r0_151):StopSystemUIBGM("ForgeMain")
  r0_151.RemoveTimer(r0_151.RefreshTimer)
  local r1_151 = UE4.UGameplayStatics.GetPlayerCharacter(r0_151, 0)
  if r1_151 then
    r1_151:SetCanInteractiveTrigger(true)
  end
  r0_151:EnableTickWhenPaused(false)
  r0_151.Super.Destruct(r0_151)
end
function r9_0.ShowError(r0_152, r1_152)
  -- line: [1922, 1926] id: 152
  UE4.UGameplayStatics.GetGameInstance(r0_152):GetGameUIManager():ShowError(r1_152)
end
function r9_0.EnableTickWhenPaused(r0_153, r1_153)
  -- line: [1928, 1941] id: 153
  local r2_153 = UE4.ALTweenActor.GetLTweenInstance(r0_153:GetWorld())
  if r1_153 and r2_153 then
    r2_153:SetTickableWhenPaused(true)
  elseif r2_153 then
    r2_153:SetTickableWhenPaused(false)
  end
end
function r9_0.GetCurrentTabType(r0_154)
  -- line: [1943, 1946] id: 154
  return r0_154.TabIdx2TabType[r0_154.TabIndex]
end
function r9_0.GetCurrentSubTabType(r0_155)
  -- line: [1948, 1951] id: 155
  local r1_155 = r0_155.SubTabIndex
  if r1_155 then
    r1_155 = r0_155.TabIdx2SubTabType[r0_155.TabIndex][r0_155.SubTabIndex] and nil
  else
    goto label_10	-- block#2 is visited secondly
  end
  return r1_155
end
function r9_0.GetEntryFromItem(r0_156, r1_156)
  -- line: [1954, 1962] id: 156
  if r1_156 then
    return UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(r0_156.ForgeContent, r0_156.ForgeContent:GetIndexForItem(r1_156))
  end
  return nil
end
function r9_0.AddWidgetHiddenTag(r0_157, r1_157, r2_157, r3_157)
  -- line: [1966, 1983] id: 157
  r0_157.WidgetHiddenTags = r0_157.WidgetHiddenTags and {}
  if not r0_157.WidgetHiddenTags[r1_157] then
    r0_157.WidgetHiddenTags[r1_157] = {}
  end
  if r2_157 then
    r0_157.WidgetHiddenTags[r1_157][r3_157] = true
  else
    r0_157.WidgetHiddenTags[r1_157][r3_157] = nil
  end
  if next(r0_157.WidgetHiddenTags[r1_157]) then
    r1_157:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    r1_157:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end
function r9_0.OnCompendiumClicked(r0_158)
  -- line: [1985, 1987] id: 158
  local r1_158 = UIManager(r0_158):LoadUINew("ForgeCompenduim", r0_158:GetCurrentTabType())
end
AssembleComponents(r9_0)
return r9_0
