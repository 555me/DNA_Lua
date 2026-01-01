-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\Shop\WBP_Shop_Base_New_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("Utils.MiscUtils")
local r1_0 = Class("BluePrints.UI.BP_UIState_C")
function r1_0.InitShop(r0_1, r1_1, r2_1, r3_1, r4_1, r5_1)
  -- line: [15, 46] id: 1
  local r6_1 = UGameplayStatics.GetPlayerController(r0_1, 0)
  if IsValid(r6_1) then
    if CommonUtils.GetDeviceTypeByPlatformName(r0_1) == "PC" then
      r6_1.bShowMouseCursor = true
    else
      r6_1.bShowMouseCursor = false
    end
  end
  UGameplayStatics.GetPlayerCharacter(r0_1, 0):SetCanInteractiveTrigger(false)
  AudioManager(r0_1):PlayUISound(r0_1, "event:/ui/armory/open", "OpenShopMain", nil)
  if not r4_1 then
    DebugPrint("ShopType缺失，ZDX_请对应系统接口负责人传入商城具体的SystemName")
    r4_1 = "Shop"
  end
  r0_1.ShopType = r4_1
  r0_1.Common_SortList_PC:Init(r0_1, r0_1.Filters, CommonConst.ASC)
  r0_1.Common_SortList_PC:BindEventOnSelectionsChanged(r0_1, r0_1.BindEventOnSelectionsChanged)
  r0_1.Common_SortList_PC:BindEventOnSortTypeChanged(r0_1, r0_1.BindEventOnSortTypeChanged)
  r0_1.SelectShopItemId = r3_1
  r0_1:CommmonInitShop(r1_1, r2_1, r3_1, r4_1)
  r0_1:InitShopTabInfo(r1_1, r2_1, r4_1)
  if not r5_1 then
    r0_1:PlayAnimation(r0_1.In)
    r0_1:BlockAllUIInput(true)
  else
    r0_1:PlayAnimation(r0_1.In, 0, 1, EUMGSequencePlayMode.Forward, 6000, false)
    r0_1:BlockAllUIInput(true)
  end
end
function r1_0.CommmonInitShop(r0_2, r1_2, r2_2, r3_2, r4_2)
  -- line: [48, 64] id: 2
  r0_2.Group_BG:ClearChildren()
  local r5_2 = DataMgr.Shop[r4_2].ShopBgBPPath
  if r5_2 then
    local r7_2 = UE4.UWidgetBlueprintLibrary.Create(r0_2, LoadClass(r5_2))
    if r7_2 then
      r0_2.Group_BG:AddChild(r7_2)
      local r8_2 = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(r7_2)
      r8_2:SetPadding(FMargin(0, 0, 0, 0))
      r8_2:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
      r8_2:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
      r7_2:PlayAnimation(r7_2.In)
    end
  end
end
function r1_0.LoadShopTabInfo(r0_3, r1_3)
  -- line: [65, 121] id: 3
  local r2_3 = GWorld:GetAvatar()
  if not r2_3 then
    return 
  end
  r0_3.MainTabList = {}
  r0_3.MainTabMap = {}
  r0_3.MainTabs = {}
  for r7_3, r8_3 in ipairs(r1_3.MainTabId) do
    if ShopUtils:IsCanOpenPay(true) then
      local r9_3 = DataMgr.ShopTabMain[r8_3]
      local r10_3 = {
        Text = GText(r9_3.MainName),
        TabId = r9_3.MainTabId,
        IconPath = r9_3.Icon,
      }
      if r9_3.ConditionId then
        r10_3.IsLocked = not r2_3.CheckUIUnlocked(r2_3, r9_3.ConditionId)
        r10_3.LockReasonText = GText(DataMgr.Condition[DataMgr.UIUnlockRule[r9_3.ConditionId].ConditionId].ConditionText)
      end
      if not r10_3.IsLocked or not r9_3.UnlockHide then
        table.insert(r0_3.MainTabList, r10_3)
      end
    end
  end
  -- close: r3_3
  for r7_3, r8_3 in ipairs(r0_3.MainTabList) do
    r0_3.MainTabs[r8_3.TabId] = r7_3
    table.insert(r0_3.MainTabMap, r8_3.TabId)
  end
  -- close: r3_3
  local r3_3 = {}
  r0_3.SubTabMapIdx = {}
  for r8_3, r9_3 in r0_0.PairsByKeys(DataMgr.ShopTabSub) do
    if ShopUtils:IsCanOpenPay(true) and r0_3.MainTabs[r9_3.MainTabId] then
      if not r3_3[r9_3.MainTabId] then
        r3_3[r9_3.MainTabId] = 1
      else
        r3_3[r9_3.MainTabId] = r3_3[r9_3.MainTabId] + 1
      end
      r0_3.SubTabMapIdx[r8_3] = r3_3[r9_3.MainTabId]
    end
  end
  -- close: r4_3
  r0_3.OverridenTopResouces = nil
  if type(r0_3.GetOverrideTopResource) == "function" then
    r0_3.OverridenTopResouces = r0_3:GetOverrideTopResource()
  end
