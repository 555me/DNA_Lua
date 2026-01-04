-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Play\Widget\Depute\WBP_Play_NewDeputeltem_P_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.BP_UIState_C"
})
local r1_0 = {
  Char = 1,
  Weapon = 2,
  Mod = 3,
  Draft = 4,
  Reward = 5,
  Resource = 6,
}
function r0_0.Construct(r0_1)
  -- line: [24, 49] id: 1
  r0_0.Super.Construct(r0_1)
  r0_1:AddInputMethodChangedListen()
  r0_1.IsPC = CommonUtils.GetDeviceTypeByPlatformName(r0_1) == "PC"
  r0_1.Panel_DeputeLevelItem:SetRenderOpacity(0)
  r0_1.Btn_Click.OnClicked:Add(r0_1, r0_1.OnClicked)
  r0_1.Btn_Click.OnPressed:Add(r0_1, r0_1.OnPressed)
  r0_1.Btn_Click.OnReleased:Add(r0_1, r0_1.OnReleased)
  r0_1:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  r0_1:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  r0_1.Item1:SetNavigationRuleExplicit(EUINavigation.Right, r0_1.Item2)
  r0_1.Item2:SetNavigationRuleExplicit(EUINavigation.Right, r0_1.Item3)
  r0_1.Item3:SetNavigationRuleExplicit(EUINavigation.Right, r0_1.Item1)
  r0_1.Item1:SetNavigationRuleExplicit(EUINavigation.Left, r0_1.Item3)
  r0_1.Item2:SetNavigationRuleExplicit(EUINavigation.Left, r0_1.Item1)
  r0_1.Item3:SetNavigationRuleExplicit(EUINavigation.Left, r0_1.Item2)
  r0_1:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
end
function r0_0.RefreshOpInfoByInputDevice(r0_2, r1_2, r2_2)
  -- line: [51, 79] id: 2
  if r1_2 == ECommonInputType.Touch then
    return 
  end
  local r3_2 = r1_2 == ECommonInputType.MouseAndKeyboard
  r0_2.Parent.DeputeTab:UpdateUIStyleInPlatform(not r3_2)
  local r4_2 = UIManager(r0_2):GetUIObj("StyleOfPlay")
  if r4_2 and r4_2.ComTab and r4_2.ComTab.Group_Chat and r4_2.ComTab.Group_Chat:GetChildAt(0) then
    r4_2.ComTab.Group_Chat:GetChildAt(0).bOpen = true
    r4_2.ComTab.Group_Chat:GetChildAt(0):HideWSKey(true)
  end
  if r3_2 then
    if r0_2.Com_Show then
      r0_2.Com_Show:SetVisibility(ESlateVisibility.Collapsed)
    end
    if not r0_2.IsUnLocked then
      r0_2:StopAnimation(r0_2.Hover)
      r0_2:PlayAnimation(r0_2.Unhover)
      r0_2.bIsHovered = false
    end
  end
  r0_2.Super.RefreshOpInfoByInputDevice(r0_2, r1_2, r2_2)
end
function r0_0.OnListItemObjectSet(r0_3, r1_3)
  -- line: [86, 91] id: 3
  r0_3.Content = r1_3
  r0_3.ChapterId = r1_3.ChapterId
  r0_3.Parent = r1_3.Parent
  r0_3:InitItemContent()
end
function r0_0.InitItemContent(r0_4)
  -- line: [93, 123] id: 4
  local r1_4 = DataMgr.SelectDungeon[r0_4.ChapterId]
  if not r1_4 then
    DebugPrint("SL_找不到关卡数据:", r0_4.ChapterId)
    return 
  end
  r0_4.bIsHovered = false
  local r2_4 = LoadObject(r1_4.Path)
  local r3_4 = r0_4.Image_Item:GetDynamicMaterial()
  if r3_4 then
    r3_4:SetTextureParameterValue("IconMap", r2_4)
  end
  r0_4.Text_PlayName:SetText(GText(r1_4.ChapterName))
  r0_4.Text_RewardItem:SetText(GText(r1_4.ChapterSubName))
  r0_4:PlayAnimation(r0_4.In)
  if PageJumpUtils:CheckDungeonCondition(r1_4.Condition) then
    r0_4.IsUnLocked = false
    r0_4:PlayAnimation(r0_4.Normal)
    r0_4.Group_Lock:SetVisibility(ESlateVisibility.Collapsed)
  else
    r0_4.IsUnLocked = true
    r0_4:PlayAnimation(r0_4.Lock)
    r0_4.Group_Lock:SetVisibility(ESlateVisibility.Visible)
  end
  r0_4:RefreshRewardInfoList(r1_4.RewardViewId)
