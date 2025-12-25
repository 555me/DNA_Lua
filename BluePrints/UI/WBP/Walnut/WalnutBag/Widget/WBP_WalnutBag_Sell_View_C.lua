-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Walnut\WalnutBag\Widget\WBP_WalnutBag_Sell_View_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r1_0 = require("BluePrints.UI.WBP.Walnut.WalnutBag.WalnutBagController"):GetModel()
local r2_0 = require("BluePrints.UI.WBP.Bag.BagCommon")
local r3_0 = Class({
  "BluePrints.UI.BP_UIState_C"
})
function r3_0.Initialize(r0_1, r1_1)
  -- line: [18, 39] id: 1
  r0_1.Super.Initialize(r0_1)
  r0_1.ParentWidget = nil
  r0_1.bIsOpenList = false
  r0_1.InitStuffDataInList = nil
  r0_1.CurStuffCountInList = 0
  r0_1.CurSelectStuffContentInList = nil
  r0_1.AllTypeCoinInfo = {}
  r0_1.AllTypeRewardsInfo = {}
  r0_1.AllRewardContentList = {}
  r0_1.NeedDealWithStuffData = {}
  r0_1.NeedDealWithStuffCount = {}
  r0_1.ItemId2GridIndex = {}
  r0_1.CloseCallback = nil
  r0_1.RemoveCallback = nil
  r0_1.ConfirmCallback = nil
  r0_1.CurFocusWidget = "DefaultWidget"
end
function r3_0.OnLoaded(r0_2, ...)
  -- line: [44, 61] id: 2
  local r6_2 = nil	-- notice: implicit variable refs by block#[0]
  local r5_2 = nil	-- notice: implicit variable refs by block#[0]
  local r4_2 = nil	-- notice: implicit variable refs by block#[0]
  local r3_2 = nil	-- notice: implicit variable refs by block#[0]
  local r2_2 = nil	-- notice: implicit variable refs by block#[0]
  local r1_2 = nil	-- notice: implicit variable refs by block#[0]
  r0_2.Super.OnLoaded(r0_2, ...)
  r0_2.List_Item:ClearListItems()
  ... = ... -- error: untaken top expr
  r0_2.CurrentMode = r6_2
  r0_2.InitStuffDataInList = r5_2
  r0_2.ConfirmCallback = r4_2
  r0_2.RemoveCallback = r3_2
  r0_2.CloseCallback = r2_2
  r0_2.ParentWidget = r1_2
  r1_2 = CommonUtils.GetDeviceTypeByPlatformName(r0_2)
  r2_2 = CommonConst.CLIENT_DEVICE_TYPE.MOBILE
  if r1_2 == r2_2 then
    r1_2 = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r0_2.Panel_Content)
    if r1_2 ~= nil then
      r1_2:SetSize(FVector2D(0, 0))
    end
  end
  r0_2:PlayInAnim()
  r1_2 = r0_2.ParentWidget.CurSelectContent
  if r1_2 then
    r1_2 = r0_2.ParentWidget.CurSelectContent.Count
    if r1_2 > 0 then
      r0_2:AddTimer(0.01, function()
        -- line: [57, 59] id: 3
        r0_2.ParentWidget:OnListItemSelected(r0_2.ParentWidget.CurSelectContent)
      end)
    end
  end
end
function r3_0.OnFocusReceived(r0_4, r1_4, r2_4)
  -- line: [63, 69] id: 4
  r0_4.CurFocusWidget = "DefaultWidget"
  if r0_4.ParentWidget then
    r0_4.ParentWidget:RefreshBottomKeyInfo("DefaultWidget")
  end
  return r3_0.Super.OnFocusReceived(r0_4, r1_4, r2_4)
end
function r3_0.InitListenEvent(r0_5)
  -- line: [71, 75] id: 5
  r0_5:AddDispatcher(EventID.OnAddWalnutItemToList, r0_5, r0_5.AddWalnutItemToList)
  r0_5:AddDispatcher(EventID.OnRemoveWalnutItemInList, r0_5, r0_5.RemoveWalnutItemInList)
end
function r3_0.PlayInAnim(r0_6)
  -- line: [77, 84] id: 6
  if r0_6:IsAnimationPlaying(r0_6.In) then
    return 
  end
  r0_6:PlayAnimationForward(r0_6.In)
  r0_6:RefreshBaseInfo()
  r0_6:InitListenEvent()
end
function r3_0.PlayOutAnim(r0_7)
  -- line: [86, 109] id: 7
  if not r0_7 or r0_7:IsAnimationPlaying(r0_7.Out) then
    return 
  end
  if r0_7.bIsOpenList or r0_7:IsAnimationPlaying(r0_7.CloseList) then
    local function r1_7()
      -- line: [91, 97] id: 8
      r0_7.List_Item:SetVisibility(UE4.ESlateVisibility.Collapsed)
      r0_7.Panel_Sell_List:SetVisibility(UE4.ESlateVisibility.Collapsed)
      r0_7.bIsOpenList = false
      r0_7:BindToAnimationFinished(r0_7.Out, {
        r0_7,
        r0_7.Close
      })
      r0_7:PlayAnimationForward(r0_7.Out)
    end
    r0_7:UnbindAllFromAnimationFinished(r0_7.CloseList)
    r0_7:BindToAnimationFinished(r0_7.CloseList, {
      r0_7,
      r1_7
    })
    r0_7:PlayAnimationForward(r0_7.CloseList)
  else
    r0_7:BindToAnimationFinished(r0_7.Out, {
      r0_7,
      r0_7.Close
    })
    r0_7:PlayAnimationForward(r0_7.Out)
  end
  AudioManager(r0_7):PlayUISound(r0_7, "event:/ui/common/click_btn_return", nil, nil)
  if r0_7.ParentWidget then
    r0_7.ParentWidget:LeaveWalnutSellState()
  end