end
function r1_0.LoadMainTabInfo(r0_4, r1_4)
  -- line: [126, 159] id: 4
  local r2_4 = GWorld:GetAvatar()
  if not r2_4 then
    return 
  end
  r0_4:CleanTimer()
  r0_4.SubTabList = {}
  r0_4.SubTabMap = {}
  for r7_4, r8_4 in r0_0.PairsByKeys(DataMgr.ShopTabSub) do
    if r8_4.MainTabId == r1_4 and ShopUtils:IsCanOpenPay(true) then
      local r9_4 = {
        Text = GText(r8_4.SubName),
        TabId = r8_4.SubTabId,
        Data = r8_4,
      }
      if r8_4.ConditionId then
        r9_4.IsLocked = not r2_4.CheckUIUnlocked(r2_4, r8_4.ConditionId)
        r9_4.LockReasonText = GText(DataMgr.Condition[DataMgr.UIUnlockRule[r8_4.ConditionId].ConditionId].ConditionText)
      end
      if not r9_4.IsLocked or not r8_4.UnlockHide then
        table.insert(r0_4.SubTabList, r9_4)
      end
    end
  end
  -- close: r3_4
  table.sort(r0_4.SubTabList, function(r0_5, r1_5)
    -- line: [153, 155] id: 5
    return r0_5.TabId < r1_5.TabId
  end)
  for r7_4, r8_4 in ipairs(r0_4.SubTabList) do
    table.insert(r0_4.SubTabMap, r8_4.Data)
  end
  -- close: r3_4
end
function r1_0.LoadSubTabInfo(r0_6, r1_6)
  -- line: [163, 186] id: 6
  r0_6:CleanTimer()
  r0_6.CurSubTabMap = r1_6
  EventManager:FireEvent(EventID.OnMenuClose)
  if r1_6.TabCoin then
    r0_6.TabCoinInfo = r1_6.TabCoin
  else
    assert(DataMgr.Shop[r0_6.ShopType].ShopUIName, "该商城对应的蓝图在SystemUI中不存在：" .. r0_6.ShopType)
    r0_6.TabCoinInfo = DataMgr.SystemUI[DataMgr.Shop[r0_6.ShopType].ShopUIName].TabCoin
  end
  r0_6.Common_Tab:OverrideTopResource(r0_6.TabCoinInfo)
  r0_6.Common_Tab:ResetDynamicNode()
  if r0_6.Common_Tab.WBP_Com_Tab_ResourceBar then
    r0_6.Common_Tab.WBP_Com_Tab_ResourceBar:SetLastFocusWidget(nil)
  end
  if r0_6.Common_Tab and r0_6.Common_Tab.UpdateBottomKeyInfo then
    r0_6.Common_Tab:UpdateBottomKeyInfo({
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = r0_6.CloseSelf,
            Owner = r0_6,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = r0_6.CloseSelf,
            Owner = r0_6,
          }
        },
        Desc = GText("UI_BACK"),
      }
    })
  end
