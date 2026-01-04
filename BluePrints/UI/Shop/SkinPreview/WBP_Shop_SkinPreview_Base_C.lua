-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\Shop\SkinPreview\WBP_Shop_SkinPreview_Base_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class("BluePrints.UI.BP_UIState_C")
local r1_0 = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local r2_0 = require("Utils.HeroUSDKUtils")
r0_0._components = {
  "BluePrints.UI.WBP.Armory.MainComponent.Armory_PointerInputComponent",
  "BluePrints.UI.Shop.SkinPreview.SkinPreview_ActorComponent",
  "BluePrints.UI.Shop.SkinPreview.SkinPreview_DescriptionComponent",
  "BluePrints.UI.WBP.Armory.ActorController.PreviewActorComponent"
}
function r0_0.Construct(r0_1)
  -- line: [18, 226] id: 1
  r0_0.Super.Construct(r0_1)
  r0_1.KeyDownEvents = {}
  r0_1.RepeatKeyDownEvents = {}
  r0_1.TabStyleName = "Text"
  r0_1.UKey = "U"
  r0_1.EscapeKey = EKeys.Escape.KeyName
  r0_1.GamePadHideUIKey = UIConst.GamePadKey.FaceButtonLeft
  r0_1.GamePadBackKey = UIConst.GamePadKey.FaceButtonRight
  r0_1.GamePadConfirmKey = UIConst.GamePadKey.FaceButtonBottom
  r0_1.GamePadOpenSuitKey = UIConst.GamePadKey.FaceButtonTop
  r0_1.LeftShoulderKey = UIConst.GamePadKey.LeftShoulder
  r0_1.RightShoulderKey = UIConst.GamePadKey.RightShoulder
  r0_1.LeftTriggerKey = UIConst.GamePadKey.LeftTriggerThreshold
  r0_1.RightTriggerKey = UIConst.GamePadKey.RightTriggerThreshold
  r0_1.DPadLeftKey = UIConst.GamePadKey.DPadLeft
  r0_1.DPadRightKey = UIConst.GamePadKey.DPadRight
  r0_1.MenuKey = UIConst.GamePadKey.SpecialRight
  r0_1.ViewKey = UIConst.GamePadKey.SpecialLeft
  r0_1.ZoomKey = "Mouse_Button"
  r0_1.ReplayKey = "R"
  r0_1.ESCKeyInfoList = {
    KeyInfoList = {
      {
        Type = "Text",
        Text = CommonUtils:GetKeyText(EKeys.Escape.KeyName),
        ClickCallback = r0_1.CloseSelf,
        Owner = r0_1,
      }
    },
    GamePadInfoList = {
      {
        Type = "Img",
        ImgShortPath = "B",
        ClickCallback = r0_1.CloseSelf,
        Owner = r0_1,
      }
    },
    Desc = GText("UI_BACK"),
  }
  r0_1.HideUI_KeyInfoList = {
    KeyInfoList = {
      {
        Type = "Text",
        Text = CommonUtils:GetKeyText("U"),
        ClickCallback = r0_1.OnHideUIKeyDown,
        Owner = r0_1,
      }
    },
    GamePadInfoList = {
      {
        Type = "Img",
        ImgShortPath = "X",
      }
    },
    Desc = GText("UI_Dye_HideUI"),
  }
  local r1_1 = {
    KeyInfoList = {
      {
        Type = "Text",
        Text = CommonUtils:GetKeyText(r0_1.ZoomKey),
        Owner = r0_1,
      }
    },
  }
  local r2_1 = {
    {
      Type = "Or",
    }
  }
  r1_1.GamePadInfoList = r2_1
  r1_1.Desc = GText("UI_Dye_Zoom")
  r1_1.bLongPress = false
  r0_1.ZoomKeyInfoList = r1_1
  r0_1.RightThumbstickAnalogBottomKeyInfoList = {
    GamePadInfoList = {
      {
        Type = "Img",
        ImgShortPath = "RH",
      }
    },
    Desc = GText("UI_CTL_RotatePreview"),
  }
  r0_1.MenuKeyInfoList = {
    GamePadInfoList = {
      {
        Type = "Img",
        ImgShortPath = "Menu",
      }
    },
    Desc = GText("UI_CTL_ExplainSet"),
  }
  r0_1.ReplayKeyInfoList = {
    KeyInfoList = {
      {
        Type = "Text",
        Text = CommonUtils:GetKeyText(r0_1.ReplayKey),
        ClickCallback = r0_1.OnReplayGesture,
        Owner = r0_1,
      }
    },
    GamePadInfoList = {
      {
        Type = "Img",
        ImgShortPath = "Y",
      }
    },
    Desc = GText("UI_Replay"),
    bLongPress = false,
  }
  r0_1.MainTabsStyle = {
    TitleName = GText("UI_Armory_Appearance"),
    LeftKey = "NotShow",
    RightKey = "NotShow",
    Tabs = {},
    DynamicNode = {
      "Back",
      "ResourceBar"
    },
    BottomKeyInfo = {},
    StyleName = "Text",
    OwnerPanel = r0_1,
    LastFocusWidget = r0_1,
    OnResourceBarAddedToFocusPath = function()
      -- line: [114, 119] id: 2
      r0_1.Btn_Function:SetGamePadVisibility(ESlateVisibility.Collapsed)
      r0_1.Key_GamePad_L:SetVisibility(ESlateVisibility.Collapsed)
      r0_1.Key_GamePad_R:SetVisibility(ESlateVisibility.Collapsed)
    end,
    OnResourceBarRemovedFromFocusPath = function()
      -- line: [120, 126] id: 3
      if r0_1.IsGamepadInput then
        r0_1.Btn_Function:SetGamePadVisibility(ESlateVisibility.SelfHitTestInvisible)
        local r0_3 = r0_1.Key_GamePad_L
        local r2_3 = r0_1.bFirst
        if not r2_3 then
          r2_3 = r0_1.ShopItemData.SinglePreview
          if r2_3 then
            ::label_17::
            r2_3 = ESlateVisibility.Collapsed and ESlateVisibility.SelfHitTestInvisible
          else
            goto label_21	-- block#4 is visited secondly
          end
        else
          goto label_17	-- block#3 is visited secondly
        end
        r0_3:SetVisibility(r2_3)
        r0_3 = r0_1.Key_GamePad_R
        r2_3 = r0_1.bLast
        if not r2_3 then
          r2_3 = r0_1.ShopItemData.SinglePreview
          if r2_3 then
            ::label_33::
            r2_3 = ESlateVisibility.Collapsed and ESlateVisibility.SelfHitTestInvisible
          else
            goto label_37	-- block#8 is visited secondly
          end
        else
          goto label_33	-- block#7 is visited secondly
        end
        r0_3:SetVisibility(r2_3)
      end
    end,
    BackCallback = r0_1.OnBackKeyDown,
  }
  r0_1.Btn_Preview:Init({
    ClickCallback = r0_1.OnClickSuitPreviewDialog,
    OwnerWidget = r0_1,
  })
  function r0_1.Btn_Preview.SoundFunc()
    -- line: [138, 140] id: 4
    AudioManager(r0_1):PlayUISound(r0_1.Btn_Preview, "event:/ui/common/click_btn_small", nil, nil)
  end
  r0_1:ResetPreviewCheckBox()
  r0_1.CheckBox_Preview:RemoveEventOnCheckStateChanged(r0_1)
  r0_1.CheckBox_Preview:AddEventOnCheckStateChanged(r0_1, r0_1.OnSwitchSuitPreview)
  r0_1.Btn_Function:BindEventOnClicked(r0_1, r0_1.PurChase)
  r0_1.Btn_Function:TryOverrideSoundFunc(function()
    -- line: [147, 149] id: 5
  end)
  r0_1.Btn_Selective = r0_1.Btn_Dye.Btn_Click
  r0_1.Text_Color = r0_1.Btn_Dye.Text_Btn
  r0_1.HorizontalBox_Color = r0_1.Btn_Dye
  r0_1.Btn_Selective.OnClicked:Add(r0_1, r0_1.OnClickDyeingPreview)
  r0_1.Btn_L:BindEventOnClicked(r0_1, r0_1.OnClickPreviousSkin)
  r0_1.Btn_R:BindEventOnClicked(r0_1, r0_1.OnClickNextSkin)
  r0_1.Image_Click.OnMouseButtonDownEvent:Unbind()
  r0_1.Image_Click.OnMouseButtonDownEvent:Bind(r0_1, r0_1.On_Image_Click_MouseButtonDown)
  r0_1.Text_Preview:SetText(GText("UI_SkinPreview_ShowSuit"))
  r0_1.Text_Color:SetText(GText("UI_SkinPreview_Dye"))
  r0_1.Btn_Function:SetText(GText("UI_SHOP_PURCHASE"))
  r0_1.Panel_Buy:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_1.Btn_Preview:SetVisibility(ESlateVisibility.Collapsed)
  r0_1.Text_Char_None:SetVisibility(ESlateVisibility.Collapsed)
  r0_1.WBP_Com_Cost:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_1.Num_Price:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_1.bForbiddenButton = false
  r0_1.bSelfHidden = false
  r0_1.Tab_Change.Text_Alive:SetText(GText("UI_Armory_Meleeweapon"))
  r0_1.Tab_Change.Text_Dying:SetText(GText("UI_Armory_Longrange"))
  r0_1.IsGamepadInput = UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad
