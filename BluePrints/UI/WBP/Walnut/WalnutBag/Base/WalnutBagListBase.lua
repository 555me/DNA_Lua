-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Walnut\WalnutBag\Base\WalnutBagListBase.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("Utils.UIUtils")
local r2_0 = require("BluePrints.UI.WBP.Walnut.WalnutBag.WalnutBagController"):GetModel()
local r3_0 = require("BluePrints.UI.WBP.Walnut.WalnutBag.WalnutBagCommon")
local r4_0 = Class("BluePrints.Common.TimerMgr")
function r4_0.GetListData(r0_1)
  -- line: [18, 38] id: 1
  local r1_1 = r2_0:GetAllWalnutDict(r0_1.CurTabId + -1, r0_1.SearchKeyWords, r0_1.bShowNotHaveState)
  r0_1.ListDatas = {}
  for r6_1, r7_1 in ipairs(r1_1) do
    table.insert(r0_1.ListDatas, r7_1)
  end
  -- close: r2_1
  table.sort(r0_1.ListDatas, function(r0_2, r1_2)
    -- line: [24, 37] id: 2
    local r2_2 = r0_2.Count > 0
    local r3_2 = r1_2.Count > 0
    if r2_2 and not r3_2 then
      return true
    elseif r3_2 and not r2_2 then
      return false
    else
      if r0_2.Rarity == r1_2.Rarity then
        return r0_2.Id < r1_2.Id
      end
      return r1_2.Rarity < r0_2.Rarity
    end
  end)
end
function r4_0.SetupListContent(r0_3, r1_3, r2_3, r3_3)
  -- line: [40, 64] id: 3
  local r4_3 = r2_3.Id
  local r6_3 = DataMgr.WalnutType[DataMgr.Walnut[r4_3].WalnutType]
  r3_3.Id = r4_3
  r3_3.Icon = r5_3.Icon
  r3_3.Count = r2_3.Count
  r3_3.Rarity = r5_3.Rarity
  r3_3.WalnutType = r5_3.WalnutType
  r3_3.ItemType = r3_0.WalnutTypeName
  r3_3.Price = r5_3.ResourceValue and -1
  r3_3.CoinId = r5_3.ResourceToCoinType and -1
  r3_3.ConsumeRecord = r2_0:GetWalnutConsumeRecordById(r4_3)
  r3_3.bShowNotHaveStyle = true
  if r2_0:CheckIsNeedShowNewDot(r4_3) then
    r3_3.RedDotType = UIConst.RedDotType.NewRedDot
  end
  r3_3.UnHandleMouseDown = true
  r3_3.bDisableCommonClick = true
  r3_3.ParentWidget = r0_3
  r3_3.Uuid = tostring(r4_3)
end
function r4_0.RefreshList(r0_4, r1_4, r2_4)
  -- line: [66, 109] id: 4
  if r1_4 == nil then
    r1_4 = true
  end
  if not IsValid(r0_4.List_Item) then
    assert(false, "WalnutBagListBase:MyListView is invalid")
  end
  if r1_4 then
    r0_4:_StopListFramingInAnim()
  else
    r0_4.List_Item:SetRenderOpacity(1)
  end
  r0_4:OnRefreshListBegin()
  r0_4:GetListData()
  r0_4.List_Item:ClearListItems()
  r0_4.ItemId2Index = {}
  if #r0_4.ListDatas == 0 then
    r0_4:OnListEmpty(r2_4)
    r0_4:OnRefreshListEnd()
    return 
  end
  r0_4:OnListFillWith(r2_4)
  r0_4:AddTimer(0.01, function()
    -- line: [87, 93] id: 5
    r0_4:OnRefreshListLater(r1_4)
    r0_4:OnRefreshListEnd()
    if r1_4 then
      r0_4.List_Item:ScrollToTop()
    end
  end, false, 0, "OnRefreshListLater", true)
  if r0_4.BagSellState then
    if r0_4.List_Item:GetNumItems() == 0 then
      r0_4.Text_Empty_Search:SetText(GText("UI_NoWalnut_Sell"))
      r0_4.Text_Empty_World_1:SetText(EnText("UI_NoWalnut_Sell"))
      r0_4.Panel_Empty_Search:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      r0_4.Panel_Empty_Detail:SetVisibility(UE4.ESlateVisibility.Collapsed)
      r0_4.List_Item:SetVisibility(UE4.ESlateVisibility.Collapsed)
    else
      r0_4.Panel_Empty_Detail:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      r0_4.List_Item:SetVisibility(UE4.ESlateVisibility.Visable)
    end
  else
    r0_4.Panel_Empty_Search:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r4_0.OnRefreshListLater(r0_6, r1_6)
  -- line: [111, 143] id: 6
  local r2_6 = r0_6.List_Item:GetDisplayedEntryWidgets()
  local r3_6 = r0_6.List_Item:GetNumItems()
  if r2_6:Length() == 0 then
    return 
  end
  local r4_6 = 0
  local r5_6 = r0_0.GetTileViewContentMaxCount(r0_6.List_Item)
  if r5_6 < r3_6 then
    local r6_6 = r0_0.GetTileViewContentMaxCount(r0_6.List_Item, "X") and 1
    if r6_6 <= 0 then
      r6_6 = 1
    end
    local r7_6 = r3_6 % r6_6
    if r7_6 ~= 0 then
      r4_6 = r6_6 - r7_6
    else
      r4_6 = 0
    end
  else
    r4_6 = r5_6 - r2_6:Length()
  end
  for r9_6 = 1, r4_6, 1 do
    local r10_6 = NewObject(r0_0.GetCommonItemContentClass())
    r10_6.Icon = nil
    r10_6.Parent = r0_6
    r0_6.List_Item:AddItem(r10_6)
  end
  if r1_6 then
    AudioManager(r0_6):PlayUISound(r0_6, "event:/ui/common/refresh_item_list", nil, nil)
    r0_6._ListAnimTimerKeys = r0_0.PlayListViewFramingInAnimation(r0_6, r0_6.List_Item, {
      Interval = 0.01,
      Callback = function()
        -- line: [139, 141] id: 7
      end,
    })
  end
