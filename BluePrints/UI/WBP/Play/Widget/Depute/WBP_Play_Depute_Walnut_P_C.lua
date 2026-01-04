-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Play\Widget\Depute\WBP_Play_Depute_Walnut_P_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("Utils.TimeUtils")
local r2_0 = require("BluePrints.UI.WBP.Walnut.WalnutBag.WalnutBagController"):GetModel()
local r3_0 = Class({
  "BluePrints.UI.BP_UIState_C"
})
function r3_0.Construct(r0_1)
  -- line: [18, 33] id: 1
  r3_0.Super.Construct(r0_1)
  r0_1:AddDispatcher(EventID.OnDungeonsUpdate, r0_1, r0_1.OnDungeonsUpdate)
  r0_1:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  r0_1:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  r0_1:AddInputMethodChangedListen()
end
function r3_0.OnDungeonsUpdate(r0_2)
  -- line: [40, 42] id: 2
  r0_2:InitContent()
end
function r3_0.RefreshOpInfoByInputDevice(r0_3, r1_3, r2_3)
  -- line: [44, 69] id: 3
  if r1_3 == ECommonInputType.Touch then
    return 
  end
  local r3_3 = r1_3 == ECommonInputType.MouseAndKeyboard
  if not r3_3 or not 0 then
    local r4_3 = 1
  end
  r0_3.WBP_Com_BtnExplanation:UpdateUIStyleInPlatform(not r3_3)
  if r3_3 then
    return 
  else
    local r5_3 = UIManager(r0_3):GetUI("CommonDialog")
    if r5_3 then
      r5_3:SetFocus()
    else
      r0_3:FocusList_WalnutItem()
    end
  end
end
function r3_0.OnFocusReceived(r0_4, r1_4, r2_4)
  -- line: [71, 78] id: 4
  r0_4:FocusList_WalnutItem()
  r0_4:UpdatKeyDisplay()
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end
function r3_0.FocusList_WalnutItem(r0_5)
  -- line: [80, 88] id: 5
  local r1_5 = r0_5.List_Walnut:GetItemAt(0)
  if r1_5.SelfWidget then
    r1_5.SelfWidget:SetFocus()
  else
    r0_5.List_Walnut:NavigateToIndex(0)
  end
end
function r3_0.UpdateTimeCountDown(r0_6)
  -- line: [90, 94] id: 6
  local r1_6, r2_6 = UIUtils.GetLeftTimeStrStyle2(r0_6.LeftTimeDict)
  r0_6.Text_WalnutTime:SetText(GText("UI_Walnut_Dungeon_Refresh"))
  r0_6.Com_Time:SetTimeText(GText("UI_Walnut_Dungeon_Refresh"), r1_6)
end
function r3_0.InitContent(r0_7, r1_7)
  -- line: [99, 156] id: 7
  r0_7.List_Walnut:ClearListItems()
  local r2_7 = GWorld:GetAvatar()
  if r2_7 == nil then
    return 
  end
  if r1_7 then
    r0_7.Parent = r1_7
  end
  local r3_7 = {}
  local r4_7 = {}
  r0_7.ValidWalnutDungeons = r2_7.Walnuts.ValidWalnutDungeons
  r0_7.LeftTimeDict = r2_0:GetDungeonNextRefreshTime()
  if r0_7:IsExistTimer("UpdateTimeContent") then
    r0_7:RemoveTimer("UpdateTimeContent")
  end
  r0_7:UpdateTimeCountDown()
  r0_7:AddTimer(1, r0_7.UpdateTimeCountDown, true, 0, "UpdateTimeContent", true)
  for r9_7, r10_7 in pairs(r0_7.ValidWalnutDungeons) do
    local r11_7 = DataMgr.WalnutSelectDungeon[r9_7]
    if r11_7 then
      table.insert(r3_7, r11_7)
      r4_7[r9_7] = r10_7
    end
  end
  -- close: r5_7
  table.sort(r3_7, function(r0_8, r1_8)
    -- line: [130, 132] id: 8
    return r0_8.Sequence < r1_8.Sequence
  end)
  for r9_7, r10_7 in ipairs(r3_7) do
    local r11_7 = NewObject(r0_7.LevelCellContentClass)
    r11_7.DungeonData = r10_7
    r11_7.DungeonIds = r4_7[r10_7.WalnutType]
    r11_7.Parent = r0_7
    r0_7.List_Walnut:AddItem(r11_7)
  end
  -- close: r5_7
  r0_7:FocusList_WalnutItem()
  r0_7:UpdatKeyDisplay()
  r0_7:InitBtnExplanation()
end
function r3_0.InitBtnExplanation(r0_9)
  -- line: [158, 171] id: 9
  r0_9.WBP_Com_BtnExplanation:Init({
    ClickCallback = r0_9.OnBtnExplanationClickCallback,
    OwnerWidget = r0_9,
    PopupId = 100224,
    Desc = "UI_Walnut_Gacha_Des",
  })
  r0_9.WBP_Com_BtnExplanation.Com_KeyImg:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "Menu",
      }
    },
  })
end
function r3_0.OnBtnExplanationClickCallback(r0_10)
  -- line: [173, 175] id: 10
  print("lgc@ OnBtnExplanationClickCallback")
end
function r3_0.UpdatKeyDisplay(r0_11)
  -- line: [178, 237] id: 11
  local r1_11 = UIManager(r0_11):GetUIObj("StyleOfPlay")
  if not r1_11 then
    return 
  end
  local r2_11 = {}
  if UIUtils.GetListViewContentMaxCount(r0_11.List_Walnut, r0_11.List_Walnut:GetDisplayedEntryWidgets(), false) - r0_11.List_Walnut:GetNumItems() >= 0 then
    r2_11 = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = r0_11,
          }
        },
        Desc = GText("UI_Tips_Ensure"),
        bLongPress = false,
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = r0_11.Parent.CloseSelf,
            Owner = r0_11,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = r0_11,
          }
        },
        Desc = GText("UI_BACK"),
      }
    }
  else
    r2_11 = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "RH",
            Owner = r0_11,
          }
        },
        Desc = GText("UI_Controller_Slide"),
        bLongPress = false,
      },
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = r0_11,
          }
        },
        Desc = GText("UI_Tips_Ensure"),
        bLongPress = false,
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = r0_11.Parent.CloseSelf,
            Owner = r0_11,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = r0_11,
          }
        },
        Desc = GText("UI_BACK"),
      }
    }
  end
  r1_11:UpdateOtherPageTab(r2_11)
end
function r3_0.OnAnalogValueChanged(r0_12, r1_12, r2_12)
  -- line: [253, 262] id: 12
  if UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_12)) == "Gamepad_RightX" then
    r0_12.List_Walnut:SetScrollOffset(r0_12.List_Walnut:GetScrollOffset() + UKismetInputLibrary.GetAnalogValue(r2_12) * 2)
  end
  return UWidgetBlueprintLibrary.Unhandled()
end
function r3_0.OnKeyDown(r0_13, r1_13, r2_13)
  -- line: [264, 282] id: 13
  local r3_13 = false
  if UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_13)) == UIConst.GamePadKey.SpecialRight then
    local r6_13 = UIManager(r0_13):GetUI("CommonDialog")
    if not r6_13 then
      r0_13.WBP_Com_BtnExplanation:OnBtnClick()
    else
      r6_13:SetFocus()
    end
    r3_13 = true
  end
  if r3_13 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end
return r3_0
