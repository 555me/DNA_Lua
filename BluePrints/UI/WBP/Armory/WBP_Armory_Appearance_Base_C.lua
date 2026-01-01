-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Armory\WBP_Armory_Appearance_Base_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("Utils.UIUtils")
local r1_0 = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local r2_0 = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})
r2_0._components = {
  "BluePrints.UI.BP_EMUserWidgetUtils_C"
}
function r2_0.Init(r0_1, r1_1)
  -- line: [9, 38] id: 1
  r0_1.Parent = r1_1.Parent
  r0_1.ActorController = r0_1.Parent.ActorController
  r0_1.Target = r1_1.Target
  r0_1.Type = r1_1.Type
  r0_1.IsPreviewMode = r1_1.IsPreviewMode
  r0_1.bFormPersonalPage = r1_1.bFormPersonalPage
  r0_1.IsTargetUnowned = r1_1.IsTargetUnowned
  r0_1.IsCharacterTrialMode = r1_1.IsCharacterTrialMode
  r0_1.NoReddot = r0_1.IsPreviewMode and r0_1.IsTargetUnowned and r0_1.IsCharacterTrialMode
  r0_1:InitDispatcher()
  r0_1:ResetTarget()
  if r0_1.Type == CommonConst.ArmoryType.Char then
    r0_1.WS_State:SetActiveWidgetIndex(0)
    r0_1:InitCharAppearance()
    r0_1:SwitchCharAppearanceSuits(r0_1.Target.CurrentAppearanceIndex and 1)
    if r0_1.IsPreviewMode or r0_1.IsTargetUnowned then
      r0_1.Plan_Char:SetVisibility(UIConst.VisibilityOp.Hidden)
    else
      r0_1.Plan_Char:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      r0_1:ResetAppearancePlanName()
    end
  else
    r0_1.WS_State:SetActiveWidgetIndex(1)
    r0_1:InitWeaponAppearanceSuits()
    r0_1:AddWeaponAppearanceReddotListen(r0_1.Target.WeaponId)
  end
end
function r2_0.GetAppearancePlanNames(r0_2)
  -- line: [41, 51] id: 2
  local r1_2 = {}
  for r6_2, r7_2 in ipairs(r0_2.Target.AppearanceSuits) do
    table.insert(r1_2, GText(r7_2.AppearanceName and "UI_Squad_Appearance_TITLE" .. r6_2))
  end
  -- close: r2_2
  return r1_2
end
function r2_0.ResetAppearancePlanName(r0_3)
  -- line: [53, 62] id: 3
  r0_3.Plan_Char:Init({
    Owner = r0_3,
    OnEditBtnClicked = r0_3.OnAppearanceNameEditBtnClicked,
    OnPlanChanged = r0_3.OnSuitsItemClicked,
    PlanNames = r0_3:GetAppearancePlanNames(),
    SelectedItemIndex = r0_3.CurrentSuitsIdx,
  })
end
function r2_0.OnAppearanceNameEditBtnClicked(r0_4)
  -- line: [65, 98] id: 4
  local r1_4 = r0_4:GetAppearancePlanNames()
  local r2_4 = DataMgr.GlobalConstant.CharPlanNameMax
  if not r2_4 then
    r2_4 = {}
    r2_4.ConstantValue = 14
  end
  local r3_4 = UIManager(r0_4)
  local r6_4 = {}
  r6_4.EditTextConfig = {
    Text = r1_4[r0_4.CurrentSuitsIdx],
    IsMultiLine = false,
    Owner = r0_4,
    TextLimit = r2_4.ConstantValue,
    bLimitSpaces = true,
    bNotAllowEmpty = true,
    Events = {
      OnTextChanged = function(r0_5, r1_5)
        -- line: [77, 83] id: 5
        if r1_5 == r1_4[r0_5.CurrentSuitsIdx] then
          r0_5.NameEditDialog:GetButtonBar().Btn_Yes:ForbidBtn(true)
        else
          r0_5.NameEditDialog:GetButtonBar().Btn_Yes:ForbidBtn(false)
        end
      end,
    },
    bNeedCheckStringSensitive = true,
    OnCheckStringSensitive = function(r0_6, r1_6, r2_6)
      -- line: [86, 95] id: 6
      if r1_6 then
        if not r2_6 then
          r2_6 = ""
        end
        if r2_6 ~= "" then
          GWorld:GetAvatar():UpdateCharAppearanceSuitName(r0_4.Target.Uuid, r0_4.CurrentSuitsIdx, r2_6)
        end
      end
    end,
  }
  r0_4.NameEditDialog = r3_4:ShowCommonPopupUI(100176, r6_4, r0_4)
