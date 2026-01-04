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
  -- line: [160, 165] id: 8
  r0_8:AddTimer(0.01, function()
    -- line: [162, 164] id: 9
    r0_8:OnNewSkinObtained(r1_8)
  end)
end
function r2_0.OnNewCharAccessoryObtained(r0_10, r1_10)
  -- line: [167, 171] id: 10
  r0_10:AddTimer(0.01, function()
    -- line: [168, 170] id: 11
    r0_10:OnNewAccessoryObtained(r1_10)
  end)
end
function r2_0.OnNewAccessoryObtained(r0_12, r1_12)
  -- line: [173, 205] id: 12
  if not r0_12.Map_AccessoryContents then
    return 
  end
  local r2_12 = r0_12.Map_AccessoryContents[r1_12]
  if not r2_12 then
    return 
  end
  r2_12.IsHide = nil
  if r0_12.NoReddot then
    r2_12.RedDotType = nil
  else
    r2_12.RedDotType = UIConst.RedDotType.NewRedDot
  end
  r2_12.LockType = nil
  if r2_12.SelfWidget then
    r2_12.SelfWidget:SetRedDot(r2_12.RedDotType)
    r2_12.SelfWidget:SetLock(r2_12.LockType)
  end
  if r0_12.CurrentTopTabIdx ~= r0_12.AccessoryTabIdx then
    return 
  end
  if r2_12 == r0_12.ComparedContent then
    r0_12:UpdateAccessoryDetails(r0_12.ComparedContent)
  end
  if r0_12.Type == CommonConst.ArmoryType.Char then
    r0_12:CheckCharAccessoryContentReddot(r1_12)
    r0_12:InitCharAccessoryList()
  else
    r0_12:CheckWeaponAccessoryContentReddot(r1_12)
    r0_12:InitWeaponAccessoryList()
  end
end
function r2_0.OnNewWeaponAccessoryObtained(r0_13, r1_13)
  -- line: [207, 211] id: 13
  r0_13:AddTimer(0.01, function()
    -- line: [208, 210] id: 14
    r0_13:OnNewAccessoryObtained(r1_13)
  end)
end
function r2_0.OnNewWeaponSkinObtained(r0_15, r1_15)
  -- line: [213, 217] id: 15
  r0_15:AddTimer(0.01, function()
    -- line: [214, 216] id: 16
    r0_15:OnNewSkinObtained(r1_15)
  end)
end
function r2_0.OnNewSkinObtained(r0_17, r1_17)
  -- line: [219, 238] id: 17
  if not r0_17.SkinMap then
    return 
  end
  local r2_17 = r0_17.SkinMap[r1_17]
  if r2_17 then
    r2_17.LockType = nil
    if not r0_17.NoReddot then
      r2_17.IsNew = true
    end
    if r2_17.Widget then
      r2_17.Widget.LockType = r2_17.LockType
      r2_17.Widget:SetReddot(r2_17.IsNew)
      r2_17.Widget:InitTextStyle()
    end
    if r0_17.SelectedSkinId == r1_17 and r0_17.CurrentTopTabIdx == r0_17.SkinTabIdx then
      r0_17:UpdateSkinDetails(r2_17)
    end
  end
end
function r2_0.RemoveTopTabReddotListen(r0_18)
  -- line: [240, 246] id: 18
  if r0_18.NoReddot then
    return 
  end
  r0_18:RemoveCharAppearanceReddotListen()
  r0_18:RemoveWeaponAppearanceReddotListen()
end
function r2_0.On_Image_Click_MouseButtonDown(r0_19, r1_19, r2_19)
  -- line: [249, 251] id: 19
  return r0_19:OnPointerDown(r1_19, r2_19)
end
function r2_0.OnMouseWheel(r0_20, r1_20, r2_20)
  -- line: [253, 255] id: 20
  return r0_20:OnMouseWheelScroll(r1_20, r2_20)
end
function r2_0.OnMouseButtonUp(r0_21, r1_21, r2_21)
  -- line: [257, 259] id: 21
  return r0_21:OnPointerUp(r1_21, r2_21)
end
function r2_0.OnMouseMove(r0_22, r1_22, r2_22)
  -- line: [261, 263] id: 22
  return r0_22:OnPointerMove(r1_22, r2_22)
end
function r2_0.OnTouchEnded(r0_23, r1_23, r2_23)
  -- line: [265, 267] id: 23
  return r0_23:OnPointerUp(r1_23, r2_23)
end
function r2_0.OnTouchMoved(r0_24, r1_24, r2_24)
  -- line: [269, 271] id: 24
  return r0_24:OnPointerMove(r1_24, r2_24)
end
function r2_0.OnMouseCaptureLost(r0_25)
  -- line: [273, 275] id: 25
  r0_25:OnPointerCaptureLost()
end
function r2_0.OnBackgroundClicked(r0_26)
  -- line: [277, 281] id: 26
  if r0_26.bSelfHidden then
    r0_26:OnHideUIKeyDown()
  end
end
function r2_0.OnBackKeyDown(r0_27)
  -- line: [283, 301] id: 27
  if r0_27.bSelfHidden then
    return r0_27:OnHideUIKeyDown()
  else
    if r0_27.CurrentTopTabIdx ~= r0_27.SkinTabIdx and r0_27.IsAccessoryContentsCreated then
      r0_27:RecoverAccessory()
    end
    if r0_27.OpenPreviewDyeFromChat then
      if r0_27.ActorController then
        r0_27.ActorController:OnClosed()
      end
      r0_27:Close()
    else
      r0_27:PlayOutAnim()
    end
  end
end
function r2_0.OnConfirmBtnClicked(r0_28)
  -- line: [303, 326] id: 28
  if r0_28.CurrentTopTabIdx == r0_28.SkinTabIdx then
    AudioManager(r0_28):PlayUISound(nil, "event:/ui/common/click_btn_confirm", nil, nil)
  else
    AudioManager(r0_28):PlayUISound(nil, "event:/ui/common/role_replace", nil, nil)
  end
  if r0_28.Type == CommonConst.ArmoryType.Char then
    if r0_28.CurrentTopTabIdx == r0_28.SkinTabIdx and not r0_28.CurrentLockContent then
      r0_28:OnCharSkinConfirmBtnClicked()
    elseif r0_28.CurrentTopTabIdx == r0_28.SkinTabIdx and r0_28.CurrentLockContent then
      r0_28:OnCharSkinGoToShopBtnClicked()
    else
      r0_28:OnCharAccessoryConfirmBtnClicked()
    end
  elseif r0_28.CurrentTopTabIdx == r0_28.SkinTabIdx and not r0_28.CurrentLockContent then
    r0_28:OnWeaponSkinConfirmBtnClicked()
  elseif r0_28.CurrentTopTabIdx == r0_28.SkinTabIdx and r0_28.CurrentLockContent then
    r0_28:OnWeaponSkinGoToShopBtnClicked()
  else
    r0_28:OnWeaponAccessoryConfirmBtnClicked()
  end
end
function r2_0.OnSkinItemClicked(r0_29, r1_29)
  -- line: [328, 334] id: 29
  if r1_29 == r0_29.SkinMap[r0_29.SelectedSkinId] then
    return 
  end
  r0_29:SelectSkinByContent(r1_29)
end
function r2_0.OnSkinListSelectionChanged(r0_30, r1_30, r2_30)
  -- line: [336, 337] id: 30
end
function r2_0.OnDyeBtnClicked(r0_31)
  -- line: [339, 344] id: 31
  local r1_31 = r0_31.SkinMap[r0_31.SelectedSkinId]
  if not r0_31.IsTargetUnowned and r1_31.bDyeable and not r1_31.LockType then
    r0_31:OpenDye()
  end
end
function r2_0.InitUIInfo(r0_32, r1_32, r2_32, r3_32, r4_32)
  -- line: [348, 381] id: 32
  r2_0.Super.InitUIInfo(r0_32, r1_32, r2_32, r3_32, r4_32)
  AudioManager(r0_32):PlayUISound(r0_32, "event:/ui/armory/open", "SkinOpen", nil)
  if not r4_32 then
    r4_32 = {}
  end
  r0_32.Params = r4_32
  r0_32.SelectedSkinId = nil
  r0_32.Target = r4_32.Target
  r0_32.Type = r4_32.Type
  r0_32.OnCloseCallback = r4_32.OnCloseCallback
  r0_32.Parent = r4_32.Parent
  r0_32.IsTargetUnowned = r4_32.IsTargetUnowned
  r0_32.IsCharacterTrialMode = r4_32.IsCharacterTrialMode
  r0_32.IsPreviewMode = r4_32.IsPreviewMode
  r0_32.NoReddot = r0_32.IsPreviewMode and r0_32.IsCharacterTrialMode and r0_32.IsTargetUnowned
  r0_32.OpenPreviewDyeFromChat = r4_32.OpenPreviewDyeFromChat
  r0_32.OpenPreviewDyeFromShopItem = r4_32.OpenPreviewDyeFromShopItem
  r0_32.OpenPreviewDyeFromChatColors = r4_32.Colors
  if r0_32.Parent and r0_32.Parent.ActorController then
    r0_32.ActorController = r0_32.Parent.ActorController
  end
  r0_32.UIName = r0_32:GetUIConfigName()
  if not r0_32.ActorController then
    r0_32.InAnimStyle = 1
  end
  if not r0_32.InAnimStyle then
    r0_32:Init(r4_32)
  end
  r0_32:PlayInAnim()
end
function r2_0.Init(r0_33, r1_33)
  -- line: [383, 441] id: 33
  if not r0_33.ActorController then
    r0_33.IsPreviewMode = true
    r0_33.Target = r0_33:CreatePreviewTargetData(r1_33)
    r1_33.Target = r0_33.Target
    r1_33.EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon
    r1_33.ViewUI = r0_33
    r0_33.ActorController = r0_33:CreatePreviewActor(r1_33)
    r0_33.ActorController:OnOpened()
    r0_33.TabConfig.Tabs = nil
    r0_33.TabConfig.LeftKey = nil
    r0_33.TabConfig.RightKey = nil
  end
  if r0_33.IsPreviewMode or r0_33.IsCharacterTrialMode then
    r0_33.TabConfig.DynamicNode = {
      "Back",
      "BottomKey"
    }
  end
  if r0_33.IsPreviewMode then
    r0_33.WidgetSwitcher_BtnState:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_33.WidgetSwitcher_State:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    r0_33.WidgetSwitcher_BtnState:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r0_33.WidgetSwitcher_State:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  r0_33.IsSkinWidgetNotReady = true
  r0_33.Tab_Skin:Init(r0_33.TabConfig)
  r0_33.AppearanceSutiIndex = r0_33.Target.CurrentAppearanceIndex
  r0_33.SelectedSkinId = r0_33.Target:GetAppearance(r0_33.AppearanceSutiIndex).SkinId
  r0_33.JumpToCharAccessoryType = r1_33.AccessoryType
  r0_33.Tab_Skin:BindEventOnTabSelected(nil, nil)
  if r1_33.AccessoryId or r1_33.AccessoryType then
    r0_33.JumpToAccessoryId = r1_33.AccessoryId
    r0_33.Tab_Skin:SelectTab(r0_33.AccessoryTabIdx)
    r0_33:OnTopTabSelected({
      Idx = r0_33.AccessoryTabIdx,
    })
  else
    r0_33.JumpToSkinId = r1_33.SkinId
    r0_33.Tab_Skin:SelectTab(r0_33.SkinTabIdx)
    r0_33:OnTopTabSelected({
      Idx = r0_33.SkinTabIdx,
    })
  end
  r0_33.Tab_Skin:BindEventOnTabSelected(r0_33, r0_33.OnTopTabSelected)
  r0_33:AddTopTabReddotListen()
  if r0_33.OpenPreviewDyeFromChat then
    r0_33:BlockAllUIInput(true)
    r0_33:AddTimer(0.1, function()
      -- line: [430, 434] id: 34
      if not r0_33 then
        return 
      end
      r0_33:StopAllAnimations()
      r0_33:OpenDye()
    end, false, 0, "OpenDye")
    r0_33:AddTimer(0.2, function()
      -- line: [435, 438] id: 35
      if not r0_33 then
        return 
      end
      r0_33:BlockAllUIInput(false)
    end, false, 0, "UnBlockAllUIInput")
  end
  r0_33:OnInited()
