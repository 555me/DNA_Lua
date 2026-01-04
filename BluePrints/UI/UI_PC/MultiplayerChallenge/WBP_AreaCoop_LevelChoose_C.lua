-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\UI_PC\MultiplayerChallenge\WBP_AreaCoop_LevelChoose_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.BP_UIState_C"
})
local r1_0 = require("BluePrints.UI.UI_PC.MultiplayerChallenge.AreaCoop_LevelChoose_Model")
local r2_0 = require("Utils.MonsterUtils")
local r3_0 = require("BluePrints.UI.UI_PC.MultiplayerChallenge.WBP_AreaCoop_LevelChoose_GamePadCompoment")
local r4_0 = "WidgetBlueprint\'/Game/UI/WBP/Build/PC/WBP_Build_DefaultList_P.WBP_Build_DefaultList_P\'"
local r5_0 = "WidgetBlueprint\'/Game/UI/WBP/Build/Mobile/WBP_Build_DefaultList_M.WBP_Build_DefaultList_M\'"
r0_0._components = {
  "BluePrints.UI.UI_PC.MultiplayerChallenge.WBP_AreaCoop_LevelChoose_GamePadCompoment"
}
function r0_0.Initialize(r0_1, r1_1)
  -- line: [20, 29] id: 1
  r0_1.IsSoloStart = false
  r0_1.MultiWalnut = false
  r0_1.MultiTicket = false
  r0_1.CurSelectedDungeonId = nil
  r0_1.IsGamePad = false
  r0_1.MonsterIdToItem = {}
end
function r0_0.Construct(r0_2)
  -- line: [31, 69] id: 2
  r0_2.Super.Construct(r0_2)
  if r0_2.AddDispatcher then
    r0_2:AddDispatcher(EventID.TeamMatchTimingStart, r0_2, r0_2.TeamMatchTimingStart)
    r0_2:AddDispatcher(EventID.TeamMatchTimingEnd, r0_2, r0_2.TeamMatchTimingEnd)
    r0_2:AddDispatcher(EventID.CurrentSquadChange, r0_2, r0_2.OnCurrentSquadChange)
  end
  local r1_2 = UE4.UGameplayStatics.GetPlayerController(r0_2, 0)
  if UGameInputModeSubsystem and r1_2 then
    r0_2.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(r1_2)
    if IsValid(r0_2.GameInputModeSubsystem) and r0_2.RefreshOpInfoByInputDevice then
      r0_2:RefreshOpInfoByInputDevice(r0_2.GameInputModeSubsystem:GetCurrentInputType(), r0_2.GameInputModeSubsystem:GetCurrentGamepadName())
    end
  end
  if r0_2.In then
    r0_2:PlayAnimation(r0_2.In)
  end
  if r0_2.SetFocus then
    r0_2:SetFocus()
  end
  r0_2:InitWidgetInfoInGamePad()
  r0_2:StaticInit()
  r0_2.ScrollBox_Desc:ScrollToStart()
  if CommonUtils.GetDeviceTypeByPlatformName(r0_2) == "Mobile" then
    r0_2:InitKeyboardView()
  end
end
function r0_0.Destruct(r0_3)
  -- line: [71, 80] id: 3
  local r1_3 = CommonUtils.GetDeviceTypeByPlatformName(r0_3) == "Mobile"
  local r2_3 = nil	-- notice: implicit variable refs by block#[6]
  if r1_3 then
    r2_3 = r0_3.Group_Mob
    if not r2_3 then
      ::label_13::
      r2_3 = r0_3.Group_PC
    end
  else
    goto label_13	-- block#5 is visited secondly
  end
  r2_3:ClearChildren()
  r0_3:EndInteractive()
  r0_3.Super.Destruct(r0_3)
  if IsValid(r0_3.GameInputModeSubsystem) then
    r0_3.GameInputModeSubsystem.OnInputMethodChanged:Remove(r0_3, r0_3.RefreshOpInfoByInputDevice)
  end
end
function r0_0.ReceiveEnterState(r0_4, r1_4)
  -- line: [82, 93] id: 4
  if r1_4 == 1 then
    r0_4:AddTimer(0.1, function()
      -- line: [86, 88] id: 5
      r0_4:SetFocus()
    end)
    r0_4.DefaultList:RefreshData()
  end
  r0_0.Super.ReceiveEnterState(r0_4, r1_4)
end
function r0_0.OnLoaded(r0_6, r1_6)
  -- line: [95, 118] id: 6
  if type(r1_6) == "table" then
    if r1_6.ChallengeId then
      r1_6 = r1_6.ChallengeId
    else
      ScreenPrint("需要传入表，包含 MultiplayerChallenge 字段")
      DebugPrintTable(r1_6)
    end
  end
  r1_6 = tonumber(r1_6)
  r0_6.ChallengeId = r1_6
  r1_0:Init(r1_6)
  r0_6:RefreshBtnState(false)
  r0_6:InitBaseInfo()
  r0_6:InitDungeonInfo()
  r0_6:InitTeamInfo()
