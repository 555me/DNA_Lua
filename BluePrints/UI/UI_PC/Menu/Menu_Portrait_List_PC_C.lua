-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\UI_PC\Menu\Menu_Portrait_List_PC_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("BluePrints.UI.UIConst")
local r1_0 = Class({
  "BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase"
})
function r1_0.Initialize(r0_1, r1_1)
  -- line: [14, 17] id: 1
  r0_1.Super.Initialize(r0_1)
  r0_1.CurPortraitPath = nil
end
function r1_0.InitContent(r0_2, r1_2, r2_2, r3_2)
  -- line: [19, 49] id: 2
  r0_2:BindDialogEvent(DialogEvent.OnTitleTabSelected, r0_2.OnTabSelected)
  r0_2.BtnText.AudioEventPath = "event:/ui/common/click_btn_confirm"
  r0_2.BtnText.Button_Area.OnClicked:Add(r0_2, r0_2.ConfirmChange)
  r0_2.IsHeadFrame = false
  r0_2.BtnText:SetText(GText("UI_HeadFrame_Change"))
  r0_2.Text_Btn:SetText(GText("UI_HeadFrame_Wearing"))
  r0_2:SetCurPortrait()
  local r4_2 = GWorld:GetAvatar()
  if r4_2 then
    r0_2.Text_Tips:SetText(string.format(GText("UI_HeadFrame_Own"), r0_2:GetCount(r4_2.HeadIconList)))
  end
  r0_2.Text_Empty:SetText(GText("UI_HeadFrame_None"))
  r0_2:PlayAnimation(r0_2.In)
  r0_2:InitPortrait()
  r0_2.List_Item:SetFocus()
  r0_2.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(UE4.UGameplayStatics.GetPlayerController(r0_2, 0))
  if r1_2.TabConfigData.FreshCallback ~= nil then
    r0_2._FreshCallback = r1_2.TabConfigData.FreshCallback
  end
  local r6_2 = UGameInputModeSubsystem.GetGameInputModeSubsystem(r0_2)
  if IsValid(r6_2) then
    r6_2.OnInputMethodChanged:Add(r0_2, r0_2.RefreshOpInfoByInputDevice)
  end
end
function r1_0.GetCount(r0_3, r1_3)
  -- line: [51, 60] id: 3
  local r2_3 = 0
  if not r1_3 then
    return r2_3
  end
  for r7_3, r8_3 in pairs(r1_3) do
    r2_3 = r2_3 + 1
  end
  -- close: r3_3
  return r2_3
end
function r1_0.OnTabSelected(r0_4, r1_4)
  -- line: [62, 66] id: 4
  r0_4.IsHeadFrame = r1_4.Idx == 2
  r0_4:Refresh()
  r0_4:SetCurPortrait()
end
function r1_0.Refresh(r0_5)
  -- line: [68, 136] id: 5
  local r6_5 = nil	-- notice: implicit variable refs by block#[14, 15, 16, 26, 28]
  if r0_5.IsHeadFrame then
    if not r0_5.FilledHeadFrame then
      r0_5:FillEmpty(r0_5.List_Item_Frame, r0_5.List_Item_Frame:GetNumItems())
      r0_5.FilledHeadFrame = true
    end
    r0_5.WidgetSwitcher_List:SetActiveWidgetIndex(1)
    r0_5.List_Item_Frame:SetFocus()
    local r1_5 = r0_5.List_Item_Frame:GetNumItems()
    if r1_5 == 1 then
      r0_5.List_Item_Frame:SetIsShowNavigateGuide(false)
    else
      r0_5.List_Item_Frame:SetIsShowNavigateGuide(true)
    end
    r0_5.List_Item_Frame:SetFocus()
    r0_5.GameInputModeSubsystem:UpdateCurrentFocusWidgetPos()
    for r5_5 = 0, r1_5 + -1, 1 do
      r6_5 = r0_5.List_Item_Frame:GetItemAt(r5_5)
      if r6_5.PortraitId == r0_5.HeadFrameId then
        r0_5.List_Item_Frame:ScrollIndexIntoView(r5_5)
        r0_5:AddTimer(0.1, function()
          -- line: [89, 93] id: 6
          if r6_5.SelfWidget then
            r6_5.SelfWidget:SetGamePadFocus()
          end
        end, false, 0, nil, true)
        r0_5:RefreshItemClick(r6_5)
        if r6_5.SelfWidget then
          r6_5.SelfWidget:PlayAnimation(r6_5.SelfWidget.Click)
          r6_5.SelfWidget.IsSelect = true
        end
      end
      -- close: r6_5
    end
  else
    r0_5.WidgetSwitcher_List:SetActiveWidgetIndex(0)
    r0_5.List_Item:SetFocus()
    for r5_5 = 0, r0_5.List_Item:GetNumItems() + -1, 1 do
      r6_5 = r0_5.List_Item
      r6_5 = r6_5:GetItemAt(r5_5)
      if r6_5.PortraitId == r0_5.HeadIconId then
        r0_5:RefreshItemClick(r6_5)
        if r6_5.SelfWidget then
          r6_5.SelfWidget:PlayAnimation(r6_5.SelfWidget.Click)
          r6_5.SelfWidget.IsSelect = true
        end
      end
    end
  end
  r0_5.Switcher_Btn:SetActiveWidgetIndex(1)
  local r1_5 = GWorld:GetAvatar()
  if r0_5.IsHeadFrame then
    if r1_5 and r1_5.HeadFrameList then
      local r2_5 = false
      for r7_5, r8_5 in pairs(r1_5.HeadFrameList) do
        r2_5 = true
      end
      -- close: r3_5
      if not r2_5 then
        r0_5.Switcher_Dialog:SetActiveWidgetIndex(1)
      end
      r6_5 = GText
      r6_5 = r6_5("UI_HeadFrame_Own")
      r0_5.Text_Tips:SetText(string.format(r6_5, r0_5:GetCount(r1_5.HeadFrameList)))
    end
  else
    r0_5.Switcher_Dialog:SetActiveWidgetIndex(0)
    if r1_5 then
      r6_5 = "UI_HeadFrame_Own"
      r0_5.Text_Tips:SetText(string.format(GText(r6_5), r0_5:GetCount(r1_5.HeadIconList)))
    end
  end
