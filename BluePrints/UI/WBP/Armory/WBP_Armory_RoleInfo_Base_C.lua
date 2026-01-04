-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Armory\WBP_Armory_RoleInfo_Base_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("Utils.SkillUtils")
local r1_0 = require("Utils.UpgradeUtils")
local r2_0 = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local r3_0 = ModController:GetModel()
local r4_0 = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})
r4_0._components = {
  "BluePrints.UI.BP_EMUserWidgetUtils_C",
  "BluePrints.UI.WBP.Armory.Armory_List_Attr_Compoment",
  "BluePrints.UI.WBP.Armory.MainComponent.Armory_ReddotTree_Component"
}
function r4_0.Construct(r0_1)
  -- line: [23, 60] id: 1
  r0_1.AttrSortIndexes = {
    Char = 1,
    Melee = 2,
    Ranged = 3,
    UWeapon = 4,
  }
  r0_1.Text_Capacity:SetText(GText("UI_COST_NAME"))
  r0_1.Text_Mod:SetText(GText("UI_Armory_Mod"))
  r0_1.Btn_Mod.OnClicked:Add(r0_1, r0_1.OnModBtnClicked)
  r0_1.Btn_Mod.OnPressed:Add(r0_1, r0_1.OnModBtnPressed)
  r0_1.Btn_Mod.OnReleased:Add(r0_1, r0_1.OnModBtnReleased)
  if r0_1.GameInputModeSubsystem:GetCurrentInputType() ~= ECommonInputType.Touch then
    r0_1.Btn_Mod.OnHovered:Add(r0_1, r0_1.OnModBtnHovered)
    r0_1.Btn_Mod.OnUnhovered:Add(r0_1, r0_1.OnModBtnUnhovered)
  end
  r0_1.Button_More:Init({
    ClickCallback = r0_1.OnBtn_MoreClicked,
    SoundFunc = function()
      -- line: [40, 42] id: 2
      AudioManager(r0_1):PlayUISound(r0_1, "event:/ui/common/click_btn_small", nil, nil)
    end,
    SoundFuncReceiver = r0_1,
    OwnerWidget = r0_1,
  })
  r0_1.Btn_Intensify:BindEventOnClicked(r0_1, r0_1.OnIntensifyBtnClicked)
  r0_1.Btn_Intensify:BindForbidStateExecuteEvent(r0_1, r0_1.OnForbiddenIntensifyBtnClicked)
  r0_1.Btn_Replace:BindEventOnClicked(r0_1, r0_1.OnReplaceBtnClicked)
  r0_1.Btn_Replace:BindForbidStateExecuteEvent(r0_1, r0_1.OnForbiddenReplaceBtnClicked)
  r0_1.ConfirmBtns = {
    r0_1.Btn_Intensify,
    r0_1.Btn_Replace
  }
  r0_1:AddDispatcher(EventID.OnResourcesChanged, r0_1, r0_1.OnResourcesChanged)
  r0_1:AddDispatcher(EventID.OnUnlockCharUsePiece, r0_1, r0_1.OnUnlockCharUsePiece)
  r0_1:AddDispatcher(EventID.OnPurchaseShopItem, r0_1, r0_1.OnPurchaseShopItem)
  r0_1:AddDispatcher(EventID.OnCharRewardStateChanged, r0_1, r0_1.UpdateCharRewardReddot)
  r0_1:AddDispatcher(EventID.OnWeaponRewardStateChanged, r0_1, r0_1.UpdateWeaponRewardReddot)
end
function r4_0.UpdateCharRewardReddot(r0_3, r1_3)
  -- line: [62, 71] id: 3
  if r0_3.IsPreviewMode or r0_3.Type ~= "Char" then
    return 
  end
  if not r0_3.Target or r0_3.Target.CharId ~= r1_3 then
    return 
  end
  r0_3.LevelInfo:ShowRewardReddot(GWorld:GetAvatar():IsCharHasReward(r1_3))
end
function r4_0.UpdateWeaponRewardReddot(r0_4, r1_4)
  -- line: [73, 82] id: 4
  if r0_4.IsPreviewMode or r0_4.Type ~= "Weapon" then
    return 
  end
  if not r0_4.Target or r0_4.Target.WeaponId ~= r1_4 then
    return 
  end
  r0_4.LevelInfo:ShowRewardReddot(GWorld:GetAvatar():IsWeaponHasReward(r1_4))
end
function r4_0.BindEvents(r0_5, r1_5, r2_5)
  -- line: [84, 90] id: 5
  r0_5.EventReceiver = r1_5
  r0_5.Event_OnBtnIntensifyClicked = r2_5.OnBtnIntensifyClicked
  r0_5.Event_OnBtnReplaceClicked = r2_5.OnBtnReplaceClicked
  r0_5.Event_OnForbiddenBtnIntensifyClickedd = r2_5.OnForbiddenBtnIntensifyClicked
  r0_5.Event_OnForbiddenBtnReplaceClicked = r2_5.OnForbiddenBtnReplaceClicked