end
function r0_0.StaticInit(r0_7)
  -- line: [120, 158] id: 7
  if r0_7.Text_BossRewards then
    r0_7.Text_BossRewards:SetText(GText("UI_HardBoss_Preview"))
  end
  if r0_7.Common_Button_Text_PC and r0_7.Common_Button_Text_PC.SetText then
    r0_7.Common_Button_Text_PC:SetText(GText("UI_HardBoss_Start"))
  end
  if r0_7.Btn_Coop and r0_7.Btn_Coop.SetText then
    r0_7.Btn_Coop:SetText(GText("DUNGEONMATCH_START"))
  end
  if r0_7.Text_Monster then
    r0_7.Text_Monster:SetText(GText("UI_DUNGEON_MonsterType"))
  end
  if r0_7.Text_EliteTitle then
    r0_7.Text_EliteTitle:SetText(GText("UI_Dungeon_SpecialMonster"))
  end
  if r0_7.Common_Button_Close_PC and r0_7.Common_Button_Close_PC.BindEventOnClicked then
    r0_7.Common_Button_Close_PC:BindEventOnClicked(r0_7, r0_7.OnClickClose)
  end
  if r0_7.Common_Button_Text_PC and r0_7.Common_Button_Text_PC.BindEventOnClicked then
    r0_7.Common_Button_Text_PC:BindEventOnClicked(r0_7, r0_7.OnClickChallenge)
    if r0_7.Common_Button_Text_PC.BindForbidStateExecuteEvent then
      r0_7.Common_Button_Text_PC:BindForbidStateExecuteEvent(r0_7, r0_7.OnClickChallengeForbid)
    end
  end
  if r0_7.Btn_Coop and r0_7.Btn_Coop.BindEventOnClicked then
    r0_7.Btn_Coop:BindEventOnClicked(r0_7, r0_7.OnClickChallenge_Multi)
    if r0_7.Btn_Coop.BindForbidStateExecuteEvent then
      r0_7.Btn_Coop:BindForbidStateExecuteEvent(r0_7, r0_7.OnClickChallengeForbid)
    end
  end
  if r0_7.Btn_Qa then
    r0_7.Btn_Qa.Btn_Click.OnClicked:Add(r0_7, r0_7.OpenDetails)
  end
end
function r0_0.InitTeamInfo(r0_8)
  -- line: [160, 186] id: 8
  local r1_8 = r0_8:GetAttachWidget()
  if TeamController and TeamController.OpenHeadUI2 and not r0_8.TeamHeadUI then
    r0_8.TeamHeadUI = TeamController:OpenHeadUI2(r1_8)
    if r0_8.TeamHeadUI then
      function r0_8.TeamHeadUI.OnTeamMainFocusChanged(r0_9)
        -- line: [166, 183] id: 9
        local r1_9 = nil	-- notice: implicit variable refs by block#[14]
        if r0_9 then
          r1_9 = "Collapsed"
          if not r1_9 then
            ::label_5::
            r1_9 = "SelfHitTestInvisible"
          end
        else
          goto label_5	-- block#2 is visited secondly
        end
        local r2_9 = {}
        if r0_8.Btn_Coop and r0_8.Btn_Coop.Key_GamePad then
          table.insert(r2_9, r0_8.Btn_Coop.Key_GamePad)
        end
        if r0_8.Common_Button_Text_PC and r0_8.Common_Button_Text_PC.Key_GamePad then
          table.insert(r2_9, r0_8.Common_Button_Text_PC.Key_GamePad)
        end
        if r0_8.Key_Title_Rewards then
          table.insert(r2_9, r0_8.Key_Title_Rewards)
        end
        for r7_9, r8_9 in ipairs(r2_9) do
          if r8_9 and r8_9.SetVisibility then
            r8_9:SetVisibility(UIConst.VisibilityOp[r1_9])
          end
        end
        -- close: r3_9
      end
    end
  end
end
function r0_0.InitDungeonInfo(r0_10)
  -- line: [188, 215] id: 10
  local r1_10 = DataMgr.MultiplayerChallenge[r0_10.ChallengeId]
  local r2_10 = nil
  if r1_10 and type(r1_10.DungeonId) == "table" and #r1_10.DungeonId > 0 then
    r2_10 = r1_10.DungeonId[1]
  elseif r1_10 and type(r1_10.DungeonId) == "number" then
    r2_10 = r1_10.DungeonId
  end
  if r2_10 then
    r0_10.CurSelectedDungeonId = r2_10
    local r3_10 = DataMgr.Dungeon[r2_10].DungeonLevel
    if r3_10 then
      r0_10.Text_BossLv:SetText("Lv." .. r3_10)
    end
    r0_10:InitOrRefreshSquadPreset(r2_10)
    r0_10:RefreshMonsterInfoList(r2_10)
    r0_10:InitEliteItem(r2_10)
    r0_10:RefreshRewardsListByDungeon(r2_10)
    if PageJumpUtils and PageJumpUtils.CheckDungeonCondition and DataMgr.Dungeon[r2_10] then
      r0_10.IsLocked = not PageJumpUtils:CheckDungeonCondition(DataMgr.Dungeon[r2_10].Condition)
      r0_10:RefreshBtnState(false)
    end
  else
    DebugPrint("OnLoaded: No DungeonId configured for ChallengeId", tostring(r0_10.ChallengeId))
  end
end
function r0_0.InitEliteItem(r0_11, r1_11)
  -- line: [218, 257] id: 11
  if not r0_11.EliteItem then
    return 
  end
  r0_11.EliteItem.ParentPage = r0_11
  local r2_11 = DataMgr.Dungeon[r1_11]
  if not r2_11 then
    r0_11.EliteItem:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return 
  end
  local r3_11 = DataMgr.ModDungeon2RewardId[r1_11]
  if not r3_11 or #r3_11 == 0 then
    ScreenPrint("没找到对应地牢的精英怪物ID" .. tostring(r1_11))
    return 
  end
  local r4_11 = r3_11[1]
  if not r4_11 then
    r0_11.EliteItem:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return 
  end
  local r5_11 = DataMgr.ModDungeonMonReward[r4_11]
  if not r5_11 then
    r0_11.EliteItem:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return 
  end
  local r6_11 = {
    DungeonData = r2_11,
    MonRewardData = r5_11,
    ParentWidget = r0_11,
  }
  r0_11.EliteItem:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_11.EliteItem:OnListItemObjectSet(r6_11)
end
function r0_0.GetCurDungeonId(r0_12)
  -- line: [259, 263] id: 12
  return r0_12.CurSelectedDungeonId
