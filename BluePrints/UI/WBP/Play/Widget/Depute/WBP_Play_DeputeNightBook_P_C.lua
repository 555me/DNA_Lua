-- filename: @E:/Pack/Branch/OBT10_Geili\Content/Script/BluePrints\UI\WBP\Play\Widget\Depute\WBP_Play_DeputeNightBook_P_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("EMCache.EMCache")
local r1_0 = Class({
  "BluePrints.UI.BP_UIState_C"
})
r1_0._components = {
  "BluePrints.UI.WBP.Play.Widget.Depute.DoubleModDropView"
}
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
  -- line: [28, 78] id: 1
  r1_0.Super.Construct(r0_1)
  r0_1.IsPC = CommonUtils.GetDeviceTypeByPlatformName(r0_1) == "PC"
  r0_1.IsMobile = CommonUtils.GetDeviceTypeByPlatformName(r0_1) == "Mobile"
  r0_1.bFocusList_Reward = false
  r0_1.bFocusDownList_Reward = false
  r0_1.List_NightBookItem:ClearListItems()
  r0_1.Btn_More.Btn_Click.OnClicked:Add(r0_1, r0_1.OpenRewardDetails)
  r0_1:AddDispatcher(EventID.NightBookSpecialRightUp, r0_1, r0_1.OnNightBookSpecialRightUp)
  r0_1:AddDispatcher(EventID.DoubleModSwitchTab, r0_1, r0_1.OnDoubleModSwitchTab)
  r0_1:AddDispatcher(EventID.OnActivityTimeOpen, r0_1, r0_1.OnActivityTimeOpen)
  r0_1:AddDispatcher(EventID.OnActivityTimeOpenClose, r0_1, r0_1.OnActivityTimeOpenClose)
  r0_1:AddInputMethodChangedListen()
  function r0_1.Btn_Qa.SoundFunc()
    -- line: [42, 44] id: 2
    AudioManager(r0_1):PlayUISound(r0_1, "event:/ui/common/click_btn_small", nil, nil)
  end
  r0_1.SelectCellIndex = 0
  r0_1.DoubleMod = r0_1:IsDoubleMod()
  r0_1.Btn_Qa:BindEventOnClicked(r0_1, r0_1.OnTips)
  if r0_1.IsMobile then
    return 
  end
  r0_1.Controller_KeyImgTop:SetVisibility(ESlateVisibility.Collapsed)
  r0_1.Controller_KeyImgBottom:SetVisibility(ESlateVisibility.Collapsed)
  r0_1:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  r0_1:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  r0_1.List_Reward:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  r0_1.List_Reward:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  r0_1.List_Reward:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  r0_1.List_Reward:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  r0_1.List_NightBookItem:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  r0_1.List_NightBookItem:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  r0_1.List_NigheBookTab:SetNavigationRuleCustom(EUINavigation.Right, {
    r0_1,
    function()
      -- line: [72, 77] id: 3
      r0_1.List_NightBookItem:GetDisplayedEntryWidgets()[1].List_Reward:SetVisibility(ESlateVisibility.HitTestInvisible)
      r0_1.List_NightBookItem:NavigateToIndex(0)
      return r0_1.List_NightBookItem
    end
  })
end
function r1_0.Destruct(r0_4)
  -- line: [83, 86] id: 4
  r1_0.Super.Destruct(r0_4)
  r0_4:PlayAnimation(r0_4.Out)
end
function r1_0.NightBookFocusReceived(r0_5, r1_5)
  -- line: [88, 90] id: 5
end
function r1_0.InitContent(r0_6, r1_6)
  -- line: [91, 97] id: 6
  r0_6.ContinuousCombat = r0_0:Get("Is_DoubleMod_SwitchTab", true) and false
  r0_6.Root = r1_6
  r0_6.Text_More:SetText(GText("UI_GACHA_DETAIL"))
  r0_6.Text_MonsterTitleName:SetText(GText("UI_Dungeon_Title_RewardList"))
  r0_6:RefreshData()
