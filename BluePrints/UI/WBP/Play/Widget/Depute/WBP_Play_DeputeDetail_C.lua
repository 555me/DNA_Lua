-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Play\Widget\Depute\WBP_Play_DeputeDetail_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("Utils.CommonUtils")
local r1_0 = require("Utils.MonsterUtils")
local r3_0 = require("BluePrints.UI.WBP.Walnut.WalnutBag.WalnutBagController"):GetModel()
local r4_0 = require("Utils.TimeUtils")
local r5_0 = require("EMCache.EMCache")
local r6_0 = Class({
  "BluePrints.UI.BP_UIState_C"
})
r6_0._components = {
  "BluePrints.UI.WBP.Play.Widget.Depute.DoubleModDropView"
}
local r7_0 = {
  Char = 1,
  Weapon = 2,
  Mod = 3,
  Draft = 4,
  Reward = 5,
  Resource = 6,
}
local r8_0 = {}
function r6_0.Construct(r0_1)
  -- line: [31, 144] id: 1
  r6_0.bOpened = true
  r6_0.Super.Construct(r0_1)
  r0_1.Button_Solo:SetText(GText("DUNGEONSINGLE"))
  r0_1.Button_Multi:SetText(GText("DUNGEONMATCH"))
  r0_1.Text_TypeSelect:SetText(GText("UI_Dungeon_Type_List"))
  r0_1.Text_TypeSelect02:SetText(GText("UI_Armory_ShowAttribute"))
  r0_1.Text_Warning:SetText(GText("UI_Warning_CharLevel_Low"))
  r0_1.Button_Multi:BindEventOnClicked(r0_1, r0_1.OnClickMulti)
  r0_1.Button_Solo:BindEventOnClicked(r0_1, r0_1.ShowDialogChar)
  r0_1.Button_DoubleMod:BindEventOnClicked(r0_1, r0_1.ShowDialogChar)
  r0_1.Stats_ListView.BP_OnEntryInitialized:Add(r0_1, r0_1.OnElementEntryInitialized)
  r0_1.ScrollBox_List.OnUserScrolled:Add(r0_1, r0_1.OnUserScrolled)
  r0_1.Button_Type.OnHovered:Add(r0_1, r0_1.OnButtonAttibuteHovered)
  r0_1.Button_Type.OnUnhovered:Add(r0_1, r0_1.OnButtonAttibuteUnhovered)
  r0_1:AddDispatcher(EventID.OnChangeActionPoint, r0_1, r0_1.UpdateActionPoint)
  r0_1:AddDispatcher(EventID.TeamMatchTimingStart, r0_1, r0_1.TeamMatchTimingStart)
  r0_1:AddDispatcher(EventID.TeamMatchTimingEnd, r0_1, r0_1.TeamMatchTimingEnd)
  r0_1:AddDispatcher(EventID.SelectedWalnut, r0_1, r0_1.EnterWalnutDungeon)
  r0_1:AddDispatcher(EventID.TeamMatchOneRefused, r0_1, function()
    -- line: [51, 51] id: 2
    r0_1:BlockAllUIInput(false)
  end)
  r0_1:AddDispatcher(EventID.OnRefreshDeputeBtn, r0_1, r0_1.RefreshBtnState)
  r0_1:AddDispatcher(EventID.OnDungeonsUpdate, r0_1, r0_1.OnDungeonsUpdate)
  r0_1:AddDispatcher(EventID.CurrentSquadChange, r0_1, r0_1.OnCurrentSquadChange)
  r0_1:AddDispatcher(EventID.FoucsDungeonSelectLevel, r0_1, r0_1.OnSelectCellFocus)
  r0_1:AddDispatcher(EventID.OnDisableEscOnDungeonLoading, r0_1, r0_1.DisableEscOnDungeonLoading)
  TeamController:RegisterEvent(r0_1, function(r0_3, r1_3, ...)
    -- line: [59, 63] id: 3
    if r1_3 == TeamCommon.EventId.TeamOnInit or r1_3 == TeamCommon.EventId.TeamLeave then
      r0_3:RefreshBtnState()
    end
  end)
  r0_1.List_Prop.OnCreateEmptyContent:Bind(r0_1, r0_1.CreateAndAddEmptyItem)
  r0_1.List_Prop.BP_OnEntryInitialized:Add(r0_1, function(r0_4, r1_4, r2_4)
    -- line: [66, 72] id: 4
    if r1_4.Id ~= 0 then
      r2_4:BindEvents(r0_4, {
        OnMenuOpenChanged = r0_4.OnStuffMenuOpenChanged,
      })
    end
  end)
  r0_1.List_Event.OnCreateEmptyContent:Bind(r0_1, r0_1.CreateEventAndAddEmptyItem)
  r0_1.HB_Cost:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_1:AddInputMethodChangedListen()
  r0_1.List_Prop:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  r0_1.List_Prop:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  r0_1.List_Prop:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  r0_1.List_Prop:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  r0_1.List_Monster:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  r0_1.List_Monster:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  r0_1.List_Monster:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  r0_1.List_Monster:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  r0_1.List_Event:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  r0_1.List_Event:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  r0_1.List_Event:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  r0_1.List_Event:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  r0_1.WB_EliteProp:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  r0_1.WB_EliteProp:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  r0_1.WB_EliteProp:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  r0_1.WB_EliteProp:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  r0_1.IsFocusProp = false
  r0_1.IsFocus_Monster = false
  r0_1.IsFocusEliteProp = false
  r0_1.SquadId = 1
  r0_1.MaxMonNum = 2
  r0_1.WalnutId = nil
  r0_1.Mobile = r0_0.GetDeviceTypeByPlatformName(r0_1) == "Mobile"
  r0_1.Gamepad = UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad
  r0_1.FocusTypeName = nil
  r0_1.PressedKeys = {}
  r0_1.Cost:SetVisibility(ESlateVisibility.Collapsed)
  r0_1.Group_Double:SetVisibility(ESlateVisibility.Collapsed)
  r0_1.HB_Counsume:SetVisibility(ESlateVisibility.Collapsed)
  if r0_1.Arrow_Up then
    r0_1.Arrow_Up:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if r0_1.Arrow_Down then
    r0_1.Arrow_Down:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  r0_1.Btn_Qa:Init({
    OwnerWidget = r0_1,
    PopupID = 100241,
    ClickCallback = function()
      -- line: [138, 140] id: 5
      UIManager(r0_1):ShowCommonPopupUI(100241)
    end,
  })
  r0_1.StyleOfPlay = UIManager(r0_1):GetUIObj("StyleOfPlay")
end
function r6_0.Destruct(r0_6)
  -- line: [147, 156] id: 6
  r6_0.Super.Destruct(r0_6)
  r6_0.bOpened = false
  r6_0.SelectedDungeonId = nil
  r0_6.Button_Multi:UnBindEventOnClickedByObj(r0_6)
  r0_6.Button_Solo:UnBindEventOnClickedByObj(r0_6)
  r0_6.Button_DoubleMod:UnBindEventOnClickedByObj(r0_6)
  TeamController:UnRegisterEvent(r0_6)
end
function r6_0.InitLevelList(r0_7, r1_7, r2_7, r3_7, r4_7)
  -- line: [161, 356] id: 7
  AudioManager(r0_7):PlayUISound(r0_7, "event:/ui/armory/open", "Play_DeputeDetail", nil)
  local r5_7 = UIManager(r0_7):GetUIObj("StyleOfPlay")
  if r5_7 then
    r0_7.CurTabId = r5_7.CurTabId
  end
  r0_7:SetFocus()
  r0_7.MonsterIdToItem = {}
  r0_7.TypeTable = {}
  r0_7.TypeTableKeys = {}
  r0_7.HB_Type:ClearChildren()
  r0_7.CurrentTabIdx = 1
  r0_7.SelectCell = nil
  r0_7.FirstEnter = true
  if not r3_7 then
    r0_7.DeputeType = Const.DeputeType.RegularDepute
  else
    r0_7.DeputeType = r3_7
  end
  if r4_7 then
    r0_7.WalnutId = r4_7
  end
  if r2_7 then
    r8_0 = {}
  end
  if not r1_7 then
    return 
  end
  r0_7.ActionPointId = DataMgr.ResourceSType2Resource.ActionPoint[1]
  local r6_7 = r0_7.DeputeType == Const.DeputeType.NightFlightManualDepute
  local r7_7 = {}
  local r8_7 = {}
  local r9_7 = GText("UI_DUNGEON_ObtainType")
  r8_7.Text = r9_7
  if r6_7 then
    r9_7 = 1 and 2
  else
    goto label_81	-- block#16 is visited secondly
  end
  r8_7.Id = r9_7
  r9_7 = {}
  local r10_7 = GText("UI_DUNGEON_MonsterType")
  r9_7.Text = r10_7
  if r6_7 then
    r10_7 = 2 and 3
  else
    goto label_94	-- block#19 is visited secondly
  end
  r9_7.Id = r10_7
  -- setlist for #7 failed
  if r6_7 then
    r8_7 = 2 and 1
  else
    goto label_102	-- block#22 is visited secondly
  end
  r0_7.ObtainTabId = r8_7
  if r6_7 then
    r8_7 = 3 and 2
  else
    goto label_109	-- block#25 is visited secondly
  end
  r0_7.MonsterTabId = r8_7
  if r6_7 then
    table.insert(r7_7, 1, {
      Text = GText("UI_Dungeon_SpecialMonster"),
      Id = 1,
    })
    r0_7.SpecialMonsterTabId = 1
  end
  r0_7.Tab_Info:Init({
    LeftKey = "A",
    RightKey = "D",
    Tabs = r7_7,
    ChildWidgetBPPath = "WidgetBlueprint\'/Game/UI/WBP/Common/Tab/Widget/WBP_Com_TabSubItem01.WBP_Com_TabSubItem01\'",
    SoundFunc = r0_7.PlayTabSound,
    SoundFuncReceiver = r0_7,
  })
  r0_7.Tab_Info:BindEventOnTabSelected(r0_7, r0_7.OnSubTabChanged)
  r0_7.Tab_Info:SelectTab(1)
  r0_7.ScrollBox_List:ClearChildren()
  r0_7.ScrollBox_List:ScrollToStart()
  r0_7.ScrollBox_List:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Wrap)
  r0_7.ScrollBox_List:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  r0_7.ScrollBox_List:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  r0_7.ScrollBox_List:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  r0_7.ScrollBox_List:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  r0_7.WB_EliteProp:ClearChildren()
  r0_7.WB_EliteProp:SetVisibility(ESlateVisibility.Collapsed)
  r0_7.Bg_Consume:SetVisibility(ESlateVisibility.Collapsed)
  if r0_7.DeputeType == Const.DeputeType.WalnutDepute then
    if not r0_7.WalnutTypeData then
      return 
    end
    r0_7.Panel_Walnut:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_7.HB_WalnutCost:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_7.Button_Solo:SetText(GText("UI_Walnut_Choice"))
    if r0_7.WalnutTypeTextColor then
      r0_7.Text_Walnut:GetDynamicFontMaterial():SetVectorParameterValue("MainColor", r0_7.WalnutTypeTextColor)
    end
    r0_7.Icon_Walnut:SetBrushResourceObject(LoadObject(r0_7.WalnutTypeData.TypeIcon))
    r0_7.Text_Walnut:SetText(GText(r0_7.WalnutTypeData.Name))
    r0_7.Text_WalnutCost:SetText(GText("UI_Walnut_Dungeon_Available"))
    r0_7.Panel_WalnutTime:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_7.Text_WalnutTime:SetText(GText("UI_Walnut_Dungeon_Refresh"))
    r0_7.LeftTimeDict = r3_0:GetDungeonNextRefreshTime()
    if r0_7:IsExistTimer("UpdateTimeContent") then
      r0_7:RemoveTimer("UpdateTimeContent")
    end
    r0_7:UpdateTimeCountDown()
    r0_7:AddTimer(1, r0_7.UpdateTimeCountDown, true, 0, "UpdateTimeContent", true)
  else
    r0_7.Panel_Walnut:SetVisibility(ESlateVisibility.Collapsed)
    r0_7.HB_WalnutCost:SetVisibility(ESlateVisibility.Collapsed)
    r0_7.Panel_WalnutTime:SetVisibility(ESlateVisibility.Collapsed)
  end
  r8_7 = GWorld:GetAvatar()
  if not r8_7 then
    return 
  end
  if r0_7.DeputeType == Const.DeputeType.DeputeWeekly then
    r0_7.HB_Weekly:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_7.Bg_Consume:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_7.WeeklyDungeonRewardLeft = r8_7.WeeklyDungeonRewardLeft
    r0_7.Text_WeeklyDescNumNow:SetText(r0_7.WeeklyDungeonRewardLeft)
    r0_7.Text_WeeklyDescNumTotal:SetText(DataMgr.GlobalConstant.DungeonRewardRefresh.ConstantValue)
    if r0_7.WeeklyDungeonRewardLeft > 0 then
      if r0_7.ColorNowNormal then
        r0_7.Text_WeeklyDescNumNow:SetColorAndOpacity(r0_7.ColorNowNormal)
      else
        r0_7.Text_WeeklyDescNumNow:SetColorAndOpacity(r0_7.ColorNowEmpty)
      end
    end
    r0_7.Text_WeeklyDescNumTitle:SetText(GText("UI_WeeklyDungeon_ChancesRemain"))
  else
    r0_7.HB_Weekly:SetVisibility(ESlateVisibility.Collapsed)
  end
  r9_7 = nil
  for r14_7, r15_7 in pairs(r1_7) do
    if PageJumpUtils:CheckDungeonCondition(DataMgr.Dungeon[r15_7].Condition) then
      r9_7 = r15_7
    end
  end
  -- close: r10_7
  for r14_7, r15_7 in pairs(r1_7) do
    local r16_7 = r0_7:CreateWidgetNew("DungeonSelectLevel")
    r16_7:BindEventOnClicked(r0_7, r0_7.OnClickedLevelCell, r16_7)
    local r17_7 = r0_7.DeputeType
    if r17_7 ~= Const.DeputeType.RegularDepute then
      r17_7 = r0_7.DeputeType
      if r17_7 == Const.DeputeType.DeputeWeekly then
        ::label_411::
        r16_7:InitDungeonInfo(r15_7, r14_7, false, r0_7)
      else
        r16_7:InitDungeonInfo(r15_7, r14_7, true, r0_7)
      end
    else
      goto label_411	-- block#53 is visited secondly
    end
    if (r2_7 or r15_7 ~= r9_7) and r2_7 ~= r15_7 then
      r17_7 = DataMgr.Dungeon2SubDungeon[r2_7] == r15_7
    else
      goto label_436	-- block#60 is visited secondly
    end
    if r17_7 then
      local r18_7 = PageJumpUtils:CheckDungeonCondition(DataMgr.Dungeon[r15_7].Condition)
      if r18_7 then
        r0_7.SelectCell = r16_7
        r16_7.Bg_List.IsSelect = true
        r16_7.Bg_List:PlayAnimation(r16_7.Bg_List.Select)
        r16_7:PlayAnimation(r16_7.Select)
        if r2_7 then
          r18_7 = DataMgr.Dungeon2SubDungeon[r2_7] and r15_7
        else
          goto label_466	-- block#65 is visited secondly
        end
        r0_7.CurCellDungeonId = r18_7
        r0_7:InitListCellInfo(r2_7 and r15_7)
      else
        r0_7.Panel_Detail:SetVisibility(ESlateVisibility.Collapsed)
      end
    end
    r0_7.ScrollBox_List:AddChild(r16_7)
  end
  -- close: r10_7
  if r0_7.SelectCell then
    r0_7:SelectCellFocus()
    r0_7.ScrollBox_List:ScrollWidgetIntoView(r0_7.SelectCell, true, EDescendantScrollDestination.Center)
  end
  r0_7.ScrollBox_List:GetChildAt(0):SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  r0_7.ScrollBox_List:GetChildAt(r0_7.ScrollBox_List:GetChildrenCount() + -1):SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  r0_7:PlayAnimation(r0_7.In)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    r0_7:UpdateUIStyleInPlatform(false)
  end
