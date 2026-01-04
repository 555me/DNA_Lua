-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\Shop\WBP_ShopMain_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("Utils.MiscUtils")
local r1_0 = require("EMCache.EMCache")
local r2_0 = Class("BluePrints.UI.Shop.WBP_Shop_Base_New_C")
r2_0._components = {
  "BluePrints.UI.UI_PC.Common.HorizontalListViewResizeComp",
  "BluePrints.UI.UI_PC.Common.LSFocusComp",
  "BluePrints.UI.Shop.SkinPreview.SkinPreview_ActorComponent",
  "BluePrints.UI.Shop.Component.Shop_PointerInputComponent",
  "BluePrints.UI.WBP.Armory.ActorController.PreviewActorComponent"
}
function r2_0.Initialize(r0_1, r1_1)
  -- line: [21, 23] id: 1
  r0_1.Super.Initialize(r0_1)
end
function r2_0.OnLoaded(r0_2, ...)
  -- line: [28, 106] id: 2
  r2_0.Super.OnLoaded(r0_2)
  local r6_2 = nil	-- notice: implicit variable refs by block#[2]
  if not r1_0:Get("ShopUnlockTime", true) then
    r1_0:Set("ShopUnlockTime", TimeUtils.NowTime(), true)
  end
  r0_2.bIsFocusable = true
  r0_2.Filters = {
    "UI_Select_Default",
    "UI_Select_Time",
    "UI_RARITY_NAME",
    "UI_PRICE_NAME"
  }
  r0_2.MainTabMap = {}
  local r1_2 = {}
  r0_2.SubTabMap = r1_2
  r0_2.bFilterOwned = false
  r0_2:PlayAnimationReverse(r0_2.Filtrate_Normal)
  r0_2.Text_CountdownTime:SetVisibility(ESlateVisibility.Collapsed)
  ... = ... -- error: untaken top expr
  r0_2.CloseCallBack = r5_2
  r0_2.ClsoeCallBackObj = r6_2
  r0_2.SelectShopItemId = r3_2
  r0_2.List_Item:SetVisibility(ESlateVisibility.Visible)
  if r4_2 then
    local r7_2 = DataMgr.Shop[r4_2].PlaySystemUIBGM
    if r7_2 then
      AudioManager(r0_2):PlaySystemUIBGM(r7_2, nil, r4_2)
    end
  end
  if GWorld.GameInstance then
    GWorld.GameInstance:SetHighFrequencyMemoryCheckGCEnabled(true, "ShopMain")
  end
  r0_2.bAllowedToShowHideUI = false
  r0_2.bShowModel = false
  r0_2.bHideUIExceptVideo = false
  r0_2._OriginVisibilityMap = r0_2._OriginVisibilityMap and {}
  r0_2.BannerTabStates = {}
  local r7_2 = false
  local r8_2 = nil
  local r9_2 = nil
  local r10_2 = nil
  local r11_2 = DataMgr.ShopTabMain[r1_2]
  if r4_2 == "Shop" and (r1_2 == nil or r11_2 and r11_2.PinVideo) then
    local r12_2 = ShopUtils:GetBannerInfo(true)
    local r13_2 = ShopUtils:GetBannerInfo()
    local r14_2 = nil
    if r12_2[1] then
      r14_2 = r12_2[1]
    elseif r13_2[1] then
      r14_2 = r13_2[1]
    end
    if r14_2 then
      local r15_2 = r14_2.Id
      r8_2 = DataMgr.ShopBannerTab[r15_2].BgVideoPath
      r10_2 = DataMgr.ShopBannerTab[r15_2].DisplayId
      r9_2 = DataMgr.ShopBannerTab[r15_2].DisplayType
      if r8_2 and r8_2 ~= "" and r0_2:IsFirstTimeToEnterBanner(r15_2) then
        r7_2 = true
      end
    end
  end
  r0_2:InitShop(r1_2, r2_2, r3_2, r4_2, r7_2)
  if r7_2 then
    r0_2:InitVideoPlayer(r8_2, r9_2, r10_2)
    r0_2:PlayVideoTop()
  end
  r0_2:ShowSkipButton(false)
  r0_2.Image_Hit.OnMouseButtonDownEvent:Unbind()
  r0_2.Image_Hit.OnMouseButtonDownEvent:Bind(r0_2, r0_2.On_Image_Click_MouseButtonDown)
end
function r2_0.IsFirstTimeToEnterBanner(r0_3, r1_3)
  -- line: [109, 116] id: 3
  local r2_3 = "bHasPlayedVideo_" .. r1_3
  if not r1_0:Get(r2_3, true) then
    r1_0:Set(r2_3, true, true)
    return true
  end
  return false
end
function r2_0.ReceiveEnterState(r0_4, r1_4)
  -- line: [118, 131] id: 4
  r2_0.Super.ReceiveEnterState(r0_4, r1_4)
  if r0_4.ShopType then
    local r2_4 = DataMgr.Shop[r0_4.ShopType].PlaySystemUIBGM
    if r2_4 then
      AudioManager(r0_4):PlaySystemUIBGM(r2_4, nil, r0_4.ShopType)
    end
  end
  if r1_4 == 1 and r0_4:IsHasVideo() then
    r0_4:PlayVideoBG()
  end
  r0_4:ForceUpdateLight()
end
function r2_0.ReceiveExitState(r0_5, r1_5)
  -- line: [133, 140] id: 5
  r2_0.Super.ReceiveExitState(r0_5, r1_5)
  if r1_5 == 0 and r0_5:IsHasVideo() and r0_5.bPlayVideoBG then
    r0_5:StopVideoBG()
  end
  r0_5:HideAllPreviewActor()
end
function r2_0.Construct(r0_6)
  -- line: [142, 201] id: 6
  r2_0.Super.Construct(r0_6)
  r0_6.List_Item.OnCreateEmptyContent:Bind(r0_6, function(r0_7)
    -- line: [144, 148] id: 7
    local r1_7 = NewObject(r0_7.ShopItemContentClass)
    r1_7.ShopId = nil
    return r1_7
  end)
  r0_6.List_Jump.OnCreateEmptyContent:Bind(r0_6, function(r0_8)
    -- line: [150, 154] id: 8
    local r1_8 = UIManager(r0_8):_CreateWidgetNew("JumpShopItem")
    r1_8.JumpShopData = nil
    return r1_8
  end)
  r0_6.Text_BottomTabTips:SetText(GText("UI_Banner_Reminder"))
  if UE.AHotUpdateGameMode.IsGlobalPak() then
    r0_6.Text_BottomTabTips:SetVisibility(ESlateVisibility.Collapsed)
  else
    r0_6.Text_BottomTabTips:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  r0_6.CheckBox_Own:BindEventOnClicked({
    Inst = r0_6,
    Func = r0_6.OnClickFilterOwned,
  })
  r0_6.Text_ShopItemEmpty:SetText(GText("UI_SHOP_SOLDOUT"))
  r0_6.Text_None:SetText(GText("UI_SHOP_NOTOWNED"))
  r0_6.ShopTab:BindEventOnTabSelected(r0_6, r0_6.OnMainTabChanged)
  if r0_6.Common_Tab.WBP_Com_Tab_ResourceBar then
    r0_6.Common_Tab.WBP_Com_Tab_ResourceBar:SetLastFocusWidget(r0_6.List_Item)
  end
  r0_6.ScrollBox_Recommend.OnUserScrolled:Add(r0_6, r0_6.OnUserScrolled)
  r0_6.ScrollBox_Recommend.OnMouseButtonDown:Add(r0_6, function(r0_9, r1_9, r2_9)
    -- line: [174, 180] id: 9
    local r3_9 = r0_9.Shop_RecommendBanner:GetCachedGeometry()
    if UE4.USlateBlueprintLibrary.IsUnderLocation(r3_9, UE4.UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(r2_9)) then
      r0_9.Shop_RecommendBanner:OnScrollBoxMouseButtonDown(r3_9, r2_9)
    end
  end)
  r0_6.ScrollBox_Recommend.OnMouseButtonUp:Add(r0_6, function(r0_10, r1_10, r2_10)
    -- line: [181, 187] id: 10
    local r3_10 = r0_10.Shop_RecommendBanner:GetCachedGeometry()
    if UE4.USlateBlueprintLibrary.IsUnderLocation(r3_10, UE4.UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(r2_10)) then
      r0_10.Shop_RecommendBanner:OnScrollBoxMouseButtonUp(r3_10, r2_10)
    end
  end)
  r0_6:AddDispatcher(EventID.OnRechargeFinished, r0_6, r0_6.OnRechargeFinished)
  r0_6:AddDispatcher(EventID.RefreshShop, r0_6, r0_6.RefreshShop)
  if r0_6.Btn_Shop_Visible and r0_6.Btn_Shop_Visible.Btn_Click then
    r0_6.Btn_Shop_Visible.Btn_Click.OnClicked:Add(r0_6, r0_6.HideUIExceptVideoAutoCallBack)
  end
  if r0_6.Btn_Shop_Visible then
    r0_6.Btn_Shop_Visible:SetVisibility(ESlateVisibility.Collapsed)
  end
  if r0_6.Btn_Shop_Refresh then
    r0_6.Btn_Shop_Refresh:SetVisibility(ESlateVisibility.Collapsed)
  end
