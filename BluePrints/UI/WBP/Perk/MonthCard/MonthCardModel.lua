-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Perk\MonthCard\MonthCardModel.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("Utils.TimeUtils")
local r1_0 = require("BluePrints.UI.WBP.Perk.MonthCard.MonthCardCommon")
local r2_0 = require("Utils.ItemUtils")
local r3_0 = Class("BluePrints.Common.MVC.Model")
function r3_0.Init(r0_1)
  -- line: [14, 19] id: 1
  r3_0.Super.Init(r0_1)
  r0_1._Avatar = nil
  r0_1:GetAvatar()
  r0_1.NowMonthCardId = nil
end
function r3_0.IsMonthCardPurchased(r0_2)
  -- line: [22, 29] id: 2
  local r1_2 = r0_2:GetAvatar()
  if r1_2 then
    return r0_0.NowTime() < r1_2.MonthlyCardExpireTime
  else
    return false
  end
end
function r3_0.IsMonthCardCanPurchase(r0_3)
  -- line: [32, 43] id: 3
  local r1_3 = r0_3:GetAvatar()
  local r2_3 = DataMgr.GlobalConstant.MonthlyCardHoldMax
  if r2_3 then
    r2_3 = r2_3.ConstantValue and 0
  else
    goto label_10	-- block#2 is visited secondly
  end
  if r1_3 then
    return math.ceil((r1_3.MonthlyCardExpireTime - r0_0.NowTime()) / CommonConst.DayTime) + CommonConst.MonthlyCardValidDay <= r2_3
  else
    return false
  end
end
function r3_0.GetMonthCardLeftDays(r0_4)
  -- line: [47, 54] id: 4
  local r1_4 = r0_4:GetAvatar()
  if r1_4 then
    return r1_4.MonthlyCardExpireTime
  else
    return false
  end
end
function r3_0.GetMonthCardLeftTimes(r0_5)
  -- line: [58, 67] id: 5
  local r1_5 = r0_5:GetAvatar()
  if r1_5 then
    return math.floor((r1_5.MonthlyCardExpireTime - r0_0.NowTime()) / CommonConst.DayTime)
  else
    return 0
  end
end
function r3_0.GetMonthCardCanPurchaseTime(r0_6)
  -- line: [71, 78] id: 6
  local r1_6 = r0_6:GetNowMonthCard()
  if r1_6 then
    return r1_6.EndTime
  else
    return 0
  end
end
function r3_0.GetRewardHeadIconInfo(r0_7)
  -- line: [82, 89] id: 7
  local r1_7 = r0_7:GetNowMonthCard()
  if r1_7 then
    return r0_7:GetRewardInfo(r1_7.UniqueReward)
  else
    return nil
  end
end
function r3_0.GetRewardItemIcon(r0_8)
  -- line: [92, 99] id: 8
  local r1_8 = r0_8:GetNowMonthCard()
  if r1_8 then
    return r1_8.BuyRewardIcon
  else
    return nil
  end
end
function r3_0.GetRewardItem(r0_9)
  -- line: [103, 110] id: 9
  local r1_9 = r0_9:GetNowMonthCard()
  if r1_9 then
    return r0_9:GetRewardInfo(r1_9.BuyReward)
  else
    return nil
  end
