-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Play\Widget\Depute\WBP_Play_NewDepute_Root_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.BP_UIState_C"
})
function r0_0.Construct(r0_1)
  -- line: [13, 37] id: 1
  r0_0.Super.Construct(r0_1)
  r0_1.IsPC = CommonUtils.GetDeviceTypeByPlatformName(r0_1) == "PC"
  r0_1:AddInputMethodChangedListen()
  EventManager:AddEvent(EventID.OnDungeonsUpdate, r0_1, r0_1.OnDungeonsUpdate)
  r0_1:OpenDeputeUI("Regular")
  r0_1:InitTab()
  function r0_1.SubUIJumpFunc(r0_2, ...)
    -- line: [21, 36] id: 2
    local r1_2 = {
      ...
    }
    local r2_2 = r1_2[1]
    local r3_2 = r0_1:GetDeputeTabIndex(r2_2)
    if r2_2 == "NightBook" and r1_2[2] then
      r0_1.JumpNightBooKTabName = r1_2[2]
      local r4_2 = UIManager(r0_1):GetUIObj("StyleOfPlay")
      if r4_2 then
        r4_2.SubUI.DungeonSelect = nil
      end
    end
    r0_1.DeputeTab:SelectTab(r3_2)
    r0_1.JumpNightBooKTabName = nil
  end
end
function r0_0.GetDeputeTabIndex(r0_3, r1_3)
  -- line: [39, 47] id: 3
  return ({
    Regular = 1,
    NightBook = 2,
    Walnut = 3,
    WeeklySelectDungeon = 4,
  })[r1_3] and 1
end
function r0_0.Destruct(r0_4)
  -- line: [49, 51] id: 4
  r0_4:PlayAnimation(r0_4.Out)
end
function r0_0.RefreshDepute(r0_5, r1_5, r2_5)
  -- line: [54, 60] id: 5
  if r1_5 then
    r1_5:InitContent(r0_5)
  else
    print("Error: " .. r2_5 .. " SL is not initialized.")
  end
end
function r0_0.OpenDeputeUI(r0_6, r1_6)
  -- line: [64, 82] id: 6
  if r0_6.DeputeTabType == r1_6 and IsValid(r0_6[r1_6 .. "UI"]) then
    return 
  end
  r0_6.DeputeTabType = r1_6
  r0_6.PanelRoot:ClearChildren()
  local r2_6 = r1_6 .. "UI"
  if not IsValid(r0_6[r2_6]) then
    r0_6[r2_6] = UIManager(r0_6):_CreateWidgetNew("Depute_" .. r1_6)
  end
  local r3_6 = r0_6[r2_6]
  r0_6.PanelRoot:AddChild(r3_6)
  local r4_6 = r3_6.Slot
  r4_6:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
  r4_6:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
  r0_6:RefreshDepute(r3_6, r2_6)
end
function r0_0.InitTab(r0_7)
  -- line: [86, 147] id: 7
  local r1_7 = {}
  local r2_7 = {}
  local r3_7 = GWorld:GetAvatar()
  if r3_7 == nil then
    return 
  end
  for r8_7, r9_7 in pairs(DataMgr.PlaySubTab) do
    if r9_7.WidgetUI == "NewDeputeRoot" then
      local r10_7 = true
      if r9_7.SubTabUnlockRuleId then
        r10_7 = r3_7:CheckUIUnlocked(r9_7.SubTabUnlockRuleId)
      end
      if r10_7 then
        table.insert(r2_7, r9_7)
      end
    end
  end
  -- close: r4_7
  if #r2_7 < 2 then
    r0_7.DeputeTab:SetVisibility(ESlateVisibility.Collapsed)
    return 
  else
    r0_7.DeputeTab:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  table.sort(r2_7, function(r0_8, r1_8)
    -- line: [114, 116] id: 8
    return r1_8.Sequence < r0_8.Sequence
  end)
  r0_7.PlayTabInfo = r2_7
  for r8_7, r9_7 in ipairs(r2_7) do
    local r10_7 = {
      Text = GText(r9_7.SubTabName),
      Img = r9_7.EnterImage,
      TabId = r8_7,
    }
    if r9_7.SubWidgetUI == "DeputeNightBook" then
      r10_7.TipsData = {
        TipsName = GText("UI_JingLi_NoCost"),
        Icon = "/Game/UI/Texture/Dynamic/Atlas/Prop/Item/T_Coin_Other_Jingli.T_Coin_Other_Jingli",
      }
    end
    table.insert(r1_7, r10_7)
  end
  -- close: r4_7
  r0_7.DeputeTab:Init({
    LeftKey = "A",
    RightKey = "D",
    Tabs = r1_7,
    ChildWidgetBPPath = "/Game/UI/WBP/Play/Widget/Depute/WBP_Depute_TabSubItem.WBP_Depute_TabSubItem",
    SoundFunc = function()
      -- line: [141, 143] id: 9
      AudioManager(r0_7):PlayUISound(r0_7, "event:/ui/common/click_level_02", nil, nil)
    end,
  })
  r0_7.DeputeTab:SelectTab(1)
  r0_7.DeputeTab:BindEventOnTabSelected(r0_7, r0_7.OnSubTabChanged)