end
function r4_0.OnIntensifyBtnClicked(r0_6)
  -- line: [92, 96] id: 6
  if r0_6.Event_OnBtnIntensifyClicked then
    r0_6.Event_OnBtnIntensifyClicked(r0_6.EventReceiver)
  end
end
function r4_0.OnReplaceBtnClicked(r0_7)
  -- line: [98, 102] id: 7
  if r0_7.Event_OnBtnReplaceClicked then
    r0_7.Event_OnBtnReplaceClicked(r0_7.EventReceiver)
  end
end
function r4_0.OnForbiddenIntensifyBtnClicked(r0_8)
  -- line: [104, 108] id: 8
  if r0_8.Event_OnForbiddenBtnIntensifyClickedd then
    r0_8.Event_OnForbiddenBtnIntensifyClickedd(r0_8.EventReceiver)
  end
end
function r4_0.OnForbiddenReplaceBtnClicked(r0_9)
  -- line: [110, 114] id: 9
  if r0_9.Event_OnForbiddenBtnReplaceClicked then
    r0_9.Event_OnForbiddenBtnReplaceClicked(r0_9.EventReceiver)
  end
end
function r4_0.UpdateButtonStyle(r0_10, r1_10)
  -- line: [116, 142] id: 10
  local r2_10 = true
  for r7_10, r8_10 in ipairs(r1_10) do
    r0_10.ConfirmBtns[r7_10]:SetVisibility(r8_10.Visibility)
    r0_10.ConfirmBtns[r7_10]:SetText(r8_10.Text)
    r0_10.ConfirmBtns[r7_10]:ForbidBtn(r8_10.ForbidBtn)
    if r0_10.ConfirmBtns[r7_10]:IsVisible() then
      r2_10 = false
    end
  end
  -- close: r3_10
  if r2_10 and not r0_10.IsPreviewMode then
    r0_10.Text_Ultra_Hint:SetText(GText("UI_Armory_Signature_Cant"))
    r0_10.Panel_Hint:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  elseif r0_10.UnlockHintText then
    r0_10.Text_Ultra_Hint:SetText(r0_10.UnlockHintText)
    r0_10.Panel_Hint:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    r0_10.Panel_Hint:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if r1_10[1].ForbidBtn then
    r0_10.Btn_Intensify:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    r0_10.Btn_Intensify:SetVisibility(r1_10[1].Visibility)
  end
end
function r4_0.Init(r0_11, r1_11)
  -- line: [145, 193] id: 11
  if r2_0:GetAvatar():CheckUIUnlocked("Mod") then
    r0_11.IsShowModButton = true
    r0_11.Panel_Mod:SetRenderOpacity(1)
    r0_11.Panel_Mod:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    r0_11.IsShowModButton = false
    r0_11.Panel_Mod:SetRenderOpacity(0)
    r0_11.Panel_Mod:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  end
  r0_11.Parent = r1_11.Parent
  r0_11.Type = r1_11.Type
  r0_11.IsUltra = false
  if r1_11.Tag and string.find(r1_11.Tag, CommonConst.ArmoryTag.UWeapon) then
    r0_11.Tag = CommonConst.ArmoryTag.UWeapon
    r0_11.IsUltra = true
    r0_11:CheckShowUWeaponTitleUI()
  else
    r0_11:HideUWeaponTitleUI()
    r0_11.Tag = r1_11.Tag
  end
  r0_11.Target = r1_11.Target
  r0_11.Char = r1_11.Char
  r0_11.IsPreviewMode = r1_11.IsPreviewMode
  r0_11.IsTargetUnowned = r1_11.IsTargetUnowned
  r0_11.bNeedPreviewSwitcher = r1_11.bNeedPreviewSwitcher
  r0_11.bHideUWeaponMod = r1_11.bHideUWeaponMod
  r0_11.EscapeArmoryCharID = r1_11.EscapeArmoryCharID
  if r0_11.IsPreviewMode and r0_11.bNeedPreviewSwitcher or r0_11.IsTargetUnowned then
    local r3_11 = {}
    r3_11.KeyInfo = {
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "X",
        }
      },
    }
    if r0_11.IsTargetUnowned then
      r3_11.Avatars = {
        r1_11.AvatarPrime,
        r1_11.AvatarMax
      }
      r3_11.CurrentAvatar = r1_11.CurrentAvatar
      r0_11.Btn_MaxSwitch:Init(r3_11)
    else
      r0_11.Btn_MaxSwitch:Init(r3_11)
    end
    r0_11.Btn_MaxSwitch:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    r0_11.Btn_MaxSwitch:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  r0_11:SetOpenModParams(r0_11.OpenModParams)
  r0_11:UpdateTargetInfo(r0_11.Target, r0_11.Type, r0_11.Tag)
  r0_11:UpdateAttrInfo(r0_11.Target, r0_11.Type)