end
function r1_0.SetCurPortrait(r0_7)
  -- line: [138, 150] id: 7
  local r1_7 = GWorld:GetAvatar()
  if r1_7 then
    r0_7.HeadFrameId = r1_7.HeadFrameId
    if r0_7.HeadFrameId then
      r0_7:SetHeadFrameInfo(r0_7.HeadFrameId)
    end
    r0_7.HeadIconId = r1_7.HeadIconId
    if r0_7.HeadIconId then
      r0_7:SetPortraitInfo(r0_7.HeadIconId)
    end
  end
end
function r1_0.SetHeadFrameInfo(r0_8, r1_8)
  -- line: [152, 168] id: 8
  if r1_8 == -1 then
    r0_8.Text_RoleName:SetText(GText("UI_HeadFrame_Empty"))
    r0_8.Head_Frame:SetVisibility(r0_0.VisibilityOp.Collapsed)
  else
    local r3_8 = GText(DataMgr.HeadFrame[r1_8].Name)
    local r4_8 = LoadObject(DataMgr.HeadFrame[r1_8].SmallIcon)
    if r4_8 ~= nil then
      r0_8.Head_Frame:SetBrushResourceObject(r4_8)
    end
    if r0_8.IsHeadFrame then
      r0_8.Text_RoleName:SetText(r3_8)
    end
    r0_8.Head_Frame:SetVisibility(r0_0.VisibilityOp.Visible)
  end
end
function r1_0.SetPortraitInfo(r0_9, r1_9)
  -- line: [170, 181] id: 9
  local r3_9 = GText(DataMgr.HeadSculpture[r1_9].Name)
  local r4_9 = LoadObject(DataMgr.HeadSculpture[r1_9].HeadPath)
  if r4_9 ~= nil then
    r0_9.Icon_Head:GetDynamicMaterial():SetTextureParameterValue("IconMap", r4_9)
  end
  if not r0_9.IsHeadFrame then
    r0_9.Text_RoleName:SetText(r3_9)
  end
end
function r1_0.SetItemSelect(r0_10, r1_10)
  -- line: [183, 198] id: 10
  local r2_10 = r0_10.List_Item
  if r0_10.IsHeadFrame then
    r2_10 = r0_10.List_Item_Frame
  end
  for r7_10 = 0, r2_10:GetNumItems() + -1, 1 do
    local r8_10 = r2_10:GetItemAt(r7_10)
    if r8_10.PortraitId == r0_10.SelectId then
      r8_10.SelfWidget:PlayAnimation(r8_10.SelfWidget.Select)
    elseif r8_10.PortraitId == r1_10 then
      r8_10.SelfWidget:PlayAnimation(r8_10.SelfWidget.UnSelect)
      r8_10.SelfWidget:PlayAnimation(r8_10.SelfWidget.Normal)
    end
  end
