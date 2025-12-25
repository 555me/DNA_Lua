-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\Forge\WBP_Forge_Item_Widget_PC_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("Blueprints.UI.Forge.ForgeConst")
local r1_0 = require("Blueprints.UI.Forge.ForgeUtils")
local r2_0 = require("Utils.TimeUtils")
local r3_0 = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})
function r3_0.Construct(r0_1)
  -- line: [9, 12] id: 1
  r0_1.GameInputSubsystem = UIManager(r0_1):GetGameInputModeSubsystem()
  r0_1.GameInputSubsystem.OnInputMethodChanged:Add(r0_1, r0_1.RefreshOpInfoByInputDevice)
end
function r3_0.OnListItemObjectSet(r0_2, r1_2)
  -- line: [14, 23] id: 2
  r0_2.Content = r1_2
  r0_2.Content.Widget = r0_2
  r0_2.EventStartProduce = nil
  r0_2.EventShowPath = nil
end
function r3_0.OnMouseEnter(r0_3, r1_3, r2_3)
  -- line: [25, 27] id: 3
end
function r3_0.OnMouseLeave(r0_4, r1_4, r2_4)
  -- line: [29, 31] id: 4
end
function r3_0.OnKeyDown(r0_5, r1_5, r2_5)
  -- line: [33, 47] id: 5
  local r4_5 = UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_5))
  if r4_5 == Const.GamepadFaceButtonDown then
    r0_5.BtnStart:OnBtnPressed()
    r0_5.BtnStart:OnBtnClicked()
    return UE4.UWidgetBlueprintLibrary.Handled()
  elseif r4_5 == Const.GamepadFaceButtonLeft and r0_5.Content.State == r0_0.DraftState.InProgress then
    r0_5:OnBtnCancelClicked()
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end
function r3_0.SetGamepadFocus(r0_6, r1_6)
  -- line: [51, 66] id: 6
  if not UIUtils.IsGamepadInput() then
    return 
  end
  if r1_6 then
    r0_6:PlayAnimation(r0_6.Hover)
    r0_6.BtnStart:SetGamePadVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_6.BtnReward:SetGamePadIconVisible(true)
    r0_6.Key_Controller_Cancel:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_6.BtnStart.WS_Type:SetActiveWidgetIndex(1)
  else
    r0_6:PlayAnimation(r0_6.UnHover)
    r0_6.BtnStart:SetGamePadVisibility(UE4.ESlateVisibility.Collapsed)
    r0_6.BtnReward:SetGamePadIconVisible(false)
    r0_6.Key_Controller_Cancel:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_6.BtnStart.WS_Type:SetActiveWidgetIndex(0)
  end
end
function r3_0.OnFocusReceived(r0_7, r1_7, r2_7)
  -- line: [69, 76] id: 7
  if UIUtils.UtilsGetCurrentInputType() == UE4.ECommonInputType.Gamepad and r0_7.Content.OnReceiveFocus then
    r0_7.Content.OnReceiveFocus(r0_7)
  end
  return UIUtils.Handle
end
function r3_0.OnFocusLost(r0_8, r1_8)
  -- line: [78, 84] id: 8
  if UIUtils.UtilsGetCurrentInputType() == UE4.ECommonInputType.Gamepad and r0_8.Content.OnLostFocus then
    r0_8.Content.OnLostFocus(r0_8)
  end
end
function r3_0.RefreshOpInfoByInputDevice(r0_9)
  -- line: [86, 96] id: 9
  r0_9.CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  r0_9.CurGamepadName = UIUtils.UtilsGetCurrentGamepadName()
  if r0_9.CurInputDeviceType == UE4.ECommonInputType.Gamepad then
    r0_9:InitGamepadView()
  elseif UIUtils.IsMobileInput() then
    r0_9:InitMobileView()
  else
    r0_9:InitKeyboardView()
  end
