-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Play\Widget\Task\WBP_Play_TaskRoot_P_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})
local r1_0 = require("Blueprints.UI.WBP.Activity.ActivityUtils")
function r0_0.Construct(r0_1)
  -- line: [17, 19] id: 1
  r0_1:InitTab()
end
function r0_0.Destruct(r0_2)
  -- line: [21, 29] id: 2
  if r0_2.WidgetNameToIndex then
    for r5_2, r6_2 in pairs(r0_2.WidgetNameToIndex) do
      if DataMgr.ReddotNode[r5_2] then
        ReddotManager.RemoveListener(r5_2, r0_2)
      end
    end
    -- close: r1_2
  end
end
function r0_0.InitTab(r0_3)
  -- line: [31, 94] id: 3
  local r1_3 = GWorld:GetAvatar()
  if r1_3 == nil then
    return 
  end
  local r2_3 = {}
  local r3_3 = {}
  for r8_3, r9_3 in pairs(DataMgr.PlaySubTab) do
    if r9_3.WidgetUI == "PlayTaskRoot" and r9_3.SubTabUnlockRuleId and r1_3:CheckUIUnlocked(r9_3.SubTabUnlockRuleId) then
      table.insert(r3_3, r9_3)
    end
  end
  -- close: r4_3
  if #r3_3 < 2 then
    r0_3.Tab:SetVisibility(ESlateVisibility.Collapsed)
  else
    r0_3.Tab:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  table.sort(r3_3, function(r0_4, r1_4)
    -- line: [53, 55] id: 4
    return r1_4.Sequence < r0_4.Sequence
  end)
  r0_3.PlayTabInfo = r3_3
  local r4_3 = nil
  local r5_3 = not r1_0.CheckStarterQuestAllDone()
  for r10_3, r11_3 in ipairs(r3_3) do
    local r12_3 = {
      Text = GText(r11_3.SubTabName),
      Img = r11_3.EnterImage,
      TabId = r10_3,
    }
    if r11_3.SubWidgetUI == "StarterQuest" and r5_3 then
      r4_3 = r10_3
      if r4_3 then
        r4_3 = r4_3
      end
    elseif not r4_3 then
      r4_3 = r10_3
    end
    table.insert(r2_3, r12_3)
  end
  -- close: r6_3
  local r8_3 = {
    LeftKey = "A",
    RightKey = "D",
    Tabs = r2_3,
    ChildWidgetBPPath = "/Game/UI/WBP/Play/Widget/Depute/WBP_Depute_TabSubItem.WBP_Depute_TabSubItem",
    SoundFunc = function()
      -- line: [79, 81] id: 5
      AudioManager(r0_3):PlayUISound(r0_3, "event:/ui/common/click_level_02", nil, nil)
    end,
  }
  r0_3.Tab:Init(r8_3)
  r0_3.Tab:BindEventOnTabSelected(r0_3, r0_3.OnSubTabChanged)
  r0_3.Tab:SelectTab(r4_3 and 1)
  r0_3.WidgetNameToIndex = {}
  for r10_3, r11_3 in ipairs(r3_3) do
    local r12_3 = r11_3.SubWidgetUI
    if DataMgr.ReddotNode[r12_3] then
      r0_3.WidgetNameToIndex[r12_3] = r10_3
      ReddotManager.AddListener(r12_3, r0_3, r0_3["On" .. r12_3 .. "ReddotChange"])
    end
  end
  -- close: r6_3
end
function r0_0.OnStarterQuestReddotChange(r0_6)
  -- line: [95, 97] id: 6
  r0_6:OnReddotChange("StarterQuest")
end
function r0_0.OnDailyMainReddotChange(r0_7)
  -- line: [98, 100] id: 7
  r0_7:OnReddotChange("DailyMain")