end
function r6_0.SetWalnutTitleMatColor(r0_8, r1_8)
  -- line: [359, 367] id: 8
  if r1_8 == 1 then
    r0_8.WalnutTypeTextColor = r0_8.Sx_Text_WalnutTypeTitleMatColor
  elseif r1_8 == 2 then
    r0_8.WalnutTypeTextColor = r0_8.Zl_Text_WalnutTypeTitleMatColor
  else
    r0_8.WalnutTypeTextColor = r0_8.Hl_Text_WalnutTypeTitleMatColor
  end
end
function r6_0.UpdateTimeCountDown(r0_9)
  -- line: [369, 372] id: 9
  local r1_9, r2_9 = UIUtils.GetLeftTimeStrStyle2(r0_9.LeftTimeDict)
  r0_9.Time_Refresh:SetTimeText("UI_Walnut_Dungeon_Refresh", r1_9)
end
function r6_0.SetPanelDetails(r0_10, r1_10)
  -- line: [376, 421] id: 10
  r0_10.Com_Btn_Details:UnBindEventOnClickedByObj(r0_10)
  if r1_10 == r0_10.ObtainTabId then
    r0_10.Com_Btn_Details:BindEventOnClicked(r0_10, r0_10.OpenRewardDetails)
    r0_10.Text_Details:SetText(GText("UI_CTL_Details"))
    if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
      r0_10.Switch_Details_Icon:SetActiveWidgetIndex(2)
      r0_10.Key_Details_GamePad:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      r0_10.Key_Details_GamePad:CreateCommonKey({
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "Down",
          }
        },
      })
    else
      r0_10.Switch_Details_Icon:SetActiveWidgetIndex(1)
      if not r0_10.Mobile then
        r0_10.Key_Details_GamePad:SetVisibility(ESlateVisibility.Collapsed)
      end
    end
  else
    r0_10.Com_Btn_Details:BindEventOnClicked(r0_10, r0_10.OpenCommanderDetails)
    r0_10.Text_Details:SetText(GText("UI_Dungeon_More"))
    if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
      r0_10.Switch_Details_Icon:SetActiveWidgetIndex(2)
      r0_10.Key_Details_GamePad:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      r0_10.Key_Details_GamePad:CreateCommonKey({
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "Down",
          }
        },
      })
    else
      r0_10.Switch_Details_Icon:SetActiveWidgetIndex(0)
      if not r0_10.Mobile then
        r0_10.Key_Details_GamePad:SetVisibility(ESlateVisibility.Collapsed)
      end
    end
  end
end
function r6_0.OnSubTabChanged(r0_11, r1_11)
  -- line: [423, 462] id: 11
  r0_11.CurrentTabIdx = r1_11.Idx
  r0_11:PlayAnimation(r0_11.Switch_Tab)
  if r1_11.Idx == r0_11.ObtainTabId then
    r0_11.List_Prop:SetVisibility(ESlateVisibility.Visible)
    r0_11.List_Monster:SetVisibility(ESlateVisibility.Collapsed)
    r0_11.List_Event:SetVisibility(ESlateVisibility.Collapsed)
    r0_11:SetPanelDetailsVis(ESlateVisibility.SelfHitTestInvisible)
    r0_11.WB_EliteProp:SetVisibility(ESlateVisibility.Collapsed)
    if r0_11.CurrentFocusType == "List" then
      r0_11.List_Prop:SetFocus()
      r0_11:UpdatKeyDisplay("RewardWidget")
    end
    r0_11.Btn_Area.OnClicked:Add(r0_11, r0_11.OpenIntro)
    r0_11:SetPanelDetails(r1_11.Idx)
  elseif r1_11.Idx == r0_11.MonsterTabId then
    r0_11.List_Prop:SetVisibility(ESlateVisibility.Collapsed)
    r0_11.List_Monster:SetVisibility(ESlateVisibility.Visible)
    r0_11.List_Event:SetVisibility(ESlateVisibility.Collapsed)
    r0_11:SetPanelDetailsVis(ESlateVisibility.Collapsed)
    r0_11.WB_EliteProp:SetVisibility(ESlateVisibility.Collapsed)
    if r0_11.CurrentFocusType == "List" then
      r0_11.List_Monster:SetFocus()
      r0_11:UpdatKeyDisplay("RewardWidget")
    end
  elseif r0_11.TitleEventTabId and r1_11.Idx == r0_11.TitleEventTabId then
    r0_11.List_Event:SetVisibility(ESlateVisibility.Visible)
    r0_11.List_Prop:SetVisibility(ESlateVisibility.Collapsed)
    r0_11.List_Monster:SetVisibility(ESlateVisibility.Collapsed)
    r0_11:SetPanelDetailsVis(ESlateVisibility.Collapsed)
    r0_11.WB_EliteProp:SetVisibility(ESlateVisibility.Collapsed)
    if r0_11.CurrentFocusType == "List" then
      r0_11.List_Event:SetFocus()
      r0_11:UpdatKeyDisplay("EventWidget")
    end
  end
  r0_11:SetNightFlightManualText_MoreHide(r1_11.Idx)
end
function r6_0.IsShowKeyMore(r0_12)
  -- line: [464, 469] id: 12
  if r0_12.CurrentTabIdx == r0_12.SpecialMonsterTabId then
    return r0_12.MonNum and r0_12.MaxMonNum < r0_12.MonNum
  end
  return r0_12.CurrentTabIdx == r0_12.ObtainTabId
end
function r6_0.ItemMenuAnchorChanged(r0_13, r1_13)
  -- line: [472, 482] id: 13
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return 
  end
  if r1_13 then
    r0_13:UpdatKeyDisplay("")
  else
    r0_13:UpdatKeyDisplay("SelfWidget")
    r0_13:SelectCellFocus()
  end
end
function r6_0.SetNightFlightManualText_MoreHide(r0_14, r1_14)
  -- line: [485, 510] id: 14
  if r0_14.DeputeType == Const.DeputeType.NightFlightManualDepute and r1_14 == r0_14.SpecialMonsterTabId then
    r0_14:SetNightFlightManualEliteProp(r0_14.CurSelectedDungeonId)
    if r0_14.MonNum and r0_14.MaxMonNum < r0_14.MonNum then
      r0_14:SetPanelDetails(r1_14)
      r0_14:SetPanelDetailsVis(ESlateVisibility.SelfHitTestInvisible)
      r0_14.List_Prop:SetVisibility(ESlateVisibility.Collapsed)
      r0_14.List_Monster:SetVisibility(ESlateVisibility.Collapsed)
    else
      r0_14:SetPanelDetailsVis(ESlateVisibility.Collapsed)
      r0_14.List_Prop:SetVisibility(ESlateVisibility.Collapsed)
      r0_14.List_Monster:SetVisibility(ESlateVisibility.Collapsed)
    end
    r0_14.WB_EliteProp:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    if r0_14.CurrentFocusType == "List" and r0_14.WB_EliteProp:GetChildAt(0) then
      r0_14.WB_EliteProp:GetChildAt(0):SetFocus()
    end
  end
end
function r6_0.SetNightFlightManualRewardView(r0_15, r1_15)
  -- line: [512, 514] id: 15
  r0_15.DungeonRewardView = r1_15
end
function r6_0.SetNightFlightManualEliteProp(r0_16, r1_16)
  -- line: [516, 584] id: 16
  r0_16.WB_EliteProp:ClearChildren()
  r0_16.MonsterWeaknessIconCache = {}
  local r2_16 = DataMgr.ModDungeon2Monster[r1_16]
  if not r2_16 or #r2_16 == 0 then
    DebugPrint("SL No monsters found for DungeonId:", r1_16)
    return 
  end
  r0_16.MonNum = r0_0.TableLength(r2_16)
  for r7_16 = 1, math.min(r0_16.MonNum, 2), 1 do
    local r8_16 = r2_16[r7_16]
    local r9_16 = r0_16:CreateWidgetNew("DeputeEliteInfo")
    r9_16:InitItemContent(r8_16, r0_16:GetMonsterWeaknessIcon(r8_16), r0_16, r0_16.DungeonRewardView)
    r0_16.WB_EliteProp:AddChild(r9_16)
  end
  if r0_16.WB_EliteProp:GetChildrenCount() <= 1 then
    local r4_16 = r0_16:CreateWidgetNew("DeputeEliteInfo")
    r4_16:InitItemContent()
    r0_16.WB_EliteProp:AddChild(r4_16)
  end
  if r0_16.WB_EliteProp:GetChildrenCount() == 1 then
    r0_16.WB_EliteProp:GetChildAt(0):SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
    r0_16.WB_EliteProp:GetChildAt(0):SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
    r0_16.WB_EliteProp:GetChildAt(0):SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  elseif r0_16.WB_EliteProp:GetChildrenCount() == 2 and r0_16.WB_EliteProp:GetChildAt(1).Id then
    r0_16.WB_EliteProp:GetChildAt(0):SetNavigationRuleExplicit(EUINavigation.Right, r0_16.WB_EliteProp:GetChildAt(1))
    r0_16.WB_EliteProp:GetChildAt(0):SetNavigationRuleExplicit(EUINavigation.Left, r0_16.WB_EliteProp:GetChildAt(1))
    r0_16.WB_EliteProp:GetChildAt(1):SetNavigationRuleExplicit(EUINavigation.Left, r0_16.WB_EliteProp:GetChildAt(0))
    r0_16.WB_EliteProp:GetChildAt(1):SetNavigationRuleExplicit(EUINavigation.Right, r0_16.WB_EliteProp:GetChildAt(0))
    r0_16.WB_EliteProp:GetChildAt(0):SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
    r0_16.WB_EliteProp:GetChildAt(1):SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  end
end
function r6_0.GetMonsterWeaknessIcon(r0_17, r1_17)
  -- line: [596, 622] id: 17
  local r2_17 = r0_17.MonsterWeaknessIconCache and {}
  r0_17.MonsterWeaknessIconCache = r2_17
  if r2_17[r1_17] then
    return r2_17[r1_17]
  end
  for r8_17, r9_17 in ipairs(r1_0.GetRealMonsterBuffs(r0_17.CurSelectedDungeonId, r1_17)) do
    local r10_17 = DataMgr.Buff[r9_17]
    if r10_17 and r10_17.WeaknessType then
      local r11_17 = DataMgr.DamageType[r10_17.WeaknessType] and DataMgr.DamageType[r10_17.WeaknessType].WeaknessIcon
      if r11_17 then
        r2_17[r1_17] = r2_17[r1_17] and {}
        r2_17[r1_17][r11_17] = true
      end
    end
  end
  -- close: r4_17
  return r2_17[r1_17]
end
function r6_0.SetWalnutType(r0_18, r1_18)
  -- line: [625, 627] id: 18
  r0_18.WalnutTypeData = r1_18
