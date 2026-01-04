-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Armory\PC\WBP_SquadBuild_Main_C.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local r1_0 = require("BluePrints.UI.WBP.Armory.ActorController.Armory_ActorController")
local r2_0 = require("Utils.TimeUtils")
local r3_0 = require("EMCache.EMCache")
local r4_0 = require("Utils.UIUtils")
require("UnLua")
local r5_0 = Class("BluePrints.UI.BP_UIState_C")
local r6_0 = UE.UWidgetBlueprintLibrary.UnHandled()
function r5_0.Construct(r0_1)
  -- line: [22, 39] id: 1
  local r1_1 = GWorld:GetAvatar()
  if not r1_1 then
    return 
  end
  r1_1:TryCreateDefaultSquad()
  r0_1.TypeTabs = {
    [r0_1.SlotName2Type[r0_1.ESlotName.RangedWeapon]] = r0_1.List_Build.Type_Range,
    [r0_1.SlotName2Type[r0_1.ESlotName.MeleeWeapon]] = r0_1.List_Build.Type_Melee,
  }
  r0_1.List_Build.Type_Range:Init(r0_1.SlotName2Type[r0_1.ESlotName.RangedWeapon], r0_1)
  r0_1.List_Build.Type_Melee:Init(r0_1.SlotName2Type[r0_1.ESlotName.MeleeWeapon], r0_1)
  r0_1.List_Build.Tab_Primary:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_1:RegisterBtnIconInGampad()
  r0_1:AddLSFocusTarget(r0_1.List_Build.Sort.Controller, {
    r0_1.List_Build.Sort
  })
end
function r5_0.Destruct(r0_2)
  -- line: [45, 49] id: 2
  r5_0.Super.Destruct(r0_2)
  AudioManager(r0_2):SetEventSoundParam(r0_2, "OpenSquad", {
    ToEnd = 1,
  })
  r0_2:QuitSquadSetting()
end
r5_0._components = {
  "BluePrints.UI.UI_PC.Common.LSFocusComp",
  "BluePrints.UI.WBP.Abyss.MainComponent.Abyss_CharMainComponent",
  "BluePrints.UI.WBP.Abyss.MainComponent.Abyss_PetMainComponent",
  "BluePrints.UI.WBP.Abyss.MainComponent.Abyss_WeaponMainComponent"
}
local r7_0 = {
  Char = "event:/ui/armory/click_select_role",
  Weapon = "event:/ui/armory/click_select_weapon",
  Pet = "event:/ui/common/click_select_pet",
  Default = "event:/ui/common/click_mid",
}
local r8_0 = {
  Char = "event:/ui/common/role_replace",
  Weapon = "event:/ui/common/weapon_replace",
  Pet = "event:/ui/common/role_replace",
}
r5_0.ESlotName = {
  Char = 1,
  MeleeWeapon = 2,
  RangedWeapon = 3,
  Phantom1 = 4,
  PhantomWeapon1 = 5,
  Phantom2 = 6,
  PhantomWeapon2 = 7,
  Pet = 8,
  Null = 0,
}
r5_0.SlotType2DataType = {
  Char = "Char",
  Pet = "Pet",
  Weapon = "Weapon",
  Ranged = "Weapon",
  Melee = "Weapon",
}
r5_0.GamepadArea = {
  "SquadList",
  "RightDetatilInSquadList",
  "RightDetatilInSingleSquad"
}
r5_0.SlotName2Type = {
  [r5_0.ESlotName.Char] = "Char",
  [r5_0.ESlotName.Pet] = "Pet",
  [r5_0.ESlotName.RangedWeapon] = "Ranged",
  [r5_0.ESlotName.MeleeWeapon] = "Melee",
  [r5_0.ESlotName.Phantom1] = "Char",
  [r5_0.ESlotName.PhantomWeapon1] = "Weapon",
  [r5_0.ESlotName.Phantom2] = "Char",
  [r5_0.ESlotName.PhantomWeapon2] = "Weapon",
}
r5_0.SlotName2TextMap = {
  [r5_0.ESlotName.Char] = GText("UI_Armory_Char"),
  [r5_0.ESlotName.Pet] = GText("MAIN_UI_PET"),
  [r5_0.ESlotName.RangedWeapon] = GText("Ranged") .. GText("UI_SHOP_SUBTAB_NAME_WEAPON"),
  [r5_0.ESlotName.MeleeWeapon] = GText("Melee") .. GText("UI_SHOP_SUBTAB_NAME_WEAPON"),
  [r5_0.ESlotName.Phantom1] = GText("UI_STAT_Sigil") .. "1",
  [r5_0.ESlotName.PhantomWeapon1] = GText("UI_STAT_Sigil") .. "1" .. GText("UI_SHOP_SUBTAB_NAME_WEAPON"),
  [r5_0.ESlotName.Phantom2] = GText("UI_STAT_Sigil") .. "2",
  [r5_0.ESlotName.PhantomWeapon2] = GText("UI_STAT_Sigil") .. "2" .. GText("UI_SHOP_SUBTAB_NAME_WEAPON"),
}
function r5_0.InitUIInfo(r0_3, r1_3, r2_3, r3_3, ...)
  -- line: [120, 139] id: 3
  local r5_3 = nil	-- notice: implicit variable refs by block#[0]
  local r4_3 = nil	-- notice: implicit variable refs by block#[0]
  r0_3.Super.InitUIInfo(r0_3, r1_3, r2_3, r3_3, ...)
  ... = ... -- error: untaken top expr
  r0_3.IsOpenAddSquad = r5_3
  r0_3.SelectIndex = r4_3
  r4_3 = r0_3.SelectIndex and r0_3.IsOpenAddSquad
  r0_3.IsFromDungeonPage = r4_3
  r0_3:InitSquadData()
  r0_3:UpdateGamepadIcon()
  r0_3:InitTabUI()
  r0_3:InitLeftListItemInfo()
  r0_3:SwitchToSquadList(false)
  r0_3:InitTextAndBtn()
  r0_3:HideNpc()
  r4_3 = AudioManager(r0_3)
  r4_3:PlayFMODSound(r0_3, nil, "event:/ui/armory/open", "OpenSquad")
end
function r5_0.OnLoaded(r0_4, ...)
  -- line: [141, 143] id: 4
end
function r5_0.InitRightDetailPanel(r0_5)
  -- line: [146, 160] id: 5
  if r0_5.IsDraging then
    return 
  end
  local r1_5 = r0_5.CurSelectSquadIndex
  if r0_5.SquadListLen < r1_5 then
    r1_5 = 1 and r0_5.CurSelectSquadIndex
  else
    goto label_11	-- block#4 is visited secondly
  end
  r0_5.CurSelectSquadIndex = r1_5
  if r0_5.SquadListLen < r0_5.CurSelectSquadIndex then
    r0_5.SquadInfo = r0_5.CurSquadInfo
  else
    r0_5.SquadInfo = r0_5.SquadInfoList[r0_5.CurSelectSquadIndex]
  end
  r0_5:InitCurSquadInfo()
  r0_5:UpdateRightDetailPanel()
end
function r5_0.InitLeftListItemInfo(r0_6)
  -- line: [163, 175] id: 6
  r0_6.TypeTabs = {
    [r0_6.SlotName2Type[r0_6.ESlotName.RangedWeapon]] = r0_6.List_Build.Type_Range,
    [r0_6.SlotName2Type[r0_6.ESlotName.MeleeWeapon]] = r0_6.List_Build.Type_Melee,
  }
  r0_6.List_Build.Type_Range:Init(r0_6.SlotName2Type[r0_6.ESlotName.RangedWeapon], r0_6)
  r0_6.List_Build.Type_Melee:Init(r0_6.SlotName2Type[r0_6.ESlotName.MeleeWeapon], r0_6)
  r0_6.List_Build.Tab_Primary:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_6:CharMain_InitWidget()
  r0_6:WeaponMain_InitWidget()
  r0_6:PetMain_InitWidget()
end
function r5_0.HideNpc(r0_7)
  -- line: [177, 181] id: 7
  UE4.UGameplayStatics.GetGameInstance(r0_7):GetGameUIManager():HideNpcActor(true, "StyleOfPlay")
end
function r5_0.InitTextAndBtn(r0_8)
  -- line: [184, 216] id: 8
  r0_8.Text_Default:SetText(GText("UI_Squad_ListName"))
  r0_8.Text_Has:SetText(r0_8.SquadListLen)
  r0_8.Text_All:SetText(r0_8.SquadMax)
  r0_8.Text_SortTip:SetText(GText("UI_Squad_Adjust_Sort"))
  r0_8.Text_Character:SetText(GText("UI_Armory_Char"))
  r0_8.Text_Phantom:SetText(GText("UI_Shadow_Name"))
  r0_8.Text_Phantom01:SetText(GText("UI_Squad_Sigil1"))
  r0_8.Text_Phantom02:SetText(GText("UI_Squad_Sigil2"))
  r0_8:UpdateBtnInfo(r0_8.Btn_Armory, GText("UI_BAG_Gotoarmory"), r0_8.GoToArmory)
  r0_8:UpdateBtnInfo(r0_8.Btn_Save, GText("UI_RegionMap_Save"), r0_8.SaveSquad)
  r0_8:UpdateBtnInfo(r0_8.Btn_Cancel, GText("UI_RegionMap_Cancel"), r0_8.CancelCreateSquadAndBackToSquadList)
  r0_8:UpdateBtnInfo(r0_8.Btn_Delete, nil, function()
    -- line: [203, 206] id: 9
    r0_8:DeleteSquad()
    AudioManager(r0_8):PlayUISound(nil, "event:/ui/common/click_btn_small", nil, nil)
  end)
  r0_8:UpdateBtnInfo(r0_8.Btn_Edit, GText("UI_Squad_Edit"), function()
    -- line: [208, 211] id: 10
    r0_8:EditorSquad()
    AudioManager(r0_8):PlayUISound(nil, "event:/ui/common/click_btn_confirm", nil, nil)
  end)
  r0_8:UpdateBtnInfo(r0_8.Btn_EditName, nil, r0_8.EditSquadName)
  r0_8:SwitchBtnPanel("SquadList")
end
function r5_0.SwitchBtnPanel(r0_11, r1_11)
  -- line: [219, 227] id: 11
  if r1_11 == "SquadList" then
    r0_11.HB_Detail:SetVisibility(ESlateVisibility.Collapsed)
    r0_11.HB_Edit:SetVisibility(ESlateVisibility.Visible)
  else
    r0_11.HB_Detail:SetVisibility(ESlateVisibility.Visible)
    r0_11.HB_Edit:SetVisibility(ESlateVisibility.Collapsed)
  end
end
function r5_0.EditSquadName(r0_12)
  -- line: [230, 267] id: 12
  r0_12.IsFocusList = r0_12:CheckIsInItemList()
  r0_12.IsEditSquadName = true
  local r1_12 = UIManager(r0_12)
  local r4_12 = {
    OnCloseCallbackObj = r0_12,
    OnCloseCallbackFunction = r0_12.OnCloseInputDialogCallback,
  }
  r4_12.EditTextConfig = {
    Owner = r0_12,
    IsMultiLine = false,
    Text = r0_12.Text_DefaultName:GetText(),
    HintText = GText("UI_Squad_InputHint"),
    TextLimit = DataMgr.GlobalConstant.NicknameMaxLen.ConstantValue,
    bNeedCheckStringSensitive = true,
    OnCheckStringSensitive = function(r0_13, r1_13, r2_13)
      -- line: [243, 247] id: 13
      if r1_13 then
        r0_13:TextCommitted()
      end
    end,
    Events = {
      OnTextChanged = function(r0_14, r1_14)
        -- line: [249, 261] id: 14
        r0_14.SquadNameTemp = r1_14
        if r1_14 == r0_14.CurSquadInfo.Name then
          r0_14.NameEditDialog:GetButtonBar().Btn_Yes:UnBindEventOnClickedByObj(r0_14)
          r0_14.NameEditDialog:GetButtonBar().Btn_Yes:ForbidBtn(true)
        elseif r1_14 == "" then
          r0_14.NameEditDialog:GetButtonBar().Btn_Yes:UnBindEventOnClickedByObj(r0_14)
          r0_14.NameEditDialog:GetButtonBar().Btn_Yes:ForbidBtn(true)
          r0_14.NameEditDialog:GetButtonBar().Btn_Yes:BindForbidStateExecuteEvent(r0_14, r0_14.NoStrWarning)
        else
          r0_14.NameEditDialog:GetButtonBar().Btn_Yes:ForbidBtn(false)
        end
      end,
    },
  }
  r4_12.Owner = r0_12
  r4_12.Title = GText("UI_SquadName_Change")
  r0_12.NameEditDialog = r1_12:ShowCommonPopupUI(100133, r4_12, r0_12)
end
function r5_0.OnCloseInputDialogCallback(r0_15)
  -- line: [269, 280] id: 15
  r0_15.IsEditSquadName = false
  if r0_15.IsFocusList then
    r0_15:FocusOnItemList()
  else
    r0_15:AddDelayFrameFunc(function()
      -- line: [275, 277] id: 16
      r0_15:FocusOnRightDetailPanel()
    end, 2, "DelayFocusItem")
    return 
  end
end
function r5_0.TextCommitted(r0_17)
  -- line: [282, 286] id: 17
  r0_17.Text_DefaultName:SetText(r0_17.SquadNameTemp)
  r0_17:UpdateCurSquadInfo("Name", r0_17.SquadNameTemp)
  r0_17:RealSaveSquad()
end
function r5_0.NoStrWarning(r0_18)
  -- line: [288, 290] id: 18
  r0_18.NameEditDialog.VB_Node:GetChildAt(1):ShowTips(GText("UI_REGISTER_EMPTY"), 2)
end
function r5_0.AllSlotPlayAnimation(r0_19, r1_19, r2_19)
  -- line: [292, 309] id: 19
  if not r2_19 or not r2_19 then
    r2_19 = -1
  end
  for r7_19, r8_19 in pairs(r0_19.RightSlots) do
    if r8_19.Index ~= r2_19 then
      r8_19:StopAllAnimations()
      if r1_19 == "Normal" and r8_19.PlayNormalAnimation then
        r8_19:PlayNormalAnimation()
      elseif r8_19.Item then
        r8_19.Item:PlayAnimation(r8_19.Item[r1_19])
      else
        r8_19:PlayAnimation(r8_19[r1_19])
      end
    end
  end
  -- close: r3_19
