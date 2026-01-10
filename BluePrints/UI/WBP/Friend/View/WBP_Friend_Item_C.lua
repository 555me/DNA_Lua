-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Friend\View\WBP_Friend_Item_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("BluePrints.UI.WBP.Friend.FriendCommon")
local r1_0 = require("BluePrints.UI.WBP.Friend.FriendController")
local r2_0 = r1_0:GetModel()
local r3_0 = require("Utils.TimeUtils")
local r4_0 = require("BluePrints.UI.WBP.Chat.ChatController")
local r5_0 = require("BluePrints.UI.WBP.Team.TeamController")
local r6_0 = r5_0:GetModel()
local r7_0 = require("Utils.UIUtils")
local r8_0 = Class("BluePrints.UI.BP_UIState_C")
function r8_0.OnTeamMainFocusChanged(r0_1, r1_1, r2_1)
  -- line: [22, 35] id: 1
  if not r2_1 and not r1_1 then
    return 
  end
  local r3_1 = nil	-- notice: implicit variable refs by block#[7]
  if r1_1 then
    r3_1 = "Collapsed"
    if not r3_1 then
      ::label_10::
      r3_1 = "SelfHitTestInvisible"
    end
  else
    goto label_10	-- block#5 is visited secondly
  end
  for r9_1, r10_1 in ipairs({
    r0_1.Function_GamePad,
    r0_1.Button_Funtion.Key_GamePad,
    r0_1.Button_Talk.Key_GamePad,
    r0_1.No_GamePad,
    r0_1.Yes_GamePad
  }) do
    r10_1:SetVisibility(UIConst.VisibilityOp[r3_1])
  end
  -- close: r5_1
end
function r8_0.OnAnimationStarted(r0_2, r1_2)
  -- line: [37, 41] id: 2
  if r1_2 == r0_2.In then
    r0_2:SetVisibility(UIConst.VisibilityOp.Visible)
  end
end
function r8_0.OnAddedToFocusPath(r0_3, r1_3)
  -- line: [43, 59] id: 3
  if r1_0:IsGamepad() then
    r0_3:OnTeamMainFocusChanged(false, true)
    r0_3:OnItemSelectionChanged(true)
    local r3_3 = GWorld.GameInstance:GetGameUIManager()
    local r4_3 = r3_3:GetUIObj("FriendMain")
    local r5_3 = r3_3:GetUIObj("List_Friend")
    if r4_3 then
      r4_3:ShowPlayerInfoBtn(true)
      r4_3:ShowCheckBtn(false)
    end
    if r5_3 then
      r5_3:ShowPlayerInfoBtn(true)
    end
  end
end
function r8_0.OnRemovedFromFocusPath(r0_4, r1_4)
  -- line: [61, 75] id: 4
  if r1_0:IsGamepad() then
    r0_4:OnItemSelectionChanged(false)
    local r3_4 = GWorld.GameInstance:GetGameUIManager()
    local r4_4 = r3_4:GetUIObj("FriendMain")
    local r5_4 = r3_4:GetUIObj("List_Friend")
    if r4_4 then
      r4_4:ShowPlayerInfoBtn(false)
    end
    if r5_4 then
      r5_4:ShowPlayerInfoBtn(false)
    end
  end
