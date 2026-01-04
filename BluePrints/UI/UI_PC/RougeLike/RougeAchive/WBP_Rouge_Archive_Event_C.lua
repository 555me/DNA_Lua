-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\UI_PC\RougeLike\RougeAchive\WBP_Rouge_Archive_Event_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("BluePrints.UI.UI_PC.RougeLike.RougeAchive.RougeConst")
local r1_0 = require("BluePrints.UI.Reddot.ReddotManager")
local r2_0 = Class({
  "BluePrints.UI.BP_UIState_C"
})
local r3_0 = FVector2D(0, 0)
local r4_0 = FVector2D(278, 545)
local r5_0 = 1.7777777777777777
function r2_0.Construct(r0_1)
  -- line: [19, 34] id: 1
  r2_0.Super.Construct(r0_1)
  r0_1.List_Item.OnListViewScrolled:Add(r0_1, r0_1._OnListItemScrolled)
  r0_1.List_Item.OnMouseButtonUp:Add(r0_1, r0_1.OnListItemReleased)
  r0_1.PlatformName = CommonUtils.GetDeviceTypeByPlatformName(r0_1)
  r0_1.List_Item:ClearListItems()
  r0_1._bListEntryInitialized = false
  r0_1._bMoveOff = false
  r0_1.CurSelectIndex = nil
  r0_1.CurSelectItem = nil
  r0_1._ApplyEntryTimer = nil
  r0_1.CenterPadding = 0
  r0_1.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(UE4.UGameplayStatics.GetPlayerController(r0_1, 0))
end
function r2_0.OnListItemReleased(r0_2)
  -- line: [60, 68] id: 2
  if math.abs(r0_2.List_Item:GetScrollOffset() + r0_2.CenterPadding - r0_2.CurSelectIndex + r0_2.List_Item:GetFullFillItemCount()) < 1 then
    r0_2:SelectItem(r0_2.CurSelectIndex, true)
  end
end
function r2_0._CalcEntryScale(r0_3, r1_3, r2_3)
  -- line: [70, 100] id: 3
  local r3_3 = r0_3.List_Item:GetFullFillItemCount()
  local r4_3 = r1_3.Index - r2_3 - r3_3
  if math.ceil(r3_3 / 2) < math.abs(r1_3.Index - r0_3.CurSelectIndex) then
    if r0_3.CurSelectIndex < r1_3.Index then
      r4_3 = r1_3.Index - r0_3.MaxNum - r2_3 - r3_3
    elseif r1_3.Index < r0_3.CurSelectIndex then
      r4_3 = r1_3.Index + r0_3.MaxNum - r2_3 - r3_3
    end
  end
  local r5_3 = (r3_3 + -1) / 2
  local r6_3 = UE4.UWidgetLayoutLibrary.GetViewportSize(r0_3)
  local r7_3 = r6_3.X / r6_3.Y
  local r8_3 = 1
  if r4_3 <= r5_3 then
    r8_3 = r4_3 * 1 / r3_3 * 1.4 + 1
  elseif r5_3 < r4_3 then
    r8_3 = r4_3 * -1 / r3_3 * 1.4 + 1.61 - r7_3 / r5_0 * 0.1
  end
  if r8_3 < 1 then
    r8_3 = 1
  end
  return r8_3
end
function r2_0._ApplyEntryScale(r0_4, r1_4)
  -- line: [102, 116] id: 4
  if not r1_4 then
    r1_4 = r0_4.List_Item:GetScrollOffset()
  end
  for r6_4, r7_4 in pairs(r0_4.List_Item:GetDisplayedEntryWidgets()) do
    local r8_4 = r0_4:_CalcEntryScale(r7_4, r1_4)
    r3_0.X = r8_4
    r3_0.Y = r8_4
    r7_4.Group_Item:SetRenderScale(r3_0)
    UWidgetLayoutLibrary.SlotAsCanvasSlot(r7_4.Group_Item):SetSize(FVector2D(r4_0.X * r8_4, r4_0.Y))
  end
  -- close: r2_4