end
function r4_0.UpdateTargetInfo(r0_12, r1_12, r2_12, r3_12)
  -- line: [195, 242] id: 12
  -- error: decompile function#12: Condition failed: `def_pos <= last_end && last_end <= self.stmts.len()`
end
function r4_0.UpdateUnlockBtn(r0_13, r1_13, r2_13, r3_13)
  -- line: [244, 328] id: 13
  r0_13.UnlockHintText = nil
  if r0_13.IsUltra then
    r0_13.Btn_Unlock:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_13.Text_Ultra_Hint:SetText(GText("UI_Armory_Signature_Cant"))
    return 
  end
  r0_13.Btn_Unlock:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  local r4_13 = GWorld:GetAvatar()
  local r5_13 = {}
  local r6_13 = DataMgr.Resource
  local r7_13 = nil
  local r8_13 = false
  if r2_13 == "Char" then
    r7_13 = GText("UI_Char_Unlock")
    local r9_13 = DataMgr.Char[r1_13.CharId]
    local r10_13 = r9_13.CharPieceId
    local r11_13 = r4_13.Resources[r10_13]
    if not r11_13 then
      r11_13 = {}
      r11_13.Count = 0
    end
    local r12_13, r13_13 = ShopUtils:GetShopItemDataById(r10_13, CommonConst.DataType.Resource, true)
    local r14_13 = {
      Id = r10_13,
      Icon = r6_13[r10_13] and r6_13[r10_13].Icon,
      ItemType = CommonConst.DataType.Resource,
      Count = r11_13.Count,
      NeedCount = r9_13.CharUnlockRequiredPiece and 0,
      ShopItemId = r12_13,
      IsShowDetails = true,
    }
    r5_13[1] = r14_13
    if r13_13 then
      r14_13 = r4_13.Resources[r13_13.PriceType]
      if not r14_13 then
        r14_13 = {}
        r14_13.Count = 0
      end
      r5_13[2] = {
        Id = r13_13.PriceType,
        ItemType = CommonConst.DataType.Resource,
        Count = r14_13.Count,
        NeedCount = r13_13.Price * (r5_13[1].NeedCount - r5_13[1].Count),
        Price = r13_13.Price,
        IsShowDetails = true,
      }
      if r5_13[2].NeedCount <= 0 then
        r5_13[2].NeedCount = 0
      end
    end
    r8_13 = r2_0:TryAddUnlockableCharReddot(r1_13.CharId)
  elseif r2_13 == "Weapon" then
    r7_13 = GText("UI_Weapon_Unlock")
    local r9_13, r10_13 = ShopUtils:GetShopItemDataById(r1_13.WeaponId, CommonConst.DataType.Weapon, true)
    if r10_13 then
      local r11_13 = r10_13.PriceType
      local r12_13 = r4_13.Resources[r11_13]
      if not r12_13 then
        r12_13 = {}
        r12_13.Count = 0
      end
      local r13_13 = {
        Id = r10_13.PriceType,
        Icon = r6_13[r11_13] and r6_13[r11_13].Icon,
        ItemType = CommonConst.DataType.Resource,
        Count = r12_13.Count,
        NeedCount = r10_13.Price,
        bShowNeedCount = true,
        ShopItemId = r9_13,
        IsShowDetails = true,
      }
      r5_13[1] = r13_13
    else
      r0_13.UnlockHintText = GText("UI_Weapon_Locked")
      r0_13.Text_Ultra_Hint:SetText(GText("UI_Weapon_Locked"))
      r0_13.Panel_Hint:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      r0_13.Btn_Unlock:SetVisibility(UIConst.VisibilityOp.Collapsed)
      return 
    end
  end
  if r5_13[1] and r5_13[1].NeedCount < r5_13[1].Count then
    r5_13[1].Count = r5_13[1].NeedCount
  end
  local r9_13 = rawset
  local r10_13 = r0_13
  local r11_13 = "UnlockBtnParams"
  local r12_13 = {
    Owner = r0_13,
    ShowReddot = r8_13,
    Resources = r5_13,
    Text = r7_13,
    ResourceKeyInfos = {
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "Y",
        }
      },
      bLongPress = true,
    },
    KeyInfos = {
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "Y",
        }
      },
    },
    OnClicked = r0_13.OnUnlockBtnClicked,
  }
  r9_13(r10_13, r11_13, r12_13)
  r0_13:UpdateUnlockBtnByParams(r0_13.UnlockBtnParams)