end
function r8_0.Construct(r0_5)
  -- line: [77, 115] id: 5
  r8_0.Super.Construct(r0_5)
  r0_5.Button_Invite:BindEventOnReleased(r0_5, r0_5.OnBtnInviteReleased)
  r1_0:OverrideButtonSound(r0_5.Button_Funtion, "event:/ui/common/click_btn_small", nil)
  r0_5.Button_Funtion:BindEventOnReleased(r0_5, r0_5.OnBtnFunctionReleased)
  r1_0:OverrideButtonSound(r0_5.Button_Yes, "event:/ui/common/click_btn_confirm", nil)
  r0_5.Button_Yes:BindEventOnReleased(r0_5, r0_5.OnBtnYesOrNoRelease, true)
  r1_0:OverrideButtonSound(r0_5.Button_No, "event:/ui/common/click_btn_cancel", nil)
  r0_5.Button_No:BindEventOnReleased(r0_5, r0_5.OnBtnYesOrNoRelease, false)
  r0_5.Head_Friend:BindOnClickEvent(function()
    -- line: [86, 88] id: 6
    r0_5.Head_Anchor:Open(true)
  end)
  r0_5.Head_Anchor.OnGetUserMenuContentEvent:Bind(r0_5, r0_5.OnAnchorGetUserMenuContent)
  r0_5.Head_Anchor.OnMenuOpenChanged:Add(r0_5, r0_5.HeadMenuOpenChanged)
  r0_5.Button_Invite:SetGamePadImg("A")
  r0_5.Button_Talk:SetGamePadImg("X")
  r0_5.Key_No:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "X",
      }
    },
  })
  r0_5.Key_Yes:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "A",
      }
    },
  })
  r0_5:SetGamepadIconVisibility(false)
  r0_5.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(UE4.UGameplayStatics.GetPlayerController(r0_5, 0))
  if IsValid(r0_5.GameInputModeSubsystem) then
    r0_5.GameInputModeSubsystem.OnInputMethodChanged:Add(r0_5, r0_5.RefreshOpInfoByInputDevice)
  end
end
function r8_0.HeadMenuOpenChanged(r0_7, r1_7)
  -- line: [117, 142] id: 7
  r0_7.bMenuOpen = r1_7
  local r3_7 = GWorld.GameInstance:GetGameUIManager()
  local r4_7 = r3_7:GetUIObj("FriendMain")
  local r5_7 = r3_7:GetUIObj("List_Friend")
  if r4_7 and not ModController:IsMobile() then
    if r1_7 then
      r4_7:ShowCheckBtn(true)
      r4_7:ShowPlayerInfoBtn(false)
      if r5_7 then
        r5_7:ShowCheckBtn(true)
        r5_7:ShowPlayerInfoBtn(false)
      end
    else
      r4_7:ShowCheckBtn(false)
      r4_7:ShowPlayerInfoBtn(true)
      if r5_7 then
        r5_7:ShowCheckBtn(false)
        r5_7:ShowPlayerInfoBtn(true)
      end
    end
  end
  if r1_7 then
    return 
  end
  r0_7.Head_Friend:PlayNormal()