end
function r0_0.OnClickChallenge(r0_13)
  -- line: [266, 295] id: 13
  local r1_13 = GWorld:GetAvatar()
  if not r1_13 then
    return 
  end
  local r2_13 = r0_13:GetCurDungeonId()
  if not r2_13 then
    return 
  end
  if not PageJumpUtils or not PageJumpUtils.CheckDungeonCondition or not PageJumpUtils:CheckDungeonCondition(DataMgr.Dungeon[r2_13].Condition) then
    if r0_13.OnClickChallengeForbid then
      r0_13:OnClickChallengeForbid()
    end
    return 
  end
  if r1_13:IsInTeam() then
    if TeamController and TeamController.GetModel then
      TeamController:GetModel().bPressedSolo = true
    end
    r0_13:EnterStandalone()
  else
    r0_13:OpenTicketDialog_Solo()
  end
end
function r0_0.OnClickClose(r0_14)
  -- line: [297, 299] id: 14
  r0_14:OnReturnKeyDown()
end
function r0_0.GetAttachWidget(r0_15)
  -- line: [302, 308] id: 15
  local r1_15 = r0_15.Group_Team and r0_15
  if r1_15 and r1_15.SetVisibility then
    r1_15:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  return r1_15
end
function r0_0.RefreshBtnState(r0_16, r1_16)
  -- line: [311, 348] id: 16
  local r2_16 = r1_16
  if r2_16 == nil and r0_16.IsMatching then
    r2_16 = r0_16:IsMatching()
  end
  local r3_16 = r2_16 and r0_16.IsLocked == true
  local r6_16 = nil	-- notice: implicit variable refs by block#[11, 17]
  if r0_16.Btn_Coop then
    local r4_16 = r0_16.Btn_Coop
    if r2_16 then
      r6_16 = UIConst.VisibilityOp.HitTestInvisible
      if not r6_16 then
        ::label_28::
        r6_16 = UIConst.VisibilityOp.SelfHitTestInvisible
      end
    else
      goto label_28	-- block#10 is visited secondly
    end
    r4_16:SetVisibility(r6_16)
    if r0_16.Btn_Coop.ForbidBtn then
      r0_16.Btn_Coop:ForbidBtn(r3_16)
    end
  end
  if r0_16.Common_Button_Text_PC then
    local r4_16 = r0_16.Common_Button_Text_PC
    if r2_16 then
      r6_16 = UIConst.VisibilityOp.HitTestInvisible
      if not r6_16 then
        ::label_52::
        r6_16 = UIConst.VisibilityOp.SelfHitTestInvisible
      end
    else
      goto label_52	-- block#16 is visited secondly
    end
    r4_16:SetVisibility(r6_16)
    if r0_16.Common_Button_Text_PC.ForbidBtn then
      r0_16.Common_Button_Text_PC:ForbidBtn(r3_16)
    end
  end
  local r4_16 = r0_16:GetCurDungeonId()
  if r4_16 then
    local r5_16 = DataMgr.Dungeon[r4_16]
    if r5_16 then
      r6_16 = r5_16.bDisableMatch
      if r6_16 then
        r0_16.Btn_Coop:SetVisibility(ESlateVisibility.Collapsed)
      end
    end
  end
end
function r0_0.IsMatching(r0_17)
  -- line: [351, 353] id: 17
  local r1_17 = TeamController
  if r1_17 then
    r1_17 = TeamController:GetModel():IsMatching() and false
  else
    goto label_10	-- block#2 is visited secondly
  end
  return r1_17
end
function r0_0.TryEnterDungeon(r0_18, r1_18, r2_18, r3_18, r4_18, r5_18)
  -- line: [356, 370] id: 18
  if not TeamController or not TeamController:DoCheckCanEnterDungeon(r2_18) then
    DebugPrint("DoCheckCanEnterDungeon bTeammateNotReady")
    if TeamController and TeamController:GetModel() then
      TeamController:GetModel().bPressedSolo = false
      TeamController:GetModel().bPressedMulti = false
    end
    return 
  end
  DebugPrint("TryEnterDungeon ", r1_18, r2_18, r3_18, r4_18, r5_18)
  r1_18:EnterDungeon(r2_18, r3_18, r4_18, r5_18, r0_18.SquadId and 0)
end
function r0_0.HandleEnterDungeonRetCode(r0_19, ...)
  -- line: [373, 384] id: 19
  DebugPrint("EnterDungeonCallback RetCode", r0_19)
  if r0_19 == ErrorCode.RET_SUCCESS then
    return true
  else
    if TeamController and TeamController.DoWhenEnterDungeonCheckFailed then
      TeamController:DoWhenEnterDungeonCheckFailed(r0_19, ...)
    end
    EventManager:FireEvent(EventID.TeamMatchTimingEnd)
    return false
  end
end
function r0_0.OnClickChallenge_Multi(r0_20)
  -- line: [387, 418] id: 20
  local r1_20 = GWorld:GetAvatar()
  assert(r1_20, "NO AVATAR")
  if not r1_20:CheckUIUnlocked("Match") then
    UIManager(r0_20):ShowUITip(UIConst.Tip_CommonToast, GText(DataMgr.UIUnlockRule.Match.UIUnlockDesc))
    return 
  end
  local r2_20 = r0_20:GetCurDungeonId()
  if not r2_20 then
    return 
  end
  if not PageJumpUtils:CheckDungeonCondition(DataMgr.Dungeon[r2_20].Condition) then
    UIManager(r0_20):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Tosat_Level_Locked"))
    return 
  end
  if r0_20:IsAnimationPlaying(r0_20.Out_Loading) then
    return 
  end
  r0_20:TryEnterMultiDungeon(r2_20)