end
function r3_0.RefreshBaseInfo(r0_9)
  -- line: [111, 211] id: 9
  -- notice: unreachable block#12
  if CommonUtils.GetDeviceTypeByPlatformName(r0_9) == CommonConst.CLIENT_DEVICE_TYPE.PC then
    r0_9.Key_Check:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "RS",
        }
      },
    })
    r0_9.Key_View:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "Menu",
        }
      },
    })
  end
  r0_9.Com_NumInput:Init({
    MinusBtnCallback = r0_9.OnClickToMinusStuff,
    AddBtnCallback = r0_9.OnClickToAddStuff,
    MinBtnCallback = r0_9.OnClickToMinStuff,
    MaxBtnCallback = r0_9.OnClickToMaxStuff,
    InputCallback = r0_9.OnInputStuffNum,
    LeaveFocusWidget = r0_9.ParentWidget,
    ViewGamePad = "LeftThumb",
    OwnerPanel = r0_9,
  })
  r0_9.Com_NumInput:SetSimpleMode(true)
  r0_9.Com_Slider:Init({
    MinusBtnCallback = r0_9.OnClickToMinusStuff,
    AddBtnCallback = r0_9.OnClickToAddStuff,
    SliderChangeCallback = r0_9.SliderChangeCallback,
    SoundResPath = {
      Minus = "event:/ui/common/click_btn_minus",
    },
    OwnerPanel = r0_9,
    EnableMiniBtn = false,
    EnableMaxBtn = false,
  })
  r0_9.ItemBox:ClearChildren()
  r0_9.Num_Select:SetText(tostring("0"))
  r0_9.Num_Select_Max:SetText(tostring("999"))
  r0_9.Text_Num:SetText(GText("UI_Bag_Sell_Amount"))
  r0_9.Text_Select:SetText(GText("UI_Bag_Sell_Select"))
  r0_9.Text_Total:SetText(GText("UI_Bag_Decompose_Expect"))
  r0_9.Text_Empty:SetText(GText("UI_BAG_Nochosen"))
  r0_9.Button_Purchase:SetGamePadImg("Y")
  r0_9.Button_Purchase:SetText(GText("UI_BAG_Sell"))
  r0_9.Button_Purchase:BindEventOnClicked(r0_9, r0_9.TryToSaleWalnut)
  r0_9.WidgetSwitcher_State:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_9.Button_List:BindEventOnClicked(r0_9, r0_9.ClickToOpenStuffList)
  r0_9.Back_Area.OnClicked:Clear()
  r0_9.Back_Area.OnClicked:Add(r0_9, r0_9.ClickToOpenStuffList)
  if r0_9.InitStuffDataInList ~= nil then
    r0_9:AddBagItemToList(r0_9.InitStuffDataInList)
    r0_9.CurSelectStuffContentInList = r0_9.List_Item:GetItemAt(0)
    r0_9.Panel_Empty:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_9.Panel_KeyCount:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_9.Button_Purchase:ForbidBtn(false)
  else
    r0_9.CurSelectStuffContentInList = nil
    r0_9.Panel_Empty:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_9.Panel_Total:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_9.Panel_KeyCount:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_9.Button_Purchase:ForbidBtn(true)
  end
  r0_9.List_Item.BP_OnItemSelectionChanged:Add(r0_9, r0_9.OnSelectStuffItemChanged)
  function r0_9.Button_List.SoundFunc(r0_10)
    -- line: [197, 199] id: 10
    AudioManager(r0_9):PlayUISound(r0_9.Button_List, "event:/ui/common/click_btn_small", nil, nil)
  end
  if r0_9.ParentWidget then
    if type(r0_9.ParentWidget.SetFocus_Lua) == "function" then
      r0_9.ParentWidget:SetFocus_Lua()
    else
      r0_9.ParentWidget:SetFocus()
    end
  end
  local r1_9 = r0_9.GameInputModeSubsystem:GetCurrentInputType()
  if r1_9 == ECommonInputType.Gamepad then
    r1_9 = r0_9:IsCanChangeToGamePadViewMode()
  else
    r1_9 = false
  end
  r0_9:UpdateUIStyleInPlatform(r1_9)