end
function r2_0.OnCharAppearanSuitRenamed(r0_7, r1_7, r2_7, r3_7, r4_7)
  -- line: [100, 109] id: 7
  if not ErrorCode:Check(r1_7) then
    return 
  end
  if r2_7 ~= r0_7.Target.Uuid then
    return 
  end
  r0_7:ResetTarget()
  r0_7:ResetAppearancePlanName()
end
function r2_0.InitDispatcher(r0_8)
  -- line: [113, 125] id: 8
  if r0_8.Type == CommonConst.ArmoryType.Char then
    r0_8:AddDispatcher(EventID.OnCharAppearanceChanged, r0_8, r0_8.OnCharAppearanceChanged)
    r0_8:AddDispatcher(EventID.OnCharAccessorySetted, r0_8, r0_8.ResetTarget)
    r0_8:AddDispatcher(EventID.OnCharAccessoryRemoved, r0_8, r0_8.ResetTarget)
    r0_8:AddDispatcher(EventID.OnCharShowPartMesh, r0_8, r0_8.ResetTarget)
    r0_8:AddDispatcher(EventID.OnCharCornerVisibilityChanged, r0_8, r0_8.ResetTarget)
    r0_8:AddDispatcher(EventID.OnCharSkinChanged, r0_8, r0_8.ResetTarget)
    r0_8:AddDispatcher(EventID.OnCharAppearanSuitRenamed, r0_8, r0_8.OnCharAppearanSuitRenamed)
  else
    r0_8:AddDispatcher(EventID.OnWeaponAppearanSuitRenamed, r0_8, r0_8.OnWeaponAppearanSuitRenamed)
  end
end
function r2_0.InitCharAppearance(r0_9)
  -- line: [129, 148] id: 9
  r0_9.AccessoryWidget2Type = {
    [r0_9.Head_Skin] = CommonConst.CharAccessoryTypes.Head,
    [r0_9.Face_Skin] = CommonConst.CharAccessoryTypes.Face,
    [r0_9.Waist_Skin] = CommonConst.CharAccessoryTypes.Waist,
    [r0_9.Back_Skin] = CommonConst.CharAccessoryTypes.Back,
    [r0_9.FX_Dead_Skin] = CommonConst.CharAccessoryTypes.FX_Dead,
    [r0_9.FX_Teleport_Skin] = CommonConst.CharAccessoryTypes.FX_Teleport,
    [r0_9.FX_Footprint_Skin] = CommonConst.CharAccessoryTypes.FX_Footprint,
    [r0_9.FX_Body_Skin] = CommonConst.CharAccessoryTypes.FX_Body,
    [r0_9.FX_PlungingATK_Skin] = CommonConst.CharAccessoryTypes.FX_PlungingATK,
    [r0_9.FX_HelixLeap_Skin] = CommonConst.CharAccessoryTypes.FX_HelixLeap,
  }
  r0_9.DefaultCharAccessoryIds = r1_0:GetDefaultCharAccessoryIds()
  r0_9.AccessoryType2Widget = {}
  for r5_9, r6_9 in pairs(r0_9.AccessoryWidget2Type) do
    r0_9.AccessoryType2Widget[r6_9] = r5_9
  end
  -- close: r1_9
  r0_9.NoneAccessoryIconPaths = r1_0:GetCharNoneAccessoryIconPaths()