end
function r5_0.CancelCreateSquadAndBackToSquadList(r0_20)
  -- line: [312, 332] id: 20
  DebugPrint("thy   取消编辑然后返回阵容列表")
  AudioManager(r0_20):PlayUISound(nil, "event:/ui/common/click_btn_cancel", nil, nil)
  r0_20.IsNeedSave = r0_20:CheckChangeSquadInfo()
  r0_20.IsNeedPlayRefreshAnimation = true
  if r0_20.IsNeedSave then
    if r0_20.CancelPopUI and not r0_20.CancelPopUI.IsClosing then
      return 
    end
    r0_20.CancelPopUI = r0_20:ShowCommonPopupUI(100171, r0_20.SwitchToSquadListWithAnimation)
    return 
  end
  if r0_20.IsOpenAddSquad then
    r0_20.IsOpenAddSquad = false
    r0_20.IsFromDungeonPage = false
    r0_20:Close()
    return 
  end
  r0_20:SwitchToSquadList(true)
end
function r5_0.JumpToAddSquad(r0_21)
  -- line: [335, 339] id: 21
  r0_21.IsOpenAddSquad = true
  r0_21.IsFromDungeonPage = true
  r0_21:AddSquad()
end
function r5_0.JumpToEditSquadByIndex(r0_22, r1_22)
  -- line: [342, 346] id: 22
  r0_22.CurSelectSquadIndex = r1_22
  r0_22.IsFromDungeonPage = true
  r0_22:SwitchToSquadList(true)
end
function r5_0.SwitchToSquadListWithAnimation(r0_23)
  -- line: [348, 356] id: 23
  if r0_23.IsOpenAddSquad then
    r0_23.IsOpenAddSquad = false
    r0_23.IsFromDungeonPage = false
    r0_23:Close()
    return 
  end
  r0_23:SwitchToSquadList(true)
end
function r5_0.UpdateBtnInfo(r0_24, r1_24, r2_24, r3_24)
  -- line: [358, 364] id: 24
  r1_24.Button_Area.OnClicked:Clear()
  r1_24.Button_Area.OnClicked:Add(r0_24, r3_24)
  if r2_24 then
    r1_24:SetText(r2_24)
  end
end
function r5_0.DeleteSquad(r0_25)
  -- line: [367, 375] id: 25
  DebugPrint("thy   删除阵容")
  r0_25.DeleteSquadTips = UIManager(r0_25):ShowCommonPopupUI(100170, {
    RightCallbackObj = r0_25,
    RightCallbackFunction = r0_25.RealDeleteSquad,
    ShortText = string.format(GText("UI_Squad_DeleteReConfirm"), r0_25.CurSquadInfo.Name),
  }, r0_25)
end
function r5_0.RealDeleteSquad(r0_26)
  -- line: [378, 387] id: 26
  local r1_26 = r0_26:GetSquadWidgetInSquadList(r0_26.CurSelectSquadIndex)
  if not r1_26 then
    return 
  end
  r0_26.Avatar:DeleteSquad(nil, r1_26.FakeIndex)
  r0_26.CurSelectSquadIndex = 1
  UIManager(r0_26):ShowUITip("CommonToastMain", GText("UI_Squad_DeleteSuccess"))
end
function r5_0.EditorSquad(r0_27)
  -- line: [390, 395] id: 27
  DebugPrint("thy   编辑阵容")
  r0_27:UpdateBtnInfo(r0_27.Btn_Save, GText("UI_RegionMap_Save"), r0_27.SaveSquad)
  r0_27:ResetAllSlotsClickState()
  r0_27.Character:OnClickCallback()
end
function r5_0.SaveSquad(r0_28)
  -- line: [398, 433] id: 28
  DebugPrint("thy   保存阵容")
  AudioManager(r0_28):PlayUISound(nil, "event:/ui/common/click_btn_confirm", nil, nil)
  local r1_28 = false
  if r0_28.Btn_Save.IsForbidden then
    if r0_28:CheckForceSlotIsLack() then
      for r6_28, r7_28 in pairs(r0_28.PlayerForceSlot) do
        if r7_28.Uuid == "" or r7_28.Uuid == nil then
          r7_28.Item:PlayAnimation(r7_28.Item.FlashRed)
          r1_28 = true
        end
      end
      -- close: r2_28
      if r0_28.PhantomSlot.Head_Phantom01.Uuid and not r0_28.PhantomSlot.Weapon_Phantom01.Uuid then
        r0_28.PhantomSlot.Weapon_Phantom01.Item:PlayAnimation(r0_28.PhantomSlot.Weapon_Phantom01.Item.FlashRed)
      end
      if r0_28.PhantomSlot.Head_Phantom02.Uuid and not r0_28.PhantomSlot.Weapon_Phantom02.Uuid then
        r0_28.PhantomSlot.Weapon_Phantom02.Item:PlayAnimation(r0_28.PhantomSlot.Weapon_Phantom02.Item.FlashRed)
      end
      if r1_28 then
        UIManager(r0_28):ShowUITip("CommonToastMain", GText("UI_Squad_Essential_Miss"))
      else
        UIManager(r0_28):ShowUITip("CommonToastMain", GText("UI_Squad_Miss_SigilWeapon"))
      end
    elseif not r0_28:CheckChangeSquadInfo() then
      UIManager(r0_28):ShowUITip("CommonToastMain", GText("UI_Squad_NoEdit"))
    end
    return 
  end
  if not r0_28:CheckIsFull() then
    r0_28.SaveSquadTip = r0_28:ShowCommonPopupUI(100172, r0_28.RealSaveSquad)
    return 
  end
  r0_28:RealSaveSquad()
end
function r5_0.CheckForceSlotIsLack(r0_29)
  -- line: [436, 449] id: 29
  for r5_29, r6_29 in pairs(r0_29.PlayerForceSlot) do
    if r6_29.Uuid == "" or r6_29.Uuid == nil then
      return true
    end
  end
  -- close: r1_29
  if r0_29.PhantomSlot.Head_Phantom01.Uuid and not r0_29.PhantomSlot.Weapon_Phantom01.Uuid then
    return true
  end
  if r0_29.PhantomSlot.Head_Phantom02.Uuid and not r0_29.PhantomSlot.Weapon_Phantom02.Uuid then
    return true
  end
  return false
end
function r5_0.CheckIsFull(r0_30)
  -- line: [452, 459] id: 30
  for r5_30, r6_30 in pairs(r0_30.RightSlots) do
    if r6_30.IsEmpty then
      return false
    end
  end
  -- close: r1_30
  return true
end
function r5_0.RealSaveSquad(r0_31)
  -- line: [462, 487] id: 31
  local r1_31, r2_31 = r0_31:CheckChangeSquadInfo()
  if r0_31.IsOpenAddSquad then
    r0_31.CurSelectSquadIndex = r0_31.SquadListLen + 1
  end
  if r1_31 then
    if r0_31.SquadListLen < r0_31.CurSelectSquadIndex then
      r0_31.Avatar:CreateSquad(nil, r2_31)
      UIManager(r0_31):ShowUITip("CommonToastMain", GText("UI_Squad_Save") .. r0_31.CurSquadInfo.Name)
    else
      r0_31.Avatar:UpdateSquad(nil, r0_31.CurSelectSquadIndex, r2_31)
      UIManager(r0_31):ShowUITip("CommonToastMain", GText("UI_EditSuccess"))
    end
  end
  if r0_31.IsOpenAddSquad then
    r0_31.IsOpenAddSquad = false
    r0_31.IsFromDungeonPage = false
    r0_31:Close()
    return 
  end
  r0_31.IsNeedPlayRefreshAnimation = true
end
function r5_0.UpdateCurSquadInfo(r0_32, r1_32, r2_32)
  -- line: [489, 495] id: 32
  if r0_32.CurSquadInfo then
    r0_32.CurSquadInfo[r1_32] = r2_32
    r0_32.AddSquadAndEdit = true
    r0_32.Btn_Save:ForbidBtn(r0_32:CheckForceSlotIsLack() and not r0_32:CheckChangeSquadInfo())
  end
end
function r5_0.CheckChangeSquadInfo(r0_33)
  -- line: [497, 522] id: 33
  if not r0_33.CurSquadInfo then
    return false
  end
  if r0_33.SquadListLen < r0_33.CurSelectSquadIndex then
    if r0_33.AddSquadAndEdit then
      return true, r0_33.CurSquadInfo
    end
    return false
  end
  local r1_33 = {}
  local r2_33 = false
  for r7_33, r8_33 in pairs(r0_33.CurSquadInfo) do
    if r0_33.SquadInfo and r0_33.SquadInfo[r7_33] ~= r8_33 and (r0_33.SquadInfo[r7_33] ~= nil or r8_33 ~= "" and r8_33 ~= 0) then
      r1_33[r7_33] = r8_33
      r2_33 = true
    elseif not r0_33.SquadInfo and r8_33 ~= "" and r8_33 ~= 0 then
      r1_33[r7_33] = r8_33
      r2_33 = true
    end
  end
  -- close: r3_33
  return r2_33, r1_33
end
function r5_0.ShowCommonPopupUI(r0_34, r1_34, r2_34)
  -- line: [525, 530] id: 34
  return UIManager(r0_34):ShowCommonPopupUI(r1_34, {
    RightCallbackObj = r0_34,
    RightCallbackFunction = r2_34,
  }, r0_34)
end
function r5_0.InitSquadData(r0_35)
  -- line: [534, 592] id: 35
  r0_35.Avatar = GWorld:GetAvatar()
  if not r0_35.Avatar then
    return 
  end
  r0_35.SquadList = r0_35.Avatar.Squad
  r0_35.RightSlots = {
    Char = r0_35.Character,
    MeleeWeapon = r0_35.Melee,
    RangedWeapon = r0_35.Ranged,
    Pet = r0_35.Pet,
    Phantom1 = r0_35.Head_Phantom01,
    PhantomWeapon1 = r0_35.Weapon_Phantom01,
    Phantom2 = r0_35.Head_Phantom02,
    PhantomWeapon2 = r0_35.Weapon_Phantom02,
    WheelIndex = r0_35.Roulette,
  }
  r0_35.PlayerAboutSlots = {
    Char = r0_35.Character,
    Melee = r0_35.Melee,
    Ranged = r0_35.Ranged,
    Pet = r0_35.Pet,
  }
  r0_35.PlayerForceSlot = {
    Char = r0_35.Character,
    Melee = r0_35.Melee,
    Ranged = r0_35.Ranged,
  }
  r0_35.PhantomSlot = {
    Head_Phantom01 = r0_35.Head_Phantom01,
    Weapon_Phantom01 = r0_35.Weapon_Phantom01,
    Head_Phantom02 = r0_35.Head_Phantom02,
    Weapon_Phantom02 = r0_35.Weapon_Phantom02,
  }
  r0_35.LeftWidgetList = {
    [1] = r0_35.Panel_Default,
    [2] = r0_35.Panel_List,
    [3] = r0_35.Panel_Roulette,
  }
  r0_35.CurSelectSquadIndex = r0_35.SelectIndex and 1
  r0_35.SquadMax = DataMgr.GlobalConstant.SquadMax.ConstantValue and 10
  r0_35.IsDraging = false
  r0_35.CurPhantomWeaponType = "Melee"
  r0_35.IsInClickCD = false
  r0_35.ClickCD = 0.3
  r0_35.FirstIn = true
end
function r5_0.CreateActorController(r0_36)
  -- line: [594, 605] id: 36
  if r0_36.ActorController then
    return 
  end
  r0_36.ActorController = r1_0:New({
    ViewUI = r0_36,
    IsPreviewMode = true,
    Char = r0_36.Avatar.Chars[r0_36.SquadInfoList[r0_36.CurSelectSquadIndex].Char],
    bNeedEndCamera = false,
  })
  r0_36.ActorController:OnOpened(0)
end
function r5_0.InitTabUI(r0_37, r1_37)
  -- line: [608, 634] id: 37
  r0_37.CurTitle = r1_37
  local r2_37 = {
    TitleName = r0_37.CurTitle and GText("UI_Squad"),
    ShowSquadBuildBtn = true,
    Tabs = {},
    DynamicNode = {
      "Back",
      "BottomKey"
    },
    BottomKeyInfo = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            ClickCallback = r0_37.OnBackKeyDown,
            Owner = r0_37,
          }
        },
        Desc = GText("UI_CTL_Squad_Select"),
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = r0_37.OnBackKeyDown,
            Owner = r0_37,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = r0_37.OnBackKeyDown,
            Owner = r0_37,
          }
        },
        Desc = GText("UI_BACK"),
      }
    },
    BackCallback = r0_37.OnBackKeyDown,
    OwnerPanel = r0_37,
  }
  r0_37.MainTab = r2_37
  r0_37.Com_Tab:Init(r0_37.MainTab)
