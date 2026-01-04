-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Common\ItemOptional\WBP_Bag_OptionalPropItem_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class("BluePrints.UI.BP_UIState_C")
function r0_0.Construct(r0_1)
  -- line: [13, 14] id: 1
end
function r0_0.Destruct(r0_2)
  -- line: [16, 17] id: 2
end
function r0_0.OnListItemObjectSet(r0_3, r1_3)
  -- line: [19, 22] id: 3
  r0_3:Init(r1_3)
  r0_3:InitListenEvent()
end
function r0_0.Init(r0_4, r1_4)
  -- line: [24, 45] id: 4
  if not r1_4.ItemType then
    return 
  end
  if not r0_4._components then
    if r1_4.ItemType == "ResourcePack" then
    end
    AssembleComponents(r0_4)
  end
  r0_4.ChooseCallback = r1_4.ChooseCallback
  r0_4.ParentWidget = r1_4.ParentWidget
  r0_4.ItemType = r1_4.ItemType
  r0_4.ChooseDataInfo = {
    ResourceId = r1_4.ResourceId,
    OptionalId = r1_4.OptionalId,
    ChooseId = r1_4.Id,
    ChooseIndex = r1_4.ChooseIndex,
    ChooseName = r1_4.Name,
    ConsumeCount = r1_4.ParentWidget.Id2ConsumeCount[r1_4.Id],
    ChooseWidget = r0_4,
  }
  r0_4.Content = r1_4
  r0_4.Count = r1_4.Count
  r0_4.ChooseId = r1_4.Id
  r0_4.OptCount = r1_4.OptCount
  r0_4.StuffCount = r1_4.StuffCount
  r0_4.MaxLimit = r1_4.OptCount - r1_4.ParentWidget.CurrentCount + r0_4.ChooseDataInfo.ConsumeCount
  r0_4:InitCommonView(r1_4)
end
function r0_0.InitListenEvent(r0_5)
  -- line: [47, 49] id: 5
  r0_5:AddDispatcher(EventID.OnUpdateNumInputLimit, r0_5, r0_5.UpdateNumInputLimit)
end
function r0_0.InitCommonView(r0_6, r1_6)
  -- line: [52, 78] id: 6
  r0_6.Text_Name:SetText(r1_6.Name)
  r0_6.Text_Hold:SetText(GText("UI_Bag_Sellconfirm_Hold"))
  r0_6.Text_Num:SetText(r0_6.StuffCount)
  local r2_6 = NewObject(UIUtils.GetCommonItemContentClass())
  r2_6.ParentWidget = r0_6
  r2_6.Id = r1_6.Id
  r2_6.Rarity = r1_6.Rarity
  r2_6.ItemType = CommonConst.DataType.Resource
  r2_6.Name = r1_6.Name
  r2_6.Count = r1_6.Count
  r2_6.IsShowDetails = true
  r2_6.Icon = r1_6.Icon
  r2_6.HandleMouseDown = true
  r2_6.OnMenuOpenChangedEvents = {
    Obj = r0_6,
    Callback = r0_6.OnMenuOpenChangedEvents,
  }
  r0_6.Item_Gift:Init(r2_6)
  r0_6:AddTimer(0.01, function()
    -- line: [71, 73] id: 7
    r0_6:InitComInput()
  end)
end
function r0_0.InitComInput(r0_8)
  -- line: [80, 110] id: 8
  if r0_8.bIsInited then
    r0_8.Com_NumInput:OverrideValueLimit(r0_8.ChooseDataInfo.ConsumeCount, r0_8.MaxLimit, 0, true)
    return 
  end
  r0_8.Com_NumInput:Init({
    MaxValue = r0_8.MaxLimit,
    MinValue = 0,
    InitValue = r0_8.ChooseDataInfo.ConsumeCount,
    MinusBtnCallback = r0_8.OnClickMinus,
    AddBtnCallback = r0_8.OnClickAdd,
    MinBtnCallback = r0_8.OnClickMin,
    MaxBtnCallback = r0_8.OnClickMax,
    EnableMiniBtn = true,
    EnableMaxBtn = true,
    IsNotAllowTextFieldInput = true,
    SoundResPath = {
      Minus = "event:/ui/common/click_btn_minus",
      Max = "event:/ui/common/click_btn_addMulti",
      Add = "event:/ui/common/click_btn_add",
      Mini = "event:/ui/common/click_btn_addMulti",
    },
    OwnerPanel = r0_8,
  })
  r0_8.Com_NumInput:SetIsForbidStyleUpdate(true)
  r0_8.Com_NumInput:UpdateUIStyleInPlatform(true)
  r0_8.bIsInited = true
end
function r0_0.OnClickMinus(r0_9, r1_9, r2_9)
  -- line: [112, 122] id: 9
  r0_9.ChooseDataInfo.ConsumeCount = r0_9.Com_NumInput.CurInputNumber
  if type(r0_9.ChooseCallback) == "function" then
    r0_9.ChooseCallback(r0_9.ParentWidget, true, r0_9.ChooseDataInfo)
  end
  r0_9.ParentWidget.CurrentCount = r0_9.ParentWidget.CurrentCount + r1_9 - r2_9
  r0_9.ParentWidget:RefreshDialogTip()
  r0_9.ParentWidget.Id2ConsumeCount[r0_9.ChooseId] = r0_9.ChooseDataInfo.ConsumeCount
  EventManager:FireEvent(EventID.OnUpdateNumInputLimit, r0_9.ChooseId, r0_9.OptCount - r0_9.ParentWidget.CurrentCount, 0, true)