end
function r2_0.InitCharAppearanceSuits(r0_10)
  -- line: [150, 248] id: 10
  local r1_10 = r0_10.Target.AppearanceSuits[r0_10.CurrentSuitsIdx]
  local r2_10 = r0_10.Target:Data()
  local r3_10 = r1_10.SkinId and r2_10.DefaultSkinId
  local r4_10 = DataMgr.Skin[r3_10] and DataMgr.Skin[r2_10.DefaultSkinId]
  local r6_10 = r1_0:GetAvatar().CommonChars[r0_10.Target.CharId]
  local r7_10 = r6_10 and r6_10.OwnedSkins[r3_10]
  local r8_10 = nil
  local r9_10 = nil
  if r0_10.bFormPersonalPage then
    if r7_10 then
      r8_10 = r7_10.Colors and {}
    else
      goto label_40	-- block#9 is visited secondly
    end
    if r7_10 then
      r9_10 = r7_10.CurrentPlanIndex and nil
    else
      goto label_48	-- block#12 is visited secondly
    end
  end
  local r10_10 = {
    bDyeable = r2_10.DefaultSkinId ~= r3_10,
    IconPath = r4_10.LongIcon,
    Owner = r0_10,
    Type = r0_10.Type,
    IsPreviewMode = r0_10.IsPreviewMode,
    bFormPersonalPage = r0_10.bFormPersonalPage,
    IsTargetUnowned = r0_10.IsTargetUnowned,
    DyeInfos = r8_10,
    DyePlanIndex = r9_10,
    NoState = true,
    OnClicked = function()
      -- line: [181, 194] id: 11
      if not r0_10.bFormPersonalPage then
        r0_10:OpenSkin({
          Target = r0_10.Target,
          Type = r0_10.Type,
          SkinId = r3_10,
          OnCloseCallback = r0_10.OnSkinClosed,
          Parent = r0_10,
          IsCharacterTrialMode = r0_10.IsCharacterTrialMode,
          IsTargetUnowned = r0_10.IsTargetUnowned,
        })
      end
    end,
    TipType = "Skin",
    ItemId = r3_10,
    Rarity = r4_10.Rarity,
  }
  r0_10:OnSkinItemContentCreated(r10_10)
  r0_10.Char_Skin:OnListItemObjectSet(r10_10)
  local r11_10, r12_10 = r0_10.Target:GetPartMeshAccessoryInfo(r3_10)
  for r17_10, r18_10 in pairs(CommonConst.NewCharAccessoryTypes) do
    local r19_10 = r1_10.Accessory[r18_10] and r0_10.NoneAccessoryId
    if r19_10 <= 0 and r12_10 and r12_10 == r17_10 and r7_10 and r7_10.IsShowPartMesh then
      r19_10 = r11_10
    end
    local r20_10 = r0_10.AccessoryType2Widget[r17_10]
    if r20_10 then
      local r21_10 = DataMgr.CharAccessory[r19_10] and DataMgr.CharPartMesh[r19_10]
      local r22_10 = {
        Owner = r0_10,
        OnClicked = function()
          -- line: [215, 227] id: 12
          AudioManager(r0_10):PlayUISound(nil, "event:/ui/common/click_mid", nil, nil)
          r0_10:OpenSkin({
            Target = r0_10.Target,
            Type = r0_10.Type,
            AccessoryId = r19_10,
            AccessoryType = r17_10,
            OnCloseCallback = r0_10.OnSkinClosed,
            IsCharacterTrialMode = r0_10.IsCharacterTrialMode,
            IsTargetUnowned = r0_10.IsTargetUnowned,
            Parent = r0_10,
          })
        end,
        IsPreviewMode = r0_10.IsPreviewMode,
        IsTargetUnowned = r0_10.IsTargetUnowned,
      }
      local r23_10 = DataMgr.CharAccessory[r19_10]
      if r23_10 then
        r23_10 = "CharAccessory" and "CharPartMesh"
      else
        goto label_139	-- block#30 is visited secondly
      end
      r22_10.TipType = r23_10
      r22_10.AccessoryId = r19_10
      r22_10.AccessoryType = r17_10
      r22_10.IsCharacterTrialMode = r0_10.IsCharacterTrialMode
      if r21_10 and r0_10.DefaultCharAccessoryIds[r17_10] ~= r19_10 then
        r22_10.IconPath = r21_10.Icon
        r22_10.IsNoneIcon = false
        r23_10 = r22_10.ItemId
        if r23_10 then
          r23_10 = r22_10.ItemId
          if r23_10 > 0 then
            r23_10 = r22_10.ItemId ~= DataMgr.GlobalConstant.EmptyCharAccessoryID.ConstantValue
          else
            goto label_167	-- block#36 is visited secondly
          end
        end
        r22_10.IsDressed = r23_10
        r22_10.Rarity = r21_10.Rarity
      else
        r22_10.IconPath = r0_10.NoneAccessoryIconPaths[r17_10]
        r22_10.IsNoneIcon = true
      end
      r0_10:OnAccessoryItemContentCreated(r22_10)
      r20_10:OnListItemObjectSet(r22_10)
    end
    -- close: r19_10
    -- close: r17_10
  end
  -- close: r13_10
