-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Play\Widget\GuildWar\WBP_Activity_GuildWar_LevelSelect_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("Utils.CommonUtils")
local r1_0 = require("Utils.MonsterUtils")
local r3_0 = require("BluePrints.UI.WBP.Walnut.WalnutBag.WalnutBagController"):GetModel()
local r4_0 = require("Utils.TimeUtils")
local r5_0 = require("EMCache.EMCache")
local r6_0 = require("BluePrints.UI.WBP.Activity.Widget.GuildWar.GuildWarUtils")
local r7_0 = Class({
  "BluePrints.UI.BP_UIState_C"
})
r7_0._components = {
  "BluePrints.UI.WBP.Play.Widget.GuildWar.GuildWarView"
}
local r8_0 = {
  Char = 1,
  Weapon = 2,
  Mod = 3,
  Draft = 4,
  Reward = 5,
  Resource = 6,
}
function r7_0.Construct(r0_1)
  -- line: [29, 87] id: 1
  r7_0.Super.Construct(r0_1)
  r7_0.bOpened = true
  r0_1.Btn_Start:SetText(GText("DUNGEONSINGLE"))
  r0_1.Btn_Start:BindEventOnClicked(r0_1, r0_1.OnClickSolo)
  r0_1.Btn_Ranking:BindEventOnClicked(r0_1, r0_1.OpenGuildWarRank)
  r0_1.Btn_Shop.Btn_Click.OnClicked:Add(r0_1, r0_1.OnShopBtnClicked)
  r0_1.Com_Btn_Details:BindEventOnClicked(r0_1, r0_1.OpenRewardDetails)
  r0_1.Com_Btn_Details_Buff:BindEventOnClicked(r0_1, r0_1.OpenBuffDetails)
  r0_1.ScrollBox_List.OnUserScrolled:Add(r0_1, r0_1.OnUserScrolled)
  r0_1:AddDispatcher(EventID.OnPreRaidRankInfo, r0_1, r0_1.OnPreRaidRankInfo)
  r0_1:AddDispatcher(EventID.OnRaidRankInfo, r0_1, r0_1.OnRaidRankInfo)
  EventManager:AddEvent(EventID.OnRaidRankInfoTopN, r0_1, r0_1.OnRaidRankInfoTopN)
  r0_1:AddDispatcher(EventID.OnRefreshDeputeBtn, r0_1, r0_1.RefreshBtnState)
  r0_1:AddDispatcher(EventID.CurrentSquadChange, r0_1, r0_1.OnCurrentSquadChange)
  r0_1:AddDispatcher(EventID.OnDisableEscOnDungeonLoading, r0_1, r0_1.DisableEscOnDungeonLoading)
  r0_1:AddDispatcher(EventID.OnRaidRankStart, r0_1, r0_1.Init)
  r0_1:AddDispatcher(EventID.TeamMatchCancel, r0_1, r0_1.OnTeamMatchCancel)
  r0_1.List_Prop.OnCreateEmptyContent:Bind(r0_1, r0_1.CreateAndAddEmptyItem)
  r0_1:AddInputMethodChangedListen()
  r0_1.List_Prop:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  r0_1.List_Prop:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  r0_1.List_Prop:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  r0_1.List_Prop:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  r0_1.List_Monster:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  r0_1.List_Monster:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  r0_1.List_Monster:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  r0_1.List_Monster:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  r0_1.IsFocusProp = false
  r0_1.IsFocus_Monster = false
  r0_1.IsFocusEliteProp = false
  r0_1.SquadId = 1
  r0_1.MaxMonNum = 2
  r0_1.WalnutId = nil
  r0_1.Mobile = r0_0.GetDeviceTypeByPlatformName(r0_1) == "Mobile"
  r0_1.Gamepad = UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad
  r0_1.FocusTypeName = nil
  r0_1.Panel_Details_Buff:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_1.Btn_Start:SetText(GText("DUNGEONSINGLE"))
  r0_1.Text_Title_Score:SetText(GText("RaidDungeon_Base_Point"))
  r0_1.Text_Consume:SetText(GText("UI_Armory_Trace_Cost"))
  r0_1.Text_Details_Buff:SetText(GText("UI_Dungeon_More"))
end
function r7_0.OnLoaded(r0_2, ...)
  -- line: [90, 93] id: 2
  r7_0.Super.OnLoaded(r0_2, ...)
  r0_2:Init()
end
function r7_0.Init(r0_3)
  -- line: [95, 100] id: 3
  r0_3.DungeonList = r0_3:GetCurrentRaidDungeonList()
  if r0_3.DungeonList then
    r0_3:InitLevelList(r0_3.DungeonList)
  end
end
function r7_0.Destruct(r0_4)
  -- line: [102, 109] id: 4
  r7_0.Super.Destruct(r0_4)
  r7_0.bOpened = false
  r7_0.SelectedDungeonId = nil
  r0_4.Btn_Start:UnBindEventOnClickedByObj(r0_4)
  r0_4.Btn_Ranking:UnBindEventOnClickedByObj(r0_4)
end
function r7_0.GetCurrentRaidDungeonList(r0_5)
  -- line: [111, 142] id: 5
  r0_5.RaidSeasons = r0_5:GetRaidSeasons()
  if not r0_5.RaidSeasons then
    DebugPrint("self.RaidSeasons 不存在")
    return nil
  end
  local r1_5 = GWorld:GetAvatar()
  if not r1_5 then
    return 
  end
  local r2_5 = 0
  if r0_5.RaidSeasons:IsPreRaidTime() then
    r2_5 = 1
  elseif r0_5.RaidSeasons:IsRaidTime() then
    r2_5 = 2
  end
  local r3_5 = {}
  for r8_5, r9_5 in pairs(DataMgr.RaidDungeon) do
    if r9_5.RaidDungeonType == r2_5 and r9_5.RaidSeason == r1_5.CurrentRaidSeasonId then
      table.insert(r3_5, r9_5.DungeonId)
    end
  end
  -- close: r4_5
  table.sort(r3_5, function(r0_6, r1_6)
    -- line: [137, 139] id: 6
    local r2_6 = r0_6 and 0
    return r2_6 < (r1_6 and 0)
  end)
  return r3_5
