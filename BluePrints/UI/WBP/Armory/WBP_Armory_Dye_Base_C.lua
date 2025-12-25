-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Armory\WBP_Armory_Dye_Base_C.lua
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
  -- line: [26, 30] id: 2
  r0_2.Cache = r0_2.Cache and {}
  r0_2.Cache[r1_2] = r0_2.Cache[r1_2] and {}
  return r0_2.Cache[r1_2]
end
function r3_0.SaveDyeDraft(r0_3)
  -- line: [32, 36] id: 3
  if rawget(r0_3, "AllCache") then
    r2_0:Set("DyeDraft", r0_3.AllCache, true)
  end
end
function r3_0.DeleteDyeDraft(r0_4, r1_4, r2_4)
  -- line: [38, 40] id: 4
  r0_4.Cache[r1_4][r2_4] = nil
end
function r3_0.GetDyeDraftPlan(r0_5, r1_5, r2_5)
  -- line: [42, 44] id: 5
  return r0_5:GetSkinDyeDraft(r1_5)[r2_5]
end
local r4_0 = Class("BluePrints.UI.BP_UIState_C")
r4_0._components = {
  "BluePrints.UI.WBP.Armory.MainComponent.Armory_PointerInputComponent"
}
function r4_0.Construct(r0_6)
  -- line: [52, 119] id: 6
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
  rawset(r0_6, "ColorItemContents", {})
  r0_6.Tab_Dye:Init(r0_6.TabConfig)
end
function r4_0.ReceiveEnterState(r0_7, r1_7)
  -- line: [121, 132] id: 7
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
  -- line: [134, 137] id: 8
  r4_0.Super.Destruct(r0_8)
  r0_8.ActorController:StopSkinWeaponVFX()
end
function r4_0.On_Image_Click_MouseButtonDown(r0_9, r1_9, r2_9)
  -- line: [140, 142] id: 9
  return r0_9:OnPointerDown(r1_9, r2_9)
end
function r4_0.OnMouseWheel(r0_10, r1_10, r2_10)
  -- line: [144, 146] id: 10
  return r0_10:OnMouseWheelScroll(r1_10, r2_10)
end
function r4_0.OnMouseButtonUp(r0_11, r1_11, r2_11)
  -- line: [148, 150] id: 11
  return r0_11:OnPointerUp(r1_11, r2_11)
end
function r4_0.OnMouseMove(r0_12, r1_12, r2_12)
  -- line: [152, 154] id: 12
  return r0_12:OnPointerMove(r1_12, r2_12)
end
function r4_0.OnTouchEnded(r0_13, r1_13, r2_13)
  -- line: [156, 158] id: 13
  return r0_13:OnPointerUp(r1_13, r2_13)
end
function r4_0.OnTouchMoved(r0_14, r1_14, r2_14)
  -- line: [160, 162] id: 14
  return r0_14:OnPointerMove(r1_14, r2_14)
end
function r4_0.OnMouseCaptureLost(r0_15)
  -- line: [164, 166] id: 15
  r0_15:OnPointerCaptureLost()
end
function r4_0.OnBackgroundClicked(r0_16)
  -- line: [168, 172] id: 16
  if r0_16.bSelfHidden then
    r0_16:OnHideUIKeyDown()
  end
end
function r4_0.OnBackKeyDown(r0_17)
  -- line: [174, 192] id: 17
  if r0_17.bSelfHidden then
    r0_17:OnHideUIKeyDown()
  elseif r0_17.Btn_Save:IsBtnForbidden() or r0_17.OpenPreviewDyeFromChat then
    r0_17:PlayOutAnim()
  else
    UIManager(r0_17):ShowCommonPopupUI(100231, {
      LeftCallbackFunction = function()
        -- line: [182, 184] id: 18
        r0_17:PlayOutAnim()
      end,
      RightCallbackFunction = function()
        -- line: [185, 188] id: 19
        r0_17:SaveCurrentDraft()
        r0_17:PlayOutAnim()
      end,
    }, r0_17)
  end