end
function r2_0._OnListItemScrolled(r0_5, r1_5, r2_5)
  -- line: [118, 139] id: 5
  local r3_5 = false
  if not r0_5._ApplyEntryTimer then
    local r4_5, r5_5 = r0_5:AddTimer(0.03, r0_5._ApplyEntryScale, true, 0, nil, true)
    r0_5._ApplyEntryTimer = r5_5
    r3_5 = true
  end
  if r0_5.bSelecting then
    return 
  end
  if not r0_5.CenterPadding then
    return 
  end
  local r5_5 = r0_5.CurSelectIndex + r0_5.List_Item:GetFullFillItemCount()
  local r6_5 = r1_5 + r0_5.CenterPadding
  local r7_5 = math.abs(r6_5 - r5_5)
  if r7_5 >= 1 then
    if r5_5 < r6_5 then
      if r3_5 then
        r7_5 = 0 and 1
      else
        goto label_45	-- block#10 is visited secondly
      end
      r0_5:SelectItem(r0_5.CurSelectIndex + r7_5)
    else
      r0_5:SelectItem(r0_5.CurSelectIndex + -1)
    end
  end
end
function r2_0.Destruct(r0_6)
  -- line: [141, 150] id: 6
  r2_0.Super.Destruct(r0_6)
  if r0_6._ApplyEntryTimer then
    r0_6:RemoveTimer(r0_6._ApplyEntryTimer)
    r0_6._ApplyEntryTimer = nil
  end
  r0_6.CenterPadding = 0
  r0_6.List_Item.OnMouseButtonUp:Clear()
  r0_6.List_Item.OnListViewScrolled:Clear()
end
function r2_0.InitUIInfo(r0_7, r1_7, r2_7)
  -- line: [159, 181] id: 7
  r0_7.CenterPadding = 0
  r0_7.bGamepadReady = false
  r0_7.DataModel = r2_7
  r0_7:InitReddot()
  r0_7:Construct()
  r0_7:InitTab()
  r0_7.EventInfo = r1_7
  r0_7:ResortEventData(r0_7.EventInfo)
  r0_7:InitEventItems()
  r0_7:InitBtns()
  AudioManager(r0_7):PlayUISound(r0_7, "event:/ui/armory/open", "SwitchArchiveEvent", nil)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    r0_7:InitGamepadView()
    r0_7:AddTimer(r0_7.In:GetEndTime() * 1.8, function()
      -- line: [175, 178] id: 8
      r0_7.List_Item:SetFocus()
      r0_7.bGamepadReady = true
    end)
  end
  r0_7:AddInputMethodChangedListen()
end
function r2_0.InitReddot(r0_9)
  -- line: [182, 184] id: 9
  r1_0.AddListener("RougeArchiveReward", r0_9, r0_9.OnArchiveRewardReddotChange)
end
function r2_0.OnArchiveRewardReddotChange(r0_10, r1_10)
  -- line: [186, 193] id: 10
  DebugPrint("Tianyi@ OnArchiveRewardReddotChange", r1_10)
  local r2_10 = r1_0.GetLeafNodeCacheDetail("RougeArchiveReward")
  if r2_10[r0_0.ArchiveType.Event] then
    r1_10 = #r2_10[r0_0.ArchiveType.Event]
  end
  r0_10.ArchiveRewardBtn:SetReddot(r1_10 > 0)
end
function r2_0.InitTab(r0_11)
  -- line: [196, 213] id: 11
  r0_11.Root:InitOtherPageTab({
    PlatformName = r0_11.PlatformName,
    TitleName = GText("RLArchive_EventTitle"),
    DynamicNode = {
      "Back",
      "BottomKey"
    },
    StyleName = "Text",
    OwnerPanel = r0_11,
    BackCallback = r0_11.OnReturnKeyDown,
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = r0_11.OnReturnKeyDown,
            Owner = r0_11,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = r0_11.OnReturnKeyDown,
            Owner = r0_11,
          }
        },
        Desc = GText("UI_BACK"),
        bLongPress = false,
      }
    },
  }, nil, true, r0_11, nil)
