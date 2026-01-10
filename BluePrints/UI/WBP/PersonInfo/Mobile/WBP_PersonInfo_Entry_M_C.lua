-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\PersonInfo\Mobile\WBP_PersonInfo_Entry_M_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("BluePrints.UI.WBP.PersonInfo.PersonInfoController")
local r1_0 = Class("BluePrints.UI.BP_UIState_C")
r1_0._components = {
  "BluePrints.UI.WBP.PersonInfo.Base.PersonInfoEntryBaseView"
}
function r1_0.InitTabInfo(r0_1)
  -- line: [14, 32] id: 1
  r0_1.Com_Tab_M:Init({
    Tabs = {},
    DynamicNode = {
      "Back",
      "Tip",
      "BottomKey"
    },
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = r0_1.OnReturnKeyDown,
            Owner = r0_1,
          }
        },
        Desc = GText("UI_BACK"),
      }
    },
    StyleName = "Text",
    OwnerPanel = r0_1,
    TitleName = GText("UI_PersonInfo_Name"),
    BackCallback = r0_1.OnReturnKeyDown,
  })
end
function r1_0.Close(r0_2)
  -- line: [34, 37] id: 2
  r1_0.Super.Close(r0_2)
end
function r1_0.InitListenEvent(r0_3)
  -- line: [39, 41] id: 3
end
function r1_0.OnLoaded(r0_4, ...)
  -- line: [43, 51] id: 4
  r1_0.Super.OnLoaded(r0_4, ...)
  r0_4:InitListenEvent()
  r0_4.Com_BtnVisible.Button_Area.OnClicked:Add(r0_4, r0_4.OnBtnVisibleClick)
end
function r1_0.RefreshBaseInfo(r0_5)
  -- line: [53, 65] id: 5
  local r1_5 = {}
  r0_5.PersonInfoMainPage = r0_5:CreatePersonInfoMainPage({
    PCBluePrint = "WidgetBlueprint\'/Game/UI/WBP/PersonalInfo/Mobile/WBP_PersonalInfo_Main_M.WBP_PersonalInfo_Main_M\'",
  })
  if r0_5.PersonInfoMainPage then
    r0_5.PersonInfoMainPage:PlayAnimation(r0_5.PersonInfoMainPage.In)
  end
  r0_5:SetFocus()
end
function r1_0.OnReturnKeyDown(r0_6)
  -- line: [67, 75] id: 6
  if not r0_6:CheckIsCanCloseSelf() then
    return 
  end
  r0_6:PlayOutAnim()
end
function r1_0.OnReturnKeyDown(r0_7)
  -- line: [77, 83] id: 7
  if r0_7:CheckIsCanCloseSelf() then
    r0_7:PlayOutAnim()
  end
end
function r1_0.Hideui(r0_8)
  -- line: [84, 92] id: 8
  r0_8.bIsHide = true
  r0_8.PersonInfoMainPage.MainPanel:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  r0_8.Com_Tab_M:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_8:PlayAnimation(r0_8.HideUi)
end
function r1_0.Recoverui(r0_9)
  -- line: [93, 101] id: 9
  r0_9.bIsHide = false
  r0_9.PersonInfoMainPage.MainPanel:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_9.Com_Tab_M:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_9:PlayAnimation(r0_9.ShowUi)
end
function r1_0.OnBtnVisibleClick(r0_10)
  -- line: [102, 110] id: 10
  r0_10.bIsHide = not r0_10.bIsHide
  if r0_10.bIsHide == true then
    r0_10:Hideui()
  else
    r0_10:Recoverui()
  end
end
function r1_0.OnKeyDown(r0_11, r1_11, r2_11)
  -- line: [112, 126] id: 11
  local r3_11 = false
  if UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_11)) ~= "Escape" then
  end
  r0_11:OnReturnKeyDown()
  if true then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end
function r1_0.OnGamePadDown(r0_12, r1_12)
  -- line: [128, 131] id: 12
  return r0_12.Com_Tab:Handle_KeyEventOnGamePad(r1_12)
end
function r1_0.Handle_KeyDownOnGamePad(r0_13)
  -- line: [133, 136] id: 13
  return true
end
AssembleComponents(r1_0)
return r1_0