end
function r3_0.EnableGamepadBlock(r0_10, r1_10)
  -- line: [98, 105] id: 10
  if not r0_10.BtnGamepadBlock then
    return 
  end
  if r1_10 then
    r0_10.BtnGamepadBlock:SetVisibility(UE4.ESlateVisibility.Visible)
  else
    r0_10.BtnGamepadBlock:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r3_0.InitGamepadView(r0_11)
  -- line: [107, 126] id: 11
  r0_11.Cost_Resource:SwitchToPC()
  r0_11.Cost_Ticket:SwitchToPC()
  r0_11.BtnStart:SetGamePadVisibility(UE4.ESlateVisibility.Collapsed)
  r0_11:EnableGamepadBlock(true)
  r0_11.Key_Controller_Cancel:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = UIConst.GamePadImgKey.FaceButtonLeft,
      }
    },
  })
  r0_11.Btn_Cancel:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_11.BtnReward:SetDefaultGamePadImg("A")
end
function r3_0.InitKeyboardView(r0_12)
  -- line: [128, 138] id: 12
  r0_12:PlayAnimation(r0_12.Normal)
  r0_12.BtnStart:SetGamePadVisibility(UE4.ESlateVisibility.Collapsed)
  r0_12:EnableGamepadBlock(false)
  r0_12.Key_Controller_Cancel:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_12.Btn_Cancel:SetVisibility(UE4.ESlateVisibility.Visible)
  r0_12.BtnStart.WS_Type:SetActiveWidgetIndex(0)
  r0_12.BtnReward:SetDefaultGamePadImg("A")
end
function r3_0.InitMobileView(r0_13)
  -- line: [140, 144] id: 13
  r0_13:PlayAnimation(r0_13.Normal)
  r0_13.Btn_Cancel:SetVisibility(UE4.ESlateVisibility.Visible)
  r0_13.BtnStart:SetGamePadVisibility(UE4.ESlateVisibility.Collapsed)
end
function r3_0.EnterShowItemView(r0_14)
  -- line: [147, 151] id: 14
  r0_14.ItemWidget:SetFocus()
  r0_14.BtnStart:SetGamePadVisibility(UE4.ESlateVisibility.Collapsed)
  r0_14:EnableGamepadBlock(false)
end
function r3_0.LeaveShowItemView(r0_15)
  -- line: [154, 157] id: 15
  r0_15.BtnStart:SetGamePadVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_15:EnableGamepadBlock(true)
end
function r3_0.SetHovered(r0_16, r1_16)
  -- line: [164, 172] id: 16
  if r1_16 then
    r0_16:PlayAnimation(r0_16.State_Hover)
    r0_16.Hover_HighLight:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    r0_16.Hover_HighLight:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r3_0.OnBtnStartClicked(r0_17)
  -- line: [175, 189] id: 17
  if r0_17.WidgetCurrentState == r0_0.DraftState.NotStarted and (not r0_17.Content.IsFoundryEnough or not r0_17.Content.IsResourceEnough) then
    if r0_17.EventShowPath then
      r0_17.EventShowPath()
    else
      DebugPrint("Tianyi@ EventShowPath not bind")
    end
  elseif r0_17.EventStartProduce then
    r0_17.EventStartProduce()
  else
    DebugPrint("Tianyi@ EventStartProduce not bind")
  end
end
function r3_0.UpdateSetTargetBtn(r0_18, r1_18)
  -- line: [191, 193] id: 18
  r0_18.Btn_SetTarget:SetChecked(r1_18)
