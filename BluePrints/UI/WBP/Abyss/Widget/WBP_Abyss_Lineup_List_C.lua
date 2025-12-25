-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Abyss\Widget\WBP_Abyss_Lineup_List_C.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})
r0_0._components = {
  "BluePrints.UI.UI_PC.Common.LSFocusComp"
}
function r0_0.Construct(r0_1)
  -- line: [8, 25] id: 1
  r0_1.bAllowRefreshList = true
  r0_1.Platform = CommonUtils.GetDeviceTypeByPlatformName(GWorld.GameInstance)
  r0_1.List_Select.BP_OnItemClicked:Clear()
  r0_1.List_Select.BP_OnEntryInitialized:Clear()
  r0_1.List_Select.BP_OnEntryInitialized:Add(r0_1, r0_1.OnListItemInited)
  r0_1.List_Select.BP_OnItemIsHoveredChanged:Add(r0_1, r0_1.OnItemIsHoverChanged)
  r0_1.EMListView_Filter.BP_OnItemClicked:Clear()
  r0_1.EMListView_Filter.BP_OnItemClicked:Add(r0_1, r0_1.OnFilterListItemClicked)
  r0_1.EMListView_Filter.BP_OnEntryInitialized:Clear()
  r0_1.EMListView_Filter.BP_OnEntryInitialized:Add(r0_1, r0_1.OnFilterListItemInited)
  r0_1.EMListView_Filter.BP_OnItemIsHoveredChanged:Clear()
  r0_1.EMListView_Filter.BP_OnItemIsHoveredChanged:Add(r0_1, r0_1.OnFilterListItemHovered)
  r0_1.Text_Empty:SetText(GText("UI_Armory_Pet_Empty"))
  r0_1:AddLSFocusTarget(nil, {
    r0_1.Sort
  })
  r0_1:InitKeyInfo()
  r0_1:RefreshBaseInfo()
end
function r0_0.Destruct(r0_2)
  -- line: [27, 35] id: 2
  r0_2.List_Select.BP_OnItemClicked:Clear()
  r0_2.List_Select.BP_OnEntryInitialized:Clear()
  r0_2.EMListView_Filter.BP_OnItemClicked:Clear()
  r0_2.EMListView_Filter.BP_OnEntryInitialized:Clear()
  if IsValid(r0_2.GameInputModeSubsystem) then
    r0_2.GameInputModeSubsystem.OnInputMethodChanged:Remove(r0_2, r0_2.RefreshOpInfoByInputDevice)
  end
end
function r0_0.IsMobile(r0_3)
  -- line: [37, 39] id: 3
  return r0_3.Platform == CommonConst.CLIENT_DEVICE_TYPE.MOBILE
end
function r0_0.InitKeyInfo(r0_4)
  -- line: [41, 85] id: 4
  if r0_4:IsMobile() then
    return 
  end
  r0_4.Key_L:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = "A",
      }
    },
  })
  r0_4.Key_R:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = "D",
      }
    },
  })
  r0_4.Key_Controller_L:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "LB",
      }
    },
  })
  r0_4.Key_Controller_R:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "RB",
      }
    },
  })
end
function r0_0.OnListItemInited(r0_5, r1_5, r2_5)
  -- line: [87, 91] id: 5
  if r0_5.Event_OnEntryInitialized then
    r0_5.Event_OnEntryInitialized(r0_5.EventReceiver, r1_5, r2_5)
  end
end
function r0_0.RefreshBaseInfo(r0_6)
  -- line: [93, 97] id: 6
  r0_6.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(UE4.UGameplayStatics.GetPlayerController(r0_6, 0))
end
function r0_0.OnUpdateUIStyleByInputTypeChange(r0_7, r1_7, r2_7)
  -- line: [99, 124] id: 7
  if r1_7 == ECommonInputType.Touch then
    r0_7.Switch_Mode_L:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_7.Switch_Mode_R:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_7.Sort.Controller:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return 
  else
    r0_7.Switch_Mode_L:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_7.Switch_Mode_R:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  if r1_7 == ECommonInputType.MouseAndKeyboard then
    r0_7.Switch_Mode_L:SetActiveWidgetIndex(0)
    r0_7.Switch_Mode_R:SetActiveWidgetIndex(0)
    r0_7.Sort.Controller:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    r0_7.Switch_Mode_L:SetActiveWidgetIndex(1)
    r0_7.Switch_Mode_R:SetActiveWidgetIndex(1)
    if not r0_7:IsInLSMode() then
      r0_7.Sort.Controller:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  end
end
function r0_0.OnListKeyUp(r0_8, r1_8, r2_8)
  -- line: [126, 130] id: 8
  return r0_8:OnKeyDownForLSComp(r1_8, r2_8)
