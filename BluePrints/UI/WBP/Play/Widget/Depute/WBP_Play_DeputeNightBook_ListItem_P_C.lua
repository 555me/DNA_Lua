-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Play\Widget\Depute\WBP_Play_DeputeNightBook_ListItem_P_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("Utils.MonsterUtils")
local r1_0 = Class({
  "BluePrints.UI.BP_UIState_C"
})
local r2_0 = {
  Char = 1,
  Weapon = 2,
  Mod = 3,
  Draft = 4,
  Reward = 5,
  Resource = 6,
  Drop = 7,
}
function r1_0.Construct(r0_1)
  -- line: [24, 56] id: 1
  r1_0.Super.Construct(r0_1)
  r0_1:AddInputMethodChangedListen()
  r0_1.Btn_Goto.Button_Area.OnClicked:Add(r0_1, r0_1.OnClicked)
  r0_1.Btn_DoubleMod.Button_Area.OnClicked:Add(r0_1, r0_1.OnClicked)
  r0_1.List_Reward:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  r0_1.List_Reward:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  r0_1.List_Reward:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  r0_1.List_Reward:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  r0_1.List_Reward.BP_OnEntryInitialized:Add(r0_1, function(r0_2, r1_2, r2_2)
    -- line: [34, 41] id: 2
    if r1_2.Id ~= 0 then
      r2_2:BindEvents(r0_2, {
        OnMenuOpenChanged = r0_2.OnStuffMenuOpenChanged,
      })
    end
  end)
  r0_1.Btn_Goto.bAutoButtonChange = false
  r0_1.Btn_DoubleMod.bAutoButtonChange = false
  r0_1.List_Reward.OnCreateEmptyContent:Bind(r0_1, r0_1.CreateAndAddEmptyItem)
  if CommonUtils.GetDeviceTypeByPlatformName(r0_1) == "Mobile" then
    r0_1.List_Reward.OnMouseMove:Add(r0_1, r0_1.OnListRewardMouseMove)
    r0_1.List_Reward.OnMouseButtonUp:Add(r0_1, r0_1.OnListRewardMouseUp)
    r0_1.ListRewardMouseBeginPos = nil
  end
end
function r1_0.OnListRewardMouseMove(r0_3, r1_3, r2_3)
  -- line: [58, 74] id: 3
  local r3_3 = 0.015
  if not r0_3.ListRewardMouseBeginPos then
    r0_3.ListRewardMouseBeginPos = UE4.UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(r2_3)
  end
  if math.abs(UE4.UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(r2_3).Y - r0_3.ListRewardMouseBeginPos.Y) > 10 then
    local r6_3 = r0_3.Parent.List_NightBookItem
    r6_3:SetScrollOffset(math.clamp(r6_3:GetScrollOffset() + math.clamp(-UE4.UKismetInputLibrary.PointerEvent_GetCursorDelta(r2_3).Y * r3_3, -1, 1) * r6_3.WheelScrollMultiplier, 0, UIUtils.GetMaxScrollOffsetOfListView(r6_3)))
  end
end
function r1_0.OnListRewardMouseUp(r0_4, r1_4, r2_4)
  -- line: [76, 78] id: 4
  r0_4.ListRewardMouseBeginPos = nil
end
function r1_0.OnRemovedFromFocusPath(r0_5, r1_5, r2_5)
  -- line: [80, 83] id: 5
  r0_5.ListRewardMouseBeginPos = nil
  return UIUtils.Unhandled
end
function r1_0.OnListItemObjectSet(r0_6, r1_6)
  -- line: [92, 105] id: 6
  r0_6.Content = r1_6
  r0_6.IsEmpty = r1_6.IsEmpty
  if not r0_6.IsEmpty then
    r0_6.Root = r1_6.Root
    r0_6.Parent = r1_6.Parent
    r0_6.DungeonData = r1_6.DungeonData
    r0_6.MonRewardData = r1_6.MonRewardData
    r0_6.DoubleMod = r1_6.Parent.DoubleMod
    r0_6.ContinuousCombat = r1_6.Parent.ContinuousCombat
  end
  r0_6:InitItemContent()