end
function r3_0.UpdateUIStyleInPlatform(r0_11, r1_11)
  -- line: [213, 226] id: 11
  if CommonUtils.GetDeviceTypeByPlatformName(r0_11) == CommonConst.CLIENT_DEVICE_TYPE.MOBILE then
    return 
  end
  if not r1_11 or not 1 then
    local r2_11 = 0
  end
  if r1_11 then
    r0_11.Key_Check:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r0_11.Key_View:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    r0_11.Key_Check:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_11.Key_View:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r3_0.UpdateCurFocusInfo(r0_12, r1_12)
  -- line: [228, 230] id: 12
  r0_12.CurFocusWidget = r1_12
end
function r3_0.SetFocus_Lua(r0_13)
  -- line: [232, 246] id: 13
  if r0_13.bIsOpenList then
    r0_13.List_Item:SetFocus()
    r0_13:UpdateCurFocusInfo("ToSellListView")
  elseif r0_13.ParentWidget then
    r0_13:UpdateCurFocusInfo("DefaultWidget")
    if r0_13.ParentWidget.SetFocus_Lua then
      r0_13.ParentWidget:SetFocus_Lua()
    else
      r0_13.ParentWidget:SetFocus()
    end
  end
end
function r3_0.ClickToOpenStuffList(r0_14)
  -- line: [248, 302] id: 14
  if r0_14:IsAnimationPlaying(r0_14.OpenList) or r0_14:IsAnimationPlaying(r0_14.CloseList) then
    return 
  end
  if r0_14.bIsOpenList then
    local function r1_14()
      -- line: [255, 268] id: 15
      local r0_15 = r0_14.List_Item:BP_GetSelectedItem()
      if r0_15 and r0_15.SelfWidget then
        r0_15.SelfWidget:SetSelected(false)
      end
      r0_14.List_Item:BP_ClearSelection()
      r0_14.List_Item:SetVisibility(UE4.ESlateVisibility.Collapsed)
      r0_14.Panel_Sell_List:SetVisibility(UE4.ESlateVisibility.Collapsed)
      r0_14.bIsOpenList = false
      r0_14.Com_NumInput:OverrideFocusToWidget(r0_14.ParentWidget)
      if r0_14.ParentWidget then
        r0_14.ParentWidget:SetFocus_Lua()
      end
    end
    r0_14:UnbindAllFromAnimationFinished(r0_14.CloseList)
    r0_14:BindToAnimationFinished(r0_14.CloseList, {
      r0_14,
      r1_14
    })
    r0_14:PlayAnimationForward(r0_14.CloseList)
  else
    local function r1_14()
      -- line: [273, 294] id: 16
      r0_14.bIsOpenList = true
      for r4_16 = 0, r0_14.List_Item:GetNumItems() + -1, 1 do
        local r5_16 = r0_14.List_Item:GetItemAt(r4_16)
        if r5_16 and r5_16.SelfWidget ~= nil then
          if r4_16 == 0 then
            r5_16.SelfWidget:SetSelected(true)
            r0_14:OnListSelectStuffClicked(r5_16, "SelectFirstItem")
          else
            r5_16.SelfWidget:SetSelected(false)
          end
          r5_16.SelfWidget:SetSelectNum(Utils.FormatNumber(r0_14.NeedDealWithStuffCount[r5_16.Uuid] and 1, true))
        end
      end
      r0_14.List_Item:SetFocus()
      r0_14.Com_NumInput:OverrideFocusToWidget(r0_14)
      r0_14:UpdateCurFocusInfo("ToSellListView")
    end
    r0_14.List_Item:SetFocus()
    r0_14:UnbindAllFromAnimationFinished(r0_14.OpenList)
    r0_14:BindToAnimationFinished(r0_14.OpenList, {
      r0_14,
      r1_14
    })
    r0_14:PlayAnimationForward(r0_14.OpenList)
    r0_14.List_Item:SetVisibility(UE4.ESlateVisibility.Visible)
    r0_14.Panel_Sell_List:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end
function r3_0.OnSelectStuffItemChanged(r0_17, r1_17, r2_17)
  -- line: [304, 312] id: 17
  if not r1_17 then
    return 
  end
  if r0_17.bIsOpenList and r0_17.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    r0_17:OnListSelectStuffClicked(r1_17, "ChangeHoverInGamepad")
  end
