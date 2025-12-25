-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\UI_PC\Experience\WBP_Experience_EXDialog_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase"
})
function r0_0.Construct(r0_1)
  -- line: [17, 43] id: 1
  r0_1.PanelHeight = 340
  r0_1.ListView_Value:SetScrollBarVisibility(ESlateVisibility.Hidden)
  r0_1.ListView_Value:SetControlScrollbarInside(true)
  r0_1.Avatar = GWorld:GetAvatar()
  r0_1.Text_ExpNow:SetText(GText("PlayerLevel_ExpNow"))
  r0_1.Text_LV:SetText(r0_1.Avatar.Level)
  local r1_1 = r0_1.Avatar.Exp
  if r1_1 then
    r0_1.Exp_Now:SetText(tostring(r1_1))
  end
  local r2_1 = DataMgr.PlayerLevelUp[r0_1.Avatar.Level]
  local r3_1 = nil
  if r2_1 then
    r3_1 = r2_1.PlayerLevelMaxExp
  end
  if r3_1 then
    r0_1.Exp_Total:SetText(tostring(r3_1))
  end
  if r3_1 and r1_1 then
    local r4_1 = r1_1 / r3_1
    if r4_1 > 1 then
      r4_1 = 1
    end
    r0_1.Progress_Exp:SetPercent(r4_1)
  end
  local r4_1 = UGameInputModeSubsystem.GetGameInputModeSubsystem(r0_1)
  if IsValid(r4_1) then
    r0_1:RefreshOpInfoByInputDevice(r4_1:GetCurrentInputType())
    r4_1.OnInputMethodChanged:Add(r0_1, r0_1.RefreshOpInfoByInputDevice)
  end
end
function r0_0.Destruct(r0_2)
  -- line: [48, 54] id: 2
  local r1_2 = UGameInputModeSubsystem.GetGameInputModeSubsystem(r0_2)
  if IsValid(r1_2) then
    r0_2:RefreshOpInfoByInputDevice(r1_2:GetCurrentInputType())
    r1_2.OnInputMethodChanged:Remove(r0_2, r0_2.RefreshOpInfoByInputDevice)
  end
end
function r0_0.InitContent(r0_3, r1_3, r2_3, r3_3)
  -- line: [56, 60] id: 3
  r0_3.Owner = r3_3
  r0_3.Parent = r1_3.Parent
  r0_3:Init()
end
function r0_0.Init(r0_4)
  -- line: [62, 65] id: 4
  r0_4:InitList()
end
function r0_0.InitList(r0_5)
  -- line: [67, 126] id: 5
  r0_5.ListView_Value:ClearListItems()
  local r1_5 = {}
  local r2_5 = {}
  for r7_5, r8_5 in pairs(DataMgr.PlayerExpSource) do
    table.insert(r1_5, r8_5)
  end
  -- close: r3_5
  table.sort(r1_5, function(r0_6, r1_6)
    -- line: [74, 76] id: 6
    return r1_6.Sequence < r0_6.Sequence
  end)
  for r7_5, r8_5 in pairs(DataMgr.PlayerExpSubSource) do
    table.insert(r2_5, r8_5)
  end
  -- close: r3_5
  table.sort(r2_5, function(r0_7, r1_7)
    -- line: [80, 82] id: 7
    return r1_7.Sequence < r0_7.Sequence
  end)
  local r3_5 = r0_5:CollectRewardExp()
  r0_5.AllContentInfo = {}
  local r4_5 = 0
  for r9_5, r10_5 in ipairs(r1_5) do
    r0_5:SetContentInfo(r10_5, r3_5)
    if r10_5.ID ~= 5 then
      r4_5 = r4_5 + (r0_5.AllContentInfo[r10_5.ID].SumCollectRewardExp and 0)
    end
  end
  -- close: r5_5
  for r9_5, r10_5 in ipairs(r1_5) do
    local r11_5 = NewObject(UIUtils.GetCommonItemContentClass())
    local r12_5 = r0_5.AllContentInfo[r10_5.ID]
    r11_5.ID = r12_5.ID
    r11_5.SourceName = r12_5.SourceName
    r11_5.AllSubContentInfo = r12_5.AllSubContentInfo
    r11_5.SumCanGetRewardExp = r12_5.SumCanGetRewardExp
    r11_5.SumCollectRewardExp = r12_5.SumCollectRewardExp
    if r10_5.ID == 5 then
      r11_5.SumCollectRewardExp = r11_5.SumCollectRewardExp - r4_5
      for r17_5, r18_5 in pairs(r11_5.AllSubContentInfo) do
        if r18_5.Key == "Quest" then
          r18_5.CollectRewardExp = r18_5.CollectRewardExp - r4_5
        end
      end
      -- close: r13_5
    end
    r0_5.ListView_Value:AddItem(r11_5)
  end
  -- close: r5_5
  r0_5:AddTimer(0.1, function()
    -- line: [110, 125] id: 8
    r0_5.ListView_Value:ScrollToTop()
    local r0_8 = 0
    local r1_8 = r0_5.ListView_Value:GetDisplayedEntryWidgets()
    for r5_8 = 1, r1_8:Length(), 1 do
      r0_8 = r0_8 + r1_8:GetRef(r5_8):GetDesiredSize().Y
    end
    if r0_5.PanelHeight < r0_8 then
      r0_5.NeedShowTip = true
    else
      r0_5.NeedShowTip = false
    end
    r0_5:ShowGamepadScrollBtn(r0_5.NeedShowTip)
  end)