end
function r0_0.Destruct(r0_6)
  -- line: [228, 234] id: 6
  r0_6.CheckBox_Preview:RemoveEventOnCheckStateChanged(r0_6)
  r0_6.Btn_Function:UnBindEventOnClickedByObj(r0_6)
  r0_6.Btn_Selective.OnClicked:Clear()
  r0_6.Image_Click.OnMouseButtonDownEvent:Unbind()
  r0_0.Super.Destruct(r0_6)
end
function r0_0.OnLoaded(r0_7, ...)
  -- line: [236, 295] id: 7
  local r2_7 = nil	-- notice: implicit variable refs by block#[0]
  local r1_7 = nil	-- notice: implicit variable refs by block#[0]
  r0_0.Super.OnLoaded(r0_7)
  ... = ... -- error: untaken top expr
  r0_7.ParentWidget = r2_7
  r0_7.ShopItemData = r1_7
  r1_7 = r0_7.ShopItemData.SinglePreview
  if not r1_7 then
    r1_7 = r0_7.ShopItemData.SkinList
    if r1_7 then
      r0_7.SkinList = r0_7.ShopItemData.SkinList
      r1_7 = {}
      r0_7.Index2ShopSkin = r1_7
      r1_7 = {}
      r0_7.ShopSkin2Index = r1_7
      r0_7.SkinCount = #r0_7.SkinList
      r1_7 = ipairs
      r2_7 = r0_7.SkinList
      for r5_7, r6_7 in r1_7(r2_7) do
        r0_7.Index2ShopSkin[r5_7] = r6_7
        r0_7.ShopSkin2Index[r6_7] = r5_7
      end
      -- close: r1_7
      r0_7.ShopItemData.TypeId = r0_7.Index2ShopSkin[1]
      r1_7 = r0_7.ShopItemData
      r2_7 = r0_7.Index2ShopSkin[1]
      r1_7.ItemId = r2_7
    else
      r0_7.Index2ShopSkin, r0_7.ShopSkin2Index, r0_7.SkinCount = ShopUtils:GetShopSkinList()
    end
    r1_7 = r0_7.Index2ShopSkin
    if r1_7 ~= nil then
      r1_7 = r0_7.ShopSkin2Index
      if r1_7 ~= nil then
        r1_7 = r0_7.SkinCount
        if r1_7 == nil then
          ::label_63::
          r0_7.ShopItemData.SinglePreview = true
          r1_7 = r0_7.ShopItemData
          r1_7.HidePurchase = false
        end
      end
    else
      goto label_63	-- block#10 is visited secondly
    end
  end
  r1_7 = r0_7.ShopItemData.HidePurchase and false
  r0_7.HidePurchase = r1_7
  r0_7.Tab_Skin:Init(r0_7.MainTabsStyle)
  r1_7 = r0_7.Tab_Skin.WBP_Com_Tab_ResourceBar
  if r1_7 then
    r0_7.Tab_Skin.WBP_Com_Tab_ResourceBar:SetLastFocusWidget(r0_7)
  end
  r0_7.Tab_Change:Init({
    Parent = r0_7,
    TabIdx = 1,
    OnTabClicked = r0_7.OnTabChangeClicked,
  })
  r0_7:InitKeySetting()
  r0_7:UpdateUI()
  AudioManager(r0_7):PlayUISound(r0_7, "event:/ui/armory/open", "SkinPreviewIn", nil)
  r0_7:PlayAnimation(r0_7.In)
  r0_7:BlockAllUIInput(true)
  r0_7:SetFocus()
