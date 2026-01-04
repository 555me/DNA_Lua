-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\Shop\Banner\WBP_Shop_Recommend_Common_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("EMCache.EMCache")
local r1_0 = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr",
  "BluePrints.Common.DelayFrameComponent"
})
function r1_0.Construct(r0_1)
  -- line: [19, 21] id: 1
  r0_1:RefreshOpInfoByInputDevice(UIUtils.UtilsGetCurrentInputType())
end
function r1_0.InitBannerPage(r0_2, r1_2, r2_2)
  -- line: [29, 34] id: 2
  r0_2.BannerId = r1_2
  r0_2.BannerData = setmetatable({}, {
    __index = DataMgr.ShopBannerTab[r1_2],
  })
  r0_2.Parent = r2_2
  r0_2.Image_Hit:SetVisibility(UIConst.VisibilityOp.Visible)
end
function r1_0.SetBannerPageInfo(r0_3)
  -- line: [36, 65] id: 3
  -- notice: unreachable block#5
  -- notice: unreachable block#11
  r0_3.BannerData.ItemId = r0_3:GetValidItemId(r0_3.BannerData)
  r0_3:InitBaseInfo()
  local r1_3 = r0_3.BannerData.BgVideoPath
  if r1_3 then
    r1_3 = r0_3.BannerData.BgVideoPath
    if r1_3 ~= "" then
      r1_3 = r0_3.BannerData.DisplayType and not not r0_3.BannerData.DisplayId
    end
  else
    r1_3 = false
  end
  r0_3.bHasVideo = r1_3
  r1_3 = r0_3.Parent
  local r3_3 = r0_3.BannerData
  if r3_3 then
    r3_3 = r0_3.BannerData.DisplayType
    if r3_3 == "Resource" then
      r3_3 = r0_3.BannerData.DisplayId and not r0_3.bHasVideo
    else
      r3_3 = false
    end
  end
  r1_3:SetReplayGestureVisible(r3_3)
  if r0_3.bHasVideo then
    r0_3.Parent:SetCameraToDefault()
    r0_3.Parent:StopActorSound()
  else
    r0_3:InitModelInfo()
  end
  r0_3:InitVideoInfo()
  r0_3:AddDelayFrameFunc(function()
    -- line: [62, 64] id: 4
    r0_3:UpdateCommonTabInfo()
  end, 1)
end
function r1_0.GetValidItemId(r0_5, r1_5)
  -- line: [67, 81] id: 5
  local r2_5 = nil
  if not r1_5.ItemIds or not next(r1_5.ItemIds) then
    return r2_5
  end
  for r7_5, r8_5 in ipairs(r1_5.ItemIds) do
    local r9_5 = ShopUtils:GetShopItemPurchaseLimit(r8_5)
    if r9_5 and r9_5 > 0 then
      return r8_5
    else
      r2_5 = r8_5
    end
  end
  -- close: r3_5
  return r2_5
end
function r1_0.PlayAnimationSwitch(r0_6, r1_6)
  -- line: [83, 90] id: 6
  r0_6:StopAllAnimations()
  if r1_6 then
    r0_6:PlayAnimation(r0_6.Change_LToR)
  else
    r0_6:PlayAnimation(r0_6.Change_RToL)
  end
end
function r1_0.PlayAnimationOut(r0_7, r1_7)
  -- line: [92, 95] id: 7
  r0_7:StopAllAnimations()
  r0_7:PlayAnimation(r0_7.Out)
end
function r1_0.PlayAnimationIn(r0_8)
  -- line: [97, 101] id: 8
  r0_8:StopAllAnimations()
  r0_8:PlayAnimation(r0_8.In)
  r0_8:SetBannerPageInfo()
end
function r1_0.OnAnimationFinished(r0_9, r1_9)
  -- line: [103, 105] id: 9