end
function r3_0.TryToSaleWalnut(r0_18)
  -- line: [314, 390] id: 18
  if r0_18.CurStuffCountInList <= 0 then
    UIManager(r0_18):ShowUITip(UIConst.Tip_CommonToast, GText("UI_BAG_Nochosen"))
    return 
  end
  local r1_18 = {}
  local r2_18 = false
  local r3_18 = GWorld:GetAvatar()
  local r4_18 = false
  r1_18.StuffInfoList = {}
  for r9_18, r10_18 in pairs(r0_18.NeedDealWithStuffData) do
    local r11_18 = {
      Id = r10_18.StuffId,
    }
    if r11_18 ~= nil then
      local r12_18 = r1_0:GetWalnutStuffData(r11_18, r0_18)
      r12_18.StuffCount = r0_18.NeedDealWithStuffCount[r9_18]
      table.insert(r1_18.StuffInfoList, r12_18)
    end
  end
  -- close: r5_18
  r1_18.LeftText = GText("UI_Bag_Sell_Waiting")
  r1_18.RightText = GText("UI_Bag_Sell_Get")
  r1_18.RewardList = {}
  for r9_18, r10_18 in pairs(r0_18.AllTypeCoinInfo) do
    if r10_18 > 0 then
      local r11_18 = 0
      if r9_18 == CommonConst.Coins.Coin3 then
        local r12_18, r13_18 = r0_18:GetCoin3DataInfo()
        if r12_18 < r13_18 + r10_18 and not r1_18.IsShowEmptyText then
          r4_18 = true
          r1_18.Tips = {
            GText("UI_Bag_ModExtract_Warning")
          }
        end
        r11_18 = math.min(math.floor(r10_18 + 0.5), math.floor(r12_18 - r13_18 + 0.5))
      else
        r11_18 = math.floor(r10_18 + 0.5)
      end
      local r13_18 = {
        StuffId = r9_18,
        StuffIcon = ItemUtils.GetItemIconPath(r9_18, "Resource"),
        ParentWidget = r0_18,
        StuffType = "Resource",
        Rarity = DataMgr.Resource[r9_18].Rarity and 1,
        IsShowDetails = true,
        UIName = "WalnutSelectToList",
        Count = r11_18,
      }
      table.insert(r1_18.RewardList, r13_18)
    end
  end
  -- close: r5_18
  if r4_18 then
    r1_18.bHideDialogItem = false
    r1_18.DialogItemIndex = nil
  else
    r1_18.bHideDialogItem = true
    r1_18.DialogItemIndex = 1
  end
  function r1_18.RightCallbackFunction()
    -- line: [375, 375] id: 19
    r0_18:ConfirmDealWithItems()
  end
  local r5_18 = {}
  if r2_18 then
    r5_18.ShortText = GText("UI_COMMONPOP_TEXT_100038")
  end
  if r5_18.ShortText then
    function r5_18.RightCallbackFunction(r0_20, r1_20)
      -- line: [382, 385] id: 20
      r0_18:UpdatePopupSelectedInfo(r1_20, r2_0.LastStuffSellTimeStamp)
      UIManager(r0_18):ShowCommonPopupUI(100164, r1_18, r0_18)
    end
    UIManager(r0_18):ShowCommonPopupUI(100165, r5_18, r0_18)
  else
    UIManager(r0_18):ShowCommonPopupUI(100164, r1_18, r0_18)
  end
end
function r3_0.AddWalnutItemToList(r0_21, r1_21)
  -- line: [392, 402] id: 21
  r0_21:FillWithStuffSellData(r1_21)
  r0_21:RefreshCoinInfo()
  r0_21.Num_Select:SetText(tostring(r0_21.CurStuffCountInList))
  if r0_21.CurStuffCountInList == 1 then
    r0_21.Panel_KeyCount:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_21.Button_Purchase:ForbidBtn(false)
    r0_21.Panel_Empty:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  r0_21:RefreshKeyCount()
end
function r3_0.RemoveWalnutItemInList(r0_22, r1_22)
  -- line: [404, 411] id: 22
  local r2_22 = r0_22.NeedDealWithStuffData[r1_22]
  if r2_22 ~= nil then
    local r3_22 = r0_22:RemoveFromSellList(r2_22)
    r0_22:RefreshCoinInfo()
    r0_22:AfterRemoveItemFromList(r2_22, r3_22)
  end
end
function r3_0.RemoveFromSellList(r0_23, r1_23)
  -- line: [413, 440] id: 23
  local r2_23 = nil
  for r7_23 = 0, r0_23.List_Item:GetNumItems() + -1, 1 do
    local r8_23 = r0_23.List_Item:GetItemAt(r7_23)
    if r8_23 and r8_23.Uuid == r1_23.Uuid then
      r2_23 = r8_23
      break
    end
  end
  if r2_23 == nil then
    DebugPrint("WBP_WalnutBag_Sell_View_C=RemoveFromSellList Error, StuffUuid is ", r1_23.Uuid)
    return false
  end
  local r4_23 = r2_23.CoinId
  local r5_23 = r2_23.IsSelect
  r0_23.List_Item:RemoveItem(r2_23)
  r0_23.CurStuffCountInList = math.max(r0_23.CurStuffCountInList + -1, 0)
  r0_23.NeedDealWithStuffData[r1_23.Uuid] = nil
  if r0_23.AllTypeCoinInfo[r4_23] ~= nil then
    r0_23.AllTypeCoinInfo[r4_23] = r0_23.AllTypeCoinInfo[r4_23] - r1_23.Price * r0_23.NeedDealWithStuffCount[r1_23.Uuid]
    if r0_23.AllTypeCoinInfo[r4_23] <= 0 then
      r0_23.AllTypeCoinInfo[r4_23] = nil
    end
  end
  return r5_23