end
function r1_0.InitItemContent(r0_7)
  -- line: [108, 200] id: 7
  r0_7.List_Reward:SetWheelScrollMultiplier(0)
  r0_7.Mobile = CommonUtils.GetDeviceTypeByPlatformName(r0_7) == "Mobile"
  r0_7.IsEnter = false
  if r0_7.IsEmpty then
    r0_7.WS_Item:SetActiveWidgetIndex(1)
    r0_7.bIsFocusable = false
    r0_7:SetVisibility(ESlateVisibility.HitTestInvisible)
    return 
  end
  r0_7.bIsFocusable = true
  r0_7:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_7.WS_Item:SetActiveWidgetIndex(0)
  r0_7.List_Reward:ClearListItems()
  local r2_7 = UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad
  local r3_7 = r0_7.List_Reward
  local r5_7 = nil	-- notice: implicit variable refs by block#[11]
  if r2_7 then
    r5_7 = ESlateVisibility.HitTestInvisible
    if not r5_7 then
      ::label_56::
      r5_7 = ESlateVisibility.SelfHitTestInvisible
    end
  else
    goto label_56	-- block#10 is visited secondly
  end
  r3_7:SetVisibility(r5_7)
  if r0_7.MonRewardData then
    r3_7 = not PageJumpUtils:CheckDungeonCondition(r0_7.MonRewardData.Condition)
    r0_7.IsUnLocked = r3_7
    local r6_7 = nil	-- notice: implicit variable refs by block#[15]
    if r3_7 then
      r6_7 = r0_7.Locked
      if not r6_7 then
        ::label_75::
        r6_7 = r0_7.Normal
      end
    else
      goto label_75	-- block#14 is visited secondly
    end
    r0_7:PlayAnimation(r6_7)
    r0_7.Btn_Goto:ForbidBtn(r3_7)
    r0_7.Btn_DoubleMod:ForbidBtn(r3_7)
    local r4_7 = DataMgr.Monster[r0_7.MonRewardData.MonsterUnitId]
    r5_7 = {
      WeaknessIcon = r0_7:GetMonsterWeaknessIcon(r0_7.MonRewardData.MonsterUnitId),
    }
    r0_7.DeputeMonsterTab:SetBasicData(r0_7.MonRewardData.MonsterUnitId, r5_7)
    r0_7.DeputeMonsterTab:SetVisibility(ESlateVisibility.HitTestInvisible)
    r0_7.Text_MonsterTitleName:SetText(GText(r4_7.UnitName))
    r0_7.Text_MonsterTitleDesc:SetText(GText("UI_Dungeon_MonsterReward"))
    r0_7.Btn_Goto.Text_Button:SetText(GText("UI_GameEvent_Goto"))
    r0_7.Btn_DoubleMod.Text_Button:SetText(GText("UI_GameEvent_Goto"))
    r6_7 = r0_7.DoubleMod
    if r6_7 then
      r6_7 = false
      local r7_7 = DataMgr.DoubleModDrop and DataMgr.DoubleModDrop[CommonConst.DoubleModDropEventID]
      local r8_7 = r7_7 and r7_7.ModDungeonId
      if r8_7 and r0_7.MonRewardData and r0_7.MonRewardData.DungeonList then
        local r9_7 = r0_7.MonRewardData.DungeonList[1]
        for r14_7, r15_7 in pairs(r8_7) do
          if r9_7 == r15_7 then
            r6_7 = true
            break
          end
        end
        -- close: r10_7
      end
      local r9_7 = DataMgr
      if r9_7 then
        r9_7 = DataMgr.ModDropConstant and DataMgr.ModDropConstant.EventBonus and DataMgr.ModDropConstant.EventBonus.ConstantValue and 0
      else
        goto label_191	-- block#32 is visited secondly
      end
      r0_7.Text_DoubleModSign:SetText("+" .. math.floor(r9_7 / 100) .. "%")
      if r0_7.ContinuousCombat then
        r0_7.Group_DoubleModSign:SetVisibility(ESlateVisibility.Collapsed)
        r0_7.WS_Btn:SetActiveWidgetIndex(1)
        r0_7.VX_EffectBG:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      elseif r6_7 then
        local r11_7 = r0_7.Group_DoubleModSign
        local r13_7 = r0_7.Parent.DropRemaining
        if r13_7 <= 0 then
          r13_7 = UE4.ESlateVisibility.Collapsed and UE4.ESlateVisibility.SelfHitTestInvisible
        else
          goto label_235	-- block#38 is visited secondly
        end
        r11_7:SetVisibility(r13_7)
        r0_7.WS_Btn:SetActiveWidgetIndex(0)
        r0_7.VX_EffectBG:SetVisibility(ESlateVisibility.Collapsed)
      else
        r0_7.WS_Btn:SetActiveWidgetIndex(0)
        r0_7.Group_DoubleModSign:SetVisibility(ESlateVisibility.Collapsed)
        r0_7.VX_EffectBG:SetVisibility(ESlateVisibility.Collapsed)
      end
    else
      r0_7.WS_Btn:SetActiveWidgetIndex(0)
      r0_7.Group_DoubleModSign:SetVisibility(ESlateVisibility.Collapsed)
      r0_7.VX_EffectBG:SetVisibility(ESlateVisibility.Collapsed)
    end
    r0_7:RefreshRewardInfoList(r0_7.MonRewardData.DungeonRewardView)
    if r2_7 then
      r0_7.Btn_Goto:SetPCVisibility(true)
      r0_7.Btn_DoubleMod:SetPCVisibility(true)
    end
  end
