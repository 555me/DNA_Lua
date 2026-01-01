-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\UI_Phone\Battle\WBP_SettingCustomBtn_M_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("Unlua")
local r0_0 = require("BluePrints.UI.UI_Phone.Battle.BattleHUDCommonConst")
local r1_0 = require("EMCache.EMCache")
local r2_0 = Class("BluePrints.UI.BP_UIState_C")
r2_0._components = {
  "BluePrints.UI.UI_Phone.Battle.Component.HUDWidgetDesignComponent"
}
function r2_0.Initialize(r0_1, r1_1)
  -- line: [18, 26] id: 1
  r0_1.Super.Initialize(r0_1)
  r0_1.CurrentSelectWidget = nil
  r0_1.bHaveModifiedLayoutData = false
  r0_1.AllWidgetOperationHistory = {}
  r0_1.bIsFoldedFloat = false
  r0_1.bIsDefaultLayoutData = true
  r0_1.DraggableWidget2ParentNodeMap = {}
end
function r2_0.Construct(r0_2)
  -- line: [29, 33] id: 2
  r0_2:InitConfigData()
  r0_2:InitListenEvent()
  r0_2:BindBtnClick()
end
function r2_0.Destruct(r0_3)
  -- line: [36, 38] id: 3
  r0_3:UnRegisterHUDDesignComponent()
end
function r2_0.OnLoaded(r0_4, ...)
  -- line: [41, 55] id: 4
  local r1_4 = nil	-- notice: implicit variable refs by block#[0]
  ... = ... -- error: untaken top expr
  r0_4.CurEditPlan = r1_4
  r0_4:EnterDesignState(r0_4.CurEditPlan, r0_4.Panel_Skill)
  r1_4 = pairs
  for r5_4, r6_4 in r1_4(r0_4.DraggableWidget2ParentNodeMap) do
    if r5_4 and type(r5_4.EnterDesignState) == "function" then
      r5_4:EnterDesignState(r0_4.CurEditPlan)
    end
  end
  -- close: r1_4
  DebugPrint("HUDWidgetDesignComponent OnLoaded, CurEditPlan is :", r0_4.CurEditPlan, r0_4.bIsDefaultLayoutData)
  r0_4.Btn_Anew:ForbidBtn(r0_4.bIsDefaultLayoutData)
  r0_4.Jump:ChangeByLayout(r0_4.CurEditPlan)
  r0_4:PlayInAnim()
end
function r2_0.PlayInAnim(r0_5)
  -- line: [58, 61] id: 5
  r0_5:PlayAnimationForward(r0_5.In)
end
function r2_0.PlayOutAnim(r0_6)
  -- line: [64, 67] id: 6
  r0_6:BindToAnimationFinished(r0_6.Out, {
    r0_6,
    function()
      -- line: [65, 65] id: 7
      r0_6:Close()
    end
  })
  r0_6:PlayAnimationForward(r0_6.Out)
end
function r2_0.OnDraggableWidgetSelected(r0_8, r1_8)
  -- line: [70, 102] id: 8
  if not IsValid(r1_8) then
    DebugPrint("Error: OnDraggableWidgetSelected function received an invalid widget!")
    return 
  end
  if r0_8.Switch_TipsType:GetActiveWidgetIndex() ~= 0 then
    r0_8.Switch_TipsType:SetActiveWidgetIndex(0)
  end
  if r0_8.CurrentSelectWidget == r1_8 then
    DebugPrint("HUDWidgetDesignComponent OnDraggableWidgetSelected function received the same widget, no need to re-select!")
    return 
  end
  if r0_8.CurrentSelectWidget ~= nil then
    r0_8.CurrentSelectWidget:UnSelectWidget()
  else
    r0_8.Slider:SetIsEnabled(true)
  end
  r0_8.CurrentSelectWidget = r1_8
  r0_8.CurrentSelectWidget:SelectWidget()
  local r2_8 = r0_8.DraggableWidget2ParentNodeMap[r1_8]
  if r2_8 then
    r0_8:UpdateSliderValue(r2_8.RenderTransform.Scale.X)
  end
  if IsEmptyTable(r0_8.AllWidgetOperationHistory[r1_8]) then
    r0_8.Btn_Retract:ForbidBtn(true)
  else
    r0_8.Btn_Retract:ForbidBtn(false)
  end