end
function r2_0.ResortEventData(r0_12, r1_12)
  -- line: [215, 284] id: 12
  r0_12.SeriesList = {}
  for r6_12, r7_12 in pairs(DataMgr.RLRoomStorySeries) do
    if r7_12.RLArchiveType == 1 then
      if not r0_12.SeriesList[r7_12.RLArchiveSeriesId] then
        r0_12.SeriesList[r7_12.RLArchiveSeriesId] = {}
      end
      r0_12.SeriesList[r7_12.RLArchiveSeriesId].Data = r7_12
    end
  end
  -- close: r2_12
  for r6_12, r7_12 in pairs(r1_12.Data) do
    if r7_12.IsUnlocked then
      r0_12.SeriesList[r7_12.Data.RLArchiveSeriesId].IsUnlocked = true
      r0_12.SeriesList[r7_12.Data.RLArchiveSeriesId].UnlockNum = (r0_12.SeriesList[r7_12.Data.RLArchiveSeriesId].UnlockNum and 0) + 1
    end
    r0_12.SeriesList[r7_12.Data.RLArchiveSeriesId].TotalNum = (r0_12.SeriesList[r7_12.Data.RLArchiveSeriesId].TotalNum and 0) + 1
    r0_12.SeriesList[r7_12.Data.RLArchiveSeriesId].IsNew = r7_12.IsNew
    if not r0_12.SeriesList[r7_12.Data.RLArchiveSeriesId].SubItems then
      r0_12.SeriesList[r7_12.Data.RLArchiveSeriesId].SubItems = {}
    end
    local r8_12 = r7_12.Data.RLArchiveSubId
    local r9_12 = nil
    for r14_12, r15_12 in pairs(DataMgr.RougeLikeRoom) do
      if r15_12.RLArchiveSubId == r8_12 then
        r9_12 = r15_12.RoomId
      end
    end
    -- close: r10_12
    local r10_12 = table.insert
    local r11_12 = r0_12.SeriesList[r7_12.Data.RLArchiveSeriesId].SubItems
    local r12_12 = {
      EventId = r9_12,
      ArchiveId = r7_12.Data.RLArchiveSubId,
      IsUnlocked = r7_12.IsUnlocked,
      IsNew = r7_12.IsNew,
      Name = r7_12.Data.Name and r7_12.Data.EventName,
      RLArchiveSubIdSort = r7_12.Data.RLArchiveSubIdSort,
    }
    r10_12(r11_12, r12_12)
    r10_12 = {}
    for r15_12, r16_12 in pairs(r0_12.SeriesList[r7_12.Data.RLArchiveSeriesId].SubItems) do
      table.insert(r10_12, r16_12)
    end
    -- close: r11_12
    table.sort(r10_12, function(r0_13, r1_13)
      -- line: [260, 260] id: 13
      return r0_13.RLArchiveSubIdSort < r1_13.RLArchiveSubIdSort
    end)
    r0_12.SeriesList[r7_12.Data.RLArchiveSeriesId].SubItems = r10_12
  end
  -- close: r2_12
  local r2_12 = {}
  for r7_12, r8_12 in pairs(r0_12.SeriesList) do
    r8_12.Id = r7_12
    table.insert(r2_12, r8_12)
  end
  -- close: r3_12
  table.sort(r2_12, function(r0_14, r1_14)
    -- line: [269, 269] id: 14
    return r0_14.Id < r1_14.Id
  end)
  r0_12.SeriesList = r2_12
  local r3_12 = nil
  for r8_12, r9_12 in ipairs(r0_12.SeriesList) do
    if r9_12.IsUnlocked and not r3_12 then
      r3_12 = r8_12 + -1
    end
  end
  -- close: r4_12
  if not r3_12 then
    r3_12 = 0
  end
  r0_12.CurSelectIndex = r3_12
  r0_12.MaxNum = #r0_12.SeriesList