end
function r7_0.InitLevelList(r0_7, r1_7)
  -- line: [147, 306] id: 7
  AudioManager(r0_7):PlayUISound(r0_7, "event:/ui/armory/open", "Play_DeputeDetail", nil)
  r0_7:SetFocus()
  r0_7.MonsterIdToItem = {}
  r0_7.TypeTable = {}
  r0_7.TypeTableKeys = {}
  r0_7.CurrentTabIdx = 1
  r0_7.SelectCell = nil
  r0_7.FirstEnter = true
  if not r1_7 then
    return 
  end
  r0_7.ActionPointId = DataMgr.ResourceSType2Resource.ActionPoint[1]
  local r2_7 = {
    {
      Text = GText("UI_DUNGEON_ObtainType"),
      Id = 1,
    },
    {
      Text = GText("UI_DUNGEON_MonsterType"),
      Id = 2,
    }
  }
  r0_7.ObtainTabId = 1
  r0_7.MonsterTabId = 2
  r0_7.Tab_Info:Init({
    LeftKey = "A",
    RightKey = "D",
    Tabs = r2_7,
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
  local r3_7 = GWorld:GetAvatar()
  if not r3_7 then
    return 
  end
  r0_7.CurrentRaidSeasonId = r3_7.CurrentRaidSeasonId
  r0_7.RaidSeasons = r3_7.RaidSeasons[r0_7.CurrentRaidSeasonId]
  r0_7.RaidSeasonData = DataMgr.RaidSeason[r0_7.RaidSeasons.RaidSeasonId]
  local r4_7 = nil
  local r5_7 = nil
  r0_7:InitOtherPageTab()
  for r10_7, r11_7 in ipairs(r1_7) do
    local r12_7 = r0_7:CreateWidgetNew("GuildWarLevelItem")
    r12_7:BindEventOnClicked(r0_7, r0_7.OnClickedLevelCell, r12_7)
    r12_7:InitDungeonInfo(r11_7, r10_7, false, r0_7)
    if r10_7 == 1 then
      r5_7 = r12_7
    end
    if r0_7:CheckDungeonCondition(r11_7) then
      r4_7 = r12_7
    end
    r0_7.ScrollBox_List:AddChild(r12_7)
  end
  -- close: r6_7
  local r6_7 = r4_7 and r5_7
  if r6_7 then
    r6_7.IsSelect = true
    if DataMgr.RaidDungeon[r6_7.DungeonId].DifficultyLevel <= 1 then
      r6_7:PlayAnimationForward(r6_7.Click_Normal)
    else
      r6_7:PlayAnimationForward(r6_7.Click)
    end
    r0_7.SelectCell = r6_7
    r0_7.CurCellDungeonId = r6_7.DungeonId
    r0_7:InitListCellInfo(r6_7.DungeonId)
  else
    r0_7.Panel_Detail:SetVisibility(ESlateVisibility.Collapsed)
  end
  if r0_7.SelectCell then
    r0_7:SelectCellFocus()
    r0_7.ScrollBox_List:ScrollWidgetIntoView(r0_7.SelectCell, true, EDescendantScrollDestination.Center)
  end
  local r7_7 = r0_7.ScrollBox_List:GetChildrenCount()
  if not r7_7 or r7_7 == 0 then
    return 
  end
  r0_7.ScrollBox_List:GetChildAt(0):SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  r0_7.ScrollBox_List:GetChildAt(r0_7.ScrollBox_List:GetChildrenCount() + -1):SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  r0_7:PlayAnimation(r0_7.In)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    r0_7:UpdateUIStyleInPlatform(false)
  end
  r0_7.Board:Init()
  if r0_7.RaidSeasons:IsPreRaidTime() and r0_7.RaidSeasons.MaxRaidScore == 0 and r0_7:IsFirstEnterToday() then
    r0_7:OpenGuildWarRewardPop()
  end
  if r0_7.RaidSeasons:IsRaidTime() then
    r0_7.Btn_Shop:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_7.Btn_Shop.Text_Name:SetText(GText("RaidDungeon_Shop_Name"))
    r0_7.Consume:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_7.Btn_Ranking:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    if r0_7.RaidSeasons.MaxPreRaidScore == 0 or r0_7.RaidSeasons.BanState == 1 then
      r0_7.Btn_Ranking:ForbidBtn(true)
      r0_7.Btn_Ranking:BindForbidStateExecuteEvent(r0_7, function()
        -- line: [288, 290] id: 8
        UIManager(r0_7):ShowUITip(UIConst.Tip_CommonToast, GText("RaidDungeon_PreRaid_Abandon_Toast"))
      end)
    end
    local r8_7 = r5_0:Get("FirstRaidTime", true)
    DebugPrint("判断是是否是首次进入正式赛  IsNotFirstRaidTime : ", r8_7)
    if not r8_7 and r0_7.RaidSeasons.MaxPreRaidScore ~= 0 then
      r5_0:Set("FirstRaidTime", true, true)
      r0_7:OpenGuildWarGroupConfirm()
    end
  else
    r0_7.Btn_Shop:SetVisibility(ESlateVisibility.Collapsed)
    r0_7.Consume:SetVisibility(ESlateVisibility.Collapsed)
    r0_7.Btn_Ranking:SetVisibility(ESlateVisibility.Collapsed)
  end
end
function r7_0.UpdateTicketNum(r0_9)
  -- line: [309, 346] id: 9
  if not r0_9.RaidSeasons:IsRaidTime() then
    return 
  end
  local r1_9 = GWorld:GetAvatar()
  if not r1_9 then
    return 
  end
  r0_9.ResId = 0
  r0_9.ConsumeTicketCount = 0
  for r7_9, r8_9 in pairs(DataMgr.RaidDungeon[r0_9.SelectCell.DungeonId].TicketNum) do
    r0_9.ResId = r7_9
    r0_9.ConsumeTicketCount = r8_9
  end
  -- close: r3_9
  local r3_9 = r1_9.Resources[r0_9.ResId]
  if r3_9 then
    r3_9 = r1_9.Resources[r0_9.ResId].Count and 0
  else
    goto label_40	-- block#9 is visited secondly
  end
  if r0_9.ConsumeTicketCount <= r3_9 then
    r0_9.Switcher_Owned:SetActiveWidgetIndex(0)
    r0_9.Num_Over:SetText(r0_9.ConsumeTicketCount)
  else
    r0_9.Switcher_Owned:SetActiveWidgetIndex(1)
    r0_9.Num_Short:SetText(r0_9.ConsumeTicketCount)
  end
  r0_9.Common_Item_Icon:Init({
    Id = r0_9.ResId,
    Icon = LoadObject(DataMgr.Resource[r0_9.ResId].Icon),
    ItemType = "Resource",
    IsShowDetails = true,
    IsCantItemSelection = true,
    MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight,
  })
end
function r7_0.IsFirstEnterToday(r0_10)
  -- line: [348, 364] id: 10
  local r1_10 = os.date("%Y-%m-%d")
  local r2_10 = r5_0:Get("GuildWarRewardPopDate", true)
  local r3_10 = nil	-- notice: implicit variable refs by block#[4, 6]
  if r2_10 ~= nil then
    r3_10 = r2_10 ~= r1_10
  else
    goto label_14	-- block#3 is visited secondly
  end
  if r3_10 then
    r5_0:Set("GuildWarRewardPopDate", r1_10, true)
  end
  return r3_10
end
function r7_0.InitOtherPageTab(r0_11)
  -- line: [366, 410] id: 11
  local r1_11 = {
    DynamicNode = {
      "Back",
      "ResourceBar",
      "BottomKey"
    },
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = r0_11.OnReturnKeyDown,
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
    },
    OwnerPanel = r0_11,
    BackCallback = r0_11.OnReturnKeyDown,
    StyleName = "Text",
    TitleName = GText("Event_Raid_Title"),
    PopupInfoHotKey = "SpecialLeft",
    GetReplyOnBack = function()
      -- line: [382, 388] id: 12
      if r0_11.SelectCell then
        return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), r0_11.SelectCell)
      else
        return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), r0_11.ScrollBox_List)
      end
    end,
  }
  if r1_11 then
    r1_11.OverridenTopResouces = DataMgr.SystemUI.GuildWarLevel.TabCoin
  end
  r0_11.Tab:Init(r1_11, true)