end
function r0_0.InitKeySetting(r0_8)
  -- line: [297, 329] id: 8
  r0_8.KeyDownEvents[r0_8.EscapeKey] = r0_8.OnBackKeyDown
  r0_8.KeyDownEvents[r0_8.UKey] = r0_8.OnHideUIKeyDown
  r0_8.KeyDownEvents[r0_8.ReplayKey] = r0_8.OnReplayGesture
  r0_8.KeyDownEvents[r0_8.GamePadBackKey] = r0_8.OnBackKeyDown
  r0_8.RepeatKeyDownEvents[r0_8.LeftTriggerKey] = r0_8.OnCameraScrollBackwardKeyDown
  r0_8.RepeatKeyDownEvents[r0_8.RightTriggerKey] = r0_8.OnCameraScrollForwardKeyDown
  r0_8.KeyDownEvents[r0_8.GamePadHideUIKey] = r0_8.OnHideUIKeyDown
  r0_8.KeyDownEvents[r0_8.MenuKey] = r0_8.OnClickSuitPreviewDialog
  r0_8.KeyDownEvents[r0_8.ViewKey] = r0_8.OnClickDyeingPreview
  r0_8.KeyDownEvents[r0_8.GamePadOpenSuitKey] = r0_8.OnClickSuitPreview
  r0_8.KeyDownEvents[r0_8.GamePadConfirmKey] = r0_8.PurChase
  r0_8.KeyDownEvents[r0_8.DPadLeftKey] = r0_8.OnClickPreviousSkin
  r0_8.KeyDownEvents[r0_8.DPadRightKey] = r0_8.OnClickNextSkin
  r0_8.KeyDownEvents[r0_8.LeftShoulderKey] = function(r0_9)
    -- line: [317, 322] id: 9
    if r0_9.ShopItemData.ItemType ~= "WeaponAccessory" then
      return 
    end
    r0_9.Tab_Change:TriggerSwitch("Left")
  end
  r0_8.KeyDownEvents[r0_8.RightShoulderKey] = function(r0_10)
    -- line: [323, 328] id: 10
    if r0_10.ShopItemData.ItemType ~= "WeaponAccessory" then
      return 
    end
    r0_10.Tab_Change:TriggerSwitch("Right")
  end
end
function r0_0.OnClickSuitPreview(r0_11)
  -- line: [332, 338] id: 11
  if r0_11.ShopItemData.SuitRewardId == nil or #r0_11.ShopItemData.SuitRewardId == 0 then
    return 
  end
  if r0_11.bBlockClickSuitPreview or r0_11.bBlockClickChangeSkin then
    return 
  end
  r0_11.CheckBox_Preview:OnBtnClicked()
end
function r0_0.OnSwitchSuitPreview(r0_12, r1_12)
  -- line: [341, 357] id: 12
  r0_12.bBlockClickSuitPreview = true
  r0_12.CheckBox_Preview.ButtonArea:SetVisibility(ESlateVisibility.HitTestInvisible)
  r0_12:AddTimer(0.6, function(r0_13)
    -- line: [345, 348] id: 13
    r0_13.bBlockClickSuitPreview = false
    r0_13.CheckBox_Preview.ButtonArea:SetVisibility(ESlateVisibility.Visible)
  end)
  r0_12.SwitchSuitChecked = r1_12
  if r1_12 then
    r0_12:ApplySuitPreview(r0_12.ShopItemData)
  else
    r0_12:RevertToSingleItemPreview(r0_12.ShopItemData)
  end
end
function r0_0.OnBackKeyDown(r0_14)
  -- line: [360, 366] id: 14
  if r0_14.bSelfHidden then
    return r0_14:OnHideUIKeyDown()
  else
    r0_14:CloseSelf()
  end
end
function r0_0.OnHideUIKeyDown(r0_15)
  -- line: [369, 378] id: 15
  r0_15.bSelfHidden = not r0_15.bSelfHidden
  if r0_15.bSelfHidden then
    r0_15:SetRenderOpacity(0)
    r0_15.Image_Click.Slot:SetZOrder(10)
  else
    r0_15:SetRenderOpacity(1)
    r0_15.Image_Click.Slot:SetZOrder(-1)
  end
end
function r0_0.OnClickSuitPreviewDialog(r0_16)
  -- line: [381, 393] id: 16
  if r0_16.ShopItemData.SuitRewardId == nil or #r0_16.ShopItemData.SuitRewardId == 0 then
    return 
  end
  local r1_16 = DataMgr.Reward[r0_16.ShopItemData.SuitRewardId[1]]
  if r1_16 then
    UIManager(r0_16):ShowCommonPopupUI(100240, {
      ItemId = r1_16.Id,
      ItemType = r1_16.Type,
    }, r0_16)
  end
end
function r0_0.OnReplayGesture(r0_17)
  -- line: [395, 402] id: 17
  if r0_17.ShopItemData.ItemType ~= "Resource" then
    return 
  end
  if r0_17.ReplayGesture then
    r0_17:ReplayGesture(r0_17.ShopItemData.TypeId)
  end
end
function r0_0.OnClickDyeingPreview(r0_18)
  -- line: [405, 455] id: 18
  if r0_18.bBlockClickSuitPreview or r0_18.bBlockClickChangeSkin then
    return 
  end
  if r0_18.ShopItemData.ItemType ~= "Skin" and r0_18.ShopItemData.ItemType ~= "WeaponSkin" then
    return 
  end
  if r0_18.SwitchSuitChecked then
    r0_18.CheckBox_Preview:OnBtnClicked()
  end
  AudioManager(r0_18):PlayUISound(r0_18.Btn_Selective, "event:/ui/common/click_btn_small", nil, nil)
  local r1_18 = {
    Target = r0_18.Params.Target,
    Type = r0_18.Params.Type,
    SkinId = r0_18.Params.SkinId,
    IsPreviewMode = r0_18.IsPreviewMode,
    Parent = r0_18,
    OpenPreviewDyeFromShopItem = true,
    OnCloseCallback = function()
      -- line: [416, 424] id: 19
      local r0_19 = r1_0:GetAvatar()
      if r0_18.Params.Type == CommonConst.ArmoryType.Char then
        r0_18.Params.Target = r0_19.Chars[r0_18.Params.Target.Uuid] and r0_18.Params.Target
      else
        r0_18.ActorController.ArmoryHelper.EnableCameraScrolling = false
        r0_18.Params.Target = r0_19.Weapons[r0_18.Params.Target.Uuid] and r0_18.Params.Target
      end
    end,
  }
  if r1_18.Target and r1_18.Target.Uuid == 1 then
    r1_18.Target.Uuid = r1_18.SkinId
    local r2_18 = r1_0:GetAvatar()
    if r2_18 and r0_18.Type == CommonConst.ArmoryType.Char and r2_18.Chars then
      for r7_18, r8_18 in pairs(r2_18.Chars) do
        if r8_18.CharId == r1_18.Target.CharId then
          r1_18.Target = r8_18
          r1_18.bRealCharOrWeapon = true
          break
        end
      end
      -- close: r3_18
    elseif r0_18.Type == CommonConst.ArmoryType.Weapon and r2_18.Weapons then
      for r7_18, r8_18 in pairs(r2_18.Weapons) do
        if r8_18.WeaponId == r1_18.Target.WeaponId then
          r1_18.Target = r8_18
          r1_18.bRealCharOrWeapon = true
          break
        end
      end
      -- close: r3_18
    end
  elseif r1_18.Target and r1_18.Target.Uuid ~= 1 then
    r1_18.bRealCharOrWeapon = true
  end
  r1_18.IsPreviewMode = true
  local r2_18 = DataMgr.SystemUI.ArmoryDye
  if r0_18.Parent then
    UIManager(r0_18):LoadUI(UIConst.LoadInConfig, r2_18.UIName, r0_18.Parent:GetZOrder(), r1_18)
  else
    UIManager(r0_18):LoadUI(UIConst.LoadInConfig, r2_18.UIName, 100, r1_18)
  end