end
function r4_0.OnDeleteBtnClicked(r0_20)
  -- line: [194, 207] id: 20
  UIManager(r0_20):ShowCommonPopupUI(100230, {
    RightCallbackFunction = function()
      -- line: [196, 205] id: 21
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
  -- line: [209, 233] id: 22
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
  -- line: [235, 274] id: 23
  UIManager(r0_23):ShowCommonPopupUI(100232, {
    TextLenMax = 200,
    MultilineType = 1,
    HintText = GText("UI_Dye_Input_Content"),
    UseGenaral = true,
    RightCallbackFunction = function(r0_24, r1_24)
      -- line: [241, 272] id: 24
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
  -- line: [277, 280] id: 25
  r0_25:SaveCurrentDraft()
  UIManager(r0_25):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Dye_Save_Success"))
end
function r4_0.OnShareBtnClicked(r0_26)
  -- line: [282, 285] id: 26
  r0_26:OpenOrCloseDyeShareUI()
  r0_26:ShareCurrentDraft()
end
function r4_0.OpenOrCloseDyeShareUI(r0_27)
  -- line: [287, 297] id: 27
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
  -- line: [299, 300] id: 28
end
function r4_0.InitUIInfo(r0_29, r1_29, r2_29, r3_29, r4_29)
  -- line: [304, 368] id: 29
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
  -- line: [370, 388] id: 30
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
  -- line: [390, 441] id: 31
  r0_31:CreateNormalDefaultColor()
  r0_31:CreateNormalColorContents()
  r0_31.Cache = r3_0:Init(r0_31.Target.Uuid)
  if not (function()
    -- line: [395, 404] id: 32
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
  -- line: [443, 468] id: 33
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
  -- line: [470, 494] id: 34
  for r7_34, r8_34 in pairs(r0_34.List_Tab:GetListItems()) do
    if r1_34[r7_34] then
      local r9_34 = nil
      if tonumber(r1_34[r7_34]) ~= -1 then
        r9_34 = r0_34.ColorContentsMap[tonumber(r1_34[r7_34])]
        if r9_34 then
          r8_34.Color = r9_34.Color
        end
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
  -- line: [496, 519] id: 35
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
  -- line: [522, 538] id: 36
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
  -- line: [540, 542] id: 37
end
function r4_0.GetPlanNames(r0_38)
  -- line: [544, 546] id: 38
  return r0_38.AllPlanNames
end
function r4_0.SwitchColorPlan(r0_39, r1_39)
  -- line: [549, 579] id: 39
  if r1_39 == r0_39.CurrentPlan then
    return 
  end
  local function r2_39()
    -- line: [553, 561] id: 40
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
        -- line: [567, 569] id: 41
        r0_39:ResetPlanName()
      end,
      LeftCallbackFunction = function()
        -- line: [570, 572] id: 42
        r2_39()
      end,
      RightCallbackFunction = function()
        -- line: [573, 576] id: 43
        r0_39:SaveCurrentDraft()
        r2_39()
      end,
    }, r0_39)
  end
end
function r4_0.UpdateComparedContentsByDraft(r0_44)
  -- line: [583, 624] id: 44
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
  -- line: [627, 642] id: 45
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
  -- line: [645, 659] id: 46
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
  -- line: [662, 688] id: 47
  local r1_47 = UIConst.VisibilityOp.Collapsed
  if not r0_47.IsPreviewMode then
    r1_47 = UIConst.VisibilityOp.Visible
    r0_47.WidgetSwitcher_Preview:SetActiveWidgetIndex(0)
  else
    r0_47.WidgetSwitcher_Preview:SetActiveWidgetIndex(1)
  end
  local function r2_47(r0_48, r1_48)
    -- line: [670, 674] id: 48
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
  -- line: [690, 693] id: 49
  r3_0:DeleteDyeDraft(r0_49.CurrentSkin.SkinId, r0_49.CurrentPlan)
  r0_49:UpdateDraftBtn()
end
function r4_0.ShareCurrentDraft(r0_50)
  -- line: [695, 708] id: 50
end
function r4_0.ImportDraft(r0_51, r1_51)
  -- line: [710, 725] id: 51
  if r0_51.IsPreviewMode and r0_51.OpenPreviewDyeFromChat then
    if not r0_51:HasRealTargetAndSkin() then
      return 
    end
    UIManager(r0_51):ShowCommonPopupUI(100231, {
      ShortText = GText("UI_Dye_Save_Content"),
      RightCallbackFunction = function()
        -- line: [715, 718] id: 52
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
  -- line: [727, 744] id: 53
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
  -- line: [750, 766] id: 54
  local r2_54 = {
    SkinId = r1_54,
    Colors = {},
    SpecialColor = r0_54.DefaultColorId,
    GetColors = function(r0_55, r1_55)
      -- line: [755, 757] id: 55
      return r0_55.Colors
    end,
    GetWeaponSpecialColor = function(r0_56, r1_56)
      -- line: [758, 760] id: 56
      return r0_56.SpecialColor
    end,
  }
  for r6_54 = 1, r0_54.ColorPartCount, 1 do
    r2_54.Colors[r6_54] = r0_54.DefaultColorId
  end
  return r2_54
end
function r4_0.OnLoaded(r0_57, ...)
  -- line: [768, 771] id: 57
  r4_0.Super.OnLoaded(r0_57, ...)
  r0_57.IsLoaded = true
end
function r4_0.OnDyeingTypeTabClicked(r0_58, r1_58)
  -- line: [774, 792] id: 58
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
  -- line: [794, 807] id: 59
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
  -- line: [809, 835] id: 60
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
  -- line: [837, 843] id: 61
  if r0_61.CurrentTabIdx == r0_61.NormalColorTabIdx then
    r0_61:OnNormalColorListItemHovered(r1_61)
  else
    r0_61:OnSpecialColorListItemHovered(r1_61)
  end
end
function r4_0.OnColorListItemUnhovered(r0_62, r1_62)
  -- line: [845, 851] id: 62
  if r0_62.CurrentTabIdx == r0_62.NormalColorTabIdx then
    r0_62:OnNormalColorListItemUnhovered(r1_62)
  else
    r0_62:OnSpecialColorListItemUnhovered(r1_62)
  end
end
function r4_0.CreateNormalColorContents(r0_63)
  -- line: [856, 929] id: 63
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
    -- line: [883, 885] id: 64
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
  -- line: [932, 939] id: 65
  r0_65:ResetNormalCurrentContens()
  r0_65:InitNormalDyeTabs(r1_65)
  r0_65.CurNormalDyeTab = nil
  r0_65:OnNormalDyeTabInit(r0_65.NormalDyeTabs[r1_65] and r0_65.NormalDyeTabs[1])
  r0_65:UpdateItemConsume()
end
function r4_0.ClearNormalColorStates(r0_66)
  -- line: [941, 951] id: 66
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
  -- line: [953, 964] id: 67
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
  -- line: [966, 983] id: 68
  if r0_68.Type == CommonConst.ArmoryType.Char then
    r0_68.DefaultColors = {
      r0_68:GetCharDefaultColorsFromDataTable(r0_68.ArmoryPlayer)
    }
    r0_68.DefaultFresnel = {
      [8] = r0_68.DefaultColors[#r0_68.DefaultColors],
    }
    local r1_68 = r0_68.ArmoryPlayer
    if not r1_68.CharacterFashion.bHasWeaponColor then
      r1_68.CharacterFashion.DefaultWeaponColor = r1_68.CharacterFashion:GetEffectDetailColor()
    else
      r1_68.CharacterFashion.bHasWeaponColor = false
      r1_68.CharacterFashion.DefaultWeaponColor = r1_68.CharacterFashion:GetEffectDetailColor()
      r1_68.CharacterFashion.bHasWeaponColor = true
    end
    r0_68.DefaultColors[9] = r1_68.CharacterFashion.DefaultWeaponColor
  else
    r0_68.DefaultColors = {
      r0_68:GetWeaponDefaultColorsFromDataTable(r0_68.UsingWeapon)
    }
    r0_68.DefaultFresnel = {}
  end
end
function r4_0.GetDefaultColor(r0_69, r1_69)
  -- line: [985, 991] id: 69
  if r0_69.DefaultColors[r1_69] then
    return r0_69.DefaultColors[r1_69], r0_69.DefaultFresnel[r1_69]
  else
    return FLinearColor()
  end
end
function r4_0.InitNormalDyeTabs(r0_70, r1_70)
  -- line: [994, 1027] id: 70
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
  -- line: [1029, 1030] id: 71
end
function r4_0.OnNormalDyeTabInitialized(r0_72, r1_72, r2_72)
  -- line: [1032, 1037] id: 72
  if IsValid(r2_72) then
    r2_72:BindEventOnClicked(r0_72, r0_72.OnNormalDyeTabClicked)
  end
end
function r4_0.OnNormalColorListItemClicked(r0_73, r1_73)
  -- line: [1040, 1042] id: 73
  r0_73:NormalColorClickLogic(r1_73)
end
function r4_0.NormalColorClickLogic(r0_74, r1_74)
  -- line: [1044, 1065] id: 74
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
  -- line: [1067, 1074] id: 75
  r0_75.NormalColorHoveredContent = r1_75
  if r0_75.bContrastKeyDown then
    return 
  end
  AudioManager(r0_75):PlayUISound(r0_75, "event:/ui/common/color_change", nil, nil)
  r0_75:NormalColorHoverLogic(r1_75)
end
function r4_0.NormalColorHoverLogic(r0_76, r1_76)
  -- line: [1076, 1089] id: 76
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
  -- line: [1091, 1111] id: 77
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
  -- line: [1114, 1117] id: 78
  AudioManager(r0_78):PlayUISound(r0_78, "event:/ui/common/click_level_03", nil, nil)
  r0_78:OnNormalDyeTabInit(r1_78)
end
function r4_0.OnNormalDyeTabInit(r0_79, r1_79)
  -- line: [1119, 1209] id: 79
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
    local r8_79 = r4_79 and r3_79
    r0_79:ChangePartColor(r2_79, r8_79.ActualColor, r8_79.Fresnel)
    r0_79:StartPlayerPartHighLight(r8_79.ActualColor, r2_79)
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
  -- line: [1212, 1214] id: 80
  r0_80.ActorController:StartWeaponPartHighLight(r1_80, r2_80, r0_80.HighLightColor, r0_80.Curve_WPHighLight)
end
function r4_0.StopWeaponPartHighLight(r0_81, r1_81)
  -- line: [1217, 1219] id: 81
  r0_81.ActorController:StopWeaponPartHighLight(r1_81)
end
function r4_0.StartPlayerPartHighLight(r0_82, r1_82, r2_82)
  -- line: [1222, 1224] id: 82
  r0_82.ActorController:StartPlayerPartHighLight(r1_82, r2_82, r0_82.HighLightColor, r0_82.Curve_WPHighLight)
end
function r4_0.StopPlayerPartHighLight(r0_83, r1_83)
  -- line: [1227, 1229] id: 83
  r0_83.ActorController:StopPlayerPartHighLight(r1_83)
end
function r4_0.ChangePartColor(r0_84, r1_84, r2_84, r3_84)
  -- line: [1232, 1240] id: 84
  if r0_84.Type == CommonConst.ArmoryType.Char then
    r0_84:StopPlayerPartHighLight(r1_84)
    r0_84:ChangeCharPartColor(r1_84, r2_84, r3_84)
  else
    r0_84:StopWeaponPartHighLight(r1_84)
    r0_84:ChangeWeaponPartColor(r1_84, r2_84)
  end
end
function r4_0.ChangeWeaponPartColor(r0_85, r1_85, r2_85)
  -- line: [1242, 1244] id: 85
  r0_85.ActorController:ChangeWeaponPartColor(r1_85, r2_85)
end
function r4_0.ChangeToNormalCurrentColors(r0_86)
  -- line: [1246, 1250] id: 86
  for r5_86, r6_86 in pairs(r0_86.NormalCurrentContents) do
    r0_86:ChangePartColor(r5_86, r6_86.ActualColor, r6_86.Fresnel)
  end
  -- close: r1_86
end
function r4_0.ChangeCharPartColor(r0_87, r1_87, r2_87, r3_87)
  -- line: [1252, 1254] id: 87
  r0_87.ActorController:ChangeCharPartColor(r1_87, r2_87, r3_87)
end
function r4_0.CreateSpecialColorContents(r0_88)
  -- line: [1260, 1296] id: 88
  r0_88.EMList_Special:ClearListItems()
  r0_88.SpecialColorContents = {}
  r0_88.SpecialColorContentsMap = {}
  for r6_88, r7_88 in pairs(DataMgr.SpecialSwatch) do
    local r8_88 = NewObject(UIUtils.GetCommonItemContentClass())
    r8_88.ColorId = r6_88
    r8_88.MaterialName = r7_88.LinkedMaterial
    r8_88.ResourceId = r7_88.ResourceID
    r8_88.Event_OnClicked = r0_88.OnColorListItemClicked
    r8_88.Event_OnHovered = r0_88.OnColorListItemHovered
    r8_88.Event_OnUnhovered = r0_88.OnColorListItemUnhovered
    r8_88.Owner = r0_88
    table.insert(r0_88.SpecialColorContents, r8_88)
    r0_88:OnSpecialColorContentCreated(r8_88)
    r0_88.SpecialColorContentsMap[r8_88.ColorId] = r8_88
  end
  -- close: r2_88
  table.sort(r0_88.SpecialColorContents, function(r0_89, r1_89)
    -- line: [1278, 1280] id: 89
    return r0_89.ColorId < r1_89.ColorId
  end)
  for r6_88, r7_88 in ipairs(r0_88.SpecialColorContents) do
    r0_88.EMList_Special:AddItem(r7_88)
  end
  -- close: r2_88
  r0_88.SpecialDefaultContent = {
    ColorId = r0_88.DefaultColorId,
    MaterialSoftRef = r0_88.SpecialDefaultColorMat,
    Event_OnClicked = r0_88.OnColorListItemClicked,
    Event_OnHovered = r0_88.OnColorListItemHovered,
    Event_OnUnhovered = r0_88.OnColorListItemUnhovered,
    Owner = r0_88,
  }
  r0_88:OnSpecialColorContentCreated(r0_88.SpecialDefaultContent)
  r0_88.SpecialComparedContent = nil
  r0_88.SpecialCurrentContent = r0_88.SpecialColorContentsMap[r0_88.CurrentSkin:GetWeaponSpecialColor(r0_88.CurrentPlan)] and r0_88.SpecialDefaultContent
end
function r4_0.InitSpecialDyeing(r0_90)
  -- line: [1298, 1303] id: 90
  r0_90:ResetSpecialCurrentContent()
  r0_90.ColorLump_Default_Sp:OnListItemObjectSet(r0_90.SpecialDefaultContent)
  r0_90.EMList_Special:RegenerateAllEntries()
  r0_90:UpdateItemConsume()
end
function r4_0.ClearSpecialColorStates(r0_91)
  -- line: [1305, 1316] id: 91
  r0_91.SpecialComparedContent = nil
  if r0_91.Type == CommonConst.ArmoryType.Char then
    return 
  end
  r0_91.SpecialDefaultContent.IsSelected = r0_91.SpecialCurrentContent == r0_91.SpecialDefaultContent
  r0_91.SpecialDefaultContent.IsClicked = false
  for r5_91, r6_91 in ipairs(r0_91.SpecialColorContents) do
    r6_91.IsSelected = r6_91 == r0_91.SpecialCurrentContent
    r6_91.IsClicked = false
  end
  -- close: r1_91
end
function r4_0.ResetSpecialCurrentContent(r0_92)
  -- line: [1318, 1321] id: 92
  r0_92.SpecialCurrentContent = r0_92.SpecialColorContentsMap[r0_92.CurrentSkin:GetWeaponSpecialColor(r0_92.CurrentPlan)] and r0_92.SpecialDefaultContent
end
function r4_0.CreateSpecialDefaultColorMat(r0_93)
  -- line: [1323, 1325] id: 93
  r0_93.SpecialDefaultColorMat = r0_93:GetWeaponSpecialDefaultMatFromDataTable(r0_93.UsingWeapon)
end
function r4_0.OnSpecialColorListItemClicked(r0_94, r1_94)
  -- line: [1328, 1341] id: 94
  if r0_94.SpecialComparedContent == r1_94 then
    return 
  end
  if r0_94.SpecialComparedContent then
    r0_94.SpecialComparedContent.IsClicked = false
    if r0_94.SpecialComparedContent.Widget then
      r0_94.SpecialComparedContent.Widget:SetIsClicked(false)
    end
  end
  r0_94.SpecialComparedContent = r1_94
  r0_94:ChangeSpecialColor(r1_94)
  r0_94:UpdateItemConsume()
end
function r4_0.ChangeSpecialColor(r0_95, r1_95)
  -- line: [1343, 1360] id: 95
  if r0_95.SpecialDefaultContent == r1_95 and r0_95.UsingWeapon then
    local r2_95 = r0_95.NormalDefaultColorContents[r0_95.ColorPartCount]
    r0_95:ChangePartColor(r0_95.ColorPartCount, r2_95.ActualColor, r2_95.Fresnel)
    r0_95.UsingWeapon:InitWeaponBreakMI()
  elseif r0_95.UsingWeapon then
    r0_95.UsingWeapon:InitWeaponBreakMI()
    r0_95.UsingWeapon:ChangeWPMaterial(r1_95.MaterialName)
    if r0_95.UsingWeapon.ChildWeapon then
      r0_95.UsingWeapon.ChildWeapon:ChangeWPMaterial(r1_95.MaterialName)
    end
  end
end
function r4_0.OnSpecialColorListItemHovered(r0_96, r1_96)
  -- line: [1362, 1369] id: 96
  r0_96.SpecialColorHoveredContent = r1_96
  if r0_96.bContrastKeyDown then
    return 
  end
  AudioManager(r0_96):PlayUISound(r0_96, "event:/ui/common/color_change", nil, nil)
  r0_96:ChangeSpecialColor(r1_96)
end
function r4_0.OnSpecialColorListItemUnhovered(r0_97)
  -- line: [1371, 1381] id: 97
  r0_97.SpecialColorHoveredContent = nil
  if r0_97.bContrastKeyDown then
    return 
  end
  local r1_97 = r0_97.SpecialComparedContent and r0_97.SpecialCurrentContent
  r0_97:ChangeSpecialColor(r1_97)
  if r1_97 == r0_97.SpecialCurrentContent and r1_97 == r0_97.SpecialDefaultContent then
    r0_97:ChangeToNormalCurrentColors()
  end
end
function r4_0.UpdateItemConsume(r0_98)
  -- line: [1386, 1392] id: 98
  if r0_98.CurrentTabIdx == r0_98.NormalColorTabIdx then
    r0_98:UpdateItemConsumeManual(r0_98.NormalCurrentContents, r0_98.NormalComparedContents)
  else
    r0_98:UpdateItemConsumeManual({
      r0_98.SpecialCurrentContent
    }, {
      r0_98.SpecialComparedContent
    })
  end
end
function r4_0.UpdateItemConsumeManual(r0_99, r1_99, r2_99)
  -- line: [1394, 1541] id: 99
  local r3_99 = false
  local r4_99 = true
  local r5_99 = {}
  local r6_99 = {}
  local r7_99 = GWorld:GetAvatar()
  for r12_99, r13_99 in pairs(r2_99) do
    if r13_99 and r13_99 ~= r1_99[r12_99] then
      r3_99 = true
      r0_99:PlayAnimation(r0_99.In_2)
      local r14_99 = r13_99.ResourceId
      local r15_99 = DataMgr.Resource[r14_99]
      if r15_99 then
        if not r5_99[r14_99] then
          local r16_99 = r7_99.Resources[r14_99]
          if not r16_99 then
            r16_99 = {}
            r16_99.Count = 0
          end
          local r17_99 = {
            Count = r16_99.Count,
            NeedCount = 1,
            NotEnoughCount = 0,
          }
          if r17_99.Count < r17_99.NeedCount then
            r4_99 = false
            r17_99.NotEnoughCount = 1
          end
          r17_99.Id = r14_99
          r17_99.Rarity = r15_99.Rarity
          r17_99.Icon = r15_99.Icon
          r17_99.ItemType = CommonConst.ItemType.Resource
          r17_99.IsShowDetails = true
          r5_99[r14_99] = r17_99
          table.insert(r6_99, r17_99)
        else
          local r16_99 = r5_99[r14_99]
          r16_99.NeedCount = r16_99.NeedCount + 1
          if r16_99.Count < r16_99.NeedCount then
            r4_99 = false
            r16_99.NotEnoughCount = r16_99.NotEnoughCount + 1
          end
        end
      end
    end
  end
  -- close: r8_99
  rawset(r0_99, "bNeedCommonDye", false)
  rawset(r0_99, "NotEnoughResource", {})
  rawset(r0_99, "CommonDyeResource", {})
  if not r4_99 then
    local r8_99 = 0
    local r9_99 = {}
    for r14_99, r15_99 in pairs(r5_99) do
      if r15_99.NotEnoughCount > 0 then
        local r16_99 = {
          ItemId = r14_99,
          Count = r15_99.NotEnoughCount,
          ItemType = CommonConst.ItemType.Resource,
        }
        table.insert(r0_99.NotEnoughResource, r16_99)
        r9_99[r14_99] = r16_99
        r8_99 = r8_99 + r15_99.NotEnoughCount
      end
    end
    -- close: r10_99
    if not rawget(r0_99, "ResourceId2CommonDyeIds") then
      r0_99:CreateResourceId2CommonDyeIds()
    end
    local r10_99 = {}
    local r11_99 = {}
    for r16_99, r17_99 in ipairs(r0_99.NotEnoughResource) do
      if r0_99.ResourceId2CommonDyeIds[r17_99.ItemId] then
        for r22_99, r23_99 in pairs(r0_99.ResourceId2CommonDyeIds[r17_99.ItemId]) do
          local r24_99 = r7_99.Resources[r22_99]
          if not r24_99 then
            r24_99 = {}
            r24_99.Count = 0
          end
          local r25_99 = r11_99[r22_99]
          if not r25_99 then
            local r26_99 = DataMgr.Resource[r22_99]
            r25_99 = {
              Count = r24_99.Count,
              NeedCount = 0,
              Icon = r26_99.Icon,
              Id = r22_99,
              Rarity = r26_99.Rarity,
              ItemType = CommonConst.ItemType.Resource,
              IsShowDetails = true,
            }
            table.insert(r10_99, r25_99)
            r11_99[r22_99] = r25_99
          end
          if r25_99.NeedCount + r17_99.Count <= r24_99.Count then
            r25_99.NeedCount = r25_99.NeedCount + r17_99.Count
            r8_99 = r8_99 - r17_99.Count
          else
            local r26_99 = r24_99.Count - r25_99.NeedCount
            r25_99.NeedCount = r25_99.NeedCount + r26_99
            r8_99 = r8_99 - r26_99
          end
        end
        -- close: r18_99
      end
    end
    -- close: r12_99
    if r8_99 == 0 then
      for r16_99, r17_99 in ipairs(r10_99) do
        table.insert(r0_99.CommonDyeResource, {
          ItemId = r17_99.Id,
          Count = r17_99.NeedCount,
          ItemType = CommonConst.ItemType.Resource,
        })
      end
      -- close: r12_99
      for r16_99, r17_99 in pairs(r5_99) do
        if r17_99.NeedCount <= r17_99.Count then
          r11_99[r16_99] = r17_99
          table.insert(r10_99, r17_99)
        elseif r17_99.Count > 0 then
          r11_99[r16_99] = r17_99
          r17_99.NeedCount = r17_99.Count
          table.insert(r10_99, r17_99)
        end
      end
      -- close: r12_99
      r6_99 = r10_99
      r5_99 = r11_99
      r4_99 = true
      r0_99.bNeedCommonDye = true
    end
  end
  for r12_99, r13_99 in ipairs(r6_99) do
    r0_99:OnConsumItemContentCreated(r13_99)
  end
  -- close: r8_99
  r0_99.ItemConsume = r5_99
  r0_99:UpdateConsumItemWidgets(r6_99, r5_99)
  if r3_99 then
    r0_99.Btn_Compare:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r0_99.Btn_Compare:SetForbidden(false)
  else
    r0_99.Btn_Compare:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    r0_99.Btn_Compare:SetForbidden(true)
  end
  if r3_99 and not r0_99:IsSameDyeDraft() then
    r0_99.Btn_Save:ForbidBtn(false)
  else
    r0_99.Btn_Save:ForbidBtn(true)
  end
  if r4_99 and r3_99 then
    r0_99.Btn_Done:SetText(GText("UI_Dye_Apply"))
    r0_99.Btn_Done:ForbidBtn(false)
  else
    r0_99.Btn_Done:ForbidBtn(true)
    if not r4_99 then
      r0_99.Btn_Done:SetText(GText("UI_Dye_Apply"))
    else
      r0_99.Btn_Done:SetText(GText("UI_Dye_Done"))
    end
  end
  if r0_99.IsPreviewMode then
    r0_99:UpdatePreviewOrNotUI()
  end
end
function r4_0.CreateResourceId2CommonDyeIds(r0_100)
  -- line: [1543, 1551] id: 100
  rawset(r0_100, "ResourceId2CommonDyeIds", {})
  for r5_100, r6_100 in pairs(DataMgr.CommonDye) do
    for r11_100, r12_100 in ipairs(r6_100.DyeID and {}) do
      r0_100.ResourceId2CommonDyeIds[r12_100] = r0_100.ResourceId2CommonDyeIds[r12_100] and {}
      r0_100.ResourceId2CommonDyeIds[r12_100][r5_100] = true
    end
    -- close: r7_100
  end
  -- close: r1_100
end
function r4_0.IsSameDyeDraft(r0_101)
  -- line: [1553, 1561] id: 101
  local r1_101 = r3_0:GetDyeDraftPlan(r0_101.CurrentSkin.SkinId, r0_101.CurrentPlan) and {}
  for r6_101, r7_101 in pairs(r0_101.NormalComparedContents and {}) do
    if r7_101.ColorId ~= r1_101[r6_101] then
      return false
    end
  end
  -- close: r2_101
  return true
end
function r4_0.UpdateConsumItemWidgets(r0_102, r1_102)
  -- line: [1563, 1626] id: 102
  if #r1_102 == 0 then
    if r0_102.Panel_Cost:GetVisibility() == UIConst.VisibilityOp.Visible then
      r0_102.Panel_Cost:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      r0_102:StopAnimation(r0_102.In_2)
      r0_102:PlayAnimation(r0_102.Out_2)
    else
      r0_102.Panel_Cost:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  else
    r0_102.Panel_Cost:SetVisibility(UIConst.VisibilityOp.Visible)
    r0_102:StopAnimation(r0_102.Out_2)
    if #r0_102.ColorItemContents == 0 and #r1_102 == 1 then
      r0_102:PlayAnimation(r0_102.In_2)
    else
      r0_102:PlayAnimation(r0_102.Change)
    end
    local r2_102 = r0_102.WB_Consume:GetAllChildren():ToTable()
    local r3_102 = #r2_102
    local r4_102 = #r1_102
    local r5_102 = 3
    local r6_102 = UGameplayStatics.GetObjectClass(r2_102[2])
    local r7_102 = UIManager(r0_102)
    if r4_102 < r3_102 + -1 then
      local r8_102 = r4_102 + 1
      if r8_102 % r5_102 ~= 0 then
        r8_102 = r8_102 + r5_102 - r8_102 % r5_102
      end
      if r8_102 == 3 and r4_102 == 1 then
        r8_102 = 2
      end
      if r8_102 < r3_102 then
        for r12_102 = r3_102, r8_102 + 1, -1 do
          r2_102[r12_102]:RemoveFromParent()
        end
      elseif r3_102 < r8_102 then
        for r12_102 = r3_102, r8_102, 1 do
          r0_102.WB_Consume:AddChild(r7_102:CreateWidget(r6_102, false))
        end
      end
    elseif r3_102 + -1 < r4_102 then
      for r11_102 = r3_102, r4_102, 1 do
        r0_102.WB_Consume:AddChild(r7_102:CreateWidget(r6_102, false))
      end
      if (r4_102 + 1) % r5_102 ~= 0 then
        for r11_102 = 1, r5_102 - (r4_102 + 1) % r5_102, 1 do
          r0_102.WB_Consume:AddChild(r7_102:CreateWidget(r6_102, false))
        end
      end
    end
    r2_102 = r0_102.WB_Consume:GetAllChildren():ToTable()
    for r11_102 = 2, #r2_102, 1 do
      if r1_102[r11_102 + -1] then
        r2_102[r11_102]:OnListItemObjectSet(r1_102[r11_102 + -1])
        r2_102[r11_102]:SetVisibility(UIConst.VisibilityOp.Visible)
      else
        r2_102[r11_102]:OnListItemObjectSet({})
        r2_102[r11_102]:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      end
    end
  end
  r0_102.ColorItemContents = r1_102
end
function r4_0.OnConsumItemContentCreated(r0_103, r1_103)
  -- line: [1628, 1629] id: 103
end
function r4_0.OnContrastKeyDown(r0_104)
  -- line: [1632, 1638] id: 104
  if r0_104.bContrastKeyDown then
    return 
  end
  r0_104.bContrastKeyDown = true
  r0_104:RecoverActorColor()
end
function r4_0.OnContrastKeyUp(r0_105)
  -- line: [1641, 1668] id: 105
  r0_105.bContrastKeyDown = false
  if r0_105.CurrentTabIdx == r0_105.NormalColorTabIdx then
    if r0_105.SpecialDefaultContent and (next(r0_105.NormalComparedContents) or r0_105.NormalColorHoveredContent) then
      r0_105:ChangeSpecialColor(r0_105.SpecialDefaultContent)
    end
    for r5_105, r6_105 in pairs(r0_105.NormalCurrentContents) do
      if r0_105.NormalComparedContents[r5_105] then
        r0_105:ChangePartColor(r5_105, r0_105.NormalComparedContents[r5_105].ActualColor, r0_105.NormalComparedContents[r5_105].Fresnel)
      else
        r0_105:ChangePartColor(r5_105, r6_105.ActualColor, r6_105.Fresnel)
      end
    end
    -- close: r1_105
    if r0_105.NormalColorHoveredContent then
      r0_105:ChangePartColor(r0_105.CurNormalDyeTab.Idx, r0_105.NormalColorHoveredContent.ActualColor, r0_105.NormalColorHoveredContent.Fresnel)
    else
      local r1_105 = r0_105.SpecialCurrentContent
      if r0_105.SpecialCurrentContent ~= r0_105.SpecialDefaultContent and next(r0_105.NormalComparedContents) == nil then
        r0_105:ChangeSpecialColor(r1_105)
      end
    end
  else
    local r1_105 = r0_105.SpecialColorHoveredContent and r0_105.SpecialComparedContent and r0_105.SpecialCurrentContent
    if r1_105 then
      r0_105:ChangeSpecialColor(r1_105)
    end
  end
end
function r4_0.OnHideUIKeyDown(r0_106)
  -- line: [1671, 1680] id: 106
  r0_106.bSelfHidden = not r0_106.bSelfHidden
  if r0_106.bSelfHidden then
    r0_106:SetRenderOpacity(0)
    r0_106.Image_Click.Slot:SetZOrder(10)
  else
    r0_106:SetRenderOpacity(1)
    r0_106.Image_Click.Slot:SetZOrder(-1)
  end
end
function r4_0.UpdateCurrentDyeTabSaveOrSelect(r0_107)
  -- line: [1682, 1694] id: 107
  if r0_107.CurrentDyeTabDraftContent then
    r0_107.CurrentDyeTabDraftContent.IsSaveInDraft = false
    r0_107.CurrentDyeTabDraftContent.Widget:SetIsSaveInDraft(false)
    r0_107.CurrentDyeTabDraftContent.Widget:SetIsSelected(r0_107.CurrentDyeTabDraftContent.IsSelected)
  end
  r0_107.CurrentDyeTabDraftContent = r0_107.NormalComparedContents[r0_107.CurNormalDyeTab.Idx]
  if r0_107.CurrentDyeTabDraftContent then
    r0_107.CurrentDyeTabDraftContent.IsSaveInDraft = true
    r0_107.CurrentDyeTabDraftContent.Widget:SetIsSaveInDraft(true)
    r0_107.CurrentDyeTabDraftContent.Widget:SetIsSelected(r0_107.CurrentDyeTabDraftContent.IsSelected)
  end
end
function r4_0.OnDoneBtnClicked(r0_108)
  -- line: [1697, 1747] id: 108
  local r1_108 = GWorld:GetAvatar()
  local function r2_108()
    -- line: [1699, 1720] id: 109
    if r0_108.CurrentTabIdx == r0_108.NormalColorTabIdx then
      local r0_109 = {}
      for r5_109, r6_109 in pairs(r0_108.NormalComparedContents) do
        if r6_109 ~= r0_108.NormalCurrentContents[r5_109] then
          r0_109[r5_109] = r6_109.ColorId
        end
      end
      -- close: r1_109
      r0_108:BlockAllUIInput(true)
      if r0_108.Type == CommonConst.ArmoryType.Char then
        r1_108:ChangeCharSkinColors(r0_108.CurrentSkin.SkinId, r0_109, r0_108.CurrentPlan)
      else
        r1_108:ChangeWeaponSkinColors(r0_108.Target.Uuid, r0_108.CurrentSkin.SkinId, r0_108.CurrentPlan, r0_109)
      end
    else
      local r0_109 = r0_108.SpecialComparedContent.ColorId
      if r0_109 then
        r0_108:BlockAllUIInput(true)
        r1_108:ChangeWeaponSkinSpecialColor(r0_108.Target.Uuid, r0_108.CurrentSkin.SkinId, r0_108.CurrentPlan, r0_109)
      end
    end
  end
  local r3_108 = {}
  for r9_108, r10_108 in pairs(r0_108.ItemConsume) do
    if r10_108.Id then
      local r11_108 = table.insert
      local r12_108 = r3_108
      local r13_108 = {
        ItemId = r10_108.Id,
        ItemType = CommonConst.ItemType.Resource,
        ItemNum = r10_108.Count and 0,
        ItemNeed = r10_108.NeedCount,
      }
      r11_108(r12_108, r13_108)
    end
  end
  -- close: r5_108
  local r5_108 = {
    RightCallbackFunction = r2_108,
    ItemList = r3_108,
  }
  if #r3_108 > 0 then
    if r0_108.bNeedCommonDye then
      r5_108.LeftItems = r0_108.CommonDyeResource
      r5_108.RightItems = r0_108.NotEnoughResource
      r5_108.ShortTextParams = {
        r3_108[1].ItemNeed
      }
      UIManager(r0_108):ShowCommonPopupUI(100228, r5_108, r0_108)
    else
      UIManager(r0_108):ShowCommonPopupUI(100100, r5_108, r0_108)
    end
  else
    UIManager(r0_108):ShowCommonPopupUI(100135, r5_108, r0_108)
  end
end
function r4_0.OnPreviewSaveBtnClicked(r0_110)
  -- line: [1749, 1759] id: 110
  if not r0_110.IsPreviewMode then
    return 
  end
  if r0_110.OpenPreviewDyeFromShopItem then
    UIManager(r0_110):ShowUITip(UIConst.Tip_CommonToast, GText("UI_SkinPreview_DyeDraft"))
    r0_110:SaveCurrentDraft()
    r0_110:UpdatePreviewOrNotUI()
    r0_110.Btn_PreviewSave:ForbidBtn(true)
  elseif r0_110.OpenPreviewDyeFromChat then
    r0_110:ImportDraft()
  end
end
function r4_0.OnForbiddenDoneBtnClicked(r0_111)
  -- line: [1761, 1771] id: 111
  local r1_111 = false
  for r6_111, r7_111 in pairs(r0_111.NormalComparedContents) do
    if r7_111 ~= r0_111.NormalCurrentContents[r6_111] then
      r1_111 = true
    end
  end
  -- close: r2_111
  if r1_111 then
    UIManager(r0_111):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Dye_Insufficient"), 1.5)
  end
end
function r4_0.OnColorsChanged(r0_112, r1_112)
  -- line: [1774, 1823] id: 112
  r0_112:BlockAllUIInput(false)
  if not ErrorCode:Check(r1_112) then
    return 
  end
  AudioManager(r0_112):PlayUISound(r0_112, "event:/ui/common/color_change_confirm", nil, nil)
  UIManager(r0_112):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Dye_Success"), 1.5)
  r0_112:ResetTargetData()
  r0_112:ResetSkinData()
  if r0_112.RecoverColorWhenSeverCallback then
    r0_112.RecoverColorWhenSeverCallback = false
    r0_112:ResetNormalCurrentContens()
    r0_112:SelectDyeingTypeTab(r0_112.CurrentTabIdx)
    return 
  end
  if r0_112.CurrentTabIdx == r0_112.NormalColorTabIdx then
    local r2_112 = r0_112.CurNormalDyeTab.Idx
    local r3_112 = r0_112.NormalCurrentContents[r2_112]
    local r4_112 = r0_112.NormalComparedContents[r2_112]
    if r4_112 and r4_112 ~= r3_112 then
      r3_112.IsSelected = false
      if r3_112.Widget then
        r3_112.Widget:SetIsSelected(false)
      end
      r4_112.IsSelected = true
      if r4_112.Widget then
        r4_112.Widget:SetIsSelected(true)
      end
    end
    r0_112:ResetNormalCurrentContens()
    r0_112:ResetSpecialCurrentContent()
    r0_112:UpdateItemConsume()
  else
    r0_112.SpecialCurrentContent.IsSelected = false
    if r0_112.SpecialCurrentContent.Widget then
      r0_112.SpecialCurrentContent.Widget:SetIsSelected(false)
    end
    r0_112.SpecialComparedContent.IsSelected = true
    if r0_112.SpecialComparedContent.Widget then
      r0_112.SpecialComparedContent.Widget:SetIsSelected(true)
    end
    r0_112:ResetNormalCurrentContens()
    r0_112:ResetSpecialCurrentContent()
    r0_112:UpdateItemConsume()
  end
  r0_112:UpdateCurrentDyeTabSaveOrSelect()
  r0_112:DeleteCurrentDraft()
  r0_112.Btn_Compare:SetForbidden(true)
  r0_112.Btn_Save:ForbidBtn(true)
end
function r4_0.OnCharSkinColorPlanChanged(r0_113, r1_113, r2_113, r3_113)
  -- line: [1826, 1846] id: 113
  r0_113:BlockAllUIInput(false)
  if not ErrorCode:Check(r1_113) then
    return 
  end
  r0_113:ResetTargetData()
  r0_113:ResetSkinData()
  r0_113.CurrentPlan = r0_113.CurrentSkin.CurrentPlanIndex
  r0_113:ResetPlanName()
  r0_113:ResetNormalCurrentContens()
  r0_113:UpdateComparedContentsByDraft()
  r0_113.CurrentTabIdx = nil
  r0_113:SelectDyePlan(r3_113, r0_113.CurrentTabIdx)
  r0_113:UpdateDraftBtn()
  if r0_113.Parent and r0_113.OpenPreviewDyeFromChat then
    r0_113:ApplyColorsToComparedColors(r0_113.OpenPreviewDyeFromChatColors)
    r0_113:ApplyColorsToNormalDyeTabs(r0_113.OpenPreviewDyeFromChatColors)
  end
  r0_113:OnContrastKeyUp()
end
function r4_0.OnWeaponSkinColorPlanChanged(r0_114, r1_114, r2_114, r3_114, r4_114)
  -- line: [1849, 1873] id: 114
  r0_114:BlockAllUIInput(false)
  if not ErrorCode:Check(r1_114) then
    return 
  end
  r0_114:ResetTargetData()
  r0_114:ResetSkinData()
  r0_114.CurrentPlan = r0_114.CurrentSkin.CurrentPlanIndex
  r0_114:ResetPlanName()
  r0_114:ResetNormalCurrentContens()
  r0_114:ResetSpecialCurrentContent()
  r0_114:UpdateComparedContentsByDraft()
  r0_114.CurrentTabIdx = nil
  r0_114:SelectDyePlan(r4_114, r0_114.CurrentTabIdx)
  r0_114:UpdateDraftBtn()
  if r0_114.Parent and r0_114.OpenPreviewDyeFromChat then
    r0_114:ApplyColorsToComparedColors(r0_114.OpenPreviewDyeFromChatColors)
    r0_114:ApplyColorsToNormalDyeTabs(r0_114.OpenPreviewDyeFromChatColors)
  end
  r0_114:OnContrastKeyUp()
  if r0_114.SpecialCurrentContent == r0_114.SpecialDefaultContent then
    r0_114:ChangeToNormalCurrentColors()
  end
end
function r4_0.OnResourcesChanged(r0_115, r1_115)
  -- line: [1876, 1897] id: 115
  if r0_115.CurrentTabIdx == r0_115.NormalColorTabIdx and r0_115.NormalComparedContents then
    if DataMgr.CommonDye[r1_115] then
      r0_115:UpdateItemConsume()
    else
      for r6_115, r7_115 in pairs(r0_115.NormalComparedContents) do
        if r7_115.ResourceId == r1_115 then
          r0_115:UpdateItemConsume()
          break
        end
      end
      -- close: r2_115
    end
  elseif r0_115.SpecialComparedContent and r0_115.SpecialComparedContent.ResourceId == r1_115 then
    r0_115:UpdateItemConsume()
  end
end
function r4_0.PlayInAnim(r0_116)
  -- line: [1899, 1903] id: 116
  r0_116:BlockAllUIInput(true)
  r0_116:StopAnimation(r0_116.Out)
  r0_116:PlayAnimation(r0_116.In)
end
function r4_0.PlayOutAnim(r0_117)
  -- line: [1905, 1913] id: 117
  r0_117:RecoverActorColor()
  r0_117:StopAnimation(r0_117.In)
  r0_117:PlayAnimation(r0_117.Out)
  r0_117:BlockAllUIInput(true)
  if r0_117.LastCameraTags and r0_117.ActorController and not r0_117.bStandaloneWeapon then
    r0_117.ActorController:SetArmoryCameraTag(table.unpack(r0_117.LastCameraTags))
  end
end
function r4_0.OnInAnimFinished(r0_118)
  -- line: [1915, 1917] id: 118
  r0_118:BlockAllUIInput(false)
end
function r4_0.OnOutAnimFinished(r0_119)
  -- line: [1919, 1924] id: 119
  r0_119:Close()
  if r0_119.Parent and r0_119.OpenPreviewDyeFromChat then
    r0_119.Parent:OnBackKeyDown()
  end
end
function r4_0.Close(r0_120)
  -- line: [1926, 1931] id: 120
  r4_0.Super.Close(r0_120)
  if r0_120.OnCloseCallback then
    r0_120.OnCloseCallback(r0_120.ParentWidget)
  end
end
function r4_0.RecoverActorColor(r0_121)
  -- line: [1933, 1949] id: 121
  if not r0_121.CurrentSkin then
    return 
  end
  if r0_121.Type == CommonConst.ArmoryType.Char then
    r0_121:ChangeToNormalCurrentColors()
  elseif r0_121.CurrentSkin:GetWeaponSpecialColor(r0_121.CurrentPlan) == r0_121.DefaultColorId then
    r0_121:ChangeSpecialColor(r0_121.SpecialCurrentContent)
    r0_121:ChangeToNormalCurrentColors()
  else
    r0_121:ChangeToNormalCurrentColors()
    r0_121:ChangeSpecialColor(r0_121.SpecialCurrentContent)
  end
end
function r4_0.ResetTargetData(r0_122)
  -- line: [1951, 1958] id: 122
  local r1_122 = GWorld:GetAvatar()
  if r0_122.Type == CommonConst.ArmoryType.Char then
    r0_122.Target = r1_122.Chars[r0_122.Target.Uuid]
  else
    r0_122.Target = r1_122.Weapons[r0_122.Target.Uuid]
  end
end
function r4_0.ResetSkinData(r0_123)
  -- line: [1960, 1968] id: 123
  local r1_123 = GWorld:GetAvatar()
  if r0_123.Type == CommonConst.ArmoryType.Char then
    r0_123.CurrentSkin = r1_123.CommonChars[r0_123.Target.CharId].OwnedSkins[r0_123.SkinId] and r0_123:CreateDefaultSkin(r0_123.SkinId)
  else
    r0_123.CurrentSkin = r0_123.Target:GetSkin(r0_123.SkinId)
  end
end
function r4_0.OnNormalColorContentCreated(r0_124, r1_124)
  -- line: [1970, 1971] id: 124
end
function r4_0.OnNormalColorListContentCreated(r0_125, r1_125)
  -- line: [1973, 1974] id: 125
end
function r4_0.OnSpecialColorContentCreated(r0_126, r1_126)
  -- line: [1976, 1977] id: 126
end
function r4_0.OnFunctionBtnAddedToFocusPath(r0_127)
  -- line: [1979, 1980] id: 127
end
function r4_0.OnFunctionBtnRemovedFromFocusPath(r0_128)
  -- line: [1982, 1983] id: 128
end
AssembleComponents(r4_0)
return r4_0