end
function r0_0.TryEnterMultiDungeon(r0_21, r1_21)
  -- line: [421, 448] id: 21
  TeamController:GetModel().bPressedMulti = true
  local r2_21 = GWorld:GetAvatar()
  assert(r2_21, "NO AVATAR")
  r0_21:TryEnterDungeon(r2_21, r1_21, CommonConst.DungeonNetMode.DedicatedServer, function(r0_22, ...)
    -- line: [430, 444] id: 22
    local r1_22 = r0_0.HandleEnterDungeonRetCode(r0_22, ...)
    DebugPrint("@WBP_AreaCoop_LevelChoose_C:OnClickChallenge_Multi", r1_22)
    if r1_22 then
      if r2_21:IsInTeam() then
        UIManager(r0_21):LoadUINew("DungeonMatchTimingBar", r1_21, Const.DUNGEON_MATCH_BAR_STATE.SPONSOR_WAITING_CONFIRM, true)
      else
        UIManager(r0_21):LoadUINew("DungeonMatchTimingBar", r1_21, Const.DUNGEON_MATCH_BAR_STATE.WAITING_MATCHING_WITH_CANCEL, true)
      end
    end
  end, r0_21.TicketId)
  r0_21:RefreshBtnState()
end
function r0_0.OpenTicketDialog_Solo(r0_23)
  -- line: [451, 467] id: 23
  local r1_23 = r0_23:GetCurDungeonId()
  if not r1_23 then
    return 
  end
  UIManager(r0_23):ShowCommonPopupUI(100123, {
    DungeonId = r1_23,
    RightCallbackObj = r0_23,
    RightCallbackFunction = function(r0_24, r1_24)
      -- line: [459, 463] id: 24
      local r2_24 = nil	-- notice: implicit variable refs by block#[4]
      if r1_24 then
        r2_24 = r1_24.Content_1
        if r2_24 then
          r2_24 = r1_24.Content_1.TicketId
          if not r2_24 then
            ::label_9::
            r2_24 = nil
          end
        end
      else
        goto label_9	-- block#3 is visited secondly
      end
      r0_23.TicketId = r2_24
      r0_23:EnterStandalone(r2_24)
    end,
    ForbiddenRightCallbackObj = r0_23,
    AutoFocus = true,
  }, r0_23)
end
function r0_0.OpenTicketDialog_Multi(r0_25)
  -- line: [470, 485] id: 25
  local r1_25 = r0_25:GetCurDungeonId()
  if not r1_25 then
    return 
  end
  UIManager(r0_25):ShowCommonPopupUI(100123, {
    DungeonId = r1_25,
    RightCallbackObj = r0_25,
    RightCallbackFunction = function(r0_26, r1_26)
      -- line: [478, 481] id: 26
      local r2_26 = nil	-- notice: implicit variable refs by block#[4]
      if r1_26 then
        r2_26 = r1_26.Content_1
        if r2_26 then
          r2_26 = r1_26.Content_1.TicketId
          if not r2_26 then
            ::label_9::
            r2_26 = nil
          end
        end
      else
        goto label_9	-- block#3 is visited secondly
      end
      r0_25.TicketId = r2_26
      r0_25:TryEnterMultiDungeon(r1_25)
    end,
    ForbiddenRightCallbackObj = r0_25,
    AutoFocus = true,
  }, r0_25)
end
function r0_0.TeamMatchTimingStart(r0_27)
  -- line: [488, 496] id: 27
  if TeamController and TeamController.GetModel then
    TeamController:GetModel().bPressedSolo = true
    TeamController:GetModel().bPressedMulti = true
  end
  r0_27:RefreshBtnState(true)
end
function r0_0.TeamMatchTimingEnd(r0_28)
  -- line: [498, 506] id: 28
  if TeamController and TeamController.GetModel then
    TeamController:GetModel().bPressedSolo = false
    TeamController:GetModel().bPressedMulti = false
  end
  r0_28:RefreshBtnState(false)
end
function r0_0.EnterStandalone(r0_29, r1_29)
  -- line: [509, 568] id: 29
  local r2_29 = GWorld:GetAvatar()
  assert(r2_29, "NO AVATAR")
  local r3_29 = r0_29:GetCurDungeonId()
  if not r3_29 then
    DebugPrint("EnterStandalone DungeonId is nil")
    return 
  end
  if r2_29:IsInTeam() and TeamController and TeamController.GetModel then
    TeamController:GetModel().bPressedSolo = true
  end
  r0_29.IsSoloStart = true
  if not TeamController or not TeamController:DoCheckCanEnterDungeon(r3_29) then
    DebugPrint("EnterStandalone PreCheck Failed: TeammateNotReady or ConditionNotMet")
    if TeamController and TeamController:GetModel() then
      TeamController:GetModel().bPressedSolo = false
      TeamController:GetModel().bPressedMulti = false
    end
    return 
  end
  r0_29:RefreshBtnState(true)
  local r4_29 = r1_29
  if r4_29 == nil then
    r4_29 = r0_29.TicketId
  end
  if r4_29 == nil then
    r4_29 = -1
  end
  r0_29:TryEnterDungeon(r2_29, r3_29, CommonConst.DungeonNetMode.Standalone, function(r0_30, ...)
    -- line: [549, 566] id: 30
    if r0_0.HandleEnterDungeonRetCode(r0_30, ...) then
      if r2_29:IsInTeam() then
        UIManager(r0_29):LoadUINew("DungeonMatchTimingBar", r3_29, Const.DUNGEON_MATCH_BAR_STATE.SPONSOR_WAITING_CONFIRM, false)
        r0_29:RefreshBtnState(true)
      else
        r0_29:SetDungeonExitInfo()
        r0_29:OnReturnKeyDown()
      end
    else
      r0_29:RefreshBtnState(false)
    end
  end, r4_29)
end
function r0_0.OnReturnKeyDown(r0_31)
  -- line: [571, 595] id: 31
  if r0_31:IsAnimationPlaying(r0_31.Out) then
    return 
  end
  if r0_31.DefaultList and r0_31.DefaultList.GetVisibility and r0_31.DefaultList:GetVisibility() == UE4.ESlateVisibility.SelfHitTestInvisible and r0_31.DefaultList.IsShow then
    r0_31.DefaultList:OnCloseSquadGamepad()
    return 
  end
  r0_31:EndInteractive()
  r1_0:Clear()
  r0_31.TeamHeadUI:PlayAnimation(r0_31.TeamHeadUI.Auto_Out)
  if r0_31.Out then
    r0_31:PlayAnimation(r0_31.Out)
    r0_31:UnbindAllFromAnimationFinished(r0_31.Out)
    r0_31:BindToAnimationFinished(r0_31.Out, function()
      -- line: [589, 591] id: 32
      r0_31:Close()
    end)
  else
    r0_31:Close()
  end
