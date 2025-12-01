-- filename: @E:/Pack/Branch/OBT10_Geili\Content/Script/BluePrints\UI\UI_PC\Common\Common_ItemDetails\WBP_Common_ItemDetails_PC_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = UE4.UWidgetBlueprintLibrary.Handled()
local r1_0 = Class({
  "BluePrints.UI.BP_UIState_C"
})
function r1_0.Construct(r0_1)
  -- line: [23, 49] id: 1
  r1_0.Super.Construct(r0_1)
  r0_1.Panel_Detail:SetRenderOpacity(0)
  r0_1.bIsFocusable = true
  r0_1:PlayAnimation(r0_1.In)
  if CommonUtils.GetDeviceTypeByPlatformName(r0_1) == "Mobile" then
    r0_1:OverrideSizeX(r0_1.PhoneSizeBoxWidth)
  else
    r0_1:OverrideSizeX(r0_1.PCSizeBoxWidth)
  end
  r0_1.bShowLock = false
  r0_1.Text_WeaponLevel01:SetText(GText("UI_LEVEL_NAME"))
  r0_1.Text_Level01:SetText(GText("UI_LEVEL_NAME"))
  r0_1.Text_Method:SetText(GText("UI_Tips_Obtining"))
  r0_1.Line:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_1:AddInputMethodChangedListen()
  r0_1.Btn02_Mod:SetVisibility(ESlateVisibility.Collapsed)
  r0_1.Btn01_Mod:SetVisibility(ESlateVisibility.Collapsed)
  r0_1.Img_Aura:SetVisibility(ESlateVisibility.Collapsed)
  r0_1.List_ModStar:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_1.Btn02PadKey = UIConst.GamePadKey.FaceButtonTop
  r0_1.Btn01PadKey = UIConst.GamePadKey.FaceButtonLeft
  r0_1.LockPadKey = UIConst.GamePadKey.SpecialRight
  r0_1._bFocusOnce = true
end
function r1_0.Destruct(r0_2)
  -- line: [51, 57] id: 2
  r0_2.btn02_mod:UnBindEventOnClickedByObj(r0_2)
  r0_2.btn01_mod:UnBindEventOnClickedByObj(r0_2)
  r0_2.Btn_Locked:UnBindEventOnReleased(r0_2, r0_2._BtnLockedReleased)
  r0_2.Btn_Locked:UnBindEventOnPressed(r0_2, r0_2._BtnLockedPressed)
  r1_0.Super.Destruct(r0_2)
end
function r1_0.InitItemBaseInfo(r0_3, r1_3)
  -- line: [59, 82] id: 3
  -- error: decompile function#3: Condition failed: `def_pos <= last_end && last_end <= self.stmts.len()`
end
function r1_0.RefreshItemInfo(r0_4, r1_4, r2_4, r3_4)
  -- line: [88, 183] id: 4
  -- error: decompile function#4: Condition failed: `def_pos <= last_end && last_end <= self.stmts.len()`
end
function r1_0.OverrideSizeX(r0_5, r1_5)
  -- line: [185, 187] id: 5
  r0_5.SizeBox:SetWidthOverride(r1_5)
