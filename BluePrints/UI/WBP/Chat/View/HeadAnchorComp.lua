-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Chat\View\HeadAnchorComp.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("BluePrints.UI.WBP.Friend.FriendController")
local r1_0 = r0_0:GetModel()
local r2_0 = require("BluePrints.UI.WBP.Chat.ChatController")
local r3_0 = require("BluePrints.UI.WBP.PersonInfo.PersonInfoController")
return {
  SetupAnchor = function(r0_1, r1_1, r2_1, r3_1, r4_1, r5_1)
    -- line: [10, 21] id: 1
    r0_1.HeadAnchor = r1_1
    r0_1.Head = r2_1
    r0_1._AvatarInfo = r3_1
    r0_1._bSetUpEvent = r4_1
    r0_1._MessageContent = r5_1
    if r4_1 then
      r0_1.HeadAnchor.OnGetMenuContentEvent:Bind(r0_1, r0_1.OnAnchorGetUserMenuContent)
      r0_1.HeadAnchor.OnMenuOpenChanged:Add(r0_1, r0_1.HeadMenuOpenChanged)
    end
  end,
  CleanUpAnchor = function(r0_2)
    -- line: [23, 31] id: 2
    if r0_2._bSetUpEvent then
      r0_2.HeadAnchor.OnGetMenuContentEvent:Unbind()
      r0_2.HeadAnchor.OnMenuOpenChanged:Remove(r0_2, r0_2.HeadMenuOpenChanged)
    end
    r0_2.HeadAnchor = nil
    r0_2.Head = nil
    r0_2._bSetUpEvent = false
  end,
  OnAnchorGetUserMenuContent = function(r0_3, r1_3)
    -- line: [34, 173] id: 3
    local function r2_3(r0_4, r1_4)
      -- line: [35, 48] id: 4
      r0_4.Text = GText("UI_Chat_ShowRecord")
      function r0_4.Callback()
        -- line: [37, 47] id: 5
        if r1_4.Uid == GWorld:GetAvatar().Uid then
          r3_0:OpenView()
        else
          GWorld:GetAvatar():CheckOtherPlayerPersonallInfo(r1_4.Uid)
        end
        r0_3.HeadAnchor:Close()
      end
    end
    local function r3_3(r0_6, r1_6)
      -- line: [49, 63] id: 6
      if not r1_0:GetFriendDict()[r1_6.Uid] then
        r0_6.Text = GText("UI_Friend_AddFriend")
        function r0_6.Callback()
          -- line: [52, 55] id: 7
          r0_0:OpenAddFriendDialog(r0_3, r1_6)
          r0_3.HeadAnchor:Close()
        end
      else
        r0_6.Text = GText("UI_Chat_SendMsg")
        function r0_6.Callback()
          -- line: [58, 61] id: 8
          r2_0:SelectPlayerToChat(r1_6.Uid)
          r0_3.HeadAnchor:Close()
        end
      end
    end
    local function r4_3(r0_9, r1_9)
      -- line: [64, 70] id: 9
      r0_9.Text = GText("UI_Chat_InviteTeam")
      function r0_9.Callback()
        -- line: [66, 69] id: 10
        TeamController:SendTeamInvite(r1_9.Uid)
        r0_3.HeadAnchor:Close()
      end
    end
    local function r5_3(r0_11, r1_11)
      -- line: [79, 93] id: 11
      if r1_0:GetBlackListDict()[r1_11.Uid] then
        r0_11.Text = GText("UI_Friend_DelBlackList")
        function r0_11.Callback()
          -- line: [82, 85] id: 12
          r0_0:SendCancelBlackList(r1_11.Uid)
          r0_3.HeadAnchor:Close()
        end
      else
        r0_11.Text = GText("UI_Friend_AddBlackList")
        function r0_11.Callback()
          -- line: [88, 91] id: 13
          r0_0:OpenAddBlacklistDialog(r0_3, r1_11)
          r0_3.HeadAnchor:Close()
        end
      end
    end
    local function r6_3(r0_14, r1_14)
      -- line: [94, 132] id: 14
      r0_14.Text = GText("UI_Chat_Accuse")
      function r0_14.Callback()
        -- line: [96, 131] id: 15
        local r0_15 = {
          PlayerName = r1_14.Nickname,
          UID = r1_14.Uid,
          TextLenMax = 50,
          ChatMassage = r0_3._MessageContent,
          ForbidRightBtn = true,
          DontCloseWhenRightBtnClicked = true,
          HideItemTips = function()
            -- line: [109, 112] id: 16
            r0_3:BroadcastDialogEvent(DialogEvent.HideDialogItem, {
              bHideDialogItem = true,
              DialogItemIndex = 1,
              bShouldPlayAnim = false,
            })
            r0_3:BroadcastDialogEvent(DialogEvent.HideDialogItem, {
              bHideDialogItem = true,
              DialogItemIndex = 2,
              bShouldPlayAnim = false,
            })
          end,
        }
        r0_15.EditTextConfig = {
          Owner = r0_3,
          TextLimit = 50,
          Events = {
            OnTextChanged = r0_3.OnTextChange,
            OnTextComposing = r0_3.OnTextComposing,
            OnEditTextFocusReceived = function()
              -- line: [120, 125] id: 17
              if r0_3.bTipsShowed then
                r0_3.Owner:HideDialogTip(2, false)
                r0_3.bTipsShowed = false
              end
            end,
          },
        }
        r2_0:OpenChatReportDialog(r0_15)
        r0_3.HeadAnchor:Close()
      end
    end
    local r7_3 = {}
    local r8_3 = r2_0:GetAvatar()
    local r9_3 = r0_3._AvatarInfo.Uid == r8_3.Uid
    local r10_3 = GWorld.GameInstance.IsInTempScene and GWorld.GameInstance:IsInTempScene()
    local r11_3 = GWorld:GetAvatar():IsInDungeon()
    local r12_3 = GWorld:GetAvatar():IsInHardBoss()
    local r13_3 = TeamController:GetModel():GetInviteSendBox()[r0_3._AvatarInfo.Uid] and r8_3:IsInMultiDungeon()
    local r14_3 = TeamController:GetModel():GetTeam()
    if not r13_3 then
      r13_3 = (r14_3 and #r14_3.Members) == 4
    end
    local r15_3 = r2_0:GetModel():GetCurrentChannel()
    local r16_3 = nil
    if r12_3 then
      if r10_3 then
        r16_3 = 2
        if r9_3 then
          r7_3 = {} and {
            r3_3,
            r4_3,
            r5_3
          }
        else
          goto label_80	-- block#17 is visited secondly
        end
      else
        r16_3 = 3
        if r9_3 then
          r7_3 = {
            r2_3
          } and {
            r3_3,
            r2_3,
            r4_3,
            r5_3
          }
        else
          goto label_97	-- block#20 is visited secondly
        end
      end
    elseif r10_3 or r11_3 then
      r16_3 = 2
      if r9_3 then
        r7_3 = {} and {
          r3_3,
          r4_3,
          r5_3
        }
      else
        goto label_117	-- block#25 is visited secondly
      end
    else
      r16_3 = 3
      if r9_3 then
        r7_3 = {
          r2_3
        } and {
          r3_3,
          r2_3,
          r4_3,
          r5_3
        }
      else
        goto label_134	-- block#28 is visited secondly
      end
    end
    if not r9_3 and not table.isempty(r7_3) then
      if r0_3._MessageContent then
        table.insert(r7_3, r6_3)
      end
      if r13_3 then
        table.remove(r7_3, r16_3)
      end
      if r15_3 == ChatCommon.ChannelDef.InTeam or r15_3 == ChatCommon.ChannelDef.Friend then
        table.remove(r7_3, 1)
      end
    end
    return r2_0:OpenPlayerBtnList(r0_3, r0_3._AvatarInfo, r7_3)
  end,
  HeadMenuOpenChanged = function(r0_18, r1_18)
    -- line: [176, 184] id: 18
    if r0_18.OnHeadMenuOpenChanged then
      r0_18:OnHeadMenuOpenChanged(r1_18)
    end
    if r1_18 then
      return 
    end
    if r0_18.Head then
      r0_18.Head:PlayNormal()
    end
  end,
}