end
function r0_0.EndInteractive(r0_33)
  -- line: [597, 612] id: 33
  local r1_33 = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  if not r1_33 then
    return 
  end
  local r2_33 = r1_33:GetMyPawn()
  if not r2_33 then
    return 
  end
  local r4_33 = Battle(r0_33):GetEntity(r2_33.MechanismEid)
  if r4_33 then
    DebugPrint("@WBP_AreaCoop_LevelChoose_C:EndInteractive")
    r4_33:EndInteractive(r2_33, true)
  end
end
function r0_0.OnKeyDown(r0_34, r1_34, r2_34)
  -- line: [614, 635] id: 34
  local r3_34 = false
  local r4_34 = UE4.UKismetInputLibrary.GetKey(r2_34)
  local r5_34 = UE4.UFormulaFunctionLibrary.Key_GetFName(r4_34)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r4_34) then
    r0_34.IsGamePad = true
    r3_34 = r0_34:OnGamePadDown(r5_34)
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    r0_34.IsGamePad = false
    if r5_34 == "Escape" then
      r0_34:OnReturnKeyDown()
      r3_34 = true
    elseif r5_34 == "N" then
      r0_34.ScrollBox_Desc:ScrollWidgetIntoView(r0_34.HB_Title_Monster)
      r3_34 = true
    end
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end
function r0_0.OnGamePadDown(r0_35, r1_35)
  -- line: [637, 760] id: 35
  r0_35.PressedKeys = r0_35.PressedKeys and {}
  r0_35.PressedKeys[r1_35] = true
  local r2_35 = r0_35.PressedKeys[UIConst.GamePadKey.DPadUp] == true
  if r1_35 == UIConst.GamePadKey.FaceButtonTop then
    if r0_35.Common_Button_Text_PC and r0_35.Common_Button_Text_PC.IsForbidden and r0_35.OnClickChallengeForbid then
      r0_35:OnClickChallengeForbid()
    elseif r0_35.OnClickChallenge then
      r0_35:OnClickChallenge()
    end
    return true
  elseif r1_35 == UIConst.GamePadKey.FaceButtonLeft then
    if r0_35.Btn_Coop and r0_35.Btn_Coop.IsForbidden and r0_35.OnClickChallengeForbid then
      r0_35:OnClickChallengeForbid()
    elseif r0_35.OnClickChallenge_Multi then
      r0_35:OnClickChallenge_Multi()
    end
    return true
  elseif r1_35 == UIConst.GamePadKey.LeftThumb then
    if r0_35.EnterSelectMode then
      r0_35:EnterSelectMode(r0_35.EliteItem.List_EliteProp)
    end
    return true
  elseif r1_35 == UIConst.GamePadKey.RightThumb then
    r0_35:OpenDetails()
    return true
  elseif r1_35 == UIConst.GamePadKey.DPadRight and r0_35.OnDPadRightToggleAutoSummon and (not r0_35.IsFocusList or not r0_35:IsFocusList()) and r0_35:OnDPadRightToggleAutoSummon() then
    return true
  elseif r1_35 == UIConst.GamePadKey.DPadLeft then
    local r3_35 = r0_35.DefaultList
    if r3_35 and r3_35.IsMenuAnchorOpen and r3_35:IsMenuAnchorOpen() then
      return true
    end
    if r0_35.OnDPadLeftOpenDefaultMenuAnchor and (not r0_35.IsFocusList or not r0_35:IsFocusList()) and r0_35:OnDPadLeftOpenDefaultMenuAnchor() then
      return true
    end
  elseif r1_35 == UIConst.GamePadKey.FaceButtonRight then
    local r3_35 = r0_35.DefaultList and r0_35.EnsurePlatformDefaultListLoaded and r0_35:EnsurePlatformDefaultListLoaded()
    if r0_35.DefaultList.Preview.Btn_Qa_Summon.Btn_Click:IsChecked() then
      r0_35.DefaultList.Preview:CloseMenuAnchor()
      r3_35:CloseMenuAnchor()
      return true
    end
    if r0_35.OnBKeyCloseDefaultList and r0_35:OnBKeyCloseDefaultList() then
      if r0_35.UpdateSquadPresetBottomKey then
        r0_35:UpdateSquadPresetBottomKey()
      end
      if r0_35.SelectCellFocus then
        r0_35:SelectCellFocus()
      end
      return true
    end
    if r0_35.IsInSelectState and r0_35.LeaveSelectMode then
      r0_35:LeaveSelectMode()
      return true
    end
    local r4_35 = false
    if r0_35.TeamHeadUI and (r0_35.TeamHeadUI:HasFocusedDescendants() or r0_35.TeamHeadUI:HasAnyUserFocus()) then
      r0_35.bShoulFocusToLastFocusedWidget = true
      r4_35 = true
    end
    if r4_35 then
      r0_35:LeaveSelectMode()
      return true
    end
    if r0_35.OnReturnKeyDown then
      r0_35:OnReturnKeyDown()
    end
    return true
  elseif r1_35 == UIConst.GamePadKey.SpecialRight and r0_35.TeamHeadUI and r0_35.TeamHeadUI.DoGamepadBtnPress then
    r0_35.TeamHeadUI:DoGamepadBtnPress()
    return true
  end
  return false
end
function r0_0.SelectCellFocus(r0_36)
  -- line: [763, 772] id: 36
  if r0_36.SetFocus then
    r0_36:SetFocus()
  end