end
function r2_0.InitEventItems(r0_15)
  -- line: [286, 310] id: 15
  for r5_15, r6_15 in ipairs(r0_15.SeriesList) do
    local r7_15 = NewObject(UIUtils.GetCommonItemContentClass())
    r7_15.IsUnlocked = r6_15.IsUnlocked
    r7_15.IsNew = r6_15.IsNew
    r7_15.Index = r5_15 + -1
    r7_15.Data = r6_15
    r7_15.SubItems = r6_15.SubItems
    r7_15.UnlockNum = r6_15.UnlockNum and 0
    r7_15.TotalNum = r6_15.TotalNum and 0
    r7_15.Parent = r0_15
    r0_15.List_Item:AddItem(r7_15)
  end
  -- close: r1_15
  r0_15.List_Item:SetIsEnableScrollAnimation(false)
  r0_15.List_Item:RequestLoopListInit()
  r0_15.List_Item:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  r0_15:AddTimer(r0_15.In:GetEndTime() * 0.5, function()
    -- line: [303, 309] id: 16
    r0_15.List_Item:SetVisibility(UIConst.VisibilityOp.Visible)
    r0_15.List_Item:SetIsEnableScrollAnimation(true)
    r0_15:_CalcCenterPadding()
    r0_15:SelectItem(r0_15.CurSelectIndex, true)
  end)
end
function r2_0.InitBtns(r0_17)
  -- line: [312, 329] id: 17
  r0_17.Btn_Left.Btn.OnClicked:Add(r0_17, r0_17.SwitchLeft)
  r0_17.Btn_Right.Btn.OnClicked:Add(r0_17, r0_17.SwitchRight)
  r0_17.Btn_Click.Group_PriceBG:SetVisibility(ESlateVisibility.Collapsed)
  r0_17.Btn_Click.Panel_Group_Currency:SetVisibility(ESlateVisibility.Collapsed)
  r0_17.Btn_Click.Text_BtnTitle:SetText(GText("UI_RLArchiveTitle_Review"))
  r0_17.Btn_Click.Btn_Click.OnClicked:Add(r0_17, function()
    -- line: [318, 321] id: 18
    r0_17:OpenItem()
    AudioManager(r0_17):PlayUISound(r0_17, "event:/ui/roguelike/confirm_btn_click", nil, nil)
  end)
  r0_17.Btn_Click.Btn_Click.OnHovered:Add(r0_17, function()
    -- line: [322, 324] id: 19
    AudioManager(r0_17):PlayUISound(r0_17, "event:/ui/roguelike/confirm_btn_hover", nil, nil)
  end)
  r0_17.Btn_Click.Key_GamePad:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "A",
      }
    },
  })
  r0_17.ArchiveRewardBtn.Btn_Collect.OnClicked:Add(r0_17, r0_17.OpenReward)
  r0_17.ArchiveRewardBtn:InitView(r0_17.DataModel)
  r0_17.ArchiveRewardBtn:SetItemNum(r0_0.ArchiveType.Event)
end
function r2_0.OnAnalogValueChanged(r0_20, r1_20, r2_20)
  -- line: [332, 352] id: 20
  if not r0_20.bGamepadReady then
    return UIUtils.Unhandle
  end
  if UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_20)) == "Gamepad_LeftX" then
    local r5_20 = UKismetInputLibrary.GetAnalogValue(r2_20)
    DebugPrint(LXYTag, "AnalogValue ", r5_20, r0_20._bMoveOff)
    if 0.9 < r5_20 and r0_20._bMoveOff == false then
      r0_20:SwitchRight()
      r0_20._bMoveOff = true
    elseif r5_20 < -0.9 and r0_20._bMoveOff == false then
      r0_20:SwitchLeft()
      r0_20._bMoveOff = true
    elseif math.abs(r5_20) < 0.5 and r0_20._bMoveOff then
      r0_20._bMoveOff = false
    end
    return UIUtils.Handled
  end
  return UIUtils.Unhandle