end
function r2_0.OnInited(r0_36)
  -- line: [443, 444] id: 36
end
function r2_0.OnLoaded(r0_37, ...)
  -- line: [446, 448] id: 37
  r2_0.Super.OnLoaded(r0_37, ...)
end
function r2_0.OnTopTabSelected(r0_38, r1_38, r2_38)
  -- line: [450, 479] id: 38
  r0_38.CurrentTopTabIdx = r1_38.Idx
  if r0_38.ActorController then
    r0_38.ActorController:UpdateCameraPPSetting()
  end
  if r0_38.Type == CommonConst.ArmoryType.Char then
    if r0_38.CurrentTopTabIdx == r0_38.SkinTabIdx then
      if r0_38.IsAccessoryContentsCreated then
        r0_38:RecoverAccessory()
      end
      r0_38:InitCharSkin()
    else
      if r0_38.ActorController then
        r0_38.ActorController:UpdateCameraPPSetting({
          IsAccessoryPPSetting = true,
        })
      end
      r0_38.Tab_Accessory:SetVisibility(UIConst.VisibilityOp.Visible)
      r0_38:InitCharAccessory()
    end
  elseif r0_38.CurrentTopTabIdx == r0_38.SkinTabIdx then
    if r0_38.IsAccessoryContentsCreated then
      r0_38:RecoverAccessory()
    end
    r0_38:InitWeaponSkin()
  else
    r0_38.Tab_Accessory:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_38:InitWeaponAccessory()
  end
end
function r2_0.InitSkinList(r0_39)
  -- line: [484, 495] id: 39
  if r0_39.SkinArray == nil then
    return 
  end
  r0_39.List_Skin:ClearListItems()
  for r5_39, r6_39 in ipairs(r0_39.SkinArray) do
    rawset(r6_39, "Idx", r5_39)
    rawset(r6_39, "IsCurrentUse", r0_39.SkinArray[r5_39].SkinId == r0_39.CurrentSkinContent.SkinId)
    r0_39.List_Skin:AddItem(r6_39)
  end
  -- close: r1_39
  r0_39.List_Skin:RequestFillEmptyContent()
end
function r2_0.OnSkinListEntryReleased(r0_40, r1_40)
  -- line: [497, 499] id: 40
  r0_40:DelayUpdateListArrow()
end
function r2_0.OnSkinListEntryGenerated(r0_41, r1_41)
  -- line: [501, 503] id: 41
  r0_41:DelayUpdateListArrow()
end
function r2_0.OnAccessoryListEntryGenerated(r0_42, r1_42)
  -- line: [505, 507] id: 42
  r0_42:DelayUpdateListArrow()
end
function r2_0.OnAccessoryListEntryReleased(r0_43, r1_43)
  -- line: [509, 511] id: 43
  r0_43:DelayUpdateListArrow()
end
function r2_0.DelayUpdateListArrow(r0_44)
  -- line: [513, 517] id: 44
  r0_44:AddTimer(0.2, function()
    -- line: [514, 516] id: 45
    r0_44:UpdateListArrow()
  end)
end
function r2_0.UpdateListArrow(r0_46)
  -- line: [519, 546] id: 46
  local r1_46 = nil
  local r2_46 = nil
  local r3_46 = nil
  local r4_46 = nil
  if r0_46.CurrentTopTabIdx == r0_46.SkinTabIdx then
    r1_46 = r0_46.List_Skin
    r3_46 = r0_46.List_Arrow_Up
    r4_46 = r0_46.List_Arrow_Down
  else
    r1_46 = r0_46.List_Accessory
    r3_46 = r0_46.List_Arrow_Up_1
    r4_46 = r0_46.List_Arrow_Down_1
  end
  local r5_46 = r1_46:GetNumItems()
  r2_46 = r1_46:GetNumItemsPerLine()
  local r6_46, r7_46 = UIUtils.GetMinAndMaxDisplayedItemIndex(r1_46)
  if r2_46 < r6_46 then
    r3_46:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    r3_46:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if r7_46 < r5_46 then
    r4_46:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    r4_46:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r2_0.SelectSkinById(r0_47, r1_47)
  -- line: [548, 551] id: 47
  if not r1_47 then
    r1_47 = r0_47.CurrentSkinContent.SkinId
  end
  r0_47:SelectSkinByContent(r0_47.SkinMap[r1_47])
end
function r2_0.SelectSkinByContent(r0_48, r1_48)
  -- line: [553, 570] id: 48
  if not r1_48 then
    return 
  end
  local r2_48 = r0_48.SkinMap[r0_48.SelectedSkinId]
  if r2_48 then
    r2_48.IsSelect = false
    if r2_48.Widget then
      r2_48.Widget:SetIsSelected(r2_48.IsSelect)
    end
  end
  r2_48 = r1_48
  if r2_48 then
    r2_48.IsSelect = true
    if r2_48.Widget then
      r2_48.Widget:SetIsSelected(r2_48.IsSelect)
    end
  end
  r0_48:UpdateSkinDetails(r1_48)