end
function r0_0.OnTabChangeClicked(r0_20, r1_20)
  -- line: [458, 470] id: 20
  if not GWorld:GetAvatar() then
    return 
  end
  if r0_20.SwitchSuitChecked then
    r0_20.CheckBox_Preview:OnBtnClicked()
  elseif r0_20.SwitchWeaponAccessoryPreview then
    r0_20:SwitchWeaponAccessoryPreview(r1_20)
  end
end
function r0_0.ResetPreviewCheckBox(r0_21)
  -- line: [472, 480] id: 21
  local r1_21 = r0_21.CheckBox_Preview:GetChecked()
  r0_21.CheckBox_Preview.IsChecked = false
  r0_21.CheckBox_Preview.ButtonArea:SetVisibility(ESlateVisibility.Visible)
  r0_21.SwitchSuitChecked = false
  if r1_21 then
    r0_21.CheckBox_Preview:PlayAnimation(r0_21.CheckBox_Preview.Close_Normal)
  end
end
function r0_0.OnClickPreviousSkin(r0_22)
  -- line: [483, 491] id: 22
  if r0_22.bFirst or r0_22.bBlockClickChangeSkin or r0_22.bBlockClickSuitPreview or r0_22.ShopItemData.SinglePreview then
    return 
  end
  r0_22:ResetPreviewCheckBox()
  r0_22.LastItemType = r0_22.ShopItemData.ItemType
  r0_22:SwitchToSkin(r0_22.Index + -1)
  AudioManager(r0_22):PlayUISound(r0_22, "event:/ui/common/click_btn_addMulti", nil, nil)
end
function r0_0.OnClickNextSkin(r0_23)
  -- line: [494, 502] id: 23
  if r0_23.bLast or r0_23.bBlockClickChangeSkin or r0_23.bBlockClickSuitPreview or r0_23.ShopItemData.SinglePreview then
    return 
  end
  r0_23:ResetPreviewCheckBox()
  r0_23.LastItemType = r0_23.ShopItemData.ItemType
  r0_23:SwitchToSkin(r0_23.Index + 1)
  AudioManager(r0_23):PlayUISound(r0_23, "event:/ui/common/click_btn_addMulti", nil, nil)
end
function r0_0.SwitchToSkin(r0_24, r1_24)
  -- line: [505, 522] id: 24
  local r2_24 = r0_24:GetSkinInfo(r1_24)
  if not r2_24 then
    return 
  end
  r0_24.ShopItemData = r2_24
  if r0_24.ShopItemData.ItemType == "WeaponAccessory" or r0_24.ShopItemData.ItemType == "CharAccessory" then
    AudioManager(r0_24):PlayItemSound(r0_24, r0_24.ShopItemData.TypeId, "Equip", r0_24.ShopItemData.ItemType)
  end
  r0_24:UpdateUI()
  r0_24:PlayAnimation(r0_24.Change)
  r0_24:BlockAllUIInput(true)
end
function r0_0.UpdateUI(r0_25)
  -- line: [524, 644] id: 25
  r0_25.Btn_Selective.OnClicked:Clear()
  r0_25:UpdatePreviewActor(r0_25.ShopItemData, FVector(40, 35, 0))
  r0_25:UpdateDescription(r0_25.ShopItemData)
  if not r0_25.HidePurchase then
    r0_25:UpdatePrice()
  end
  r0_25.bBlockClickChangeSkin = true
  r0_25.Btn_L.Btn:SetVisibility(ESlateVisibility.HitTestInvisible)
  r0_25.Btn_R.Btn:SetVisibility(ESlateVisibility.HitTestInvisible)
  r0_25:AddTimer(0.6, function(r0_26)
    -- line: [542, 546] id: 26
    r0_26.bBlockClickChangeSkin = false
    r0_26.Btn_L.Btn:SetVisibility(ESlateVisibility.Visible)
    r0_26.Btn_R.Btn:SetVisibility(ESlateVisibility.Visible)
  end)
  if not r0_25.HidePurchase then
    if r0_25.ShopItemData.PriceType == CommonConst.Coins.Coin1 then
      r0_25.MainTabsStyle.OverridenTopResouces = {
        CommonConst.Coins.Coin4,
        CommonConst.Coins.Coin1
      }
    else
      r0_25.MainTabsStyle.OverridenTopResouces = {
        r0_25.ShopItemData.PriceType
      }
    end
    r0_25.Tab_Skin:OverrideTopResource(r0_25.MainTabsStyle.OverridenTopResouces, true)
  end
  if r0_25.ShopItemData.SuitRewardId then
    r0_25.Panel_Preview:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_25.Text_Preview:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_25.Btn_Preview:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_25.CheckBox_Preview:SetVisibility(ESlateVisibility.Visible)
  else
    r0_25.Panel_Preview:SetVisibility(ESlateVisibility.Collapsed)
    r0_25.Text_Preview:SetVisibility(ESlateVisibility.Collapsed)
    r0_25.Btn_Preview:SetVisibility(ESlateVisibility.Collapsed)
    r0_25.CheckBox_Preview:SetVisibility(ESlateVisibility.Collapsed)
  end
  if not r0_25.ShopItemData.SinglePreview then
    r0_25.Index, r0_25.bFirst, r0_25.bLast = r0_25:GetSkinIndex(r0_25.ShopItemData.ItemId)
    local r1_25 = r0_25.Btn_L
    local r3_25 = r0_25.bFirst
    if r3_25 then
      r3_25 = ESlateVisibility.Collapsed and ESlateVisibility.SelfHitTestInvisible
    else
      goto label_137	-- block#13 is visited secondly
    end
    r1_25:SetVisibility(r3_25)
    r1_25 = r0_25.Btn_R
    r3_25 = r0_25.bLast
    if r3_25 then
      r3_25 = ESlateVisibility.Collapsed and ESlateVisibility.SelfHitTestInvisible
    else
      goto label_149	-- block#16 is visited secondly
    end
    r1_25:SetVisibility(r3_25)
  else
    r0_25.Btn_L:SetVisibility(ESlateVisibility.Collapsed)
    r0_25.Btn_R:SetVisibility(ESlateVisibility.Collapsed)
  end
  if not r0_25.HidePurchase then
    HeroUSDKSubsystem(r0_25):UploadTrackLog_Lua("shop_previewpage", {
      product_id = r0_25.ShopItemData.ItemId,
      shop_id = r0_25.ShopItemData.SubTabId,
    })
    r0_25:UpdateButtonBuy()
    r0_25:RemoveTimer("UpdatePriceTimer")
    local r2_25 = ShopUtils:GetShopItemCutoffData(r0_25.ShopItemData.ItemId)
    if r2_25 and r2_25.CutoffEndTime then
      local r3_25 = TimeUtils
      if r3_25 then
        r3_25 = TimeUtils.NowTime() and 0
      else
        goto label_204	-- block#24 is visited secondly
      end
      local r4_25 = r2_25.CutoffEndTime - r3_25
      if r4_25 > 0 then
        r0_25:AddTimer(r4_25, function()
          -- line: [607, 613] id: 27
          if not r0_25 or not IsValid(r0_25) then
            return 
          end
          r0_25:UpdatePrice()
          r0_25:UpdateButtonBuy()
        end, false, 0, "UpdatePriceTimer")
      end
    end
  else
    r0_25.WidgetSwitcher_BtnState:SetVisibility(ESlateVisibility.Collapsed)
    r0_25.Panel_Buy:SetVisibility(ESlateVisibility.Collapsed)
    r0_25.bForbiddenButton = true
  end
  if r0_25.IsGamepadInput then
    local r1_25 = r0_25.Key_GamePad_L
    local r3_25 = r0_25.bFirst
    if not r3_25 then
      r3_25 = r0_25.ShopItemData.SinglePreview
      if r3_25 then
        ::label_241::
        r3_25 = ESlateVisibility.Collapsed and ESlateVisibility.SelfHitTestInvisible
      else
        goto label_245	-- block#32 is visited secondly
      end
    else
      goto label_241	-- block#31 is visited secondly
    end
    r1_25:SetVisibility(r3_25)
    r1_25 = r0_25.Key_GamePad_R
    r3_25 = r0_25.bLast
    if not r3_25 then
      r3_25 = r0_25.ShopItemData.SinglePreview
      if r3_25 then
        ::label_257::
        r3_25 = ESlateVisibility.Collapsed and ESlateVisibility.SelfHitTestInvisible
      else
        goto label_261	-- block#36 is visited secondly
      end
    else
      goto label_257	-- block#35 is visited secondly
    end
    r1_25:SetVisibility(r3_25)
    if r0_25.ShopItemData.SuitRewardId then
      r0_25.Tab_Skin:UpdateSingleBottomKeyInfo(1, r0_25.MenuKeyInfoList)
      r0_25.Tab_Skin:SetSingleBottomKeyInfoVisibility(1, ESlateVisibility.SelfHitTestInvisible)
      r0_25.Key_Preview:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      r0_25.Btn_Preview:SetVisibility(ESlateVisibility.Collapsed)
    else
      r0_25.Tab_Skin:UpdateSingleBottomKeyInfo(1, {})
      r0_25.Tab_Skin:SetSingleBottomKeyInfoVisibility(1, ESlateVisibility.Collapsed)
      r0_25.Key_Preview:SetVisibility(ESlateVisibility.Collapsed)
    end
    if r0_25.ShopItemData.ItemType == "Skin" or r0_25.ShopItemData.ItemType == "WeaponSkin" then
      r0_25.Key_Dye_GamePad:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    else
      r0_25.Key_Dye_GamePad:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  r0_25:UpdateReplayTips()
