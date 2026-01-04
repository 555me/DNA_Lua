-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Chat\ChatModel.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("BluePrints.UI.WBP.Chat.ChatCommon")
local r2_0 = require("BluePrints.UI.WBP.Chat.ChatMessage").MessageList
local r3_0 = require("Utils.TimeUtils")
local r4_0 = Class("BluePrints.Common.MVC.Model")
function r4_0.Init(r0_1)
  -- line: [11, 30] id: 1
  r4_0.Super.Init(r0_1)
  r0_1._CurrentChannel = r0_0.ChannelDef.Public
  r0_1._CachedMainUISize = nil
  r0_1._CachedMainUIPos = nil
  r0_1._OriginMainUISize = nil
  r0_1._OriginMainUIPos = nil
  r0_1._MessageDict = {}
  for r5_1, r6_1 in pairs(r0_0.ChannelDef) do
    r0_1._MessageDict[r6_1] = r2_0:New(r0_0.ReddotNamePre .. r5_1 .. "_ChannelCD")
  end
  -- close: r1_1
  r0_1._CurrentFriendUid = nil
  r0_1:InitReddotCount()
  r0_1.SimpleChatOutAnimCurve = LoadObject("CurveFloat\'/Game/UI/WBP/Common/VX/UIVX/Curve/Curve_InteractiveItem_PC.Curve_InteractiveItem_PC\'")
  AddToRoot(r0_1.SimpleChatOutAnimCurve)
  r0_1.EnteredChannels = {}
  r0_1:UpdateCurrentChannel()
end
function r4_0.IsChannelExclude(r0_2, r1_2)
  -- line: [32, 34] id: 2
  return r0_2:GetAvatar().ChatChannelClose[r1_2]
end
function r4_0.Destory(r0_3)
  -- line: [36, 54] id: 3
  for r5_3, r6_3 in pairs(r0_0.ChannelDef) do
    r0_3._MessageDict[r6_3]:ClearMessage()
  end
  -- close: r1_3
  r0_3._MessageDict = {}
  r0_3._CurrentFriendUid = nil
  r0_3._CachedMainUISize = nil
  r0_3._CachedMainUIPos = nil
  r0_3._OriginMainUISize = nil
  r0_3._OriginMainUIPos = nil
  r0_3.EnteredChannels = {}
  r0_3._CurrentChannel = r0_0.ChannelDef.Public
  RemoveFromRoot(r0_3.SimpleChatOutAnimCurve)
  r0_3.SimpleChatOutAnimCurve = nil
  r4_0.Super.Destory(r0_3)
end
function r4_0.GetFriendChatDatas(r0_4)
  -- line: [57, 59] id: 4
  return r0_4:GetAvatar().Chats
end
function r4_0.GetEmojiDatas(r0_5)
  -- line: [61, 63] id: 5
  return r0_5:GetAvatar().Emoticons
end
function r4_0.GetQuickMsgDatas(r0_6)
  -- line: [65, 67] id: 6
  return r0_6:GetAvatar().QuickMessages
end
function r4_0.HasEmojiGroup(r0_7, r1_7)
  -- line: [69, 76] id: 7
  for r6_7, r7_7 in ipairs(r0_7:GetEmojiDatas()) do
    if r7_7 == r1_7 then
      return true
    end
  end
  -- close: r2_7
  return false
end
function r4_0.IsForbidChat(r0_8)
  -- line: [78, 83] id: 8
  if r3_0.NowTime() < r0_8:GetAvatar().ForbidChatTime then
    return true
  end
  return false
end
function r4_0.SetCurrentChannel(r0_9, r1_9)
  -- line: [87, 92] id: 9
  r0_9._CurrentChannel = r1_9
end
function r4_0.SetCurrentFriendUid(r0_10, r1_10)
  -- line: [94, 96] id: 10
  r0_10._CurrentFriendUid = r1_10
end
function r4_0.GetCurrentFriendUid(r0_11)
  -- line: [98, 100] id: 11
  return r0_11._CurrentFriendUid