end
function r1_0.InitItemDetails(r0_6, r1_6, r2_6, r3_6)
  -- line: [189, 283] id: 6
  r0_6.VerticalBox_Info:ClearChildren()
  r0_6.Switch_Show:SetActiveWidgetIndex(0)
  local r4_6 = GWorld:GetAvatar()
  r0_6.Panel_Extra:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_6.Switch_Bg:SetActiveWidgetIndex(0)
  r0_6.Switch_Frame:SetActiveWidgetIndex(0)
  if r0_6.Content and r0_6.Content.DetailsButtonClickCallback then
    r0_6.Switch_Bg:SetActiveWidgetIndex(1)
    r0_6.Switch_Frame:SetActiveWidgetIndex(1)
    r0_6.Panel_Extra:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r0_6.Line:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_6.Btn02_Mod:SetVisibility(ESlateVisibility.Visible)
    r0_6.btn02_mod:SetText(r0_6.Content.DetailsButtonText)
    r0_6.btn02_mod:BindEventOnClicked(r0_6.Content.Parent, r0_6.Content.DetailsButtonClickCallback, r0_6.Content)
  end
  local r5_6 = nil
  if r1_6 == "Mod" then
    if r0_6.Content.IsArmoryMod then
      r5_6 = r0_6:CreateWidgetNew("ArmoryModItemDetails")
    else
      r5_6 = r0_6:CreateWidgetNew("ModItemDetails")
    end
    local r6_6 = DataMgr.Mod[r0_6.ItemId]
    if r6_6 and r6_6.ApplySlot and #r6_6.ApplySlot == 1 and r6_6.ApplySlot[1] == 9 then
      r0_6.Img_Aura:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    else
      r0_6.Img_Aura:SetVisibility(ESlateVisibility.Collapsed)
    end
  elseif r1_6 == "Tips" or r1_6 == "Resource" or r1_6 == "CharAccessory" or r1_6 == "WeaponAccessory" or r1_6 == "CharPartMesh" or r1_6 == "RougeLikeBlessing" or r1_6 == "RougeLikeTreasure" or r1_6 == "HeadSculpture" or r1_6 == "HeadFrame" or r1_6 == "Skin" or r1_6 == "WeaponSkin" or r1_6 == "Title" or r1_6 == "TitleFrame" then
    if r4_6.Resources[r2_6] and r4_6.Resources[r2_6]:IsInfiniteBattleItem() and r0_6:IsHasChar(r2_6) then
      r0_6.Switch_Show:SetActiveWidgetIndex(1)
      r5_6 = r0_6:CreateWidgetNew("PhantomItemDetails")
    else
      r0_6.Panel_Extra:SetVisibility(UIConst.VisibilityOp.Collapsed)
      r0_6.Switch_Bg:SetActiveWidgetIndex(0)
      r0_6.Switch_Frame:SetActiveWidgetIndex(0)
      r5_6 = r0_6:CreateWidgetNew("ResourceItemDetails")
    end
  elseif r1_6 == "Draft" then
    r5_6 = r0_6:CreateWidgetNew("DraftItemDetails")
  elseif r1_6 == "Weapon" then
    r0_6.Switch_Show:SetActiveWidgetIndex(2)
    r5_6 = r0_6:CreateWidgetNew("WeaponItemDetails")
  elseif r1_6 == "Reward" then
    r5_6 = r0_6:CreateWidgetNew("RewardItemDetails")
  elseif r1_6 == "Pet" then
    r0_6.Switch_Show:SetActiveWidgetIndex(2)
    r5_6 = r0_6:CreateWidgetNew("PetItemDetails")
  elseif r1_6 == "TreasureGroup" then
    r0_6.Text_Describe:SetVisibility(ESlateVisibility.Collapsed)
    if not r0_6.Content.bGuide then
      r0_6.Text_Describe:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      r0_6.Panel_Hold:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      r0_6.Switch_Show:SetActiveWidgetIndex(4)
      if r0_6.Content.bActive then
        r0_6.Text_Describe:SetText(GText("RLGroup_Active"))
      else
        r0_6.Text_Describe:SetText(GText("RLGroup_InActive"))
      end
    else
      r0_6.Panel_Hold:SetVisibility(ESlateVisibility.Collapsed)
    end
    r5_6 = r0_6:CreateWidgetNew("DescribeDetails")
    r5_6.Text_Describe:SetText(GText(DataMgr.TreasureGroup[r2_6].GroupEffectDesc))
    r0_6.VerticalBox_Info:AddChild(r5_6)
    return 
  elseif r0_6.Parent then
    r0_6.Parent:Close()
    return 
  end
  if r1_6 == "Resource" or r1_6 == "Mod" and not r0_6.Content.IsArmoryMod or r1_6 == "CharPartMesh" or r1_6 == "Draft" or r0_6.Content.bShowAccess then
    r0_6:SetAccessItem(r1_6, r2_6)
  else
    r0_6.Panel_Method:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if r5_6 then
    r0_6.ItemInfoWidget = r5_6
    r5_6.ParentWidget = r0_6
    r5_6:InitItemInfo(r1_6, r2_6, r3_6, r0_6.Content)
    r0_6.VerticalBox_Info:AddChild(r5_6)
  end