end
function r2_0.RefreshShop(r0_11)
  -- line: [203, 211] id: 11
  if not r0_11.bNeedRefreshShop then
    r0_11.bNeedRefreshShop = true
    r0_11:AddTimer(1, function()
      -- line: [206, 209] id: 12
      r0_11:RefreshSubTabData(r0_11.CurSubTabMap)
      r0_11.bNeedRefreshShop = false
    end, false, 0, "RefreshShop", true)
  end
end
function r2_0.InitShopTabInfo(r0_13, r1_13, r2_13)
  -- line: [220, 271] id: 13
  if not GWorld:GetAvatar() then
    return 
  end
  local r4_13 = DataMgr.Shop[r0_13.ShopType]
  assert(r4_13, "获取商店类型信息失败:" .. r0_13.ShopType)
  r0_13:LoadShopTabInfo(r4_13)
  r0_13.Common_Tab:Init({
    DynamicNode = {
      "Back",
      "ResourceBar",
      "BottomKey"
    },
    BottomKeyInfo = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = r0_13,
          }
        },
        Desc = GText("UI_Tips_Ensure"),
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = r0_13.CloseSelf,
            Owner = r0_13,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = r0_13.CloseSelf,
            Owner = r0_13,
          }
        },
        Desc = GText("UI_BACK"),
      }
    },
    StyleName = "Text",
    TitleName = GText(r4_13.ShopName),
    OverridenTopResouces = r0_13.OverridenTopResouces,
    OnResourceBarAddedToFocusPath = r0_13.OnResourceBarAddedToFocusPath,
    OnResourceBarRemovedFromFocusPath = r0_13.OnResourceBarRemovedFromFocusPath,
    OwnerPanel = r0_13,
    BackCallback = r0_13.CloseSelf,
  })
  r0_13.ShopTab:Init({
    LeftKey = "Q",
    RightKey = "E",
    Tabs = r0_13.MainTabList,
    ChildWidgetBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Tab/PC/WBP_Com_TabItem01_P.WBP_Com_TabItem01_P\'",
  })
  if not r1_13 then
    r0_13.ShopTab:SelectTab(1)
  else
    r0_13.ShopTab:SelectTab(r0_13.MainTabs[r1_13])
    if r0_13.Common_Toggle_TabGroup_PC then
      r0_13.Common_Toggle_TabGroup_PC:SelectTab(r0_13.SubTabMapIdx[r2_13])
    end
  end
  if #r0_13.MainTabList <= 1 then
    r0_13.Group_Tab:SetVisibility(ESlateVisibility.Collapsed)
  else
    r0_13.Group_Tab:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  r0_13:AddLSFocusTarget(nil, {
    r0_13.Common_SortList_PC
  })
  r0_13:AddLSFocusTarget(r0_13.CheckBox_Own.Com_KeyImg, r0_13.CheckBox_Own, "X", true)
  r0_13:AddTabReddotListen()
end
function r2_0.AddTabReddotListen(r0_14)
  -- line: [273, 309] id: 14
  for r5_14, r6_14 in pairs(DataMgr.Shop[r0_14.ShopType].MainTabId) do
    local r7_14 = DataMgr.ShopItem2ShopTab[r6_14]
    if r7_14 then
      for r12_14, r13_14 in pairs(r7_14) do
        local r14_14 = DataMgr.ShopTabSub[r12_14].ReddotNode
        if r14_14 then
          ReddotManager.AddListenerEx(r14_14, r0_14, function(r0_15, r1_15, r2_15, r3_15)
            -- line: [280, 290] id: 15
            if r1_15 > 0 then
              if r2_15 == EReddotType.Normal then
                r0_15.Common_Toggle_TabGroup_PC:ShowTabRedDotByTabId(r12_14, false, true, false)
              elseif r2_15 == EReddotType.New then
                r0_15.Common_Toggle_TabGroup_PC:ShowTabRedDotByTabId(r12_14, true, false, false)
              end
            else
              r0_15.Common_Toggle_TabGroup_PC:ShowTabRedDotByTabId(r12_14, false, false, false)
            end
          end)
        end
        -- close: r12_14
      end
      -- close: r8_14
      local r8_14 = DataMgr.ShopTabMain[r6_14].ReddotNode
      if r8_14 then
        local function r12_14(r0_16, r1_16, r2_16, r3_16)
          -- line: [295, 305] id: 16
          if r1_16 > 0 then
            if r2_16 == EReddotType.Normal then
              r0_16.ShopTab:ShowTabRedDotByTabId(r6_14, false, true, false)
            elseif r2_16 == EReddotType.New then
              r0_16.ShopTab:ShowTabRedDotByTabId(r6_14, true, false, false)
            end
          else
            r0_16.ShopTab:ShowTabRedDotByTabId(r6_14, false, false, false)
          end
        end
        ReddotManager.AddListenerEx(r8_14, r0_14, r12_14)
      end
    end
    -- close: r5_14
  end
  -- close: r1_14
end
function r2_0._ShowSubTabReddot(r0_17, r1_17)
  -- line: [311, 327] id: 17
  for r6_17, r7_17 in ipairs(r1_17) do
    local r8_17 = r7_17.TabId
    local r10_17 = ReddotManager.GetTreeNode(DataMgr.ShopTabSub[r8_17].ReddotNode)
    if r10_17 and r10_17.Count > 0 then
      local r11_17 = r10_17.ReddotType
      if r11_17 == EReddotType.Normal then
        r0_17.Common_Toggle_TabGroup_PC:ShowTabRedDotByTabId(r8_17, false, true, false)
      elseif r11_17 == EReddotType.New then
        r0_17.Common_Toggle_TabGroup_PC:ShowTabRedDotByTabId(r8_17, true, false, false)
      end
    else
      r0_17.Common_Toggle_TabGroup_PC:ShowTabRedDotByTabId(r8_17, false, false, false)
    end
  end
  -- close: r2_17
end
function r2_0.RemoveTabReddotListen(r0_18)
  -- line: [329, 345] id: 18
  for r5_18, r6_18 in pairs(DataMgr.Shop[r0_18.ShopType].MainTabId) do
    local r7_18 = DataMgr.ShopItem2ShopTab[r6_18]
    if r7_18 then
      for r12_18, r13_18 in pairs(r7_18) do
        local r14_18 = DataMgr.ShopTabSub[r12_18].ReddotNode
        if r14_18 then
          ReddotManager.RemoveListener(r14_18, r0_18)
        end
      end
      -- close: r8_18
      local r8_18 = DataMgr.ShopTabMain[r6_18].ReddotNode
      if r8_18 then
        ReddotManager.RemoveListener(r8_18, r0_18)
      end
    end
  end
  -- close: r1_18
end
function r2_0.OnMainTabChanged(r0_19, r1_19)
  -- line: [349, 379] id: 19
  if not GWorld:GetAvatar() then
    return 
  end
  local r3_19 = r0_19.MainTabMap[r1_19.Idx]
  if not r3_19 then
    return 
  end
  r0_19:LoadMainTabInfo(r3_19)
  if r0_19.Common_Toggle_TabGroup_PC then
    r0_19.Common_Toggle_TabGroup_PC:Init({
      LeftKey = "A",
      RightKey = "D",
      Tabs = r0_19.SubTabList,
      ChildWidgetName = "TabSubTextItem",
    })
    r0_19.Common_Toggle_TabGroup_PC:BindEventOnTabSelected(r0_19, r0_19.OnSubTabChanged)
    if #r0_19.SubTabList <= 1 then
      r0_19.bShowSubTab = true
      r0_19.Tab:SetVisibility(ESlateVisibility.Collapsed)
    else
      r0_19.bShowSubTab = false
      r0_19.Tab:SetVisibility(ESlateVisibility.Visible)
    end
    r0_19.Common_Toggle_TabGroup_PC:SelectTab(1)
  end
  r0_19:_ShowSubTabReddot(r0_19.SubTabList)
end
function r2_0.OnSubTabChanged(r0_20, r1_20)
  -- line: [382, 389] id: 20
  local r2_20 = r0_20.SubTabMap[r1_20.Idx]
  if not r2_20 then
    return 
  end
  r0_20:ClearSubTabReddot()
  r0_20:RefreshSubTabData(r2_20)
end
function r2_0.ClearSubTabReddot(r0_21)
  -- line: [391, 397] id: 21
  if not r0_21.CurSubTabMap then
    return 
  end
  local r1_21 = r0_21.CurSubTabMap.ReddotNode
  if r1_21 then
    ReddotManager.ClearLeafNodeCount(r1_21, false, {
      bAll = 1,
    })
  end