end
function r4_0.OnRefreshListBegin(r0_8)
  -- line: [145, 146] id: 8
end
function r4_0.OnRefreshListEnd(r0_9)
  -- line: [148, 153] id: 9
  if not r0_9.InputBox:HasUserFocusedDescendants(r0_9:GetOwningPlayer()) then
    r0_9:SetFocus()
  end
  r0_9:JumpToSelectItem()
end
function r4_0.JumpToSelectItem(r0_10)
  -- line: [155, 163] id: 10
  if r0_10.List_Item:GetNumItems() > 0 and r0_10.NeedSelectGridIndex >= 0 then
    local r2_10 = r0_10.List_Item:GetItemAt(r0_10.NeedSelectGridIndex)
    r0_10.List_Item:ScrollIndexIntoView(r0_10.NeedSelectGridIndex)
    r0_10:OnListItemSelected(r2_10)
  end
  r0_10.NeedSelectItemId = nil
end
function r4_0.OnListEmpty(r0_11, r1_11)
  -- line: [165, 176] id: 11
  if r1_11 == r3_0.AllOptionName.SearchClick or r1_11 == r3_0.AllOptionName.ShowNotHaveClick or r0_11.SearchKeyWords ~= "" then
    r0_11.HB_Empty:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_11.Text_Empty_Search:SetText(GText("UI_Walnut_Not_Find"))
    r0_11.Text_Empty_World_1:SetText(EnText("UI_Walnut_Not_Find"))
    r0_11.Panel_Empty_Search:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r0_11.Panel_ItemList:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    r0_11.HB_Empty:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r0_11.Panel_ItemList:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r4_0.OnListFillWith(r0_12, r1_12)
  -- line: [178, 197] id: 12
  r0_12.HB_Empty:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_12.Panel_ItemList:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_12.Panel_Empty_Search:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_12.NeedSelectGridIndex = -1
  for r6_12, r7_12 in ipairs(r0_12.ListDatas) do
    if r1_12 ~= "ShowHaveWalnutOnly" or r7_12.Count > 0 then
      local r8_12 = NewObject(r0_0.GetCommonItemContentClass())
      r0_12:SetupListContent(r6_12, r7_12, r8_12)
      r0_12.ItemId2Index[r7_12.Id] = r6_12
      if r0_12.NeedSelectItemId ~= nil and r0_12.NeedSelectItemId == r7_12.Id then
        r0_12.NeedSelectGridIndex = r6_12 + -1
      end
      r0_12.List_Item:AddItem(r8_12)
    end
  end
  -- close: r2_12
end
function r4_0._StopListFramingInAnim(r0_13)
  -- line: [199, 205] id: 13
  local r1_13 = {
    UIState = r0_13,
  }
  if r0_13._ListAnimTimerKeys then
    r1_13.TimerKeys = r0_13._ListAnimTimerKeys
  end
  r0_0.StopListViewFramingInAnimation(r0_13.List_Item, r1_13)
end
function r4_0.RefreshListItem(r0_14, r1_14, r2_14)
  -- line: [207, 226] id: 14
  if r2_14 == nil then
    r2_14 = true
  end
  if not r0_14.ItemId2Index then
    DebugPrint(ErrorTag, "WalnutBagListBase:ItemId2Index is nil")
    return 
  end
  local r3_14 = r0_14.ItemId2Index[r1_14.ItemId]
  if not r3_14 then
    DebugPrint(ErrorTag, "WalnutBagListBase:ItemId2Index is not Contains Uid")
    return 
  end
  local r4_14 = r0_14.List_Item:GetItemAt(r3_14 + -1)
  r4_14.Data = r1_14
  if IsValid(r4_14.UI) then
    r4_14.UI:OnListItemObjectSet(r4_14)
  end
  if r2_14 then
    r0_14:OnRefreshListLater(false)
  end
end
function r4_0.RefreshWalnutSaleItemSelect(r0_15, r1_15)
  -- line: [228, 238] id: 15
  if r0_15.BagSellState and r0_15.DesireSaleWalnutObjList[r1_15.Id] ~= nil then
    local r2_15 = UIManager(r0_15):GetUI("WalnutSelectToList")
    if r2_15 then
      r2_15:AddWalnutItemToList(r1_15)
    end
  end
end
return r4_0