end
function r2_0.OnDraggableWidgetInfoChanged(r0_9, r1_9, r2_9, r3_9)
  -- line: [105, 124] id: 9
  r0_9.bHaveModifiedLayoutData = true
  local r4_9 = r0_9.AllWidgetOperationHistory[r2_9]
  if r4_9 then
    if r0_0.LayOutSettingConfig.MaxOperationHistoryCount <= #r4_9 then
      table.remove(r4_9, 1)
    end
    table.insert(r0_9.AllWidgetOperationHistory[r2_9], {
      OpType = r1_9,
      Value = r3_9,
    })
  else
    r0_9.AllWidgetOperationHistory[r2_9] = {
      {
        OpType = r1_9,
        Value = r3_9,
      }
    }
  end
  r0_9.Btn_Retract:ForbidBtn(false)
  r0_9.Btn_Anew:ForbidBtn(false)
  if r1_9 ~= "Pos" and r1_9 == "Scale" then
  end
end
function r2_0.InitConfigData(r0_10)
  -- line: [127, 184] id: 10
  local r1_10 = {}
  for r6_10, r7_10 in pairs(r0_0.DesignBaseConfigInHUD) do
    local r8_10 = r0_10[r7_10.WidgetName]
    local r9_10 = {
      WidgetObj = r8_10,
      WidgetName = r7_10.WidgetName,
      InnerActiveSlateName = r7_10.InnerActiveSlateName,
      MaskNodeName = r7_10.MaskNodeName,
      ParentNodeName = r6_10,
    }
    if type(r8_10.InitAllDraggableWidgetInfo) == "function" then
      r8_10:InitAllDraggableWidgetInfo(r0_10, r9_10)
    end
    r1_10[r6_10] = r9_10
    r0_10.DraggableWidget2ParentNodeMap[r8_10] = r0_10[r6_10]
  end
  -- close: r2_10
  local r2_10 = r1_0:Get("SystemLanguage")
  if r2_10 == "CN" or r2_10 == "TC" then
    r0_10.Switch_Language:SetActiveWidgetIndex(1)
  else
    r0_10.Switch_Language:SetActiveWidgetIndex(0)
  end
  r0_10.WBP_Com_CustomTab:Init({
    LeftKey = "NotShow",
    RightKey = "NotShow",
    ChildWidgetName = "TabSubIconTextItemHorizon",
    Tabs = {
      {
        Text = GText("UI_CustomLayout_Skill"),
        Idx = 1,
        IconPath = nil,
      },
      {
        Text = GText("UI_CustomLayout_All"),
        Idx = 2,
        IconPath = nil,
        IsLocked = true,
        LockReasonText = "UI_CustomLayout_LockToast",
      }
    },
    SoundFunc = function()
      -- line: [166, 168] id: 11
      AudioManager(r0_10):PlayUISound(r0_10, "event:/ui/common/click_level_02", nil, nil)
    end,
    SoundFuncReceiver = r0_10,
  })
  r0_10.WBP_Com_CustomTab:SelectTab(1)
  r0_10.Text_Scale:SetText(GText("UI_CustomLayout_Scale"))
  r0_10.Btn_Save:SetText(GText("UI_CustomLayout_Save"))
  r0_10.Text_Choose:SetText(GText("UI_CustomLayout_DefaultTip"))
  r0_10.Switch_TipsType:SetActiveWidgetIndex(1)
  r0_10.Slider:SetIsEnabled(false)
  r0_10:UpdateSliderValue(r0_0.LayOutSettingConfig.DefaultScaleValue)
  r0_10:RegisterHUDDesignComponent(r1_10, false, false)
end
function r2_0.InitListenEvent(r0_12)
  -- line: [187, 189] id: 12
  r0_12:AddDispatcher(EventID.OnMobileHudPlanChanged, r0_12, r0_12.OnMobileHudPlanChanged)
end
function r2_0.UpdateSliderValue(r0_13, r1_13)
  -- line: [193, 199] id: 13
  r0_13.Slider:SetValue((r1_13 - r0_0.LayOutSettingConfig.MinScaleValue) / (r0_0.LayOutSettingConfig.MaxScaleValue - r0_0.LayOutSettingConfig.MinScaleValue))
  r0_13.ProgressBar_Slider:SetPercent(r0_13.Slider:GetValue())
  r0_13.TextScaleNum:SetText(string.format("%.1f", r1_13))