end
function r7_0.SetPanelDetails(r0_13, r1_13)
  -- line: [414, 499] id: 13
  if r1_13 == r0_13.ObtainTabId then
    r0_13.Text_Details:SetText(GText("UI_CTL_Details"))
    if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
      r0_13.Key_MonsterInfo:SetVisibility(ESlateVisibility.Collapsed)
      r0_13.Switch_Details_Icon:SetActiveWidgetIndex(2)
      r0_13.Switch_Details_Icon_Buff:SetActiveWidgetIndex(2)
      r0_13.Key_Details_GamePad:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      r0_13.Key_Details_GamePad:CreateCommonKey({
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "Down",
          }
        },
      })
      r0_13.Key_Details_GamePad_1:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      r0_13.Key_Details_GamePad_1:CreateCommonKey({
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "Up",
          }
        },
      })
    else
      r0_13.Switch_Details_Icon:SetActiveWidgetIndex(1)
      r0_13.Switch_Details_Icon_Buff:SetActiveWidgetIndex(1)
      if not r0_13.Mobile then
        r0_13.Key_Details_GamePad:SetVisibility(ESlateVisibility.Collapsed)
        r0_13.Key_Details_GamePad_1:SetVisibility(ESlateVisibility.Collapsed)
      end
    end
  else
    r0_13.Text_Details:SetText(GText("UI_Dungeon_More"))
    if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
      r0_13.Switch_Details_Icon:SetActiveWidgetIndex(2)
      r0_13.Switch_Details_Icon_Buff:SetActiveWidgetIndex(2)
      r0_13.Key_Details_GamePad:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      r0_13.Key_Details_GamePad:CreateCommonKey({
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "Down",
          }
        },
      })
      r0_13.Key_Details_GamePad_1:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      r0_13.Key_Details_GamePad_1:CreateCommonKey({
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "Up",
          }
        },
      })
      if r0_13.FocusTypeName ~= "RewardWidget" then
        r0_13.Key_MonsterInfo:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
        r0_13.Key_MonsterInfo:CreateCommonKey({
          KeyInfoList = {
            {
              Type = "Img",
              ImgShortPath = "LS",
            }
          },
          Desc = GText("UI_Controller_Check"),
        })
      end
    else
      r0_13.Switch_Details_Icon:SetActiveWidgetIndex(0)
      r0_13.Switch_Details_Icon_Buff:SetActiveWidgetIndex(1)
      if not r0_13.Mobile then
        r0_13.Key_Details_GamePad:SetVisibility(ESlateVisibility.Collapsed)
        r0_13.Key_Details_GamePad_1:SetVisibility(ESlateVisibility.Collapsed)
        r0_13.Key_MonsterInfo:SetVisibility(ESlateVisibility.Collapsed)
      end
    end
  end
end
function r7_0.OnSubTabChanged(r0_14, r1_14)
  -- line: [501, 528] id: 14
  r0_14.CurrentTabIdx = r1_14.Idx
  r0_14:PlayAnimation(r0_14.Switch_Tab)
  if r1_14.Idx == r0_14.ObtainTabId then
    r0_14.Panel_Info:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_14.Panel_MonsterInfo:SetVisibility(ESlateVisibility.Collapsed)
    r0_14:SetPanelDetailsVis(ESlateVisibility.SelfHitTestInvisible)
    if r0_14.CurrentFocusType == "List" then
      r0_14.List_Prop:SetFocus()
      r0_14:UpdatKeyDisplay("RewardWidget")
    end
  elseif r1_14.Idx == r0_14.MonsterTabId then
    r0_14.Panel_Info:SetVisibility(ESlateVisibility.Collapsed)
    r0_14.Panel_MonsterInfo:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_14:SetPanelDetailsVis(ESlateVisibility.Collapsed)
    if r0_14.CurrentFocusType == "List" then
      r0_14.List_Monster:SetFocus()
      r0_14:UpdatKeyDisplay("RewardWidget")
    end
  end
  r0_14:SetPanelDetails(r1_14.Idx)
end
function r7_0.ItemMenuAnchorChanged(r0_15, r1_15)
  -- line: [532, 542] id: 15
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return 
  end
  if r1_15 then
    r0_15:UpdatKeyDisplay("")
  else
    r0_15:UpdatKeyDisplay("SelfWidget")
    r0_15:SelectCellFocus()
  end
end
function r7_0.OnClickedLevelCell(r0_16, r1_16)
  -- line: [546, 575] id: 16
  if r0_16.SelectCell ~= nil then
    if r0_16:CheckDungeonCondition(r0_16.SelectCell.DungeonId) then
      r0_16.SelectCell:PlayAnimationReverse(r0_16.SelectCell.Click)
    else
      r0_16.SelectCell:ShowTips(false)
    end
    r0_16.SelectCell.IsSelect = false
  end
  r0_16.SelectCell = r1_16
  r0_16.SelectCell.IsSelect = true
  if not r0_16:CheckDungeonCondition(r0_16.SelectCell.DungeonId) then
    r0_16.SelectCell:SetTimeShow()
  end
  r0_16.TypeTable = {}
  r0_16.TypeTableKeys = {}
  r0_16.LastMarkType = nil
  r0_16.CurCellDungeonId = r1_16.DungeonId
  r0_16:InitListCellInfo(r1_16.DungeonId)
end
function r7_0.InitListCellInfo(r0_17, r1_17)
  -- line: [580, 620] id: 17
  -- notice: unreachable block#7
  if r0_17.SelectCell then
    r0_17:SelectCellFocus()
    r0_17.Text_Score:SetText(DataMgr.RaidDungeon[r0_17.CurCellDungeonId].BaseRaidPoint and 0)
    r0_17.Text_Floor:SetText(r2_17.DifficultyLevel)
    r0_17:UpdateTicketNum()
  end
  r0_17.CurSelectedDungeonId = r1_17
  r7_0.SelectedDungeonId = r1_17
  r0_17.HasTypeSelect = false
  r0_17.Tab_Info:SelectTab(1)
  r0_17:RefreshLevelCellContent(r0_17.CurSelectedDungeonId)
  if true then
    r0_17.DefaultList:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    local r3_17 = DataMgr.Dungeon[r0_17.CurSelectedDungeonId].DungeonType
    local r4_17 = r3_17 == "Rouge"
    local r5_17 = GWorld:GetAvatar()
    if r5_17 then
      local r6_17 = r5_17.DungeonSquad[r3_17]
      if r6_17 then
        r6_17 = r5_17.DungeonSquad[r3_17] and 0
      else
        goto label_65	-- block#12 is visited secondly
      end
      r0_17.DefaultList:Init(r0_17, r4_17, r6_17, r0_17.CurSelectedDungeonId, true)
    end
  else
    r0_17.DefaultList:SetVisibility(ESlateVisibility.Collapsed)
  end
  if not (DataMgr.DoubleModDrop and DataMgr.DoubleModDrop[CommonConst.DoubleModDropEventID]) then
    r0_17.Group_TimeTips:SetVisibility(ESlateVisibility.Collapsed)
    return 
  end
