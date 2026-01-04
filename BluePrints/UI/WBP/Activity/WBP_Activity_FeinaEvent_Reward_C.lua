-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Activity\WBP_Activity_FeinaEvent_Reward_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("BluePrints.UI.UI_PC.Archive.WBP_Archive_Number_Model")
local r1_0 = Class("BluePrints.UI.BP_UIState_C")
function r1_0.Construct(r0_1)
  -- line: [16, 24] id: 1
  r0_1.Super.Construct(r0_1)
  r0_1:Init()
  if not ReddotManager.GetTreeNode("FeinaEventReward") then
    ReddotManager.AddNode("FeinaEventReward")
  end
  ReddotManager.AddListener("FeinaEventReward", r0_1, r0_1.RefreshBtnGetAll)
  r0_1.Btn_GetAll:SetVisibility(ESlateVisibility.Collapsed)
end
function r1_0.UpdateFeinaEventRewardReddot(r0_2)
  -- line: [26, 28] id: 2
  UIUtils.RefreshFeinaRewardReddot()
end
function r1_0.Destruct(r0_3)
  -- line: [33, 39] id: 3
  r0_3.Super.Destruct(r0_3)
  ReddotManager.RemoveListener("FeinaEventReward", r0_3)
  r0_3:ClearListenEvent()
  r0_3.List_Tab:ClearListItems()
  r0_3.List_Item:ClearListItems()