end
function r2_0.BindBtnClick(r0_14)
  -- line: [202, 229] id: 14
  r0_14.Btn_Collapsed.OnClicked:Add(r0_14, r0_14.OnClickedFloatCollapsed)
  r0_14.Btn_Retract:BindEventOnClicked(r0_14, r0_14.OnClickedOperationBack)
  r0_14.Btn_Esc:BindEventOnClicked(r0_14, r0_14.OnClickedExit)
  r0_14.Btn_Anew:BindEventOnClicked(r0_14, r0_14.OnClickedAnewSet)
  r0_14.Btn_Save:BindEventOnClicked(r0_14, r0_14.OnClickedSave)
  if r0_0.LayOutSettingConfig.bIsSupportLongPress then
    r0_14.Btn_Up:SetLongPressEnable(true)
    r0_14.Btn_Down:SetLongPressEnable(true)
    r0_14.Btn_Left:SetLongPressEnable(true)
    r0_14.Btn_Right:SetLongPressEnable(true)
    r0_14.Btn_Up:BindEventOnPressed(r0_14, r0_14.OnClickedMoveUp)
    r0_14.Btn_Down:BindEventOnPressed(r0_14, r0_14.OnClickedMoveDown)
    r0_14.Btn_Left:BindEventOnPressed(r0_14, r0_14.OnClickedMoveLeft)
    r0_14.Btn_Right:BindEventOnPressed(r0_14, r0_14.OnClickedMoveRight)
  else
    r0_14.Btn_Up:BindEventOnClicked(r0_14, r0_14.OnClickedMoveUp)
    r0_14.Btn_Down:BindEventOnClicked(r0_14, r0_14.OnClickedMoveDown)
    r0_14.Btn_Left:BindEventOnClicked(r0_14, r0_14.OnClickedMoveLeft)
    r0_14.Btn_Right:BindEventOnClicked(r0_14, r0_14.OnClickedMoveRight)
  end
  r0_14.Slider.OnValueChanged:Add(r0_14, r0_14.OnSliderValueChanged)
  r0_14.Btn_Retract:ForbidBtn(true)
end
function r2_0.OnSliderValueChanged(r0_15, r1_15)
  -- line: [233, 254] id: 15
  if r0_15.CurrentSelectWidget == nil then
    UIManager(r0_15):ShowUITip(UIConst.Tip_CommonToast, GText("UI_CustomLayout_DefaultTip"))
    return 
  end
  if r0_15:_Numbers_Equal(r1_15, r0_15.ProgressBar_Slider.Percent, 0.0001) then
    DebugPrint("HUDWidgetDesignComponent OnSliderValueChanged function received the same value, no need to update!")
    return 
  end
  if IsValid(r0_15.CurrentSelectWidget) then
    local r3_15 = UE4.UKismetMathLibrary.Lerp(r0_0.LayOutSettingConfig.MinScaleValue, r0_0.LayOutSettingConfig.MaxScaleValue, r1_15)
    DebugPrint("HUDWidgetDesignComponent OnSliderValueChanged set widget scale value, NewScale is :", r3_15)
    r0_15.CurrentSelectWidget:ModifyWidgetScale(r3_15)
    r0_15.ProgressBar_Slider:SetPercent(r0_15.Slider:GetValue())
    r0_15.TextScaleNum:SetText(string.format("%.1f", r3_15))
    AudioManager(r0_15):PlayUISound(r0_15, "event:/ui/common/slider_value_change", nil, nil)
  end
end
function r2_0.OnMobileHudPlanChanged(r0_16, r1_16, r2_16, r3_16)
  -- line: [257, 263] id: 16
  if r1_16 == "Update" then
    r0_16.bHaveModifiedLayoutData = false
    r0_16.AllWidgetOperationHistory = {}
    UIManager(r0_16):ShowUITip(UIConst.Tip_CommonToast, GText("UI_CustomLayout_SaveToast"))
  end
end
function r2_0.OnClickedFloatCollapsed(r0_17)
  -- line: [266, 276] id: 17
  if r0_17.bIsFoldedFloat then
    r0_17:PlayAnimation(r0_17.Expand)
    r0_17.bIsFoldedFloat = false
    AudioManager(r0_17):PlayUISound(r0_17, "event:/ui/common/ui_scale_panel_expand", "CustomHUDSetting", nil)
  else
    r0_17:PlayAnimation(r0_17.Fold)
    r0_17.bIsFoldedFloat = true
    AudioManager(r0_17):PlayUISound(r0_17, "event:/ui/common/ui_scale_panel_shrink", "CustomHUDSetting", nil)
  end
end
function r2_0.OnClickedSave(r0_18)
  -- line: [279, 284] id: 18
  r0_18:SaveAllWidgetLayoutData(r0_18.CurEditPlan)
  r0_18.Btn_Retract:ForbidBtn(true)
  r0_18.Btn_Anew:ForbidBtn(true)