end
function r1_0.GetMonsterWeaknessIcon(r0_8, r1_8)
  -- line: [202, 228] id: 8
  local r2_8 = r0_8.MonsterWeaknessIconCache and {}
  r0_8.MonsterWeaknessIconCache = r2_8
  if r2_8[r1_8] then
    return r2_8[r1_8]
  end
  for r8_8, r9_8 in ipairs(r0_0.GetRealMonsterBuffs(r0_8.MonRewardData.DungeonList[1], r1_8)) do
    local r10_8 = DataMgr.Buff[r9_8]
    if r10_8 and r10_8.WeaknessType then
      local r11_8 = DataMgr.DamageType[r10_8.WeaknessType] and DataMgr.DamageType[r10_8.WeaknessType].WeaknessIcon
      if r11_8 then
        r2_8[r1_8] = r2_8[r1_8] and {}
        r2_8[r1_8][r11_8] = true
      end
    end
  end
  -- close: r4_8
  return r2_8[r1_8]
end
function r1_0.RefreshOpInfoByInputDevice(r0_9, r1_9, r2_9)
  -- line: [230, 255] id: 9
  if r1_9 == ECommonInputType.Touch then
    return 
  end
  if r1_9 == ECommonInputType.MouseAndKeyboard then
    r0_9.Btn_Goto:SetPCVisibility(true)
    r0_9.Btn_DoubleMod:SetPCVisibility(true)
    if r0_9.Com_Reward then
      r0_9.Com_Reward:SetVisibility(ESlateVisibility.Collapsed)
    end
    r0_9.List_Reward:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    if r0_9.IsEnter then
      r0_9:PlayAnimation(r0_9.Unhover)
    end
  else
    r0_9.List_Reward:SetVisibility(ESlateVisibility.HitTestInvisible)
  end
  r0_9.Super.RefreshOpInfoByInputDevice(r0_9, r1_9, r2_9)
end
function r1_0.OnClicked(r0_10)
  -- line: [257, 296] id: 10
  if r0_10.IsUnLocked or r0_10:IsAnimationPlaying(r0_10.In) then
    PageJumpUtils:CheckDungeonCondition(r0_10.MonRewardData.Condition, true)
    return 
  end
  local r1_10 = UIManager(r0_10):GetUIObj("StyleOfPlay")
  r1_10.IsOpenSelectLevel = false
  local r2_10 = r1_10:OpenSubUI("DungeonSelect")
  local r3_10 = r0_10.MonRewardData.DungeonList
  r2_10:SetNightFlightManualRewardView(r0_10.MonRewardData.DungeonRewardView)
  r2_10:InitLevelList(r3_10, nil, Const.DeputeType.NightFlightManualDepute, nil)
  r1_10:InitOtherPageTab({
    DynamicNode = {
      "Back",
      "ResourceBar",
      "BottomKey"
    },
    BottomKeyInfo = {
      {
        GamePadInfoList = {
          {
            Type = "Add",
          }
        },
        Desc = GText("UI_CTL_DeputeInfo"),
        bLongPress = false,
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = r2_10.OnReturnKeyDown,
            Owner = r2_10,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = r2_10,
          }
        },
        Desc = GText("UI_BACK"),
      }
    },
    OwnerPanel = r2_10,
    BackCallback = r2_10.OnReturnKeyDown,
    StyleName = "Text",
    TitleName = GText("UI_Dungeon_Tab_ModDungeon"),
  }, nil, true)
end
function r1_0.OnMouseButtonDown(r0_11, r1_11, r2_11)
  -- line: [298, 304] id: 11
  if r0_11.IsEmpty then
    return 
  end
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    r0_11:OnClicked()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end
function r1_0.OnMouseEnter(r0_12, r1_12, r2_12)
  -- line: [306, 317] id: 12
  r0_12.IsEnter = true
  if r0_12.IsUnLocked or r0_12.Mobile or r0_12.IsEmpty or r0_12:IsAnimationPlaying(r0_12.In) or UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return 
  end
  r0_12:StopAllAnimations()
  r0_12:PlayAnimation(r0_12.Hover)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad and not r0_12.IsEmpty then
    r0_12.Btn_Goto:SetPCVisibility(false)
    r0_12.Btn_DoubleMod:SetPCVisibility(false)
  end