end
function r2_0.SwitchLeft(r0_21)
  -- line: [354, 363] id: 21
  local r1_21 = r0_21.CurSelectIndex
  if r1_21 == 0 then
    r1_21 = r0_21.MaxNum
  end
  if r1_21 > 0 then
    r0_21:SelectItem(r1_21 + -1, true)
    AudioManager(r0_21):PlayUISound(r0_21, "event:/ui/common/click_mid", nil, nil)
  end
end
function r2_0.SwitchRight(r0_22)
  -- line: [365, 374] id: 22
  local r1_22 = r0_22.CurSelectIndex
  if r1_22 == r0_22.MaxNum + -1 then
    r1_22 = -1
  end
  if r1_22 < r0_22.MaxNum + -1 then
    r0_22:SelectItem(r1_22 + 1, true)
    AudioManager(r0_22):PlayUISound(r0_22, "event:/ui/common/click_mid", nil, nil)
  end
end
function r2_0._CalcCenterPadding(r0_23)
  -- line: [376, 385] id: 23
  r0_23.CenterPadding = 0
  local r1_23 = UIManager():GetWidgetRenderSize(r0_23.List_Item).X
  local r3_23 = UIManager():GetWidgetRenderSize(r0_23.List_Item:GetDisplayedEntryWidgets():GetRef(1)).X
  local r4_23 = UE4.UWidgetLayoutLibrary.GetViewportSize(r0_23)
  local r5_23 = r4_23.X / r4_23.Y
  DebugPrint("WBP_Rougelike_Archive_Event_P_C,,_CalcCenterPadding ", r5_23 / r5_0)
  r0_23.CenterPadding = r1_23 / r3_23 / 2 - 0.4 - r5_23 / r5_0 * 0.4
end
function r2_0.SelectItem(r0_24, r1_24, r2_24)
  -- line: [398, 419] id: 24
  r0_24.bSelecting = true
  local r3_24 = r0_24.List_Item:GetFullFillItemCount()
  local r4_24 = r1_24 + r3_24
  if r3_24 < math.abs(r0_24.CurSelectIndex - r1_24) then
    if r1_24 < r0_24.CurSelectIndex then
      r0_24.List_Item:SetCurrentScrollOffset(r0_24.CurSelectIndex - r0_24.MaxNum + r3_24 - r0_24.CenterPadding)
    elseif r0_24.CurSelectIndex < r1_24 then
      r0_24.List_Item:SetCurrentScrollOffset(r0_24.CurSelectIndex + r0_24.MaxNum + r3_24 - r0_24.CenterPadding)
    end
    r0_24:_InnerSelectItem(r1_24, r4_24)
  else
    r0_24:_InnerSelectItem(r1_24, r4_24)
  end
end
function r2_0._InnerSelectItem(r0_25, r1_25, r2_25)
  -- line: [439, 447] id: 25
  r0_25.List_Item:SetSelectedIndex(r2_25)
  r0_25.List_Item:SetScrollOffset(r2_25 - r0_25.CenterPadding)
  r0_25.CurSelectItem = r0_25.List_Item:GetItemAt(r2_25)
  r0_25.CurSelectIndex = r1_25
  r0_25.Btn_Click.Btn_Click:SetForbidden(not r0_25.CurSelectItem.IsUnlocked)
  r0_25.bSelecting = false
end
function r2_0.ChooseItem(r0_26, r1_26, r2_26)
  -- line: [449, 458] id: 26
  if r0_26.CurSelectIndex ~= r1_26 then
    r0_26:AddTimer(0.5, function()
      -- line: [451, 453] id: 27
      r0_26:OpenItem()
    end)
  else
    r0_26:OpenItem()
  end
  r0_26:SelectItem(r1_26)