end
function r2_0.OnClickedOperationBack(r0_19)
  -- line: [287, 302] id: 19
  local r1_19 = r0_19.AllWidgetOperationHistory[r0_19.CurrentSelectWidget]
  if r1_19 then
    table.remove(r1_19, 1)
    if IsEmptyTable(r1_19) then
      r0_19.Btn_Retract:ForbidBtn(true)
      r0_19.AllWidgetOperationHistory[r0_19.CurrentSelectWidget] = nil
      r0_19:ResetSingleItemToDefaultLayout(r0_19.CurrentSelectWidget)
      r0_19:UpdateSliderValue(r0_0.LayOutSettingConfig.DefaultScaleValue)
      UIManager(r0_19):ShowUITip(UIConst.Tip_CommonToast, GText("UI_CustomLayout_WithdrawToast"))
    else
      local r2_19 = r1_19[#r1_19]
      r0_19:SetSingleItemToLastRecordState(r0_19.CurrentSelectWidget, r2_19.OpType, r2_19.Value)
    end
  end
end
function r2_0.OnClickedExit(r0_20)
  -- line: [305, 325] id: 20
  if r0_20:IsPlayingAnimation(r0_20.Out) then
    DebugPrint("HUDWidgetDesignComponent OnClickedExit function is playing Out animation, cannot exit now!")
    return 
  end
  if r0_20.bHaveModifiedLayoutData then
    UIManager(r0_20):ShowCommonPopupUI(100273, {
      RightCallbackFunction = function()
        -- line: [312, 316] id: 21
        r0_20:SaveAllWidgetLayoutData(r0_20.CurEditPlan)
        r0_20.bHaveModifiedLayoutData = false
        r0_20:PlayOutAnim()
      end,
      LeftCallbackFunction = function()
        -- line: [317, 320] id: 22
        r0_20.bHaveModifiedLayoutData = false
        r0_20:PlayOutAnim()
      end,
    }, r0_20)
  else
    r0_20:PlayOutAnim()
  end
end
function r2_0.OnClickedAnewSet(r0_23)
  -- line: [328, 338] id: 23
  UIManager(r0_23):ShowCommonPopupUI(100274, {
    RightCallbackFunction = function()
      -- line: [330, 336] id: 24
      r0_23:ResetToDefaultLayout()
      r0_23.bHaveModifiedLayoutData = true
      r0_23.Btn_Retract:ForbidBtn(true)
      r0_23.Btn_Anew:ForbidBtn(true)
      r0_23.AllWidgetOperationHistory = {}
    end,
  }, r0_23)
end
function r2_0.OnClickedMoveUp(r0_25)
  -- line: [341, 349] id: 25
  if r0_25.CurrentSelectWidget == nil then
    UIManager(r0_25):ShowUITip(UIConst.Tip_CommonToast, GText("UI_CustomLayout_DefaultTip"))
    return 
  end
  if IsValid(r0_25.CurrentSelectWidget) then
    r0_25.CurrentSelectWidget:MoveWidgetByOffset(FVector2D(0, -r0_0.LayOutSettingConfig.MoveOffsetStep))
  end
end
function r2_0.OnClickedMoveDown(r0_26)
  -- line: [352, 360] id: 26
  if r0_26.CurrentSelectWidget == nil then
    UIManager(r0_26):ShowUITip(UIConst.Tip_CommonToast, GText("UI_CustomLayout_DefaultTip"))
    return 
  end
  if IsValid(r0_26.CurrentSelectWidget) then
    r0_26.CurrentSelectWidget:MoveWidgetByOffset(FVector2D(0, r0_0.LayOutSettingConfig.MoveOffsetStep))
  end
end
function r2_0.OnClickedMoveLeft(r0_27)
  -- line: [363, 371] id: 27
  if r0_27.CurrentSelectWidget == nil then
    UIManager(r0_27):ShowUITip(UIConst.Tip_CommonToast, GText("UI_CustomLayout_DefaultTip"))
    return 
  end
  if IsValid(r0_27.CurrentSelectWidget) then
    r0_27.CurrentSelectWidget:MoveWidgetByOffset(FVector2D(-r0_0.LayOutSettingConfig.MoveOffsetStep, 0))
  end
end
function r2_0.OnClickedMoveRight(r0_28)
  -- line: [374, 382] id: 28
  if r0_28.CurrentSelectWidget == nil then
    UIManager(r0_28):ShowUITip(UIConst.Tip_CommonToast, GText("UI_CustomLayout_DefaultTip"))
    return 
  end
  if IsValid(r0_28.CurrentSelectWidget) then
    r0_28.CurrentSelectWidget:MoveWidgetByOffset(FVector2D(r0_0.LayOutSettingConfig.MoveOffsetStep, 0))
  end
end
AssembleComponents(r2_0)
return r2_0
