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
  -- line: [118, 130] id: 4
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
end
function r2_0.ReceiveExitState(r0_5, r1_5)
  -- line: [132, 138] id: 5
  r2_0.Super.ReceiveExitState(r0_5, r1_5)
  if r1_5 == 0 and r0_5:IsHasVideo() and r0_5.bPlayVideoBG then
    r0_5:StopVideoBG()
  end
end
function r2_0.Construct(r0_6)
  -- line: [140, 185] id: 6
  r2_0.Super.Construct(r0_6)
  r0_6.List_Item.OnCreateEmptyContent:Bind(r0_6, function(r0_7)
    -- line: [142, 146] id: 7
    local r1_7 = NewObject(r0_7.ShopItemContentClass)
    r1_7.ShopId = nil
    return r1_7
  end)
  r0_6.List_Jump.OnCreateEmptyContent:Bind(r0_6, function(r0_8)
    -- line: [148, 152] id: 8
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
function r2_0.RefreshShop(r0_9)
  -- line: [187, 195] id: 9
  if not r0_9.bNeedRefreshShop then
    r0_9.bNeedRefreshShop = true
    r0_9:AddTimer(1, function()
      -- line: [190, 193] id: 10
      r0_9:RefreshSubTabData(r0_9.CurSubTabMap)
      r0_9.bNeedRefreshShop = false
    end, false, 0, "RefreshShop", true)
  end
end
function r2_0.InitShopTabInfo(r0_11, r1_11, r2_11)
  -- line: [204, 255] id: 11
  if not GWorld:GetAvatar() then
    return 
  end
  local r4_11 = DataMgr.Shop[r0_11.ShopType]
  assert(r4_11, "获取商店类型信息失败:" .. r0_11.ShopType)
  r0_11:LoadShopTabInfo(r4_11)
  r0_11.Common_Tab:Init({
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
            Owner = r0_11,
          }
        },
        Desc = GText("UI_Tips_Ensure"),
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = r0_11.CloseSelf,
            Owner = r0_11,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = r0_11.CloseSelf,
            Owner = r0_11,
          }
        },
        Desc = GText("UI_BACK"),
      }
    },
    StyleName = "Text",
    TitleName = GText(r4_11.ShopName),
    OverridenTopResouces = r0_11.OverridenTopResouces,
    OnResourceBarAddedToFocusPath = r0_11.OnResourceBarAddedToFocusPath,
    OnResourceBarRemovedFromFocusPath = r0_11.OnResourceBarRemovedFromFocusPath,
    OwnerPanel = r0_11,
    BackCallback = r0_11.CloseSelf,
  })
  r0_11.ShopTab:Init({
    LeftKey = "Q",
    RightKey = "E",
    Tabs = r0_11.MainTabList,
    ChildWidgetBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Tab/PC/WBP_Com_TabItem01_P.WBP_Com_TabItem01_P\'",
  })
  if not r1_11 then
    r0_11.ShopTab:SelectTab(1)
  else
    r0_11.ShopTab:SelectTab(r0_11.MainTabs[r1_11])
    if r0_11.Common_Toggle_TabGroup_PC then
      r0_11.Common_Toggle_TabGroup_PC:SelectTab(r0_11.SubTabMapIdx[r2_11])
    end
  end
  if #r0_11.MainTabList <= 1 then
    r0_11.Group_Tab:SetVisibility(ESlateVisibility.Collapsed)
  else
    r0_11.Group_Tab:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  r0_11:AddLSFocusTarget(nil, {
    r0_11.Common_SortList_PC
  })
  r0_11:AddLSFocusTarget(r0_11.CheckBox_Own.Com_KeyImg, r0_11.CheckBox_Own, "X", true)
  r0_11:AddTabReddotListen()
end
function r2_0.AddTabReddotListen(r0_12)
  -- line: [257, 293] id: 12
  for r5_12, r6_12 in pairs(DataMgr.Shop[r0_12.ShopType].MainTabId) do
    local r7_12 = DataMgr.ShopItem2ShopTab[r6_12]
    if r7_12 then
      for r12_12, r13_12 in pairs(r7_12) do
        local r14_12 = DataMgr.ShopTabSub[r12_12].ReddotNode
        if r14_12 then
          ReddotManager.AddListenerEx(r14_12, r0_12, function(r0_13, r1_13, r2_13, r3_13)
            -- line: [264, 274] id: 13
            if r1_13 > 0 then
              if r2_13 == EReddotType.Normal then
                r0_13.Common_Toggle_TabGroup_PC:ShowTabRedDotByTabId(r12_12, false, true, false)
              elseif r2_13 == EReddotType.New then
                r0_13.Common_Toggle_TabGroup_PC:ShowTabRedDotByTabId(r12_12, true, false, false)
              end
            else
              r0_13.Common_Toggle_TabGroup_PC:ShowTabRedDotByTabId(r12_12, false, false, false)
            end
          end)
        end
        -- close: r12_12
      end
      -- close: r8_12
      local r8_12 = DataMgr.ShopTabMain[r6_12].ReddotNode
      if r8_12 then
        local function r12_12(r0_14, r1_14, r2_14, r3_14)
          -- line: [279, 289] id: 14
          if r1_14 > 0 then
            if r2_14 == EReddotType.Normal then
              r0_14.ShopTab:ShowTabRedDotByTabId(r6_12, false, true, false)
            elseif r2_14 == EReddotType.New then
              r0_14.ShopTab:ShowTabRedDotByTabId(r6_12, true, false, false)
            end
          else
            r0_14.ShopTab:ShowTabRedDotByTabId(r6_12, false, false, false)
          end
        end
        ReddotManager.AddListenerEx(r8_12, r0_12, r12_12)
      end
    end
    -- close: r5_12
  end
  -- close: r1_12
end
function r2_0._ShowSubTabReddot(r0_15, r1_15)
  -- line: [295, 311] id: 15
  for r6_15, r7_15 in ipairs(r1_15) do
    local r8_15 = r7_15.TabId
    local r10_15 = ReddotManager.GetTreeNode(DataMgr.ShopTabSub[r8_15].ReddotNode)
    if r10_15 and r10_15.Count > 0 then
      local r11_15 = r10_15.ReddotType
      if r11_15 == EReddotType.Normal then
        r0_15.Common_Toggle_TabGroup_PC:ShowTabRedDotByTabId(r8_15, false, true, false)
      elseif r11_15 == EReddotType.New then
        r0_15.Common_Toggle_TabGroup_PC:ShowTabRedDotByTabId(r8_15, true, false, false)
      end
    else
      r0_15.Common_Toggle_TabGroup_PC:ShowTabRedDotByTabId(r8_15, false, false, false)
    end
  end
  -- close: r2_15
end
function r2_0.RemoveTabReddotListen(r0_16)
  -- line: [313, 329] id: 16
  for r5_16, r6_16 in pairs(DataMgr.Shop[r0_16.ShopType].MainTabId) do
    local r7_16 = DataMgr.ShopItem2ShopTab[r6_16]
    if r7_16 then
      for r12_16, r13_16 in pairs(r7_16) do
        local r14_16 = DataMgr.ShopTabSub[r12_16].ReddotNode
        if r14_16 then
          ReddotManager.RemoveListener(r14_16, r0_16)
        end
      end
      -- close: r8_16
      local r8_16 = DataMgr.ShopTabMain[r6_16].ReddotNode
      if r8_16 then
        ReddotManager.RemoveListener(r8_16, r0_16)
      end
    end
  end
  -- close: r1_16
end
function r2_0.OnMainTabChanged(r0_17, r1_17)
  -- line: [333, 363] id: 17
  if not GWorld:GetAvatar() then
    return 
  end
  local r3_17 = r0_17.MainTabMap[r1_17.Idx]
  if not r3_17 then
    return 
  end
  r0_17:LoadMainTabInfo(r3_17)
  if r0_17.Common_Toggle_TabGroup_PC then
    r0_17.Common_Toggle_TabGroup_PC:Init({
      LeftKey = "A",
      RightKey = "D",
      Tabs = r0_17.SubTabList,
      ChildWidgetName = "TabSubTextItem",
    })
    r0_17.Common_Toggle_TabGroup_PC:BindEventOnTabSelected(r0_17, r0_17.OnSubTabChanged)
    if #r0_17.SubTabList <= 1 then
      r0_17.bShowSubTab = true
      r0_17.Tab:SetVisibility(ESlateVisibility.Collapsed)
    else
      r0_17.bShowSubTab = false
      r0_17.Tab:SetVisibility(ESlateVisibility.Visible)
    end
    r0_17.Common_Toggle_TabGroup_PC:SelectTab(1)
  end
  r0_17:_ShowSubTabReddot(r0_17.SubTabList)
