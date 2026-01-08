-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\UI_PC\RougeLike\PC\Shop\WBP_Rouge_ShopDetailItem_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.UI.BP_UIState_C"
})
function r0_0.Construct(r0_1)
  -- line: [16, 46] id: 1
  local r1_1 = GWorld:GetAvatar()
  local r2_1 = nil	-- notice: implicit variable refs by block#[3]
  if r1_1 then
    r2_1 = r1_1:GetCurrentRougeLikeTokenId()
    if not r2_1 then
      ::label_9::
      r2_1 = 0
    end
  else
    goto label_9	-- block#2 is visited secondly
  end
  local r3_1 = DataMgr.Resource[r2_1]
  local r4_1 = r0_1.Btn_Buy.Common_Item_Icon
  local r6_1 = {
    Id = r2_1,
    Icon = r3_1 and LoadObject(r3_1.Icon),
    ItemType = "Resource",
    UIName = "RougeShop",
    IsShowDetails = true,
    MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight,
  }
  r4_1:Init(r6_1)
  r0_1.Btn_Buy.Btn_Click.OnClicked:Add(r0_1, r0_1.RougePurchase)
  r0_1.Btn_Buy.Btn_Click.OnHovered:Add(r0_1, r0_1.OnPurchaseHovered)
  r0_1.Key_SuitSign:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = DataMgr.KeyboardText[UIConst.GamePadKey.LeftThumb].KeyText,
      }
    },
  })
  r0_1.Text_SuitUnlockTitle:SetText(GText("RLBlessingGroup_Active"))
  r0_1:InitListenEvent()
  r0_1:AddInputMethodChangedListen()
  UIUtils.InitDefinitionTextWidget(r0_1, r0_1.Text_DetailDesc, "ExplanationId")
end
function r0_0.InitListenEvent(r0_2)
  -- line: [48, 51] id: 2
  r0_2:AddDispatcher(EventID.OnRougeInfoUpdate, r0_2, r0_2.OnRougeInfoUpdate)
end
function r0_0.UpdateDetails(r0_3, r1_3, r2_3, r3_3, r4_3, r5_3, r6_3)
  -- line: [60, 108] id: 3
  r0_3.RougeLikeManager = GWorld.RougeLikeManager
  assert(r0_3.RougeLikeManager, "RougeLikeManager未找到")
  local r7_3 = DataMgr["RougeLike" .. r1_3][r2_3]
  assert(r7_3, "肉鸽商城未找到该商品信息: Type:" .. r1_3 .. " Id:" .. r2_3)
  r0_3.Type = r1_3
  r0_3.ItemId = r2_3
  r0_3.ShopId = r3_3
  r0_3.Price = r4_3
  r0_3.IsSoldOut = r5_3
  r0_3.Btn_Buy.Parent = r0_3
  r0_3.IsCanLevelUp = r6_3
  r0_3.PurchaseFailRes = 0
  r0_3.Text_Title:SetText(GText(r7_3.Name))
  r0_3.Rarity = r7_3[r1_3 .. "Rarity"]
  r0_3:SetIcon(r7_3.Icon)
  r0_3:SetRarity(r0_3.Rarity)
  local r8_3 = r7_3.TypeIcon
  r0_3.ExplanationId = r7_3.ExplanationId
  if r0_3.Type == "Blessing" then
    r0_3.Group_Buff:SetVisibility(ESlateVisibility.Visible)
    r0_3:SetBuffType(r8_3)
  else
    r0_3.Group_Buff:SetVisibility(ESlateVisibility.Collapsed)
  end
  if r0_3.ExplanationId then
    r0_3.CanShowExplanation = true
    r0_3.Btn_DetailDesc:SetForbidden(true)
  else
    r0_3.CanShowExplanation = false
    r0_3.Btn_DetailDesc:SetForbidden(false)
  end
  r0_3:CanPurchase(r0_3.Price)
  r0_3:SetDesc()
  r0_3:SetSuit()
  local r9_3 = UIManager(r0_3):GetUIObj("RougeShop")
  assert(r9_3, "肉鸽商城不存在")
  EMUIAnimationSubsystem:EMPlayAnimation(r9_3, r9_3.Switch)
  r0_3.bSkipDefinitionAutoInit = true
  UIUtils.SetDefinitionText(r0_3.Text_DetailDesc, r0_3.ExplanationId)
  r0_3:OnUpdateUIStyleByInputTypeChange(UIUtils.UtilsGetCurrentInputType(), UIUtils.UtilsGetCurrentGamepadName())