end
function r3_0.OnDraftSetTargetChanged(r0_19, r1_19)
  -- line: [195, 214] id: 19
  DebugPrint("Tianyi@ OnSetTarget: " .. tostring(r1_19) .. "DraftId = " .. r0_19.Content.Id)
  if r1_19 then
    if (DataMgr.GlobalConstant.ForgeTargetMaxNum.ConstantValue and r0_0.DefaultForgeTargetMaxNum) <= r0_19.Content.GetDataModel():GetTargetDraftCount() then
      UIManager(r0_19):ShowUITip("CommonToastMain", GText("UI_Forging_TargetLimit"))
      r0_19.Btn_SetTarget:SetCheckedNoNotify(false)
      return 
    end
    r0_19.Content.GetDataModel():AddDraftToTarget(r0_19.Content.Id)
    UIManager(r0_19):ShowUITip("CommonToastMain", GText("UI_FORGING_TARGET"))
    AudioManager(r0_19):PlayUISound(r0_19, "event:/ui/common/click_btn_small", nil, nil)
  else
    r0_19.Content.GetDataModel():RemoveDraftFromTarget(r0_19.Content.Id)
    UIManager(r0_19):ShowUITip("CommonToastMain", GText("UI_FORGING_CANCELTARGET"))
    AudioManager(r0_19):PlayUISound(r0_19, "event:/ui/common/click_btn_cancel", nil, nil)
  end
  r0_19.Content.IsSetTarget = r1_19
end
function r3_0.OnBtnCancelClicked(r0_20)
  -- line: [216, 222] id: 20
  if r0_20.EventCancelProduce then
    r0_20.EventCancelProduce()
  else
    DebugPrint("Tianyi@ EventCancelProduce not bind")
  end
end
function r3_0.InitializeView(r0_21)
  -- line: [225, 294] id: 21
  r0_21:StopAllAnimations()
  r0_21:RefreshOpInfoByInputDevice()
  if r0_21.Content.IsEmptyWidget then
    r0_21.Switch:SetActiveWidgetIndex(1)
    return 
  else
    r0_21.Switch:SetActiveWidgetIndex(0)
  end
  r0_21:BindUIEvents()
  r0_21.WidgetCurrentState = r0_21.Content.State
  local r1_21 = DataMgr.Draft[r0_21.Content.Id]
  local r2_21 = r1_0:ConstructItemContentFromDraftId(r0_21.Content.Id)
  r2_21.IsShowDetails = true
  r2_21.OnMenuOpenChangedEvents = {
    Obj = r0_21,
    Callback = r0_21.OnMenuOpenChanged,
  }
  r2_21.HandleMouseDown = true
  r2_21.OnMouseButtonUpEvents = {
    Obj = r0_21,
    Callback = r0_21.OnItemWidgetClicked,
  }
  r0_21.ItemWidget:Init(r2_21)
  r0_21.ItemWidget:SetVisibility(UE4.ESlateVisibility.Visible)
  r0_21.Text_ItemName:SetText(r2_21.ProductName)
  if r1_21.Time <= 0 then
    r0_21.Text_RequiredTime:SetText("-")
  else
    r0_21.Text_RequiredTime:SetText(string.format(GText("UI_SHOP_REMAINTIME_MINUTE"), r1_21.Time))
  end
  r0_21:UpdateFoundry(r0_21.Content.Id)
  r0_21.Cost_Ticket:InitContent({
    ResourceId = DataMgr.GlobalConstant.AccelerateCostType.ConstantValue,
    Numerator = 0,
    Denominator = 0,
    bShowDenominator = true,
    HandleMouseDown = true,
  })
  r0_21.Text_BluePrintsNumName:SetText(GText("UI_FORGING_BLUEPRINT"))
  r0_21.Text_ItemCurrentOwned:SetText(GText("UI_FORGING_CURRENT"))
  r0_21:RefreshNum()
  if r0_21.Content.State == r0_0.DraftState.NotStarted then
    r0_21:SwitchToMaterialView(true)
    r0_21:InitNotStartedView()
    r0_21.Text_Complete:SetRenderOpacity(0)
    r0_21.Text_BatchFinish:SetRenderOpacity(0)
  elseif r0_21.Content.State == r0_0.DraftState.InProgress then
    r0_21:SwitchToProgressView(true)
    r0_21:InitInProgressView()
    r0_21.Text_Complete:SetRenderOpacity(0)
    r0_21.Text_BatchFinish:SetRenderOpacity(0)
  elseif r0_21.Content.State == r0_0.DraftState.Complete then
    r0_21:SwitchToProgressView(true)
    r0_21:InitCompleteView(false)
    r0_21.Text_Complete:SetRenderOpacity(1)
    r0_21.Text_BatchFinish:SetRenderOpacity(1)
  end
  r0_21.Text_Complete:SetText(GText("UI_FORGING_COMPLETED"))
  r0_21:SetHovered(false)
  r0_21.Panel:SetRenderOpacity(0)
  r0_21:PlayAnimation(r0_21.In)