end
function r1_0.InitBaseInfo(r0_10)
  -- line: [108, 128] id: 10
  local r1_10 = r0_10.BannerData
  if not r1_10 then
    return 
  end
  if r1_10.BannerType == UIConst.ShopBannerType.MonthCard then
    r0_10:SafeSetVisibility(r0_10.Group_Detail, UE4.ESlateVisibility.Collapsed)
    r0_10:SafeSetVisibility(r0_10.WS_Top, UE4.ESlateVisibility.Collapsed)
    return 
  else
    r0_10:SafeSetVisibility(r0_10.Group_Detail, UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_10:SafeSetVisibility(r0_10.WS_Top, UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  r0_10:InitTitleAndFont()
  r0_10:InitTopInfo()
  r0_10:InitPreviewInfo()
  r0_10:InitRewardInfo()
  r0_10:InitTimeInfo()
  r0_10:InitMainBtnInfo()
  r0_10.Parent:SetAllowedToShowHideUI(r1_10.DisplayType and r1_10.DisplayType ~= "")
end
function r1_0.SafeSetVisibility(r0_11, r1_11, r2_11)
  -- line: [130, 134] id: 11
  if r1_11 and r1_11.SetVisibility then
    r1_11:SetVisibility(r2_11)
  end
end
function r1_0.InitTitleAndFont(r0_12)
  -- line: [137, 178] id: 12
  local r1_12 = r0_12.BannerData
  if not r1_12 then
    return nil
  end
  local r2_12 = r0_12.WBP_Shop_Recommend_Common_TItle_C_0
  if r2_12 and r2_12.Text_MainTitle and r1_12.Text1 then
    r2_12.Text_MainTitle:SetText(GText(r1_12.Text1))
  end
  local r3_12 = r0_12:GetDisplayRarity()
  local r5_12 = nil	-- notice: implicit variable refs by block#[11, 12, 13]
  if r2_12 and r2_12.Text_MainTitle then
    local r4_12 = {
      [3] = "Font_Blue",
      [4] = "Font_Purple",
      [5] = "Font_Gold",
      [6] = "Font_Red",
    }
    if r3_12 then
      r5_12 = r4_12[r3_12]
      if not r5_12 then
        ::label_38::
        r5_12 = r4_12[5]
      end
    else
      goto label_38	-- block#10 is visited secondly
    end
    if r5_12 and r2_12[r5_12] then
      r2_12.Text_MainTitle:SetFont(r2_12[r5_12])
    end
  end
  if r0_12.Com_QualityTag then
    if r3_12 then
      r0_12.Com_QualityTag:Init(r3_12)
      r0_12:SafeSetVisibility(r0_12.Com_QualityTag, UE4.ESlateVisibility.SelfHitTestInvisible)
    else
      r0_12:SafeSetVisibility(r0_12.Com_QualityTag, UE4.ESlateVisibility.Collapsed)
    end
  end
  if r0_12.Group_ActivityQa and r0_12.Com_BtnExplanation and r0_12.Com_BtnExplanation.Tex_Explanation then
    if r1_12.Text2EntryText and r1_12.Text2 then
      local r4_12 = {
        OwnerWidget = r0_12,
        Desc = r1_12.Text2EntryText,
        ClickCallback = r0_12.OnBtnExplanationClick,
      }
      r0_12:SafeSetVisibility(r0_12.HB, UE4.ESlateVisibility.SelfHitTestInvisible)
      r0_12:SafeSetVisibility(r0_12.Group_ActivityQa, UE4.ESlateVisibility.SelfHitTestInvisible)
      r0_12.Com_BtnExplanation:Init(r4_12)
    else
      r0_12:SafeSetVisibility(r0_12.Group_ActivityQa, UE4.ESlateVisibility.Collapsed)
      local r4_12 = r0_12.HBTime and r0_12.ActivityTime
      if r4_12 then
        r5_12 = r4_12:IsVisible()
        if not r5_12 then
          ::label_126::
          r0_12:SafeSetVisibility(r0_12.HB, UE4.ESlateVisibility.Collapsed)
        end
      else
        goto label_126	-- block#28 is visited secondly
      end
    end
  end
end
function r1_0.GetDisplayRarity(r0_13)
  -- line: [180, 212] id: 13
  local r1_13 = r0_13.BannerData
  if not r1_13 then
    return nil
  end
  local r2_13 = {
    WeaponSkin = true,
    Skin = true,
    CharAccessory = true,
    WeaponAccessory = true,
    Resource = true,
  }
  local r3_13 = {
    GeneralSkin = true,
  }
  local r4_13 = nil
  local r5_13 = r1_13.DisplayType
  if r1_13.DisplayType and r2_13[r1_13.DisplayType] then
    local r6_13 = r1_13.DisplayId
    if r6_13 and DataMgr[r5_13] then
      local r7_13 = DataMgr[r5_13][r6_13]
      if r7_13 then
        r4_13 = r7_13.Rarity and nil
      else
        goto label_39	-- block#8 is visited secondly
      end
    end
  elseif r1_13.DisplayType and r3_13[r1_13.DisplayType] then
    local r6_13 = r1_13.SkinSeries
    for r12_13, r13_13 in ipairs({
      "Skin"
    }) do
      if r13_13 and DataMgr[r13_13] then
        for r18_13, r19_13 in pairs(DataMgr[r13_13]) do
          if r19_13 and r19_13.SkinSeries == r6_13 and r19_13.Rarity then
            r4_13 = r19_13.Rarity
            break
          end
        end
        -- close: r14_13
      end
      if r4_13 then
        break
      end
    end
    -- close: r8_13
  end
  return r4_13
end
function r1_0.OnBtnExplanationClick(r0_14)
  -- line: [214, 228] id: 14
  if not r0_14 then
    return 
  end
  local r1_14 = r0_14.BannerData
  if not r1_14 then
    return 
  end
  r0_14.Parent.Shop_RecommendBanner:StopBannerTimer()
  UIManager(r0_14):ShowCommonPopupUI(100269, {
    LongText = r1_14.Text2,
    Title = r1_14.Text2EntryText,
    CloseBtnCallbackObj = r0_14,
    CloseBtnCallbackFunction = function(r0_15, r1_15, r2_15)
      -- line: [223, 226] id: 15
      r0_15.Parent.Shop_RecommendBanner:StartBannerTimer()
    end,
  }, r0_14)
end
function r1_0.InitTopInfo(r0_16)
  -- line: [231, 294] id: 16
  local r1_16 = r0_16.BannerData
  if not r1_16 or not r0_16.WS_Top then
    return 
  end
  local r2_16 = nil
  r0_16:SafeSetVisibility(r0_16.Btn_Shop_Recommend_Video, UE4.ESlateVisibility.Collapsed)
  local r3_16 = r1_16.DisplayType
  if r3_16 then
    r3_16 = r1_16.DisplayType
    if r3_16 == "WeaponAccessory" then
      r3_16 = "UI_Banner_SwitchWeapon" and nil
    end
  else
    goto label_23	-- block#6 is visited secondly
  end
  if r3_16 then
    r0_16.WS_Top:SetActiveWidgetIndex(0)
    r0_16.Btn_Shop_Switch.Text_Btn:SetText(GText(r3_16))
    r0_16.Key_Recommond01.Text_Desc:SetText(GText(r3_16))
    r0_16.Key_Recommond01:CreateSubKeyDesc({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "LS",
        }
      },
      Type = "Img",
    })
    r0_16.Btn_Shop_Switch_M.Text_Btn:SetText(GText(r3_16))
    if UIUtils.IsKeyboardInput() then
      r0_16.WS_Key:SetActiveWidgetIndex(0)
      r2_16 = r0_16.Btn_Shop_Switch
    elseif UIUtils.IsGamepadInput() then
      r0_16.WS_Key:SetActiveWidgetIndex(1)
      r2_16 = r0_16.Key_Recommond01
    elseif UIUtils.IsMobileInput() then
      r0_16.WS_Key:SetActiveWidgetIndex(2)
      r2_16 = r0_16.Btn_Shop_Switch_M
    end
    r0_16:SafeSetVisibility(r0_16.WS_Key, UE4.ESlateVisibility.SelfHitTestInvisible)
    if r2_16 and r2_16.Btn_Click then
      r2_16.Btn_Click.OnClicked:Remove(r0_16, r0_16.OnBtnSwitchClick)
      r2_16.Btn_Click.OnClicked:Add(r0_16, r0_16.OnBtnSwitchClick)
    end
  else
    r0_16:SafeSetVisibility(r0_16.WS_Key, UE4.ESlateVisibility.Collapsed)
  end
  if r1_16.DisplayType and r1_16.DisplayType == "Resource" and r0_16.Parent.Btn_Shop_Refresh and r0_16.Parent.Btn_Shop_Refresh.Btn_Click and r0_16.OnBtnReplayClick then
    r0_16.Parent.Btn_Shop_Refresh.Btn_Click.OnClicked:Remove(r0_16, r0_16.OnReplayGesture)
    r0_16.Parent.Btn_Shop_Refresh.Btn_Click.OnClicked:Add(r0_16, r0_16.OnReplayGesture)
  end
end
function r1_0.OnBtnReplayClick(r0_17)
  -- line: [299, 303] id: 17
end
function r1_0.OnBtnSwitchClick(r0_18)
  -- line: [306, 317] id: 18
  DebugPrint("lgc@WBP_Shop_Recommend_Common OnBtnSwitchClick")
  AudioManager(r0_18):PlayUISound(r0_18, "event:/ui/common/click_btn_small", nil, nil)
  if r0_18.TabIdx == nil or r0_18.TabIdx == 1 then
    r0_18.TabIdx = 2
  else
    r0_18.TabIdx = 1
  end
  if r0_18.Parent.SwitchWeaponAccessoryPreview then
    r0_18.Parent:SwitchWeaponAccessoryPreview(r0_18.TabIdx)
  end
end
function r1_0.OnReplayGesture(r0_19)
  -- line: [320, 324] id: 19
  if r0_19.Parent and r0_19.BannerData and r0_19.BannerData.DisplayId then
    r0_19.Parent:ReplayGesture(r0_19.BannerData.DisplayId)
  end
