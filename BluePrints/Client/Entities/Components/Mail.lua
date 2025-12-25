-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Client\Entities\Components\Mail.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {}
local r1_0 = DataMgr.ReddotNode.NormalMail.Name
local function r2_0(r0_1)
  -- line: [5, 10] id: 1
  for r5_1, r6_1 in pairs(r0_1._inner) do
    DebugPrint("key :", r5_1)
    PrintTable(r6_1.Props, 2)
  end
  -- close: r1_1
end
function r0_0.EnterWorld(r0_2)
  -- line: [12, 15] id: 2
  r0_2:InitMailReddotNode()
  r0_2._PendingDelMails = {}
end
function r0_0.LeaveWorld(r0_3)
  -- line: [17, 19] id: 3
  r0_3._PendingDelMails = nil
end
function r0_0._OnPropChangeMailInbox(r0_4, r1_4)
  -- line: [21, 46] id: 4
  if CommonUtils.Size(r1_4) > 0 then
    if not ReddotManager.GetTreeNode(r1_0) then
      return 
    end
    local r3_4 = r1_4[1]
    local r4_4 = r0_4.MailInbox[r3_4]
    if CommonUtils.Size(r1_4) == 1 and r4_4 and not r0_4._DeletedStarMail then
      r0_4:_AddNormalMailReddotCount(r4_4)
    end
    r0_4._DeletedStarMail = nil
    if CommonUtils.Size(r1_4) == 1 and not r4_4 then
      local r5_4 = r0_4._PendingDelMails[r3_4]
      if r5_4 and r5_4.MailReaded == 1 and r5_4.RewardGot == 0 then
        r0_4:_SubNormalMailReddotCount({
          RewardGot = 1,
          MailReaded = 1,
        })
      elseif not r5_4 then
        r0_4:_SubNormalMailReddotCount({
          RewardGot = 1,
          MailReaded = 1,
        })
      end
      r0_4._PendingDelMails[r3_4] = nil
    end
  end
end
function r0_0.InitMailReddotNode(r0_5)
  -- line: [49, 63] id: 5
  if not ReddotManager.GetTreeNode(r1_0) then
    local r1_5 = ReddotManager.AddNode(r1_0)
  end
  ReddotManager.ClearLeafNodeCount(r1_0)
  for r6_5, r7_5 in pairs(r0_5.MailInbox and {}) do
    DebugPrint(string.format("初始化邮件红点，UniqueId %s, 已领奖：%s, 已读%s", r6_5, r7_5.RewardGot, r7_5.MailReaded))
    r0_5:_AddNormalMailReddotCount(r7_5)
  end
  -- close: r2_5
  for r6_5, r7_5 in pairs(r0_5.StarMails and {}) do
    DebugPrint(string.format("初始化邮件红点，UniqueId %s, 已领奖：%s, 已读%s", r6_5, r7_5.RewardGot, r7_5.MailReaded))
    r0_5:_AddNormalMailReddotCount(r7_5)
  end
  -- close: r2_5
end
function r0_0._AddNormalMailReddotCount(r0_6, r1_6)
  -- line: [65, 70] id: 6
  if r1_6.MailReaded == 0 or r1_6.RewardGot == 0 then
    DebugPrint("_AddNormalMailReddotCount邮件")
    ReddotManager.IncreaseLeafNodeCount(r1_0)
  end
end
function r0_0._SubNormalMailReddotCount(r0_7, r1_7)
  -- line: [72, 77] id: 7
  if r1_7.MailReaded == 1 and r1_7.RewardGot == 1 then
    DebugPrint("_SubNormalMailReddotCount邮件")
    ReddotManager.DecreaseLeafNodeCount(r1_0)
  end
end
function r0_0._SubAllNormalMailReddotCount(r0_8)
  -- line: [79, 81] id: 8
  ReddotManager.ClearLeafNodeCount(r1_0)
end
function r0_0.EchoMail(r0_9)
  -- line: [84, 91] id: 9
  DebugPrint("===========================")
  r0_9.logger.info("MailInbox : ")
  r2_0(r0_9.MailInbox)
  r0_9.logger.info("StarMail : ")
  r2_0(r0_9.StarMails)
  DebugPrint("===========================")