end
function r3_0.BindUIEvents(r0_22)
  -- line: [296, 314] id: 22
  if r0_22.HasBindUIEvents then
    return 
  end
  r0_22.BtnStart:UnBindEventOnClickedByObj(r0_22)
  r0_22.BtnStart:BindEventOnClicked(r0_22, r0_22.OnBtnStartClicked)
  r0_22.BtnReward:UnBindEventOnClickedByObj(r0_22)
  r0_22.BtnReward:BindEventOnClicked(r0_22, r0_22.OnBtnStartClicked)
  r0_22.Btn_Cancel:UnBindEventOnClickedByObj(r0_22)
  r0_22.Btn_Cancel:BindEventOnClicked(r0_22, r0_22.OnBtnCancelClicked)
  r0_22.Btn_SetTarget.OnCheckStateChanged:Add(r0_22, r0_22.OnDraftSetTargetChanged)
  r0_22.HasBindUIEvents = true
end
function r3_0.InitNotStartedView(r0_23)
  -- line: [317, 331] id: 23
  r0_23.WidgetCurrentState = r0_0.DraftState.NotStarted
  r0_23.Switch_Btn:SetActiveWidgetIndex(0)
  r0_23.ProduceProgress:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_23.MaterialNumber:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_23.Text_Complete:SetRenderOpacity(0)
  r0_23.Text_BatchFinish:SetRenderOpacity(0)
  r0_23.Mark:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_23.Btn_SetTarget:SetCheckedNoNotify(r0_23.Content.IsSetTarget)
  r0_23.Switch_Show:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_23.Switch_Show:SetActiveWidgetIndex(0)
  r0_23:UpdateFoundry(r0_23.Content.Id)
  r0_23:UpdateMaterial()
end
function r3_0.InitInProgressView(r0_24)
  -- line: [334, 353] id: 24
  r0_24.WidgetCurrentState = r0_0.DraftState.InProgress
  local r1_24 = DataMgr.Draft[r0_24.Content.Id]
  r0_24.Switch_Btn:SetActiveWidgetIndex(0)
  r0_24.BtnStart:SetText(GText("UI_COMMONPOP_TITLE_100018"))
  r0_24.BtnStart:SetVisibility(UE4.ESlateVisibility.Visible)
  r0_24.LastTime:SetVisibility(UE4.ESlateVisibility.Visible)
  r0_24.MaterialNumber:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_24.ProduceProgress:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_24.Text_Complete:SetRenderOpacity(0)
  r0_24.Text_BatchFinish:SetRenderOpacity(0)
  r0_24.Switch_Show:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_24.Switch_Show:SetActiveWidgetIndex(1)
  r0_24.VX_glowfire:ActivateSystem(true)
  r0_24.Mark:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_24.Btn_SetTarget:SetCheckedNoNotify(r0_24.Content.IsSetTarget)
  r0_24:UpdateFoundry(r0_24.Content.Id)
  r0_24:UpdatePercent()
end
function r3_0.InitCompleteView(r0_25, r1_25)
  -- line: [356, 381] id: 25
  r0_25.WidgetCurrentState = r0_0.DraftState.Complete
  r0_25.ProduceProgress:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_25.Bar_Produce:SetPercent(1)
  r0_25.LastTime:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_25.Switch_Show:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_25.Mark:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_25.Btn_SetTarget:SetCheckedNoNotify(r0_25.Content.IsSetTarget)
  r0_25.BtnStart:SetText(GText("UI_Achievement_GetReward"))
  r0_25.BtnReward:SetText(GText("UI_Achievement_GetReward"))
  r0_25.Switch_Btn:SetActiveWidgetIndex(1)
  r0_25.Text_BatchFinish:SetText(string.format("(<Highlight>%d</>/%d)", r0_25.Content.DraftCompleteNum, r0_25.Content.DraftCompleteNum))
  r0_25:PlayAnimation(r0_25.BtnShow_Complete)
  if r1_25 then
    r0_25:PlayAnimation(r0_25.Change_Complete)
    AudioManager(r0_25):PlayUISound(r0_25, "event:/ui/common/produce_complete", nil, nil)
  else
    r0_25:SetAnimationCurrentTime(r0_25.Change_Complete, 2)
  end
  r0_25:UpdateFoundry(r0_25.Content.Id)