end
function r1_0.InitRewardInfo(r0_20)
  -- line: [327, 428] id: 20
  local r1_20 = r0_20.BannerData
  if not r1_20 then
    r0_20:ClearAndHideRewardView()
    return 
  end
  local r2_20 = false
  local r3_20 = nil
  local r4_20 = nil
  local r5_20 = r0_20:GetShopItemInfo(r1_20.ItemId)
  if not r5_20 or r5_20.ItemType ~= "Reward" then
    r0_20:ClearAndHideRewardView()
    return 
  end
  local r6_20 = r0_20:GetShopItemInfo(r1_20.ItemId)
  if r6_20 and r6_20.TypeId and DataMgr.Reward and DataMgr.Reward[r6_20.TypeId] then
    r3_20 = r6_20.TypeId
    r4_20 = DataMgr.Reward and DataMgr.Reward[r3_20]
    if r4_20 and r4_20.Id and #r4_20.Id > 0 then
      r2_20 = true
    end
  end
  if not r2_20 then
    r0_20:ClearAndHideRewardView()
    return 
  end
  r0_20:SafeSetVisibility(r0_20.Group_RewardView, UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_20:SafeSetVisibility(r0_20.SwitchTitleIcon, UE4.ESlateVisibility.SelfHitTestInvisible)
  if r0_20.Text_RewardTitle and r1_20.DisplayText then
    r0_20:SafeSetVisibility(r0_20.Text_RewardTitle, UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_20.Text_RewardTitle:SetText(GText(r1_20.DisplayText))
  end
  if r0_20.List_Reward then
    r0_20.RewardList = {}
    local r7_20 = r4_20.Id
    local r8_20 = r4_20.Count
    local r9_20 = r4_20.Type
    for r13_20 = 1, #r7_20, 1 do
      local r14_20 = r7_20[r13_20]
      local r15_20 = RewardUtils
      if r15_20 then
        r15_20 = RewardUtils.GetCount and RewardUtils:GetCount(r8_20[r13_20]) and r8_20[r13_20]
      else
        goto label_117	-- block#25 is visited secondly
      end
      local r16_20 = DataMgr[r9_20[r13_20]][r14_20]
      local r17_20 = r16_20 and r16_20.Icon
      local r18_20 = nil	-- notice: implicit variable refs by block#[36]
      if r17_20 then
        r18_20 = ItemUtils
        if r18_20 then
          r18_20 = ItemUtils.GetItemIcon
          if r18_20 then
            r18_20 = ItemUtils.GetItemIcon(r14_20, r9_20[r13_20])
            if not r18_20 then
              ::label_141::
              r18_20 = nil
            end
          end
        end
      else
        goto label_141	-- block#32 is visited secondly
      end
      table.insert(r0_20.RewardList, {
        Id = r14_20,
        Type = r9_20[r13_20],
        ItemCount = r15_20,
        Icon = r18_20,
        Rarity = ItemUtils and ItemUtils.GetItemRarity and ItemUtils.GetItemRarity(r14_20, r9_20[r13_20]),
      })
    end
    r0_20.List_Reward:ClearListItems()
    for r14_20, r15_20 in pairs(r0_20.RewardList) do
      local r16_20 = NewObject(UIUtils and UIUtils.GetCommonItemContentClass and UIUtils.GetCommonItemContentClass())
      if r16_20 then
        r16_20.Id = r15_20.Id
        r16_20.Icon = ItemUtils and ItemUtils.GetItemIconPath and ItemUtils.GetItemIconPath(r15_20.Id, r15_20.Type)
        r16_20.ParentWidget = r0_20
        r16_20.ItemType = r15_20.Type
        r16_20.Count = r15_20.ItemCount
        r16_20.Rarity = r15_20.Rarity and 1
        r16_20.IsShowDetails = true
        function r16_20.AfterInitCallback(r0_21)
          -- line: [400, 423] id: 21
          if r0_21 and r0_21.BindEvents then
            r0_21:BindEvents(r0_20, {
              OnMenuOpenChanged = function(r0_22, r1_22)
                -- line: [402, 418] id: 22
                local r2_22 = UIUtils and UIUtils.UtilsGetCurrentInputType and UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad
                if r1_22 and r2_22 and r0_20.Owner and r0_20.Owner.Common_Tab and r0_20.Owner.Common_Tab.UpdateBottomKeyInfo then
                  r0_20.Owner.Common_Tab:UpdateBottomKeyInfo({})
                elseif not r1_22 and r2_22 and r0_20.Owner and r0_20.Owner.UpdateCommonTabInfoByReward then
                  r0_20.Owner:UpdateCommonTabInfoByReward()
                end
                if r1_22 then
                  r0_20.Parent.Shop_RecommendBanner:StopBannerTimer()
                else
                  r0_20.Parent.Shop_RecommendBanner:StartBannerTimer()
                end
              end,
            })
            r0_21.OnMouseButtonDownEvent = {
              Obj = r0_20,
              Callback = function()
                -- line: [419, 421] id: 23
                r0_20.Parent.Shop_RecommendBanner:StopBannerTimer()
              end,
            }
          end
        end
        r0_20.List_Reward:AddItem(r16_20)
      end
    end
    -- close: r10_20
  end
end
function r1_0.ClearAndHideRewardView(r0_24)
  -- line: [430, 442] id: 24
  r0_24:SafeSetVisibility(r0_24.Group_RewardView, UE4.ESlateVisibility.Collapsed)
  if r0_24.List_Reward then
    r0_24.List_Reward:ClearListItems()
  end
  if r0_24.RewardList then
    r0_24.RewardList = {}
  end
  r0_24:SafeSetVisibility(r0_24.SwitchTitleIcon, UE4.ESlateVisibility.Collapsed)
end
function r1_0.InitPreviewInfo(r0_25)
  -- line: [445, 481] id: 25
  local r1_25 = r0_25.Btn_Qa
  if r1_25 then
    r1_25 = r0_25.Btn_Qa.Button_Area and r0_25.Btn_Qa
  else
    goto label_7	-- block#2 is visited secondly
  end
  if r1_25 and r1_25.OnClicked then
    r1_25.OnClicked:Clear()
  end
  local r2_25 = r0_25.BannerData
  if not r2_25 or not r2_25.PreviewType then
    r0_25:HidePreviewInfo()
    return 
  end
  local r4_25 = r2_25.PreviewId
  local r5_25 = nil	-- notice: implicit variable refs by block#[14]
  if r2_25.PreviewType ~= "SkinSeries" then
    r5_25 = r4_25
    if r5_25 then
      r5_25 = #r4_25 > 0
    end
  else
    goto label_35	-- block#13 is visited secondly
  end
  if not r5_25 then
    r0_25:HidePreviewInfo()
    return 
  end
  r0_25:SafeSetVisibility(r0_25.HB_Desc, UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_25:SafeSetVisibility(r0_25.Text_ActivityDesc_White, UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_25:SafeSetVisibility(r0_25.Group_BtnQA, UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_25:SafeSetVisibility(r0_25.Btn_Qa, UE4.ESlateVisibility.SelfHitTestInvisible)
  if r0_25.Text_ActivityDesc_White and r2_25.PreviewEntryText then
    r0_25.Text_ActivityDesc_White:SetText(GText(r2_25.PreviewEntryText))
  end
  if not r1_25 then
    local r6_25 = r0_25.WBP_Shop_Recommend_Common_TItle_C_0 and r0_25.WBP_Shop_Recommend_Common_TItle
    if r6_25 and r6_25.Button_Preview then
      r1_25 = r6_25.Button_Preview
    end
  end
  if r1_25 and r1_25.OnClicked then
    r1_25.OnClicked:Add(r0_25, r0_25.OnBtnPreviewClick)
  end
end
function r1_0.OnBtnPreviewClick(r0_26)
  -- line: [483, 513] id: 26
  local r1_26 = r0_26.BannerData
  local r2_26 = r1_26.PreviewType
  local r3_26 = r1_26.PreviewId
  if (r2_26 == "Char" or r2_26 == "Weapon") and r3_26 then
    local r4_26 = {
      IsPreviewMode = true,
    }
    if r0_26.BannerData.PreviewType == "Char" then
      r4_26.PreviewCharIds = r3_26
    elseif r0_26.BannerData.PreviewType == "Weapon" then
      r4_26.PreviewWeaponIds = r3_26
    end
    r4_26.EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon
    r4_26.bNoEndCamera = true
    UIManager(r0_26):LoadUINew("ArmoryDetail", r4_26)
    r0_26.Parent.Shop_RecommendBanner:StopBannerTimer()
  elseif (r2_26 == "Skin" or r2_26 == "WeaponSkin" or r2_26 == "CharAccessory" or r2_26 == "WeaponAccessory" or r2_26 == "Resource") and r3_26 then
    UIManager(r0_26):LoadUINew("SkinPreview", {
      ItemType = r2_26,
      SkinList = r3_26,
      HidePurchase = true,
    })
    r0_26.Parent.Shop_RecommendBanner:StopBannerTimer()
    return 
  elseif r2_26 == "SkinSeries" then
    UIManager(r0_26):LoadUINew("CharSkinPreview", {
      Type = "ShopRecommend",
      SkinSeriesId = r1_26.SkinSeries,
    })
    r0_26.Parent.Shop_RecommendBanner:StopBannerTimer()
    return 
  end
end
function r1_0.HidePreviewInfo(r0_27)
  -- line: [515, 532] id: 27
  r0_27:SafeSetVisibility(r0_27.HB_Desc, UE4.ESlateVisibility.Collapsed)
  r0_27:SafeSetVisibility(r0_27.Text_ActivityDesc_White, UE4.ESlateVisibility.Collapsed)
  r0_27:SafeSetVisibility(r0_27.Group_BtnQA, UE4.ESlateVisibility.Collapsed)
  if r0_27.Btn_Qa then
    r0_27:SafeSetVisibility(r0_27.Btn_Qa, UE4.ESlateVisibility.Collapsed)
    local r1_27 = r0_27.Btn_Qa
    if r1_27 then
      r1_27 = r0_27.Btn_Qa.Button_Area and r0_27.Btn_Qa
    else
      goto label_34	-- block#3 is visited secondly
    end
    if not r1_27 then
      local r2_27 = r0_27.WBP_Shop_Recommend_Common_TItle_C_0 and r0_27.WBP_Shop_Recommend_Common_TItle
      if r2_27 and r2_27.Button_Preview then
        r1_27 = r2_27.Button_Preview
      end
    end
    if r1_27 and r1_27.OnClicked then
      r1_27.OnClicked:Clear()
    end
  end
end
function r1_0.InitTimeInfo(r0_28)
  -- line: [535, 565] id: 28
  r0_28:RemoveTimer("Recommend_Common_Timer")
  local r1_28 = r0_28.BannerData
  if not r1_28 then
    return 
  end
  local r2_28 = r1_28.EndTime
  local r3_28 = r0_28.Activity_Time
  local r4_28 = r0_28.HB_Time
  if r2_28 and r3_28 then
    r0_28:SafeSetVisibility(r0_28.HB, UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_28:SafeSetVisibility(r4_28 and r3_28, UE4.ESlateVisibility.SelfHitTestInvisible)
    local function r5_28()
      -- line: [546, 556] id: 29
      local r0_29, r1_29 = UIUtils.GetLeftTimeStrStyle2(r2_28)
      if r0_29 and r3_28.SetTimeText then
        r3_28:SetTimeText(GText("UI_Banner_RemainTime"), r0_29)
      else
        if r3_28.SetForeverTimeText then
          r3_28:SetForeverTimeText(GText("UI_GameEvent_EventTimeRemain"))
        end
        r0_28:RemoveTimer("Recommend_Common_Timer")
      end
    end
    r5_28()
    r0_28:AddTimer(1, r5_28, true, 0, "Recommend_Common_Timer", true)
  else
    r0_28:SafeSetVisibility(r4_28 and r3_28, UE4.ESlateVisibility.Collapsed)
    if not r0_28.Group_ActivityQa or not r0_28.Group_ActivityQa:IsVisible() then
      r0_28:SafeSetVisibility(r0_28.HB, UE4.ESlateVisibility.Collapsed)
    end
  end
end
function r1_0.InitMainBtnInfo(r0_30)
  -- line: [568, 620] id: 30
  local r1_30 = r0_30.BannerData
  if not r1_30 then
    return 
  end
  if r0_30.WS_Btn and r1_30.ItemId == nil and r1_30.InterfaceJumpId then
    r0_30.WS_Btn:SetActiveWidgetIndex(1)
  elseif r0_30.WS_Btn then
    r0_30.WS_Btn:SetActiveWidgetIndex(0)
  end
  if r0_30.Btn_Pay.Btn_Buy and r0_30.Btn_Pay.Btn_Buy.OnClicked then
    r0_30.Btn_Pay.Btn_Buy.OnClicked:Clear()
  end
  if r0_30.Btn_Get.Btn_Buy and r0_30.Btn_Get.Btn_Buy.OnClicked then
    r0_30.Btn_Get.Btn_Buy.OnClicked:Clear()
  end
  r0_30.PurchaseLimit = nil
  r0_30.ShopItemData = nil
  r0_30.FinalPrice = nil
  r0_30.PriceType = nil
  r0_30.MainBtn = nil
  r0_30.MainBtnClickFunc = nil
  local r2_30 = ShopUtils
  if r2_30 then
    r2_30 = ShopUtils.GetShopItemPurchaseLimit and r1_30.ItemId and ShopUtils:GetShopItemPurchaseLimit(r1_30.ItemId) and 0
  else
    goto label_75	-- block#18 is visited secondly
  end
  r0_30.PurchaseLimit = r2_30
  r0_30.ShopItemData = r0_30:GetShopItemInfo(r1_30.ItemId)
  r0_30.FinalPrice, r0_30.PriceType = r0_30:ComputeFinalPrice(r0_30.ShopItemData)
  r2_30 = r0_30.WS_Btn:GetActiveWidgetIndex()
  if r2_30 == 0 then
    r2_30 = r0_30.Btn_Pay and r0_30.Btn_Get
  else
    goto label_94	-- block#21 is visited secondly
  end
  r0_30.MainBtn = r2_30
  if not r0_30.MainBtn or not r0_30.MainBtn.Btn_Buy then
    return 
  end
  if r0_30.MainBtn.SetGamePadIconVisible then
    r0_30.MainBtn:SetGamePadIconVisible(true)
  end
  if r0_30.MainBtn.Key_ControllerBuy and r0_30.MainBtn.Key_ControllerBuy.CreateCommonKey then
    r0_30.MainBtn.Key_ControllerBuy:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "A",
        }
      },
    })
  end
  if r0_30.WS_Btn:GetActiveWidgetIndex() == 1 then
    r0_30:InitButtonGetInfo()
  else
    if r0_30.PurchaseLimit == 0 then
      r0_30:SetButtonPaySoldOut()
    else
      r0_30:SetButtonPayAvailable()
    end
    r0_30.MainBtn.Btn_Buy.OnClicked:Add(r0_30, r0_30.OnBtnPayClick)
    r0_30.MainBtnClickFunc = r0_30.OnBtnPayClick
  end
end
function r1_0.GetShopItemInfo(r0_31, r1_31)
  -- line: [622, 630] id: 31
  if not r1_31 then
    return nil
  end
  for r6_31, r7_31 in pairs(DataMgr.ShopItem and {}) do
    if r7_31.ItemId and r7_31.ItemId == r1_31 then
      return CommonUtils.DeepCopy(r7_31)
    end
  end
  -- close: r2_31
  return nil
end
function r1_0.GetCutoffInfo(r0_32, r1_32)
  -- line: [632, 640] id: 32
  if not r1_32 then
    return nil
  end
  for r6_32, r7_32 in pairs(DataMgr.Cutoff and {}) do
    if r7_32.ItemId and r7_32.ItemId == r1_32 then
      return CommonUtils.DeepCopy(r7_32)
    end
  end
  -- close: r2_32
  return nil
end
function r1_0.ComputeFinalPrice(r0_33, r1_33)
  -- line: [643, 669] id: 33
  if not r1_33 then
    return 0, nil
  end
  local r2_33 = r1_33.Price and 0
  local r3_33 = r1_33.PriceType
  local r4_33 = r2_33
  local r5_33 = r0_33.BannerData
  if r5_33 and r5_33.ItemId then
    local r6_33 = r0_33:GetCutoffInfo(r5_33.ItemId)
    local r7_33 = TimeUtils
    if r7_33 then
      r7_33 = TimeUtils.NowTime() and 0
    else
      goto label_28	-- block#8 is visited secondly
    end
    local r8_33 = false
    if r6_33 and r6_33.CutoffStartTime and r6_33.CutoffStartTime <= r7_33 and (not r6_33.CutoffEndTime or r6_33.CutoffEndTime and r7_33 <= r6_33.CutoffEndTime) then
      r8_33 = true
    end
    if r6_33 and r6_33.CutoffPrice and r8_33 then
      r4_33 = r6_33.CutoffPrice
    end
  end
  return r4_33, r3_33
end
function r1_0.SetButtonPaySoldOut(r0_34)
  -- line: [672, 685] id: 34
  if r0_34.MainBtn.Text_BtnEmpty then
    r0_34.MainBtn.Text_BtnEmpty:SetText(GText("UI_SHOP_SOLDOUT"))
    r0_34:SafeSetVisibility(r0_34.MainBtn.Text_BtnEmpty, UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  r0_34:SafeSetVisibility(r0_34.MainBtn.Text_BtnBuy, UE4.ESlateVisibility.Collapsed)
  if r0_34.MainBtn.Btn_Buy then
    r0_34.MainBtn:ForbidBtn(true)
  end
  r0_34:SafeSetVisibility(r0_34.MainBtn.Group_More, UE4.ESlateVisibility.Collapsed)
  r0_34:SafeSetVisibility(r0_34.MainBtn.Group_BuyNum, UE4.ESlateVisibility.Collapsed)
  r0_34:SafeSetVisibility(r0_34.MainBtn.WS_Detail, UE4.ESlateVisibility.Collapsed)
end
function r1_0.SetButtonPayAvailable(r0_35)
  -- line: [688, 767] id: 35
  -- notice: unreachable block#24
  if r0_35.MainBtn.Text_BtnBuy then
    r0_35:SafeSetVisibility(r0_35.MainBtn.Text_BtnBuy, UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_35.MainBtn.Text_BtnBuy:SetText(GText("UI_SHOP_PURCHASE"))
    r0_35.MainBtnTextStr = GText("UI_SHOP_PURCHASE")
  end
  r0_35:SafeSetVisibility(r0_35.MainBtn.Text_BtnEmpty, UE4.ESlateVisibility.Collapsed)
  if r0_35.MainBtn.Btn_Buy then
    r0_35.MainBtn:ForbidBtn(false)
  end
  if r0_35.MainBtn.Group_BuyNum and r0_35.MainBtn.Text_BuyNum and r0_35.PurchaseLimit > 0 then
    r0_35:SafeSetVisibility(r0_35.MainBtn.Group_BuyNum, UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_35.MainBtn.Text_BuyNum:SetText(GText("UI_Banner_Remain_Buy") .. tostring(r0_35.PurchaseLimit))
  else
    r0_35:SafeSetVisibility(r0_35.MainBtn.Group_BuyNum, UE4.ESlateVisibility.Collapsed)
  end
  if r0_35.MainBtn.Text_Price and r0_35.FinalPrice then
    r0_35:SafeSetVisibility(r0_35.MainBtn.Text_Price, UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_35.MainBtn.Text_Price:SetText(tostring(r0_35.FinalPrice))
    r0_35.MainBtn.Text_PriceMoneyNum:SetText(tostring(r0_35.FinalPrice))
    r0_35.MainBtn.Text_PriceMoneySymbol:SetText(GText(ShopUtils:GetCurrencyType()))
    local r1_35 = GWorld:GetAvatar()
    if r1_35 and r0_35.PriceType then
      if r1_35:GetResourceNum(r0_35.PriceType) < r0_35.FinalPrice then
        r0_35.MainBtn.Text_Price:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("DA2A4A"))
      else
        r0_35.MainBtn.Text_Price:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("FFFFFF"))
      end
    end
  end
  if r0_35.MainBtn.Text_Undiscounted_Price and r0_35.ShopItemData and r0_35.ShopItemData.Price then
    r0_35.MainBtn.Text_Undiscounted_Price:SetText(tostring(r0_35.ShopItemData.Price))
  end
  local r1_35 = r0_35.ShopItemData
  if r1_35 then
    r1_35 = r0_35.ShopItemData.ItemId
    if r1_35 then
      r1_35 = not DataMgr.ShopItem2PayGoods[r0_35.ShopItemData.ItemId]
      if r1_35 then
        ::label_178::
        r1_35 = false
      else
        r1_35 = true
      end
    end
  else
    goto label_178	-- block#23 is visited secondly
  end
  if r0_35.PriceType == 99 and r0_35.MainBtn.WS_Detail and r1_35 then
    r0_35.MainBtn.WS_Detail:SetActiveWidgetIndex(0)
  elseif r0_35.MainBtn.WS_Detail then
    r0_35.MainBtn.WS_Detail:SetActiveWidgetIndex(1)
    r0_35.MainBtn.Icon_Currency:Init({
      Id = r0_35.ShopItemData.PriceType,
      Icon = LoadObject(DataMgr.Resource[r0_35.ShopItemData.PriceType].Icon),
      ItemType = r0_35.ShopItemData.ItemType,
      UIName = "ShopMain",
    })
  end
  r0_35:SafeSetVisibility(r0_35.MainBtn.WS_Detail, UE4.ESlateVisibility.SelfHitTestInvisible)
  local r2_35 = r0_35.BannerData
  if not r2_35 then
    return 
  end
  local r3_35 = r0_35:GetCutoffInfo(r2_35.ItemId)
  local r4_35 = TimeUtils
  if r4_35 then
    r4_35 = TimeUtils.NowTime() and 0
  else
    goto label_250	-- block#36 is visited secondly
  end
  local r5_35 = false
  if r3_35 and r3_35.CutoffStartTime and r3_35.CutoffStartTime <= r4_35 and (not r3_35.CutoffEndTime or r3_35.CutoffEndTime and r4_35 <= r3_35.CutoffEndTime) then
    r5_35 = true
  end
  if r3_35 and r3_35.CutoffShow and r3_35.CutoffPrice and r5_35 then
    r0_35:SafeSetVisibility(r0_35.MainBtn.Group_More, UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_35:SafeSetVisibility(r0_35.MainBtn.Text_Undiscounted_Price, UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    r0_35:SafeSetVisibility(r0_35.MainBtn.Group_More, UE4.ESlateVisibility.Collapsed)
    r0_35:SafeSetVisibility(r0_35.MainBtn.Text_Undiscounted_Price, UE4.ESlateVisibility.Collapsed)
  end
end
function r1_0.OnBtnPayClick(r0_36)
  -- line: [769, 847] id: 36
  if AudioManager then
    AudioManager(r0_36):PlayUISound(r0_36, "event:/ui/common/gacha_btn_click_normal", nil, nil)
  end
  if r0_36.PurchaseLimit == 0 then
    UIManager(r0_36):ShowUITip("CommonToastMain", GText("UI_SHOP_SOLDOUT"))
    return 
  end
  local r1_36 = setmetatable({}, {
    __index = r0_36.ShopItemData,
  })
  local function r2_36(r0_37, r1_37, r2_37)
    -- line: [781, 816] id: 37
    local r3_37 = GWorld:GetAvatar()
    if not r3_37 or not r1_36 then
      return 
    end
    if not r2_37 or not r2_37.Params or not r2_37.Params.ShopItemData then
      return 
    end
    local r4_37 = 1
    if r1_37 and r1_37.Content_1 and r1_37.Content_1.CallObj and r1_37.Content_1.CallObj.CurrentCount then
      r4_37 = r1_37.Content_1.CallObj.CurrentCount
    end
    local r5_37, r6_37 = r0_36:ComputeFinalPrice(r1_36)
    if r3_37:GetResourceNum(r6_37) < r5_37 * r4_37 and r0_36.PriceType == 99 then
      UIManager(r0_36):ShowCommonPopupUI(100263, {
        LeftCallbackObj = r0_36,
        LeftCallbackFunction = function()
          -- line: [802, 804] id: 40
          r0_36.Parent.Shop_RecommendBanner:StartBannerTimer()
        end,
        RightCallbackObj = r0_36,
        RightCallbackFunction = function()
          -- line: [794, 798] id: 38
          r0_36:AddTimer(0.3, function()
            -- line: [795, 797] id: 39
            PageJumpUtils:JumpToShopPage(CommonConst.GachaJumpToShopMainTabId, nil, nil, "Shop")
          end, false, 0, "JumpToShopPage", true)
        end,
      }, r0_36)
      return 
    end
    r3_37:PurchaseShopItem(r2_37.Params.ShopItemData.ItemId, r4_37, false, function(r0_41)
      -- line: [811, 815] id: 41
      if r0_36 and r0_36.Parent and r0_36.Parent.Shop_RecommendBanner then
        r0_36.Parent.Shop_RecommendBanner:StartBannerTimer()
      end
    end)
  end
  local r3_36 = r0_36.BannerData
  if r3_36 and r3_36.ItemId then
    r0_36.Parent.Shop_RecommendBanner:StopBannerTimer()
    if r1_36.Bg == 1 and UIManager then
      UIManager(r0_36):LoadUINew("PayGiftPopup_Yellow", r1_36, r0_36, function()
        -- line: [821, 823] id: 42
        r0_36.Parent.Shop_RecommendBanner:StartBannerTimer()
      end)
    elseif r1_36.Bg == 2 and UIManager then
      UIManager(r0_36):LoadUINew("PayGiftPopup_Purple", r1_36, r0_36, function()
        -- line: [825, 827] id: 43
        r0_36.Parent.Shop_RecommendBanner:StartBannerTimer()
      end)
    else
      UIManager(r0_36):ShowCommonPopupUI(100041, {
        ShopItemData = r1_36,
        ShopType = 0,
        Funds = {
          {
            FundId = r1_36.PriceType,
            FundNeed = r0_36.FinalPrice,
          }
        },
        ShowParentTabCoin = true,
        RightCallbackObj = r0_36,
        RightCallbackFunction = r2_36,
        LeftCallbackObj = r0_36,
        LeftCallbackFunction = function(r0_44, r1_44, r2_44)
          -- line: [839, 842] id: 44
          r2_44:OnClose()
          r0_44.Parent.Shop_RecommendBanner:StartBannerTimer()
        end,
        ForbidRightBtn = false,
      }, r0_36)
    end
  end
end
function r1_0.InitButtonGetInfo(r0_45)
  -- line: [849, 872] id: 45
  if not r0_45.MainBtn then
    return 
  end
  if r0_45.MainBtn.Text_BtnBuy then
    r0_45.MainBtn.Text_BtnBuy:SetText(GText("UI_Banner_SkinGacha_Goto"))
    r0_45.MainBtnTextStr = GText("UI_Banner_SkinGacha_Goto")
  end
  if r0_45.MainBtn.Text_BtnDesc then
    r0_45.MainBtn.Text_BtnDesc:SetText(GText("UI_Banner_SkinGacha_Get"))
  end
  r0_45:SafeSetVisibility(r0_45.MainBtn.Image_Get, UE4.ESlateVisibility.Collapsed)
  if r0_45.MainBtn.Btn_Buy then
    r0_45.MainBtn.Btn_Buy:SetForbidden(false)
  end
  if r0_45.MainBtn.Btn_Buy then
    r0_45.MainBtn.Btn_Buy.OnClicked:Add(r0_45, r0_45.OnBtnGetClick)
    r0_45.MainBtnClickFunc = r0_45.OnBtnGetClick
  end
end
function r1_0.OnBtnGetClick(r0_46)
  -- line: [874, 884] id: 46
  AudioManager(r0_46):PlayUISound(r0_46, "event:/ui/common/click_btn_large_crystal", nil, nil)
  local r1_46 = r0_46.BannerData
  if r1_46 and r1_46.InterfaceJumpId then
    local r2_46 = r1_46.InterfaceJumpId
    if PageJumpUtils then
      PageJumpUtils:JumpToTargetPageByJumpId(r2_46)
      r0_46.Parent.Shop_RecommendBanner:StopBannerTimer()
    end
  end
end
function r1_0.InitModelInfo(r0_47)
  -- line: [891, 918] id: 47
  local r1_47 = r0_47.BannerData.DisplayType
  if not r1_47 or r0_47.BannerData.DisplayId == nil and r0_47.BannerData.SkinSeries == nil then
    if r0_47.Parent then
      r0_47.Parent.Group_BG:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      r0_47.Parent:SetCameraToDefault()
    end
    return 
  end
  r0_47.Parent:SetShowModel(true)
  local r2_47 = {
    ItemType = r1_47,
  }
  if r1_47 == "GeneralSkin" then
    r2_47.SkinSeries = r0_47.BannerData.SkinSeries
  else
    r2_47.TypeId = r0_47.BannerData.DisplayId
  end
  if r0_47.Parent then
    r0_47.Parent.Group_BG:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_47.Parent:SetCameraToPreviewActor()
  end
  r0_47.Image_Hit:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_47.Parent:UpdatePreviewActor(r2_47, FVector(0, 35, 0))
  r0_47.TabIdx = 1
end
function r1_0.OnOpenModelPreview(r0_48)
  -- line: [920, 943] id: 48
  if r0_48.BannerData.PreviewType == nil then
    return 
  end
  if r0_48.BannerData.PreviewType == "Char" or r0_48.BannerData.PreviewType == "Weapon" then
    local r1_48 = {
      IsPreviewMode = true,
    }
    if r0_48.BannerData.PreviewType == "Char" then
      r1_48.PreviewCharIds = r0_48.BannerData.PreviewId
    elseif r0_48.BannerData.PreviewType == "Weapon" then
      r1_48.PreviewWeaponIds = r0_48.BannerData.PreviewId
    end
    r1_48.EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon
    r1_48.bNoEndCamera = true
    UIManager(r0_48):LoadUINew("ArmoryDetail", r1_48)
  else
    UIManager(r0_48):LoadUINew("SkinPreview", {
      ItemType = r0_48.BannerData.PreviewType,
      SkinList = r0_48.BannerData.PreviewId,
      HidePurchase = true,
    })
  end
end
function r1_0.InitVideoInfo(r0_49)
  -- line: [951, 963] id: 49
  r0_49.Parent:SetHasVideo(r0_49.bHasVideo)
  if not r0_49.bHasVideo then
    return 
  end
  r0_49.Parent:InitVideoPlayer(r0_49.BannerData.BgVideoPath, r0_49.BannerData.DisplayType, r0_49.BannerData.DisplayId)
  if not r0_49.Parent.bPlayVideoTop then
    r0_49.Parent:PlayVideoBG()
  end
end
function r1_0.RefreshOpInfoByInputDevice(r0_50, r1_50, r2_50)
  -- line: [968, 974] id: 50
  if r1_50 == ECommonInputType.Gamepad then
    r0_50:RefreshOpInfoByGamepad()
  else
    r0_50:RefreshOpInfoByPC()
  end
end
function r1_0.RefreshOpInfoByGamepad(r0_51)
  -- line: [976, 1007] id: 51
  if r0_51.Btn_Shop_Recommend_Video and r0_51.Btn_Shop_Recommend_Video.WS_Icon then
    r0_51.Btn_Shop_Recommend_Video.WS_Icon:SetActiveWidget(r0_51.Btn_Shop_Recommend_Video.Key_Icon)
    r0_51.Btn_Shop_Recommend_Video.Key_Icon:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "View",
        }
      },
    })
  end
  if r0_51.Com_BtnExplanation and r0_51.Com_BtnExplanation.Com_KeyImg then
    r0_51.Com_BtnExplanation.WidgetSwitcher_0:SetActiveWidget(r0_51.Com_BtnExplanation.Com_KeyImg)
    r0_51.Com_BtnExplanation.Com_KeyImg:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "Menu",
        }
      },
    })
  end
  if r0_51.WS_Key then
    r0_51.WS_Key:SetActiveWidgetIndex(1)
  end
  if r0_51.MainBtn and r0_51.MainBtn.Key_ControllerBuy then
    r0_51.MainBtn.Key_ControllerBuy:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end
