-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Armory\WBP_Armory_Skin_Base_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local r1_0 = require("BluePrints.UI.WBP.Armory.ActorController.Armory_ActorController")
local r2_0 = Class("BluePrints.UI.BP_UIState_C")
r2_0._components = {
  "BluePrints.UI.WBP.Armory.MainComponent.Armory_PointerInputComponent",
  "BluePrints.UI.WBP.Armory.MainComponent.Armory_ReddotTree_Component",
  "BluePrints.UI.WBP.Armory.ActorController.PreviewActorComponent"
}
local r3_0 = {
  CanGoToShop = "CanGoToShop",
  ItemIdNil = "ItemIdNil",
  ItemNotExist = "ItemNotExist",
  ItemNotOnSale = "ItemNotOnSale",
  SkinNotValid = "SkinNotValid",
}
function r2_0.Construct(r0_1)
  -- line: [27, 102] id: 1
  r2_0.Super.Construct(r0_1)
  r0_1:UnbindAllFromAnimationFinished(r0_1.In)
  r0_1:UnbindAllFromAnimationFinished(r0_1.Out)
  r0_1:BindToAnimationFinished(r0_1.In, {
    r0_1,
    r0_1.OnInAnimFinished
  })
  r0_1:BindToAnimationFinished(r0_1.Out, {
    r0_1,
    r0_1.OnOutAnimFinished
  })
  r0_1.Image_Click.OnMouseButtonDownEvent:Unbind()
  r0_1.Image_Click.OnMouseButtonDownEvent:Bind(r0_1, r0_1.On_Image_Click_MouseButtonDown)
  r0_1:AddDispatcher(EventID.OnCharAccessorySetted, r0_1, r0_1.OnCharAccessoryChanged)
  r0_1:AddDispatcher(EventID.OnCharAccessoryRemoved, r0_1, r0_1.OnCharAccessoryChanged)
  r0_1:AddDispatcher(EventID.OnCharAppearanceChanged, r0_1, r0_1.OnCharAppearanceChanged)
  r0_1:AddDispatcher(EventID.OnCharShowPartMesh, r0_1, r0_1.OnCharShowPartMesh)
  r0_1:AddDispatcher(EventID.OnCharCornerVisibilityChanged, r0_1, r0_1.OnCharCornerVisibilityChanged)
  r0_1:AddDispatcher(EventID.OnCharSkinChanged, r0_1, r0_1.OnCharSkinChanged)
  r0_1:AddDispatcher(EventID.OnNewCharSkinObtained, r0_1, r0_1.OnNewCharSkinObtained)
  r0_1:AddDispatcher(EventID.OnNewCharAccessoryObtained, r0_1, r0_1.OnNewCharAccessoryObtained)
  r0_1:AddDispatcher(EventID.OnWeaponAccessoryChanged, r0_1, r0_1.OnWeaponAccessoryChanged)
  r0_1:AddDispatcher(EventID.OnWeaponSkinChanged, r0_1, r0_1.OnWeaponSkinChanged)
  r0_1:AddDispatcher(EventID.OnPurchaseShopItem, r0_1, r0_1.OnPurchaseShopItem)
  r0_1:AddDispatcher(EventID.OnWeaponColorsChanged, r0_1, r0_1.OnWeaponColorsChanged)
  r0_1:AddDispatcher(EventID.OnNewWeaponSkinObtained, r0_1, r0_1.OnNewWeaponSkinObtained)
  r0_1:AddDispatcher(EventID.OnNewWeaponAccessoryObtained, r0_1, r0_1.OnNewWeaponAccessoryObtained)
  r0_1.List_Accessory.BP_OnItemClicked:Clear()
  r0_1.List_Accessory.BP_OnItemClicked:Add(r0_1, r0_1.OnAccessoryItemClicked)
  r0_1.List_Accessory.OnCreateEmptyContent:Bind(r0_1, function(r0_2)
    -- line: [59, 61] id: 2
    return NewObject(UIUtils.GetCommonItemContentClass())
  end)
  r0_1.List_Skin.OnCreateEmptyContent:Bind(r0_1, function(r0_3)
    -- line: [63, 67] id: 3
    local r1_3 = NewObject(UIUtils.GetCommonItemContentClass())
    rawset(r1_3, "IsEmpty", true)
    return r1_3
  end)
  rawset(r0_1, "BtnWidgetState", {
    Unequipped = 0,
    Equipped = 1,
    Locked = 2,
  })
  rawset(r0_1, "SkinTabIdx", 1)
  rawset(r0_1, "AccessoryTabIdx", 2)
  rawset(r0_1, "TopTabs", {
    {
      Text = GText(DataMgr.AppearanceTab[r0_1.SkinTabIdx].Text),
      IconPath = DataMgr.AppearanceTab[r0_1.SkinTabIdx].IconPath,
    },
    {
      Text = GText(DataMgr.AppearanceTab[r0_1.AccessoryTabIdx].Text),
      IconPath = DataMgr.AppearanceTab[r0_1.AccessoryTabIdx].IconPath,
    }
  })
  rawset(r0_1, "TabConfig", {
    TitleName = GText("UI_Armory_Appearance"),
    LeftKey = r0_1.TabLeftKey,
    RightKey = r0_1.TabRightKey,
    Tabs = r0_1.TopTabs,
    StyleName = r0_1.TabStyleName,
    DynamicNode = {
      "Back",
      "ResourceBar",
      "BottomKey"
    },
    BottomKeyInfo = {},
    BackCallback = r0_1.OnBackKeyDown,
    OwnerPanel = r0_1,
  })
  rawset(r0_1, "NoneAccessoryId", DataMgr.GlobalConstant.EmptyCharAccessoryID.ConstantValue)
  r0_1.Btn_Dye:BindEventOnClicked(r0_1, r0_1.OnDyeBtnClicked)
end
function r2_0.AddTopTabReddotListen(r0_4)
  -- line: [104, 158] id: 4
  if r0_4.NoReddot then
    return 
  end
  local function r1_4(r0_5, r1_5)
    -- line: [109, 115] id: 5
    local r2_5 = r0_4.TopTabs[r0_5]
    r2_5.IsNew = r1_5
    if IsValid(r2_5.UI) then
      r2_5.UI:SetReddot(r2_5.IsNew)
    end
  end
  if r0_4.Type == CommonConst.ArmoryType.Char then
    r0_4:AddCharAppearanceReddotListen(function()
      -- line: [117, 139] id: 6
      local r1_6 = ReddotManager.GetTreeNode(CommonConst.DataType.Char .. CommonConst.DataType.Skin .. r0_4.Target.CharId)
      local r2_6 = nil	-- notice: implicit variable refs by block#[17]
      if r1_6 then
        r2_6 = r1_6.Count
        if not r2_6 then
          ::label_18::
          r2_6 = 0
        end
      else
        goto label_18	-- block#2 is visited secondly
      end
      local r4_6 = GWorld:GetAvatar().CommonChars[r0_4.Target.CharId]
      if not r4_6 then
        return 
      end
      local r5_6 = 0
      for r10_6, r11_6 in pairs(CommonConst.CharAccessoryTypes) do
        local r12_6 = CommonConst.DataType.CharAccessory .. r11_6
        local r13_6 = ReddotManager.GetTreeNode(r12_6)
        local r14_6 = nil	-- notice: implicit variable refs by block#[9]
        if r13_6 then
          r14_6 = r13_6.Count
          if not r14_6 then
            ::label_49::
            r14_6 = 0
          end
        else
          goto label_49	-- block#8 is visited secondly
        end
        r5_6 = r5_6 + r14_6
        r14_6 = pairs
        for r18_6, r19_6 in r14_6(r4_6.OwnedSkins) do
          r12_6 = r12_6 .. r19_6.SkinId
          local r20_6 = ReddotManager.GetTreeNode(r12_6)
          r13_6 = r20_6
          if r13_6 then
            r20_6 = r13_6.Count and 0
          else
            goto label_70	-- block#12 is visited secondly
          end
          r5_6 = r5_6 + r20_6
        end
        -- close: r14_6
      end
      -- close: r6_6
      r1_4(1, r2_6 > 0)
      r1_4(2, r5_6 > 0)
    end, r0_4.Target.CharId)
  else
    r0_4:AddWeaponAppearanceReddotListen(function()
      -- line: [141, 156] id: 7
      local r0_7 = 0
      local r1_7 = DataMgr.Weapon[r0_4.Target.WeaponId]
      local r3_7 = nil	-- notice: implicit variable refs by block#[17]
      if r1_7 and r1_7.SkinApplicationType then
        r3_7 = r1_7.SkinApplicationType
        for r6_7, r7_7 in pairs(r3_7) do
          local r9_7 = ReddotManager.GetTreeNode(CommonConst.DataType.WeaponSkin .. (r7_7 and ""))
          local r10_7 = nil	-- notice: implicit variable refs by block#[8]
          if r9_7 then
            r10_7 = r9_7.Count
            if not r10_7 then
              ::label_31::
              r10_7 = 0
            end
          else
            goto label_31	-- block#7 is visited secondly
          end
          r0_7 = r0_7 + r10_7
        end
        -- close: r2_7
      end
      local r2_7 = ReddotManager.GetTreeNode(CommonConst.DataType.WeaponAccessory)
      if r2_7 then
        r3_7 = r2_7.Count
        if not r3_7 then
          ::label_48::
          r3_7 = 0
        end
      else
        goto label_48	-- block#13 is visited secondly
      end
      r1_4(1, r0_7 > 0)
      r1_4(2, r3_7 > 0)
    end, r0_4.Target.WeaponId)
  end
end
function r2_0.OnNewCharSkinObtained(r0_8, r1_8, r2_8)
  -- line: [160, 162] id: 8
  r0_8:OnNewSkinObtained(r1_8)
end
function r2_0.OnNewCharAccessoryObtained(r0_9, r1_9)
  -- line: [164, 168] id: 9
  r0_9:AddTimer(0.01, function()
    -- line: [165, 167] id: 10
    r0_9:OnNewAccessoryObtained(r1_9)
  end)
end
function r2_0.OnNewAccessoryObtained(r0_11, r1_11)
  -- line: [170, 202] id: 11
  if not r0_11.Map_AccessoryContents then
    return 
  end
  local r2_11 = r0_11.Map_AccessoryContents[r1_11]
  if not r2_11 then
    return 
  end
  r2_11.IsHide = nil
  if r0_11.NoReddot then
    r2_11.RedDotType = nil
  else
    r2_11.RedDotType = UIConst.RedDotType.NewRedDot
  end
  r2_11.LockType = nil
  if r2_11.SelfWidget then
    r2_11.SelfWidget:SetRedDot(r2_11.RedDotType)
    r2_11.SelfWidget:SetLock(r2_11.LockType)
  end
  if r0_11.CurrentTopTabIdx ~= r0_11.AccessoryTabIdx then
    return 
  end
  if r2_11 == r0_11.ComparedContent then
    r0_11:UpdateAccessoryDetails(r0_11.ComparedContent)
  end
  if r0_11.Type == CommonConst.ArmoryType.Char then
    r0_11:CheckCharAccessoryContentReddot(r1_11)
    r0_11:InitCharAccessoryList()
  else
    r0_11:CheckWeaponAccessoryContentReddot(r1_11)
    r0_11:InitWeaponAccessoryList()
  end
end
function r2_0.OnNewWeaponAccessoryObtained(r0_12, r1_12)
  -- line: [204, 208] id: 12
  r0_12:AddTimer(0.1, function()
    -- line: [205, 207] id: 13
    r0_12:OnNewAccessoryObtained(r1_12)
  end)
end
function r2_0.OnNewWeaponSkinObtained(r0_14, r1_14)
  -- line: [210, 214] id: 14
  r0_14:AddTimer(0.1, function()
    -- line: [211, 213] id: 15
    r0_14:OnNewSkinObtained(r1_14)
  end)
end
function r2_0.OnNewSkinObtained(r0_16, r1_16)
  -- line: [216, 235] id: 16
  if not r0_16.SkinMap then
    return 
  end
  local r2_16 = r0_16.SkinMap[r1_16]
  if r2_16 then
    r2_16.LockType = nil
    if not r0_16.NoReddot then
      r2_16.IsNew = true
    end
    if r2_16.Widget then
      r2_16.Widget.LockType = r2_16.LockType
      r2_16.Widget:SetReddot(r2_16.IsNew)
      r2_16.Widget:InitTextStyle()
    end
    if r0_16.SelectedSkinId == r1_16 and r0_16.CurrentTopTabIdx == r0_16.SkinTabIdx then
      r0_16:UpdateSkinDetails(r2_16)
    end
  end