end
function r3_0.RefreshNum(r0_26)
  -- line: [383, 400] id: 26
  local r1_26 = DataMgr.Draft[r0_26.Content.Id]
  r0_26.Text_BluePrintsNumName:SetText(GText("UI_FORGING_BLUEPRINT"))
  if r1_26.IsInfinity then
    r0_26.Text_BluePrintsNum:SetText("<Img id=\"Infinity\" height=\"36\" width=\"28\"/>")
  else
    r0_26.Text_BluePrintsNum:SetText(tostring(FormatNumber(r0_26.Content.Count, true)))
  end
  r0_26.Text_ItemOwnedNum:SetText(tostring(FormatNumber(r0_26.Content.ProductCount, true)))
  if r0_26.Content.IsNotSeen then
    r0_26.ItemWidget:SetRedDot(UIConst.RedDotType.NewRedDot)
  else
    r0_26.ItemWidget:SetRedDot(nil)
  end
end
function r3_0.RefreshView(r0_27)
  -- line: [402, 426] id: 27
  r0_27:RefreshNum()
  if r0_27.Content.State == r0_0.DraftState.NotStarted then
    if r0_27.WidgetCurrentState ~= r0_27.Content.State then
      r0_27:InitNotStartedView()
      r0_27:SwitchToMaterialView(false)
    else
      r0_27:UpdateMaterial()
    end
  elseif r0_27.Content.State == r0_0.DraftState.InProgress then
    if r0_27.WidgetCurrentState ~= r0_27.Content.State then
      r0_27:InitInProgressView()
      r0_27:SwitchToProgressView(false)
    else
      r0_27:UpdatePercent()
    end
  elseif r0_27.Content.State == r0_0.DraftState.Complete and r0_27.WidgetCurrentState ~= r0_27.Content.State then
    r0_27:SwitchToProgressView(true)
    r0_27:InitCompleteView(true)
  end
end
function r3_0.UpdateMaterial(r0_28)
  -- line: [428, 491] id: 28
  if r0_28.WidgetCurrentState ~= r0_0.DraftState.NotStarted then
    return 
  end
  for r4_28 = 1, 4, 1 do
    local r5_28 = r0_28.Material:GetChildAt(r4_28 + -1)
    if not r5_28 then
      r5_28 = r0_28:CreateWidgetNew("ComItemUniversalM")
      r0_28.Material:AddChild(r5_28)
    end
    local r6_28 = r0_28.Content.ResourcesNeed[r4_28]
    if r6_28 then
      local r7_28 = r6_28.Type and "Resource"
      local r8_28 = r6_28.ResId
      local r9_28 = DataMgr.Resource[r8_28]
      r5_28:Init({
        UIName = "ForgeMain",
        IsShowDetails = true,
        MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight,
        Id = r8_28,
        ItemType = r7_28,
        Rarity = ItemUtils.GetItemRarity(r8_28, r7_28),
        Icon = ItemUtils.GetItemIconPath(r8_28, r7_28),
        Count = r6_28.Have,
        NeedCount = r6_28.Required,
        OnMenuOpenChangedEvents = {
          Obj = r0_28,
          Callback = r0_28.OnMenuOpenChanged,
        },
        HandleMouseDown = true,
      })
      r5_28:SetVisibility(UE4.ESlateVisibility.Visible)
    else
      r5_28:Init({
        Id = 0,
        HandleMouseDown = true,
      })
      r5_28:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
    end
  end
  if not r0_28.Content.IsFoundryEnough then
    r0_28.Cost_Resource:SetIsEnough(false)
  else
    r0_28.Cost_Resource:SetIsEnough(true)
  end
  r0_28.BtnStart:SetVisibility(UE4.ESlateVisibility.Visible)
  if r0_28.Content.CanProduce then
    r0_28.BtnStart:SetText(GText("UI_FORGING_START"))
    r0_28.BtnStart:SetTextColor(r0_28.BtnStart.Color_Forge)
    r0_28.BtnStart.WS_Type:SetActiveWidgetIndex(0)
    r0_28.BtnStart.Icon_Forging:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    r0_28.BtnStart:SetText(GText("UI_FORGING_PATH"))
    r0_28.BtnStart:SetTextColor(r0_28.BtnStart.Color_Path)
    r0_28.BtnStart.WS_Type:SetActiveWidgetIndex(1)
    r0_28.BtnStart.Icon_Forging:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r3_0.OnMenuOpenChanged(r0_29, r1_29)
  -- line: [493, 497] id: 29
  if r0_29.Content.OnMenuOpenChanged then
    r0_29.Content.OnMenuOpenChanged(r1_29)
  end