end
function r4_0.UpdateUnlockBtnByParams(r0_14, r1_14)
  -- line: [330, 333] id: 14
  r0_14:OnUnlockBtnParamsCreated(r1_14)
  r0_14.Btn_Unlock:Init(r1_14)
end
function r4_0.OnUnlockBtnParamsCreated(r0_15)
  -- line: [335, 337] id: 15
end
function r4_0.UpdateModPanel(r0_16, r1_16)
  -- line: [339, 353] id: 16
  local r2_16 = r3_0:GetTargetMaxCost(r1_16)
  r0_16.Text_Capacity_Num:SetText(r3_0:CalcModSuitTotalCost(r1_16, r1_16.ModSuitIndex, true))
  r0_16.Text_Capacity_NumMax:SetText("/" .. r2_16)
  if r0_16.IsTargetUnowned then
    r0_16.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return 
  end
  r0_16:RemoveModReddotListen()
  r0_16:AddModReddotListen(function(r0_17, r1_17)
    -- line: [349, 352] id: 17
    local r2_17 = nil	-- notice: implicit variable refs by block#[3]
    if r1_17 > 0 then
      r2_17 = "SelfHitTestInvisible"
      if not r2_17 then
        ::label_5::
        r2_17 = "Collapsed"
      end
    else
      goto label_5	-- block#2 is visited secondly
    end
    r0_17.New:SetVisibility(UIConst.VisibilityOp[r2_17])
  end, r1_16)
end
function r4_0.UpdateLevelUpBtn(r0_18, r1_18, r2_18, r3_18)
  -- line: [355, 378] id: 18
  if r0_18.IsPreviewMode or r0_18.IsTargetUnowned then
    return 
  end
  if r0_18.IsUltra then
    return 
  end
  if not r0_18.bHideReddot then
    if r0_18.Btn_Intensify:GetVisibility() == UIConst.VisibilityOp.SelfHitTestInvisible then
      if r1_0.CalcCharOrWeaponLevelUp(r1_18, r2_18, r1_18.Level, r1_18.Level + 1).CanUpgrade then
        r0_18.Btn_Intensify:SetReddotVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      elseif r1_0.CalcBreakLevelUp(r1_18, r2_18, r1_18.EnhanceLevel + 1).CanUpgrade then
        r0_18.Btn_Intensify:SetReddotVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      else
        r0_18.Btn_Intensify:SetReddotVisibility(UIConst.VisibilityOp.Collapsed)
      end
    end
  else
    r0_18.Btn_Intensify:SetReddotVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r4_0.UpdateAttrInfo(r0_19, r1_19, r2_19)
  -- line: [380, 434] id: 19
  if not r2_19 then
    r2_19 = r0_19.Type
  end
  r0_19.Attrs = nil
  local r3_19 = {}
  r0_19.AttrCount = 0
  r0_19.Index2AttrKey = {}
  local r4_19 = "SortIndex" .. r0_19.AttrSortIndexes[r0_19.Tag]
  local r5_19 = r2_0:GetAvatar()
  local r6_19 = nil
  local r7_19 = nil
  if r5_19.MeleeWeapon then
    r6_19 = r5_19.Weapons[r5_19.MeleeWeapon]
  end
  if r5_19.RangedWeapon then
    r7_19 = r5_19.Weapons[r5_19.RangedWeapon]
  end
  local r8_19 = r1_19:DumpDefaultBattleAttr(r5_19, {
    Char = r0_19.Char,
    MeleeWeapon = r6_19,
    RangedWeapon = r7_19,
  }).TotalValues
  r0_19.Attrs = r8_19
  if r2_19 == "Char" then
    r8_19 = "Char"
    if not r8_19 then
      ::label_47::
      r8_19 = r1_19:HasTag("Melee")
      if r8_19 then
        r8_19 = "Melee" and "Ranged"
      else
        goto label_55	-- block#10 is visited secondly
      end
    end
  else
    goto label_47	-- block#8 is visited secondly
  end
  r0_19.Attrs = r0_19.Attrs and {}
  local r9_19 = r1_19[r2_19 .. "Id"]
  if r0_19.Type == "Weapon" then
    r0_19:InsertWeaponType(r1_19.WeaponId, r0_19.Attrs)
    local r10_19 = "WeaponType"
    if r0_19.Attrs[r10_19] then
      r0_19.AttrCount = r0_19.AttrCount + 1
      r0_19.Index2AttrKey[r0_19.AttrCount] = r10_19
      r3_19[r10_19] = r0_19.Attrs[r10_19]
    end
    for r16_19, r17_19 in pairs(DataMgr.BattleWeaponAttr) do
      local r18_19 = r0_19.Attrs[r16_19] and r17_19.DefaultValue
      if CommonUtils:ShouldDisplayAttr(r16_19, r18_19, r0_19.Type, r8_19, r9_19) then
        r0_19.AttrCount = r0_19.AttrCount + 1
        r0_19.Index2AttrKey[r0_19.AttrCount] = r16_19
        r3_19[r16_19] = r18_19
      end
    end
    -- close: r12_19
  else
    r0_19:InsertExcelWeaponTag(r1_19.CharId, r0_19.Attrs)
    r0_19.PosItem:Init({
      Owner = r0_19,
      CharId = r1_19.CharId,
    })
    for r14_19, r15_19 in pairs(r0_19.Attrs) do
      if CommonUtils:ShouldDisplayAttr(r14_19, r15_19, r0_19.Type, r8_19, r9_19) then
        r0_19.AttrCount = r0_19.AttrCount + 1
        r0_19.Index2AttrKey[r0_19.AttrCount] = r14_19
        r3_19[r14_19] = r15_19
      end
    end
    -- close: r10_19
  end
  r0_19.Attrs = r3_19
  table.sort(r0_19.Index2AttrKey, function(r0_20, r1_20)
    -- line: [430, 432] id: 20
    return DataMgr.AttrConfig[r0_20][r4_19] < DataMgr.AttrConfig[r1_20][r4_19]
  end)
  r0_19:UpdateAttrListView(false)