end
function r2_0.RemoveTopTabReddotListen(r0_17)
  -- line: [237, 243] id: 17
  if r0_17.NoReddot then
    return 
  end
  r0_17:RemoveCharAppearanceReddotListen()
  r0_17:RemoveWeaponAppearanceReddotListen()
end
function r2_0.On_Image_Click_MouseButtonDown(r0_18, r1_18, r2_18)
  -- line: [246, 248] id: 18
  return r0_18:OnPointerDown(r1_18, r2_18)
end
function r2_0.OnMouseWheel(r0_19, r1_19, r2_19)
  -- line: [250, 252] id: 19
  return r0_19:OnMouseWheelScroll(r1_19, r2_19)
end
function r2_0.OnMouseButtonUp(r0_20, r1_20, r2_20)
  -- line: [254, 256] id: 20
  return r0_20:OnPointerUp(r1_20, r2_20)
end
function r2_0.OnMouseMove(r0_21, r1_21, r2_21)
  -- line: [258, 260] id: 21
  return r0_21:OnPointerMove(r1_21, r2_21)
end
function r2_0.OnTouchEnded(r0_22, r1_22, r2_22)
  -- line: [262, 264] id: 22
  return r0_22:OnPointerUp(r1_22, r2_22)
end
function r2_0.OnTouchMoved(r0_23, r1_23, r2_23)
  -- line: [266, 268] id: 23
  return r0_23:OnPointerMove(r1_23, r2_23)
end
function r2_0.OnMouseCaptureLost(r0_24)
  -- line: [270, 272] id: 24
  r0_24:OnPointerCaptureLost()
end
function r2_0.OnBackgroundClicked(r0_25)
  -- line: [274, 278] id: 25
  if r0_25.bSelfHidden then
    r0_25:OnHideUIKeyDown()
  end
end
function r2_0.OnBackKeyDown(r0_26)
  -- line: [280, 298] id: 26
  if r0_26.bSelfHidden then
    return r0_26:OnHideUIKeyDown()
  else
    if r0_26.CurrentTopTabIdx ~= r0_26.SkinTabIdx and r0_26.IsAccessoryContentsCreated then
      r0_26:RecoverAccessory()
    end
    if r0_26.OpenPreviewDyeFromChat then
      if r0_26.ActorController then
        r0_26.ActorController:OnClosed()
      end
      r0_26:Close()
    else
      r0_26:PlayOutAnim()
    end
  end
end
function r2_0.OnConfirmBtnClicked(r0_27)
  -- line: [300, 323] id: 27
  if r0_27.CurrentTopTabIdx == r0_27.SkinTabIdx then
    AudioManager(r0_27):PlayUISound(nil, "event:/ui/common/click_btn_confirm", nil, nil)
  else
    AudioManager(r0_27):PlayUISound(nil, "event:/ui/common/role_replace", nil, nil)
  end
  if r0_27.Type == CommonConst.ArmoryType.Char then
    if r0_27.CurrentTopTabIdx == r0_27.SkinTabIdx and not r0_27.CurrentLockContent then
      r0_27:OnCharSkinConfirmBtnClicked()
    elseif r0_27.CurrentTopTabIdx == r0_27.SkinTabIdx and r0_27.CurrentLockContent then
      r0_27:OnCharSkinGoToShopBtnClicked()
    else
      r0_27:OnCharAccessoryConfirmBtnClicked()
    end
  elseif r0_27.CurrentTopTabIdx == r0_27.SkinTabIdx and not r0_27.CurrentLockContent then
    r0_27:OnWeaponSkinConfirmBtnClicked()
  elseif r0_27.CurrentTopTabIdx == r0_27.SkinTabIdx and r0_27.CurrentLockContent then
    r0_27:OnWeaponSkinGoToShopBtnClicked()
  else
    r0_27:OnWeaponAccessoryConfirmBtnClicked()
  end
end
function r2_0.OnSkinItemClicked(r0_28, r1_28)
  -- line: [325, 331] id: 28
  if r1_28 == r0_28.SkinMap[r0_28.SelectedSkinId] then
    return 
  end
  r0_28:SelectSkinByContent(r1_28)
end
function r2_0.OnSkinListSelectionChanged(r0_29, r1_29, r2_29)
  -- line: [333, 334] id: 29
end
function r2_0.OnDyeBtnClicked(r0_30)
  -- line: [336, 341] id: 30
  local r1_30 = r0_30.SkinMap[r0_30.SelectedSkinId]
  if not r0_30.IsTargetUnowned and r1_30.bDyeable and not r1_30.LockType then
    r0_30:OpenDye()
  end
end
function r2_0.InitUIInfo(r0_31, r1_31, r2_31, r3_31, r4_31)
  -- line: [345, 378] id: 31
  r2_0.Super.InitUIInfo(r0_31, r1_31, r2_31, r3_31, r4_31)
  AudioManager(r0_31):PlayUISound(r0_31, "event:/ui/armory/open", "SkinOpen", nil)
  if not r4_31 then
    r4_31 = {}
  end
  r0_31.Params = r4_31
  r0_31.SelectedSkinId = nil
  r0_31.Target = r4_31.Target
  r0_31.Type = r4_31.Type
  r0_31.OnCloseCallback = r4_31.OnCloseCallback
  r0_31.Parent = r4_31.Parent
  r0_31.IsTargetUnowned = r4_31.IsTargetUnowned
  r0_31.IsCharacterTrialMode = r4_31.IsCharacterTrialMode
  r0_31.IsPreviewMode = r4_31.IsPreviewMode
  r0_31.NoReddot = r0_31.IsPreviewMode and r0_31.IsCharacterTrialMode and r0_31.IsTargetUnowned
  r0_31.OpenPreviewDyeFromChat = r4_31.OpenPreviewDyeFromChat
  r0_31.OpenPreviewDyeFromShopItem = r4_31.OpenPreviewDyeFromShopItem
  r0_31.OpenPreviewDyeFromChatColors = r4_31.Colors
  if r0_31.Parent and r0_31.Parent.ActorController then
    r0_31.ActorController = r0_31.Parent.ActorController
  end
  r0_31.UIName = r0_31:GetUIConfigName()
  if not r0_31.ActorController then
    r0_31.InAnimStyle = 1
  end
  if not r0_31.InAnimStyle then
    r0_31:Init(r4_31)
  end
  r0_31:PlayInAnim()
end
function r2_0.Init(r0_32, r1_32)
  -- line: [380, 438] id: 32
  if not r0_32.ActorController then
    r0_32.IsPreviewMode = true
    r0_32.Target = r0_32:CreatePreviewTargetData(r1_32)
    r1_32.Target = r0_32.Target
    r1_32.EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon
    r1_32.ViewUI = r0_32
    r0_32.ActorController = r0_32:CreatePreviewActor(r1_32)
    r0_32.ActorController:OnOpened()
    r0_32.TabConfig.Tabs = nil
    r0_32.TabConfig.LeftKey = nil
    r0_32.TabConfig.RightKey = nil
  end
  if r0_32.IsPreviewMode or r0_32.IsCharacterTrialMode then
    r0_32.TabConfig.DynamicNode = {
      "Back",
      "BottomKey"
    }
  end
  if r0_32.IsPreviewMode then
    r0_32.WidgetSwitcher_BtnState:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_32.WidgetSwitcher_State:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    r0_32.WidgetSwitcher_BtnState:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r0_32.WidgetSwitcher_State:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  r0_32.IsSkinWidgetNotReady = true
  r0_32.Tab_Skin:Init(r0_32.TabConfig)
  r0_32.AppearanceSutiIndex = r0_32.Target.CurrentAppearanceIndex
  r0_32.SelectedSkinId = r0_32.Target:GetAppearance(r0_32.AppearanceSutiIndex).SkinId
  r0_32.JumpToCharAccessoryType = r1_32.AccessoryType
  r0_32.Tab_Skin:BindEventOnTabSelected(nil, nil)
  if r1_32.AccessoryId or r1_32.AccessoryType then
    r0_32.JumpToAccessoryId = r1_32.AccessoryId
    r0_32.Tab_Skin:SelectTab(r0_32.AccessoryTabIdx)
    r0_32:OnTopTabSelected({
      Idx = r0_32.AccessoryTabIdx,
    })
  else
    r0_32.JumpToSkinId = r1_32.SkinId
    r0_32.Tab_Skin:SelectTab(r0_32.SkinTabIdx)
    r0_32:OnTopTabSelected({
      Idx = r0_32.SkinTabIdx,
    })
  end
  r0_32.Tab_Skin:BindEventOnTabSelected(r0_32, r0_32.OnTopTabSelected)
  r0_32:AddTopTabReddotListen()
  if r0_32.OpenPreviewDyeFromChat then
    r0_32:BlockAllUIInput(true)
    r0_32:AddTimer(0.1, function()
      -- line: [427, 431] id: 33
      if not r0_32 then
        return 
      end
      r0_32:StopAllAnimations()
      r0_32:OpenDye()
    end, false, 0, "OpenDye")
    r0_32:AddTimer(0.2, function()
      -- line: [432, 435] id: 34
      if not r0_32 then
        return 
      end
      r0_32:BlockAllUIInput(false)
    end, false, 0, "UnBlockAllUIInput")
  end
  r0_32:OnInited()
end
function r2_0.OnInited(r0_35)
  -- line: [440, 441] id: 35
end
function r2_0.OnLoaded(r0_36, ...)
  -- line: [443, 445] id: 36
  r2_0.Super.OnLoaded(r0_36, ...)
end
function r2_0.OnTopTabSelected(r0_37, r1_37, r2_37)
  -- line: [447, 476] id: 37
  r0_37.CurrentTopTabIdx = r1_37.Idx
  if r0_37.ActorController then
    r0_37.ActorController:UpdateCameraPPSetting()
  end
  if r0_37.Type == CommonConst.ArmoryType.Char then
    if r0_37.CurrentTopTabIdx == r0_37.SkinTabIdx then
      if r0_37.IsAccessoryContentsCreated then
        r0_37:RecoverAccessory()
      end
      r0_37:InitCharSkin()
    else
      if r0_37.ActorController then
        r0_37.ActorController:UpdateCameraPPSetting({
          IsAccessoryPPSetting = true,
        })
      end
      r0_37.Tab_Accessory:SetVisibility(UIConst.VisibilityOp.Visible)
      r0_37:InitCharAccessory()
    end
  elseif r0_37.CurrentTopTabIdx == r0_37.SkinTabIdx then
    if r0_37.IsAccessoryContentsCreated then
      r0_37:RecoverAccessory()
    end
    r0_37:InitWeaponSkin()
  else
    r0_37.Tab_Accessory:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_37:InitWeaponAccessory()
  end
end
function r2_0.InitSkinList(r0_38)
  -- line: [481, 492] id: 38
  if r0_38.SkinArray == nil then
    return 
  end
  r0_38.List_Skin:ClearListItems()
  for r5_38, r6_38 in ipairs(r0_38.SkinArray) do
    rawset(r6_38, "Idx", r5_38)
    rawset(r6_38, "IsCurrentUse", r0_38.SkinArray[r5_38].SkinId == r0_38.CurrentSkinContent.SkinId)
    r0_38.List_Skin:AddItem(r6_38)
  end
  -- close: r1_38
  r0_38.List_Skin:RequestFillEmptyContent()
end
function r2_0.OnSkinListEntryReleased(r0_39, r1_39)
  -- line: [494, 496] id: 39
  r0_39:DelayUpdateListArrow()
end
function r2_0.OnSkinListEntryGenerated(r0_40, r1_40)
  -- line: [498, 500] id: 40
  r0_40:DelayUpdateListArrow()
end
function r2_0.OnAccessoryListEntryGenerated(r0_41, r1_41)
  -- line: [502, 504] id: 41
  r0_41:DelayUpdateListArrow()
end
function r2_0.OnAccessoryListEntryReleased(r0_42, r1_42)
  -- line: [506, 508] id: 42
  r0_42:DelayUpdateListArrow()