end
function r1_0.UpdateShopDetail(r0_7, r1_7)
  -- line: [188, 442] id: 7
  local r2_7 = GWorld:GetAvatar()
  if not r2_7 then
    return 
  end
  local r3_7, r4_7 = r0_7.Common_SortList_PC:GetSortInfos()
  local r5_7 = {}
  for r10_7, r11_7 in pairs(DataMgr.ShopItem) do
    if r11_7.SubTabId == r1_7.SubTabId and ShopUtils:GetShopItemCanShow(r10_7) then
      if not r0_7.bFilterOwned then
        table.insert(r5_7, r11_7)
      elseif r11_7.ItemType == "Reward" then
        table.insert(r5_7, r11_7)
      elseif not r2_7[("Check" .. r11_7.ItemType .. "Enough")](r2_7, {
        [r11_7.TypeId] = 1,
      }) then
        table.insert(r5_7, r11_7)
      end
    end
  end
  -- close: r6_7
  local r6_7 = nil
  local function r7_7(r0_8, r1_8)
    -- line: [214, 223] id: 8
    if r4_7 == CommonConst.ASC then
      if r0_8.Sequence == r1_8.Sequence then
        return r1_8.ItemId < r0_8.ItemId
      end
      return r1_8.Sequence < r0_8.Sequence
    else
      return r0_8.Sequence < r1_8.Sequence
    end
  end
  local function r8_7(r0_9, r1_9)
    -- line: [224, 230] id: 9
    if r4_7 == CommonConst.ASC then
      return r0_9.StartTime < r1_9.StartTime
    else
      return r1_9.StartTime < r0_9.StartTime
    end
  end
  local function r9_7(r0_10, r1_10)
    -- line: [231, 241] id: 10
    local r2_10 = DataMgr[r0_10.ItemType][r0_10.TypeId]
    local r3_10 = DataMgr[r1_10.ItemType][r1_10.TypeId]
    local r4_10 = r2_10.Rarity and r2_10.WeaponRarity and 1
    local r5_10 = r3_10.Rarity and r3_10.WeaponRarity and 1
    if r4_7 == CommonConst.ASC then
      return r4_10 < r5_10
    else
      return r5_10 < r4_10
    end
  end
  local function r10_7(r0_11, r1_11)
    -- line: [242, 248] id: 11
    if r4_7 == CommonConst.ASC then
      return ShopUtils:GetShopItemPrice(r0_11.ItemId) < ShopUtils:GetShopItemPrice(r1_11.ItemId)
    else
      return ShopUtils:GetShopItemPrice(r1_11.ItemId) < ShopUtils:GetShopItemPrice(r0_11.ItemId)
    end
  end
  if r3_7 == 1 then
    function r6_7(r0_12, r1_12)
      -- line: [251, 271] id: 12
      if r7_7(r0_12, r1_12) then
        return true
      elseif r7_7(r1_12, r0_12) then
        return false
      elseif r8_7(r0_12, r1_12) then
        return true
      elseif r8_7(r1_12, r0_12) then
        return false
      elseif r9_7(r0_12, r1_12) then
        return true
      elseif r9_7(r1_12, r0_12) then
        return false
      elseif r10_7(r0_12, r1_12) then
        return true
      elseif r10_7(r1_12, r0_12) then
        return false
      else
        return false
      end
    end
  elseif r3_7 == 3 then
    function r6_7(r0_13, r1_13)
      -- line: [274, 294] id: 13
      if r9_7(r0_13, r1_13) then
        return true
      elseif r9_7(r1_13, r0_13) then
        return false
      elseif r7_7(r0_13, r1_13) then
        return true
      elseif r7_7(r1_13, r0_13) then
        return false
      elseif r8_7(r0_13, r1_13) then
        return true
      elseif r8_7(r1_13, r0_13) then
        return false
      elseif r10_7(r0_13, r1_13) then
        return true
      elseif r10_7(r1_13, r0_13) then
        return false
      else
        return false
      end
    end
  elseif r3_7 == 2 then
    function r6_7(r0_14, r1_14)
      -- line: [297, 317] id: 14
      if r8_7(r0_14, r1_14) then
        return true
      elseif r8_7(r1_14, r0_14) then
        return false
      elseif r7_7(r0_14, r1_14) then
        return true
      elseif r7_7(r1_14, r0_14) then
        return false
      elseif r9_7(r0_14, r1_14) then
        return true
      elseif r9_7(r1_14, r0_14) then
        return false
      elseif r10_7(r0_14, r1_14) then
        return true
      elseif r10_7(r1_14, r0_14) then
        return false
      else
        return false
      end
    end
  else
    function r6_7(r0_15, r1_15)
      -- line: [320, 340] id: 15
      if r10_7(r0_15, r1_15) then
        return true
      elseif r10_7(r1_15, r0_15) then
        return false
      elseif r7_7(r0_15, r1_15) then
        return true
      elseif r7_7(r1_15, r0_15) then
        return false
      elseif r8_7(r0_15, r1_15) then
        return true
      elseif r8_7(r1_15, r0_15) then
        return false
      elseif r9_7(r0_15, r1_15) then
        return true
      elseif r9_7(r1_15, r0_15) then
        return false
      else
        return false
      end
    end
  end
  local r11_7 = {}
  local r12_7 = {}
  local r13_7 = {}
  for r18_7, r19_7 in pairs(r5_7) do
    if ShopUtils:GetShopItemPurchaseLimit(r19_7.ItemId) == 0 or r2_7:CheckShopItemUnique(r19_7.ItemId) then
      table.insert(r12_7, r19_7)
    elseif r2_7.Level < (r19_7.UnlockLevel and 0) then
      table.insert(r13_7, r19_7)
    else
      table.insert(r11_7, r19_7)
    end
  end
  -- close: r14_7
  table.sort(r11_7, r6_7)
  table.sort(r12_7, r6_7)
  table.sort(r13_7, r6_7)
  r5_7 = {}
  for r18_7, r19_7 in ipairs(r11_7) do
    table.insert(r5_7, r19_7)
  end
  -- close: r14_7
  for r18_7, r19_7 in ipairs(r13_7) do
    table.insert(r5_7, r19_7)
  end
  -- close: r14_7
  for r18_7, r19_7 in ipairs(r12_7) do
    table.insert(r5_7, r19_7)
  end
  -- close: r14_7
  if r0_7.CurSubTabMap.TabType == "Pack" then
    r0_7.VB_ItemList:SetVisibility(ESlateVisibility.Collapsed)
    r0_7:InitPayGiftPage(r5_7)
    return 
  end
  r0_7.List_Item:ScrollIndexIntoView(0)
  r0_7.List_Item:ClearListItems()
  r0_7.ShopItemNum = #r5_7
  r0_7.Index2ShopSkin = {}
  r0_7.ShopSkin2Index = {}
  r0_7.SkinCount = 0
  for r17_7 = 1, r0_7.ShopItemNum, 1 do
    local r18_7 = r5_7[r17_7]
    local r19_7 = NewObject(UIUtils.GetCommonItemContentClass())
    r19_7.ShopType = r0_7.ShopType
    r19_7.ShopId = r18_7.ItemId
    if r18_7.ItemType == "Skin" or r18_7.ItemType == "WeaponSkin" or r18_7.ItemType == "CharAccessory" or r18_7.ItemType == "WeaponAccessory" then
      r0_7.SkinCount = r0_7.SkinCount + 1
      r0_7.Index2ShopSkin[r0_7.SkinCount] = r18_7.ItemId
      r0_7.ShopSkin2Index[r18_7.ItemId] = r0_7.SkinCount
    end
    if r18_7.ItemType == "Resource" and DataMgr.Resource[r18_7.TypeId] and DataMgr.Resource[r18_7.TypeId].ResourceSType == "GestureItem" then
      r0_7.SkinCount = r0_7.SkinCount + 1
      r0_7.Index2ShopSkin[r0_7.SkinCount] = r18_7.ItemId
      r0_7.ShopSkin2Index[r18_7.ItemId] = r0_7.SkinCount
    end
    if r0_7.SelectShopItemId and r0_7.SelectShopItemId == r18_7.ItemId and ShopUtils:GetShopItemPurchaseLimit(r0_7.SelectShopItemId) ~= 0 then
      r0_7.ItemIndex = r17_7 + -1
    end
    r0_7.List_Item:AddItem(r19_7)
  end
  r0_7:HorizontalListViewResize_SetUp(r0_7.Group_Item, r0_7.List_Item, 0.5)
  local r15_7 = UIManager(r0_7):GetGameInputModeSubsystem(r0_7)
  if r0_7.List_Item:GetNumItems() > 0 then
    r0_7.Group_Bottom:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_7:AddTimer(0.1, function()
      -- line: [416, 431] id: 16
      if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
        r15_7:SetNavigateWidgetVisibility(true)
      end
      r0_7.VB_ItemList:SetVisibility(ESlateVisibility.Visible)
      r0_7.Group_Empty:SetVisibility(ESlateVisibility.Collapsed)
      r0_7.List_Item:RequestFillEmptyContent()
      r0_7.List_Item:RequestPlayEntriesAnim()
      if not CommonUtils:IfExistSystemGuideUI(r0_7) or r0_7:HasAnyFocus() or r0_7:HasFocusedDescendants() then
        r0_7.List_Item:SetFocus()
      end
      if r0_7.ItemIndex then
        r0_7.List_Item:ScrollIndexIntoView(r0_7.ItemIndex)
      end
      r0_7.ItemIndex = nil
    end)
  else
    r15_7:SetNavigateWidgetVisibility(false)
    r0_7.VB_ItemList:SetVisibility(ESlateVisibility.Collapsed)
    r0_7.Group_Empty:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    if r0_7.bFilterOwned then
      r0_7.Group_Bottom:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    else
      r0_7.Group_Bottom:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