end
function r2_0.OnSubTabChanged(r0_18, r1_18)
  -- line: [366, 373] id: 18
  local r2_18 = r0_18.SubTabMap[r1_18.Idx]
  if not r2_18 then
    return 
  end
  r0_18:ClearSubTabReddot()
  r0_18:RefreshSubTabData(r2_18)
end
function r2_0.ClearSubTabReddot(r0_19)
  -- line: [375, 381] id: 19
  if not r0_19.CurSubTabMap then
    return 
  end
  local r1_19 = r0_19.CurSubTabMap.ReddotNode
  if r1_19 then
    ReddotManager.ClearLeafNodeCount(r1_19, false, {
      bAll = 1,
    })
  end
end
function r2_0.RefreshSubTabData(r0_20, r1_20)
  -- line: [383, 485] id: 20
  r0_20.bShoulFocusToLastFocusedWidget = true
  r0_20.Shop_RecommendBanner:ClearAllTimer()
  r0_20.TabType = r1_20.TabType
  r0_20.IsBannerPage = false
  r0_20.IsJumpShopPage = false
  r0_20.ShowSwitchBanner = false
  r0_20:LoadSubTabInfo(r1_20)
  r0_20:SetIsDealWithVirtualAccept(false)
  r0_20.Group_Recharge:SetVisibility(ESlateVisibility.Collapsed)
  r0_20.Group_PayGift:SetVisibility(ESlateVisibility.Collapsed)
  r0_20.Group_Empty:SetVisibility(ESlateVisibility.Collapsed)
  r0_20.VB_Jump:SetVisibility(ESlateVisibility.Collapsed)
  r0_20.Group_Recommend:SetVisibility(ESlateVisibility.Collapsed)
  r0_20.Group_Item:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_20.Group_Bottom:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_20.Group_BG:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_20.CheckBox_Own:ForbidBtn(false)
  r0_20:SetAllowedToShowHideUI(false)
  r0_20.Group_RecommendAnchor:SetVisibility(ESlateVisibility.Collapsed)
  if r0_20.Common_Tab and r0_20.Common_Tab.WBP_Com_Tab_ResourceBar then
    r0_20.Common_Tab.WBP_Com_Tab_ResourceBar:SetLastFocusWidget(r0_20.List_Item)
  end
  if r1_20.TabType == "Banner" then
    r0_20:PlayAnimationReverse(r0_20.Change)
  else
    r0_20:PlayAnimation(r0_20.Change)
  end
  if r0_20.ShopType == "Shop" and r1_20.TabType ~= "Banner" then
    r0_20:StopVideoBG()
    r0_20:SetAllowedToShowHideUI(false)
    r0_20:SetShowModel(false)
    r0_20:SetHasVideo(false)
    r0_20:DestroyPreviewActor()
    if r0_20.Common_Tab and r0_20.Common_Tab.WBP_Com_Tab_ResourceBar then
      r0_20.Common_Tab.WBP_Com_Tab_ResourceBar:SetGetReplyOnBack(nil)
    end
  end
  if r1_20.TabType == "Pay" then
    r0_20.CheckBox_Own:ForbidBtn(true)
    r0_20.Group_Bottom:SetVisibility(ESlateVisibility.Collapsed)
    r0_20:InitRechargePage(r1_20)
    return 
  end
  if r1_20.TabType == "Card" then
    r0_20.Group_Bottom:SetVisibility(ESlateVisibility.Collapsed)
    r0_20:InitMonthCardPage(r1_20)
    return 
  end
  if r1_20.TabType == "Banner" then
    r0_20.CheckBox_Own:ForbidBtn(true)
    r0_20.Group_Bottom:SetVisibility(ESlateVisibility.Collapsed)
    r0_20.Group_Item:SetVisibility(ESlateVisibility.Collapsed)
    if r0_20.BannerIdMap then
      for r6_20, r7_20 in pairs(r0_20.BannerIdMap) do
        r7_20:SetVisibility(ESlateVisibility.Collapsed)
      end
      -- close: r2_20
    end
    if r0_20.Common_Tab and r0_20.Common_Tab.WBP_Com_Tab_ResourceBar then
      r0_20.Common_Tab.WBP_Com_Tab_ResourceBar:SetGetReplyOnBack(function()
        -- line: [458, 461] id: 21
        r0_20:GamePadFocusToSelectBannerItem()
        return UIUtils.Handled
      end)
    end
    r0_20:AddTimer(0.05, function()
      -- line: [463, 465] id: 22
      r0_20:GamePadFocusToSelectBannerItem()
    end)
    r0_20.IsBannerPage = true
    r0_20:SetIsDealWithVirtualAccept(true)
    r0_20:InitBannerPage()
    r0_20.bShoulFocusToLastFocusedWidget = false
    return 
  end
  if r1_20.TabType == "Complex" then
    r0_20.CheckBox_Own:ForbidBtn(true)
    r0_20.Group_Bottom:SetVisibility(ESlateVisibility.Collapsed)
    r0_20.IsJumpShopPage = true
    r0_20:InitJumpShopPage()
    return 
  end
  r0_20.Group_Bottom:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_20.VB_ItemList:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_20:UpdateShopDetail(r0_20.CurSubTabMap)
end
function r2_0.BP_GetDesiredFocusTarget(r0_23)
  -- line: [487, 491] id: 23
  if r0_23.TabType == "Banner" then
    return r0_23:GetSelectBannerItem()
  end
end
function r2_0.CommonInitPage(r0_24, r1_24, r2_24)
  -- line: [493, 515] id: 24
  r0_24.VB_ItemList:SetVisibility(ESlateVisibility.Collapsed)
  r0_24.Group_Bottom:SetVisibility(ESlateVisibility.Collapsed)
  r1_24:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  local r3_24 = r1_24:GetChildAt(0)
  if not r3_24 then
    r3_24 = UIManager(r0_24):_CreateWidgetNew(r2_24)
    r1_24:AddChildToOverlay(r3_24)
  end
  if r3_24.Image_NotabSign then
    if r0_24.bShowSubTab then
      r3_24.Image_NotabSign:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    else
      r3_24.Image_NotabSign:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  r3_24:PlayAnimation(r3_24.In)
  local r4_24 = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(r3_24)
  r4_24:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
  r4_24:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
  return r3_24
end
function r2_0.InitPayGiftPage(r0_25, r1_25)
  -- line: [518, 534] id: 25
  local r2_25 = r0_25:CommonInitPage(r0_25.Group_PayGift, "PayGiftPage")
  if r0_25.Common_Tab and r0_25.Common_Tab.WBP_Com_Tab_ResourceBar then
    r0_25.Common_Tab.WBP_Com_Tab_ResourceBar:SetLastFocusWidget(r2_25)
  end
  local r3_25 = UIManager(r0_25):GetGameInputModeSubsystem(r0_25)
  if #r1_25 == 0 then
    r3_25:SetNavigateWidgetVisibility(false)
    r0_25.Group_PayGift:SetVisibility(ESlateVisibility.Collapsed)
    r0_25.Group_Empty:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_25.Group_Bottom:SetVisibility(ESlateVisibility.Collapsed)
  else
    r0_25.Group_Bottom:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_25.Group_Empty:SetVisibility(ESlateVisibility.Collapsed)
  end
  r2_25:InitPayGiftInfo(r1_25)