end
function r0_0.SetRarity(r0_4, r1_4)
  -- line: [110, 130] id: 4
  local r2_4 = nil
  local r3_4 = nil
  if r1_4 == 1 then
    r2_4 = r0_4.DetailBG_Blue
    r3_4 = r0_4.TitleQuality_Blue
    EMUIAnimationSubsystem:EMPlayAnimation(r0_4, r0_4.Blue)
  elseif r1_4 == 2 then
    r2_4 = r0_4.DetailBG_Purple
    r3_4 = r0_4.TitleQuality_Purple
    EMUIAnimationSubsystem:EMPlayAnimation(r0_4, r0_4.Purple)
  elseif r1_4 == 3 then
    r2_4 = r0_4.DetailBG_Yellow
    r3_4 = r0_4.TitleQuality_Yellow
    EMUIAnimationSubsystem:EMPlayAnimation(r0_4, r0_4.Yellow)
  else
    DebugPrint("ZDX_肉鸽商城商品稀有度错误")
    return 
  end
  r0_4.Image_ShopItemType:SetBrushFromTexture(r2_4)
  r0_4.Image_TitleQuality:SetBrushFromTexture(r3_4)
end
function r0_0.SetIcon(r0_5, r1_5)
  -- line: [132, 153] id: 5
  if not r1_5 then
    return 
  end
  if r0_5.Type == "Blessing" then
    r0_5.WS_Item:SetActiveWidgetIndex(0)
    if r0_5.Rarity == 1 then
      r0_5.WBP_Rouge_BlessIcon:PlayAnimation(r0_5.WBP_Rouge_BlessIcon.Blue)
    elseif r0_5.Rarity == 2 then
      r0_5.WBP_Rouge_BlessIcon:PlayAnimation(r0_5.WBP_Rouge_BlessIcon.Purple)
    elseif r0_5.Rarity == 3 then
      r0_5.WBP_Rouge_BlessIcon:PlayAnimation(r0_5.WBP_Rouge_BlessIcon.Yellow)
    end
    local r2_5 = r0_5.WBP_Rouge_BlessIcon.Image_Icon:GetDynamicMaterial()
    if IsValid(r2_5) then
      r2_5:SetTextureParameterValue("MainTex", LoadObject(r1_5))
    end
  elseif r0_5.Type == "Treasure" then
    r0_5.WS_Item:SetActiveWidgetIndex(1)
    r0_5.Image_TreasureIcon:SetBrushResourceObject(LoadObject(r1_5))
  end
end
function r0_0.SetBuffType(r0_6, r1_6)
  -- line: [155, 161] id: 6
  if not r1_6 then
    return 
  end
  r0_6.Image_BuffType:SetVisibility(ESlateVisibility.Visible)
  r0_6.Image_BuffType:SetBrushResourceObject(LoadObject(r1_6))
end
function r0_0.SetDesc(r0_7)
  -- line: [163, 192] id: 7
  local r1_7 = nil
  if r0_7.Type == "Blessing" then
    local r2_7 = r0_7.RougeLikeManager:GetBlessingLevel(r0_7.ItemId)
    if r0_7.IsSoldOut and r2_7 > 0 then
      r2_7 = r2_7 + -1
    end
    if r0_7.IsCanLevelUp and not r0_7.IsSoldOut then
      if r2_7 == 0 and not r0_7.IsSoldOut then
        DebugPrint("ZDX_肉鸽商城祝福等级错误:" .. r0_7.ItemId)
      else
        r1_7 = UIUtils.GenRougeBlessingDesc(r0_7.ItemId, r2_7 + -1, r2_7)
      end
    else
      r1_7 = UIUtils.GenRougeBlessingDesc(r0_7.ItemId, r2_7)
    end
    r0_7.GroupId = DataMgr.RougeLikeBlessing[r0_7.ItemId].BlessingGroup
    assert(r0_7.GroupId, "未找到祝福对应套装Id：" .. r0_7.GroupId)
    assert(DataMgr.BlessingGroup[r0_7.GroupId], "未找到套装数据：" .. r0_7.GroupId)
  elseif r0_7.Type == "Treasure" then
    r1_7 = UIUtils.GenRougeTreasureDesc(r0_7.ItemId)
    r0_7.GroupId = DataMgr.RougeLikeTreasure[r0_7.ItemId].TreasureGroup
  end
  r0_7.Text_DetailDesc:SetText(GText(r1_7))
  r0_7:SetBtnInfo(r0_7.IsCanLevelUp)