end
function r1_0.OnLoaded(r0_4, ...)
  -- line: [41, 67] id: 4
  local r2_4 = nil	-- notice: implicit variable refs by block#[0]
  local r1_4 = nil	-- notice: implicit variable refs by block#[0]
  r0_4.Super.OnLoaded(r0_4, ...)
  ... = ... -- error: untaken top expr
  r0_4.DataModel = r2_4
  r0_4.Type = r1_4
  r0_4.SelectIndex = nil
  r1_4 = r0_4.Type
  if r1_4 then
    r2_4 = r0_4.Type
    r1_4 = r0_4.Type2Index[r2_4]
    r0_4.SelectIndex = r1_4
  end
  r1_4 = r0_4.SelectIndex
  if not r1_4 then
    r0_4.SelectIndex = 1
  end
  r0_4.List_Item:SetControlScrollbarInside(true)
  r0_4.List_Tab:ScrollIndexIntoView(r0_4.SelectIndex + -1)
  r0_4:AddTimer(0.01, function()
    -- line: [53, 61] id: 5
    r0_4.List_Tab:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    local r0_5 = r0_4.List_Tab:GetItemAt(r0_4.SelectIndex + -1)
    r0_4.Btn_GetAll:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    if r0_5 then
      r0_5.Entry:OnCellClicked()
      r0_4.GameInputModeSubsystem:SetTargetUIFocusWidget(r0_5.Entry)
    end
  end, false, 0, "SelectRewardTab", true)
  r0_4:UpdateFeinaEventRewardReddot()
  r0_4:PlayAnimation(r0_4.In)
  r1_4 = CommonUtils.GetDeviceTypeByPlatformName(r0_4)
  if r1_4 == "Mobile" then
    r0_4.Key_Tip:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r1_0.Init(r0_6)
  -- line: [69, 81] id: 6
  r0_6:InitNormalInfo()
  r0_6:InitListTabInfo()
  r0_6:InitBtnInfo()
  r0_6.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(UE4.UGameplayStatics.GetPlayerController(r0_6, 0))
  if IsValid(r0_6.GameInputModeSubsystem) then
    r0_6:RefreshOpInfoByInputDevice(r0_6.GameInputModeSubsystem:GetCurrentInputType(), r0_6.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  r0_6:InitListenEvent()
  r0_6:InitWidgetInfoInGamePad()
end
function r1_0.InitNormalInfo(r0_7)
  -- line: [83, 85] id: 7
  r0_7.Btn_GetAll:SetText(GText("UI_Archive_CollectionClaimAll"))
end
function r1_0.InitBtnInfo(r0_8)
  -- line: [87, 91] id: 8
  r0_8.Btn_GetAll:BindEventOnClicked(r0_8, r0_8.GetAllRewards)
  r0_8.Btn_Close:Init("Close", r0_8, r0_8.OnClickClose)
  r0_8.Btn_Close.AudioEventPath = "event:/ui/common/click_btn_return"
end
function r1_0.InitListTabInfo(r0_9)
  -- line: [93, 118] id: 9
  r0_9.List_Tab.BP_OnItemSelectionChanged:Add(r0_9, r0_9.OnSelectItemChanged)
  r0_9.List_Tab:SetNavigationRuleCustom(EUINavigation.Right, {
    r0_9,
    r0_9.OnUINavigation
  })
  r0_9.List_Tab:SetVisibility(ESlateVisibility.HitTestInvisible)
  r0_9.List_Item:SetNavigationRuleCustom(EUINavigation.Left, {
    r0_9,
    r0_9.OnUINavigation
  })
  r0_9.List_Item:SetControlScrollbarInside(true)
  r0_9.Type2Index = {}
  local r1_9 = "/Game/UI/UI_PC/Common/Common_Item_subsize_PC_Content.Common_Item_subsize_PC_Content_C"
  r0_9.List_Tab:ClearListItems()
  for r6_9, r7_9 in ipairs(DataMgr.FeinaEvent) do
    local r8_9 = NewObject(UE4.LoadClass(r1_9))
    r8_9.Root = r0_9
    r8_9.TabIndex = r6_9
    r8_9.Type = r6_9
    r0_9.List_Tab:AddItem(r8_9)
    r0_9.Type2Index[r8_9.Type] = r6_9
  end
  -- close: r2_9
end
function r1_0.RefreshListRewardInfo(r0_10, r1_10)
  -- line: [120, 146] id: 10
  if r0_10.SelectedContent then
    r0_10.SelectedContent.Entry:UnSelected()
  end
  r0_10.Type = r1_10.Content.Type
  r0_10.SelectedContent = r1_10.Content
  r0_10.SelectedContent.Entry:Selected()
  r0_10:RealRefreshListRewardInfo(r0_10.SelectedContent.Type)
  if r0_10.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.MouseAndKeyboard then
    r0_10.List_Item:SetFocus()
  end
  r0_10:RemoveTimer(r0_10.FramingKey)
  r0_10.FramingKey = r0_10:AddTimer(0.01, function()
    -- line: [133, 145] id: 11
    r0_10.List_Item:SetScrollOffset(0)
    UIUtils.PlayListViewFramingInAnimation(r0_10, r0_10.List_Item, {
      AnimName = "In",
    })
    for r4_11 = 0, r0_10.List_Item:GetNumItems() + -1, 1 do
      local r5_11 = r0_10.List_Item:GetItemAt(r4_11)
      if r5_11 and r5_11.Entry then
        UIUtils.PlayListViewFramingInAnimation(r0_10, r5_11.Entry.List_Item, {
          AnimName = "In",
        })
      end
    end
  end, false, 0, nil, true)
end
function r1_0.RealRefreshListRewardInfo(r0_12, r1_12)
  -- line: [148, 153] id: 12
  r0_12:AddListReward(r1_12)
  r0_12:RefreshBtnGetAll()
end
function r1_0.AddListReward(r0_13, r1_13)
  -- line: [155, 167] id: 13
  local r2_13 = DataMgr.FeinaEvent[r1_13]
  local r3_13 = "/Game/UI/UI_PC/Common/Common_Item_subsize_PC_Content.Common_Item_subsize_PC_Content_C"
  r0_13.List_Item:ClearListItems()
  for r8_13, r9_13 in pairs(r2_13.DungeonId) do
    local r10_13 = NewObject(UE4.LoadClass(r3_13))
    r10_13.Root = r0_13
    r10_13.Index = r8_13
    r10_13.DungeonId = r9_13
    r10_13.Title = DataMgr.FeinaEventDungeon[r9_13].DungeonName
    r0_13.List_Item:AddItem(r10_13)
  end
  -- close: r4_13
end
function r1_0.TryGetAllRewards(r0_14)
  -- line: [180, 184] id: 14
  if r0_14.Btn_GetAll:GetVisibility() ~= UIConst.VisibilityOp.Collapsed then
    r0_14:GetAllRewards()
  end
end
function r1_0.GetAllRewards(r0_15)
  -- line: [186, 199] id: 15
  local r1_15 = GWorld:GetAvatar()
  if r1_15 then
    r1_15:GetAllFeiNaProgressRewerd(r0_15.Type2Index[r0_15.SelectedContent.Type], function(r0_16, r1_16)
      -- line: [189, 196] id: 16
      r0_15:RefreshItemState()
      r0_15:RefreshReddotInfo()
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, r1_16, false, function()
        -- line: [192, 194] id: 17
        r0_15:SetFocus()
      end, r0_15)
      EventManager:FireEvent(EventID.OnGetFeiNaReward)
    end)
  end
