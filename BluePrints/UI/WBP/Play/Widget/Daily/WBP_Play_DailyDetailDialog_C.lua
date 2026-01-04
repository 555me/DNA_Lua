-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Play\Widget\Daily\WBP_Play_DailyDetailDialog_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase"
})
function r0_0.Construct(r0_1)
  -- line: [15, 24] id: 1
  r0_0.Super.Construct(r0_1)
  if CommonUtils.GetDeviceTypeByPlatformName() == "Mobile" then
    r0_1.List_Item:SetControlScrollbarInside(false)
  else
    r0_1.List_Item:SetScrollbarVisibility(UIConst.VisibilityOp.Collapsed)
    r0_1.List_Item:SetControlScrollbarInside(true)
  end
end
function r0_0.InitContent(r0_2, r1_2, r2_2, r3_2)
  -- line: [31, 43] id: 2
  r0_2.Super.InitContent(r0_2, r1_2, r2_2, r3_2)
  r0_2:BindDialogEvent(DialogEvent.OnTitleTabSelected, r0_2.OnTabSelected)
  if not r1_2.DataMap then
    return 
  end
  r0_2.DataMap = r1_2.DataMap
  if r0_2.DataMap.Tabs then
    r0_2:InitPage(r0_2.DataMap.Tabs[1], true)
  else
    r0_2:InitPage(r0_2.DataMap)
  end
end
function r0_0.InitPage(r0_3, r1_3, r2_3)
  -- line: [45, 81] id: 3
  r0_3.List_Item:ClearChildren()
  local r3_3 = {}
  for r8_3 in pairs(r1_3) do
    table.insert(r3_3, r8_3)
  end
  -- close: r4_3
  table.sort(r3_3, function(r0_4, r1_4)
    -- line: [56, 56] id: 4
    return r0_4 < r1_4
  end)
  r0_3.ListTiles = {}
  for r8_3, r9_3 in ipairs(r3_3) do
    local r11_3 = {
      RewardList = r1_3[r9_3],
      des = r9_3,
      ParentWidget = r0_3,
      Index = r8_3,
      IsTabPage = r2_3,
    }
    local r12_3 = r0_3:CreateWidgetNew("DailyDetailItem")
    table.insert(r0_3.ListTiles, r12_3)
    r0_3.List_Item:AddChild(r12_3)
    r12_3:Init(r11_3)
  end
  -- close: r4_3
  r0_3:AddTimer(0.01, function()
    -- line: [76, 80] id: 5
    r0_3.List_Item:GetChildAt(0):SetFocus()
    r0_3:ShowGamepadABtn(true)
  end, false, 0, "__DeputeDetailDialog_List_Drop")
end
function r0_0.OnTabSelected(r0_6, r1_6)
  -- line: [83, 90] id: 6
  local r2_6 = r1_6.Idx
  if r2_6 and r0_6.DataMap.Tabs and r0_6.DataMap.Tabs[r2_6] then
    r0_6:InitPage(r0_6.DataMap.Tabs[r2_6], true)
  else
    r0_6:InitPage(r0_6.DataMap, false)
  end
end
function r0_0.ShowGamepadABtn(r0_7, r1_7)
  -- line: [92, 105] id: 7
  if r1_7 then
    local r2_7 = r0_7.GamepadCheckItemKeyInfo
    if not r2_7 then
      r2_7 = r0_7:ShowGamepadShortcutBtn({
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = UIConst.GamePadImgKey.FaceButtonBottom,
          }
        },
        Desc = GText("UI_Controller_CheckDetails"),
      })
    end
    r0_7.GamepadCheckItemKeyInfo = r2_7
  elseif r0_7.GamepadCheckItemKeyInfo then
    r0_7:HideGamepadShortcut(r0_7.GamepadCheckItemKeyInfo)
    r0_7.GamepadCheckItemKeyInfo = nil
  end
end
function r0_0.OnContentFocusReceived(r0_8, r1_8, r2_8)
  -- line: [107, 114] id: 8
  if r0_8.List_Item:GetChildAt(0) then
    r0_8.List_Item:GetChildAt(0):SetFocus()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end
function r0_0.OnAnalogValueChanged(r0_9, r1_9, r2_9)
  -- line: [116, 125] id: 9
  if UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_9)) == "Gamepad_RightY" then
    r0_9.List_Item:SetScrollOffset(r0_9.List_Item:GetScrollOffset() + UKismetInputLibrary.GetAnalogValue(r2_9) * 5)
  end
  return UWidgetBlueprintLibrary.Unhandled()
end
return r0_0