end
function r0_0.UpdatePrice(r0_28)
  -- line: [646, 689] id: 28
  r0_28.CurrentCount = 1
  r0_28.UnitPrice = ShopUtils:GetShopItemPrice(r0_28.ShopItemData.ItemId)
  r0_28.CutoffData = ShopUtils:GetShopItemCutoffData(r0_28.ShopItemData.ItemId)
  if r0_28.CutoffData ~= nil then
    r0_28.WBP_Com_Cost:InitContent({
      ResourceId = r0_28.ShopItemData.PriceType,
      bShowDenominator = false,
      Numerator = r0_28.CutoffData.CutoffPrice,
    })
    r0_28.WBP_Com_Cost:SetGamePadIconVisible(false)
    r0_28.WBP_Com_Cost.Common_Item_Icon:Init({
      Id = r0_28.ShopItemData.PriceType,
      Icon = LoadObject(DataMgr.Resource[r0_28.ShopItemData.PriceType].Icon),
      ItemType = "Resource",
      UIName = "CommonDialog",
      NotInteractive = false,
      IsShowDetails = true,
      IsCantItemSelection = false,
      MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight,
      HandleMouseDown = true,
      HandleKeyDown = false,
    })
    r0_28.Text_Undiscounted_Price:SetText(r0_28.ShopItemData.Price)
  else
    r0_28.WBP_Com_Cost:InitContent({
      ResourceId = r0_28.ShopItemData.PriceType,
      bShowDenominator = false,
      Numerator = r0_28.ShopItemData.Price,
    })
    r0_28.WBP_Com_Cost:SetGamePadIconVisible(false)
    r0_28.WBP_Com_Cost.Common_Item_Icon:Init({
      Id = r0_28.ShopItemData.PriceType,
      Icon = LoadObject(DataMgr.Resource[r0_28.ShopItemData.PriceType].Icon),
      ItemType = "Resource",
      UIName = "CommonDialog",
      NotInteractive = false,
      IsShowDetails = true,
      IsCantItemSelection = false,
      MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight,
      HandleMouseDown = true,
      HandleKeyDown = false,
    })
    r0_28.Text_Undiscounted_Price:SetText("")
  end
end
function r0_0.UpdateButtonBuy(r0_29)
  -- line: [691, 728] id: 29
  r0_29.Btn_Function:UnBindButtonPerformances()
  r0_29.canPurchase = ShopUtils:CanPurchase(r0_29.ShopItemData, r0_29.ShopItemData.PriceType, ShopUtils:GetShopItemPrice(r0_29.ShopItemData.ItemId))
  local r1_29 = r0_29.ShopItemData.PurchaseFailRes
  r0_29.WidgetSwitcher_BtnState:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  if r1_29 == 1 or r1_29 == 6 then
    r0_29.Panel_Buy:SetVisibility(ESlateVisibility.Collapsed)
    r0_29.WidgetSwitcher_BtnState:SetActiveWidgetIndex(1)
    r0_29.Text_Desc:SetText(GText("UI_SHOP_ALREADYOWNED"))
    r0_29.bForbiddenButton = true
  elseif r1_29 == 2 or r1_29 == 3 then
    local r2_29 = r0_29.Avatar:GetResourceNum(r0_29.ShopItemData.PriceType)
    local r3_29 = ShopUtils:GetShopItemPrice(r0_29.ShopItemData.ItemId)
    r0_29.Panel_Buy:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_29.WidgetSwitcher_BtnState:SetActiveWidgetIndex(0)
    r0_29.WBP_Com_Cost:SetIsEnough(r3_29 <= r2_29)
    r0_29.Btn_Function:ForbidBtn(true)
    r0_29.Btn_Function.Button_Area.OnClicked:Add(r0_29, r0_29.PurChase)
    r0_29.bForbiddenButton = false
  elseif r1_29 == 4 or r1_29 == 5 then
    r0_29.Panel_Buy:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_29.WidgetSwitcher_BtnState:SetActiveWidgetIndex(0)
    r0_29.WBP_Com_Cost:SetIsEnough(false)
    r0_29.Btn_Function:ForbidBtn(false)
    r0_29.Btn_Function:BindButtonPerformances()
    r0_29.bForbiddenButton = false
  elseif r0_29.canPurchase then
    r0_29.Panel_Buy:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_29.WidgetSwitcher_BtnState:SetActiveWidgetIndex(0)
    r0_29.WBP_Com_Cost:SetIsEnough(true)
    r0_29.Btn_Function:ForbidBtn(false)
    r0_29.Btn_Function:BindButtonPerformances()
    r0_29.bForbiddenButton = false
  end