end
function r2_0.OpenItem(r0_28)
  -- line: [460, 480] id: 28
  if not r0_28.CurSelectItem then
    return 
  end
  if not r0_28.CurSelectItem.IsUnlocked then
    UIManager(r0_28):ShowUITip(UIConst.Tip_CommonTop, GText("RLArchive_EventUnlock"))
    return 
  end
  local r1_28 = nil
  for r6_28, r7_28 in ipairs(r0_28.CurSelectItem.SubItems) do
    if r7_28.IsUnlocked and not r1_28 then
      r1_28 = r7_28.EventId
      break
    end
  end
  -- close: r2_28
  UIManager(r0_28):LoadUINew("Rouge_Event_Main", {
    r1_28,
    nil,
    r0_28.CurSelectItem.SubItems
  })
end
function r2_0.RefreshOpInfoByInputDevice(r0_29, r1_29, r2_29)
  -- line: [482, 490] id: 29
  DebugPrint("@zyh OnUpdateUIStyleByInputTypeChange")
  r0_29.Super.RefreshOpInfoByInputDevice(r0_29, r1_29, r2_29)
  if r1_29 == UE4.ECommonInputType.Gamepad then
    r0_29:InitGamepadView()
  else
    r0_29:InitKeyboardView()
  end
end
function r2_0.InitGamepadView(r0_30)
  -- line: [492, 498] id: 30
  if UIUtils.HasAnyFocus(r0_30.Root) then
    r0_30.List_Item:SetFocus()
  end
  r0_30.Btn_Click.Key_GamePad:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_30.Btn_Click.ImageSlot:SetVisibility(UIConst.VisibilityOp.Collapsed)
end
function r2_0.InitKeyboardView(r0_31)
  -- line: [500, 503] id: 31
  r0_31.Btn_Click.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_31.Btn_Click.ImageSlot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end
function r2_0.OnReturnKeyDown(r0_32)
  -- line: [505, 517] id: 32
  r0_32.Btn_Left.Btn.OnClicked:Clear()
  r0_32.Btn_Right.Btn.OnClicked:Clear()
  r0_32.Btn_Click.Btn_Click.OnClicked:Clear()
  r0_32.ArchiveRewardBtn.Btn_Collect.OnClicked:Clear()
  AudioManager(r0_32):SetEventSoundParam(r0_32, "SwitchArchiveEvent", {
    ToEnd = 1,
  })
  if not r0_32:IsAnyAnimationPlaying() then
    local r1_32 = r0_32.Root:OpenSubUI("RougeArchiveMain")
    r0_32.Root.IsOpenSelectLevel = false
    r1_32:InitTable()
    r1_32.Archive_EventItem:SetFocus()
  end
end
function r2_0.OpenReward(r0_33)
  -- line: [519, 524] id: 33
  local r1_33 = r0_33:MakeRewardData()
  r1_33.ConfigData.Type = r0_0.ArchiveType.Event
  UIManager(r0_33):ShowCommonPopupUI(100173, r1_33, r0_33)