end
function r2_0.OpenSkin(r0_13, r1_13)
  -- line: [250, 253] id: 13
  UIManager(r0_13):LoadUI(UIConst.LoadInConfig, DataMgr.SystemUI.ArmorySkin.UIName, r0_13.Parent:GetZOrder(), r1_13)
end
function r2_0.OnAccessoryItemContentCreated(r0_14, r1_14)
  -- line: [257, 258] id: 14
end
function r2_0.OnSkinItemContentCreated(r0_15, r1_15)
  -- line: [260, 261] id: 15
end
function r2_0.InitWeaponAppearanceSuits(r0_16)
  -- line: [265, 348] id: 16
  local r1_16 = r0_16.Target:GetAppearance()
  local r2_16 = r0_16.Target:Data()
  local r3_16 = r1_16.SkinId and r0_16.Target.WeaponId
  local r4_16 = DataMgr.WeaponSkin[r3_16]
  if not r4_16 then
    r4_16 = {}
    r4_16.LongIcon = r2_16.LongIcon and r2_16.GachaIcon
  end
  local r5_16 = nil
  local r6_16 = nil
  local r7_16 = nil
  if r0_16.bFormPersonalPage then
    local r8_16 = r0_16.Target:GetSkin(r3_16)
    r5_16 = r8_16.Colors
    r7_16 = r8_16.SpecialColor
    r6_16 = r8_16.CurrentPlanIndex
  end
  local r8_16 = {
    bDyeable = true,
    IconPath = r4_16.LongIcon,
    Owner = r0_16,
    Type = r0_16.Type,
    bFormPersonalPage = r0_16.bFormPersonalPage,
    IsPreviewMode = r0_16.IsPreviewMode,
    IsTargetUnowned = r0_16.IsTargetUnowned,
    DyeInfos = r5_16,
    DyePlanIndex = r6_16,
    SpecialColor = r7_16,
    NoState = true,
    OnClicked = function()
      -- line: [297, 307] id: 17
      r0_16:OpenSkin({
        Target = r0_16.Target,
        Type = r0_16.Type,
        SkinId = r3_16,
        OnCloseCallback = r0_16.OnSkinClosed,
        IsCharacterTrialMode = r0_16.IsCharacterTrialMode,
        IsTargetUnowned = r0_16.IsTargetUnowned,
        Parent = r0_16,
      })
    end,
    ItemId = r3_16 and nil,
  }
  local r9_16 = DataMgr.WeaponSkin[r3_16]
  if r9_16 then
    r9_16 = "WeaponSkin" and nil
  else
    goto label_68	-- block#13 is visited secondly
  end
  r8_16.TipType = r9_16
  r0_16:OnSkinItemContentCreated(r8_16)
  r0_16.Weapon_Skin:OnListItemObjectSet(r8_16)
  r9_16 = DataMgr
  local r10_16 = r1_16.Accessory[1] and -1
  if r10_16 then
    r9_16 = DataMgr.WeaponAccessory[r10_16]
  end
  local r11_16 = {
    Owner = r0_16,
    OnClicked = function()
      -- line: [321, 332] id: 18
      r0_16:OpenSkin({
        Target = r0_16.Target,
        Type = r0_16.Type,
        AccessoryId = r10_16,
        OnCloseCallback = r0_16.OnSkinClosed,
        Parent = r0_16,
        IsCharacterTrialMode = r0_16.IsCharacterTrialMode,
        IsTargetUnowned = r0_16.IsTargetUnowned,
      })
    end,
    IsPreviewMode = r0_16.IsPreviewMode,
    IsTargetUnowned = r0_16.IsTargetUnowned,
    TipType = "WeaponAccessory",
    AccessoryId = r10_16,
  }
  if not r9_16 then
    r11_16.IconPath = r0_0.GetNoneAccessoryIconPath()
    r11_16.IsNoneIcon = true
  else
    r11_16.IconPath = r9_16.Icon
    r11_16.IsNoneIcon = false
  end
  r0_16:OnAccessoryItemContentCreated(r11_16)
  r0_16.Accessory_Skin:OnListItemObjectSet(r11_16)