end
function r3_0.UpdatePercent(r0_30)
  -- line: [499, 549] id: 30
  if r0_30.WidgetCurrentState ~= r0_0.DraftState.InProgress then
    return 
  end
  local r1_30 = r2_0.NowTime()
  local r2_30 = r1_30 - r0_30.Content.StartTime
  local r3_30 = r0_30.Content.TotalTime - r2_30
  if r3_30 > 0 then
    local r4_30 = r2_30 / (r2_30 + r3_30)
    local r5_30, r6_30, r7_30 = r1_0:SecondsToHMS(r3_30)
    local r8_30 = string.format("%02d:%02d:%02d", r5_30, r6_30, r7_30)
    local r9_30 = {}
    if r5_30 >= 1 then
      table.insert(r9_30, {
        TimeType = "Hour",
        TimeValue = r5_30,
      })
      table.insert(r9_30, {
        TimeType = "Min",
        TimeValue = r6_30,
      })
    else
      table.insert(r9_30, {
        TimeType = "Min",
        TimeValue = r6_30,
      })
      table.insert(r9_30, {
        TimeType = "Sec",
        TimeValue = r7_30,
      })
    end
    r0_30.LastTime:SetTimeText("", r9_30)
    r0_30.Bar_Produce:SetPercent(r4_30)
    r0_30:UpdateProgressVXPosition()
  else
    local r4_30 = r0_30.Content.Id
    r0_30.ErrorRestTimeMap = r0_30.ErrorRestTimeMap and {}
    if not r0_30.ErrorRestTimeMap[r4_30] then
      local r5_30 = GWorld.Battle
      if r5_30 then
        local r6_30 = string.format("Forge@ RestTime <= 0, CurrentTime: %d, DurationTime: %d, RestTime: %d, osTime: %d", r1_30, r2_30, r3_30, os.time())
        local r7_30 = r0_30.Content.GetDataModel()
        if r7_30 then
          local r8_30 = r7_30:CheckState(r4_30)
          if r8_30 then
            r6_30 = r6_30 .. string.format(", State: %d, StartTime: %d, DoingNum: %d, CompleteNum: %d", r8_30.State, r8_30.StartTime, r8_30.DraftDoingNum, r8_30.DraftCompleteNum)
          end
        end
        r5_30:StandardShowBattleErrorLua(UE.EShowBattleErrorType.Other, r6_30)
      end
      r0_30.ErrorRestTimeMap[r4_30] = true
    end
  end
  r0_30.Text_BatchProduce:SetText(string.format("(<Highlight>%d</>/%d)", r0_30.Content.DraftCompleteNum, r0_30.Content.DraftDoingNum + r0_30.Content.DraftCompleteNum))
  r0_30:UpdateAccerateTickets()
