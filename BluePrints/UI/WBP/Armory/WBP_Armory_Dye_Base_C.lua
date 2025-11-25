-- filename: @E:/Pack/Branch/OBT10_Geili\Content/Script/BluePrints\UI\WBP\Armory\WBP_Armory_Dye_Base_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local r1_0 = require("BluePrints.UI.WBP.Armory.ActorController.Armory_ActorController")
local r2_0 = require("EMCache.EMCache")
local r3_0 = Class()
function r3_0.Init(r0_1, r1_1)
  -- line: [14, 24] id: 1
  local r2_1 = r2_0:Get("DyeDraft", true) and {}
  local r3_1 = r1_1
  if type(r1_1) == "string" and CommonUtils.IsObjId(r1_1) then
    r3_1 = CommonUtils.ObjId2Str(r1_1)
  end
  r2_1[r3_1] = r2_1[r3_1] and {}
  rawset(r0_1, "AllCache", r2_1)
  rawset(r0_1, "Cache", r2_1[r3_1])
  return r0_1.Cache
end
function r3_0.GetSkinDyeDraft(r0_2, r1_2)
  -- line: [26, 29] id: 2
  r0_2.Cache[r1_2] = r0_2.Cache[r1_2] and {}
  return r0_2.Cache[r1_2]
end
function r3_0.SaveDyeDraft(r0_3)
  -- line: [31, 35] id: 3
  if rawget(r0_3, "AllCache") then
    r2_0:Set("DyeDraft", r0_3.AllCache, true)
  end
end
function r3_0.DeleteDyeDraft(r0_4, r1_4, r2_4)
  -- line: [37, 39] id: 4
  r0_4.Cache[r1_4][r2_4] = nil
end
function r3_0.GetDyeDraftPlan(r0_5, r1_5, r2_5)
  -- line: [41, 43] id: 5
  return r0_5:GetSkinDyeDraft(r1_5)[r2_5]
end
local r4_0 = Class("BluePrints.UI.BP_UIState_C")
r4_0._components = {
  "BluePrints.UI.WBP.Armory.MainComponent.Armory_PointerInputComponent"
}
function r4_0.Construct(r0_6)
  -- line: [51, 117] id: 6
  r0_6.IsLoaded = false
  r4_0.Super.Construct(r0_6)
  r0_6.Image_Click.OnMouseButtonDownEvent:Unbind()
  r0_6.Image_Click.OnMouseButtonDownEvent:Bind(r0_6, r0_6.On_Image_Click_MouseButtonDown)
  r0_6:UnbindAllFromAnimationFinished(r0_6.In)
  r0_6:UnbindAllFromAnimationFinished(r0_6.Out)
  r0_6:BindToAnimationFinished(r0_6.In, {
    r0_6,
    r0_6.OnInAnimFinished
  })
  r0_6:BindToAnimationFinished(r0_6.Out, {
    r0_6,
    r0_6.OnOutAnimFinished
  })
  r0_6:SetRenderOpacity(1)
  r0_6.Image_Click.Slot:SetZOrder(-1)
  r0_6.Panel_Cost:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_6.Text_Default:SetText(GText("UI_Dye_Default"))
  r0_6.Text_Default_1:SetText(GText("UI_Armory_Dye_Default"))
  r0_6.Text_Title_R:SetText(GText("UI_Dye_Total"))
  rawset(r0_6, "AllPlanNames", {
    "UI_Squad_Appearance_TITLE1",
    "UI_Squad_Appearance_TITLE2",
    "UI_Squad_Appearance_TITLE3"
  })
  r0_6.Btn_Done:BindEventOnClicked(r0_6, r0_6.OnDoneBtnClicked)
  r0_6.Btn_Done:BindForbidStateExecuteEvent(r0_6, r0_6.OnForbiddenDoneBtnClicked)
  r0_6.Btn_Save:BindEventOnClicked(r0_6, r0_6.OnSaveBtnClicked)
  r0_6.Btn_Save:BindForbidStateExecuteEvent(r0_6, r0_6.OnForbiddenSaveBtnClicked)
  r0_6.Btn_Share:BindEventOnClicked(r0_6, r0_6.OnShareBtnClicked)
  r0_6.Btn_PreviewSave:BindEventOnClicked(r0_6, r0_6.OnPreviewSaveBtnClicked)
  r0_6.Btn_Hide:BindEvents(r0_6, {
    OnClicked = r0_6.OnHideUIKeyDown,
    OnAddedToFocusPath = r0_6.OnFunctionBtnAddedToFocusPath,
    OnRemovedFromFocusPath = r0_6.OnFunctionBtnRemovedFromFocusPath,
  })
  r0_6.Btn_Hide.Text_Name:SetText(GText("UI_Dye_HideUI"))
  r0_6.Btn_Compare:BindEvents(r0_6, {
    OnPressed = r0_6.OnContrastKeyDown,
    OnReleased = r0_6.OnContrastKeyUp,
    OnAddedToFocusPath = r0_6.OnFunctionBtnAddedToFocusPath,
    OnRemovedFromFocusPath = r0_6.OnFunctionBtnRemovedFromFocusPath,
  })
  r0_6.Btn_Compare.Text_Name:SetText(GText("UI_Dye_Compare"))
  r0_6.Btn_Delete:BindEvents(r0_6, {
    OnClicked = r0_6.OnDeleteBtnClicked,
    OnAddedToFocusPath = r0_6.OnFunctionBtnAddedToFocusPath,
    OnRemovedFromFocusPath = r0_6.OnFunctionBtnRemovedFromFocusPath,
  })
  r0_6.Btn_Delete.Text_Name:SetText(GText("UI_RegionMap_Delete"))
  r0_6.Btn_Import:BindEvents(r0_6, {
    OnClicked = r0_6.OnImportBtnClicked,
    OnAddedToFocusPath = r0_6.OnFunctionBtnAddedToFocusPath,
    OnRemovedFromFocusPath = r0_6.OnFunctionBtnRemovedFromFocusPath,
  })
  r0_6.Btn_Import.Text_Name:SetText(GText("UI_Dye_Input_Title"))
  r0_6.List_Tab.BP_OnEntryInitialized:Clear()
  r0_6.List_Tab.BP_OnEntryInitialized:Add(r0_6, r0_6.OnNormalDyeTabInitialized)
  r0_6:AddDispatcher(EventID.OnWeaponColorsChanged, r0_6, r0_6.OnColorsChanged)
  r0_6:AddDispatcher(EventID.OnCharColorsChanged, r0_6, r0_6.OnColorsChanged)
  r0_6:AddDispatcher(EventID.OnResourcesChanged, r0_6, r0_6.OnResourcesChanged)
  r0_6:AddDispatcher(EventID.OnCharSkinColorPlanChanged, r0_6, r0_6.OnCharSkinColorPlanChanged)
  r0_6:AddDispatcher(EventID.OnWeaponSkinColorPlanChanged, r0_6, r0_6.OnWeaponSkinColorPlanChanged)
  rawset(r0_6, "NormalColorTabIdx", 1)
  rawset(r0_6, "SpecialColorTabIdx", 2)
  rawset(r0_6, "ColorPerRow", 3)
  rawset(r0_6, "SpecialColorContents", {})
  rawset(r0_6, "SpecialColorContentsMap", {})
  rawset(r0_6, "NormalDefaultColorContents", {})
  rawset(r0_6, "NormalCurrentContents", {})
  rawset(r0_6, "NormalComparedContents", {})
  rawset(r0_6, "ColorContents", {})
  rawset(r0_6, "ColorContentsMap", {})
  rawset(r0_6, "HighLightColor", r0_6.WPHighLightColor.Color)
  rawset(r0_6, "NeedRegenerateAllEntries", true)
  rawset(r0_6, "bCanSavePlan", true)
  rawset(r0_6, "bShowPlan", true)
  r0_6.Tab_Dye:Init(r0_6.TabConfig)
end
function r4_0.ReceiveEnterState(r0_7, r1_7)
  -- line: [119, 130] id: 7
  r4_0.Super.ReceiveEnterState(r0_7, r1_7)
  if r0_7.ActorController then
    if r0_7.UsingWeapon then
      r0_7.UsingWeapon = r0_7.ArmoryPlayer and r0_7.ArmoryPlayer.UsingWeapon
      if r0_7.SkinId then
        r0_7.UsingWeapon:InitWeaponSkin(r0_7.SkinId)
      end
    end
    r0_7:OnContrastKeyUp()
  end
end
function r4_0.Destruct(r0_8)
  -- line: [132, 135] id: 8
  r4_0.Super.Destruct(r0_8)
  r0_8.ActorController:StopSkinWeaponVFX()
end
function r4_0.On_Image_Click_MouseButtonDown(r0_9, r1_9, r2_9)
  -- line: [138, 140] id: 9
  return r0_9:OnPointerDown(r1_9, r2_9)
end
function r4_0.OnMouseWheel(r0_10, r1_10, r2_10)
  -- line: [142, 144] id: 10
  return r0_10:OnMouseWheelScroll(r1_10, r2_10)
end
function r4_0.OnMouseButtonUp(r0_11, r1_11, r2_11)
  -- line: [146, 148] id: 11
  return r0_11:OnPointerUp(r1_11, r2_11)
end
function r4_0.OnMouseMove(r0_12, r1_12, r2_12)
  -- line: [150, 152] id: 12
  return r0_12:OnPointerMove(r1_12, r2_12)
end
function r4_0.OnTouchEnded(r0_13, r1_13, r2_13)
  -- line: [154, 156] id: 13
  return r0_13:OnPointerUp(r1_13, r2_13)
end
function r4_0.OnTouchMoved(r0_14, r1_14, r2_14)
  -- line: [158, 160] id: 14
  return r0_14:OnPointerMove(r1_14, r2_14)
end
function r4_0.OnMouseCaptureLost(r0_15)
  -- line: [162, 164] id: 15
  r0_15:OnPointerCaptureLost()
end
function r4_0.OnBackgroundClicked(r0_16)
  -- line: [166, 170] id: 16
  if r0_16.bSelfHidden then
    r0_16:OnHideUIKeyDown()
  end
end
function r4_0.OnBackKeyDown(r0_17)
  -- line: [172, 190] id: 17
  if r0_17.bSelfHidden then
    r0_17:OnHideUIKeyDown()
  elseif r0_17.Btn_Save:IsBtnForbidden() or r0_17.OpenPreviewDyeFromChat then
    r0_17:PlayOutAnim()
  else
    UIManager(r0_17):ShowCommonPopupUI(100231, {
      LeftCallbackFunction = function()
        -- line: [180, 182] id: 18
        r0_17:PlayOutAnim()
      end,
      RightCallbackFunction = function()
        -- line: [183, 186] id: 19
        r0_17:SaveCurrentDraft()
        r0_17:PlayOutAnim()
      end,
    }, r0_17)
  end
end
function r4_0.OnDeleteBtnClicked(r0_20)
  -- line: [192, 205] id: 20
  UIManager(r0_20):ShowCommonPopupUI(100230, {
    RightCallbackFunction = function()
      -- line: [194, 203] id: 21
      r0_20:DeleteCurrentDraft()
      r0_20:UpdateComparedContentsByDraft()
      local r0_21 = r0_20.CurrentTabIdx
      r0_20.CurrentTabIdx = nil
      local r1_21 = r0_20.CurNormalDyeTab
      if r1_21 then
        r1_21 = r0_20.CurNormalDyeTab.Idx and 1
      else
        goto label_15	-- block#2 is visited secondly
      end
      r0_20.JumpToSubTabIdx = r1_21
      r0_20:SelectDyePlan(r0_20.CurrentPlan, r0_21)
      r0_20:OnContrastKeyUp()
    end,
  }, r0_20)