end
function r1_0.RefreshData(r0_7)
  -- line: [99, 205] id: 7
  local r1_7 = r0_7.HB_ActivityTab
  local r3_7 = r0_7.DoubleMod
  if r3_7 then
    r3_7 = UE4.ESlateVisibility.SelfHitTestInvisible and UE4.ESlateVisibility.Collapsed
  else
    goto label_10	-- block#2 is visited secondly
  end
  r1_7:SetVisibility(r3_7)
  r0_7.List_NigheBookTab:ClearListItems()
  r0_7.SelectCellContent = nil
  r0_7:StopAllAnimations()
  r0_7:PlayAnimation(r0_7.In)
  local r2_7 = nil	-- notice: implicit variable refs by block#[7]
  local r6_7 = nil	-- notice: implicit variable refs by block#[28]
  local r9_7 = nil	-- notice: implicit variable refs by block#[31]
  if r0_7.DoubleMod then
    r0_7.DoubleModDropInfo = r0_7:GetDoubleModDropData()
    r1_7 = r0_7.ContinuousCombat
    if r1_7 then
      r2_7 = "UI_Event_ModDrop_ChallengeRemain"
      if not r2_7 then
        ::label_35::
        r2_7 = "UI_Event_ModDrop_DropRemain"
      end
    else
      goto label_35	-- block#6 is visited secondly
    end
    r0_7.Text_TimeTipsTitle:SetText(GText(r2_7))
    r3_7 = 0
    if r1_7 then
      if DataMgr and DataMgr.ModDropConstant and DataMgr.ModDropConstant.DailyFreeTicketAmount then
        r3_7 = DataMgr.ModDropConstant.DailyFreeTicketAmount.ConstantValue and 0
      else
        goto label_63	-- block#12 is visited secondly
      end
    elseif DataMgr and DataMgr.ModDropConstant and DataMgr.ModDropConstant.DailyModDungeonAmount then
      r3_7 = DataMgr.ModDropConstant.DailyModDungeonAmount.ConstantValue and 0
    else
      goto label_83	-- block#17 is visited secondly
    end
    local r4_7 = tonumber(r3_7)
    r3_7 = r4_7 and 0
    if r1_7 then
      r4_7 = r0_7.DoubleModDropInfo.EliteRushTimes and r0_7.DoubleModDropInfo.DropTimes
    else
      goto label_96	-- block#22 is visited secondly
    end
    local r5_7 = math.floor(r3_7 - (tonumber(r4_7) and 0))
    if r5_7 <= 0 then
      r6_7 = "<Warning>0</>" .. "/" .. r3_7
      if not r6_7 then
        ::label_117::
        r6_7 = r5_7 .. "/" .. r3_7
      end
    else
      goto label_117	-- block#27 is visited secondly
    end
    r0_7.Text_Times:SetText(r6_7)
    local r7_7 = r0_7.Text_ModUpNum
    if r1_7 then
      r9_7 = UE4.ESlateVisibility.Collapsed
      if not r9_7 then
        ::label_134::
        r9_7 = UE4.ESlateVisibility.SelfHitTestInvisible
      end
    else
      goto label_134	-- block#30 is visited secondly
    end
    r7_7:SetVisibility(r9_7)
    r7_7 = DataMgr.ModDropConstant.EventBonus
    if r7_7 then
      r7_7 = DataMgr.ModDropConstant.EventBonus.ConstantValue and 0
    else
      goto label_149	-- block#33 is visited secondly
    end
    local r8_7 = math.floor
    r0_7.Text_ModUpNum:SetText("+" .. ((tonumber(r7_7) and 0))(r9_7 / 100) .. "%")
    if r1_7 then
      r9_7 = "UI_Event_ModDrop_LotsOfElites" and "UI_Event_ModDrop_DropDes_1"
    else
      goto label_173	-- block#38 is visited secondly
    end
    r0_7.Text_ModUp:SetText(GText(r9_7))
  end
  r1_7 = r0_7.ContinuousCombat
  if r1_7 then
    r1_7 = DataMgr.EliteRushSelectDungeon and DataMgr.ModSelectDungeon
  else
    goto label_187	-- block#42 is visited secondly
  end
  r0_7.ModSelectDungeon = r1_7
  r1_7 = {}
  r2_7 = pairs
  for r6_7, r7_7 in r2_7(r0_7.ModSelectDungeon) do
    table.insert(r1_7, r7_7)
  end
  -- close: r2_7
  table.sort(r1_7, function(r0_8, r1_8)
    -- line: [163, 165] id: 8
    return r0_8.Sequence < r1_8.Sequence
  end)
  r0_7:UpdatKeyDisplay()
  r2_7 = 0
  for r7_7, r8_7 in ipairs(r1_7) do
    r9_7 = PageJumpUtils:CheckDungeonCondition(r8_7.Condition)
    if r9_7 then
      r2_7 = r7_7
    end
  end
  -- close: r3_7
  for r7_7, r8_7 in ipairs(r1_7) do
    r9_7 = NewObject(r0_7.LevelCellContentClass)
    r9_7.DungeonData = r8_7
    r9_7.List_NightBookItem = r0_7.List_NightBookItem
    r9_7.Parent = r0_7
    r9_7.Root = r0_7.Root
    r9_7.Index = r7_7
    r9_7.Level = tonumber(string.match(r8_7.Name and "", "_(%d+)$"))
    if r7_7 == r2_7 and r0_7.SelectCellIndex == 0 then
      r0_7.SelectCellIndex = r7_7
    end
    r0_7.List_NigheBookTab:AddItem(r9_7)
  end
  -- close: r3_7
  if not r1_7[r0_7.SelectCellIndex] then
    r0_7.SelectCellIndex = r2_7
  end
  r0_7.List_NigheBookTab:ScrollIndexIntoView(r0_7.SelectCellIndex + -1)
  if r0_7.Root.JumpNightBooKTabName then
    r0_7:SetClickedCell(r0_7.Root.JumpNightBooKTabName)
  end