end
function r1_0.OnClickFilterOwned(r0_17)
  -- line: [444, 457] id: 17
  if r0_17:IsAnimationPlaying(r0_17.Filtrate) then
    return 
  end
  if r0_17.bFilterOwned then
    r0_17:PlayAnimationReverse(r0_17.Filtrate)
  else
    r0_17:PlayAnimation(r0_17.Filtrate)
  end
  AudioManager(r0_17):PlayUISound(r0_17, "event:/ui/common/click_btn_small", nil, nil)
  r0_17.bFilterOwned = not r0_17.bFilterOwned
  r0_17:UpdateShopDetail(r0_17.CurSubTabMap, true)
end
function r1_0.GetOverrideTopResource(r0_18)
  -- line: [459, 463] id: 18
  if r0_18.TabCoinInfo then
    return r0_18.TabCoinInfo
  end
end
function r1_0.CloseSelf(r0_19)
  -- line: [465, 476] id: 19
  if r0_19:IsAnimationPlaying(r0_19.Out) then
    return 
  end
  r0_19:BlockAllUIInput(true)
  AudioManager(r0_19):SetEventSoundParam(r0_19, "OpenShopMain", {
    ToEnd = 1,
  })
  if r0_19.IsAddInDeque then
    r0_19:PlayAnimationForward(r0_19.Out, UIConst.AnimOutSpeedWithPageJump.MaxSpeed)
  else
    r0_19:PlayAnimation(r0_19.Out)
  end