end
function r4_0.ClearComparedContents(r0_22)
  -- line: [207, 231] id: 22
  for r5_22, r6_22 in pairs(r0_22.NormalComparedContents) do
    r6_22.IsClicked = false
    if r6_22.Widget then
      r6_22.Widget:SetIsClicked(false)
    end
  end
  -- close: r1_22
  r0_22.NormalComparedContents = {}
  if r0_22.SpecialComparedContent then
    r0_22.SpecialComparedContent.IsClicked = false
    if r0_22.SpecialComparedContent.Widget then
      r0_22.SpecialComparedContent.Widget:SetIsClicked(false)
    end
    r0_22.SpecialComparedContent = nil
  end
  for r5_22, r6_22 in pairs(r0_22.NormalDyeTabs) do
    local r7_22 = r0_22.NormalCurrentContents[r5_22]
    r6_22.Color = r7_22.Color
    r6_22.Color = r7_22.ResourceId and r7_22.Color
    if r6_22.Widget then
      r6_22.Widget:SetColor(r7_22.ResourceId and r7_22.Color)
    end
    r6_22.IsSelected = r5_22 == (r0_22.CurNormalDyeTab and r0_22.CurNormalDyeTab.Idx)
  end
  -- close: r1_22
end
function r4_0.OnImportBtnClicked(r0_23)
  -- line: [233, 272] id: 23
  UIManager(r0_23):ShowCommonPopupUI(100232, {
    TextLenMax = 200,
    MultilineType = 1,
    HintText = GText("UI_Dye_Input_Content"),
    UseGenaral = true,
    RightCallbackFunction = function(r0_24, r1_24)
      -- line: [239, 270] id: 24
      local r2_24 = r1_24.ComDialogInput.Text
      if r2_24 and r2_24 ~= "" then
        local r4_24 = ModController:GetModel():AnalysisShareCommunityCopyCode(r2_24)
        local r5_24 = ""
        if not r4_24 then
          UIManager(r0_23):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Dye_Input_Invaluable"))
          return 
        end
        if r4_24.SkinId ~= r0_23.SkinId then
          local r6_24 = nil
          if r4_24.SkinType == "Char" then
            r6_24 = DataMgr.Skin[r4_24.SkinId].SkinName
          elseif DataMgr.WeaponSkin[r4_24.SkinId] then
            r6_24 = DataMgr.WeaponSkin[r4_24.SkinId].Name and DataMgr.Weapon[r4_24.SkinId].WeaponName
          else
            goto label_55	-- block#9 is visited secondly
          end
          UIManager(r0_23):ShowUITip(UIConst.Tip_CommonToast, string.format(GText("UI_Dye_Input_Other"), GText(r6_24)))
          return 
        end
        UIManager(r0_23):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Dye_Input_Success"))
        r0_23:ApplyColorsToComparedColors(r4_24.Colors)
        r0_23:ApplyColorsToNormalDyeTabs(r4_24.Colors)
        r0_23:SaveCurrentDraft()
        r0_23:UpdateItemConsume()
        r0_23:UpdateDraftBtn()
      end
    end,
  }, r0_23)
end
function r4_0.OnSaveBtnClicked(r0_25)
  -- line: [275, 278] id: 25
  r0_25:SaveCurrentDraft()
  UIManager(r0_25):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Dye_Save_Success"))
end
function r4_0.OnShareBtnClicked(r0_26)
  -- line: [280, 283] id: 26
  r0_26:OpenOrCloseDyeShareUI()
  r0_26:ShareCurrentDraft()
end
function r4_0.OpenOrCloseDyeShareUI(r0_27)
  -- line: [285, 295] id: 27
  if r0_27.DyeShare and r0_27.DyeShare:GetVisibility() == UIConst.VisibilityOp.Collapsed then
    r0_27.DyeShare:SetVisibility(UIConst.VisibilityOp.Visible)
    r0_27.DyeShare:InitUIInfo({
      Parent = r0_27,
      DyeDraftModel = r3_0,
    })
  elseif r0_27.DyeShare and r0_27.DyeShare:GetVisibility() == UIConst.VisibilityOp.Visible then
    r0_27.DyeShare:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r4_0.OnForbiddenSaveBtnClicked(r0_28)
  -- line: [297, 298] id: 28
end
function r4_0.InitUIInfo(r0_29, r1_29, r2_29, r3_29, r4_29)
  -- line: [302, 366] id: 29
  r4_0.Super.InitUIInfo(r0_29, r1_29, r2_29, r3_29, r4_29)
  local r5_29 = UIManager(r0_29):GetArmoryUIObj()
  if r5_29 then
    r0_29.ActorController = r5_29.ActorController
    r0_29.ArmoryHelper = r5_29.ActorController.ArmoryHelper
    r0_29.ArmoryPlayer = r5_29.ActorController.ArmoryPlayer
  end
  if not r4_29 then
    r4_29 = {}
  end
  r0_29.Parent = r4_29.Parent
  r0_29.SkinId = r4_29.SkinId
  r0_29.IsPreviewMode = r4_29.IsPreviewMode
  r0_29.Type = r4_29.Type
  r0_29.Target = r4_29.Target
  r0_29.OnCloseCallback = r4_29.OnCloseCallback
  r0_29.ContrastKeyDownCount = 0
  r0_29.CurrentTabIdx = nil
  r0_29.bRealCharOrWeapon = r4_29.bRealCharOrWeapon
  r0_29.OpenPreviewDyeFromShopItem = r4_29.OpenPreviewDyeFromShopItem
  r0_29.OpenPreviewDyeFromChat = r0_29.Parent.OpenPreviewDyeFromChat
  r0_29:StopAnimation(r0_29.SwitcherState)
  local r6_29 = GWorld:GetAvatar()
  r0_29.bOwnTargetSkin = false
  if r0_29.Target:GetSkin(r0_29.SkinId, r6_29) then
    r0_29.bOwnTargetSkin = true
  end
  if r0_29.Type == CommonConst.ArmoryType.Char then
    r0_29.DefaultColorId = DataMgr.GlobalConstant.CharDefaultColor.ConstantValue
    r0_29.ColorPartCount = DataMgr.GlobalConstant.CharColorPart.ConstantValue
    local r7_29 = r6_29.CommonChars[r0_29.Target.CharId]
    if r7_29 then
      r0_29.CurrentSkin = r7_29.OwnedSkins[r0_29.SkinId] and r0_29:CreateDefaultSkin(r0_29.SkinId)
    else
      r0_29.CurrentSkin = r0_29:CreateDefaultSkin(r0_29.SkinId)
    end
  else
    r0_29.DefaultColorId = DataMgr.GlobalConstant.WeaponDefaultColor.ConstantValue
    r0_29.ColorPartCount = DataMgr.GlobalConstant.WeaponColorPart.ConstantValue
    r0_29.UsingWeapon = r0_29.ArmoryPlayer and r0_29.ArmoryPlayer.UsingWeapon
    r0_29.WeaponEnhanceLevel = r0_29.Target.EnhanceLevel and 0
    r0_29.CurrentSkin = r0_29.Target:GetSkin(r0_29.SkinId) and r0_29:CreateDefaultSkin(r0_29.SkinId)
    r0_29:CreateSpecialDefaultColorMat()
    r0_29:CreateSpecialColorContents()
  end
  if not r0_29.ActorController then
    r0_29.ActorController = r0_29.Parent.ActorController
  end
  if r0_29.ActorController then
    r0_29.ArmoryHelper = r0_29.ActorController.ArmoryHelper
    r0_29.ArmoryHelper.EnableCameraScrolling = true
    r0_29.ArmoryPlayer = r0_29.ActorController.ArmoryPlayer
    local r7_29 = r0_29.ActorController:GetWeaponActor()
    if r7_29 == nil then
      r0_29.WaitForCreateActor = true
      r0_29.ActorController:GetWeaponActorAsync(r0_29.OnActorCreated, r0_29)
    else
      r0_29:OnActorCreated(r7_29)
    end
  end
end
function r4_0.OnActorCreated(r0_30, r1_30)
  -- line: [368, 386] id: 30
  r0_30.WaitForCreateActor = false
  r0_30.UsingWeapon = r1_30
  r0_30.bStandaloneWeapon = r0_30.ActorController.bStandaloneWeapon
  if not r0_30.bStandaloneWeapon then
    r0_30.bStandaloneWeapon = not r0_30.ActorController.ArmoryPlayer
  end
  r0_30.LastCameraTags = r0_30.ActorController.LastCameraTags
  if r0_30.Type == CommonConst.ArmoryType.Char then
    r0_30.ActorController:SetArmoryCameraTag("Char_Dye")
  elseif r0_30.Type == CommonConst.ArmoryType.Weapon and r0_30.ArmoryPlayer and not r0_30.bStandaloneWeapon then
    r0_30.ActorController:SetArmoryCameraTag("Weapon", "0", "Dye")
  elseif r0_30.Type ~= CommonConst.ArmoryType.Weapon then
    r0_30.ActorController:SetArmoryCameraTag("Default")
  end
  r0_30:InitUI()
  -- warn: not visited block [11]
  -- block#11:
  -- goto label_62
end
function r4_0.InitUI(r0_31)
  -- line: [388, 439] id: 31
  r0_31:CreateNormalDefaultColor()
  r0_31:CreateNormalColorContents()
  r0_31.Cache = r3_0:Init(r0_31.Target.Uuid)
  if not (function()
    -- line: [393, 402] id: 32
    if not r0_31.Cache then
      return false
    elseif not r0_31.Cache[r0_31.SkinId] then
      return false
    elseif #r0_31.Cache[r0_31.SkinId] <= 0 then
      return false
    end
    return true
  end)() then
    r0_31.Cache = r3_0:Init(r0_31.SkinId)
  end
  r0_31.CurrentPlan = r0_31.CurrentSkin.CurrentPlanIndex and 1
  local r2_31 = false
  if r0_31.OpenPreviewDyeFromShopItem then
    r0_31.Btn_PreviewSave:SetText(GText("UI_SkinPreview_PreSave"))
    r0_31.Btn_PreviewSave:ForbidBtn(true)
  elseif r0_31.OpenPreviewDyeFromChat then
    r0_31.OpenPreviewDyeFromChatColors = r0_31.Parent.OpenPreviewDyeFromChatColors
    r0_31.Btn_PreviewSave:SetText(GText("UI_Dye_Input_Title"))
    r0_31.Btn_PreviewSave:ForbidBtn(false)
  end
  if r0_31.OpenPreviewDyeFromChatColors then
    r0_31:ApplyColorsToComparedColors(r0_31.OpenPreviewDyeFromChatColors)
    r2_31 = true
  else
    r2_31 = r0_31:UpdateComparedContentsByDraft()
    if r2_31 then
      UIManager(r0_31):ShowUITip(UIConst.Tip_CommonToast, string.format(GText("UI_Armory_Dye_Toast"), r0_31.CurrentPlan))
    end
  end
  r0_31:SelectDyePlan(r0_31.CurrentPlan, r0_31.JumpToTabIdx)
  r0_31:ResetPlanName()
  r0_31:UpdateDraftBtn()
  if r2_31 then
    r0_31:OnContrastKeyUp()
  end
  r0_31:PlayInAnim()