end
function r2_0.UpdateSkinDetails(r0_49, r1_49)
  -- line: [572, 630] id: 49
  if not r1_49 then
    return 
  end
  if r1_49.SkinId ~= r0_49.SelectedSkinId and not r0_49:IsAnimationPlaying(r0_49.In) then
    r0_49:PlayAnimation(r0_49.Change)
  end
  r0_49.Panel_Buy:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_49.SelectedSkinId = r1_49.SkinId
  if r1_49.Name and r1_49.Name ~= "" then
    r0_49.VB_Info:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    r0_49.VB_Info:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  local r2_49 = {
    nil,
    nil,
    "Font_Blue",
    "Font_Purple",
    "Font_Gold",
    "Font_Red"
  }
  if r1_49.Rarity and r2_49[r1_49.Rarity] and r0_49[r2_49[r1_49.Rarity]] then
    r0_49.Text_Name:SetFont(r0_49[r2_49[r1_49.Rarity]])
  end
  r0_49.Text_Name:SetText(r1_49.Name)
  r0_49.Text_Info:SetText(r1_49.Text)
  r0_49.Text_SkinName_World:SetText(r1_49.Name_World)
  r0_49.Image_Element:SetVisibility(ESlateVisibility.Collapsed)
  r0_49.Text_Char_None:SetVisibility(ESlateVisibility.Collapsed)
  r0_49.Tag_Quality:SetVisibility(ESlateVisibility.Collapsed)
  if r1_49.ElementType then
    local r3_49 = "Armory_" .. r1_49.ElementType
    r0_49.Image_Element:SetBrushResourceObject(LoadObject("/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. r3_49 .. ".T_" .. r3_49))
    r0_49.Image_Element:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  if r1_49.WeaponTypeIcon then
    r0_49.Image_Element:SetBrushResourceObject(LoadObject(r1_49.WeaponTypeIcon))
    r0_49.Image_Element:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  if r1_49.CharName then
    r0_49.Text_CharName:SetText(r1_49.CharName)
  else
    r0_49.Text_CharName:SetText("")
  end
  if r1_49.NotOwned then
    r0_49.Text_Char_None:SetText(GText("UI_SkinPreview_CharNotOwned"))
    r0_49.Text_Char_None:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  if r1_49.Rarity then
    r0_49.Tag_Quality:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_49.Tag_Quality:Init(r1_49.Rarity)
  end
  r0_49:UpdateSkinVideo(r0_49.SelectedSkinId)
  r0_49:UpdateFunctionBtn(r1_49)
  r0_49:UpdateActorAppearance(r0_49.SelectedSkinId)
  if r1_49.IsNew and not r0_49.NoReddot then
    r0_0:SetItemReddotRead(r1_49, true)
  end
end
function r2_0.UpdateSkinVideo(r0_50, r1_50)
  -- line: [632, 647] id: 50
  local r2_50 = DataMgr.Skin[r1_50]
  if not r2_50 or r2_50.GetDisplayType ~= 1 or not r2_50.DisplayPath or not r2_50.VideoCover then
    r0_50.Panel_Video:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return 
  end
  rawset(r0_50, "SkinData", r2_50)
  r0_50.Panel_Video:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  local r3_50 = LoadObject(r2_50.VideoCover)
  if r3_50 then
    r0_50.Img_Video:SetBrushResourceObject(r3_50)
  end
  r0_50.Btn_Play.Btn_Area.OnClicked:Clear()
  r0_50.Btn_Play.Btn_Area.OnClicked:Add(r0_50, r0_50.OpenSkinVideo)
end
function r2_0.OpenSkinVideo(r0_51)
  -- line: [649, 662] id: 51
  local r1_51 = rawget(r0_51, "SkinData") and {}
  AudioManager(r0_51):PlayUISound(r0_51, "event:/ui/common/click_btn_large", nil, nil)
  local r2_51 = UIManager(r0_51):LoadUINew("ArmorySkinVideo", {
    Path = r1_51.DisplayPath,
    SoundPath = r1_51.GetSoundPath,
    DestructCB = function()
      -- line: [655, 657] id: 52
      r0_51:SetFocus()
    end,
  })
  if r2_51 then
    r2_51:SetFocus()
  end
end
function r2_0.UpdateFunctionBtn(r0_53, r1_53)
  -- line: [664, 725] id: 53
  if not r0_53.IsTargetUnowned and not r0_53.IsPreviewMode and not r0_53.IsCharacterTrialMode and r1_53.bDyeable and not r1_53.LockType then
    r0_53.Panel_Dye:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    r0_53.Panel_Dye:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  r0_53.Btn_Function:UnBindEventOnClickedByObj(r0_53)
  r0_53.CurrentLockContent = nil
  if r0_53.CurrentSkinContent == r1_53 then
    r0_53.WidgetSwitcher_BtnState:SetActiveWidgetIndex(r0_53.BtnWidgetState.Equipped)
    if r0_53.IsTargetUnowned then
      r0_53.Text_Desc:SetText(GText("UI_CharPreview_Accessory_In_Trial"))
    else
      r0_53.Text_Desc:SetText(GText("UI_Accessory_Equipped"))
    end
  else
    if r1_53.LockType then
      r0_53.WidgetSwitcher_BtnState:SetActiveWidgetIndex(r0_53.BtnWidgetState.Unequipped)
      r0_53.CurrentLockContent = r1_53
      local r2_53 = r0_53:CheckSkinGoToShopState()
      if r2_53 == r3_0.CanGoToShop then
        r0_53.Btn_Function:SetText(GText("UI_Skin_GotoBuy"))
        r0_53.Btn_Function:ForbidBtn(false)
      elseif r2_53 == r3_0.ItemNotOnSale then
        r0_53.WidgetSwitcher_BtnState:SetActiveWidgetIndex(r0_53.BtnWidgetState.Equipped)
        r0_53.Text_Desc:SetText(GText("UI_Skin_CannotBuy"))
      elseif r2_53 == r3_0.ItemIdNil or r2_53 == r3_0.ItemNotExist or r2_53 == r3_0.SkinNotValid then
        r0_53.WidgetSwitcher_BtnState:SetActiveWidgetIndex(r0_53.BtnWidgetState.Equipped)
        r0_53.Text_Desc:SetText(GText("UI_Skin_CannotBuy"))
      end
    else
      r0_53.WidgetSwitcher_BtnState:SetActiveWidgetIndex(r0_53.BtnWidgetState.Unequipped)
      if r0_53.IsTargetUnowned then
        r0_53.Btn_Function:SetText(GText("UI_CharPreview_Cannot_Equip"))
        r0_53.Btn_Function:ForbidBtn(true)
      else
        r0_53.Btn_Function:SetText(GText("UI_Accessory_Equip"))
        r0_53.Btn_Function:ForbidBtn(false)
      end
    end
    r0_53.Btn_Function:BindEventOnClicked(r0_53, r0_53.OnConfirmBtnClicked)
    r0_53.ConfirmBtnFunc = r0_53.OnConfirmBtnClicked
  end
  if r0_53.IsCharacterTrialMode then
    if r0_53.CurrentSkinContent == r1_53 then
      r0_53.WidgetSwitcher_BtnState:SetActiveWidgetIndex(r0_53.BtnWidgetState.Equipped)
      r0_53.Text_Desc:SetText(GText("UI_CharPreview_Accessory_In_Trial"))
    elseif r1_53.LockType then
      r0_53.WidgetSwitcher_BtnState:SetActiveWidgetIndex(r0_53.BtnWidgetState.Locked)
      r0_53.Text_Lock:SetText(GText("UI_Aaccessory_Locked"))
      r0_53.Btn_Function:ForbidBtn(true)
    else
      r0_53.WidgetSwitcher_BtnState:SetActiveWidgetIndex(r0_53.BtnWidgetState.Unequipped)
      r0_53.Btn_Function:SetText(GText("UI_CharPreview_Cannot_Equip"))
      r0_53.Btn_Function:ForbidBtn(true)
    end
  end
end
function r2_0.UpdateActorAppearance(r0_54, r1_54)
  -- line: [727, 731] id: 54
  r0_54:UpdateActorSkin(r1_54)
  r0_54:UpdateActorColors(r1_54)
end
function r2_0.UpdatePartMesh(r0_55, r1_55)
  -- line: [733, 740] id: 55
  if r0_55.Type ~= CommonConst.ArmoryType.Char or not r0_55.ActorController then
    return 
  end
  local r3_55 = r0_55.Target:GetSkin(r1_55 and r0_55.Target:GetAppearance().SkinId, r0_0:GetAvatar())
  r0_55.ActorController:ShowPartMesh(r3_55 and r3_55.IsShowPartMesh)
end
function r2_0.UpdateActorSkin(r0_56, r1_56)
  -- line: [743, 764] id: 56
  if r0_56.Type == CommonConst.ArmoryType.Char then
    if not r0_56.ActorController then
      return 
    end
    local r2_56 = r0_56.Target:DumpAppearanceSuit(r0_0:GetAvatar(), r0_56.AppearanceSutiIndex)
    r2_56.SkinId = r1_56
    r2_56.Colors = r0_56.Target:DumpColors(r0_0:GetAvatar(), r1_56)
    r0_56.ActorController:ChangeCharAppearance(r2_56)
    if r1_56 ~= r0_56.LastCharSkinId then
      r0_56.ActorController.DelayFrame = 30
      r0_56.ActorController.bPlaySameMontage = true
    else
      r0_56.ActorController.bPlaySameMontage = false
    end
    r0_56.LastCharSkinId = r1_56
    r0_56.ActorController:SetMontageAndCamera(CommonConst.ArmoryType.Char, "", "", "")
  else
    r0_56.ActorController:ChangeWeaponSkin(r1_56)
  end
end
function r2_0.UpdateActorColors(r0_57, r1_57)
  -- line: [767, 773] id: 57
  if r0_57.Type ~= CommonConst.ArmoryType.Char then
    r0_57.ActorController:ChangeWeaponColor(r0_57.Target:DumpColors(r1_57))
  end
end
function r2_0.InitCharSkin(r0_58)
  -- line: [780, 796] id: 58
  if r0_58.ActorController then
    r0_58.ActorController:SetMontageAndCamera(CommonConst.ArmoryType.Char, "", "", "")
    r0_58.ActorController:HidePlayerActor(r0_58.UIName, false)
  end
  local r1_58 = r0_58.JumpToSkinId and r0_58.SelectedSkinId
  if r0_58.JumpToSkinId then
    r0_58.LastCharSkinId = r0_58.JumpToSkinId
  end
  r0_58.JumpToSkinId = nil
  r0_58.WidgetSwitcher_State:SetActiveWidgetIndex(1)
  r0_58:InitCharSkinList(r0_58.Target)
  r0_58:SelectSkinById(r1_58)
  r0_58:AddTimer(0.01, function()
    -- line: [793, 795] id: 59
    r0_58.IsSkinWidgetNotReady = false
  end)
end
function r2_0.InitCharSkinList(r0_60, r1_60)
  -- line: [798, 878] id: 60
  -- error: decompile function#60: Condition failed: `def_pos <= last_end && last_end <= self.stmts.len()`
end
function r2_0.OnSkinContentCreated(r0_62)
  -- line: [880, 881] id: 62
end
function r2_0.OnCharSkinConfirmBtnClicked(r0_63)
  -- line: [883, 890] id: 63
  if not r0_63.SelectedSkinId or r0_63.SelectedSkinId <= 0 then
    return 
  end
  r0_63:BlockAllUIInput(true)
  GWorld:GetAvatar():ChangeCharAppearanceSkin(r0_63.Target.Uuid, r0_63.AppearanceSutiIndex, r0_63.SelectedSkinId)
end
function r2_0.CheckSkinGoToShopState(r0_64)
  -- line: [892, 938] id: 64
  if not r0_64.SelectedSkinId or r0_64.SelectedSkinId <= 0 then
    return r3_0.SkinNotValid
  end
  local r1_64 = nil
  if r0_64.Type == CommonConst.ArmoryType.Char then
    r1_64 = DataMgr.Skin[r0_64.SelectedSkinId]
  else
    r1_64 = DataMgr.WeaponSkin[r0_64.SelectedSkinId]
  end
  if not r1_64 then
    return r3_0.SkinNotValid
  end
  local r2_64 = r1_64.GoShopTypeId
  if not r2_64 or not next(r2_64) then
    return r3_0.ItemIdNil
  end
  local r3_64 = true
  for r8_64, r9_64 in ipairs(r2_64) do
    if DataMgr.ShopItem[r9_64] then
      r3_64 = false
      break
    end
  end
  -- close: r4_64
  if r3_64 then
    return r3_0.ItemNotExist
  end
  local r4_64 = GWorld:GetAvatar()
  if r4_64 then
    local r5_64 = true
    for r10_64, r11_64 in ipairs(r2_64) do
      if r4_64:CheckIsEffective(r11_64) then
        r5_64 = false
        break
      end
    end
    -- close: r6_64
    if r5_64 then
      return r3_0.ItemNotOnSale
    end
  end
  return r3_0.CanGoToShop
end
function r2_0.OnCharSkinGoToShopBtnClicked(r0_65)
  -- line: [940, 959] id: 65
  if not r0_65.SelectedSkinId or r0_65.SelectedSkinId <= 0 then
    return 
  end
  local r1_65 = DataMgr.Skin[r0_65.SelectedSkinId]
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
function r2_0.OnWeaponSkinGoToShopBtnClicked(r0_66)
  -- line: [961, 980] id: 66
  if not r0_66.SelectedSkinId or r0_66.SelectedSkinId <= 0 then
    return 
  end
  local r1_66 = DataMgr.WeaponSkin[r0_66.SelectedSkinId]
  if not r1_66 then
    return 
  end
  local r2_66 = r1_66.GoShopTypeId
  if not r2_66 or not next(r2_66) then
    return 
  end
  for r7_66, r8_66 in ipairs(r2_66) do
    local r9_66 = DataMgr.ShopItem[r8_66]
    if r9_66 then
      local r10_66, r11_66 = PageJumpUtils:CreateJumpToShopAccess(r9_66.ItemType, "Shop", r9_66.TypeId)
      if r10_66 and r11_66 then
        r11_66()
        return 
      end
    end
  end
  -- close: r3_66
  Utils.ScreenPrint("皮肤表对应的商品Id可能没配对,麻烦策划检查一下")
end
function r2_0.OnCharSkinChanged(r0_67, r1_67, r2_67, r3_67, r4_67)
  -- line: [982, 994] id: 67
  r0_67:BlockAllUIInput(false)
  if not ErrorCode:Check(r1_67) then
    return 
  end
  r0_67:ResetTarget()
  if r0_67.CurrentSkinContent then
    r0_67:SetSkinIsCurrentUse(r0_67.CurrentSkinContent, false)
  end
  r0_67.CurrentSkinContent = r0_67.SkinMap[r4_67]
  r0_67:SetSkinIsCurrentUse(r0_67.CurrentSkinContent, true)
  r0_67:UpdateFunctionBtn(r0_67.CurrentSkinContent)
end
function r2_0.SetSkinIsCurrentUse(r0_68, r1_68, r2_68)
  -- line: [996, 1004] id: 68
  if not r1_68 then
    return 
  end
  r1_68.IsCurrentUse = r2_68
  if r1_68.Widget then
    r1_68.Widget:SetIsCurrentUse(r1_68.IsCurrentUse)
  end
end
function r2_0.InitCharAccessory(r0_69)
  -- line: [1009, 1014] id: 69
  r0_69.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  r0_69:CreateCharAccessoryTabInfo()
  r0_69:CreateCharAccessoryContents(r0_69.Target, r0_69.SelectedSkinId)
  r0_69:CharAccessoryJumpTo()
end
function r2_0.CharAccessoryJumpTo(r0_70)
  -- line: [1017, 1034] id: 70
  local r2_70 = r0_70.JumpToCharAccessoryType
  local r3_70 = r0_70.Map_AccessoryContents[r0_70.JumpToAccessoryId]
  if r3_70 then
    local r4_70 = r0_70.AccessoryTabsMap[r3_70.AccessoryType]
    if r4_70 then
      r0_70.Tab_Accessory:SelectTab(r4_70.Idx)
      return 
    end
  else
    local r4_70 = r0_70.AccessoryTabsMap[r2_70]
    if r4_70 then
      r0_70.Tab_Accessory:SelectTab(r4_70.Idx)
      return 
    end
  end
  r0_70.Tab_Accessory:SelectTab(1)
end
function r2_0.CreateCharAccessoryTabInfo(r0_71, r1_71)
  -- line: [1037, 1092] id: 71
  if rawget(r0_71, "IsAccessoryTabInited") and not r1_71 then
    return 
  end
  rawset(r0_71, "IsAccessoryTabInited", true)
  rawset(r0_71, "CurrentAccessoryTabIdx", nil)
  rawset(r0_71, "AccessoryTypes", {
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
  rawset(r0_71, "FXAccessoryTypes", {
    [CommonConst.CharAccessoryTypes.FX_Dead] = true,
    [CommonConst.CharAccessoryTypes.FX_Teleport] = true,
    [CommonConst.CharAccessoryTypes.FX_Footprint] = true,
    [CommonConst.CharAccessoryTypes.FX_PlungingATK] = true,
    [CommonConst.CharAccessoryTypes.FX_HelixLeap] = true,
  })
  rawset(r0_71, "AttachableFXAccessoryTypes", {
    [CommonConst.CharAccessoryTypes.FX_Footprint] = true,
  })
  rawset(r0_71, "HidePlayerAccessoryTypes", {
    [CommonConst.CharAccessoryTypes.FX_Dead] = true,
    [CommonConst.CharAccessoryTypes.FX_Footprint] = true,
  })
  rawset(r0_71, "AccessoryTabsMap", {})
  rawset(r0_71, "AccessoryTabsArray", {})
  for r6_71, r7_71 in ipairs(r0_71.AccessoryTypes) do
    local r8_71 = {
      Owner = r0_71,
      AccessoryType = r7_71,
      Text = "",
      Idx = r6_71,
    }
    local r12_71 = r7_71
    r8_71.IconPath = "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Fashion_" .. r7_71 .. ".T_Tab_Fashion_" .. r12_71
    r0_71.AccessoryTabsMap[r8_71.AccessoryType] = r8_71
    table.insert(r0_71.AccessoryTabsArray, r8_71)
    r0_71:OnAccessoryTabContentCreated(r8_71)
  end
  -- close: r2_71
  rawset(r0_71, "TabConfigData", {
    ChildWidgetName = "TabSubIconItem",
    Tabs = r0_71.AccessoryTabsArray,
    SoundFunc = function(r0_72)
      -- line: [1085, 1087] id: 72
      AudioManager(r0_72):PlayUISound(r0_72, "event:/ui/common/click_btn_sort_tab", nil, nil)
    end,
    SoundFuncReceiver = r0_71,
  })
  r0_71.Tab_Accessory:Init(r0_71.TabConfigData)
  r0_71.Tab_Accessory:BindEventOnTabSelected(r0_71, r0_71.OnCharAccessoryTabClicked)
end
function r2_0.OnAccessoryTabContentCreated(r0_73, r1_73)
  -- line: [1094, 1095] id: 73
end
function r2_0.CreateCharAccessoryContents(r0_74, r1_74, r2_74, r3_74)
  -- line: [1098, 1190] id: 74
  r0_74.IsAccessoryContentsCreated = true
  r0_74.CurrentContent = nil
  r0_74.ComparedContent = nil
  rawset(r0_74, "NoneAccessory", NewObject(UIUtils.GetCommonItemContentClass()))
  rawset(r0_74.NoneAccessory, "Id", r0_74.NoneAccessoryId)
  rawset(r0_74.NoneAccessory, "AccessoryId", r0_74.NoneAccessoryId)
  rawset(r0_74.NoneAccessory, "Parent", r0_74)
  rawset(r0_74.NoneAccessory, "Icon", UIUtils.GetNoneAccessoryIconPath())
  rawset(r0_74.NoneAccessory, "ItemType", CommonConst.DataType.CharAccessory)
  r0_74.BP_AccessoryContents:Clear()
  r0_74.BP_AccessoryContents:Add(r0_74.NoneAccessory)
  rawset(r0_74, "Map_AccessoryContents", {})
  rawset(r0_74, "DefaultCharAccessoryIds", r0_0:GetDefaultCharAccessoryIds())
  local r4_74 = GWorld:GetAvatar()
  for r9_74, r10_74 in pairs(DataMgr.CharAccessory) do
    local r11_74 = r0_74:CreateCharAccessoryContent(r10_74)
    if r11_74 and (r4_74.CharAccessorys[r9_74] or CommonUtils.IsCurrentVersionRealease(CommonConst.DataType.CharAccessory, r9_74)) then
      r11_74.SoundDataName = "CharAccessory"
      r0_74.BP_AccessoryContents:Add(r11_74)
      r0_74.Map_AccessoryContents[r9_74] = r11_74
    end
  end
  -- close: r5_74
  rawset(r0_74, "PartMeshAccessory", nil)
  rawset(r0_74, "HornAccessory", nil)
  local r5_74 = r1_74:GetAppearance()
  local r6_74 = r1_74:GetSkin(r2_74 and r5_74.SkinId, r4_74)
  for r11_74, r12_74 in pairs(DataMgr.CharPartMesh) do
    local r13_74 = r0_74:CreateCharAccessoryContent(r12_74)
    if r13_74 then
      r13_74.SoundDataName = "CharPartMesh"
      r0_74.BP_AccessoryContents:Add(r13_74)
      r0_74.Map_AccessoryContents[r12_74.AccessoryId] = r13_74
      if r13_74.PartName == "PartMesh" then
        rawset(r0_74, "PartMeshAccessory", r13_74)
        rawset(r13_74, "IsSelect", false)
        rawset(r13_74, "bSelectTag", false)
        if r6_74 then
          if r5_74.Accessory[CommonConst.NewCharAccessoryTypes[r13_74.AccessoryType]] <= 0 then
            rawset(r13_74, "bSelectTag", r6_74.IsShowPartMesh)
          end
          rawset(r13_74, "LockType", nil)
        else
          rawset(r13_74, "LockType", 2)
        end
      elseif r13_74.PartName == "Horn" then
        r0_74.HornAccessory = r13_74
        r0_74.HornAccessory.IsSelect = r5_74.IsCornerVisible
        r0_74.HornAccessory.LockType = nil
      end
    end
  end
  -- close: r7_74
  for r11_74, r12_74 in pairs(r4_74.CharAccessorys) do
    local r13_74 = r0_74.Map_AccessoryContents[r12_74]
    if r13_74 then
      r13_74.IsHide = nil
      r13_74.LockType = nil
    end
  end
  -- close: r7_74
  for r11_74, r12_74 in pairs(r4_74.CharAccessorys) do
    r0_74:CheckCharAccessoryContentReddot(r12_74)
  end
  -- close: r7_74
  r0_74:AddAccessoryTabReddotListen()
  local r7_74 = r5_74.Accessory
  for r12_74, r13_74 in ipairs(r0_74.AccessoryTypes) do
    local r14_74 = CommonConst.NewCharAccessoryTypes[r13_74]
    if r14_74 then
      local r15_74 = r7_74[r14_74] and -1
      if r15_74 == r0_74.NoneAccessoryId then
        r0_74[r13_74 .. "Content"] = r0_74.NoneAccessory
      else
        r0_74[r13_74 .. "Content"] = r0_74.Map_AccessoryContents[r15_74]
      end
    end
  end
  -- close: r8_74
  if r0_74.PartMeshAccessory and r0_74.PartMeshAccessory.bSelectTag then
    r0_74[r0_74.PartMeshAccessory.AccessoryType .. "Content"] = r0_74.PartMeshAccessory
  end
  if r0_74.HornAccessory and r0_74.HornAccessory.bSelectTag then
    r0_74[r0_74.HornAccessory.AccessoryType .. "Content"] = r0_74.HornAccessory
  end
  for r12_74, r13_74 in ipairs(r0_74.AccessoryTypes) do
    if r0_74[r13_74 .. "Content"] then
      r0_74[r13_74 .. "Content"].bSelectTag = true
    end
  end
  -- close: r8_74
end
function r2_0.CheckCharAccessoryContentReddot(r0_75, r1_75)
  -- line: [1192, 1213] id: 75
  -- notice: unreachable block#13
  if r0_75.NoReddot then
    return 
  end
  local r2_75 = r0_75.Map_AccessoryContents[r1_75]
  if not r2_75 then
    return 
  end
  local r3_75 = DataMgr.CharAccessory[r1_75]
  if r3_75 and r3_75.AccessoryType then
    local r4_75 = CommonConst.DataType.CharAccessory .. r3_75.AccessoryType
    local r5_75 = ipairs
    local r6_75 = r3_75.Skin
    if not r6_75 then
      r6_75 = {}
      local r7_75 = ""
      -- setlist for #6 failed
    end
    for r9_75, r10_75 in r5_75(r6_75) do
      if ReddotManager.GetTreeNode(r4_75 .. r10_75) then
        local r12_75 = ReddotManager.GetLeafNodeCacheDetail(r4_75 .. r10_75)[r1_75]
        if r12_75 == 1 then
          r12_75 = UIConst.RedDotType.NewRedDot
        else
          r12_75 = false
        end
        r2_75.RedDotType = r12_75
        if r2_75.RedDotType then
          r0_75.AccessoryTabsMap[r3_75.AccessoryType].IsNew = true
          break
        end
      end
    end
    -- close: r5_75
  end
end
function r2_0.CreateCharAccessoryContent(r0_76, r1_76)
  -- line: [1215, 1250] id: 76
  if r1_76.AccessoryType then
    if r1_76.AccessoryId == r0_76.DefaultCharAccessoryIds[r1_76.AccessoryType] then
      return 
    end
    local r2_76 = true
    if r1_76.Skin then
      r2_76 = false
      local r3_76 = r0_76.SelectedSkinId
      for r8_76, r9_76 in ipairs(r1_76.Skin) do
        if r9_76 == r3_76 then
          r2_76 = true
          break
        end
      end
      -- close: r4_76
    end
    if r2_76 then
      local r3_76 = NewObject(UIUtils.GetCommonItemContentClass())
      rawset(r3_76, "ItemType", CommonConst.DataType.CharAccessory)
      rawset(r3_76, "Icon", r1_76.Icon and "")
      rawset(r3_76, "Id", r1_76.AccessoryId)
      rawset(r3_76, "AccessoryId", r1_76.AccessoryId)
      rawset(r3_76, "SortPriority", r1_76.SortPriority and 0)
      rawset(r3_76, "IsHide", r1_76.IsHide)
      rawset(r3_76, "LockType", 2)
      rawset(r3_76, "Rarity", r1_76.Rarity and 0)
      rawset(r3_76, "bSelectTag", false)
      rawset(r3_76, "IsSelect", false)
      rawset(r3_76, "AccessoryType", r1_76.AccessoryType)
      rawset(r3_76, "PartName", r1_76.PartName)
      rawset(r3_76, "UnlockOptionText", GText(r1_76.UnlockOption and ""))
      rawset(r3_76, "Parent", r0_76)
      return r3_76
    end
  end
end
function r2_0.AddAccessoryTabReddotListen(r0_77)
  -- line: [1253, 1276] id: 77
  if r0_77.NoReddot then
    return 
  end
  local r1_77 = r0_77.SelectedSkinId
  if not r0_77.TabNodeNames then
    r0_77.TabNodeNames = {}
  end
  for r6_77, r7_77 in pairs(r0_77.AccessoryTabsMap) do
    local r8_77 = r6_77
    local r9_77 = {}
    local r10_77 = CommonConst.DataType.CharAccessory .. r6_77
    local r11_77 = ReddotManager.GetTreeNode(r10_77)
    if r11_77 then
      r11_77 = 1 and nil
    else
      goto label_32	-- block#7 is visited secondly
    end
    r9_77[r10_77] = r11_77
    r10_77 = r10_77 .. r1_77
    r11_77 = ReddotManager.GetTreeNode(r10_77)
    if r11_77 then
      r11_77 = 1 and nil
    else
      goto label_47	-- block#10 is visited secondly
    end
    r9_77[r10_77] = r11_77
    if not r0_77.TabNodeNames[r8_77] and not IsEmptyTable(r9_77) then
      ReddotManager.AddListener(r8_77, r0_77, function(r0_78, r1_78)
        -- line: [1267, 1272] id: 78
        r7_77.IsNew = r1_78 > 0
        if r7_77.UI then
          r7_77.UI:SetReddot(r7_77.IsNew)
        end
      end, r9_77)
      r0_77.TabNodeNames[r8_77] = 1
    end
    -- close: r6_77
  end
  -- close: r2_77
end
function r2_0.RemoveAccessoryTabReddotListen(r0_79)
  -- line: [1278, 1286] id: 79
  if r0_79.NoReddot then
    return 
  end
  for r5_79, r6_79 in pairs(r0_79.TabNodeNames and {}) do
    ReddotManager.RemoveListener(r5_79, r0_79)
  end
  -- close: r1_79
  r0_79.TabNodeNames = nil
end
function r2_0.SetCurrentTabItemsReddotsRead(r0_80)
  -- line: [1288, 1299] id: 80
  if r0_80.NoReddot then
    return 
  end
  if r0_80.FilteredContents then
    for r5_80, r6_80 in pairs(r0_80.FilteredContents) do
      if r6_80.RedDotType then
        r0_0:SetItemReddotRead(r6_80, true)
      end
    end
    -- close: r1_80
  end
end
function r2_0.OnCharAccessoryTabClicked(r0_81, r1_81)
  -- line: [1301, 1342] id: 81
  local r2_81 = r0_81.AccessoryTabsArray[r1_81.Idx]
  if r0_81.ActorController then
    r0_81.ActorController:ResetActorRotation()
    if r0_81.HidePlayerAccessoryTypes[r2_81.AccessoryType] then
      r0_81.ActorController:HidePlayerActor(r0_81.UIName, true)
    else
      r0_81.ActorController:HidePlayerActor(r0_81.UIName, false)
    end
  end
  r0_81:RecoverAccessory()
  r0_81:SetCurrentTabItemsReddotsRead()
  r0_81.CurrentAccessoryTabIdx = r2_81.Idx
  r0_81.CurrentAccessoryTabWidget = r1_81
  r0_81.NoneAccessory.bSelectTag = false
  r0_81.NoneAccessory.IsSelect = false
  r0_81.NoneAccessory.AccessoryType = r2_81.AccessoryType
  r0_81.NoneAccessory.Id = r0_81.DefaultCharAccessoryIds[r2_81.AccessoryType] and r0_81.NoneAccessoryId
  r0_81.NoneAccessory.AccessoryId = r0_81.NoneAccessory.Id
  r0_81.CurrentContent = r0_81.NoneAccessory
  if r0_81.ComparedContent then
    r0_81.ComparedContent.IsSelect = false
  end
  r0_81.ComparedContent = nil
  r0_81:InitCharAccessoryList()
  r0_81.JumpToAccessoryId = nil
  r0_81.JumpToCharAccessoryType = nil
  r0_81.CurrentContent.bSelectTag = true
  r0_81.ComparedContent = r0_81.ComparedContent and r0_81.CurrentContent
  r0_81.CurrentContent.IsSelect = true
  r0_81:SelectAccessoryItem(r0_81.ComparedContent)
  if r0_81.NoneAccessory.SelfWidget then
    r0_81.NoneAccessory.SelfWidget:OnListItemObjectSet(r0_81.NoneAccessory)
  end
  r0_81.List_Accessory:BP_ScrollItemIntoView(r0_81.CurrentContent)
end
function r2_0.InitCharAccessoryList(r0_82)
  -- line: [1344, 1356] id: 82
  local r1_82 = r0_82.AccessoryTabsArray[r0_82.CurrentAccessoryTabIdx]
  local r2_82 = r0_82.BP_AccessoryContents:Length()
  local r3_82 = {}
  for r7_82 = 1, r2_82, 1 do
    local r8_82 = r0_82.BP_AccessoryContents[r7_82]
    if r8_82.AccessoryId and r8_82.AccessoryType == r1_82.AccessoryType and r8_82.AccessoryId ~= r0_82.NoneAccessory.Id and not r8_82.IsHide then
      table.insert(r3_82, r8_82)
    end
  end
  r0_82:InitList(r3_82)
end
function r2_0.InitList(r0_83, r1_83)
  -- line: [1358, 1395] id: 83
  r0_83.FilteredContents = r1_83
  r0_83.List_Accessory:ClearListItems()
  table.sort(r1_83, function(r0_84, r1_84)
    -- line: [1366, 1375] id: 84
    if r0_84.LockType and r1_84.LockType or not r0_84.LockType and not r1_84.LockType then
      if r0_84.SortPriority == r1_84.SortPriority then
        return r1_84.AccessoryId < r0_84.AccessoryId
      end
      return r1_84.SortPriority < r0_84.SortPriority
    else
      return r1_84.LockType
    end
  end)
  r0_83.List_Accessory:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_83.List_Accessory:AddItem(r0_83.NoneAccessory)
  for r6_83, r7_83 in ipairs(r1_83) do
    if r0_83.JumpToAccessoryId and r0_83.JumpToAccessoryId == r7_83.AccessoryId then
      r0_83.ComparedContent = r7_83
    end
    if r7_83.bSelectTag then
      r0_83.CurrentContent = r7_83
      if r0_83.IsCharacterTrialMode then
        r7_83.TryOutText = GText("UI_CharPreview_Accessory_In_Trial")
      end
    end
    r0_83.List_Accessory:AddItem(r7_83)
  end
  -- close: r2_83
  r0_83.List_Accessory:RequestFillEmptyContent()
  r0_83.List_Accessory:RequestPlayEntriesAnim()
end
function r2_0.RecoverAccessory(r0_85)
  -- line: [1397, 1416] id: 85
  if r0_85.Type == CommonConst.ArmoryType.Char then
    r0_85.ActorController:DestoryCreature(CommonConst.CharAccessoryTypes.FX_Dead)
    r0_85.ActorController:StopPlayerFX()
    r0_85.ActorController:StopPlayerMontage()
    r0_85.ActorController:DestoryPlayerMeleeWeapon()
  end
  if not r0_85.ComparedContent or r0_85.ComparedContent == r0_85.CurrentContent then
    return 
  end
  if r0_85.Type == CommonConst.ArmoryType.Char then
    local r1_85 = r0_85.ComparedContent.AccessoryType
    if r0_85.FXAccessoryTypes[r1_85] and not r0_85.AttachableFXAccessoryTypes[r1_85] then
      return 
    end
    r0_85.ActorController:ChangeCharAccessory(r0_85.CurrentContent.AccessoryId, r1_85)
  else
    r0_85.ActorController:ChangeWeaponAccessory(r0_85.CurrentContent.AccessoryId)
  end
end
function r2_0.OnAccessoryItemClicked(r0_86, r1_86)
  -- line: [1419, 1421] id: 86
  r0_86:TrySelectAccessoryItem(r1_86)
end
function r2_0.OnAccessoryListSelectionChanged(r0_87, r1_87, r2_87)
  -- line: [1423, 1424] id: 87
end
function r2_0.TrySelectAccessoryItem(r0_88, r1_88)
  -- line: [1426, 1438] id: 88
  if not r1_88.Icon then
    return 
  end
  if r0_88.ComparedContent == r1_88 and not CommonConst.ActionAccessoryTypes[r1_88.AccessoryType] then
    return 
  end
  AudioManager(r0_88):PlayUISound(r0_88, "event:/ui/common/click", nil, nil)
  if r1_88.AccessoryId then
    AudioManager(r0_88):PlayItemSound(r0_88, r1_88.AccessoryId, "Equip", r1_88.SoundDataName)
  end
  r0_88:SelectAccessoryItem(r1_88)
end
function r2_0.SelectAccessoryItem(r0_89, r1_89)
  -- line: [1440, 1460] id: 89
  r0_0:SetItemIsSelected(r0_89.ComparedContent, false)
  r0_89.ComparedContent = r1_89
  r0_0:SetItemIsSelected(r0_89.ComparedContent, true)
  r0_89:UpdateAccessoryDetails(r1_89)
  if r0_89.Type == CommonConst.ArmoryType.Char then
    r0_89.ActorController:StopPlayerFX()
    r0_89.ActorController:StopPlayerMontage()
    local r2_89 = r1_89.AccessoryType
    if r0_89.FXAccessoryTypes[r2_89] then
      r0_89.ActorController:ShowPlayerFXAccessory(r1_89.AccessoryId, r2_89)
      if r0_89.AttachableFXAccessoryTypes[r2_89] then
        r0_89.ActorController:ChangeCharAccessory(r1_89.AccessoryId, r2_89)
      end
    else
      r0_89.ActorController:ChangeCharAccessory(r1_89.AccessoryId, r2_89)
    end
  else
    r0_89.ActorController:ChangeWeaponAccessory(r1_89.AccessoryId)
  end
end
function r2_0.OnCharAccessoryConfirmBtnClicked(r0_90)
  -- line: [1463, 1489] id: 90
  if not r0_90.ComparedContent then
    return 
  end
  if r0_90.ComparedContent.LockType then
    return 
  end
  r0_90:BlockAllUIInput(true)
  local r1_90 = GWorld:GetAvatar()
  if r0_90.ComparedContent == r0_90.NoneAccessory then
    if r0_90.CurrentContent == r0_90.PartMeshAccessory then
      r1_90:SetCharSkinShowPart(r0_90.Target.Uuid, r0_90.SelectedSkinId, false)
    elseif r0_90.CurrentContent == r0_90.HornAccessory then
      r1_90:SetCharCornerVisibility(r0_90.Target.Uuid, r0_90.AppearanceSutiIndex, false)
    else
      r1_90:RemoveCharAppearanceAccessory(r0_90.Target.Uuid, r0_90.AppearanceSutiIndex, r0_90.CurrentContent.AccessoryId)
    end
  elseif r0_90.ComparedContent == r0_90.PartMeshAccessory then
    r1_90:SetCharSkinShowPart(r0_90.Target.Uuid, r0_90.SelectedSkinId, true)
  elseif r0_90.ComparedContent == r0_90.HornAccessory then
    r1_90:SetCharCornerVisibility(r0_90.Target.Uuid, r0_90.AppearanceSutiIndex, true)
  else
    r1_90:SetCharAppearanceAccessory(r0_90.Target.Uuid, r0_90.AppearanceSutiIndex, r0_90.ComparedContent.AccessoryId)
  end
end
function r2_0.OnCharAccessoryChanged(r0_91, r1_91, r2_91, r3_91)
  -- line: [1494, 1504] id: 91
  r0_91:BlockAllUIInput(false)
  if r1_91 == ErrorCode.RET_SUCCESS then
    r0_91.Target = GWorld:GetAvatar().Chars[r2_91]
    r0_91:OnEquipedCharAccessoryContentChanged()
    r0_91:UpdateAccessoryDetails(r0_91.CurrentContent)
  else
    UIManager(r0_91):ShowError(r1_91, 1.5)
  end
end
function r2_0.OnCharAppearanceChanged(r0_92, r1_92, r2_92, r3_92)
  -- line: [1507, 1516] id: 92
  r0_92:BlockAllUIInput(false)
  if r1_92 == ErrorCode.RET_SUCCESS then
    r0_92.Target = GWorld:GetAvatar().Chars[r2_92]
  else
    UIManager(r0_92):ShowError(r1_92, 1.5)
  end
end
function r2_0.OnCharShowPartMesh(r0_93, r1_93, r2_93, r3_93, r4_93)
  -- line: [1519, 1529] id: 93
  r0_93:BlockAllUIInput(false)
  if r1_93 == ErrorCode.RET_SUCCESS then
    r0_93.Target = GWorld:GetAvatar().Chars[r2_93]
    r0_93:OnEquipedCharAccessoryContentChanged()
    r0_93:UpdateAccessoryDetails(r0_93.CurrentContent)
  else
    UIManager(r0_93):ShowError(r1_93, 1.5)
  end
end
function r2_0.OnCharCornerVisibilityChanged(r0_94, r1_94, r2_94)
  -- line: [1532, 1542] id: 94
  r0_94:BlockAllUIInput(false)
  if r1_94 == ErrorCode.RET_SUCCESS then
    r0_94.Target = GWorld:GetAvatar().Chars[r2_94]
    r0_94:OnEquipedCharAccessoryContentChanged()
    r0_94:UpdateAccessoryDetails(r0_94.CurrentContent)
  else
    UIManager(r0_94):ShowError(r1_94, 1.5)
  end
end
function r2_0.InitWeaponSkin(r0_95)
  -- line: [1553, 1562] id: 95
  local r1_95 = r0_95.JumpToSkinId and r0_95.SelectedSkinId
  r0_95.JumpToSkinId = nil
  r0_95.WidgetSwitcher_State:SetActiveWidgetIndex(1)
  r0_95:InitWeaponSkinList()
  r0_95:SelectSkinById(r1_95)
  r0_95:AddTimer(0.01, function()
    -- line: [1559, 1561] id: 96
    r0_95.IsSkinWidgetNotReady = false
  end)
end
function r2_0.InitWeaponSkinList(r0_97)
  -- line: [1564, 1637] id: 97
  if r0_97.bWeaponSkinListInited then
    return 
  end
  r0_97.bWeaponSkinListInited = true
  r0_97.SkinMap = {}
  r0_97.SkinArray = {}
  local r1_97 = GWorld:GetAvatar()
  local r2_97 = r0_97.Target.WeaponId
  local r4_97 = (r0_97.Target:GetCurrentSkin() and {}).SkinId and r2_97
  local r5_97 = CommonConst.DataType.WeaponSkin
  for r10_97, r11_97 in pairs(DataMgr.WeaponSkin) do
    if UIUtils.CanApplyWeaponSkin(r2_97, r11_97.ApplicationType) then
      local r12_97 = {}
      if not r0_97.NoReddot then
        r12_97 = ReddotManager.GetLeafNodeCacheDetail(r5_97 .. (r11_97.ApplicationType and "")) and {}
      end
      local r13_97 = NewObject(UIUtils.GetCommonItemContentClass())
      rawset(r13_97, "SkinId", r11_97.SkinID)
      rawset(r13_97, "ItemId", r11_97.SkinID)
      rawset(r13_97, "IconPath", r11_97.LongIcon)
      rawset(r13_97, "Name", GText(r11_97.Name))
      rawset(r13_97, "Name_World", EnText(r11_97.Name))
      rawset(r13_97, "Rarity", r11_97.Rarity)
      rawset(r13_97, "Text", GText(r11_97.Dec))
      rawset(r13_97, "Owner", r0_97)
      rawset(r13_97, "OnClicked", r0_97.OnSkinItemClicked)
      rawset(r13_97, "bDyeable", true)
      rawset(r13_97, "IsNew", r12_97[r10_97] == 1)
      rawset(r13_97, "ItemType", CommonConst.DataType.WeaponSkin)
      rawset(r13_97, "IsTargetUnowned", r0_97.IsTargetUnowned)
      rawset(r13_97, "SkinId", r11_97.SkinID)
      if r1_97.OwnedWeaponSkins[r10_97] then
        rawset(r13_97, "LockType", false)
      else
        rawset(r13_97, "LockType", r10_97 ~= r2_97)
      end
      if not r13_97.LockType or CommonUtils.IsCurrentVersionRealease(CommonConst.DataType.WeaponSkin, r10_97) then
        local r14_97 = DataMgr.WeaponTypeContrast[r11_97.ApplicationType]
        if r14_97 then
          rawset(r13_97, "CharName", string.format(GText("UI_SkinPreview_WeaponType"), GText(r14_97.WeaponTagTextmap)))
          rawset(r13_97, "WeaponTypeIcon", r14_97.Icon)
        end
        r0_97.SkinMap[r13_97.SkinId] = r13_97
        table.insert(r0_97.SkinArray, r13_97)
        r0_97:OnSkinContentCreated(r13_97)
      end
    end
  end
  -- close: r6_97
  table.sort(r0_97.SkinArray, function(r0_98, r1_98)
    -- line: [1617, 1619] id: 98
    return r0_98.SkinId < r1_98.SkinId
  end)
  local r6_97 = r0_97.Target:Data()
  local r7_97 = NewObject(UIUtils.GetCommonItemContentClass())
  rawset(r7_97, "SkinId", r2_97)
  rawset(r7_97, "IconPath", r6_97.LongIcon and r6_97.GachaIcon)
  rawset(r7_97, "Owner", r0_97)
  rawset(r7_97, "OnClicked", r0_97.OnSkinItemClicked)
  rawset(r7_97, "bDyeable", true)
  rawset(r7_97, "IsTargetUnowned", r0_97.IsTargetUnowned)
  r0_97.SkinMap[r7_97.SkinId] = r7_97
  table.insert(r0_97.SkinArray, 1, r7_97)
  r0_97:OnSkinContentCreated(r7_97)
  if r4_97 and r0_97.SkinMap[r4_97] then
    r0_97.CurrentSkinContent = r0_97.SkinMap[r4_97]
    r0_97.CurrentSkinContent.IsEquipped = true
  end
  r0_97:InitSkinList()
end
function r2_0.OnWeaponSkinChanged(r0_99, r1_99, r2_99, r3_99)
  -- line: [1640, 1652] id: 99
  r0_99:BlockAllUIInput(false)
  if not ErrorCode:Check(r1_99) then
    return 
  end
  r0_99:ResetTarget()
  if r0_99.CurrentSkinContent then
    r0_99:SetSkinIsCurrentUse(r0_99.CurrentSkinContent, false)
  end
  r0_99.CurrentSkinContent = r0_99.SkinMap[r3_99]
  r0_99:SetSkinIsCurrentUse(r0_99.CurrentSkinContent, true)
  r0_99:UpdateFunctionBtn(r0_99.CurrentSkinContent)
end
function r2_0.OnWeaponSkinConfirmBtnClicked(r0_100)
  -- line: [1655, 1662] id: 100
  if not r0_100.SelectedSkinId or r0_100.SelectedSkinId <= 0 then
    return 
  end
  r0_100:BlockAllUIInput(true)
  GWorld:GetAvatar():ChangeWeaponAppearanceSkin(r0_100.Target.Uuid, r0_100.SelectedSkinId)
end
function r2_0.InitWeaponAccessory(r0_101)
  -- line: [1667, 1692] id: 101
  r0_101.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  r0_101:CreateWeaponAccessoryContents(r0_101.Target)
  if r0_101.ArmoryHelper then
    r0_101.ArmoryHelper:ResetRotation()
  end
  r0_101.NoneAccessory.bSelectTag = false
  r0_101.NoneAccessory.IsSelect = false
  r0_101.CurrentContent = r0_101.NoneAccessory
  if #r0_101.Array_WeaponAccessoryContents <= 0 then
    r0_101.List_Accessory:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_101:UpdateAccessoryDetails(r0_101.CurrentContent)
    return 
  end
  if r0_101.ComparedContent then
    r0_101.ComparedContent.IsSelect = false
    if r0_101.ComparedContent.SelfWidget then
      r0_101.ComparedContent.SelfWidget:SetSelected(r0_101.ComparedContent.IsSelect)
    end
  end
  r0_101.ComparedContent = nil
  r0_101:InitWeaponAccessoryList()
  r0_101:SelectAccessoryItem(r0_101.ComparedContent)
  r0_101.List_Accessory:BP_ScrollItemIntoView(r0_101.ComparedContent)
end
local function r4_0(r0_102, r1_102)
  -- line: [1694, 1705] id: 102
  local r3_102 = r0_102:CreateWeaponAccessoryContent(DataMgr.WeaponAccessory[r1_102])
  if r3_102 then
    r3_102.SoundDataName = "WeaponAccessory"
    r0_102.BP_AccessoryContents:Add(r3_102)
    r0_102.Map_AccessoryContents[r1_102] = r3_102
    table.insert(r0_102.Array_WeaponAccessoryContents, r3_102)
    r0_102:CheckWeaponAccessoryContentReddot(r1_102)
    r0_102:OnAccessoryContentCreated(r3_102)
  end
end
function r2_0.CheckWeaponAccessoryContentReddot(r0_103, r1_103)
  -- line: [1707, 1721] id: 103
  -- notice: unreachable block#10
  if r0_103.NoReddot then
    return 
  end
  local r2_103 = r0_103.Map_AccessoryContents[r1_103]
  if not r2_103 then
    return 
  end
  local r3_103 = {}
  if ReddotManager.GetTreeNode(CommonConst.DataType.WeaponAccessory) then
    r3_103 = ReddotManager.GetLeafNodeCacheDetail(CommonConst.DataType.WeaponAccessory) and {}
  end
  local r5_103 = r3_103[r1_103]
  if r5_103 == 1 then
    r5_103 = UIConst.RedDotType.NewRedDot
  else
    r5_103 = false
  end
  r2_103.RedDotType = r5_103
end
function r2_0.CreateWeaponAccessoryContents(r0_104, r1_104, r2_104)
  -- line: [1723, 1761] id: 104
  if r0_104.IsAccessoryContentsCreated and not r2_104 then
    return 
  end
  r0_104.IsAccessoryContentsCreated = true
  r0_104.CurrentContent = nil
  r0_104.ComparedContent = nil
  r0_104.NoneAccessory = NewObject(UIUtils.GetCommonItemContentClass())
  r0_104.NoneAccessory.Id = -1
  r0_104.NoneAccessory.Parent = r0_104
  r0_104.NoneAccessory.Icon = UIUtils.GetNoneAccessoryIconPath()
  r0_104.NoneAccessory.ItemType = CommonConst.DataType.WeaponAccessory
  r0_104.BP_AccessoryContents:Clear()
  r0_104.BP_AccessoryContents:Add(r0_104.NoneAccessory)
  r0_104:OnAccessoryContentCreated(r0_104.NoneAccessory)
  r0_104.Map_AccessoryContents = {}
  r0_104.Array_WeaponAccessoryContents = {}
  local r3_104 = GWorld:GetAvatar()
  for r8_104, r9_104 in pairs(DataMgr.WeaponAccessory) do
    if r3_104.WeaponAccessorys[r8_104] or CommonUtils.IsCurrentVersionRealease(CommonConst.DataType.WeaponAccessory, r8_104) then
      r4_0(r0_104, r8_104)
    end
  end
  -- close: r4_104
  for r8_104, r9_104 in pairs(r3_104.WeaponAccessorys) do
    local r10_104 = r0_104.Map_AccessoryContents[r9_104]
    if r10_104 then
      r10_104.IsHide = nil
      r10_104.LockType = nil
    end
  end
  -- close: r4_104
  for r9_104, r10_104 in pairs(r1_104:GetAppearance().Accessory) do
    local r11_104 = r0_104.Map_AccessoryContents[r10_104]
    if r11_104 then
      r11_104.bSelectTag = true
    end
  end
  -- close: r5_104
end
function r2_0.OnAccessoryContentCreated(r0_105, r1_105)
  -- line: [1763, 1764] id: 105
end
function r2_0.CreateWeaponAccessoryContent(r0_106, r1_106)
  -- line: [1766, 1780] id: 106
  local r2_106 = NewObject(UIUtils.GetCommonItemContentClass())
  r2_106.ItemType = CommonConst.DataType.WeaponAccessory
  r2_106.Icon = r1_106.Icon and ""
  r2_106.Id = r1_106.WeaponAccessoryId
  r2_106.AccessoryId = r1_106.WeaponAccessoryId
  r2_106.SortPriority = r1_106.SortPriority and 0
  r2_106.LockType = 2
  r2_106.IsHide = r1_106.IsHide
  r2_106.IsSelect = false
  r2_106.UnlockOptionText = GText(r1_106.UnlockOption and "")
  r2_106.Parent = r0_106
  r2_106.Rarity = r1_106.Rarity and 0
  return r2_106
end
function r2_0.InitWeaponAccessoryList(r0_107)
  -- line: [1782, 1815] id: 107
  r0_107.List_Accessory:ClearListItems()
  table.sort(r0_107.Array_WeaponAccessoryContents, function(r0_108, r1_108)
    -- line: [1784, 1793] id: 108
    if r0_108.LockType and r1_108.LockType or not r0_108.LockType and not r1_108.LockType then
      if r0_108.SortPriority == r1_108.SortPriority then
        return r1_108.AccessoryId < r0_108.AccessoryId
      end
      return r1_108.SortPriority < r0_108.SortPriority
    else
      return r1_108.LockType
    end
  end)
  r0_107.List_Accessory:AddItem(r0_107.NoneAccessory)
  r0_107.List_Accessory:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_107.FilteredContents = {}
  for r5_107, r6_107 in ipairs(r0_107.Array_WeaponAccessoryContents) do
    if not r6_107.IsHide then
      if r0_107.JumpToAccessoryId and r0_107.JumpToAccessoryId == r6_107.AccessoryId then
        r0_107.ComparedContent = r6_107
      end
      if r6_107.bSelectTag then
        r0_107.CurrentContent = r6_107
      end
      r0_107.List_Accessory:AddItem(r6_107)
      table.insert(r0_107.FilteredContents, r6_107)
    end
  end
  -- close: r1_107
  r0_107.JumpToAccessoryId = nil
  r0_107.CurrentContent.IsSelect = true
  r0_107.ComparedContent = r0_107.ComparedContent and r0_107.CurrentContent
  r0_107.ComparedContent.IsSelect = true
end
function r2_0.OnWeaponAccessoryConfirmBtnClicked(r0_109)
  -- line: [1817, 1831] id: 109
  r0_109:BlockAllUIInput(true)
  local r1_109 = GWorld:GetAvatar()
  if r0_109.ComparedContent.AccessoryId then
    r1_109:ChangeWeaponAppearanceAccessory(r0_109.Target.Uuid, r0_109.ComparedContent.AccessoryId)
  else
    r1_109:ChangeWeaponAppearanceAccessory(r0_109.Target.Uuid, -1)
  end
end
function r2_0.OnWeaponAccessoryChanged(r0_110, r1_110, r2_110, r3_110)
  -- line: [1834, 1842] id: 110
  r0_110:BlockAllUIInput(false)
  if not ErrorCode:Check(r1_110) then
    return 
  end
  r0_110:ResetTarget()
  r0_110:OnEquipedCharAccessoryContentChanged()
  r0_110:UpdateAccessoryDetails(r0_110.CurrentContent)
end
function r2_0.IsNoneAccessory(r0_111, r1_111)
  -- line: [1850, 1852] id: 111
end
function r2_0.UpdateAccessoryDetails(r0_112, r1_112)
  -- line: [1854, 1988] id: 112
  if r0_112.Type == "Char" then
    local r2_112 = nil
    if r0_112.CurrentAccessoryTabIdx then
      local r3_112 = r0_112.AccessoryTabsArray[r0_112.CurrentAccessoryTabIdx]
      r2_112 = r3_112 and r3_112.AccessoryType
    end
    r0_112:UpdateAccessoryCamera(r1_112.AccessoryId, r2_112)
  end
  r0_112.Panel_Dye:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_112.Panel_Video:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_112.Panel_Buy:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_112.Btn_Function:UnBindEventOnClickedByObj(r0_112)
  if r0_112.CurrentContent == r1_112 then
    r0_112.WidgetSwitcher_BtnState:SetActiveWidgetIndex(r0_112.BtnWidgetState.Equipped)
    r0_112.Text_Desc:SetText(GText("UI_Accessory_Equipped"))
    if r0_112.IsCharacterTrialMode or r0_112.IsTargetUnowned then
      r0_112.Btn_Function:SetText(GText("UI_CharPreview_Accessory_In_Trial"))
    end
  elseif r1_112.LockType then
    local r2_112 = r0_112:GetShopItemByAccessoryId(r1_112.AccessoryId)
    local r3_112 = r2_112 and DataMgr.ShopItem[r2_112]
    local r4_112 = false
    local r5_112 = nil
    if r3_112 then
      r5_112 = ShopUtils:GetShopItemPrice(r3_112.ItemId)
      r3_112 = setmetatable({}, {
        __index = r3_112,
      })
      local r6_112 = ShopUtils:CanPurchase(r3_112, r3_112.PriceType, r5_112)
      r4_112 = ShopUtils:GetShopItemCanShow(r2_112) and r6_112
    end
    if r4_112 then
      if not r0_112.IsPreviewMode then
        r0_112.Panel_Buy:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      end
      r0_112.WidgetSwitcher_BtnState:SetActiveWidgetIndex(r0_112.BtnWidgetState.Unequipped)
      r0_112.Btn_Function:SetText(GText("UI_SHOP_PURCHASE"))
      local r6_112 = DataMgr.ShopItem[r2_112]
      local r7_112 = r6_112.PriceType
      local r8_112 = GWorld:GetAvatar()
      local r9_112 = r8_112.Resources[r7_112]
      if r9_112 then
        r9_112 = r8_112.Resources[r7_112].Count and 0
      else
        goto label_145	-- block#20 is visited secondly
      end
      local r10_112 = nil
      if r9_112 < r5_112 then
        r10_112 = r5_112 + r9_112
      else
        r10_112 = r5_112
      end
      r0_112.WBP_Com_Cost:InitContent({
        ResourceId = r6_112.PriceType,
        Denominator = r10_112,
        Numerator = r5_112,
      })
      if r9_112 < r5_112 then
        r0_112.Btn_Function:ForbidBtn(true)
      else
        r0_112.Btn_Function:ForbidBtn(false)
        r0_112.Btn_Function:BindEventOnClicked(r0_112, r0_112.OnBuyBtnClicked)
        r0_112.ConfirmBtnFunc = r0_112.OnBuyBtnClicked
      end
    else
      r0_112.WidgetSwitcher_BtnState:SetActiveWidgetIndex(r0_112.BtnWidgetState.Locked)
      if r1_112.UnlockOptionText and r1_112.UnlockOptionText ~= "" then
        r0_112.Text_Lock:SetText(r1_112.UnlockOptionText)
        r0_112.Btn_Function:ForbidBtn(true)
      else
        r0_112.Text_Lock:SetText(GText("UI_Aaccessory_Locked"))
        r0_112.Btn_Function:ForbidBtn(true)
      end
    end
    if r0_112.IsCharacterTrialMode then
      r0_112.WidgetSwitcher_BtnState:SetActiveWidgetIndex(r0_112.BtnWidgetState.Locked)
      if r1_112.UnlockOptionText and r1_112.UnlockOptionText ~= "" then
        r0_112.Text_Lock:SetText(r1_112.UnlockOptionText)
      else
        r0_112.Text_Lock:SetText(GText("UI_Aaccessory_Locked"))
      end
    end
  else
    r0_112.WidgetSwitcher_BtnState:SetActiveWidgetIndex(r0_112.BtnWidgetState.Unequipped)
    r0_112.Btn_Function:SetText(GText("UI_Accessory_Equip"))
    r0_112.Btn_Function:BindEventOnClicked(r0_112, r0_112.OnConfirmBtnClicked)
    r0_112.ConfirmBtnFunc = r0_112.OnConfirmBtnClicked
    r0_112.Btn_Function:ForbidBtn(false)
    if r0_112.IsCharacterTrialMode or r0_112.IsTargetUnowned then
      r0_112.Btn_Function:SetText(GText("UI_CharPreview_Cannot_Equip"))
      r0_112.Btn_Function:ForbidBtn(true)
    end
  end
  if r1_112 == r0_112.NoneAccessory then
    r0_112.VB_Info:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_112.Tag_Quality:SetVisibility(ESlateVisibility.Collapsed)
    return 
  end
  r0_112.VB_Info:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  local r2_112 = nil
  if r0_112.Type == CommonConst.ArmoryType.Char then
    r2_112 = DataMgr.CharAccessory[r1_112.AccessoryId] and DataMgr.CharPartMesh[r1_112.AccessoryId]
    r0_112.Text_CharName:SetText(GText(UIConst.AccessoryTypeTextMap[r2_112.AccessoryType] and ""))
  else
    r2_112 = DataMgr.WeaponAccessory[r1_112.AccessoryId]
    r0_112.Text_CharName:SetText(GText(UIConst.AccessoryTypeTextMap.WeaponAccessory))
  end
  local r3_112 = {
    nil,
    nil,
    "Font_Blue",
    "Font_Purple",
    "Font_Gold",
    "Font_Red"
  }
  if r2_112.Rarity and r3_112[r2_112.Rarity] and r0_112[r3_112[r2_112.Rarity]] then
    r0_112.Text_Name:SetFont(r0_112[r3_112[r2_112.Rarity]])
  end
  r0_112.Text_Name:SetText(GText(r2_112.Name))
  r0_112.Text_Info:SetText(GText(r2_112.Des))
  r0_112.Text_SkinName_World:SetText(EnText(r2_112.Name))
  r0_112.Text_Char_None:SetVisibility(ESlateVisibility.Collapsed)
  r0_112.Image_Element:SetVisibility(ESlateVisibility.Collapsed)
  r0_112.Tag_Quality:SetVisibility(ESlateVisibility.Collapsed)
  local r4_112 = r0_0:GetCharNoneAccessoryIconPaths()[r2_112.AccessoryType]
  if r4_112 then
    r0_112.Image_Element:SetBrushResourceObject(LoadObject(r4_112))
    r0_112.Image_Element:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  if r2_112.Rarity then
    r0_112.Tag_Quality:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_112.Tag_Quality:Init(r2_112.Rarity)
  end
  if not r0_112:IsAnimationPlaying(r0_112.In) then
    r0_112:PlayAnimation(r0_112.Change)
  end
  if r1_112 ~= r0_112.NoneAccessory and r1_112.RedDotType and not r0_112.NoReddot then
    r0_0:SetItemReddotRead(r1_112, true)
  end
end
function r2_0.OnBuyBtnClicked(r0_113)
  -- line: [1991, 2007] id: 113
  local r2_113 = DataMgr.ShopItem[r0_113:GetShopItemByAccessoryId(r0_113.ComparedContent.AccessoryId)]
  if not r2_113 then
    return 
  end
  UIManager(r0_113):ShowCommonPopupUI(100041, {
    ShopItemData = r2_113,
    ShopType = 0,
    Funds = {
      {
        FundId = r2_113.PriceType,
        FundNeed = ShopUtils:GetShopItemPrice(r2_113.ItemId),
      }
    },
    ShowParentTabCoin = true,
    RightCallbackObj = r0_113,
    RightCallbackFunction = r0_113.PurchaseAccessory,
  }, r0_113)
end
function r2_0.PurchaseAccessory(r0_114)
  -- line: [2010, 2022] id: 114
  local r1_114 = GWorld:GetAvatar()
  if not r1_114 then
    return 
  end
  local r3_114 = DataMgr.ShopItem[r0_114:GetShopItemByAccessoryId(r0_114.ComparedContent.AccessoryId)]
  if not r3_114 then
    return 
  end
  r0_114:BlockAllUIInput(true)
  r1_114:PurchaseShopItem(r3_114.ItemId, 1)
end
function r2_0.OnPurchaseShopItem(r0_115, r1_115)
  -- line: [2026, 2031] id: 115
  r0_115:BlockAllUIInput(false)
  if r1_115 ~= ErrorCode.RET_SUCCESS then
    return 
  end
end
function r2_0.OnWeaponColorsChanged(r0_116)
  -- line: [2033, 2035] id: 116
  r0_116:ResetTarget()
end
function r2_0.OnEquipedCharAccessoryContentChanged(r0_117)
  -- line: [2037, 2044] id: 117
  r0_0:SetItemSelectTag(r0_117.CurrentContent, false)
  r0_0:SetItemSelectTag(r0_117.ComparedContent, true)
  r0_117.CurrentContent = r0_117.ComparedContent
  if r0_117.CurrentContent.AccessoryType then
    r0_117[r0_117.CurrentContent.AccessoryType .. "Content"] = r0_117.CurrentContent
  end
end
function r2_0.GetShopItemByAccessoryId(r0_118, r1_118)
  -- line: [2046, 2050] id: 118
  local r3_118 = DataMgr.TypeId2ShopItem[r0_118.Type .. "Accessory"]
  return r3_118 and r3_118[r1_118] and r3_118[r1_118][1]
end
function r2_0.OnHideUIKeyDown(r0_119)
  -- line: [2055, 2064] id: 119
  r0_119.bSelfHidden = not r0_119.bSelfHidden
  if r0_119.bSelfHidden then
    r0_119:SetRenderOpacity(0)
    r0_119.Image_Click.Slot:SetZOrder(10)
  else
    r0_119:SetRenderOpacity(1)
    r0_119.Image_Click.Slot:SetZOrder(-1)
  end
end
function r2_0.ResetTarget(r0_120)
  -- line: [2066, 2076] id: 120
  if r0_120.IsPreviewMode then
    return 
  end
  local r1_120 = r0_0:GetAvatar()
  if r0_120.Type == CommonConst.ArmoryType.Char then
    r0_120.Target = r1_120.Chars[r0_120.Target.Uuid] and r0_120.Target
  else
    r0_120.Target = r1_120.Weapons[r0_120.Target.Uuid] and r0_120.Target
  end
end
function r2_0.OpenDye(r0_121)
  -- line: [2078, 2113] id: 121
  local r1_121 = {
    Target = r0_121.Target,
    Type = r0_121.Type,
    SkinId = r0_121.SelectedSkinId,
    IsPreviewMode = r0_121.IsPreviewMode,
    Parent = r0_121,
    OnCloseCallback = function()
      -- line: [2081, 2083] id: 122
      r0_121:ResetTarget()
    end,
  }
  if r1_121.Target and r1_121.Target.Uuid == 1 then
    r1_121.Target.Uuid = r1_121.SkinId
    local r2_121 = r0_0:GetAvatar()
    if r2_121 and r0_121.Type == CommonConst.ArmoryType.Char and r2_121.Chars then
      for r7_121, r8_121 in pairs(r2_121.Chars) do
        if r8_121.CharId == r1_121.Target.CharId then
          r1_121.Target = r8_121
          r1_121.bRealCharOrWeapon = true
          break
        end
      end
      -- close: r3_121
    elseif r0_121.Type == CommonConst.ArmoryType.Weapon and r2_121.Weapons then
      for r7_121, r8_121 in pairs(r2_121.Weapons) do
        if r8_121.WeaponId == r1_121.Target.WeaponId then
          r1_121.Target = r8_121
          r1_121.bRealCharOrWeapon = true
          break
        end
      end
      -- close: r3_121
    end
  elseif r1_121.Target and r1_121.Target.Uuid ~= 1 then
    r1_121.bRealCharOrWeapon = true
  end
  local r2_121 = DataMgr.SystemUI.ArmoryDye
  if r0_121.Parent then
    UIManager(r0_121):LoadUI(UIConst.LoadInConfig, r2_121.UIName, r0_121:GetZOrder(), r1_121)
  else
    UIManager(r0_121):LoadUI(UIConst.LoadInConfig, r2_121.UIName, 100, r1_121)
  end
end
function r2_0.PlayInAnim(r0_123)
  -- line: [2115, 2135] id: 123
  r0_123:BlockAllUIInput(true)
  if r0_123.InAnimStyle then
    r0_123.ComBgSwitch = r0_123:CreateWidgetNew("ComBgSwitch")
    if r0_123.ComBgSwitch then
      r0_123.ComBgSwitch:AddToViewport(r0_123:GetZOrder())
      r0_123.ComBgSwitch:PlayAnimation(r0_123.ComBgSwitch.In)
      r0_123.ComBgSwitch:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      r0_123:SetRenderOpacity(0)
      r0_123:AddTimer(0.3, function()
        -- line: [2124, 2129] id: 124
        r0_123:SetRenderOpacity(1)
        r0_123:Init(r0_123.Params)
        r0_123:StopAnimation(r0_123.Out)
        r0_123:PlayAnimation(r0_123.In)
      end, false, 0, "DelayInit")
    end
  else
    r0_123:StopAnimation(r0_123.Out)
    r0_123:PlayAnimation(r0_123.In)
  end
end
function r2_0.PlayOutAnim(r0_125)
  -- line: [2137, 2145] id: 125
  r0_125:StopAnimation(r0_125.In)
  r0_125:PlayAnimation(r0_125.Out)
  if r0_125.IsPreviewMode and r0_125.ActorController then
    r0_125.ActorController:OnClosed()
  end
  AudioManager(r0_125):SetEventSoundParam(r0_125, "SkinOpen", {
    ToEnd = 1,
  })
  r0_125:BlockAllUIInput(true)
end
function r2_0.OnInAnimFinished(r0_126)
  -- line: [2147, 2149] id: 126
  r0_126:BlockAllUIInput(false)
end
function r2_0.OnOutAnimFinished(r0_127)
  -- line: [2151, 2153] id: 127
  r0_127:Close()
end
function r2_0.RealClose(r0_128)
  -- line: [2155, 2160] id: 128
  r2_0.Super.RealClose(r0_128)
  if r0_128.OnCloseCallback then
    r0_128.OnCloseCallback(r0_128.Parent)
  end
end
function r2_0.Destruct(r0_129)
  -- line: [2162, 2177] id: 129
  r0_129:RemoveAccessoryTabReddotListen()
  if r0_129.ActorController then
    r0_129.ActorController:HidePlayerActor(r0_129.UIName, false)
    r0_129.ActorController:UpdateCameraPPSetting()
  end
  r0_129:RemoveTimer("DelayInit")
  if IsValid(r0_129.ComBgSwitch) then
    r0_129.ComBgSwitch:RemoveFromParent()
  end
  r0_129:RemoveTopTabReddotListen()
  r2_0.Super.Destruct(r0_129)
  if r0_129.CurrentSkinContent and not r0_129.IsPreviewMode then
    r0_129:UpdateActorAppearance(r0_129.CurrentSkinContent.SkinId)
  end
end
AssembleComponents(r2_0)
return r2_0