end
function r4_0.IsRecommendAttr(r0_21, r1_21)
  -- line: [436, 441] id: 21
  for r6_21, r7_21 in ipairs(r0_21.Target:BattleData().RecommendAttr and {}) do
    if r1_21 == r7_21 then
      return true
    end
  end
  -- close: r2_21
  return false
end
function r4_0.OnModBtnClicked(r0_22)
  -- line: [443, 481] id: 22
  AudioManager(r0_22):PlayUISound(r0_22, "event:/ui/common/click_btn_large", nil, nil)
  r0_22.bModBtnPressed = false
  if not r0_22.IsShowModButton then
    return 
  end
  if r0_22.IsTargetUnowned then
    r2_0:SetTemporaryAvatar(r0_22.Btn_MaxSwitch:GetCurrentAvatar())
  end
  local r1_22 = {}
  if r0_22.OpenModParams.CharUuid then
    table.insert(r1_22, r0_22.OpenModParams.CharUuid)
  end
  if r0_22.OpenModParams.MeleeUuid then
    table.insert(r1_22, r0_22.OpenModParams.MeleeUuid)
  end
  if r0_22.OpenModParams.RangedUuid then
    table.insert(r1_22, r0_22.OpenModParams.RangedUuid)
  end
  if r0_22.OpenModParams.CharUuid and not r0_22.bHideUWeaponMod then
    local r2_22 = r2_0:GetAvatar().Chars[r0_22.OpenModParams.CharUuid]
    if r2_22 then
      for r7_22, r8_22 in ipairs(r2_22.UWeaponEids and {}) do
        table.insert(r1_22, r8_22)
      end
      -- close: r3_22
    end
  end
  local r2_22 = r0_22.IsPreviewMode
  if not r2_22 then
    r2_22 = r0_22.IsTargetUnowned
    if r2_22 then
      ::label_92::
      r2_22 = ModCommon.MainUICase.Preview and ModCommon.MainUICase.Normal
    else
      goto label_97	-- block#22 is visited secondly
    end
  else
    goto label_92	-- block#21 is visited secondly
  end
  ModController:OpenView(ModCommon.ArmoryMod, r0_22.Type, r0_22.Tag, r1_22, nil, {
    Func = function()
      -- line: [473, 478] id: 23
      r2_0:SetTemporaryAvatar(nil)
      if r0_22.Parent and r0_22.Parent.OnArmoryModClosed then
        r0_22.Parent:OnArmoryModClosed()
      end
    end,
    Obj = nil,
  }, r2_22)
  r0_22:UnRegisterListAttrBtn()
end
function r4_0.SetOpenModParams(r0_24, r1_24)
  -- line: [483, 490] id: 24
  if r1_24 == nil then
    local r2_24 = r2_0:GetAvatar()
    r0_24.OpenModParams = {
      CharUuid = r2_24.CurrentChar,
      MeleeUuid = r2_24.MeleeWeapon,
      RangedUuid = r2_24.RangedWeapon,
    }
  else
    r0_24.OpenModParams = r1_24
  end