end
function r1_0.SetClickedCell(r0_9, r1_9)
  -- line: [207, 220] id: 9
  r0_9:AddTimer(0.1, function()
    -- line: [208, 219] id: 10
    for r3_10 = 0, r0_9.List_NigheBookTab:GetNumItems() + -1, 1 do
      local r4_10 = r0_9.List_NigheBookTab:GetItemAt(r3_10)
      if PageJumpUtils:CheckDungeonCondition(r4_10.DungeonData.Condition) and r1_9 == r4_10.DungeonData.Name and r4_10.UI then
        r0_9:OnClickedCell(r4_10)
        break
      end
    end
  end)
end
function r1_0.OnClickedCell(r0_11, r1_11)
  -- line: [222, 233] id: 11
  if r0_11.SelectCellContent ~= nil and r0_11.SelectCellContent.UI then
    r0_11.SelectCellContent.UI.IsSelect = false
    r0_11.SelectCellContent.UI:OnCellUnSelect()
  end
  r0_11.SelectCellContent = r1_11
  r0_11.SelectCellIndex = r0_11.SelectCellContent.Index
  r0_11.List_NigheBookTab:NavigateToIndex(r0_11.SelectCellContent.Index + -1)
  r1_11.UI:SelectCell()
  r1_11.UI:RefreshDungeonRewards()
end
function r1_0.RefreshOpInfoByInputDevice(r0_12, r1_12, r2_12)
  -- line: [235, 257] id: 12
  if r1_12 == ECommonInputType.Touch then
    return 
  end
  local r3_12 = r1_12 == ECommonInputType.MouseAndKeyboard
  if not r3_12 or not 0 then
    local r4_12 = 1
  end
  if r3_12 then
    r0_12.bFocusList_Reward = false
    r0_12.bFocusDownList_Reward = false
    r0_12.Bg_border:SetVisibility(ESlateVisibility.Collapsed)
  end
  r0_12:UpdatKeyDisplay()