end
function r5_0.InitBottomTab(r0_38, r1_38, r2_38, r3_38)
  -- line: [637, 703] id: 38
  local r4_38 = {
    TitleName = r0_38.CurTitle and GText("UI_Squad"),
    ShowSquadBuildBtn = true,
    Tabs = {},
    DynamicNode = {
      "Back",
      "BottomKey"
    },
    BackCallback = r0_38.OnBackKeyDown,
    OwnerPanel = r0_38,
  }
  r0_38.MainTab = r4_38
  r4_38 = nil
  if r2_38 == 2 then
    local r5_38 = {}
    local r6_38 = {}
    local r7_38 = {
      {
        Type = "Img",
        ImgShortPath = "A",
        Owner = r0_38,
      }
    }
    r6_38.GamePadInfoList = r7_38
    if r1_38 then
      r7_38 = r3_38 and GText("UI_CTL_Squad_Select") and GText("UI_Tips_Ensure")
    else
      goto label_48	-- block#6 is visited secondly
    end
    r6_38.Desc = r7_38
    r7_38 = {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = r0_38.OnBackKeyDown,
          Owner = r0_38,
        }
      },
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
          ClickCallback = r0_38.OnBackKeyDown,
          Owner = r0_38,
        }
      },
      Desc = GText("UI_BACK"),
    }
    -- setlist for #5 failed
    r4_38 = r5_38
  elseif r2_38 == 3 then
    if r0_38.IsInEditor and r0_38.CurFocusSlot and r0_38.CurFocusSlot.Uuid ~= nil and r0_38.CurFocusSlot.Uuid ~= 0 then
      local r5_38 = {}
      local r6_38 = {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "Y",
            ClickCallback = r0_38.ClearCurSlot,
            Owner = r0_38,
          }
        },
        Desc = GText("UI_CTL_Remove"),
      }
      local r7_38 = {}
      local r8_38 = {
        {
          Type = "Img",
          ImgShortPath = "A",
          Owner = r0_38,
        }
      }
      r7_38.GamePadInfoList = r8_38
      if r1_38 then
        r8_38 = r3_38 and GText("UI_CTL_Squad_Select") and GText("UI_Tips_Ensure")
      else
        goto label_138	-- block#16 is visited secondly
      end
      r7_38.Desc = r8_38
      r8_38 = {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = r0_38.OnBackKeyDown,
            Owner = r0_38,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = r0_38.OnBackKeyDown,
            Owner = r0_38,
          }
        },
        Desc = GText("UI_BACK"),
      }
      -- setlist for #5 failed
      r4_38 = r5_38
    else
      local r5_38 = {}
      local r6_38 = {}
      local r7_38 = {
        {
          Type = "Img",
          ImgShortPath = "A",
          Owner = r0_38,
        }
      }
      r6_38.GamePadInfoList = r7_38
      if r1_38 then
        r7_38 = r3_38 and GText("UI_CTL_Squad_Select") and GText("UI_Tips_Ensure")
      else
        goto label_195	-- block#21 is visited secondly
      end
      r6_38.Desc = r7_38
      r7_38 = {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = r0_38.OnBackKeyDown,
            Owner = r0_38,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = r0_38.OnBackKeyDown,
            Owner = r0_38,
          }
        },
        Desc = GText("UI_BACK"),
      }
      -- setlist for #5 failed
      r4_38 = r5_38
    end
  else
    r4_38 = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = r0_38.OnBackKeyDown,
            Owner = r0_38,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = r0_38.OnBackKeyDown,
            Owner = r0_38,
          }
        },
        Desc = GText("UI_BACK"),
      }
    }
  end
  r0_38.MainTab.BottomKeyInfo = r4_38
  r0_38.Com_Tab:Init(r0_38.MainTab)
end
function r5_0.InitBottomTabOnSortStateInGamePad(r0_39)
  -- line: [706, 731] id: 39
  local r1_39 = {
    TitleName = r0_39.CurTitle and GText("UI_Squad"),
    ShowSquadBuildBtn = true,
    Tabs = {},
    DynamicNode = {
      "Back",
      "BottomKey"
    },
    BackCallback = r0_39.OnBackKeyDown,
    OwnerPanel = r0_39,
  }
  r0_39.MainTab = r1_39
  r0_39.MainTab.BottomKeyInfo = {
    {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "LV",
          Owner = r0_39,
        }
      },
      Desc = GText("UI_CTL_Squad_AdjustSorting"),
    },
    {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
          ClickCallback = r0_39.OnBackKeyDown,
          Owner = r0_39,
        }
      },
      Desc = GText("UI_CTL_Squad_ExitSorting"),
    }
  }
  r0_39.Com_Tab:Init(r0_39.MainTab)
end
function r5_0.OnBackKeyDown(r0_40)
  -- line: [733, 749] id: 40
  if r0_40.Panel_Tips:IsVisible() then
    r0_40:CloseTips()
    return 
  end
  if r0_40.IsInEditor then
    r0_40:CancelCreateSquadAndBackToSquadList()
    return 
  end
  r0_40.IsNeedPlayRefreshAnimation = true
  r0_40.IsOpenAddSquad = false
  r0_40.IsFromDungeonPage = false
  r0_40:Close()
end
function r5_0.SwitchGamePadIconVisibilityBySortState(r0_41, r1_41)
  -- line: [751, 759] id: 41
  if r0_41.CurInputDeviceType == ECommonInputType.Gamepad then
    if r1_41 then
      r0_41.Btn_Edit.Key_GamePad:SetVisibility(ESlateVisibility.Visible)
    else
      r0_41.Btn_Edit.Key_GamePad:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
end
function r5_0.SwitchLeftWidgetByIndex(r0_42, r1_42)
  -- line: [764, 773] id: 42
  r0_42.CurLeftWidgetIndex = r1_42
  for r6_42, r7_42 in pairs(r0_42.LeftWidgetList) do
    if r1_42 == r6_42 then
      r0_42.LeftWidgetList[r6_42]:SetVisibility(ESlateVisibility.Visible)
    else
      r0_42.LeftWidgetList[r6_42]:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  -- close: r2_42
end
function r5_0.SelectCurSquad(r0_43, r1_43)
  -- line: [775, 802] id: 43
  for r5_43 = 1, r0_43.SquadListLen, 1 do
    local r6_43 = r0_43:GetSquadWidgetInSquadList(r5_43)
    if r6_43 then
      if r6_43.Index == r1_43 then
        if r6_43.IsAddSquad then
          return 
        end
        r6_43.IsSelect = true
        if not r0_43.IsDraging then
          r6_43:CheckSortIcon()
          r6_43:PlayAnimation(r6_43.Click)
          r6_43.Melee:PlayAnimation(r6_43.Melee.Click)
          r6_43.Ranged:PlayAnimation(r6_43.Ranged.Click)
        end
      else
        r6_43.IsSelect = false
        r6_43:CheckSortIcon()
        r6_43:StopAnimation(r6_43.Click)
        r6_43:StopAnimation(r6_43.Select)
        r6_43:PlayAnimation(r6_43.Normal)
        r6_43.Melee:PlayAnimation(r6_43.Melee.Normal)
        r6_43.Ranged:PlayAnimation(r6_43.Ranged.Normal)
      end
    end
  end
end
function r5_0.NewItemContent(r0_44, r1_44, r2_44, r3_44)
  -- line: [805, 826] id: 44
  local r4_44 = NewObject(r4_0.GetCommonItemContentClass())
  r4_44.Uuid = r1_44.Uuid
  r4_44.Type = r2_44
  r4_44.Tag = r3_44
  r4_44.UnitId = r1_44[r2_44 .. "Id"]
  r4_44.UnitName = r1_44[r2_44 .. "Name"]
  r4_44.Rarity = r1_44[r2_44 .. "Rarity"]
  r4_44.Icon = r1_44:Data().Icon
  r4_44.GachaIcon = r1_44:Data().GachaIcon
  r4_44.Level = r1_44.Level
  r4_44.GradeLevel = r1_44.GradeLevel
  r4_44.AnimNameWithCreate = "In_OnlyOpacity"
  local r5_44 = DataMgr["Battle" .. r2_44][r4_44.UnitId].Attribute
  if r5_44 then
    local r6_44 = "Armory_" .. r5_44
    r4_44.AttrIcon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. r6_44 .. ".T_" .. r6_44
  end
  r4_44.SortPriority = r1_44:Data().SortPriority and 0
  return r4_44
end
function r5_0.NewPetItemContent(r0_45, r1_45)
  -- line: [828, 843] id: 45
  local r2_45 = NewObject(r4_0.GetCommonItemContentClass())
  r2_45.Uuid = r1_45.UniqueId
  r2_45.Type = CommonConst.ArmoryType.Pet
  r2_45.Tag = CommonConst.ArmoryType.Pet
  r2_45.UnitId = r1_45.PetId
  local r3_45 = DataMgr.Pet[r2_45.UnitId]
  r2_45.UnitName = r3_45.Name
  r2_45.Rarity = r3_45.Rarity
  r2_45.Icon = r3_45.Icon
  r2_45.Level = r1_45.Level
  r2_45.BreakNum = r1_45.BreakNum
  r2_45.SortPriority = r3_45.SortPriority and 0
  return r2_45
end
function r5_0.ResetSquadList(r0_46)
  -- line: [845, 848] id: 46
  r0_46:UpdateSquadListInfo()
  r0_46:UpdateSquadList()
end
function r5_0.PlayAllSlotRefreshAnimation(r0_47)
  -- line: [850, 860] id: 47
  if not r0_47.IsNeedPlayRefreshAnimation then
    return 
  end
  for r5_47, r6_47 in pairs(r0_47.RightSlots) do
    if r6_47.PlayRefreshAnimation then
      r6_47:PlayRefreshAnimation()
    end
  end
  -- close: r1_47
  r0_47.IsNeedPlayRefreshAnimation = false
end
function r5_0.ClearCurSlot(r0_48)
  -- line: [862, 869] id: 48
  if r0_48.CurFocusSlot then
    r0_48.CurFocusSlot:ClearSlot()
  else
    r0_48.CurSlot:ClearSlot()
  end
  r0_48:InitBottomTab(false, 2)
end
function r5_0.CallFunctionByName(r0_49, r1_49, ...)
  -- line: [872, 876] id: 49
  if r0_49[r1_49] then
    return r0_49[r1_49](r0_49, ...)
  end
end
function r5_0.UpdateUpTabTitleName(r0_50, r1_50)
  -- line: [879, 881] id: 50
  r0_50:InitTabUI(r1_50)
end
function r5_0.PhantomWeaponTypeChanged(r0_51, r1_51)
  -- line: [884, 901] id: 51
  if r1_51 then
    r0_51.CurPhantomWeaponType = r1_51
    r0_51.List_Build.Tab_Primary:SetVisibility(ESlateVisibility.Visible)
    r0_51:InitItemVarInfo(r1_51)
    r0_51:ReInitListItems()
    if r1_51 == "Melee" then
      r0_51.List_Build.Type_Melee:SetIsChecked(true, true)
      r0_51.List_Build.Type_Range:SetIsChecked(false)
    else
      r0_51.List_Build.Type_Range:SetIsChecked(true, true)
      r0_51.List_Build.Type_Melee:SetIsChecked(false)
    end
  else
    r0_51.List_Build.Tab_Primary:SetVisibility(ESlateVisibility.Collapsed)
  end
end
function r5_0.ReInitListItems(r0_52)
  -- line: [903, 906] id: 52
  r0_52:CallFunctionByName(r0_52.CurSlotType .. "Main_Init")
  r0_52:FillSelectiveList()
end
function r5_0.InitCurSquadInfo(r0_53, r1_53)
  -- line: [909, 948] id: 53
  r0_53.CurSquadInfo = {
    Name = GText("UI_Squad_ListName") .. r0_53.CurSelectSquadIndex,
    Char = "",
    ModSuit = 0,
    MeleeWeapon = "",
    MeleeWeaponModSuit = 0,
    RangedWeapon = "",
    RangedWeaponModSuit = 0,
    Pet = 0,
    WheelIndex = 1,
    Phantom1 = "",
    PhantomWeapon1 = "",
    Phantom2 = "",
    PhantomWeapon2 = "",
  }
  r0_53.AddSquadAndEdit = false
  if not r1_53 and r0_53.SquadInfo then
    for r6_53, r7_53 in pairs(r0_53.SquadInfo) do
      r0_53.CurSquadInfo[r6_53] = r7_53
    end
    -- close: r2_53
    if r0_53.SquadInfo.Name == "" then
      r0_53.CurSquadInfo.Name = GText("Squad_DefaultName1")
    end
  end
end
function r5_0.EnterSquadSetting(r0_54)
  -- line: [950, 952] id: 54
end
function r5_0.QuitSquadSetting(r0_55)
  -- line: [954, 958] id: 55
  r0_55.ActorController:OnClosed()
  r0_55.ActorController:OnDestruct()
end
function r5_0.CheckThisContentIsEquippedByOtherSlot(r0_56, r1_56, r2_56)
  -- line: [960, 967] id: 56
  for r7_56, r8_56 in pairs(r0_56.RightSlots) do
    if r8_56.Uuid and r8_56.Uuid == r1_56 and r8_56:GetName() ~= r2_56 then
      return true, r7_56
    end
  end
  -- close: r3_56
  return false, nil
end
function r5_0.CurSlotNameToRightSlotsKey(r0_57, r1_57)
  -- line: [969, 975] id: 57
  for r6_57, r7_57 in pairs(r0_57.RightSlots) do
    if r7_57:GetName() == r1_57 then
      return r6_57
    end
  end
  -- close: r2_57
end
function r5_0.GetSquadWidgetInSquadList(r0_58, r1_58)
  -- line: [977, 980] id: 58
  return (r0_58.List_Default:GetItemAt(r1_58 + -1) and r0_58.List_Default:GetItemAt(0)).SelfWidget
end
function r5_0.GetSquadContent(r0_59, r1_59)
  -- line: [982, 989] id: 59
  for r5_59 = 1, r0_59.SquadListLen, 1 do
    local r6_59 = r0_59.List_Default:GetItemAt(r5_59 + -1)
    if r6_59 and r6_59.SelfWidget and r6_59.SelfWidget.FakeIndex == r1_59 then
      return r6_59.SelfWidget
    end
  end
end
function r5_0.GetSquadContentListIndex(r0_60, r1_60)
  -- line: [991, 998] id: 60
  for r5_60 = 1, r0_60.SquadListLen, 1 do
    if r0_60.List_Default:GetItemAt(r5_60 + -1).SelfWidget.FakeIndex == r1_60 then
      return r5_60
    end
  end
end
function r5_0.HideOrShowItemInDraging(r0_61, r1_61)
  -- line: [1000, 1011] id: 61
  for r5_61 = 1, r0_61.SquadListLen, 1 do
    local r6_61 = r0_61:GetSquadWidgetInSquadList(r5_61)
    if r6_61 then
      if r5_61 == r1_61 then
        r6_61:HideOrShowItemUIInfo(false)
      else
        r6_61:HideOrShowItemUIInfo(true)
      end
    end
  end
end
function r5_0.PlaySelectSound(r0_62, r1_62, r2_62)
  -- line: [1013, 1020] id: 62
  if not r1_62 then
    AudioManager(r0_62):PlayUISound(r0_62, r7_0.Default, nil, nil)
  else
    AudioManager(r0_62):PlayUISound(r0_62, r7_0[r2_62], nil, nil)
    AudioManager(r0_62):PlayUISound(r0_62, r8_0[r2_62], nil, nil)
  end