end
function r4_0.OnModBtnPressed(r0_25)
  -- line: [492, 495] id: 25
  r0_25.bModBtnPressed = true
  r0_25:PlayAnimation(r0_25.Press)
end
function r4_0.OnModBtnReleased(r0_26)
  -- line: [497, 503] id: 26
  r0_26.bModBtnPressed = false
  r0_26:PlayAnimation(r0_26.Normal)
  if r0_26.bModBtnHovered then
    r0_26:PlayAnimation(r0_26.Hover)
  end
end
function r4_0.OnModBtnHovered(r0_27)
  -- line: [505, 508] id: 27
  r0_27.bModBtnHovered = true
  r0_27:PlayAnimation(r0_27.Hover)
end
function r4_0.OnModBtnUnhovered(r0_28)
  -- line: [510, 515] id: 28
  r0_28.bModBtnHovered = false
  if not r0_28.bModBtnPressed then
    r0_28:PlayAnimation(r0_28.Normal)
  end
end
function r4_0.PlayInAnim(r0_29)
  -- line: [517, 532] id: 29
  if r0_29:IsAnimationPlaying(r0_29.In) then
    r0_29:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    return 
  end
  r0_29:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  r0_29:SetRenderOpacity(0)
  r0_29:AddTimer(0.01, function()
    -- line: [525, 531] id: 30
    r0_29.LevelInfo:PlayStarsInAnim()
    r0_29:PlayAnimation(r0_29.In)
    r0_29:SetRenderOpacity(1)
    r0_29:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r0_29:RegisterListAttrBtn()
  end, false, 0, "RoleInfoInAnim", true)
end
function r4_0.PlayOutAnim(r0_31)
  -- line: [535, 543] id: 31
  r0_31:RemoveTimer("RoleInfoInAnim")
  r0_31:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_31:RemoveModReddotListen()
  r0_31:UnRegisterListAttrBtn()
end
function r4_0.ShowMoreSkillDetails(r0_32)
  -- line: [547, 589] id: 32
  if not r0_32.Target then
    return 
  end
  local r1_32 = r2_0:GetAvatar()
  local r2_32 = AvatarUtils:GetTargetModSuit(r0_32.Target, r0_32.Target.ModSuitIndex) and {}
  local r3_32 = {
    ModData = {},
  }
  for r8_32, r9_32 in pairs(r2_32) do
    if r1_32.Mods[r9_32] then
      table.insert(r3_32.ModData, r1_32.Mods[r9_32])
    end
  end
  -- close: r4_32
  local r4_32 = r0_32.Target:DumpSkillInfos(r1_32, r3_32)
  if not r4_32 then
    return 
  end
  local r5_32 = {}
  local r6_32 = {}
  local r7_32 = DataMgr.Skill
  local r8_32 = {
    Attack = 1,
    HeavyAttack = 2,
    FallAttack = 3,
    SlideAttack = 4,
    Others = 5,
  }
  local r9_32 = nil
  for r14_32, r15_32 in pairs(r4_32) do
    r9_32 = r7_32[r14_32] and r7_32[r14_32][1] and r7_32[r14_32][1][0]
    if r9_32 then
      local r16_32 = table.insert
      local r17_32 = r6_32
      local r18_32 = {
        SkillId = r14_32,
        Priority = r8_32[r9_32.SkillType] and r8_32.Others,
      }
      r16_32(r17_32, r18_32)
    end
  end
  -- close: r10_32
  table.sort(r6_32, function(r0_33, r1_33)
    -- line: [574, 576] id: 33
    return r0_33.Priority < r1_33.Priority
  end)
  for r14_32, r15_32 in ipairs(r6_32) do
    for r21_32, r22_32 in pairs(r0_0.GetSkillAllDesc(r15_32.SkillId, 1, math.min(DataMgr.DataConst.MaxSkillLevel, (r0_32.Target.GradeLevel and 0) + 1), r1_32, r0_32.Target) and {}) do
      table.insert(r5_32, {
        AttrName = r22_32.Desc,
        AttrValue = r22_32.Value,
        AttrDesc = r22_32.Hint,
      })
    end
    -- close: r17_32
  end
  -- close: r10_32
  UIManager(r0_32):ShowCommonPopupUI(100104, {
    Attrs = r5_32,
    DontFocusParentWidget = true,
  }, r0_32)
end
function r4_0.OnBtn_MoreClicked(r0_34)
  -- line: [591, 593] id: 34
  r0_34:ShowMoreSkillDetails()
end
function r4_0.OnBtnAttrClicked(r0_35)
  -- line: [597, 598] id: 35