end
function r1_0.RefreshItemState(r0_18)
  -- line: [201, 214] id: 18
  local r1_18 = r0_18.List_Item:GetDisplayedEntryWidgets()
  for r5_18 = 1, r1_18:Length(), 1 do
    local r6_18 = r1_18:GetRef(r5_18)
    if r6_18 then
      local r7_18 = r6_18.List_Item:GetDisplayedEntryWidgets()
      for r11_18 = 1, r7_18:Length(), 1 do
        local r12_18 = r7_18:GetRef(r11_18)
        r12_18:RefreshState()
        r12_18:RefreshRewardsList()
      end
    end
  end
end
function r1_0.RefreshReddotInfo(r0_19)
  -- line: [216, 230] id: 19
  DebugPrint("Ljh Try RefreshReddotInfo")
  local r1_19 = ReddotManager.GetLeafNodeCacheDetail("FeinaEventReward")
  if r1_19[r0_19.SelectedContent.Type] then
    local r2_19 = 0
    for r7_19, r8_19 in pairs(r1_19[r0_19.SelectedContent.Type]) do
      for r13_19, r14_19 in pairs(r8_19) do
        r2_19 = r2_19 + 1
      end
      -- close: r9_19
    end
    -- close: r3_19
    r1_19[r0_19.SelectedContent.Type] = nil
    ReddotManager.DecreaseLeafNodeCount("FeinaEventReward", r2_19)
    DebugPrint("Ljh CacheDetail" .. tostring(r0_19.SelectedContent.Type) .. "Cleared,ClearedNums:" .. tostring(r2_19))
  end
end
function r1_0.RefreshBtnGetAll(r0_20)
  -- line: [232, 270] id: 20
  DebugPrint("Ljh Try RefreshBtnGetAll")
  if not r0_20.SelectedContent then
    r0_20.Btn_GetAll:SetVisibility(ESlateVisibility.Collapsed)
    return 
  end
  local r1_20 = ReddotManager.GetLeafNodeCacheDetail("FeinaEventReward")
  if r1_20 and r1_20[r0_20.SelectedContent.Type] then
    DebugPrint("Ljh CacheDetail Not Empty,Type:" .. tostring(r0_20.SelectedContent.Type))
    local r2_20 = r0_20.GameInputModeSubsystem:GetCurrentInputType()
    if r2_20 ~= ECommonInputType.Touch and r2_20 ~= ECommonInputType.MouseAndKeyboard then
      r0_20.Btn_GetAll:SetVisibility(ESlateVisibility.HitTestInvisible)
    else
      r0_20.Btn_GetAll:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      if CommonUtils.GetDeviceTypeByPlatformName(r0_20) ~= "Mobile" and r0_20.GameInputModeSubsystem:GetCurrentInputType() ~= ECommonInputType.Gamepad then
        r0_20.Key_Tip:UpdateKeyInfo({
          {
            KeyInfoList = {
              {
                Type = "Text",
                Text = "Space",
                bEnableEvent = true,
                ClickCallback = r0_20.TryGetAllRewards,
                Owner = r0_20,
              }
            },
            Desc = GText("UI_Archive_CollectionClaimAll"),
          },
          {
            KeyInfoList = {
              {
                Type = "Text",
                Text = "Esc",
                bEnableEvent = true,
                ClickCallback = r0_20.OnClickClose,
                Owner = r0_20,
              }
            },
            Desc = GText("UI_Tips_Close"),
          }
        })
      end
    end
  else
    if CommonUtils.GetDeviceTypeByPlatformName(r0_20) ~= "Mobile" and r0_20.GameInputModeSubsystem:GetCurrentInputType() ~= ECommonInputType.Gamepad then
      r0_20.Key_Tip:UpdateKeyInfo({
        {
          KeyInfoList = {
            {
              Type = "Text",
              Text = "Esc",
              bEnableEvent = true,
              ClickCallback = r0_20.OnClickClose,
              Owner = r0_20,
            }
          },
          Desc = GText("UI_Tips_Close"),
        }
      })
    end
    r0_20.Btn_GetAll:SetVisibility(ESlateVisibility.Collapsed)
  end