end
function r1_0.BindEventOnSelectionsChanged(r0_20, r1_20, r2_20, r3_20, r4_20)
  -- line: [478, 480] id: 20
  r0_20:UpdateShopDetail(r0_20.CurSubTabMap)
end
function r1_0.BindEventOnSortTypeChanged(r0_21, r1_21)
  -- line: [482, 484] id: 21
  r0_21:UpdateShopDetail(r0_21.CurSubTabMap)
end
function r1_0.ShowItemDetail(r0_22)
  -- line: [486, 550] id: 22
  if not DataMgr.ShopItem[r0_22.SelectShopItemId] then
    return 
  end
  r0_22.ShopItemData = setmetatable({}, {
    __index = DataMgr.ShopItem[r0_22.SelectShopItemId],
  })
  if not r0_22.ShopItemData then
    return 
  end
  local r1_22 = r0_22.ShopItemData.TypeId
  local r2_22 = r0_22.ShopItemData.ItemType
  AudioManager(r0_22):PlayItemSound(r0_22, r1_22, "Click", r2_22)
  local r3_22 = ShopUtils:GetShopItemPurchaseLimit(r0_22.SelectShopItemId)
  local r4_22 = DataMgr[r2_22][r1_22]
  local r5_22 = nil
  if r2_22 == "Reward" and (DataMgr.Reward[r4_22.RewardId].Mode == "Fixed" or DataMgr.Reward[r4_22.RewardId].Mode == "Once") then
    if r0_22.ShopItemData.Bg == 1 then
      UIManager(r0_22):LoadUINew("PayGiftPopup_Yellow", r0_22.ShopItemData, r0_22)
    elseif r0_22.ShopItemData.Bg == 2 then
      UIManager(r0_22):LoadUINew("PayGiftPopup_Purple", r0_22.ShopItemData, r0_22)
    else
      UIManager(r0_22):LoadUINew("PayGiftPopup_Purple", r0_22.ShopItemData, r0_22)
    end
  elseif r3_22 == 0 then
    r5_22 = 100042
  else
    r5_22 = 100041
  end
  if not r5_22 then
    return 
  end
  local r6_22 = {
    [1] = {},
  }
  r6_22[1].FundId = r0_22.ShopItemData.PriceType
  r6_22[1].FundNeed = ShopUtils:GetShopItemPrice(r0_22.ShopItemData.ItemId)
  local r7_22 = DataMgr.Shop[r0_22.ShopType].ShopUIName
  local r8_22 = UIManager(r0_22):ShowCommonPopupUI(r5_22, {
    ShopItemData = r0_22.ShopItemData,
    ShopType = 0,
    Funds = r6_22,
    ShowParentTabCoin = true,
    LeftCallbackObj = r0_22,
    LeftCallbackFunction = function(r0_23, r1_23)
      -- line: [526, 531] id: 23
      local r2_23 = UIManager(r0_22):GetUIObj(r7_22)
      if r2_23 then
        r2_23:SetFocus()
      end
    end,
    RightCallbackObj = r0_22,
    RightCallbackFunction = function(r0_24, r1_24)
      -- line: [533, 535] id: 24
      r1_24.Content_1.CallFunc(r1_24.Content_1.CallObj)
    end,
    ForbiddenRightCallbackObj = r0_22,
    ForbiddenRightCallbackFunction = function(r0_25, r1_25)
      -- line: [537, 539] id: 25
      r1_25.Content_1.CallFunc(r1_25.Content_1.CallObj)
    end,
    DontFocusParentWidget = true,
    CloseBtnCallbackObj = r0_22,
    CloseBtnCallbackFunction = function(r0_26, r1_26)
      -- line: [542, 547] id: 26
      local r2_26 = UIManager(r0_22):GetUIObj(r7_22)
      if r2_26 then
        r2_26:SetFocus()
      end
    end,
    ForbidRightBtn = not ShopUtils:CanPurchase(r0_22.ShopItemData, r6_22[1].FundId, r6_22[1].FundNeed),
  }, UIManager(r0_22):GetUIObj(r7_22))