end
function r4_0.OnResourcesChanged(r0_36, r1_36)
  -- line: [600, 617] id: 36
  if r0_36.IsUltra or rawget(r0_36, "UnlockBtnParams") == nil then
    return 
  end
  r0_36:UpdateUnlockBtn(r0_36.Target, r0_36.Type)
  local r2_36 = r0_36.UnlockBtnParams.Resources[1]
  local r3_36 = r0_36.UnlockBtnParams.Resources[2]
  local r4_36 = false
  if r2_36 and r1_36 == r2_36.Id then
    r4_36 = true
  end
  if r3_36 and r1_36 == r3_36.Id then
    r4_36 = true
  end
  if r4_36 then
    r0_36:UpdateUnlockBtn(r0_36.Target, r0_36.Type)
  end
end
function r4_0.OnUnlockBtnClicked(r0_37)
  -- line: [619, 676] id: 37
  if rawget(r0_37, "UnlockBtnParams") == nil then
    return 
  end
  local r1_37 = r0_37.UnlockBtnParams.Resources[1] and {}
  local r2_37 = r0_37.UnlockBtnParams.Resources[2]
  if r1_37.Count < r1_37.NeedCount then
    if r1_37.Id == CommonConst.Coins.Coin4 then
      UIManager(r0_37):ShowCommonPopupUI(100248, {
        RightCallbackFunction = function()
          -- line: [628, 630] id: 38
          PageJumpUtils:JumpToShopPage(CommonConst.GachaJumpToShopMainTabId, nil, nil, "Shop")
        end,
      }, r0_37)
      return 
    end
    local r3_37 = GWorld:GetAvatar()
    local r4_37 = nil
    if r2_37 then
      r4_37 = r3_37.Resources[r2_37 and r2_37.Id] and {
        Count = 0,
      }
    end
    if r4_37 == nil then
      local r5_37 = DataMgr.Resource[r1_37.Id]
      local r6_37 = UIManager(r0_37)
      local r8_37 = "CommonToastMain"
      local r9_37 = string.format
      local r10_37 = GText("UI_Armory_LackUnlcokResource")
      local r11_37 = GText
      local r12_37 = nil	-- notice: implicit variable refs by block#[16]
      if r5_37 then
        r12_37 = r5_37.ResourceName
        if not r12_37 then
          ::label_78::
          r12_37 = ""
        end
      else
        goto label_78	-- block#15 is visited secondly
      end
      r6_37:ShowUITip(r8_37, r9_37(r10_37, r11_37(r12_37)))
    else
      local r5_37 = DataMgr.Resource[r1_37.Id]
      local r6_37 = r1_37.NeedCount - r1_37.Count
      UIManager(r0_37):ShowCommonPopupUI(100247, {
        LeftItems = {
          {
            ItemId = r2_37.Id,
            ItemType = r2_37.ItemType,
            Count = r2_37.NeedCount,
          }
        },
        RightItems = {
          {
            ItemId = r1_37.Id,
            ItemType = r2_37.ItemType,
            Count = r6_37,
          }
        },
        ShortTextParams = {
          r2_37.NeedCount,
          r6_37,
          GText(r5_37.ResourceName)
        },
        RightCallbackFunction = function()
          -- line: [657, 669] id: 39
          if r2_37.Id == CommonConst.Coins.Coin4 and r4_37.Count < r2_37.NeedCount then
            UIManager(r0_37):ShowCommonPopupUI(100248, {
              RightCallbackFunction = function()
                -- line: [660, 662] id: 40
                PageJumpUtils:JumpToShopPage(CommonConst.GachaJumpToShopMainTabId, nil, nil, "Shop")
              end,
            }, r0_37)
            return 
          end
          r0_37.Parent:BlockAllUIInput(true)
          r0_37.IsWatingForBuyResource = true
          r3_37:PurchaseShopItem(r1_37.ShopItemId, r6_37, true)
        end,
      }, r0_37)
      -- close: r5_37
    end
    -- close: r3_37
  else
    r0_37:OnUnlockBtnConfirm()
  end
end
function r4_0.OnPurchaseShopItem(r0_41, r1_41)
  -- line: [678, 701] id: 41
  if not r0_41.IsWatingForBuyResource and not r0_41.IsWatingForBuyWeapon then
    return 
  end
  r0_41.Parent:BlockAllUIInput(false)
  if not ErrorCode:Check(r1_41) then
    return 
  end
  if r0_41.IsWatingForBuyResource then
    r0_41.IsWatingForBuyResource = false
    r0_41:OnUnlockBtnConfirm()
  elseif r0_41.IsWatingForBuyWeapon then
    r0_41.IsWatingForBuyWeapon = false
    local r3_41 = {
      TargetIdList = {
        DataMgr.ShopItem[r0_41.UnlockBtnParams.Resources[1].ShopItemId].TypeId
      },
      CallbackObj = r0_41,
      CallbackFunc = function()
        -- line: [693, 694] id: 42
      end,
    }
    if r0_41.Parent.ActorController then
      r0_41.Parent.ActorController:StopPlayerSound()
    end
    UIManager(r0_41):LoadUINew("GetWeaponPage", r3_41)
  end