end
function r2_0.InitRechargePage(r0_26, r1_26)
  -- line: [538, 566] id: 26
  local r2_26 = r0_26:CommonInitPage(r0_26.Group_Recharge, "ShopRechargePage")
  if r0_26.Common_Tab and r0_26.Common_Tab.WBP_Com_Tab_ResourceBar then
    r0_26.Common_Tab.WBP_Com_Tab_ResourceBar:SetLastFocusWidget(r2_26)
  end
  local r3_26 = {}
  for r8_26, r9_26 in pairs(DataMgr.ShopItem) do
    if r9_26.SubTabId == r1_26.SubTabId then
      table.insert(r3_26, r9_26)
    end
  end
  -- close: r4_26
  table.sort(r3_26, function(r0_27, r1_27)
    -- line: [549, 551] id: 27
    return r0_27.ItemId < r1_27.ItemId
  end)
  local r4_26 = UIManager(r0_26):GetGameInputModeSubsystem(r0_26)
  if #r3_26 == 0 then
    r4_26:SetNavigateWidgetVisibility(false)
    r0_26.Group_Recharge:SetVisibility(ESlateVisibility.Collapsed)
    r0_26.Group_Empty:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    r0_26.Group_Empty:SetVisibility(ESlateVisibility.Collapsed)
  end
  r2_26:InitRechargeInfo(r3_26)
  if not CommonUtils:IfExistSystemGuideUI(r0_26) or r0_26:HasAnyFocus() or r0_26:HasFocusedDescendants() then
    r0_26:AddTimer(0.3, function()
      -- line: [562, 564] id: 28
      r2_26:SetFocus()
    end)
  end
end
function r2_0.OnUserScrolled(r0_29)
  -- line: [568, 570] id: 29
  UIUtils.UpdateScrollBoxArrow(r0_29.ScrollBox_Recommend, r0_29.Group_ListTop, r0_29.Group_ListBottom, 100)
end
function r2_0.InitBannerPage(r0_30, r1_30)
  -- line: [575, 700] id: 30
  if r0_30.BannerIdMap then
    local r2_30 = r0_30.BannerIdMap[r0_30.SelectBannerId]
  end
  r0_30.BannerIdMap = {}
  r0_30.SwitchBannerList = ShopUtils:GetBannerInfo(true)
  local r3_30, r4_30 = ShopUtils:GetBannerInfo()
  if r1_30 then
    r0_30.SelectBannerId = r1_30
  elseif not r4_30[r0_30.SelectBannerId] then
    r0_30.SelectBannerId = nil
  end
  local r5_30 = r0_30.ScrollBox_Recommend:GetAllChildren():ToTable()
  if r5_30 and next(r5_30) then
    for r10_30, r11_30 in ipairs(r5_30) do
      if r11_30 and r11_30.ScrollboxIndex and r11_30.ScrollboxIndex >= 1 then
        r11_30:RemoveFromParent()
      end
    end
    -- close: r6_30
  end
  if not r0_30.SelectBannerId then
    if next(r0_30.SwitchBannerList) then
      r0_30.SelectBannerId = r0_30.SwitchBannerList[1].Id
    else
      assert(r3_30[1], "有效Banner数量不足一个")
      r0_30.SelectBannerId = r3_30[1].Id
    end
  end
  local r6_30 = nil
  if CommonUtils.GetDeviceTypeByPlatformName(r0_30) == "Mobile" then
    r6_30 = CommonConst.ShopBannerMobilePath
  else
    r6_30 = CommonConst.ShopBannerPCPath
  end
  local r7_30 = false
  if r0_30.SwitchBannerList and next(r0_30.SwitchBannerList) then
    r0_30.Shop_RecommendBanner:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_30.Shop_RecommendBanner:InitItemInfo()
    r0_30.Shop_RecommendBanner:BindBtnEvent(r0_30, r0_30.OnSwitchBannerChanged)
    r0_30.Shop_RecommendBanner:BindBtnClickEvent(r0_30, r0_30.OnSwitchBannerItemClick)
    local r9_30 = UIManager(r0_30):CreateWidget(r6_30 .. "WBP_Shop_Recommend_Common")
    if r9_30 then
      for r14_30, r15_30 in ipairs(r0_30.SwitchBannerList) do
        if r15_30.Id == r0_30.SelectBannerId then
          r7_30 = true
        end
        r0_30.BannerIdMap[r15_30.Id] = r9_30
      end
      -- close: r10_30
      r9_30:SetVisibility(ESlateVisibility.Collapsed)
      r0_30.Group_RecommendAnchor:AddChild(r9_30)
      local r10_30 = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(r9_30)
      r10_30:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
      r10_30:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
    end
    r0_30.Shop_RecommendBanner.ScrollboxIndex = 0
  else
    r0_30.Shop_RecommendBanner:SetVisibility(ESlateVisibility.Collapsed)
  end
  r0_30.BannerList = ShopUtils:GetBannerInfo()
  r0_30.VB_ItemList:SetVisibility(ESlateVisibility.Collapsed)
  r0_30.Group_Recommend:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_30.Group_RecommendAnchor:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_30.BannerBpMap = {}
  for r12_30, r13_30 in ipairs(r3_30) do
    local r14_30 = NewObject(UIUtils.GetCommonItemContentClass())
    r14_30.BannerId = r13_30.Id
    r14_30.ClickEvent = {
      Obj = r0_30,
      Callback = r0_30.OnBannerItemClick,
    }
    r14_30.VirtualClickCallback = r0_30.HandleVirtualClickInGamePad
    r14_30.OnKeyDownCallBack = r0_30.HandleOnKeyDownCallBack
    r14_30.SetListItemCallBack = r0_30.HandleSetListItemCallBack
    r14_30.Parent = r0_30
    r14_30.ScrollboxIndex = r12_30
    if r12_30 == 1 then
      r14_30.UpToSwitchWidget = r0_30.Shop_RecommendBanner
    end
    if r0_30.SelectBannerId == r13_30.Id then
      r14_30.bSelected = true
    else
      r14_30.bSelected = false
    end
    if r0_30.SelectBannerId == r13_30.Id and not r0_30.BannerIdMap[r13_30.Id] then
      local r16_30 = UIManager(r0_30):CreateWidget(r6_30 .. r13_30.Bp)
      if r16_30 then
        r0_30.BannerIdMap[r13_30.Id] = r16_30
        r0_30.BannerIdMap[r13_30.Id]:SetVisibility(ESlateVisibility.Collapsed)
        r0_30.Group_RecommendAnchor:AddChild(r0_30.BannerIdMap[r13_30.Id])
        local r17_30 = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(r0_30.BannerIdMap[r13_30.Id])
        r17_30:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
        r17_30:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
      end
    end
    local r15_30 = UIManager(r0_30):CreateWidget("WidgetBlueprint\'/Game/UI/WBP/Shop/Widget/Recommend/WBP_Shop_Recommend_ListItem.WBP_Shop_Recommend_ListItem\'")
    r15_30:OnListItemObjectSet(r14_30)
    r0_30.ScrollBox_Recommend:AddChild(r15_30)
  end
  -- close: r8_30
  r0_30.BannerBpMap[DataMgr.ShopBannerTab[r0_30.SelectBannerId].Bp] = r0_30.BannerIdMap[r0_30.SelectBannerId]
  if r7_30 and not CommonUtils:IfExistSystemGuideUI(r0_30) then
    r0_30.Shop_RecommendBanner:SetFocus()
  elseif not CommonUtils:IfExistSystemGuideUI(r0_30) then
  end
  r0_30:AddTimer(0.5, function()
    -- line: [697, 699] id: 31
    r0_30:OnUserScrolled()
  end)
end
function r2_0.HandleVirtualClickInGamePad(r0_32, r1_32)
  -- line: [702, 713] id: 32
  local r2_32 = UIManager(r0_32):GetGameInputModeSubsystem(r0_32)
  local r3_32 = nil	-- notice: implicit variable refs by block#[3, 4]
  if r2_32 then
    r3_32 = r2_32:GetCurrentInputType()
    if not r3_32 then
      ::label_12::
      r3_32 = nil
    end
  else
    goto label_12	-- block#2 is visited secondly
  end
  if r3_32 and r3_32 ~= ECommonInputType.Gamepad then
    return 
  end
  if not r1_32 then
    return 
  end
  local r4_32 = r0_32.BannerIdMap[r1_32]
  if r4_32 and r4_32.OnGamePadDown then
    r4_32:OnGamePadDown(UIConst.GamePadKey.FaceButtonBottom)
  end