end
function r8_0.ResetUI(r0_8)
  -- line: [144, 161] id: 8
  r0_8.HB_Loca:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_8.HB_Button_Request:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_8.HB_Button:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_8.Button_Funtion:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_8.Button_Funtion:ForbidBtn(false)
  r0_8.Button_Invite:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_8.Button_Invite:ForbidBtn(false)
  r0_8.Text_Remark:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_8.Split:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_8.Split_1:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_8.Head_Friend:SetHoldUp(false)
  if r0_8.Title then
    r0_8.Title:ClearChildren()
    r0_8.Title:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r8_0.OnAnchorGetUserMenuContent(r0_9)
  -- line: [163, 259] id: 9
  local r1_9 = r1_0:GetView(r0_9)
  local function r2_9(r0_10, r1_10)
    -- line: [165, 171] id: 10
    r0_10.Text = GText("UI_Chat_InviteTeam")
    function r0_10.Callback()
      -- line: [167, 170] id: 11
      r5_0:SendTeamInvite(r1_10.Uid)
      r0_9.Head_Anchor:Close()
    end
  end
  local function r3_9(r0_12, r1_12)
    -- line: [172, 185] id: 12
    r0_12.Text = GText("UI_Chat_ShowRecord")
    function r0_12.Callback()
      -- line: [174, 184] id: 13
      if r6_0:IsYourself(r1_12.Uid) then
        PersonInfoController:OpenView()
      else
        r5_0:GetAvatar():CheckOtherPlayerPersonallInfo(r1_12.Uid)
      end
      r0_9.Head_Anchor:Close()
      if r1_0:GetDialog(r0_9) then
        r1_0:GetDialog(r0_9):OnCloseBtnClicked()
      end
    end
  end
  local function r4_9(r0_14, r1_14)
    -- line: [186, 208] id: 14
    if r2_0:GetBlackListDict()[r1_14.Uid] then
      r0_14.Text = GText("UI_Friend_DelBlackList")
      function r0_14.Callback()
        -- line: [189, 192] id: 15
        r1_0:SendCancelBlackList(r1_14.Uid)
        r0_9.Head_Anchor:Close()
      end
    else
      r0_14.Text = GText("UI_Friend_AddBlackList")
      function r0_14.Callback()
        -- line: [195, 206] id: 16
        r0_9.Head_Anchor:Close()
        local r0_16 = r1_0:GetDialog(r0_9)
        if r0_16 then
          r0_16:OnCloseBtnClicked()
          r1_0:AddTimer(r0_16.Out:GetEndTime() + 0.05, function()
            -- line: [200, 202] id: 17
            r1_0:OpenAddBlacklistDialog(r0_9, r1_14)
          end)
        else
          r1_0:OpenAddBlacklistDialog(r0_9, r1_14)
        end
      end
    end
  end
  local function r5_9(r0_18, r1_18)
    -- line: [209, 226] id: 18
    r0_18.Text = GText("UI_Friend_Remark")
    function r0_18.Callback()
      -- line: [211, 225] id: 19
      UIManager(r0_9):ShowCommonPopupUI(r0_0.RemarkDialogNotInput, {
        UseGenaral = true,
        MultilineType = 1,
        TextLenMax = DataMgr.GlobalConstant.NicknameMaxLen.ConstantValue,
        HintText = GText("UI_Friend_RemarkInputHint"),
        OnSDKChecked = function(r0_20, r1_20, ...)
          -- line: [218, 221] id: 20
          if not r0_20 then
            return 
          end
          r1_0:SendRequest(r0_0.EventId.SetRemark, r1_18.Uid, ...)
        end,
      }, r1_9)
      r0_9.Head_Anchor:Close()
    end
  end
  local function r6_9(r0_21, r1_21)
    -- line: [227, 237] id: 21
    if not r0_9.FriendData.Star then
      r0_21.Text = GText("UI_Friend_AddStar")
    else
      r0_21.Text = GText("UI_Friend_RemoveStar")
    end
    function r0_21.Callback()
      -- line: [233, 236] id: 22
      r1_0:SendRequest(r0_0.EventId.SetStar, r1_21.Uid, not r0_9.FriendData.Star)
      r0_9.Head_Anchor:Close()
    end
  end
  local function r7_9(r0_23, r1_23)
    -- line: [238, 249] id: 23
    r0_23.Text = GText("UI_Friend_Remove")
    function r0_23.Callback()
      -- line: [240, 248] id: 24
      UIManager(r0_9):ShowCommonPopupUI(r0_0.DeleteDialog, {
        RightCallbackFunction = function()
          -- line: [242, 244] id: 25
          r1_0:SendRequest(r0_0.EventId.DeleteFriend, r1_23.Uid)
        end,
      }, r1_9)
      r0_9.Head_Anchor:Close()
    end
  end
  local r8_9 = {}
  if r0_9.Type == r0_0.FriendDialogType.BlackList then
    r8_9 = {
      r4_9
    }
  elseif r0_9.Type == r0_0.FriendTabType.MyFriend then
    r8_9 = {
      r3_9,
      r5_9,
      r6_9,
      r4_9,
      r7_9
    }
  else
    r8_9 = {
      r2_9,
      r3_9,
      r4_9
    }
  end
  return r4_0:OpenPlayerBtnList(r0_9, r0_9.PersonData, r8_9)
end
function r8_0.OnBtnYesOrNoRelease(r0_26, r1_26)
  -- line: [261, 267] id: 26
  if r1_26 then
    r1_0:SendRequest(r0_0.EventId.AgreeAdd, r0_26.RequestData.Uid)
  else
    r1_0:SendRequest(r0_0.EventId.RefuseAdd, r0_26.RequestData.Uid)
  end
end
function r8_0.OnBtnFunctionReleased(r0_27)
  -- line: [269, 277] id: 27
  ({
    [r0_0.FriendTabType.MyFriend] = r0_27.OnBtnFunctionReleased_MyFriend,
    [r0_0.FriendTabType.AddFriend] = r0_27.OnBtnFunctionReleased_AddFriend,
    [r0_0.FriendTabType.RecentMatch] = r0_27.OnBtnFunctionReleased_AddFriend,
    [r0_0.FriendTabType.RegionFriend] = r0_27.OnBtnFunctionReleased_AddFriend,
  })[r0_27.Type](r0_27)