end
function r7_0.RefreshLevelCellContent(r0_18, r1_18)
  -- line: [623, 646] id: 18
  if not r1_18 then
    DebugPrint("ZDX DungeonId is nil")
    return 
  end
  local r2_18 = DataMgr.Dungeon[r1_18]
  r0_18.List_Prop:ClearListItems()
  r0_18.List_Monster:ClearListItems()
  r0_18.List_Buff:ClearListItems()
  if not GWorld:GetAvatar() then
    return 
  end
  r0_18:RefreshMonsterInfoList(r1_18)
  r0_18:RefreshRewardInfoList(r1_18)
  r0_18:RefreshBuffInfoList()
  r0_18:RefreshBtnState()
end
function r7_0.OpenRewardDetails(r0_19)
  -- line: [651, 663] id: 19
  AudioManager(r0_19):PlayUISound(r0_19, "event:/ui/common/tip_show_click", nil, nil)
  local r2_19 = UIManager(r0_19):ShowCommonPopupUI(100156, {
    RewardList = r0_19.RewardList,
    CloseBtnCallbackFunction = function()
      -- line: [657, 659] id: 20
      r0_19:SelectCellFocus()
    end,
    AutoFocus = true,
  })
end
function r7_0.OpenBuffDetails(r0_21)
  -- line: [666, 669] id: 21
  UIManager(r0_21):LoadUINew("GuildWarEnvironment"):Init(r0_21.RaidBuffIDArry)
end
function r7_0.TryOpenRankTopN(r0_22)
  -- line: [672, 677] id: 22
  if r0_22.RankInfo and r0_22.TopNInfo and r0_22.OpenRankTag then
    r0_22.OpenRankTag = nil
    UIManager():LoadUINew("GuildWarRank", r0_22.RankInfo, r0_22.TopNInfo)
  end
end
function r7_0.OpenGuildWarRank(r0_23)
  -- line: [680, 706] id: 23
  AudioManager(r0_23):PlayUISound(r0_23, "event:/ui/activity/shop_small_btn_click", nil, nil)
  local r1_23 = GWorld:GetAvatar()
  if not r1_23 then
    return 
  end
  r0_23.OpenRankTag = true
  r0_23:BlockAllUIInput(true, "RaidSeasonGetRaidRankinfo")
  r1_23:RaidSeasonGetRaidRankInfo(function(r0_24)
    -- line: [690, 696] id: 24
    r0_23:BlockAllUIInput(false, "RaidSeasonGetRaidRankinfo")
    if not ErrorCode:Check(r0_24) and r0_23 then
      r0_23.RankInfo = {}
      r0_23:TryOpenRankTopN()
    end
  end)
  r0_23:BlockAllUIInput(true, "RaidSeasonGetRaidRankTopN")
  r1_23:RaidSeasonGetRaidRankTopN(function(r0_25)
    -- line: [699, 705] id: 25
    r0_23:BlockAllUIInput(false, "RaidSeasonGetRaidRankTopN")
    if not ErrorCode:Check(r0_25) and r0_23 then
      r0_23.TopNInfo = {}
      r0_23:TryOpenRankTopN()
    end
  end)
end
function r7_0.RefreshBuffInfoList(r0_26)
  -- line: [710, 741] id: 26
  r0_26.RaidBuffIDArry = DataMgr.RaidDungeon[r0_26.CurCellDungeonId].RaidBuffID
  if r0_26.RaidBuffIDArry then
    r0_26.WS_Buff:SetActiveWidgetIndex(0)
    for r6_26, r7_26 in ipairs(r0_26.RaidBuffIDArry) do
      local r8_26 = NewObject(UIUtils.GetCommonItemContentClass())
      r8_26.RaidDungeonBuffData = DataMgr.RaidBuff[r7_26]
      r0_26.List_Buff:AddItem(r8_26)
    end
    -- close: r2_26
  else
    r0_26.Panel_Details_Buff:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_26.WS_Buff:SetActiveWidgetIndex(1)
    r0_26.Text_Buff_Empty:SetText(GText())
  end
  if r0_26:IsExistTimer(r0_26.NextFrameListEmpty) then
    r0_26:RemoveTimer(r0_26.NextFrameListEmpty)
  end
end
function r7_0.RefreshRewardInfoList(r0_27, r1_27)
  -- line: [745, 869] id: 27
  assert(DataMgr.Dungeon[r1_27], "副本信息不存在:" .. r1_27)
  local r2_27 = GWorld:GetAvatar()
  if not r2_27 then
    return 
  end
  local r3_27 = nil
  if not r2_27.Dungeons[r1_27] or not r2_27.Dungeons[r1_27].IsPass then
    local r4_27 = DataMgr.Reward[DataMgr.Dungeon[r1_27].FirstCompleteReward]
    if r4_27 then
      r3_27 = {}
      local r5_27 = r4_27.Id and {}
      local r6_27 = r4_27.Count and {}
      local r7_27 = r4_27.Type and {}
      for r11_27 = 1, #r5_27, 1 do
        local r12_27 = r5_27[r11_27]
        table.insert(r3_27, {
          Id = r12_27,
          Type = r7_27[r11_27],
          ItemCount = RewardUtils:GetCount(r6_27[r11_27]),
          Icon = ItemUtils.GetItemIcon(r12_27, r7_27[r11_27]),
          Rarity = ItemUtils.GetItemRarity(r12_27, r7_27[r11_27]),
          bFirst = true,
          DropType = "FirstReward",
        })
      end
    end
  end
  local r4_27 = RewardUtils:GetRewardViewInfoById(DataMgr.Dungeon[r1_27].DungeonRewardView)
  local function r5_27(r0_28, r1_28)
    -- line: [782, 793] id: 28
    if r0_28.Rarity == r1_28.Rarity then
      if r8_0[r0_28.Type] and r8_0[r1_28.Type] then
        if r8_0[r0_28.Type] == r8_0[r1_28.Type] then
          return r0_28.Id < r1_28.Id
        end
        return r8_0[r0_28.Type] < r8_0[r1_28.Type]
      end
      return r0_28.Id < r1_28.Id
    end
    return r1_28.Rarity < r0_28.Rarity
  end
  if r3_27 then
    table.sort(r3_27, r5_27)
  end
  table.sort(r4_27, r5_27)
  r0_27.RewardList = {}
  if r3_27 then
    for r10_27, r11_27 in ipairs(r3_27) do
      table.insert(r0_27.RewardList, r11_27)
    end
    -- close: r6_27
  end
  for r10_27, r11_27 in ipairs(r4_27) do
    table.insert(r0_27.RewardList, r11_27)
  end
  -- close: r6_27
  local r6_27, r7_27 = r0_27:IsInTimeRange(r1_27)
  if r6_27 and r7_27 then
    local r8_27 = RewardUtils:GetRewardViewInfoById(r7_27.RewardView)
    table.sort(r8_27, r5_27)
    for r13_27, r14_27 in ipairs(r8_27) do
      table.insert(r0_27.RewardList, r14_27)
    end
    -- close: r9_27
  end
  for r12_27, r13_27 in ipairs(r0_27.RewardList) do
    local r14_27 = NewObject(UIUtils.GetCommonItemContentClass())
    r14_27.Id = r13_27.Id
    r14_27.Icon = ItemUtils.GetItemIconPath(r13_27.Id, r13_27.Type)
    r14_27.ParentWidget = r0_27
    r14_27.ItemType = r13_27.Type
    r14_27.Rarity = r13_27.Rarity and 1
    r14_27.IsShowDetails = true
    r14_27.UIName = "DeputeDetail"
    if r13_27.bFirst then
      r14_27.BonusType = 2
    end
    local r15_27 = r13_27.ItemCount and nil
    if r13_27.Quantity then
      if #r13_27.Quantity > 1 then
        r14_27.MaxCount = r13_27.Quantity[2]
      end
      r15_27 = r13_27.Quantity[1] and nil
    end
    r14_27.Count = r15_27
    r0_27.List_Prop:AddItem(r14_27)
  end
  -- close: r8_27
  if r0_27:IsExistTimer(r0_27.NextFrameListEmpty) then
    r0_27:RemoveTimer(r0_27.NextFrameListEmpty)
  end
  r0_27.NextFrameListEmpty = r0_27:AddTimer(0.01, function()
    -- line: [855, 868] id: 29
    for r4_29 = 1, r0_27.List_Prop:GetNumItems(), 1 do
      local r5_29 = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(r0_27.List_Prop, r4_29 + -1)
      if r5_29 then
        r5_29:BindEvents(r0_27, {
          OnMenuOpenChanged = r0_27.OnStuffMenuOpenChanged,
        })
      end
    end
    r0_27.List_Prop:RequestFillEmptyContent()
  end, false, 0, "GuildWar_LevelSelectListView")