end
function r4_0.UpdateCurrentChannel(r0_12)
  -- line: [102, 117] id: 12
  local r1_12 = r0_12._CurrentChannel
  while r0_12:IsChannelExclude(r1_12) do
    r1_12 = r1_12 + 1
    local r2_12 = r0_0.ChannelDef.Friend
    if r2_12 < r1_12 then
      r2_12 = r0_0.ChannelDef
      r1_12 = r2_12.TeamUp
    end
    r2_12 = r0_12._CurrentChannel
    if r1_12 == r2_12 then
      break
    end
  end
  r0_12._CurrentChannel = r1_12
  if r0_12._CurrentChannel == r0_0.ChannelDef.SettlementOnline and GWorld:IsStandAlone() then
    r0_12._CurrentChannel = r0_0.ChannelDef.Public
  end
end
function r4_0.GetCurrentChannel(r0_13)
  -- line: [119, 121] id: 13
  return r0_13._CurrentChannel
end
function r4_0.GetMainUISize(r0_14)
  -- line: [123, 128] id: 14
  if not r0_14._CachedMainUISize then
    r0_14._CachedMainUISize = FVector2D(0, 0)
  end
  return r0_14._CachedMainUISize
end
function r4_0.GetMainUIPos(r0_15)
  -- line: [130, 135] id: 15
  if not r0_15._CachedMainUIPos then
    r0_15._CachedMainUIPos = FVector2D(0, 0)
  end
  return r0_15._CachedMainUIPos
end
function r4_0.InitOriginMainUITransform(r0_16, r1_16)
  -- line: [138, 151] id: 16
  if not r0_16._OriginMainUISize then
    r0_16._OriginMainUISize = r1_16:GetSize()
    r0_16:GetMainUISize()
    r0_16._CachedMainUISize.X = r0_16._OriginMainUISize.X
    r0_16._CachedMainUISize.Y = r0_16._OriginMainUISize.Y
  end
  if not r0_16._OriginMainUIPos then
    r0_16._OriginMainUIPos = r1_16:GetPosition()
    r0_16:GetMainUIPos()
    r0_16._CachedMainUIPos.X = r0_16._OriginMainUIPos.X
    r0_16._CachedMainUIPos.Y = r0_16._OriginMainUIPos.Y
  end
end
function r4_0.ResetCachedMainUITransform(r0_17)
  -- line: [153, 166] id: 17
  if not r0_17._OriginMainUISize then
    return 
  end
  r0_17:GetMainUISize()
  r0_17._CachedMainUISize.X = r0_17._OriginMainUISize.X
  r0_17._CachedMainUISize.Y = r0_17._OriginMainUISize.Y
  if not r0_17._OriginMainUIPos then
    return 
  end
  r0_17:GetMainUIPos()
  r0_17._CachedMainUIPos.X = r0_17._OriginMainUIPos.X
  r0_17._CachedMainUIPos.Y = r0_17._OriginMainUIPos.Y
end
function r4_0.HasMainUIChanged(r0_18)
  -- line: [168, 171] id: 18
  local r1_18 = r0_18._CachedMainUISize.X
  if r1_18 == r0_18._OriginMainUISize.X then
    r1_18 = r0_18._CachedMainUISize.Y
    if r1_18 == r0_18._OriginMainUISize.Y then
      r1_18 = r0_18._CachedMainUIPos.X
      if r1_18 == r0_18._OriginMainUIPos.X then
        r1_18 = r0_18._CachedMainUIPos.Y ~= r0_18._OriginMainUIPos.Y
      end
    end
  else
    goto label_25	-- block#5 is visited secondly
  end
  return r1_18