end
function r6_0.OnClickedLevelCell(r0_19, r1_19)
  -- line: [631, 648] id: 19
  if r0_19.SelectCell ~= nil then
    r0_19.SelectCell:PlayAnimationReverse(r0_19.SelectCell.Select)
    local r2_19 = r0_19.SelectCell.Bg_List
    r2_19:StopAllAnimations()
    r2_19:PlayAnimation(r2_19.Normal)
    r2_19.IsSelect = false
  end
  r0_19.SelectCell = r1_19
  r0_19.TypeTable = {}
  r0_19.TypeTableKeys = {}
  r0_19.HB_Type:ClearChildren()
  r0_19.LastMarkType = nil
  r0_19.CurCellDungeonId = r1_19.DungeonId
  r0_19:InitListCellInfo(r1_19.DungeonId)
end
function r6_0.OnTypeClicked(r0_20, r1_20, r2_20)
  -- line: [652, 668] id: 20
  r8_0[r0_20.CurCellDungeonId] = r1_20
  local r3_20 = DataMgr.Dungeon[r1_20].AttributeType
  r0_20.DungeonAttribute = r3_20
  r0_20:SetElementIcon(r3_20)
  r0_20:IsShowAttributeTips()
  r0_20.TypeTable[r1_20]:OnClicked(r2_20)
  if r0_20.LastMarkType and r0_20.LastMarkType ~= r0_20.TypeTable[r1_20] then
    r0_20.LastMarkType.IsSelect = false
    r0_20.LastMarkType:PlayAnimation(r0_20.LastMarkType.Normal)
  end
  r0_20.LastMarkType = r0_20.TypeTable[r1_20]
  r0_20.CurSelectedDungeonId = r1_20
  r6_0.SelectedDungeonId = r1_20
  r0_20:RefreshLevelCellContent(r1_20)
end
function r6_0.IsShowAttributeTips(r0_21)
  -- line: [670, 693] id: 21
  if not r0_21.DungeonAttribute then
    return 
  end
  local r1_21 = r0_21.DefaultList.CurrentCharId
  if r1_21 then
    if DataMgr.Attribute[DataMgr.BattleChar[r1_21].Attribute].CounterType ~= r0_21.DungeonAttribute then
      for r7_21, r8_21 in pairs(DataMgr.Attribute) do
        if r8_21.CounterType == r0_21.DungeonAttribute then
          r0_21.Text_Warning_Attribute:SetText(string.format(GText("UI_Squad_Elemental_Weakness"), GText("UI_Attr_" .. r8_21.ID .. "_Name")))
          break
        end
      end
      -- close: r3_21
      r0_21.Panel_WarningHint_Attribute:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    else
      r0_21.Panel_WarningHint_Attribute:SetVisibility(ESlateVisibility.Collapsed)
    end
  else
    r0_21.Panel_WarningHint_Attribute:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end
function r6_0.InitListCellInfo(r0_22, r1_22)
  -- line: [697, 843] id: 22
  -- notice: unreachable block#8
  if r0_22.SelectCell then
    r0_22:SelectCellFocus()
  end
  local r2_22 = DataMgr.Dungeon2SubDungeon
  r0_22.CurSelectedDungeonId = r1_22
  r6_0.SelectedDungeonId = r1_22
  r0_22.HasTypeSelect = false
  r0_22.Stats:SetRenderOpacity(0)
  r0_22:RefreshDeputeEvent(r1_22)
  if not r0_22.TitleEventTabId and r0_22.List_Event:GetNumItems() > 0 then
    local r3_22 = r0_22.Tab_Info.Tabs
    local r4_22 = #r0_22.Tab_Info.Tabs + 1
    table.insert(r3_22, r4_22, {
      Text = GText("UI_Dungeon_Title_Event"),
      Id = r4_22,
    })
    r0_22.TitleEventTabId = r4_22
    r0_22.Tab_Info:UpdateTabs(r3_22)
  end
  r0_22.Tab_Info:SelectTab(1)
  if DataMgr.Dungeon[r0_22.CurSelectedDungeonId].Squad then
    r0_22.DefaultList:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    local r4_22 = DataMgr.Dungeon[r0_22.CurSelectedDungeonId].DungeonType
    local r5_22 = r4_22 == "Rouge"
    local r6_22 = GWorld:GetAvatar()
    if r6_22 then
      local r7_22 = r6_22.DungeonSquad[r4_22]
      if r7_22 then
        r7_22 = r6_22.DungeonSquad[r4_22] and 0
      else
        goto label_89	-- block#13 is visited secondly
      end
      r0_22.DefaultList:Init(r0_22, r5_22, r7_22, r0_22.CurSelectedDungeonId)
    end
  else
    r0_22.DefaultList:SetVisibility(ESlateVisibility.Collapsed)
  end
  local r11_22 = nil	-- notice: implicit variable refs by block#[50, 61, 64, 72]
  local r12_22 = nil	-- notice: implicit variable refs by block#[53]
  if r2_22[r1_22] then
    r0_22.List_Type:SetVisibility(ESlateVisibility.Visible)
    r0_22.Panel_Type:SetVisibility(ESlateVisibility.Visible)
    if not r0_22.Mobile then
      if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
        r0_22.Key_Qa_GamePad:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      else
        r0_22.Key_Qa_GamePad:SetVisibility(ESlateVisibility.Collapsed)
      end
    end
    local r4_22 = DataMgr.Dungeon[r2_22[r1_22]].SubDungeonId
    local r5_22 = {}
    table.insert(r5_22, r2_22[r1_22])
    if not r4_22 then
      DebugPrint("ZDX SubDungeonList is nil")
      return 
    end
    for r10_22, r11_22 in pairs(r4_22) do
      table.insert(r5_22, r11_22)
      r12_22 = DataMgr.Dungeon[r11_22].AttributeType
      if not r12_22 then
        DebugPrint("ZDX Dungeon AttributeType is nil")
      end
    end
    -- close: r6_22
    table.sort(r5_22, function(r0_23, r1_23)
      -- line: [759, 763] id: 23
      return DataMgr.Attribute[DataMgr.Dungeon[r0_23].AttributeType].DisplayPriority < DataMgr.Attribute[DataMgr.Dungeon[r1_23].AttributeType].DisplayPriority
    end)
    for r10_22, r11_22 in pairs(r5_22) do
      r12_22 = r0_22:CreateWidgetNew("DeputeTypeIcon")
      r12_22:InitContent(DataMgr.Dungeon[r11_22].AttributeType)
      r12_22.Button_Area.OnClicked:Add(r0_22, function()
        -- line: [768, 770] id: 24
        r0_22:OnTypeClicked(r11_22)
      end)
      r12_22.Select = true
      r0_22.HB_Type:AddChild(r12_22)
      r0_22.TypeTable[r11_22] = r12_22
      table.insert(r0_22.TypeTableKeys, r11_22)
      -- close: r10_22
    end
    -- close: r6_22
    r0_22:OnTypeClicked(r8_0[r0_22.CurSelectedDungeonId] and r0_22.CurSelectedDungeonId, true)
    r0_22.HasTypeSelect = true
  else
    r0_22.List_Type:SetVisibility(ESlateVisibility.Collapsed)
    r0_22.Panel_Type:SetVisibility(ESlateVisibility.Collapsed)
    r0_22.Panel_WarningHint_Attribute:SetVisibility(ESlateVisibility.Collapsed)
    r0_22:RefreshLevelCellContent(r0_22.CurSelectedDungeonId)
  end
  if not (r0_22.DeputeType == Const.DeputeType.NightFlightManualDepute) then
    r0_22.Group_TimeTips:SetVisibility(ESlateVisibility.Collapsed)
    return 
  end
  if not (DataMgr.DoubleModDrop and DataMgr.DoubleModDrop[CommonConst.DoubleModDropEventID]) then
    r0_22.Group_TimeTips:SetVisibility(ESlateVisibility.Collapsed)
    return 
  end
  local r6_22, r7_22 = r0_22:CheckDungeonType(r1_22)
  if not r6_22 and not r7_22 then
    r0_22.Group_TimeTips:SetVisibility(ESlateVisibility.Collapsed)
    return 
  end
  r0_22.IsDoubleModOpen = r0_22:IsDoubleMod()
  if not r0_22.IsDoubleModOpen then
    r0_22.Group_TimeTips:SetVisibility(ESlateVisibility.Collapsed)
    return 
  end
  r0_22.Text_ModUpNum:SetVisibility(UE4.ESlateVisibility.Collapsed)
  local r8_22, r9_22 = r0_22:CheckDungeonType(r0_22.CurSelectedDungeonId)
  r0_22.Group_TimeTips:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_22.Bg_Consume:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  local r10_22 = r0_22:GetDoubleModDropData() and {}
  r11_22 = r9_22
  if r11_22 then
    r12_22 = "UI_Event_ModDrop_ChallengeRemain"
    if not r12_22 then
      ::label_334::
      r12_22 = "UI_Event_ModDrop_DropRemain"
    end
  else
    goto label_334	-- block#52 is visited secondly
  end
  r0_22.Text_TimeTipsTitle:SetText(GText(r12_22))
  local r13_22 = DataMgr.ModDropConstant and {}
  local r14_22 = r13_22.DailyFreeTicketAmount
  if r14_22 then
    r14_22 = r13_22.DailyFreeTicketAmount.ConstantValue and 0
  else
    goto label_354	-- block#57 is visited secondly
  end
  local r15_22 = r13_22.DailyModDungeonAmount
  if r15_22 then
    r15_22 = r13_22.DailyModDungeonAmount.ConstantValue and 0
  else
    goto label_362	-- block#60 is visited secondly
  end
  local r16_22 = nil	-- notice: implicit variable refs by block#[69, 70, 71]
  if r11_22 then
    r16_22 = r14_22
    if r16_22 then
      ::label_367::
      r16_22 = r15_22
    end
  else
    goto label_367	-- block#63 is visited secondly
  end
  local r17_22 = nil	-- notice: implicit variable refs by block#[69]
  if r11_22 then
    r17_22 = r10_22.EliteRushTimes
    if not r17_22 then
      r17_22 = 0
      if not r17_22 then
        ::label_376::
        r17_22 = r10_22.DropTimes
        if not r17_22 then
          r17_22 = 0
        end
      end
    end
  else
    goto label_376	-- block#67 is visited secondly
  end
  local r18_22 = math.max(0, math.floor(r16_22 - r17_22))
  local r19_22 = nil	-- notice: implicit variable refs by block#[72]
  if r18_22 <= 0 then
    r19_22 = "<Warning>0</>/" .. r16_22
    if not r19_22 then
      ::label_396::
      r19_22 = r18_22 .. "/" .. r16_22
    end
  else
    goto label_396	-- block#71 is visited secondly
  end
  r0_22.Text_Times:SetText(r19_22)
  if not r11_22 then
    local r20_22 = r13_22.EventBonus
    if r20_22 then
      r20_22 = r13_22.EventBonus.ConstantValue and 0
    else
      goto label_413	-- block#75 is visited secondly
    end
    r0_22.Text_ModUpNum:SetText("+" .. math.floor(r20_22 / 100) .. "%")
    local r22_22 = r0_22.Text_ModUpNum
    local r24_22 = nil	-- notice: implicit variable refs by block#[79]
    if r18_22 <= 0 then
      r24_22 = UE4.ESlateVisibility.Collapsed
      if not r24_22 then
        ::label_435::
        r24_22 = UE4.ESlateVisibility.SelfHitTestInvisible
      end
    else
      goto label_435	-- block#78 is visited secondly
    end
    r22_22:SetVisibility(r24_22)
  end