end
function r2_0.Construct(r0_19)
  -- line: [353, 355] id: 19
  r0_19.NoneAccessoryId = DataMgr.GlobalConstant.EmptyCharAccessoryID.ConstantValue
end
function r2_0.OnSkinClosed(r0_20)
  -- line: [357, 364] id: 20
  r0_20.Parent:BlockAllUIInput(false)
  local r1_20 = UIManager(r0_20):GetArmoryUIObj()
  if r1_20 then
    r1_20:ResetActorRotation()
    r1_20:UpdateMontageAndCamera()
  end
end
function r2_0.SwitchCharAppearanceSuits(r0_21, r1_21)
  -- line: [374, 378] id: 21
  r0_21.CurrentSuitsIdx = r1_21
  r0_21:InitCharAppearanceSuits()
  r0_21:AddCharAppearanceReddotListen(r0_21.Target.CharId)
end
function r2_0.OnSuitsItemClicked(r0_22, r1_22)
  -- line: [380, 384] id: 22
  r0_22.Parent:BlockAllUIInput(true)
  GWorld:GetAvatar():SwitchCurrentCharAppearance(r0_22.Target.Uuid, r1_22)
end
function r2_0.OnCharAppearanceChanged(r0_23, r1_23, r2_23, r3_23)
  -- line: [386, 397] id: 23
  r0_23.Parent:BlockAllUIInput(false)
  if not ErrorCode:Check(r1_23) then
    return 
  end
  r0_23:ResetTarget()
  r0_23:SwitchCharAppearanceSuits(r0_23.Target.CurrentAppearanceIndex)
  if r0_23.ActorController and r0_23.ActorController.ArmoryPlayer then
    r0_23.ActorController:ChangeCharAppearance(r0_23.Target:DumpAppearanceSuit(GWorld:GetAvatar()))
    r0_23.ActorController.DelayFrame = 30
    r0_23.ActorController:SetMontageAndCamera(CommonConst.ArmoryType.Char, nil, CommonConst.ArmoryTag.Appearance)
  end
  r0_23:PlayAnimation(r0_23.Change)
end
function r2_0.ResetTarget(r0_24)
  -- line: [399, 406] id: 24
  local r1_24 = r1_0:GetAvatar()
  if r0_24.Type == CommonConst.ArmoryType.Char then
    r0_24.Target = r1_24.Chars[r0_24.Target.Uuid] and r0_24.Target
  else
    r0_24.Target = r1_24.Weapons[r0_24.Target.Uuid] and r0_24.Target
  end
end
function r2_0.PlayInAnim(r0_25)
  -- line: [408, 412] id: 25
  r0_25:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_25:StopAnimation(r0_25.Out)
  r0_25:PlayAnimation(r0_25.In)
end
function r2_0.PlayOutAnim(r0_26)
  -- line: [414, 418] id: 26
  r0_26:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  r0_26:StopAnimation(r0_26.In)
  r0_26:PlayAnimation(r0_26.Out)