end
function r2_0.RefreshSubTabData(r0_22, r1_22)
  -- line: [399, 501] id: 22
  r0_22.bShoulFocusToLastFocusedWidget = true
  r0_22.Shop_RecommendBanner:ClearAllTimer()
  r0_22.TabType = r1_22.TabType
  r0_22.IsBannerPage = false
  r0_22.IsJumpShopPage = false
  r0_22.ShowSwitchBanner = false
  r0_22:LoadSubTabInfo(r1_22)
  r0_22:SetIsDealWithVirtualAccept(false)
  r0_22.Group_Recharge:SetVisibility(ESlateVisibility.Collapsed)
  r0_22.Group_PayGift:SetVisibility(ESlateVisibility.Collapsed)
  r0_22.Group_Empty:SetVisibility(ESlateVisibility.Collapsed)
  r0_22.VB_Jump:SetVisibility(ESlateVisibility.Collapsed)
  r0_22.Group_Recommend:SetVisibility(ESlateVisibility.Collapsed)
  r0_22.Group_Item:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_22.Group_Bottom:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_22.Group_BG:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_22.CheckBox_Own:ForbidBtn(false)
  r0_22:SetAllowedToShowHideUI(false)
  r0_22.Group_RecommendAnchor:SetVisibility(ESlateVisibility.Collapsed)
  if r0_22.Common_Tab and r0_22.Common_Tab.WBP_Com_Tab_ResourceBar then
    r0_22.Common_Tab.WBP_Com_Tab_ResourceBar:SetLastFocusWidget(r0_22.List_Item)
  end
  if r1_22.TabType == "Banner" then
    r0_22:PlayAnimationReverse(r0_22.Change)
  else
    r0_22:PlayAnimation(r0_22.Change)
  end
  if r0_22.ShopType == "Shop" and r1_22.TabType ~= "Banner" then
    r0_22:StopVideoBG()
    r0_22:SetAllowedToShowHideUI(false)
    r0_22:SetShowModel(false)
    r0_22:SetHasVideo(false)
    r0_22:DestroyPreviewActor()
    if r0_22.Common_Tab and r0_22.Common_Tab.WBP_Com_Tab_ResourceBar then
      r0_22.Common_Tab.WBP_Com_Tab_ResourceBar:SetGetReplyOnBack(nil)
    end
  end
  if r1_22.TabType == "Pay" then
    r0_22.CheckBox_Own:ForbidBtn(true)
    r0_22.Group_Bottom:SetVisibility(ESlateVisibility.Collapsed)
    r0_22:InitRechargePage(r1_22)
    return 
  end
  if r1_22.TabType == "Card" then
    r0_22.Group_Bottom:SetVisibility(ESlateVisibility.Collapsed)
    r0_22:InitMonthCardPage(r1_22)
    return 
  end
  if r1_22.TabType == "Banner" then
    r0_22.CheckBox_Own:ForbidBtn(true)
    r0_22.Group_Bottom:SetVisibility(ESlateVisibility.Collapsed)
    r0_22.Group_Item:SetVisibility(ESlateVisibility.Collapsed)
    if r0_22.BannerIdMap then
      for r6_22, r7_22 in pairs(r0_22.BannerIdMap) do
        r7_22:SetVisibility(ESlateVisibility.Collapsed)
      end
      -- close: r2_22
    end
    if r0_22.Common_Tab and r0_22.Common_Tab.WBP_Com_Tab_ResourceBar then
      r0_22.Common_Tab.WBP_Com_Tab_ResourceBar:SetGetReplyOnBack(function()
        -- line: [474, 477] id: 23
        r0_22:GamePadFocusToSelectBannerItem()
        return UIUtils.Handled
      end)
    end
    r0_22:AddTimer(0.05, function()
      -- line: [479, 481] id: 24
      r0_22:GamePadFocusToSelectBannerItem()
    end)
    r0_22.IsBannerPage = true
    r0_22:SetIsDealWithVirtualAccept(true)
    r0_22:InitBannerPage()
    r0_22.bShoulFocusToLastFocusedWidget = false
    return 
  end
  if r1_22.TabType == "Complex" then
    r0_22.CheckBox_Own:ForbidBtn(true)
    r0_22.Group_Bottom:SetVisibility(ESlateVisibility.Collapsed)
    r0_22.IsJumpShopPage = true
    r0_22:InitJumpShopPage()
    return 
  end
  r0_22.Group_Bottom:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_22.VB_ItemList:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_22:UpdateShopDetail(r0_22.CurSubTabMap)
end
function r2_0.BP_GetDesiredFocusTarget(r0_25)
  -- line: [503, 507] id: 25
  if r0_25.TabType == "Banner" then
    return r0_25:GetSelectBannerItem()
  end
end
function r2_0.CommonInitPage(r0_26, r1_26, r2_26)
  -- line: [509, 531] id: 26
  r0_26.VB_ItemList:SetVisibility(ESlateVisibility.Collapsed)
  r0_26.Group_Bottom:SetVisibility(ESlateVisibility.Collapsed)
  r1_26:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  local r3_26 = r1_26:GetChildAt(0)
  if not r3_26 then
    r3_26 = UIManager(r0_26):_CreateWidgetNew(r2_26)
    r1_26:AddChildToOverlay(r3_26)
  end
  if r3_26.Image_NotabSign then
    if r0_26.bShowSubTab then
      r3_26.Image_NotabSign:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    else
      r3_26.Image_NotabSign:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  r3_26:PlayAnimation(r3_26.In)
  local r4_26 = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(r3_26)
  r4_26:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
  r4_26:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
  return r3_26
end
function r2_0.InitPayGiftPage(r0_27, r1_27)
  -- line: [534, 550] id: 27
  local r2_27 = r0_27:CommonInitPage(r0_27.Group_PayGift, "PayGiftPage")
  if r0_27.Common_Tab and r0_27.Common_Tab.WBP_Com_Tab_ResourceBar then
    r0_27.Common_Tab.WBP_Com_Tab_ResourceBar:SetLastFocusWidget(r2_27)
  end
  local r3_27 = UIManager(r0_27):GetGameInputModeSubsystem(r0_27)
  if #r1_27 == 0 then
    r3_27:SetNavigateWidgetVisibility(false)
    r0_27.Group_PayGift:SetVisibility(ESlateVisibility.Collapsed)
    r0_27.Group_Empty:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_27.Group_Bottom:SetVisibility(ESlateVisibility.Collapsed)
  else
    r0_27.Group_Bottom:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_27.Group_Empty:SetVisibility(ESlateVisibility.Collapsed)
  end
  r2_27:InitPayGiftInfo(r1_27)
end
function r2_0.InitRechargePage(r0_28, r1_28)
  -- line: [554, 582] id: 28
  local r2_28 = r0_28:CommonInitPage(r0_28.Group_Recharge, "ShopRechargePage")
  if r0_28.Common_Tab and r0_28.Common_Tab.WBP_Com_Tab_ResourceBar then
    r0_28.Common_Tab.WBP_Com_Tab_ResourceBar:SetLastFocusWidget(r2_28)
  end
  local r3_28 = {}
  for r8_28, r9_28 in pairs(DataMgr.ShopItem) do
    if r9_28.SubTabId == r1_28.SubTabId then
      table.insert(r3_28, r9_28)
    end
  end
  -- close: r4_28
  table.sort(r3_28, function(r0_29, r1_29)
    -- line: [565, 567] id: 29
    return r0_29.ItemId < r1_29.ItemId
  end)
  local r4_28 = UIManager(r0_28):GetGameInputModeSubsystem(r0_28)
  if #r3_28 == 0 then
    r4_28:SetNavigateWidgetVisibility(false)
    r0_28.Group_Recharge:SetVisibility(ESlateVisibility.Collapsed)
    r0_28.Group_Empty:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    r0_28.Group_Empty:SetVisibility(ESlateVisibility.Collapsed)
  end
  r2_28:InitRechargeInfo(r3_28)
  if not CommonUtils:IfExistSystemGuideUI(r0_28) or r0_28:HasAnyFocus() or r0_28:HasFocusedDescendants() then
    r0_28:AddTimer(0.3, function()
      -- line: [578, 580] id: 30
      r2_28:SetFocus()
    end)
  end
end
function r2_0.OnUserScrolled(r0_31)
  -- line: [584, 586] id: 31
  UIUtils.UpdateScrollBoxArrow(r0_31.ScrollBox_Recommend, r0_31.Group_ListTop, r0_31.Group_ListBottom, 100)