end
function r4_0.AddReddotCount(r0_19, r1_19, r2_19)
  -- line: [176, 206] id: 19
  DebugPrint("ChatModel::AddReddotCount")
  if r0_19:GetAvatar().ChatChannelMute[r1_19] == 1 then
    DebugPrint("ChatModel::AddReddotCount, 聊天频道被屏蔽，不添加红点了")
    return 
  end
  if r1_19 ~= r0_0.ChannelDef.Friend then
    local r3_19 = r0_0.ReddotNamePre .. r0_0.ChannelNames[r1_19]
    if ReddotManager.GetTreeNode(r3_19):GetNodeCount() <= r0_0.ReddotMaxCount then
      ReddotManager.IncreaseLeafNodeCount(r3_19)
      ReddotManager.GetTreeNode(r3_19):UpdateParentsCount()
    end
  elseif r2_19 then
    local r3_19 = r0_19:GetFriendChatDatas()[r2_19]
    if not r3_19 then
      return 
    end
    local r4_19 = r0_0.ReddotNamePre .. r2_19
    local r5_19 = ReddotManager.GetTreeNode(r4_19)
    local r6_19 = r3_19:GetUnreadCount() - r5_19.Count
    if r6_19 > 0 and r5_19:GetNodeCount() <= r0_0.ReddotMaxCount then
      ReddotManager.IncreaseLeafNodeCount(r4_19, r6_19)
      ReddotManager.GetTreeNode(r4_19):UpdateParentsCount()
    end
  end
end
function r4_0.ClearReddotCount(r0_20, r1_20, r2_20)
  -- line: [208, 218] id: 20
  if not r1_20 then
    r1_20 = r0_20._CurrentChannel
  end
  if r1_20 ~= r0_0.ChannelDef.Friend then
    ReddotManager.ClearLeafNodeCount(r0_0.ReddotNamePre .. r0_0.ChannelNames[r1_20], true)
  else
    ReddotManager.ClearLeafNodeCount(r0_0.ReddotNamePre .. r2_20, true)
  end
end
function r4_0.AddFriendReddotNode(r0_21, r1_21, r2_21)
  -- line: [220, 237] id: 21
  DebugPrint(LXYTag, "Chat  新的好友红点添加，Uid:", r1_21)
  if r2_21 == nil then
    r2_21 = true
  end
  local r3_21 = r0_0.ReddotNamePre .. r1_21
  local r4_21 = ReddotManager.AddNodeEx(r3_21, nil, 1, EReddotType.Num)
  ReddotManager.ClearLeafNodeCount(r3_21)
  local r5_21 = r0_21:GetFriendChatDatas()[r1_21]
  if r5_21 and r5_21:GetUnreadCount() > 0 then
    ReddotManager.IncreaseLeafNodeCount(r3_21, r5_21:GetUnreadCount())
  end
  local r6_21 = r0_0.ReddotNamePre .. r0_0.ChannelNames[r0_0.ChannelDef.Friend]
  if r2_21 and not ReddotManager.GetTreeNode(r6_21) then
    ReddotManager.AddNodeEx(r6_21, {
      [r3_21] = {},
    }, 1)
    ReddotManager.AddNodeEx(r0_0.ReddotName, {
      [r6_21] = {},
    })
  end
  return r4_21
end
function r4_0.InitReddotCount(r0_22)
  -- line: [239, 263] id: 22
  local r1_22 = {}
  for r6_22, r7_22 in pairs(r0_0.ChannelDef) do
    local r8_22 = r0_0.ReddotNamePre .. r6_22
    if r7_22 ~= r0_0.ChannelDef.Friend then
      ReddotManager.AddNodeEx(r8_22, nil, 1, EReddotType.Num)
      ReddotManager.ClearLeafNodeCount(r8_22)
      r1_22[r8_22] = {}
    else
      local r9_22 = {}
      for r14_22, r15_22 in pairs(r0_22:GetAvatar().Friends) do
        r9_22[r0_22:AddFriendReddotNode(r14_22, false).Name] = {}
      end
      -- close: r10_22
      if next(r9_22) ~= nil then
        ReddotManager.AddNodeEx(r8_22, r9_22)
        r1_22[r8_22] = {}
      end
    end
  end
  -- close: r2_22
  if next(r1_22) ~= nil then
    ReddotManager.AddNodeEx(r0_0.ReddotName, r1_22)
  end