end
function r3_0.AfterRemoveItemFromList(r0_24, r1_24, r2_24)
  -- line: [442, 467] id: 24
  r0_24.NeedDealWithStuffCount[r1_24.Uuid] = nil
  r0_24.Num_Select:SetText(tostring(math.max(r0_24.CurStuffCountInList, 0)))
  if r0_24.CurStuffCountInList <= 0 then
    r0_24.CurSelectGridIndex = nil
    r0_24.CurSelectStuffContentInList = nil
    r0_24.Panel_Empty:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_24.Panel_Total:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_24.Button_Purchase:ForbidBtn(true)
    r0_24.Panel_KeyCount:SetVisibility(UE4.ESlateVisibility.Collapsed)
  elseif r2_24 then
    r0_24.List_Item:SetSelectedIndex(0)
    local r3_24 = r0_24.List_Item:GetItemAt(0)
    r0_24:OnListSelectStuffClicked(r3_24, "SelectFirstItem")
    if r0_24.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad and r3_24 and r3_24.SelfWidget then
      r3_24.SelfWidget:SetFocus()
    end
  end
  if type(r0_24.RemoveCallback) == "function" then
    r0_24.RemoveCallback(r0_24.ParentWidget, r1_24.Uuid)
  end
end
function r3_0.FillWithStuffSellData(r0_25, r1_25)
  -- line: [469, 499] id: 25
  r1_25.ParentWidget = r0_25
  r1_25.GridIndex = r0_25.CurStuffCountInList + 1
  local r2_25 = 1
  if r0_25.NeedDealWithStuffData[r1_25.Uuid] ~= nil then
    r1_25.GridIndex = r0_25.ItemId2GridIndex[r1_25.Uuid]
    r0_25.NeedDealWithStuffCount[r1_25.Uuid] = r0_25.NeedDealWithStuffCount[r1_25.Uuid] + 1
  else
    r1_25.GridIndex = r0_25.CurStuffCountInList + 1
    r1_25.StateTagInfo = {
      Name = "InSelectList",
      ExtraData = {
        r2_25,
        r1_25.StuffCount,
        r1_25.Price,
        r1_25.CoinId,
        r0_25.RemoveWalnutItemInList
      },
    }
    r1_25.ClickCallback = r0_25.OnListSelectStuffClicked
    r1_25.bDisableCommonClick = true
    local r3_25 = r1_0:CreateBagItemContent(r1_25)
    r0_25.NeedDealWithStuffData[r3_25.Uuid] = r3_25
    r0_25.NeedDealWithStuffCount[r3_25.Uuid] = r2_25
    r0_25.List_Item:AddItem(r3_25)
    r0_25:OnListSelectStuffClicked(r0_25.List_Item:GetItemAt(r0_25.CurStuffCountInList), "AddNewItem")
    r0_25.CurStuffCountInList = r0_25.CurStuffCountInList + 1
    r0_25.ItemId2GridIndex[r3_25.Uuid] = r3_25.GridIndex
  end
  local r3_25 = r1_25.CoinId
  if r0_25.AllTypeCoinInfo[r3_25] ~= nil then
    r0_25.AllTypeCoinInfo[r3_25] = r0_25.AllTypeCoinInfo[r3_25] + r1_25.Price * r2_25
  else
    r0_25.AllTypeCoinInfo[r3_25] = r1_25.Price * r2_25
  end
end
function r3_0.RefreshCoinInfo(r0_26)
  -- line: [501, 538] id: 26
  local r1_26 = r0_26.ItemBox:GetAllChildren()
  local r2_26 = 0
  local r3_26 = 0
  for r7_26 = 1, r1_26:Length(), 1 do
    r0_26.ItemBox:GetChildAt(r7_26 + -1):SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  for r8_26, r9_26 in pairs(r0_26.AllTypeCoinInfo) do
    if r9_26 > 0 then
      r2_26 = r2_26 + 1
      local r10_26 = nil
      if r1_26:Length() < r2_26 then
        r10_26 = UIManager(r0_26):_CreateWidgetNew("ComItemUniversalS")
        r0_26.ItemBox:AddChildToWrapBox(r10_26)
      else
        r10_26 = r0_26.ItemBox:GetChildAt(r2_26 + -1)
      end
      local r12_26 = {
        Id = r8_26,
        Icon = ItemUtils.GetItemIconPath(r8_26, "Resource"),
        ParentWidget = r0_26,
        ItemType = "Resource",
        Rarity = DataMgr.Resource[r8_26].Rarity and 1,
        IsShowDetails = true,
        UIName = "WalnutSelectToList",
        Count = math.floor(r9_26 + 0.5),
      }
      r10_26:Init(r12_26)
      r10_26:SetVisibility(UE4.ESlateVisibility.Visible)
    end
  end
  -- close: r4_26
  r0_26.ItemBox:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_26.Panel_Total:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_26.ItemBox_Overflow:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_26.Text_Overflow:SetVisibility(UE4.ESlateVisibility.Collapsed)
end
function r3_0.RefreshKeyCount(r0_27)
  -- line: [540, 547] id: 27
  if r0_27.CurSelectStuffContentInList then
    local r1_27 = r0_27.NeedDealWithStuffCount[r0_27.CurSelectStuffContentInList.Uuid]
    local r2_27 = r0_27.NeedDealWithStuffData[r0_27.CurSelectStuffContentInList.Uuid].Count
    r0_27.Com_NumInput:OverrideValueLimit(r1_27, r2_27, 1, true)
    r0_27.Com_Slider:OverrideValueLimit(r1_27, r2_27, 1, true)
  end