end
function r0_0.CollectRewardExp(r0_9)
  -- line: [128, 190] id: 9
  local r1_9 = {}
  local r2_9 = r0_9.Avatar.CollectRewardExpRecord
  if type(r2_9) ~= "table" then
    return r1_9
  end
  for r7_9, r8_9 in pairs(r2_9) do
    local r9_9 = tostring(r7_9)
    local r9_9, r10_9 = r9_9:match("^([^.]+)%.?(.*)$")
    if r9_9 and r9_9 ~= "" then
      local r11_9 = DataMgr and DataMgr[r9_9]
      if r10_9 and r10_9 ~= "" then
        for r16_9 in r10_9:gmatch("[^.]+") do
          if type(r11_9) ~= "table" then
            r11_9 = nil
            break
          else
            local r17_9 = r11_9[r16_9]
            if r17_9 == nil then
              local r18_9 = tonumber(r16_9)
              if r18_9 then
                r17_9 = r11_9[r18_9]
              end
              if r9_9 ~= "WeaponCardLevel" or r17_9 ~= nil then
                ::label_57::
                r11_9 = r17_9
              else
                break
              end
            else
              goto label_57	-- block#17 is visited secondly
            end
          end
        end
        -- close: r12_9
      end
      if type(r11_9) == "table" then
        local r12_9 = tonumber(r11_9.CollectRewardExp)
        if r12_9 and r12_9 > 0 then
          local r13_9 = r1_9[r9_9]
          if not r13_9 then
            r13_9 = {
              Count = 0,
              Exp = 0,
            }
            r1_9[r9_9] = r13_9
          end
          r13_9.Count = r13_9.Count + 1
          r13_9.Exp = r13_9.Exp + r12_9
        end
      end
    end
  end
  -- close: r3_9
  local r3_9 = r0_9.Avatar.PlayerExpRecord
  if r3_9[2000] then
    r1_9.Daily = {}
    r1_9.Daily.Exp = r3_9[2000]
  end
  if r3_9[2001] then
    r1_9.Quest = {}
    r1_9.Quest.Exp = r3_9[2001]
  end
  return r1_9
end
function r0_0.ShowGamepadScrollBtn(r0_10, r1_10)
  -- line: [192, 212] id: 10
  if r1_10 then
    if r0_10.GamepadScrollBtnIndex then
      return 
    end
    r0_10.GamepadScrollBtnIndex = r0_10:ShowGamepadShortcutBtn({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "RV",
        }
      },
      Desc = GText("UI_Controller_Slide"),
    })
  elseif r0_10.GamepadScrollBtnIndex then
    r0_10:HideGamepadShortcut(r0_10.GamepadScrollBtnIndex)
    r0_10.GamepadScrollBtnIndex = nil
  end