end
function r7_0.IsInTimeRange(r0_30, r1_30)
  -- line: [872, 889] id: 30
  local r2_30 = os.time()
  local r3_30 = DataMgr.EventDungeonReward[r1_30]
  if not r3_30 then
    return false
  end
  for r8_30, r9_30 in pairs(r3_30) do
    if type(r9_30) == "table" then
      for r14_30, r15_30 in pairs(r9_30) do
        if r8_30 <= r2_30 and r2_30 <= r14_30 then
          return true, r15_30
        end
      end
      -- close: r10_30
    end
  end
  -- close: r4_30
  return false
end
function r7_0.CreateAndAddEmptyItem(r0_31)
  -- line: [891, 897] id: 31
  local r1_31 = NewObject(UIUtils.GetCommonItemContentClass())
  r1_31.Id = 0
  return r1_31
end
function r7_0.OnStuffMenuOpenChanged(r0_32, r1_32)
  -- line: [899, 918] id: 32
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return 
  end
  r0_32.MenuOpen = r1_32
  if r1_32 then
    r0_32.Btn_Start:SetPCVisibility(true)
    r0_32.Btn_Ranking.Key_Shop:SetVisibility(ESlateVisibility.Collapsed)
    r0_32:UpdatKeyDisplay("")
    local r2_32 = r0_32.Switch_Details_Icon
    local r4_32 = r0_32.CurrentTabIdx
    if r4_32 == r0_32.ObtainTabId then
      r4_32 = 0 and 1
    else
      goto label_33	-- block#5 is visited secondly
    end
    r2_32:SetActiveWidgetIndex(r4_32)
    r2_32 = r0_32.Switch_Details_Icon_Buff
    r4_32 = r0_32.CurrentTabIdx
    if r4_32 == r0_32.ObtainTabId then
      r4_32 = 0 and 1
    else
      goto label_44	-- block#8 is visited secondly
    end
    r2_32:SetActiveWidgetIndex(r4_32)
  else
    r0_32.Btn_Start:SetPCVisibility(false)
    r0_32.Btn_Ranking.Key_Shop:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_32:UpdatKeyDisplay("RewardWidget")
    r0_32.List_Prop:SetFocus()
    r0_32.Switch_Details_Icon:SetActiveWidgetIndex(2)
    r0_32.Switch_Details_Icon_Buff:SetActiveWidgetIndex(2)
  end
end
function r7_0.OnClickedCell(r0_33, r1_33)
  -- line: [921, 928] id: 33
  if r0_33.SelectLvTabCell ~= nil then
    r0_33.SelectLvTabCell:OnCellUnSelect()
  end
  r0_33.SelectLvTabCell = r1_33
  r1_33:SelectCell()
end
function r7_0.RefreshMonsterInfoList(r0_34, r1_34)
  -- line: [932, 961] id: 34
  local r2_34 = DataMgr.Dungeon[r1_34]
  if not r2_34 or not r2_34.DungeonMonsters or #r2_34.DungeonMonsters == 0 then
    DebugPrint("ZDX DungeonMonster is nil")
    return 
  end
  local r3_34 = r0_0.DeepCopy(r2_34.DungeonMonsters)
  table.sort(r3_34, r1_0.CompareMonsters)
  r0_34.MonsterWeaknessIcon = {}
  r0_34:InitMonsterWeakness(r1_34)
  local r4_34 = UE4.UGameplayStatics.GetGameState(r0_34)
  for r9_34, r10_34 in ipairs(r3_34) do
    if DataMgr.Monster[r10_34] then
      local r12_34 = NewObject(UIUtils.GetCommonItemContentClass())
      r12_34.ParentWidget = r0_34
      r12_34.MonsterId = r10_34
      r12_34.DisableSelect = true
      r12_34.SoundEvent = "event:/ui/common/click_mid"
      r12_34.WeaknessIcon = r0_34.MonsterWeaknessIcon[r10_34]
      r0_34.List_Monster:AddItem(r12_34)
    end
  end
  -- close: r5_34
end
function r7_0.InitMonsterWeakness(r0_35, r1_35)
  -- line: [964, 994] id: 35
  assert(r1_35, "dungeon id is nil")
  local r2_35 = DataMgr.Dungeon[r1_35]
  assert(r2_35, string.format("dungeon id [%d] is wrong, cant find dungeonInfo", r1_35))
  local r4_35 = r2_35.DungeonMonsters
  if r2_35.MonsterBuff then
    for r9_35, r10_35 in ipairs(r4_35) do
      if type(r10_35) == "number" then
        for r16_35, r17_35 in ipairs(r1_0.GetRealMonsterBuffs(r1_35, r10_35)) do
          local r18_35 = DataMgr.Buff[r17_35]
          if r18_35 and r18_35.WeaknessType and not not r18_35.WeaknessType then
            local r20_35 = DataMgr.DamageType[r18_35.WeaknessType].WeaknessIcon
            if r20_35 then
              r0_35.MonsterWeaknessIcon[r10_35] = r0_35.MonsterWeaknessIcon[r10_35] and {}
              r0_35.MonsterWeaknessIcon[r10_35][r20_35] = true
            end
          end
        end
        -- close: r12_35
      end
    end
    -- close: r5_35
  end
end
function r7_0.OnClickSolo(r0_36)
  -- line: [998, 1009] id: 36
  if not r0_36.CurSelectedDungeonId then
    DebugPrint("SL CurSelectedDungeonId is nil")
    return 
  end
  if not r0_36:CheckDungeonCondition(r0_36.CurSelectedDungeonId) then
    UIManager(r0_36):ShowUITip(UIConst.Tip_CommonToast, GText("RaidDungeon_DungeonLocked_Toast"))
    return 
  end
  r0_36:EnterStandalone()