end
function r1_0.SetAccessItem(r0_7, r1_7, r2_7)
  -- line: [285, 305] id: 7
  r0_7.Method:ClearChildren(r1_7, r2_7)
  local r3_7 = DataMgr[r1_7][r2_7]
  assert(r3_7, "不存在该物品：", r1_7, r2_7)
  r0_7.Key_Controller_Method:SetVisibility(ESlateVisibility.Collapsed)
  r0_7.Panel_Method:SetVisibility(ESlateVisibility.Collapsed)
  if r3_7.AccessKey then
    for r8_7, r9_7 in pairs(r3_7.AccessKey) do
      PageJumpUtils:GetItemAccess(r0_7, r2_7, r1_7, r9_7, r0_7.Content.UIName, r0_7.JumpReturnCallBack)
    end
    -- close: r4_7
    PageJumpUtils:SortAccessItem(r0_7.Method)
    if r0_7.Method:GetChildrenCount() > 0 then
      r0_7.Panel_Method:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad and r0_7:GetFirstJumpItem() then
        r0_7.Key_Controller_Method:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      end
    end
  end
end
function r1_0.IsHasChar(r0_8, r1_8)
  -- line: [307, 317] id: 8
  local r2_8 = GWorld:GetAvatar()
  if r2_8 then
    for r7_8, r8_8 in pairs(r2_8.Chars) do
      if r8_8.CharId == DataMgr.Resource[r1_8].UseParam then
        return true
      end
    end
    -- close: r3_8
  end
  return false
end
function r1_0.InitButtonStyle(r0_9)
  -- line: [322, 328] id: 9
  r0_9.Switch_Bg:SetActiveWidgetIndex(1)
  r0_9.Switch_Frame:SetActiveWidgetIndex(1)
  r0_9.Panel_Extra:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_9.Panel_Button:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_9.Line:SetVisibility(UIConst.VisibilityOp.Collapsed)
end
function r1_0.RealInitButtonEvent(r0_10, r1_10, r2_10, r3_10, r4_10)
  -- line: [331, 342] id: 10
  local function r5_10()
    -- line: [332, 337] id: 11
    if not r4_10 and r0_10.ParentWidget then
      r0_10.ParentWidget:CloseItemDetailsWidget(true)
    end
    r2_10()
  end
  r0_10:InitButtonStyle()
  r1_10:SetText(GText(r3_10))
  r1_10:UnBindEventOnClickedByObj(r0_10)
  r1_10:BindEventOnClicked(r0_10, r5_10)
end
function r1_0.InitButtonEvent(r0_12, r1_12)
  -- line: [351, 371] id: 12
  if not r1_12 or not r1_12.ButtonClickCallBack then
    return 
  end
  r0_12.Btn02_Mod:SetVisibility(ESlateVisibility.Visible)
  if r1_12.ButtonClickPadKey then
    r0_12.Btn02PadKey = r1_12.ButtonClickPadKey
  end
  r0_12.WS_Icon_R:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  if r1_12.ButtonIcon == 1 then
    r0_12.WS_Icon_R:SetActiveWidgetIndex(0)
  elseif r1_12.ButtonIcon == 2 then
    r0_12.WS_Icon_R:SetActiveWidgetIndex(1)
  elseif r1_12.ButtonIcon == 3 then
    r0_12.WS_Icon_R:SetActiveWidgetIndex(2)
  else
    r0_12.WS_Icon_R:SetVisibility(ESlateVisibility.Collapsed)
  end
  r0_12.Btn02_Mod:SetGamePadImg(DataMgr.KeyboardText[r0_12.Btn02PadKey].KeyText)
  r0_12:RealInitButtonEvent(r0_12.Btn02_Mod, r1_12.ButtonClickCallBack, r1_12.ButtonClickText, r1_12.bNotCloseTips)
end
function r1_0.HideButtons(r0_13)
  -- line: [373, 376] id: 13
  r0_13.Btn02_Mod:SetVisibility(ESlateVisibility.Collapsed)
  r0_13.Btn01_Mod:SetVisibility(ESlateVisibility.Collapsed)