end
function r1_0.OnKeyDown(r0_21, r1_21, r2_21)
  -- line: [272, 302] id: 21
  local r3_21 = UE4.UKismetInputLibrary.GetKey(r2_21)
  local r4_21 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_21)
  local r5_21 = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_21) then
    if r4_21 == "Gamepad_FaceButton_Top" then
      r5_21 = true
      r0_21:TryGetAllRewards()
    elseif r4_21 == "Gamepad_FaceButton_Right" then
      r5_21 = true
      r0_21:OnReturnKeyDown()
    end
  elseif r4_21 == "Escape" then
    r5_21 = true
    r0_21:OnReturnKeyDown()
  elseif r4_21 == "SpaceBar" then
    r5_21 = true
    r0_21:TryGetAllRewards()
  end
  if r5_21 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end
function r1_0.OnPreviewKeyDown(r0_22, r1_22, r2_22)
  -- line: [305, 324] id: 22
  local r3_22 = UE4.UKismetInputLibrary.GetKey(r2_22)
  local r4_22 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_22)
  local r5_22 = false
  if not UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_22) then
    if r4_22 == "Escape" then
      r5_22 = true
      r0_22:OnReturnKeyDown()
    elseif r4_22 == "SpaceBar" then
      r5_22 = true
      r0_22:TryGetAllRewards()
    end
  end
  if r5_22 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end
function r1_0.OnReturnKeyDown(r0_23)
  -- line: [326, 329] id: 23
  r0_23:OnClickClose()
end
function r1_0.OnClickClose(r0_24)
  -- line: [331, 334] id: 24
  r0_24:Close()
end
function r1_0.InitListenEvent(r0_25)
  -- line: [336, 340] id: 25
  if IsValid(r0_25.GameInputModeSubsystem) then
    r0_25.GameInputModeSubsystem.OnInputMethodChanged:Add(r0_25, r0_25.RefreshOpInfoByInputDevice)
  end
end
function r1_0.ClearListenEvent(r0_26)
  -- line: [342, 346] id: 26
  if IsValid(r0_26.GameInputModeSubsystem) then
    r0_26.GameInputModeSubsystem.OnInputMethodChanged:Remove(r0_26, r0_26.RefreshOpInfoByInputDevice)
  end
end
function r1_0.RefreshOpInfoByInputDevice(r0_27, r1_27, r2_27)
  -- line: [348, 354] id: 27
  if r1_27 == ECommonInputType.Touch then
    return 
  end
  r0_27:UpdateUIStyleInPlatform(r1_27 == ECommonInputType.MouseAndKeyboard)
end
function r1_0.UpdateUIStyleInPlatform(r0_28, r1_28)
  -- line: [356, 362] id: 28
  if r1_28 then
    r0_28:InitKeyboardView()
  else
    r0_28:InitGamepadView()
  end