end
function r0_0.RefreshRewardInfoList(r0_5, r1_5)
  -- line: [127, 216] id: 5
  if not r1_5 then
    DebugPrint("SL DungeonReward is nil")
    return 
  end
  local r2_5 = RewardUtils:GetRewardViewInfoById(r1_5)
  table.sort(r2_5, function(r0_6, r1_6)
    -- line: [133, 144] id: 6
    if r0_6.Rarity == r1_6.Rarity then
      if r1_0[r0_6.Type] and r1_0[r1_6.Type] then
        if r1_0[r0_6.Type] == r1_0[r1_6.Type] then
          return r0_6.Id < r1_6.Id
        end
        return r1_0[r0_6.Type] < r1_0[r1_6.Type]
      end
      return r0_6.Id < r1_6.Id
    end
    return r1_6.Rarity < r0_6.Rarity
  end)
  local r3_5 = 3
  local r4_5 = {}
  for r9_5, r10_5 in pairs(r2_5) do
    if r3_5 > #r4_5 then
      table.insert(r4_5, r10_5)
    else
      break
    end
  end
  -- close: r5_5
  for r8_5 = 1, r3_5, 1 do
    local r9_5 = r0_5["Item" .. r8_5]
    if r9_5 then
      local r10_5 = r4_5[r8_5]
      local r11_5 = NewObject(UIUtils.GetCommonItemContentClass())
      if r10_5 then
        r11_5.Id = r10_5.Id
        r11_5.Icon = ItemUtils.GetItemIconPath(r10_5.Id, r10_5.Type)
        r11_5.ParentWidget = r0_5
        r11_5.ItemType = r10_5.Type
        r11_5.Rarity = r10_5.Rarity and 1
        r11_5.IsShowDetails = true
        r11_5.UIName = "StyleOfPlay"
        r11_5.HandleMouseDown = true
        r11_5.bAsyncLoadIcon = true
        if r10_5.Quantity then
          if #r10_5.Quantity > 1 then
            r11_5.Count = r10_5.Quantity[1]
            r11_5.MaxCount = r10_5.Quantity[2]
          else
            r11_5.Count = r10_5.Quantity[1]
          end
        end
        if not r9_5.__OnMenuOpenChanged__ then
          function r9_5.__OnMenuOpenChanged__(r0_7, r1_7)
            -- line: [185, 187] id: 7
            r0_5:OnStuffMenuOpenChanged(r1_7)
          end
          r9_5:BindEvents(r0_5, {
            OnMenuOpenChanged = r9_5.__OnMenuOpenChanged__,
          })
        end
        r9_5.bIsFocusable = true
        if r9_5.SetVisibility then
          r9_5:SetVisibility(ESlateVisibility.Visible)
        end
      else
        r9_5.bIsFocusable = false
        if r9_5.SetVisibility then
          r9_5:SetVisibility(ESlateVisibility.HitTestInvisible)
        end
        local r12_5 = r0_5["Item" .. r8_5 + -1]
        if r12_5 and r12_5.SetNavigationRuleBase then
          r12_5:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
          r12_5:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
          r12_5:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
          r12_5:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
        end
      end
      r9_5:Init(r11_5)
    end
  end
end
function r0_0.OnStuffMenuOpenChanged(r0_8, r1_8)
  -- line: [218, 227] id: 8
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return 
  end
  if r1_8 then
    r0_8:UpdatKeyDisplay("")
  else
    r0_8:UpdatKeyDisplay("RewardWidget")
  end
end
function r0_0.OnClicked(r0_9)
  -- line: [229, 250] id: 9
  if r0_9:IsAnimationPlaying(r0_9.In) then
    return 
  end
  if not GWorld:GetAvatar() then
    return false
  end
  local r2_9 = DataMgr.SelectDungeon[r0_9.ChapterId]
  if r2_9 and PageJumpUtils:CheckDungeonCondition(r2_9.Condition, true) then
    if not r0_9.Parent.Root:IsAnimationPlaying(r0_9.Parent.Root.Out) and not r0_9:IsAnimationPlaying(r0_9.Click) then
      UIManager(r0_9):GetUIObj("StyleOfPlay").IsOpenSelectLevel = true
      r0_9.Clicked = true
      AudioManager(r0_9):PlayUISound(r0_9, "event:/ui/common/click_btn_large", nil, nil)
      r0_9:StopAllAnimations()
      r0_9:PlayAnimation(r0_9.Click)
    end
  else
    AudioManager(r0_9):PlayUISound(r0_9, "event:/ui/common/click_select_lock", nil, nil)
  end
