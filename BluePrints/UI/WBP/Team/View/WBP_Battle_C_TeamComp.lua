-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Team\View\WBP_Battle_C_TeamComp.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = TeamController:GetModel()
return {
  InitTeam = function(r0_1)
    -- line: [7, 65] id: 1
    if not GWorld:GetAvatar() then
      return 
    end
    DebugPrint(DebugTag, LXYTag, "TeamSyncDebug 组队流程时序，WBP_Battle_C::OnLoaded, WBP_Battle_C_TeamComp::InitTeam")
    if r0_1.Platform == "PC" then
      r0_1.TeamInputAction = DataMgr.KeyboardMap.ShowTeamInfo
      r0_1:ListenForInputAction(r0_1.TeamInputAction.ActionName, EInputEvent.IE_Pressed, false, {
        r0_1,
        r0_1.OpenTeamInfo
      })
      UIManager(r0_1):GetGameInputModeSubsystem().OnInputMethodChanged:Add(r0_1, r0_1.OnInputDeviceChange_Team)
    end
    r0_1.HUD_MainBar.Icon_Agree:SetVisibility(UIConst.VisibilityOp.Collapsed)
    TeamController:RegisterEvent(r0_1, function(r0_2, r1_2, ...)
      -- line: [19, 50] id: 2
      if r1_2 == TeamCommon.EventId.TeamOnInit then
        r0_2:_ShowTeamPart(true)
      elseif r1_2 == TeamCommon.EventId.TeamLeave then
        if GWorld:IsStandAlone() then
          r0_2:_ShowTeamPart(false)
        end
      else
        local r2_2 = TeamCommon.EventId.TeamOnVoteAgreed
        if r1_2 == r2_2 then
          ... = ... -- error: untaken top expr
          if r2_2 == r0_0:GetAvatar().Uid then
            r0_2.HUD_MainBar.Icon_Agree:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
            r0_2.HUD_MainBar:PlayAnimation(r0_2.HUD_MainBar.Agree)
          end
        else
          r2_2 = TeamCommon.EventId.TeamOnChangeLeader
          if r1_2 == r2_2 then
            ... = ... -- error: untaken top expr
            if r0_2.Platform == "Mobile" then
              return 
            end
            if r0_0:IsYourself(r2_2.Uid) and GWorld:IsStandAlone() then
              r0_2.WBP_Team_Tag:Init(true, r2_2.Index, r2_2.Uid)
            end
          elseif r1_2 == TeamCommon.EventId.TeamOnVoteRefused then
            r0_2.HUD_MainBar.Icon_Agree:SetVisibility(UIConst.VisibilityOp.Collapsed)
          elseif r1_2 == TeamCommon.EventId.TeamOnVoteInvalid then
            r0_2.HUD_MainBar.Icon_Agree:SetVisibility(UIConst.VisibilityOp.Collapsed)
          elseif r1_2 == TeamCommon.EventId.TeamOnVoteEntering then
            r0_2.HUD_MainBar.Icon_Agree:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
            r0_2.HUD_MainBar:PlayAnimation(r0_2.HUD_MainBar.Agree)
          elseif r1_2 == TeamCommon.EventId.OnEnterMultiGame then
            r0_2:RefreshTeamWhenEnterGame(true)
          elseif r1_2 == TeamCommon.EventId.OnEnterSingelGame then
            r0_2:RefreshTeamWhenEnterGame(false)
          end
        end
      end
    end)
    r0_1:AddDispatcher(EventID.OnRepEidPlayerState, r0_1, function(r0_3, r1_3)
      -- line: [51, 56] id: 3
      DebugPrint("TeamSyncDebug OnRepEidPlayerState同步队友", r1_3)
      if r1_3 ~= 0 then
        r0_3:AddTeammateUI(r1_3, true)
      end
    end)
    r0_1:AddDispatcher(EventID.OnDelPlayerState, r0_1, r0_1.RemoveBattleTeamBloodBar)
    r0_1:AddDispatcher(EventID.OnRepOwnerEidPhantomState, r0_1, function(r0_4, r1_4, r2_4)
      -- line: [58, 63] id: 4
      DebugPrint("TeamSyncDebug OnRepEidPlayerState同步魅影", r1_4, "OwnerEid:", r2_4)
      if r1_4 ~= 0 and r2_4 ~= 0 then
        r0_4:AddTeammateUI(r1_4, false)
      end
    end)
    r0_1:AddDispatcher(EventID.OnDelPhantomState, r0_1, r0_1.RemoveBattleTeamBloodBar)
  end,
  OnInputDeviceChange_Team = function(r0_5)
    -- line: [67, 88] id: 5
    if not r0_0:GetTeam() then
      return 
    end
    if TeamController:IsGamepad() then
      r0_5.WidgetSwitcher_MP:SetActiveWidgetIndex(1)
      r0_5.Key_Team_GamePad:CreateCommonKey({
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = UIUtils.GetIconListByActionName("ShowTeamInfo")[1],
          }
        },
      })
      DebugPrint("OnInputDeviceChange_Team Key_Gamepad Visibility", r0_5.Key_Team_GamePad:IsVisible())
    elseif not TeamController:IsMobile() then
      r0_5.WidgetSwitcher_MP:SetActiveWidgetIndex(0)
      r0_5.Key_Team:CreateCommonKey({
        KeyInfoList = {
          {
            Type = "Text",
            Text = r0_5.TeamInputAction.Key,
          }
        },
      })
    end
  end,
  RefreshTeamWhenEnterGame = function(r0_6, r1_6)
    -- line: [90, 134] id: 6
    r0_6:ResetTeamAbout()
    if GameState(r0_6).GameModeType == "Party" then
      return 
    end
    if not IsStandAlone(r0_6) then
      local r2_6 = {}
      r0_6.TeamBloodBarCount = 0
      r0_6.TeamBloodBars = r2_6
    end
    if r1_6 then
      if #r0_0:GetTeam().Members <= 1 then
        r0_6:_ShowTeamPart(false)
        local r2_6 = GWorld:GetMainPlayer(0)
        for r7_6, r8_6 in pairs(GameState(r0_6).PhantomArray) do
          if r8_6.OwnerEid == r2_6.Eid then
            r0_6:AddTeammateUI(r8_6.Eid, false)
          end
        end
        -- close: r3_6
      else
        r0_6:_ShowTeamPart(true)
        for r6_6, r7_6 in ipairs(r0_0:GetTeam().Members) do
          DebugPrint(LXYTag, "TeamSyncDebug WBP_Battle_C::RefreshTeam.......PlayerArray Exist， Eid:", r7_6.Uid)
          local r8_6 = false
          if r0_0:IsYourself(r7_6.Uid) and r0_6.Platform == "PC" then
            r0_6.WBP_Team_Tag:Init(false, r7_6.Index, r7_6.Uid)
            r8_6 = true
          else
            r0_6:AddTeammateUI(r7_6.Uid, true)
          end
          for r13_6, r14_6 in pairs(GameState(r0_6).PhantomArray) do
            if r14_6.OwnerEid == r7_6.Uid then
              r0_6:AddTeammateUI(r14_6.Eid, false)
            end
          end
          -- close: r9_6
        end
        -- close: r2_6
      end
    elseif r0_0:GetTeam() then
      r0_6:_ShowTeamPart(true)
    else
      r0_6:_ShowTeamPart(false)
    end
  end,
  ResetTeamAbout = function(r0_7)
    -- line: [136, 153] id: 7
    if not r0_0:GetAvatar() then
      return 
    end
    DebugPrint(LXYTag, "TeamSyncDebug 重置战斗界面上跟组队相关的东西")
    r0_7:_ShowTeamPart(false)
    r0_7.VB_PlayerBar:ClearChildren()
    r0_7.Team:SetVisibility(UIConst.VisibilityOp.Visible)
    r0_7.Team:SetRenderOpacity(1)
    r0_7:CloseTeamInfo()
    if not r0_7.TeamHeadUI then
      r0_7.TeamHeadUI = TeamController:GetHeadUI(r0_7.Pos_Player)
    end
    if r0_7.TeamHeadUI then
      r0_7.TeamHeadUI:Close()
      r0_7.TeamHeadUI = nil
      r0_7.Pos_Player:ClearChildren()
      r0_7.Pos_Player:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end,
  OpenTeamInfo = function(r0_8)
    -- line: [155, 181] id: 8
    if not r0_0:GetTeam() or #r0_0:GetTeam().Members <= 1 then
      return 
    end
    if not GWorld:IsStandAlone() and (not r0_8.TeamBloodBars or not next(r0_8.TeamBloodBars)) then
      return 
    elseif not r0_8.TeamHeadUI then
      return 
    end
    DebugPrint(DebugTag, LXYTag, "OpenTeamInfo")
    r0_8:PlayAnimation(r0_8.Team_Out)
    RunAsyncTask(r0_8, "OpenTeamInfoAsync", function(r0_9)
      -- line: [169, 180] id: 9
      local r1_9 = UIManager(r0_8):GetUIObjAsync(TeamCommon.InfoUIName, r0_9)
      if IsValid(r1_9) then
        r1_9:UnbindAllFromAnimationFinished(r1_9.Auto_Out)
        r1_9:StopAnimation(r1_9.Auto_Out)
        r1_9:InitUIInfo(TeamCommon.InfoUIName, false, nil)
        DebugPrint(DebugTag, LXYTag, "复用TeamInfoUI")
      else
        r1_9 = UIManager(r0_8):LoadUIAsync(TeamCommon.InfoUIName, r0_9)
        DebugPrint(DebugTag, LXYTag, "创建TeamInfoUI")
      end
    end)
  end,
  CloseTeamInfo = function(r0_10)
    -- line: [183, 190] id: 10
    RunAsyncTask(r0_10, "CloseTeamInfoAsync", function(r0_11)
      -- line: [184, 189] id: 11
      local r1_11 = UIManager(r0_10):GetUIObjAsync(TeamCommon.InfoUIName, r0_11)
      if IsValid(r1_11) then
        r1_11:Close()
      end
    end)
  end,
  AddBattleTeamBloodBar = function(r0_12, r1_12, r2_12, r3_12)
    -- line: [192, 296] id: 12
    local r4_12 = GWorld:GetAvatar()
    if GameState(r0_12).GameModeType == "Party" then
      return false
    end
    if GWorld:IsStandAlone() or r4_12 and r4_12.IsInRegionOnline then
      return false
    end
    if not Battle(r0_12):GetEntity(r1_12) then
      Battle(r0_12):AddEntity(r1_12, r3_12)
    end
    if not r0_12.TeamBloodBars or not r0_12.TeamBloodBarCount then
      DebugPrint("TeamSyncDebug  等Loading结束，ds对象同步完成之后再创建血条")
      return true
    end
    if not r3_12 then
      r3_12 = Battle(r0_12):GetEntity(r1_12)
    end
    Utils.Traceback(LXYTag, "TeamSyncDebug 组队流程时序， EventID::ShowTeammateBloodUI, WBP_Battle_C::AddTeammateUI,  WBP_Battle_C_TeamComp::AddBattleTeamBloodBar")
    DebugPrint(DebugTag, LXYTag, "TeamSyncDebug 队 WBP_Battle_C::AddBattleTeamBloodBar, Eid, PlayerCount, bIsPlayer", r1_12, GameState(r0_12).PlayerArray:Num(), r2_12)
    local r5_12 = r1_12
    local r6_12 = r1_12
    if not r2_12 then
      r5_12, r6_12 = r0_0:GetOwnerEidOfUnknowEid(r0_12, r1_12)
      if not r5_12 then
        DebugPrint(LXYTag, ErrorTag, "TeamSyncDebug组队查询魅影归属失败，魅影Eid", r1_12)
        return false
      end
      if not IsValid(Battle(r0_12):GetEntity(r5_12)) then
        DebugPrint(LXYTag, "TeamSyncDebug 魅影的Owner玩家角色无效，该魅影的角色应该也是无效的", r1_12)
        r3_12 = nil
      end
      local r8_12 = GameState(r0_12):GetPhantomState(r6_12)
      if not r8_12 then
        DebugPrint(WarningTag, LXYTag, "TeamSyncDebug PhantomState尚未准备就绪，等回调触发，Eid", r6_12)
        return false
      end
      local r9_12 = DataMgr.Phantom[r8_12.CharId]
      if r9_12 and r9_12.IsHostage then
        DebugPrint(LXYTag, WarningTag, "TeamSyncDebug人质特殊处理，不应该被当作魅影")
        return false
      end
    end
    if r0_0:IsYourself(r5_12) then
      DebugPrint(LXYTag, "TeamSyncDebug队 自己的Eid不显示血条 true")
      return false
    end
    if r2_12 then
      TeamController:AddTeamMemberWithDs(r0_12, r1_12)
      r0_12.VB_PlayerBar:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
    if not r0_12.VB_PlayerBar:IsVisible() then
      DebugPrint(LXYTag, "TeamSyncDebug队 血条挂接点不可见 false")
      return false
    end
    if not next(r0_12.TeamBloodBars) and r0_12.TeamBloodBarCount == 0 then
      r0_12:_ShowTeamPart(true)
    end
    if not GameState(r0_12):GetPlayerState(r5_12) then
      DebugPrint(WarningTag, LXYTag, "TeamSyncDebug PlayerState尚未准备就绪，等回调触发，Eid", r5_12)
      return false
    end
    local r8_12 = r0_12.TeamBloodBars[r5_12]
    if not r8_12 then
      if r0_12.VB_PlayerBar:GetChildrenCount() < TeamCommon.MaxTeamMembers + -1 then
        DebugPrint(LXYTag, "TeamSyncDebug创建新的队友血条")
        r8_12 = r0_12:CreateWidgetNew(DataMgr.WidgetUI.TeamBattleBloodBar.UIName)
        r0_12.VB_PlayerBar:AddChild(r8_12)
      else
        DebugPrint(LXYTag, "TeamSyncDebug复用已经创建的队友血条")
        for r14_12, r15_12 in pairs(r0_12.VB_PlayerBar:GetAllChildren()) do
          if not r15_12:IsVisible() then
            r8_12 = r15_12
            break
          end
        end
        -- close: r10_12
        r8_12:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      end
      DebugPrint(LXYTag, "TeamSyncDebug队友血条记录")
      r0_12.TeamBloodBars[r5_12] = r8_12
      r0_12.TeamBloodBarCount = r0_12.TeamBloodBarCount + 1
      if r2_12 and IsValid(r3_12) then
        for r14_12, r15_12 in pairs(r3_12:GetPhantomTeammates(false, false)) do
          r15_12.PhantomOwner = r3_12
          r0_12:AddTeammateUI(r15_12.Eid, false, r15_12)
        end
        -- close: r10_12
      end
    end
    r8_12:SetOwner(r0_12)
    if IsValid(r3_12) then
      r8_12:AddEid(r5_12, r6_12, r0_12.TeamBloodBarCount)
    else
      r8_12:AddEidWithOutCharacter(r5_12, r6_12, r0_12.TeamBloodBarCount)
    end
    return true
  end,
  RemoveBattleTeamBloodBar = function(r0_13, r1_13)
    -- line: [298, 330] id: 13
    DebugPrint(DebugTag, LXYTag, "TeamSyncDebug组队流程时序， EventID::CloseTeammateBloodUI, WBP_Battle_C::RemoveTeammateUI,  WBP_Battle_C_TeamComp::RemoveBattleTeamBloodBar")
    if not r0_13.TeamBloodBars then
      return false
    end
    if not r0_13.VB_PlayerBar:IsVisible() then
      return false
    end
    local function r2_13(r0_14, r1_14, r2_14)
      -- line: [302, 315] id: 14
      if not r0_14 then
        return false
      end
      if r0_14:RemoveEid(r1_14, r2_14) then
        r0_13.TeamBloodBars[r1_14] = nil
        r0_13.TeamBloodBarCount = r0_13.TeamBloodBarCount + -1
      end
      if not next(r0_13.TeamBloodBars) and r0_13.TeamBloodBarCount == 0 then
        r0_13:_ShowTeamPart(false)
      end
      TeamController:DelTeamMemberWithDs(r1_13)
      return true
    end
    if r2_13(r0_13.TeamBloodBars[r1_13], r1_13, r1_13) then
      return true
    end
    for r8_13, r9_13 in pairs(r0_13.TeamBloodBars) do
      if r9_13.Phantoms and r9_13.Phantoms[r1_13] and r2_13(r9_13, r8_13, r1_13) then
        return true
      end
    end
    -- close: r4_13
    if not next(r0_13.TeamBloodBars) then
      r0_13.VB_PlayerBar:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    return false
  end,
  _ShowTeamPart = function(r0_15, r1_15)
    -- line: [332, 401] id: 15
    if r0_15._bShowTeamPart == r1_15 then
      return 
    end
    r0_15._bShowTeamPart = r1_15
    if not r1_15 then
      r0_15:Show1PTagBar(false)
      if r0_15.Platform == "PC" then
        r0_15.VB_Tag:SetVisibility(UIConst.VisibilityOp.Collapsed)
        r0_15.Key:SetVisibility(UIConst.VisibilityOp.Collapsed)
      else
        r0_15.HUD_MainBar.T_Tag:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
      r0_15.Pos_Player:SetVisibility(UIConst.VisibilityOp.Collapsed)
      r0_15.VB_PlayerBar:SetVisibility(UIConst.VisibilityOp.Collapsed)
      local r2_15 = TeamController:GetView(r0_15, TeamCommon.InfoUIName)
      if IsValid(r2_15) and not r2_15.IsBeginToClose then
        r2_15:Close()
      end
      r0_15.HUD_MainBar.Icon_Agree:SetVisibility(UIConst.VisibilityOp.Collapsed)
      return 
    end
    r0_15.Pos_Player:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    if r0_15.Platform == "PC" then
      r0_15.VB_Tag:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      r0_15.Key:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      r0_15:OnInputDeviceChange_Team()
    elseif r0_15.Platform == "Mobile" then
      r0_15.Spacer_Tag:SetVisibility(UIConst.VisibilityOp.Collapsed)
      r0_15.HUD_MainBar.T_Tag:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    end
    if r0_0:GetAvatar() then
      local r2_15 = GWorld:GetMainPlayer()
      local r3_15 = r0_0:IsTeamLeader(r0_0:GetAvatar().Uid)
      r0_15:Show1PTagBar(r2_15:GetPhantomTeammates():Num() > 1)
      if not GWorld:IsStandAlone() then
        r3_15 = false
        r0_15.Pos_Player:SetVisibility(UIConst.VisibilityOp.Collapsed)
        r0_15.VB_PlayerBar:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
        if r0_15.Platform == "Mobile" then
          r0_15.Spacer_Tag:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
        end
        if r0_15.Platform == "PC" then
          local r5_15 = r0_0:GetTeamMember(r2_15.Eid)
          r0_15.WBP_Team_Tag:Init(false, r5_15.Index, r5_15.Uid)
        end
        return 
      end
      local r5_15 = r0_0:GetTeam()
      if not r5_15 then
        return 
      end
      if r0_15.Platform == "PC" then
        local r6_15 = r0_0:GetTeamMember(r0_0:GetAvatar().Uid)
        r0_15.WBP_Team_Tag:Init(r3_15, r6_15.Index, r6_15.Uid)
      end
      if #r5_15.Members > 0 and r0_15.Pos_Player:IsVisible() then
        if r0_15.TeamHeadUI then
          r0_15.TeamHeadUI:Close()
          r0_15.TeamHeadUI = nil
        end
        r0_15.TeamHeadUI = TeamController:OpenHeadUI(r0_15.Pos_Player, true)
      elseif r0_15.TeamHeadUI then
        r0_15.TeamHeadUI:Close(true)
        r0_15.TeamHeadUI = nil
      end
    end
  end,
  Show1PTagBar = function(r0_16, r1_16)
    -- line: [403, 408] id: 16
    local r2_16 = r0_16["Show1PTagBar" .. r0_16.Platform]
    if r2_16 then
      r2_16(r0_16, r1_16)
    end
  end,
  Show1PTagBarPC = function(r0_17, r1_17)
    -- line: [410, 421] id: 17
    if not r0_17.VB_Tag:IsVisible() then
      return 
    end
    if r1_17 then
      r0_17:PlayAnimation(r0_17.Shadow_Add)
      r0_17.Img_Down:SetVisibility(UIConst.VisibilityOp.Visible)
      r0_17.Img_Up:SetVisibility(UIConst.VisibilityOp.Visible)
    else
      r0_17:PlayAnimationReverse(r0_17.Shadow_Add)
      r0_17.Img_Down:SetVisibility(UIConst.VisibilityOp.Collapsed)
      r0_17.Img_Up:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end,
  Show1PTagBarMobile = function(r0_18, r1_18)
    -- line: [423, 429] id: 18
    if r1_18 then
      r0_18:PlayAnimation(r0_18.Shadow_Add)
    else
      r0_18:PlayAnimationReverse(r0_18.Shadow_Add)
    end
  end,
  EndTeam = function(r0_19)
    -- line: [431, 443] id: 19
    if not GWorld:GetAvatar() then
      return 
    end
    if r0_19.Platform == "PC" then
      UIManager(r0_19):GetGameInputModeSubsystem().OnInputMethodChanged:Remove(r0_19, r0_19.OnInputDeviceChange_Team)
      r0_19:StopListeningForInputAction(r0_19.TeamInputAction.ActionName, EInputEvent.IE_Pressed)
    end
    if r0_19.TeamHeadUI then
      r0_19.TeamHeadUI:Close()
      r0_19.TeamHeadUI = nil
    end
    TeamController:UnRegisterEvent(r0_19)
  end,
}