end
function r6_0.RefreshLevelCellContent(r0_25, r1_25)
  -- line: [846, 951] id: 25
  if not r1_25 then
    DebugPrint("ZDX DungeonId is nil")
    return 
  end
  local r2_25 = DataMgr.Dungeon[r1_25]
  r0_25.List_Prop:ClearListItems()
  r0_25.List_Monster:ClearListItems()
  r0_25.Title_Level:SetText(GText(r2_25.DungeonName))
  r0_25.Text_Summary:SetText(GText(r2_25.DungeonDes))
  r0_25.Text_Description:SetText(GText(r2_25.DungeonContent))
  r0_25.Btn_Check.Btn_Click.OnClicked:Add(r0_25, r0_25.OpenDetails)
  r0_25.Btn_Detail:SetVisibility(ESlateVisibility.Collapsed)
  if r2_25.AttributeType then
    r0_25.Type:SetVisibility(ESlateVisibility.Visible)
    r0_25.Icon_Type:SetBrushResourceObject(LoadObject(DataMgr.Attribute[r2_25.AttributeType].Icon))
  else
    r0_25.Type:SetVisibility(ESlateVisibility.Collapsed)
  end
  if not GWorld:GetAvatar() then
    return 
  end
  r0_25:PlayAnimation(r0_25.Switch_Type)
  r0_25:RefreshMonsterInfoList(r1_25)
  r0_25:RefreshRewardInfoList(r1_25)
  r0_25:RefreshBtnState()
  if r0_25.DeputeType == Const.DeputeType.NightFlightManualDepute and r0_25.CurrentTabIdx == r0_25.SpecialMonsterTabId then
    r0_25:SetNightFlightManualEliteProp(r1_25)
  end
  r0_25:SetNightFlightManualText_MoreHide(r0_25.CurrentTabIdx)
  r0_25.Btn_Qa.Btn_Click.OnClicked:Add(r0_25, r0_25.OpenIntro)
  r0_25.Panel_WarningHint:SetVisibility(ESlateVisibility.Collapsed)
  local r4_25 = r0_25.DefaultList.CurrentCharLevel
  if r4_25 <= DataMgr.Dungeon[r0_25.CurSelectedDungeonId].DungeonLevel - DataMgr.GlobalConstant.TaskWarningLevel.ConstantValue then
    r0_25.Panel_WarningHint:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  if r2_25 then
    r4_25 = r2_25.DungeonUIBG and Const.DungeonBgBluePrint
  else
    goto label_139	-- block#14 is visited secondly
  end
  if r0_25.DungeonUIBG and r0_25.DungeonUIBG == r4_25 then
    return 
  end
  r0_25.DungeonUIBG = r4_25
  local r5_25 = UIManager(r0_25):CreateWidget(r4_25)
  local r7_25 = Const.DeputeType.RegularDepute
  if r0_25.DeputeType == r7_25 then
    r0_25.Panel_Bg:ClearChildren()
  else
    r0_25.Panel_Bg:ClearChildren()
    local r6_25 = r0_25.Panel_Bg:GetChildrenCount()
    if r6_25 >= 2 then
      r0_25.Panel_Bg:RemoveChildAt(0)
    end
    if r6_25 > 0 then
      r7_25 = r0_25.Panel_Bg:GetChildAt(0) and nil
    else
      goto label_185	-- block#24 is visited secondly
    end
    if r7_25 then
      r0_25:AddDelayFrameFunc(function()
        -- line: [918, 922] id: 26
        if r7_25 and r7_25:IsValid() then
          r0_25.Panel_Bg:RemoveChild(r7_25)
        end
      end, 8, "RemoveOldDungeonBG")
    end
    -- close: r6_25
  end
  if r5_25 then
    r0_25.Panel_Bg:AddChild(r5_25)
    if r5_25.Loop then
      r5_25:PlayAnimation(r5_25.Loop, 0, 0)
    end
    r5_25.Slot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
    r5_25.Slot:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
    if r5_25.In then
      if r0_25.DeputeType == Const.DeputeType.RegularDepute and r0_25.FirstEnter then
        r5_25:PlayAnimation(r5_25.In)
      elseif r0_25.DeputeType ~= Const.DeputeType.RegularDepute then
        r5_25:PlayAnimation(r5_25.In)
      end
    end
    if r0_25.DeputeType == Const.DeputeType.RegularDepute then
      r0_25.FirstEnter = false
    end
  else
    DebugPrint("SL DungeonUIBG Create Failed")
  end
end
function r6_0.CheckDungeonType(r0_27, r1_27)
  -- line: [953, 981] id: 27
  local r2_27 = DataMgr.DoubleModDrop and DataMgr.DoubleModDrop[CommonConst.DoubleModDropEventID]
  if not r1_27 or not r2_27 then
    return false, false
  end
  local r3_27 = r2_27.ModDungeonId and {}
  local r4_27 = r2_27.EliteRushDungeonId and {}
  local r5_27 = false
  for r10_27, r11_27 in pairs(r3_27) do
    if r1_27 == r11_27 then
      r5_27 = true
      break
    end
  end
  -- close: r6_27
  local r6_27 = false
  if not r5_27 then
    for r11_27, r12_27 in pairs(r4_27) do
      if r1_27 == r12_27 then
        r6_27 = true
        break
      end
    end
    -- close: r7_27
  end
  return r5_27, r6_27
end
function r6_0.OpenRewardDetails(r0_28)
  -- line: [984, 997] id: 28
  AudioManager(r0_28):PlayUISound(r0_28, "event:/ui/common/tip_show_click", nil, nil)
  local r2_28 = UIManager(r0_28):ShowCommonPopupUI(100156, {
    RewardList = r0_28.RewardList,
    CloseBtnCallbackFunction = function()
      -- line: [990, 992] id: 29
      r0_28:SelectCellFocus()
    end,
    AutoFocus = true,
    Checked = r0_28.Com_CheckBox_LeftText:IsChecked(),
  })
end
function r6_0.OpenCommanderDetails(r0_30)
  -- line: [1000, 1007] id: 30
  local r2_30 = UIManager(r0_30):ShowCommonPopupUI(100155, {
    DungeonId = r0_30.CurSelectedDungeonId,
    Parent = r0_30,
    AutoFocus = true,
  })
end
function r6_0.RefreshRewardInfoList(r0_31, r1_31)
  -- line: [1011, 1129] id: 31
  assert(DataMgr.Dungeon[r1_31], "副本信息不存在:" .. r1_31)
  local r2_31 = GWorld:GetAvatar()
  if not r2_31 then
    return 
  end
  local r3_31 = nil
  if not r2_31.Dungeons[r1_31] or not r2_31.Dungeons[r1_31].IsPass then
    local r4_31 = DataMgr.Reward[DataMgr.Dungeon[r1_31].FirstCompleteReward]
    if r4_31 then
      r3_31 = {}
      local r5_31 = r4_31.Id and {}
      local r6_31 = r4_31.Count and {}
      local r7_31 = r4_31.Type and {}
      for r11_31 = 1, #r5_31, 1 do
        local r12_31 = r5_31[r11_31]
        table.insert(r3_31, {
          Id = r12_31,
          Type = r7_31[r11_31],
          ItemCount = RewardUtils:GetCount(r6_31[r11_31]),
          Icon = ItemUtils.GetItemIcon(r12_31, r7_31[r11_31]),
          Rarity = ItemUtils.GetItemRarity(r12_31, r7_31[r11_31]),
          bFirst = true,
          DropType = "FirstReward",
        })
      end
    end
  end
  local r4_31 = RewardUtils:GetRewardViewInfoById(DataMgr.Dungeon[r1_31].DungeonRewardView)
  local function r5_31(r0_32, r1_32)
    -- line: [1047, 1058] id: 32
    if r0_32.Rarity == r1_32.Rarity then
      if r7_0[r0_32.Type] and r7_0[r1_32.Type] then
        if r7_0[r0_32.Type] == r7_0[r1_32.Type] then
          return r0_32.Id < r1_32.Id
        end
        return r7_0[r0_32.Type] < r7_0[r1_32.Type]
      end
      return r0_32.Id < r1_32.Id
    end
    return r1_32.Rarity < r0_32.Rarity
  end
  if r3_31 then
    table.sort(r3_31, r5_31)
  end
  table.sort(r4_31, r5_31)
  r0_31.RewardList = {}
  if r3_31 then
    for r10_31, r11_31 in ipairs(r3_31) do
      table.insert(r0_31.RewardList, r11_31)
    end
    -- close: r6_31
  end
  for r10_31, r11_31 in ipairs(r4_31) do
    table.insert(r0_31.RewardList, r11_31)
  end
  -- close: r6_31
  local r6_31, r7_31 = r0_31:IsInTimeRange(r1_31)
  if r6_31 and r7_31 then
    local r8_31 = RewardUtils:GetRewardViewInfoById(r7_31.RewardView)
    table.sort(r8_31, r5_31)
    for r13_31, r14_31 in ipairs(r8_31) do
      table.insert(r0_31.RewardList, r14_31)
    end
    -- close: r9_31
  end
  local r8_31 = r0_31.Com_CheckBox_LeftText:IsChecked()
  for r13_31, r14_31 in ipairs(r0_31.RewardList) do
    local r15_31 = NewObject(UIUtils.GetCommonItemContentClass())
    r15_31.Id = r14_31.Id
    r15_31.Icon = ItemUtils.GetItemIconPath(r14_31.Id, r14_31.Type)
    r15_31.ParentWidget = r0_31
    r15_31.ItemType = r14_31.Type
    r15_31.Rarity = r14_31.Rarity and 1
    r15_31.IsShowDetails = true
    r15_31.UIName = "DeputeDetail"
    if r14_31.bFirst then
      r15_31.BonusType = 2
    end
    local r16_31 = r14_31.ItemCount and nil
    if r14_31.Quantity then
      if #r14_31.Quantity > 1 then
        r15_31.MaxCount = r14_31.Quantity[2]
      end
      r16_31 = r14_31.Quantity[1] and nil
    end
    if r16_31 then
      if r8_31 and not r14_31.bFirst then
        r15_31.Count = r16_31 * 2
      else
        r15_31.Count = r16_31
      end
    end
    r0_31.List_Prop:AddItem(r15_31)
  end
  -- close: r9_31
  if r0_31.List_Prop:GetNumItems() == 0 then
    r0_31.List_Prop:AddItem(r0_31:CreateAndAddEmptyItem())
  end
  r0_31.List_Prop:RequestFillEmptyContent()
end
function r6_0.IsInTimeRange(r0_33, r1_33)
  -- line: [1132, 1149] id: 33
  local r2_33 = os.time()
  local r3_33 = DataMgr.EventDungeonReward[r1_33]
  if not r3_33 then
    return false
  end
  for r8_33, r9_33 in pairs(r3_33) do
    if type(r9_33) == "table" then
      for r14_33, r15_33 in pairs(r9_33) do
        if r8_33 <= r2_33 and r2_33 <= r14_33 then
          return true, r15_33
        end
      end
      -- close: r10_33
    end
  end
  -- close: r4_33
  return false
end
function r6_0.CreateEventAndAddEmptyItem(r0_34)
  -- line: [1151, 1155] id: 34
  local r1_34 = NewObject(UIUtils.GetCommonItemContentClass())
  r1_34.IsEmpty = true
  return r1_34
end
function r6_0.CreateAndAddEmptyItem(r0_35)
  -- line: [1157, 1161] id: 35
  local r1_35 = NewObject(UIUtils.GetCommonItemContentClass())
  r1_35.Id = 0
  return r1_35
end
function r6_0.OnStuffMenuOpenChanged(r0_36, r1_36)
  -- line: [1163, 1182] id: 36
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return 
  end
  r0_36.MenuOpen = r1_36
  if r1_36 then
    r0_36.Button_Multi:SetPCVisibility(true)
    r0_36.Button_Solo:SetPCVisibility(true)
    r0_36.Button_DoubleMod:SetPCVisibility(true)
    r0_36:UpdatKeyDisplay("")
    local r2_36 = r0_36.Switch_Details_Icon
    local r4_36 = r0_36.CurrentTabIdx
    if r4_36 == r0_36.ObtainTabId then
      r4_36 = 0 and 1
    else
      goto label_35	-- block#5 is visited secondly
    end
    r2_36:SetActiveWidgetIndex(r4_36)
  else
    r0_36.Button_Multi:SetPCVisibility(false)
    r0_36.Button_Solo:SetPCVisibility(false)
    r0_36.Button_DoubleMod:SetPCVisibility(true)
    r0_36:UpdatKeyDisplay("RewardWidget")
    r0_36.List_Prop:SetFocus()
    r0_36.Switch_Details_Icon:SetActiveWidgetIndex(2)
  end
end
function r6_0.RefreshDeputeEvent(r0_37, r1_37)
  -- line: [1186, 1222] id: 37
  local r2_37 = {}
  for r7_37, r8_37 in pairs(DataMgr.DungeonRandomEvent) do
    for r13_37, r14_37 in ipairs(r8_37.Dungeons) do
      if r14_37 == r1_37 then
        r2_37[r8_37.EventType] = true
        break
      end
    end
    -- close: r9_37
  end
  -- close: r3_37
  local r3_37 = {}
  for r8_37, r9_37 in pairs(r2_37) do
    table.insert(r3_37, r8_37)
  end
  -- close: r4_37
  r0_37.List_Event:ClearListItems()
  for r7_37 = 1, #r3_37, 1 do
    local r8_37 = r3_37[r7_37]
    local r9_37 = DataMgr.DungeonRandomEventType[r8_37] and DataMgr.DungeonRandomEventType[r8_37].Icon
    local r10_37 = DataMgr.DungeonRandomEventType[r8_37] and DataMgr.DungeonRandomEventType[r8_37].Des
    local r11_37 = NewObject(UIUtils.GetCommonItemContentClass())
    r11_37.Id = r7_37
    r11_37.Icon = r9_37
    r11_37.Des = r10_37
    r0_37.List_Event:AddItem(r11_37)
  end
  if #r3_37 > 0 then
    r0_37.List_Event:RequestFillEmptyContent()
  end
end
function r6_0.OnClickedCell(r0_38, r1_38)
  -- line: [1224, 1231] id: 38
  if r0_38.SelectLvTabCell ~= nil then
    r0_38.SelectLvTabCell:OnCellUnSelect()
  end
  r0_38.SelectLvTabCell = r1_38
  r1_38:SelectCell()
end
function r6_0.RefreshMonsterInfoList(r0_39, r1_39)
  -- line: [1235, 1276] id: 39
  local r2_39 = DataMgr.Dungeon[r1_39]
  if not r2_39 or not r2_39.DungeonMonsters or #r2_39.DungeonMonsters == 0 then
    DebugPrint("ZDX DungeonMonster is nil")
    return 
  end
  local r3_39 = r0_0.DeepCopy(r2_39.DungeonMonsters)
  table.sort(r3_39, r1_0.CompareMonsters)
  r0_39.MonsterWeaknessIcon = {}
  r0_39:InitMonsterWeakness(r1_39)
  local r4_39 = UE4.UGameplayStatics.GetGameState(r0_39)
  for r9_39, r10_39 in ipairs(r3_39) do
    if DataMgr.Monster[r10_39] and r4_39.IsUnitRelease(r10_39) then
      local r12_39 = NewObject(r0_39.MonsterItemContentClass)
      r12_39.ParentWidget = r0_39
      r12_39.MonsterId = r10_39
      r12_39.DisableSelect = true
      r12_39.SoundEvent = "event:/ui/common/click_mid"
      r12_39.WeaknessIcon = r0_39.MonsterWeaknessIcon[r10_39]
      r0_39.List_Monster:AddItem(r12_39)
    end
  end
  -- close: r5_39