end
function r2_0.HandleOnKeyDownCallBack(r0_33, r1_33, r2_33, r3_33)
  -- line: [715, 722] id: 33
  if not r1_33 then
    return 
  end
  local r4_33 = r0_33.BannerIdMap[r1_33]
  if r4_33 and r4_33.OnKeyDown then
    return r4_33:OnKeyDown(r2_33, r3_33)
  end
  return UIUtils.UnHandled
end
function r2_0.HandleSetListItemCallBack(r0_34, r1_34, r2_34)
  -- line: [725, 731] id: 34
  if not r1_34 then
    return 
  end
  local r3_34 = r0_34.BannerIdMap[r1_34]
  if r3_34 and r3_34.SetListItem then
    r3_34:SetListItem(r2_34)
  end
end
function r2_0.ChangeBanner(r0_35, r1_35, r2_35, r3_35)
  -- line: [734, 785] id: 35
  if r0_35.LastSelectBannerId and r0_35.LastSelectBannerId ~= r1_35 and r0_35.BannerIdMap[r0_35.LastSelectBannerId] then
    if r2_35 then
      r0_35.BannerIdMap[r0_35.LastSelectBannerId]:PlayAnimationSwitch(r3_35)
    elseif r0_35.BannerIdMap[r0_35.LastSelectBannerId].PlayAnimationOut then
      r0_35.BannerIdMap[r0_35.LastSelectBannerId]:PlayAnimationOut()
    else
      r0_35.BannerIdMap[r0_35.LastSelectBannerId]:SetVisibility(ESlateVisibility.Collapsed)
    end
    if r0_35.BannerIdMap[r0_35.LastSelectBannerId].bHasVideo then
      r0_35:StopVideoBG()
    end
    r0_35:SetAllowedToShowHideUI(false)
    r0_35:SetShowModel(false)
    r0_35:SetHasVideo(false)
  end
  if r0_35.LastWidgetContent and r0_35.LastWidgetContent.SelfWidget then
    r0_35.LastWidgetContent.SelfWidget:UnSelect()
  end
  local r4_35 = DataMgr.ShopBannerTab[r1_35]
  if r4_35 and r4_35.Bp and r4_35.Bp ~= "WBP_Shop_Recommend_Common" then
    r0_35:SetCameraToDefault()
    r0_35:StopActorSound()
    r0_35.Group_BG:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  r0_35:SetReplayGestureVisible(false)
  if r0_35.BannerIdMap[r1_35] and r0_35.BannerIdMap[r1_35].InitBannerPage then
    r0_35.BannerIdMap[r1_35]:InitBannerPage(r1_35, r0_35)
  end
  r0_35.BannerIdMap[r1_35]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  if not r2_35 and r0_35.BannerIdMap[r1_35].PlayAnimationIn then
    r0_35.BannerIdMap[r1_35]:PlayAnimationIn()
  end
  r0_35.SelectBannerId = r1_35
  r0_35.LastSelectBannerId = r1_35
  r0_35:UpdateSwitchBannerGamePadKey()
end
function r2_0.UpdateSwitchBannerGamePadKey(r0_36)
  -- line: [787, 795] id: 36
  if r0_36.ShowSwitchBanner and UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    r0_36.Shop_RecommendBanner.Key_Left:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_36.Shop_RecommendBanner.Key_Right:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    r0_36.Shop_RecommendBanner.Key_Left:SetVisibility(ESlateVisibility.Collapsed)
    r0_36.Shop_RecommendBanner.Key_Right:SetVisibility(ESlateVisibility.Collapsed)
  end
end
function r2_0.OnSwitchBannerItemClick(r0_37, r1_37, r2_37, r3_37)
  -- line: [797, 800] id: 37
  r0_37.ShowSwitchBanner = true
  r0_37:OnSwitchBannerChanged(r1_37, r2_37, r3_37)
end
function r2_0.OnSwitchBannerChanged(r0_38, r1_38, r2_38, r3_38)
  -- line: [806, 813] id: 38
  if not r0_38.ShowSwitchBanner then
    return 
  end
  r0_38.Shop_RecommendBanner:StopBannerTimer()
  r0_38:ChangeBanner(r1_38, r2_38, r3_38)
  r0_38.LastWidgetContent = nil
end
function r2_0.OnBannerItemClick(r0_39, r1_39, r2_39, r3_39)
  -- line: [815, 844] id: 39
  r0_39.Shop_RecommendBanner:StartBannerTimer()
  r0_39.Shop_RecommendBanner:UnSelect()
  r0_39.ShowSwitchBanner = false
  local r4_39 = DataMgr.ShopBannerTab[r1_39]
  local r5_39 = nil
  if CommonUtils.GetDeviceTypeByPlatformName(r0_39) == "Mobile" then
    r5_39 = CommonConst.ShopBannerMobilePath
  else
    r5_39 = CommonConst.ShopBannerPCPath
  end
  if not r0_39.BannerIdMap[r1_39] then
    r0_39.BannerIdMap[r1_39] = UIManager(r0_39):CreateWidget(r5_39 .. r4_39.Bp)
    r0_39.Group_RecommendAnchor:AddChild(r0_39.BannerIdMap[r1_39])
    local r8_39 = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(r0_39.BannerIdMap[r1_39])
    r8_39:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
    r8_39:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
  end
  if r3_39 then
    AudioManager(r0_39):PlayUISound(r0_39, "event:/ui/activity/large_btn_click", nil, nil)
  end
  r0_39.BannerBpMap[DataMgr.ShopBannerTab[r1_39].Bp] = r0_39.BannerIdMap[r1_39]
  r0_39:ChangeBanner(r1_39)
  r0_39.LastWidgetContent = r2_39
  r0_39:UpdateCommonTabInfo()
end
function r2_0.OnBannerExpire(r0_40)
  -- line: [846, 850] id: 40
  if r0_40.IsBannerPage then
    r0_40.ShopTab:SelectTab(r0_40.ShopTab.CurrentTab)
  end
end
function r2_0.InitMonthCardPage(r0_41, r1_41)
  -- line: [855, 876] id: 41
  r0_41.VB_ItemList:SetVisibility(ESlateVisibility.Collapsed)
  r0_41.Group_MonthCard:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  local r2_41 = r0_41.Group_MonthCard:GetChildrenCount()
  local r3_41 = nil
  if r2_41 > 0 then
    r3_41 = r0_41.Group_MonthCard:GetChildAt(0)
  end
  if not IsValid(r3_41) then
    r0_41.Group_MonthCard:ClearChildren()
    r3_41 = UIManager(r0_41):_CreateWidgetNew("MonthCardPage")
    r0_41.Group_MonthCard:AddChild(r3_41)
  end
  r3_41:InitBannerPage()
  local r4_41 = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(r3_41)
  r4_41:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
  r4_41:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
  if not CommonUtils:IfExistSystemGuideUI(r0_41) then
    r3_41:SetFocus()
  end
end
function r2_0.InitJumpShopPage(r0_42)
  -- line: [879, 915] id: 42
  if r0_42.Common_Tab and r0_42.Common_Tab.WBP_Com_Tab_ResourceBar then
    r0_42.Common_Tab.WBP_Com_Tab_ResourceBar:SetLastFocusWidget(r0_42.List_Jump)
  end
  r0_42.VB_ItemList:SetVisibility(ESlateVisibility.Collapsed)
  r0_42.VB_Jump:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  local r1_42 = ShopUtils:GetComplexInfo(r0_42.CurSubTabMap.SubTabId)
  r0_42.List_Jump:ScrollIndexIntoView(0)
  r0_42.List_Jump:ClearListItems()
  for r6_42, r7_42 in ipairs(r1_42) do
    if ConditionUtils.CheckCondition(GWorld:GetAvatar(), DataMgr.InterfaceJump[r7_42.InterfaceJumpId].PortalUnlockCondition) then
      local r10_42 = UIManager(r0_42):_CreateWidgetNew("JumpShopItem")
      r10_42.JumpShopData = r7_42
      r0_42.List_Jump:AddItem(r10_42)
    end
  end
  -- close: r2_42
  if r0_42.List_Jump:GetNumItems() > 0 then
    r0_42.List_Jump:RequestFillEmptyContent()
    r0_42.List_Jump:RequestPlayEntriesAnim()
    r0_42.List_Jump:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
    r0_42.List_Jump:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
    r0_42:AddTimer(0.01, function()
      -- line: [909, 913] id: 43
      if not CommonUtils:IfExistSystemGuideUI(r0_42) then
        r0_42.List_Jump:SetFocus()
      end
    end)
  end
