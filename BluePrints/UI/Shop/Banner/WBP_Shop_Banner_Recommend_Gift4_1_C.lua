-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\Shop\Banner\WBP_Shop_Banner_Recommend_Gift4_1_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.Shop.Banner.WBP_Shop_Banner_Base_C"
})
function r0_0.Construct(r0_1)
  -- line: [17, 81] id: 1
  r0_0.Super.Construct(r0_1)
  local r1_1 = r0_1:GetBannerTabData("WBP_Shop_Recommend_Gift4_1")
  if not r1_1 then
    return 
  end
  r0_1.BannerTab = setmetatable({}, {
    __index = r1_1,
  })
  r0_1.BannerTab.ItemId = r0_1:GetValidItemId(r0_1.BannerTab)
  local r2_1 = nil
  if r0_1.BannerTab.PreviewId[1] then
    local r3_1 = DataMgr.Skin[r0_1.BannerTab.PreviewId[1]]
    if r3_1 then
      r2_1 = r3_1.Rarity
    end
  end
  if r0_1.WBP_Shop_Recommend_Common_TItle_C_0 and r0_1.WBP_Shop_Recommend_Common_TItle_C_0.Text_MainTitle and r2_1 then
    local r3_1 = {
      nil,
      nil,
      "Font_Blue",
      "Font_Purple",
      "Font_Gold",
      "Font_Red"
    }
    if r3_1[r2_1] and r0_1.WBP_Shop_Recommend_Common_TItle_C_0[r3_1[r2_1]] then
      r0_1.WBP_Shop_Recommend_Common_TItle_C_0.Text_MainTitle:SetFont(r0_1.WBP_Shop_Recommend_Common_TItle_C_0[r3_1[r2_1]])
    end
  end
  if r0_1.WBP_Shop_Recommend_Common_TItle_C_0 and r0_1.WBP_Shop_Recommend_Common_TItle_C_0.Text_MainTitle then
    r0_1.WBP_Shop_Recommend_Common_TItle_C_0.Text_MainTitle:SetText(GText(r1_1.Text1))
  end
  if r0_1.Text_ActivityDesc_White then
    r0_1.Text_ActivityDesc_White:SetText(GText("UI_Weapon_Preview"))
  end
  r0_1.ItemId = r0_1.BannerTab.ItemId
  if r0_1.ItemId and DataMgr.ShopItem[r0_1.ItemId] then
    r0_1.ShopItemData = setmetatable({}, {
      __index = DataMgr.ShopItem[r0_1.ItemId],
    })
  end
  r0_1.PreviewId = r1_1.PreviewId
  r0_1.Btn_Pay.Btn_Buy.OnClicked:Add(r0_1, r0_1.OnGoToInterface)
  r0_1.Btn_Pay.Btn_Buy.OnHovered:Add(r0_1, r0_1.OnGoToHovered)
  if r0_1.Btn_Qa then
    r0_1.Btn_Qa.Button_Area.OnClicked:Add(r0_1, r0_1.GoToPreview)
  end
  r0_1.Text_RewardTitle:SetText(GText("UI_Banner_Pack_All"))
  r0_1:InitTime()
  r0_1:InitReward()
  r0_1:UpdateBuyBtn()
  r0_1.Key_RewardTitle:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "LS",
      }
    },
  })
  r0_1.Btn_Pay.Key_ControllerBuy:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "A",
      }
    },
  })
  r0_1:UpdateGamePadKeyInfo(UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad)
end
function r0_0.OnGoToInterface(r0_2)
  -- line: [83, 96] id: 2
  AudioManager(r0_2):PlayUISound(r0_2, "event:/ui/common/gacha_btn_click_normal", nil, nil)
  if r0_2.bForbidden then
    UIManager(r0_2):ShowError(ErrorCode.RET_SHOPITEM_REMAIN_PURCHASE_TIMES_EQUAL_ZERO, 1, "CommonToastMain")
    return 
  end
  if r0_2.ShopItemData.Bg == 1 then
    UIManager(r0_2):LoadUINew("PayGiftPopup_Yellow", r0_2.ShopItemData, r0_2)
  elseif r0_2.ShopItemData.Bg == 2 then
    UIManager(r0_2):LoadUINew("PayGiftPopup_Purple", r0_2.ShopItemData, r0_2)
  else
    UIManager(r0_2):LoadUINew("PayGiftPopup_Purple", r0_2.ShopItemData, r0_2)
  end