end
function r6_0.InitMonsterWeakness(r0_40, r1_40)
  -- line: [1279, 1309] id: 40
  assert(r1_40, "dungeon id is nil")
  local r2_40 = DataMgr.Dungeon[r1_40]
  assert(r2_40, string.format("dungeon id [%d] is wrong, cant find dungeonInfo", r1_40))
  local r4_40 = r2_40.DungeonMonsters
  if r2_40.MonsterBuff then
    for r9_40, r10_40 in ipairs(r4_40) do
      if type(r10_40) == "number" then
        for r16_40, r17_40 in ipairs(r1_0.GetRealMonsterBuffs(r1_40, r10_40)) do
          local r18_40 = DataMgr.Buff[r17_40]
          if r18_40 and r18_40.WeaknessType and not not r18_40.WeaknessType then
            local r20_40 = DataMgr.DamageType[r18_40.WeaknessType].WeaknessIcon
            if r20_40 then
              r0_40.MonsterWeaknessIcon[r10_40] = r0_40.MonsterWeaknessIcon[r10_40] and {}
              r0_40.MonsterWeaknessIcon[r10_40][r20_40] = true
            end
          end
        end
        -- close: r12_40
      end
    end
    -- close: r5_40
  end
end
function r6_0.ShowDialogChar(r0_41)
  -- line: [1312, 1346] id: 41
  -- notice: unreachable block#19
  local r1_41 = GWorld:GetAvatar()
  if not r1_41 then
    return 
  end
  if not r1_41:IsInTeam() and r1_41.Chars[r1_41.CurrentChar] and r1_41.Chars[r1_41.CurrentChar].CharId == 3201 and DataMgr.Dungeon[r0_41.CurSelectedDungeonId].DungeonType == "Hijack" then
    UIManager(r0_41):ShowCommonPopupUI(100106, {
      RightCallbackObj = r0_41,
      RightCallbackFunction = r0_41.OnClickSolo,
    }, r0_41)
  elseif r0_41.DeputeType == Const.DeputeType.DeputeWeekly and r0_41.WeeklyDungeonRewardLeft <= 0 then
    local r3_41 = r5_0:Get("Is_DeputeWeeklyNum", true) and false
    local r4_41 = r0_41:CheckNeedShowWindow()
    if r3_41 and r4_41 then
      r0_41:OnClickSolo()
    else
      r0_41:ShowConfirmWindow(true)
    end
  else
    if r0_41.DeputeType == Const.DeputeType.DeputeWeekly then
      local r4_41 = r0_41.CurSelectedDungeonId
      local r3_41 = r1_41.Dungeons[r4_41]
      if r3_41 then
        r4_41 = r3_41.PassCount == 1
      else
        goto label_86	-- block#18 is visited secondly
      end
      if not r4_41 then
        r0_41:ShowFirstDeputeWeeklyConfirmWindow(true)
      else
        r0_41:OnClickSolo()
      end
      return 
    end
    r0_41:OnClickSolo()
  end
end
function r6_0.ShowFirstDeputeWeeklyConfirmWindow(r0_42, r1_42)
  -- line: [1349, 1364] id: 42
  UE4.UGameplayStatics.GetGameInstance(r0_42):GetGameUIManager():ShowCommonPopupUI(100238, {
    RightCallbackFunction = function(r0_43, r1_43)
      -- line: [1351, 1358] id: 43
      if r1_42 then
        r0_42:OnClickSolo()
      else
        r0_42:TryEnterMultiDungeon()
      end
    end,
  }, r0_42)
end
function r6_0.ShowConfirmWindow(r0_44, r1_44)
  -- line: [1366, 1381] id: 44
  UE4.UGameplayStatics.GetGameInstance(r0_44):GetGameUIManager():ShowCommonPopupUI(100211, {
    RightCallbackFunction = function(r0_45, r1_45)
      -- line: [1368, 1375] id: 45
      if r1_44 then
        r0_44:OnClickSolo()
      else
        r0_44:TryEnterMultiDungeon()
      end
      r0_44:UpdateSelectedInfo(r1_45)
    end,
    LeftCallbackFunction = function(r0_46, r1_46)
      -- line: [1376, 1376] id: 46
      r0_44:UpdateSelectedInfo(r1_46)
    end,
  }, r0_44)
end
function r6_0.UpdateSelectedInfo(r0_47, r1_47)
  -- line: [1383, 1388] id: 47
  local r3_47 = r4_0.NowTime()
  r5_0:Set("Is_DeputeWeeklyNum", r1_47.SelectHint.IsSelected, true)
  r5_0:Set("IsWeeklyDungeonTimestamp", r3_47, true)
end
function r6_0.CheckNeedShowWindow(r0_48)
  -- line: [1391, 1398] id: 48
  local r1_48 = false
  if r4_0 then
    r1_48 = r4_0.IsTimestampInCurrentWeek(r5_0:Get("IsWeeklyDungeonTimestamp", true))
  end
  return r1_48
end
function r6_0.OnClickSolo(r0_49)
  -- line: [1406, 1492] id: 49
  r0_49.IsSoloStart = true
  r0_49.MultiWalnut = false
  r0_49.MultiTicket = false
  if not r0_49.CurSelectedDungeonId then
    DebugPrint("ZDX CurSelectedDungeonId is nil")
    return 
  end
  if not PageJumpUtils:CheckDungeonCondition(DataMgr.Dungeon[r0_49.CurSelectedDungeonId].Condition) then
    UIManager(r0_49):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Tosat_Level_Locked"))
    return 
  end
  if r0_49:IsAnimationPlaying(r0_49.Out_Loading) then
    return 
  end
  local r1_49 = DataMgr.Dungeon[r0_49.CurSelectedDungeonId]
  if r1_49.TicketId and #r1_49.TicketId ~= 0 or r1_49.NoTicketEnter then
    local r2_49 = GWorld:GetAvatar()
    if not r2_49 then
      return 
    end
    local r3_49 = r2_49:IsInTeam()
    if r0_49.DeputeType == Const.DeputeType.NightFlightManualDepute then
      local r4_49 = r0_49.IsDoubleModOpen and r0_49.ContinuousCombat
      if not r3_49 then
        if r4_49 then
          UIManager(r0_49):ShowCommonPopupUI(100284, {
            RightCallbackObj = r0_49,
            RightCallbackFunction = r0_49.OpenTicketDialog,
          }, r0_49)
        else
          r0_49:OpenTicketDialog()
        end
        return 
      end
    elseif not r3_49 then
      r0_49:OpenTicketDialog()
      return 
    end
  end
  if r0_49.DungeonCost and r0_49.MyActionPoint < r0_49.DungeonCost then
    UIUtils.ShowActionRecover(r0_49)
    return 
  end
  local r2_49 = GWorld:GetAvatar()
  if r2_49:IsInTeam() then
    r0_49.IsSoloStart = false
    TeamController:GetModel().bPressedSolo = true
    if r0_49.WalnutId then
      TeamController:GetModel().WalnutId = r0_49.WalnutId
    end
    r0_49:TryEnterDungeon(r2_49, r0_49.CurSelectedDungeonId, CommonConst.DungeonNetMode.Standalone, function(r0_50, ...)
      -- line: [1471, 1479] id: 50
      r0_49:BlockAllUIInput(false)
      if r0_49.HandleEnterDungeonRetCode(r0_50, ...) then
        UIManager(r0_49):LoadUINew("DungeonMatchTimingBar", r0_49.CurSelectedDungeonId, Const.DUNGEON_MATCH_BAR_STATE.SPONSOR_WAITING_CONFIRM, false)
      end
    end)
    r0_49:RefreshBtnState()
  else
    if r1_49.IsWalnutDungeon then
      local r4_49 = UIManager(r0_49):LoadUINew("WalnutChoice", CommonConst.WalnutUser.Depute, r0_49.CurSelectedDungeonId)
      if r0_49.WalnutId then
        r4_49:SelectWalnutById(r0_49.WalnutId)
      end
      return 
    end
    r0_49:EnterStandalone()
  end