end
function r1_0.InitButton01Event(r0_14, r1_14)
  -- line: [384, 404] id: 14
  if not r1_14 or not r1_14.ButtonClickCallBack then
    return 
  end
  r0_14.Btn01_Mod:SetVisibility(ESlateVisibility.Visible)
  if r1_14.ButtonClickPadKey then
    r0_14.Btn01PadKey = r1_14.ButtonClickPadKey
  end
  r0_14.WS_Icon_L:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  if r1_14.ButtonIcon == 1 then
    r0_14.WS_Icon_L:SetActiveWidgetIndex(0)
  elseif r1_14.ButtonIcon == 2 then
    r0_14.WS_Icon_L:SetActiveWidgetIndex(1)
  elseif r1_14.ButtonIcon == 3 then
    r0_14.WS_Icon_L:SetActiveWidgetIndex(2)
  else
    r0_14.WS_Icon_L:SetVisibility(ESlateVisibility.Collapsed)
  end
  r0_14.Btn01_Mod:SetGamePadImg(DataMgr.KeyboardText[r0_14.Btn01PadKey].KeyText)
  r0_14:RealInitButtonEvent(r0_14.Btn01_Mod, r1_14.ButtonClickCallBack, r1_14.ButtonClickText, r1_14.bNotCloseTips)
end
function r1_0.InitLockedEvent(r0_15, r1_15)
  -- line: [410, 426] id: 15
  if not r1_15 or not r1_15.LockedButtonClickCallBack then
    return 
  end
  if r1_15.LockPadKey then
    r0_15.LockPadKey = r1_15.LockPadKey
  end
  r0_15.bShowLock = true
  r0_15.Btn_Locked:SetVisibility(ESlateVisibility.Visible)
  r0_15.Switcher_Lock:SetActiveWidgetIndex(1)
  r0_15.bLocked = false
  r0_15.Btn_Locked:UnBindEventOnReleased(r0_15, r0_15._BtnLockedReleased)
  r0_15.Btn_Locked:UnBindEventOnPressed(r0_15, r0_15._BtnLockedPressed)
  r0_15.Btn_Locked:BindEventOnPressed(r0_15, r0_15._BtnLockedPressed)
  r0_15.Btn_Locked:BindEventOnReleased(r0_15, r0_15._BtnLockedReleased, r1_15)
end
function r1_0._BtnLockedPressed(r0_16)
  -- line: [428, 430] id: 16
  r0_16:OnMouseButtonDown()
end
function r1_0._BtnLockedReleased(r0_17, r1_17)
  -- line: [431, 446] id: 17
  local function r2_17(r0_18)
    -- line: [432, 439] id: 18
    r0_17.bLocked = r0_18
    if r0_17.bLocked then
      r0_17.Switcher_Lock:SetActiveWidgetIndex(0)
    else
      r0_17.Switcher_Lock:SetActiveWidgetIndex(1)
    end
  end
  local r3_17 = r1_17.bWaitRPCRet
  r1_17.LockedButtonClickCallBack(r2_17)
  if r3_17 then
    return 
  end
  r2_17(not r0_17.bLocked)
end
function r1_0.SetConflictLine(r0_19, r1_19, r2_19, r3_19)
  -- line: [452, 466] id: 19
  if r1_19 then
    r0_19.Line:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_19.Line.Text_Level:SetText(GText(r2_19))
    if r3_19 == 1 then
      r0_19.Line.Bg02:SetColorAndOpacity(r0_19.Line.Red)
    elseif r3_19 == 2 then
      r0_19.Line.Bg02:SetColorAndOpacity(r0_19.Line.Yellow)
    else
      r0_19.Line.Bg02:SetColorAndOpacity(r0_19.Line.White)
    end
  else
    r0_19.Line:SetVisibility(ESlateVisibility.Collapsed)
  end
end
function r1_0.GetFirstJumpItem(r0_20)
  -- line: [469, 479] id: 20
  local r1_20 = r0_20.Method:GetAllChildren():ToTable()
  local r2_20 = nil
  for r7_20, r8_20 in pairs(r1_20) do
    if not r8_20.IsText then
      r2_20 = r8_20
      break
    end
  end
  -- close: r3_20
  return r2_20
end
function r1_0.FocusJumpItem(r0_21)
  -- line: [481, 489] id: 21
  local r1_21 = r0_21:GetFirstJumpItem()
  if r1_21 then
    UGameInputModeSubsystem.GetGameInputModeSubsystem(r0_21):SetShowFocusedWidget(nil)
    r1_21.Btn_Click:SetFocus()
  end