end
function r0_0.GetMailRewards(r0_10, r1_10)
  -- line: [94, 105] id: 10
  local function r2_10(r0_11, r1_11)
    -- line: [95, 102] id: 11
    EventManager:FireEvent(EventID.OnGetMailRewards, r0_11, r1_10, r1_11)
    r0_10.logger.info("GetMailRewards Callback", r1_10, ErrorCode:Name(r0_11))
    PrintTable(r1_11, 10, "GetMailRewards Callback")
    if r0_11 == ErrorCode.RET_SUCCESS then
      r0_10:_SubNormalMailReddotCount(r0_10.MailInbox[r1_10] and r0_10.StarMails[r1_10])
    end
  end
  r0_10.logger.info("GetMailRewards Start UniqueID:", r1_10)
  r0_10:CallServer("GetMailRewards", r2_10, r1_10)
end
function r0_0.MarkMailReaded(r0_12, r1_12)
  -- line: [107, 117] id: 12
  local function r2_12(r0_13)
    -- line: [108, 114] id: 13
    EventManager:FireEvent(EventID.OnMarkMailReaded, r0_13, r1_12)
    r0_12.logger.info("MarkMailReaded Callback", ErrorCode:Name(r0_13))
    if r0_13 == ErrorCode.RET_SUCCESS then
      r0_12:_SubNormalMailReddotCount(r0_12.MailInbox[r1_12])
    end
  end
  r0_12.logger.info("MarkMailReaded Start UniqueID:", r1_12)
  r0_12:CallServer("MarkMailReaded", r2_12, r1_12)
end
function r0_0.MarkMailStar(r0_14, r1_14)
  -- line: [119, 129] id: 14
  local function r2_14(r0_15, r1_15)
    -- line: [120, 126] id: 15
    EventManager:FireEvent(EventID.OnMarkMailStar, r0_15, r1_14, r1_15)
    r0_14.logger.info("MarkMailStar Callback", ErrorCode:Name(r0_15), r1_15)
    if r0_15 == ErrorCode.RET_SUCCESS then
      r0_14:_SubNormalMailReddotCount(r0_14.StarMails[r1_14] and r0_14.MailInbox[r1_14])
    end
  end
  r0_14.logger.info("MarkMailStar Start UniqueID:", r1_14)
  r0_14:CallServer("MarkMailStar", r2_14, r1_14)
end
function r0_0.DeleteReadedMails(r0_16)
  -- line: [131, 142] id: 16
  local function r1_16(r0_17)
    -- line: [132, 136] id: 17
    r0_16.logger.info("DeleteReadedMails Callback", ErrorCode:Name(r0_17))
    EventManager:FireEvent(EventID.OnDeleteMail)
    r0_16:EchoMail()
  end
  for r6_16, r7_16 in pairs(r0_16.MailInbox) do
    r0_16._PendingDelMails[r6_16] = r7_16
  end
  -- close: r2_16
  r0_16.logger.info("DeleteReadedMails Start")
  r0_16:CallServer("DeleteReadedMails", r1_16)
end
function r0_0.CancelMailStar(r0_18, r1_18)
  -- line: [144, 152] id: 18
  r0_18._DeletedStarMail = r0_18.StarMails[r1_18]
  local function r2_18(r0_19)
    -- line: [146, 149] id: 19
    EventManager:FireEvent(EventID.OnCancelMailStar, r0_19, r1_18)
    r0_18.logger.info("CancelMailStar Callback", ErrorCode:Name(r0_19))
  end
  r0_18.logger.info("CancelMailStar Start UniqueID:", r1_18)
  r0_18:CallServer("CancelMailStar", r2_18, r1_18)
end
function r0_0.DeleteMail(r0_20, r1_20)
  -- line: [154, 163] id: 20
  r0_20._PendingDelMails[r1_20] = r0_20.MailInbox[r1_20] and r0_20.StarMails[r1_20]
  local function r3_20(r0_21)
    -- line: [157, 160] id: 21
    r0_20.logger.info("DeleteMail Callback", ErrorCode:Name(r0_21))
    EventManager:FireEvent(EventID.OnDeleteMail)
  end
  r0_20.logger.info("DeleteMail Start UniqueID:", r1_20)
  r0_20:CallServer("DeleteMail", r3_20, r1_20)
end
function r0_0.GetAllMailReward(r0_22)
  -- line: [165, 175] id: 22
  local function r1_22(r0_23, r1_23)
    -- line: [166, 172] id: 23
    EventManager:FireEvent(EventID.OnGetAllMailReward, r0_23, r1_23)
    r0_22.logger.info("GetAllMailReward Callback", ErrorCode:Name(r0_23))
    if r0_23 == ErrorCode.RET_SUCCESS then
      r0_22:_SubAllNormalMailReddotCount()
    end
  end
  r0_22.logger.info("GetAllMailReward Start ")
  r0_22:CallServer("GetAllMailReward", r1_22)
end
return r0_0