end
function r1_0.UpdatKeyDisplay(r0_13)
  -- line: [260, 385] id: 13
  local r1_13 = UIManager(r0_13):GetUIObj("StyleOfPlay")
  if not r1_13 then
    return 
  end
  local r2_13 = {
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = r0_13.Root.CloseSelf,
          Owner = r0_13,
        }
      },
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
          Owner = r0_13,
        }
      },
      Desc = GText("UI_BACK"),
    }
  }
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    if r0_13.bFocusList_Reward or r0_13.bFocusDownList_Reward then
      r0_13.Btn_More:SetVisibility(ESlateVisibility.Collapsed)
      r2_13 = {
        {
          GamePadInfoList = {
            {
              Type = "Img",
              ImgShortPath = "A",
              Owner = r0_13,
            }
          },
          Desc = GText("UI_Controller_CheckDetails"),
          bLongPress = false,
        }
      }
      r0_13.Key_DeputeNight:SetVisibility(ESlateVisibility.Collapsed)
      r0_13.DoubleMod_SwitchTab.Key_01:SetVisibility(ESlateVisibility.Collapsed)
      r0_13.WS_Qa:SetActiveWidgetIndex(0)
      r0_13.Key_Qa:SetVisibility(ESlateVisibility.Collapsed)
      if not r0_13.MenuOpen and r0_13.bFocusDownList_Reward then
        r0_13.Key_More_GamePad:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
        r0_13.Key_More_GamePad:CreateCommonKey({
          KeyInfoList = {
            {
              Type = "Img",
              ImgShortPath = "Menu",
            }
          },
        })
      else
        r0_13.Key_More_GamePad:SetVisibility(ESlateVisibility.Collapsed)
      end
      r1_13.ComTab.Left_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
      r1_13.ComTab.Right_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
      r1_13.ComTab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
      r1_13.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
      r0_13.Root.DeputeTab:UpdateUIStyleInPlatform(false)
    else
      r0_13.Btn_More:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      r0_13.Key_More_GamePad:SetVisibility(ESlateVisibility.Collapsed)
      r0_13.Key_DeputeNight:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      r0_13.Key_DeputeNight:CreateCommonKey({
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "X",
          }
        },
      })
      if r0_13.DoubleMod then
        r0_13.DoubleMod_SwitchTab.Key_01:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
        r0_13.DoubleMod_SwitchTab.Key_01:CreateCommonKey({
          KeyInfoList = {
            {
              Type = "Img",
              ImgShortPath = "Y",
            }
          },
        })
        r0_13.WS_Qa:SetActiveWidgetIndex(1)
        if not r0_13.bFocusList_Reward then
          r0_13.Key_Qa:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
          r0_13.Key_Qa:CreateCommonKey({
            KeyInfoList = {
              {
                Type = "Img",
                ImgShortPath = "Menu",
              }
            },
          })
        else
          r0_13.Key_Qa:SetVisibility(ESlateVisibility.Collapsed)
        end
      end
      r1_13.ComTab.Left_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      r1_13.ComTab.Right_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      r1_13.ComTab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      r1_13.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      if r0_13.Root and r0_13.Root.DeputeTab then
        r0_13.Root.DeputeTab:UpdateUIStyleInPlatform(true)
      end
    end
    local r3_13 = r0_13.bFocusList_Reward
    if r3_13 then
      r3_13 = ESlateVisibility.Collapsed and ESlateVisibility.SelfHitTestInvisible
    else
      goto label_294	-- block#19 is visited secondly
    end
    local r4_13 = r0_13.Bg_border
    local r6_13 = r0_13.bFocusDownList_Reward
    if r6_13 then
      r6_13 = ESlateVisibility.SelfHitTestInvisible and ESlateVisibility.Collapsed
    else
      goto label_305	-- block#22 is visited secondly
    end
    r4_13:SetVisibility(r6_13)
    r1_13.ComTab.Left_GamePad:SetVisibility(r3_13)
    r1_13.ComTab.Right_GamePad:SetVisibility(r3_13)
    r1_13.ComTab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(r3_13)
    r1_13.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(r3_13)
    if r0_13.MenuOpen then
      r2_13 = {}
      r1_13.ComTab.Left_GamePad:SetVisibility(ESlateVisibility.Collapsed)
      r1_13.ComTab.Right_GamePad:SetVisibility(ESlateVisibility.Collapsed)
      r1_13.ComTab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(ESlateVisibility.Collapsed)
      r1_13.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(ESlateVisibility.Collapsed)
    end
  else
    if r0_13.IsPC then
      r0_13.Key_More_GamePad:SetVisibility(ESlateVisibility.Collapsed)
      r0_13.Key_DeputeNight:SetVisibility(ESlateVisibility.Collapsed)
      r0_13.WS_Qa:SetActiveWidgetIndex(0)
      r0_13.Key_Qa:SetVisibility(ESlateVisibility.Collapsed)
    end
    r0_13.Btn_More:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_13.DoubleMod_SwitchTab.Key_01:SetVisibility(ESlateVisibility.Collapsed)
  end
  r1_13:UpdateOtherPageTab(r2_13)
end
function r1_0.GetAllModSelectRewards(r0_14, r1_14)
  -- line: [388, 413] id: 14
  local r2_14 = {}
  local r3_14 = {}
  for r10_14, r11_14 in pairs(r0_14.ModSelectDungeon[r1_14].MonRewardIdList) do
    local r12_14 = DataMgr.ModDungeonMonReward[r11_14]
    if r12_14 then
      for r17_14, r18_14 in pairs(r12_14.DungeonList) do
        local r19_14 = DataMgr.Dungeon[r18_14]
        if r19_14 then
          local r20_14 = r19_14.DungeonRewardView
          if r20_14 and not r2_14[r20_14] then
            r2_14[r20_14] = true
            table.insert(r3_14, r20_14)
          end
        end
      end
      -- close: r13_14
    end
  end
  -- close: r6_14
  return r3_14
