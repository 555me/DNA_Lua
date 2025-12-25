-- filename: @C:/Pack/Branch/geili11\Content/Script/Utils\ShopUtils.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("Utils.TimeUtils")
local r1_0 = require("Utils.HeroUSDKUtils")
local r2_0 = require("BluePrints.UI.WBP.Perk.MonthCard.MonthCardModel")
local r3_0 = {
  IsCanOpenPay = function(r0_1, r1_1)
    -- line: [9, 16] id: 1
    return true
  end,
  GetSDKRegisterRegionCode = function(r0_2)
    -- line: [19, 33] id: 2
    local r1_2 = "CN"
    if UE.AHotUpdateGameMode.IsGlobalPak() then
      r1_2 = "US"
    end
    local r2_2 = GWorld:GetAvatar()
    if not r2_2 then
      return r1_2
    end
    return r2_2.SdkRegisterRegionCode and r1_2
  end,
  GetRegionCode = function(r0_3)
    -- line: [36, 50] id: 3
    local r1_3 = "CN"
    if UE.AHotUpdateGameMode.IsGlobalPak() then
      r1_3 = "US"
    end
    local r2_3 = GWorld:GetAvatar()
    if not r2_3 then
      return r1_3
    end
    return r2_3.SdkLoginRegionCode and r1_3
  end,
  GetCurrencyType = function(r0_4)
    -- line: [52, 62] id: 4
    local r1_4 = "CN"
    if UE.AHotUpdateGameMode.IsGlobalPak() then
      r1_4 = "US"
    end
    local r2_4 = r0_4:GetRegionCode()
    if not DataMgr.CountryRegionCode[r2_4] then
      return DataMgr.CountryRegionCode[r1_4].MoneySymbol
    end
    return DataMgr.CountryRegionCode[r2_4].MoneySymbol
  end,
  GetCurrencyPrice = function(r0_5)
    -- line: [65, 75] id: 5
    local r1_5 = "CN"
    if UE.AHotUpdateGameMode.IsGlobalPak() then
      r1_5 = "US"
    end
    local r2_5 = r0_5:GetRegionCode()
    if not DataMgr.CountryRegionCode[r2_5] then
      return DataMgr.CountryRegionCode[r1_5].MoneyCode
    end
    return "Price" .. DataMgr.CountryRegionCode[r2_5].MoneyCode
  end,
  HasFreeShop = function(r0_6, r1_6)
    -- line: [77, 92] id: 6
    local r2_6 = {}
    for r7_6, r8_6 in pairs(DataMgr.Shop[r1_6].MainTabId) do
      local r9_6 = DataMgr.ShopItem2ShopTab[r8_6]
      assert(r9_6, "未找到对应商城主页签:" .. r8_6)
      for r14_6, r15_6 in pairs(r9_6) do
        for r20_6, r21_6 in pairs(r15_6) do
          if r0_6:IsFree(r21_6) then
            table.insert(r2_6, r21_6)
          end
        end
        -- close: r16_6
      end
      -- close: r10_6
    end
    -- close: r3_6
    return #r2_6 > 0, r2_6
  end,
  HasNewShop = function(r0_7, r1_7)
    -- line: [94, 112] id: 7
    local r2_7 = {}
    local r3_7 = GWorld:GetAvatar()
    if not r3_7 then
      return false, r2_7
    end
    for r8_7, r9_7 in pairs(DataMgr.Shop[r1_7].MainTabId) do
      local r10_7 = DataMgr.ShopItem2ShopTab[r9_7]
      assert(r10_7, "未找到对应商城主页签:" .. r9_7)
      for r15_7, r16_7 in pairs(r10_7) do
        for r21_7, r22_7 in pairs(r16_7) do
          if r3_7:CheckShopItemEnhanceRedDot(r22_7) then
            table.insert(r2_7, r22_7)
          end
        end
        -- close: r17_7
      end
      -- close: r11_7
    end
    -- close: r4_7
    return #r2_7 > 0, r2_7
  end,
  IsFree = function(r0_8, r1_8)
    -- line: [115, 124] id: 8
    local r2_8 = GWorld:GetAvatar()
    if not r2_8 then
      return false
    end
    if r0_8:GetShopItemPrice(r1_8) == 0 and r2_8:CheckShopItemCanPurchase(r1_8) then
      return true
    end
    return false
  end,
  GetShopItemCutoffData = function(r0_9, r1_9)
    -- line: [127, 138] id: 9
    if not DataMgr.ShopItem2Cutoff[r1_9] then
      return 
    end
    for r6_9, r7_9 in pairs(DataMgr.ShopItem2Cutoff[r1_9]) do
      local r8_9 = DataMgr.Cutoff[r7_9]
      local r9_9 = r0_0.NowTime()
      if r8_9.CutoffStartTime < r9_9 and (not r8_9.CutoffEndTime or r9_9 < r8_9.CutoffEndTime) then
        return r8_9
      end
    end
    -- close: r2_9
  end,
  GetShopItemPrice = function(r0_10, r1_10)
    -- line: [141, 157] id: 10
    local r2_10 = DataMgr.ShopItem[r1_10]
    assert(r2_10, "商品不存在：" .. r1_10)
    if DataMgr.ShopItem2PayGoods[r1_10] then
      local r3_10 = DataMgr.PayGoods[DataMgr.ShopItem2PayGoods[r1_10]]
      assert(r3_10, "充值商品对应信息不存在:" .. DataMgr.ShopItem2PayGoods[r1_10])
      return r3_10[r0_10:GetCurrencyPrice()]
    end
    local r3_10 = r0_10:GetShopItemCutoffData(r1_10)
    if r3_10 then
      return r3_10.CutoffPrice and r2_10.Price
    else
      return r2_10.Price
    end
  end,
  GetShopItemPurchaseLimit = function(r0_11, r1_11)
    -- line: [160, 176] id: 11
    if not r1_11 then
      return 0
    end
    local r2_11 = GWorld:GetAvatar()
    local r3_11 = DataMgr.ShopItem[r1_11]
    local r4_11 = r2_11.ShopItems[r1_11]
    local r5_11 = nil
    if not r4_11 or not r4_11.RemainPurchaseTimes then
      if r3_11 then
        r5_11 = r3_11.PurchaseLimit
      end
    else
      r5_11 = r4_11.RemainPurchaseTimes
    end
    return r5_11 and -1
  end,
  GetImprShopItemPurchaseLimit = function(r0_12, r1_12)
    -- line: [179, 193] id: 12
    local r2_12 = 0
    local r3_12 = DataMgr.ImpressionShop[r1_12]
    local r4_12 = GWorld:GetAvatar()
    if r4_12 then
      local r5_12 = r4_12.ImpressionShops[r3_12.ImpressionShopId]
      if r3_12.PurchaseLimit and r5_12 then
        r2_12 = r3_12.PurchaseLimit - r5_12.AlreadyPurchaseTimes
      else
        r2_12 = -1
      end
    end
    return r2_12
  end,
  GetShopItemCanShow = function(r0_13, r1_13)
    -- line: [196, 233] id: 13
    assert(DataMgr.ShopItem[r1_13], "商品不存在：" .. r1_13)
    local r2_13 = GWorld:GetAvatar()
    if not r2_13 then
      return 
    end
    if not r2_13:CheckIsEffective(r1_13) then
      return false
    end
    if r0_13:GetShopItemPurchaseLimit(r1_13) == 0 and not DataMgr.ShopItem[r1_13].RefreshTime and not DataMgr.ShopItem[r1_13].SoldOutDisplay then
      return false
    end
    if r2_13:CheckShopItemHasRequire(r1_13) then
      return false
    end
    if r2_13:CheckShopItemHasRexclusionGroup(r1_13) then
      return false
    end
    if r2_13:CheckShopItemUnique(r1_13) and not DataMgr.ShopItem[r1_13].SoldOutDisplay then
      return false
    end
    return true
  end,
  RefreshShopRefreshTime = function(r0_14, r1_14, r2_14)
    -- line: [236, 279] id: 14
    local r3_14 = CommonConst.ShopRefreshBeginTime
    local r4_14 = os.time({
      year = r3_14[1],
      month = r3_14[2],
      day = r3_14[3],
      hour = r3_14[4],
      min = r3_14[5],
      sec = r3_14[6],
    })
    local r5_14 = os.date("*t", r4_14)
    local r6_14 = r0_0.NowTime()
    local r7_14 = 0
    local r8_14 = 0
    local r9_14 = 0
    if r1_14.HOUR then
      r7_14 = r1_14.HOUR * 60 * 60
      r9_14 = r7_14 - (r6_14 - r4_14) % r7_14
    elseif r1_14.DAY then
      r7_14 = r1_14.DAY * 60 * 60 * 24
      r9_14 = r7_14 - (r6_14 - r4_14) % r7_14
    elseif r1_14.WEEK then
      local r11_14 = r0_0.NextWeeklyRefreshTime(r4_14 - CommonConst.SECOND_IN_WEEKDAY, CommonConst.GAME_REFRESH_HMS)
      r7_14 = r1_14.WEEK * 7 * 60 * 60 * 24
      r9_14 = r7_14 - (r6_14 - r11_14) % r7_14
    elseif r1_14.MONTH then
      local r10_14 = os.date("*t", r0_0.NowTime())
      while r3_0:IsLaterThanNow(r5_14, r10_14) == false do
        local r11_14 = r5_14.month + r1_14.MONTH
        if r11_14 > 12 then
          r5_14.year = r5_14.year + 1
          r11_14 = r5_14.month + r1_14.MONTH + -12
          r5_14.month = r11_14
        else
          r11_14 = r5_14.month + r1_14.MONTH
          r5_14.month = r11_14
        end
      end
      r9_14 = os.difftime(os.time(r5_14), r0_0.NowTime())
    end
    r2_14:SetText(r3_0:GetRefreshTimeStr(r9_14))
  end,
  GetRefreshTimeStr = function(r0_15, r1_15)
    -- line: [282, 305] id: 15
    local r2_15 = ""
    local r3_15 = 0
    if r1_15 > 86400 then
      r3_15 = r3_15 + 1
      r2_15 = r2_15 .. string.format(GText("UI_SHOP_REMAINTIME_DAY"), math.floor(r1_15 / 86400))
      r1_15 = r1_15 % 86400
    end
    if 3600 < r1_15 or r3_15 == 1 then
      r3_15 = r3_15 + 1
      r2_15 = r2_15 .. string.format(GText("UI_SHOP_REMAINTIME_HOUR"), math.floor(r1_15 / 3600))
      r1_15 = r1_15 % 3600
    end
    if r1_15 > 60 and r3_15 < 2 or r3_15 == 1 then
      r3_15 = r3_15 + 1
      r2_15 = r2_15 .. string.format(GText("UI_SHOP_REMAINTIME_MINUTE"), math.floor(r1_15 / 60))
      r1_15 = r1_15 % 60
    end
    if r1_15 > 0 and r3_15 < 2 or r3_15 == 1 then
      r3_15 = r3_15 + 1
      r2_15 = r2_15 .. string.format(GText("UI_SHOP_REMAINTIME_SECOND"), r1_15)
    end
    return r2_15
  end,
  UpdateLimitTime = function(r0_16, r1_16)
    -- line: [308, 331] id: 16
    local r4_16 = UKismetMathLibrary.Subtract_DateTimeDateTime(URuntimeCommonFunctionLibrary.GetDateTimeFromUnixTime(r1_16), URuntimeCommonFunctionLibrary.GetDateTimeFromUnixTime(r0_0.NowTime()))
    local r5_16 = ""
    local r6_16 = 0
    if UKismetMathLibrary.GetDays(r4_16) > 0 then
      r6_16 = r6_16 + 1
      r5_16 = r5_16 .. string.format(GText("UI_SHOP_REMAINTIME_DAY"), UKismetMathLibrary.GetDays(r4_16))
    end
    if UKismetMathLibrary.GetHours(r4_16) > 0 or r6_16 == 1 then
      r6_16 = r6_16 + 1
      r5_16 = r5_16 .. string.format(GText("UI_SHOP_REMAINTIME_HOUR"), UKismetMathLibrary.GetHours(r4_16))
    end
    if UKismetMathLibrary.GetMinutes(r4_16) > 0 and r6_16 < 2 or r6_16 == 1 then
      r6_16 = r6_16 + 1
      r5_16 = r5_16 .. string.format(GText("UI_SHOP_REMAINTIME_MINUTE"), UKismetMathLibrary.GetMinutes(r4_16))
    end
    if UKismetMathLibrary.GetSeconds(r4_16) > 0 and r6_16 < 2 or r6_16 == 1 then
      r6_16 = r6_16 + 1
      r5_16 = r5_16 .. string.format(GText("UI_SHOP_REMAINTIME_SECOND"), UKismetMathLibrary.GetSeconds(r4_16))
    end
    return string.format(GText("UI_SHOP_REMAINTIME"), r5_16)
  end,
  IsLaterThanNow = function(r0_17, r1_17, r2_17)
    -- line: [334, 355] id: 17
    local r3_17 = r2_17.year
    local r4_17 = r2_17.month
    local r5_17 = r2_17.day
    local r6_17 = r2_17.hour
    if r1_17.year < r3_17 then
      return false
    elseif r3_17 == r1_17.year then
      if r1_17.month < r4_17 then
        return false
      elseif r4_17 == r1_17.month then
        if r1_17.day < r5_17 then
          return false
        elseif r5_17 == r1_17.day and r1_17.hour <= r6_17 then
          return false
        end
      end
    end
    return true
  end,
  CanPurchase = function(r0_18, r1_18, r2_18, r3_18)
    -- line: [358, 402] id: 18
    local r4_18 = GWorld:GetAvatar()
    if not r4_18 then
      return false
    end
    r1_18.PurchaseFailRes = 0
    if r0_18:GetShopItemPurchaseLimit(r1_18.ItemId) == 0 then
      r1_18.PurchaseFailRes = 1
      return false
    end
    if r4_18:CheckShopItemUnique(r1_18.ItemId) then
      r1_18.PurchaseFailRes = 6
      return false
    end
    if r1_18.UnlockLevel and r4_18.Level < r1_18.UnlockLevel then
      r1_18.PurchaseFailRes = 3
      return false
    end
    if not r4_18:CheckShopItemUnlockRaidPoint(r1_18.ItemId) then
      r1_18.PurchaseFailRes = 7
      return false
    end
    if DataMgr.ShopItem2PayGoods[r1_18.ItemId] then
      return true
    end
    local r6_18 = r4_18.Resources[r2_18]
    if r6_18 then
      r6_18 = r4_18.Resources[r2_18].Count and 0
    else
      goto label_59	-- block#15 is visited secondly
    end
    if r6_18 < r3_18 then
      if r1_18.PriceType == CommonConst.Coins.Coin1 then
        local r7_18 = r4_18.Resources[CommonConst.Coins.Coin4]
        if r7_18 then
          r7_18 = r4_18.Resources[CommonConst.Coins.Coin4].Count and 0
        else
          goto label_83	-- block#20 is visited secondly
        end
        if r3_18 <= r6_18 + r7_18 then
          r1_18.PurchaseFailRes = 4
        else
          r1_18.PurchaseFailRes = 5
        end
        return true
      elseif r1_18.PriceType == CommonConst.Coins.Coin4 then
        r1_18.PurchaseFailRes = 5
        return true
      end
      r1_18.PurchaseFailRes = 2
      return false
    end
    return true
  end,
  Purchase = function(r0_19, r1_19, r2_19)
    -- line: [404, 537] id: 19
    local r3_19 = GWorld:GetAvatar()
    if not r3_19 then
      return 
    end
    local r5_19 = r1_19.ItemId
    if DataMgr.ShopItem2PayGoods[r5_19] then
      if r1_19.PurchaseFailRes == 0 then
        local r4_19 = GWorld:GetAvatar()
        if not r4_19 then
          r5_19 = false
          return r5_19
        end
        r5_19 = HeroUSDKSubsystem():IsHeroSDKEnable()
        if not r5_19 then
          r5_19 = require("BluePrints.UI.GMInterface.GMFunctionLibrary")
          r5_19.ExecConsoleCommand(GWorld.GameInstance, "sgm pgi " .. DataMgr.ShopItem2PayGoods[r1_19.ItemId])
          return 
        end
        r4_19:RequestPay(DataMgr.ShopItem2PayGoods[r1_19.ItemId], function(r0_20, r1_20, r2_20)
          -- line: [420, 443] id: 20
          if not ErrorCode:Check(r0_20) then
            return 
          end
          local r3_20 = FHeroUPaymentParameters()
          r3_20.goodsId = DataMgr.ShopItem2PayGoods[r1_19.ItemId]
          r3_20.cpOrder = r1_20
          r3_20.callbackUrl = r2_20
          local r4_20 = r1_0.GenHeroHDCGameRoleInfo()
          local r5_20 = ""
          HeroUSDKSubsystem():HeroSDKPay(r3_20, r4_20, GText(ItemUtils:GetDropName(r1_19.TypeId, r1_19.ItemType)))
          local r6_20 = {
            product_id = DataMgr.ShopItem2PayGoods[r1_19.ItemId],
          }
          if r1_19.ItemId then
            r6_20.item_id = r1_19.ItemId
            r6_20.product_type = DataMgr.ShopItem[r1_19.ItemId].ItemType
          end
          r6_20.game_order_id = r1_20
          r6_20.order_create_time = r0_0.NowTime()
          HeroUSDKSubsystem(r0_19):UploadTrackLog_Lua("charge_client", r6_20)
        end)
      else
        UIManager(r0_19):ShowError(ErrorCode.RET_SHOPITEM_REMAIN_PURCHASE_TIMES_EQUAL_ZERO, 1, "CommonToastMain")
      end
      return 
    end
    if r1_19.PurchaseFailRes ~= 0 then
      if r1_19.PurchaseFailRes == 1 then
        UIManager(GWorld.GameInstance):ShowError(ErrorCode.RET_SHOPITEM_REMAIN_PURCHASE_TIMES_EQUAL_ZERO, 1, "CommonToastMain")
      elseif r1_19.PurchaseFailRes == 2 then
        UIManager(r0_19):ShowUITip("CommonToastMain", string.format(GText("UI_Shop_Toast_No_Coin"), GText(DataMgr.Resource[r1_19.PriceType].ResourceName)), 1)
      elseif r1_19.PurchaseFailRes == 3 then
        UIManager(r0_19):ShowUITip("CommonToastMain", string.format(GText("UI_Shop_Toast_Locked"), r1_19.UnlockLevel), 1)
      elseif r1_19.PurchaseFailRes == 7 then
        UIManager(r0_19):ShowUITip("CommonToastMain", string.format(GText("RaidDungeon_Shop_Locked"), r1_19.UnlockRaidPoint), 1)
      elseif r1_19.PurchaseFailRes == 6 then
        UIManager(GWorld.GameInstance):ShowError(ErrorCode.RET_SHOPITEM_UNIQUE_ALREDAY_OWNED, 1, "CommonToastMain")
      elseif r1_19.PurchaseFailRes == 4 then
        local r4_19 = 100136
        r5_19 = GWorld:GetAvatar()
        if not r5_19 then
          return 
        end
        local r6_19 = ItemUtils:GetDropName(r1_19.TypeId, r1_19.ItemType)
        local r7_19 = r5_19.Resources[r1_19.PriceType]
        if r7_19 then
          r7_19 = r5_19.Resources[r1_19.PriceType].Count and 0
        else
          goto label_179	-- block#27 is visited secondly
        end
        local r8_19 = GText(DataMgr.CommonPopupUIContext[r4_19].PopoverText)
        if string.find(r8_19, "&ResourceName&") then
          r8_19 = string.gsub(r8_19, "&ResourceName&", GText(DataMgr.Resource[CommonConst.Coins.Coin4].ResourceName))
        end
        if string.find(r8_19, "&ResourceName1&") then
          r8_19 = string.gsub(r8_19, "&ResourceName1&", GText(DataMgr.Resource[CommonConst.Coins.Coin4].ResourceName))
        end
        if string.find(r8_19, "&ResourceName2&") then
          r8_19 = string.gsub(r8_19, "&ResourceName2&", GText(r6_19))
        end
        if string.find(r8_19, "&Num1&") then
          r8_19 = string.gsub(r8_19, "&Num1&", r2_19.CurrentCount * r2_19.UnitPrice - r7_19)
        end
        if string.find(r8_19, "&Num2&") then
          r8_19 = string.gsub(r8_19, "&Num2&", r2_19.CurrentCount)
        end
        local function r9_19()
          -- line: [487, 506] id: 21
          local r0_21 = 0
          if r5_19.Resources[CommonConst.Coins.Coin4] then
            r0_21 = r5_19.Resources[CommonConst.Coins.Coin4].Count
          end
          if r0_21 < r2_19.CurrentCount * r2_19.UnitPrice - r7_19 then
            UIManager(r0_19):ShowCommonPopupUI(100137, {
              Title = GText("UI_COMMONPOP_TITLE_100137"),
              ShortText = GText("UI_COMMONPOP_TEXT_100137"),
              LeftCallbackObj = r0_19,
              RightCallbackObj = r0_19,
              RightCallbackFunction = function()
                -- line: [493, 495] id: 22
                PageJumpUtils:JumpToShopPage(CommonConst.GachaJumpToShopMainTabId, nil, nil, "Shop")
              end,
            }, r0_19)
          else
            r0_19:SendExchangeRequest(r1_19.ItemId, r2_19.CurrentCount)
          end
        end
        local r10_19 = {}
        local r11_19 = r5_19.Resources[CommonConst.Coins.Coin4]
        if r11_19 then
          r11_19 = r5_19.Resources[CommonConst.Coins.Coin4].Count and 0
        else
          goto label_297	-- block#40 is visited secondly
        end
        table.insert(r10_19, {
          ItemId = CommonConst.Coins.Coin4,
          ItemType = CommonConst.ItemType.Resource,
          ItemNum = r11_19,
          ItemNeed = r2_19.CurrentCount * r2_19.UnitPrice - r7_19,
        })
        UIManager(r0_19):ShowCommonPopupUI(r4_19, {
          RightCallbackFunction = r9_19,
          ItemList = r10_19,
          ShortText = r8_19,
        })
        -- close: r4_19
      elseif r1_19.PurchaseFailRes == 5 then
        r5_19 = {}
        r5_19.Title = GText("UI_COMMONPOP_TITLE_100138")
        r5_19.ShortText = GText("UI_COMMONPOP_TEXT_100198")
        r5_19.LeftCallbackObj = r2_19
        r5_19.RightCallbackObj = r2_19
        function r5_19.RightCallbackFunction()
          -- line: [521, 523] id: 23
          PageJumpUtils:JumpToShopPage(CommonConst.GachaJumpToShopMainTabId, nil, nil, "Shop")
        end
        UIManager(r0_19):ShowCommonPopupUI(100137, r5_19, r2_19.ParentWidget)
      end
      return 
    end
    r5_19 = r0_19
    UIManager(r5_19):GetUIObj("ShopMain"):BlockAllUIInput(true)
    r3_19:PurchaseShopItem(r1_19.ItemId, 1)
  end,
  SendPurchaseRequest = function(r0_24, r1_24, r2_24)
    -- line: [539, 557] id: 24
    local r3_24 = GWorld:GetAvatar()
    if not r3_24 then
      return 
    end
    r3_24:PurchaseShopItem(r1_24, r2_24)
    local r4_24 = UIManager(r0_24):GetUIObj("ShopMain")
    local r5_24 = UIManager(r0_24):GetUIObj("ActivityShop")
    local r6_24 = UIManager(r0_24):GetUIObj("ShopActivity")
    if r4_24 then
      r4_24:BlockAllUIInput(true)
    end
    if r5_24 then
      r5_24:BlockAllUIInput(true)
    end
    if r6_24 then
      r6_24:BlockAllUIInput(true)
    end
  end,
  SendExchangeRequest = function(r0_25, r1_25, r2_25, r3_25)
    -- line: [559, 600] id: 25
    local r4_25 = GWorld:GetAvatar()
    if not r4_25 then
      return 
    end
    r4_25:PurchaseShopItemUseCoin1(r1_25, r2_25, function(r0_26, r1_26, r2_26, r3_26)
      -- line: [564, 597] id: 26
      EventManager:FireEvent(EventID.OnPurchaseShopItem, r0_26, r1_26, r2_25)
      local r4_26 = UIManager(GWorld.GameInstance):GetUIObj("ShopMain")
      if r4_26 then
        r4_26:BlockAllUIInput(false)
      end
      local r5_26 = UIManager(GWorld.GameInstance):GetUIObj("SkinPreview")
      if r5_26 then
        r5_26:BlockAllUIInput(false)
      end
      if r0_26 == ErrorCode.RET_SUCCESS then
        local r6_26 = DataMgr.ShopItem[r1_26]
        if not r3_25 then
          UIManager(GWorld.GameInstance):UnLoadUI("ShopItemSingle")
          UIManager(GWorld.GameInstance):UnLoadUI("ShopItemPackage")
          UIUtils.ShowGetItemPageAndOpenBagIfNeeded(r6_26.ItemType, r6_26.TypeId, r6_26.TypeNum * r2_26, r3_26, r6_26.IsSpPopup)
        end
        EventManager:FireEvent(EventID.OnPurchaseShopItemSuccess, r0_26, r6_26.TypeId, r2_25, r3_26)
      elseif r0_26 == ErrorCode.RET_SHOPITEM_IS_NOT_VALID then
        UIManager(GWorld.GameInstance):UnLoadUI("ShopItemSingle")
        UIManager(GWorld.GameInstance):UnLoadUI("ShopItemPackage")
        UIManager(GWorld.GameInstance):ShowError(r0_26, 1, "CommonToastMain")
      elseif r0_26 == ErrorCode.RET_SHOPITEM_MONEY_NEEDED_NOT_ENOUGH then
        UIManager(GWorld.GameInstance):ShowError(r0_26, 1, "CommonToastMain")
      elseif r0_26 == ErrorCode.RET_SHOPITEM_REMAIN_PURCHASE_TIMES_EQUAL_ZERO then
        UIManager(GWorld.GameInstance):ShowError(r0_26, 1, "CommonToastMain")
      end
      if r4_26 then
        r4_26:RefreshSubTabData(r4_26.CurSubTabMap, true, true)
      end
      if r5_26 then
        r5_26:RefreshPurchaseState()
      end
    end)
  end,
}
local r4_0 = {
  WBP_Shop_Banner_MonthCard = true,
}
function r3_0.GetBannerInfo(r0_27, r1_27)
  -- line: [611, 664] id: 27
  -- notice: unreachable block#20
  -- notice: unreachable block#16
  local r2_27 = {}
  local r3_27 = {}
  local r4_27 = {}
  local r5_27 = r0_0.NowTime()
  local r6_27 = not r0_27:IsCanOpenPay(true)
  for r11_27, r12_27 in pairs(DataMgr.ShopBannerTab) do
    if r12_27.IsSwitchTab == r1_27 and (not r6_27 or not r4_0[r12_27.Bp]) and r12_27.StartTime <= r5_27 then
      if not (r12_27.EndTime and r12_27.EndTime < r5_27) and (r12_27.BannerType ~= UIConst.ShopBannerType.DailyPack or #r0_27:GetDailyPackShopItemInfo(r12_27.Id) ~= 0) then
        local r14_27 = r12_27.BannerType
        if r14_27 == UIConst.ShopBannerType.DailyPack then
          r14_27 = r0_27:ShouldSinkDailyPackTab(r12_27)
        else
          r14_27 = false
        end
        local r15_27 = r12_27.BannerType
        if r15_27 == UIConst.ShopBannerType.MonthCard then
          r15_27 = r2_0:IsMonthCardPurchased()
        else
          r15_27 = false
        end
        if r12_27.SoldOutSinkBanner and r12_27.ItemId and r0_27:GetShopItemPurchaseLimit(r12_27.ItemId) == 0 or r15_27 or r14_27 then
          table.insert(r4_27, r12_27)
        else
          table.insert(r3_27, r12_27)
        end
        r2_27[r12_27.Id] = true
      elseif r12_27.BannerType == UIConst.ShopBannerType.DailyPack and not r0_27:ShouldHideDailyPackTab(r12_27) then
        table.insert(r4_27, r12_27)
        r2_27[r12_27.Id] = true
      end
    end
  end
  -- close: r7_27
  table.sort(r3_27, function(r0_28, r1_28)
    -- line: [650, 652] id: 28
    return r0_28.Sequence < r1_28.Sequence
  end)
  table.sort(r4_27, function(r0_29, r1_29)
    -- line: [653, 655] id: 29
    return r0_29.Sequence < r1_29.Sequence
  end)
  local r7_27 = {}
  for r12_27, r13_27 in ipairs(r3_27) do
    table.insert(r7_27, r13_27)
  end
  -- close: r8_27
  for r12_27, r13_27 in ipairs(r4_27) do
    table.insert(r7_27, r13_27)
  end
  -- close: r8_27
  return r7_27, r2_27
end
function r3_0.GetComplexInfo(r0_30, r1_30)
  -- line: [668, 680] id: 30
  local r2_30 = {}
  for r7_30, r8_30 in pairs(DataMgr.ComplexTab) do
    if r8_30.SubTabId == r1_30 then
      table.insert(r2_30, r8_30)
    end
  end
  -- close: r3_30
  table.sort(r2_30, function(r0_31, r1_31)
    -- line: [676, 678] id: 31
    return r1_31.EntrySort < r0_31.EntrySort
  end)
  return r2_30
end
function r3_0.GetShopSkinList(r0_32)
  -- line: [684, 706] id: 32
  local r1_32 = UIManager(r0_32):GetLastJumpPage()
  if r1_32 then
    return r1_32.Index2ShopSkin, r1_32.ShopSkin2Index, r1_32.SkinCount
  end
  local r2_32 = UIManager(r0_32):GetUIObj("ShopMain")
  if r2_32 then
    return r2_32.Index2ShopSkin, r2_32.ShopSkin2Index, r2_32.SkinCount
  end
  local r3_32 = UIManager(r0_32):GetUIObj("ActivityShop")
  if r3_32 then
    return r3_32.Index2ShopSkin, r3_32.ShopSkin2Index, r3_32.SkinCount
  end
  local r4_32 = UIManager(r0_32):GetUIObj("ShopActivity")
  if r4_32 then
    return r4_32.Index2ShopSkin, r4_32.ShopSkin2Index, r4_32.SkinCount
  end
  return nil
end
function r3_0.GetShopItemDataById(r0_33, r1_33, r2_33, r3_33)
  -- line: [709, 735] id: 33
  local r4_33 = DataMgr.TypeId2ShopItem[r2_33] and r4_33[r1_33]
  local r5_33 = nil
  local r6_33 = nil
  if r4_33 then
    local r7_33 = nil
    for r12_33, r13_33 in pairs(r4_33) do
      local r14_33 = DataMgr.ShopItem[r13_33]
      if r14_33 then
        if r7_33 ~= nil then
          if r7_33 < (r14_33.IsAccessItem and r7_33) then
            ::label_27::
            local r15_33 = nil
            if r3_33 then
              r14_33 = setmetatable({}, {
                __index = r14_33,
              })
              r15_33 = r0_33:GetShopItemCanShow(r13_33) and r0_33:CanPurchase(r14_33, nil, 0)
            else
              r15_33 = true
            end
            if r15_33 then
              r7_33 = r14_33.IsAccessItem
              r5_33 = r13_33
              r6_33 = r14_33
            end
          end
        else
          goto label_27	-- block#9 is visited secondly
        end
      end
    end
    -- close: r8_33
  end
  return r5_33, r6_33
end
function r3_0.GetDailyPackShopItemInfo(r0_34, r1_34)
  -- line: [739, 826] id: 34
  local r2_34 = GWorld:GetAvatar()
  if not r2_34 then
    return {}
  end
  local r3_34 = {}
  for r8_34, r9_34 in pairs(DataMgr.DailyPack) do
    if r9_34.BannerId == r1_34 then
      local r10_34 = DataMgr.PayGoods[r9_34.GoodsId].ItemId
      if not r10_34 then
        Utils.ScreenPrint("请检查一下分日礼包对应的PayGoods:[" .. tostring(r9_34.GoodsId) .. "] 是否填写了商店商品ID")
      else
        local r11_34 = DataMgr.ShopItem[r10_34]
        if not r11_34 then
          Utils.ScreenPrint("请检查一下分日礼包对应的商店商品ID:[" .. tostring(r10_34) .. "] 是否存在")
        else
          local r12_34 = false
          if r2_34:CheckIsEffective(r10_34) then
            r12_34 = true
          elseif r0_34:ShouldShowCompletionTime(r11_34.TypeId) then
            r12_34 = true
          end
          if r12_34 then
            local r13_34 = r2_34.DailyPacks[r11_34.TypeId]
            local r14_34 = setmetatable({}, {
              __index = r11_34,
            })
            r14_34.Reward = r9_34.Reward
            if r13_34 then
              r14_34.ExpiredTime = r13_34.ExpiredTime
              r14_34.State = r13_34.State
              r14_34.Count = r13_34.Count
              r14_34.RewardGot = r13_34.RewardGot
            end
            table.insert(r3_34, r14_34)
          end
        end
      end
    end
  end
  -- close: r4_34
  table.sort(r3_34, function(r0_35, r1_35)
    -- line: [820, 824] id: 35
    return r0_35.Sequence < r1_35.Sequence
  end)
  return r3_34
end
function r3_0.ShouldShowRemainingTime(r0_36, r1_36)
  -- line: [828, 857] id: 36
  if not r1_36 then
    return false
  end
  local r2_36 = DataMgr.ShopItem[r1_36]
  if not r2_36 then
    return false
  end
  local r3_36 = GWorld:GetAvatar()
  if not r3_36 then
    return false
  end
  if not r3_36:CheckIsEffective(r1_36) then
    return false
  end
  if not r2_36.PurchaseLimit or r2_36.PurchaseLimit <= 0 then
    return true
  end
  local r4_36 = r3_36.ShopItems[r1_36]
  if not r4_36 then
    return true
  end
  return r4_36.RemainPurchaseTimes > 0
end
function r3_0.ShouldShowCompletionTime(r0_37, r1_37)
  -- line: [859, 881] id: 37
  if not r1_37 then
    return false
  end
  local r2_37 = GWorld:GetAvatar()
  if not r2_37 then
    return false
  end
  local r3_37 = r2_37.DailyPacks[r1_37]
  if not r3_37 then
    return false
  end
  local r6_37 = UKismetMathLibrary.Subtract_DateTimeDateTime(URuntimeCommonFunctionLibrary.GetDateTimeFromUnixTime(r3_37.ExpiredTime), URuntimeCommonFunctionLibrary.GetDateTimeFromUnixTime(r0_0.NowTime()))
  local r7_37 = r3_37.State
  if r7_37 == 1 then
    r7_37 = UKismetMathLibrary.GetDays(r6_37) > 0
  else
    goto label_40	-- block#8 is visited secondly
  end
  return r7_37
end
function r3_0.GetDailyPackItemsForBanner(r0_38, r1_38)
  -- line: [883, 896] id: 38
  local r2_38 = {}
  for r7_38, r8_38 in pairs(DataMgr.DailyPack) do
    if r8_38.BannerId == r1_38 and DataMgr.PayGoods[r8_38.GoodsId] then
      local r9_38 = DataMgr.PayGoods[r8_38.GoodsId].ItemId
      if DataMgr.ShopItem[r9_38] then
        table.insert(r2_38, DataMgr.ShopItem[r9_38])
      end
    end
  end
  -- close: r3_38
  return r2_38
end
function r3_0.ShouldSinkDailyPackTab(r0_39, r1_39)
  -- line: [898, 920] id: 39
  if not r1_39 then
    return false
  end
  local r2_39 = r0_39:GetDailyPackItemsForBanner(r1_39.Id)
  if #r2_39 == 0 then
    return false
  end
  local r3_39 = GWorld:GetAvatar()
  if not r3_39 then
    return false
  end
  for r8_39, r9_39 in ipairs(r2_39) do
    local r10_39 = r3_39.ShopItems[r9_39.ItemId]
    if not r10_39 or r10_39.RemainPurchaseTimes > 0 then
      return false
    end
  end
  -- close: r4_39
  return true
end
function r3_0.ShouldHideDailyPackTab(r0_40, r1_40)
  -- line: [922, 949] id: 40
  if not r1_40 then
    return false
  end
  local r2_40 = r0_40:GetDailyPackItemsForBanner(r1_40.Id)
  if #r2_40 == 0 then
    return true
  end
  if not GWorld:GetAvatar() then
    return false
  end
  local r4_40 = r0_0.NowTime()
  for r9_40, r10_40 in ipairs(r2_40) do
    if r0_40:ShouldShowCompletionTime(r10_40.TypeId) then
      return false
    end
  end
  -- close: r5_40
  return true
end
function r3_0.UpdateRewardEndTime(r0_41, r1_41)
  -- line: [952, 961] id: 41
  local r4_41 = UKismetMathLibrary.Subtract_DateTimeDateTime(URuntimeCommonFunctionLibrary.GetDateTimeFromUnixTime(r1_41), URuntimeCommonFunctionLibrary.GetDateTimeFromUnixTime(r0_0.NowTime()))
  local r5_41 = ""
  if UKismetMathLibrary.GetDays(r4_41) > 0 then
    r5_41 = r5_41 .. string.format(GText("UI_SHOP_REMAINTIME_DAY"), UKismetMathLibrary.GetDays(r4_41))
  end
  return string.format(GText("UI_SHOP_REMAINTIME"), r5_41)
end
return r3_0