end
function r1_0.OnKeyDown(r0_22, r1_22, r2_22)
  -- line: [491, 512] id: 22
  local r3_22 = UE4.UKismetInputLibrary.GetKey(r2_22)
  local r4_22 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_22)
  local r5_22 = false
  if r0_22.KeyDownEvent then
    local r6_22 = nil
    r6_22, r5_22 = r0_22.KeyDownEvent.Callback(r0_22.KeyDownEvent.Obj, r1_22, r2_22, r0_22.KeyDownEvent.Params)
    if r5_22 then
      return r6_22
    end
  end
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_22) then
    r5_22 = r0_22:OnGamePadDown(r4_22)
  end
  if r5_22 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end
function r1_0.TryGoToFirstItem(r0_23)
  -- line: [514, 523] id: 23
  if r0_23:GetFirstJumpItem() then
    r0_23.bFocusItem = true
    r0_23:FocusJumpItem()
    return true
  end
  return false
end
function r1_0.OnGamePadDown(r0_24, r1_24)
  -- line: [525, 550] id: 24
  local r2_24 = r0_24.HandleKeyDown
  if r1_24 == UIConst.GamePadKey.FaceButtonRight then
    if r0_24.bFocusItem then
      r0_24.bFocusItem = false
      r0_24:SetFocus()
    elseif r0_24.ParentWidget then
      r0_24.ParentWidget:CloseItemDetailsWidget(true)
      local r3_24 = r0_24.ParentWidget.ParentWidget
      if r3_24 and r3_24.bIsFocusable then
        r3_24:SetFocus()
      end
    end
  elseif r1_24 == UIConst.GamePadKey.SpecialLeft then
    r0_24:TryGoToFirstItem()
  elseif r1_24 == r0_24.LockPadKey then
    r0_24.Btn_Locked:OnBtnClicked()
  elseif r1_24 == r0_24.Btn02PadKey then
    r0_24.Btn02_Mod:OnBtnClicked()
  elseif r1_24 == r0_24.Btn01PadKey then
    r0_24.Btn01_Mod:OnBtnClicked()
  end
  return r2_24
end
function r1_0.OnAnalogValueChanged(r0_25, r1_25, r2_25)
  -- line: [552, 566] id: 25
  if UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_25)) == UIConst.GamePadKey.RightAnalogY then
    r0_25.EMScrollBox_1:SetScrollOffset(math.clamp(r0_25.EMScrollBox_1:GetScrollOffset() + UKismetInputLibrary.GetAnalogValue(r2_25) * -1 * 5, 0, r0_25.EMScrollBox_1:GetScrollOffsetOfEnd()))
  end
  if r0_25.HandleKeyDown then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end
function r1_0.SetCallbacks(r0_26, r1_26)
  -- line: [568, 571] id: 26
  r0_26.CallObj = r1_26.CallObj
  r0_26.OnMouseButtonDownCallback = r1_26.OnMouseButtonDownCallback
end
function r1_0.OnMouseButtonDown(r0_27, r1_27, r2_27)
  -- line: [574, 579] id: 27
  if r0_27.OnMouseButtonDownCallback then
    r0_27.OnMouseButtonDownCallback(r0_27.CallObj, r1_27, r2_27)
  end
  return r0_0
end
function r1_0.OnMouseButtonUp(r0_28, r1_28, r2_28)
  -- line: [581, 583] id: 28
  return r0_0
end
function r1_0.OnMouseMove(r0_29, r1_29, r2_29)
  -- line: [585, 587] id: 29
  return r0_0
end
function r1_0.OnMouseWheel(r0_30, r1_30, r2_30)
  -- line: [589, 591] id: 30
  return r0_0
end
function r1_0.OnMouseButtonDoubleClick(r0_31, r1_31, r2_31)
  -- line: [593, 595] id: 31
  return r0_0
end
function r1_0.OnMouseEnter(r0_32, r1_32, r2_32)
  -- line: [597, 602] id: 32
  if r0_32.Content.bIsHoverState and r0_32.Parent and UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    r0_32.Parent:Close()
  end