end
function r0_0.UpdateReplayTips(r0_30)
  -- line: [731, 759] id: 30
end
function r0_0.GetOverrideTopResource(r0_31)
  -- line: [761, 767] id: 31
  if r0_31.ShopItemData.PriceType == CommonConst.Coins.Coin1 then
    return {
      CommonConst.Coins.Coin4,
      CommonConst.Coins.Coin1
    }
  else
    return {
      r0_31.ShopItemData.PriceType
    }
  end
end
function r0_0.PurChase(r0_32)
  -- line: [770, 935] id: 32
  if r0_32.bForbiddenButton or r0_32.bSelfHidden then
    return 
  end
  if r0_32.canPurchase then
    AudioManager(r0_32):PlayUISound(r0_32.Btn_Function, "event:/ui/activity/shop_small_btn_click", nil, nil)
  end
  local r1_32 = {
    product_id = r0_32.ShopItemData.ItemId,
    shop_id = r0_32.ShopItemData.SubTabId,
    status = 2,
  }
  local r3_32 = nil	-- notice: implicit variable refs by block#[30, 34, 36, 45, 47]
  if r0_32.ShopItemData.PurchaseFailRes == 2 then
    UIManager(r0_32):ShowUITip("CommonToastMain", string.format(GText("UI_Shop_Toast_No_Coin"), GText(DataMgr.Resource[r0_32.ShopItemData.PriceType].ResourceName)), 1)
    HeroUSDKSubsystem(r0_32):UploadTrackLog_Lua("shop_confirmpage", r1_32)
    return 
  elseif r0_32.ShopItemData.PurchaseFailRes == 3 then
    UIManager(r0_32):ShowUITip("CommonToastMain", string.format(GText("UI_Shop_Toast_Locked"), r0_32.ShopItemData.UnlockLevel), 1)
    HeroUSDKSubsystem(r0_32):UploadTrackLog_Lua("shop_confirmpage", r1_32)
    return 
  elseif r0_32.ShopItemData.PurchaseFailRes == 4 then
    HeroUSDKSubsystem(r0_32):UploadTrackLog_Lua("shop_confirmpage", r1_32)
    local r2_32 = 100136
    r3_32 = GWorld:GetAvatar()
    if not r3_32 then
      return 
    end
    local r4_32 = ItemUtils:GetDropName(r0_32.ShopItemData.TypeId, r0_32.ShopItemData.ItemType)
    local r5_32 = r3_32.Resources[r0_32.ShopItemData.PriceType]
    if r5_32 then
      r5_32 = r3_32.Resources[r0_32.ShopItemData.PriceType].Count and 0
    else
      goto label_127	-- block#14 is visited secondly
    end
    local r6_32 = GText(DataMgr.CommonPopupUIContext[r2_32].PopoverText)
    if string.find(r6_32, "&ResourceName&") then
      r6_32 = string.gsub(r6_32, "&ResourceName&", GText(DataMgr.Resource[CommonConst.Coins.Coin4].ResourceName))
    end
    if string.find(r6_32, "&ResourceName1&") then
      r6_32 = string.gsub(r6_32, "&ResourceName1&", GText(DataMgr.Resource[CommonConst.Coins.Coin4].ResourceName))
    end
    if string.find(r6_32, "&ResourceName2&") then
      r6_32 = string.gsub(r6_32, "&ResourceName2&", GText(r4_32))
    end
    if string.find(r6_32, "&Num1&") then
      r6_32 = string.gsub(r6_32, "&Num1&", r0_32.CurrentCount * r0_32.UnitPrice - r5_32)
    end
    if string.find(r6_32, "&Num2&") then
      r6_32 = string.gsub(r6_32, "&Num2&", r0_32.CurrentCount)
    end
    local function r7_32()
      -- line: [819, 842] id: 33
      local r0_33 = 0
      if r3_32.Resources[CommonConst.Coins.Coin4] then
        r0_33 = r3_32.Resources[CommonConst.Coins.Coin4].Count
      end
      if r0_33 < r0_32.CurrentCount * r0_32.UnitPrice - r5_32 then
        UIManager(r0_32):ShowCommonPopupUI(100137, {
          Title = GText("UI_COMMONPOP_TITLE_100137"),
          ShortText = GText("UI_COMMONPOP_TEXT_100137"),
          LeftCallbackObj = r0_32,
          RightCallbackObj = r0_32,
          RightCallbackFunction = function()
            -- line: [825, 831] id: 34
            r0_32:CloseSelf()
            UIManager(r0_32):GetUIObj(DataMgr.Shop.Shop.ShopUIName):InitShop(110, nil, nil, "Shop", nil, nil)
          end,
        }, r0_32)
      else
        ShopUtils:SendExchangeRequest(r0_32.ShopItemData.ItemId, r0_32.CurrentCount)
      end
    end
    local r8_32 = {}
    local r9_32 = r3_32.Resources[CommonConst.Coins.Coin4]
    if r9_32 then
      r9_32 = r3_32.Resources[CommonConst.Coins.Coin4].Count and 0
    else
      goto label_245	-- block#27 is visited secondly
    end
    table.insert(r8_32, {
      ItemId = CommonConst.Coins.Coin4,
      ItemType = CommonConst.ItemType.Resource,
      ItemNum = r9_32,
      ItemNeed = r0_32.CurrentCount * r0_32.UnitPrice - r5_32,
    })
    UIManager(r0_32):ShowCommonPopupUI(r2_32, {
      RightCallbackFunction = r7_32,
      ItemList = r8_32,
      ShortText = r6_32,
    })
    return 
    -- close: r2_32
  elseif r0_32.ShopItemData.PurchaseFailRes == 5 then
    r3_32 = r0_32
    HeroUSDKSubsystem(r3_32):UploadTrackLog_Lua("shop_confirmpage", r1_32)
    local function r2_32(r0_35)
      -- line: [858, 864] id: 35
      r0_35:CloseSelf()
      UIManager(r0_35):GetUIObj(DataMgr.Shop.Shop.ShopUIName):InitShop(110, nil, nil, "Shop", nil, nil)
    end
    r3_32 = nil
    if r0_32.ShopItemData.PriceType == CommonConst.Coins.Coin1 then
      r3_32 = 100137
    elseif r0_32.ShopItemData.PriceType == CommonConst.Coins.Coin4 then
      r3_32 = 100263
    end
    if not r3_32 then
      return 
    end
    UIManager(r0_32):ShowCommonPopupUI(r3_32, {
      LeftCallbackObj = r0_32,
      RightCallbackObj = r0_32,
      RightCallbackFunction = r2_32,
    }, r0_32)
    return 
  end
  local r2_32 = ShopUtils:GetShopItemPurchaseLimit(r0_32.ShopItemData.ItemId)
  r3_32 = nil
  if r0_32.ShopItemData.ItemType == "CharAccessory" or r0_32.ShopItemData.ItemType == "WeaponAccessory" or r0_32.ShopItemData.ItemType == "Skin" or r0_32.ShopItemData.ItemType == "WeaponSkin" or r0_32.ShopItemData.ItemType == "Resource" then
    if r2_32 == 0 then
      r3_32 = 100042
    else
      r1_32.status = 1
      r3_32 = 100041
    end
  end
  if not r3_32 then
    return 
  end
  local r4_32 = {
    [1] = {},
  }
  r4_32[1].FundId = r0_32.ShopItemData.PriceType
  r4_32[1].FundNeed = ShopUtils:GetShopItemPrice(r0_32.ShopItemData.ItemId)
  HeroUSDKSubsystem(r0_32):UploadTrackLog_Lua("shop_confirmpage", r1_32)
  UIManager(r0_32):ShowCommonPopupUI(r3_32, {
    ShopItemData = r0_32.ShopItemData,
    ShopType = 0,
    Funds = r4_32,
    ShowParentTabCoin = true,
    SingleItemNotInteractive = true,
    LeftCallbackObj = r0_32,
    LeftCallbackFunction = function()
      -- line: [909, 914] id: 36
      local r0_36 = UIManager(r0_32):GetUIObj("SkinPreview")
      if r0_36 then
        r0_36:SetFocus()
      end
    end,
    RightCallbackObj = r0_32,
    RightCallbackFunction = function()
      -- line: [916, 920] id: 37
      r0_32:PurchaseShopItem()
    end,
    ForbiddenRightCallbackObj = r0_32,
    ForbiddenRightCallbackFunction = function(r0_38, r1_38)
      -- line: [922, 924] id: 38
      r1_38.Content_1.CallFunc(r1_38.Content_1.CallObj)
    end,
    DontFocusParentWidget = true,
    CloseBtnCallbackObj = r0_32,
    CloseBtnCallbackFunction = function()
      -- line: [927, 932] id: 39
      local r0_39 = UIManager(r0_32):GetUIObj("SkinPreview")
      if r0_39 then
        r0_39:SetFocus()
      end
    end,
    ForbidRightBtn = not r0_32.canPurchase,
  }, r0_32)