end
function r2_0.DelayUpdateListArrow(r0_43)
  -- line: [510, 514] id: 43
  r0_43:AddTimer(0.2, function()
    -- line: [511, 513] id: 44
    r0_43:UpdateListArrow()
  end)
end
function r2_0.UpdateListArrow(r0_45)
  -- line: [516, 543] id: 45
  local r1_45 = nil
  local r2_45 = nil
  local r3_45 = nil
  local r4_45 = nil
  if r0_45.CurrentTopTabIdx == r0_45.SkinTabIdx then
    r1_45 = r0_45.List_Skin
    r3_45 = r0_45.List_Arrow_Up
    r4_45 = r0_45.List_Arrow_Down
  else
    r1_45 = r0_45.List_Accessory
    r3_45 = r0_45.List_Arrow_Up_1
    r4_45 = r0_45.List_Arrow_Down_1
  end
  local r5_45 = r1_45:GetNumItems()
  r2_45 = r1_45:GetNumItemsPerLine()
  local r6_45, r7_45 = UIUtils.GetMinAndMaxDisplayedItemIndex(r1_45)
  if r2_45 < r6_45 then
    r3_45:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    r3_45:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if r7_45 < r5_45 then
    r4_45:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    r4_45:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r2_0.SelectSkinById(r0_46, r1_46)
  -- line: [545, 548] id: 46
  if not r1_46 then
    r1_46 = r0_46.CurrentSkinContent.SkinId
  end
  r0_46:SelectSkinByContent(r0_46.SkinMap[r1_46])
end
function r2_0.SelectSkinByContent(r0_47, r1_47)
  -- line: [550, 567] id: 47
  if not r1_47 then
    return 
  end
  local r2_47 = r0_47.SkinMap[r0_47.SelectedSkinId]
  if r2_47 then
    r2_47.IsSelect = false
    if r2_47.Widget then
      r2_47.Widget:SetIsSelected(r2_47.IsSelect)
    end
  end
  r2_47 = r1_47
  if r2_47 then
    r2_47.IsSelect = true
    if r2_47.Widget then
      r2_47.Widget:SetIsSelected(r2_47.IsSelect)
    end
  end
  r0_47:UpdateSkinDetails(r1_47)