end
function r5_0.SetContentIsChosen(r0_63, r1_63, r2_63)
  -- line: [1022, 1024] id: 63
end
function r5_0.CloseAllTips(r0_64)
  -- line: [1026, 1046] id: 64
  if r0_64.Pos_Tips:GetChildAt(0) then
    r0_64.SquadItemTip:CloseWidget()
  end
  if r0_64.IsEditSquadName then
    r0_64.NameEditDialog:Close()
  end
  if r0_64.DeleteSquadTips then
    r0_64.DeleteSquadTips:Close()
  end
  if r0_64.SaveSquadTip then
    r0_64.SaveSquadTip:Close()
  end
  if r0_64.CancelPopUI then
    r0_64.CancelPopUI:Close()
  end
end
function r5_0.SwitchToSquadList(r0_65, r1_65)
  -- line: [1053, 1121] id: 65
  r0_65:SwitchLeftWidgetByIndex(1)
  r0_65.IsInEditor = false
  r0_65:UpdateSquadListInfo()
  r0_65:UpdateSquadList()
  r0_65:CheckSquadListArr()
  r0_65:SwitchBtnPanel("SquadList")
  r0_65:CreateActorController()
  r0_65:UpdateUpTabTitleName(GText("UI_Squad"))
  r0_65:ResetAllSlotsClickState()
  r0_65:AllSlotPlayAnimation("Normal")
  r0_65:InitSquadListUI()
  r0_65:InitRightDetailPanel()
  r0_65:InitCurSquadInfo()
  r0_65:SelectCurSquadInSquadList(nil, true)
  r0_65.List_Default:DisableScroll(true)
  r0_65.ScrollBox_0:SetScrollBarVisibility(ESlateVisibility.Collapsed)
  r0_65.ScrollBox_0:SetControlScrollbarInside(false)
  if r0_65.IsInSortState then
    r0_65:SwitchGamePadIconVisibilityBySortState(false)
  else
    r0_65:SwitchGamePadIconVisibilityBySortState(true)
  end
  if r1_65 then
    r0_65:PlayAnimation(r0_65.Auto_In)
  end
  r0_65.Text_Has:SetText(r0_65.SquadListLen)
  r0_65:AddDelayFrameFunc(function()
    -- line: [1093, 1120] id: 66
    r0_65:PlayAllSlotRefreshAnimation()
    if r0_65.SquadListLen < r0_65.CurSelectSquadIndex then
      r0_65.CurSelectSquadIndex = r0_65.SquadListLen
    end
    if r0_65.IsInSortState then
      r0_65:GetSquadWidgetInSquadList(r0_65.CurSelectSquadIndex):CheckArrowState()
      r0_65:SwitchAddSquadItemVisibility(false)
      r0_65:InitBottomTabOnSortStateInGamePad()
      r0_65:FocusOnSquadListInSortState()
      return 
    end
    if r0_65.IsDraging then
      r0_65:HideOrShowItemInDraging(r0_65.CurSelectSquadIndex)
      r0_65:SwitchAddSquadItemVisibility(false)
      r0_65:InitBottomTabOnSortStateInGamePad()
      return 
    end
    r0_65:FocusOnSquadList()
    r0_65:SwitchAddSquadItemVisibility(true)
    r0_65:HideOrShowItemInDraging()
  end, 2, "DelayShow")
end
function r5_0.InitSquadListUI(r0_67)
  -- line: [1123, 1130] id: 67
  if r0_67.SquadListLen > 1 then
    r0_67.Text_SortTip:SetVisibility(ESlateVisibility.Visible)
  else
    r0_67.Text_SortTip:SetVisibility(ESlateVisibility.Collapsed)
  end
  r0_67.Btn_Delete:SetVisibility(ESlateVisibility.Visible)
end
function r5_0.SelectCurSquadInSquadList(r0_68, r1_68, r2_68)
  -- line: [1133, 1144] id: 68
  r0_68.CurSelectSquadIndex = r1_68 and r0_68.CurSelectSquadIndex and 1
  r0_68.NeedRemove = false
  r0_68:AddTimer(0.1, function()
    -- line: [1136, 1143] id: 69
    if r0_68:GetSquadWidgetInSquadList(r0_68.CurSelectSquadIndex) and not r0_68.NeedRemove then
      r0_68.IsOnlyPlayAnimation = r2_68
      r0_68:SelectCurSquad(r0_68.CurSelectSquadIndex)
      r0_68.NeedRemove = true
      r0_68:RemoveTimer("SelectCurSquad")
    end
  end, true, 0, "SelectCurSquad", true)
end
function r5_0.UpdateSquadListInfo(r0_70)
  -- line: [1147, 1175] id: 70
  r0_70.SquadInfoList = {}
  r0_70.SquadListLen = 0
  r0_70:UpdateSquadListFromAvatar()
  for r5_70, r6_70 in pairs(r0_70.SquadList) do
    local r7_70 = {}
    r0_70.SquadListLen = r0_70.SquadListLen + 1
    r7_70.SquadName = r6_70.Name
    for r12_70, r13_70 in pairs(r6_70.Props) do
      if r12_70 == "Char" or r12_70 == "Phantom1" or r12_70 == "Phantom2" then
        if r13_70 ~= "" and r0_70.Avatar.Chars[r13_70] then
          r7_70[r12_70 .. "Id"] = r0_70.Avatar.Chars[r13_70].CharId
          r7_70[r12_70] = r13_70
        end
      elseif r0_70:IsSubstringContained(r12_70, "ModSuit") then
        r7_70[r12_70] = r13_70
      elseif r0_70:IsSubstringContained(r12_70, "Weapon") then
        if r13_70 ~= "" and r0_70.Avatar.Weapons[r13_70] and r0_70.Avatar.Weapons[r13_70].WeaponId ~= 0 then
          r7_70[r12_70 .. "Id"] = r0_70.Avatar.Weapons[r13_70].WeaponId
          r7_70[r12_70] = r13_70
        end
      else
        r7_70[r12_70] = r13_70
      end
    end
    -- close: r8_70
    table.insert(r0_70.SquadInfoList, r7_70)
  end
  -- close: r1_70
end
function r5_0.UpdateSquadListFromAvatar(r0_71)
  -- line: [1178, 1185] id: 71
  local r1_71 = GWorld:GetAvatar()
  if not r1_71 then
    return 
  end
  r0_71.Avatar = r1_71
  r0_71.SquadList = r0_71.Avatar.Squad
end
function r5_0.UpdateSquadList(r0_72)
  -- line: [1188, 1212] id: 72
  r0_72.List_Default:SetAllowOverscroll(r0_72.List_Default:IsDisableScroll())
  r0_72.List_Default:ClearListItems()
  for r6_72, r7_72 in pairs(r0_72.SquadInfoList) do
    local r8_72 = NewObject(r4_0.GetCommonItemContentClass())
    r8_72.SquadInfo = r7_72
    r8_72.ClickCallback = r0_72.ClickSelectSquadItem
    r8_72.IsNeedSort = #r0_72.SquadInfoList > 1
    r8_72.Owner = r0_72
    r8_72.Index = r6_72
    r8_72.IsAddSquad = false
    r0_72.List_Default:AddItem(r8_72)
  end
  -- close: r2_72
  r0_72.List_Default:SetSelectedIndex(r0_72.CurSelectSquadIndex + -1)
  if #r0_72.SquadInfoList < 10 then
    local r2_72 = NewObject(r4_0.GetCommonItemContentClass())
    r2_72.Owner = r0_72
    r2_72.ClickCallback = r0_72.AddSquad
    r2_72.IsAddSquad = true
    r2_72.Index = #r0_72.SquadInfoList + 1
    r0_72.List_Default:AddItem(r2_72)
  end
end
function r5_0.CheckSquadListArr(r0_73)
  -- line: [1214, 1227] id: 73
  if r0_73.SquadListLen > 1 then
    r0_73.CanvasPanel_1:SetVisibility(ESlateVisibility.Visible)
  else
    r0_73.CanvasPanel_1:SetVisibility(ESlateVisibility.Collapsed)
  end
  if r0_73.SquadListLen == r0_73.SquadMax then
    r0_73.Hint_Max:SetVisibility(ESlateVisibility.Visible)
    r0_73.Hint_Max.WidgetSwitcher_State:SetActiveWidgetIndex(0)
    r0_73.Hint_Max.Text_Hint_Normal:SetText(GText("UI_Squad_Max"))
  else
    r0_73.Hint_Max:SetVisibility(ESlateVisibility.Collapsed)
  end
end
function r5_0.ClickSelectSquadItem(r0_74, r1_74)
  -- line: [1230, 1254] id: 74
  DebugPrint("thy    点击预设阵容列表时的回调", r0_74.CurSelectSquadIndex, r1_74, r0_74.IsDraging)
  if r0_74.IsInEditor then
    return 
  end
  if r0_74.FirstIn then
    r0_74.FirstIn = false
    return 
  end
  if r0_74.CurInputDeviceType == ECommonInputType.Gamepad and r0_74.IsOnlyPlayAnimation then
    r0_74.IsOnlyPlayAnimation = false
    return 
  end
  r0_74.IsOnlyPlayAnimation = false
  if r0_74.IsNeedPlayRefresh then
    r0_74:PlayAnimation(r0_74.Refresh)
    r0_74.IsNeedPlayRefresh = false
  end
  r0_74.SquadInfo = r0_74.SquadInfoList[r1_74]
  r0_74:InitCurSquadInfo()
  r0_74.CurSelectSquadIndex = r1_74
  r0_74:InitRightDetailPanel()
  r0_74:UpdateSlotIcon()
end
function r5_0.AddSquad(r0_75)
  -- line: [1257, 1269] id: 75
  DebugPrint("thy    新添加一个预设阵容的回调")
  r0_75.SquadInfo = nil
  r0_75:ClearAllSlots(true)
  r0_75.CurSelectSquadIndex = r0_75.SquadListLen + 1
  r0_75:InitCurSquadInfo(true)
  r0_75.Text_DefaultName:SetText(r0_75.CurSquadInfo.Name)
  r0_75:ResetAllSlotsClickState()
  r0_75.Character:OnClickCallback()
  r0_75:UpdateUpTabTitleName(GText("UI_Squad_Add"))
  r0_75:PlayAnimation(r0_75.Auto_In)
end
function r5_0.ResetAllSlotsClickState(r0_76)
  -- line: [1272, 1276] id: 76
  for r5_76, r6_76 in pairs(r0_76.RightSlots) do
    r6_76.IsClicking = false
  end
  -- close: r1_76
end
function r5_0.ClearAllSlots(r0_77, r1_77)
  -- line: [1279, 1283] id: 77
  for r6_77, r7_77 in pairs(r0_77.RightSlots) do
    r7_77:ClearSlot(r1_77)
  end
  -- close: r2_77
end
function r5_0.WeakClearAllSlots(r0_78)
  -- line: [1286, 1292] id: 78
  for r5_78, r6_78 in pairs(r0_78.RightSlots) do
    if r6_78.WeakClearSlotInfo then
      r6_78:WeakClearSlotInfo()
    end
  end
  -- close: r1_78
end
function r5_0.SwitchToSelectItemList(r0_79, r1_79, r2_79)
  -- line: [1299, 1344] id: 79
  if r0_79.CurSlot and r0_79.CurSlot ~= r1_79 then
    if r0_79.CurSlot.PlayNormalAnimation then
      r0_79.CurSlot:PlayNormalAnimation()
    else
      r0_79.CurSlot:PlayAnimation(r0_79.CurSlot.Normal)
    end
    r0_79.CurSlot.IsClicking = false
  end
  r0_79.CurSlot = r1_79
  r0_79.IsInEditor = true
  r0_79.PreContent = r0_79.CurSlot.ItemInfo
  r0_79.CurClickItemInfo = nil
  r0_79.CurType = r2_79
  r0_79:ClearSlotCachedData()
  r0_79:SwitchLeftWidgetByIndex(2)
  r0_79:SwitchBtnPanel()
  r0_79:UpdateUpTabTitleName(GText("UI_Squad_Edit"))
  r0_79:InitItemVarInfo(r2_79)
  r0_79:CallFunctionByName(r2_79 .. "Main_Init")
  r0_79:InitSelectiveList()
  r0_79:FillSelectiveList()
  r0_79:ShowOrHidePhantomWeaponUI()
  r0_79:UpdateSlotIcon()
  r0_79.Btn_Save:ForbidBtn(r0_79:CheckForceSlotIsLack() and not r0_79:CheckChangeSquadInfo())
  r0_79.Btn_Delete:SetVisibility(ESlateVisibility.Collapsed)
  r0_79:AddDelayFrameFunc(function()
    -- line: [1338, 1341] id: 80
    r0_79:FocusOnRightDetailPanel()
  end, 2, "DelayFocusItem")
  r0_79:PlayAnimation(r0_79.Left_In)
end
function r5_0.UpdateSlotIcon(r0_81)
  -- line: [1346, 1355] id: 81
  for r5_81, r6_81 in pairs(r0_81.RightSlots) do
    if r6_81.AddDelelteIcon then
      r6_81:AddDelelteIcon()
    end
    if r6_81.CheckIsNeedLackState then
      r6_81:CheckIsNeedLackState()
    end
  end
  -- close: r1_81
end
function r5_0.BindEventInListView(r0_82)
  -- line: [1358, 1361] id: 82
  r0_82.List_Build.List_Select.BP_OnItemClicked:Remove(r0_82, r0_82.ClickListItem)
  r0_82.List_Build.List_Select.BP_OnItemClicked:Add(r0_82, r0_82.ClickListItem)
end
function r5_0.ShowOrHidePhantomWeaponUI(r0_83)
  -- line: [1364, 1373] id: 83
  if r0_83:IsSubstringContained(r0_83:CurSlotNameToRightSlotsKey(r0_83.CurSlot:GetName()), "PhantomWeapon") then
    r0_83.List_Build.Image_WeaponBG:SetVisibility(ESlateVisibility.Visible)
    r0_83.List_Build.Tab_Primary:SetVisibility(ESlateVisibility.Visible)
  else
    r0_83.List_Build.Image_WeaponBG:SetVisibility(ESlateVisibility.Collapsed)
    r0_83.List_Build.Tab_Primary:SetVisibility(ESlateVisibility.Collapsed)
  end