end
function r0_0.SetBtnInfo(r0_8, r1_8)
  -- line: [194, 213] id: 8
  local r2_8 = r0_8.Btn_Buy.Text_BtnTitle
  local r4_8 = nil	-- notice: implicit variable refs by block#[3]
  if r1_8 then
    r4_8 = GText("UI_RougeLike_Blessing_CanUpgrade")
    if not r4_8 then
      ::label_10::
      r4_8 = GText("UI_SHOP_PURCHASE")
    end
  else
    goto label_10	-- block#2 is visited secondly
  end
  r2_8:SetText(r4_8)
  if r0_8.PurchaseFailRes ~= 0 then
    r0_8.Btn_Buy:PlayAnimation(r0_8.Btn_Buy.Forbidden)
    r0_8.Btn_Buy.Btn_Click:SetIsEnabled(false)
  else
    r0_8.Btn_Buy.Btn_Click:SetIsEnabled(true)
    r0_8.Btn_Buy:PlayAnimation(r0_8.Btn_Buy.Normal)
  end
  r2_8 = GWorld:GetAvatar()
  if not r2_8 then
    return 
  end
  local r3_8 = r2_8:GetCurrentRougeLikeToken()
  r4_8 = r0_8.Price
  if r3_8 < r4_8 then
    r0_8.Btn_Buy.Text_Reset:SetText("<Warning>" .. r0_8.Price .. "</>")
  else
    r0_8.Btn_Buy.Text_Reset:SetText(r0_8.Price)
  end
end
function r0_0.SetSuit(r0_9)
  -- line: [215, 264] id: 9
  r0_9.bShowTreasureSuit = false
  r0_9.ShowSuitActive = false
  r0_9.Rouge_SuitSign:SetVisibility(ESlateVisibility.Collapsed)
  r0_9.VB_Suite:SetVisibility(ESlateVisibility.Collapsed)
  if r0_9.IsSoldOut then
    r0_9.Group_Buy:SetVisibility(ESlateVisibility.Collapsed)
  else
    r0_9.Group_Buy:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  if r0_9.IsCanLevelUp then
    return 
  end
  if r0_9.Type == "Blessing" and not r0_9.IsSoldOut then
    local r2_9 = r0_9.RougeLikeManager.BlessingGroup:FindRef(r0_9.GroupId) and 0
    local r3_9 = RougeUtils:GetGroupLevel(r0_9.GroupId, r2_9)
    local r4_9 = RougeUtils:GetGroupIsActive(r0_9.GroupId, r2_9 + 1)
    r0_9.Btn_DetailDesc:SetNavigationRuleExplicit(EUINavigation.Down, r0_9.SuitDetail_SubItem)
    if r4_9 then
      r0_9.VB_Suite:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      r0_9.WS_SubItem:SetActiveWidgetIndex(0)
      r0_9.ShowSuitActive = true
      local r5_9 = RougeUtils:GenSuitDetail(r0_9.GroupId, r3_9, true)
      r0_9.SuitDetail_SubItem:InitUIInfo(r5_9)
      UIUtils.SetDefinitionText(r0_9.SuitDetail_SubItem.Text_SuitDesc, r5_9.ExplanationId)
    end
  elseif r0_9.Type == "Treasure" and DataMgr.TreasureGroup[r0_9.GroupId] then
    r0_9.bShowTreasureSuit = true
    r0_9.Rouge_SuitSign:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    local r1_9 = UIUtils.GetRealCurrentTreasureGroupNum(r0_9.ItemId)
    local r2_9 = UIUtils.GetTreasureGroupNum(r0_9.ItemId)
    if not r0_9.IsSoldOut then
      r1_9 = r1_9 + 1
    end
    if r1_9 == r2_9 then
      r0_9.ShowSuitActive = true
      r0_9.Btn_DetailDesc:SetNavigationRuleExplicit(EUINavigation.Down, r0_9.SuitDetail_TreasureSubItem)
      r0_9.WS_SubItem:SetActiveWidgetIndex(1)
      r0_9.VB_Suite:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      r0_9.SuitDetail_TreasureSubItem.Text_SuitDesc:SetText(GText(DataMgr.TreasureGroup[r0_9.GroupId].GroupEffectDesc))
      r0_9.SuitDetail_TreasureSubItem:PlayAnimation(r0_9.SuitDetail_TreasureSubItem.In)
    end
    r0_9.Rouge_SuitSign:InitSuitSign(r0_9.ItemId, r0_9.GroupId, r1_9, not r0_9.IsSoldOut)
  end
  r0_9:ShowGamePadBtn()