end
function r2_0.Close(r0_44)
  -- line: [917, 930] id: 44
  if r0_44.VideoPlayer then
    r0_44:StopVideoTop()
    r0_44:StopVideoBG()
  end
  r0_44.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
  if r0_44.CloseCallBack then
    r0_44.CloseCallBack(r0_44.ClsoeCallBackObj)
  end
  r0_44:ClearSubTabReddot()
  r0_44:RemoveTabReddotListen()
  r0_44.Super.Close(r0_44)
end
function r2_0.OnAnimationFinished(r0_45, r1_45)
  -- line: [932, 945] id: 45
  if r1_45 == r0_45.Out then
    r0_45:BlockAllUIInput(true)
    r0_45:Close()
  elseif r1_45 == r0_45.In then
    r0_45:BlockAllUIInput(false)
    if r0_45.SelectShopItemId then
      r0_45:AddTimer(0.1, function()
        -- line: [939, 942] id: 46
        r0_45:ShowItemDetail()
        r0_45.SelectShopItemId = nil
      end, false, 0, "OpenShopItemDialog", true)
    end
  end
end
function r2_0.Destruct(r0_47)
  -- line: [947, 965] id: 47
  local r1_47 = UGameplayStatics.GetPlayerCharacter(r0_47, 0)
  if r1_47 then
    r1_47:SetCanInteractiveTrigger(true)
  end
  AudioManager(r0_47):StopSystemUIBGM(r0_47.ShopType)
  r0_47:HorizontalListViewResize_TearDown()
  r0_47.Group_RecommendAnchor:ClearChildren()
  r0_47:CleanTimer()
  r0_47.List_Item.OnCreateEmptyContent:Unbind()
  r0_47.List_Jump.OnCreateEmptyContent:Unbind()
  if r0_47.Btn_Shop_Visible and r0_47.Btn_Shop_Visible.Btn_Click then
    r0_47.Btn_Shop_Visible.Btn_Click.OnClicked:Remove(r0_47, r0_47.HideUIExceptVideoAutoCallBack)
  end
  if GWorld.GameInstance then
    GWorld.GameInstance:SetHighFrequencyMemoryCheckGCEnabled(false, "ShopMain")
  end
  r0_47.Super.Destruct(r0_47)
end
function r2_0.OnGamePadSelect(r0_48, r1_48, r2_48)
  -- line: [968, 974] id: 48
  if nil and not nil then
    goto label_7	-- block#1 is visited secondly
  end
end
function r2_0.OnPreviewKeyDown(r0_49, r1_49, r2_49)
  -- line: [976, 1048] id: 49
  local r3_49 = UE4.UKismetInputLibrary.GetKey(r2_49)
  local r4_49 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_49)
  if UKismetInputLibrary.InputEvent_IsRepeat(UWidgetBlueprintLibrary.GetInputEventFromKeyEvent(r2_49)) then
    return UWidgetBlueprintLibrary.UnHandled()
  end
  if r0_49:IsAllowedToShowHideUI() then
    if r4_49 == "U" or r4_49 == Const.GamepadFaceButtonLeft then
      r0_49:HideUIExceptVideoAutoCallBack()
      return UWidgetBlueprintLibrary.Handled()
    end
    if r0_49.bHideUIExceptVideo then
      r0_49:HideUIExceptVideo(false)
      return UWidgetBlueprintLibrary.Handled()
    end
  end
  local r7_49 = false
  if r0_49.ShowSwitchBanner and not r0_49.FocusOnResourceBar then
    if r4_49 == UIConst.GamePadKey.DPadRight then
      r0_49.Shop_RecommendBanner:SwitchBannerItem(nil, true)
    elseif r4_49 == UIConst.GamePadKey.DPadLeft then
      r0_49.Shop_RecommendBanner:SwitchBannerItem(nil, false)
    end
  end
  if r4_49 == "Gamepad_FaceButton_Bottom" and r0_49.IsBannerPage and r0_49.BannerMap and r0_49.BannerMap[r0_49.CurrentPageIndex] then
    r0_49.BannerMap[r0_49.CurrentPageIndex]:OnGoToInterface()
    r7_49 = true
  end
  if r4_49 == "SpaceBar" and r0_49.IsBannerPage and not r0_49.bPlayVideoTop then
    local r9_49 = r0_49.BannerBpMap[DataMgr.ShopBannerTab[r0_49.SelectBannerId].Bp]
    if r9_49 and r9_49.OnGoToInterface then
      r9_49:OnGoToInterface()
      r7_49 = true
    end
  end
  if r0_49.TabType == "Banner" and r0_49.SelectBannerId and r0_49.BannerIdMap and type(r0_49.BannerIdMap) == "table" then
    local r8_49 = r0_49.BannerIdMap[r0_49.SelectBannerId]
    if r8_49 and r8_49.HandlePreviewKeyDown and not r7_49 then
      r7_49 = r8_49:HandlePreviewKeyDown(r3_49, r4_49)
    end
  end
  if r7_49 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end
function r2_0.OnGamePadDown(r0_50, r1_50)
  -- line: [1050, 1068] id: 50
  local r2_50 = false
  if r1_50 == "Gamepad_LeftTrigger" or r1_50 == "Gamepad_RightTrigger" then
    if not r0_50.IsBannerPage and r0_50.Common_Toggle_TabGroup_PC then
      r2_50 = r0_50.Common_Toggle_TabGroup_PC:Handle_KeyEventOnGamePad(r1_50)
    end
  elseif r1_50 == "Gamepad_FaceButton_Right" then
    if not UIManager(r0_50):GetUIObj("CommonDialog") then
      r0_50:CloseSelf()
    end
    r2_50 = true
  elseif r1_50 == "Gamepad_RightShoulder" or r1_50 == "Gamepad_LeftShoulder" then
    r2_50 = r0_50.ShopTab:Handle_KeyEventOnGamePad(r1_50)
  else
    r2_50 = r0_50.Common_Tab:Handle_KeyEventOnGamePad(r1_50)
  end
  return r2_50
end
function r2_0.OnUpdateUIStyleByInputTypeChange(r0_51, r1_51, r2_51)
  -- line: [1070, 1104] id: 51
  if r1_51 == ECommonInputType.Touch then
    return 
  end
  if r1_51 == ECommonInputType.Gamepad then
    r0_51:InitGamepadView()
  else
    r0_51:InitKeyboardView()
  end
  r0_51:UpdateSwitchBannerGamePadKey()
  if r0_51.BannerIdMap then
    for r7_51, r8_51 in pairs(r0_51.BannerIdMap) do
      if r8_51 and r8_51.RefreshOpInfoByInputDevice then
        r8_51:RefreshOpInfoByInputDevice(r1_51, r2_51)
      end
    end
    -- close: r3_51
  end
  if r0_51.IsJumpShopPage and r0_51.List_Jump and r1_51 == ECommonInputType.Gamepad and (r0_51:HasAnyFocus() or r0_51:HasFocusedDescendants()) and not CommonUtils:IfExistSystemGuideUI(r0_51) then
    r0_51.List_Jump:SetFocus()
  elseif r0_51.IsBannerPage and r1_51 == ECommonInputType.Gamepad and (r0_51:HasAnyFocus() or r0_51:HasFocusedDescendants()) and not CommonUtils:IfExistSystemGuideUI(r0_51) then
    r0_51.ScrollBox_Recommend:SetFocus()
  end
  r0_51:UpdateVideoKeyInfo(r1_51, r2_51)
end
function r2_0.InitGamepadView(r0_52)
  -- line: [1106, 1116] id: 52
  r0_52.CheckBox_Own.Com_KeyImg:SetVisibility(ESlateVisibility.Visible)
  r0_52.CheckBox_Own.Com_KeyImg:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "X",
      }
    },
  })
end
function r2_0.InitKeyboardView(r0_53)
  -- line: [1118, 1120] id: 53
  r0_53.CheckBox_Own.Com_KeyImg:SetVisibility(ESlateVisibility.Collapsed)