end
function r5_0.UpdateRightDetailPanel(r0_84)
  -- line: [1376, 1462] id: 84
  r0_84:WeakClearAllSlots()
  r0_84.Text_DefaultName:SetText(r0_84.CurSquadInfo.Name)
  r0_84.Avatar = GWorld:GetAvatar()
  r0_84.Character:InitSlot({
    Uuid = r0_84.SquadInfo.Char,
    Id = r0_84.SquadInfo.CharId,
    ModSuit = r0_84.SquadInfo.ModSuit,
    Type = "Char",
    Owner = r0_84,
  })
  r0_84.Melee:InitSlot({
    Uuid = r0_84.SquadInfo.MeleeWeapon,
    Id = r0_84.SquadInfo.MeleeWeaponId,
    ModSuit = r0_84.SquadInfo.MeleeWeaponModSuit,
    Type = "Melee",
    Owner = r0_84,
  })
  r0_84.Ranged:InitSlot({
    Uuid = r0_84.SquadInfo.RangedWeapon,
    Id = r0_84.SquadInfo.RangedWeaponId,
    ModSuit = r0_84.SquadInfo.RangedWeaponModSuit,
    Type = "Ranged",
    Owner = r0_84,
  })
  local r4_84 = {
    Uuid = r0_84.SquadInfo.Pet,
    Id = r0_84.Avatar and r0_84.SquadInfo.Pet and r0_84.Avatar.Pets[r0_84.SquadInfo.Pet] and r0_84.Avatar.Pets[r0_84.SquadInfo.Pet].PetId,
    Type = "Pet",
    Owner = r0_84,
  }
  r0_84.Pet:InitSlot(r4_84)
  r0_84.Head_Phantom01:InitSlot({
    Uuid = r0_84.SquadInfo.Phantom1,
    Id = r0_84.SquadInfo.Phantom1Id,
    Type = "Char",
    Owner = r0_84,
  })
  r0_84.Weapon_Phantom01:InitSlot({
    Uuid = r0_84.SquadInfo.PhantomWeapon1,
    Id = r0_84.SquadInfo.PhantomWeapon1Id,
    Type = r0_84:GetWeaponTypeById(r0_84.SquadInfo.PhantomWeapon1Id),
    Owner = r0_84,
  })
  r0_84.Head_Phantom02:InitSlot({
    Uuid = r0_84.SquadInfo.Phantom2,
    Id = r0_84.SquadInfo.Phantom2Id,
    Type = "Char",
    Owner = r0_84,
  })
  r0_84.Weapon_Phantom02:InitSlot({
    Uuid = r0_84.SquadInfo.PhantomWeapon2,
    Id = r0_84.SquadInfo.PhantomWeapon2Id,
    Type = r0_84:GetWeaponTypeById(r0_84.SquadInfo.PhantomWeapon2Id),
    Owner = r0_84,
  })
  local r9_84 = {
    Id = r0_84.SquadInfo.WheelIndex and 1,
    Type = "Roulette",
    Owner = r0_84,
  }
  r0_84.Roulette:InitSlot(r9_84)
  r0_84:AddDelayFrameFunc(function()
    -- line: [1455, 1459] id: 85
    if r0_84.IsOpenAddSquad then
      r0_84:AddSquad()
    end
  end, 1, "AddSquadDelay")
end
function r5_0.GetWeaponTypeById(r0_86, r1_86)
  -- line: [1464, 1479] id: 86
  if not r1_86 then
    DebugPrint("thy    GetWeaponTypeById 没有提供武器Id")
    return 
  end
  local r2_86 = DataMgr.BattleWeapon[r1_86].WeaponTag
  if r2_86 then
    for r7_86, r8_86 in pairs(r2_86) do
      if r8_86 == "Melee" or r8_86 == "Ranged" then
        return r8_86
      end
    end
    -- close: r3_86
  end
  DebugPrint("thy    GetWeaponTypeById 没有找到武器类型", r1_86)
  return "Melee"
end
function r5_0.InitItemVarInfo(r0_87, r1_87)
  -- line: [1482, 1485] id: 87
  r0_87.CurSlotType = r1_87
end
function r5_0.FillSelectiveList(r0_88)
  -- line: [1488, 1508] id: 88
  r0_88.List_Build:BindEvents(r0_88, {
    OnListItemClicked = r0_88.ClickListItem,
    SortFuncion = r0_88.SortItemContents,
    FilterFunction = r0_88.FilterItemContents,
  })
  if r0_88[r0_88.CurSlotType .. "FilterTags"] then
    r0_88.Filters = r0_88:CreateFilters(r0_88[r0_88.CurSlotType .. "FilterTags"], r0_88[r0_88.CurSlotType .. "FilterNames"], r0_88[r0_88.CurSlotType .. "FilterIcons"])
  else
    r0_88.Filters = nil
  end
  r0_88.List_Build:Init(r0_88, {
    Filters = r0_88.Filters,
    OrderByDisplayNames = r0_88.OrderByDisplayNames,
    SortType = CommonConst.DESC,
    ItemContents = r0_88[r0_88.CurSlotType .. "ItemContentsArray"],
  })
end
function r5_0.CreateFilters(r0_89, r1_89, r2_89, r3_89)
  -- line: [1511, 1521] id: 89
  local r4_89 = {}
  for r9_89, r10_89 in ipairs(r1_89) do
    table.insert(r4_89, {
      Tag = r1_89[r9_89],
      Text = r2_89[r9_89],
      Icon = r3_89[r9_89],
    })
  end
  -- close: r5_89
  return r4_89
end
function r5_0.FilterItemContents(r0_90, r1_90, r2_90)
  -- line: [1524, 1557] id: 90
  local r3_90 = r0_90.CurSlotType
  local r4_90 = r0_90.SlotType2DataType[r3_90]
  local r5_90 = {}
  local r6_90 = nil
  local r7_90 = nil	-- notice: implicit variable refs by block#[5, 7]
  if r4_90 == "Char" then
    function r7_90(r0_91, r1_91)
      -- line: [1531, 1534] id: 91
      return r0_91 == DataMgr.BattleChar[r1_91.UnitId].Attribute
    end
    r6_90 = r7_90
  elseif r4_90 == "Weapon" then
    r7_90 = r0_0:GetAvatar()
    function r6_90(r0_92, r1_92)
      -- line: [1537, 1540] id: 92
      return r7_90.Weapons[r1_92.Uuid]:HasTag(r0_92)
    end
    -- close: r7_90
  elseif r4_90 == "Pet" then
    function r7_90()
      -- line: [1542, 1544] id: 93
      return true
    end
    r6_90 = r7_90
  end
  if r6_90 then
    r7_90 = ipairs
    for r11_90, r12_90 in r7_90(r1_90) do
      for r17_90, r18_90 in ipairs(r2_90) do
        if r6_90(r0_90[r3_90 .. "FilterTags"][r18_90], r12_90) then
          table.insert(r5_90, r12_90)
          break
        end
      end
      -- close: r13_90
    end
    -- close: r7_90
  end
  return r5_90
end
function r5_0.SortItemContents(r0_94, r1_94, r2_94, r3_94)
  -- line: [1560, 1569] id: 94
  local r4_94 = r0_94[r0_94.CurSlotType .. "Main_CurContent"] and r0_94[r0_94.CurSlotType .. "Main_CmpContent"]
  local r5_94 = {
    r0_94.OrderByAttrNames[r2_94]
  }
  for r10_94, r11_94 in ipairs(r0_94.OrderByAttrNames) do
    if r10_94 ~= r2_94 then
      table.insert(r5_94, r11_94)
    end
  end
  -- close: r6_94
  r0_0:SortItemContents(r1_94, r5_94, r3_94, r4_94)
end
function r5_0.SetItemSelectState(r0_95, r1_95, r2_95)
  -- line: [1571, 1586] id: 95
  if r1_95 then
    r1_95.IsSelected = r2_95
    if r1_95.SelfWidget then
      local r3_95, r4_95 = r0_95:IsSubstringContained(r0_95.CurSlot:GetName(), "Weapon_Phantom")
      if r0_95.PhantomSlot[r0_95.CurSlot:GetName()] and r3_95 then
        if r0_95["Head_Phantom0" .. r4_95].ItemInfo then
          local r5_95 = r1_95.SelfWidget
          local r7_95 = nil	-- notice: implicit variable refs by block#[8]
          if r2_95 then
            r7_95 = r0_95["Head_Phantom0" .. r4_95].ItemInfo.UnitId
            if not r7_95 then
              ::label_40::
              r7_95 = nil
            end
          else
            goto label_40	-- block#7 is visited secondly
          end
          r5_95:SetWeaponMiniPhantomIcon(r7_95)
        end
      else
        r1_95.SelfWidget:SetInGear(r1_95.IsSelected)
      end
    end
  end
end
function r5_0.ClickListItem(r0_96, r1_96)
  -- line: [1589, 1628] id: 96
  if r1_96.Uuid == nil or r1_96.Uuid == "" then
    return 
  end
  if not r0_96.CurClickItemInfo then
    r0_96.CurClickItemInfo = r0_96.CurSlot.ItemInfo
  end
  if not r0_96.PreContent then
    r0_96.PreContent = r0_96.CurSlot.ItemInfo
  end
  if r0_96.CurClickItemInfo and r0_96.CurClickItemInfo.SelfWidget then
    r0_96.CurClickItemInfo.SelfWidget:SetSelected(false)
  end
  r1_96.SelfWidget:SetSelected(true)
  if r1_96.Tag == "Pet" or r1_96.Tag == "Char" then
    AudioManager(r0_96):PlayUISound(nil, r8_0[r1_96.Tag], nil, nil)
  else
    AudioManager(r0_96):PlayUISound(nil, r8_0.Weapon, nil, nil)
  end
  r0_96.CurClickItemInfo = r1_96
  if not r0_96:CheckSlotTypeIsAboutMainRole(r0_96.CurSlot) then
    r0_96:MakeSureCallback()
    return 
  end
  r0_96:OpenTips()
end
function r5_0.HandleOnlyChooseItemIcon(r0_97, r1_97)
  -- line: [1631, 1679] id: 97
  if r0_97.CurSlot.Type == "Char" then
    if not r1_97.IsSelected then
      if r0_97.CurClickItemInfo then
        r0_97:SetItemSelectState(r0_97.CurClickItemInfo, false)
      else
        r0_97:SetItemSelectState(r0_97.CurSlot.ItemInfo, false)
      end
      r0_97:SetItemSelectState(r1_97, true)
    end
  else
    if r0_97.CurClickItemInfo then
      r0_97:SetItemSelectState(r0_97.CurClickItemInfo, false)
      r0_97.CurClickItemInfo.SelfWidget:SetWeaponMiniPhantomIcon()
    else
      r0_97:SetItemSelectState(r0_97.CurSlot.ItemInfo, false)
      if r0_97.CurSlot.ItemInfo and r0_97.CurSlot.ItemInfo.SelfWidget then
        r0_97.CurSlot.ItemInfo.SelfWidget:SetWeaponMiniPhantomIcon()
      end
    end
    r0_97:SetItemSelectState(r1_97, false)
    r1_97.SelfWidget:SetWeaponMiniPhantomIcon()
    local r2_97 = r0_97:CheckCachedOnlyShowItem(r1_97)
    if r2_97 then
      if r0_97.CurClickItemInfo then
        r2_97:ShowListItemStateOnce(r0_97.CurClickItemInfo)
        r0_97:CachedOnlyShowChooseItemInSlot(r2_97, r0_97.CurClickItemInfo)
      else
        r2_97:ShowListItemStateOnce(r0_97.CurSlot.ItemInfo)
        r0_97:CachedOnlyShowChooseItemInSlot(r2_97, r0_97.CurSlot.ItemInfo)
      end
    else
      local r3_97 = r0_97:CheckContentIsSet(r1_97)
      if r3_97 then
        if r0_97.CurClickItemInfo then
          r3_97:ShowListItemStateOnce(r0_97.CurClickItemInfo)
          r0_97:CachedOnlyShowChooseItemInSlot(r3_97, r0_97.CurClickItemInfo)
        else
          r3_97:ShowListItemStateOnce(r0_97.CurSlot.ItemInfo)
          r0_97:CachedOnlyShowChooseItemInSlot(r3_97, r0_97.CurSlot.ItemInfo)
        end
      end
    end
    r0_97.CurSlot:ShowListItemStateOnce(r1_97)
  end
end
function r5_0.ClearSlotCachedData(r0_98)
  -- line: [1681, 1685] id: 98
  for r5_98, r6_98 in pairs(r0_98.RightSlots) do
    r6_98.CachedOnlyShowItem = nil
  end
  -- close: r1_98
end
function r5_0.CachedOnlyShowChooseItemInSlot(r0_99, r1_99, r2_99)
  -- line: [1687, 1690] id: 99
  r0_99:ClearSlotCachedData()
  r1_99.CachedOnlyShowItem = r2_99
end
function r5_0.CheckCachedOnlyShowItem(r0_100, r1_100)
  -- line: [1692, 1699] id: 100
  for r6_100, r7_100 in pairs(r0_100.RightSlots) do
    if r7_100.CachedOnlyShowItem and r7_100.CachedOnlyShowItem == r1_100 then
      return r7_100
    end
  end
  -- close: r2_100
  return nil
end
function r5_0.CheckContentIsSet(r0_101, r1_101)
  -- line: [1701, 1708] id: 101
  for r6_101, r7_101 in pairs(r0_101.RightSlots) do
    if r7_101.ItemInfo == r1_101 then
      return r7_101
    end
  end
  -- close: r2_101
  return nil
end
function r5_0.CheckSlotTypeIsAboutMainRole(r0_102, r1_102)
  -- line: [1711, 1718] id: 102
  for r6_102, r7_102 in pairs(r0_102.PlayerAboutSlots) do
    if r1_102 == r7_102 then
      return true
    end
  end
  -- close: r2_102
  return false