end
function r0_0.Init(r0_9, r1_9, r2_9)
  -- line: [132, 196] id: 9
  r0_9.Parent = r1_9
  r0_9.Params = r2_9
  r0_9.Filters = r2_9.Filters and {}
  r0_9.FilterMod = r2_9.FilterMod and "Single"
  r0_9.FilterIdxes = {}
  r0_9.Type = r2_9.Type
  r0_9.SortType = r2_9.SortType
  r0_9.AllItemContents = r2_9.ItemContents
  r0_9.OrderByDisplayNames = r2_9.OrderByDisplayNames
  r0_9.EMListView_Filter:ClearListItems()
  r0_9.SelectedFilterContents = {}
  r0_9.FilteredContents = {}
  if r0_9.AllItemContents then
    for r7_9, r8_9 in ipairs(r0_9.AllItemContents) do
      table.insert(r0_9.FilteredContents, r8_9)
    end
    -- close: r3_9
  end
  r0_9.FilterContentObj_All = nil
  if #r0_9.Filters > 0 then
    r0_9.FilterContentObj_All = NewObject(UIUtils.GetCommonItemContentClass())
    r0_9.FilterContentObj_All.IsSelecte = true
    r0_9.FilterContentObj_All.Index = 0
    r0_9.FilterContentObj_All.Icon = "/Game/UI/Texture/Static/Atlas/Armory/T_Armory_Select.T_Armory_Select"
    r0_9.FilterContentObj_All.IsSelected = true
    r0_9.EMListView_Filter:AddItem(r0_9.FilterContentObj_All)
    r0_9.Tab_Sub:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    r0_9.Tab_Sub:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  r0_9.bAllowRefreshList = false
  for r7_9, r8_9 in ipairs(r0_9.Filters) do
    local r9_9 = NewObject(UIUtils.GetCommonItemContentClass())
    for r14_9, r15_9 in pairs(r8_9) do
      r9_9[r14_9] = r15_9
    end
    -- close: r10_9
    r9_9.Index = r7_9
    r0_9.EMListView_Filter:AddItem(r9_9)
  end
  -- close: r3_9
  r0_9.CurrentTabIdx = 0
  r0_9:AddTimer(0.2, function()
    -- line: [174, 176] id: 10
    r0_9.bAllowRefreshList = true
  end, false, 0, "DelaySetAllowRefreshList", true)
  r0_9.Sort:Init(r0_9.Parent, r0_9.OrderByDisplayNames, r0_9.SortType and CommonConst.DESC)
  r0_9.Sort:BindEventOnSelectionsChanged(r0_9, r0_9.OnSortListSelectionsChanged)
  r0_9.Sort:BindEventOnSortTypeChanged(r0_9, r0_9.OnSortTypeChanged)
  r0_9.Sort.Controller:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if IsValid(r0_9.Sort.GameInputModeSubsystem) then
    r0_9.GameInputModeSubsystem.OnInputMethodChanged:Remove(r0_9.Sort, r0_9.Sort.RefreshOpInfoByInputDevice)
  end
  r0_9:FillListView()
  r0_9:OnSortTypeChanged()
  r0_9:SetEmptyText(r0_9.Type)
end
local r1_0 = {
  CommonConst.ArmoryTag.Melee,
  CommonConst.ArmoryTag.Ranged
}
function r0_0.SetEmptyText(r0_11, r1_11)
  -- line: [200, 210] id: 11
  for r6_11, r7_11 in pairs(r1_0) do
    if r1_11 == r7_11 then
      r1_11 = CommonConst.ArmoryType.Weapon
      break
    end
  end
  -- close: r2_11
  if r1_11 and r1_11 ~= "" then
    r0_11.Text_Empty:SetText(GText("UI_Armory_" .. r1_11 .. "_Empty"))
  end
end
function r0_0.BindEvents(r0_12, r1_12, r2_12)
  -- line: [212, 219] id: 12
  r0_12.EventReceiver = r1_12
  r0_12.Event_SortFuncion = r2_12.SortFuncion
  r0_12.Event_FilterFunction = r2_12.FilterFunction
  r0_12.Event_OnListItemInited = r2_12.OnListItemInited
  r0_12.Event_OnEntryInitialized = r2_12.OnEntryInitialized
  r0_12.Event_OnItemIsHoverChanged = r2_12.OnItemIsHoverChanged
end
function r0_0.SetSortWidgetFocus(r0_13)
  -- line: [221, 223] id: 13
  r0_13.Sort:SetFocus()
