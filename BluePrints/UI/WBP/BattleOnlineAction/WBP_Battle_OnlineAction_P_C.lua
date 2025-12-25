-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\BattleOnlineAction\WBP_Battle_OnlineAction_P_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.BP_UIState_C"
})
r0_0._components = {
  "BluePrints.UI.WBP.BattleOnlineAction.WBP_Battle_OnlineActionBaseView"
}
local r1_0 = require("BluePrints.UI.WBP.BattleOnlineAction.OnlineActionCommon")
local r2_0 = r1_0.RefreshAllKey
local r3_0 = r1_0.RejectAllKey
function r0_0.InitKeyInfos(r0_1)
  -- line: [19, 101] id: 1
  r0_1.RefreshKeyInfo = {
    KeyInfoList = {
      {
        Type = "Text",
        Text = r2_0,
        ClickCallback = function()
          -- line: [26, 28] id: 2
          r0_1:OnRefreshAllKeyDown()
        end,
      }
    },
    Desc = GText("UI_RegionOnline_Refresh"),
  }
  r0_1.GamePadRefreshKeyInfo = {
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "LS",
        ClickCallback = function()
          -- line: [39, 41] id: 3
          r0_1:OnRefreshAllKeyDown()
        end,
      }
    },
    Desc = GText("UI_RegionOnline_Refresh"),
  }
  local r1_1 = {}
  local r2_1 = {
    {
      Type = "Text",
      Text = r3_0,
      ClickCallback = function()
        -- line: [53, 55] id: 4
        r0_1:OnRejectAllKeyDown()
      end,
    }
  }
  r1_1.KeyInfoList = r2_1
  r1_1.Desc = GText("UI_RegionOnline_RefruseAll")
  r0_1.RefuseKeyInfo = r1_1
  r0_1.GamePadRefuseKeyInfo = {
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "RS",
        ClickCallback = function()
          -- line: [67, 69] id: 5
          r0_1:OnRejectAllKeyDown()
        end,
      }
    },
    Desc = GText("UI_RegionOnline_RefruseAll"),
  }
  r0_1.CloseKeyInfo = {
    KeyInfoList = {
      {
        Type = "Text",
        Text = "Esc",
        ClickCallback = function()
          -- line: [81, 83] id: 6
          r0_1:OnReturnKeyDown()
        end,
      }
    },
    Desc = GText("UI_BACK"),
  }
  r0_1.GamePadCloseKeyInfo = {
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "B",
        ClickCallback = function()
          -- line: [94, 96] id: 7
          r0_1:OnReturnKeyDown()
        end,
      }
    },
    Desc = GText("UI_BACK"),
  }
end
function r0_0.Construct(r0_8)
  -- line: [103, 113] id: 8
  r0_8.M = r0_0
  r0_8:InitKeyInfos()
  local r1_8 = UGameInputModeSubsystem.GetGameInputModeSubsystem(r0_8)
  if IsValid(r1_8) then
    r0_8:RefreshOpInfoByInputDevice(r1_8:GetCurrentInputType())
    r1_8.OnInputMethodChanged:Add(r0_8, r0_8.RefreshOpInfoByInputDevice)
  end
end
function r0_0.StaticInit(r0_9)
  -- line: [115, 120] id: 9