end
function r5_0.OnBGClick(r0_103)
  -- line: [1720, 1723] id: 103
  r0_103:CloseTips()
  return r4_0.Unhandled
end
function r5_0.CloseTips(r0_104, r1_104)
  -- line: [1725, 1757] id: 104
  if r0_104.Pos_Tips:GetChildAt(0) then
    r0_104.IsPetTipsOpen = false
    r0_104:InitBottomTab(false, 2)
    r0_104:UnbindFromAnimationFinished(r0_104.Tips_Out, {
      r0_104,
      function()
        -- line: [1729, 1731] id: 105
        r0_104.Panel_Tips:SetVisibility(ESlateVisibility.Collapsed)
      end
    })
    r0_104:BindToAnimationFinished(r0_104.Tips_Out, {
      r0_104,
      function()
        -- line: [1732, 1734] id: 106
        r0_104.Panel_Tips:SetVisibility(ESlateVisibility.Collapsed)
      end
    })
    r0_104:PlayAnimation(r0_104.Tips_Out)
    r0_104.SquadItemTip:CloseWidget()
    r0_104.Pos_Tips:ClearChildren()
    if r0_104.CurClickItemInfo and r0_104.CurClickItemInfo.SelfWidget then
      r0_104.CurClickItemInfo.SelfWidget:SetSelected(false)
    end
    if r0_104.CurSlot.ItemInfo and r0_104.CurSlot.ItemInfo.SelfWidget then
      r0_104.CurSlot.ItemInfo.SelfWidget:SetSelected(true)
    end
    if r0_104.CurInputDeviceType == ECommonInputType.Gamepad then
      r0_104.List_Build.Sort.Controller:SetVisibility(ESlateVisibility.Visible)
    end
  end
  if not r1_104 then
    r0_104:RevertAllItemIcon()
  end
  r0_104:FocusOnItemList()
end
function r5_0.RevertAllItemIcon(r0_107)
  -- line: [1759, 1774] id: 107
  r0_107:SetItemSelectState(r0_107.CurClickItemInfo, false)
  for r5_107, r6_107 in pairs(r0_107.RightSlots) do
    if r6_107.CachedOnlyShowItem then
      r6_107.CachedOnlyShowItem.SelfWidget:SetWeaponMiniPhantomIcon()
      r0_107:SetItemSelectState(r6_107.CachedOnlyShowItem, false)
    end
  end
  -- close: r1_107
  for r5_107, r6_107 in pairs(r0_107.RightSlots) do
    if r6_107.UpdateListItemState then
      r6_107:UpdateListItemState(r6_107.ItemInfo)
    end
  end
  -- close: r1_107
  r0_107.CurClickItemInfo = nil
  r0_107.PreContent = nil
end
function r5_0.OpenTips(r0_108)
  -- line: [1776, 1804] id: 108
  r0_108.Pos_Tips:ClearChildren()
  r0_108.SquadItemTip = r0_108:CreateWidgetNew("SquadItemTips")
  r0_108.Pos_Tips:AddChild(r0_108.SquadItemTip)
  r0_108.IsPetTipsOpen = true
  r0_108.Panel_Tips:SetVisibility(ESlateVisibility.Visible)
  r0_108.Panel_Tips:SetRenderOpacity(0)
  r0_108:PlayAnimation(r0_108.Tips_In)
  r0_108.List_Build.Sort.Controller:SetVisibility(ESlateVisibility.Collapsed)
  if r0_108.CurClickItemInfo.Type ~= "Pet" then
    r0_108:InitBottomTab(true, 2, GText("PROLOGUE_SELECTGUN_TIP_4"))
  else
    r0_108:InitBottomTab(true, 1)
  end
  r0_108.SquadItemTip:SetVisibility(ESlateVisibility.Visible)
  r0_108.SquadItemTip:InitWidget({
    ItemInfo = r0_108.CurClickItemInfo,
    Owner = r0_108,
    MakeSureCallback = r0_108.MakeSureCallback,
    GoToArmory = r0_108.GoToArmory,
  })
  r0_108:SetCurFocusArea("Tip")
end
function r5_0.GoToArmory(r0_109)
  -- line: [1807, 1904] id: 109
  AudioManager(r0_109):PlayUISound(nil, "event:/ui/common/click_btn_confirm", nil, nil)
  local r1_109 = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  local r2_109 = r1_109:CharacterInTag("Skill") and r1_109:IsSafeToCancelSkill()
  if r1_109:CanEnterInteractive() and (r1_109:CharacterInTag("Interactive") or r1_109:CharacterInTag("Idle") or r2_109) and r1_109.PlayerAnimInstance and (r1_109.PlayerAnimInstance.IdletagName == "0" or r1_109.PlayerAnimInstance.IdletagName == "EmoIdle") and (not r0_109.IsFromDungeonPage or not UIManager(r0_109):GetArmoryUIObj()) then
    if r2_109 then
      r1_109:StopSkill(UE.ESkillStopReason.ArmoryCancel)
    end
  else
    UIManager(r0_109):ShowUITip("CommonToastMain", GText("UI_Toast_Armory_Forbid"))
    return 
  end
  local r3_109 = {}
  if r0_109.CurClickItemInfo then
    r3_109 = {
      bNoEndCamera = true,
      bHideSquadBuildBtn = true,
      bHideBoxBtn = true,
      bHideDeployBtn = true,
      OnCloseDelegate = {
        r0_109,
        function()
          -- line: [1830, 1836] id: 110
          if not r0_109.CurSquadInfo.Char or r0_109.CurSquadInfo.Char == "" then
            r0_109:HideOrShowModel(true)
          else
            r0_109:HideOrShowModel(false)
          end
        end
      },
    }
  else
    r3_109 = {
      bNoEndCamera = true,
      bHideSquadBuildBtn = true,
      bHideBoxBtn = true,
      bHideDeployBtn = true,
      MainTabName = r0_0.ArmoryMainTabNames.BattleWheel,
      BattleWheelIndex = r0_109.Roulette.Id,
    }
  end
  if r0_109.CurSlotType == "Char" then
    r3_109.MainTabName = r0_0.ArmoryMainTabNames.Char
    r3_109.CharUuids = {
      r0_109.CurClickItemInfo.Uuid
    }
    r3_109.bHideMeleeTab = true
    r3_109.bHideRangedTab = true
    r3_109.bHideWeaponTab = true
    r3_109.bHidePetTab = true
    r3_109.bHideBattleWheel = true
    r3_109.bHideUltraTab = true
  elseif r0_109.CurSlotType == "Melee" then
    r3_109.MainTabName = r0_0.ArmoryMainTabNames.Melee
    r3_109.WeaponUuids = {
      r0_109.CurClickItemInfo.Uuid
    }
    r3_109.bHideCharTab = true
    r3_109.bHideRangedTab = true
    r3_109.bHideWeaponTab = true
    r3_109.bHidePetTab = true
    r3_109.bHideBattleWheel = true
    r3_109.bHideUltraTab = true
  elseif r0_109.CurSlotType == "Ranged" then
    r3_109.MainTabName = r0_0.ArmoryMainTabNames.Ranged
    r3_109.WeaponUuids = {
      r0_109.CurClickItemInfo.Uuid
    }
    r3_109.bHideMeleeTab = true
    r3_109.bHideCharTab = true
    r3_109.bHideWeaponTab = true
    r3_109.bHidePetTab = true
    r3_109.bHideBattleWheel = true
    r3_109.bHideUltraTab = true
  elseif r0_109.CurSlotType == "Pet" then
    r3_109.MainTabName = r0_0.ArmoryMainTabNames.Pet
    r3_109.PetUniqueIds = {
      r0_109.CurClickItemInfo.Uuid
    }
    r3_109.bHideCharTab = true
    r3_109.bHideMeleeTab = true
    r3_109.bHideRangedTab = true
    r3_109.bHideWeaponTab = true
    r3_109.bHideBattleWheel = true
    r3_109.bHideUltraTab = true
  else
    r3_109.MainTabName = r0_0.ArmoryMainTabNames.BattleWheel
    r3_109.bHideCharTab = true
    r3_109.bHideMeleeTab = true
    r3_109.bHideRangedTab = true
    r3_109.bHideWeaponTab = true
    r3_109.bHidePetTab = true
    r3_109.bHideUltraTab = true
  end
  r0_109:CloseTips()
  UIManager(r0_109):LoadUINew("ArmoryDetail", r3_109)
end
function r5_0.HideOrShowModel(r0_111, r1_111)
  -- line: [1906, 1908] id: 111
  r0_111.ActorController.ArmoryPlayer:SetActorHideTag("SuqadRole", r1_111)
end
function r5_0.MakeSureCallback(r0_112, r1_112)
  -- line: [1911, 1946] id: 112
  local r2_112, r3_112 = r0_112:IsNeedPhantomIcon()
  local r4_112 = {
    ItemInfo = r0_112.CurClickItemInfo,
    Uuid = r0_112.CurClickItemInfo.Uuid,
    Id = r0_112.CurClickItemInfo.UnitId,
    Rarity = r0_112.CurClickItemInfo.Rarity,
    ModSuit = r1_112 and r0_112.PreSlot and r0_112.PreSlot.ModSuit,
    Type = r0_112.CurSlotType,
    IsNeedPhantomIcon = r2_112,
    Num = r3_112,
    Owner = r0_112,
  }
  r0_112.CurSlot:ClearItemFlag()
  if r0_112:CheckSelectItemIsRepeatInCurAllSlot() then
    r0_112.PreSlot:ClearItemFlag()
    if r0_112.CurSlot:GetIsEmpty() or not r0_112:WeaponIsValidForSlot() then
      r0_112.PreSlot:ClearSlot()
    else
      local r5_112 = r0_112.CurSlot:GetParams()
      r5_112.ItemInfo = r0_112.CurSlot.ItemInfo
      local r6_112 = r5_112.ModSuit
      if r6_112 then
        r6_112 = r5_112.ModSuit
        if r6_112 > 0 then
          r6_112 = r5_112.ModSuit and r0_112.PreSlot.ModSuit
        end
      else
        goto label_66	-- block#10 is visited secondly
      end
      r5_112.ModSuit = r6_112
      r0_112.PreSlot:InitSlot(r5_112)
    end
    r0_112:PopChangeRoleToastByType(r4_112)
  end
  r0_112.CurSlot:InitSlot(r4_112)
  r0_112.PreContent = r0_112.CurSlot.ItemInfo
  r0_112:CloseTips(true)
end
function r5_0.CheckIsMainRoleWeapon(r0_113, r1_113)
  -- line: [1949, 1956] id: 113
  for r6_113, r7_113 in pairs(r0_113.PlayerForceSlot) do
    if r7_113 == r1_113 then
      return true
    end
  end
  -- close: r2_113
  return false
end
function r5_0.WeaponIsValidForSlot(r0_114)
  -- line: [1959, 1966] id: 114
  if r0_114:CheckSlotTypeIsAboutMainRole(r0_114.PreSlot) and r0_114.PreSlot and r0_114.CurSlot.Params.Type ~= r0_114.PreSlot.Type then
    return false
  end
  return true
end
function r5_0.PopChangeRoleToastByType(r0_115, r1_115)
  -- line: [1968, 1981] id: 115
  local r2_115 = r0_115.CurSlot:GetName()
  local r3_115, r4_115 = r0_115:IsSubstringContained(r2_115, "Head_Phantom0")
  local r5_115, r6_115 = r0_115:IsSubstringContained(r2_115, "Weapon_Phantom0")
  if r2_115 == "Character" then
    UIManager(r0_115):ShowUITip("CommonToastMain", string.format(GText("UI_Squad_SwitchChar_Toast"), GText(r0_115:GetCharName(r1_115.Id))))
  elseif r3_115 then
    UIManager(r0_115):ShowUITip("CommonToastMain", string.format(GText("UI_Squad_SwitchSigil_Toast"), GText(r0_115:GetCharName(r1_115.Id)), GText("UI_Squad_Sigil" .. r4_115)))
  elseif r5_115 then
    UIManager(r0_115):ShowUITip("CommonToastMain", string.format(GText("UI_Squad_SwitchSigil_Toast"), GText(r0_115:GetWeaponName(r1_115.Id)), GText("UI_Squad_Sigil" .. r6_115)))
  elseif r2_115 == "Melee" or r2_115 == "Ranged" then
    UIManager(r0_115):ShowUITip("CommonToastMain", string.format(GText("UI_Squad_SwitchChar_Toast"), GText(r0_115:GetWeaponName(r1_115.Id))))
  end
end
function r5_0.GetCharName(r0_116, r1_116)
  -- line: [1983, 1985] id: 116
  return DataMgr.Char[r1_116] and DataMgr.Char[r1_116].CharName
end
function r5_0.GetWeaponName(r0_117, r1_117)
  -- line: [1987, 1989] id: 117
  return DataMgr.Weapon[r1_117] and DataMgr.Weapon[r1_117].WeaponName
end
function r5_0.IsNeedPhantomIcon(r0_118)
  -- line: [1991, 1994] id: 118
  local r3_118 = r0_118.CurSlot:GetName()
  r3_118, r4_118 = r0_118:IsSubstringContained(r3_118, "Weapon_Phantom")
  return r3_118, r4_118
end
function r5_0.IsSubstringContained(r0_119, r1_119, r2_119)
  -- line: [1996, 2002] id: 119
  local r3_119, r4_119 = string.find(r1_119, r2_119)
  if r3_119 ~= nil then
    return r3_119 ~= nil, string.sub(r1_119, -1)
  end
  return nil, nil
end
function r5_0.CheckSelectItemIsRepeatInCurAllSlot(r0_120)
  -- line: [2004, 2012] id: 120
  for r5_120, r6_120 in pairs(r0_120.RightSlots) do
    if r6_120:GetItemId() == r0_120.CurClickItemInfo.Uuid and r6_120:GetName() ~= r0_120.CurSlot:GetName() and r5_120 ~= "WheelIndex" then
      r0_120.PreSlot = r6_120
      return true
    end
  end
  -- close: r1_120
  return false