end
function r0_0.OnPressed(r0_10)
  -- line: [252, 258] id: 10
  if r0_10.IsUnLocked or r0_10:IsAnimationPlaying(r0_10.In) then
    return 
  end
  r0_10:StopAllAnimations()
  r0_10:PlayAnimation(r0_10.Press)
end
function r0_0.OnReleased(r0_11)
  -- line: [260, 265] id: 11
  if r0_11.IsUnLocked or r0_11:IsAnimationPlaying(r0_11.In) then
    return 
  end
  r0_11:PlayAnimation(r0_11.Normal)
end
function r0_0.OnMouseEnter(r0_12, r1_12, r2_12)
  -- line: [279, 302] id: 12
  if r0_12.IsUnLocked or not r0_12.IsPC then
    return 
  end
  if r0_12.bIsHovered then
    return 
  end
  r0_12.bIsHovered = true
  AudioManager(r0_12):PlayUISound(r0_12, "event:/ui/common/hover_btn_large", nil, nil)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    r0_12:UpdatKeyDisplay("FocusSelfWidget")
    if r0_12.IsUnLocked or r0_12:IsAnimationPlaying(r0_12.In) or not r0_12.IsPC then
      return UE4.UWidgetBlueprintLibrary.Unhandled()
    end
    r0_12:StopAllAnimations()
    r0_12:PlayAnimation(r0_12.Hover)
  else
    r0_12:StopAnimation(r0_12.Unhover)
    r0_12:PlayAnimation(r0_12.Hover)
  end
end
function r0_0.OnMouseLeave(r0_13, r1_13, r2_13)
  -- line: [304, 318] id: 13
  if r0_13.IsUnLocked or not r0_13.IsPC then
    r0_13.bIsHovered = false
    return 
  end
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    if r0_13:HasFocusedDescendants() or r0_13:HasAnyUserFocus() then
      return 
    end
    r0_13.Com_Show:SetVisibility(ESlateVisibility.Collapsed)
  end
  r0_13.bIsHovered = false
  r0_13:StopAnimation(r0_13.Hover)
  r0_13:PlayAnimation(r0_13.Unhover)
end
function r0_0.OnAnimationFinished(r0_14, r1_14)
  -- line: [320, 362] id: 14
  if r1_14 == r0_14.Click then
    local r2_14 = UIManager(r0_14):GetUIObj("StyleOfPlay")
    r2_14.IsOpenSelectLevel = false
    local r3_14 = r2_14:OpenSubUI("DungeonSelect")
    r3_14:InitLevelList(DataMgr.SelectDungeon[r0_14.ChapterId].DungeonList)
    r2_14:InitOtherPageTab({
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
              ClickCallback = r3_14.OnReturnKeyDown,
              Owner = r3_14,
            }
          },
          GamePadInfoList = {
            {
              Type = "Img",
              ImgShortPath = "B",
              Owner = r3_14,
            }
          },
          Desc = GText("UI_BACK"),
        }
      },
      OwnerPanel = r3_14,
      BackCallback = r3_14.OnReturnKeyDown,
      StyleName = "Text",
      TitleName = GText("UI_Dungeon_TabName"),
    }, nil, true)
    if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
      return 
    end
    r3_14:UpdatKeyDisplay("SelfWidget")
  elseif r1_14 == r0_14.In and r0_14.bIsHovered and not r0_14.IsUnLocked then
    r0_14:StopAllAnimations()
    r0_14:PlayAnimation(r0_14.Hover)
  end
end
function r0_0.OnKeyDown(r0_15, r1_15, r2_15)
  -- line: [364, 376] id: 15
  local r3_15 = UE4.UKismetInputLibrary.GetKey(r2_15)
  local r4_15 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_15)
  local r5_15 = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_15) then
    r5_15 = r0_15:OnGamePadDown(r4_15)
  end
  if r5_15 then
    return UWidgetBlueprintLibrary.Handled()
  else
    return UWidgetBlueprintLibrary.UnHandled()
  end