end
function r8_0.OnBtnFunctionReleased_MyFriend(r0_28)
  -- line: [279, 282] id: 28
  r4_0:OpenView(r0_28)
  r4_0:SelectPlayerToChat(r0_28.FriendData.Uid)
end
function r8_0.OnBtnFunctionReleased_AddFriend(r0_29)
  -- line: [284, 292] id: 29
  if r0_29.Button_Funtion.IsForbidden then
    r1_0:ShowToast(GText("UI_Toast_Friend_AlreadyRequest"))
    return 
  end
  if not IsValid(r1_0:GetView(r0_29)) then
    return 
  end
  r1_0:OpenAddFriendDialog(r0_29, r0_29.PersonData)
end
function r8_0.OnBtnInviteReleased(r0_30)
  -- line: [294, 301] id: 30
  ({
    [r0_0.FriendTabType.MyFriend] = r0_30.OnBtnInviteReleased_MyFriend,
    [r0_0.FriendTabType.RecentMatch] = r0_30.OnBtnInviteReleased_RecentMatch,
    [r0_0.FriendDialogType.BlackList] = r0_30.OnBtnInviteReleased_BlackList,
  })[r0_30.Type](r0_30)
end
function r8_0.OnBtnInviteReleased_RecentMatch(r0_31)
  -- line: [303, 305] id: 31
  r0_31:_InviteCommon(r0_31.PersonData)
end
function r8_0.OnBtnInviteReleased_MyFriend(r0_32)
  -- line: [307, 309] id: 32
  r0_32:_InviteCommon(r0_32.FriendData.Info)
end
function r8_0._InviteCommon(r0_33, r1_33)
  -- line: [311, 336] id: 33
  if r0_33.Button_Invite.IsForbidden then
    if r6_0:GetInviteSendBox()[r1_33.Uid] then
      r5_0:ShowToast(GText("UI_Team_InviteSend"))
      return 
    end
    if r6_0:IsMemberExist(r1_33.Uid) then
      r5_0:ShowToast(GText("UI_Team_FriendInTeam"))
      return 
    end
    if not r1_33.IsOnline then
      r5_0:ShowToast(string.format(GText("UI_Team_PlayerOffline"), r1_33.Nickname))
      return 
    end
    if r1_33.IsInDungeon then
      r5_0:ShowToast(GText("UI_Team_PlayerInDungeon"))
      return 
    end
    if r1_33.IsInSpecialQuest then
      r5_0:ShowToast(GText("UI_Team_PlayerInSpecaiDungeon"))
      return 
    end
    return 
  end
  r5_0:SendTeamInvite(r1_33.Uid)
end
function r8_0.OnBtnInviteReleased_BlackList(r0_34)
  -- line: [338, 341] id: 34
  if r0_34.Button_Invite.IsForbidden then
    return 
  end
  r1_0:SendRequest(r0_0.EventId.CancelBlackList, r0_34.PersonData.Uid)
end
function r8_0.OnListItemObjectSet(r0_35, r1_35)
  -- line: [343, 358] id: 35
  r0_35:ResetUI()
  r1_35.UI = r0_35
  r0_35.Type = r1_35.Type
  r0_35:SetRenderOpacity(1)
  ({
    [r0_0.FriendTabType.MyFriend] = r0_35.OnListItemObjectSet_MyFriend,
    [r0_0.FriendTabType.AddFriend] = r0_35.OnListItemObjectSet_AddFriend,
    [r0_0.FriendTabType.RecentMatch] = r0_35.OnListItemObjectSet_RecentMatch,
    [r0_0.FriendTabType.RegionFriend] = r0_35.OnListItemObjectSet_AddFriend,
    [r0_0.FriendDialogType.BlackList] = r0_35.OnListItemObjectSet_BlackList,
    [r0_0.FriendDialogType.FriendRequest] = r0_35.OnListItemObjectSet_FriendRequest,
    [r0_0.EmptyItem] = r0_35.OnListItemObjectSet_Empty,
  })[r0_35.Type](r0_35, r1_35)
end
function r8_0.OnAnimationFinished(r0_36, r1_36)
  -- line: [360, 364] id: 36
  if r1_36 == r0_36.In then
    r0_36:SetRenderOpacity(1)
  end