end
function r4_0.ApplyColorsToComparedColors(r0_33, r1_33)
  -- line: [441, 466] id: 33
  for r6_33, r7_33 in ipairs(r1_33) do
    local r8_33 = nil
    if tonumber(r7_33) ~= -1 then
      r8_33 = r0_33.ColorContentsMap[tonumber(r7_33)]
    else
      r8_33 = r0_33.NormalDefaultColorContents[r6_33]
    end
    if r8_33 then
      r0_33:ChangePartColor(r6_33, r8_33.Color)
      local r9_33 = r0_33.NormalComparedContents[r6_33]
      if r9_33 and r9_33 ~= r8_33 then
        r9_33.IsClicked = false
        if r9_33.Widget then
          r9_33.Widget:SetIsClicked(r9_33.IsClicked)
        end
      end
      local r10_33 = r0_33.CurNormalDyeTab
      if r10_33 then
        r10_33 = r0_33.CurNormalDyeTab.Idx and 1
      else
        goto label_45	-- block#11 is visited secondly
      end
      r8_33.IsClicked = r10_33 == r6_33
      if r8_33.Widget then
        r8_33.Widget:SetIsClicked(r8_33.IsClicked)
      end
      r0_33.NormalComparedContents[r6_33] = r8_33
    end
  end
  -- close: r2_33
end
function r4_0.ApplyColorsToNormalDyeTabs(r0_34, r1_34)
  -- line: [468, 490] id: 34
  for r7_34, r8_34 in pairs(r0_34.List_Tab:GetListItems()) do
    if r1_34[r7_34] then
      local r9_34 = nil
      if tonumber(r1_34[r7_34]) ~= -1 then
        r9_34 = r0_34.ColorContentsMap[tonumber(r1_34[r7_34])]
        r8_34.Color = r9_34.Color
      else
        r9_34 = r0_34.NormalDefaultColorContents[r7_34]
        r8_34.Color = nil
      end
      if r9_34 and r8_34.Widget then
        r8_34.Widget:SetColor(r8_34.Color)
      end
    end
  end
  -- close: r3_34
end
function r4_0.SelectDyePlan(r0_35, r1_35, r2_35)
  -- line: [492, 515] id: 35
  r0_35.CurrentPlan = r1_35
  if not r2_35 then
    r2_35 = 1
  end
  r0_35:OnDyeingTypeTabClicked({
    Idx = r2_35,
  })
  if r0_35.Type == CommonConst.ArmoryType.Char then
    r0_35.Panel_SubTab:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    r0_35.Panel_SubTab:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  r0_35:UpdateItemConsume()
end
function r4_0.ResetPlanName(r0_36)
  -- line: [518, 534] id: 36
  if r0_36.bShowPlan then
    r0_36.Plan_Dye:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    r0_36.Plan_Dye:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return 
  end
  local r2_36 = {
    Owner = r0_36,
    OnPlanChanged = r0_36.SwitchColorPlan,
    PlanNames = r0_36:GetPlanNames(),
    SelectedItemIndex = r0_36.CurrentPlan,
  }
  r0_36:OnModifyPlanParams(r2_36)
  r0_36.Plan_Dye:Init(r2_36)
end
function r4_0.OnModifyPlanParams(r0_37, r1_37)
  -- line: [536, 538] id: 37
end
function r4_0.GetPlanNames(r0_38)
  -- line: [540, 542] id: 38
  return r0_38.AllPlanNames
end
function r4_0.SwitchColorPlan(r0_39, r1_39)
  -- line: [545, 575] id: 39
  if r1_39 == r0_39.CurrentPlan then
    return 
  end
  local function r2_39()
    -- line: [549, 557] id: 40
    r0_39:BlockAllUIInput(true)
    local r0_40 = GWorld:GetAvatar()
    if r0_39.Type == CommonConst.ArmoryType.Char then
      r0_40:SwitchCurrentCharSkinColorPlan(r0_39.CurrentSkin.SkinId, r1_39)
    else
      r0_40:SwitchCurrentWeaponSkinColorPlan(r0_39.Target.Uuid, r0_39.CurrentSkin.SkinId, r1_39)
    end
  end
  if r0_39.Btn_Save:IsBtnForbidden() or r0_39.OpenPreviewDyeFromChat then
    r2_39()
  else
    UIManager(r0_39):ShowCommonPopupUI(100231, {
      OnCloseCallbackFunction = function()
        -- line: [563, 565] id: 41
        r0_39:ResetPlanName()
      end,
      LeftCallbackFunction = function()
        -- line: [566, 568] id: 42
        r2_39()
      end,
      RightCallbackFunction = function()
        -- line: [569, 572] id: 43
        r0_39:SaveCurrentDraft()
        r2_39()
      end,
    }, r0_39)
  end
end
function r4_0.UpdateComparedContentsByDraft(r0_44)
  -- line: [579, 620] id: 44
  local r1_44 = r3_0:GetDyeDraftPlan(r0_44.CurrentSkin.SkinId, r0_44.CurrentPlan) and {}
  local r2_44 = false
  if r0_44.SpecialComparedContent then
    r0_44.SpecialComparedContent.IsClicked = false
    r0_44.SpecialComparedContent = nil
  end
  if r0_44.NormalComparedContents then
    for r7_44, r8_44 in pairs(r0_44.NormalComparedContents) do
      r8_44.IsClicked = false
    end
    -- close: r3_44
    r0_44.NormalComparedContents = {}
  end
  if r1_44.SpecialColor then
    r0_44.SpecialComparedContent = r0_44.SpecialColorContentsMap[r1_44.SpecialColor]
    if r0_44.SpecialComparedContent then
      r0_44.JumpToTabIdx = r0_44.SpecialColorTabIdx
      r2_44 = r0_44.CurrentSkin:GetSpecialColor(r0_44.CurrentPlan) ~= r1_44.SpecialColor
    end
  else
    r0_44.JumpToTabIdx = r0_44.NormalColorTabIdx
    local r3_44 = false
    for r8_44, r9_44 in pairs(r1_44) do
      if r0_44.ColorContentsMap[r9_44] then
        r0_44.NormalComparedContents[r8_44] = r0_44.ColorContentsMap[r9_44]
        r3_44 = true
      end
    end
    -- close: r4_44
    if r3_44 then
      local r4_44 = r0_44.CurrentSkin:GetColors(r0_44.CurrentPlan)
      for r9_44, r10_44 in pairs(r1_44) do
        if (r4_44[r9_44] and r0_44.DefaultColorId) ~= r10_44 then
          r2_44 = true
          break
        end
      end
      -- close: r5_44
    end
  end
  return r2_44
end
function r4_0.UpdateDraftBtn(r0_45)
  -- line: [623, 638] id: 45
  if r3_0:GetDyeDraftPlan(r0_45.CurrentSkin.SkinId, r0_45.CurrentPlan) then
    r0_45.Btn_Delete:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r0_45.Btn_Delete:SetForbidden(false)
  else
    r0_45.Btn_Delete:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    r0_45.Btn_Delete:SetForbidden(true)
  end
  if r0_45.Btn_Compare.IsForbidden or r0_45:IsSameDyeDraft() then
    r0_45.Btn_Save:ForbidBtn(true)
  else
    r0_45.Btn_Save:ForbidBtn(false)
  end
  r0_45:UpdatePreviewOrNotUI()
end
function r4_0.SaveCurrentDraft(r0_46)
  -- line: [641, 655] id: 46
  local r1_46 = r3_0:GetSkinDyeDraft(r0_46.CurrentSkin.SkinId)
  local r2_46 = r1_46[r0_46.CurrentPlan] and {}
  if r0_46.CurrentTabIdx == r0_46.NormalColorTabIdx then
    for r7_46, r8_46 in pairs(r0_46.NormalComparedContents) do
      r2_46[r7_46] = r8_46.ColorId
    end
    -- close: r3_46
  else
    r2_46.SpecialColor = r0_46.SpecialComparedContent and r0_46.SpecialComparedContent.ColorId
  end
  r1_46[r0_46.CurrentPlan] = r2_46
  r3_0:SaveDyeDraft()
  r0_46:UpdateCurrentDyeTabSaveOrSelect()
  r0_46:UpdateDraftBtn()