end
function r5_0.InitSelectiveList(r0_121)
  -- line: [2015, 2040] id: 121
  r0_121.OrderByDisplayNames = {
    "UI_LEVEL_SELECT",
    "UI_RARITY_NAME"
  }
  r0_121.OrderByAttrNames = {
    "Level",
    "Rarity",
    "SortPriority",
    "UnitId"
  }
  r0_121.CharFilterTags, r0_121.CharFilterNames = r4_0.GetAllElementTypes()
  r0_121.CharFilterIcons = {}
  for r5_121, r6_121 in pairs(r0_121.CharFilterTags) do
    local r7_121 = "Armory_" .. r6_121
    table.insert(r0_121.CharFilterIcons, "/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. r7_121 .. ".T_" .. r7_121)
  end
  -- close: r1_121
  r0_121.MeleeFilterTags, r0_121.MeleeFilterNames, r0_121.RangedFilterTags, r0_121.RangedFilterNames = r4_0.GetAllWeaponTags()
  r0_121.MeleeFilterIcons = {}
  for r5_121, r6_121 in ipairs(r0_121.MeleeFilterTags) do
    local r7_121 = DataMgr.WeaponTag[r6_121]
    table.insert(r0_121.MeleeFilterIcons, r7_121 and r7_121.Icon)
  end
  -- close: r1_121
  r0_121.RangedFilterIcons = {}
  for r5_121, r6_121 in ipairs(r0_121.RangedFilterTags) do
    local r7_121 = DataMgr.WeaponTag[r6_121]
    table.insert(r0_121.RangedFilterIcons, r7_121 and r7_121.Icon)
  end
  -- close: r1_121
end
function r5_0.SwitchToRouletteList(r0_122)
  -- line: [2047, 2058] id: 122
  r0_122:SwitchLeftWidgetByIndex(3)
  r0_122.IsInEditor = true
  r0_122:SwitchBtnPanel()
  r0_122:GetWheelNum()
  r0_122:UpdateRouletteUI()
  r0_122:ResetAllSlotsClickState()
  r0_122:PlayAnimation(r0_122.Left_In)
  r0_122:FocusOnItemList()
  r0_122:InitBottomTab(false, 2)
end
function r5_0.GetWheelNum(r0_123)
  -- line: [2061, 2070] id: 123
  r0_123.Avatar = GWorld:GetAvatar()
  r0_123.WheelNum = nil
  if r0_123.Avatar then
    for r5_123, r6_123 in pairs(r0_123.Avatar.Wheels) do
      r0_123.WheelNum = r5_123
    end
    -- close: r1_123
  end
  r0_123.WheelNum = r0_123.WheelNum and 3
end
function r5_0.UpdateRouletteUI(r0_124)
  -- line: [2073, 2087] id: 124
  r0_124.Text_Roulette:SetText(GText("UI_Squad_ChooseSuit"))
  r0_124.List_Roulette:SetAllowOverscroll(r0_124.List_Default:IsDisableScroll())
  r0_124.List_Roulette:ClearListItems()
  for r5_124 = 1, r0_124.WheelNum, 1 do
    local r6_124 = NewObject(r4_0.GetCommonItemContentClass())
    r6_124.ClickCallback = r0_124.UpdateRouletteSlot
    r6_124.Owner = r0_124
    r6_124.Index = r5_124
    r6_124.IsSelect = r5_124 == r0_124.Roulette.Id
    r0_124.List_Roulette:AddItem(r6_124)
  end
end
function r5_0.UpdateWheelArr(r0_125, r1_125)
  -- line: [2090, 2095] id: 125
  if not r0_125.WheelArr or #r0_125.WheelArr == 3 then
    r0_125.WheelArr = {}
  end
  table.insert(r0_125.WheelArr, r1_125)
end
function r5_0.UpdateRouletteSlot(r0_126, r1_126)
  -- line: [2098, 2107] id: 126
  r0_126.Roulette:ChangeWheelIndex(r1_126)
  for r5_126 = 1, r0_126.WheelNum, 1 do
    if r5_126 ~= r1_126 then
      local r6_126 = r0_126.WheelArr[r5_126]
      r6_126.IsSelect = false
      r6_126:PlayAnimation(r6_126.Normal)
    end
  end
end
function r5_0.Handle_OnPCDown(r0_127, r1_127)
  -- line: [2114, 2134] id: 127
  if r1_127 == "Escape" then
    r0_127:OnBackKeyDown()
    return true
  elseif r1_127 == "Q" and r0_127.CurSlot.IsPhantomWeapon then
    if r0_127.CurPhantomWeaponType ~= "Melee" then
      r0_127:PhantomWeaponTypeChanged("Melee")
    end
    return true
  elseif r1_127 == "E" and r0_127.CurSlot.IsPhantomWeapon then
    if r0_127.CurPhantomWeaponType ~= "Ranged" then
      r0_127:PhantomWeaponTypeChanged("Ranged")
    end
    return true
  end
  return false
end
function r5_0.OnUpdateUIStyleByInputTypeChange(r0_128, r1_128, r2_128)
  -- line: [2137, 2144] id: 128
  r0_128.CurInputDeviceType = r1_128
  r0_128.CurGamepadName = r2_128
  r0_128:InitUI()
  r0_128:SwitchSlotDeleteIconVisible()
end
function r5_0.SwitchSlotDeleteIconVisible(r0_129)
  -- line: [2146, 2152] id: 129
  for r5_129, r6_129 in pairs(r0_129.RightSlots) do
    if r6_129.AddDelelteIcon then
      r6_129:AddDelelteIcon()
    end
  end
  -- close: r1_129
end
function r5_0.InitUI(r0_130)
  -- line: [2154, 2183] id: 130
  if r0_130.CurInputDeviceType == ECommonInputType.MouseAndKeyboard or r0_130.CurInputDeviceType == ECommonInputType.Touch then
    r0_130:UpdateGamepadIcon()
    r0_130.IsInSortState = false
    r0_130:AddDelayFrameFunc(function()
      -- line: [2161, 2167] id: 131
      r0_130:SwitchAddSquadItemVisibility(true)
      if r0_130:GetSquadWidgetInSquadList(r0_130.CurSelectSquadIndex) then
        r0_130:GetSquadWidgetInSquadList(r0_130.CurSelectSquadIndex):HideAllArrow()
      end
    end, 2, "HideAllArrow")
    return 
  end
  r0_130:AddDelayFrameFunc(function()
    -- line: [2172, 2181] id: 132
    r0_130.CurGamepadArea = nil
    r0_130.IsInSortState = false
    r0_130:SwitchGamePadIconVisibilityBySortState(true)
    if r0_130.IsInEditor then
      r0_130:FocusOnRightDetailPanel()
    else
      r0_130:FocusOnSquadList()
    end
  end, 2, "SwitchGamePad")
end
function r5_0.RegisterBtnIconInGampad(r0_133)
  -- line: [2186, 2191] id: 133
  r0_133.Btn_Edit:SetDefaultGamePadImg("X")
  r0_133.Btn_Save:SetDefaultGamePadImg("X")
  r0_133.Btn_Cancel:SetDefaultGamePadImg("B")
  r0_133.Btn_Armory:SetDefaultGamePadImg("View")
end
function r5_0.UpdateGamepadIcon(r0_134, r1_134, r2_134, r3_134, r4_134)
  -- line: [2194, 2241] id: 134
  if r0_134.Key_Controller_Sort then
    r0_134.Key_Controller_Sort:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "LS",
        }
      },
    })
    if r1_134 and r0_134.SquadListLen > 1 then
      r0_134.Key_Controller_Sort:SetVisibility(ESlateVisibility.Visible)
    else
      r0_134.Key_Controller_Sort:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  if r0_134.Key_Controller_Delete then
    r0_134.Key_Controller_Delete:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "RS",
        }
      },
    })
    if r2_134 then
      r0_134.Key_Controller_Delete:SetVisibility(ESlateVisibility.Visible)
    else
      r0_134.Key_Controller_Delete:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  if r0_134.Key_Controller_EditName then
    r0_134.Key_Controller_EditName:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "Menu",
        }
      },
    })
    if r3_134 then
      r0_134.Key_Controller_EditName:SetVisibility(ESlateVisibility.Visible)
    else
      r0_134.Key_Controller_EditName:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  if r0_134.Btn_Edit and r0_134.Btn_Edit.Key_GamePad then
    if r4_134 then
      r0_134.Btn_Edit.Key_GamePad:SetVisibility(ESlateVisibility.Visible)
    else
      r0_134.Btn_Edit.Key_GamePad:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
end
function r5_0.FocusOnSquadList(r0_135)
  -- line: [2244, 2264] id: 135
  if r0_135.CurInputDeviceType ~= ECommonInputType.Gamepad then
    return 
  end
  if r0_135:CheckHasTip() then
    return 
  end
  r0_135:SetCurFocusArea("SquadList")
  if r0_135:GetSquadWidgetInSquadList(r0_135.CurSelectSquadIndex) then
    r0_135:GetSquadWidgetInSquadList(r0_135.CurSelectSquadIndex):SetFocus()
  end
  r0_135:UpdateGamepadIcon(true, true, true, true)
  r0_135:InitBottomTab(true, 2)
end
function r5_0.FocusOnSquadListInSortState(r0_136)
  -- line: [2267, 2283] id: 136
  if r0_136.CurInputDeviceType ~= ECommonInputType.Gamepad then
    return 
  end
  if r0_136:CheckHasTip() then
    return 
  end
  r0_136:SetCurFocusArea("SquadListInSort")
  r0_136:GetSquadWidgetInSquadList(r0_136.CurSelectSquadIndex):SetFocus()
  r0_136:UpdateGamepadIcon()
end
function r5_0.FocusOnRightDetailPanel(r0_137)
  -- line: [2286, 2323] id: 137
  if r0_137.CurInputDeviceType ~= ECommonInputType.Gamepad then
    return 
  end
  if r0_137:CheckHasTip() then
    return 
  end
  if not r0_137.CurSlot or not r0_137.IsInEditor then
    r0_137.Character:SetFocus()
  else
    r0_137.CurSlot:SetFocus()
  end
  if r0_137.IsInEditor then
    r0_137:SetCurFocusArea("SlotInEdit")
    r0_137:UpdateGamepadIcon(nil, nil, true)
    r0_137.Btn_Save.Key_GamePad:SetRenderOpacity(1)
    r0_137.Btn_Save.Key_GamePad:SetVisibility(ESlateVisibility.Visible)
    r0_137.Btn_Cancel.Key_GamePad:SetVisibility(ESlateVisibility.Visible)
    r0_137.List_Build.Sort.Controller:SetVisibility(ESlateVisibility.Collapsed)
  else
    r0_137:SetCurFocusArea("SlotInView")
    r0_137:UpdateGamepadIcon(false, true, true, true)
    r0_137.Btn_Save.Key_GamePad:SetRenderOpacity(0)
    r0_137.Btn_Save.Key_GamePad:SetVisibility(ESlateVisibility.Collapsed)
    r0_137.Btn_Cancel.Key_GamePad:SetVisibility(ESlateVisibility.Collapsed)
  end
  r0_137:InitBottomTab(false, 3)
end
function r5_0.FocusOnItemList(r0_138)
  -- line: [2326, 2359] id: 138
  if r0_138.CurInputDeviceType ~= ECommonInputType.Gamepad then
    return 
  end
  if r0_138:CheckHasTip() then
    return 
  end
  r0_138:SetCurFocusArea("ListItem")
  if r0_138.Panel_List:IsVisible() then
    r0_138.CurClickItemInfo = r0_138.CurSlot and r0_138.CurSlot.ItemInfo
    if r0_138.CurClickItemInfo and r0_138.CurClickItemInfo.UI then
      r0_138.CurClickItemInfo.UI:SetFocus()
    else
      r0_138.List_Build.List_Select:SetFocus()
      r0_138.List_Build.List_Select:SetSelectedIndex(0)
    end
    r0_138.List_Build.Sort.Controller:SetVisibility(ESlateVisibility.Visible)
  else
    r0_138.List_Roulette:SetFocus()
    r0_138.List_Roulette:SetSelectedIndex(0)
  end
  r0_138:InitBottomTab(false, 2)
  r0_138.Btn_Save.Key_GamePad:SetRenderOpacity(0)
  r0_138.Btn_Save.Key_GamePad:SetVisibility(ESlateVisibility.Collapsed)
  r0_138.Btn_Cancel.Key_GamePad:SetVisibility(ESlateVisibility.Collapsed)
  r0_138:UpdateGamepadIcon()
end
function r5_0.CheckHasTip(r0_139)
  -- line: [2362, 2396] id: 139
  if r0_139.CurInputDeviceType ~= ECommonInputType.Gamepad then
    return 
  end
  if r0_139.Pos_Tips:GetChildAt(0) then
    if r0_139.CurSlotType ~= "Pet" then
      r0_139.SquadItemTip.Edit_Tips.ModType01:SetFocus()
    else
      r0_139.SquadItemTip:SetFocus()
    end
    r0_139:SetCurFocusArea("Tip")
    return true
  elseif r0_139.IsEditSquadName then
    r0_139.NameEditDialog:SetFocus()
    r0_139:SetCurFocusArea("Tip")
    return true
  elseif r0_139.DeleteSquadTips and not r0_139.DeleteSquadTips.IsClosing then
    r4_0.GetRootUWidget(r0_139.DeleteSquadTips):SetFocus()
    r0_139:SetCurFocusArea("Tip")
    return true
  elseif r0_139.SaveSquadTip and not r0_139.SaveSquadTip.IsClosing then
    r4_0.GetRootUWidget(r0_139.SaveSquadTip):SetFocus()
    r0_139:SetCurFocusArea("Tip")
    return true
  elseif r0_139.CancelPopUI and not r0_139.CancelPopUI.IsClosing then
    r4_0.GetRootUWidget(r0_139.CancelPopUI):SetFocus()
    r0_139:SetCurFocusArea("Tip")
    return true
  else
    return false
  end
end
function r5_0.SetCurFocusArea(r0_140, r1_140)
  -- line: [2399, 2402] id: 140
  r0_140.CurGamepadArea = r1_140
  DebugPrint("thy   SetCurFocusArea", r0_140.CurGamepadArea)