end
function r1_0.TrySetHeadFrame(r0_11, ...)
  -- line: [200, 205] id: 11
  if r0_11.SelectId then
    r0_11:SetHeadFrameInfo(r0_11.SelectId)
    UIUtils.TrySubReddotCacheDetail(r0_11.SelectId, "PortraitFrame")
  end
end
function r1_0.TrySetPortrait(r0_12)
  -- line: [207, 212] id: 12
  if r0_12.SelectId then
    r0_12:SetPortraitInfo(r0_12.SelectId)
    UIUtils.TrySubReddotCacheDetail(r0_12.SelectId, "Portrait")
  end
end
function r1_0.OnListItemClicked(r0_13, r1_13)
  -- line: [214, 237] id: 13
  r0_13.PortraitPath = r1_13.PortraitPath
  r0_13.SelectId = r1_13.PortraitId
  if not r1_13.IsHeadFrame then
    r0_13:TrySetPortrait()
    AudioManager(r0_13):PlayUISound(nil, "event:/ui/common/click_btn_confirm", nil, nil)
  else
    r0_13:TrySetHeadFrame()
    AudioManager(r0_13):PlayUISound(nil, "event:/ui/common/click_level_03", nil, nil)
  end
  local r2_13 = GWorld:GetAvatar()
  if r2_13 then
    if r0_13.SelectId == r2_13.HeadIconId and not r1_13.IsHeadFrame or r0_13.SelectId == r2_13.HeadFrameId and r1_13.IsHeadFrame then
      r0_13.Switcher_Btn:SetActiveWidgetIndex(1)
    else
      r0_13.Switcher_Btn:SetActiveWidgetIndex(0)
    end
  end
  r0_13:RefreshItemClick(r1_13)
  r1_13.SelfWidget:StopAllAnimations()
  r1_13.SelfWidget:PlayAnimation(r1_13.SelfWidget.Click)
  r1_13.SelfWidget.IsSelect = true
end
function r1_0.ConfirmChange(r0_14)
  -- line: [239, 285] id: 14
  local r1_14 = GWorld:GetAvatar()
  local r2_14 = nil
  local r3_14 = nil	-- notice: implicit variable refs by block#[5, 6, 7, 8, 9]
  local r4_14 = nil	-- notice: implicit variable refs by block#[7, 8]
  if r1_14 then
    r3_14 = UIManager(r0_14)
    r3_14 = r3_14:GetUIObj(UIConst.MenuWorld)
    r4_14 = r0_14.IsHeadFrame
    if r4_14 then
      r2_14 = r1_14.HeadFrameId
      r1_14:SetAvatarHeadFrame(r0_14.SelectId, function(r0_15)
        -- line: [253, 260] id: 15
        if r0_15 then
          UIManager(r0_14):ShowUITip("CommonToastMain", GText("UI_Change_Success"))
          r0_14:SetCurPortrait()
          r0_14:SetItemSelect(r2_14)
          r3_14:SetPlayerInfo()
        end
      end)
    else
      r2_14 = r1_14.HeadIconId
      r4_14 = UIManager(r0_14)
      r4_14 = r4_14:GetUIObj(UIConst.MenuWorld)
      r1_14:SetAvatarHeadIcon(r0_14.SelectId, function(r0_16)
        -- line: [264, 271] id: 16
        if r0_16 then
          UIManager(r0_14):ShowUITip("CommonToastMain", GText("UI_Change_Success"))
          r0_14:SetCurPortrait()
          r0_14:SetItemSelect(r2_14)
          r4_14:SetPlayerInfo()
        end
      end)
      -- close: r4_14
    end
    r3_14:SetPlayerInfo()
    -- close: r3_14
  end
  r3_14 = r0_14._FreshCallback
  if r3_14 then
    r3_14 = r0_14.IsHeadFrame
    if r3_14 then
      r3_14 = r0_14._FreshCallback
      r4_14 = true
      r3_14(r4_14, r0_14.SelectId)
    else
      r3_14 = r0_14._FreshCallback
      r4_14 = false
      r3_14(r4_14, r0_14.SelectId)
    end
  end
  r3_14 = r0_14.Switcher_Btn
  r3_14:SetActiveWidgetIndex(1)
end
function r1_0.ClickConfirmChangePortrait(r0_17)
  -- line: [287, 289] id: 17