end
function r0_0.ShowGamePadBtn(r0_10)
  -- line: [267, 273] id: 10
  if r0_10.bShowTreasureSuit and UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    r0_10.Key_SuitSign:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    r0_10.Key_SuitSign:SetVisibility(ESlateVisibility.Collapsed)
  end
end
function r0_0.CanPurchase(r0_11, r1_11)
  -- line: [276, 293] id: 11
  local r2_11 = GWorld:GetAvatar()
  if not r2_11 then
    return 
  end
  r0_11.ShopItemList = GWorld.RougeLikeManager.Shop:FindRef(r0_11.ShopId)["Shop" .. r0_11.Type]
  if not r0_11.ShopItemList then
    DebugPrint("ZDX: RougeShopItemList is nil")
  end
  if r0_11.ShopItemList:FindRef(r0_11.ItemId) == 0 then
    r0_11.PurchaseFailRes = 1
  end
  if r2_11:GetCurrentRougeLikeToken() < r1_11 then
    r0_11.PurchaseFailRes = 2
  end
end
function r0_0.OnRougeInfoUpdate(r0_12)
  -- line: [295, 301] id: 12
  local r1_12 = UIManager(r0_12):GetUIObj("RougeShop")
  if r1_12 then
    r1_12:BlockAllUIInput(false)
    r1_12:UpdateShopDetail()
  end
end
function r0_0.RougePurchase(r0_13)
  -- line: [303, 346] id: 13
  if not r0_13.Btn_buy.Btn_Click:GetIsEnabled() then
    return 
  end
  local r1_13 = GWorld:GetAvatar()
  if not r1_13 then
    return 
  end
  local function r2_13(r0_14, r1_14)
    -- line: [311, 333] id: 14
    if not r1_14 or not r1_14.Level then
      local r2_14 = 0
    end
    local r3_14 = UIManager(r0_13):GetUIObj("RougeShop")
    if r3_14 then
      r3_14:BlockAllUIInput(false)
      r3_14:UpdateShopDetail()
    end
  end
  UIManager(r0_13):GetUIObj("RougeShop"):BlockAllUIInput(true)
  AudioManager(r0_13):PlayUISound(r0_13, "event:/ui/roguelike/btn_black_mid_click", nil, nil)
  if r0_13.IsCanLevelUp then
    r1_13:UpgradeAward(r0_13.Type, r0_13.ItemId, r0_13.ShopId, r2_13)
  else
    r1_13:RougeShopPurchase(r0_13.ShopId, r0_13.Type, r0_13.ItemId, r2_13)
  end
end
function r0_0.OnPurchaseHovered(r0_15)
  -- line: [348, 352] id: 15
  r0_15.Btn_Buy:PlayAnimation(r0_15.Btn_Buy.Hover)
  AudioManager(r0_15):PlayUISound(r0_15, "event:/ui/roguelike/btn_black_hover", nil, nil)
end
function r0_0.OnCheckDetails(r0_16)
  -- line: [354, 373] id: 16
  local r1_16 = DataMgr["RougeLike" .. r0_16.Type][r0_16.ItemId]
  if r1_16.ExplanationId then
    local r2_16 = {
      DefinitionItems = {},
    }
    for r7_16, r8_16 in ipairs(r1_16.ExplanationId) do
      local r9_16 = DataMgr.CombatTerm[r8_16]
      if r9_16 then
        table.insert(r2_16.DefinitionItems, {
          Index = r7_16,
          Name = r9_16.CombatTerm,
          Des = r9_16.CombatTermExplaination,
        })
      end
    end
    -- close: r3_16
    UIManager(r0_16):ShowCommonPopupUI(100266, r2_16)
    r0_16.Parent:ChangeBottomGamePadInfo(false)
  end
end
function r0_0.OnUpdateUIStyleByInputTypeChange(r0_17, r1_17, r2_17)
  -- line: [375, 384] id: 17
  if r1_17 == ECommonInputType.Gamepad then
    r0_17:ShowGamePadBtn()
    r0_17.Btn_DetailDesc:SetForbidden(false)
  else
    r0_17.Key_SuitSign:SetVisibility(ESlateVisibility.Collapsed)
    r0_17.Btn_DetailDesc:SetForbidden(r0_17.CanShowExplanation)
  end
end
return r0_0