end
function r2_0.OnSpaceBarDown(r0_54)
  -- line: [1122, 1129] id: 54
  if r0_54.IsBannerPage and r0_54.BannerIdMap and r0_54.SelectBannerId then
    local r1_54 = r0_54.BannerIdMap[r0_54.SelectBannerId]
    if r1_54.OnPCKeyDown then
      r1_54:OnPCKeyDown("SpaceBar")
    end
  end
end
function r2_0.UpdateCommonTabInfo(r0_55, r1_55)
  -- line: [1131, 1218] id: 55
  if not r0_55.SelectBannerId or not r0_55.Common_Tab or not r0_55.Common_Tab.UpdateBottomKeyInfo then
    return 
  end
  if r1_55 and next(r1_55) then
    r0_55.Common_Tab:UpdateBottomKeyInfo(r1_55)
    return 
  end
  local r2_55 = {}
  local r3_55 = DataMgr.ShopBannerTab[r0_55.SelectBannerId]
  if r3_55 and r3_55.Bp and r3_55.Bp == "WBP_Shop_Recommend_WeaponSkin" then
    r2_55 = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "X",
            Owner = r0_55,
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
            ClickCallback = r0_55.OnSpaceBarDown,
            Owner = r0_55,
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
            ClickCallback = r0_55.CloseSelf,
            Owner = r0_55,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = r0_55.CloseSelf,
            Owner = r0_55,
          }
        },
        Desc = GText("UI_BACK"),
      }
    }
  elseif r3_55 and r3_55.Bp and r3_55.Bp == "WBP_Shop_Recommend_Gift4_1" then
    r2_55 = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "X",
            Owner = r0_55,
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
            Owner = r0_55.BannerBpMap[r3_55.Bp],
            ClickCallback = r0_55.BannerBpMap[r3_55.Bp].OnGoToInterface,
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
            ClickCallback = r0_55.CloseSelf,
            Owner = r0_55,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = r0_55,
          }
        },
        Desc = GText("UI_BACK"),
      }
    }
  elseif r3_55 and r3_55.Bp and r3_55.Bp == "WBP_Shop_Recommend_AvatarSkin" then
    r2_55 = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Tab",
            Owner = r0_55,
            ClickCallback = r0_55.HideUIExceptVideoAutoCallBack,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "LS",
            Owner = r0_55,
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
            Owner = r0_55,
            ClickCallback = r0_55.OnSpaceBarDown,
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
            Owner = r0_55,
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
            ClickCallback = r0_55.CloseSelf,
            Owner = r0_55,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = r0_55,
          }
        },
        Desc = GText("UI_BACK"),
        bLongPress = false,
      }
    }
  elseif r3_55 and r3_55.Bp and r3_55.Bp == "WBP_Shop_Banner_MonthCard" then
    r2_55 = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "SpaceBar",
            Owner = r0_55,
            ClickCallback = r0_55.OnSpaceBarDown,
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
            ClickCallback = r0_55.CloseSelf,
            Owner = r0_55,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = r0_55,
          }
        },
        Desc = GText("UI_BACK"),
        bLongPress = false,
      }
    }
  elseif not r3_55 or not r3_55.Bp or r3_55.Bp ~= "WBP_Shop_Recommend_PageGift" then
    r2_55 = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = r0_55,
          }
        },
        Desc = GText("UI_Tips_Ensure"),
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = r0_55.CloseSelf,
            Owner = r0_55,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = r0_55.CloseSelf,
            Owner = r0_55,
          }
        },
        Desc = GText("UI_BACK"),
      }
    }
  end
  r0_55.Common_Tab:UpdateBottomKeyInfo(r2_55)
end
function r2_0.UpdateCommonTabInfoByReward(r0_56)
  -- line: [1220, 1244] id: 56
  if not r0_56.SelectBannerId then
    return 
  end
  local r1_56 = DataMgr.ShopBannerTab[r0_56.SelectBannerId]
  if r1_56 and r1_56.Bp and r1_56.Bp == "WBP_Shop_Recommend_Gift4_1" then
    r0_56.Common_Tab:UpdateBottomKeyInfo({
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = r0_56,
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
            ClickCallback = r0_56.CloseSelf,
            Owner = r0_56,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = r0_56.CloseSelf,
            Owner = r0_56,
          }
        },
        Desc = GText("UI_BACK"),
      }
    })
  elseif r1_56 and r1_56.Bp and r1_56.Bp == "WBP_Shop_Recommend_PageGift" then
    r0_56.Common_Tab:UpdateBottomKeyInfo({
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = r0_56,
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
            ClickCallback = r0_56.CloseSelf,
            Owner = r0_56,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = r0_56.CloseSelf,
            Owner = r0_56,
          }
        },
        Desc = GText("UI_BACK"),
      }
    })
  end
end
function r2_0.SetHasVideo(r0_57, r1_57)
  -- line: [1247, 1249] id: 57
  r0_57.bHasVideo = r1_57
end
function r2_0.IsHasVideo(r0_58)
  -- line: [1252, 1254] id: 58
  return r0_58.bHasVideo
end
function r2_0.SetAllowedToShowHideUI(r0_59, r1_59)
  -- line: [1257, 1268] id: 59
  r0_59.bAllowedToShowHideUI = r1_59
  if r0_59.Btn_Shop_Visible then
    if r1_59 then
      r0_59.Btn_Shop_Visible:SetVisibility(ESlateVisibility.Visible)
    else
      r0_59.Btn_Shop_Visible:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
end
function r2_0.SetShowModel(r0_60, r1_60)
  -- line: [1270, 1272] id: 60
  r0_60.bShowModel = r1_60
end
function r2_0.IsShowModel(r0_61)
  -- line: [1274, 1276] id: 61
  return r0_61.bShowModel
end
function r2_0.SetReplayGestureVisible(r0_62, r1_62)
  -- line: [1278, 1287] id: 62
  if r0_62.Btn_Shop_Refresh then
    if r1_62 then
      r0_62.Btn_Shop_Refresh:SetVisibility(ESlateVisibility.Visible)
    else
      r0_62.Btn_Shop_Refresh:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
end
function r2_0.IsAllowedToShowHideUI(r0_63)
  -- line: [1290, 1292] id: 63
  return r0_63.bAllowedToShowHideUI
end
function r2_0.OnKeyDown(r0_64, r1_64, r2_64)
  -- line: [1294, 1317] id: 64
  local r3_64 = UE4.UKismetInputLibrary.GetKey(r2_64)
  local r4_64 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_64)
  if r0_64.bPlayVideoTop and (r4_64 == "Escape" or r4_64 == Const.GamepadFaceButtonRight) then
    return UWidgetBlueprintLibrary.Handled()
  end
  if r0_64.TabType == "Banner" and r0_64.SelectBannerId and r0_64.BannerIdMap and type(r0_64.BannerIdMap) == "table" then
    local r5_64 = r0_64.BannerIdMap[r0_64.SelectBannerId]
    if r5_64 and r5_64.HandleKeyDown and r5_64:HandleKeyDown(r3_64, r4_64) then
      return UWidgetBlueprintLibrary.Handled()
    end
  end
  return r2_0.Super.OnKeyDown(r0_64, r1_64, r2_64)
end
function r2_0.OnKeyUp(r0_65, r1_65, r2_65)
  -- line: [1319, 1330] id: 65
  local r4_65 = UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_65))
  if r0_65.Key_Video and r0_65.bPlayVideoTop and (r4_65 == "SpaceBar" or r4_65 == Const.GamepadFaceButtonDown) then
    r0_65.Key_Video.Panel_Key:GetChildAt(0):OnButtonReleased()
    return UWidgetBlueprintLibrary.Handled()
  end
  return r2_0.Super.OnKeyUp(r0_65, r1_65, r2_65)
end
function r2_0.On_Image_Click_MouseButtonDown(r0_66, r1_66, r2_66)
  -- line: [1334, 1336] id: 66
  return r0_66:OnPointerDown(r1_66, r2_66)
end
function r2_0.OnMouseWheel(r0_67, r1_67, r2_67)
  -- line: [1338, 1340] id: 67
  return r0_67:OnMouseWheelScroll(r1_67, r2_67)
end
function r2_0.OnMouseButtonUp(r0_68, r1_68, r2_68)
  -- line: [1342, 1344] id: 68
  return r0_68:OnPointerUp(r1_68, r2_68)