end
function r0_0.PurchaseShopItem(r0_40)
  -- line: [937, 992] id: 40
  local r1_40 = GWorld:GetAvatar()
  if not r1_40 then
    return 
  end
  if DataMgr.ShopItem2PayGoods[r0_40.ShopItemData.ItemId] then
    local r2_40 = GWorld:GetAvatar()
    if not r2_40 then
      return false
    end
    if not HeroUSDKSubsystem():IsHeroSDKEnable() then
      require("BluePrints.UI.GMInterface.GMFunctionLibrary").ExecConsoleCommand(r0_40:GetGameInstance(), "sgm pgi " .. DataMgr.ShopItem2PayGoods[r0_40.ShopItemData.ItemId])
      return 
    end
    r2_40:RequestPay(DataMgr.ShopItem2PayGoods[r0_40.ShopItemData.ItemId], function(r0_41, r1_41, r2_41)
      -- line: [952, 975] id: 41
      if not ErrorCode:Check(r0_41) then
        return 
      end
      local r3_41 = FHeroUPaymentParameters()
      r3_41.goodsId = DataMgr.ShopItem2PayGoods[r0_40.ShopItemData.ItemId]
      r3_41.cpOrder = r1_41
      r3_41.callbackUrl = r2_41
      local r4_41 = r2_0.GenHeroHDCGameRoleInfo()
      local r5_41 = ""
      HeroUSDKSubsystem():HeroSDKPay(r3_41, r4_41, GText(ItemUtils:GetDropName(r0_40.ShopItemData.TypeId, r0_40.ShopItemData.ItemType)))
      local r6_41 = {
        product_id = DataMgr.ShopItem2PayGoods[r0_40.ShopItemData.ItemId],
      }
      if r0_40.ShopItemData.ItemId then
        r6_41.item_id = r0_40.ShopItemData.ItemId
        r6_41.product_type = DataMgr.ShopItem[r0_40.ShopItemData.ItemId].ItemType
      end
      r6_41.game_order_id = r1_41
      r6_41.order_create_time = TimeUtils.NowTime()
      HeroUSDKSubsystem(r0_40):UploadTrackLog_Lua("charge_client", r6_41)
    end)
    return 
  end
  if r0_40.ShopItemData.PurchaseFailRes ~= 0 then
    if r0_40.ShopItemData.PurchaseFailRes == 1 then
      UIManager(GWorld.GameInstance):ShowError(ErrorCode.RET_SHOPITEM_REMAIN_PURCHASE_TIMES_EQUAL_ZERO, 1, "CommonToastMain")
    elseif r0_40.ShopItemData.PurchaseFailRes == 2 then
      UIManager(r0_40):ShowUITip("CommonToastMain", string.format(GText("UI_Shop_Toast_No_Coin"), GText(DataMgr.Resource[r0_40.ShopItemData.PriceType].ResourceName)), 1)
    elseif r0_40.ShopItemData.PurchaseFailRes == 3 then
      UIManager(r0_40):ShowUITip("CommonToastMain", string.format(GText("UI_Shop_Toast_Locked"), r0_40.ShopItemData.UnlockLevel), 1)
    elseif r0_40.ShopItemData.PurchaseFailRes == 6 then
      UIManager(GWorld.GameInstance):ShowError(ErrorCode.RET_SHOPITEM_UNIQUE_ALREDAY_OWNED, 1, "CommonToastMain")
    end
    return 
  end
  r0_40:BlockAllUIInput(true)
  r1_40:PurchaseShopItem(r0_40.ShopItemData.ItemId, 1)
end
function r0_0.RefreshPurchaseState(r0_42)
  -- line: [994, 1001] id: 42
  if ShopUtils:GetShopItemPurchaseLimit(r0_42.ShopItemData.ItemId) == 0 then
    r0_42.Panel_Buy:SetVisibility(ESlateVisibility.Collapsed)
    r0_42.WidgetSwitcher_BtnState:SetActiveWidgetIndex(1)
    r0_42.Text_Desc:SetText(GText("UI_SHOP_ALREADYOWNED"))
    r0_42.bForbiddenButton = true
  end
end
function r0_0.CloseSelf(r0_43)
  -- line: [1004, 1013] id: 43
  if r0_43:IsAnimationPlaying(r0_43.Out) then
    return 
  end
  r0_43:StopAnimation(r0_43.In)
  r0_43:PlayAnimation(r0_43.Out)
  AudioManager(r0_43):SetEventSoundParam(r0_43, "SkinPreviewIn", {
    ToEnd = 1,
  })
  r0_43:ClosePreview()
