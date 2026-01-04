-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Client\Entities\Components\SettlementOnlineMgr.lua
-- version: lua54
-- line: [0, 0] id: 0
return {
  PlayerEnterSettlementOnlineArea = function(r0_1, r1_1)
    -- line: [11, 14] id: 1
    DebugPrint("gmy@PlayerEnterSettlementOnlineArea", #r1_1, table.concat(r1_1, " "))
    r0_1.SettlementUidArray = r1_1
  end,
  PlayerExitSettlementOnlineArea = function(r0_2, r1_2)
    -- line: [17, 29] id: 2
    DebugPrint("gmy@PlayerExitSettlementOnlineArea", r1_2)
    if r0_2.SettlementUidArray then
      for r6_2, r7_2 in ipairs(r0_2.SettlementUidArray) do
        if r7_2 == r1_2 then
          table.remove(r0_2.SettlementUidArray, r6_2)
          break
        end
      end
      -- close: r2_2
    end
    local r2_2 = DebugPrint
    local r3_2 = "gmy@PlayerExitSettlementOnlineArea End"
    local r4_2 = r1_2
    local r5_2 = r0_2.SettlementUidArray
    if r5_2 then
      r5_2 = #r0_2.SettlementUidArray and 0
    else
      goto label_32	-- block#8 is visited secondly
    end
    r2_2(r3_2, r4_2, r5_2)
  end,
  OnExitSettlement = function(r0_3)
    -- line: [32, 35] id: 3
    DebugPrint("gmy@OnExitSettlement")
    r0_3.SettlementUidArray = nil
  end,
  IsInMultiSettlement = function(r0_4)
    -- line: [38, 41] id: 4
    local r1_4 = DebugPrint
    local r2_4 = "gmy@SettlementOnlineMgr Component:IsInMultiSettlement"
    local r3_4 = r0_4.SettlementUidArray
    local r4_4 = r0_4.SettlementUidArray
    if r4_4 then
      r4_4 = #r0_4.SettlementUidArray and 0
    else
      goto label_10	-- block#2 is visited secondly
    end
    r1_4(r2_4, r3_4, r4_4)
    return r0_4.SettlementUidArray and #r0_4.SettlementUidArray > 1
  end,
  NotifySettlementAreaPlayerSelectWalnut = function(r0_5, r1_5, r2_5)
    -- line: [44, 47] id: 5
    DebugPrint("NotifySettlementAreaPlayerSelectWalnut", r1_5, r2_5)
    EventManager:FireEvent(EventID.SettlementSelectWalnut, r1_5, r2_5)
  end,
  NotifySettlementAreaPlayerSelectTicket = function(r0_6, r1_6, r2_6)
    -- line: [50, 52] id: 6
    DebugPrint("NotifySettlementAreaPlayerSelectTicket", r1_6, r2_6)
  end,
  SettlementBattleEvent = function(r0_7, r1_7, ...)
    -- line: [54, 62] id: 7
    print(_G.LogTag, "SettlementBattleEvent", r1_7)
    local r2_7 = r0_7["SettlementBattleEvent_" .. r1_7]
    if r2_7 then
      r2_7(r0_7, ...)
    else
      print(_G.LogTag, "Unknown SettlementBattleEvent", r1_7)
    end
  end,
  SettlementBattleEvent_StartVote = function(r0_8, r1_8, r2_8)
    -- line: [65, 79] id: 8
    DebugPrint("gmy@Component:SettlementBattleEvent_StartVote", r1_8)
    assert(GWorld:GetAvatar(), "Avatar is nil")
    local r4_8 = UIManager(r0_8):GetUI("DungeonMatchTimingBar")
    if r4_8 and r4_8.bClosing then
      UIManager(r0_8):UnLoadUINew("DungeonMatchTimingBar")
    end
    UIManager(r0_8):LoadUINew("DungeonMatchTimingBar", r1_8, Const.DUNGEON_MATCH_BAR_STATE.TEAMMATE_CONFIRMING, r2_8)
    TeamController:RecvTeamOnVoteStart(r1_8)
  end,
  SettlementBattleEvent_OnMemberVote = function(r0_9, r1_9)
    -- line: [82, 85] id: 9
    DebugPrint(DebugTag, LXYTag, "TeamBattleEvent_OnMemberVote", r1_9)
    TeamController:RecvTeamOnVoteAgreed(r1_9)
  end,
  SettlementBattleEvent_Refused = function(r0_10, r1_10)
    -- line: [88, 96] id: 10
    DebugPrint("gmy@SettlementOnlineMgr Component:SettlementBattleEvent_Refused", r1_10, r0_10.Uid)
    EventManager:FireEvent(EventID.TeamMatchOneRefused, r1_10)
    TeamController:RecvTeamOnVoteRefused(r1_10)
    if r1_10 ~= r0_10.Uid then
      UIManager(r0_10):ShowUITip("CommonToastMain", GText("TOAST_DUNGEON_CANCEL_REJECT"), 1.5)
    end
  end,
  SettlementBattleEvent_SelectWalnut = function(r0_11, r1_11)
    -- line: [99, 103] id: 11
    DebugPrint("gmy@SettlementOnlineMgr Component:SettlementBattleEvent_SelectWalnut", r1_11)
    UIManager(r0_11):LoadUINew("WalnutChoice", CommonConst.WalnutUser.Settlement, r1_11, GWorld.GameInstance.CombatData.TempTeamInfo)
    EventManager:FireEvent(EventID.SelectWalnut)
  end,
  SettlementBattleEvent_WalnutSelectComplete = function(r0_12)
    -- line: [106, 109] id: 12
    DebugPrint("gmy@SettlementOnlineMgr Component:SettlementBattleEvent_WalnutSelectComplete")
    EventManager:FireEvent(EventID.WalnutSelectComplete)
  end,
  SettlementBattleEvent_SelectTicket = function(r0_13, r1_13)
    -- line: [112, 157] id: 13
    DebugPrint("gmy@SettlementOnlineMgr Component:SettlementBattleEvent_SelectTicket", r1_13)
    EventManager:FireEvent(EventID.SelectTicket)
    local function r2_13()
      -- line: [115, 122] id: 14
      local r0_14 = GWorld:GetAvatar()
      if not r0_14 then
        assert(r0_14, "Avatar is nil")
        return nil
      end
      return r0_14
    end
    local function r4_13()
      -- line: [139, 144] id: 17
      local r0_17 = r2_13()
      if r0_17 then
        r0_17:VoteStartBattle(false)
      end
    end
    local r6_13 = UIManager(r0_13):ShowCommonPopupUI(100123, {
      DungeonId = r1_13,
      RightCallbackFunction = function(r0_15, r1_15)
        -- line: [123, 137] id: 15
        local r2_15 = r2_13()
        if not r2_15 then
          return 
        end
        DebugPrint("gmy@SettlementOnlineMgr SelectTicket", r1_13, r1_15.Content_1.TicketId)
        r2_15:SelectTicket(function()
          -- line: [129, 135] id: 16
          if #r0_13.SettlementUidArray <= 1 then
            UIManager(r0_13):LoadUINew("DungeonMatchTimingBar", r1_13, Const.DUNGEON_MATCH_BAR_STATE.WAITING_MATCHING_WITH_CANCEL, true)
          end
        end, r1_13, r1_15.Content_1.TicketId)
      end,
      LeftCallbackFunction = r4_13,
      CloseBtnCallbackFunction = r4_13,
      DontCloseWhenRightBtnClicked = true,
      AutoFocus = true,
      YesButtonText = GText("UI_CONFIRM_SELECTION"),
    }, r0_13)
  end,
  SettlementBattleEvent_Matching = function(r0_18)
    -- line: [160, 163] id: 18
    DebugPrint("gmy@Component:SettlementBattleEvent_Matching")
    EventManager:FireEvent(EventID.TeamMatchStartMatching)
  end,
  SettlementBattleEvent_WaitEntering = function(r0_19)
    -- line: [166, 170] id: 19
    DebugPrint("gmy@Component:SettlementBattleEvent_WaitEntering")
    EventManager:FireEvent(EventID.TeamMatchStartEntering)
    TeamController:RecvTeamOnVoteEntering()
  end,
  SettlementBattleEvent_BattleFailed = function(r0_20)
    -- line: [173, 178] id: 20
    DebugPrint(ErrorTag, "gmy@Component:SettlementBattleEvent_BattleFailed")
    if not r0_20:IsInBigWorld() and not r0_20:IsInSingleDungeon() and not r0_20:IsInEnterSingleDungeon() then
      r0_20:ExitDungeon()
    end
  end,
}