end
function r2_0.AddCharAppearanceReddotListen(r0_27, r1_27)
  -- line: [424, 455] id: 27
  if r0_27.NoReddot then
    return 
  end
  r0_27.AppearanceNodeNames = r0_27.AppearanceNodeNames and {}
  r0_27:RemoveAppearanceReddotListen()
  local r3_27 = GWorld:GetAvatar().CommonChars[r1_27]
  for r8_27, r9_27 in pairs(CommonConst.CharAccessoryTypes) do
    local r10_27 = {}
    local r11_27 = r1_27 .. CommonConst.DataType.CharAccessory .. r9_27
    if r0_27.AccessoryType2Widget[r9_27] then
      local r12_27 = CommonConst.DataType.CharAccessory .. r9_27
      local r13_27 = ReddotManager.GetTreeNode(r12_27)
      if r13_27 then
        r13_27 = 1 and nil
      else
        goto label_48	-- block#8 is visited secondly
      end
      r10_27[r12_27] = r13_27
      for r17_27, r18_27 in pairs(r3_27.OwnedSkins) do
        r12_27 = r12_27 .. r18_27.SkinId
        local r19_27 = ReddotManager.GetTreeNode(r12_27)
        if r19_27 then
          r19_27 = 1 and nil
        else
          goto label_67	-- block#12 is visited secondly
        end
        r10_27[r12_27] = r19_27
      end
      -- close: r13_27
      if not IsEmptyTable(r10_27) then
        ReddotManager.AddListener(r11_27, r0_27, function(r0_28, r1_28)
          -- line: [441, 444] id: 28
          r0_27.AccessoryType2Widget[r9_27].Content.IsNew = r1_28 > 0
          r0_27.AccessoryType2Widget[r9_27]:SetIsNew(r1_28 > 0)
        end, r10_27)
        r0_27.AppearanceNodeNames[r11_27] = 1
      end
    end
    -- close: r8_27
  end
  -- close: r4_27
  local r4_27 = CommonConst.DataType.Char .. CommonConst.DataType.Skin .. r1_27
  r0_27.AppearanceNodeNames[r4_27] = 1
  local r9_27 = nil
  ReddotManager.AddListener(r4_27, r0_27, function(r0_29, r1_29)
    -- line: [451, 454] id: 29
    r0_27.Char_Skin.Content.IsNew = r1_29 > 0
    r0_27.Char_Skin:SetIsNew(r1_29 > 0)
  end, r9_27, true)
end
function r2_0.RemoveAppearanceReddotListen(r0_30)
  -- line: [457, 463] id: 30
  if r0_30.NoReddot then
    return 
  end
  for r5_30, r6_30 in pairs(r0_30.AppearanceNodeNames) do
    ReddotManager.RemoveListener(r5_30, r0_30)
  end
  -- close: r1_30
  r0_30.AppearanceNodeNames = {}
end
function r2_0.AddWeaponAppearanceReddotListen(r0_31, r1_31)
  -- line: [465, 492] id: 31
  if r0_31.NoReddot then
    return 
  end
  r0_31.AppearanceNodeNames = r0_31.AppearanceNodeNames and {}
  r0_31:RemoveAppearanceReddotListen()
  local r2_31 = r1_31 .. CommonConst.DataType.Weapon .. CommonConst.DataType.WeaponSkin
  local r3_31 = {}
  local r4_31 = DataMgr.Weapon[r1_31]
  if r4_31 and r4_31.SkinApplicationType then
    for r9_31, r10_31 in pairs(r4_31.SkinApplicationType) do
      local r11_31 = CommonConst.DataType.WeaponSkin .. (r10_31 and "")
      local r12_31 = ReddotManager.GetTreeNode(r11_31)
      if r12_31 then
        r12_31 = 1 and nil
      else
        goto label_50	-- block#11 is visited secondly
      end
      r3_31[r11_31] = r12_31
    end
    -- close: r5_31
  end
  r0_31.AppearanceNodeNames[r2_31] = 1
  if not IsEmptyTable(r3_31) then
    ReddotManager.AddListener(r2_31, r0_31, function(r0_32, r1_32)
      -- line: [480, 483] id: 32
      r0_31.Weapon_Skin.Content.IsNew = r1_32 > 0
      r0_31.Weapon_Skin:SetIsNew(r1_32 > 0)
    end, r3_31)
  end
  local r5_31 = CommonConst.DataType.WeaponAccessory
  r0_31.AppearanceNodeNames[r5_31] = 1
  ReddotManager.AddListener(r5_31, r0_31, function(r0_33, r1_33)
    -- line: [488, 491] id: 33
    r0_31.Accessory_Skin.Content.IsNew = r1_33 > 0
    r0_31.Accessory_Skin:SetIsNew(r1_33 > 0)
  end, nil, true)
end
function r2_0.Destruct(r0_34)
  -- line: [496, 498] id: 34
  r0_34:RemoveAppearanceReddotListen()
end
AssembleComponents(r2_0)
return r2_0