end
function r8_0._SetupBtnInvite(r0_37)
  -- line: [366, 395] id: 37
  DebugPrint(DebugTag, LXYTag, "_SetupBtnInvite")
  r0_37.Button_Invite:SetVisibility(UIConst.VisibilityOp.Visible)
  local r1_37 = ""
  local r2_37 = false
  local r3_37 = nil
  if r0_37.Type == r0_0.FriendTabType.MyFriend then
    r3_37 = r0_37.FriendData.Info
  elseif r0_37.Type == r0_0.FriendDialogType.BlackList then
    r1_37 = GText("UI_Friend_DelBlackList")
  elseif r0_37.Type == r0_0.FriendTabType.RecentMatch then
    r3_37 = r0_37.PersonData
  end
  if r3_37 then
    if r6_0:GetInviteSendBox()[r3_37.Uid] then
      local r4_37 = GText("UI_Team_Invited")
      r2_37 = true
      r1_37 = r4_37
    elseif r6_0:IsMemberExist(r3_37.Uid) then
      local r4_37 = GText("UI_Team_InTeam")
      r2_37 = true
      r1_37 = r4_37
    elseif not r3_37.IsOnline then
      local r4_37 = GText("UI_Friend_State_Offline")
      r2_37 = true
      r1_37 = r4_37
    elseif r3_37.IsInDungeon then
      local r4_37 = GText("UI_Chat_InDungeon")
      r2_37 = true
      r1_37 = r4_37
    elseif r3_37.IsInSpecialQuest then
      local r4_37 = GText("UI_Chat_InSpecialQuest")
      r2_37 = true
      r1_37 = r4_37
    else
      r1_37 = GText("UI_Friend_Invite")
    end
  end
  r0_37.Button_Invite:SetText(r1_37)
  r0_37.Button_Invite:ForbidBtn(r2_37)
end
function r8_0._SetupBtnFunction(r0_38)
  -- line: [397, 415] id: 38
  if r0_38.Type == r0_0.FriendTabType.MyFriend then
    r0_38.Switcher_State:SetActiveWidgetIndex(0)
  elseif r0_38.Type == r0_0.FriendTabType.AddFriend or r0_38.Type == r0_0.FriendTabType.RegionFriend then
    local r1_38 = r2_0:GetRequestSendBox()[r0_38.PersonData.Uid]
    if r2_0:GetFriendDict()[r0_38.PersonData.Uid] or r1_38 and not r1_38:IsExpired() then
      r0_38.Switcher_State:SetActiveWidgetIndex(3)
      r0_38.Button_Funtion:ForbidBtn(true)
    else
      r0_38.Switcher_State:SetActiveWidgetIndex(1)
    end
  elseif r0_38.Type == r0_0.FriendTabType.RecentMatch then
    r0_38.Switcher_State:SetActiveWidgetIndex(1)
  end
  r0_38.Button_Funtion:SetVisibility(UIConst.VisibilityOp.Visible)
end
function r8_0._SetRemarkName(r0_39, r1_39)
  -- line: [417, 428] id: 39
  r0_39.Text_Remark:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_39.Split:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_39.Split_1:SetVisibility(UIConst.VisibilityOp.Visible)
  if not r1_39 or r1_39 == "" then
    r0_39.Text_Remark:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_39.Split:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_39.Split_1:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return 
  end
  r0_39.Text_Remark:SetText(r1_39)
end
function r8_0._SetStar(r0_40, r1_40)
  -- line: [430, 433] id: 40
  local r2_40 = nil	-- notice: implicit variable refs by block#[3]
  if r1_40 then
    r2_40 = "Visible"
    if not r2_40 then
      ::label_5::
      r2_40 = "Collapsed"
    end
  else
    goto label_5	-- block#2 is visited secondly
  end
  r0_40.Icon_Star:SetVisibility(UIConst.VisibilityOp[r2_40])
end
function r8_0._SetHeadIcon(r0_41, r1_41)
  -- line: [435, 439] id: 41
  r0_41.Head_Friend:SetHeadIconById(r1_41.HeadIconId)
  r0_41.Head_Friend:SetHeadFrame(r1_41.HeadFrameId)
  r0_41.Head_Friend:SetHoldUp(true)