end
function r7_0.EnterStandalone(r0_37)
  -- line: [1012, 1034] id: 37
  local r1_37 = {
    Type = "GuildWar",
    JumpId = 69,
    SquadId = r0_37.SquadId and nil,
  }
  GWorld.GameInstance:SetExitDungeonData(r1_37)
  AudioManager(r0_37):PlayUISound(r0_37, "event:/ui/common/map_click_enter_level", nil, nil)
  local r2_37 = GWorld:GetAvatar()
  if r2_37 then
    r0_37:TryEnterDungeon(r2_37, r0_37.CurSelectedDungeonId, function(r0_38, ...)
      -- line: [1024, 1029] id: 38
      if not r0_37.HandleEnterDungeonRetCode(r0_38, ...) then
        r0_37:PlayAnimation(r0_37.In)
      end
    end, nil)
  else
    WorldTravelSubsystem(r0_37):ChangeDungeonByDungeonId(r0_37.CurSelectedDungeonId, CommonConst.DungeonNetMode.Standalone)
  end
end
function r7_0.OnUserScrolled(r0_39)
  -- line: [1038, 1041] id: 39
  if r0_0.GetDeviceTypeByPlatformName() == "Mobile" then
    return 
  end
  UIUtils.UpdateScrollBoxArrow(r0_39.ScrollBox_List, r0_39.List_ArrowTop, r0_39.List_ArrowBottom)
end
function r7_0.OnReturnKeyDown(r0_40)
  -- line: [1045, 1052] id: 40
  AudioManager(r0_40):SetEventSoundParam(r0_40, "Play_DeputeDetail", {
    ToEnd = 1,
  })
  if not r0_40:IsAnimationPlaying(r0_40.Out) and not r0_40:IsAnimationPlaying(r0_40.In) then
    r0_40:SetVisibility(ESlateVisibility.HitTestInvisible)
    r0_40:PlayAnimation(r0_40.Out)
    EventManager:FireEvent(EventID.OnActivityEntryShowVisible)
  end
end
function r7_0.OnAnimationFinished(r0_41, r1_41)
  -- line: [1054, 1058] id: 41
  if r1_41 == r0_41.Out then
    r0_41.Super.Close(r0_41)
  end
end
function r7_0.RefreshOpInfoByInputDevice(r0_42, r1_42, r2_42)
  -- line: [1060, 1084] id: 42
  if r1_42 == ECommonInputType.Touch then
    return 
  end
  local r3_42 = r1_42 == ECommonInputType.MouseAndKeyboard
  if not r3_42 or not 0 then
    local r4_42 = 1
  end
  if not r3_42 and (r0_42:HasFocusedDescendants() or r0_42:HasAnyUserFocus()) then
    local r5_42 = r0_42.DefaultList:GetVisibility() == ESlateVisibility.SelfHitTestInvisible
    local r6_42 = not r0_42.DefaultList.IsShow
    if r5_42 and r6_42 or not r5_42 then
      r0_42:SelectCellFocus()
    end
  end
  r0_42:UpdateUIStyleInPlatform(r3_42)
end
function r7_0.UpdatKeyDisplay(r0_43, r1_43)
  -- line: [1086, 1217] id: 43
  if r0_0.GetDeviceTypeByPlatformName(r0_43) == "Mobile" then
    return 
  end
  if r0_43.DefaultList:GetVisibility() == ESlateVisibility.SelfHitTestInvisible and r0_43.DefaultList.IsShow then
    return 
  end
  r0_43.FocusTypeName = r1_43
  if r1_43 == "RewardWidget" then
    r0_43.Tab:UpdateBottomKeyInfo({
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = r0_43,
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
            ClickCallback = r0_43.OnReturnKeyDown,
            Owner = r0_43,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = r0_43,
          }
        },
        Desc = GText("UI_BACK"),
      }
    })
    r0_43:UpdateUIStyleInPlatform(true)
    r0_43.Tab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_43.Tab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_43.Tab_Info:UpdateUIStyleInPlatform(true)
    if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
      r0_43.Btn_Ranking.Key_Shop:SetVisibility(ESlateVisibility.Collapsed)
      r0_43.Key_MonsterInfo:SetVisibility(ESlateVisibility.Collapsed)
      r0_43.Btn_Start:SetPCVisibility(true)
    end
    r0_43.DefaultList:ApplyPcUiLayout()
  elseif r1_43 == "SelfWidget" then
    local r2_43 = {}
    table.insert(r2_43, {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = r0_43.OnReturnKeyDown,
          Owner = r0_43,
        }
      },
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
          Owner = r0_43,
        }
      },
      Desc = GText("UI_BACK"),
    })
    r0_43.Tab:UpdateBottomKeyInfo(r2_43)
    if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
      r0_43:UpdateUIStyleInPlatform(false)
      r0_43.Tab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      r0_43.Tab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      r0_43.Tab_Info:UpdateUIStyleInPlatform(true)
      r0_43.Btn_Start:SetPCVisibility(false)
      r0_43.IsFocusProp = false
      r0_43.IsFocus_Monster = false
      r0_43.IsFocusEliteProp = false
      r0_43.DefaultList:InitWidgetInfoInGamePad()
    end
  elseif r1_43 == "MenuAnchor" then
    r0_43.Tab:UpdateBottomKeyInfo({
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = r0_43,
          }
        },
        Desc = GText("UI_CTL_CloseTips"),
        bLongPress = false,
      }
    })
    r0_43:UpdateUIStyleInPlatform(true)
    r0_43.Tab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_43.Tab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    r0_43.Tab:UpdateBottomKeyInfo({})
    r0_43:UpdateUIStyleInPlatform(true)
    r0_43.Tab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_43.Tab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_43.Tab_Info:UpdateUIStyleInPlatform(false)
  end
end
function r7_0.SetPanelDetailsVis(r0_44, r1_44)
  -- line: [1219, 1221] id: 44
  r0_44.Panel_Details:SetVisibility(r1_44)
end
function r7_0.UpdateUIStyleInPlatform(r0_45, r1_45)
  -- line: [1224, 1278] id: 45
  if r0_0.GetDeviceTypeByPlatformName(r0_45) == "Mobile" then
    return 
  end
  if r1_45 then
    r0_45.Com_Key_More:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_45.Btn_Ranking.Key_Shop:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_45.Btn_Shop.Key_Controller:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_45.Board.WS_Controller:SetActiveWidgetIndex(0)
    r0_45.Key_MonsterInfo:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    r0_45.Board.WS_Controller:SetActiveWidgetIndex(1)
    r0_45.Board.Key_Reward:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "RB",
        }
      },
    })
    r0_45.Com_Key_More:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_45.Com_Key_More:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "LS",
        }
      },
      bLongPress = false,
      Desc = GText("UI_Controller_Check"),
    })
    r0_45.Btn_Ranking.Key_Shop:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_45.Btn_Ranking.Key_Shop:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "X",
        }
      },
    })
    r0_45.Btn_Shop.Key_Controller:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_45.Btn_Shop.Key_Controller:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "LB",
        }
      },
    })
  end
  r0_45:SetPanelDetails(r0_45.CurrentTabIdx)
