-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Perk\MonthCard\MonthCardController.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("BluePrints.UI.WBP.Perk.MonthCard.MonthCardModel")
local r1_0 = require("BluePrints.UI.WBP.Perk.MonthCard.MonthCardCommon")
local r2_0 = require("Utils.HeroUSDKUtils")
local r3_0 = require("BluePrints.Client.CustomTypes.SimpleRewardBox")
local r4_0 = require("Utils.TimeUtils")
local r5_0 = Class("BluePrints.Common.MVC.Controller")
function r5_0.Init(r0_1)
  -- line: [12, 19] id: 1
  r5_0.Super.Init(r0_1)
  r0_1.RefreshTimer = nil
  r0_1.WaitPayTag = false
  r0_1.PurchaseOrder = 0
  EventManager:AddEvent(EventID.OnDailyRefresh, r0_1, r0_1.OnRefresh)
end
function r5_0.Destory(r0_2)
  -- line: [21, 27] id: 2
  r5_0.Super.Destory(r0_2)
  r0_2.RefreshTimer = nil
  r0_2.WaitPayTag = false
  EventManager:RemoveEvent(EventID.OnDailyRefresh, r0_2)
end
function r5_0.GetModel(r0_3)
  -- line: [30, 32] id: 3
  return r0_0
end
function r5_0.GetEventName(r0_4)
  -- line: [34, 36] id: 4
  return EventID.MonthCardControllerEvent
end
function r5_0.OpenView(r0_5, r1_5, r2_5)
  -- line: [39, 41] id: 5
  return r5_0.Super.OpenView(r0_5, r1_5, r1_0.UIName, r2_5)
end
function r5_0.GetView(r0_6, r1_6)
  -- line: [43, 45] id: 6
  return r5_0.Super.GetView(r0_6, r1_6, r1_0.UIName)
end
function r5_0.MakeCacheData(r0_7)
  -- line: [49, 56] id: 7
  local r1_7 = r0_0:GetNowMonthCard()
  local r2_7 = {
    MonthCardId = r1_7 and r1_7.CardId,
    bIsPurChased = r0_0:IsMonthCardPurchased(),
    bCanPurchase = r0_0:IsMonthCardCanPurchase(),
  }
  r0_7.TimerCacheData = r2_7
end
function r5_0.OnShopMonthCardOpen(r0_8)
  -- line: [58, 66] id: 8
  if r0_8.RefreshTimer then
    r0_8:StopTimer(r0_8.RefreshTimer)
  end
  r0_8:MakeCacheData()
  r0_8.RefreshTimer = r0_8:AddTimer(1, function()
    -- line: [63, 65] id: 9
    r0_8:TryRefreshShopMonthCard()
  end, true, nil, nil, true)
end
function r5_0.OnRefresh(r0_10)
  -- line: [68, 72] id: 10
  r0_10:NotifyEvent(r1_0.EventId.MonthCardRefresh)
  r0_10:NotifyEvent(r1_0.EventId.PurchasedRefresh)
  r0_10:NotifyEvent(r1_0.EventId.PurchaseStateRefresh)
end
function r5_0.TryRefreshShopMonthCard(r0_11)
  -- line: [74, 76] id: 11
  r0_11:NotifyEvent(r1_0.EventId.TimeTick)
end
function r5_0.OnShopMonthCardClose(r0_12)
  -- line: [78, 83] id: 12
  if r0_12.RefreshTimer then
    r0_12:StopTimer(r0_12.RefreshTimer)
    r0_12.RefreshTimer = nil
  end
end
function r5_0.TryPurchaseMonthCard(r0_13)
  -- line: [85, 154] id: 13
  if r0_13.WaitPayTag then
    return 
  end
  local r1_13 = r0_0:GetNowMonthCard()
  local r2_13 = r1_13 and r1_13.GoodsId
  if not r2_13 then
    return 
  end
  local r3_13 = r0_0:GetAvatar()
  if not r3_13 then
    return 
  end
  r0_13.WaitPayTag = true
  r0_13.PurchaseOrder = r0_13.PurchaseOrder + 1
  local r4_13 = r0_13.PurchaseOrder
  r0_13:AddTimer(10, function()
    -- line: [100, 103] id: 14
    r0_13:FinishPurchase(r4_13)
  end)
  DebugPrint("MonthCard TryPurchaseMonthCard", r1_13.CardID, r2_13, "PurchaseOrder: ", r4_13)
  r3_13:MonthlyCardRequestPay(function(r0_15, r1_15, r2_15, r3_15)
    -- line: [106, 153] id: 15
    DebugPrint("MonthCard RequestPay", r1_13.CardID, r3_15, r0_15, r1_15, "PurchaseOrder: ", r4_13)
    if not ErrorCode:Check(r0_15) then
      r0_13:FinishPurchase(r4_13)
      return 
    end
    if r4_13 ~= r0_13.PurchaseOrder then
      return 
    end
    local r4_15 = FHeroUPaymentParameters()
    r4_15.goodsId = r3_15
    r4_15.cpOrder = r1_15
    r4_15.callbackUrl = r2_15
    local r5_15 = r2_0.GenHeroHDCGameRoleInfo()
    DebugPrint("MonthCard HeroUSDKSubsystem():HeroSDKPay", r1_13.CardID, r2_13, r5_15, r1_15, "PurchaseOrder: ", r4_13)
    HeroUSDKSubsystem():HeroSDKPay(r4_15, r5_15)
    HeroUSDKSubsystem():UploadTrackLog_Lua("charge_client", {
      product_id = r3_15,
      product_type = "MonthlyCard",
      game_order_id = r1_15,
      order_create_time = r4_0.NowTime(),
    })
    DebugPrint("MonthCard Avatar:ListenPayFinish", r1_13.CardID, r2_13, r5_15, r1_15)
    r3_13:ListenPayFinish(r1_15, function(r0_16, r1_16, r2_16, r3_16)
      -- line: [144, 152] id: 16
      r0_13:FinishPurchase(r4_13)
      DebugPrint("MonthCard OnPayFinish", r1_13.CardID, r2_13, r5_15, r1_16, r2_16, r0_16, "PurchaseOrder: ", r4_13)
      if r0_16 ~= ErrorCode.RET_SUCCESS then
        return 
      end
      r0_13:OnRefresh()
    end)
  end)