end
function r5_0.SquadListMoveInGamePadWithDPad(r0_141, r1_141)
  -- line: [2406, 2426] id: 141
  if r0_141.CurGamepadArea == "SquadListInSort" then
    local r2_141 = r0_141.IsInSortState
    if r2_141 then
      if r1_141 then
        r2_141 = math.max(r0_141.CurSelectSquadIndex + -1, 1) and math.min(r0_141.CurSelectSquadIndex + 1, r0_141.SquadListLen)
      else
        goto label_17	-- block#4 is visited secondly
      end
      if r2_141 ~= r0_141.CurSelectSquadIndex then
        r0_141:GetSquadWidgetInSquadList(r0_141.CurSelectSquadIndex):HideAllArrow()
        r0_141:PlayAnimation(r0_141.UpdateList)
        r0_141:AddDelayFrameFunc(function()
          -- line: [2416, 2418] id: 142
          r0_141:GetSquadWidgetInSquadList(r0_141.CurSelectSquadIndex):ChangeTwoItemInListView(r0_141.List_Default, r0_141.CurSelectSquadIndex, r2_141)
        end, 5, "DelayChange")
      else
        r0_141:FocusOnSquadListInSortState()
        r0_141:GetSquadWidgetInSquadList(r0_141.CurSelectSquadIndex):CheckArrowState()
      end
      -- close: r2_141
    end
  end
  return true
end
function r5_0.CheckIsInItemList(r0_143)
  -- line: [2429, 2431] id: 143
  return r0_143.List_Build.List_Select:HasFocusedDescendants() and r0_143.List_Roulette:HasFocusedDescendants()
end
function r5_0.SwitchAddSquadItemVisibility(r0_144, r1_144)
  -- line: [2433, 2451] id: 144
  if r0_144.SquadListLen == r0_144.SquadMax or r0_144.SquadListLen == 1 then
    return 
  end
  for r5_144 = 1, r0_144.List_Default:GetNumItems(), 1 do
    local r6_144 = r0_144:GetSquadWidgetInSquadList(r5_144)
    if r6_144 then
      if r6_144.IsAddSquad then
        if r1_144 then
          r6_144:SetVisibility(ESlateVisibility.Visible)
        else
          r6_144:SetVisibility(ESlateVisibility.Collapsed)
        end
      else
        r6_144:SetVisibility(ESlateVisibility.Visible)
      end
    end
  end
end
function r5_0.Handle_OnGamePadDown(r0_145, r1_145)
  -- line: [2454, 2643] id: 145
  if r1_145 == "Gamepad_FaceButton_Right" then
    if r0_145.Pos_Tips:GetChildAt(0) then
      r0_145:CloseTips()
      return true
    end
    if r0_145.CurGamepadArea == "ListItem" then
      r0_145:FocusOnRightDetailPanel()
      return true
    elseif r0_145.CurGamepadArea == "SlotInView" then
      r0_145:FocusOnSquadList()
      return true
    elseif r0_145.CurGamepadArea == "SlotInEdit" then
      r0_145:CancelCreateSquadAndBackToSquadList()
      return true
    elseif r0_145.CurGamepadArea == "SquadListInSort" and r0_145.IsInSortState then
      r0_145.IsInSortState = false
      r0_145:SwitchGamePadIconVisibilityBySortState(true)
      r0_145:SwitchAddSquadItemVisibility(true)
      r0_145:FocusOnSquadList()
      r0_145:GetSquadWidgetInSquadList(r0_145.CurSelectSquadIndex):HideAllArrow()
      return true
    else
      r0_145:OnBackKeyDown()
      return true
    end
  elseif r1_145 == "Gamepad_FaceButton_Top" then
    if r0_145.CurGamepadArea == "SquadList" or r0_145.CurGamepadArea == "SlotInView" then
      r0_145:AddSquad()
    elseif r0_145.CurGamepadArea == "SlotInEdit" then
      r0_145:ClearCurSlot()
    end
    return true
  elseif r1_145 == "Gamepad_FaceButton_Bottom" then
    if r0_145.FocusInAddSquad then
      r0_145:AddSquad()
      r0_145.FocusInAddSquad = false
      return true
    end
    if r0_145.CurGamepadArea == "SquadList" then
      r0_145:FocusOnRightDetailPanel()
      return true
    elseif r0_145.CurGamepadArea == "SlotInView" then
      r0_145:FocusOnRightDetailPanel()
      return true
    elseif r0_145.CurGamepadArea == "SlotInEdit" then
      r0_145:FocusOnItemList()
      return true
    end
  elseif r1_145 == "Gamepad_FaceButton_Left" then
    if r0_145.CurGamepadArea == "Tip" then
      if r0_145.CurSlotType == "Pet" then
        r0_145:MakeSureCallback()
      elseif r0_145.SquadItemTip then
        r0_145:MakeSureCallback(r0_145.SquadItemTip.Edit_Tips.SelectModIndex)
      end
      return true
    end
    if r0_145.IsPetTipsOpen then
      r0_145.IsPetTipsOpen = false
      return true
    end
    if r0_145.CurGamepadArea == "SquadList" then
      r0_145:EditorSquad()
    elseif (r0_145.CurGamepadArea == "SquadList" or r0_145.CurGamepadArea == "SlotInView") and not r0_145.IsInEditor then
      r0_145:EditorSquad()
      return true
    elseif r0_145.CurGamepadArea == "SlotInEdit" then
      r0_145:SaveSquad()
      return true
    end
  elseif r1_145 == "Gamepad_DPad_Up" then
    if r0_145.IsInCd then
      DebugPrint("thy    IsInCD")
      return true
    else
      r0_145:CreateCDTimer()
    end
    return r0_145:SquadListMoveInGamePadWithDPad(true)
  elseif r1_145 == "Gamepad_DPad_Down" then
    if r0_145.IsInCd then
      DebugPrint("thy    IsInCD")
      return true
    else
      r0_145:CreateCDTimer()
    end
    return r0_145:SquadListMoveInGamePadWithDPad(false)
  elseif r1_145 == "Gamepad_DPad_Left" and r0_145.CurGamepadArea == "SquadList" then
    return true
  elseif r1_145 == "Gamepad_DPad_Right" and r0_145.CurGamepadArea == "SquadList" then
    return true
  elseif r1_145 == "Gamepad_LeftStick_Right" and r0_145.CurGamepadArea == "SquadList" then
    return true
  elseif r1_145 == "Gamepad_LeftStick_Left" then
    if r0_145.CurGamepadArea == "SquadList" then
      return true
    end
    return true
  elseif r1_145 == "Gamepad_LeftStick_Up" then
    if r0_145.IsInCd and r0_145.IsInSortState then
      DebugPrint("thy    IsInCD")
      return true
    else
      r0_145:CreateCDTimer()
    end
    return r0_145:SquadListMoveInGamePadWithDPad(true)
  elseif r1_145 == "Gamepad_LeftStick_Down" then
    if r0_145.IsInCd and r0_145.IsInSortState then
      DebugPrint("thy    IsInCD")
      return true
    else
      r0_145:CreateCDTimer()
    end
    return r0_145:SquadListMoveInGamePadWithDPad(false)
  elseif r1_145 == "Gamepad_Special_Right" then
    if r0_145.Pos_Tips:GetChildAt(0) or UIManager(r0_145):IsHaveMenuAnchorOpen() then
      return true
    end
    if r0_145.CurGamepadArea == "SquadList" or r0_145.CurGamepadArea == "SlotInEdit" or r0_145.CurGamepadArea == "SlotInView" then
      r0_145:EditSquadName()
    end
    return true
  elseif r1_145 == "Gamepad_Special_Left" then
    if r0_145.Panel_Roulette:IsVisible() or r0_145.Panel_Tips:IsVisible() then
      r0_145:GoToArmory()
    end
    return true
  elseif r1_145 == "Gamepad_RightThumbstick" then
    if r0_145.Pos_Tips:GetChildAt(0) or UIManager(r0_145):IsHaveMenuAnchorOpen() then
      return 
    end
    if r0_145.CurGamepadArea == "SquadList" or r0_145.CurGamepadArea == "SlotInView" then
      r0_145:DeleteSquad()
    end
    return true
  elseif r1_145 == "Gamepad_LeftThumbstick" then
    if r0_145.Pos_Tips:GetChildAt(0) or UIManager(r0_145):IsHaveMenuAnchorOpen() then
      return true
    end
    if r0_145.CurGamepadArea == "SquadListInSort" and r0_145.IsInSortState then
      r0_145.IsInSortState = false
      r0_145:InitBottomTab(true, 2)
      r0_145:SwitchGamePadIconVisibilityBySortState(true)
      r0_145:SwitchAddSquadItemVisibility(true)
      r0_145:GetSquadWidgetInSquadList(r0_145.CurSelectSquadIndex):HideAllArrow()
      r0_145:FocusOnSquadList()
    elseif r0_145.CurGamepadArea == "SquadList" and r0_145.SquadListLen > 1 then
      r0_145.IsInSortState = true
      r0_145:InitBottomTabOnSortStateInGamePad()
      r0_145:SwitchGamePadIconVisibilityBySortState(false)
      r0_145:SwitchAddSquadItemVisibility(false)
      r0_145:GetSquadWidgetInSquadList(r0_145.CurSelectSquadIndex):CheckArrowState()
      r0_145:FocusOnSquadListInSortState()
    end
    return true
  elseif r1_145 == "Gamepad_LeftTrigger" and r0_145.CurSlot.IsPhantomWeapon then
    if r0_145.CurPhantomWeaponType ~= "Melee" then
      r0_145:PhantomWeaponTypeChanged("Melee")
    end
    return true
  elseif r1_145 == "Gamepad_RightTrigger" and r0_145.CurSlot.IsPhantomWeapon then
    if r0_145.CurPhantomWeaponType ~= "Ranged" then
      r0_145:PhantomWeaponTypeChanged("Ranged")
    end
    return true
  end
  return false
end
function r5_0.CheckLeftStickKeyName(r0_146)
  -- line: [2646, 2663] id: 146
  local r1_146 = nil
  if r0_146.MoveDeltaX and r0_146.MoveDeltaX ~= 0 then
    if r0_146.MoveDeltaX > 0.5 then
      r1_146 = "Gamepad_LeftStick_Right"
    elseif r0_146.MoveDeltaX < -0.5 then
      r1_146 = "Gamepad_LeftStick_Left"
    end
  end
  if not r1_146 and r0_146.MoveDeltaY and r0_146.MoveDeltaY ~= 0 then
    if r0_146.MoveDeltaY > 0.5 then
      r1_146 = "Gamepad_LeftStick_Up"
    elseif r0_146.MoveDeltaY < -0.5 then
      r1_146 = "Gamepad_LeftStick_Down"
    end
  end
  return r1_146
end
function r5_0.OnAnalogValueChanged(r0_147, r1_147, r2_147)
  -- line: [2666, 2678] id: 147
  local r4_147 = UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_147))
  r0_147.MoveDeltaX = 0
  r0_147.MoveDeltaY = 0
  if r4_147 == "Gamepad_LeftX" then
    r0_147.MoveDeltaX = UKismetInputLibrary.GetAnalogValue(r2_147)
  elseif r4_147 == "Gamepad_LeftY" then
    r0_147.MoveDeltaY = UKismetInputLibrary.GetAnalogValue(r2_147)
  end
  r0_147:Handle_OnGamePadDown(r0_147:CheckLeftStickKeyName())
  return r0_147.Unhandle
end
function r5_0.OnKeyDown(r0_148, r1_148, r2_148)
  -- line: [2681, 2695] id: 148
  local r3_148 = false
  local r4_148 = UE4.UKismetInputLibrary.GetKey(r2_148)
  local r5_148 = UE4.UFormulaFunctionLibrary.Key_GetFName(r4_148)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r4_148) then
    r3_148 = r0_148:Handle_OnGamePadDown(r5_148)
  else
    r3_148 = r0_148:Handle_OnPCDown(r5_148)
  end
  if r3_148 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end
function r5_0.OnPreviewKeyDown(r0_149, r1_149, r2_149)
  -- line: [2697, 2725] id: 149
  local r3_149 = UE4.UKismetInputLibrary.GetKey(r2_149)
  local r4_149 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_149)
  local r5_149 = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_149) then
    if r4_149 == "Gamepad_DPad_Up" then
      if r0_149.IsInCd then
        return 
      else
        r0_149:CreateCDTimer()
      end
      return r0_149:SquadListMoveInGamePadWithDPad(true)
    elseif r4_149 == "Gamepad_DPad_Down" then
      if r0_149.IsInCd then
        return 
      else
        r0_149:CreateCDTimer()
      end
      return r0_149:SquadListMoveInGamePadWithDPad(false)
    end
  end
  if r5_149 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end
function r5_0.CreateCDTimer(r0_150)
  -- line: [2727, 2737] id: 150
  r0_150.IsInCd = true
  r0_150.CdTime = 1
  r0_150:AddTimer(0.1, function()
    -- line: [2730, 2736] id: 151
    r0_150.CdTime = r0_150.CdTime - 0.1
    if r0_150.CdTime < 0 then
      r0_150.IsInCd = false
      r0_150:RemoveTimer("CD")
    end
  end, true, 0, "CD", true)
end
function r5_0.OnFocusReceived(r0_152, r1_152, r2_152)
  -- line: [2739, 2749] id: 152
  r0_152:AddDelayFrameFunc(function()
    -- line: [2741, 2747] id: 153
    if r0_152.IsInEditor then
      r0_152:FocusOnRightDetailPanel()
    else
      r0_152:FocusOnSquadList()
    end
  end, 3, "DelayFocusSquadList")
  return true
end
function r5_0.ReceiveEnterState(r0_154, r1_154)
  -- line: [2751, 2767] id: 154
  r0_154.Super.ReceiveEnterState(r0_154, r1_154)
  if r0_154.IsInEditor then
    if r0_154.CurSlot and r0_154.CurType then
      r0_154:InitLeftListItemInfo()
      r0_154:SwitchToSelectItemList(r0_154.CurSlot, r0_154.CurType)
    else
      local r2_154 = {
        Id = r0_154.Roulette.Id and 1,
        Type = "Roulette",
        Owner = r0_154,
      }
      r0_154.Roulette:InitSlot(r2_154)
      r0_154:SwitchToRouletteList()
    end
  end
end
AssembleComponents(r5_0)
return r5_0