end
function r7_0.OnKeyDown(r0_46, r1_46, r2_46)
  -- line: [1280, 1315] id: 46
  local r3_46 = UE4.UKismetInputLibrary.GetKey(r2_46)
  local r4_46 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_46)
  local r5_46 = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_46) then
    r5_46 = r0_46:OnGamePadDown(r4_46)
  elseif r4_46 == "Escape" then
    r5_46 = true
    if r0_46.DisableEsc and r0_46.DisableEsc == true then
      return UWidgetBlueprintLibrary.Handled()
    end
    if r0_46.DefaultList:GetVisibility() == ESlateVisibility.SelfHitTestInvisible and r0_46.DefaultList.IsShow then
      r0_46.DefaultList:OnCloseSquadGamepad()
    else
      r0_46:OnReturnKeyDown()
    end
  elseif r4_46 == "A" and r0_46.Tab_Info then
    r0_46.Tab_Info:TabToLeft()
    r5_46 = true
  elseif r4_46 == "D" and r0_46.Tab_Info then
    r0_46.Tab_Info:TabToRight()
    r5_46 = true
  end
  if r5_46 then
    return UWidgetBlueprintLibrary.Handled()
  else
    return UWidgetBlueprintLibrary.UnHandled()
  end
end
function r7_0.OnGamePadDown(r0_47, r1_47)
  -- line: [1317, 1411] id: 47
  DebugPrint("SL OnGamePadDown is InKeyName Detail", r1_47)
  local r2_47 = false
  if r1_47 == "Gamepad_FaceButton_Right" then
    if r0_47.DefaultList and r0_47.DefaultList.IsShow and r0_47.DefaultList:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
      r0_47.DefaultList:OnCloseSquadGamepad()
      r0_47:UpdatKeyDisplay("SelfWidget")
      r2_47 = true
    elseif r0_47.SelectCell then
      local r3_47 = r0_47.SelectCell and r0_47.SelectCell.Btn_Click
      if r3_47 and not r3_47:HasAnyUserFocus() then
        r0_47:SelectCellFocus()
        r2_47 = true
      else
        r0_47:OnReturnKeyDown()
        r2_47 = true
      end
    end
  elseif r1_47 ~= UIConst.GamePadKey.SpecialRight then
    r2_47 = r0_47.Tab:Handle_KeyEventOnGamePad(r1_47)
  end
  if r0_47.DefaultList:GetVisibility() == ESlateVisibility.SelfHitTestInvisible and r0_47.DefaultList.IsShow then
    return r2_47
  end
  if (r1_47 == "Gamepad_LeftTrigger" or r1_47 == "Gamepad_RightTrigger") and r0_47.Tab_Info then
    r0_47.Tab_Info:Handle_KeyEventOnGamePad(r1_47)
    r2_47 = true
  elseif r1_47 == "Gamepad_Special_Right" and r0_47.DefaultList:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
    r0_47.DefaultList:OnSpecialRightUp()
    r2_47 = true
  elseif r1_47 == "Gamepad_FaceButton_Left" and r0_47.RaidSeasons:IsRaidTime() and r0_47.RaidSeasons.MaxPreRaidScore > 0 then
    r0_47:OpenGuildWarRank()
  elseif r1_47 == "Gamepad_FaceButton_Top" then
    r0_47:OnClickSolo()
  elseif r1_47 == "Gamepad_LeftShoulder" and r0_47.RaidSeasons:IsRaidTime() then
    r0_47:OnShopBtnClicked()
  elseif r1_47 == "Gamepad_RightShoulder" and r0_47.RaidSeasons:IsPreRaidTime() then
    r0_47:OpenGuildWarRewardPop()
  elseif r1_47 == "Gamepad_LeftThumbstick" then
    if r0_47.CurrentFocusType ~= "SelectCell" then
      return r2_47
    elseif r0_47.CurrentFocusType == "SelectCell" then
      if r0_47.CurrentTabIdx == r0_47.ObtainTabId then
        r0_47.List_Prop:SetFocus()
        r0_47:UpdatKeyDisplay("RewardWidget")
      elseif r0_47.CurrentTabIdx == r0_47.MonsterTabId then
        r0_47.List_Monster:SetFocus()
        r0_47:UpdatKeyDisplay("RewardWidget")
      end
      r0_47:PlayAnimation(r0_47.Hover)
      r0_47.CurrentFocusType = "List"
      r2_47 = true
    end
  end
  return r2_47
end
function r7_0.OnPreviewKeyDown(r0_48, r1_48, r2_48)
  -- line: [1435, 1478] id: 48
  if r0_48.DefaultList:GetVisibility() == ESlateVisibility.SelfHitTestInvisible and r0_48.DefaultList.IsShow then
    return UWidgetBlueprintLibrary.UnHandled()
  end
  local r3_48 = UE4.UKismetInputLibrary.GetKey(r2_48)
  local r4_48 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_48)
  local r5_48 = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_48) then
    if r4_48 == "Gamepad_DPad_Down" and r0_48.CurrentTabIdx == r0_48.ObtainTabId and not r0_48.MenuOpen then
      r0_48:OpenRewardDetails()
      r5_48 = true
    elseif r4_48 == "Gamepad_DPad_Right" and not r0_48:IsFocusList() then
      if r0_48.DefaultList:GetVisibility() ~= ESlateVisibility.SelfHitTestInvisible then
        return r5_48
      end
      if not r0_48.DefaultList.IsShow then
        local r6_48 = not r0_48.DefaultList.Preview.Switch_Summon:GetChecked()
        r0_48.DefaultList.Preview.Switch_Summon:SetChecked(r6_48)
        local r7_48 = GWorld:GetAvatar()
        if not r7_48 then
          r5_48 = true
          return 
        end
        r7_48:SwitchSquadAutoPhantom(r6_48)
        r5_48 = true
      end
    elseif r4_48 == "Gamepad_DPad_Left" and not r0_48:IsFocusList() then
      if r0_48.DefaultList:GetVisibility() ~= ESlateVisibility.SelfHitTestInvisible then
        return r5_48
      end
      if not r0_48.DefaultList.IsShow then
        r0_48.DefaultList.Preview:OpenDefaultMenuAnchor()
        r0_48:UpdatKeyDisplay("MenuAnchor")
        r5_48 = true
      end
    end
  end
  if r5_48 then
    return UWidgetBlueprintLibrary.Handled()
  else
    return UWidgetBlueprintLibrary.UnHandled()
  end
  -- warn: not visited block [7]
  -- block#7:
  -- r0_48:OpenBuffDetails()
  -- r5_48 = true
  -- goto label_127
end
function r7_0.OnShopBtnClicked(r0_49)
  -- line: [1480, 1486] id: 49
  local r1_49 = DataMgr.EventPortal[r0_49.RaidSeasonData.EventId]
  if not r1_49 then
    return 
  end
  PageJumpUtils:JumpToTargetPageByJumpId(r1_49.EventShop, r0_49.OnShopClose, r0_49)
end
function r7_0.OnShopClose(r0_50)
  -- line: [1488, 1489] id: 50
end
function r7_0.SelectCellFocus(r0_51)
  -- line: [1492, 1499] id: 51
  if not r0_51.SelectCell then
    return 
  end
  r0_51:UpdatKeyDisplay("SelfWidget")
  if not r0_51.SelectCell.Btn_Click:HasAnyUserFocus() then
    r0_51.CurrentFocusType = "SelectCell"
    r0_51.SelectCell.Btn_Click:SetFocus()
  end
end
function r7_0.IsFocusList(r0_52)
  -- line: [1501, 1503] id: 52
  return r0_52.CurrentFocusType == "List"