end
function r6_0.OnClickMulti(r0_51)
  -- line: [1495, 1574] id: 51
  -- notice: unreachable block#14
  r0_51.IsSoloStart = false
  r0_51.MultiWalnut = false
  r0_51.MultiTicket = false
  if not r0_51.CurSelectedDungeonId then
    DebugPrint("ZDX CurSelectedDungeonId is nil")
    return 
  end
  local r1_51 = GWorld:GetAvatar()
  assert(r1_51, "NO AVATAR")
  if r0_51.DeputeType == Const.DeputeType.DeputeWeekly and r0_51.WeeklyDungeonRewardLeft <= 0 then
    local r2_51 = r5_0:Get("Is_DeputeWeeklyNum", true) and false
    local r3_51 = r0_51:CheckNeedShowWindow()
    if r2_51 and r3_51 then
      r0_51:TryEnterMultiDungeon()
      return 
    else
      r0_51:ShowConfirmWindow(false)
      return 
    end
  elseif r0_51.DeputeType == Const.DeputeType.DeputeWeekly then
    local r3_51 = r0_51.CurSelectedDungeonId
    local r2_51 = r1_51.Dungeons[r3_51]
    if r2_51 then
      r3_51 = r2_51.PassCount == 1
    else
      goto label_63	-- block#13 is visited secondly
    end
    if not r3_51 then
      r0_51:ShowFirstDeputeWeeklyConfirmWindow(false)
    else
      r0_51:TryEnterMultiDungeon()
    end
    return 
  end
  local r2_51 = DataMgr.Dungeon[r0_51.CurSelectedDungeonId]
  if (r2_51.TicketId and #r2_51.TicketId ~= 0 or r2_51.NoTicketEnter) and not r1_51:IsInTeam() then
    r0_51.MultiTicket = true
    r0_51:OpenTicketDialog()
    return 
  end
  if not r1_51:CheckUIUnlocked("Match") then
    UIManager(r0_51):ShowUITip(UIConst.Tip_CommonToast, GText(DataMgr.UIUnlockRule.Match.UIUnlockDesc))
    return 
  end
  if not PageJumpUtils:CheckDungeonCondition(DataMgr.Dungeon[r0_51.CurSelectedDungeonId].Condition) then
    UIManager(r0_51):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Tosat_Level_Locked"))
    return 
  end
  if r0_51:IsAnimationPlaying(r0_51.Out_Loading) then
    return 
  end
  if r0_51.DungeonCost and r0_51.MyActionPoint < r0_51.DungeonCost then
    UIUtils.ShowActionRecover(r0_51)
    return 
  end
  local r3_51 = DataMgr.Dungeon[r0_51.CurSelectedDungeonId]
  if not r1_51:IsInTeam() and r3_51.IsWalnutDungeon then
    r0_51.MultiWalnut = true
    local r5_51 = UIManager(r0_51):LoadUINew("WalnutChoice", CommonConst.WalnutUser.Depute, r0_51.CurSelectedDungeonId)
    if r0_51.WalnutId then
      r5_51:SelectWalnutById(r0_51.WalnutId)
    end
    return 
  end
  r0_51:TryEnterMultiDungeon()
end
function r6_0.TryEnterMultiDungeon(r0_52)
  -- line: [1576, 1604] id: 52
  TeamController:GetModel().bPressedMulti = true
  local r1_52 = GWorld:GetAvatar()
  assert(r1_52, "NO AVATAR")
  r0_52:TryEnterDungeon(r1_52, r0_52.CurSelectedDungeonId, CommonConst.DungeonNetMode.DedicatedServer, function(r0_53, ...)
    -- line: [1582, 1602] id: 53
    local r1_53 = r0_52.HandleEnterDungeonRetCode(r0_53, ...)
    DebugPrint("gmy@WBP_Play_DeputeDetail_C M:OnClickMulti", r1_53)
    r0_52:BlockAllUIInput(false)
    if r1_53 then
      if r1_52:IsInTeam() then
        UIManager(r0_52):LoadUINew("DungeonMatchTimingBar", r0_52.CurSelectedDungeonId, Const.DUNGEON_MATCH_BAR_STATE.SPONSOR_WAITING_CONFIRM, true)
      else
        UIManager(r0_52):LoadUINew("DungeonMatchTimingBar", r0_52.CurSelectedDungeonId, Const.DUNGEON_MATCH_BAR_STATE.WAITING_MATCHING_WITH_CANCEL, true)
      end
    end
  end, r0_52.TicketId)
  r0_52:RefreshBtnState()
end
function r6_0.EnterWalnutDungeon(r0_54)
  -- line: [1609, 1616] id: 54
  if r0_54.IsSoloStart then
    r0_54:EnterStandalone()
  end
  if r0_54.MultiWalnut then
    r0_54:TryEnterMultiDungeon()
  end
end
function r6_0.EnterTicketDungeon(r0_55, r1_55)
  -- line: [1619, 1629] id: 55
  if r0_55.IsSoloStart then
    r0_55:EnterStandalone(r1_55)
  end
  if r0_55.MultiTicket then
    if r1_55 ~= -1 then
      r0_55.TicketId = r1_55
    end
    r0_55:TryEnterMultiDungeon()
  end
end
function r6_0.EnterStandalone(r0_56, r1_56)
  -- line: [1631, 1670] id: 56
  if r0_56.DungeonCost and r0_56.MyActionPoint < r0_56.DungeonCost then
    UIUtils.ShowActionRecover(r0_56)
    return 
  end
  local r2_56 = GWorld:GetAvatar()
  if r1_56 ~= -1 then
    r0_56.TicketId = r1_56
  end
  local r3_56 = UIManager(r0_56):GetUI("StyleOfPlay")
  AudioManager(r0_56):PlayUISound(r0_56, "event:/ui/common/map_click_enter_level", nil, nil)
  local r4_56 = GWorld:GetAvatar()
  if r4_56 then
    r0_56:TryEnterDungeon(r4_56, r0_56.CurSelectedDungeonId, CommonConst.DungeonNetMode.Standalone, function(r0_57, ...)
      -- line: [1649, 1659] id: 57
      r0_56:BlockAllUIInput(false)
      if not r0_56.HandleEnterDungeonRetCode(r0_57, ...) then
        local r2_57 = UIManager(r0_56):GetUIObj("StyleOfPlay")
        if r2_57 then
          r2_57:PlayAnimation(r2_57.In)
        end
        r0_56:PlayAnimation(r0_56.In)
      end
    end, r0_56.TicketId)
    r0_56:BlockAllUIInput(true)
    r0_56:AddTimer(10, function()
      -- line: [1661, 1665] id: 58
      if r0_56 and r0_56:IsAllUIInputBlocked() then
        r0_56:BlockAllUIInput(false)
      end
    end)
  else
    WorldTravelSubsystem(r0_56):ChangeDungeonByDungeonId(r0_56.CurSelectedDungeonId, CommonConst.DungeonNetMode.Standalone)
  end
end
function r6_0.OnBtnCheckClicked(r0_59)
  -- line: [1673, 1677] id: 59
  if not r0_59:IsAnimationPlaying(r0_59.Out) then
    UIManager(r0_59):LoadUINew("MonsterDetailInfo", r0_59.CurSelectedDungeonId, r0_59)
  end
end
function r6_0.SelectMonsterInfoItem(r0_60, r1_60)
  -- line: [1680, 1682] id: 60
  UIManager(r0_60):LoadUINew("MonsterDetailInfo", r0_60.CurSelectedDungeonId, r0_60, r1_60)
end
function r6_0.SetElementIcon(r0_61, r1_61)
  -- line: [1686, 1701] id: 61
  if r1_61 then
    r0_61.Type:SetVisibility(ESlateVisibility.Visible)
  else
    r0_61.Type:SetVisibility(ESlateVisibility.Collapsed)
    return 
  end
  r0_61.Icon_Type:SetBrushResourceObject(LoadObject(DataMgr.Attribute[r1_61].Icon))
  r0_61.Stats_ListView:ClearListItems()
  local r4_61, r5_61 = UIUtils.GetAllElementTypes()
  for r10_61, r11_61 in ipairs(r4_61) do
    r0_61.Stats_ListView:AddItem(r0_61:NewElmtIconContent(r11_61, r5_61[r10_61], r11_61 == r1_61))
  end
  -- close: r6_61
end
function r6_0.NewElmtIconContent(r0_62, r1_62, r2_62, r3_62)
  -- line: [1703, 1710] id: 62
  local r4_62 = NewObject(r0_62.AttributeContentClass)
  r4_62.Icon = LoadObject(DataMgr.Attribute[r1_62].Icon)
  r4_62.Text = GText(r2_62)
  r4_62.IsSelected = r3_62
  return r4_62
end
function r6_0.OnElementEntryInitialized(r0_63, r1_63, r2_63)
  -- line: [1712, 1720] id: 63
  if r1_63.IsSelected then
    r2_63.Bg_On:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    r2_63.Bg_On:SetVisibility(ESlateVisibility.Collapsed)
  end
  r2_63.Image_Attribute:SetBrushResourceObject(r1_63.Icon)
  r2_63.Stats_Name:SetText(r1_63.Text)
end
function r6_0.OnButtonAttibuteHovered(r0_64)
  -- line: [1722, 1727] id: 64
  r0_64.IsOpenAttibute = true
  r0_64:StopAnimation(r0_64.Tips_In)
  r0_64:PlayAnimation(r0_64.Tips_In)
end
function r6_0.OnButtonAttibuteUnhovered(r0_65)
  -- line: [1729, 1734] id: 65
  r0_65.IsOpenAttibute = false
  r0_65:StopAnimation(r0_65.Tips_In)
  r0_65:PlayAnimationReverse(r0_65.Tips_In)
end
function r6_0.OnUserScrolled(r0_66)
  -- line: [1736, 1739] id: 66
  if r0_0.GetDeviceTypeByPlatformName() == "Mobile" then
    return 
  end
  UIUtils.UpdateScrollBoxArrow(r0_66.ScrollBox_List, r0_66.List_ArrowTop, r0_66.List_ArrowBottom)
end
function r6_0.OpenDetails(r0_67)
  -- line: [1741, 1749] id: 67
  UIManager(r0_67):LoadUINew("ItemInformation", {
    Name = DataMgr.Dungeon[r0_67.CurSelectedDungeonId].DungeonName,
    Desc = DataMgr.Dungeon[r0_67.CurSelectedDungeonId].DungeonContent,
  }, "LevelDatail")
end
function r6_0.OnReturnKeyDown(r0_68)
  -- line: [1752, 1762] id: 68
  if not UIManager(r0_68):GetUIObj("StyleOfPlay") then
    return 
  end
  AudioManager(r0_68):SetEventSoundParam(r0_68, "Play_DeputeDetail", {
    ToEnd = 1,
  })
  if not r0_68:IsAnimationPlaying(r0_68.Out) then
    r0_68:SetVisibility(ESlateVisibility.HitTestInvisible)
    r0_68:PlayAnimation(r0_68.Out)
  end
end
function r6_0.OnAnimationFinished(r0_69, r1_69)
  -- line: [1764, 1807] id: 69
  if r1_69 == r0_69.Out then
    r0_69:RemoveFromParent()
    local r2_69 = UIManager(r0_69):GetUIObj("StyleOfPlay")
    r2_69.SubUI[r0_69.CurTabId] = nil
    if r0_69.IsFromJump then
      if r2_69.IsHome then
        r2_69:SwitchCamera()
        r2_69:PlayNPCAnim(21000502)
      else
        UIManager(r0_69):SwitchUINpcCamera(false, "StyleOfPlay", r2_69.NpcId, {
          bDestroyNpc = true,
          IsHaveInOutAnim = r2_69.IsNeedPlayNpcAnim,
        })
      end
      r2_69:OnReturnKeyDown()
    else
      r2_69:OpenSubUI("NewDeputeRoot")
    end
  end
end
function r6_0.RefreshOpInfoByInputDevice(r0_70, r1_70, r2_70)
  -- line: [1809, 1833] id: 70
  if r1_70 == ECommonInputType.Touch then
    return 
  end
  local r3_70 = r1_70 == ECommonInputType.MouseAndKeyboard
  if not r3_70 or not 0 then
    local r4_70 = 1
  end
  if not r3_70 and (r0_70:HasFocusedDescendants() or r0_70:HasAnyUserFocus()) then
    local r5_70 = r0_70.DefaultList:GetVisibility() == ESlateVisibility.SelfHitTestInvisible
    local r6_70 = not r0_70.DefaultList.IsShow
    if r5_70 and r6_70 or not r5_70 then
      r0_70:SelectCellFocus()
    end
  elseif r0_70.Image_Select and r0_70.Image_Select:GetRenderOpacity() > 0 then
    r0_70:PlayAnimation(r0_70.UnHover)
  end
  r0_70:UpdateUIStyleInPlatform(r3_70)
  r0_70.Super.RefreshOpInfoByInputDevice(r0_70, r1_70, r2_70)
end
function r6_0.UpdatKeyDisplay(r0_71, r1_71)
  -- line: [1835, 2023] id: 71
  if r0_0.GetDeviceTypeByPlatformName(r0_71) == "Mobile" then
    return 
  end
  local r2_71 = UIManager(r0_71):GetUIObj("StyleOfPlay")
  if not r2_71 then
    return 
  end
  if r0_71.DefaultList:GetVisibility() == ESlateVisibility.SelfHitTestInvisible and r0_71.DefaultList.IsShow then
    return 
  end
  r0_71.FocusTypeName = r1_71
  if r1_71 == "RewardWidget" then
    r2_71:UpdateOtherPageTab({
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = r0_71,
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
            ClickCallback = r0_71.OnReturnKeyDown,
            Owner = r0_71,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = r0_71,
          }
        },
        Desc = GText("UI_BACK"),
      }
    })
    r0_71:UpdateUIStyleInPlatform(true)
    r2_71.ComTab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r2_71.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_71.Tab_Info:UpdateUIStyleInPlatform(true)
    if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
      r0_71.Button_Multi:SetPCVisibility(true)
      r0_71.Button_Solo:SetPCVisibility(true)
      r0_71.Button_DoubleMod:SetPCVisibility(true)
    end
    r0_71.DefaultList:ApplyPcUiLayout()
  elseif r1_71 == "SelfWidget" then
    local r3_71 = {}
    if r0_71.Panel_Type:GetVisibility() == ESlateVisibility.Visible then
      r3_71 = {
        {
          GamePadInfoList = {
            {
              Type = "Add",
            }
          },
          Desc = GText("UI_CTL_CheckProperty"),
          bLongPress = false,
        },
        {
          GamePadInfoList = {
            {
              Type = "Add",
            }
          },
          Desc = GText("UI_CTL_DeputeInfo"),
          bLongPress = false,
        }
      }
    else
      r3_71 = {
        {
          GamePadInfoList = {
            {
              Type = "Add",
            }
          },
          Desc = GText("UI_CTL_DeputeInfo"),
          bLongPress = false,
        }
      }
    end
    table.insert(r3_71, {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = r0_71.OnReturnKeyDown,
          Owner = r0_71,
        }
      },
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
          Owner = r0_71,
        }
      },
      Desc = GText("UI_BACK"),
    })
    r2_71:UpdateOtherPageTab(r3_71)
    if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
      r0_71:UpdateUIStyleInPlatform(false)
      r2_71.ComTab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      r2_71.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      r0_71.Tab_Info:UpdateUIStyleInPlatform(true)
      r0_71.Button_Multi:SetPCVisibility(false)
      r0_71.Button_Solo:SetPCVisibility(false)
      r0_71.Button_DoubleMod:SetPCVisibility(false)
      r0_71.IsFocusProp = false
      r0_71.IsFocus_Monster = false
      r0_71.IsFocusEliteProp = false
      r0_71.DefaultList:InitWidgetInfoInGamePad()
    end
  elseif r1_71 == "EventWidget" then
    r2_71:UpdateOtherPageTab({
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = r0_71,
          }
        },
        Desc = GText("UI_BACK"),
        bLongPress = false,
      }
    })
    r0_71:UpdateUIStyleInPlatform(true)
    r2_71.ComTab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r2_71.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
  elseif r1_71 == "EliteProp" then
    r2_71:UpdateOtherPageTab({
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "LS",
            Owner = r0_71,
          }
        },
        Desc = GText("UI_Controller_CheckReward"),
        bLongPress = false,
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = r0_71.OnReturnKeyDown,
            Owner = r0_71,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = r0_71,
          }
        },
        Desc = GText("UI_BACK"),
      }
    })
    r0_71:UpdateUIStyleInPlatform(true)
    r2_71.ComTab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r2_71.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
  elseif r1_71 == "MenuAnchor" then
    r2_71:UpdateOtherPageTab({
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = r0_71,
          }
        },
        Desc = GText("UI_CTL_CloseTips"),
        bLongPress = false,
      }
    })
    r0_71:UpdateUIStyleInPlatform(true)
    r2_71.ComTab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r2_71.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    r2_71:UpdateOtherPageTab({})
    r0_71:UpdateUIStyleInPlatform(true)
    r2_71.ComTab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r2_71.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_71.Tab_Info:UpdateUIStyleInPlatform(false)
  end
end
function r6_0.SetPanelDetailsVis(r0_72, r1_72)
  -- line: [2025, 2027] id: 72
  r0_72.Panel_Details:SetVisibility(r1_72)
end
function r6_0.UpdateUIStyleInPlatform(r0_73, r1_73)
  -- line: [2029, 2105] id: 73
  if r0_0.GetDeviceTypeByPlatformName(r0_73) == "Mobile" then
    return 
  end
  if r1_73 then
    r0_73.Key_Check_GamePad:SetVisibility(ESlateVisibility.Collapsed)
    r0_73.Com_Key_More:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_73.Key_Qa_GamePad:SetVisibility(ESlateVisibility.Collapsed)
    r0_73.Com_CheckBox_LeftText.Com_KeyImg:SetVisibility(ESlateVisibility.Collapsed)
    r0_73.Key_LT:SetVisibility(ESlateVisibility.Collapsed)
    r0_73.Key_LR:SetVisibility(ESlateVisibility.Collapsed)
    r0_73.Btn_Qa:SetVisibility(ESlateVisibility.Visible)
    local r4_73 = r0_73:IsShowKeyMore()
    if r4_73 then
      r4_73 = ESlateVisibility.SelfHitTestInvisible and ESlateVisibility.Collapsed
    else
      goto label_54	-- block#5 is visited secondly
    end
    r0_73:SetPanelDetailsVis(r4_73)
    if r0_73.List_Type:GetVisibility() == ESlateVisibility.Visible then
      r0_73.Key_Qa_GamePad:SetVisibility(ESlateVisibility.Collapsed)
    end
  else
    if r0_73.List_Type:GetVisibility() == ESlateVisibility.Visible then
      r0_73.Btn_Qa:SetVisibility(ESlateVisibility.Collapsed)
      r0_73.Key_Qa_GamePad:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      r0_73.Key_Qa_GamePad:CreateCommonKey({
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "Up",
          },
          {
            Type = "Img",
            ImgShortPath = "B",
          }
        },
        Type = "Add",
      })
    end
    local r4_73 = r0_73:IsShowKeyMore()
    if r4_73 then
      r4_73 = ESlateVisibility.SelfHitTestInvisible and ESlateVisibility.Collapsed
    else
      goto label_114	-- block#12 is visited secondly
    end
    r0_73:SetPanelDetailsVis(r4_73)
    r0_73.Key_LT:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_73.Key_LT:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "LB",
        }
      },
    })
    r0_73.Key_LR:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_73.Key_LR:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "RB",
        }
      },
    })
    r0_73.Com_Key_More:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_73.Com_Key_More:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "LS",
        }
      },
      bLongPress = false,
      Desc = GText("UI_Controller_Check"),
    })
  end
  r0_73:SetPanelDetails(r0_73.CurrentTabIdx)