end
function r2_0.InitBannerPage(r0_32, r1_32)
  -- line: [591, 716] id: 32
  if r0_32.BannerIdMap then
    local r2_32 = r0_32.BannerIdMap[r0_32.SelectBannerId]
  end
  r0_32.BannerIdMap = {}
  r0_32.SwitchBannerList = ShopUtils:GetBannerInfo(true)
  local r3_32, r4_32 = ShopUtils:GetBannerInfo()
  if r1_32 then
    r0_32.SelectBannerId = r1_32
  elseif not r4_32[r0_32.SelectBannerId] then
    r0_32.SelectBannerId = nil
  end
  local r5_32 = r0_32.ScrollBox_Recommend:GetAllChildren():ToTable()
  if r5_32 and next(r5_32) then
    for r10_32, r11_32 in ipairs(r5_32) do
      if r11_32 and r11_32.ScrollboxIndex and r11_32.ScrollboxIndex >= 1 then
        r11_32:RemoveFromParent()
      end
    end
    -- close: r6_32
  end
  if not r0_32.SelectBannerId then
    if next(r0_32.SwitchBannerList) then
      r0_32.SelectBannerId = r0_32.SwitchBannerList[1].Id
    else
      assert(r3_32[1], "有效Banner数量不足一个")
      r0_32.SelectBannerId = r3_32[1].Id
    end
  end
  local r6_32 = nil
  if CommonUtils.GetDeviceTypeByPlatformName(r0_32) == "Mobile" then
    r6_32 = CommonConst.ShopBannerMobilePath
  else
    r6_32 = CommonConst.ShopBannerPCPath
  end
  local r7_32 = false
  if r0_32.SwitchBannerList and next(r0_32.SwitchBannerList) then
    r0_32.Shop_RecommendBanner:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_32.Shop_RecommendBanner:InitItemInfo()
    r0_32.Shop_RecommendBanner:BindBtnEvent(r0_32, r0_32.OnSwitchBannerChanged)
    r0_32.Shop_RecommendBanner:BindBtnClickEvent(r0_32, r0_32.OnSwitchBannerItemClick)
    local r9_32 = UIManager(r0_32):CreateWidget(r6_32 .. "WBP_Shop_Recommend_Common")
    if r9_32 then
      for r14_32, r15_32 in ipairs(r0_32.SwitchBannerList) do
        if r15_32.Id == r0_32.SelectBannerId then
          r7_32 = true
        end
        r0_32.BannerIdMap[r15_32.Id] = r9_32
      end
      -- close: r10_32
      r9_32:SetVisibility(ESlateVisibility.Collapsed)
      r0_32.Group_RecommendAnchor:AddChild(r9_32)
      local r10_32 = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(r9_32)
      r10_32:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
      r10_32:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
    end
    r0_32.Shop_RecommendBanner.ScrollboxIndex = 0
  else
    r0_32.Shop_RecommendBanner:SetVisibility(ESlateVisibility.Collapsed)
  end
  r0_32.BannerList = ShopUtils:GetBannerInfo()
  r0_32.VB_ItemList:SetVisibility(ESlateVisibility.Collapsed)
  r0_32.Group_Recommend:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_32.Group_RecommendAnchor:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_32.BannerBpMap = {}
  for r12_32, r13_32 in ipairs(r3_32) do
    local r14_32 = NewObject(UIUtils.GetCommonItemContentClass())
    r14_32.BannerId = r13_32.Id
    r14_32.ClickEvent = {
      Obj = r0_32,
      Callback = r0_32.OnBannerItemClick,
    }
    r14_32.VirtualClickCallback = r0_32.HandleVirtualClickInGamePad
    r14_32.OnKeyDownCallBack = r0_32.HandleOnKeyDownCallBack
    r14_32.SetListItemCallBack = r0_32.HandleSetListItemCallBack
    r14_32.Parent = r0_32
    r14_32.ScrollboxIndex = r12_32
    if r12_32 == 1 then
      r14_32.UpToSwitchWidget = r0_32.Shop_RecommendBanner
    end
    if r0_32.SelectBannerId == r13_32.Id then
      r14_32.bSelected = true
    else
      r14_32.bSelected = false
    end
    if r0_32.SelectBannerId == r13_32.Id and not r0_32.BannerIdMap[r13_32.Id] then
      local r16_32 = UIManager(r0_32):CreateWidget(r6_32 .. r13_32.Bp)
      if r16_32 then
        r0_32.BannerIdMap[r13_32.Id] = r16_32
        r0_32.BannerIdMap[r13_32.Id]:SetVisibility(ESlateVisibility.Collapsed)
        r0_32.Group_RecommendAnchor:AddChild(r0_32.BannerIdMap[r13_32.Id])
        local r17_32 = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(r0_32.BannerIdMap[r13_32.Id])
        r17_32:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
        r17_32:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
      end
    end
    local r15_32 = UIManager(r0_32):CreateWidget("WidgetBlueprint\'/Game/UI/WBP/Shop/Widget/Recommend/WBP_Shop_Recommend_ListItem.WBP_Shop_Recommend_ListItem\'")
    r15_32:OnListItemObjectSet(r14_32)
    r0_32.ScrollBox_Recommend:AddChild(r15_32)
  end
  -- close: r8_32
  r0_32.BannerBpMap[DataMgr.ShopBannerTab[r0_32.SelectBannerId].Bp] = r0_32.BannerIdMap[r0_32.SelectBannerId]
  if r7_32 and not CommonUtils:IfExistSystemGuideUI(r0_32) then
    r0_32.Shop_RecommendBanner:SetFocus()
  elseif not CommonUtils:IfExistSystemGuideUI(r0_32) then
  end
  r0_32:AddTimer(0.5, function()
    -- line: [713, 715] id: 33
    r0_32:OnUserScrolled()
  end)
end
function r2_0.HandleVirtualClickInGamePad(r0_34, r1_34)
  -- line: [718, 729] id: 34
  local r2_34 = UIManager(r0_34):GetGameInputModeSubsystem(r0_34)
  local r3_34 = nil	-- notice: implicit variable refs by block#[3, 4]
  if r2_34 then
    r3_34 = r2_34:GetCurrentInputType()
    if not r3_34 then
      ::label_12::
      r3_34 = nil
    end
  else
    goto label_12	-- block#2 is visited secondly
  end
  if r3_34 and r3_34 ~= ECommonInputType.Gamepad then
    return 
  end
  if not r1_34 then
    return 
  end
  local r4_34 = r0_34.BannerIdMap[r1_34]
  if r4_34 and r4_34.OnGamePadDown then
    r4_34:OnGamePadDown(UIConst.GamePadKey.FaceButtonBottom)
  end
end
function r2_0.HandleOnKeyDownCallBack(r0_35, r1_35, r2_35, r3_35)
  -- line: [731, 738] id: 35
  if not r1_35 then
    return 
  end
  local r4_35 = r0_35.BannerIdMap[r1_35]
  if r4_35 and r4_35.OnKeyDown then
    return r4_35:OnKeyDown(r2_35, r3_35)
  end
  return UIUtils.UnHandled
end
function r2_0.HandleSetListItemCallBack(r0_36, r1_36, r2_36)
  -- line: [741, 747] id: 36
  if not r1_36 then
    return 
  end
  local r3_36 = r0_36.BannerIdMap[r1_36]
  if r3_36 and r3_36.SetListItem then
    r3_36:SetListItem(r2_36)
  end
end
function r2_0.ChangeBanner(r0_37, r1_37, r2_37, r3_37)
  -- line: [750, 801] id: 37
  if r0_37.LastSelectBannerId and r0_37.LastSelectBannerId ~= r1_37 and r0_37.BannerIdMap[r0_37.LastSelectBannerId] then
    if r2_37 then
      r0_37.BannerIdMap[r0_37.LastSelectBannerId]:PlayAnimationSwitch(r3_37)
    elseif r0_37.BannerIdMap[r0_37.LastSelectBannerId].PlayAnimationOut then
      r0_37.BannerIdMap[r0_37.LastSelectBannerId]:PlayAnimationOut()
    else
      r0_37.BannerIdMap[r0_37.LastSelectBannerId]:SetVisibility(ESlateVisibility.Collapsed)
    end
    if r0_37.BannerIdMap[r0_37.LastSelectBannerId].bHasVideo then
      r0_37:StopVideoBG()
    end
    r0_37:SetAllowedToShowHideUI(false)
    r0_37:SetShowModel(false)
    r0_37:SetHasVideo(false)
  end
  if r0_37.LastWidgetContent and r0_37.LastWidgetContent.SelfWidget then
    r0_37.LastWidgetContent.SelfWidget:UnSelect()
  end
  local r4_37 = DataMgr.ShopBannerTab[r1_37]
  if r4_37 and r4_37.Bp and r4_37.Bp ~= "WBP_Shop_Recommend_Common" then
    r0_37:SetCameraToDefault()
    r0_37:StopActorSound()
    r0_37.Group_BG:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  r0_37:SetReplayGestureVisible(false)
  if r0_37.BannerIdMap[r1_37] and r0_37.BannerIdMap[r1_37].InitBannerPage then
    r0_37.BannerIdMap[r1_37]:InitBannerPage(r1_37, r0_37)
  end
  r0_37.BannerIdMap[r1_37]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  if not r2_37 and r0_37.BannerIdMap[r1_37].PlayAnimationIn then
    r0_37.BannerIdMap[r1_37]:PlayAnimationIn()
  end
  r0_37.SelectBannerId = r1_37
  r0_37.LastSelectBannerId = r1_37
  r0_37:UpdateSwitchBannerGamePadKey()
end
function r2_0.UpdateSwitchBannerGamePadKey(r0_38)
  -- line: [803, 811] id: 38
  if r0_38.ShowSwitchBanner and UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    r0_38.Shop_RecommendBanner.Key_Left:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_38.Shop_RecommendBanner.Key_Right:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    r0_38.Shop_RecommendBanner.Key_Left:SetVisibility(ESlateVisibility.Collapsed)
    r0_38.Shop_RecommendBanner.Key_Right:SetVisibility(ESlateVisibility.Collapsed)
  end
end
function r2_0.OnSwitchBannerItemClick(r0_39, r1_39, r2_39, r3_39)
  -- line: [813, 816] id: 39
  r0_39.ShowSwitchBanner = true
  r0_39:OnSwitchBannerChanged(r1_39, r2_39, r3_39)
end
function r2_0.OnSwitchBannerChanged(r0_40, r1_40, r2_40, r3_40)
  -- line: [822, 829] id: 40
  if not r0_40.ShowSwitchBanner then
    return 
  end
  r0_40.Shop_RecommendBanner:StopBannerTimer()
  r0_40:ChangeBanner(r1_40, r2_40, r3_40)
  r0_40.LastWidgetContent = nil