end
function r2_0.GetAllRewards(r0_34, r1_34)
  -- line: [526, 558] id: 34
  local r2_34 = GWorld:GetAvatar()
  if r2_34 then
    r2_34:GetRougeLikeManualReward(function(r0_35, r1_35)
      -- line: [529, 555] id: 35
      local r2_35 = false
      DebugPrint("@@@RougeArchive GetAllRewards CallBack")
      for r6_35 = 0, r1_34.SelfWidget.List_Item:GetNumItems() + -1, 1 do
        local r7_35 = r1_34.SelfWidget.List_Item:GetItemAt(r6_35)
        if r7_35 then
          local r9_35 = r7_35.ConfigData.Num <= r1_34.DataModel:GetUnlockedItemNum(r7_35.ConfigData.Type)
          local r10_35 = r2_34.RougeLike:IsManualRewardGot(r7_35.ConfigData.Type, r7_35.ConfigData.ItemId)
          if r9_35 and not r10_35 then
            r2_35 = true
          end
          DebugPrint("@@@RougeArchive GetAllRewards ,Type,ItemId,CanReceive,IsGot", r7_35.ConfigData.Type, r7_35.ConfigData.ItemId, r9_35, r10_35)
          r7_35.ConfigData.CanReceive = r9_35
          r7_35.ConfigData.RewardsGot = r10_35
          if r7_35.SelfWidget then
            r7_35.SelfWidget:RefreshBtn(r10_35)
          end
        end
      end
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, r1_35, false, function()
        -- line: [549, 551] id: 36
        r1_34.SelfWidget:SetFocus()
      end, r1_34.SelfWidget)
      r1_34.SelfWidget:RefreshReddotInfo()
      r1_34.SelfWidget:RefreshButton(r2_35)
      DebugPrint("@@@RougeArchive GetAllRewards HaveReWardToGet", r2_35)
    end, r1_34.SelfWidget.Type, -1)
  end
end
function r2_0.GetReward(r0_37, r1_37)
  -- line: [560, 592] id: 37
  local r2_37 = GWorld:GetAvatar()
  if r2_37 then
    r2_37:GetRougeLikeManualReward(function(r0_38, r1_38)
      -- line: [563, 589] id: 38
      local r2_38 = false
      DebugPrint("@@@RougeArchive GetReward CallBack")
      for r6_38 = 0, r1_37.Owner.List_Item:GetNumItems() + -1, 1 do
        local r7_38 = r1_37.Owner.List_Item:GetItemAt(r6_38)
        if r7_38 then
          local r9_38 = r7_38.ConfigData.Num <= r1_37.ConfigData.ReceiveParm.DataModel:GetUnlockedItemNum(r0_37.Content.ConfigData.Type)
          local r10_38 = r2_37.RougeLike:IsManualRewardGot(r7_38.ConfigData.Type, r7_38.ConfigData.ItemId)
          if r9_38 and not r10_38 then
            r2_38 = true
          end
          DebugPrint("@@@RougeArchive GetReward ,Type,ItemId,CanReceive,IsGot", r7_38.ConfigData.Type, r7_38.ConfigData.ItemId, r9_38, r10_38)
          r7_38.ConfigData.CanReceive = r9_38
          r7_38.ConfigData.RewardsGot = r10_38
          if r7_38.SelfWidget then
            r7_38.SelfWidget:RefreshBtn(r10_38)
          end
        end
      end
      r1_37.SelfWidget:RefreshReddotInfo()
      r1_37.Owner:RefreshButton(r2_38)
      DebugPrint("@@@RougeArchive GetReward HaveReWardToGet", r2_38)
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, r1_38, false, function()
        -- line: [586, 588] id: 39
        r1_37.SelfWidget:SetFocus()
      end, r1_37.SelfWidget)
    end, r1_37.SelfWidget.Type, r1_37.SelfWidget.ItemId)
  end