end
function r1_0.InitGamepadView(r0_29)
  -- line: [364, 404] id: 29
  if r0_29.Btn_GetAll:GetVisibility() == UE4.ESlateVisibility.SelfHitTestInvisible then
    r0_29.Btn_GetAll:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  end
  r0_29.Btn_Close:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  if CommonUtils.GetDeviceTypeByPlatformName(r0_29) ~= "Mobile" then
    r0_29.Key_Tip:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r0_29.Key_Tip:UpdateKeyInfo({
      {
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
          }
        },
        Desc = GText("UI_Tips_Close"),
      }
    })
  end
  for r6_29, r7_29 in pairs(r0_29.List_Item:GetDisplayedEntryWidgets()) do
    r7_29:InitGamepadView()
  end
  -- close: r2_29
  r0_29.IsInSelectState = false
  r0_29.Btn_GetAll:SetGamePadIconVisible(true)
  if r0_29.SelectedContent and UIUtils.HasAnyFocus(r0_29) then
    r0_29.List_Tab:BP_NavigateToItem(r0_29.SelectedContent)
  end
  r0_29:AddTimer(0.01, function()
    -- line: [391, 403] id: 30
    if r0_29.Type then
      r0_29.SelectIndex = r0_29.Type2Index[r0_29.Type]
    end
    if not r0_29.SelectIndex then
      r0_29.SelectIndex = 1
    end
    local r0_30 = r0_29.List_Tab:GetItemAt(r0_29.SelectIndex)
    if r0_30 and r0_30.Entry then
      r0_30.Entry:SetFocus()
    end
    r0_29.List_Tab:SetSelectedIndex(r0_29.SelectIndex)
  end, false, 0, nil, true)
end
function r1_0.InitKeyboardView(r0_31)
  -- line: [406, 425] id: 31
  if r0_31.Btn_GetAll:GetVisibility() == UE4.ESlateVisibility.HitTestInvisible then
    r0_31.Btn_GetAll:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  r0_31.Btn_Close:SetVisibility(UE4.ESlateVisibility.Visible)
  if CommonUtils.GetDeviceTypeByPlatformName(r0_31) ~= "Mobile" then
    r0_31.Key_Tip:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r0_31.Key_Tip:UpdateKeyInfo({
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            bEnableEvent = true,
            ClickCallback = r0_31.OnClickClose,
            Owner = r0_31,
          }
        },
        Desc = GText("UI_Tips_Close"),
      }
    })
  end
  for r6_31, r7_31 in pairs(r0_31.List_Item:GetDisplayedEntryWidgets()) do
    r7_31:InitKeyboardView()
  end
  -- close: r2_31
end
function r1_0.InitWidgetInfoInGamePad(r0_32)
  -- line: [427, 448] id: 32
  r0_32.Btn_GetAll:SetDefaultGamePadImg("Y")
end
function r1_0.OnSelectItemChanged(r0_33, r1_33)
  -- line: [450, 457] id: 33
  if not r1_33 then
    return 
  end
  if r0_33.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    r0_33:ClickListItemWhenSelectItemChanged(r1_33)
  end
end
function r1_0.ClickListItemWhenSelectItemChanged(r0_34, r1_34)
  -- line: [459, 463] id: 34
  if r1_34 and r1_34.Entry then
    r1_34.Entry:OnCellClicked()
  end
end
function r1_0.OnUINavigation(r0_35, r1_35)
  -- line: [465, 481] id: 35
  if r1_35 == EUINavigation.Left then
    r0_35:NavigateToLeftTab()
    return r0_35.SelectedContent.Entry
  elseif r1_35 == EUINavigation.Right then
    r0_35.List_Item:SetSelectedIndex(0)
    if CommonUtils.GetDeviceTypeByPlatformName(r0_35) ~= "Mobile" then
      r0_35.Key_Tip:UpdateKeyInfo({
        {
          KeyInfoList = {
            {
              Type = "Img",
              ImgShortPath = "B",
            }
          },
          Desc = GText("UI_Tips_Close"),
        }
      })
    end
    return r0_35:NavigateToFirstDisplayedItem(r0_35.List_Item)
  end