end
function r0_0.UpdateBuyBtn(r0_3)
  -- line: [99, 137] id: 3
  local r1_3 = ShopUtils:GetShopItemPurchaseLimit(r0_3.ItemId)
  local r2_3 = DataMgr.ShopItem[r0_3.ItemId].ShowBonus
  local r3_3 = TimeUtils.NowTime()
  if r0_3.Btn_Pay and r0_3.Btn_Pay.Btn_Buy then
    r0_3.Btn_Pay.Group_BuyNum:SetVisibility(ESlateVisibility.Collapsed)
    r0_3.Btn_Pay.WS_Detail:SetActiveWidgetIndex(0)
    r0_3.Btn_Pay.Text_PriceMoneySymbol:SetText(GText(ShopUtils:GetCurrencyType()))
    r0_3.Btn_Pay.Text_PriceMoneyNum:SetText(DataMgr.PayGoods[r0_3.BannerTab.GoodsId][ShopUtils:GetCurrencyPrice()])
  end
  if r2_3 and r1_3 > 0 then
    r0_3.Btn_Pay.Group_More:SetVisibility(ESlateVisibility.Visibie)
    r0_3.Btn_Pay.Text_MoreNum:SetText("+" .. r2_3)
  else
    r0_3.Btn_Pay.Group_More:SetVisibility(ESlateVisibility.Collapsed)
  end
  if r1_3 > 0 then
    r0_3.Btn_Pay.Group_BuyNum:SetVisibility(ESlateVisibility.Visibie)
    r0_3.Btn_Pay.WS_Detail:SetVisibility(ESlateVisibility.Visibie)
    r0_3.Btn_Pay.Text_BuyNum:SetText(GText("UI_Banner_Remain_Buy") .. r1_3)
    r0_3.Btn_Pay.Text_BtnBuy:SetText(GText("UI_SHOP_PURCHASE"))
    r0_3.Btn_Pay:ForbidBtn(false)
    r0_3.bForbidden = false
  else
    r0_3.Btn_Pay.Group_BuyNum:SetVisibility(ESlateVisibility.Collapsed)
    r0_3.Btn_Pay.Text_BtnEmpty:SetText(GText("UI_SHOP_SOLDOUT"))
    r0_3.Btn_Pay:ForbidBtn(true)
    r0_3.Btn_Pay.WS_Detail:SetVisibility(ESlateVisibility.Collapsed)
    r0_3.bForbidden = true
  end
end
function r0_0.Destruct(r0_4)
  -- line: [141, 142] id: 4
end
function r0_0.InitTime(r0_5)
  -- line: [144, 155] id: 5
  r0_5.EndTime = r0_5.BannerTab and r0_5.BannerTab.EndTime
  if r0_5.EndTime then
    r0_5.HB_Time:SetVisibility(ESlateVisibility.HitTestInvisible)
    r0_5.RefreshTimer = r0_5:AddTimer(1, function()
      -- line: [148, 150] id: 6
      r0_5:NotifyTimeTick()
    end, true, 0, "Shop_Recommend_Gift4_1", true)
    r0_5:NotifyTimeTick()
  else
    r0_5.HB_Time:SetVisibility(ESlateVisibility.Collapsed)
  end
end
function r0_0.NotifyTimeTick(r0_7)
  -- line: [157, 169] id: 7
  if not r0_7.EndTime then
    return 
  end
  if r0_7.EndTime <= TimeUtils.NowTime() then
    r0_7.Activity_Time:SetForeverTimeText(GText("UI_GameEvent_EventTimeRemain"))
    r0_7:RemoveTimer("Shop_Recommend_Gift4_1")
    return 
  end
  local r2_7, r3_7 = UIUtils.GetLeftTimeStrStyle2(r0_7.EndTime)
  r0_7.Activity_Time:SetTimeText(GText("UI_Mail_Date_Remain"), r2_7)