end
function r4_0.AddMessage(r0_23, r1_23, r2_23)
  -- line: [268, 296] id: 23
  DebugPrint("ChatModel::AddMessage", r0_23._CurrentChannel, r0_23._CurrentFriendUid)
  local r3_23 = r1_23.ChannelType
  DebugPrint("ChatModel::AddMessage", r2_23)
  if r2_23 then
    r0_23:AddReddotCount(r3_23, r1_23.Sender.Uid)
  end
  if r0_23._CurrentFriendUid and r1_23.Type == CommonConst.MESSAGE_TYPE_PRIVATE then
    r2_23 = true
    local r4_23 = r1_23.Sender.Uid
    if r1_23.Sender.Uid == GWorld:GetAvatar().Uid then
      r4_23 = r1_23.ReceiverUid
      r2_23 = false
    end
    if r3_23 ~= r0_23._CurrentChannel then
      return 
    elseif r0_23._CurrentFriendUid ~= r4_23 then
      if r2_23 then
        r0_23:AddReddotCount(r3_23, r4_23)
      end
      return 
    end
  end
  DebugPrint("ChatMessage::AddMessage bUnread, " .. tostring(r2_23))
  return r0_23._MessageDict[r3_23]:AddMessage(r1_23, r2_23)
end
function r4_0.GetCurrentMsgViewList(r0_24)
  -- line: [298, 337] id: 24
  if r0_24._CurrentChannel == r0_0.ChannelDef.Friend then
    local r1_24 = {
      Messages = {},
    }
    if r0_24._CurrentFriendUid then
      r1_24 = r0_24:GetFriendChatDatas()[r0_24._CurrentFriendUid]
      if r1_24 then
        r1_24 = r1_24
      end
    else
      local r2_24 = {}
      for r6_24 = 0, DataMgr.GlobalConstant.ChatMsgCountInBattleMain.ConstantValue, 1 do
        local r7_24 = nil
        for r12_24, r13_24 in pairs(r0_24:GetFriendChatDatas()) do
          if r0_24:GetAvatar().Friends[r12_24] then
            if r6_24 == 0 then
              r2_24[r12_24] = r13_24.Messages:Length()
            else
              local r14_24 = r2_24[r12_24]
              if r14_24 ~= 0 then
                local r15_24 = r13_24.Messages[r14_24]
                if not r7_24 or r7_24.Time < r15_24.Time then
                  r7_24 = r15_24
                end
              end
            end
          end
        end
        -- close: r8_24
        if r7_24 then
          table.insert(r1_24.Messages, r7_24)
          local r8_24 = r7_24.Sender.Uid
          if r8_24 == GWorld:GetAvatar().Uid then
            r8_24 = r7_24.ReceiverUid
          end
          r2_24[r8_24] = r2_24[r8_24] + -1
        end
      end
      table.reverse(r1_24.Messages)
    end
    r0_24._MessageDict[r0_24._CurrentChannel]:UpdateFromChat(r1_24)
  end
  return r0_24._MessageDict[r0_24._CurrentChannel].ViewList
end
function r4_0.GetChannelCDTimerKey(r0_25, r1_25)
  -- line: [339, 342] id: 25
  if r1_25 == nil then
    r1_25 = r0_25._CurrentChannel
  end
  return r0_25._MessageDict[r1_25].TimerKey
end
function r4_0.GetChannelCDReaminTime(r0_26, r1_26)
  -- line: [344, 347] id: 26
  if r1_26 == nil then
    r1_26 = r0_26._CurrentChannel
  end
  return r0_26._MessageDict[r1_26].CDRemainTime
end
function r4_0.GetChannelRemovedMsgs(r0_27, r1_27)
  -- line: [349, 352] id: 27
  if r1_27 == nil then
    r1_27 = r0_27._CurrentChannel
  end
  return r0_27._MessageDict[r1_27]:GetOnceRemovedMsgs()
end
function r4_0.SetChannelCDRemainTime(r0_28, r1_28, r2_28)
  -- line: [354, 357] id: 28
  if r2_28 == nil then
    r2_28 = r0_28._CurrentChannel
  end
  r0_28._MessageDict[r2_28].CDRemainTime = r1_28