end
function r0_0.OnKeyDown(r0_44, r1_44, r2_44)
  -- line: [1016, 1031] id: 44
  local r4_44 = UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_44))
  local r5_44 = r0_44.KeyDownEvents[r4_44]
  if r5_44 then
    local r6_44, r7_44 = r5_44(r0_44)
    if r7_44 then
      return r6_44
    end
  elseif not r0_44.bSelfHidden then
    r0_44.Tab_Skin:Handle_KeyEventOnGamePad(r4_44)
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end
function r0_0.OnRepeatKeyDown(r0_45, r1_45, r2_45)
  -- line: [1033, 1044] id: 45
  local r5_45 = r0_45.RepeatKeyDownEvents[UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_45))]
  if r5_45 then
    local r6_45, r7_45 = r5_45(r0_45)
    if r7_45 then
      return r6_45
    end
  end
  return UIUtils.Unhandled
end
function r0_0.On_Image_Click_MouseButtonDown(r0_46, r1_46, r2_46)
  -- line: [1048, 1050] id: 46
  return r0_46:OnPointerDown(r1_46, r2_46)
end
function r0_0.OnMouseWheel(r0_47, r1_47, r2_47)
  -- line: [1052, 1054] id: 47
  return r0_47:OnMouseWheelScroll(r1_47, r2_47)
end
function r0_0.OnMouseButtonUp(r0_48, r1_48, r2_48)
  -- line: [1056, 1058] id: 48
  return r0_48:OnPointerUp(r1_48, r2_48)
end
function r0_0.OnMouseMove(r0_49, r1_49, r2_49)
  -- line: [1060, 1062] id: 49
  return r0_49:OnPointerMove(r1_49, r2_49)
end
function r0_0.OnTouchEnded(r0_50, r1_50, r2_50)
  -- line: [1064, 1066] id: 50
  return r0_50:OnPointerUp(r1_50, r2_50)
end
function r0_0.OnTouchMoved(r0_51, r1_51, r2_51)
  -- line: [1068, 1070] id: 51
  return r0_51:OnPointerMove(r1_51, r2_51)
end
function r0_0.OnCameraScrollBackwardKeyDown(r0_52)
  -- line: [1072, 1074] id: 52
  r0_52:ScrollCamera(1)
end
function r0_0.OnCameraScrollForwardKeyDown(r0_53)
  -- line: [1076, 1078] id: 53
  r0_53:ScrollCamera(-1)
end
function r0_0.OnAnalogValueChanged(r0_54, r1_54, r2_54)
  -- line: [1080, 1091] id: 54
  if UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_54)) == "Gamepad_RightX" then
    if r0_54.ActorController then
      r0_54.ActorController:OnDragging({
        X = UKismetInputLibrary.GetAnalogValue(r2_54) * 10,
      })
    end
    return UIUtils.Handled
  end
  return UIUtils.Unhandled
end
function r0_0.OnMouseCaptureLost(r0_55)
  -- line: [1093, 1095] id: 55
  r0_55:OnPointerCaptureLost()
end
function r0_0.OnBackgroundClicked(r0_56)
  -- line: [1097, 1101] id: 56
  if r0_56.bSelfHidden then
    r0_56:OnHideUIKeyDown()
  end
end
function r0_0.OnAnimationFinished(r0_57, r1_57)
  -- line: [1106, 1114] id: 57
  if r1_57 == r0_57.Out then
    r0_0.Super.Close(r0_57)
    r0_57:RefreshShopUI()
  elseif r1_57 == r0_57.In or r1_57 == r0_57.Change then
    r0_57:BlockAllUIInput(false)
  end
end
function r0_0.RefreshShopUI(r0_58)
  -- line: [1117, 1139] id: 58
  local r1_58 = UIManager(r0_58):GetLastJumpPage()
  if r1_58 then
    if r1_58.RefreshSubTabData then
      r1_58:RefreshSubTabData(r1_58.CurSubTabMap, true, true)
    elseif r1_58.UpdateShopDetail then
      r1_58:UpdateShopDetail(r1_58.CurSubTabMap)
    end
    return 
  end
  local r2_58 = UIManager(GWorld.GameInstance):GetUIObj("ShopMain")
  if r2_58 then
    r2_58:RefreshSubTabData(r2_58.CurSubTabMap, true, true)
  end
  local r3_58 = UIManager(GWorld.GameInstance):GetUIObj("ShopActivity")
  if r3_58 then
    r3_58:RefreshSubTabData(r3_58.CurSubTabMap, true, true)
  end
  local r4_58 = UIManager(GWorld.GameInstance):GetUIObj("ActivityShop")
  if r4_58 then
    r4_58:UpdateShopDetail(r4_58.CurSubTabMap)
  end
end
function r0_0.OnUpdateUIStyleByInputTypeChange(r0_59, r1_59, r2_59)
  -- line: [1142, 1185] id: 59
  r0_0.Super.OnUpdateUIStyleByInputTypeChange(r0_59, r1_59, r2_59)
end
function r0_0.GetSkinIndex(r0_60, r1_60)
  -- line: [1189, 1194] id: 60
  local r2_60 = r0_60.ShopSkin2Index[r1_60]
  local r3_60 = r2_60 == 1
  return r2_60, r3_60, r2_60 == r0_60.SkinCount
end
function r0_0.GetSkinInfo(r0_61, r1_61)
  -- line: [1196, 1212] id: 61
  if r0_61.SkinList then
    local r2_61 = r0_61.SkinList[r1_61]
    return {
      ItemType = r0_61.ShopItemData.ItemType,
      TypeId = r2_61,
      ItemId = r2_61,
    }
  end
  local r2_61 = r0_61.Index2ShopSkin[r1_61]
  local r3_61 = nil
  if r2_61 and DataMgr.ShopItem[r2_61] then
    r3_61 = setmetatable({}, {
      __index = DataMgr.ShopItem[r2_61],
    })
  end
  return r3_61
end
function r0_0.HideZoomKey(r0_62, r1_62)
  -- line: [1214, 1215] id: 62
end
function r0_0.HideReplayKey(r0_63, r1_63)
  -- line: [1217, 1218] id: 63
end
function r0_0.UpdateSkinNameFontByRarity(r0_64, r1_64)
  -- line: [1220, 1232] id: 64
  local r3_64 = ({
    [6] = r0_64.Font_Red,
    [5] = r0_64.Font_Gold,
    [4] = r0_64.Font_Purple,
    [3] = r0_64.Font_Blue,
  })[r1_64]
  if r3_64 then
    r0_64.Text_SkinName:SetFont(r3_64)
  end
end
function r0_0.GetCutoffInfo(r0_65, r1_65)
  -- line: [1234, 1242] id: 65
  if not r1_65 then
    return nil
  end
  for r6_65, r7_65 in pairs(DataMgr.Cutoff and {}) do
    if r7_65.ItemId and r7_65.ItemId == r1_65 then
      return CommonUtils.DeepCopy(r7_65)
    end
  end
  -- close: r2_65
  return nil
end
AssembleComponents(r0_0)
return r0_0