end
function r8_0._SetOnlineState(r0_42, r1_42)
  -- line: [441, 463] id: 42
  r0_42.HB_Loca:SetVisibility(UIConst.VisibilityOp.Visible)
  if not r1_42 then
    local r2_42 = DataMgr.GlobalConstant.FriendOfflineDayMax.ConstantValue
    local r3_42 = math.floor((r3_0.NowTime() - r0_42.FriendData.Info.LastLogoutTime) / CommonConst.SECOND_IN_DAY)
    if r3_42 < 1 or r0_42.FriendData.Info.LastLogoutTime == 0 then
      r0_42.Text_Loca:SetText(GText("UI_Friend_OffLineToday"))
    elseif r3_42 <= r2_42 then
      r0_42.Text_Loca:SetText(string.format(GText("UI_Friend_OfflineNDay"), r3_42))
    elseif r2_42 < r3_42 then
      r0_42.Text_Loca:SetText(GText("UI_Friend_OfflineOver30Day"))
    end
    r0_42:PlayAnimation(r0_42.OffLine)
  elseif not r0_42.FriendData.Info.IsInDungeon then
    r0_42.Text_Loca:SetText(GText("UI_Friend_Online"))
    r0_42:PlayAnimation(r0_42.OnLine)
  else
    r0_42.Text_Loca:SetText(GText("UI_Chat_InDungeon"))
    r0_42:PlayAnimation(r0_42.OnMission)
  end
end
function r8_0._SetSign(r0_43, r1_43)
  -- line: [465, 481] id: 43
  if r0_43.Type == r0_0.FriendDialogType.FriendRequest then
    r0_43.Icon_Message:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    r0_43.Icon_Message:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if r0_43.Type == r0_0.FriendDialogType.BlackList then
    r0_43.Text_Intro:SetText(GText("UI_Friend_AlreadyBlacklist"))
    return 
  end
  if not r1_43 or r1_43 == "" then
    r0_43.Text_Intro:SetText(GText("UI_Friend_NoSignature"))
    return 
  end
  r0_43.Text_Intro:SetText(r1_43)
end
function r8_0.OnListItemObjectSet_MyFriend(r0_44, r1_44)
  -- line: [483, 506] id: 44
  r0_44.FriendData = r1_44.Data
  r0_44.PersonData = r0_44.FriendData.Info
  r0_44.Text_Name:SetText(r0_44.FriendData.Info.Nickname)
  r0_44:_SetRemarkName(r0_44.FriendData.Remark)
  r0_44:_SetHeadIcon(r0_44.FriendData.Info)
  r7_0.SetTitle(r0_44.Title, r0_44.FriendData.Info)
  r0_44.Num_Level:SetText(tostring(r0_44.FriendData.Info.Level))
  r0_44:_SetStar(r0_44.FriendData.Star)
  r0_44.HB_Button:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_44:_SetupBtnInvite()
  r0_44:_SetupBtnFunction()
  r0_44:_SetOnlineState(r0_44.FriendData.Info.IsOnline)
  r0_44:_SetSign(r0_44.FriendData.Info.Signature)
  r0_44.Key_Function:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "X",
      }
    },
  })
end
function r8_0.OnListItemObjectSet_AddFriend(r0_45, r1_45)
  -- line: [508, 526] id: 45
  r0_45.PersonData = r1_45.Data
  r0_45.HB_Button:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_45:_SetupBtnFunction()
  r0_45.Text_Name:SetText(r0_45.PersonData.Nickname)
  r0_45.Num_Level:SetText(tostring(r0_45.PersonData.Level))
  r0_45:_SetHeadIcon(r0_45.PersonData)
  r7_0.SetTitle(r0_45.Title, r0_45.PersonData)
  r0_45:_SetSign(r0_45.PersonData.Signature)
  r0_45.Key_Function:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "A",
      }
    },
  })
end
function r8_0.OnListItemObjectSet_RecentMatch(r0_46, r1_46)
  -- line: [528, 539] id: 46
  r0_46.PersonData = r1_46.Data
  r0_46.HB_Button:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_46.Text_Name:SetText(r0_46.PersonData.Nickname)
  r0_46.Num_Level:SetText(tostring(r0_46.PersonData.Level))
  r0_46:_SetHeadIcon(r0_46.PersonData)
  r7_0.SetTitle(r0_46.Title, r0_46.PersonData)
  r0_46:_SetupBtnInvite()
  r0_46:_SetupBtnFunction()
  r0_46:_SetSign(r0_46.PersonData.Signature)