end
function r1_0.OnMouseLeave(r0_13, r1_13, r2_13)
  -- line: [319, 331] id: 13
  r0_13.IsEnter = false
  if r0_13.IsUnLocked or r0_13.Mobile or r0_13.IsEmpty or r0_13:IsAnimationPlaying(r0_13.In) or UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return 
  end
  r0_13:StopAllAnimations()
  r0_13:PlayAnimation(r0_13.Unhover)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad and not r0_13.IsEmpty then
    r0_13.Com_Reward:SetVisibility(ESlateVisibility.Collapsed)
    r0_13.Btn_Goto:SetPCVisibility(true)
    r0_13.Btn_DoubleMod:SetPCVisibility(true)
  end
end
function r1_0.RefreshRewardInfoList(r0_14, r1_14)
  -- line: [335, 400] id: 14
  if not r1_14 then
    DebugPrint("SL DungeonReward is nil")
    return 
  end
  local r2_14 = RewardUtils:GetRewardViewInfoById(r1_14)
  local r3_14 = GWorld:GetAvatar()
  if not r3_14 then
    return 
  end
  r0_14.List_Reward:ClearListItems()
  for r8_14, r9_14 in pairs(r2_14) do
    local r10_14 = NewObject(UIUtils.GetCommonItemContentClass())
    r10_14.Id = r9_14.Id
    r10_14.Icon = ItemUtils.GetItemIconPath(r9_14.Id, r9_14.Type)
    r10_14.ParentWidget = r0_14
    r10_14.ItemType = r9_14.Type
    r10_14.Rarity = r9_14.Rarity and 1
    r10_14.IsShowDetails = true
    r10_14.UIName = "StyleOfPlay"
    r10_14.bAsyncLoadIcon = true
    r10_14.HandleMouseDown = false
    if r9_14.DropType then
      r10_14.bRare = DataMgr.DropProbType[r9_14.DropType].IsRareItem
    end
    if r9_14.Quantity then
      r10_14.Count = r9_14.Quantity[1]
      r10_14.MaxCount = r9_14.Quantity[2] and nil
    end
    r10_14.bShadow = false
    if r10_14.ItemType == "Mod" then
      r10_14.bShadow = ModController:GetModel():GetModCountById(r10_14.Id) <= 0
    elseif r10_14.ItemType == "Walnut" then
      r10_14.bShadow = (r3_14.Walnuts.WalnutBag[r10_14.Id] and 0) <= 0
    end
    r0_14.List_Reward:AddItem(r10_14)
  end
  -- close: r4_14
  r0_14.List_Reward:RequestFillEmptyContent()
end
function r1_0.CreateAndAddEmptyItem(r0_15)
  -- line: [402, 407] id: 15
  local r1_15 = NewObject(UIUtils.GetCommonItemContentClass())
  r1_15.Id = 0
  return r1_15
end
function r1_0.OnStuffMenuOpenChanged(r0_16, r1_16)
  -- line: [409, 422] id: 16
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return 
  end
  if r1_16 then
    r0_16:UpdatKeyDisplay("")
    r0_16.Btn_Goto:SetPCVisibility(true)
    r0_16.Btn_DoubleMod:SetPCVisibility(true)
  else
    r0_16.Btn_Goto:SetPCVisibility(true)
    r0_16.Btn_DoubleMod:SetPCVisibility(true)
    r0_16:UpdatKeyDisplay("RewardWidget")
  end
end
function r1_0.OnKeyDown(r0_17, r1_17, r2_17)
  -- line: [426, 438] id: 17
  local r3_17 = UE4.UKismetInputLibrary.GetKey(r2_17)
  local r4_17 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_17)
  local r5_17 = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_17) then
    r5_17 = r0_17:OnGamePadDown(r4_17)
  end
  if r5_17 then
    return UWidgetBlueprintLibrary.Handled()
  else
    return UWidgetBlueprintLibrary.UnHandled()
  end