end
function r6_0.HandleKeyDown(r0_74, r1_74, r2_74)
  -- line: [2107, 2138] id: 74
  local r3_74 = UE4.UKismetInputLibrary.GetKey(r2_74)
  local r4_74 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_74)
  local r5_74 = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_74) then
    r5_74 = r0_74:OnGamePadDown(r4_74)
  elseif r4_74 == "Escape" then
    r5_74 = true
    if r0_74.DisableEsc and r0_74.DisableEsc == true then
      return r5_74
    end
    if r0_74.DefaultList:GetVisibility() == ESlateVisibility.SelfHitTestInvisible and r0_74.DefaultList.IsShow then
      r0_74.DefaultList:OnCloseSquadGamepad()
    else
      r0_74:OnReturnKeyDown()
    end
  elseif r4_74 == "A" and r0_74.Tab_Info then
    r0_74.Tab_Info:TabToLeft()
    r5_74 = true
  elseif r4_74 == "D" and r0_74.Tab_Info then
    r0_74.Tab_Info:TabToRight()
    r5_74 = true
  end
  return r5_74
end
function r6_0.OnGamePadDown(r0_75, r1_75)
  -- line: [2140, 2270] id: 75
  DebugPrint("SL OnGamePadDown is InKeyName Detail", r1_75)
  local r2_75 = false
  r0_75.PressedKeys[r1_75] = true
  local r3_75 = r0_75.PressedKeys[Const.GamepadDPadUp] == true
  if r1_75 == "Gamepad_FaceButton_Right" then
    r0_75.PressedKeys.Gamepad_DPad_Up = nil
    r0_75.PressedKeys.Gamepad_FaceButton_Right = nil
    r0_75.Image_Select:SetRenderOpacity(0)
    if r0_75.Image_Select:GetRenderOpacity() > 0 then
      r0_75:PlayAnimation(r0_75.UnHover)
    end
    if r3_75 then
      UIManager(r0_75):ShowCommonPopupUI(100241)
      return true
    end
    if r0_75.SelectCell then
      local r4_75 = r0_75.SelectCell.Bg_List and r0_75.SelectCell.Bg_List.Button_Area
      if r4_75 and not r4_75:HasAnyUserFocus() then
        r0_75:SelectCellFocus()
        r2_75 = true
      else
        if r0_75.IsOpenAttibute then
          r0_75:OnButtonAttibuteUnhovered()
        else
          r0_75:OnReturnKeyDown()
        end
        r2_75 = true
      end
    end
    if r0_75.DefaultList and r0_75.DefaultList.IsShow and r0_75.DefaultList:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
      r0_75.DefaultList:OnCloseSquadGamepad()
      r0_75:UpdatKeyDisplay("SelfWidget")
      r2_75 = true
    end
  end
  if r0_75.DefaultList:GetVisibility() == ESlateVisibility.SelfHitTestInvisible and r0_75.DefaultList.IsShow then
    return r2_75
  end
  if (r1_75 == "Gamepad_LeftTrigger" or r1_75 == "Gamepad_RightTrigger") and r0_75.Tab_Info then
    r0_75.Tab_Info:Handle_KeyEventOnGamePad(r1_75)
    r2_75 = true
  elseif r1_75 == "Gamepad_RightShoulder" and r0_75.Key_LR:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
    r0_75:OnTypeItemPadRight()
    r2_75 = true
  elseif r1_75 == "Gamepad_LeftShoulder" and r0_75.Key_LT:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
    r0_75:OnTypeItemPadLeft()
    r2_75 = true
  elseif r1_75 == "Gamepad_FaceButton_Left" and r0_75.FocusTypeName ~= "RewardWidget" then
    if r3_75 and not r0_75.IsOpenAttibute then
      r0_75:OnButtonAttibuteHovered()
    elseif r0_75.Button_Multi:GetVisibility() == ESlateVisibility.Visible then
      r0_75:OnClickMulti()
    end
    r2_75 = true
  elseif r1_75 == "Gamepad_FaceButton_Top" and r0_75.FocusTypeName ~= "RewardWidget" then
    r0_75.PressedKeys.Gamepad_DPad_Up = nil
    r0_75.PressedKeys.Gamepad_FaceButton_Top = nil
    if r3_75 then
      r0_75:OpenDetails()
    elseif r0_75.Button_DoubleMod:GetVisibility() == ESlateVisibility.Visible and r0_75.Button_DoubleMod:IsBtnForbidden() then
      r0_75:OnForbiddenDoubleModBtnClicked()
    else
      r0_75:ShowDialogChar()
    end
    r2_75 = true
  elseif r1_75 == "Gamepad_LeftThumbstick" then
    if r0_75.CurrentFocusType ~= "SelectCell" then
      return r2_75
    elseif r0_75.CurrentFocusType == "SelectCell" then
      if r0_75.CurrentTabIdx == r0_75.ObtainTabId then
        r0_75.List_Prop:SetFocus()
        r0_75:UpdatKeyDisplay("RewardWidget")
      elseif r0_75.CurrentTabIdx == r0_75.MonsterTabId then
        r0_75.List_Monster:SetFocus()
        r0_75:UpdatKeyDisplay("RewardWidget")
      elseif r0_75.CurrentTabIdx == r0_75.SpecialMonsterTabId then
        r0_75.WB_EliteProp:GetChildAt(0):SetFocus()
        r0_75:UpdatKeyDisplay("EliteProp")
      elseif r0_75.CurrentTabIdx == r0_75.TitleEventTabId then
        r0_75.List_Event:SetFocus()
        r0_75:UpdatKeyDisplay("EventWidget")
      end
      r0_75:PlayAnimation(r0_75.Hover)
      r0_75.CurrentFocusType = "List"
      if r0_75.StyleOfPlay then
        r0_75.StyleOfPlay.IsKeyEventOnGamePad = false
      end
      r2_75 = true
    end
  end
  return r2_75
end
function r6_0.OnKeyUp(r0_76, r1_76, r2_76)
  -- line: [2272, 2286] id: 76
  local r3_76 = UE4.UKismetInputLibrary.GetKey(r2_76)
  local r4_76 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_76)
  local r5_76 = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_76) then
    r5_76 = r0_76:OnGamePadUp(r4_76)
  end
  if r5_76 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end
function r6_0.OnGamePadUp(r0_77, r1_77)
  -- line: [2288, 2304] id: 77
  local r2_77 = false
  r0_77.PressedKeys[r1_77] = false
  if r1_77 == "Gamepad_FaceButton_Left" and r0_77.IsOpenAttibute then
    r0_77:OnButtonAttibuteUnhovered()
  end
  return r2_77
end
function r6_0.OnPreviewKeyDown(r0_78, r1_78, r2_78)
  -- line: [2306, 2354] id: 78
  if r0_78.DefaultList:GetVisibility() == ESlateVisibility.SelfHitTestInvisible and r0_78.DefaultList.IsShow then
    return UWidgetBlueprintLibrary.UnHandled()
  end
  local r3_78 = UE4.UKismetInputLibrary.GetKey(r2_78)
  local r4_78 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_78)
  local r5_78 = false
  r0_78.PressedKeys[r4_78] = true
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_78) then
    if r4_78 == "Gamepad_DPad_Up" then
      r5_78 = true
    elseif r4_78 == "Gamepad_DPad_Down" then
      if r0_78.CurrentTabIdx == r0_78.SpecialMonsterTabId and not r0_78.MenuOpen and r0_78.MonNum and r0_78.MaxMonNum < r0_78.MonNum then
        r0_78:OpenCommanderDetails()
        r5_78 = true
      elseif r0_78.CurrentTabIdx == r0_78.ObtainTabId and not r0_78.MenuOpen then
        r0_78:OpenRewardDetails()
        r5_78 = true
      end
      r5_78 = true
    elseif r4_78 == "Gamepad_DPad_Right" and not r0_78:IsFocusList() then
      if r0_78.DefaultList:GetVisibility() ~= ESlateVisibility.SelfHitTestInvisible then
        return r5_78
      end
      if not r0_78.DefaultList.IsShow then
        local r6_78 = not r0_78.DefaultList.Preview.Switch_Summon:GetChecked()
        r0_78.DefaultList.Preview.Switch_Summon:SetChecked(r6_78)
        local r7_78 = GWorld:GetAvatar()
        if not r7_78 then
          r5_78 = true
          return 
        end
        r7_78:SwitchSquadAutoPhantom(r6_78)
        r5_78 = true
      end
    elseif r4_78 == "Gamepad_DPad_Left" and not r0_78:IsFocusList() then
      if r0_78.DefaultList:GetVisibility() ~= ESlateVisibility.SelfHitTestInvisible then
        return r5_78
      end
      if not r0_78.DefaultList.IsShow then
        r0_78.DefaultList.Preview:OpenDefaultMenuAnchor()
        r0_78:UpdatKeyDisplay("MenuAnchor")
        r5_78 = true
      end
    end
  end
  if r5_78 then
    return UWidgetBlueprintLibrary.Handled()
  else
    return UWidgetBlueprintLibrary.UnHandled()
  end
end
function r6_0.OnTypeItemPadLeft(r0_79)
  -- line: [2357, 2364] id: 79
  if not r0_79.LastMarkType then
    return 
  end
  local r1_79 = r0_79:GetItemIndex()
  if r1_79 and r1_79 > 1 then
    r0_79:SelectTypeItemByIndex(r1_79 + -1)
  end
end
function r6_0.OnTypeItemPadRight(r0_80)
  -- line: [2367, 2374] id: 80
  if not r0_80.LastMarkType then
    return 
  end
  local r1_80 = r0_80:GetItemIndex()
  if r1_80 and r1_80 < #r0_80.TypeTableKeys then
    r0_80:SelectTypeItemByIndex(r1_80 + 1)
  end
end
function r6_0.SelectTypeItemByIndex(r0_81, r1_81)
  -- line: [2377, 2382] id: 81
  local r2_81 = r0_81.TypeTableKeys[r1_81]
  if r2_81 then
    r0_81:OnTypeClicked(r2_81)
  end
end
function r6_0.GetItemIndex(r0_82)
  -- line: [2385, 2392] id: 82
  for r5_82, r6_82 in ipairs(r0_82.TypeTableKeys) do
    if r0_82.TypeTable[r6_82] == r0_82.LastMarkType then
      return r5_82
    end
  end
  -- close: r1_82
  return nil
end
function r6_0.SelectCellFocus(r0_83)
  -- line: [2394, 2402] id: 83
  r0_83:UpdatKeyDisplay("SelfWidget")
  if not r0_83.SelectCell.Bg_List.Button_Area:HasAnyUserFocus() then
    r0_83.SelectCell.Bg_List.Button_Area:SetFocus()
    if r0_83.StyleOfPlay then
      r0_83.StyleOfPlay.IsKeyEventOnGamePad = true
    end
  end
end
function r6_0.OnSelectCellFocus(r0_84)
  -- line: [2404, 2414] id: 84
  if r0_84.Image_Select then
    r0_84.Image_Select:SetRenderOpacity(0)
  end
  r0_84.CurrentFocusType = "SelectCell"
  if r0_84.CurrentFocusType ~= "SelectCell" and r0_84.Gamepad then
    r0_84:UpdatKeyDisplay("SelfWidget")
  end
end
function r6_0.IsFocusList(r0_85)
  -- line: [2416, 2418] id: 85
  return r0_85.CurrentFocusType == "List"
end
function r6_0.OnForbiddenRightBtnClicked(r0_86)
  -- line: [2428, 2430] id: 86
  UIManager(r0_86):ShowUITip(UIConst.Tip_CommonToast, GText("UI_REGISTER_COMINGSOON"))
end
function r6_0.OnForbiddenLeftBtnClicked(r0_87)
  -- line: [2432, 2437] id: 87
  if r0_87.IsComMissing and r0_87.DefaultList:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
    UIManager(r0_87):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Squad_Miss_Challenge"))
  end
end
function r6_0.OnForbiddenDoubleModBtnClicked(r0_88)
  -- line: [2439, 2443] id: 88
  if r0_88.IsDoubleModOpen and r0_88.ContinuousCombat then
    UIManager(r0_88):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Event_ModDrop_Exhausted"))
  end
end
function r6_0.ShowIntro(r0_89)
  -- line: [2445, 2447] id: 89
end
function r6_0.OpenIntro(r0_90)
  -- line: [2449, 2452] id: 90
end
function r6_0.UpdateActionPoint(r0_91, r1_91)
  -- line: [2454, 2465] id: 91