end
function r3_0.UpdateAccerateTickets(r0_31)
  -- line: [551, 572] id: 31
  local r1_31 = DataMgr.GlobalConstant.AccelerateCostType.ConstantValue
  if DataMgr.Resource[r1_31] then
    local r3_31 = GWorld:GetAvatar()
    local r4_31 = r0_31.Content.GetDataModel():GetAccerateCost(r0_31.Content.Id)
    local r5_31 = r3_31:GetResourceNum(r1_31)
    r0_31.Cost_Ticket:SetCost(r4_31, r5_31)
    if r5_31 < r4_31 then
      r0_31.Switch_Btn:SetActiveWidgetIndex(2)
      r0_31.Text_Tips_MaterialNotEnough:SetText(GText("UI_FORGING_ACCELERATE_NOTENOUGH"))
    else
      r0_31.Switch_Btn:SetActiveWidgetIndex(0)
      r0_31.BtnStart.WS_Type:SetActiveWidgetIndex(0)
      r0_31.BtnStart.Icon_Forging:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      r0_31.BtnStart:SetTextColor(r0_31.BtnStart.Color_Forge)
    end
  end
end
function r3_0.UpdateFoundry(r0_32, r1_32)
  -- line: [574, 609] id: 32
  if r0_32.Content.State == r0_0.DraftState.NotStarted then
    local r2_32 = DataMgr.Draft[r1_32]
    if r2_32.FoundryCost then
      r0_32.Cost_Resource:SetVisibility(UE4.ESlateVisibility.Visible)
      for r7_32, r8_32 in pairs(r2_32.FoundryCost) do
        if DataMgr.Resource[r7_32] then
          r0_32.Cost_Resource:InitContent({
            ResourceId = r7_32,
            Numerator = r8_32,
            HandleMouseDown = true,
            IsGamePadIconVisible = false,
          })
          break
        end
      end
      -- close: r3_32
      r0_32.CostMoneyPanel:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      r0_32.CostTimePanel:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    else
      r0_32.Cost_Resource:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  elseif r0_32.WidgetCurrentState == r0_0.DraftState.InProgress then
    r0_32:UpdateAccerateTickets()
    r0_32.CostMoneyPanel:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_32.CostTimePanel:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    r0_32.CostMoneyPanel:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_32.CostTimePanel:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r3_0.SwitchToMaterialView(r0_33, r1_33)
  -- line: [611, 620] id: 33
  r0_33:StopAllAnimations()
  if r1_33 then
    r0_33.Material:SetRenderOpacity(1)
    r0_33.ProduceProgress:SetRenderOpacity(0)
  else
    r0_33:PlayAnimation(r0_33.Change_ProgressBar, 0, 1, UE4.EUMGSequencePlayMode.Reverse)
  end
  r0_33.Material:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end
function r3_0.SwitchToProgressView(r0_34, r1_34)
  -- line: [622, 631] id: 34
  r0_34:StopAllAnimations()
  if r1_34 then
    r0_34.Material:SetRenderOpacity(0)
    r0_34.ProduceProgress:SetRenderOpacity(1)
  else
    r0_34:PlayAnimation(r0_34.Change_ProgressBar, 0, 1)
  end
  r0_34.Material:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
end
function r3_0.OnItemWidgetClicked(r0_35)
  -- line: [633, 637] id: 35
  if r0_35.Content.OnItemWidgetClicked then
    r0_35.Content.OnItemWidgetClicked(r0_35)
  end
end
function r3_0.UpdateProgressVXPosition(r0_36)
  -- line: [640, 644] id: 36
  UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r0_36.VX_glowfire):SetPosition(FVector2D(USlateBlueprintLibrary.GetLocalSize(r0_36.Bar_Produce:GetCachedGeometry()).X * r0_36.Bar_Produce.Percent, 0))
end
function r3_0.PlayScanlineAnim(r0_37)
  -- line: [647, 649] id: 37
  r0_37:PlayAnimation(r0_37.Scanline)
end
return r3_0