end
function r8_0.OnListItemObjectSet_BlackList(r0_47, r1_47)
  -- line: [541, 551] id: 47
  r0_47.PersonData = r1_47.Data
  r0_47.Text_Name:SetText(r0_47.PersonData.Nickname)
  r0_47.Num_Level:SetText(r0_47.PersonData.Level)
  r0_47:_SetHeadIcon(r0_47.PersonData)
  r7_0.SetTitle(r0_47.Title, r0_47.PersonData)
  r0_47:_SetSign()
  r0_47.HB_Button:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_47:_SetupBtnInvite()
end
function r8_0.OnListItemObjectSet_FriendRequest(r0_48, r1_48)
  -- line: [553, 563] id: 48
  r0_48.RequestData = r1_48.Data
  r0_48.PersonData = r0_48.RequestData.Info
  r0_48.Text_Name:SetText(r0_48.PersonData.Nickname)
  r0_48.Num_Level:SetText(r0_48.PersonData.Level)
  r0_48:_SetHeadIcon(r0_48.PersonData)
  r7_0.SetTitle(r0_48.Title, r0_48.PersonData)
  r0_48:_SetSign(r0_48.RequestData.Remark)
  r0_48.HB_Button_Request:SetVisibility(UIConst.VisibilityOp.Visible)
end
function r8_0.OnListItemObjectSet_Empty(r0_49)
  -- line: [565, 570] id: 49
  r0_49.Panel_Portrait:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_49.HB_Name:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_49.HB_Button_Request:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_49.HB_Intro:SetVisibility(UIConst.VisibilityOp.Collapsed)
end
function r8_0.Destruct(r0_50)
  -- line: [572, 582] id: 50
  r0_50.Button_Invite:UnBindEventOnReleased(r0_50, r0_50.OnBtnInviteReleased)
  r0_50.Button_Funtion:UnBindEventOnReleased(r0_50, r0_50.OnBtnFunctionReleased)
  r0_50.Button_Yes:UnBindEventOnReleased(r0_50, r0_50.OnBtnYesOrNoRelease)
  r0_50.Button_No:UnBindEventOnReleased(r0_50, r0_50.OnBtnYesOrNoRelease)
  r0_50.Head_Anchor.OnGetUserMenuContentEvent:Unbind()
  r0_50.Head_Anchor.OnMenuOpenChanged:Remove(r0_50, r0_50.HeadMenuOpenChanged)
  r0_50:PlayAnimation(r0_50.Out)
  r0_50.GameInputModeSubsystem.OnInputMethodChanged:Remove(r0_50, r0_50.RefreshOpInfoByInputDevice)
  r8_0.Super.Destruct(r0_50)
end
function r8_0.SetGamepadIconVisibility(r0_51, r1_51)
  -- line: [585, 610] id: 51
  if r1_51 then
    r0_51.No_GamePad:SetVisibility(UIConst.VisibilityOp.Visbile)
    r0_51.Key_No:SetVisibility(UIConst.VisibilityOp.Visible)
    r0_51.Yes_GamePad:SetVisibility(UIConst.VisibilityOp.Visbile)
    r0_51.Key_Yes:SetVisibility(UIConst.VisibilityOp.Visible)
    if r0_51.Type ~= r0_0.FriendDialogType.BlackList then
      r0_51.Key_Function:SetVisibility(UIConst.VisibilityOp.Visible)
      r0_51.Function_GamePad:SetVisibility(UIConst.VisibilityOp.Visible)
    else
      r0_51.Key_Function:SetVisibility(UIConst.VisibilityOp.Collapsed)
      r0_51.Function_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    r0_51.Button_Invite:SetGamepadIconVisibility(true)
    r0_51.Button_Talk:SetGamepadIconVisibility(true)
  else
    r0_51.No_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_51.Key_No:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_51.Yes_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_51.Key_Yes:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_51.Function_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_51.Key_Function:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_51.Button_Invite:SetGamepadIconVisibility(false)
    r0_51.Button_Talk:SetGamepadIconVisibility(false)
  end