end
function r1_0.OnKeyUp(r0_27, r1_27, r2_27)
  -- line: [552, 555] id: 27
  r0_27:OnKeyDownForLSComp(r1_27, r2_27)
  return r1_0.Super.OnKeyUp(r0_27, r1_27, r2_27)
end
function r1_0.OnKeyDown(r0_28, r1_28, r2_28)
  -- line: [557, 600] id: 28
  local r3_28 = UE4.UKismetInputLibrary.GetKey(r2_28)
  local r4_28 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_28)
  local r5_28 = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_28) and not r5_28 then
    r5_28 = r0_28:OnGamePadDown(r4_28)
  elseif r4_28 == "Escape" and not UIManager(r0_28):GetUIObj("CommonDialog") then
    r5_28 = true
    r0_28:CloseSelf()
  elseif r4_28 == "Q" then
    r5_28 = true
    r0_28.ShopTab:TabToLeft()
  elseif r4_28 == "E" then
    r5_28 = true
    r0_28.ShopTab:TabToRight()
  elseif r4_28 == "A" and r0_28.Common_Toggle_TabGroup_PC then
    r5_28 = true
    r0_28.Common_Toggle_TabGroup_PC:TabToLeft()
  elseif r4_28 == "D" and r0_28.Common_Toggle_TabGroup_PC then
    r5_28 = true
    r0_28.Common_Toggle_TabGroup_PC:TabToRight()
  end
  if r5_28 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    if r0_28.IsBannerPage and r0_28.BannerIdMap and r0_28.SelectBannerId then
      local r6_28 = r0_28.BannerIdMap[r0_28.SelectBannerId]
      if r6_28.OnKeyDown then
        return r6_28:OnKeyDown(r1_28, r2_28)
      end
    end
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end
function r1_0.OnRechargeFinished(r0_29, r1_29, r2_29, r3_29)
  -- line: [602, 623] id: 29
  r0_29:BlockAllUIInput(false)
  r0_29:RefreshSubTabData(r0_29.CurSubTabMap)
  if r1_29 == ErrorCode.RET_SUCCESS then
    if r3_29 and DataMgr.PayGoods[r2_29].ItemId then
      local r4_29 = DataMgr.ShopItem[DataMgr.PayGoods[r2_29].ItemId]
      assert(r4_29, "购买成功后读表ShopItemData为空", DataMgr.PayGoods[r2_29].ItemId)
      if r4_29.ItemType == "DailyPack" then
        UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, r3_29, r4_29.IsSpPopup, function()
          -- line: [612, 614] id: 30
          UIManager(r0_29):ShowUITip(UIConst.Tip_CommonToast, GText("UI_DailyPack_PurchaseDone"))
        end)
      else
        UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, r3_29, r4_29.IsSpPopup)
      end
    end
  else
    UIManager(GWorld.GameInstance):ShowError(r1_29, 1, "CommonToastMain")
  end
end
function r1_0.SetFocus_Lua(r0_31)
  -- line: [625, 632] id: 31
  if r0_31.List_Item:GetNumItems() > 0 then
    r0_31.List_Item:SetFocus()
  else
    r0_31:SetFocus()
  end
end
return r1_0