end
function r0_0.OnItemIsHoverChanged(r0_14, r1_14, r2_14)
  -- line: [225, 229] id: 14
  if r0_14.Event_OnItemIsHoverChanged then
    r0_14.Event_OnItemIsHoverChanged(r0_14.EventReceiver, r1_14, r2_14)
  end
end
function r0_0.OnFilterListItemClicked(r0_15, r1_15)
  -- line: [232, 267] id: 15
  if r0_15.FilterMod == "Single" then
    if r1_15.IsSelected then
      return 
    end
    for r6_15, r7_15 in pairs(r0_15.SelectedFilterContents) do
      if r7_15 ~= r1_15 then
        r0_15:SetFilterContentIsSelected(r7_15, false)
        r0_15.SelectedFilterContents[r6_15] = nil
      end
    end
    -- close: r2_15
    if r0_15.FilterContentObj_All ~= r1_15 then
      r0_15:SetFilterContentIsSelected(r0_15.FilterContentObj_All, false)
    end
    r0_15:SetFilterContentIsSelected(r1_15, true)
  end
  AudioManager(r0_15):PlayUISound(r0_15, "event:/ui/common/click_btn_sort_tab", nil, nil)
  r0_15:UpdateFilterInfos()
  local r2_15 = r0_15.FilterIdxes
  if r0_15.Event_FilterFunction then
    r0_15.FilteredContents = r0_15.Event_FilterFunction(r0_15.EventReceiver, r0_15.AllItemContents, r2_15) and {}
    if r0_15.Event_SortFuncion then
      local r3_15, r4_15 = r0_15.Sort:GetSortInfos()
      r0_15.Event_SortFuncion(r0_15.EventReceiver, r0_15.FilteredContents, r3_15, r4_15)
    end
    r0_15:FillListView()
  end
  if IsValid(r0_15.GameInputModeSubsystem) then
    r0_15.GameInputModeSubsystem:SetTargetUIFocusWidget(r1_15.UI)
    r0_15.GameInputModeSubsystem:UpdateCurrentFocusWidgetPos()
  end
  r0_15.CurrentTabIdx = r1_15.Index
end
function r0_0.OnFilterListItemHovered(r0_16, r1_16, r2_16)
  -- line: [269, 280] id: 16
  if r0_16.GameInputModeSubsystem:GetCurrentInputType() ~= ECommonInputType.Gamepad then
    return 
  end
  if not r0_16.bAllowRefreshList then
    return 
  end
  if not r2_16 then
    return 
  end
  r0_16:OnFilterListItemClicked(r1_16)
end
function r0_0.OnFilterListItemInited(r0_17, r1_17, r2_17)
  -- line: [282, 286] id: 17
  if r2_17 then
    r1_17.UI = r2_17
  end
end
function r0_0.SetCurrentTabItemFocus(r0_18)
  -- line: [288, 290] id: 18
  r0_18.EMListView_Filter:NavigateToIndex(r0_18.CurrentTabIdx)
end
function r0_0.SetFilterContentIsSelected(r0_19, r1_19, r2_19)
  -- line: [292, 300] id: 19
  r1_19.IsSelected = r2_19
  if r1_19.UI then
    r1_19.UI:SetIsSelected(r1_19.IsSelected)
  end
  if r1_19.Tag then
    r0_19.SelectedFilterContents[r1_19.Tag] = r1_19
  end
end
function r0_0.UpdateFilterInfos(r0_20)
  -- line: [302, 320] id: 20
  local r1_20 = {}
  local r2_20 = next(r0_20.SelectedFilterContents) ~= nil
  local r3_20 = r0_20.EMListView_Filter:GetListItems()
  local r4_20 = r3_20:Length()
  if r2_20 then
    for r8_20 = 2, r4_20, 1 do
      if r0_20.SelectedFilterContents[r3_20[r8_20].Tag] then
        table.insert(r1_20, r3_20[r8_20].Index)
      end
    end
  else
    for r8_20 = 2, r4_20, 1 do
      table.insert(r1_20, r3_20[r8_20].Index)
    end
  end
  r0_20.FilterIdxes = r1_20
  return r0_20.FilterIdxes
end
function r0_0.OnSortListSelectionsChanged(r0_21)
  -- line: [323, 329] id: 21
  local r1_21, r2_21 = r0_21.Sort:GetSortInfos()
  if r0_21.Event_SortFuncion then
    r0_21.Event_SortFuncion(r0_21.EventReceiver, r0_21.FilteredContents, r1_21, r2_21)
    r0_21:FillListView()
  end