end
function r2_0.UpdateSkinDetails(r0_48, r1_48)
  -- line: [569, 627] id: 48
  if not r1_48 then
    return 
  end
  if r1_48.SkinId ~= r0_48.SelectedSkinId and not r0_48:IsAnimationPlaying(r0_48.In) then
    r0_48:PlayAnimation(r0_48.Change)
  end
  r0_48.Panel_Buy:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_48.SelectedSkinId = r1_48.SkinId
  if r1_48.Name and r1_48.Name ~= "" then
    r0_48.VB_Info:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    r0_48.VB_Info:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  local r2_48 = {
    nil,
    nil,
    "Font_Blue",
    "Font_Purple",
    "Font_Gold",
    "Font_Red"
  }
  if r1_48.Rarity and r2_48[r1_48.Rarity] and r0_48[r2_48[r1_48.Rarity]] then
    r0_48.Text_Name:SetFont(r0_48[r2_48[r1_48.Rarity]])
  end
  r0_48.Text_Name:SetText(r1_48.Name)
  r0_48.Text_Info:SetText(r1_48.Text)
  r0_48.Text_SkinName_World:SetText(r1_48.Name_World)
  r0_48.Image_Element:SetVisibility(ESlateVisibility.Collapsed)
  r0_48.Text_Char_None:SetVisibility(ESlateVisibility.Collapsed)
  r0_48.Tag_Quality:SetVisibility(ESlateVisibility.Collapsed)
  if r1_48.ElementType then
    local r3_48 = "Armory_" .. r1_48.ElementType
    r0_48.Image_Element:SetBrushResourceObject(LoadObject("/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. r3_48 .. ".T_" .. r3_48))
    r0_48.Image_Element:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  if r1_48.WeaponTypeIcon then
    r0_48.Image_Element:SetBrushResourceObject(LoadObject(r1_48.WeaponTypeIcon))
    r0_48.Image_Element:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  if r1_48.CharName then
    r0_48.Text_CharName:SetText(r1_48.CharName)
  else
    r0_48.Text_CharName:SetText("")
  end
  if r1_48.NotOwned then
    r0_48.Text_Char_None:SetText(GText("UI_SkinPreview_CharNotOwned"))
    r0_48.Text_Char_None:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  if r1_48.Rarity then
    r0_48.Tag_Quality:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_48.Tag_Quality:Init(r1_48.Rarity)
  end
  r0_48:UpdateSkinVideo(r0_48.SelectedSkinId)
  r0_48:UpdateFunctionBtn(r1_48)
  r0_48:UpdateActorAppearance(r0_48.SelectedSkinId)
  if r1_48.IsNew and not r0_48.NoReddot then
    r0_0:SetItemReddotRead(r1_48, true)
  end
end
function r2_0.UpdateSkinVideo(r0_49, r1_49)
  -- line: [629, 644] id: 49
  local r2_49 = DataMgr.Skin[r1_49]
  if not r2_49 or r2_49.GetDisplayType ~= 1 or not r2_49.DisplayPath or not r2_49.VideoCover then
    r0_49.Panel_Video:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return 
  end
  rawset(r0_49, "SkinData", r2_49)
  r0_49.Panel_Video:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  local r3_49 = LoadObject(r2_49.VideoCover)
  if r3_49 then
    r0_49.Img_Video:SetBrushResourceObject(r3_49)
  end
  r0_49.Btn_Play.Btn_Area.OnClicked:Clear()
  r0_49.Btn_Play.Btn_Area.OnClicked:Add(r0_49, r0_49.OpenSkinVideo)
end
function r2_0.OpenSkinVideo(r0_50)
  -- line: [646, 659] id: 50
  local r1_50 = rawget(r0_50, "SkinData") and {}
  AudioManager(r0_50):PlayUISound(r0_50, "event:/ui/common/click_btn_large", nil, nil)
  local r2_50 = UIManager(r0_50):LoadUINew("ArmorySkinVideo", {
    Path = r1_50.DisplayPath,
    SoundPath = r1_50.GetSoundPath,
    DestructCB = function()
      -- line: [652, 654] id: 51
      r0_50:SetFocus()
    end,
  })
  if r2_50 then
    r2_50:SetFocus()
  end
end
function r2_0.UpdateFunctionBtn(r0_52, r1_52)
  -- line: [661, 722] id: 52
  if not r0_52.IsTargetUnowned and not r0_52.IsPreviewMode and not r0_52.IsCharacterTrialMode and r1_52.bDyeable and not r1_52.LockType then
    r0_52.Panel_Dye:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    r0_52.Panel_Dye:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  r0_52.Btn_Function:UnBindEventOnClickedByObj(r0_52)
  r0_52.CurrentLockContent = nil
  if r0_52.CurrentSkinContent == r1_52 then
    r0_52.WidgetSwitcher_BtnState:SetActiveWidgetIndex(r0_52.BtnWidgetState.Equipped)
    if r0_52.IsTargetUnowned then
      r0_52.Text_Desc:SetText(GText("UI_CharPreview_Accessory_In_Trial"))
    else
      r0_52.Text_Desc:SetText(GText("UI_Accessory_Equipped"))
    end
  else
    if r1_52.LockType then
      r0_52.WidgetSwitcher_BtnState:SetActiveWidgetIndex(r0_52.BtnWidgetState.Unequipped)
      r0_52.CurrentLockContent = r1_52
      local r2_52 = r0_52:CheckSkinGoToShopState()
      if r2_52 == r3_0.CanGoToShop then
        r0_52.Btn_Function:SetText(GText("UI_Skin_GotoBuy"))
        r0_52.Btn_Function:ForbidBtn(false)
      elseif r2_52 == r3_0.ItemNotOnSale then
        r0_52.WidgetSwitcher_BtnState:SetActiveWidgetIndex(r0_52.BtnWidgetState.Equipped)
        r0_52.Text_Desc:SetText(GText("UI_Skin_CannotBuy"))
      elseif r2_52 == r3_0.ItemIdNil or r2_52 == r3_0.ItemNotExist or r2_52 == r3_0.SkinNotValid then
        r0_52.WidgetSwitcher_BtnState:SetActiveWidgetIndex(r0_52.BtnWidgetState.Equipped)
        r0_52.Text_Desc:SetText(GText("UI_Skin_CannotBuy"))
      end
    else
      r0_52.WidgetSwitcher_BtnState:SetActiveWidgetIndex(r0_52.BtnWidgetState.Unequipped)
      if r0_52.IsTargetUnowned then
        r0_52.Btn_Function:SetText(GText("UI_CharPreview_Cannot_Equip"))
        r0_52.Btn_Function:ForbidBtn(true)
      else
        r0_52.Btn_Function:SetText(GText("UI_Accessory_Equip"))
        r0_52.Btn_Function:ForbidBtn(false)
      end
    end
    r0_52.Btn_Function:BindEventOnClicked(r0_52, r0_52.OnConfirmBtnClicked)
    r0_52.ConfirmBtnFunc = r0_52.OnConfirmBtnClicked
  end
  if r0_52.IsCharacterTrialMode then
    if r0_52.CurrentSkinContent == r1_52 then
      r0_52.WidgetSwitcher_BtnState:SetActiveWidgetIndex(r0_52.BtnWidgetState.Equipped)
      r0_52.Text_Desc:SetText(GText("UI_CharPreview_Accessory_In_Trial"))
    elseif r1_52.LockType then
      r0_52.WidgetSwitcher_BtnState:SetActiveWidgetIndex(r0_52.BtnWidgetState.Locked)
      r0_52.Text_Lock:SetText(GText("UI_Aaccessory_Locked"))
      r0_52.Btn_Function:ForbidBtn(true)
    else
      r0_52.WidgetSwitcher_BtnState:SetActiveWidgetIndex(r0_52.BtnWidgetState.Unequipped)
      r0_52.Btn_Function:SetText(GText("UI_CharPreview_Cannot_Equip"))
      r0_52.Btn_Function:ForbidBtn(true)
    end
  end
end
function r2_0.UpdateActorAppearance(r0_53, r1_53)
  -- line: [724, 728] id: 53
  r0_53:UpdateActorSkin(r1_53)
  r0_53:UpdateActorColors(r1_53)
end
function r2_0.UpdatePartMesh(r0_54, r1_54)
  -- line: [730, 737] id: 54
  if r0_54.Type ~= CommonConst.ArmoryType.Char or not r0_54.ActorController then
    return 
  end
  local r3_54 = r0_54.Target:GetSkin(r1_54 and r0_54.Target:GetAppearance().SkinId, r0_0:GetAvatar())
  r0_54.ActorController:ShowPartMesh(r3_54 and r3_54.IsShowPartMesh)
end
function r2_0.UpdateActorSkin(r0_55, r1_55)
  -- line: [740, 761] id: 55
  if r0_55.Type == CommonConst.ArmoryType.Char then
    if not r0_55.ActorController then
      return 
    end
    local r2_55 = r0_55.Target:DumpAppearanceSuit(r0_0:GetAvatar(), r0_55.AppearanceSutiIndex)
    r2_55.SkinId = r1_55
    r2_55.Colors = r0_55.Target:DumpColors(r0_0:GetAvatar(), r1_55)
    r0_55.ActorController:ChangeCharAppearance(r2_55)
    if r1_55 ~= r0_55.LastCharSkinId then
      r0_55.ActorController.DelayFrame = 30
      r0_55.ActorController.bPlaySameMontage = true
    else
      r0_55.ActorController.bPlaySameMontage = false
    end
    r0_55.LastCharSkinId = r1_55
    r0_55.ActorController:SetMontageAndCamera(CommonConst.ArmoryType.Char, "", "", "")
  else
    r0_55.ActorController:ChangeWeaponSkin(r1_55)
  end
end
function r2_0.UpdateActorColors(r0_56, r1_56)
  -- line: [764, 770] id: 56
  if r0_56.Type ~= CommonConst.ArmoryType.Char then
    r0_56.ActorController:ChangeWeaponColor(r0_56.Target:DumpColors(r1_56))
  end
end
function r2_0.InitCharSkin(r0_57)
  -- line: [777, 793] id: 57
  if r0_57.ActorController then
    r0_57.ActorController:SetMontageAndCamera(CommonConst.ArmoryType.Char, "", "", "")
    r0_57.ActorController:HidePlayerActor(r0_57.UIName, false)
  end
  local r1_57 = r0_57.JumpToSkinId and r0_57.SelectedSkinId
  if r0_57.JumpToSkinId then
    r0_57.LastCharSkinId = r0_57.JumpToSkinId
  end
  r0_57.JumpToSkinId = nil
  r0_57.WidgetSwitcher_State:SetActiveWidgetIndex(1)
  r0_57:InitCharSkinList(r0_57.Target)
  r0_57:SelectSkinById(r1_57)
  r0_57:AddTimer(0.01, function()
    -- line: [790, 792] id: 58
    r0_57.IsSkinWidgetNotReady = false
  end)
end
function r2_0.InitCharSkinList(r0_59, r1_59)
  -- line: [795, 875] id: 59
  -- error: decompile function#59: Condition failed: `def_pos <= last_end && last_end <= self.stmts.len()`
end
function r2_0.OnSkinContentCreated(r0_61)
  -- line: [877, 878] id: 61
end
function r2_0.OnCharSkinConfirmBtnClicked(r0_62)
  -- line: [880, 887] id: 62
  if not r0_62.SelectedSkinId or r0_62.SelectedSkinId <= 0 then
    return 
  end
  r0_62:BlockAllUIInput(true)
  GWorld:GetAvatar():ChangeCharAppearanceSkin(r0_62.Target.Uuid, r0_62.AppearanceSutiIndex, r0_62.SelectedSkinId)
end
function r2_0.CheckSkinGoToShopState(r0_63)
  -- line: [889, 935] id: 63
  if not r0_63.SelectedSkinId or r0_63.SelectedSkinId <= 0 then
    return r3_0.SkinNotValid
  end
  local r1_63 = nil
  if r0_63.Type == CommonConst.ArmoryType.Char then
    r1_63 = DataMgr.Skin[r0_63.SelectedSkinId]
  else
    r1_63 = DataMgr.WeaponSkin[r0_63.SelectedSkinId]
  end
  if not r1_63 then
    return r3_0.SkinNotValid
  end
  local r2_63 = r1_63.GoShopTypeId
  if not r2_63 or not next(r2_63) then
    return r3_0.ItemIdNil
  end
  local r3_63 = true
  for r8_63, r9_63 in ipairs(r2_63) do
    if DataMgr.ShopItem[r9_63] then
      r3_63 = false
      break
    end
  end
  -- close: r4_63
  if r3_63 then
    return r3_0.ItemNotExist
  end
  local r4_63 = GWorld:GetAvatar()
  if r4_63 then
    local r5_63 = true
    for r10_63, r11_63 in ipairs(r2_63) do
      if r4_63:CheckIsEffective(r11_63) then
        r5_63 = false
        break
      end
    end
    -- close: r6_63
    if r5_63 then
      return r3_0.ItemNotOnSale
    end
  end
  return r3_0.CanGoToShop
end
function r2_0.OnCharSkinGoToShopBtnClicked(r0_64)
  -- line: [937, 956] id: 64
  if not r0_64.SelectedSkinId or r0_64.SelectedSkinId <= 0 then
    return 
  end
  local r1_64 = DataMgr.Skin[r0_64.SelectedSkinId]
  if not r1_64 then
    return 
  end
  local r2_64 = r1_64.GoShopTypeId
  if not r2_64 or not next(r2_64) then
    return 
  end
  for r7_64, r8_64 in ipairs(r2_64) do
    local r9_64 = DataMgr.ShopItem[r8_64]
    if r9_64 then
      local r10_64, r11_64 = PageJumpUtils:CreateJumpToShopAccess(r9_64.ItemType, "Shop", r9_64.TypeId)
      if r10_64 and r11_64 then
        r11_64()
        return 
      end
    end
  end
  -- close: r3_64
  Utils.ScreenPrint("皮肤表对应的商品Id可能没配对,麻烦策划检查一下")
end
function r2_0.OnWeaponSkinGoToShopBtnClicked(r0_65)
  -- line: [958, 977] id: 65
  if not r0_65.SelectedSkinId or r0_65.SelectedSkinId <= 0 then
    return 
  end
  local r1_65 = DataMgr.WeaponSkin[r0_65.SelectedSkinId]
  if not r1_65 then
    return 
  end
  local r2_65 = r1_65.GoShopTypeId
  if not r2_65 or not next(r2_65) then
    return 
  end
  for r7_65, r8_65 in ipairs(r2_65) do
    local r9_65 = DataMgr.ShopItem[r8_65]
    if r9_65 then
      local r10_65, r11_65 = PageJumpUtils:CreateJumpToShopAccess(r9_65.ItemType, "Shop", r9_65.TypeId)
      if r10_65 and r11_65 then
        r11_65()
        return 
      end
    end
  end
  -- close: r3_65
  Utils.ScreenPrint("皮肤表对应的商品Id可能没配对,麻烦策划检查一下")
end
function r2_0.OnCharSkinChanged(r0_66, r1_66, r2_66, r3_66, r4_66)
  -- line: [979, 991] id: 66
  r0_66:BlockAllUIInput(false)
  if not ErrorCode:Check(r1_66) then
    return 
  end
  r0_66:ResetTarget()
  if r0_66.CurrentSkinContent then
    r0_66:SetSkinIsCurrentUse(r0_66.CurrentSkinContent, false)
  end
  r0_66.CurrentSkinContent = r0_66.SkinMap[r4_66]
  r0_66:SetSkinIsCurrentUse(r0_66.CurrentSkinContent, true)
  r0_66:UpdateFunctionBtn(r0_66.CurrentSkinContent)
end
function r2_0.SetSkinIsCurrentUse(r0_67, r1_67, r2_67)
  -- line: [993, 1001] id: 67
  if not r1_67 then
    return 
  end
  r1_67.IsCurrentUse = r2_67
  if r1_67.Widget then
    r1_67.Widget:SetIsCurrentUse(r1_67.IsCurrentUse)
  end
end
function r2_0.InitCharAccessory(r0_68)
  -- line: [1006, 1011] id: 68
  r0_68.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  r0_68:CreateCharAccessoryTabInfo()
  r0_68:CreateCharAccessoryContents(r0_68.Target, r0_68.SelectedSkinId)
  r0_68:CharAccessoryJumpTo()
end
function r2_0.CharAccessoryJumpTo(r0_69)
  -- line: [1014, 1031] id: 69
  local r2_69 = r0_69.JumpToCharAccessoryType
  local r3_69 = r0_69.Map_AccessoryContents[r0_69.JumpToAccessoryId]
  if r3_69 then
    local r4_69 = r0_69.AccessoryTabsMap[r3_69.AccessoryType]
    if r4_69 then
      r0_69.Tab_Accessory:SelectTab(r4_69.Idx)
      return 
    end
  else
    local r4_69 = r0_69.AccessoryTabsMap[r2_69]
    if r4_69 then
      r0_69.Tab_Accessory:SelectTab(r4_69.Idx)
      return 
    end
  end
  r0_69.Tab_Accessory:SelectTab(1)
end
function r2_0.CreateCharAccessoryTabInfo(r0_70, r1_70)
  -- line: [1034, 1089] id: 70
  if rawget(r0_70, "IsAccessoryTabInited") and not r1_70 then
    return 
  end
  rawset(r0_70, "IsAccessoryTabInited", true)
  rawset(r0_70, "CurrentAccessoryTabIdx", nil)
  rawset(r0_70, "AccessoryTypes", {
    CommonConst.CharAccessoryTypes.Head,
    CommonConst.CharAccessoryTypes.Face,
    CommonConst.CharAccessoryTypes.Waist,
    CommonConst.CharAccessoryTypes.Back,
    CommonConst.CharAccessoryTypes.FX_Dead,
    CommonConst.CharAccessoryTypes.FX_Teleport,
    CommonConst.CharAccessoryTypes.FX_Footprint,
    CommonConst.CharAccessoryTypes.FX_Body,
    CommonConst.CharAccessoryTypes.FX_PlungingATK,
    CommonConst.CharAccessoryTypes.FX_HelixLeap
  })
  rawset(r0_70, "FXAccessoryTypes", {
    [CommonConst.CharAccessoryTypes.FX_Dead] = true,
    [CommonConst.CharAccessoryTypes.FX_Teleport] = true,
    [CommonConst.CharAccessoryTypes.FX_Footprint] = true,
    [CommonConst.CharAccessoryTypes.FX_PlungingATK] = true,
    [CommonConst.CharAccessoryTypes.FX_HelixLeap] = true,
  })
  rawset(r0_70, "AttachableFXAccessoryTypes", {
    [CommonConst.CharAccessoryTypes.FX_Footprint] = true,
  })
  rawset(r0_70, "HidePlayerAccessoryTypes", {
    [CommonConst.CharAccessoryTypes.FX_Dead] = true,
    [CommonConst.CharAccessoryTypes.FX_Footprint] = true,
  })
  rawset(r0_70, "AccessoryTabsMap", {})
  rawset(r0_70, "AccessoryTabsArray", {})
  for r6_70, r7_70 in ipairs(r0_70.AccessoryTypes) do
    local r8_70 = {
      Owner = r0_70,
      AccessoryType = r7_70,
      Text = "",
      Idx = r6_70,
    }
    local r12_70 = r7_70
    r8_70.IconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Fashion_" .. r7_70 .. ".T_Tab_Fashion_" .. r12_70
    r0_70.AccessoryTabsMap[r8_70.AccessoryType] = r8_70
    table.insert(r0_70.AccessoryTabsArray, r8_70)
    r0_70:OnAccessoryTabContentCreated(r8_70)
  end
  -- close: r2_70
  rawset(r0_70, "TabConfigData", {
    ChildWidgetName = "TabSubIconItem",
    Tabs = r0_70.AccessoryTabsArray,
    SoundFunc = function(r0_71)
      -- line: [1082, 1084] id: 71
      AudioManager(r0_71):PlayUISound(r0_71, "event:/ui/common/click_btn_sort_tab", nil, nil)
    end,
    SoundFuncReceiver = r0_70,
  })
  r0_70.Tab_Accessory:Init(r0_70.TabConfigData)
  r0_70.Tab_Accessory:BindEventOnTabSelected(r0_70, r0_70.OnCharAccessoryTabClicked)
end
function r2_0.OnAccessoryTabContentCreated(r0_72, r1_72)
  -- line: [1091, 1092] id: 72
end
function r2_0.CreateCharAccessoryContents(r0_73, r1_73, r2_73, r3_73)
  -- line: [1095, 1188] id: 73
  r0_73.IsAccessoryContentsCreated = true
  r0_73.CurrentContent = nil
  r0_73.ComparedContent = nil
  rawset(r0_73, "NoneAccessory", NewObject(UIUtils.GetCommonItemContentClass()))
  rawset(r0_73.NoneAccessory, "Id", r0_73.NoneAccessoryId)
  rawset(r0_73.NoneAccessory, "AccessoryId", r0_73.NoneAccessoryId)
  rawset(r0_73.NoneAccessory, "Parent", r0_73)
  rawset(r0_73.NoneAccessory, "Icon", UIUtils.GetNoneAccessoryIconPath())
  rawset(r0_73.NoneAccessory, "ItemType", CommonConst.DataType.CharAccessory)
  r0_73.BP_AccessoryContents:Clear()
  r0_73.BP_AccessoryContents:Add(r0_73.NoneAccessory)
  rawset(r0_73, "Map_AccessoryContents", {})
  rawset(r0_73, "DefaultCharAccessoryIds", r0_0:GetDefaultCharAccessoryIds())
  local r4_73 = GWorld:GetAvatar()
  for r9_73, r10_73 in pairs(DataMgr.CharAccessory) do
    local r11_73 = r0_73:CreateCharAccessoryContent(r10_73)
    if r11_73 and (r4_73.CharAccessorys[r9_73] or CommonUtils.IsCurrentVersionRealease(CommonConst.DataType.CharAccessory, r9_73)) then
      r11_73.SoundDataName = "CharAccessory"
      r0_73.BP_AccessoryContents:Add(r11_73)
      r0_73.Map_AccessoryContents[r9_73] = r11_73
    end
  end
  -- close: r5_73
  rawset(r0_73, "PartMeshAccessory", nil)
  rawset(r0_73, "HornAccessory", nil)
  local r5_73 = r1_73:GetAppearance()
  local r6_73 = r1_73:GetSkin(r2_73 and r5_73.SkinId, r4_73)
  for r11_73, r12_73 in pairs(DataMgr.CharPartMesh) do
    local r13_73 = r0_73:CreateCharAccessoryContent(r12_73)
    if r13_73 then
      r13_73.SoundDataName = "CharPartMesh"
      r0_73.BP_AccessoryContents:Add(r13_73)
      r0_73.Map_AccessoryContents[r12_73.AccessoryId] = r13_73
      if r13_73.PartName == "PartMesh" then
        rawset(r0_73, "PartMeshAccessory", r13_73)
        rawset(r13_73, "IsSelect", false)
        if r6_73 then
          if r5_73.Accessory[CommonConst.NewCharAccessoryTypes[r13_73.AccessoryType]] <= 0 then
            rawset(r13_73, "IsSelect", r6_73.IsShowPartMesh)
          else
            rawset(r13_73, "IsSelect", false)
          end
          rawset(r13_73, "LockType", nil)
        else
          rawset(r13_73, "LockType", 2)
        end
      elseif r13_73.PartName == "Horn" then
        r0_73.HornAccessory = r13_73
        r0_73.HornAccessory.IsSelect = r5_73.IsCornerVisible
        r0_73.HornAccessory.LockType = nil
      end
    end
  end
  -- close: r7_73
  for r11_73, r12_73 in pairs(r4_73.CharAccessorys) do
    local r13_73 = r0_73.Map_AccessoryContents[r12_73]
    if r13_73 then
      r13_73.IsHide = nil
      r13_73.LockType = nil
    end
  end
  -- close: r7_73
  for r11_73, r12_73 in pairs(r4_73.CharAccessorys) do
    r0_73:CheckCharAccessoryContentReddot(r12_73)
  end
  -- close: r7_73
  r0_73:AddAccessoryTabReddotListen()
  local r7_73 = r5_73.Accessory
  for r12_73, r13_73 in ipairs(r0_73.AccessoryTypes) do
    local r14_73 = CommonConst.NewCharAccessoryTypes[r13_73]
    if r14_73 then
      local r15_73 = r7_73[r14_73] and -1
      if r15_73 == r0_73.NoneAccessoryId then
        r0_73[r13_73 .. "Content"] = r0_73.NoneAccessory
      else
        r0_73[r13_73 .. "Content"] = r0_73.Map_AccessoryContents[r15_73]
      end
    end
  end
  -- close: r8_73
  if r0_73.PartMeshAccessory and r0_73.PartMeshAccessory.IsSelect then
    r0_73[r0_73.PartMeshAccessory.AccessoryType .. "Content"] = r0_73.PartMeshAccessory
  end
  if r0_73.HornAccessory and r0_73.HornAccessory.IsSelect then
    r0_73[r0_73.HornAccessory.AccessoryType .. "Content"] = r0_73.HornAccessory
  end
  for r12_73, r13_73 in ipairs(r0_73.AccessoryTypes) do
    if r0_73[r13_73 .. "Content"] then
      r0_73[r13_73 .. "Content"].IsSelect = true
    end
  end
  -- close: r8_73
end
function r2_0.CheckCharAccessoryContentReddot(r0_74, r1_74)
  -- line: [1190, 1211] id: 74
  -- notice: unreachable block#13
  if r0_74.NoReddot then
    return 
  end
  local r2_74 = r0_74.Map_AccessoryContents[r1_74]
  if not r2_74 then
    return 
  end
  local r3_74 = DataMgr.CharAccessory[r1_74]
  if r3_74 and r3_74.AccessoryType then
    local r4_74 = CommonConst.DataType.CharAccessory .. r3_74.AccessoryType
    local r5_74 = ipairs
    local r6_74 = r3_74.Skin
    if not r6_74 then
      r6_74 = {}
      local r7_74 = ""
      -- setlist for #6 failed
    end
    for r9_74, r10_74 in r5_74(r6_74) do
      if ReddotManager.GetTreeNode(r4_74 .. r10_74) then
        local r12_74 = ReddotManager.GetLeafNodeCacheDetail(r4_74 .. r10_74)[r1_74]
        if r12_74 == 1 then
          r12_74 = UIConst.RedDotType.NewRedDot
        else
          r12_74 = false
        end
        r2_74.RedDotType = r12_74
        if r2_74.RedDotType then
          r0_74.AccessoryTabsMap[r3_74.AccessoryType].IsNew = true
          break
        end
      end
    end
    -- close: r5_74
  end
end
function r2_0.CreateCharAccessoryContent(r0_75, r1_75)
  -- line: [1213, 1247] id: 75
  if r1_75.AccessoryType then
    if r1_75.AccessoryId == r0_75.DefaultCharAccessoryIds[r1_75.AccessoryType] then
      return 
    end
    local r2_75 = true
    if r1_75.Skin then
      r2_75 = false
      local r3_75 = r0_75.SelectedSkinId
      for r8_75, r9_75 in ipairs(r1_75.Skin) do
        if r9_75 == r3_75 then
          r2_75 = true
          break
        end
      end
      -- close: r4_75
    end
    if r2_75 then
      local r3_75 = NewObject(UIUtils.GetCommonItemContentClass())
      rawset(r3_75, "ItemType", CommonConst.DataType.CharAccessory)
      rawset(r3_75, "Icon", r1_75.Icon and "")
      rawset(r3_75, "Id", r1_75.AccessoryId)
      rawset(r3_75, "AccessoryId", r1_75.AccessoryId)
      rawset(r3_75, "SortPriority", r1_75.SortPriority and 0)
      rawset(r3_75, "IsHide", r1_75.IsHide)
      rawset(r3_75, "LockType", 2)
      rawset(r3_75, "Rarity", r1_75.Rarity and 0)
      rawset(r3_75, "IsSelect", false)
      rawset(r3_75, "AccessoryType", r1_75.AccessoryType)
      rawset(r3_75, "PartName", r1_75.PartName)
      rawset(r3_75, "UnlockOptionText", GText(r1_75.UnlockOption and ""))
      rawset(r3_75, "Parent", r0_75)
      return r3_75
    end
  end
end
function r2_0.AddAccessoryTabReddotListen(r0_76)
  -- line: [1250, 1273] id: 76
  if r0_76.NoReddot then
    return 
  end
  local r1_76 = r0_76.SelectedSkinId
  if not r0_76.TabNodeNames then
    r0_76.TabNodeNames = {}
  end
  for r6_76, r7_76 in pairs(r0_76.AccessoryTabsMap) do
    local r8_76 = r6_76
    local r9_76 = {}
    local r10_76 = CommonConst.DataType.CharAccessory .. r6_76
    local r11_76 = ReddotManager.GetTreeNode(r10_76)
    if r11_76 then
      r11_76 = 1 and nil
    else
      goto label_32	-- block#7 is visited secondly
    end
    r9_76[r10_76] = r11_76
    r10_76 = r10_76 .. r1_76
    r11_76 = ReddotManager.GetTreeNode(r10_76)
    if r11_76 then
      r11_76 = 1 and nil
    else
      goto label_47	-- block#10 is visited secondly
    end
    r9_76[r10_76] = r11_76
    if not r0_76.TabNodeNames[r8_76] and not IsEmptyTable(r9_76) then
      ReddotManager.AddListener(r8_76, r0_76, function(r0_77, r1_77)
        -- line: [1264, 1269] id: 77
        r7_76.IsNew = r1_77 > 0
        if r7_76.UI then
          r7_76.UI:SetReddot(r7_76.IsNew)
        end
      end, r9_76)
      r0_76.TabNodeNames[r8_76] = 1
    end
    -- close: r6_76
  end
  -- close: r2_76
end
function r2_0.RemoveAccessoryTabReddotListen(r0_78)
  -- line: [1275, 1283] id: 78
  if r0_78.NoReddot then
    return 
  end
  for r5_78, r6_78 in pairs(r0_78.TabNodeNames and {}) do
    ReddotManager.RemoveListener(r5_78, r0_78)
  end
  -- close: r1_78
  r0_78.TabNodeNames = nil
end
function r2_0.SetCurrentTabItemsReddotsRead(r0_79)
  -- line: [1285, 1296] id: 79
  if r0_79.NoReddot then
    return 
  end
  if r0_79.FilteredContents then
    for r5_79, r6_79 in pairs(r0_79.FilteredContents) do
      if r6_79.RedDotType then
        r0_0:SetItemReddotRead(r6_79, true)
      end
    end
    -- close: r1_79
  end
end
function r2_0.OnCharAccessoryTabClicked(r0_80, r1_80)
  -- line: [1298, 1339] id: 80
  local r2_80 = r0_80.AccessoryTabsArray[r1_80.Idx]
  if r0_80.ActorController then
    r0_80.ActorController:ResetActorRotation()
    if r0_80.HidePlayerAccessoryTypes[r2_80.AccessoryType] then
      r0_80.ActorController:HidePlayerActor(r0_80.UIName, true)
    else
      r0_80.ActorController:HidePlayerActor(r0_80.UIName, false)
    end
  end
  r0_80:RecoverAccessory()
  r0_80:SetCurrentTabItemsReddotsRead()
  r0_80.CurrentAccessoryTabIdx = r2_80.Idx
  r0_80.CurrentAccessoryTabWidget = r1_80
  r0_80.NoneAccessory.IsSelect = false
  r0_80.NoneAccessory.IsSelect = false
  r0_80.NoneAccessory.AccessoryType = r2_80.AccessoryType
  r0_80.NoneAccessory.Id = r0_80.DefaultCharAccessoryIds[r2_80.AccessoryType] and r0_80.NoneAccessoryId
  r0_80.NoneAccessory.AccessoryId = r0_80.NoneAccessory.Id
  r0_80.CurrentContent = r0_80.NoneAccessory
  if r0_80.ComparedContent then
    r0_80.ComparedContent.IsSelect = false
  end
  r0_80.ComparedContent = nil
  r0_80:InitCharAccessoryList()
  r0_80.JumpToAccessoryId = nil
  r0_80.JumpToCharAccessoryType = nil
  r0_80.CurrentContent.IsSelect = true
  r0_80.ComparedContent = r0_80.ComparedContent and r0_80.CurrentContent
  r0_80.CurrentContent.IsSelect = true
  r0_80:SelectAccessoryItem(r0_80.ComparedContent)
  if r0_80.NoneAccessory.SelfWidget then
    r0_80.NoneAccessory.SelfWidget:OnListItemObjectSet(r0_80.NoneAccessory)
  end
  r0_80.List_Accessory:BP_ScrollItemIntoView(r0_80.CurrentContent)
end
function r2_0.InitCharAccessoryList(r0_81)
  -- line: [1341, 1353] id: 81
  local r1_81 = r0_81.AccessoryTabsArray[r0_81.CurrentAccessoryTabIdx]
  local r2_81 = r0_81.BP_AccessoryContents:Length()
  local r3_81 = {}
  for r7_81 = 1, r2_81, 1 do
    local r8_81 = r0_81.BP_AccessoryContents[r7_81]
    if r8_81.AccessoryId and r8_81.AccessoryType == r1_81.AccessoryType and r8_81.AccessoryId ~= r0_81.NoneAccessory.Id and not r8_81.IsHide then
      table.insert(r3_81, r8_81)
    end
  end
  r0_81:InitList(r3_81)
end
function r2_0.InitList(r0_82, r1_82)
  -- line: [1355, 1392] id: 82
  r0_82.FilteredContents = r1_82
  r0_82.List_Accessory:ClearListItems()
  table.sort(r1_82, function(r0_83, r1_83)
    -- line: [1363, 1372] id: 83
    if r0_83.LockType and r1_83.LockType or not r0_83.LockType and not r1_83.LockType then
      if r0_83.SortPriority == r1_83.SortPriority then
        return r1_83.AccessoryId < r0_83.AccessoryId
      end
      return r1_83.SortPriority < r0_83.SortPriority
    else
      return r1_83.LockType
    end
  end)
  r0_82.List_Accessory:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_82.List_Accessory:AddItem(r0_82.NoneAccessory)
  for r6_82, r7_82 in ipairs(r1_82) do
    if r0_82.JumpToAccessoryId and r0_82.JumpToAccessoryId == r7_82.AccessoryId then
      r0_82.ComparedContent = r7_82
    end
    if r7_82.IsSelect then
      r0_82.CurrentContent = r7_82
      if r0_82.IsCharacterTrialMode then
        r7_82.TryOutText = GText("UI_CharPreview_Accessory_In_Trial")
      end
    end
    r0_82.List_Accessory:AddItem(r7_82)
  end
  -- close: r2_82
  r0_82.List_Accessory:RequestFillEmptyContent()
  r0_82.List_Accessory:RequestPlayEntriesAnim()
end
function r2_0.RecoverAccessory(r0_84)
  -- line: [1394, 1413] id: 84
  if r0_84.Type == CommonConst.ArmoryType.Char then
    r0_84.ActorController:DestoryCreature(CommonConst.CharAccessoryTypes.FX_Dead)
    r0_84.ActorController:StopPlayerFX()
    r0_84.ActorController:StopPlayerMontage()
    r0_84.ActorController:DestoryPlayerMeleeWeapon()
  end
  if not r0_84.ComparedContent or r0_84.ComparedContent == r0_84.CurrentContent then
    return 
  end
  if r0_84.Type == CommonConst.ArmoryType.Char then
    local r1_84 = r0_84.ComparedContent.AccessoryType
    if r0_84.FXAccessoryTypes[r1_84] and not r0_84.AttachableFXAccessoryTypes[r1_84] then
      return 
    end
    r0_84.ActorController:ChangeCharAccessory(r0_84.CurrentContent.AccessoryId, r1_84)
  else
    r0_84.ActorController:ChangeWeaponAccessory(r0_84.CurrentContent.AccessoryId)
  end
end
function r2_0.OnAccessoryItemClicked(r0_85, r1_85)
  -- line: [1416, 1418] id: 85
  r0_85:TrySelectAccessoryItem(r1_85)
end
function r2_0.OnAccessoryListSelectionChanged(r0_86, r1_86, r2_86)
  -- line: [1420, 1421] id: 86
end
function r2_0.TrySelectAccessoryItem(r0_87, r1_87)
  -- line: [1423, 1435] id: 87
  if not r1_87.Icon then
    return 
  end
  if r0_87.ComparedContent == r1_87 and not CommonConst.ActionAccessoryTypes[r1_87.AccessoryType] then
    return 
  end
  AudioManager(r0_87):PlayUISound(r0_87, "event:/ui/common/click", nil, nil)
  if r1_87.AccessoryId then
    AudioManager(r0_87):PlayItemSound(r0_87, r1_87.AccessoryId, "Equip", r1_87.SoundDataName)
  end
  r0_87:SelectAccessoryItem(r1_87)
end
function r2_0.SelectAccessoryItem(r0_88, r1_88)
  -- line: [1437, 1457] id: 88
  r0_0:SetItemIsSelected(r0_88.ComparedContent, false)
  r0_88.ComparedContent = r1_88
  r0_0:SetItemIsSelected(r0_88.ComparedContent, true)
  r0_88:UpdateAccessoryDetails(r1_88)
  if r0_88.Type == CommonConst.ArmoryType.Char then
    r0_88.ActorController:StopPlayerFX()
    r0_88.ActorController:StopPlayerMontage()
    local r2_88 = r1_88.AccessoryType
    if r0_88.FXAccessoryTypes[r2_88] then
      r0_88.ActorController:ShowPlayerFXAccessory(r1_88.AccessoryId, r2_88)
      if r0_88.AttachableFXAccessoryTypes[r2_88] then
        r0_88.ActorController:ChangeCharAccessory(r1_88.AccessoryId, r2_88)
      end
    else
      r0_88.ActorController:ChangeCharAccessory(r1_88.AccessoryId, r2_88)
    end
  else
    r0_88.ActorController:ChangeWeaponAccessory(r1_88.AccessoryId)
  end
end
function r2_0.OnCharAccessoryConfirmBtnClicked(r0_89)
  -- line: [1460, 1486] id: 89
  local r1_89 = GWorld:GetAvatar()
  if r0_89.ComparedContent == r0_89.NoneAccessory then
    if r0_89.CurrentContent == r0_89.PartMeshAccessory then
      r1_89:SetCharSkinShowPart(r0_89.Target.Uuid, r0_89.SelectedSkinId, false)
    elseif r0_89.CurrentContent == r0_89.HornAccessory then
      r1_89:SetCharCornerVisibility(r0_89.Target.Uuid, r0_89.AppearanceSutiIndex, false)
    else
      r1_89:RemoveCharAppearanceAccessory(r0_89.Target.Uuid, r0_89.AppearanceSutiIndex, r0_89.CurrentContent.AccessoryId)
    end
  elseif r0_89.ComparedContent == r0_89.PartMeshAccessory then
    r1_89:SetCharSkinShowPart(r0_89.Target.Uuid, r0_89.SelectedSkinId, true)
  elseif r0_89.ComparedContent == r0_89.HornAccessory then
    r1_89:SetCharCornerVisibility(r0_89.Target.Uuid, r0_89.AppearanceSutiIndex, true)
  else
    r1_89:SetCharAppearanceAccessory(r0_89.Target.Uuid, r0_89.AppearanceSutiIndex, r0_89.ComparedContent.AccessoryId)
  end
end
function r2_0.OnCharAccessoryChanged(r0_90, r1_90, r2_90, r3_90)
  -- line: [1491, 1501] id: 90
  r0_90:BlockAllUIInput(false)
  if r1_90 == ErrorCode.RET_SUCCESS then
    r0_90.Target = GWorld:GetAvatar().Chars[r2_90]
    r0_90:OnEquipedCharAccessoryContentChanged()
    r0_90:UpdateAccessoryDetails(r0_90.CurrentContent)
  else
    UIManager(r0_90):ShowError(r1_90, 1.5)
  end
end
function r2_0.OnCharAppearanceChanged(r0_91, r1_91, r2_91, r3_91)
  -- line: [1504, 1513] id: 91
  r0_91:BlockAllUIInput(false)
  if r1_91 == ErrorCode.RET_SUCCESS then
    r0_91.Target = GWorld:GetAvatar().Chars[r2_91]
  else
    UIManager(r0_91):ShowError(r1_91, 1.5)
  end
end
function r2_0.OnCharShowPartMesh(r0_92, r1_92, r2_92, r3_92, r4_92)
  -- line: [1516, 1526] id: 92
  r0_92:BlockAllUIInput(false)
  if r1_92 == ErrorCode.RET_SUCCESS then
    r0_92.Target = GWorld:GetAvatar().Chars[r2_92]
    r0_92:OnEquipedCharAccessoryContentChanged()
    r0_92:UpdateAccessoryDetails(r0_92.CurrentContent)
  else
    UIManager(r0_92):ShowError(r1_92, 1.5)
  end
end
function r2_0.OnCharCornerVisibilityChanged(r0_93, r1_93, r2_93)
  -- line: [1529, 1539] id: 93
  r0_93:BlockAllUIInput(false)
  if r1_93 == ErrorCode.RET_SUCCESS then
    r0_93.Target = GWorld:GetAvatar().Chars[r2_93]
    r0_93:OnEquipedCharAccessoryContentChanged()
    r0_93:UpdateAccessoryDetails(r0_93.CurrentContent)
  else
    UIManager(r0_93):ShowError(r1_93, 1.5)
  end
end
function r2_0.InitWeaponSkin(r0_94)
  -- line: [1550, 1559] id: 94
  local r1_94 = r0_94.JumpToSkinId and r0_94.SelectedSkinId
  r0_94.JumpToSkinId = nil
  r0_94.WidgetSwitcher_State:SetActiveWidgetIndex(1)
  r0_94:InitWeaponSkinList()
  r0_94:SelectSkinById(r1_94)
  r0_94:AddTimer(0.01, function()
    -- line: [1556, 1558] id: 95
    r0_94.IsSkinWidgetNotReady = false
  end)
end
function r2_0.InitWeaponSkinList(r0_96)
  -- line: [1561, 1634] id: 96
  if r0_96.bWeaponSkinListInited then
    return 
  end
  r0_96.bWeaponSkinListInited = true
  r0_96.SkinMap = {}
  r0_96.SkinArray = {}
  local r1_96 = GWorld:GetAvatar()
  local r2_96 = r0_96.Target.WeaponId
  local r4_96 = (r0_96.Target:GetCurrentSkin() and {}).SkinId and r2_96
  local r5_96 = CommonConst.DataType.WeaponSkin
  for r10_96, r11_96 in pairs(DataMgr.WeaponSkin) do
    if UIUtils.CanApplyWeaponSkin(r2_96, r11_96.ApplicationType) then
      local r12_96 = {}
      if not r0_96.NoReddot then
        r12_96 = ReddotManager.GetLeafNodeCacheDetail(r5_96 .. (r11_96.ApplicationType and "")) and {}
      end
      local r13_96 = NewObject(UIUtils.GetCommonItemContentClass())
      rawset(r13_96, "SkinId", r11_96.SkinID)
      rawset(r13_96, "ItemId", r11_96.SkinID)
      rawset(r13_96, "IconPath", r11_96.LongIcon)
      rawset(r13_96, "Name", GText(r11_96.Name))
      rawset(r13_96, "Name_World", EnText(r11_96.Name))
      rawset(r13_96, "Rarity", r11_96.Rarity)
      rawset(r13_96, "Text", GText(r11_96.Dec))
      rawset(r13_96, "Owner", r0_96)
      rawset(r13_96, "OnClicked", r0_96.OnSkinItemClicked)
      rawset(r13_96, "bDyeable", true)
      rawset(r13_96, "IsNew", r12_96[r10_96] == 1)
      rawset(r13_96, "ItemType", CommonConst.DataType.WeaponSkin)
      rawset(r13_96, "IsTargetUnowned", r0_96.IsTargetUnowned)
      rawset(r13_96, "SkinId", r11_96.SkinID)
      if r1_96.OwnedWeaponSkins[r10_96] then
        rawset(r13_96, "LockType", false)
      else
        rawset(r13_96, "LockType", r10_96 ~= r2_96)
      end
      if not r13_96.LockType or CommonUtils.IsCurrentVersionRealease(CommonConst.DataType.WeaponSkin, r10_96) then
        local r14_96 = DataMgr.WeaponTypeContrast[r11_96.ApplicationType]
        if r14_96 then
          rawset(r13_96, "CharName", string.format(GText("UI_SkinPreview_WeaponType"), GText(r14_96.WeaponTagTextmap)))
          rawset(r13_96, "WeaponTypeIcon", r14_96.Icon)
        end
        r0_96.SkinMap[r13_96.SkinId] = r13_96
        table.insert(r0_96.SkinArray, r13_96)
        r0_96:OnSkinContentCreated(r13_96)
      end
    end
  end
  -- close: r6_96
  table.sort(r0_96.SkinArray, function(r0_97, r1_97)
    -- line: [1614, 1616] id: 97
    return r0_97.SkinId < r1_97.SkinId
  end)
  local r6_96 = r0_96.Target:Data()
  local r7_96 = NewObject(UIUtils.GetCommonItemContentClass())
  rawset(r7_96, "SkinId", r2_96)
  rawset(r7_96, "IconPath", r6_96.LongIcon and r6_96.GachaIcon)
  rawset(r7_96, "Owner", r0_96)
  rawset(r7_96, "OnClicked", r0_96.OnSkinItemClicked)
  rawset(r7_96, "bDyeable", true)
  rawset(r7_96, "IsTargetUnowned", r0_96.IsTargetUnowned)
  r0_96.SkinMap[r7_96.SkinId] = r7_96
  table.insert(r0_96.SkinArray, 1, r7_96)
  r0_96:OnSkinContentCreated(r7_96)
  if r4_96 and r0_96.SkinMap[r4_96] then
    r0_96.CurrentSkinContent = r0_96.SkinMap[r4_96]
    r0_96.CurrentSkinContent.IsEquipped = true
  end
  r0_96:InitSkinList()
end
function r2_0.OnWeaponSkinChanged(r0_98, r1_98, r2_98, r3_98)
  -- line: [1637, 1649] id: 98
  r0_98:BlockAllUIInput(false)
  if not ErrorCode:Check(r1_98) then
    return 
  end
  r0_98:ResetTarget()
  if r0_98.CurrentSkinContent then
    r0_98:SetSkinIsCurrentUse(r0_98.CurrentSkinContent, false)
  end
  r0_98.CurrentSkinContent = r0_98.SkinMap[r3_98]
  r0_98:SetSkinIsCurrentUse(r0_98.CurrentSkinContent, true)
  r0_98:UpdateFunctionBtn(r0_98.CurrentSkinContent)
end
function r2_0.OnWeaponSkinConfirmBtnClicked(r0_99)
  -- line: [1652, 1659] id: 99
  if not r0_99.SelectedSkinId or r0_99.SelectedSkinId <= 0 then
    return 
  end
  r0_99:BlockAllUIInput(true)
  GWorld:GetAvatar():ChangeWeaponAppearanceSkin(r0_99.Target.Uuid, r0_99.SelectedSkinId)
end
function r2_0.InitWeaponAccessory(r0_100)
  -- line: [1664, 1688] id: 100
  r0_100.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  r0_100:CreateWeaponAccessoryContents(r0_100.Target)
  if r0_100.ArmoryHelper then
    r0_100.ArmoryHelper:ResetRotation()
  end
  r0_100.NoneAccessory.IsSelect = false
  r0_100.CurrentContent = r0_100.NoneAccessory
  if #r0_100.Array_WeaponAccessoryContents <= 0 then
    r0_100.List_Accessory:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_100:UpdateAccessoryDetails(r0_100.CurrentContent)
    return 
  end
  if r0_100.ComparedContent then
    r0_100.ComparedContent.IsSelect = false
    if r0_100.ComparedContent.SelfWidget then
      r0_100.ComparedContent.SelfWidget:SetSelected(r0_100.ComparedContent.IsSelect)
    end
  end
  r0_100.ComparedContent = nil
  r0_100:InitWeaponAccessoryList()
  r0_100:SelectAccessoryItem(r0_100.ComparedContent)
  r0_100.List_Accessory:BP_ScrollItemIntoView(r0_100.ComparedContent)
end
local function r4_0(r0_101, r1_101)
  -- line: [1690, 1701] id: 101
  local r3_101 = r0_101:CreateWeaponAccessoryContent(DataMgr.WeaponAccessory[r1_101])
  if r3_101 then
    r3_101.SoundDataName = "WeaponAccessory"
    r0_101.BP_AccessoryContents:Add(r3_101)
    r0_101.Map_AccessoryContents[r1_101] = r3_101
    table.insert(r0_101.Array_WeaponAccessoryContents, r3_101)
    r0_101:CheckWeaponAccessoryContentReddot(r1_101)
    r0_101:OnAccessoryContentCreated(r3_101)
  end
end
function r2_0.CheckWeaponAccessoryContentReddot(r0_102, r1_102)
  -- line: [1703, 1717] id: 102
  -- notice: unreachable block#10
  if r0_102.NoReddot then
    return 
  end
  local r2_102 = r0_102.Map_AccessoryContents[r1_102]
  if not r2_102 then
    return 
  end
  local r3_102 = {}
  if ReddotManager.GetTreeNode(CommonConst.DataType.WeaponAccessory) then
    r3_102 = ReddotManager.GetLeafNodeCacheDetail(CommonConst.DataType.WeaponAccessory) and {}
  end
  local r5_102 = r3_102[r1_102]
  if r5_102 == 1 then
    r5_102 = UIConst.RedDotType.NewRedDot
  else
    r5_102 = false
  end
  r2_102.RedDotType = r5_102
end
function r2_0.CreateWeaponAccessoryContents(r0_103, r1_103, r2_103)
  -- line: [1719, 1757] id: 103
  if r0_103.IsAccessoryContentsCreated and not r2_103 then
    return 
  end
  r0_103.IsAccessoryContentsCreated = true
  r0_103.CurrentContent = nil
  r0_103.ComparedContent = nil
  r0_103.NoneAccessory = NewObject(UIUtils.GetCommonItemContentClass())
  r0_103.NoneAccessory.Id = -1
  r0_103.NoneAccessory.Parent = r0_103
  r0_103.NoneAccessory.Icon = UIUtils.GetNoneAccessoryIconPath()
  r0_103.NoneAccessory.ItemType = CommonConst.DataType.WeaponAccessory
  r0_103.BP_AccessoryContents:Clear()
  r0_103.BP_AccessoryContents:Add(r0_103.NoneAccessory)
  r0_103:OnAccessoryContentCreated(r0_103.NoneAccessory)
  r0_103.Map_AccessoryContents = {}
  r0_103.Array_WeaponAccessoryContents = {}
  local r3_103 = GWorld:GetAvatar()
  for r8_103, r9_103 in pairs(DataMgr.WeaponAccessory) do
    if r3_103.WeaponAccessorys[r8_103] or CommonUtils.IsCurrentVersionRealease(CommonConst.DataType.WeaponAccessory, r8_103) then
      r4_0(r0_103, r8_103)
    end
  end
  -- close: r4_103
  for r8_103, r9_103 in pairs(r3_103.WeaponAccessorys) do
    local r10_103 = r0_103.Map_AccessoryContents[r9_103]
    if r10_103 then
      r10_103.IsHide = nil
      r10_103.LockType = nil
    end
  end
  -- close: r4_103
  for r9_103, r10_103 in pairs(r1_103:GetAppearance().Accessory) do
    local r11_103 = r0_103.Map_AccessoryContents[r10_103]
    if r11_103 then
      r11_103.IsSelect = true
    end
  end
  -- close: r5_103
end
function r2_0.OnAccessoryContentCreated(r0_104, r1_104)
  -- line: [1759, 1760] id: 104
end
function r2_0.CreateWeaponAccessoryContent(r0_105, r1_105)
  -- line: [1762, 1776] id: 105
  local r2_105 = NewObject(UIUtils.GetCommonItemContentClass())
  r2_105.ItemType = CommonConst.DataType.WeaponAccessory
  r2_105.Icon = r1_105.Icon and ""
  r2_105.Id = r1_105.WeaponAccessoryId
  r2_105.AccessoryId = r1_105.WeaponAccessoryId
  r2_105.SortPriority = r1_105.SortPriority and 0
  r2_105.LockType = 2
  r2_105.IsHide = r1_105.IsHide
  r2_105.IsSelect = false
  r2_105.UnlockOptionText = GText(r1_105.UnlockOption and "")
  r2_105.Parent = r0_105
  r2_105.Rarity = r1_105.Rarity and 0
  return r2_105
end
function r2_0.InitWeaponAccessoryList(r0_106)
  -- line: [1778, 1811] id: 106
  r0_106.List_Accessory:ClearListItems()
  table.sort(r0_106.Array_WeaponAccessoryContents, function(r0_107, r1_107)
    -- line: [1780, 1789] id: 107
    if r0_107.LockType and r1_107.LockType or not r0_107.LockType and not r1_107.LockType then
      if r0_107.SortPriority == r1_107.SortPriority then
        return r1_107.AccessoryId < r0_107.AccessoryId
      end
      return r1_107.SortPriority < r0_107.SortPriority
    else
      return r1_107.LockType
    end
  end)
  r0_106.List_Accessory:AddItem(r0_106.NoneAccessory)
  r0_106.List_Accessory:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_106.FilteredContents = {}
  for r5_106, r6_106 in ipairs(r0_106.Array_WeaponAccessoryContents) do
    if not r6_106.IsHide then
      if r0_106.JumpToAccessoryId and r0_106.JumpToAccessoryId == r6_106.AccessoryId then
        r0_106.ComparedContent = r6_106
      end
      if r6_106.IsSelect then
        r0_106.CurrentContent = r6_106
      end
      r0_106.List_Accessory:AddItem(r6_106)
      table.insert(r0_106.FilteredContents, r6_106)
    end
  end
  -- close: r1_106
  r0_106.JumpToAccessoryId = nil
  r0_106.CurrentContent.IsSelect = true
  r0_106.ComparedContent = r0_106.ComparedContent and r0_106.CurrentContent
  r0_106.ComparedContent.IsSelect = true
end
function r2_0.OnWeaponAccessoryConfirmBtnClicked(r0_108)
  -- line: [1813, 1827] id: 108
  r0_108:BlockAllUIInput(true)
  local r1_108 = GWorld:GetAvatar()
  if r0_108.ComparedContent.AccessoryId then
    r1_108:ChangeWeaponAppearanceAccessory(r0_108.Target.Uuid, r0_108.ComparedContent.AccessoryId)
  else
    r1_108:ChangeWeaponAppearanceAccessory(r0_108.Target.Uuid, -1)
  end
end
function r2_0.OnWeaponAccessoryChanged(r0_109, r1_109, r2_109, r3_109)
  -- line: [1830, 1838] id: 109
  r0_109:BlockAllUIInput(false)
  if not ErrorCode:Check(r1_109) then
    return 
  end
  r0_109:ResetTarget()
  r0_109:OnEquipedCharAccessoryContentChanged()
  r0_109:UpdateAccessoryDetails(r0_109.CurrentContent)
end
function r2_0.IsNoneAccessory(r0_110, r1_110)
  -- line: [1846, 1848] id: 110
end
function r2_0.UpdateAccessoryDetails(r0_111, r1_111)
  -- line: [1850, 1984] id: 111
  if r0_111.Type == "Char" then
    local r2_111 = nil
    if r0_111.CurrentAccessoryTabIdx then
      local r3_111 = r0_111.AccessoryTabsArray[r0_111.CurrentAccessoryTabIdx]
      r2_111 = r3_111 and r3_111.AccessoryType
    end
    r0_111:UpdateAccessoryCamera(r1_111.AccessoryId, r2_111)
  end
  r0_111.Panel_Dye:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_111.Panel_Video:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_111.Panel_Buy:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_111.Btn_Function:UnBindEventOnClickedByObj(r0_111)
  if r0_111.CurrentContent == r1_111 then
    r0_111.WidgetSwitcher_BtnState:SetActiveWidgetIndex(r0_111.BtnWidgetState.Equipped)
    r0_111.Text_Desc:SetText(GText("UI_Accessory_Equipped"))
    if r0_111.IsCharacterTrialMode or r0_111.IsTargetUnowned then
      r0_111.Btn_Function:SetText(GText("UI_CharPreview_Accessory_In_Trial"))
    end
  elseif r1_111.LockType then
    local r2_111 = r0_111:GetShopItemByAccessoryId(r1_111.AccessoryId)
    local r3_111 = r2_111 and DataMgr.ShopItem[r2_111]
    local r4_111 = false
    local r5_111 = nil
    if r3_111 then
      r5_111 = ShopUtils:GetShopItemPrice(r3_111.ItemId)
      r3_111 = setmetatable({}, {
        __index = r3_111,
      })
      local r6_111 = ShopUtils:CanPurchase(r3_111, r3_111.PriceType, r5_111)
      r4_111 = ShopUtils:GetShopItemCanShow(r2_111) and r6_111
    end
    if r4_111 then
      if not r0_111.IsPreviewMode then
        r0_111.Panel_Buy:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      end
      r0_111.WidgetSwitcher_BtnState:SetActiveWidgetIndex(r0_111.BtnWidgetState.Unequipped)
      r0_111.Btn_Function:SetText(GText("UI_SHOP_PURCHASE"))
      local r6_111 = DataMgr.ShopItem[r2_111]
      local r7_111 = r6_111.PriceType
      local r8_111 = GWorld:GetAvatar()
      local r9_111 = r8_111.Resources[r7_111]
      if r9_111 then
        r9_111 = r8_111.Resources[r7_111].Count and 0
      else
        goto label_145	-- block#20 is visited secondly
      end
      local r10_111 = nil
      if r9_111 < r5_111 then
        r10_111 = r5_111 + r9_111
      else
        r10_111 = r5_111
      end
      r0_111.WBP_Com_Cost:InitContent({
        ResourceId = r6_111.PriceType,
        Denominator = r10_111,
        Numerator = r5_111,
      })
      if r9_111 < r5_111 then
        r0_111.Btn_Function:ForbidBtn(true)
      else
        r0_111.Btn_Function:ForbidBtn(false)
        r0_111.Btn_Function:BindEventOnClicked(r0_111, r0_111.OnBuyBtnClicked)
        r0_111.ConfirmBtnFunc = r0_111.OnBuyBtnClicked
      end
    else
      r0_111.WidgetSwitcher_BtnState:SetActiveWidgetIndex(r0_111.BtnWidgetState.Locked)
      if r1_111.UnlockOptionText and r1_111.UnlockOptionText ~= "" then
        r0_111.Text_Lock:SetText(r1_111.UnlockOptionText)
        r0_111.Btn_Function:ForbidBtn(true)
      else
        r0_111.Text_Lock:SetText(GText("UI_Aaccessory_Locked"))
        r0_111.Btn_Function:ForbidBtn(true)
      end
    end
    if r0_111.IsCharacterTrialMode then
      r0_111.WidgetSwitcher_BtnState:SetActiveWidgetIndex(r0_111.BtnWidgetState.Locked)
      if r1_111.UnlockOptionText and r1_111.UnlockOptionText ~= "" then
        r0_111.Text_Lock:SetText(r1_111.UnlockOptionText)
      else
        r0_111.Text_Lock:SetText(GText("UI_Aaccessory_Locked"))
      end
    end
  else
    r0_111.WidgetSwitcher_BtnState:SetActiveWidgetIndex(r0_111.BtnWidgetState.Unequipped)
    r0_111.Btn_Function:SetText(GText("UI_Accessory_Equip"))
    r0_111.Btn_Function:BindEventOnClicked(r0_111, r0_111.OnConfirmBtnClicked)
    r0_111.ConfirmBtnFunc = r0_111.OnConfirmBtnClicked
    r0_111.Btn_Function:ForbidBtn(false)
    if r0_111.IsCharacterTrialMode or r0_111.IsTargetUnowned then
      r0_111.Btn_Function:SetText(GText("UI_CharPreview_Cannot_Equip"))
      r0_111.Btn_Function:ForbidBtn(true)
    end
  end
  if r1_111 == r0_111.NoneAccessory then
    r0_111.VB_Info:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_111.Tag_Quality:SetVisibility(ESlateVisibility.Collapsed)
    return 
  end
  r0_111.VB_Info:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  local r2_111 = nil
  if r0_111.Type == CommonConst.ArmoryType.Char then
    r2_111 = DataMgr.CharAccessory[r1_111.AccessoryId] and DataMgr.CharPartMesh[r1_111.AccessoryId]
    r0_111.Text_CharName:SetText(GText(UIConst.AccessoryTypeTextMap[r2_111.AccessoryType] and ""))
  else
    r2_111 = DataMgr.WeaponAccessory[r1_111.AccessoryId]
    r0_111.Text_CharName:SetText(GText(UIConst.AccessoryTypeTextMap.WeaponAccessory))
  end
  local r3_111 = {
    nil,
    nil,
    "Font_Blue",
    "Font_Purple",
    "Font_Gold",
    "Font_Red"
  }
  if r2_111.Rarity and r3_111[r2_111.Rarity] and r0_111[r3_111[r2_111.Rarity]] then
    r0_111.Text_Name:SetFont(r0_111[r3_111[r2_111.Rarity]])
  end
  r0_111.Text_Name:SetText(GText(r2_111.Name))
  r0_111.Text_Info:SetText(GText(r2_111.Des))
  r0_111.Text_SkinName_World:SetText(EnText(r2_111.Name))
  r0_111.Text_Char_None:SetVisibility(ESlateVisibility.Collapsed)
  r0_111.Image_Element:SetVisibility(ESlateVisibility.Collapsed)
  r0_111.Tag_Quality:SetVisibility(ESlateVisibility.Collapsed)
  local r4_111 = r0_0:GetCharNoneAccessoryIconPaths()[r2_111.AccessoryType]
  if r4_111 then
    r0_111.Image_Element:SetBrushResourceObject(LoadObject(r4_111))
    r0_111.Image_Element:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  if r2_111.Rarity then
    r0_111.Tag_Quality:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_111.Tag_Quality:Init(r2_111.Rarity)
  end
  if not r0_111:IsAnimationPlaying(r0_111.In) then
    r0_111:PlayAnimation(r0_111.Change)
  end
  if r1_111 ~= r0_111.NoneAccessory and r1_111.RedDotType and not r0_111.NoReddot then
    r0_0:SetItemReddotRead(r1_111, true)
  end
end
function r2_0.OnBuyBtnClicked(r0_112)
  -- line: [1987, 2003] id: 112
  local r2_112 = DataMgr.ShopItem[r0_112:GetShopItemByAccessoryId(r0_112.ComparedContent.AccessoryId)]
  if not r2_112 then
    return 
  end
  UIManager(r0_112):ShowCommonPopupUI(100041, {
    ShopItemData = r2_112,
    ShopType = 0,
    Funds = {
      {
        FundId = r2_112.PriceType,
        FundNeed = ShopUtils:GetShopItemPrice(r2_112.ItemId),
      }
    },
    ShowParentTabCoin = true,
    RightCallbackObj = r0_112,
    RightCallbackFunction = r0_112.PurchaseAccessory,
  }, r0_112)
end
function r2_0.PurchaseAccessory(r0_113)
  -- line: [2006, 2018] id: 113
  local r1_113 = GWorld:GetAvatar()
  if not r1_113 then
    return 
  end
  local r3_113 = DataMgr.ShopItem[r0_113:GetShopItemByAccessoryId(r0_113.ComparedContent.AccessoryId)]
  if not r3_113 then
    return 
  end
  r0_113:BlockAllUIInput(true)
  r1_113:PurchaseShopItem(r3_113.ItemId, 1)
end
function r2_0.OnPurchaseShopItem(r0_114, r1_114)
  -- line: [2022, 2027] id: 114
  r0_114:BlockAllUIInput(false)
  if r1_114 ~= ErrorCode.RET_SUCCESS then
    return 
  end
end
function r2_0.OnWeaponColorsChanged(r0_115)
  -- line: [2029, 2031] id: 115
  r0_115:ResetTarget()
end
function r2_0.OnEquipedCharAccessoryContentChanged(r0_116)
  -- line: [2033, 2040] id: 116
  r0_0:SetItemSelectTag(r0_116.CurrentContent, false)
  r0_0:SetItemSelectTag(r0_116.ComparedContent, true)
  r0_116.CurrentContent = r0_116.ComparedContent
  if r0_116.CurrentContent.AccessoryType then
    r0_116[r0_116.CurrentContent.AccessoryType .. "Content"] = r0_116.CurrentContent
  end
end
function r2_0.GetShopItemByAccessoryId(r0_117, r1_117)
  -- line: [2042, 2046] id: 117
  local r3_117 = DataMgr.TypeId2ShopItem[r0_117.Type .. "Accessory"]
  return r3_117 and r3_117[r1_117] and r3_117[r1_117][1]
end
function r2_0.OnHideUIKeyDown(r0_118)
  -- line: [2051, 2060] id: 118
  r0_118.bSelfHidden = not r0_118.bSelfHidden
  if r0_118.bSelfHidden then
    r0_118:SetRenderOpacity(0)
    r0_118.Image_Click.Slot:SetZOrder(10)
  else
    r0_118:SetRenderOpacity(1)
    r0_118.Image_Click.Slot:SetZOrder(-1)
  end
end
function r2_0.ResetTarget(r0_119)
  -- line: [2062, 2072] id: 119
  if r0_119.IsPreviewMode then
    return 
  end
  local r1_119 = r0_0:GetAvatar()
  if r0_119.Type == CommonConst.ArmoryType.Char then
    r0_119.Target = r1_119.Chars[r0_119.Target.Uuid] and r0_119.Target
  else
    r0_119.Target = r1_119.Weapons[r0_119.Target.Uuid] and r0_119.Target
  end
end
function r2_0.OpenDye(r0_120)
  -- line: [2074, 2109] id: 120
  local r1_120 = {
    Target = r0_120.Target,
    Type = r0_120.Type,
    SkinId = r0_120.SelectedSkinId,
    IsPreviewMode = r0_120.IsPreviewMode,
    Parent = r0_120,
    OnCloseCallback = function()
      -- line: [2077, 2079] id: 121
      r0_120:ResetTarget()
    end,
  }
  if r1_120.Target and r1_120.Target.Uuid == 1 then
    r1_120.Target.Uuid = r1_120.SkinId
    local r2_120 = r0_0:GetAvatar()
    if r2_120 and r0_120.Type == CommonConst.ArmoryType.Char and r2_120.Chars then
      for r7_120, r8_120 in pairs(r2_120.Chars) do
        if r8_120.CharId == r1_120.Target.CharId then
          r1_120.Target = r8_120
          r1_120.bRealCharOrWeapon = true
          break
        end
      end
      -- close: r3_120
    elseif r0_120.Type == CommonConst.ArmoryType.Weapon and r2_120.Weapons then
      for r7_120, r8_120 in pairs(r2_120.Weapons) do
        if r8_120.WeaponId == r1_120.Target.WeaponId then
          r1_120.Target = r8_120
          r1_120.bRealCharOrWeapon = true
          break
        end
      end
      -- close: r3_120
    end
  elseif r1_120.Target and r1_120.Target.Uuid ~= 1 then
    r1_120.bRealCharOrWeapon = true
  end
  local r2_120 = DataMgr.SystemUI.ArmoryDye
  if r0_120.Parent then
    UIManager(r0_120):LoadUI(UIConst.LoadInConfig, r2_120.UIName, r0_120:GetZOrder(), r1_120)
  else
    UIManager(r0_120):LoadUI(UIConst.LoadInConfig, r2_120.UIName, 100, r1_120)
  end
end
function r2_0.PlayInAnim(r0_122)
  -- line: [2111, 2131] id: 122
  r0_122:BlockAllUIInput(true)
  if r0_122.InAnimStyle then
    r0_122.ComBgSwitch = r0_122:CreateWidgetNew("ComBgSwitch")
    if r0_122.ComBgSwitch then
      r0_122.ComBgSwitch:AddToViewport(r0_122:GetZOrder())
      r0_122.ComBgSwitch:PlayAnimation(r0_122.ComBgSwitch.In)
      r0_122.ComBgSwitch:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      r0_122:SetRenderOpacity(0)
      r0_122:AddTimer(0.3, function()
        -- line: [2120, 2125] id: 123
        r0_122:SetRenderOpacity(1)
        r0_122:Init(r0_122.Params)
        r0_122:StopAnimation(r0_122.Out)
        r0_122:PlayAnimation(r0_122.In)
      end, false, 0, "DelayInit")
    end
  else
    r0_122:StopAnimation(r0_122.Out)
    r0_122:PlayAnimation(r0_122.In)
  end
end
function r2_0.PlayOutAnim(r0_124)
  -- line: [2133, 2141] id: 124
  r0_124:StopAnimation(r0_124.In)
  r0_124:PlayAnimation(r0_124.Out)
  if r0_124.IsPreviewMode and r0_124.ActorController then
    r0_124.ActorController:OnClosed()
  end
  AudioManager(r0_124):SetEventSoundParam(r0_124, "SkinOpen", {
    ToEnd = 1,
  })
  r0_124:BlockAllUIInput(true)
end
function r2_0.OnInAnimFinished(r0_125)
  -- line: [2143, 2145] id: 125
  r0_125:BlockAllUIInput(false)
end
function r2_0.OnOutAnimFinished(r0_126)
  -- line: [2147, 2149] id: 126
  r0_126:Close()
end
function r2_0.RealClose(r0_127)
  -- line: [2151, 2156] id: 127
  r2_0.Super.RealClose(r0_127)
  if r0_127.OnCloseCallback then
    r0_127.OnCloseCallback(r0_127.Parent)
  end
end
function r2_0.Destruct(r0_128)
  -- line: [2158, 2173] id: 128
  r0_128:RemoveAccessoryTabReddotListen()
  if r0_128.ActorController then
    r0_128.ActorController:HidePlayerActor(r0_128.UIName, false)
    r0_128.ActorController:UpdateCameraPPSetting()
  end
  r0_128:RemoveTimer("DelayInit")
  if IsValid(r0_128.ComBgSwitch) then
    r0_128.ComBgSwitch:RemoveFromParent()
  end
  r0_128:RemoveTopTabReddotListen()
  r2_0.Super.Destruct(r0_128)
  if r0_128.CurrentSkinContent and not r0_128.IsPreviewMode then
    r0_128:UpdateActorAppearance(r0_128.CurrentSkinContent.SkinId)
  end
end
AssembleComponents(r2_0)
return r2_0