function r1_0.RefreshOpInfoByPC(r0_52)
  -- line: [1009, 1026] id: 52
  if r0_52.Btn_Shop_Recommend_Video and r0_52.Btn_Shop_Recommend_Video.WS_Icon then
    r0_52.Btn_Shop_Recommend_Video.WS_Icon:SetActiveWidget(r0_52.Btn_Shop_Recommend_Video.Image_BtnIcon)
  end
  if r0_52.Com_BtnExplanation and r0_52.Com_BtnExplanation.WidgetSwitcher_0 then
    r0_52.Com_BtnExplanation.WidgetSwitcher_0:SetActiveWidget(r0_52.Com_BtnExplanation.Com_BtnQa)
  end
  if r0_52.WS_Key then
    r0_52.WS_Key:SetActiveWidgetIndex(0)
    if r0_52.Btn_Shop_Switch and r0_52.Btn_Shop_Switch.Btn_Click then
      r0_52.Btn_Shop_Switch.Btn_Click.OnClicked:Remove(r0_52, r0_52.OnBtnSwitchClick)
      r0_52.Btn_Shop_Switch.Btn_Click.OnClicked:Add(r0_52, r0_52.OnBtnSwitchClick)
    end
  end
  if r0_52.MainBtn and r0_52.MainBtn.Key_ControllerBuy then
    r0_52.MainBtn.Key_ControllerBuy:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r1_0.UpdateCommonTabInfo(r0_53)
  -- line: [1029, 1085] id: 53
  local r1_53 = {}
  if r0_53.BannerData.DisplayType and r0_53.BannerData.DisplayType == "Resource" and r0_53.BannerData.DisplayId and not r0_53.bHasVideo then
    table.insert(r1_53, {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "R",
          ClickCallback = r0_53.OnReplayGesture,
          Owner = r0_53,
        }
      },
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "Y",
          ClickCallback = r0_53.OnReplayGesture,
          Owner = r0_53,
        }
      },
      Desc = GText("UI_Banner_ReplayGesture"),
    })
  end
  table.insert(r1_53, {
    KeyInfoList = {
      {
        Type = "Text",
        Text = "U",
        ClickCallback = function()
          -- line: [1040, 1044] id: 54
          if r0_53.Parent and r0_53.Parent.HideUIExceptVideoAutoCallBack and r0_53.Parent:IsAllowedToShowHideUI() then
            r0_53.Parent:HideUIExceptVideoAutoCallBack()
          end
        end,
        Owner = r0_53,
      }
    },
    GamePadInfoList = {
      {
        Type = "Img",
        ImgShortPath = "X",
        ClickCallback = function()
          -- line: [1045, 1049] id: 55
          if r0_53.Parent and r0_53.Parent.HideUIExceptVideoAutoCallBack and r0_53.Parent:IsAllowedToShowHideUI() then
            r0_53.Parent:HideUIExceptVideoAutoCallBack()
          end
        end,
        Owner = r0_53,
      }
    },
    Desc = GText("UI_CameraSystem_HideUI"),
  })
  if r0_53.BannerData.PreviewType and r0_53.BannerData.PreviewId and next(r0_53.BannerData.PreviewId) then
    table.insert(r1_53, {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "View",
          ClickCallback = function()
            -- line: [1053, 1055] id: 56
            r0_53:OnBtnPreviewClick()
          end,
          Owner = r0_53,
        }
      },
      Desc = GText("UI_Preview_Title"),
    })
  end
  if r0_53.BannerData.DisplayType and (r0_53.BannerData.DisplayId or r0_53.BannerData.SkinSeries) and not r0_53.bHasVideo then
    if r0_53.BannerData.DisplayType ~= "Weapon" and r0_53.BannerData.DisplayType ~= "WeaponSkin" and r0_53.BannerData.DisplayType ~= "WeaponAccessory" then
      local r2_53 = table.insert
      local r3_53 = r1_53
      local r4_53 = {
        KeyInfoList = {
          {
            Type = "Text",
            Text = CommonUtils:GetKeyText("Mouse_Button"),
            Owner = r0_53,
          }
        },
      }
      local r5_53 = {
        {
          Type = "Or",
        }
      }
      r4_53.GamePadInfoList = r5_53
      r4_53.Desc = GText("UI_Dye_Zoom")
      r4_53.bLongPress = false
      r2_53(r3_53, r4_53)
    end
    table.insert(r1_53, {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "RH",
        }
      },
      Desc = GText("UI_CTL_RotatePreview"),
    })
  end
  local r2_53 = table.insert
  local r3_53 = r1_53
  local r4_53 = {
    KeyInfoList = {
      {
        Type = "Text",
        Text = "Space",
        ClickCallback = r0_53.MainBtnClickFunc,
        Owner = r0_53,
      }
    },
    Desc = r0_53.MainBtnTextStr and GText("UI_SHOP_PURCHASE"),
  }
  r2_53(r3_53, r4_53)
  table.insert(r1_53, {
    KeyInfoList = {
      {
        Type = "Text",
        Text = "Esc",
        ClickCallback = r0_53.CloseSelf,
        Owner = r0_53,
      }
    },
    GamePadInfoList = {
      {
        Type = "Img",
        ImgShortPath = "B",
        ClickCallback = r0_53.CloseSelf,
        Owner = r0_53,
      }
    },
    Desc = GText("UI_BACK"),
  })
  if r0_53.Parent and r0_53.Parent.UpdateCommonTabInfo then
    r0_53.Parent:UpdateCommonTabInfo(r1_53)
  end