end
function r0_0.OnSubTabChanged(r0_10, r1_10)
  -- line: [150, 165] id: 10
  local r2_10 = r0_10.PlayTabInfo[r1_10.Idx]
  if not r2_10 then
    return 
  end
  if r2_10.SubWidgetUI == "NewDeputeRoot" then
    r0_10:OpenDeputeUI("Regular")
  elseif r2_10.SubWidgetUI == "DeputeNightBook" then
    r0_10:OpenDeputeUI("NightBook")
  elseif r2_10.SubWidgetUI == "DeputeWalnut" then
    r0_10:OpenDeputeUI("Walnut")
  elseif r2_10.SubWidgetUI == "WeeklySelectDungeon" then
    r0_10:OpenDeputeUI("WeeklySelectDungeon")
  end
end
function r0_0.HandleKeyDown(r0_11, r1_11, r2_11)
  -- line: [168, 190] id: 11
  local r3_11 = UE4.UKismetInputLibrary.GetKey(r2_11)
  local r4_11 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_11)
  local r5_11 = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_11) then
    r5_11 = r0_11.DeputeTab:Handle_KeyEventOnGamePad(r4_11)
  elseif r4_11 == "A" and r0_11.DeputeTab then
    r0_11.DeputeTab:TabToLeft()
    r5_11 = true
  elseif r4_11 == "D" and r0_11.DeputeTab then
    r0_11.DeputeTab:TabToRight()
    r5_11 = true
  end
  return r5_11
end
function r0_0.OnDungeonsUpdate(r0_12)
  -- line: [193, 197] id: 12
  if r0_12.Depute_WalnutUI then
    r0_12:RefreshDepute(r0_12.Depute_WalnutUI, "Depute_Walnut")
  end
end
function r0_0.OnFocusReceived(r0_13, r1_13, r2_13)
  -- line: [199, 217] id: 13
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
  if r0_13:HasFocusedDescendants() or r0_13:HasAnyUserFocus() then
    if r0_13.DeputeTabType == "Regular" then
      r0_13.RegularUI.List_Depute:NavigateToIndex(0)
    elseif r0_13.DeputeTabType == "NightBook" then
      r0_13.NightBookUI.List_NightBookItem:NavigateToIndex(0)
    elseif r0_13.DeputeTabType ~= "Walnut" and r0_13.DeputeTabType == "WeeklySelectDungeon" then
      r0_13.WeeklySelectDungeonUI.List_Weekly:SetFocus()
    end
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end
function r0_0.SwitchIn(r0_14)
  -- line: [219, 221] id: 14
  r0_14:UpdatKeyDisplay()
end
function r0_0.UpdatKeyDisplay(r0_15)
  -- line: [238, 261] id: 15
  if not UIUtils.IsGamepadInput() then
    local r1_15 = UIManager(r0_15):GetUIObj("StyleOfPlay")
    if not r1_15 then
      return 
    end
    local r2_15 = {}
    r1_15:UpdateOtherPageTab({
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = r0_15.CloseSelf,
            Owner = r0_15,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = r0_15,
          }
        },
        Desc = GText("UI_BACK"),
      }
    })
  end
end
function r0_0.CloseSelf(r0_16)
  -- line: [263, 267] id: 16
  local r1_16 = UIManager(r0_16):GetUIObj("StyleOfPlay")
  r0_16:PlayAnimation(r0_16.Out)
  r1_16:OnClickBack()
end
function r0_0.RefreshOpInfoByInputDevice(r0_17, r1_17, r2_17)
  -- line: [269, 295] id: 17
  if r1_17 == ECommonInputType.Touch then
    return 
  end
  local r3_17 = r1_17 == ECommonInputType.MouseAndKeyboard
  if not r3_17 or not 0 then
    local r4_17 = 1
  end
  if r3_17 then
    r0_17:UpdatKeyDisplay()
  elseif nil and not nil then
    goto label_26	-- block#11 is visited secondly
  end
end
return r0_0