end
function r3_0.ConfirmDealWithItems(r0_28)
  -- line: [549, 560] id: 28
  if r0_28.ConfirmCallback ~= nil then
    r0_28.ConfirmCallback(r0_28.ParentWidget, r0_28.NeedDealWithStuffData, r0_28.NeedDealWithStuffCount)
  end
  if r0_28.ParentWidget then
    if type(r0_28.ParentWidget.SetFocus_Lua) == "function" then
      r0_28.ParentWidget:SetFocus_Lua()
    else
      r0_28.ParentWidget:SetFocus()
    end
  end
end
function r3_0.OnInputStuffNum(r0_29, r1_29, r2_29)
  -- line: [562, 574] id: 29
  if r0_29.CurSelectStuffContentInList == nil then
    return 
  end
  local r3_29 = r0_29.CurSelectStuffContentInList.CoinId
  if r0_29.AllTypeCoinInfo[r3_29] ~= nil then
    r0_29.AllTypeCoinInfo[r3_29] = math.max(0, r0_29.AllTypeCoinInfo[r3_29] + r0_29.NeedDealWithStuffData[r0_29.CurSelectStuffContentInList.Uuid].Price * (r1_29 - r2_29))
  else
    r0_29.AllTypeCoinInfo[r3_29] = math.max(0, r0_29.NeedDealWithStuffData[r0_29.CurSelectStuffContentInList.Uuid].Price * (r1_29 - r2_29))
  end
  r0_29:RefreshCoinInfo(r3_29)
  r0_29:OnUpdateCurSelectItemSaleInfo(r1_29, true)
end
function r3_0.SliderChangeCallback(r0_30, r1_30)
  -- line: [576, 591] id: 30
  if r0_30.CurSelectStuffContentInList == nil then
    return 
  end
  local r2_30 = r0_30.CurSelectStuffContentInList.CoinId
  if r0_30.AllTypeCoinInfo[r2_30] ~= nil then
    r0_30.AllTypeCoinInfo[r2_30] = r0_30.AllTypeCoinInfo[r2_30] + r0_30.NeedDealWithStuffData[r0_30.CurSelectStuffContentInList.Uuid].Price * (r1_30 - r0_30.NeedDealWithStuffCount[r0_30.CurSelectStuffContentInList.Uuid])
    r0_30.NeedDealWithStuffCount[r0_30.CurSelectStuffContentInList.Uuid] = r1_30
    r0_30.Com_NumInput.Text_Num:SetText(r1_30)
    if r0_30.NeedDealWithStuffCount[r0_30.CurSelectStuffContentInList.Uuid] <= 0 then
      r0_30.NeedDealWithStuffCount[r0_30.CurSelectStuffContentInList.Uuid] = 0
      r0_30:RemoveWalnutItemInList(r0_30.CurSelectStuffContentInList.Uuid)
    end
  end
  r0_30:RefreshCoinInfo(r2_30)
  r0_30:OnUpdateCurSelectItemSaleInfo(r1_30, true)
end
function r3_0.OnClickToMinusStuff(r0_31)
  -- line: [593, 612] id: 31
  if r0_31.CurSelectStuffContentInList == nil then
    return 
  end
  local r1_31 = r0_31.CurSelectStuffContentInList.CoinId
  if r0_31.AllTypeCoinInfo[r1_31] ~= nil then
    r0_31.AllTypeCoinInfo[r1_31] = r0_31.AllTypeCoinInfo[r1_31] - r0_31.NeedDealWithStuffData[r0_31.CurSelectStuffContentInList.Uuid].Price
    r0_31.NeedDealWithStuffCount[r0_31.CurSelectStuffContentInList.Uuid] = r0_31.NeedDealWithStuffCount[r0_31.CurSelectStuffContentInList.Uuid] + -1
    r0_31.Com_NumInput.Text_Num:SetText(r0_31.NeedDealWithStuffCount[r0_31.CurSelectStuffContentInList.Uuid])
    if r0_31.NeedDealWithStuffCount[r0_31.CurSelectStuffContentInList.Uuid] <= 0 then
      r0_31.NeedDealWithStuffCount[r0_31.CurSelectStuffContentInList.Uuid] = 0
      r0_31:RemoveWalnutItemInList(r0_31.CurSelectStuffContentInList.Uuid)
      r0_31.CurSelectStuffContentInList = nil
      r0_31.CurSelectGridIndex = -1
    end
  end
  local r2_31 = r0_31.NeedDealWithStuffCount[r0_31.CurSelectStuffContentInList.Uuid] and 0
  if not r0_31.CurSelectStuffContentInList.StuffId then
    local r3_31 = r0_31.CurSelectStuffContentInList.Id
  end
  r0_31:RefreshCoinInfo(r1_31)
  r0_31:OnUpdateCurSelectItemSaleInfo(r2_31, true)