end
function r5_0.FinishPurchase(r0_17, r1_17)
  -- line: [156, 159] id: 17
  if r1_17 ~= r0_17.PurchaseOrder then
    return 
  end
  r0_17.WaitPayTag = false
end
function r5_0.DisplayForbiddenTip(r0_18)
  -- line: [161, 163] id: 18
  r0_18:ShowToast(r1_0.TextToastCannotPurchase)
end
local function r6_0(r0_19, r1_19)
  -- line: [165, 193] id: 19
  local r2_19 = 0
  if not r0_19 then
    return r2_19
  end
  for r8_19, r9_19 in pairs(DataMgr.RewardType) do
    local r10_19 = r8_19 .. "s"
    local r11_19 = r0_19[r10_19]
    if r11_19 then
      local r12_19 = r1_19[r10_19] and {}
      r1_19[r10_19] = r12_19
      for r17_19, r18_19 in pairs(r11_19) do
        local r19_19 = 0
        if type(r18_19) == "table" then
          r19_19 = r3_0:GetCount(r18_19)
        end
        if type(r18_19) == "number" then
          r19_19 = r18_19
        end
        if not r12_19[r17_19] then
          r12_19[r17_19] = r19_19
        else
          r12_19[r17_19] = r12_19[r17_19] + r19_19
        end
        r2_19 = r2_19 + r19_19
      end
      -- close: r13_19
    end
  end
  -- close: r4_19
  return r2_19
end
function r5_0.DisplayPurchaseRewards(r0_20, r1_20, r2_20)
  -- line: [195, 208] id: 20
  if not r2_20 then
    return 
  end
  local r3_20 = GWorld.GameInstance
  if r3_20 then
    local r4_20 = r3_20:GetLoadingUI()
    local r5_20 = UIManager(r3_20):GetUIObj("LoginMainPage")
    DebugPrint("DisplayPurchaseRewards", r4_20)
    if r4_20 or r5_20 then
      r0_0:SetPurchaseRewardCache(r2_20)
      return 
    end
  end
  r0_20:RealDisplayPurchaseRewards(r2_20)
end
function r5_0.RealDisplayPurchaseRewards(r0_21, r1_21, r2_21)
  -- line: [210, 239] id: 21
  if not r1_21 then
    if r2_21 then
      r2_21()
    end
    return 
  end
  local r3_21 = r1_21.BuyReward
  local r4_21 = r1_21.DailyReward
  local r5_21 = r1_21.UniqueReward
  local r6_21 = {}
  local r7_21 = 0
  DebugPrint(r3_21)
  if r3_21 then
    r7_21 = r7_21 + r6_0(r3_21, r6_21)
  end
  if r4_21 then
    r7_21 = r7_21 + r6_0(r4_21, r6_21)
  end
  if r5_21 then
    r7_21 = r7_21 + r6_0(r5_21, r6_21)
  end
  if r7_21 <= 0 then
    if r2_21 then
      r2_21()
    end
    return 
  end
  UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, r6_21, false, r2_21, r0_21)
end
function r5_0.DisplayMonthCardPop(r0_22, r1_22, ...)
  -- line: [241, 255] id: 22
  if not r1_22 then
    return 
  end
  local r2_22 = GWorld.GameInstance
  if r2_22 then
    local r3_22 = r2_22:GetLoadingUI()
    local r4_22 = UIManager(r2_22):GetUIObj("LoginMainPage")
    DebugPrint("DisplayMonthCardPop", r3_22)
    if r3_22 or r4_22 then
      r0_0:SetDailyRewardCache(r1_22)
      return 
    end
  end
  r0_22:TryDisplayMonthCardPop(r1_22)
end
function r5_0.TryPopUpCacheReward(r0_23)
  -- line: [257, 266] id: 23
  local r1_23 = r0_0.DailyRewardCache
  local r2_23 = r0_0.PurchaseRewardCache
  r0_0:ClearDailyRewardCache()
  r0_0:ClearPurchaseRewardCache()
  r0_23:RealDisplayPurchaseRewards(r2_23, function()
    -- line: [263, 265] id: 24
    r0_23:TryDisplayMonthCardPop(r1_23)
  end)
end
function r5_0.TryDisplayMonthCardPop(r0_25, r1_25)
  -- line: [268, 299] id: 25
  if not r1_25 then
    return 
  end
  local r2_25 = {}
  for r8_25, r9_25 in pairs(DataMgr.RewardType) do
    local r11_25 = r1_25[r8_25 .. "s"]
    if r11_25 then
      for r16_25, r17_25 in pairs(r11_25) do
        local r18_25 = 0
        if type(r17_25) == "table" then
          r18_25 = r3_0:GetCount(r17_25)
        end
        if type(r17_25) == "number" then
          r18_25 = r17_25
        end
        if r18_25 > 0 then
          table.insert(r2_25, {
            ItemType = r8_25,
            ItemId = r16_25,
            Count = r18_25,
          })
        end
      end
      -- close: r12_25
    end
  end
  -- close: r4_25
  r0_25:GetUIMgr():LoadUINew("MonthCardPop", r2_25)
  r0_0:ClearDailyRewardCache()
end
_G.MonthCardController = r5_0
return r5_0