end
function r3_0.GetRewardNameAndIcon(r0_10, r1_10)
  -- line: [112, 133] id: 10
  if not r1_10 then
    return 
  end
  local r2_10 = {}
  for r7_10, r8_10 in ipairs(r1_10) do
    table.insert(r2_10, GText(r2_0.GetItemName(r8_10.ItemId, r8_10.ItemType)))
    table.insert(r2_10, "*")
    table.insert(r2_10, r8_10.Count)
    table.insert(r2_10, "\n")
  end
  -- close: r3_10
  if #r2_10 > 0 then
    r2_10[#r2_10] = nil
  end
  local r3_10 = table.concat(r2_10)
  local r4_10 = nil
  if #r1_10 > 0 then
    local r5_10 = r1_10[1]
    r4_10 = ItemUtils.GetItemIcon(r5_10.ItemId, r5_10.ItemType)
  end
  return r3_10, r4_10
end
function r3_0.GetRewardEveryDayItemIcon(r0_11)
  -- line: [136, 143] id: 11
  local r1_11 = r0_11:GetNowMonthCard()
  if r1_11 then
    return r1_11.DailyRewardIcon
  else
    return nil
  end
end
function r3_0.GetRewardEveryDayItem(r0_12)
  -- line: [147, 154] id: 12
  local r1_12 = r0_12:GetNowMonthCard()
  if r1_12 then
    return r0_12:GetRewardInfo(r1_12.DailyReward)
  else
    return nil
  end
end
function r3_0.GetMonthCardPrice(r0_13)
  -- line: [157, 168] id: 13
  local r1_13 = r0_13:GetNowMonthCard()
  if r1_13 then
    return DataMgr.PayGoods[r1_13.GoodsId][ShopUtils:GetCurrencyPrice()] and 0
  else
    return 30
  end
end
function r3_0.GetPriceSymbol(r0_14)
  -- line: [171, 176] id: 14
  return ShopUtils:GetCurrencyType()
end
function r3_0.GetNowMonthCard(r0_15)
  -- line: [179, 201] id: 15
  local r1_15 = r0_15:GetAvatar()
  if not r1_15 then
    return nil
  end
  local r2_15 = DataMgr.MonthlyCard
  local r3_15 = r2_15[r1_15.NowMonthCardId]
  local r4_15 = r0_0.NowTime()
  if r3_15 and r3_15.BeginTime <= r4_15 and r4_15 < r3_15.EndTime then
    return r3_15
  else
    local r5_15 = nil
    for r10_15, r11_15 in pairs(r2_15) do
      if r11_15.BeginTime <= r4_15 and r4_15 < r11_15.EndTime then
        r5_15 = r11_15
        r0_15.NowMonthCardId = r5_15.CardId
        break
      end
    end
    -- close: r6_15
    return r5_15
  end
  return nil
end
function r3_0.GetRewardInfo(r0_16, r1_16)
  -- line: [204, 233] id: 16
  local r2_16 = DataMgr.Reward[r1_16]
  if not r2_16 then
    return 
  end
  local r3_16 = {}
  local r4_16 = r2_16.Type
  local r5_16 = r2_16.Id
  local r6_16 = r2_16.Count
  local r7_16 = r2_16.Type
  if r7_16 then
    r7_16 = #r2_16.Type and 0
  else
    goto label_18	-- block#4 is visited secondly
  end
  for r11_16 = 1, r7_16, 1 do
    local r12_16 = r4_16 and r4_16[r11_16]
    local r13_16 = r5_16 and r5_16[r11_16]
    table.insert(r3_16, {
      ItemType = r12_16,
      ItemId = r13_16,
      Count = (r6_16 and r6_16[r11_16])[1],
    })
  end
  return r3_16
end
function r3_0.Destory(r0_17)
  -- line: [235, 237] id: 17
  r3_0.Super.Destory(r0_17)
end
function r3_0.SetDailyRewardCache(r0_18, r1_18)
  -- line: [239, 241] id: 18
  r0_18.DailyRewardCache = r1_18
end
function r3_0.SetPurchaseRewardCache(r0_19, r1_19)
  -- line: [243, 245] id: 19
  r0_19.PurchaseRewardCache = r1_19
end
function r3_0.ClearPurchaseRewardCache(r0_20)
  -- line: [247, 249] id: 20
  r0_20.PurchaseRewardCache = nil
end
function r3_0.ClearDailyRewardCache(r0_21)
  -- line: [251, 253] id: 21
  r0_21.DailyRewardCache = nil
end
return r3_0