end
function r2_0.OnBannerItemClick(r0_41, r1_41, r2_41, r3_41)
  -- line: [831, 860] id: 41
  r0_41.Shop_RecommendBanner:StartBannerTimer()
  r0_41.Shop_RecommendBanner:UnSelect()
  r0_41.ShowSwitchBanner = false
  local r4_41 = DataMgr.ShopBannerTab[r1_41]
  local r5_41 = nil
  if CommonUtils.GetDeviceTypeByPlatformName(r0_41) == "Mobile" then
    r5_41 = CommonConst.ShopBannerMobilePath
  else
    r5_41 = CommonConst.ShopBannerPCPath
  end
  if not r0_41.BannerIdMap[r1_41] then
    r0_41.BannerIdMap[r1_41] = UIManager(r0_41):CreateWidget(r5_41 .. r4_41.Bp)
    r0_41.Group_RecommendAnchor:AddChild(r0_41.BannerIdMap[r1_41])
    local r8_41 = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(r0_41.BannerIdMap[r1_41])
    r8_41:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
    r8_41:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
  end
  if r3_41 then
    AudioManager(r0_41):PlayUISound(r0_41, "event:/ui/activity/large_btn_click", nil, nil)
  end
  r0_41.BannerBpMap[DataMgr.ShopBannerTab[r1_41].Bp] = r0_41.BannerIdMap[r1_41]
  r0_41:ChangeBanner(r1_41)
  r0_41.LastWidgetContent = r2_41
  r0_41:UpdateCommonTabInfo()
end
function r2_0.OnBannerExpire(r0_42)
  -- line: [862, 866] id: 42
  if r0_42.IsBannerPage then
    r0_42.ShopTab:SelectTab(r0_42.ShopTab.CurrentTab)
  end
end
function r2_0.InitMonthCardPage(r0_43, r1_43)
  -- line: [871, 892] id: 43
  r0_43.VB_ItemList:SetVisibility(ESlateVisibility.Collapsed)
  r0_43.Group_MonthCard:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  local r2_43 = r0_43.Group_MonthCard:GetChildrenCount()
  local r3_43 = nil
  if r2_43 > 0 then
    r3_43 = r0_43.Group_MonthCard:GetChildAt(0)
  end
  if not IsValid(r3_43) then
    r0_43.Group_MonthCard:ClearChildren()
    r3_43 = UIManager(r0_43):_CreateWidgetNew("MonthCardPage")
    r0_43.Group_MonthCard:AddChild(r3_43)
  end
  r3_43:InitBannerPage()
  local r4_43 = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(r3_43)
  r4_43:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
  r4_43:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
  if not CommonUtils:IfExistSystemGuideUI(r0_43) then
    r3_43:SetFocus()
  end
end
function r2_0.InitJumpShopPage(r0_44)
  -- line: [895, 931] id: 44
  if r0_44.Common_Tab and r0_44.Common_Tab.WBP_Com_Tab_ResourceBar then
    r0_44.Common_Tab.WBP_Com_Tab_ResourceBar:SetLastFocusWidget(r0_44.List_Jump)
  end
  r0_44.VB_ItemList:SetVisibility(ESlateVisibility.Collapsed)
  r0_44.VB_Jump:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  local r1_44 = ShopUtils:GetComplexInfo(r0_44.CurSubTabMap.SubTabId)
  r0_44.List_Jump:ScrollIndexIntoView(0)
  r0_44.List_Jump:ClearListItems()
  for r6_44, r7_44 in ipairs(r1_44) do
    if ConditionUtils.CheckCondition(GWorld:GetAvatar(), DataMgr.InterfaceJump[r7_44.InterfaceJumpId].PortalUnlockCondition) then
      local r10_44 = UIManager(r0_44):_CreateWidgetNew("JumpShopItem")
      r10_44.JumpShopData = r7_44
      r0_44.List_Jump:AddItem(r10_44)
    end
  end
  -- close: r2_44
  if r0_44.List_Jump:GetNumItems() > 0 then
    r0_44.List_Jump:RequestFillEmptyContent()
    r0_44.List_Jump:RequestPlayEntriesAnim()
    r0_44.List_Jump:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
    r0_44.List_Jump:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
    r0_44:AddTimer(0.01, function()
      -- line: [925, 929] id: 45
      if not CommonUtils:IfExistSystemGuideUI(r0_44) then
        r0_44.List_Jump:SetFocus()
      end
    end)
  end
end
function r2_0.Close(r0_46)
  -- line: [933, 946] id: 46
  if r0_46.VideoPlayer then
    r0_46:StopVideoTop()
    r0_46:StopVideoBG()
  end
  r0_46.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
  if r0_46.CloseCallBack then
    r0_46.CloseCallBack(r0_46.ClsoeCallBackObj)
  end
  r0_46:ClearSubTabReddot()
  r0_46:RemoveTabReddotListen()
  r0_46.Super.Close(r0_46)
end
function r2_0.OnAnimationFinished(r0_47, r1_47)
  -- line: [948, 961] id: 47
  if r1_47 == r0_47.Out then
    r0_47:BlockAllUIInput(true)
    r0_47:Close()
  elseif r1_47 == r0_47.In then
    r0_47:BlockAllUIInput(false)
    if r0_47.SelectShopItemId then
      r0_47:AddTimer(0.1, function()
        -- line: [955, 958] id: 48
        r0_47:ShowItemDetail()
        r0_47.SelectShopItemId = nil
      end, false, 0, "OpenShopItemDialog", true)
    end
  end
end
function r2_0.Destruct(r0_49)
  -- line: [963, 981] id: 49
  local r1_49 = UGameplayStatics.GetPlayerCharacter(r0_49, 0)
  if r1_49 then
    r1_49:SetCanInteractiveTrigger(true)
  end
  AudioManager(r0_49):StopSystemUIBGM(r0_49.ShopType)
  r0_49:HorizontalListViewResize_TearDown()
  r0_49.Group_RecommendAnchor:ClearChildren()
  r0_49:CleanTimer()
  r0_49.List_Item.OnCreateEmptyContent:Unbind()
  r0_49.List_Jump.OnCreateEmptyContent:Unbind()
  if r0_49.Btn_Shop_Visible and r0_49.Btn_Shop_Visible.Btn_Click then
    r0_49.Btn_Shop_Visible.Btn_Click.OnClicked:Remove(r0_49, r0_49.HideUIExceptVideoAutoCallBack)
  end
  if GWorld.GameInstance then
    GWorld.GameInstance:SetHighFrequencyMemoryCheckGCEnabled(false, "ShopMain")
  end
  r0_49.Super.Destruct(r0_49)
end
function r2_0.OnGamePadSelect(r0_50, r1_50, r2_50)
  -- line: [984, 990] id: 50
  if nil and not nil then
    goto label_7	-- block#1 is visited secondly
  end
end
function r2_0.OnPreviewKeyDown(r0_51, r1_51, r2_51)
  -- line: [992, 1064] id: 51
  local r3_51 = UE4.UKismetInputLibrary.GetKey(r2_51)
  local r4_51 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_51)
  if UKismetInputLibrary.InputEvent_IsRepeat(UWidgetBlueprintLibrary.GetInputEventFromKeyEvent(r2_51)) then
    return UWidgetBlueprintLibrary.UnHandled()
  end
  if r0_51:IsAllowedToShowHideUI() then
    if r4_51 == "U" or r4_51 == Const.GamepadFaceButtonLeft then
      r0_51:HideUIExceptVideoAutoCallBack()
      return UWidgetBlueprintLibrary.Handled()
    end
    if r0_51.bHideUIExceptVideo then
      r0_51:HideUIExceptVideo(false)
      return UWidgetBlueprintLibrary.Handled()
    end
  end
  local r7_51 = false
  if r0_51.ShowSwitchBanner and not r0_51.FocusOnResourceBar then
    if r4_51 == UIConst.GamePadKey.DPadRight then
      r0_51.Shop_RecommendBanner:SwitchBannerItem(nil, true)
    elseif r4_51 == UIConst.GamePadKey.DPadLeft then
      r0_51.Shop_RecommendBanner:SwitchBannerItem(nil, false)
    end
  end
  if r4_51 == "Gamepad_FaceButton_Bottom" and r0_51.IsBannerPage and r0_51.BannerMap and r0_51.BannerMap[r0_51.CurrentPageIndex] then
    r0_51.BannerMap[r0_51.CurrentPageIndex]:OnGoToInterface()
    r7_51 = true
  end
  if r4_51 == "SpaceBar" and r0_51.IsBannerPage and not r0_51.bPlayVideoTop then
    local r9_51 = r0_51.BannerBpMap[DataMgr.ShopBannerTab[r0_51.SelectBannerId].Bp]
    if r9_51 and r9_51.OnGoToInterface then
      r9_51:OnGoToInterface()
      r7_51 = true
    end
  end
  if r0_51.TabType == "Banner" and r0_51.SelectBannerId and r0_51.BannerIdMap and type(r0_51.BannerIdMap) == "table" then
    local r8_51 = r0_51.BannerIdMap[r0_51.SelectBannerId]
    if r8_51 and r8_51.HandlePreviewKeyDown and not r7_51 then
      r7_51 = r8_51:HandlePreviewKeyDown(r3_51, r4_51)
    end
  end
  if r7_51 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end
function r2_0.OnGamePadDown(r0_52, r1_52)
  -- line: [1066, 1084] id: 52
  local r2_52 = false
  if r1_52 == "Gamepad_LeftTrigger" or r1_52 == "Gamepad_RightTrigger" then
    if not r0_52.IsBannerPage and r0_52.Common_Toggle_TabGroup_PC then
      r2_52 = r0_52.Common_Toggle_TabGroup_PC:Handle_KeyEventOnGamePad(r1_52)
    end
  elseif r1_52 == "Gamepad_FaceButton_Right" then
    if not UIManager(r0_52):GetUIObj("CommonDialog") then
      r0_52:CloseSelf()
    end
    r2_52 = true
  elseif r1_52 == "Gamepad_RightShoulder" or r1_52 == "Gamepad_LeftShoulder" then
    r2_52 = r0_52.ShopTab:Handle_KeyEventOnGamePad(r1_52)
  else
    r2_52 = r0_52.Common_Tab:Handle_KeyEventOnGamePad(r1_52)
  end
  return r2_52