end
function r2_0.OnMouseMove(r0_69, r1_69, r2_69)
  -- line: [1347, 1375] id: 69
  if r0_69.bPlayVideoTop and r0_69:IsAllowedToShowHideUI() and r0_69.bHideUIExceptVideo then
    DebugPrint("WBP_ShopMain_C:OnMouseMove")
    local r3_69 = 10
    local r4_69 = r0_69.LastMousePos
    if not r4_69 then
      r4_69 = {}
      r4_69.X = nil
      r4_69.Y = nil
    end
    r0_69.LastMousePos = r4_69
    r4_69 = UWidgetLayoutLibrary.GetMousePositionOnViewport(r0_69)
    local r5_69 = r0_69.LastMousePos
    local r6_69 = false
    if r5_69.X and r5_69.Y then
      local r7_69 = r4_69.X - r5_69.X
      local r8_69 = r4_69.Y - r5_69.Y
      local r9_69 = math.sqrt(r7_69 * r7_69 + r8_69 * r8_69)
      if r3_69 <= r9_69 then
        DebugPrint(string.format("WBP_ShopMain_C:OnMouseMove, Dist: %f, ShouldHandle = true", r9_69))
        r6_69 = true
      end
    end
    r0_69.LastMousePos.X = r4_69.X
    r0_69.LastMousePos.Y = r4_69.Y
    if r6_69 then
      r0_69:HideUIExceptVideo(false)
      return UWidgetBlueprintLibrary.Handled()
    end
  else
    return r0_69:OnPointerMove(r1_69, r2_69)
  end
end
function r2_0.OnTouchStarted(r0_70, r1_70, r2_70)
  -- line: [1377, 1379] id: 70
  return r0_70:OnSinglePointerDown(r1_70, r2_70)
end
function r2_0.OnTouchEnded(r0_71, r1_71, r2_71)
  -- line: [1381, 1383] id: 71
  return r0_71:OnPointerUp(r1_71, r2_71)
end
function r2_0.OnTouchMoved(r0_72, r1_72, r2_72)
  -- line: [1385, 1387] id: 72
  return r0_72:OnPointerMove(r1_72, r2_72)
end
function r2_0.OnCameraScrollBackwardKeyDown(r0_73)
  -- line: [1389, 1391] id: 73
  r0_73:ScrollCamera(1)
end
function r2_0.OnCameraScrollForwardKeyDown(r0_74)
  -- line: [1393, 1395] id: 74
  r0_74:ScrollCamera(-1)
end
function r2_0.OnAnalogValueChanged(r0_75, r1_75, r2_75)
  -- line: [1397, 1408] id: 75
  if UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_75)) == "Gamepad_RightX" then
    if r0_75.ActorController then
      r0_75.ActorController:OnDragging({
        X = UKismetInputLibrary.GetAnalogValue(r2_75) * 10,
      })
    end
    return UIUtils.Handled
  end
  return UIUtils.Unhandled
end
function r2_0.OnMouseCaptureLost(r0_76)
  -- line: [1410, 1412] id: 76
  r0_76:OnPointerCaptureLost()
end
function r2_0.OnBackgroundClicked(r0_77)
  -- line: [1414, 1418] id: 77
  if r0_77.bSelfHidden then
    r0_77:OnHideUIKeyDown()
  end
end
function r2_0.InitVideoPlayer(r0_78, r1_78, r2_78, r3_78)
  -- line: [1423, 1434] id: 78
  r0_78._OriginVisibilityMap = r0_78._OriginVisibilityMap and {}
  r0_78.bPlayVideoTop = false
  r0_78.VideoPlayer:SetUrlByMediaSource(LoadObject(r1_78))
  r0_78.DisplayType = r2_78
  r0_78.DisplayId = r3_78
end
function r2_0.UpdateVideoKeyInfo(r0_79, r1_79, r2_79)
  -- line: [1436, 1466] id: 79
  if IsValid(r0_79.GameInputModeSubsystem) then
    if not r1_79 then
      r1_79 = r0_79.GameInputModeSubsystem:GetCurrentInputType()
    end
    if not r2_79 then
      r2_79 = r0_79.GameInputModeSubsystem:GetCurrentGamepadName()
    end
  end
  if not r0_79.Key_Video then
    return 
  end
end
function r2_0.SetSkipButton(r0_80)
  -- line: [1469, 1485] id: 80
  r0_80.VideoPlayer.Button_Skip:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if CommonUtils.GetDeviceTypeByPlatformName(r0_80) == "Mobile" and r0_80.Button_Skip then
    r0_80.Button_Skip.Button_Area.OnClicked:Add(r0_80, r0_80.StopVideoTop)
    r0_80.Button_Skip.Text_Function:SetText(GText("UI_TALK_SKIP_MOIILE"))
  elseif CommonUtils.GetDeviceTypeByPlatformName(r0_80) == "PC" and r0_80.Key_Video then
    r0_80:UpdateVideoKeyInfo()
  end
end
function r2_0.ShowSkipButton(r0_81, r1_81)
  -- line: [1488, 1502] id: 81
  local r2_81 = nil	-- notice: implicit variable refs by block#[5, 8]
  if r1_81 then
    r2_81 = UIConst.VisibilityOp.Visible
    if not r2_81 then
      ::label_7::
      r2_81 = UIConst.VisibilityOp.Collapsed
    end
  else
    goto label_7	-- block#2 is visited secondly
  end
  if CommonUtils.GetDeviceTypeByPlatformName(r0_81) == "Mobile" and r0_81.Button_Skip then
    r0_81.Button_Skip:SetVisibility(r2_81)
  elseif CommonUtils.GetDeviceTypeByPlatformName(r0_81) == "PC" and r0_81.Key_Video then
    r0_81.Key_Video:SetVisibility(r2_81)
  end
end
function r2_0.HideUIExceptVideoAutoCallBack(r0_82)
  -- line: [1505, 1509] id: 82
  if r0_82:IsAllowedToShowHideUI() then
    r0_82:HideUIExceptVideo(not r0_82.bHideUIExceptVideo, false)
  end
end
function r2_0.HideUIExceptVideo(r0_83, r1_83, r2_83)
  -- line: [1513, 1586] id: 83
  DebugPrint("WBP_ShopMain_C HideUIExceptVideo")
  if not r1_83 and r0_83.bPlayVideoTop then
    r0_83:StopVideoTop()
  end
  if not r2_83 and (r0_83:IsAnimationPlaying(r0_83.In_Info) or r0_83:IsAnimationPlaying(r0_83.Out_Info)) then
    return false
  end
  if r1_83 == r0_83.bHideUIExceptVideo then
    return true
  end
  r0_83.bHideUIExceptVideo = r1_83
  if r2_83 or r0_83.bHasHideUIManually then
    r0_83.bHasHideUIManually = r1_83
    for r7_83 = 0, r0_83.Root:GetChildrenCount() + -1, 1 do
      local r8_83 = r0_83.Root:GetChildAt(r7_83)
      if r8_83 ~= r0_83.Group_Video then
        if r1_83 then
          if r0_83._OriginVisibilityMap[r8_83] == nil then
            r0_83._OriginVisibilityMap[r8_83] = r8_83:GetVisibility()
          end
          r8_83:SetVisibility(ESlateVisibility.Hidden)
        elseif r0_83._OriginVisibilityMap[r8_83] ~= nil then
          r8_83:SetVisibility(r0_83._OriginVisibilityMap[r8_83])
        end
      end
    end
  end
  if not r2_83 then
    if r1_83 then
      r0_83:PlayAnimation(r0_83.Out_Info)
      r0_83:SetFocus()
    else
      r0_83:PlayAnimation(r0_83.In_Info)
      if not CommonUtils:IfExistSystemGuideUI(r0_83) and r0_83:HasAnyFocus() and r0_83.CurSubTabMap.TabType == "Banner" then
        r0_83:AddTimer(0.05, function()
          -- line: [1559, 1561] id: 84
          r0_83:GamePadFocusToSelectBannerItem()
        end)
      end
    end
  end
  if r1_83 then
    r0_83.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
  else
    r0_83.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
  end
  local r3_83 = UWidgetLayoutLibrary.GetMousePositionOnViewport(r0_83)
  r0_83.LastMousePos = {
    X = r3_83.X,
    Y = r3_83.Y,
  }
  if r0_83.Shop_RecommendBanner then
    if r1_83 or r0_83.ShowSwitchBanner then
      r0_83.Shop_RecommendBanner:StopBannerTimer()
    else
      r0_83.Shop_RecommendBanner:StartBannerTimer()
    end
  end
  return true