end
function r1_0.RefreshItemClick(r0_18, r1_18)
  -- line: [291, 304] id: 18
  local r2_18 = r0_18.List_Item
  if r0_18.IsHeadFrame then
    r2_18 = r0_18.List_Item_Frame
  end
  for r7_18 = 0, r2_18:GetNumItems() + -1, 1 do
    local r8_18 = r2_18:GetItemAt(r7_18)
    if r8_18.SelfWidget and r8_18.SelfWidget.IsSelect and r8_18.SelfWidget ~= r1_18.SelfWidget then
      r8_18.SelfWidget:PlayAnimation(r8_18.SelfWidget.Normal)
      r8_18.SelfWidget.IsSelect = false
    end
  end
end
function r1_0.InitPortrait(r0_19)
  -- line: [306, 351] id: 19
  r0_19.List_Item:ClearListItems()
  r0_19.List_Item_Frame:ClearListItems()
  local r1_19 = GWorld:GetAvatar()
  if r1_19 then
    local r2_19 = 0
    local r3_19 = UIUtils.GetCommonItemContentClass()
    local r4_19 = NewObject(r3_19)
    r4_19.Owner = r0_19
    r4_19.PortraitId = -1
    r4_19.IsHeadFrame = true
    r0_19.List_Item_Frame:AddItem(r4_19)
    r2_19 = 1
    for r10_19, r11_19 in ipairs(r1_19.HeadFrameList) do
      r4_19 = NewObject(r3_19)
      r4_19.Owner = r0_19
      r4_19.PortraitPath = DataMgr.HeadFrame[r11_19].SmallIcon
      r4_19.PortraitId = r11_19
      r4_19.IsHeadFrame = true
      r0_19.List_Item_Frame:AddItem(r4_19)
      r2_19 = r2_19 + 1
    end
    -- close: r6_19
    r2_19 = 0
    r3_19 = UIUtils.GetCommonItemContentClass()
    for r11_19, r12_19 in ipairs(r1_19.HeadIconList) do
      local r13_19 = NewObject(r3_19)
      r13_19.Owner = r0_19
      r13_19.PortraitPath = DataMgr.HeadSculpture[r12_19].HeadPath
      r13_19.PortraitId = r12_19
      r13_19.IsHeadFrame = false
      r0_19.List_Item:AddItem(r13_19)
      r2_19 = r2_19 + 1
    end
    -- close: r7_19
    r0_19:FillEmpty(r0_19.List_Item, r2_19)
  end
end
function r1_0.FillEmpty(r0_20, r1_20, r2_20)
  -- line: [353, 378] id: 20
  r0_20:AddTimer(0.01, function()
    -- line: [354, 377] id: 21
    local r0_21, r1_21 = UIUtils.GetTileViewContentMaxCount(r1_20, "XY")
    local r2_21 = nil
    if r2_20 - r0_21 * r1_21 <= 0 then
      r2_21 = r0_21 * r1_21 - r2_20
    else
      r2_21 = r0_21 - r2_20 % r0_21
    end
    for r6_21 = 1, r2_21, 1 do
      local r7_21 = NewObject(UIUtils.GetCommonItemContentClass())
      r7_21.IsEmpty = true
      r1_20:AddItem(r7_21)
    end
    r0_20:AddTimer(0.01, function()
      -- line: [367, 376] id: 22
    end)
  end)
end
function r1_0.CloseSelf(r0_23)
  -- line: [380, 390] id: 23
  local r1_23 = UIManager(r0_23):GetUI(UIConst.MenuWorld)
  if r1_23 ~= nil then
    r1_23.IsEditOpen = false
    r1_23:PlayAnimation(r0_23.Edit_List_Out)
    r1_23:SetFocus()
  end
  local r2_23 = r0_23:GetAnimationByName("Out")
  r0_23:PlayAnimation(r2_23)
  r0_23:BindToAnimationFinished(r2_23, {
    r0_23,
    r0_23.Close
  })
end
function r1_0.RefreshOpInfoByInputDevice(r0_24, r1_24, r2_24)
  -- line: [392, 411] id: 24
  if not (r1_24 == ECommonInputType.MouseAndKeyboard) then
    local r4_24 = r0_24.List_Item
    if r0_24.IsHeadFrame then
      r4_24 = r0_24.List_Item_Frame
    end
    for r9_24 = 0, r4_24:GetNumItems() + -1, 1 do
      local r10_24 = r4_24:GetItemAt(r9_24)
      if r10_24.SelfWidget and r10_24.SelfWidget.IsSelect then
        r10_24.SelfWidget:SetGamePadFocus()
      end
    end
  end
end
function r1_0.Destruct(r0_25)
  -- line: [413, 416] id: 25
  r0_25:UnbindDialogEvent(DialogEvent.OnTitleTabSelected)
  r0_25.Super.Destruct(r0_25)
end
return r1_0