end
function r0_0.OnContentAnalogValueChanged(r0_11, r1_11, r2_11)
  -- line: [214, 225] id: 11
  if UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_11)) == UIConst.GamePadKey.RightAnalogY then
    r0_11.ListView_Value:SetScrollOffset(math.clamp(r0_11.ListView_Value:GetScrollOffset() - UKismetInputLibrary.GetAnalogValue(r2_11), 0, UIUtils.GetMaxScrollOffsetOfListView(r0_11.ListView_Value)))
    return UIUtils.Handled
  end
  return UIUtils.Unhandled
end
function r0_0.RefreshOpInfoByInputDevice(r0_12, r1_12, r2_12)
  -- line: [227, 234] id: 12
  if r1_12 == ECommonInputType.MouseAndKeyboard then
    r0_12:InitKeyBoardView()
  else
    r0_12:InitGamepadView()
  end
end
function r0_0.InitGamepadView(r0_13)
  -- line: [236, 238] id: 13
  r0_13:SetFocus()
end
function r0_0.InitKeyBoardView(r0_14)
  -- line: [240, 242] id: 14
  r0_14:SetFocus()
end
function r0_0.SetContentInfo(r0_15, r1_15, r2_15)
  -- line: [244, 376] id: 15
  if r0_15.AllContentInfo and r0_15.AllContentInfo[r1_15.Id] then
    return 
  end
  local r3_15 = DataMgr.GlobalConstant.CurrentVersion.ConstantValue
  local r4_15 = r1_15.ID
  r0_15.AllContentInfo[r1_15.ID] = {
    ID = r1_15.ID,
    SourceName = r1_15.SourceName,
    AllSubContentInfo = {},
  }
  r0_15.MainPlayerChar = 0
  local r5_15 = {}
  if r4_15 == 1 then
    for r10_15, r11_15 in pairs(DataMgr.Char) do
      if not r11_15.IsNotOpen and r11_15.CollectRewardExp and (not r11_15.ReleaseVersion or r11_15.ReleaseVersion <= r3_15) then
        table.insert(r5_15, r11_15.CharId)
      end
    end
    -- close: r6_15
  elseif r4_15 == 2 then
    for r10_15, r11_15 in pairs(DataMgr.Weapon) do
      if not r11_15.IsNotOpen and r11_15.CollectRewardExp and (not r11_15.ReleaseVersion or r11_15.ReleaseVersion <= r3_15) then
        table.insert(r5_15, r11_15.WeaponId)
      end
    end
    -- close: r6_15
  elseif r4_15 == 3 then
    local r6_15 = {}
    for r11_15, r12_15 in pairs(DataMgr.Pet) do
      if r12_15.GUID and r12_15.CollectRewardExp then
        r6_15[r12_15.GUID] = 1
      end
    end
    -- close: r7_15
    for r11_15, r12_15 in pairs(r6_15) do
      table.insert(r5_15, r11_15)
    end
    -- close: r7_15
  elseif r4_15 == 4 then
    for r10_15, r11_15 in pairs(DataMgr.Mod) do
      if not r11_15.IsNotOpen and r11_15.CollectRewardExp and (not r11_15.ReleaseVersion or r11_15.ReleaseVersion <= r3_15) then
        table.insert(r5_15, r11_15.Id)
      end
    end
    -- close: r6_15
  elseif r4_15 == 5 then
  end
  local r6_15 = {}
  for r11_15, r12_15 in pairs(DataMgr.PlayerExpSubSource) do
    if r12_15.Source == r4_15 then
      table.insert(r6_15, r12_15)
    end
  end
  -- close: r7_15
  table.sort(r6_15, function(r0_16, r1_16)
    -- line: [308, 310] id: 16
    return r1_16.Sequence < r0_16.Sequence
  end)
  local r7_15 = 0
  local r8_15 = 0
  for r13_15, r14_15 in pairs(r6_15) do
    local r15_15 = {}
    if r14_15.Source ~= 5 then
      local r16_15 = 0
      if r14_15.Key ~= "ModGuideBookTask" then
        local r17_15 = DataMgr[r14_15.Key]
        for r22_15, r23_15 in pairs(r5_15) do
          local r24_15 = r17_15[r23_15]
          if r24_15 then
            r16_15 = r16_15 + r0_15:GetCanGetRewardExp(r24_15, r14_15.Key)
          end
        end
        -- close: r18_15
      else
        for r22_15, r23_15 in pairs(DataMgr[r14_15.Key]) do
          r16_15 = r16_15 + r0_15:GetRewardExp_ModGuideBookTask(r23_15)
        end
        -- close: r18_15
      end
      r8_15 = r8_15 + r16_15
      r15_15.CanGetRewardExp = r16_15
    else
      r15_15.CanGetRewardExp = nil
      r8_15 = nil
    end
    local r16_15 = 0
    if r14_15.Key ~= "ModGuideBookTask" then
      if r2_15[r14_15.Key] then
        r16_15 = r2_15[r14_15.Key].Exp
      end
    else
      local r17_15 = DataMgr[r14_15.Key]
      for r22_15, r23_15 in pairs(r0_15.Avatar.ModBookQuests) do
        if r23_15.RewardsGot then
          r16_15 = r16_15 + r0_15:GetRewardExp_ModGuideBookTask(r17_15[r22_15])
        end
      end
      -- close: r18_15
    end
    r7_15 = r7_15 + r16_15
    r15_15.CollectRewardExp = r16_15
    r15_15.ID = r14_15.ID
    r15_15.Key = r14_15.Key
    r15_15.SubSourceName = r14_15.SubSourceName
    if r14_15.Key == "Char" or r14_15.Key == "Weapon" or r14_15.Key == "Pet" or r14_15.Key == "Mod" then
      r15_15.TotalNum = #r5_15
      r15_15.CurNum = 0
      if r2_15[r14_15.Key] then
        r15_15.CurNum = r2_15[r14_15.Key].Count
      end
      if r14_15.Key == "Char" then
        r15_15.TotalNum = r15_15.TotalNum - (r0_15.MainPlayerChar and 0)
      end
    else
      r15_15.TotalNum = nil
      r15_15.CurNum = nil
    end
    r0_15.AllContentInfo[r4_15].AllSubContentInfo[r15_15.ID] = r15_15
  end
  -- close: r9_15
  r0_15.AllContentInfo[r4_15].SumCanGetRewardExp = r8_15
  r0_15.AllContentInfo[r4_15].SumCollectRewardExp = r7_15
  -- warn: not visited block [11]
  -- block#11:
  -- _ENV.table.insert(r5_15, r11_15.CharId)
  -- r0_15.MainPlayerChar = r0_15.MainPlayerChar + 1
  -- goto label_71