end
function r2_0.OnUpdateUIStyleByInputTypeChange(r0_53, r1_53, r2_53)
  -- line: [1086, 1120] id: 53
  if r1_53 == ECommonInputType.Touch then
    return 
  end
  if r1_53 == ECommonInputType.Gamepad then
    r0_53:InitGamepadView()
  else
    r0_53:InitKeyboardView()
  end
  r0_53:UpdateSwitchBannerGamePadKey()
  if r0_53.BannerIdMap then
    for r7_53, r8_53 in pairs(r0_53.BannerIdMap) do
      if r8_53 and r8_53.RefreshOpInfoByInputDevice then
        r8_53:RefreshOpInfoByInputDevice(r1_53, r2_53)
      end
    end
    -- close: r3_53
  end
  if r0_53.IsJumpShopPage and r0_53.List_Jump and r1_53 == ECommonInputType.Gamepad and (r0_53:HasAnyFocus() or r0_53:HasFocusedDescendants()) and not CommonUtils:IfExistSystemGuideUI(r0_53) then
    r0_53.List_Jump:SetFocus()
  elseif r0_53.IsBannerPage and r1_53 == ECommonInputType.Gamepad and (r0_53:HasAnyFocus() or r0_53:HasFocusedDescendants()) and not CommonUtils:IfExistSystemGuideUI(r0_53) then
    r0_53.ScrollBox_Recommend:SetFocus()
  end
  r0_53:UpdateVideoKeyInfo(r1_53, r2_53)
end
function r2_0.InitGamepadView(r0_54)
  -- line: [1122, 1132] id: 54
  r0_54.CheckBox_Own.Com_KeyImg:SetVisibility(ESlateVisibility.Visible)
  r0_54.CheckBox_Own.Com_KeyImg:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "X",
      }
    },
  })
end
function r2_0.InitKeyboardView(r0_55)
  -- line: [1134, 1136] id: 55
  r0_55.CheckBox_Own.Com_KeyImg:SetVisibility(ESlateVisibility.Collapsed)
end
function r2_0.OnSpaceBarDown(r0_56)
  -- line: [1138, 1145] id: 56
  if r0_56.IsBannerPage and r0_56.BannerIdMap and r0_56.SelectBannerId then
    local r1_56 = r0_56.BannerIdMap[r0_56.SelectBannerId]
    if r1_56.OnPCKeyDown then
      r1_56:OnPCKeyDown("SpaceBar")
    end
  end
end
function r2_0.UpdateCommonTabInfo(r0_57, r1_57)
  -- line: [1147, 1234] id: 57
  if not r0_57.SelectBannerId or not r0_57.Common_Tab or not r0_57.Common_Tab.UpdateBottomKeyInfo then
    return 
  end
  if r1_57 and next(r1_57) then
    r0_57.Common_Tab:UpdateBottomKeyInfo(r1_57)
    return 
  end
  local r2_57 = {}
  local r3_57 = DataMgr.ShopBannerTab[r0_57.SelectBannerId]
  if r3_57 and r3_57.Bp and r3_57.Bp == "WBP_Shop_Recommend_WeaponSkin" then
    r2_57 = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "X",
            Owner = r0_57,
          }
        },
        Desc = GText("UI_CTL_SkinPreview"),
        bLongPress = false,
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "SpaceBar",
            ClickCallback = r0_57.OnSpaceBarDown,
            Owner = r0_57,
          }
        },
        Desc = GText("UI_SHOP_PURCHASE"),
        bLongPress = false,
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = r0_57.CloseSelf,
            Owner = r0_57,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = r0_57.CloseSelf,
            Owner = r0_57,
          }
        },
        Desc = GText("UI_BACK"),
      }
    }
  elseif r3_57 and r3_57.Bp and r3_57.Bp == "WBP_Shop_Recommend_Gift4_1" then
    r2_57 = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "X",
            Owner = r0_57,
          }
        },
        Desc = GText("UI_CTL_SkinPreview"),
        bLongPress = false,
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "SpaceBar",
            Owner = r0_57.BannerBpMap[r3_57.Bp],
            ClickCallback = r0_57.BannerBpMap[r3_57.Bp].OnGoToInterface,
          }
        },
        Desc = GText("UI_SHOP_PURCHASE"),
        bLongPress = false,
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = r0_57.CloseSelf,
            Owner = r0_57,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = r0_57,
          }
        },
        Desc = GText("UI_BACK"),
      }
    }
  elseif r3_57 and r3_57.Bp and r3_57.Bp == "WBP_Shop_Recommend_AvatarSkin" then
    r2_57 = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Tab",
            Owner = r0_57,
            ClickCallback = r0_57.HideUIExceptVideoAutoCallBack,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "LS",
            Owner = r0_57,
          }
        },
        Desc = GText("UI_Dye_HideUI"),
        bLongPress = false,
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "SpaceBar",
            Owner = r0_57,
            ClickCallback = r0_57.OnSpaceBarDown,
          }
        },
        Desc = GText("UI_Banner_SkinGacha_Goto"),
        bLongPress = false,
      },
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "X",
            Owner = r0_57,
          }
        },
        Desc = GText("UI_CTL_SkinPreview"),
        bLongPress = false,
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Escape",
            ClickCallback = r0_57.CloseSelf,
            Owner = r0_57,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = r0_57,
          }
        },
        Desc = GText("UI_BACK"),
        bLongPress = false,
      }
    }
  elseif r3_57 and r3_57.Bp and r3_57.Bp == "WBP_Shop_Banner_MonthCard" then
    r2_57 = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "SpaceBar",
            Owner = r0_57,
            ClickCallback = r0_57.OnSpaceBarDown,
          }
        },
        Desc = GText("UI_SHOP_PURCHASE"),
        bLongPress = false,
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Escape",
            ClickCallback = r0_57.CloseSelf,
            Owner = r0_57,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = r0_57,
          }
        },
        Desc = GText("UI_BACK"),
        bLongPress = false,
      }
    }
  elseif not r3_57 or not r3_57.Bp or r3_57.Bp ~= "WBP_Shop_Recommend_PageGift" then
    r2_57 = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = r0_57,
          }
        },
        Desc = GText("UI_Tips_Ensure"),
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = r0_57.CloseSelf,
            Owner = r0_57,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = r0_57.CloseSelf,
            Owner = r0_57,
          }
        },
        Desc = GText("UI_BACK"),
      }
    }
  end
  r0_57.Common_Tab:UpdateBottomKeyInfo(r2_57)
end
function r2_0.UpdateCommonTabInfoByReward(r0_58)
  -- line: [1236, 1260] id: 58
  if not r0_58.SelectBannerId then
    return 
  end
  local r1_58 = DataMgr.ShopBannerTab[r0_58.SelectBannerId]
  if r1_58 and r1_58.Bp and r1_58.Bp == "WBP_Shop_Recommend_Gift4_1" then
    r0_58.Common_Tab:UpdateBottomKeyInfo({
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = r0_58,
          }
        },
        Desc = GText("UI_Controller_Check"),
        bLongPress = false,
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = r0_58.CloseSelf,
            Owner = r0_58,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = r0_58.CloseSelf,
            Owner = r0_58,
          }
        },
        Desc = GText("UI_BACK"),
      }
    })
  elseif r1_58 and r1_58.Bp and r1_58.Bp == "WBP_Shop_Recommend_PageGift" then
    r0_58.Common_Tab:UpdateBottomKeyInfo({
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = r0_58,
          }
        },
        Desc = GText("UI_Controller_CheckDetails"),
        bLongPress = false,
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = r0_58.CloseSelf,
            Owner = r0_58,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = r0_58.CloseSelf,
            Owner = r0_58,
          }
        },
        Desc = GText("UI_BACK"),
      }
    })
  end
end
function r2_0.SetHasVideo(r0_59, r1_59)
  -- line: [1263, 1265] id: 59
  r0_59.bHasVideo = r1_59
end
function r2_0.IsHasVideo(r0_60)
  -- line: [1268, 1270] id: 60
  return r0_60.bHasVideo
end
function r2_0.SetAllowedToShowHideUI(r0_61, r1_61)
  -- line: [1273, 1284] id: 61
  r0_61.bAllowedToShowHideUI = r1_61
  if r0_61.Btn_Shop_Visible then
    if r1_61 then
      r0_61.Btn_Shop_Visible:SetVisibility(ESlateVisibility.Visible)
    else
      r0_61.Btn_Shop_Visible:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
end
function r2_0.SetShowModel(r0_62, r1_62)
  -- line: [1286, 1288] id: 62
  r0_62.bShowModel = r1_62
end
function r2_0.IsShowModel(r0_63)
  -- line: [1290, 1292] id: 63
  return r0_63.bShowModel
end
function r2_0.SetReplayGestureVisible(r0_64, r1_64)
  -- line: [1294, 1303] id: 64
  if r0_64.Btn_Shop_Refresh then
    if r1_64 then
      r0_64.Btn_Shop_Refresh:SetVisibility(ESlateVisibility.Visible)
    else
      r0_64.Btn_Shop_Refresh:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