end
function r0_0.OnSortTypeChanged(r0_22)
  -- line: [332, 338] id: 22
  local r1_22, r2_22 = r0_22.Sort:GetSortInfos()
  if r0_22.Event_SortFuncion then
    r0_22.Event_SortFuncion(r0_22.EventReceiver, r0_22.FilteredContents, r1_22, r2_22)
    r0_22:FillListView()
  end
end
function r0_0.FillListView(r0_23)
  -- line: [340, 376] id: 23
  r0_23:PlayAnimation(r0_23.List_Change)
  r0_23:SetLastItemNavigationRule(true)
  r0_23.List_Select:ClearListItems()
  for r5_23, r6_23 in ipairs(r0_23.FilteredContents) do
    r0_23.List_Select:AddItem(r6_23)
  end
  -- close: r1_23
  local r1_23 = false
  if #r0_23.FilteredContents <= 0 then
    r0_23.List_Select:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_23.Empty:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r1_23 = true
  else
    r0_23.Empty:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_23.List_Select:SetVisibility(UIConst.VisibilityOp.Visible)
    r0_23:AddTimer(0.01, function()
      -- line: [355, 373] id: 24
      local r0_24 = r0_23.List_Select:GetDisplayedEntryWidgets()
      local r1_24, r2_24 = UIUtils.GetTileViewContentMaxCount(r0_23.List_Select, "XY")
      local r3_24 = r0_24:Length()
      local r4_24 = r1_24 * r2_24 - r3_24
      if r4_24 <= 0 then
        r4_24 = r1_24 - #r0_23.FilteredContents % r1_24
      end
      r0_23:FillEmptyItems(r4_24)
      r0_23.List_Select:RegenerateAllEntries()
      r0_23.List_Select:ScrollToTop()
      if r0_23.Event_OnListItemInited then
        r0_23.Event_OnListItemInited(r0_23.EventReceiver)
      end
      r0_23:AddTimer(0.01, function()
        -- line: [370, 372] id: 25
        r0_23:SetLastItemNavigationRule(false, r3_24)
      end, false, 0, "DelaySetNavigation", true)
    end, false, 0, "DelayAddEmptyItem", true)
  end
  r0_23.Parent:OnListInited(r1_23)
end
function r0_0.SetLastItemNavigationRule(r0_26, r1_26, r2_26)
  -- line: [379, 398] id: 26
  if r0_26:IsMobile() then
    return 
  end
  if r1_26 then
    if not r0_26.LastWidget then
      return 
    end
    r0_26.LastWidget:SetAllNavigationRules(EUINavigationRule.Escape, 0)
    r0_26.LastWidget = nil
  else
    local r3_26 = r0_26.List_Select:GetItemAt(r2_26 + -1)
    if not r3_26 or not r3_26.SelfWidget then
      return 
    end
    local r4_26 = r3_26.SelfWidget
    r4_26:SetNavigationRuleExplicit(EUINavigation.Right, r0_26.EMListView_Filter)
    r0_26.LastWidget = r4_26
  end
end
function r0_0.FillEmptyItems(r0_27, r1_27)
  -- line: [400, 404] id: 27
  for r5_27 = 1, r1_27, 1 do
    r0_27.List_Select:AddItem(NewObject(UIUtils.GetCommonItemContentClass()))
  end
end
function r0_0.ScrollItemIntoView(r0_28, r1_28)
  -- line: [406, 410] id: 28
  if r1_28 then
    r0_28.List_Select:BP_ScrollItemIntoView(r1_28)
  end
end
function r0_0.PlayInAnim(r0_29)
  -- line: [412, 417] id: 29
  AudioManager(r0_29):PlayUISound(r0_29, "event:/ui/common/sub_panel_expand", "Selective_Listing_In", nil)
  r0_29:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_29:StopAnimation(r0_29.Out)
  r0_29:PlayAnimation(r0_29.In)
end
function r0_0.PlayOutAnim(r0_30)
  -- line: [419, 424] id: 30
  AudioManager(r0_30):PlayUISound(r0_30, "event:/ui/common/sub_panel_expand", "Selective_Listing_In", {
    ToEnd = 1,
  })
  r0_30:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  r0_30:StopAnimation(r0_30.In)
  r0_30:PlayAnimation(r0_30.Out)
end
function r0_0.Destruct(r0_31)
  -- line: [426, 432] id: 31
  if AudioManager(r0_31):IsSoundPlaying(r0_31, "Selective_Listing_In") then
    AudioManager(r0_31):SetEventSoundParam(r0_31, "Selective_Listing_In", {
      ToEnd = 1,
    })
  end
  r0_31:RemoveTimer("DelayAddEmptyItem")
  r0_31:RemoveTimer("DelaySetNavigation")
end
AssembleComponents(r0_0)
return r0_0
