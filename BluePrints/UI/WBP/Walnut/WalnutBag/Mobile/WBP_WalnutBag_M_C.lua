-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Walnut\WalnutBag\Mobile\WBP_WalnutBag_M_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r1_0 = require("BluePrints.UI.WBP.Walnut.WalnutBag.WalnutBagController"):GetModel()
local r2_0 = require("BluePrints.UI.WBP.Walnut.WalnutBag.WalnutBagCommon")
local r3_0 = Class({
  "BluePrints.UI.BP_UIState_C",
  "BluePrints.UI.WBP.Walnut.WalnutBag.Base.WalnutBagListBase"
})
r3_0._components = {
  "BluePrints.UI.WBP.Walnut.WalnutBag.Base.WalnutBagBaseView",
  "BluePrints.UI.UI_PC.Common.HorizontalListViewResizeComp",
  "BluePrints.UI.UI_PC.Common.LSFocusComp"
}
function r3_0.Initialize(r0_1, r1_1)
  -- line: [23, 40] id: 1
  r0_1.Super.Initialize(r0_1)
  r0_1.CurTabId = nil
  r0_1.NpcId = r2_0.NpcId
  r0_1.AllTabInfo = {}
  r0_1.AllReddotItemsId = {}
  r0_1.CurFocusWidget = nil
  r0_1.BottomKeyInfoList = nil
  r0_1.NeedSelectTabId = nil
  r0_1.NeedSelectItemId = nil
  r0_1.NeedSelectGridIndex = -1
  r0_1.CurSelectGridIndex = 1
  r0_1.CurSelectWalnutContent = nil
  r0_1.BagSellState = false
  r0_1.DesireSaleStuffObjList = {}
  r0_1.CurSelectStuffContent = nil
  r0_1.bIsWalnutSelling = false
end
function r3_0.Construct(r0_2)
  -- line: [42, 46] id: 2
  r0_2.Super.Construct(r0_2)
  r0_2:RefreshBaseInfo()
  r0_2:CheckIsCanSellWalnut()
end
function r3_0.Close(r0_3)
  -- line: [48, 58] id: 3
  local r1_3 = UIManager(r0_3):GetUIObj(r2_0.WalnutSelectUIName)
  if r1_3 ~= nil then
    r1_3:Close()
  end
  r1_0:ClearReddotCount()
  r0_3:HorizontalListViewResize_TearDown()
  r0_3.CheckBox_Own:UnInitCommonCheckBox()
  r0_3:_StopListFramingInAnim()
  r3_0.Super.Close(r0_3)
end
function r3_0.OnFocusReceived(r0_4, r1_4, r2_4)
  -- line: [60, 63] id: 4
  r0_4.Walnut_Detail:ResetInfo()
  return r3_0.Super.OnFocusReceived(r0_4, r1_4, r2_4)
end
function r3_0.ReceiveEnterState(r0_5, r1_5)
  -- line: [65, 72] id: 5
  r3_0.Super.ReceiveEnterState(r0_5, r1_5)
  if r1_5 == 1 then
    r0_5:RefreshList(true, r2_0.AllOptionName.TabClick)
  end
  r0_5.AllReddotItemsId = r1_0:GetAllNewItemsId()
end
function r3_0.ReceiveExitState(r0_6, r1_6)
  -- line: [74, 83] id: 6
  r0_6.Super.ReceiveExitState(r0_6, r1_6)
  if r1_6 == 0 then
    local r2_6 = UIManager(r0_6):GetUI(r2_0.WalnutSelectUIName)
    if r2_6 ~= nil then
      r2_6:PlayOutAnim()
    end
  end
end
function r3_0.InitTabInfo(r0_7)
  -- line: [85, 105] id: 7
  local r1_7 = {}
  local r2_7 = {
    Text = GText("UI_TAB_NAME_ALL"),
    IconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_All.T_Tab_All",
    TabId = 1,
  }
  r2_7.IsNew = #r0_7.AllReddotItemsId > 0
  -- setlist for #1 failed
  r0_7.AllTabInfo = r1_7
  for r5_7, r6_7 in pairs(DataMgr.WalnutType) do
    local r7_7 = false
    if r0_7.AllReddotItemsId[r6_7.WalnutType] ~= nil then
      r7_7 = true
    end
    table.insert(r0_7.AllTabInfo, {
      Text = GText(r6_7.Name),
      IconPath = r6_7.TabIcon,
      TabId = r5_7 + 1,
      IsNew = r7_7,
    })
  end
  -- close: r1_7
  r0_7.Tab_WalnutBag:Init({
    Tabs = r0_7.AllTabInfo,
    StyleName = "Image",
    OwnerPanel = r0_7,
    TitleName = GText("MAIN_UI_WALNUTBAG"),
    BackCallback = r0_7.OnReturnKeyDown,
  })
  r0_7.Tab_WalnutBag:BindEventOnTabSelected(r0_7, r0_7.WalnutTabItemClick)
  r0_7:AddDelayFrameFunc(function()
    -- line: [102, 104] id: 8
    r0_7.Tab_WalnutBag:SelectTabById(r0_7.NeedSelectTabId and r2_0.DefaultSelectTabId)
  end, 1, "FillWithWalnutItemInfo")