end
function r3_0.OnClickToAddStuff(r0_32)
  -- line: [614, 627] id: 32
  if r0_32.CurSelectStuffContentInList == nil then
    return 
  end
  local r1_32 = r0_32.CurSelectStuffContentInList.CoinId
  if r0_32.AllTypeCoinInfo[r1_32] ~= nil then
    r0_32.AllTypeCoinInfo[r1_32] = r0_32.AllTypeCoinInfo[r1_32] + r0_32.NeedDealWithStuffData[r0_32.CurSelectStuffContentInList.Uuid].Price
    r0_32.NeedDealWithStuffCount[r0_32.CurSelectStuffContentInList.Uuid] = r0_32.NeedDealWithStuffCount[r0_32.CurSelectStuffContentInList.Uuid] + 1
    r0_32.Com_NumInput.Text_Num:SetText(r0_32.NeedDealWithStuffCount[r0_32.CurSelectStuffContentInList.Uuid])
  end
  local r2_32 = r0_32.NeedDealWithStuffCount[r0_32.CurSelectStuffContentInList.Uuid] and 0
  if not r0_32.CurSelectStuffContentInList.StuffId then
    local r3_32 = r0_32.CurSelectStuffContentInList.Id
  end
  r0_32:RefreshCoinInfo(r1_32)
  r0_32:OnUpdateCurSelectItemSaleInfo(r2_32, true)
end
function r3_0.OnUpdateCurSelectItemSaleInfo(r0_33, r1_33, r2_33)
  -- line: [629, 650] id: 33
  if r0_33.CurSelectStuffContentInList == nil then
    return 
  end
  if not r0_33.CurSelectStuffContentInList.Uuid then
    r0_33.CurSelectStuffContentInList.Uuid = tostring(r0_33.CurSelectStuffContentInList.Id)
  end
  r0_33.NeedDealWithStuffCount[r0_33.CurSelectStuffContentInList.Uuid] = r1_33
  if r0_33.CurSelectStuffContentInList.StateTagInfo and r0_33.CurSelectStuffContentInList.StateTagInfo.ExtraData then
    r0_33.CurSelectStuffContentInList.StateTagInfo.ExtraData[1] = r1_33
  end
  if r0_33.CurSelectStuffContentInList.SelfWidget then
    r0_33.CurSelectStuffContentInList.SelfWidget:SetSelectNum(Utils.FormatNumber(r1_33, true))
  end
  r0_33.Com_NumInput:RefreshCurInputNumber(r1_33)
  if r2_33 then
    r0_33.Com_Slider:RefreshCurInputNumber(r1_33)
  end
  if r0_33.ParentWidget then
    r0_33.ParentWidget:RefreshItemInfo(r1_33, math.tointeger(r0_33.CurSelectStuffContentInList.Uuid))
  end
end
function r3_0.OnListSelectStuffClicked(r0_34, r1_34, r2_34)
  -- line: [652, 679] id: 34
  if r1_34 == nil then
    return 
  end
  local r3_34 = r1_34.GridIndex
  local r4_34 = r1_34.Uuid
  if IsValid(r0_34.CurSelectStuffContentInList) and r0_34.CurSelectStuffContentInList.Uuid == r4_34 then
    r0_34:RefreshKeyCount()
    return 
  end
  if IsValid(r0_34.CurSelectStuffContentInList) then
    if r0_34.CurSelectStuffContentInList.SelfWidget then
      r0_34.CurSelectStuffContentInList.SelfWidget:SetSelected(false)
    else
      r0_34.CurSelectStuffContentInList.IsSelect = false
    end
  end
  r0_34.CurSelectStuffContentInList = r1_34
  r0_34:ClickChooseStuff(r3_34, r4_34)
end
function r3_0.ClickChooseStuff(r0_35, r1_35, r2_35)
  -- line: [681, 691] id: 35
  r0_35.CurSelectGridIndex = r1_35
  r0_35:RefreshKeyCount()
  if IsValid(r0_35.CurSelectStuffContentInList) then
    if r0_35.CurSelectStuffContentInList.SelfWidget then
      r0_35.CurSelectStuffContentInList.SelfWidget:SetSelected(true)
    else
      r0_35.CurSelectStuffContentInList.IsSelect = true
    end
  end
end
function r3_0.OnKeyDown(r0_36, r1_36, r2_36)
  -- line: [723, 740] id: 36
  local r3_36 = UE4.UKismetInputLibrary.GetKey(r2_36)
  local r4_36 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_36)
  local r5_36 = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_36) then
    r5_36 = r0_36:OnGamePadButtonDown(r4_36)
  elseif r4_36 == UE4.EKeys.Escape.KeyName then
    r0_36:PlayOutAnim()
    r5_36 = true
  end
  if r5_36 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end
function r3_0.IsCanChangeToGamePadViewMode(r0_37)
  -- line: [742, 757] id: 37
  if r0_37.CurFocusWidget == "DefaultWidget" then
    return true
  else
    local r1_37 = r0_37:GetOwningPlayer()
    for r6_37 = 1, r0_37.ItemBox:GetAllChildren():Length(), 1 do
      if r0_37.ItemBox:GetChildAt(r6_37 + -1):HasUserFocus(r1_37) then
        return false
      end
    end
    return true
  end