end
function r1_0.OnGamePadDown(r0_18, r1_18)
  -- line: [440, 484] id: 18
  local r2_18 = false
  if r1_18 == "Gamepad_LeftThumbstick" then
    if not r0_18.List_Reward:GetDisplayedEntryWidgets()[1]:HasAnyUserFocus() then
      r0_18.List_Reward:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      r0_18.List_Reward:NavigateToIndex(0)
      r0_18.Parent.bFocusList_Reward = true
      r0_18:UpdatKeyDisplay("RewardWidget")
      if not r0_18.IsEmpty then
        r0_18.Btn_Goto:SetPCVisibility(true)
        r0_18.Btn_DoubleMod:SetPCVisibility(true)
      end
      r2_18 = true
    else
      r0_18:SetFocus()
      r0_18.Parent.bFocusList_Reward = false
      r0_18:UpdatKeyDisplay("SelfWidget")
      r0_18.List_Reward:SetVisibility(ESlateVisibility.HitTestInvisible)
      r2_18 = true
    end
  elseif r1_18 == "Gamepad_FaceButton_Right" then
    local r3_18 = r0_18.List_Reward:GetDisplayedEntryWidgets()
    for r7_18 = 1, r3_18:Length(), 1 do
      if r3_18[r7_18]:HasFocusedDescendants() or r3_18[r7_18]:HasAnyUserFocus() then
        r0_18:SetFocus()
        r0_18.Parent.bFocusList_Reward = false
        r0_18:UpdatKeyDisplay("SelfWidget")
        r0_18.List_Reward:SetVisibility(ESlateVisibility.HitTestInvisible)
        r2_18 = true
      end
    end
  else
    local r3_18 = r0_18.List_Reward:GetDisplayedEntryWidgets()
    for r7_18 = 1, r3_18:Length(), 1 do
      if r3_18[r7_18]:HasFocusedDescendants() or r3_18[r7_18]:HasAnyUserFocus() then
        r2_18 = true
        break
      end
    end
  end
  return r2_18
end
function r1_0.OnFocusReceived(r0_19, r1_19, r2_19)
  -- line: [487, 496] id: 19
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    r0_19:UpdatKeyDisplay("FocusSelfWidget")
    if not r0_19.IsEmpty then
      r0_19.Btn_Goto:SetPCVisibility(false)
      r0_19.Btn_DoubleMod:SetPCVisibility(false)
    end
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end
function r1_0.UpdatKeyDisplay(r0_20, r1_20)
  -- line: [499, 584] id: 20
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return 
  end
  r0_20.Parent:UpdatKeyDisplay()
  local r2_20 = UIManager(r0_20):GetUIObj("StyleOfPlay")
  if not r2_20 then
    return 
  end
  if r1_20 == "RewardWidget" then
    local r3_20 = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = r0_20,
          }
        },
        Desc = GText("UI_Controller_CheckDetails"),
        bLongPress = false,
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = r0_20.Root.CloseSelf,
            Owner = r0_20,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = r0_20,
          }
        },
        Desc = GText("UI_BACK"),
      }
    }
    r0_20.Com_Reward:SetVisibility(ESlateVisibility.Collapsed)
    r2_20.ComTab.Left_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r2_20.ComTab.Right_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r2_20.ComTab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r2_20.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    if r0_20.Root then
      r0_20.Root.DeputeTab:UpdateUIStyleInPlatform(false)
    end
    r2_20:UpdateOtherPageTab(r3_20)
  elseif r1_20 == "SelfWidget" or r1_20 == "FocusSelfWidget" then
    local r3_20 = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = r0_20.Root.CloseSelf,
            Owner = r0_20,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = r0_20,
          }
        },
        Desc = GText("UI_BACK"),
      }
    }
    r0_20.Com_Reward:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_20.Com_Reward:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "LS",
        }
      },
    })
    r2_20.ComTab.Left_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r2_20.ComTab.Right_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r2_20.ComTab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r2_20.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    if r0_20.Root and r0_20.Root.DeputeTab then
      r0_20.Root.DeputeTab:UpdateUIStyleInPlatform(true, r1_20 ~= "SelfWidget")
    end
    r2_20:UpdateOtherPageTab(r3_20)
  else
    local r3_20 = {}
    r2_20.ComTab.Left_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r2_20.ComTab.Right_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r2_20.ComTab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r2_20.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    if r0_20.Root then
      r0_20.Root.DeputeTab:UpdateUIStyleInPlatform(false)
    end
    r2_20:UpdateOtherPageTab(r3_20)
  end
end
function r1_0.OnAnimationFinished(r0_21, r1_21)
  -- line: [586, 596] id: 21
  if r1_21 == r0_21.In and r0_21.IsEnter then
    if r0_21.IsUnLocked or r0_21.Mobile or r0_21.IsEmpty or UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
      return 
    end
    r0_21:StopAllAnimations()
    r0_21:PlayAnimation(r0_21.Hover)
  end
end
return r1_0