end
function r2_0.IsAllowedToShowHideUI(r0_65)
  -- line: [1306, 1308] id: 65
  return r0_65.bAllowedToShowHideUI
end
function r2_0.OnKeyDown(r0_66, r1_66, r2_66)
  -- line: [1310, 1333] id: 66
  local r3_66 = UE4.UKismetInputLibrary.GetKey(r2_66)
  local r4_66 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_66)
  if r0_66.bPlayVideoTop and (r4_66 == "Escape" or r4_66 == Const.GamepadFaceButtonRight) then
    return UWidgetBlueprintLibrary.Handled()
  end
  if r0_66.TabType == "Banner" and r0_66.SelectBannerId and r0_66.BannerIdMap and type(r0_66.BannerIdMap) == "table" then
    local r5_66 = r0_66.BannerIdMap[r0_66.SelectBannerId]
    if r5_66 and r5_66.HandleKeyDown and r5_66:HandleKeyDown(r3_66, r4_66) then
      return UWidgetBlueprintLibrary.Handled()
    end
  end
  return r2_0.Super.OnKeyDown(r0_66, r1_66, r2_66)
end
function r2_0.OnKeyUp(r0_67, r1_67, r2_67)
  -- line: [1335, 1346] id: 67
  local r4_67 = UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_67))
  if r0_67.Key_Video and r0_67.bPlayVideoTop and (r4_67 == "SpaceBar" or r4_67 == Const.GamepadFaceButtonDown) then
    r0_67.Key_Video.Panel_Key:GetChildAt(0):OnButtonReleased()
    return UWidgetBlueprintLibrary.Handled()
  end
  return r2_0.Super.OnKeyUp(r0_67, r1_67, r2_67)
end
function r2_0.On_Image_Click_MouseButtonDown(r0_68, r1_68, r2_68)
  -- line: [1350, 1352] id: 68
  return r0_68:OnPointerDown(r1_68, r2_68)
end
function r2_0.OnMouseWheel(r0_69, r1_69, r2_69)
  -- line: [1354, 1356] id: 69
  return r0_69:OnMouseWheelScroll(r1_69, r2_69)
end
function r2_0.OnMouseButtonUp(r0_70, r1_70, r2_70)
  -- line: [1358, 1360] id: 70
  return r0_70:OnPointerUp(r1_70, r2_70)
end
function r2_0.OnMouseMove(r0_71, r1_71, r2_71)
  -- line: [1363, 1391] id: 71
  if r0_71.bPlayVideoTop and r0_71:IsAllowedToShowHideUI() and r0_71.bHideUIExceptVideo then
    DebugPrint("WBP_ShopMain_C:OnMouseMove")
    local r3_71 = 10
    local r4_71 = r0_71.LastMousePos
    if not r4_71 then
      r4_71 = {}
      r4_71.X = nil
      r4_71.Y = nil
    end
    r0_71.LastMousePos = r4_71
    r4_71 = UWidgetLayoutLibrary.GetMousePositionOnViewport(r0_71)
    local r5_71 = r0_71.LastMousePos
    local r6_71 = false
    if r5_71.X and r5_71.Y then
      local r7_71 = r4_71.X - r5_71.X
      local r8_71 = r4_71.Y - r5_71.Y
      local r9_71 = math.sqrt(r7_71 * r7_71 + r8_71 * r8_71)
      if r3_71 <= r9_71 then
        DebugPrint(string.format("WBP_ShopMain_C:OnMouseMove, Dist: %f, ShouldHandle = true", r9_71))
        r6_71 = true
      end
    end
    r0_71.LastMousePos.X = r4_71.X
    r0_71.LastMousePos.Y = r4_71.Y
    if r6_71 then
      r0_71:HideUIExceptVideo(false)
      return UWidgetBlueprintLibrary.Handled()
    end
  else
    return r0_71:OnPointerMove(r1_71, r2_71)
  end
end
function r2_0.OnTouchStarted(r0_72, r1_72, r2_72)
  -- line: [1393, 1395] id: 72
  return r0_72:OnSinglePointerDown(r1_72, r2_72)
end
function r2_0.OnTouchEnded(r0_73, r1_73, r2_73)
  -- line: [1397, 1399] id: 73
  return r0_73:OnPointerUp(r1_73, r2_73)
end
function r2_0.OnTouchMoved(r0_74, r1_74, r2_74)
  -- line: [1401, 1403] id: 74
  return r0_74:OnPointerMove(r1_74, r2_74)
end
function r2_0.OnCameraScrollBackwardKeyDown(r0_75)
  -- line: [1405, 1407] id: 75
  r0_75:ScrollCamera(1)
end
function r2_0.OnCameraScrollForwardKeyDown(r0_76)
  -- line: [1409, 1411] id: 76
  r0_76:ScrollCamera(-1)
end
function r2_0.OnAnalogValueChanged(r0_77, r1_77, r2_77)
  -- line: [1413, 1424] id: 77
  if UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_77)) == "Gamepad_RightX" then
    if r0_77.ActorController then
      r0_77.ActorController:OnDragging({
        X = UKismetInputLibrary.GetAnalogValue(r2_77) * 10,
      })
    end
    return UIUtils.Handled
  end
  return UIUtils.Unhandled
end
function r2_0.OnMouseCaptureLost(r0_78)
  -- line: [1426, 1428] id: 78
  r0_78:OnPointerCaptureLost()
end
function r2_0.OnBackgroundClicked(r0_79)
  -- line: [1430, 1434] id: 79
  if r0_79.bSelfHidden then
    r0_79:OnHideUIKeyDown()
  end
end
function r2_0.InitVideoPlayer(r0_80, r1_80, r2_80, r3_80)
  -- line: [1439, 1450] id: 80
  r0_80._OriginVisibilityMap = r0_80._OriginVisibilityMap and {}
  r0_80.bPlayVideoTop = false
  r0_80.VideoPlayer:SetUrlByMediaSource(LoadObject(r1_80))
  r0_80.DisplayType = r2_80
  r0_80.DisplayId = r3_80
end
function r2_0.UpdateVideoKeyInfo(r0_81, r1_81, r2_81)
  -- line: [1452, 1482] id: 81
  if IsValid(r0_81.GameInputModeSubsystem) then
    if not r1_81 then
      r1_81 = r0_81.GameInputModeSubsystem:GetCurrentInputType()
    end
    if not r2_81 then
      r2_81 = r0_81.GameInputModeSubsystem:GetCurrentGamepadName()
    end
  end
  if not r0_81.Key_Video then
    return 
  end
end
function r2_0.SetSkipButton(r0_82)
  -- line: [1485, 1501] id: 82
  r0_82.VideoPlayer.Button_Skip:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if CommonUtils.GetDeviceTypeByPlatformName(r0_82) == "Mobile" and r0_82.Button_Skip then
    r0_82.Button_Skip.Button_Area.OnClicked:Add(r0_82, r0_82.StopVideoTop)
    r0_82.Button_Skip.Text_Function:SetText(GText("UI_TALK_SKIP_MOIILE"))
  elseif CommonUtils.GetDeviceTypeByPlatformName(r0_82) == "PC" and r0_82.Key_Video then
    r0_82:UpdateVideoKeyInfo()
  end
end
function r2_0.ShowSkipButton(r0_83, r1_83)
  -- line: [1504, 1518] id: 83
  local r2_83 = nil	-- notice: implicit variable refs by block#[5, 8]
  if r1_83 then
    r2_83 = UIConst.VisibilityOp.Visible
    if not r2_83 then
      ::label_7::
      r2_83 = UIConst.VisibilityOp.Collapsed
    end
  else
    goto label_7	-- block#2 is visited secondly
  end
  if CommonUtils.GetDeviceTypeByPlatformName(r0_83) == "Mobile" and r0_83.Button_Skip then
    r0_83.Button_Skip:SetVisibility(r2_83)
  elseif CommonUtils.GetDeviceTypeByPlatformName(r0_83) == "PC" and r0_83.Key_Video then
    r0_83.Key_Video:SetVisibility(r2_83)
  end
end
function r2_0.HideUIExceptVideoAutoCallBack(r0_84)
  -- line: [1521, 1525] id: 84
  if r0_84:IsAllowedToShowHideUI() then
    r0_84:HideUIExceptVideo(not r0_84.bHideUIExceptVideo, false)
  end