end
function r1_0.RefreshRewardInfoList(r0_15, r1_15)
  -- line: [415, 516] id: 15
  r0_15.RewardLists = {}
  r0_15.List_Reward:ClearListItems()
  local r2_15 = r0_15:GetAllModSelectRewards(r1_15)
  if not r2_15 then
    DebugPrint("SL DungeonReward is nil")
    return 
  end
  local r3_15 = {}
  local r4_15 = {}
  for r9_15, r10_15 in pairs(r2_15) do
    for r16_15, r17_15 in pairs(RewardUtils:GetRewardViewInfoById(r10_15)) do
      table.insert(r4_15, r17_15)
    end
    -- close: r12_15
  end
  -- close: r5_15
  table.sort(r4_15, function(r0_16, r1_16)
    -- line: [439, 444] id: 16
    if r0_16.Rarity == r1_16.Rarity then
      return r0_16.Id < r1_16.Id
    end
    return r1_16.Rarity < r0_16.Rarity
  end)
  local r5_15 = GWorld:GetAvatar()
  if not r5_15 then
    return 
  end
  for r10_15, r11_15 in ipairs(r4_15) do
    if not r3_15[r11_15.Id] then
      r3_15[r11_15.Id] = true
      local r12_15 = NewObject(UIUtils.GetCommonItemContentClass())
      table.insert(r0_15.RewardLists, r11_15)
      r12_15.Id = r11_15.Id
      r12_15.Icon = ItemUtils.GetItemIconPath(r11_15.Id, r11_15.Type)
      r12_15.ParentWidget = r0_15
      r12_15.ItemType = r11_15.Type
      r12_15.Rarity = r11_15.Rarity and 1
      r12_15.IsShowDetails = true
      r12_15.UIName = "StyleOfPlay"
      if r11_15.DropType then
        r12_15.bRare = DataMgr.DropProbType[r11_15.DropType].IsRareItem
      end
      if r11_15.Quantity then
        r12_15.Count = r11_15.Quantity[1]
        r12_15.MaxCount = r11_15.Quantity[2] and nil
      end
      r12_15.bShadow = false
      if r12_15.ItemType == "Mod" then
        r12_15.bShadow = ModController:GetModel():GetModCountById(r12_15.Id) <= 0
      elseif r12_15.ItemType == "Walnut" then
        r12_15.bShadow = (r5_15.Walnuts.WalnutBag[r12_15.Id] and 0) <= 0
      end
      r0_15.List_Reward:AddItem(r12_15)
    end
  end
  -- close: r6_15
  if r0_15:IsExistTimer(r0_15.NextFrameListEmpty) then
    r0_15:RemoveTimer(r0_15.NextFrameListEmpty)
  end
  r0_15.NextFrameListEmpty = r0_15:AddTimer(0.01, function()
    -- line: [498, 515] id: 17
    for r4_17 = 1, r0_15.List_Reward:GetNumItems(), 1 do
      local r5_17 = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(r0_15.List_Reward, r4_17 + -1)
      if r5_17 then
        r5_17:BindEvents(r0_15, {
          OnMenuOpenChanged = r0_15.OnStuffMenuOpenChanged,
        })
      end
    end
    local r1_17 = r0_15.List_Reward:GetDisplayedEntryWidgets()
    for r6_17 = 1, UIUtils.GetListViewContentMaxCount(r0_15.List_Reward, r1_17, true) - r1_17:Length(), 1 do
      r0_15:CreateAndAddEmptyItem()
    end
  end, false, 0, "DeputeNightBookListView")
end
function r1_0.CreateAndAddEmptyItem(r0_18)
  -- line: [518, 524] id: 18
  local r1_18 = NewObject(UIUtils.GetCommonItemContentClass())
  r1_18.Id = 0
  return r1_18
end
function r1_0.OpenRewardDetails(r0_19)
  -- line: [527, 539] id: 19
  AudioManager(r0_19):PlayUISound(r0_19, "event:/ui/common/tip_show_click", nil, nil)
  local r2_19 = UIManager(r0_19):ShowCommonPopupUI(100156, {
    RewardList = r0_19.RewardLists,
  })
end
function r1_0.OnDoubleModSwitchTab(r0_20)
  -- line: [541, 545] id: 20
  r0_20.ContinuousCombat = r0_0:Get("Is_DoubleMod_SwitchTab", true) and false
  r0_20:RefreshData()