end
function r1_0.HandlePreviewKeyDown(r0_57, r1_57, r2_57)
  -- line: [1087, 1096] id: 57
  print("lgc@WBP_Shop_Recommend_Common HandlePreviewKeyDown", r2_57)
  if (r2_57 == "SpaceBar" or r2_57 == Const.GamepadFaceButtonDown) and r0_57.MainBtnClickFunc then
    r0_57.MainBtnClickFunc(r0_57)
    return true
  end
  return false
end
function r1_0.HandleKeyDown(r0_58, r1_58, r2_58)
  -- line: [1098, 1130] id: 58
  -- notice: unreachable block#30
  print("lgc@WBP_Shop_Recommend_Common HandleKeyDown", r2_58)
  if (r2_58 == "R" or r2_58 == Const.GamepadFaceButtonUp) and r0_58.BannerData.DisplayId and r0_58.BannerData.DisplayType and r0_58.BannerData.DisplayType == "Resource" then
    r0_58:OnReplayGesture()
    return true
  elseif r2_58 == Const.GamepadLeftThumbstick and r0_58.BannerData.DisplayType and r0_58.BannerData.DisplayType == "WeaponAccessory" then
    r0_58:OnBtnSwitchClick()
    return true
  elseif r2_58 == "U" or r2_58 == Const.GamepadFaceButtonLeft then
    if r0_58.Parent and r0_58.Parent.HideUIExceptVideoAutoCallBack and r0_58.Parent:IsAllowedToShowHideUI() then
      r0_58.Parent:HideUIExceptVideoAutoCallBack()
    end
    return true
  elseif r2_58 == Const.GamepadSpecialRight and r0_58.BannerData.Text2EntryText and r0_58.BannerData.Text2 then
    r0_58:OnBtnExplanationClick()
    return true
  elseif r2_58 == Const.GamepadSpecialLeft then
    local r3_58 = r0_58.BannerData.BgVideoPath and r0_58.BannerData.BgVideoPath ~= ""
    local r4_58 = r0_58.BannerData
    local r5_58 = r4_58.PreviewType
    if r5_58 ~= "SkinSeries" then
      r5_58 = r4_58.PreviewType and r4_58.PreviewId and next(r4_58.PreviewId)
    else
      r5_58 = true
    end
    if r0_58.Parent and not r0_58.Parent:SetHasVideo(r3_58) and r5_58 then
      r0_58:OnBtnPreviewClick()
      return true
    end
  end
  return false
end
function r1_0.HandleRepeatKeyDown(r0_59, r1_59, r2_59)
  -- line: [1132, 1146] id: 59
  local r3_59 = false
  if r2_59 == UIConst.GamePadKey.LeftTriggerThreshold and r0_59.Parent and r0_59.Parent.OnCameraScrollBackwardKeyDown then
    r0_59.Parent:OnCameraScrollBackwardKeyDown()
    r3_59 = true
  elseif r2_59 == UIConst.GamePadKey.RightTriggerThreshold and r0_59.Parent and r0_59.Parent.OnCameraScrollForwardKeyDown then
    r0_59.Parent:OnCameraScrollForwardKeyDown()
    r3_59 = true
  end
  return r3_59
end
return r1_0