end
function r0_0.OnKeyUp(r0_37, r1_37, r2_37)
  -- line: [774, 819] id: 37
  local r4_37 = UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_37))
  r0_37.PressedKeys = r0_37.PressedKeys and {}
  r0_37.PressedKeys[r4_37] = false
  if r4_37 == UIConst.GamePadKey.SpecialRight then
    if r0_37.TeamHeadUI then
      r0_37.TeamHeadUI:DoGamepadBtnRelease()
    end
    local r5_37 = r0_37.DefaultList
    if r5_37 and r5_37.OnSpecialRightUp then
      local r6_37 = false
      if r0_37.TeamHeadUI then
        if r0_37.TeamHeadUI.HasFocusedDescendants and r0_37.TeamHeadUI:HasFocusedDescendants() then
          r6_37 = true
        elseif r0_37.TeamHeadUI.HasAnyUserFocus and r0_37.TeamHeadUI:HasAnyUserFocus() then
          r6_37 = true
        end
      end
      if not r6_37 then
        r5_37:OnSpecialRightUp()
        if r0_37.UpdateSquadPresetBottomKey then
          r0_37:UpdateSquadPresetBottomKey()
        end
        if r5_37.IsShow and r5_37.List_Default and r5_37.List_Default.NavigateToIndex then
          r5_37.List_Default:NavigateToIndex(0)
          r0_37.CurrentFocusType = "DefaultList"
        elseif r0_37.SelectCellFocus then
          r0_37:SelectCellFocus()
        elseif r0_37.SetFocus then
          r0_37:SetFocus()
        end
      end
    end
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end
function r0_0.OnAnalogValueChanged(r0_38, r1_38, r2_38)
  -- line: [823, 836] id: 38
  if UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_38)) == UIConst.GamePadKey.RightAnalogY and r0_38.ScrollBox_Desc and r0_38.ScrollBox_Desc.GetScrollOffset and not r0_38.ScrollBox_Desc:HasFocusedDescendants() then
    local r5_38 = UE4.UKismetInputLibrary.GetAnalogValue(r2_38)
    if r5_38 ~= nil then
      r0_38:AddDeltaOffset(r5_38 * -1 * 20)
    end
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end
function r0_0.AddDeltaOffset(r0_39, r1_39)
  -- line: [839, 853] id: 39
  if not r0_39.ScrollBox_Desc or not r0_39.ScrollBox_Desc.GetScrollOffset or not r0_39.ScrollBox_Desc.SetScrollOffset then
    return 
  end
  local r2_39 = r0_39.ScrollBox_Desc:GetScrollOffset()
  local r3_39 = 0
  if r0_39.ScrollBox_Desc.GetScrollOffsetOfEnd then
    r3_39 = r0_39.ScrollBox_Desc:GetScrollOffsetOfEnd()
  else
    r3_39 = r2_39 + math.abs((r1_39 and 0)) + 1000
  end
  r0_39.ScrollBox_Desc:SetScrollOffset(math.min(math.max(r2_39 + (r1_39 and 0), 0), r3_39))
end
function r0_0.InitBaseInfo(r0_40)
  -- line: [861, 882] id: 40
  local r1_40 = r1_0:GetTitleName()
  if r0_40.Text_BossLevel and r1_40 then
    r0_40.Text_BossLevel:SetText(GText(r1_40))
  end
  local r2_40 = r1_0:GetTeleportName()
  if r0_40.Text_BossName and r2_40 then
    r0_40.Text_BossName:SetText(GText(r2_40))
  end
  local r3_40 = r1_0:GetChallengeName()
  if r0_40.Text_BossDetail and r3_40 then
    r0_40.Text_BossDetail:SetText(GText(r3_40))
  end
  r0_40:SetImageIcon()
end
function r0_0.SetImageIcon(r0_41, r1_41)
  -- line: [884, 895] id: 41
  local r2_41 = r1_0:GetChallengeIconPath()
  if r2_41 ~= nil then
    local r3_41 = LoadObject(r2_41)
    if not r3_41:IsA(UE4.UTexture2D) then
      DebugPrint("IconPath需要纹理类型: 请检查填的路径: " .. tostring(r3_41))
      return 
    end
    r0_41.Image_LinShiImage:GetDynamicMaterial():SetTextureParameterValue("IconMap", r3_41)
  end
end
function r0_0.OpenDetails(r0_42)
  -- line: [896, 903] id: 42
  UIManager(r0_42):LoadUINew("ItemInformation", {
    Name = r1_0:GetChallengeName(),
    Desc = r1_0:GetChallengeDes(),
  }, "LevelDatail")
end
function r0_0.ToggleSquadPresetVisible(r0_43, r1_43)
  -- line: [907, 915] id: 43
  local r2_43 = nil	-- notice: implicit variable refs by block#[4, 6]
  if r1_43 then
    r2_43 = UE4.ESlateVisibility.SelfHitTestInvisible
    if not r2_43 then
      ::label_7::
      r2_43 = UE4.ESlateVisibility.Collapsed
    end
  else
    goto label_7	-- block#2 is visited secondly
  end
  if r0_43.Group_PC then
    r0_43.Group_PC:SetVisibility(r2_43)
  end
  if r0_43.Group_Mob then
    r0_43.Group_Mob:SetVisibility(r2_43)
  end