end
function r0_0.GoToPreview(r0_8)
  -- line: [171, 178] id: 8
  UIManager(r0_8):LoadUINew("ArmoryDetail", {
    IsPreviewMode = true,
    PreviewWeaponIds = r0_8.PreviewId,
    EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon,
    bNoEndCamera = true,
  })
end
function r0_0.InitBannerPage(r0_9, r1_9, r2_9)
  -- line: [180, 188] id: 9
  if r1_9 then
    r0_9.BannerId = r1_9
  end
  r0_9.Owner = r2_9
  r0_9:PlayInAnimation()
  r0_9:AdjustGroupDetail()
  AudioManager(r0_9):PlayUISound(r0_9, "event:/ui/common/shop_recommend_gift_1", nil, nil)
end
function r0_0.InitReward(r0_10)
  -- line: [190, 230] id: 10
  local r2_10 = DataMgr.Reward[DataMgr.ShopItem[r0_10.ItemId].TypeId]
  if r2_10 then
    r0_10.RewardList = {}
    local r3_10 = r2_10.Id
    local r4_10 = r2_10.Count
    local r5_10 = r2_10.Type
    for r9_10 = 1, #r3_10, 1 do
      local r10_10 = r3_10[r9_10]
      table.insert(r0_10.RewardList, {
        Id = r10_10,
        Type = r5_10[r9_10],
        ItemCount = RewardUtils:GetCount(r4_10[r9_10]),
        Icon = ItemUtils.GetItemIcon(r10_10, r5_10[r9_10]),
        Rarity = ItemUtils.GetItemRarity(r10_10, r5_10[r9_10]),
      })
    end
    r0_10.List_Reward:ClearListItems()
    for r10_10, r11_10 in pairs(r0_10.RewardList) do
      local r12_10 = NewObject(UIUtils.GetCommonItemContentClass())
      r12_10.Id = r11_10.Id
      r12_10.Icon = ItemUtils.GetItemIconPath(r11_10.Id, r11_10.Type)
      r12_10.ParentWidget = r0_10
      r12_10.ItemType = r11_10.Type
      r12_10.Count = r11_10.ItemCount
      r12_10.Rarity = r11_10.Rarity and 1
      r12_10.IsShowDetails = true
      function r12_10.AfterInitCallback(r0_11)
        -- line: [224, 226] id: 11
        r0_11:BindEvents(r0_10, {
          OnMenuOpenChanged = r0_10.OnRewardMenuOpenChanged,
        })
      end
      r0_10.List_Reward:AddItem(r12_10)
    end
    -- close: r6_10
  end
end
function r0_0.OnRewardMenuOpenChanged(r0_12, r1_12)
  -- line: [232, 239] id: 12
  local r2_12 = UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad
  if r1_12 and r2_12 then
    r0_12.Owner.Common_Tab:UpdateBottomKeyInfo({})
  elseif not r1_12 and r2_12 then
    r0_12.Owner:UpdateCommonTabInfoByReward()
  end
end
function r0_0.PlayInAnimation(r0_13)
  -- line: [242, 249] id: 13
  if r0_13:IsInAnimationPlaying() then
    return 
  end
  if r0_13.In then
    r0_13:PlayAnimation(r0_13.In)
  end
end
function r0_0.IsInAnimationPlaying(r0_14)
  -- line: [251, 257] id: 14
  if r0_14:IsAnimationPlaying(r0_14.In) or r0_14:IsAnimationPlaying(r0_14.Out) then
    return true
  end
  return false
end
function r0_0.PlayOutAnimation(r0_15)
  -- line: [259, 266] id: 15
  if r0_15:IsInAnimationPlaying() then
    return 
  end
  if r0_15.Out then
    r0_15:PlayAnimation(r0_15.Out)
  end