end
function r3_0.OnKeyUp(r0_38, r1_38, r2_38)
  -- line: [759, 772] id: 38
  local r3_38 = UE4.UKismetInputLibrary.GetKey(r2_38)
  local r4_38 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_38)
  local r5_38 = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_38) then
    r5_38 = r0_38:OnGamePadButtonUp(r4_38)
  end
  if r5_38 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end
function r3_0.OnGamePadButtonDown(r0_39, r1_39)
  -- line: [774, 879] id: 39
  local r2_39 = false
  if r0_39.CurSelectStuffContentInList then
    r2_39 = r0_39.Com_Slider:Handle_KeyDownEventOnGamePad(r1_39) and r0_39.Com_NumInput:Handle_KeyEventOnGamePad(r1_39)
  end
  if not r2_39 then
    if r1_39 == UIConst.GamePadKey.FaceButtonRight then
      DebugPrint("OnGamePadButtonDown   ---  ", r0_39.CurFocusWidget)
      if r0_39.CurFocusWidget == "DefaultWidget" then
        r0_39:PlayOutAnim()
        r2_39 = true
      elseif r0_39.CurFocusWidget == "ToSellListView" then
        r0_39.CurFocusWidget = "DefaultWidget"
        r0_39:ClickToOpenStuffList()
        if r0_39.ParentWidget then
          r0_39.ParentWidget:RefreshBottomKeyInfo()
        end
        r2_39 = true
      elseif r0_39.CurFocusWidget == "GetItemBox" then
        r0_39.CurFocusWidget = "DefaultWidget"
        r0_39:SetFocus_Lua()
        if r0_39.ParentWidget then
          r0_39.ParentWidget:RefreshBottomKeyInfo()
          r0_39.ParentWidget:UpdateUIStyleInPlatform(true)
        end
        r0_39.Key_Check:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
        r2_39 = true
      elseif r0_39.Com_NumInput:CheckIsFocusInTextInput() then
        if r0_39.bIsOpenList then
          r0_39.CurFocusWidget = "ToSellListView"
          r0_39.List_Item:SetFocus()
        else
          r0_39.CurFocusWidget = "DefaultWidget"
          if r0_39.ParentWidget then
            if r0_39.ParentWidget.SetFocus_Lua then
              r0_39.ParentWidget:SetFocus_Lua()
            else
              r0_39.ParentWidget:SetFocus()
            end
          end
        end
        r2_39 = true
      else
        r0_39.CurFocusWidget = "DefaultWidget"
        r0_39:UpdateUIStyleInPlatform(true)
        if r0_39.ParentWidget then
          r0_39.ParentWidget:RefreshBottomKeyInfo()
          r0_39.ParentWidget:UpdateUIStyleInPlatform(true)
          if r0_39.ParentWidget.SetFocus_Lua then
            r0_39.ParentWidget:SetFocus_Lua()
          else
            r0_39.ParentWidget:SetFocus()
          end
        end
        r2_39 = true
      end
    elseif r1_39 == UIConst.GamePadKey.RightThumb then
      r0_39.CurFocusWidget = "GetItemBox"
      local r3_39 = r0_39.ItemBox:GetChildAt(0)
      if r3_39 then
        r3_39:SetFocus()
        r0_39:UpdateUIStyleInPlatform(false)
        if r0_39.ParentWidget then
          r0_39.ParentWidget:RefreshBottomKeyInfo("GetItemBox")
          r0_39.ParentWidget:UpdateUIStyleInPlatform(false)
        end
      end
    elseif r1_39 == UIConst.GamePadKey.SpecialRight and r0_39.CurFocusWidget ~= "GetItemBox" and r0_39.CurFocusWidget ~= "NumInputEdit" then
      if r0_39.bIsOpenList then
        r0_39.CurFocusWidget = "DefaultWidget"
      else
        r0_39.CurFocusWidget = "ToSellListView"
      end
      r0_39:ClickToOpenStuffList()
      if r0_39.ParentWidget then
        r0_39.ParentWidget:RefreshBottomKeyInfo(r0_39.CurFocusWidget)
      end
    elseif r1_39 == UIConst.GamePadKey.FaceButtonTop and not r0_39.Com_NumInput:CheckIsFocusInTextInput() then
      r0_39:TryToSaleWalnut()
    elseif r1_39 == UIConst.GamePadKey.FaceButtonLeft and r0_39.CurSelectStuffContentInList and r0_39.CurSelectStuffContentInList.bMinus then
      r0_39:RemoveWalnutItemInList(r0_39.CurSelectStuffContentInList.Uuid)
      if r0_39.CurSelectStuffContentInList then
        r0_39.ParentWidget:RefreshBottomKeyInfo("ToSellListView")
      else
        r0_39.ParentWidget:RefreshBottomKeyInfo()
      end
    end
  end
  return r2_39
end
function r3_0.OnGamePadButtonUp(r0_40, r1_40)
  -- line: [881, 887] id: 40
  local r2_40 = false
  if r0_40.CurSelectStuffContentInList then
    r2_40 = r0_40.Com_Slider:Handle_KeyUpEventOnGamePad(r1_40)
  end
  return r2_40
end
return r3_0