end
function r6_0.OnDungeonsUpdate(r0_92)
  -- line: [2467, 2480] id: 92
  if r0_92.DeputeType == Const.DeputeType.WalnutDepute then
    UIManager(r0_92):ShowCommonPopupUI(100157, {
      RightCallbackFunction = function()
        -- line: [2470, 2472] id: 93
        r0_92:OnReturnKeyDown()
      end,
    })
    local r2_92 = UIManager(r0_92):GetUI("WalnutChoice")
    if r2_92 then
      r2_92:Close()
    end
  end
end
function r6_0.OnCurrentSquadChange(r0_94, r1_94, r2_94)
  -- line: [2482, 2493] id: 94
  r0_94.SquadId = r1_94
  r0_94.IsComMissing = r2_94
  r0_94:IsShowAttributeTips()
  if r0_94.DefaultList.CurrentCharLevel <= DataMgr.Dungeon[r0_94.CurSelectedDungeonId].DungeonLevel - DataMgr.GlobalConstant.TaskWarningLevel.ConstantValue then
    r0_94.Panel_WarningHint:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    r0_94.Panel_WarningHint:SetVisibility(ESlateVisibility.Collapsed)
  end
end
function r6_0.RefreshBtnState(r0_95, r1_95)
  -- line: [2496, 2674] id: 95
  -- notice: unreachable block#60
  DebugPrint("gmy@WBP_Play_DeputeDetail_C M:RefreshBtnState", r1_95)
  if not r0_95.CurSelectedDungeonId then
    return 
  end
  local r2_95 = GWorld:GetAvatar()
  if not r2_95 then
    return 
  end
  local r4_95 = r2_95:CheckUIUnlocked(DataMgr.UIUnlockRule.Match.UIUnlockRuleId) and false
  local r5_95 = DataMgr.Dungeon[r0_95.CurSelectedDungeonId]
  if not r5_95 then
    return 
  end
  local r6_95 = r0_95.IsComMissing and false
  local r7_95 = r5_95.IsMultiDungeon
  if r7_95 then
    r7_95 = true and false
  else
    goto label_41	-- block#12 is visited secondly
  end
  local r8_95 = false
  if r2_95.CdnHideData and r2_95.CdnHideData.dungeon then
    for r13_95, r14_95 in pairs(r2_95.CdnHideData.dungeon) do
      for r19_95, r20_95 in pairs(r14_95.gameCtrlDungeon and {}) do
        if r20_95 == "multidungeon" then
          if r14_95.config then
            r7_95 = true and false
          else
            goto label_71	-- block#22 is visited secondly
          end
          r8_95 = true
          break
        end
      end
      -- close: r15_95
      if r8_95 then
        break
      end
    end
    -- close: r9_95
  end
  local r9_95 = r1_95
  if r9_95 == nil then
    r9_95 = r0_95:IsMatching()
  end
  local r10_95 = r2_95:IsInTeam()
  local r11_95, r12_95 = r0_95:CheckDungeonType(r0_95.CurSelectedDungeonId)
  r0_95.ContinuousCombat = r12_95
  local r13_95 = r0_95:IsDoubleMod()
  local r14_95 = true
  if r13_95 and r12_95 then
    local r15_95 = r0_95:GetDoubleModDropData() and {}
    local r16_95 = DataMgr.ModDropConstant and {}
    local r17_95 = r16_95.DailyFreeTicketAmount
    if r17_95 then
      r17_95 = r16_95.DailyFreeTicketAmount.ConstantValue and 0
    else
      goto label_120	-- block#38 is visited secondly
    end
    r14_95 = math.floor(r17_95 - r15_95.EliteRushTimes) > 0
  end
  local r15_95 = table.concat
  local r16_95 = {}
  local r17_95 = tostring(r0_95.CurSelectedDungeonId)
  local r18_95 = tostring(r9_95)
  local r19_95 = tostring(r4_95)
  local r20_95 = tostring(r7_95)
  local r21_95 = tostring(r0_95.DeputeType)
  local r22_95 = tostring(r6_95)
  local r23_95 = tostring(r13_95 and false)
  local r24_95 = tostring(r14_95)
  local r25_95 = tostring(r10_95)
  ... = tostring(r0_95.ContinuousCombat) -- error: untaken top expr
  -- setlist for #16 failed
  r15_95 = r15_95(r16_95, "|")
  if r0_95._Btn_sig == r15_95 then
    return 
  end
  r0_95._Btn_sig = r15_95
  DebugPrint("SL@WBP_Play_DeputeDetail_C M:RefreshBtnState")
  if r0_95.DeputeType == Const.DeputeType.WalnutDepute then
    r0_95.Button_Solo:SetText(GText("UI_Walnut_Choice"))
  else
    r0_95.Button_Solo:SetText(GText("DUNGEONSINGLE"))
  end
  if r9_95 then
    r0_95.Button_Multi:ForbidBtn(true)
    r0_95.Button_Solo:ForbidBtn(true)
    r0_95.Button_Multi:UnBindEventOnClickedByObj(r0_95)
    r0_95.Button_Solo:UnBindEventOnClickedByObj(r0_95)
    r0_95.Button_Multi:BindForbidStateExecuteEvent(r0_95, function()
      -- line: [2587, 2587] id: 96
    end)
    r0_95.Button_Solo:BindForbidStateExecuteEvent(r0_95, function()
      -- line: [2588, 2588] id: 97
    end)
  else
    if not r7_95 then
      r0_95.Button_Multi:SetVisibility(ESlateVisibility.Collapsed)
    else
      r16_95 = r0_95.Button_Multi
      if r4_95 then
        r18_95 = ESlateVisibility.Visible and ESlateVisibility.Collapsed
      else
        goto label_243	-- block#55 is visited secondly
      end
      r16_95:SetVisibility(r18_95)
    end
    r0_95.Button_Multi:ForbidBtn(not r7_95)
    r16_95 = r0_95.Button_Solo
    if not r7_95 then
      r18_95 = r10_95
    else
      r18_95 = false
    end
    r16_95:ForbidBtn(r18_95)
    r0_95.Button_Multi:UnBindEventOnClickedByObj(r0_95)
    r0_95.Button_Solo:UnBindEventOnClickedByObj(r0_95)
    r0_95.Button_Multi:SetDefaultGamePadImg("X")
    r0_95.Button_Solo:SetDefaultGamePadImg("Y")
    r0_95.Button_DoubleMod:SetDefaultGamePadImg("Y")
    r0_95.Button_Multi:BindEventOnClicked(r0_95, r0_95.OnClickMulti)
    r0_95.Button_Solo:BindEventOnClicked(r0_95, r0_95.ShowDialogChar)
    r0_95.Button_Multi:BindForbidStateExecuteEvent(r0_95, r0_95.OnForbiddenRightBtnClicked)
    r0_95.Button_DoubleMod:BindForbidStateExecuteEvent(r0_95, r0_95.OnForbiddenDoubleModBtnClicked)
    r0_95.Button_Solo:BindForbidStateExecuteEvent(r0_95, function()
      -- line: [2618, 2622] id: 98
      if not r7_95 and r10_95 then
        UIManager(r0_95):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Team_CanNotEnterDungeon"))
      end
    end)
  end
  if r6_95 then
    r0_95.Button_Multi:ForbidBtn(true)
    r0_95.Button_Solo:ForbidBtn(true)
    r0_95.Button_Multi:UnBindEventOnClickedByObj(r0_95)
    r0_95.Button_Solo:UnBindEventOnClickedByObj(r0_95)
    r0_95.Button_Solo:BindForbidStateExecuteEvent(r0_95, r0_95.OnForbiddenLeftBtnClicked)
    r0_95.Button_Multi:BindForbidStateExecuteEvent(r0_95, r0_95.OnForbiddenLeftBtnClicked)
  end
  if r0_95.CurSelectedDungeonId then
    r16_95 = DataMgr.Dungeon[r0_95.CurSelectedDungeonId]
    if r16_95 and r16_95.bDisableMatch then
      r0_95.Button_Multi:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  if r0_95.DeputeType == Const.DeputeType.NightFlightManualDepute then
    if r13_95 and r0_95.ContinuousCombat then
      r0_95.Button_Solo:SetVisibility(ESlateVisibility.Collapsed)
      r0_95.Button_DoubleMod:SetVisibility(ESlateVisibility.Visible)
      r0_95.Button_DoubleMod:SetText(GText("UI_Event_ModDrop_ChallengeStart"))
      r16_95 = r0_95.Button_DoubleMod
      if not r14_95 then
        r18_95 = r0_95.ContinuousCombat and false
      else
        goto label_383	-- block#73 is visited secondly
      end
      r16_95:ForbidBtn(r18_95)
    else
      r0_95.Button_DoubleMod:SetVisibility(ESlateVisibility.Collapsed)
      r0_95.Button_Solo:SetText(GText("UI_Ticket_Choose"))
      r0_95.Button_Solo:SetVisibility(ESlateVisibility.Visible)
    end
    if not r14_95 then
      r0_95.Button_Multi:ForbidBtn(true)
      r0_95.Button_Solo:ForbidBtn(true)
      r0_95.Button_DoubleMod:ForbidBtn(true)
      r0_95.Button_Multi:UnBindEventOnClickedByObj(r0_95)
      r0_95.Button_Solo:UnBindEventOnClickedByObj(r0_95)
      r0_95.Button_DoubleMod:UnBindEventOnClickedByObj(r0_95)
      r0_95.Button_Multi:BindForbidStateExecuteEvent(r0_95, function()
        -- line: [2663, 2665] id: 99
        UIManager(r0_95):ShowUITip("CommonToastMain", GText("UI_Event_ModDrop_Exhausted"))
      end)
      r0_95.Button_Solo:BindForbidStateExecuteEvent(r0_95, function()
        -- line: [2666, 2668] id: 100
        UIManager(r0_95):ShowUITip("CommonToastMain", GText("UI_Event_ModDrop_Exhausted"))
      end)
      r0_95.Button_DoubleMod:BindForbidStateExecuteEvent(r0_95, function()
        -- line: [2669, 2671] id: 101
        UIManager(r0_95):ShowUITip("CommonToastMain", GText("UI_Event_ModDrop_Exhausted"))
      end)
    end
  end
end
function r6_0.IsMatching(r0_102)
  -- line: [2676, 2678] id: 102
  return TeamController:GetModel():IsMatching()
end
function r6_0.OpenTicketDialog(r0_103)
  -- line: [2680, 2690] id: 103
  local r1_103 = UIManager(r0_103):ShowCommonPopupUI(100123, {
    DungeonId = r0_103.CurSelectedDungeonId,
    RightCallbackObj = r0_103,
    RightCallbackFunction = function(r0_104, r1_104)
      -- line: [2684, 2686] id: 104
      r0_103:EnterTicketDungeon(r1_104.Content_1.TicketId)
    end,
    ForbiddenRightCallbackObj = r0_103,
    AutoFocus = true,
  }, r0_103)
end
function r6_0.PlayTabSound(r0_105)
  -- line: [2692, 2694] id: 105
  AudioManager(r0_105):PlayUISound(r0_105, "event:/ui/common/click_level_03", nil, nil)
end
function r6_0.TryEnterDungeon(r0_106, r1_106, r2_106, r3_106, r4_106, r5_106)
  -- line: [2696, 2709] id: 106
  if r0_106:DoCheckCanEnterDungeon(r1_106, r2_106) then
    r0_106:BlockAllUIInput(true)
    DebugPrint("gmy@M:TryEnterDungeon ", r1_106, r2_106, r3_106, r4_106, r5_106)
    if r0_106.DefaultList:GetVisibility() == ESlateVisibility.Collapsed then
      r1_106:EnterDungeon(r2_106, r3_106, r4_106, r5_106)
    else
      r1_106:EnterDungeon(r2_106, r3_106, r4_106, r5_106, r0_106.SquadId)
    end
  else
    TeamController:GetModel().bPressedSolo = false
    TeamController:GetModel().bPressedMulti = false
  end
end
function r6_0.HandleEnterDungeonRetCode(r0_107, ...)
  -- line: [2711, 2726] id: 107
  DebugPrint("gmy@M.EnterDungeonCallback RetCode", r0_107)
  local r1_107 = ErrorCode.RET_SUCCESS
  if r0_107 == r1_107 then
    r1_107 = true
    return r1_107
  else
    ... = ... -- error: untaken top expr
    if r1_107 then
      TeamController:DoWhenEnterDungeonCheckFailed(r0_107, r1_107)
    else
      ErrorCode:Check(r0_107)
    end
    EventManager:FireEvent(EventID.TeamMatchTimingEnd)
    return false
  end
end
function r6_0.DoCheckCanEnterDungeon(r0_108, r1_108, r2_108)
  -- line: [2728, 2735] id: 108
  if not TeamController:DoCheckCanEnterDungeon(r2_108) then
    DebugPrint("gmy@M:DoCheckCanEnterDungeon bTeammateNotReady")
    return false
  end
  return true
end
function r6_0.TeamMatchTimingStart(r0_109, r1_109)
  -- line: [2737, 2741] id: 109
  TeamController:GetModel().bPressedSolo = true
  TeamController:GetModel().bPressedMulti = true
  r0_109:RefreshBtnState(r1_109)
end
function r6_0.TeamMatchTimingEnd(r0_110, r1_110)
  -- line: [2743, 2747] id: 110
  TeamController:GetModel().bPressedSolo = false
  TeamController:GetModel().bPressedMulti = false
  r0_110:RefreshBtnState(r1_110)
end
function r6_0.DisableEscOnDungeonLoading(r0_111)
  -- line: [2750, 2752] id: 111
  r0_111.DisableEsc = true
end
AssembleComponents(r6_0)
return r6_0