end
function r0_0.OnKeyDown(r0_16, r1_16, r2_16)
  -- line: [268, 284] id: 16
  local r3_16 = UE4.UKismetInputLibrary.GetKey(r2_16)
  local r4_16 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_16)
  local r5_16 = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_16) then
    r5_16 = r0_16:OnGamePadDown(r4_16)
  else
    r5_16 = r0_16:OnPCKeyDown(r4_16)
  end
  if r5_16 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end
function r0_0.OnGamePadDown(r0_17, r1_17)
  -- line: [286, 307] id: 17
  local r2_17 = false
  if r1_17 == UIConst.GamePadKey.FaceButtonBottom then
    r0_17:OnGoToInterface()
    r2_17 = true
  elseif r1_17 == UIConst.GamePadKey.FaceButtonLeft then
    r0_17:GoToPreview()
    r2_17 = true
  elseif r1_17 == UIConst.GamePadKey.LeftThumb then
    r0_17.List_Reward:SetFocus()
    r0_17.Owner:UpdateCommonTabInfoByReward()
    r0_17:ShowOrHideGamePadKey(ESlateVisibility.Collapsed)
  elseif r1_17 == UIConst.GamePadKey.FaceButtonRight and (r0_17.List_Reward:HasFocusedDescendants() or r0_17.List_Reward:HasAnyUserFocus()) then
    r0_17.Owner:GamePadFocusToSelectBannerItem()
    r0_17.Owner:UpdateCommonTabInfo()
    r0_17:ShowOrHideGamePadKey(ESlateVisibility.SelfHitTestInvisible)
    r2_17 = true
  end
  return r2_17
end
function r0_0.OnPCKeyDown(r0_18, r1_18)
  -- line: [308, 314] id: 18
  if r1_18 == "SpaceBar" then
    r0_18:OnGoToInterface()
    return true
  end
  return false
end
function r0_0.RefreshOpInfoByInputDevice(r0_19, r1_19, r2_19)
  -- line: [316, 319] id: 19
  r0_19:UpdateGamePadKeyInfo(r1_19 == ECommonInputType.Gamepad)
end
function r0_0.UpdateGamePadKeyInfo(r0_20, r1_20)
  -- line: [322, 338] id: 20
  if r1_20 then
    if r0_20.Btn_Pay and r0_20.Btn_Pay.Key_ControllerBuy then
      r0_20.Btn_Pay.Key_ControllerBuy:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
    if r0_20.Key_RewardTitle then
      r0_20.Key_RewardTitle:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
  else
    if r0_20.Btn_Pay and r0_20.Btn_Pay.Key_ControllerBuy then
      r0_20.Btn_Pay.Key_ControllerBuy:SetVisibility(ESlateVisibility.Collapsed)
    end
    if r0_20.Key_RewardTitle then
      r0_20.Key_RewardTitle:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
end
function r0_0.ShowOrHideGamePadKey(r0_21, r1_21)
  -- line: [340, 356] id: 21
  if r0_21.Btn_Pay and r0_21.Btn_Pay.Key_ControllerBuy then
    r0_21.Btn_Pay.Key_ControllerBuy:SetVisibility(r1_21)
  end
  if r0_21.Key_RewardTitle then
    r0_21.Key_RewardTitle:SetVisibility(r1_21)
  end
  if r0_21.Owner and r0_21.Owner.ShopTab.Key_Left then
    r0_21.Owner.ShopTab.Key_Left:SetVisibility(r1_21)
  end
  if r0_21.Owner and r0_21.Owner.ShopTab.Key_Right then
    r0_21.Owner.ShopTab.Key_Right:SetVisibility(r1_21)
  end
  if r0_21.Owner and r0_21.Owner.Common_Tab and r0_21.Owner.Common_Tab.WBP_Com_Tab_ResourceBar and r0_21.Owner.Common_Tab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad then
    r0_21.Owner.Common_Tab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(r1_21)
  end
end
return r0_0