end
function r7_0.OnForbiddenRightBtnClicked(r0_53)
  -- line: [1506, 1508] id: 53
  UIManager(r0_53):ShowUITip(UIConst.Tip_CommonToast, "UI_REGISTER_COMINGSOON")
end
function r7_0.OnForbiddenLeftBtnClicked(r0_54)
  -- line: [1510, 1515] id: 54
  if r0_54.IsComMissing and r0_54.DefaultList:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
    UIManager(r0_54):ShowUITip(UIConst.Tip_CommonToast, "UI_Squad_Miss_Challenge")
  end
end
function r7_0.OnForbiddenDoubleModBtnClicked(r0_55)
  -- line: [1517, 1521] id: 55
  if r0_55.IsDoubleMod and r0_55.ContinuousCombat then
    UIManager(r0_55):ShowUITip(UIConst.Tip_CommonToast, "UI_Event_ModDrop_Exhausted")
  end
end
function r7_0.OpenGuildWarRewardPop(r0_56)
  -- line: [1524, 1527] id: 56
  UIManager(r0_56):LoadUINew("GuildWarRewardPop"):Init()
end
function r7_0.OpenGuildWarGroupConfirm(r0_57)
  -- line: [1530, 1533] id: 57
  UIManager(r0_57):LoadUINew("GuildWarGroupConfirm"):Init()
end
function r7_0.OnCurrentSquadChange(r0_58, r1_58, r2_58)
  -- line: [1536, 1546] id: 58
  r0_58.SquadId = r1_58
  r0_58.IsComMissing = r2_58
  r0_58:RefreshBtnState()
end
function r7_0.RefreshBtnState(r0_59)
  -- line: [1548, 1607] id: 59
  local r1_59 = GWorld:GetAvatar()
  if not r1_59 then
    return 
  end
  r0_59.Btn_Start:UnBindEventOnClickedByObj(r0_59)
  r0_59.Btn_Start:ForbidBtn(false)
  r0_59.Btn_Start:SetDefaultGamePadImg("Y")
  if not r0_59:CheckDungeonCondition(r0_59.SelectCell.DungeonId) then
    r0_59.Btn_Start:ForbidBtn(true)
    r0_59.Btn_Start:BindForbidStateExecuteEvent(r0_59, function()
      -- line: [1561, 1563] id: 60
      UIManager(r0_59):ShowUITip(UIConst.Tip_CommonToast, GText("RaidDungeon_DungeonLocked_Toast"))
    end)
    return 
  end
  local r4_59 = nil	-- notice: implicit variable refs by block#[16, 17]
  if r0_59.RaidSeasons:IsRaidTime() and r1_59 then
    r4_59 = r0_59.ResId
    local r3_59 = r1_59.Resources[r4_59]
    if r3_59 then
      r4_59 = r0_59.ResId
      r3_59 = r1_59.Resources[r4_59].Count and 0
    else
      goto label_53	-- block#8 is visited secondly
    end
    r4_59 = r0_59.ConsumeTicketCount
    if r3_59 < r4_59 then
      r0_59.Btn_Start:ForbidBtn(true)
      r4_59 = DataMgr.Resource[r0_59.ResId]
      r0_59.Btn_Start:BindForbidStateExecuteEvent(r0_59, function()
        -- line: [1574, 1577] id: 61
        UIManager(r0_59):ShowUITip(UIConst.Tip_CommonToast, string.format(GText("RaidDungeon_NoTicket_Toast"), GText(r4_59.ResourceName)))
      end)
      return 
      -- close: r4_59
    end
  end
  if r0_59.IsComMissing then
    r0_59.Btn_Start:ForbidBtn(true)
    r0_59.Btn_Start:BindForbidStateExecuteEvent(r0_59, r0_59.OnForbiddenLeftBtnClicked)
    return 
  end
  if not r6_0.IsRaidTime() then
    r0_59.Btn_Start:ForbidBtn(true)
    return 
  end
  if r1_59:IsInTeam() then
    r4_59 = r0_59.Btn_Start
    r4_59:ForbidBtn(true)
    r4_59 = r0_59.Btn_Start
    r4_59:BindForbidStateExecuteEvent(r0_59, function()
      -- line: [1601, 1601] id: 62
      UIManager(r0_59):ShowUITip(UIConst.Tip_CommonToast, "UI_TRAINING_FAIL_GUIDWAR")
    end)
    return 
  end
  r4_59 = r0_59.Btn_Start
  r4_59:BindEventOnClicked(r0_59, r0_59.OnClickSolo)
end
function r7_0.PlayTabSound(r0_63)
  -- line: [1611, 1613] id: 63
  AudioManager(r0_63):PlayUISound(r0_63, "event:/ui/common/click_level_03", nil, nil)
end
function r7_0.TryEnterDungeon(r0_64, r1_64, r2_64, r3_64)
  -- line: [1615, 1624] id: 64
  DebugPrint("SL@M:TryEnterDungeon ", r1_64, r2_64, r0_64.RaidSeasonData.EventId, r3_64)
  if r0_64.DefaultList:GetVisibility() == ESlateVisibility.Collapsed then
    r1_64:EnterEventDungeon(r3_64, r2_64, nil, r0_64.RaidSeasonData.EventId)
  else
    r1_64:EnterEventDungeon(r3_64, r2_64, r0_64.SquadId, r0_64.RaidSeasonData.EventId)
  end
  r0_64.Btn_Start:ForbidBtn(true)
end
function r7_0.SelectMonsterInfoItem(r0_65, r1_65)
  -- line: [1627, 1629] id: 65
  UIManager(r0_65):LoadUINew("MonsterDetailInfo", r0_65.CurSelectedDungeonId, r0_65, r1_65)
end
function r7_0.HandleEnterDungeonRetCode(r0_66, ...)
  -- line: [1631, 1640] id: 66
  DebugPrint("SL@M.EnterDungeonCallback RetCode", r0_66)
  ErrorCode:Check(r0_66)
  local r1_66 = r0_66 == ErrorCode.RET_SUCCESS
end
function r7_0.OnTeamMatchCancel(r0_67, r1_67)
  -- line: [1642, 1644] id: 67
  r0_67.Btn_Start:ForbidBtn(false)
end
function r7_0.ReceiveEnterState(r0_68, r1_68)
  -- line: [1647, 1651] id: 68
  r0_68.Super.ReceiveEnterState(r0_68, r1_68)
  EventManager:FireEvent(EventID.GuilfWarLevelSelectReceiveEnterState, r1_68)
end
function r7_0.OnPreRaidRankInfo(r0_69, r1_69)
  -- line: [1653, 1655] id: 69
end
function r7_0.OnRaidRankInfo(r0_70, r1_70)
  -- line: [1657, 1662] id: 70
  r0_70.RankInfo = r1_70 and {}
  if r0_70.OpenRankTag then
    r0_70:TryOpenRankTopN()
  end
end
function r7_0.OnRaidRankInfoTopN(r0_71, r1_71)
  -- line: [1664, 1669] id: 71
  r0_71.TopNInfo = r1_71 and {}
  if r0_71.OpenRankTag then
    r0_71:TryOpenRankTopN()
  end
end
function r7_0.DisableEscOnDungeonLoading(r0_72)
  -- line: [1671, 1673] id: 72
  r0_72.DisableEsc = true
end
AssembleComponents(r7_0)
return r7_0