end
function r0_0.OnKeyDown(r0_10, r1_10, r2_10)
  -- line: [121, 158] id: 10
  local r3_10 = false
  local r4_10 = UE4.UKismetInputLibrary.GetKey(r2_10)
  local r5_10 = UE4.UFormulaFunctionLibrary.Key_GetFName(r4_10)
  DebugPrint("BattleOnlineAction_P_C Received OnKeyDown" .. r5_10)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r4_10) then
    r0_10.IsGamePad = true
    if not r0_10.Tab_OnlineAction:Handle_KeyEventOnGamePad(r5_10) then
      r3_10 = r0_10:OnGamePadDown(r5_10)
    end
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    r0_10.IsGamePad = false
    if r5_10 == "Escape" then
      r0_10:OnReturnKeyDown()
    elseif r5_10 == "Q" then
      r0_10:OnLeftTabKeyDown()
    elseif r5_10 == "E" then
      r0_10:OnRightTabKeyDown()
    elseif r5_10 == r1_0.RefreshAllKey and not r0_10.IsInRefreshCD then
      r0_10:OnRefreshAllKeyDown()
      r0_10.IsInRefreshCD = true
      r0_10:AddTimer(r1_0.RefreshAllCD and 1, function()
        -- line: [146, 148] id: 11
        r0_10.IsInRefreshCD = false
      end)
    elseif r5_10 == r1_0.RejectAllKey and r0_10.Tab_OnlineAction.CurrentTab ~= 2 then
      r0_10:OnRejectAllKeyDown()
    end
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end
function r0_0.OnGamePadDown(r0_12, r1_12)
  -- line: [159, 173] id: 12
  if not r0_12.GamePadInputMap then
    r0_12.GamePadInputMap = {
      [UIConst.GamePadKey.FaceButtonRight] = r0_12.OnGamePadReturnKeyDown,
      [UIConst.GamePadKey.LeftThumb] = r0_12.OnRefreshAllKeyDown,
      [UIConst.GamePadKey.RightThumb] = r0_12.OnRejectAllKeyDown,
      [UIConst.GamePadKey.LeftShoulder] = r0_12.OnLeftTabKeyDown,
      [UIConst.GamePadKey.RightShoulder] = r0_12.OnRightTabKeyDown,
    }
  end
  if r0_12.GamePadInputMap[r1_12] then
    r0_12.GamePadInputMap[r1_12](r0_12)
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
end
function r0_0.OnGamePadReturnKeyDown(r0_13)
  -- line: [175, 188] id: 13
  local r1_13 = r0_13.List_Invite:BP_GetSelectedItem()
  if r1_13 and r1_13.UI.WS_Btn:GetActiveWidgetIndex() ~= 1 then
    r1_13.UI:HidePositionUI()
    r1_13.UI.Option_1.Btn_Area:SetFocus()
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  r0_13:OnReturnKeyDown()
end
function r0_0.OnUpdateUIStyleByInputTypeChange(r0_14, r1_14, r2_14)
  -- line: [190, 198] id: 14
  DebugPrint("BattleOnlineAction_P_C OnUpdateUIStyleByInputTypeChange CurInputType:" .. r1_14)
  if r1_14 == ECommonInputType.MouseAndKeyboard then
    r0_14:InitKeyboardUI()
  elseif r1_14 == ECommonInputType.Gamepad then
    r0_14:InitGamepadUI()
  end
end
function r0_0.InitKeyboardUI(r0_15)
  -- line: [200, 209] id: 15
  if not r0_15.RefreshKeyInfo then
    r0_15:InitKeyInfos()
  end
  r0_15.Key_Refresh:CreateCommonKey(r0_15.RefreshKeyInfo)
  r0_15.Key_Refuse:CreateCommonKey(r0_15.RefuseKeyInfo)
  r0_15.Key_Close:CreateCommonKey(r0_15.CloseKeyInfo)
  r0_15.IsGamePad = false
end
function r0_0.InitGamepadUI(r0_16)
  -- line: [211, 225] id: 16
  if not r0_16.GamePadRefreshKeyInfo then
    r0_16:InitKeyInfos()
  end
  r0_16.IsGamePad = true
  r0_16.Key_Refresh:CreateCommonKey(r0_16.GamePadRefreshKeyInfo)
  r0_16.Key_Refuse:CreateCommonKey(r0_16.GamePadRefuseKeyInfo)
  r0_16.Key_Close:CreateCommonKey(r0_16.GamePadCloseKeyInfo)
  if r0_16:HasAnyFocus() and r0_16:IsListHaveItem() then
    r0_16.List_Invite:BP_ClearSelection()
    r0_16:FocusFirstItem()
    return 
  end
end
function r0_0.SwitchEmptyBG(r0_17)
  -- line: [226, 228] id: 17
  r0_17:SetFocus()
end
function r0_0.FocusNextItem(r0_18, r1_18)
  -- line: [231, 253] id: 18
  local r2_18 = r0_18.List_Invite:GetIndexForItem(r1_18)
  if r2_18 + 1 < r0_18.List_Invite:GetNumItems() then
    r2_18 = r2_18 + 1
    DebugPrint("联机动作Focus FocusNextItem:Next Item Index:" .. r2_18)
  elseif r2_18 + -1 >= 0 then
    r2_18 = r2_18 + -1
    DebugPrint("联机动作Focus FocusNextItem:Pre Item Index:" .. r2_18)
  else
    r0_18:SwitchEmptyBG(r0_18.TabKind)
    r0_18:SetFocus()
    DebugPrint("联机动作Focus FocusNextItem:No Item")
    return 
  end
  r0_18.List_Invite:BP_NavigateToItem(r0_18.List_Invite:GetItemAt(r2_18))
end
AssembleComponents(r0_0)
return r0_0