end
function r8_0.OnItemSelectionChanged(r0_52, r1_52)
  -- line: [612, 633] id: 52
  r0_52.bIsSelected = r1_52
  if r7_0.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    if r1_52 then
      r0_52:SetGamepadIconVisibility(true)
      if r0_52:IsAnimationPlaying(r0_52.GamePad_Hover) then
        r0_52:StopAnimation(r0_52.GamePad_Hover)
      end
      r0_52:PlayAnimation(r0_52.GamePad_Hover)
      DebugPrint(DebugTag, "jly", "BP_OnItemSelectionChanged Hover", r0_52.GamePad_Hover)
    else
      r0_52:SetGamepadIconVisibility(false)
      if r0_52:IsAnimationPlaying(r0_52.GamePad_Hover) then
        r0_52:StopAnimation(r0_52.GamePad_Hover)
      end
      r0_52:PlayAnimationReverse(r0_52.GamePad_Hover)
      DebugPrint(DebugTag, "jly", "BP_OnItemSelectionChanged UnHover", r0_52.GamePad_Hover)
    end
  end
end
function r8_0.RefreshOpInfoByInputDevice(r0_53, r1_53, r2_53)
  -- line: [635, 646] id: 53
  if r1_53 == ECommonInputType.MouseAndKeyboard then
    r0_53:PlayAnimation(r0_53.GamePad_Normal)
    r0_53:SetGamepadIconVisibility(false)
    r0_53.bIsSelected = false
  elseif r1_53 == ECommonInputType.Gamepad and r0_53.bIsSelected then
    r0_53:SetGamepadIconVisibility(true)
    r0_53:PlayAnimation(r0_53.GamePad_Hover)
  end
end
function r8_0.OnPreviewKeyDown(r0_54, r1_54, r2_54)
  -- line: [648, 688] id: 54
  r8_0.Super.OnPreviewKeyDown(r0_54, r1_54, r2_54)
  local r4_54 = UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_54))
  local r5_54 = false
  if r0_54.bMenuOpen then
    if r4_54 == "Gamepad_FaceButton_Right" then
      r0_54.Head_Anchor:Close()
      r0_54:SetFocus()
      return UE4.UWidgetBlueprintLibrary.Handled()
    end
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
  if r4_54 == "Gamepad_FaceButton_Left" and r0_54.Type == r0_0.FriendTabType.MyFriend then
    r0_54:OnBtnFunctionReleased()
    r5_54 = true
  elseif r4_54 == "Gamepad_FaceButton_Bottom" and r0_54.Type == r0_0.FriendTabType.AddFriend then
    r0_54:OnBtnFunctionReleased()
    r5_54 = true
  elseif r4_54 == "Gamepad_FaceButton_Bottom" and r0_54.Type == r0_0.FriendTabType.MyFriend then
    r0_54:OnBtnInviteReleased()
    r5_54 = true
  elseif r4_54 == "Gamepad_FaceButton_Bottom" and r0_54.Type == r0_0.FriendTabType.RegionFriend then
    r0_54:OnBtnFunctionReleased()
    r5_54 = true
  elseif r4_54 == "Gamepad_FaceButton_Bottom" and r0_54.Type == r0_0.FriendDialogType.FriendRequest then
    r0_54:OnBtnYesOrNoRelease(true)
    r5_54 = true
  elseif r4_54 == "Gamepad_FaceButton_Left" and r0_54.Type == r0_0.FriendDialogType.FriendRequest then
    r0_54:OnBtnYesOrNoRelease(false)
    r5_54 = true
  elseif r4_54 == "Gamepad_FaceButton_Bottom" and r0_54.Type == r0_0.FriendDialogType.BlackList then
    r0_54:OnBtnInviteReleased()
    r5_54 = true
  end
  if r5_54 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end
function r8_0.OnKeyUp(r0_55, r1_55, r2_55)
  -- line: [690, 700] id: 55
  local r3_55 = r8_0.Super.OnKeyUp(r0_55, r1_55, r2_55)
  if UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_55)) == UIConst.GamePadKey.SpecialLeft and not IsValid(r4_0:GetView(r0_55)) then
    r0_55.Head_Anchor:Open(true)
  end
  return r3_55
end
return r8_0