end
function r0_0.GetCanGetRewardExp(r0_17, r1_17, r2_17)
  -- line: [378, 398] id: 17
  local r3_17 = 0
  if type(r1_17) == "table" then
    if r1_17.CollectRewardExp then
      if r2_17 == "WeaponCardLevel" then
        if r1_17.CardLevelMax then
          return r1_17.CollectRewardExp * r1_17.CardLevelMax
        else
          return r1_17.CollectRewardExp
        end
      else
        return r1_17.CollectRewardExp
      end
    else
      for r8_17, r9_17 in pairs(r1_17) do
        r3_17 = r3_17 + r0_17:GetCanGetRewardExp(r9_17, r2_17)
      end
      -- close: r4_17
    end
  end
  return r3_17
end
function r0_0.GetRewardExp_ModGuideBookTask(r0_18, r1_18)
  -- line: [400, 413] id: 18
  local r2_18 = 0
  if r1_18.TaskReward then
    for r6_18 = 1, #r1_18.TaskReward, 1 do
      local r7_18 = DataMgr.Reward[r1_18.TaskReward[r6_18]]
      for r12_18, r13_18 in ipairs(r7_18.Id) do
        if r13_18 == 2001 then
          r2_18 = r2_18 + r7_18.Count[r12_18][1]
        end
      end
      -- close: r8_18
    end
  end
  return r2_18
end
return r0_0