end
function r2_0.HideUIExceptVideo(r0_85, r1_85, r2_85)
  -- line: [1529, 1602] id: 85
  DebugPrint("WBP_ShopMain_C HideUIExceptVideo")
  if not r1_85 and r0_85.bPlayVideoTop then
    r0_85:StopVideoTop()
  end
  if not r2_85 and (r0_85:IsAnimationPlaying(r0_85.In_Info) or r0_85:IsAnimationPlaying(r0_85.Out_Info)) then
    return false
  end
  if r1_85 == r0_85.bHideUIExceptVideo then
    return true
  end
  r0_85.bHideUIExceptVideo = r1_85
  if r2_85 or r0_85.bHasHideUIManually then
    r0_85.bHasHideUIManually = r1_85
    for r7_85 = 0, r0_85.Root:GetChildrenCount() + -1, 1 do
      local r8_85 = r0_85.Root:GetChildAt(r7_85)
      if r8_85 ~= r0_85.Group_Video then
        if r1_85 then
          if r0_85._OriginVisibilityMap[r8_85] == nil then
            r0_85._OriginVisibilityMap[r8_85] = r8_85:GetVisibility()
          end
          r8_85:SetVisibility(ESlateVisibility.Hidden)
        elseif r0_85._OriginVisibilityMap[r8_85] ~= nil then
          r8_85:SetVisibility(r0_85._OriginVisibilityMap[r8_85])
        end
      end
    end
  end
  if not r2_85 then
    if r1_85 then
      r0_85:PlayAnimation(r0_85.Out_Info)
      r0_85:SetFocus()
    else
      r0_85:PlayAnimation(r0_85.In_Info)
      if not CommonUtils:IfExistSystemGuideUI(r0_85) and r0_85:HasAnyFocus() and r0_85.CurSubTabMap.TabType == "Banner" then
        r0_85:AddTimer(0.05, function()
          -- line: [1575, 1577] id: 86
          r0_85:GamePadFocusToSelectBannerItem()
        end)
      end
    end
  end
  if r1_85 then
    r0_85.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
  else
    r0_85.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
  end
  local r3_85 = UWidgetLayoutLibrary.GetMousePositionOnViewport(r0_85)
  r0_85.LastMousePos = {
    X = r3_85.X,
    Y = r3_85.Y,
  }
  if r0_85.Shop_RecommendBanner then
    if r1_85 or r0_85.ShowSwitchBanner then
      r0_85.Shop_RecommendBanner:StopBannerTimer()
    else
      r0_85.Shop_RecommendBanner:StartBannerTimer()
    end
  end
  return true
end
function r2_0.HideCursor(r0_87)
  -- line: [1604, 1613] id: 87
  if CommonUtils.GetDeviceTypeByPlatformName(GWorld.GameInstance) == "PC" then
    UGameInputModeSubsystem.GetGameInputModeSubsystem(GWorld.GameInstance):SetMouseCursorVisable(false)
  end
end
function r2_0.ShowCursor(r0_88)
  -- line: [1615, 1624] id: 88
  if CommonUtils.GetDeviceTypeByPlatformName(GWorld.GameInstance) == "PC" then
    UGameInputModeSubsystem.GetGameInputModeSubsystem(GWorld.GameInstance):SetMouseCursorVisable(true)
  end
end
function r2_0.PlayVideoTop(r0_89)
  -- line: [1627, 1660] id: 89
  DebugPrint("WBP_ShopMain_C PlayVideoTop")
  if CommonUtils:IfExistSystemGuideUI(r0_89) then
    r0_89:PlayVideoBG()
    return 
  end
  if r0_89.bPlayVideoTop then
    return 
  end
  r0_89:UpdateVideoKeyInfo()
  r0_89.bPlayVideoTop = true
  r0_89:HideUIExceptVideo(true, true)
  r0_89.Group_Video:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_89.Group_Video:SetFocus()
  r0_89.VideoPlayer.MediaPlayer.OnEndReached:Add(r0_89, r0_89.OnPlayVideoTopEnd)
  r0_89:HideCursor()
  r0_89.VideoPlayer:SetLooping(true)
  r0_89.VideoPlayer:Play()
  r0_89:StopOtherSound()
  r0_89:PlayVideoSound()
end
function r2_0.StopOtherSound(r0_90)
  -- line: [1663, 1665] id: 90
  AudioManager(r0_90):PlayUISound(r0_90, "event:/ui/common/gacha_amb", "GachaAmb", nil)
end
function r2_0.ResumeOtherSound(r0_91)
  -- line: [1668, 1670] id: 91
  AudioManager(r0_91):SetEventSoundParam(r0_91, "GachaAmb", {
    ToEnd = 1,
  })
end
function r2_0.PlayVideoSound(r0_92)
  -- line: [1672, 1707] id: 92
  if not r0_92.DisplayType or not r0_92.DisplayId then
    DebugPrint("没有配置DisplayType或DisplayId，无法找到视频需要的声音")
    return 
  end
  local r1_92 = nil
  if r0_92.DisplayType == CommonConst.DataType.Skin then
    local r2_92 = DataMgr.Skin[r0_92.DisplayId]
    if not r2_92 then
      DebugPrint("DisplayId对应的Skin配置不存在")
      return 
    end
    r1_92 = r2_92.GetSoundPath
  elseif r0_92.DisplayType == CommonConst.DataType.Resource then
    local r2_92 = DataMgr.Resource[r0_92.DisplayId]
    if not r2_92 then
      DebugPrint("DisplayId对应的Resource配置不存在")
      return 
    end
    r1_92 = r2_92.GetSoundPath
  elseif r0_92.DisplayType == CommonConst.DataType.Char then
    local r3_92 = DataMgr.Char[r0_92.DisplayId].GUIPathVariable
    if not r3_92 then
      DebugPrint("DisplayId对应的Char配置不存在GUIPathVariable")
      return 
    end
    r1_92 = "event:/ui/char/gacha_show_" .. r3_92
  end
  if not r1_92 then
    DebugPrint("DisplayType不是Skin、Resource、Char其中之一，无法找到声音")
    return 
  end
  AudioManager(r0_92):PlayUISound(r0_92, r1_92, "VideoSound", nil)
end
function r2_0.StopVideoSound(r0_93)
  -- line: [1709, 1711] id: 93
  AudioManager(r0_93):StopSound(r0_93, "VideoSound")
end
function r2_0.OnPlayVideoTopEnd(r0_94)
  -- line: [1714, 1716] id: 94
  r0_94:StopVideoTop()
end
function r2_0.StopVideoTop(r0_95)
  -- line: [1719, 1746] id: 95
  DebugPrint("WBP_ShopMain_C StopVideoTop")
  if not r0_95.bPlayVideoTop then
    return 
  end
  r0_95.bPlayVideoTop = false
  r0_95:HideUIExceptVideo(false, false)
  r0_95.VideoPlayer.MediaPlayer.OnEndReached:Remove(r0_95, r0_95.OnPlayVideoTopEnd)
  r0_95:ShowCursor()
  r0_95:ResumeOtherSound()
  r0_95:StopVideoSound()
  r0_95.bPlayVideoBG = true
  r0_95:AddTimer(0.05, function()
    -- line: [1743, 1745] id: 96
    r0_95:GamePadFocusToSelectBannerItem()
  end)
end
function r2_0.PlayVideoBG(r0_97)
  -- line: [1749, 1765] id: 97
  DebugPrint("WBP_ShopMain_C PlayVideoBG")
  if r0_97.bPlayVideoBG then
    return 
  end
  r0_97.bPlayVideoBG = true
  r0_97.Group_Video:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_97.Group_BG:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_97.VideoPlayer:SetLooping(true)
  r0_97.VideoPlayer:Play()
end
function r2_0.StopVideoBG(r0_98)
  -- line: [1767, 1781] id: 98
  DebugPrint("WBP_ShopMain_C StopVideoBG")
  if not r0_98.bPlayVideoBG then
    return 
  end
  r0_98.bPlayVideoBG = false
  r0_98.Group_Video:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_98.Group_BG:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_98.VideoPlayer:Stop()
end
function r2_0.GamePadFocusToSelectBannerItem(r0_99)
  -- line: [1783, 1789] id: 99
  local r1_99 = r0_99:GetSelectBannerItem()
  if not r1_99 or CommonUtils:IfExistSystemGuideUI(r0_99) then
    return 
  end
  r1_99:SetFocus()
end
function r2_0.GetSelectBannerItem(r0_100)
  -- line: [1791, 1804] id: 100
  if not r0_100.SelectBannerId or r0_100.ShowSwitchBanner then
    return r0_100.Shop_RecommendBanner
  end
  local r1_100 = r0_100.ScrollBox_Recommend:GetAllChildren():ToTable()
  if r1_100 and next(r1_100) then
    for r6_100, r7_100 in pairs(r1_100) do
      if r7_100.BannerId and r7_100.BannerId == r0_100.SelectBannerId then
        return r7_100
      end
    end
    -- close: r2_100
  end
  return nil
end
function r2_0.OnRepeatKeyDown(r0_101, r1_101, r2_101)
  -- line: [1806, 1822] id: 101
  local r3_101 = UE4.UKismetInputLibrary.GetKey(r2_101)
  local r4_101 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_101)
  local r5_101 = false
  if r0_101.TabType == "Banner" and r0_101.SelectBannerId and r0_101.BannerIdMap and type(r0_101.BannerIdMap) == "table" then
    local r6_101 = r0_101.BannerIdMap[r0_101.SelectBannerId]
    if r6_101 and r6_101.HandleRepeatKeyDown and not r5_101 then
      r5_101 = r6_101:HandleRepeatKeyDown(r3_101, r4_101)
    end
  end
  if r5_101 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end
function r2_0.OnResourceBarAddedToFocusPath(r0_102)
  -- line: [1824, 1826] id: 102
  r0_102.FocusOnResourceBar = true
end
function r2_0.OnResourceBarRemovedFromFocusPath(r0_103)
  -- line: [1828, 1836] id: 103
  r0_103.FocusOnResourceBar = false
  if r0_103.SelectBannerId and r0_103.BannerIdMap and type(r0_103.BannerIdMap) == "table" then
    local r1_103 = r0_103.BannerIdMap[r0_103.SelectBannerId]
    if r1_103 and r1_103.OnResourceBarRemovedFromFocusPath then
      r1_103:OnResourceBarRemovedFromFocusPath()
    end
  end
end
AssembleComponents(r2_0)
return r2_0