end
function r0_0.EnsurePlatformDefaultListLoaded(r0_44)
  -- line: [917, 999] id: 44
  local r1_44 = CommonUtils.GetDeviceTypeByPlatformName(r0_44) == "Mobile"
  local r2_44 = nil	-- notice: implicit variable refs by block#[21, 22, 23]
  if r1_44 then
    r2_44 = r0_44.Group_Mob
    if not r2_44 then
      ::label_13::
      r2_44 = r0_44.Group_PC
    end
  else
    goto label_13	-- block#5 is visited secondly
  end
  local r3_44 = nil	-- notice: implicit variable refs by block#[15, 16]
  if r1_44 then
    r3_44 = r5_0
    if not r3_44 then
      ::label_19::
      r3_44 = r4_0
    end
  else
    goto label_19	-- block#8 is visited secondly
  end
  local r4_44 = nil	-- notice: implicit variable refs by block#[12, 13, 14, 17]
  if r1_44 then
    r4_44 = "DefaultList_Mob"
    if not r4_44 then
      ::label_25::
      r4_44 = "DefaultList_PC"
    end
  else
    goto label_25	-- block#11 is visited secondly
  end
  if r0_44[r4_44] and IsValid(r0_44[r4_44]) then
    r0_44.DefaultList = r0_44[r4_44]
  else
    local r5_44 = LoadClass(r3_44)
    if not r5_44 then
      DebugPrint("EnsurePlatformDefaultListLoaded: LoadClass failed", r3_44)
      return nil
    end
    local r6_44 = NewObject(r5_44, r0_44)
    r0_44[r4_44] = r6_44
    if r6_44.IsLeft ~= nil then
      r6_44.IsLeft = true
    end
    if r6_44.NeedLeft then
      r6_44.NeedLeft = true
    end
    if r2_44 and r2_44.AddChild then
      r2_44:ClearChildren()
      r2_44:AddChild(r6_44)
    else
      DebugPrint("EnsurePlatformDefaultListLoaded: TargetGroup missing or no AddChild")
    end
    r0_44.DefaultList = r6_44
    local r7_44 = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(r6_44)
    if r7_44 then
      r7_44:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
      r7_44:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
    end
  end
  if r1_44 then
    if r0_44.Group_PC then
      r0_44.Group_PC:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    if r0_44.Group_Mob then
      r0_44.Group_Mob:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  else
    if r0_44.Group_Mob then
      r0_44.Group_Mob:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    if r0_44.Group_PC then
      r0_44.Group_PC:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
    if nil and not nil then
      goto label_133	-- block#37 is visited secondly
    end
  end
  local r5_44 = r0_44.DefaultList
  if r5_44 then
    r5_44 = r0_44.DefaultList.OnMenuOpenChangedCallBack
    function r0_44.DefaultList.OnMenuOpenChangedCallBack(r0_45, r1_45)
      -- line: [985, 992] id: 45
      if r0_44.UpdateSquadPresetBottomKey then
        r0_44:UpdateSquadPresetBottomKey()
      end
      if type(r5_44) == "function" then
        r5_44(r0_45, r1_45)
      end
    end
    if r0_44.UpdateSquadPresetBottomKey then
      r0_44:UpdateSquadPresetBottomKey()
    end
    -- close: r5_44
  end
  r5_44 = r0_44.DefaultList
  return r5_44
end
function r0_0.InitOrRefreshSquadPreset(r0_46, r1_46)
  -- line: [1003, 1069] id: 46
  local r2_46 = DataMgr.Dungeon[r1_46]
  if not r2_46 then
    return 
  end
  local r3_46 = r2_46.Squad
  if r3_46 then
    r3_46 = true and false
  else
    goto label_12	-- block#4 is visited secondly
  end
  r0_46:ToggleSquadPresetVisible(r3_46)
  if not r3_46 then
    return 
  end
  local r4_46 = r0_46:EnsurePlatformDefaultListLoaded()
  if not r4_46 then
    DebugPrint("InitOrRefreshSquadPreset: DefaultList is nil")
    return 
  end
  local r5_46 = false
  local r6_46 = r2_46.DungeonType and r2_46.Type
  if r6_46 == "Rouge" then
    r5_46 = true
  end
  local r7_46 = GWorld:GetAvatar()
  local r8_46 = 0
  if r7_46 and r7_46.DungeonSquad and r6_46 and r7_46.DungeonSquad[r6_46] then
    r8_46 = r7_46.DungeonSquad[r6_46]
  end
  r0_46.SquadId = r8_46
  if r4_46.Init then
    r4_46:Init(r0_46, r5_46, r8_46, r1_46)
  end
  local r9_46 = UIUtils.UtilsGetCurrentInputType()
  if r9_46 == ECommonInputType.MouseAndKeyboard and r0_46.DefaultList.ApplyPcUiLayout then
    r0_46.DefaultList:ApplyPcUiLayout()
  elseif r9_46 == ECommonInputType.Gamepad and r0_46.DefaultList.InitWidgetInfoInGamePad then
    r0_46.DefaultList:InitWidgetInfoInGamePad()
  end
  if r4_46 then
    local r10_46 = r4_46.OnMenuOpenChangedCallBack
    function r4_46.OnMenuOpenChangedCallBack(r0_47, r1_47)
      -- line: [1049, 1060] id: 47
      r0_46:UpdateSquadPresetKeyTips(r1_47)
      if r0_46.UpdateSquadPresetBottomKey then
        r0_46:UpdateSquadPresetBottomKey()
      end
      if type(r10_46) == "function" then
        r10_46(r0_47, r1_47)
      end
    end
    local r11_46 = r4_46.IsMenuAnchorOpen
    if r11_46 then
      r11_46 = r4_46:IsMenuAnchorOpen() and false
    else
      goto label_100	-- block#29 is visited secondly
    end
    r0_46:UpdateSquadPresetKeyTips(r11_46)
    if r0_46.UpdateSquadPresetBottomKey then
      r0_46:UpdateSquadPresetBottomKey()
    end
    -- close: r10_46
  end