end
function r1_0.OnActivityTimeOpen(r0_21)
  -- line: [547, 552] id: 21
  r0_21.DoubleMod = r0_21:IsDoubleMod()
  AudioManager(r0_21):PlayUISound(r0_21, "event:/ui/common/tip_show_click", nil, nil)
  r0_21.ContinuousCombat = r0_0:Get("Is_DoubleMod_SwitchTab", true) and false
  r0_21:RefreshData()
end
function r1_0.OnActivityTimeOpenClose(r0_22)
  -- line: [554, 558] id: 22
  AudioManager(r0_22):PlayUISound(r0_22, "event:/ui/common/tip_show_click", nil, nil)
  r0_22.ContinuousCombat = r0_0:Set("Is_DoubleMod_SwitchTab", nil, true)
  r0_22:RefreshData()
end
function r1_0.OnKeyDown(r0_23, r1_23, r2_23)
  -- line: [562, 578] id: 23
  local r3_23 = UE4.UKismetInputLibrary.GetKey(r2_23)
  local r4_23 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_23)
  local r5_23 = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_23) and UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_23) then
    r5_23 = r0_23:OnGamePadDown(r4_23)
  end
  if r5_23 then
    return UWidgetBlueprintLibrary.Handled()
  else
    return UWidgetBlueprintLibrary.UnHandled()
  end
end
function r1_0.OnGamePadDown(r0_24, r1_24)
  -- line: [580, 613] id: 24
  local r2_24 = false
  if r1_24 == "Gamepad_FaceButton_Left" then
    if not r0_24.List_Reward:GetDisplayedEntryWidgets()[1]:HasAnyUserFocus() then
      r0_24.List_Reward:NavigateToIndex(0)
      r0_24.bFocusDownList_Reward = true
    else
      r0_24.List_NigheBookTab:NavigateToIndex(r0_24.SelectCellContent.Index + -1)
      r0_24.bFocusDownList_Reward = false
    end
    r0_24:UpdatKeyDisplay()
    r2_24 = true
  elseif r1_24 == "Gamepad_FaceButton_Right" then
    local r3_24 = r0_24.List_Reward:GetDisplayedEntryWidgets()
    for r7_24 = 1, r3_24:Length(), 1 do
      if r3_24[r7_24]:HasFocusedDescendants() or r3_24[r7_24]:HasAnyUserFocus() then
        r0_24.List_NigheBookTab:NavigateToIndex(r0_24.SelectCellContent.Index + -1)
        r0_24.bFocusList_Reward = false
        r0_24.bFocusDownList_Reward = false
        r0_24:UpdatKeyDisplay()
        r2_24 = true
      end
    end
  elseif r1_24 == Const.GamepadFaceButtonUp and not r0_24.bFocusList_Reward and r0_24.DoubleMod then
    r0_24.DoubleMod_SwitchTab:OnClicked()
    r2_24 = true
  end
  return r2_24
end
function r1_0.OnNightBookSpecialRightUp(r0_25)
  -- line: [615, 626] id: 25
  if r0_25.bFocusList_Reward then
    return 
  end
  if not r0_25:HasFocusedDescendants() and not r0_25:HasAnyUserFocus() and r0_25.Key_Qa:GetVisibility() == ESlateVisibility.SelfHitTestInvisible and r0_25.DoubleMod then
    r0_25:OnTips()
  end
  -- warn: not visited block [7]
  -- block#7:
  -- r0_25:OpenRewardDetails()
  -- goto label_40
end
function r1_0.OnTips(r0_26)
  -- line: [628, 641] id: 26
  if not r0_26.DoubleMod then
    return 
  end
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    AudioManager(r0_26):PlayUISound(r0_26, "event:/ui/common/click_btn_small", nil, nil)
  end
  local r1_26 = DataMgr.ModDropConstant.DailyFreeTicketAmount.ConstantValue and 0
  UIManager(r0_26):ShowCommonPopupUI(100237, {
    LongText = string.format(GText(DataMgr.CommonPopupUIContext[100237].PopoverText), DataMgr.ModDropConstant.DailyModDungeonAmount.ConstantValue and 0, r1_26),
  }, r0_26)
end
function r1_0.OnStuffMenuOpenChanged(r0_27, r1_27)
  -- line: [643, 662] id: 27
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return 
  end
  r0_27.MenuOpen = r1_27
  r0_27:UpdatKeyDisplay()
end
AssembleComponents(r1_0)
return r1_0