end
function r1_0.OnUpdateUIStyleByInputTypeChange(r0_33, r1_33, r2_33)
  -- line: [603, 637] id: 33
  local r3_33 = r0_33.Content and not r0_33.Content.bIsHoverState
  if r1_33 == UE4.ECommonInputType.Gamepad and r3_33 then
    if r0_33.bShowLock then
      r0_33.Key_Lock:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
    if r0_33.Content and not r0_33.Content.bHideGamePad then
      r0_33.Panel_Controller:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
    if r0_33:GetFirstJumpItem() then
      r0_33.Key_Controller_Method:SetVisibility(ESlateVisibility.Visible)
    end
    r0_33:InitGamepadView(r2_33)
    r0_33.Key_Confirm:SetVisibility(ESlateVisibility.Collapsed)
  elseif r1_33 == UE4.ECommonInputType.MouseAndKeyboard then
    r0_33.Key_Lock:SetVisibility(ESlateVisibility.Collapsed)
    r0_33.Panel_Controller:SetVisibility(ESlateVisibility.Collapsed)
    r0_33.Key_Controller_Method:SetVisibility(ESlateVisibility.Collapsed)
  elseif r1_33 == UE4.ECommonInputType.Gamepad and r0_33.Content and r0_33.Content.ConfirmDesc then
    r0_33.Key_Confirm:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgLongPath = UIUtils.UtilsGetKeyIconPathInGamepad("A", r2_33),
        }
      },
      Desc = GText(r0_33.Content.ConfirmDesc),
    })
    if r0_33.Content and not r0_33.Content.bHideGamePad then
      r0_33.Panel_Controller:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
    r0_33.Key_Back:SetVisibility(ESlateVisibility.Collapsed)
    r0_33.Key_Confirm:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end
function r1_0.InitGamepadView(r0_34, r1_34)
  -- line: [639, 665] id: 34
  local r2_34 = r0_34.Key_Back
  local r4_34 = {}
  r4_34.KeyInfoList = {
    {
      Type = "Img",
      ImgLongPath = UIUtils.UtilsGetKeyIconPathInGamepad("B", r1_34),
    }
  }
  r4_34.Desc = GText("UI_Tips_Close")
  r2_34:CreateCommonKey(r4_34)
  r2_34 = r0_34.Key_Lock
  r4_34 = {}
  local r5_34 = {}
  local r6_34 = {
    Type = "Img",
  }
  r6_34.ImgShortPath = DataMgr.KeyboardText[r0_34.LockPadKey and UIConst.GamePadKey.SpecialRight].KeyText
  -- setlist for #5 failed
  r4_34.KeyInfoList = r5_34
  r2_34:CreateCommonKey(r4_34)
  r0_34.Key_Controller_Method:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = DataMgr.KeyboardText[UIConst.GamePadKey.SpecialLeft].KeyText,
      }
    },
  })
end
function r1_0.OnAddedToFocusPath(r0_35, r1_35)
  -- line: [667, 671] id: 35
  if r0_35.OnAddedToFocusPathEvent and type(r0_35.OnAddedToFocusPathEvent) == "table" then
    r0_35.OnAddedToFocusPathEvent.Callback(r0_35.OnAddedToFocusPathEvent.Obj, r0_35.OnAddedToFocusPathEvent.Params)
  end
end
function r1_0.OnRemovedFromFocusPath(r0_36, r1_36)
  -- line: [673, 677] id: 36
  if r0_36.OnRemovedFromFocusPathEvent and type(r0_36.OnRemovedFromFocusPathEvent) == "table" then
    r0_36.OnRemovedFromFocusPathEvent.Callback(r0_36.OnRemovedFromFocusPathEvent.Obj, r0_36.OnRemovedFromFocusPathEvent.Params)
  end
end
function r1_0.PlayInAnim(r0_37)
  -- line: [679, 682] id: 37
  r0_37:StopAnimation(r0_37.Out)
  r0_37:PlayAnimation(r0_37.In)
end
function r1_0.PlayOutAnim(r0_38)
  -- line: [684, 687] id: 38
  r0_38:StopAnimation(r0_38.In)
  r0_38:PlayAnimation(r0_38.Out)
end
return r1_0