end
function r2_0.HideCursor(r0_85)
  -- line: [1588, 1597] id: 85
  if CommonUtils.GetDeviceTypeByPlatformName(GWorld.GameInstance) == "PC" then
    UGameInputModeSubsystem.GetGameInputModeSubsystem(GWorld.GameInstance):SetMouseCursorVisable(false)
  end
end
function r2_0.ShowCursor(r0_86)
  -- line: [1599, 1608] id: 86
  if CommonUtils.GetDeviceTypeByPlatformName(GWorld.GameInstance) == "PC" then
    UGameInputModeSubsystem.GetGameInputModeSubsystem(GWorld.GameInstance):SetMouseCursorVisable(true)
  end
end
function r2_0.PlayVideoTop(r0_87)
  -- line: [1611, 1644] id: 87
  DebugPrint("WBP_ShopMain_C PlayVideoTop")
  if CommonUtils:IfExistSystemGuideUI(r0_87) then
    r0_87:PlayVideoBG()
    return 
  end
  if r0_87.bPlayVideoTop then
    return 
  end
  r0_87:UpdateVideoKeyInfo()
  r0_87.bPlayVideoTop = true
  r0_87:HideUIExceptVideo(true, true)
  r0_87.Group_Video:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_87.Group_Video:SetFocus()
  r0_87.VideoPlayer.MediaPlayer.OnEndReached:Add(r0_87, r0_87.OnPlayVideoTopEnd)
  r0_87:HideCursor()
  r0_87.VideoPlayer:SetLooping(true)
  r0_87.VideoPlayer:Play()
  r0_87:StopOtherSound()
  r0_87:PlayVideoSound()
end
function r2_0.StopOtherSound(r0_88)
  -- line: [1647, 1649] id: 88
  AudioManager(r0_88):PlayUISound(r0_88, "event:/ui/common/gacha_amb", "GachaAmb", nil)
end
function r2_0.ResumeOtherSound(r0_89)
  -- line: [1652, 1654] id: 89
  AudioManager(r0_89):SetEventSoundParam(r0_89, "GachaAmb", {
    ToEnd = 1,
  })
end
function r2_0.PlayVideoSound(r0_90)
  -- line: [1656, 1691] id: 90
  if not r0_90.DisplayType or not r0_90.DisplayId then
    DebugPrint("没有配置DisplayType或DisplayId，无法找到视频需要的声音")
    return 
  end
  local r1_90 = nil
  if r0_90.DisplayType == CommonConst.DataType.Skin then
    local r2_90 = DataMgr.Skin[r0_90.DisplayId]
    if not r2_90 then
      DebugPrint("DisplayId对应的Skin配置不存在")
      return 
    end
    r1_90 = r2_90.GetSoundPath
  elseif r0_90.DisplayType == CommonConst.DataType.Resource then
    local r2_90 = DataMgr.Resource[r0_90.DisplayId]
    if not r2_90 then
      DebugPrint("DisplayId对应的Resource配置不存在")
      return 
    end
    r1_90 = r2_90.GetSoundPath
  elseif r0_90.DisplayType == CommonConst.DataType.Char then
    local r3_90 = DataMgr.Char[r0_90.DisplayId].GUIPathVariable
    if not r3_90 then
      DebugPrint("DisplayId对应的Char配置不存在GUIPathVariable")
      return 
    end
    r1_90 = "event:/ui/char/gacha_show_" .. r3_90
  end
  if not r1_90 then
    DebugPrint("DisplayType不是Skin、Resource、Char其中之一，无法找到声音")
    return 
  end
  AudioManager(r0_90):PlayUISound(r0_90, r1_90, "VideoSound", nil)
end
function r2_0.StopVideoSound(r0_91)
  -- line: [1693, 1695] id: 91
  AudioManager(r0_91):StopSound(r0_91, "VideoSound")
end
function r2_0.OnPlayVideoTopEnd(r0_92)
  -- line: [1698, 1700] id: 92
  r0_92:StopVideoTop()
end
function r2_0.StopVideoTop(r0_93)
  -- line: [1703, 1730] id: 93
  DebugPrint("WBP_ShopMain_C StopVideoTop")
  if not r0_93.bPlayVideoTop then
    return 
  end
  r0_93.bPlayVideoTop = false
  r0_93:HideUIExceptVideo(false, false)
  r0_93.VideoPlayer.MediaPlayer.OnEndReached:Remove(r0_93, r0_93.OnPlayVideoTopEnd)
  r0_93:ShowCursor()
  r0_93:ResumeOtherSound()
  r0_93:StopVideoSound()
  r0_93.bPlayVideoBG = true
  r0_93:AddTimer(0.05, function()
    -- line: [1727, 1729] id: 94
    r0_93:GamePadFocusToSelectBannerItem()
  end)
end
function r2_0.PlayVideoBG(r0_95)
  -- line: [1733, 1749] id: 95
  DebugPrint("WBP_ShopMain_C PlayVideoBG")
  if r0_95.bPlayVideoBG then
    return 
  end
  r0_95.bPlayVideoBG = true
  r0_95.Group_Video:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_95.Group_BG:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_95.VideoPlayer:SetLooping(true)
  r0_95.VideoPlayer:Play()
end
function r2_0.StopVideoBG(r0_96)
  -- line: [1751, 1765] id: 96
  DebugPrint("WBP_ShopMain_C StopVideoBG")
  if not r0_96.bPlayVideoBG then
    return 
  end
  r0_96.bPlayVideoBG = false
  r0_96.Group_Video:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_96.Group_BG:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_96.VideoPlayer:Stop()
end
function r2_0.GamePadFocusToSelectBannerItem(r0_97)
  -- line: [1767, 1773] id: 97
  local r1_97 = r0_97:GetSelectBannerItem()
  if not r1_97 or CommonUtils:IfExistSystemGuideUI(r0_97) then
    return 
  end
  r1_97:SetFocus()
end
function r2_0.GetSelectBannerItem(r0_98)
  -- line: [1775, 1788] id: 98
  if not r0_98.SelectBannerId or r0_98.ShowSwitchBanner then
    return r0_98.Shop_RecommendBanner
  end
  local r1_98 = r0_98.ScrollBox_Recommend:GetAllChildren():ToTable()
  if r1_98 and next(r1_98) then
    for r6_98, r7_98 in pairs(r1_98) do
      if r7_98.BannerId and r7_98.BannerId == r0_98.SelectBannerId then
        return r7_98
      end
    end
    -- close: r2_98
  end
  return nil
end
function r2_0.OnRepeatKeyDown(r0_99, r1_99, r2_99)
  -- line: [1790, 1806] id: 99
  local r3_99 = UE4.UKismetInputLibrary.GetKey(r2_99)
  local r4_99 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_99)
  local r5_99 = false
  if r0_99.TabType == "Banner" and r0_99.SelectBannerId and r0_99.BannerIdMap and type(r0_99.BannerIdMap) == "table" then
    local r6_99 = r0_99.BannerIdMap[r0_99.SelectBannerId]
    if r6_99 and r6_99.HandleRepeatKeyDown and not r5_99 then
      r5_99 = r6_99:HandleRepeatKeyDown(r3_99, r4_99)
    end
  end
  if r5_99 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end
function r2_0.OnResourceBarAddedToFocusPath(r0_100)
  -- line: [1808, 1810] id: 100
  r0_100.FocusOnResourceBar = true
end
function r2_0.OnResourceBarRemovedFromFocusPath(r0_101)
  -- line: [1812, 1820] id: 101
  r0_101.FocusOnResourceBar = false
  if r0_101.SelectBannerId and r0_101.BannerIdMap and type(r0_101.BannerIdMap) == "table" then
    local r1_101 = r0_101.BannerIdMap[r0_101.SelectBannerId]
    if r1_101 and r1_101.OnResourceBarRemovedFromFocusPath then
      r1_101:OnResourceBarRemovedFromFocusPath()
    end
  end
end
AssembleComponents(r2_0)
return r2_0