end
function r1_0.NavigateToLeftTab(r0_36, r1_36)
  -- line: [483, 499] id: 36
  if r0_36.CurFocusedRewardItem then
    r0_36.CurFocusedRewardItem:StopHover()
    r0_36.CurFocusedRewardItem = nil
  end
  if CommonUtils.GetDeviceTypeByPlatformName(r0_36) ~= "Mobile" then
    r0_36.Key_Tip:UpdateKeyInfo({
      {
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
          }
        },
        Desc = GText("UI_Tips_Close"),
      }
    })
  end
  if r1_36 then
    r0_36.SelectedContent.Entry:SetFocus()
  end
end
function r1_0.TryChangeCurFocusedRewardItem(r0_37, r1_37)
  -- line: [501, 507] id: 37
  if r0_37.CurFocusedRewardItem then
    r0_37.CurFocusedRewardItem:StopHover()
  end
  r0_37.CurFocusedRewardItem = r1_37
  r0_37.CurFocusedRewardItem:BeginHover()
end
function r1_0.NavigateToFirstDisplayedItem(r0_38, r1_38)
  -- line: [509, 528] id: 38
  local r2_38 = r1_38:GetDisplayedEntryWidgets()
  if r2_38:Length() > 0 then
    local r3_38 = nil
    for r7_38 = 1, r2_38:Length(), 1 do
      local r8_38 = r2_38:GetRef(r7_38)
      local r9_38 = r8_38.Content.Index
      if r9_38 and (not r3_38 or r9_38 < r3_38.Content.Index) then
        r3_38 = r8_38
      end
    end
    if r3_38 then
      r1_38:BP_NavigateToItem(r3_38.Content)
      return r3_38:NavigateToFirstDisplayedItem()
    end
  end
  return r1_38
end
function r1_0.NavigateToNextDisplayedItem(r0_39)
  -- line: [530, 547] id: 39
  local r2_39 = r0_39.List_Item:GetIndexForItem(r0_39.List_Item:BP_GetSelectedItem()) + 1
  local r3_39 = r0_39.List_Item:GetItemAt(r2_39)
  if r3_39 then
    r0_39.List_Item:SetSelectedIndex(r2_39)
    r0_39.List_Item:ScrollIndexIntoView(r2_39)
  end
  r0_39:AddTimer(0.01, function()
    -- line: [538, 542] id: 40
    if r3_39 then
      return r3_39.Entry:NavigateToFirstDisplayedItem()
    end
  end, false, 0, nil, true)
end
function r1_0.NavigateToPreviousDisplayedItem(r0_41)
  -- line: [549, 566] id: 41
  local r2_41 = r0_41.List_Item:GetIndexForItem(r0_41.List_Item:BP_GetSelectedItem()) + -1
  local r3_41 = r0_41.List_Item:GetItemAt(r2_41)
  if r3_41 then
    r0_41.List_Item:SetSelectedIndex(r2_41)
    r0_41.List_Item:ScrollIndexIntoView(r2_41)
  end
  r0_41:AddTimer(0.01, function()
    -- line: [557, 561] id: 42
    if r3_41 then
      return r3_41.Entry:NavigateToFirstDisplayedItem()
    end
  end, false, 0, nil, true)
end
function r1_0.OnMenuOpenChanged(r0_43, r1_43)
  -- line: [568, 577] id: 43
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    if r1_43 then
      r0_43:UpdateUIStyle(false)
    else
      r0_43:UpdateUIStyle(true)
    end
  end
end
function r1_0.UpdateUIStyle(r0_44, r1_44)
  -- line: [579, 607] id: 44
  if r1_44 then
    r0_44.CantGetAll = false
    if CommonUtils.GetDeviceTypeByPlatformName(r0_44) ~= "Mobile" then
      r0_44.Key_Tip:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  else
    r0_44.CantGetAll = true
    if CommonUtils.GetDeviceTypeByPlatformName(r0_44) ~= "Mobile" then
      r0_44.Key_Tip:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
end
function r1_0.BP_GetDesiredFocusTarget(r0_45)
  -- line: [609, 616] id: 45
  if r0_45.SelectedContent then
    r0_45.List_Tab:BP_NavigateToItem(r0_45.SelectedContent)
    return r0_45.SelectedContent.Entry
  else
    return r0_45.List_Tab
  end
end
return r1_0