end
function r0_0.OnGamePadDown(r0_16, r1_16)
  -- line: [378, 415] id: 16
  DebugPrint("SL OnGamePadDown is InKeyName", r1_16)
  local r2_16 = false
  if r1_16 == "Gamepad_LeftThumbstick" then
    if not r0_16.Item1:HasAnyUserFocus() or r0_16.Item1:HasFocusedDescendants() then
      r0_16.Item1:SetFocus()
      r2_16 = true
      r0_16:UpdatKeyDisplay("RewardWidget")
    else
      for r6_16 = 1, 3, 1 do
        if r0_16["Item" .. r6_16]:HasFocusedDescendants() or r0_16["Item" .. r6_16]:HasAnyUserFocus() then
          r0_16:SetFocus()
          r0_16:UpdatKeyDisplay("SelfWidget")
          r2_16 = false
        end
      end
    end
  elseif r1_16 == "Gamepad_FaceButton_Right" then
    for r6_16 = 1, 3, 1 do
      if r0_16["Item" .. r6_16]:HasFocusedDescendants() or r0_16["Item" .. r6_16]:HasAnyUserFocus() then
        r0_16:SetFocus()
        r0_16:UpdatKeyDisplay("SelfWidget")
        r2_16 = true
      end
    end
  else
    for r6_16 = 1, 3, 1 do
      if r0_16["Item" .. r6_16]:HasFocusedDescendants() or r0_16["Item" .. r6_16]:HasAnyUserFocus() then
        r2_16 = true
        break
      end
    end
  end
  return r2_16
end
function r0_0.UpdatKeyDisplay(r0_17, r1_17)
  -- line: [419, 526] id: 17
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return 
  end
  local r2_17 = UIManager(r0_17):GetUIObj("StyleOfPlay")
  if not r2_17 then
    return 
  end
  r0_17.FocusTypeName = r1_17
  if r1_17 == "RewardWidget" then
    local r3_17 = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = r0_17,
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
            ClickCallback = r0_17.Parent.CloseSelf,
            Owner = r0_17,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = r0_17,
          }
        },
        Desc = GText("UI_BACK"),
      }
    }
    r0_17.Com_Show:SetVisibility(ESlateVisibility.Collapsed)
    r2_17.ComTab.Left_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r2_17.ComTab.Right_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r2_17.ComTab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r2_17.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_17.Parent.DeputeTab:UpdateUIStyleInPlatform(false)
    if r2_17.ComTab and r2_17.ComTab.Group_Chat and r2_17.ComTab.Group_Chat:GetChildAt(0) then
      r2_17.ComTab.Group_Chat:GetChildAt(0).bOpen = false
      r2_17.ComTab.Group_Chat:GetChildAt(0):HideWSKey(false)
    end
    r2_17.TeamHeadUI.Key_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r2_17:UpdateOtherPageTab(r3_17)
  elseif r1_17 == "SelfWidget" or r1_17 == "FocusSelfWidget" then
    local r3_17 = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = r0_17,
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
            ClickCallback = r0_17.Parent.CloseSelf,
            Owner = r0_17,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = r0_17,
          }
        },
        Desc = GText("UI_BACK"),
      }
    }
    r0_17.Com_Show:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_17.Com_Show:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "LS",
        }
      },
    })
    r2_17.ComTab.Left_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r2_17.ComTab.Right_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r2_17.ComTab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r2_17.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    if r2_17.ComTab and r2_17.ComTab.Group_Chat and r2_17.ComTab.Group_Chat:GetChildAt(0) then
      r2_17.ComTab.Group_Chat:GetChildAt(0).bOpen = true
      r2_17.ComTab.Group_Chat:GetChildAt(0):HideWSKey(true)
    end
    r2_17.TeamHeadUI.Key_GamePad:SetVisibility(UE4.ESlateVisibility.Visible)
    if r0_17.Parent and r0_17.Parent.DeputeTab then
      r0_17.Parent.DeputeTab:UpdateUIStyleInPlatform(true, r1_17 ~= "SelfWidget")
    end
    r2_17:UpdateOtherPageTab(r3_17)
  else
    local r3_17 = {}
    r2_17.ComTab.Left_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r2_17.ComTab.Right_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r2_17.ComTab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r2_17.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    if r2_17.ComTab and r2_17.ComTab.Group_Chat and r2_17.ComTab.Group_Chat:GetChildAt(0) then
      r2_17.ComTab.Group_Chat:GetChildAt(0).bOpen = false
      r2_17.ComTab.Group_Chat:GetChildAt(0):HideWSKey(false)
    end
    r2_17.TeamHeadUI.Key_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_17.Com_Show:SetVisibility(ESlateVisibility.Collapsed)
    r0_17.Parent.DeputeTab:UpdateUIStyleInPlatform(false)
    r2_17:UpdateOtherPageTab(r3_17)
  end
end
return r0_0