end
function r3_0.InitListenEvent(r0_9)
  -- line: [107, 109] id: 9
  r0_9:AddDispatcher(EventID.OnUpdateWalnutItem, r0_9, r0_9.OnUpdateWalnutItemByAction)
end
function r3_0.OnLoaded(r0_10, ...)
  -- line: [111, 117] id: 10
  local r2_10 = nil	-- notice: implicit variable refs by block#[0]
  local r1_10 = nil	-- notice: implicit variable refs by block#[0]
  r3_0.Super.OnLoaded(r0_10, ...)
  ... = ... -- error: untaken top expr
  r0_10.NeedSelectItemId = r2_10
  r0_10.NeedSelectTabId = r1_10
  r0_10:PlayInAnim()
  r0_10:InitBtnExplanation()
end
function r3_0.RefreshBottomKeyInfo(r0_11, r1_11)
  -- line: [119, 120] id: 11
end
function r3_0.InitBtnExplanation(r0_12)
  -- line: [122, 129] id: 12
  r0_12.Com_BtnExplanation:Init({
    ClickCallback = r0_12.OnBtnExplanationClickCallback,
    OwnerWidget = r0_12,
    PopupId = 100224,
    Desc = "UI_Walnut_Gacha_Des",
  })
end
function r3_0.OnBtnExplanationClickCallback(r0_13)
  -- line: [131, 133] id: 13
  print("lgc@ OnBtnExplanationClickCallback")
end
function r3_0.WalnutTabItemClick(r0_14, r1_14)
  -- line: [136, 157] id: 14
  r0_14.CurTabId = r1_14:GetTabId()
  r0_14.Walnut_Detail:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_14.ListCanvas:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_14:RefreshList(true, r2_0.AllOptionName.TabClick)
  r0_14:HorizontalListViewResize_SetUp(r0_14.Panel_ItemList, r0_14.List_Item, 0)
  r0_14:AddTimer(0.05, function()
    -- line: [149, 156] id: 15
    if r0_14.List_Item:GetNumItems() > 0 then
      local r0_15 = r0_14.List_Item:GetItemAt(0)
      if r0_15 then
        r0_14:OnListItemSelected(r0_15)
      end
    end
  end, false, 0, "SelectFirstWalnutItem", true)
end
function r3_0.OnUpdateWalnutItemByAction(r0_16, r1_16, r2_16, ...)
  -- line: [159, 189] id: 16
  local r3_16 = ErrorCode:Check(r2_16, UIConst.Tip_CommonToast)
  if not r3_16 then
    return 
  end
  if r1_16 == "WalnutBulkSale" then
    ... = ... -- error: untaken top expr
    local r5_16 = 0
    local r6_16 = true
    if not false then
      if r6_16 then
        r0_16:ReGenerateBagList()
      else
        r0_16.NeedSelectGridIndex = 0
        r0_16:JumpToSelectItem(false)
        r0_16:RefreshAllGridIndex()
      end
    end
    local r8_16 = {}
    local r9_16 = true
    local r10_16 = "Resources"
    r8_16[r10_16] = {}
    r9_16 = false
    for r15_16, r16_16 in pairs(r3_16) do
      r8_16[r10_16][r15_16] = r16_16
    end
    -- close: r11_16
    if not r9_16 then
      r0_16:ShowGetItemPage(r8_16)
    end
  end
  r0_16.bIsWalnutSelling = false
end
function r3_0.UpdateUIStyleInPlatform(r0_17, r1_17, r2_17)
  -- line: [191, 205] id: 17
end
function r3_0.OnKeyDown(r0_18, r1_18, r2_18)
  -- line: [207, 221] id: 18
  local r4_18 = UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_18))
  local r5_18 = false
  if r4_18 == "Escape" then
    r0_18:OnReturnKeyDown()
    r5_18 = true
  end
  if r5_18 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end
function r3_0.OnReturnKeyDown(r0_19)
  -- line: [223, 238] id: 19
  if r0_19.bIsWalnutSelling then
    return 
  end
  local r1_19 = UIManager(r0_19):GetUI("WalnutSelectToList")
  if r1_19 ~= nil then
    r1_19:PlayOutAnim()
    return 
  end
  if r0_19:CheckIsCanCloseSelf() then
    r0_19:PlayOutAnim()
  end