end
function r2_0.MakeRewardData(r0_40)
  -- line: [594, 677] id: 40
  local r1_40 = GWorld:GetAvatar()
  local r2_40 = {
    ConfigData = {},
  }
  r2_40.ConfigData.TabInfo = {}
  r2_40.ConfigData.Items = {}
  r2_40.ConfigData.HasTab = true
  local r3_40 = {}
  for r8_40, r9_40 in pairs(DataMgr.RLArchiveInfo) do
    table.insert(r3_40, r9_40)
  end
  -- close: r4_40
  table.sort(r3_40, function(r0_41, r1_41)
    -- line: [605, 607] id: 41
    return r0_41.RLArchiveType < r1_41.RLArchiveType
  end)
  r2_40.ConfigData.Datas = {}
  for r8_40, r9_40 in ipairs(r3_40) do
    table.insert(r2_40.ConfigData.TabInfo, {
      Index = r8_40,
      Type = r9_40.RLArchiveType,
      Title = r9_40.RLArchiveTitle,
      RewardId = r9_40.RewardId,
      ReddotName = "RougeArchiveReward",
      IconPath = r9_40.RewardTabIconPath,
      IsShowIcon = true,
    })
    local r11_40 = {
      ShowIcon = false,
      NowNum = r0_40.DataModel:GetUnlockedItemNum(r9_40.RLArchiveType),
      NumMax = r0_40.DataModel:GetTotalItemNum(r9_40.RLArchiveType),
      ReceiveAllCallBack = r0_40.GetAllRewards,
      ReceiveAllParam = {
        DataModel = r0_40.DataModel,
      },
      Type = r9_40.RLArchiveType,
      Text_Total = string.format(GText("UI_ModGuideBook_Task_Collecting")),
      ReceiveButtonText = GText("UI_Archive_CollectionClaimAll"),
    }
    local r12_40 = {}
    local r13_40 = 1
    local r14_40 = r9_40.RLArchiveStep
    while r13_40 * r14_40 <= r11_40.NumMax do
      local r15_40 = {
        ItemId = r13_40,
      }
      local r16_40 = r0_40.DataModel:GetUnlockedItemNum(r9_40.RLArchiveType)
      r15_40.CanReceive = r13_40 * r14_40 <= r16_40
      r15_40.Type = r9_40.RLArchiveType
      r15_40.RewardsGot = r1_40.RougeLike:IsManualRewardGot(r9_40.RLArchiveType, r15_40.ItemId)
      r15_40.NotreachText = GText("UI_Archive_CollectionInProgress")
      r15_40.Hint = string.format(GText("UI_Archive_CollectionTarget"), r13_40 * r14_40)
      r15_40.ReddotName = "RougeArchiveReward"
      r15_40.ReceiveButtonText = GText("UI_Archive_CollectionClaim")
      r15_40.Num = r13_40 * r14_40
      r15_40.ReceiveCallBack = r0_40.GetReward
      r15_40.ReceiveParm = {
        DataModel = r0_40.DataModel,
      }
      local r17_40 = {}
      local r19_40 = DataMgr.Reward[r9_40.RewardId]
      if r19_40 then
        local r20_40 = r19_40.Id and {}
        local r21_40 = r19_40.Count and {}
        local r22_40 = r19_40.Type and {}
        for r26_40 = 1, #r20_40, 1 do
          local r27_40 = r20_40[r26_40]
          table.insert(r17_40, {
            ItemType = r22_40[r26_40],
            ItemId = r27_40,
            Count = RewardUtils:GetCount(r21_40[r26_40]),
            Rarity = ItemUtils.GetItemRarity(r27_40, r22_40[r26_40]),
          })
        end
      end
      r15_40.Rewards = r17_40
      r13_40 = r13_40 + 1
      table.insert(r12_40, r15_40)
    end
    r11_40.Items = r12_40
    r2_40.ConfigData.Datas[r9_40.RLArchiveType] = r11_40
  end
  -- close: r4_40
  r2_40.ConfigData.Type = r2_40.ConfigData.TabInfo[1].Type
  r2_40.ConfigData.ReddotName = "RougeArchiveReward"
  return r2_40
end
function r2_0.HandleKeyDown(r0_42, r1_42, r2_42)
  -- line: [680, 695] id: 42
  local r3_42 = UE4.UKismetInputLibrary.GetKey(r2_42)
  local r4_42 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_42)
  local r5_42 = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_42) and r4_42 == Const.GamepadRightThumbstick then
    r0_42:OpenReward()
  elseif r4_42 == "Escape" then
    r5_42 = true
    r0_42:OnReturnKeyDown()
  end
  return r5_42
end
return r2_0