end
function r0_0.RefreshMonsterInfoList(r0_48, r1_48)
  -- line: [1071, 1112] id: 48
  local r2_48 = r1_0:GetMonsterPreviewData(r1_48)
  if not r2_48 or not r2_48.List or #r2_48.List == 0 then
    r0_48.ListView_Monster:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return 
  end
  r0_48.MonsterWeaknessIcon = r2_48.WeaknessIcon and {}
  r0_48.ListView_Monster:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  if r0_48.ListView_Monster.ClearListItems then
    r0_48.ListView_Monster:ClearListItems()
  end
  r0_48.MonsterIdToItem = {}
  r0_48.DisplayMonsters = r2_48.List
  r0_48.NowSelectingIndex = 1
  local r3_48 = LoadClass("/Game/UI/WBP/Play/Widget/Depute/MonsterInfo_Tab_Item_Content.MonsterInfo_Tab_Item_Content")
  local r4_48 = UE4.UGameplayStatics.GetGameState(r0_48)
  for r9_48, r10_48 in ipairs(r2_48.List) do
    if DataMgr.Monster[r10_48] and r4_48.IsUnitRelease(r10_48) then
      local r12_48 = NewObject(r3_48)
      r12_48.ParentWidget = r0_48
      r12_48.MonsterId = r10_48
      r12_48.DisableSelect = true
      r12_48.SoundEvent = "event:/ui/common/click_mid"
      r12_48.WeaknessIcon = r0_48.MonsterWeaknessIcon[r10_48]
      r12_48.NeedFocusable = true
      r12_48.List = r0_48.ListView_Monster
      r12_48.OnAddedToFocusPathEvent = {
        Obj = r12_48,
        Callback = function(r0_49)
          -- line: [1105, 1107] id: 49
          r0_48:OnItemFocus(r0_49)
        end,
      }
      r0_48.ListView_Monster:AddItem(r12_48)
    end
  end
  -- close: r5_48
end
function r0_0.SelectMonsterInfoItem(r0_50, r1_50)
  -- line: [1115, 1117] id: 50
  UIManager(r0_50):LoadUINew("MonsterDetailInfo", r0_50.CurSelectedDungeonId, r0_50, r1_50)
end
function r0_0.RefreshRewardsListByDungeon(r0_51, r1_51)
  -- line: [1119, 1153] id: 51
  if not r0_51.ListView_Rewards then
    return 
  end
  r0_51.ListView_Rewards:ClearListItems()
  local r2_51 = r1_0:GetRewardPreviewData(r1_51)
  if not r2_51 or #r2_51 == 0 then
    r0_51.Group_Title_Rewards:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_51.ListView_Rewards:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return 
  end
  r0_51.Group_Title_Rewards:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_51.ListView_Rewards:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  for r6_51 = 1, #r2_51, 1 do
    local r7_51 = r2_51[r6_51]
    local r8_51 = NewObject(UIUtils.GetCommonItemContentClass())
    r8_51.UIName = "AreaCoopLevelChoose"
    r8_51.IsShowDetails = true
    r8_51.Id = r7_51.Id
    r8_51.Icon = r7_51.Icon
    r8_51.Rarity = r7_51.Rarity
    r8_51.ItemType = r7_51.Type
    r8_51.NeedFocusable = true
    r8_51.List = r0_51.ListView_Rewards
    r8_51.OnAddedToFocusPathEvent = {
      Obj = r8_51,
      Callback = function(r0_52)
        -- line: [1146, 1148] id: 52
        r0_51:OnItemFocus(r0_52)
      end,
    }
    r0_51.ListView_Rewards:AddItem(r8_51)
  end
end
function r0_0.SetTabItemSelection(r0_53, r1_53)
  -- line: [1157, 1162] id: 53
  if r0_53.SelectingItem and r0_53.SelectingItem ~= r1_53 and r0_53.SelectingItem.CancelTabSelect then
    r0_53.SelectingItem:CancelTabSelect()
  end
  r0_53.SelectingItem = r1_53
end
function r0_0.OnClickChallengeForbid(r0_54)
  -- line: [1165, 1174] id: 54
  local r1_54 = r0_54:GetCurDungeonId()
  if not r1_54 then
    return 
  end
  local r2_54 = GWorld:GetAvatar()
  if r2_54 and DataMgr.Dungeon[r1_54] and ConditionUtils and ConditionUtils.CheckCondition then
    ConditionUtils.CheckCondition(r2_54, DataMgr.Dungeon[r1_54].Condition, true)
  else
    UIManager(r0_54):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Tosat_Level_Locked"))
  end
end
function r0_0.OnCurrentSquadChange(r0_55, r1_55, r2_55, r3_55)
  -- line: [1177, 1184] id: 55
  local r4_55 = r1_55 and 0
  r0_55.SquadId = r4_55
  if r2_55 then
    r4_55 = true and false
  else
    goto label_9	-- block#4 is visited secondly
  end
  r0_55.IsComMissing = r4_55
  if r0_55.IsComMissing and r0_55.DefaultList and r0_55.DefaultList:GetVisibility() == UE4.ESlateVisibility.SelfHitTestInvisible then
    UIManager(r0_55):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Squad_Miss_Challenge"))
  end
end
function r0_0.ScrollItemIntoView(r0_56, r1_56)
  -- line: [1186, 1189] id: 56
  DebugPrint("ScrollItemIntoView")
  r0_56.ScrollBox_Desc:ScrollWidgetIntoView(r1_56)
end
function r0_0.RefreshOpInfoByInputDevice(r0_57, r1_57, r2_57)
  -- line: [1191, 1191] id: 57
end
function r0_0.OnInputDeviceChanged(r0_58, r1_58, r2_58)
  -- line: [1193, 1193] id: 58
end
function r0_0.InitWidgetInfoInGamePad(r0_59)
  -- line: [1196, 1196] id: 59
end
function r0_0.SetKeyWidgetGamePadVisibility(r0_60, r1_60, r2_60)
  -- line: [1200, 1200] id: 60
end
function r0_0.InitGamepadView(r0_61)
  -- line: [1202, 1202] id: 61
end
function r0_0.InitKeyboardView(r0_62)
  -- line: [1204, 1204] id: 62
end
function r0_0.UpdateUIStyleInPlatform(r0_63, r1_63)
  -- line: [1238, 1238] id: 63
end
function r0_0.UpdateSquadPresetKeyTips(r0_64, r1_64)
  -- line: [1240, 1240] id: 64
end
function r0_0.SetDungeonExitInfo(r0_65)
  -- line: [1243, 1247] id: 65
  GWorld.GameInstance:SetExitDungeonData({
    IsFromRegionMechanism = true,
  })
end
AssembleComponents(r0_0)
return r0_0