end
function r3_0.EnterWalnutSellState(r0_20)
  -- line: [241, 286] id: 20
  if r0_20.bIsWalnutSelling then
    return 
  end
  r0_20.Tab_WalnutBag:EnterViewSingleMode()
  r0_20.BagSellState = true
  r0_20:RefreshList(true, "ShowHaveWalnutOnly")
  r0_20.DesireSaleWalnutObjList = {}
  local r2_20 = UE4.UGameplayStatics.GetGameInstance(r0_20):GetGameUIManager()
  if r2_20 ~= nil then
    local r3_20 = nil
    if r0_20.CurSelectContent then
      if r0_20.CurSelectContent.SelfWidget then
        r0_20.CurSelectContent.SelfWidget:SetSelected(false)
      else
        r0_20.CurSelectContent.IsSelect = false
      end
      r0_20.WS_Detail:SetActiveWidgetIndex(1)
    end
    if r0_20:IsAnimationPlaying(r0_20.Sell_Close) then
      r0_20:StopAnimation(r0_20.Sell_Close)
    end
    r0_20:PlayAnimation(r0_20.Sell)
    r0_20.SellPage = r2_20:LoadUI(UIConst.WALNUTBAGSALESELECT, r2_0.WalnutSelectUIName, r2_0.WalnutBagSellPageZOrder, r0_20, r0_20.LeaveWalnutSellState, r0_20.RemoveItemSaleState, r0_20.RealToSaleWalnuts)
  end
  r0_20:UpdateAllItemsStyle(false)
end
function r3_0.LeaveWalnutSellState(r0_21)
  -- line: [288, 324] id: 21
  r0_21.Tab_WalnutBag:LeaveViewSingleMode()
  r0_21:RefreshList(true, r2_0.AllOptionName.TabClick)
  r0_21.BagSellState = false
  local r1_21 = r0_21.DesireSaleStuffObjList
  for r6_21 = 0, r0_21.List_Item:GetNumItems() + -1, 1 do
    local r7_21 = r0_21.List_Item:GetItemAt(r6_21)
    if r7_21.SelfWidget then
      r7_21.SelfWidget:SetSelectNum()
    end
  end
  r0_21:SetFocus_Lua()
  if r0_21:IsAnimationPlaying(r0_21.Sell) then
    r0_21:StopAnimation(r0_21.Sell)
  end
  r0_21:PlayAnimation(r0_21.Sell_Close)
  r0_21:AddTimer(0.05, function()
    -- line: [316, 323] id: 22
    if r0_21.List_Item:GetNumItems() > 0 then
      local r0_22 = r0_21.List_Item:GetItemAt(0)
      if r0_22 then
        r0_21:OnListItemSelected(r0_22)
      end
    end
  end, false, 0, "SelectFirstWalnutItem", true)
end
function r3_0.RealToSaleWalnuts(r0_23, r1_23, r2_23)
  -- line: [326, 343] id: 23
  local r3_23 = GWorld:GetAvatar()
  local r4_23 = {}
  local r5_23 = nil
  for r10_23, r11_23 in pairs(r1_23) do
    r5_23 = math.tointeger(r11_23.Uuid)
    r4_23[r5_23] = r2_23[r10_23]
  end
  -- close: r6_23
  if not IsEmptyTable(r4_23) then
    r3_23:WalnutBulkSale(r4_23)
  end
  local r6_23 = UIManager(r0_23):GetUI(r2_0.WalnutSelectUIName)
  if r6_23 ~= nil then
    r6_23:PlayOutAnim()
  end
  r0_23.bIsWalnutSelling = true
end
function r3_0.GetWalnutServerData(r0_24, r1_24)
  -- line: [345, 352] id: 24
  local r2_24 = GWorld:GetAvatar()
  local r3_24 = {}
  if r2_24 == nil then
    return 
  end
  r3_24.Id = r1_24
  r3_24.Count = r2_24.Walnuts:GetCount(r1_24) and 0
  return r3_24
end
function r3_0.ShowGetItemPage(r0_25, r1_25)
  -- line: [354, 370] id: 25
  local function r2_25()
    -- line: [355, 362] id: 26
    if r0_25.List_Item:GetNumItems() > 0 then
      local r0_26 = r0_25.List_Item:GetItemAt(0)
      if r0_26 then
        r0_25:OnListItemSelected(r0_26)
      end
    end
  end
  if r0_25.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    r0_25:AddTimer(0.1, function()
      -- line: [364, 366] id: 27
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, r1_25, false, r2_25, r0_25, true)
    end)
  else
    UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, r1_25, false, r2_25, r0_25, true)
  end
end
function r3_0.CheckIsCanSellWalnut(r0_28)
  -- line: [372, 383] id: 28
  local r2_28 = DataMgr.UIUnlockRule.WalnutSell.UIUnlockRuleId
  local r3_28 = GWorld:GetAvatar()
  if not r3_28 then
    return false
  end
  r0_28.SellUnlocked = r3_28:CheckUIUnlocked(r2_28)
  if not r0_28.SellUnlocked then
    r0_28.Btn_Sell:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    r0_28.Btn_Sell:SetVisibility(UE4.ESlateVisibility.Visable)
  end
end
AssembleComponents(r3_0)
return r3_0