end
function r4_0.OnUnlockBtnConfirm(r0_43)
  -- line: [703, 729] id: 43
  if not r0_43.IsTargetUnowned then
    return 
  end
  local r1_43 = GWorld:GetAvatar()
  if r0_43.Type == "Char" then
    r0_43.Parent:BlockAllUIInput(true)
    r1_43:UnlockCharUsePiece(r0_43.Target.CharId)
  elseif r0_43.Type == "Weapon" then
    local r3_43 = r0_43.Target:Data()
    if not DataMgr.Resource[r0_43.UnlockBtnParams.Resources[1].Id] or not r3_43 then
      return 
    end
    UIManager(r0_43):ShowCommonPopupUI(100262, {
      ShortTextParams = {
        tostring(r0_43.UnlockBtnParams.Resources[1].NeedCount and ""),
        GText(r3_43.WeaponName and "")
      },
      RightCallbackFunction = function()
        -- line: [721, 725] id: 44
        r0_43.Parent:BlockAllUIInput(true)
        r0_43.IsWatingForBuyWeapon = true
        r1_43:PurchaseShopItem(r0_43.UnlockBtnParams.Resources[1].ShopItemId, 1, true)
      end,
    }, r0_43)
  end
end
function r4_0.OnUnlockCharUsePiece(r0_45, r1_45, r2_45)
  -- line: [731, 746] id: 45
  r0_45.Parent:BlockAllUIInput(false)
  if not ErrorCode:Check(r1_45) then
    return 
  end
  local r3_45 = nil
  if r0_45.EscapeArmoryCharID then
    function r3_45()
      -- line: [736, 740] id: 46
      if r2_45 == r0_45.EscapeArmoryCharID then
        r0_45.Parent:OnBackBtnClicked()
      end
    end
  end
  if r0_45.Parent.ActorController then
    r0_45.Parent.ActorController:StopPlayerSound()
  end
  UIUtils.ShowGetCharWeaponPage({
    Chars = {
      [r2_45] = 1,
    },
  }, r3_45, r0_45, nil)
end
function r4_0.CheckShowUWeaponTitleUI(r0_47)
  -- line: [747, 763] id: 47
  local r1_47 = r0_47.Parent
  local r2_47 = r1_47[r1_47.ComparedWeaponName].WeaponId
  if r2_47 then
    local r3_47 = DataMgr.UWeapon[r2_47]
    if r3_47 and r3_47.ArmoryTitleUIPath then
      r0_47:FrestUWeaponTitleUI(r3_47)
    else
      if r0_47.Parent and r0_47.Parent.TextBlock_Name then
        r0_47.Parent.Panel_SubTab:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      end
      r0_47:HideUWeaponTitleUI()
    end
  else
    r0_47:HideUWeaponTitleUI()
  end
end
function r4_0.FrestUWeaponTitleUI(r0_48, r1_48)
  -- line: [765, 791] id: 48
  if not r1_48 or not r1_48.WeaponName or not r1_48.ArmoryTitleUIPath then
    return 
  end
  local r2_48 = r1_48.WeaponName
  local r3_48 = r1_48.ArmoryTitleUIPath
  local r4_48 = UIManager(r0_48):CreateWidget(r1_48.ArmoryTitleUIPath)
  if r4_48 then
    r0_48.Node_Consonance:ClearChildren()
    r0_48.Node_Consonance:AddChild(r4_48)
    r4_48.Text_Name:SetText(GText(r2_48))
    r4_48:PlayAnimation(r4_48.In)
    r4_48:PlayAnimation(r4_48.Loop)
  else
    ScreenPrint("创建UWeaponTitle UI失败，请检查路径是否正确" .. (r1_48.ArmoryTitleUIPath and "空"))
    r0_48:HideUWeaponTitleUI()
  end
  local r5_48 = r1_48.WeaponSound
  if not r5_48 then
    ScreenPrint("武器标题音效路径为空,请填写Uweapon 的 WeaponSound字段 当前ID为" .. tostring(r1_48.WeaponId))
    return 
  end
  AudioManager(r0_48):PlayUISound(r0_48, r5_48, "UWeaponTitleShow", nil)
end
function r4_0.HideUWeaponTitleUI(r0_49)
  -- line: [792, 797] id: 49
  if nil and not nil then
    goto label_3	-- block#1 is visited secondly
  end
  r0_49.Node_Consonance:ClearChildren()
end
AssembleComponents(r4_0)
return r4_0