end
function r4_0.SetChannelMsgCache(r0_29, r1_29, r2_29)
  -- line: [359, 368] id: 29
  if r2_29 == nil then
    r2_29 = r0_29._CurrentChannel
  end
  if r0_29._CurrentFriendUid and r2_29 == r0_0.ChannelDef.Friend then
    local r3_29 = r0_29:GetFriendChatDatas()[r0_29._CurrentFriendUid]
    if r3_29 then
      r3_29:SetMsgCache(r1_29)
    end
  end
  r0_29._MessageDict[r2_29].MsgCache = r1_29
end
function r4_0.GetChannelMsgCache(r0_30, r1_30)
  -- line: [370, 379] id: 30
  if r1_30 == nil then
    r1_30 = r0_30._CurrentChannel
  end
  if r0_30._CurrentFriendUid and r1_30 == r0_0.ChannelDef.Friend then
    local r2_30 = r0_30:GetFriendChatDatas()[r0_30._CurrentFriendUid]
    if r2_30 then
      r0_30:SetChannelMsgCache(r2_30:GetMsgCache())
    end
  end
  return r0_30._MessageDict[r1_30].MsgCache
end
function r4_0.GetChannelUnreadCount(r0_31, r1_31)
  -- line: [381, 384] id: 31
  if r1_31 == nil then
    r1_31 = r0_31._CurrentChannel
  end
  return r0_31._MessageDict[r1_31].UnreadCount
end
function r4_0.GetChannelNewTipWrap(r0_32, r1_32)
  -- line: [386, 389] id: 32
  if r1_32 == nil then
    r1_32 = r0_32._CurrentChannel
  end
  return r0_32._MessageDict[r1_32].NewTipWrap
end
function r4_0.ReadChannelMessage(r0_33, r1_33, r2_33)
  -- line: [391, 395] id: 33
  if r1_33 == nil then
    r1_33 = r0_33._CurrentChannel
  end
  r0_33._MessageDict[r1_33]:ReadMessage()
  r0_33:ClearReddotCount(r1_33, r2_33)
end
function r4_0.ClearMessage(r0_34, r1_34)
  -- line: [401, 404] id: 34
  if r1_34 == nil then
    r1_34 = r0_34._CurrentChannel
  end
  return r0_34._MessageDict[r1_34]:ClearMessage()
end
function r4_0.GetTeamForChat(r0_35)
  -- line: [406, 425] id: 35
  local r1_35 = TeamController:GetModel():GetTeam()
  if not GWorld:IsStandAlone() and r1_35 then
    r1_35 = CommonUtils.CopyTable(r1_35)
    local r2_35 = TeamController:GetModel():GetTeamBackup()
    for r7_35, r8_35 in ipairs(TeamController:GetModel():GetTeam().Members and {}) do
      local r9_35 = ipairs
      local r10_35 = nil	-- notice: implicit variable refs by block#[8]
      if r2_35 then
        r10_35 = r2_35.Members
        if not r10_35 then
          ::label_41::
          r10_35 = {}
        end
      else
        goto label_41	-- block#7 is visited secondly
      end
      for r13_35, r14_35 in r9_35(r10_35) do
        if r14_35.Nickname == r8_35.Nickname then
          local r15_35 = CommonUtils.CopyTable(r14_35)
          r15_35.Index = r8_35.Index
          r1_35.Members[r7_35] = r15_35
        end
      end
      -- close: r9_35
      r10_35 = GWorld:GetAvatar().Nickname
      if r8_35.Nickname == r10_35 and not r2_35 then
        r10_35 = GWorld:GetAvatar()
        r1_35.Members[r7_35] = r10_35
      end
    end
    -- close: r3_35
  end
  return r1_35
end
function r4_0.IsInRegionOnline(r0_36)
  -- line: [427, 429] id: 36
  return r0_36:GetAvatar().IsInRegionOnline
end
return r4_0