end
function r0_0.OnClickAdd(r0_10, r1_10, r2_10)
  -- line: [124, 135] id: 10
  if r0_10.OptCount <= r0_10.ParentWidget.CurrentCount then
    return 
  end
  r0_10.ChooseDataInfo.ConsumeCount = r0_10.Com_NumInput.CurInputNumber
  if type(r0_10.ChooseCallback) == "function" then
    r0_10.ChooseCallback(r0_10.ParentWidget, true, r0_10.ChooseDataInfo)
  end
  r0_10.ParentWidget.CurrentCount = r0_10.ParentWidget.CurrentCount + r1_10 - r2_10
  r0_10.ParentWidget:RefreshDialogTip()
  r0_10.ParentWidget.Id2ConsumeCount[r0_10.ChooseId] = r0_10.ChooseDataInfo.ConsumeCount
  EventManager:FireEvent(EventID.OnUpdateNumInputLimit, r0_10.ChooseId, r0_10.OptCount - r0_10.ParentWidget.CurrentCount, 0, true)
end
function r0_0.OnClickMin(r0_11)
  -- line: [137, 149] id: 11
  local r1_11 = r0_11.ChooseDataInfo.ConsumeCount
  r0_11.Com_NumInput.CurInputNumber = 0
  r0_11.ChooseDataInfo.ConsumeCount = 0
  if type(r0_11.ChooseCallback) == "function" then
    r0_11.ChooseCallback(r0_11.ParentWidget, true, r0_11.ChooseDataInfo)
  end
  r0_11.ParentWidget.CurrentCount = r0_11.ParentWidget.CurrentCount - r1_11
  r0_11.ParentWidget:RefreshDialogTip()
  r0_11.ParentWidget.Id2ConsumeCount[r0_11.ChooseId] = r0_11.ChooseDataInfo.ConsumeCount
  EventManager:FireEvent(EventID.OnUpdateNumInputLimit, r0_11.ChooseId, r0_11.OptCount - r0_11.ParentWidget.CurrentCount, 0, true)
end
function r0_0.OnClickMax(r0_12)
  -- line: [151, 164] id: 12
  if r0_12.OptCount <= r0_12.ParentWidget.CurrentCount then
    return 
  end
  local r1_12 = r0_12.OptCount - r0_12.ParentWidget.CurrentCount + r0_12.ChooseDataInfo.ConsumeCount
  r0_12.Com_NumInput.CurInputNumber = r1_12
  r0_12.ChooseDataInfo.ConsumeCount = r1_12
  if type(r0_12.ChooseCallback) == "function" then
    r0_12.ChooseCallback(r0_12.ParentWidget, true, r0_12.ChooseDataInfo)
  end
  r0_12.ParentWidget.CurrentCount = r0_12.OptCount
  r0_12.ParentWidget:RefreshDialogTip()
  r0_12.ParentWidget.Id2ConsumeCount[r0_12.ChooseId] = r0_12.ChooseDataInfo.ConsumeCount
  EventManager:FireEvent(EventID.OnUpdateNumInputLimit, r0_12.ChooseId, r0_12.OptCount - r0_12.ParentWidget.CurrentCount, 0, true)
end
function r0_0.OnMenuOpenChangedEvents(r0_13, r1_13)
  -- line: [166, 174] id: 13
  r0_13.ParentWidget:OnMenuOpenChangedEvents(r1_13)
  if not r1_13 and r0_13.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    r0_13.Com_List:PlayAnimation(r0_13.Com_List.Hover)
  end
end
function r0_0.OnKeyDownEvent(r0_14, r1_14)
  -- line: [176, 179] id: 14
  return r0_14.Com_NumInput:Handle_KeyEventOnGamePad(r1_14)
end
function r0_0.UpdateNumInputLimit(r0_15, r1_15, r2_15, r3_15, r4_15)
  -- line: [181, 184] id: 15
  if r1_15 == r0_15.ChooseId then
    return 
  end
  r0_15.Com_NumInput:OverrideValueLimit(r0_15.ChooseDataInfo.ConsumeCount, r2_15 + r0_15.ChooseDataInfo.ConsumeCount, r3_15, r4_15)
end
function r0_0.OnFocusReceived(r0_16, r1_16, r2_16)
  -- line: [186, 195] id: 16
  if r0_16.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    r0_16.Com_List:PlayAnimation(r0_16.Com_List.Hover)
    r0_16.Com_NumInput:UpdateUIStyleInPlatform(false, r0_16.GameInputModeSubsystem:GetCurrentGamepadName())
    r0_16.ParentWidget.LastFocusWidget = r0_16
  end
  return true
end
function r0_0.OnFocusLost(r0_17, r1_17)
  -- line: [197, 200] id: 17
  r0_17.Com_List:PlayAnimation(r0_17.Com_List.UnHover)
  r0_17.Com_NumInput:UpdateUIStyleInPlatform(true)
end
return r0_0