end
function r4_0.UpdatePreviewOrNotUI(r0_47)
  -- line: [658, 684] id: 47
  local r1_47 = UIConst.VisibilityOp.Collapsed
  if not r0_47.IsPreviewMode then
    r1_47 = UIConst.VisibilityOp.Visible
    r0_47.WidgetSwitcher_Preview:SetActiveWidgetIndex(0)
  else
    r0_47.WidgetSwitcher_Preview:SetActiveWidgetIndex(1)
  end
  local function r2_47(r0_48, r1_48)
    -- line: [666, 670] id: 48
    if r0_48 and r0_48:GetVisibility() ~= r1_48 then
      r0_48:SetVisibility(r1_48)
    end
  end
  r2_47(r0_47.Btn_Share, r1_47)
  r2_47(r0_47.Btn_Import, r1_47)
  r2_47(r0_47.Btn_Save, r1_47)
  if r0_47.IsPreviewMode then
    r2_47(r0_47.Btn_Delete, r1_47)
    r2_47(r0_47.Panel_Cost, r1_47)
  end
  r2_47(r0_47.DyeSharePanel, r1_47)
  if not r0_47.IsPreviewMode or r0_47.OpenPreviewDyeFromShopItem then
    r2_47(r0_47.Panel_Plan, r1_47)
  elseif r0_47.OpenPreviewDyeFromChat then
    r2_47(r0_47.Panel_Plan, UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end
function r4_0.DeleteCurrentDraft(r0_49)
  -- line: [686, 689] id: 49
  r3_0:DeleteDyeDraft(r0_49.CurrentSkin.SkinId, r0_49.CurrentPlan)
  r0_49:UpdateDraftBtn()
end
function r4_0.ShareCurrentDraft(r0_50)
  -- line: [691, 704] id: 50
end
function r4_0.ImportDraft(r0_51, r1_51)
  -- line: [706, 721] id: 51
  if r0_51.IsPreviewMode and r0_51.OpenPreviewDyeFromChat then
    if not r0_51:HasRealTargetAndSkin() then
      return 
    end
    UIManager(r0_51):ShowCommonPopupUI(100231, {
      ShortText = GText("UI_Dye_Save_Content"),
      RightCallbackFunction = function()
        -- line: [711, 714] id: 52
        r0_51:SaveCurrentDraft()
        r0_51:UpdatePreviewOrNotUI()
      end,
      Title = GText("UI_Dye_Save_Title"),
    }, r0_51)
  elseif not r0_51.IsPreviewMode then
    r0_51:SaveCurrentDraft()
    r0_51:UpdatePreviewOrNotUI()
  end
end
function r4_0.HasRealTargetAndSkin(r0_53)
  -- line: [723, 740] id: 53
  local r1_53 = ""
  if r0_53.bRealCharOrWeapon then
    if r0_53.bOwnTargetSkin then
      return true
    else
      r1_53 = "UI_Dye_Input_NoSkin"
    end
  elseif r0_53.Type == CommonConst.ArmoryType.Char then
    r1_53 = "UI_Dye_Input_NoChar"
  elseif r0_53.Type == CommonConst.ArmoryType.Weapon then
    r1_53 = "UI_Dye_Input_NoWeapon"
  end
  UIManager(r0_53):ShowUITip(UIConst.Tip_CommonToast, GText(r1_53))
  return false
end
function r4_0.CreateDefaultSkin(r0_54, r1_54)
  -- line: [746, 762] id: 54
  local r2_54 = {
    SkinId = r1_54,
    Colors = {},
    SpecialColor = r0_54.DefaultColorId,
    GetColors = function(r0_55, r1_55)
      -- line: [751, 753] id: 55
      return r0_55.Colors
    end,
    GetWeaponSpecialColor = function(r0_56, r1_56)
      -- line: [754, 756] id: 56
      return r0_56.SpecialColor
    end,
  }
  for r6_54 = 1, r0_54.ColorPartCount, 1 do
    r2_54.Colors[r6_54] = r0_54.DefaultColorId
  end
  return r2_54
end
function r4_0.OnLoaded(r0_57, ...)
  -- line: [764, 767] id: 57
  r4_0.Super.OnLoaded(r0_57, ...)
  r0_57.IsLoaded = true
end
function r4_0.OnDyeingTypeTabClicked(r0_58, r1_58)
  -- line: [770, 788] id: 58
  if r1_58.Idx == r0_58.CurrentTabIdx then
    return 
  end
  if r1_58.Idx == r0_58.NormalColorTabIdx then
    if r0_58:IsAnimationPlaying(r0_58.SwitcherState) then
      r0_58:PlayAnimationReverse(r0_58.SwitcherState)
    else
      r0_58:PlayAnimation(r0_58.SwitcherState, 0, 1, 1)
    end
  elseif r0_58:IsAnimationPlaying(r0_58.SwitcherState) then
    r0_58:PlayAnimationForward(r0_58.SwitcherState)
  else
    r0_58:PlayAnimation(r0_58.SwitcherState)
  end
  r0_58:SelectDyeingTypeTab(r1_58.Idx)
end
function r4_0.SelectDyeingTypeTab(r0_59, r1_59)
  -- line: [790, 803] id: 59
  r0_59:RecoverActorColor()
  r0_59.CurrentTabIdx = r1_59
  if r0_59.CurrentTabIdx == r0_59.NormalColorTabIdx then
    r0_59:ClearSpecialColorStates()
    r0_59.WidgetSwitcher_State:SetActiveWidgetIndex(0)
    r0_59:InitNormalDyeing(r0_59.JumpToSubTabIdx)
    r0_59.JumpToSubTabIdx = nil
  else
    r0_59:ClearNormalColorStates()
    r0_59.WidgetSwitcher_State:SetActiveWidgetIndex(1)
    r0_59:InitSpecialDyeing()
  end
end
function r4_0.OnColorListItemClicked(r0_60, r1_60)
  -- line: [805, 831] id: 60
  AudioManager(r0_60):PlayUISound(r0_60, "event:/ui/common/click_btn_color", nil, nil)
  if r0_60.Parent and r0_60.OpenPreviewDyeFromChat then
    UIManager(r0_60):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Dye_Previewing"))
    if r1_60.Widget then
      r1_60.Widget.OpenPreviewDyeFromChat = true
    end
    return 
  end
  if r0_60.CurrentTabIdx == r0_60.NormalColorTabIdx then
    if not r0_60.NormalColorHoveredContent then
      r0_60:OnNormalColorListItemHovered(r1_60)
    end
    r0_60:OnNormalColorListItemClicked(r1_60)
    r0_60.NormalColorHoveredContent = nil
  else
    if not r0_60.SpecialColorHoveredContent then
      r0_60:OnSpecialColorListItemHovered(r1_60)
    end
    r0_60:OnSpecialColorListItemClicked(r1_60)
    r0_60.SpecialColorHoveredContent = nil
  end
  if r0_60.OpenPreviewDyeFromShopItem then
    r0_60.Btn_PreviewSave:ForbidBtn(false)
  end
end
function r4_0.OnColorListItemHovered(r0_61, r1_61)
  -- line: [833, 839] id: 61
  if r0_61.CurrentTabIdx == r0_61.NormalColorTabIdx then
    r0_61:OnNormalColorListItemHovered(r1_61)
  else
    r0_61:OnSpecialColorListItemHovered(r1_61)
  end
end
function r4_0.OnColorListItemUnhovered(r0_62, r1_62)
  -- line: [841, 847] id: 62
  if r0_62.CurrentTabIdx == r0_62.NormalColorTabIdx then
    r0_62:OnNormalColorListItemUnhovered(r1_62)
  else
    r0_62:OnSpecialColorListItemUnhovered(r1_62)
  end
end
function r4_0.CreateNormalColorContents(r0_63)
  -- line: [852, 925] id: 63
  r0_63.BP_NormalColorContents:Clear()
  local r1_63 = DataMgr.Swatch
  rawset(r0_63, "ColorContents", {})
  rawset(r0_63, "ColorContentsMap", {})
  rawset(r0_63, "NormalColorHoveredContent", nil)
  for r6_63, r7_63 in pairs(r1_63) do
    local r8_63 = {
      ColorId = r6_63,
      Fresnel = r7_63.Fresnel,
    }
    local r9_63 = r7_63.ColorNumber and {}
    r8_63.Color = FLinearColor()
    local r10_63 = UKismetMathLibrary.LinearColor_SetFromSRGB
    local r11_63 = r8_63.Color
    local r12_63 = FColor
    local r13_63 = r9_63[1] and 0
    local r14_63 = r9_63[2] and 0
    r10_63(r11_63, r12_63(r13_63, r14_63, r9_63[3] and 0))
    if r7_63.ActualR and r7_63.ActualG and r7_63.ActualB then
      r8_63.ActualColor = FLinearColor(r7_63.ActualR, r7_63.ActualG, r7_63.ActualB)
    else
      r8_63.ActualColor = r8_63.Color
    end
    r8_63.ResourceId = r7_63.ResourceID
    r8_63.Event_OnClicked = r0_63.OnColorListItemClicked
    r8_63.Event_OnHovered = r0_63.OnColorListItemHovered
    r8_63.Event_OnUnhovered = r0_63.OnColorListItemUnhovered
    r8_63.Owner = r0_63
    table.insert(r0_63.ColorContents, r8_63)
    r0_63.ColorContentsMap[r8_63.ColorId] = r8_63
  end
  -- close: r2_63
  table.sort(r0_63.ColorContents, function(r0_64, r1_64)
    -- line: [879, 881] id: 64
    return r0_64.ColorId < r1_64.ColorId
  end)
  local r2_63 = nil
  rawset(r0_63, "ListContents", {})
  for r7_63, r8_63 in ipairs(r0_63.ColorContents) do
    if r7_63 % r0_63.ColorPerRow == 1 then
      r2_63 = NewObject(UIUtils.GetCommonItemContentClass())
      r2_63.Owner = r0_63
      r2_63.ColorContents = {}
      r0_63.BP_NormalColorContents:Add(r2_63)
      table.insert(r0_63.ListContents, r2_63)
      r0_63:OnNormalColorListContentCreated(r2_63)
    end
    r8_63.ListContent = r2_63
    r8_63.Idx = r7_63
    table.insert(r2_63.ColorContents, r8_63)
  end
  -- close: r3_63
  for r7_63, r8_63 in ipairs(r0_63.ColorContents) do
    r0_63:OnNormalColorContentCreated(r8_63)
  end
  -- close: r3_63
  rawset(r0_63, "NormalDefaultColorContents", {})
  rawset(r0_63, "NormalCurrentContents", {})
  rawset(r0_63, "NormalComparedContents", {})
  local r3_63 = r0_63.CurrentSkin:GetColors(r0_63.CurrentPlan)
  for r7_63 = 1, r0_63.ColorPartCount, 1 do
    local r8_63 = r3_63[r7_63] and r0_63.DefaultColorId
    local r9_63, r10_63 = r0_63:GetDefaultColor(r7_63)
    local r11_63 = {
      ColorId = r0_63.DefaultColorId,
      Owner = r0_63,
      Color = r9_63,
      ActualColor = r9_63,
      Fresnel = r10_63,
      Event_OnClicked = r0_63.OnColorListItemClicked,
      Event_OnHovered = r0_63.OnColorListItemHovered,
      Event_OnUnhovered = r0_63.OnColorListItemUnhovered,
    }
    if r8_63 == r0_63.DefaultColorId then
      r0_63.NormalCurrentContents[r7_63] = r0_63.NormalDefaultColorContents[r7_63]
    else
      r0_63.NormalCurrentContents[r7_63] = r0_63.ColorContentsMap[r8_63]
    end
    table.insert(r0_63.NormalDefaultColorContents, r11_63)
    r0_63:OnNormalColorContentCreated(r11_63)
  end
end
function r4_0.InitNormalDyeing(r0_65, r1_65)
  -- line: [928, 935] id: 65
  r0_65:ResetNormalCurrentContens()
  r0_65:InitNormalDyeTabs(r1_65)
  r0_65.CurNormalDyeTab = nil
  r0_65:OnNormalDyeTabInit(r0_65.NormalDyeTabs[r1_65] and r0_65.NormalDyeTabs[1])
  r0_65:UpdateItemConsume()
end
function r4_0.ClearNormalColorStates(r0_66)
  -- line: [937, 947] id: 66
  r0_66.NormalComparedContents = {}
  for r5_66, r6_66 in ipairs(r0_66.NormalDefaultColorContents) do
    r6_66.IsSelected = false
    r6_66.IsClicked = false
  end
  -- close: r1_66
  for r5_66, r6_66 in ipairs(r0_66.ColorContents) do
    r6_66.IsSelected = false
    r6_66.IsClicked = false
  end
  -- close: r1_66
end
function r4_0.ResetNormalCurrentContens(r0_67)
  -- line: [949, 960] id: 67
  r0_67.NormalCurrentContents = {}
  local r1_67 = r0_67.CurrentSkin:GetColors(r0_67.CurrentPlan)
  for r5_67 = 1, r0_67.ColorPartCount, 1 do
    local r6_67 = r1_67[r5_67] and r0_67.DefaultColorId
    if r6_67 == r0_67.DefaultColorId then
      r0_67.NormalCurrentContents[r5_67] = r0_67.NormalDefaultColorContents[r5_67]
    else
      r0_67.NormalCurrentContents[r5_67] = r0_67.ColorContentsMap[r6_67] and r0_67.NormalDefaultColorContents[r5_67]
    end
  end
end
function r4_0.CreateNormalDefaultColor(r0_68)
  -- line: [962, 972] id: 68
  if r0_68.Type == CommonConst.ArmoryType.Char then
    r0_68.DefaultColors = {
      r0_68:GetCharDefaultColorsFromDataTable(r0_68.ArmoryPlayer)
    }
    r0_68.DefaultFresnel = {
      [8] = r0_68.DefaultColors[#r0_68.DefaultColors],
    }
    r0_68.DefaultColors[9] = r0_68.ArmoryPlayer.CharacterFashion:GetEffectColor()
  else
    r0_68.DefaultColors = {
      r0_68:GetWeaponDefaultColorsFromDataTable(r0_68.UsingWeapon)
    }
    r0_68.DefaultFresnel = {}
  end
end
function r4_0.GetDefaultColor(r0_69, r1_69)
  -- line: [974, 980] id: 69
  if r0_69.DefaultColors[r1_69] then
    return r0_69.DefaultColors[r1_69], r0_69.DefaultFresnel[r1_69]
  else
    return FLinearColor()
  end
end
function r4_0.InitNormalDyeTabs(r0_70, r1_70)
  -- line: [983, 1016] id: 70
  r0_70.NormalDyeTabs = {}
  local r2_70 = DataMgr.Swatch
  r0_70.List_Tab:ClearListItems()
  local r3_70 = nil
  if r0_70.NormalComparedContents and next(r0_70.NormalComparedContents) then
    r3_70 = {}
    for r8_70, r9_70 in pairs(r0_70.NormalComparedContents) do
      r3_70[r8_70] = r9_70.ColorId
    end
    -- close: r4_70
  else
    r3_70 = r0_70.CurrentSkin:GetColors(r0_70.CurrentPlan)
  end
  for r7_70 = 1, r0_70.ColorPartCount, 1 do
    local r9_70 = r2_70[r3_70[r7_70]] and r9_70.ColorNumber
    local r10_70 = nil
    if r9_70 then
      r10_70 = FLinearColor()
      local r11_70 = UKismetMathLibrary.LinearColor_SetFromSRGB
      local r12_70 = r10_70
      local r13_70 = FColor
      local r14_70 = r9_70[1] and 0
      local r15_70 = r9_70[2] and 0
      r11_70(r12_70, r13_70(r14_70, r15_70, r9_70[3] and 0))
    end
    local r11_70 = NewObject(UIUtils.GetCommonItemContentClass())
    r11_70.Owner = r0_70
    r11_70.Text = r7_70
    r11_70.Color = r10_70
    r11_70.Idx = r7_70
    r11_70.IsSelected = r7_70 == (r1_70 and 1)
    table.insert(r0_70.NormalDyeTabs, r11_70)
    r0_70:OnNoramlDyeTabContentCreated(r11_70)
    r0_70.List_Tab:AddItem(r11_70)
  end
end
function r4_0.OnNoramlDyeTabContentCreated(r0_71, r1_71)
  -- line: [1018, 1019] id: 71
end
function r4_0.OnNormalDyeTabInitialized(r0_72, r1_72, r2_72)
  -- line: [1021, 1026] id: 72
  if IsValid(r2_72) then
    r2_72:BindEventOnClicked(r0_72, r0_72.OnNormalDyeTabClicked)
  end
end
function r4_0.OnNormalColorListItemClicked(r0_73, r1_73)
  -- line: [1029, 1031] id: 73
  r0_73:NormalColorClickLogic(r1_73)
end
function r4_0.NormalColorClickLogic(r0_74, r1_74)
  -- line: [1033, 1054] id: 74
  local r2_74 = r0_74.CurNormalDyeTab.Idx
  local r3_74 = r0_74.NormalComparedContents[r2_74]
  if r1_74 and r1_74 == r3_74 then
    return 
  end
  if r3_74 then
    r3_74.IsClicked = false
    if r3_74.Widget then
      r3_74.Widget:SetIsClicked(false)
    end
  end
  r0_74.NormalComparedContents[r2_74] = r1_74
  r0_74:UpdateItemConsume()
  r0_74.CurNormalDyeTab.Color = r1_74.ResourceId and r1_74.Color
  if r0_74.CurNormalDyeTab.Widget then
    r0_74.CurNormalDyeTab.Widget:SetColor(r1_74.ResourceId and r1_74.Color)
  end
  if r2_74 == 9 then
    r0_74.ActorController:ChangeSkinWeaponVFXColor(r1_74.Color)
  end
end
function r4_0.OnNormalColorListItemHovered(r0_75, r1_75)
  -- line: [1056, 1063] id: 75
  r0_75.NormalColorHoveredContent = r1_75
  if r0_75.bContrastKeyDown then
    return 
  end
  AudioManager(r0_75):PlayUISound(r0_75, "event:/ui/common/color_change", nil, nil)
  r0_75:NormalColorHoverLogic(r1_75)
end
function r4_0.NormalColorHoverLogic(r0_76, r1_76)
  -- line: [1065, 1078] id: 76
  if r0_76.WaitForCreateActor then
    return 
  end
  if r0_76.CurrentSkin:GetWeaponSpecialColor(r0_76.CurrentPlan) ~= r0_76.DefaultColorId and not next(r0_76.NormalComparedContents) and r0_76.SpecialDefaultContent then
    r0_76:ChangeSpecialColor(r0_76.SpecialDefaultContent)
  end
  r0_76:ChangePartColor(r0_76.CurNormalDyeTab.Idx, r1_76.ActualColor, r1_76.Fresnel)
  if r0_76.CurNormalDyeTab.Idx == 9 then
    r0_76.ActorController:ChangeSkinWeaponVFXColor(r1_76.Color)
  end
end
function r4_0.OnNormalColorListItemUnhovered(r0_77)
  -- line: [1080, 1100] id: 77
  if r0_77.WaitForCreateActor then
    return 
  end
  r0_77.NormalColorHoveredContent = nil
  if r0_77.bContrastKeyDown then
    return 
  end
  local r1_77 = r0_77.CurNormalDyeTab.Idx
  local r2_77 = r0_77.NormalComparedContents[r1_77] and r0_77.NormalCurrentContents[r1_77]
  if r0_77.CurNormalDyeTab.Idx == 9 then
    r0_77.ActorController:ChangeSkinWeaponVFXColor(r2_77.Color)
  end
  if not next(r0_77.NormalComparedContents) and r0_77.CurrentSkin:GetWeaponSpecialColor(r0_77.CurrentPlan) ~= r0_77.DefaultColorId and r0_77.SpecialCurrentContent then
    r0_77:ChangeSpecialColor(r0_77.SpecialCurrentContent)
  else
    r0_77:ChangePartColor(r1_77, r2_77.ActualColor, r2_77.Fresnel)
  end
end
function r4_0.OnNormalDyeTabClicked(r0_78, r1_78)
  -- line: [1103, 1106] id: 78
  AudioManager(r0_78):PlayUISound(r0_78, "event:/ui/common/click_level_03", nil, nil)
  r0_78:OnNormalDyeTabInit(r1_78)
end
function r4_0.OnNormalDyeTabInit(r0_79, r1_79)
  -- line: [1108, 1195] id: 79
  if r1_79 and r1_79 == r0_79.CurNormalDyeTab then
    return 
  end
  if r1_79.Idx == 9 then
    r0_79.ActorController:SkinWeaponVFX(r1_79.Color and r0_79.DefaultColors[9])
  else
    r0_79.ActorController:StopSkinWeaponVFX()
  end
  r0_79.NormalDefaultContent = r0_79.NormalDefaultColorContents[r1_79.Idx]
  if r0_79.CurNormalDyeTab then
    r0_79.CurNormalDyeTab.IsSelected = false
    if r0_79.CurNormalDyeTab.Widget then
      r0_79.CurNormalDyeTab.Widget:OnUnclicked()
    end
  end
  r1_79.IsSelected = true
  r0_79.EMList_Normal:ScrollToTop()
  r0_79.CurNormalDyeTab = r1_79
  local r2_79 = r1_79.Idx
  local r3_79 = r0_79.NormalCurrentContents[r2_79]
  local r4_79 = r0_79.NormalComparedContents[r2_79]
  local r5_79 = r3_0:GetDyeDraftPlan(r0_79.CurrentSkin.SkinId, r0_79.CurrentPlan) and {}
  for r10_79, r11_79 in ipairs(r0_79.ColorContents) do
    r11_79.IsSelected = r3_79 == r11_79
    r11_79.IsClicked = r4_79 == r11_79
    r11_79.IsSaveInDraft = r5_79[r2_79] == r11_79.ColorId
    if r11_79.IsSaveInDraft then
      r0_79.CurrentDyeTabDraftContent = r11_79
    end
  end
  -- close: r6_79
  r0_79.NormalDefaultContent.IsSelected = r0_79.NormalDefaultContent == r3_79
  r0_79.NormalDefaultContent.IsClicked = r0_79.NormalDefaultContent == r4_79
  r0_79.ColorLump_Default:OnListItemObjectSet(r0_79.NormalDefaultContent)
  local r6_79 = nil
  if r0_79.Type == CommonConst.ArmoryType.Char then
    r6_79 = (DataMgr.DyePart[r2_79] and {}).ColorID
  else
    local r7_79 = r4_79 and r3_79
    r0_79:ChangePartColor(r2_79, r7_79.ActualColor, r7_79.Fresnel)
    r0_79:StartWeaponPartHighLight(r7_79.ActualColor, r2_79)
  end
  r0_79.EMList_Normal:ClearListItems()
  local r7_79 = {}
  if r6_79 then
    for r12_79, r13_79 in ipairs(r6_79) do
      local r14_79 = r0_79.ColorContentsMap[r13_79]
      if r14_79 and not r7_79[r14_79.ListContent] then
        r14_79.ListContent.bPreviewMode = r0_79.IsPreviewMode
        r0_79.EMList_Normal:AddItem(r14_79.ListContent)
        r7_79[r14_79.ListContent] = true
        r14_79.ListContent.OnlyShowColor = {}
      end
      table.insert(r14_79.ListContent.OnlyShowColor, r14_79)
    end
    -- close: r8_79
  else
    for r12_79, r13_79 in ipairs(r0_79.ColorContents) do
      if r13_79 and not r7_79[r13_79.ListContent] then
        r13_79.ListContent.bPreviewMode = r0_79.IsPreviewMode
        r0_79.EMList_Normal:AddItem(r13_79.ListContent)
        r7_79[r13_79.ListContent] = true
        r13_79.ListContent.OnlyShowColor = nil
      end
    end
    -- close: r8_79
  end
  if r0_79.IsPreviewMode then
    r0_79.TabConfig = {
      TitleName = GText("UI_Dye_Name"),
      DynamicNode = {
        "Back",
        "BottomKey"
      },
      BottomKeyInfo = {},
      OverridenTopResouces = {
        DataMgr.GlobalConstant.AdvanceColorId.ConstantValue
      },
      StyleName = "Text",
      BackCallback = r0_79.OnBackKeyDown,
      OwnerPanel = r0_79,
      GetReplyOnBack = r0_79.OnResourceGetReply,
    }
    r0_79.Tab_Dye:Init(r0_79.TabConfig)
  end
  r0_79.EMList_Normal:RegenerateAllEntries()
end
function r4_0.StartWeaponPartHighLight(r0_80, r1_80, r2_80)
  -- line: [1198, 1200] id: 80
  r0_80.ActorController:StartWeaponPartHighLight(r1_80, r2_80, r0_80.HighLightColor, r0_80.Curve_WPHighLight)
end
function r4_0.StopWeaponPartHighLight(r0_81, r1_81)
  -- line: [1203, 1205] id: 81
  r0_81.ActorController:StopWeaponPartHighLight(r1_81)
end
function r4_0.ChangePartColor(r0_82, r1_82, r2_82, r3_82)
  -- line: [1209, 1216] id: 82
  if r0_82.Type == CommonConst.ArmoryType.Char then
    r0_82:ChangeCharPartColor(r1_82, r2_82, r3_82)
  else
    r0_82:StopWeaponPartHighLight(r1_82)
    r0_82:ChangeWeaponPartColor(r1_82, r2_82)
  end
end
function r4_0.ChangeWeaponPartColor(r0_83, r1_83, r2_83)
  -- line: [1218, 1220] id: 83
  r0_83.ActorController:ChangeWeaponPartColor(r1_83, r2_83)
end
function r4_0.ChangeToNormalCurrentColors(r0_84)
  -- line: [1222, 1226] id: 84
  for r5_84, r6_84 in pairs(r0_84.NormalCurrentContents) do
    r0_84:ChangePartColor(r5_84, r6_84.ActualColor, r6_84.Fresnel)
  end
  -- close: r1_84
end
function r4_0.ChangeCharPartColor(r0_85, r1_85, r2_85, r3_85)
  -- line: [1228, 1230] id: 85
  r0_85.ActorController:ChangeCharPartColor(r1_85, r2_85, r3_85)
end
function r4_0.CreateSpecialColorContents(r0_86)
  -- line: [1236, 1272] id: 86
  r0_86.EMList_Special:ClearListItems()
  r0_86.SpecialColorContents = {}
  r0_86.SpecialColorContentsMap = {}
  for r6_86, r7_86 in pairs(DataMgr.SpecialSwatch) do
    local r8_86 = NewObject(UIUtils.GetCommonItemContentClass())
    r8_86.ColorId = r6_86
    r8_86.MaterialName = r7_86.LinkedMaterial
    r8_86.ResourceId = r7_86.ResourceID
    r8_86.Event_OnClicked = r0_86.OnColorListItemClicked
    r8_86.Event_OnHovered = r0_86.OnColorListItemHovered
    r8_86.Event_OnUnhovered = r0_86.OnColorListItemUnhovered
    r8_86.Owner = r0_86
    table.insert(r0_86.SpecialColorContents, r8_86)
    r0_86:OnSpecialColorContentCreated(r8_86)
    r0_86.SpecialColorContentsMap[r8_86.ColorId] = r8_86
  end
  -- close: r2_86
  table.sort(r0_86.SpecialColorContents, function(r0_87, r1_87)
    -- line: [1254, 1256] id: 87
    return r0_87.ColorId < r1_87.ColorId
  end)
  for r6_86, r7_86 in ipairs(r0_86.SpecialColorContents) do
    r0_86.EMList_Special:AddItem(r7_86)
  end
  -- close: r2_86
  r0_86.SpecialDefaultContent = {
    ColorId = r0_86.DefaultColorId,
    MaterialSoftRef = r0_86.SpecialDefaultColorMat,
    Event_OnClicked = r0_86.OnColorListItemClicked,
    Event_OnHovered = r0_86.OnColorListItemHovered,
    Event_OnUnhovered = r0_86.OnColorListItemUnhovered,
    Owner = r0_86,
  }
  r0_86:OnSpecialColorContentCreated(r0_86.SpecialDefaultContent)
  r0_86.SpecialComparedContent = nil
  r0_86.SpecialCurrentContent = r0_86.SpecialColorContentsMap[r0_86.CurrentSkin:GetWeaponSpecialColor(r0_86.CurrentPlan)] and r0_86.SpecialDefaultContent
end
function r4_0.InitSpecialDyeing(r0_88)
  -- line: [1274, 1279] id: 88
  r0_88:ResetSpecialCurrentContent()
  r0_88.ColorLump_Default_Sp:OnListItemObjectSet(r0_88.SpecialDefaultContent)
  r0_88.EMList_Special:RegenerateAllEntries()
  r0_88:UpdateItemConsume()
end
function r4_0.ClearSpecialColorStates(r0_89)
  -- line: [1281, 1292] id: 89
  r0_89.SpecialComparedContent = nil
  if r0_89.Type == CommonConst.ArmoryType.Char then
    return 
  end
  r0_89.SpecialDefaultContent.IsSelected = r0_89.SpecialCurrentContent == r0_89.SpecialDefaultContent
  r0_89.SpecialDefaultContent.IsClicked = false
  for r5_89, r6_89 in ipairs(r0_89.SpecialColorContents) do
    r6_89.IsSelected = r6_89 == r0_89.SpecialCurrentContent
    r6_89.IsClicked = false
  end
  -- close: r1_89
end
function r4_0.ResetSpecialCurrentContent(r0_90)
  -- line: [1294, 1297] id: 90
  r0_90.SpecialCurrentContent = r0_90.SpecialColorContentsMap[r0_90.CurrentSkin:GetWeaponSpecialColor(r0_90.CurrentPlan)] and r0_90.SpecialDefaultContent
end
function r4_0.CreateSpecialDefaultColorMat(r0_91)
  -- line: [1299, 1301] id: 91
  r0_91.SpecialDefaultColorMat = r0_91:GetWeaponSpecialDefaultMatFromDataTable(r0_91.UsingWeapon)
end
function r4_0.OnSpecialColorListItemClicked(r0_92, r1_92)
  -- line: [1304, 1317] id: 92
  if r0_92.SpecialComparedContent == r1_92 then
    return 
  end
  if r0_92.SpecialComparedContent then
    r0_92.SpecialComparedContent.IsClicked = false
    if r0_92.SpecialComparedContent.Widget then
      r0_92.SpecialComparedContent.Widget:SetIsClicked(false)
    end
  end
  r0_92.SpecialComparedContent = r1_92
  r0_92:ChangeSpecialColor(r1_92)
  r0_92:UpdateItemConsume()
end
function r4_0.ChangeSpecialColor(r0_93, r1_93)
  -- line: [1319, 1336] id: 93
  if r0_93.SpecialDefaultContent == r1_93 and r0_93.UsingWeapon then
    local r2_93 = r0_93.NormalDefaultColorContents[r0_93.ColorPartCount]
    r0_93:ChangePartColor(r0_93.ColorPartCount, r2_93.ActualColor, r2_93.Fresnel)
    r0_93.UsingWeapon:InitWeaponBreakMI()
  elseif r0_93.UsingWeapon then
    r0_93.UsingWeapon:InitWeaponBreakMI()
    r0_93.UsingWeapon:ChangeWPMaterial(r1_93.MaterialName)
    if r0_93.UsingWeapon.ChildWeapon then
      r0_93.UsingWeapon.ChildWeapon:ChangeWPMaterial(r1_93.MaterialName)
    end
  end
end
function r4_0.OnSpecialColorListItemHovered(r0_94, r1_94)
  -- line: [1338, 1345] id: 94
  r0_94.SpecialColorHoveredContent = r1_94
  if r0_94.bContrastKeyDown then
    return 
  end
  AudioManager(r0_94):PlayUISound(r0_94, "event:/ui/common/color_change", nil, nil)
  r0_94:ChangeSpecialColor(r1_94)
end
function r4_0.OnSpecialColorListItemUnhovered(r0_95)
  -- line: [1347, 1357] id: 95
  r0_95.SpecialColorHoveredContent = nil
  if r0_95.bContrastKeyDown then
    return 
  end
  local r1_95 = r0_95.SpecialComparedContent and r0_95.SpecialCurrentContent
  r0_95:ChangeSpecialColor(r1_95)
  if r1_95 == r0_95.SpecialCurrentContent and r1_95 == r0_95.SpecialDefaultContent then
    r0_95:ChangeToNormalCurrentColors()
  end
end
function r4_0.UpdateItemConsume(r0_96)
  -- line: [1362, 1368] id: 96
  if r0_96.CurrentTabIdx == r0_96.NormalColorTabIdx then
    r0_96:UpdateItemConsumeManual(r0_96.NormalCurrentContents, r0_96.NormalComparedContents)
  else
    r0_96:UpdateItemConsumeManual({
      r0_96.SpecialCurrentContent
    }, {
      r0_96.SpecialComparedContent
    })
  end
end
function r4_0.UpdateItemConsumeManual(r0_97, r1_97, r2_97)
  -- line: [1370, 1517] id: 97
  r0_97:PlayAnimation(r0_97.In_2)
  local r3_97 = false
  local r4_97 = true
  local r5_97 = {}
  local r6_97 = {}
  local r7_97 = GWorld:GetAvatar()
  for r12_97, r13_97 in pairs(r2_97) do
    if r13_97 and r13_97 ~= r1_97[r12_97] then
      r3_97 = true
      local r14_97 = r13_97.ResourceId
      local r15_97 = DataMgr.Resource[r14_97]
      if r15_97 then
        if not r5_97[r14_97] then
          local r16_97 = r7_97.Resources[r14_97]
          if not r16_97 then
            r16_97 = {}
            r16_97.Count = 0
          end
          local r17_97 = {
            Count = r16_97.Count,
            NeedCount = 1,
            NotEnoughCount = 0,
          }
          if r17_97.Count < r17_97.NeedCount then
            r4_97 = false
            r17_97.NotEnoughCount = 1
          end
          r17_97.Id = r14_97
          r17_97.Rarity = r15_97.Rarity
          r17_97.Icon = r15_97.Icon
          r17_97.ItemType = CommonConst.ItemType.Resource
          r17_97.IsShowDetails = true
          r5_97[r14_97] = r17_97
          table.insert(r6_97, r17_97)
        else
          local r16_97 = r5_97[r14_97]
          r16_97.NeedCount = r16_97.NeedCount + 1
          if r16_97.Count < r16_97.NeedCount then
            r4_97 = false
            r16_97.NotEnoughCount = r16_97.NotEnoughCount + 1
          end
        end
      end
    end
  end
  -- close: r8_97
  rawset(r0_97, "bNeedCommonDye", false)
  rawset(r0_97, "NotEnoughResource", {})
  rawset(r0_97, "CommonDyeResource", {})
  if not r4_97 then
    local r8_97 = 0
    local r9_97 = {}
    for r14_97, r15_97 in pairs(r5_97) do
      if r15_97.NotEnoughCount > 0 then
        local r16_97 = {
          ItemId = r14_97,
          Count = r15_97.NotEnoughCount,
          ItemType = CommonConst.ItemType.Resource,
        }
        table.insert(r0_97.NotEnoughResource, r16_97)
        r9_97[r14_97] = r16_97
        r8_97 = r8_97 + r15_97.NotEnoughCount
      end
    end
    -- close: r10_97
    if not rawget(r0_97, "ResourceId2CommonDyeIds") then
      r0_97:CreateResourceId2CommonDyeIds()
    end
    local r10_97 = {}
    local r11_97 = {}
    for r16_97, r17_97 in ipairs(r0_97.NotEnoughResource) do
      if r0_97.ResourceId2CommonDyeIds[r17_97.ItemId] then
        for r22_97, r23_97 in pairs(r0_97.ResourceId2CommonDyeIds[r17_97.ItemId]) do
          local r24_97 = r7_97.Resources[r22_97]
          if not r24_97 then
            r24_97 = {}
            r24_97.Count = 0
          end
          local r25_97 = r11_97[r22_97]
          if not r25_97 then
            local r26_97 = DataMgr.Resource[r22_97]
            r25_97 = {
              Count = r24_97.Count,
              NeedCount = 0,
              Icon = r26_97.Icon,
              Id = r22_97,
              Rarity = r26_97.Rarity,
              ItemType = CommonConst.ItemType.Resource,
              IsShowDetails = true,
            }
            table.insert(r10_97, r25_97)
            r11_97[r22_97] = r25_97
          end
          if r25_97.NeedCount + r17_97.Count <= r24_97.Count then
            r25_97.NeedCount = r25_97.NeedCount + r17_97.Count
            r8_97 = r8_97 - r17_97.Count
          else
            local r26_97 = r24_97.Count - r25_97.NeedCount
            r25_97.NeedCount = r25_97.NeedCount + r26_97
            r8_97 = r8_97 - r26_97
          end
        end
        -- close: r18_97
      end
    end
    -- close: r12_97
    if r8_97 == 0 then
      for r16_97, r17_97 in ipairs(r10_97) do
        table.insert(r0_97.CommonDyeResource, {
          ItemId = r17_97.Id,
          Count = r17_97.NeedCount,
          ItemType = CommonConst.ItemType.Resource,
        })
      end
      -- close: r12_97
      for r16_97, r17_97 in pairs(r5_97) do
        if r17_97.NeedCount <= r17_97.Count then
          r11_97[r16_97] = r17_97
          table.insert(r10_97, r17_97)
        elseif r17_97.Count > 0 then
          r11_97[r16_97] = r17_97
          r17_97.NeedCount = r17_97.Count
          table.insert(r10_97, r17_97)
        end
      end
      -- close: r12_97
      r6_97 = r10_97
      r5_97 = r11_97
      r4_97 = true
      r0_97.bNeedCommonDye = true
    end
  end
  for r12_97, r13_97 in ipairs(r6_97) do
    r0_97:OnConsumItemContentCreated(r13_97)
  end
  -- close: r8_97
  r0_97.ItemConsume = r5_97
  r0_97:UpdateConsumItemWidgets(r6_97, r5_97)
  if r3_97 then
    r0_97.Btn_Compare:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r0_97.Btn_Compare:SetForbidden(false)
  else
    r0_97.Btn_Compare:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    r0_97.Btn_Compare:SetForbidden(true)
  end
  if r3_97 and not r0_97:IsSameDyeDraft() then
    r0_97.Btn_Save:ForbidBtn(false)
  else
    r0_97.Btn_Save:ForbidBtn(true)
  end
  if r4_97 and r3_97 then
    r0_97.Btn_Done:SetText(GText("UI_Dye_Apply"))
    r0_97.Btn_Done:ForbidBtn(false)
  else
    r0_97.Btn_Done:ForbidBtn(true)
    if not r4_97 then
      r0_97.Btn_Done:SetText(GText("UI_Dye_Apply"))
    else
      r0_97.Btn_Done:SetText(GText("UI_Dye_Done"))
    end
  end
  if r0_97.IsPreviewMode then
    r0_97:UpdatePreviewOrNotUI()
  end
end
function r4_0.CreateResourceId2CommonDyeIds(r0_98)
  -- line: [1519, 1527] id: 98
  rawset(r0_98, "ResourceId2CommonDyeIds", {})
  for r5_98, r6_98 in pairs(DataMgr.CommonDye) do
    for r11_98, r12_98 in ipairs(r6_98.DyeID and {}) do
      r0_98.ResourceId2CommonDyeIds[r12_98] = r0_98.ResourceId2CommonDyeIds[r12_98] and {}
      r0_98.ResourceId2CommonDyeIds[r12_98][r5_98] = true
    end
    -- close: r7_98
  end
  -- close: r1_98
end
function r4_0.IsSameDyeDraft(r0_99)
  -- line: [1529, 1537] id: 99
  local r1_99 = r3_0:GetDyeDraftPlan(r0_99.CurrentSkin.SkinId, r0_99.CurrentPlan) and {}
  for r6_99, r7_99 in pairs(r0_99.NormalComparedContents and {}) do
    if r7_99.ColorId ~= r1_99[r6_99] then
      return false
    end
  end
  -- close: r2_99
  return true
end
function r4_0.UpdateConsumItemWidgets(r0_100, r1_100)
  -- line: [1539, 1597] id: 100
  if #r1_100 == 0 then
    if r0_100.Panel_Cost:GetVisibility() == UIConst.VisibilityOp.Visible then
      r0_100.Panel_Cost:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      r0_100:StopAnimation(r0_100.In_2)
      r0_100:PlayAnimation(r0_100.Out_2)
    else
      r0_100.Panel_Cost:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  else
    r0_100.Panel_Cost:SetVisibility(UIConst.VisibilityOp.Visible)
    r0_100:StopAnimation(r0_100.Out_2)
    r0_100:PlayAnimation(r0_100.In_2)
    local r2_100 = r0_100.WB_Consume:GetAllChildren():ToTable()
    local r3_100 = #r2_100
    local r4_100 = #r1_100
    local r5_100 = 3
    local r6_100 = UGameplayStatics.GetObjectClass(r2_100[2])
    local r7_100 = UIManager(r0_100)
    if r4_100 < r3_100 + -1 then
      local r8_100 = r4_100 + 1
      if r8_100 % r5_100 ~= 0 then
        r8_100 = r8_100 + r5_100 - r8_100 % r5_100
      end
      if r8_100 == 3 and r4_100 == 1 then
        r8_100 = 2
      end
      if r8_100 < r3_100 then
        for r12_100 = r3_100, r8_100 + 1, -1 do
          r2_100[r12_100]:RemoveFromParent()
        end
      elseif r3_100 < r8_100 then
        for r12_100 = r3_100, r8_100, 1 do
          r0_100.WB_Consume:AddChild(r7_100:CreateWidget(r6_100, false))
        end
      end
    elseif r3_100 + -1 < r4_100 then
      for r11_100 = r3_100, r4_100, 1 do
        r0_100.WB_Consume:AddChild(r7_100:CreateWidget(r6_100, false))
      end
      if (r4_100 + 1) % r5_100 ~= 0 then
        for r11_100 = 1, r5_100 - (r4_100 + 1) % r5_100, 1 do
          r0_100.WB_Consume:AddChild(r7_100:CreateWidget(r6_100, false))
        end
      end
    end
    r2_100 = r0_100.WB_Consume:GetAllChildren():ToTable()
    for r11_100 = 2, #r2_100, 1 do
      if r1_100[r11_100 + -1] then
        r2_100[r11_100]:OnListItemObjectSet(r1_100[r11_100 + -1])
        r2_100[r11_100]:SetVisibility(UIConst.VisibilityOp.Visible)
      else
        r2_100[r11_100]:OnListItemObjectSet({})
        r2_100[r11_100]:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      end
    end
  end
end
function r4_0.OnConsumItemContentCreated(r0_101, r1_101)
  -- line: [1599, 1600] id: 101
end
function r4_0.OnContrastKeyDown(r0_102)
  -- line: [1603, 1609] id: 102
  if r0_102.bContrastKeyDown then
    return 
  end
  r0_102.bContrastKeyDown = true
  r0_102:RecoverActorColor()
end
function r4_0.OnContrastKeyUp(r0_103)
  -- line: [1612, 1639] id: 103
  r0_103.bContrastKeyDown = false
  if r0_103.CurrentTabIdx == r0_103.NormalColorTabIdx then
    if r0_103.SpecialDefaultContent and (next(r0_103.NormalComparedContents) or r0_103.NormalColorHoveredContent) then
      r0_103:ChangeSpecialColor(r0_103.SpecialDefaultContent)
    end
    for r5_103, r6_103 in pairs(r0_103.NormalCurrentContents) do
      if r0_103.NormalComparedContents[r5_103] then
        r0_103:ChangePartColor(r5_103, r0_103.NormalComparedContents[r5_103].ActualColor, r0_103.NormalComparedContents[r5_103].Fresnel)
      else
        r0_103:ChangePartColor(r5_103, r6_103.ActualColor, r6_103.Fresnel)
      end
    end
    -- close: r1_103
    if r0_103.NormalColorHoveredContent then
      r0_103:ChangePartColor(r0_103.CurNormalDyeTab.Idx, r0_103.NormalColorHoveredContent.ActualColor, r0_103.NormalColorHoveredContent.Fresnel)
    else
      local r1_103 = r0_103.SpecialCurrentContent
      if r0_103.SpecialCurrentContent ~= r0_103.SpecialDefaultContent and next(r0_103.NormalComparedContents) == nil then
        r0_103:ChangeSpecialColor(r1_103)
      end
    end
  else
    local r1_103 = r0_103.SpecialColorHoveredContent and r0_103.SpecialComparedContent and r0_103.SpecialCurrentContent
    if r1_103 then
      r0_103:ChangeSpecialColor(r1_103)
    end
  end
end
function r4_0.OnHideUIKeyDown(r0_104)
  -- line: [1642, 1651] id: 104
  r0_104.bSelfHidden = not r0_104.bSelfHidden
  if r0_104.bSelfHidden then
    r0_104:SetRenderOpacity(0)
    r0_104.Image_Click.Slot:SetZOrder(10)
  else
    r0_104:SetRenderOpacity(1)
    r0_104.Image_Click.Slot:SetZOrder(-1)
  end
end
function r4_0.UpdateCurrentDyeTabSaveOrSelect(r0_105)
  -- line: [1653, 1665] id: 105
  if r0_105.CurrentDyeTabDraftContent then
    r0_105.CurrentDyeTabDraftContent.IsSaveInDraft = false
    r0_105.CurrentDyeTabDraftContent.Widget:SetIsSaveInDraft(false)
    r0_105.CurrentDyeTabDraftContent.Widget:SetIsSelected(r0_105.CurrentDyeTabDraftContent.IsSelected)
  end
  r0_105.CurrentDyeTabDraftContent = r0_105.NormalComparedContents[r0_105.CurNormalDyeTab.Idx]
  if r0_105.CurrentDyeTabDraftContent then
    r0_105.CurrentDyeTabDraftContent.IsSaveInDraft = true
    r0_105.CurrentDyeTabDraftContent.Widget:SetIsSaveInDraft(true)
    r0_105.CurrentDyeTabDraftContent.Widget:SetIsSelected(r0_105.CurrentDyeTabDraftContent.IsSelected)
  end
end
function r4_0.OnDoneBtnClicked(r0_106)
  -- line: [1668, 1718] id: 106
  local r1_106 = GWorld:GetAvatar()
  local function r2_106()
    -- line: [1670, 1691] id: 107
    if r0_106.CurrentTabIdx == r0_106.NormalColorTabIdx then
      local r0_107 = {}
      for r5_107, r6_107 in pairs(r0_106.NormalComparedContents) do
        if r6_107 ~= r0_106.NormalCurrentContents[r5_107] then
          r0_107[r5_107] = r6_107.ColorId
        end
      end
      -- close: r1_107
      r0_106:BlockAllUIInput(true)
      if r0_106.Type == CommonConst.ArmoryType.Char then
        r1_106:ChangeCharSkinColors(r0_106.CurrentSkin.SkinId, r0_107, r0_106.CurrentPlan)
      else
        r1_106:ChangeWeaponSkinColors(r0_106.Target.Uuid, r0_106.CurrentSkin.SkinId, r0_106.CurrentPlan, r0_107)
      end
    else
      local r0_107 = r0_106.SpecialComparedContent.ColorId
      if r0_107 then
        r0_106:BlockAllUIInput(true)
        r1_106:ChangeWeaponSkinSpecialColor(r0_106.Target.Uuid, r0_106.CurrentSkin.SkinId, r0_106.CurrentPlan, r0_107)
      end
    end
  end
  local r3_106 = {}
  for r9_106, r10_106 in pairs(r0_106.ItemConsume) do
    if r10_106.Id then
      local r11_106 = table.insert
      local r12_106 = r3_106
      local r13_106 = {
        ItemId = r10_106.Id,
        ItemType = CommonConst.ItemType.Resource,
        ItemNum = r10_106.Count and 0,
        ItemNeed = r10_106.NeedCount,
      }
      r11_106(r12_106, r13_106)
    end
  end
  -- close: r5_106
  local r5_106 = {
    RightCallbackFunction = r2_106,
    ItemList = r3_106,
  }
  if #r3_106 > 0 then
    if r0_106.bNeedCommonDye then
      r5_106.LeftItems = r0_106.CommonDyeResource
      r5_106.RightItems = r0_106.NotEnoughResource
      r5_106.ShortTextParams = {
        r3_106[1].ItemNeed
      }
      UIManager(r0_106):ShowCommonPopupUI(100228, r5_106, r0_106)
    else
      UIManager(r0_106):ShowCommonPopupUI(100100, r5_106, r0_106)
    end
  else
    UIManager(r0_106):ShowCommonPopupUI(100135, r5_106, r0_106)
  end
end
function r4_0.OnPreviewSaveBtnClicked(r0_108)
  -- line: [1720, 1730] id: 108
  if not r0_108.IsPreviewMode then
    return 
  end
  if r0_108.OpenPreviewDyeFromShopItem then
    UIManager(r0_108):ShowUITip(UIConst.Tip_CommonToast, GText("UI_SkinPreview_DyeDraft"))
    r0_108:SaveCurrentDraft()
    r0_108:UpdatePreviewOrNotUI()
    r0_108.Btn_PreviewSave:ForbidBtn(true)
  elseif r0_108.OpenPreviewDyeFromChat then
    r0_108:ImportDraft()
  end
end
function r4_0.OnForbiddenDoneBtnClicked(r0_109)
  -- line: [1732, 1742] id: 109
  local r1_109 = false
  for r6_109, r7_109 in pairs(r0_109.NormalComparedContents) do
    if r7_109 ~= r0_109.NormalCurrentContents[r6_109] then
      r1_109 = true
    end
  end
  -- close: r2_109
  if r1_109 then
    UIManager(r0_109):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Dye_Insufficient"), 1.5)
  end
end
function r4_0.OnColorsChanged(r0_110, r1_110)
  -- line: [1745, 1794] id: 110
  r0_110:BlockAllUIInput(false)
  if not ErrorCode:Check(r1_110) then
    return 
  end
  AudioManager(r0_110):PlayUISound(r0_110, "event:/ui/common/color_change_confirm", nil, nil)
  UIManager(r0_110):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Dye_Success"), 1.5)
  r0_110:ResetTargetData()
  r0_110:ResetSkinData()
  if r0_110.RecoverColorWhenSeverCallback then
    r0_110.RecoverColorWhenSeverCallback = false
    r0_110:ResetNormalCurrentContens()
    r0_110:SelectDyeingTypeTab(r0_110.CurrentTabIdx)
    return 
  end
  if r0_110.CurrentTabIdx == r0_110.NormalColorTabIdx then
    local r2_110 = r0_110.CurNormalDyeTab.Idx
    local r3_110 = r0_110.NormalCurrentContents[r2_110]
    local r4_110 = r0_110.NormalComparedContents[r2_110]
    if r4_110 and r4_110 ~= r3_110 then
      r3_110.IsSelected = false
      if r3_110.Widget then
        r3_110.Widget:SetIsSelected(false)
      end
      r4_110.IsSelected = true
      if r4_110.Widget then
        r4_110.Widget:SetIsSelected(true)
      end
    end
    r0_110:ResetNormalCurrentContens()
    r0_110:ResetSpecialCurrentContent()
    r0_110:UpdateItemConsume()
  else
    r0_110.SpecialCurrentContent.IsSelected = false
    if r0_110.SpecialCurrentContent.Widget then
      r0_110.SpecialCurrentContent.Widget:SetIsSelected(false)
    end
    r0_110.SpecialComparedContent.IsSelected = true
    if r0_110.SpecialComparedContent.Widget then
      r0_110.SpecialComparedContent.Widget:SetIsSelected(true)
    end
    r0_110:ResetNormalCurrentContens()
    r0_110:ResetSpecialCurrentContent()
    r0_110:UpdateItemConsume()
  end
  r0_110:UpdateCurrentDyeTabSaveOrSelect()
  r0_110:DeleteCurrentDraft()
  r0_110.Btn_Compare:SetForbidden(true)
  r0_110.Btn_Save:ForbidBtn(true)
end
function r4_0.OnCharSkinColorPlanChanged(r0_111, r1_111, r2_111, r3_111)
  -- line: [1797, 1817] id: 111
  r0_111:BlockAllUIInput(false)
  if not ErrorCode:Check(r1_111) then
    return 
  end
  r0_111:ResetTargetData()
  r0_111:ResetSkinData()
  r0_111.CurrentPlan = r0_111.CurrentSkin.CurrentPlanIndex
  r0_111:ResetPlanName()
  r0_111:ResetNormalCurrentContens()
  r0_111:UpdateComparedContentsByDraft()
  r0_111.CurrentTabIdx = nil
  r0_111:SelectDyePlan(r3_111, r0_111.CurrentTabIdx)
  r0_111:UpdateDraftBtn()
  if r0_111.Parent and r0_111.OpenPreviewDyeFromChat then
    r0_111:ApplyColorsToComparedColors(r0_111.OpenPreviewDyeFromChatColors)
    r0_111:ApplyColorsToNormalDyeTabs(r0_111.OpenPreviewDyeFromChatColors)
  end
  r0_111:OnContrastKeyUp()
end
function r4_0.OnWeaponSkinColorPlanChanged(r0_112, r1_112, r2_112, r3_112, r4_112)
  -- line: [1820, 1844] id: 112
  r0_112:BlockAllUIInput(false)
  if not ErrorCode:Check(r1_112) then
    return 
  end
  r0_112:ResetTargetData()
  r0_112:ResetSkinData()
  r0_112.CurrentPlan = r0_112.CurrentSkin.CurrentPlanIndex
  r0_112:ResetPlanName()
  r0_112:ResetNormalCurrentContens()
  r0_112:ResetSpecialCurrentContent()
  r0_112:UpdateComparedContentsByDraft()
  r0_112.CurrentTabIdx = nil
  r0_112:SelectDyePlan(r4_112, r0_112.CurrentTabIdx)
  r0_112:UpdateDraftBtn()
  if r0_112.Parent and r0_112.OpenPreviewDyeFromChat then
    r0_112:ApplyColorsToComparedColors(r0_112.OpenPreviewDyeFromChatColors)
    r0_112:ApplyColorsToNormalDyeTabs(r0_112.OpenPreviewDyeFromChatColors)
  end
  r0_112:OnContrastKeyUp()
  if r0_112.SpecialCurrentContent == r0_112.SpecialDefaultContent then
    r0_112:ChangeToNormalCurrentColors()
  end
end
function r4_0.OnResourcesChanged(r0_113, r1_113)
  -- line: [1847, 1868] id: 113
  if r0_113.CurrentTabIdx == r0_113.NormalColorTabIdx and r0_113.NormalComparedContents then
    if DataMgr.CommonDye[r1_113] then
      r0_113:UpdateItemConsume()
    else
      for r6_113, r7_113 in pairs(r0_113.NormalComparedContents) do
        if r7_113.ResourceId == r1_113 then
          r0_113:UpdateItemConsume()
          break
        end
      end
      -- close: r2_113
    end
  elseif r0_113.SpecialComparedContent and r0_113.SpecialComparedContent.ResourceId == r1_113 then
    r0_113:UpdateItemConsume()
  end
end
function r4_0.PlayInAnim(r0_114)
  -- line: [1870, 1874] id: 114
  r0_114:BlockAllUIInput(true)
  r0_114:StopAnimation(r0_114.Out)
  r0_114:PlayAnimation(r0_114.In)
end
function r4_0.PlayOutAnim(r0_115)
  -- line: [1876, 1884] id: 115
  r0_115:RecoverActorColor()
  r0_115:StopAnimation(r0_115.In)
  r0_115:PlayAnimation(r0_115.Out)
  r0_115:BlockAllUIInput(true)
  if r0_115.LastCameraTags and r0_115.ActorController and not r0_115.bStandaloneWeapon then
    r0_115.ActorController:SetArmoryCameraTag(table.unpack(r0_115.LastCameraTags))
  end
end
function r4_0.OnInAnimFinished(r0_116)
  -- line: [1886, 1888] id: 116
  r0_116:BlockAllUIInput(false)
end
function r4_0.OnOutAnimFinished(r0_117)
  -- line: [1890, 1895] id: 117
  r0_117:Close()
  if r0_117.Parent and r0_117.OpenPreviewDyeFromChat then
    r0_117.Parent:OnBackKeyDown()
  end
end
function r4_0.Close(r0_118)
  -- line: [1897, 1902] id: 118
  r4_0.Super.Close(r0_118)
  if r0_118.OnCloseCallback then
    r0_118.OnCloseCallback(r0_118.ParentWidget)
  end
end
function r4_0.RecoverActorColor(r0_119)
  -- line: [1904, 1920] id: 119
  if not r0_119.CurrentSkin then
    return 
  end
  if r0_119.Type == CommonConst.ArmoryType.Char then
    r0_119:ChangeToNormalCurrentColors()
  elseif r0_119.CurrentSkin:GetWeaponSpecialColor(r0_119.CurrentPlan) == r0_119.DefaultColorId then
    r0_119:ChangeSpecialColor(r0_119.SpecialCurrentContent)
    r0_119:ChangeToNormalCurrentColors()
  else
    r0_119:ChangeToNormalCurrentColors()
    r0_119:ChangeSpecialColor(r0_119.SpecialCurrentContent)
  end
end
function r4_0.ResetTargetData(r0_120)
  -- line: [1922, 1929] id: 120
  local r1_120 = GWorld:GetAvatar()
  if r0_120.Type == CommonConst.ArmoryType.Char then
    r0_120.Target = r1_120.Chars[r0_120.Target.Uuid]
  else
    r0_120.Target = r1_120.Weapons[r0_120.Target.Uuid]
  end
end
function r4_0.ResetSkinData(r0_121)
  -- line: [1931, 1939] id: 121
  local r1_121 = GWorld:GetAvatar()
  if r0_121.Type == CommonConst.ArmoryType.Char then
    r0_121.CurrentSkin = r1_121.CommonChars[r0_121.Target.CharId].OwnedSkins[r0_121.SkinId] and r0_121:CreateDefaultSkin(r0_121.SkinId)
  else
    r0_121.CurrentSkin = r0_121.Target:GetSkin(r0_121.SkinId)
  end
end
function r4_0.OnNormalColorContentCreated(r0_122, r1_122)
  -- line: [1941, 1942] id: 122
end
function r4_0.OnNormalColorListContentCreated(r0_123, r1_123)
  -- line: [1944, 1945] id: 123
end
function r4_0.OnSpecialColorContentCreated(r0_124, r1_124)
  -- line: [1947, 1948] id: 124
end
function r4_0.OnFunctionBtnAddedToFocusPath(r0_125)
  -- line: [1950, 1951] id: 125
end
function r4_0.OnFunctionBtnRemovedFromFocusPath(r0_126)
  -- line: [1953, 1954] id: 126
end
AssembleComponents(r4_0)
return r4_0
