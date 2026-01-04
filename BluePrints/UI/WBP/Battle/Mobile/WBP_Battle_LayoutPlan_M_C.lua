-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Battle\Mobile\WBP_Battle_LayoutPlan_M_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.BP_UIState_C"
})
function r0_0.Construct(r0_1)
  -- line: [17, 35] id: 1
  r0_1.CurSelectIndex = nil
  r0_1.IsClosing = false
  r0_1.Btn_Confirm.Button_Area:SetVisibility(ESlateVisibility.Collapsed)
  r0_1.Btn_Confirm:PlayAnimation(r0_1.Btn_Confirm.Forbidden)
  r0_1.Btn_Confirm.Button_Area.OnClicked:Add(r0_1, r0_1.OnClickConfirm)
  r0_1.Layout_01.Btn_Area.OnClicked:Add(r0_1, r0_1.OnClickLayout1)
  r0_1.Layout_02.Btn_Area.OnClicked:Add(r0_1, r0_1.OnClickLayout2)
  r0_1.Text_Title:SetText(GText("UI_SelectLayoutPopup_Tittle03"))
  r0_1.Text_Desc:SetText(GText("UI_SelectLayoutPopup_Tip"))
  r0_1.Layout_01.Text_Plan:SetText(GText("UI_SelectLayoutPopup_Tittle01"))
  r0_1.Layout_01.Text_PlanDesc:SetText(GText("UI_SelectLayoutPopup_Content01"))
  r0_1.Layout_02.Text_Plan:SetText(GText("UI_SelectLayoutPopup_Tittle02"))
  r0_1.Layout_02.Text_PlanDesc:SetText(GText("UI_SelectLayoutPopup_Content02"))
  r0_1.Layout_01.New:SetVisibility(ESlateVisibility.Collapsed)
  r0_1.Layout_02.New:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_1.Btn_Confirm.Text_Button:SetText(GText("UI_SelectLayoutPopup_Button"))
  AudioManager(r0_1):PlayUISound(r0_1, "event:/ui/common/complete_trial_level_panel_show", "LayoutPlan", nil)
end
function r0_0.OnLoaded(r0_2, ...)
  -- line: [37, 38] id: 2
end
function r0_0.OnClickConfirm(r0_3)
  -- line: [40, 53] id: 3
  local r1_3 = GWorld:GetAvatar()
  if r1_3 then
    r1_3:InitMobileHudPlan(r0_3.CurSelectIndex)
    if r0_3.CurSelectIndex == 2 then
      EMCache:Set("FirstOpenLayoutPlan", true, true)
      ReddotManager.ClearLeafNodeCount("Setting_Layout")
    end
  end
  r0_3:CloseSelf()
  r0_3.IsClosing = true
  EventManager:FireEvent(EventID.OnSwitchMobileHUDLayout, r0_3.CurSelectIndex)
  AudioManager(r0_3):PlayUISound(r0_3, "event:/ui/common/click_btn_confirm", nil, nil)
end
function r0_0.OnClickLayout1(r0_4)
  -- line: [55, 65] id: 4
  if r0_4.Layout_02.LayoutState == UIConst.ButtonState.Click then
    r0_4.Layout_02:PlayAnimation(r0_4.Layout_02.Normal)
    r0_4.Layout_02.LayoutState = UIConst.ButtonState.None
  end
  if not r0_4.CurSelectIndex then
    r0_4.Btn_Confirm:PlayAnimation(r0_4.Btn_Confirm.Normal)
  end
  r0_4.CurSelectIndex = 1
  r0_4.Btn_Confirm.Button_Area:SetVisibility(ESlateVisibility.Visible)
end
function r0_0.OnClickLayout2(r0_5)
  -- line: [67, 78] id: 5
  if r0_5.Layout_01.LayoutState == UIConst.ButtonState.Click then
    r0_5.Layout_01:PlayAnimation(r0_5.Layout_01.Normal)
    r0_5.Layout_01.LayoutState = UIConst.ButtonState.None
  end
  if not r0_5.CurSelectIndex then
    r0_5.Btn_Confirm:PlayAnimation(r0_5.Btn_Confirm.Normal)
  end
  r0_5.CurSelectIndex = 2
  r0_5.Btn_Confirm.Button_Area:SetVisibility(ESlateVisibility.Visible)
  r0_5.Layout_02.New:SetVisibility(ESlateVisibility.Collapsed)
end
function r0_0.CloseSelf(r0_6)
  -- line: [80, 86] id: 6
  if r0_6.IsClosing then
    return 
  end
  r0_6:PlayAnimation(r0_6.Out)
  AudioManager(r0_6):SetEventSoundParam(r0_6, "LayoutPlan", {
    ToEnd = 1,
  })
end
function r0_0.OnAnimationFinished(r0_7, r1_7)
  -- line: [88, 92] id: 7
  if r1_7 == r0_7.Out then
    r0_7:Close()
  end
end
return r0_0