end
function r0_0.OnReddotChange(r0_8, r1_8)
  -- line: [101, 115] id: 8
  local r2_8 = r0_8.WidgetNameToIndex[r1_8]
  if r2_8 then
    local r3_8 = ReddotManager.GetTreeNode(r1_8)
    local r4_8 = false
    if r3_8 and r3_8.Count > 0 then
      r4_8 = true
    end
    local r5_8 = r0_8.Tab.List_Tab:GetChildAt(math.max(r2_8 + -1, 0))
    if r5_8 then
      local r6_8 = r5_8.Reddot
      local r8_8 = nil	-- notice: implicit variable refs by block#[8]
      if r4_8 then
        r8_8 = UE4.ESlateVisibility.SelfHitTestInvisible
        if not r8_8 then
          ::label_36::
          r8_8 = UE4.ESlateVisibility.Collapsed
        end
      else
        goto label_36	-- block#7 is visited secondly
      end
      r6_8:SetVisibility(r8_8)
    end
  end
end
function r0_0.OnSubTabChanged(r0_9, r1_9)
  -- line: [117, 123] id: 9
  local r2_9 = r0_9.PlayTabInfo[r1_9.Idx]
  if not r2_9 then
    return 
  end
  r0_9:OnOpenTaskUI(r2_9.SubWidgetUI)
end
function r0_0.SubUIJumpFunc(r0_10, r1_10)
  -- line: [125, 132] id: 10
  for r6_10, r7_10 in ipairs(r0_10.PlayTabInfo) do
    if r7_10.SubWidgetUI == r1_10 then
      r0_10.Tab:SelectTab(r6_10)
      return 
    end
  end
  -- close: r2_10
end
function r0_0.OnOpenTaskUI(r0_11, r1_11)
  -- line: [133, 154] id: 11
  r0_11.IsHideGamepadKey = nil
  r0_11.PanelRoot:ClearChildren()
  if not IsValid(r0_11[r1_11]) then
    r0_11[r1_11] = UIManager(r0_11):_CreateWidgetNew(r1_11)
  end
  local r2_11 = r0_11[r1_11]
  r0_11.PanelRoot:AddChild(r2_11)
  local r3_11 = r2_11.Slot
  r3_11:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
  r3_11:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
  if r2_11.InitContent then
    r2_11:InitContent(r0_11)
  end
  r0_11.CurSubUI = r2_11
  r0_11.CurSubUI:SetFocus()
  if r2_11.In then
    r2_11:PlayAnimation(r2_11.In)
  end
end
function r0_0.SwitchIn(r0_12)
  -- line: [155, 165] id: 12
  if not r0_12.CurSubUI then
    return 
  end
  if r0_12.CurSubUI.SwitchIn then
    r0_12.CurSubUI:SwitchIn()
  end
end
function r0_0.SwitchGamepadKeyShow(r0_13, r1_13)
  -- line: [166, 169] id: 13
  r0_13.Tab:UpdateUIStyleInPlatform(r1_13)
  r0_13.IsHideGamepadKey = not r1_13
end
function r0_0.HandleKeyDown(r0_14, r1_14, r2_14)
  -- line: [171, 184] id: 14
  local r3_14 = UE4.UKismetInputLibrary.GetKey(r2_14)
  local r4_14 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_14)
  local r5_14 = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_14) then
    if not r0_14.IsHideGamepadKey then
      r5_14 = r0_14.Tab:Handle_KeyEventOnGamePad(r4_14)
    end
  else
    r5_14 = r0_14.Tab:Handle_KeyEventOnPC(r4_14)
  end
  return r5_14
end
function r0_0.BP_GetDesiredFocusTarget(r0_15)
  -- line: [185, 190] id: 15
  if r0_15.CurSubUI and r0_15.CurSubUI.NodeName == "StarterQuest" and not UIUtils.HasAnyFocus(r0_15.CurSubUI) then
    return r0_15.CurSubUI:ReGetDesiredFocusTarget()
  end
  return r0_15.CurSubUI and r0_15
end
return r0_0
