-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\BattleOnlineAction\OnlineActionController.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("BluePrints.UI.WBP.BattleOnlineAction.OnlineActionModel")
local r1_0 = require("BluePrints.UI.WBP.BattleOnlineAction.OnlineActionCommon")
local r2_0 = Class("BluePrints.Common.MVC.Controller")
function r2_0.Init(r0_1, r1_1)
  -- line: [11, 23] id: 1
  if r0_1.bInited and not r1_1 then
    return 
  end
  DebugPrint("OnlineActionController Init")
  r2_0.Super.Init(r0_1)
  r0_0:Init(r1_1)
  r0_1.OpenReason = nil
  r0_1.MainPage = nil
  r0_1.OnlineActionBtn = nil
  r0_1:InitEvent()
end
function r2_0.InitEvent(r0_2)
  -- line: [25, 47] id: 2
  EventManager:RemoveEvent(EventID.ReceivedOthersOnlineActionApplication, r0_2)
  EventManager:AddEvent(EventID.ReceivedOthersOnlineActionApplication, r0_2, r0_2.OnReceiveApplyInfo)
  EventManager:RemoveEvent(EventID.OnReceivedOnlineActionApplicationReject, r0_2)
  EventManager:AddEvent(EventID.OnReceivedOnlineActionApplicationReject, r0_2, r0_2.OnReceivedRejectApply)
  EventManager:RemoveEvent(EventID.ReceivedOthersOnlineActionInvitation, r0_2)
  EventManager:AddEvent(EventID.ReceivedOthersOnlineActionInvitation, r0_2, r0_2.OnReceivedInvitation)
  EventManager:RemoveEvent(EventID.OnReceivedOnlineActionInvitationReject, r0_2)
  EventManager:AddEvent(EventID.OnReceivedOnlineActionInvitationReject, r0_2, r0_2.OnReceivedRejectInvitation)
  EventManager:RemoveEvent(EventID.RequestDeadRegionOnlineItem, r0_2)
  EventManager:AddEvent(EventID.RequestDeadRegionOnlineItem, r0_2, r0_2.OnRequestDeadRegionOnlineItem)
  EventManager:RemoveEvent(EventID.OnReceivedOnlineActionApplicationAgree, r0_2)
  EventManager:AddEvent(EventID.OnReceivedOnlineActionApplicationAgree, r0_2, r0_2.OnReceivedOnlineActionApplicationAgree)
  EventManager:RemoveEvent(EventID.OnReceivedOnlineActionInvitationAgree, r0_2)
  EventManager:AddEvent(EventID.OnReceivedOnlineActionInvitationAgree, r0_2, r0_2.OnReceivedOnlineActionInvitationAgree)
end
function r2_0.RemoveEvent(r0_3)
  -- line: [49, 64] id: 3
  EventManager:RemoveEvent(EventID.ReceivedOthersOnlineActionApplication, r0_3)
  EventManager:RemoveEvent(EventID.OnReceivedOnlineActionApplicationReject, r0_3)
  EventManager:RemoveEvent(EventID.ReceivedOthersOnlineActionInvitation, r0_3)
  EventManager:RemoveEvent(EventID.OnReceivedOnlineActionInvitationReject, r0_3)
  EventManager:RemoveEvent(EventID.RequestDeadRegionOnlineItem, r0_3)
  EventManager:RemoveEvent(EventID.OnReceivedOnlineActionApplicationAgree, r0_3)
  EventManager:RemoveEvent(EventID.OnReceivedOnlineActionInvitationAgree, r0_3)
end
function r2_0.OnCreatOnlineAction(r0_4, r1_4)
  -- line: [69, 91] id: 4
  if not r0_0:IsInRegionOnline() then
    return 
  end
  if UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0).CurResourceId == 0 then
    DebugPrint("角色已停止联机动作")
    return false
  end
  r0_4.OpenReason = 1
  r0_4:ChangeAction(r1_4)
  r0_4:ShowBtn(1)
  DebugPrint("yklua :角色创建联机机关 UniqueId " .. r1_4)
end
function r2_0.ChangeAction(r0_5, r1_5)
  -- line: [94, 96] id: 5
  r0_0:ChangeAction(r1_5)
end
function r2_0.OnRequestDeadRegionOnlineItem(r0_6)
  -- line: [98, 101] id: 6
  DebugPrint("联机动作Btn收到动作关系消息，开始隐藏OnRequestDeadRegionOnlineItem")
  r0_6:OnEndOnlineAction()
end
function r2_0.OnEndOnlineAction(r0_7)
  -- line: [104, 114] id: 7
  r0_0:ClearAllApply()
  if r0_7.OpenReason == 1 then
    if r0_0:HaveOtherInvitation() then
      r0_7.OpenReason = 2
    else
      r0_7.OpenReason = nil
      r0_7:HideBtn()
    end
  end
end
function r2_0.IsShowingBtn(r0_8)
  -- line: [144, 146] id: 8
  return r0_8.OpenReason ~= nil
end
function r2_0.ShowBtn(r0_9, r1_9)
  -- line: [148, 183] id: 9
  r0_9.OpenReason = r1_9
  local r2_9 = UIManager(r0_9):GetUIObj("BattleMain")
  if not r2_9 then
    ScreenPrint("yklua OnlineAction:ShowBtn 没有拿到BattleMain")
    return 
  end
  local r3_9 = UIManager(r0_9):CreateWidget(r1_0.OnlineActionBtnBPPath)
  if not r3_9 then
    ScreenPrint("yklua OnlineAction:ShowBtn 创建按钮失败")
    return 
  end
  r0_9.OnlineActionBtn = r3_9
  r2_9.Pos_OnlineAction:ClearChildren()
  r2_9.Pos_OnlineAction:AddChild(r3_9)
  r2_9.Pos_OnlineAction:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r2_9.OnlineActionBtn = r3_9
  r3_9.Parent = r2_9
  r3_9:Show()
end
function r2_0.ShowBtnBubble(r0_10, r1_10)
  -- line: [185, 189] id: 10
  if r0_10.OnlineActionBtn then
    r0_10.OnlineActionBtn:ShowOrHideBubble(r1_10)
  end
end
function r2_0.HideBtn(r0_11)
  -- line: [192, 213] id: 11
  DebugPrint("OnlineAction:HideBtn")
  local r1_11 = UIManager(r0_11):GetUIObj("BattleMain")
  if not r1_11 then
    ScreenPrint("yklua OnlineAction:HideBtn 没有拿到BattleMain")
    return 
  end
  if r0_11.OnlineActionBtn and IsValid(r0_11.OnlineActionBtn) then
    r0_11.OnlineActionBtn:PlayOutAni(function()
      -- line: [201, 206] id: 12
      r1_11.Pos_OnlineAction:ClearChildren()
      r1_11.OnlineActionBtn = nil
      r0_11.OnlineActionBtn = nil
      r0_11.OpenReason = nil
    end)
  else
    r1_11.Pos_OnlineAction:ClearChildren()
    r1_11.OnlineActionBtn = nil
    r0_11.OnlineActionBtn = nil
    r0_11.OpenReason = nil
  end
end
function r2_0.OpenView(r0_13, r1_13, r2_13)
  -- line: [215, 224] id: 13
  DebugPrint("OnlineAction:OpenView")
  if r0_13.OpenReason == 1 then
    r0_0:FindPlayerAround()
  end
  AudioManager(r0_13):PlayUISound(r0_13.OnlineActionBtn, "event:/ui/common/online_invite_interact_panel_expand", "OnlineActionPageOpen", nil)
  r0_13.MainPage = r2_0.Super.OpenView(r0_13, nil, r1_0.UIName)
  r0_13.MainPage:InitBaseView(r0_13.OpenReason)
  return r0_13.MainPage
end
function r2_0.SetBtnReddotRead(r0_14)
  -- line: [226, 231] id: 14
  if r0_14.OnlineActionBtn then
    r0_14.OnlineActionBtn:ShowOrHideReddot(false)
    r0_14.OnlineActionBtn:ShowOrHideBubble(0)
  end
end
function r2_0.CloseView(r0_15)
  -- line: [233, 245] id: 15
  if r0_15.OnlineActionBtn and IsValid(r0_15.OnlineActionBtn) then
    r0_15.OnlineActionBtn:ShowOrHideReddot(false)
    r0_15.OnlineActionBtn:ShowOrHideBubble(0)
  end
  r0_15:CheckHideBtn()
  AudioManager(r0_15):SetEventSoundParam(r0_15.OnlineActionBtn, "OnlineActionPageOpen", {
    ToEnd = 1,
  })
  r0_0:SetAllInfoRead()
  r0_15.MainPage = nil
end
function r2_0.CheckHideBtn(r0_16)
  -- line: [247, 254] id: 16
  local r1_16 = r0_0:GetActionUniqueId() ~= nil
  local r2_16 = r0_0:HaveOtherInvitation()
  local r3_16 = r0_0:HaveOtherApply()
  if not r1_16 and not r2_16 and not r3_16 then
    r0_16:HideBtn()
  end
end
function r2_0.NotifyTick(r0_17, r1_17)
  -- line: [256, 266] id: 17
  if r0_17.IsDestroied then
    return 
  end
  r0_0:NotifyTick(r1_17)
  if r0_17.MainPage then
    r0_17.MainPage:NotifyTick(r1_17)
  end
end
function r2_0.SendMessage(r0_18, r1_18)
  -- line: [269, 271] id: 18
  r0_0:SendMessage(r1_18)
end
function r2_0.SendApplication(r0_19, r1_19)
  -- line: [274, 279] id: 19
end
function r2_0.RejectAllApplications(r0_20)
  -- line: [281, 288] id: 20
  DebugPrint("OnlineAction:RejectAllApplications")
  local r1_20 = r0_0:GetApplyInfos()
  if not r1_20 then
    return 
  end
  for r5_20 = #r1_20, 1, -1 do
    r0_20:SendRejectApplication(r1_20[r5_20])
  end
end
function r2_0.SendAcceptApplication(r0_21, r1_21)
  -- line: [292, 332] id: 21
  DebugPrint("OnlineAction:SendAcceptApplication", r1_21)
  local r2_21 = {}
  local r3_21 = r0_0:GetApplyInfos()
  if r3_21 then
    for r8_21, r9_21 in ipairs(r3_21) do
      if r9_21.InteractiveId == r1_21.InteractiveId and r9_21.Eid ~= r1_21.Eid then
        DebugPrint("拒绝其他申请加入" .. r9_21.InteractiveId .. " " .. r9_21.Eid .. " " .. r1_21.InteractiveId .. " " .. r1_21.Eid)
        table.insert(r2_21, r9_21)
      end
    end
    -- close: r4_21
  end
  local r4_21 = r0_21:CheckCanSit(r1_21.UniqueId, r1_21.Eid, true)
  r0_0:RemoveApplyInfo(r1_21)
  if r4_21 ~= true then
    return 
  end
  if r0_0._Avatar and r1_21.UniqueId then
    r0_0._Avatar:OnRequestUseOwnerRegionOnlineItem(r1_21.Eid, true, r0_0:GetActionUniqueId(), r1_21.InteractiveId)
  else
    DebugPrint("缺少了UniqueId，应该是加假数据OnlineAction:OnReceivedRejectApply")
  end
  for r9_21, r10_21 in ipairs(r2_21) do
    r0_21:SendRejectApplication(r10_21)
    r0_0:RemoveApplyInfo(r10_21)
  end
  -- close: r5_21
  local r5_21 = GWorld:GetAvatar():GetBornedChar(r1_21.Eid)
  local r7_21 = UE4.UGameplayStatics.GetGameState(r5_21).RegionOnlineMechanismMap:Find(r1_21.UniqueId)
  local r8_21 = r7_21.ChestInteractiveComponent
  print(_G.LogTag, "LXZ SendAcceptApplication", r7_21, r7_21:IsCanOnlineInteractive())
  if r7_21 and r7_21:IsCanOnlineInteractive(r5_21) then
    r5_21:InteractiveMechanism(r7_21.Eid, r5_21.Eid, r8_21.NextStateId, r8_21.CommonUIConfirmID, true, r1_21.InteractiveId and 0)
  end
end
function r2_0.SendRejectApplication(r0_22, r1_22)
  -- line: [335, 345] id: 22
  r0_0:RemoveApplyInfo(r1_22)
  DebugPrint("OnlineAction:SendRejectApplication", r1_22)
  if r1_22.UniqueId == nil then
    DebugPrint("缺少了UniqueId，应该是加假数据OnlineAction:OnReceivedRejectApply")
    return 
  end
  if r0_0._Avatar then
    r0_0._Avatar:OnRequestUseOwnerRegionOnlineItem(r1_22.Eid, false, r1_22.UniqueId, r1_22.InteractiveId and 0)
  end
end
function r2_0.RejectAllInvitations(r0_23)
  -- line: [348, 355] id: 23
  DebugPrint("OnlineAction:RejectAllInvitations")
  local r1_23 = r0_0:GetInvitationInfos()
  if not r1_23 then
    return 
  end
  for r5_23 = #r1_23, 1, -1 do
    r0_23:SendRejectInvitation(r1_23[r5_23])
  end
end
function r2_0.SendInvitation(r0_24, r1_24, r2_24)
  -- line: [357, 383] id: 24
  if r0_0:GetActionUniqueId() == nil then
    DebugPrint("缺少了UniqueId，应该是加假数据OnlineAction:OnReceivedRejectApply")
    return 
  end
  local r3_24 = r0_0:CheckNearbyInfoVaild(r1_24, r2_24)
  if r3_24 == -1 then
    UIManager(r0_24):ShowUITip(UIConst.Tip_CommonToast, GText("UI_RegionOnline_Invite_State"))
    return 
  end
  if r3_24 == -2 then
    UIManager(r0_24):ShowUITip(UIConst.Tip_CommonToast, GText("UI_RegionOnline_Invite_Sitting"))
    return 
  end
  if r3_24 == -3 then
    UIManager(r0_24):ShowUITip(UIConst.Tip_CommonToast, GText("UI_RegionOnline_SitOccupied"))
    return 
  end
  DebugPrint("OnlineAction:SendInvitation", r1_24)
  if r0_0._Avatar then
    r0_0._Avatar:RequestHostInvitationOther(r1_24.Eid, r0_0:GetActionUniqueId(), math.max(0, (r2_24 and 1) + -1), 0)
  end
end
function r2_0.SendRejectInvitation(r0_25, r1_25)
  -- line: [386, 396] id: 25
  r0_0:RemoveInvitationInfo(r1_25)
  DebugPrint("OnlineAction:SendRejectInvitation", r1_25)
  if r1_25.UniqueId == nil then
    DebugPrint("缺少了UniqueId，应该是加假数据OnlineAction:OnReceivedRejectApply")
    return 
  end
  if r0_0._Avatar then
    r0_0._Avatar:OnRequestOtherUserRegionOnlineItem(r1_25.Eid, false, r1_25.UniqueId, r1_25.InteractiveId and 0)
  end
end
function r2_0.SendAcceptInvitation(r0_26, r1_26)
  -- line: [398, 417] id: 26
  r0_0:RemoveInvitationInfo(r1_26)
  DebugPrint("OnlineAction:SendAcceptInvitation", r1_26)
  if r1_26.UniqueId == nil then
    DebugPrint("缺少了UniqueId，应该是假数据OnlineAction:OnReceivedRejectApply")
    return 
  end
  if not r0_26:CheckCanSit(r1_26.UniqueId, r0_0:GetAvatar().Eid, r1_26.InteractiveId, true) then
    r0_0:RemoveInvitationInfo(r1_26)
    return 
  end
  if r0_0._Avatar then
    r0_0._Avatar:OnRequestOtherUserRegionOnlineItem(r1_26.Eid, true, r1_26.UniqueId, r1_26.InteractiveId and 0)
  end
  r0_26:RejectAllInvitations()
end
function r2_0.CheckSeatFree(r0_27, r1_27, r2_27)
  -- line: [420, 436] id: 27
  if not r2_27 then
    r2_27 = r0_0:GetActionUniqueId()
  end
  local r4_27 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance).RegionOnlineMechanismMap:Find(r2_27)
  if not r4_27 then
    ScreenPrint("交互失败：座椅不存在")
    return false
  end
  local r5_27 = r4_27:CheckInteractiveIdValid(r1_27)
  if not r5_27 then
    ScreenPrint("交互失败：座椅被占用或者无效")
  end
  return r5_27
end
function r2_0.CheckCanSit(r0_28, r1_28, r2_28, r3_28, r4_28)
  -- line: [438, 449] id: 28
  local r6_28 = nil	-- notice: implicit variable refs by block#[4]
  if r0_0:CheckJoinValid(r2_28, r1_28, r3_28) ~= 0 then
    if r4_28 then
      r6_28 = "UI_RegionOnline_Invitation_Invalid"
      if not r6_28 then
        ::label_13::
        r6_28 = "UI_RegionOnline_Apply_Invalid"
      end
    else
      goto label_13	-- block#3 is visited secondly
    end
    UIManager(r0_28):ShowUITip(UIConst.Tip_CommonToast, GText(r6_28))
    return false
  end
  r6_28 = true
  return r6_28
end
function r2_0.RealSit(r0_29, r1_29, r2_29, r3_29)
  -- line: [451, 461] id: 29
  local r4_29 = GWorld:GetAvatar().Player and GWorld:GetMainPlayer()
  local r6_29 = UE4.UGameplayStatics.GetGameState(r4_29).RegionOnlineMechanismMap:Find(r1_29)
  local r7_29 = r6_29.ChestInteractiveComponent
  print(_G.LogTag, "LXZ RealSit111", r6_29, r6_29:IsCanOnlineInteractive())
  if r6_29 then
    r4_29:InteractiveMechanism(r6_29.Eid, r4_29.Eid, r7_29.NextStateId, r7_29.CommonUIConfirmID, true, r3_29)
  end
end
function r2_0.OnReceivedInvitation(r0_30, r1_30, r2_30, r3_30)
  -- line: [465, 480] id: 30
  AudioManager(r0_30):PlayUISound(r0_30.OnlineActionBtn, "event:/ui/common/online_invite_interact_request", "OnlineActionReceived", nil)
  ReddotManager.IncreaseLeafNodeCount("OnlineActionBtn", 1)
  DebugPrint("OnlineAction:OnReceivedInvitation", r1_30, r2_30, r3_30)
  local r4_30 = r0_0:AddInvitationInfo(r1_30, r2_30, r3_30)
  if not r0_30.OnlineActionBtn then
    r0_30:ShowBtn(2)
  end
  r0_30:ShowBtnBubble(2)
  if r0_30.MainPage and r0_30.MainPage:IsVisible() then
    r0_30.MainPage:OnReceivedNewInvitation(r4_30)
  end
end
function r2_0.OnReceiveApplyInfo(r0_31, r1_31, r2_31, r3_31)
  -- line: [482, 498] id: 31
  AudioManager(r0_31):PlayUISound(r0_31.OnlineActionBtn, "event:/ui/common/online_invite_interact_request", "OnlineActionReceived", nil)
  ScreenPrint("联机动作收到申请" .. r1_31 .. r2_31 .. r3_31)
  ReddotManager.IncreaseLeafNodeCount("OnlineActionBtn", 1)
  DebugPrint("OnlineAction:OnReceiveApplyInfo", r1_31, r2_31, r3_31)
  local r4_31 = r0_0:AddApplyInfo(r1_31, r2_31, r3_31)
  if not r0_31.OnlineActionBtn then
    r0_31:ShowBtn(2)
  end
  r0_31:ShowBtnBubble(1)
  if r0_31.MainPage and r0_31.MainPage:IsVisible() then
    r0_31.MainPage:OnReceivedNewApplication(r4_31)
  end
end
function r2_0.OnReceivedRejectInvitation(r0_32, r1_32, r2_32, r3_32)
  -- line: [500, 506] id: 32
  DebugPrint("OnlineAction:OnReceivedRejectInvitation", r1_32, r2_32, r3_32)
end
function r2_0.OnReceivedRejectApply(r0_33, r1_33, r2_33, r3_33)
  -- line: [508, 514] id: 33
  DebugPrint("OnlineAction:OnReceivedRejectApply", r1_33, r2_33, r3_33)
  local r5_33 = string.format(GText("UI_RegionOnline_Apply_Refused"), r0_0:GetPlayerName(r1_33))
  AudioManager(r0_33):PlayUISound(r0_33.OnlineActionBtn, "event:/ui/common/online_invite_interact_reject", "OnlineActionRejected", nil)
  UIManager(r0_33):ShowUITip(UIConst.Tip_CommonToast, r5_33)
end
function r2_0.OnReceivedOnlineActionApplicationAgree(r0_34, r1_34, r2_34, r3_34)
  -- line: [516, 518] id: 34
  AudioManager(r0_34):PlayUISound(r0_34.OnlineActionBtn, "event:/ui/common/online_invite_interact_accept", "OnlineActionAgreed", nil)
end
function r2_0.OnReceivedOnlineActionInvitationAgree(r0_35, r1_35, r2_35, r3_35)
  -- line: [520, 522] id: 35
  AudioManager(r0_35):PlayUISound(r0_35.OnlineActionBtn, "event:/ui/common/online_invite_interact_accept", "OnlineActionAgreed", nil)
end
function r2_0.ShowToastByErrorCode(r0_36, r1_36, r2_36)
  -- line: [524, 532] id: 36
  local r3_36 = ""
  if r1_36 then
    r3_36 = GText("UI_RegionOnline_Invitation_Invalid")
  else
    r3_36 = GText("UI_RegionOnline_Apply_Invalid")
  end
  UIManager(r0_36):ShowUITip(UIConst.Tip_CommonToast, r3_36)
end
function r2_0.Destory(r0_37)
  -- line: [534, 543] id: 37
  DebugPrint("yklua 联机动作相关数据销毁OnlineAction:Destory")
  if r0_37.OnlineActionBtn then
    r0_37:HideBtn()
  end
  r0_37.OpenReason = nil
  r0_37.MainPage = nil
  r2_0.Super.Destory(r0_37)
end
function r2_0.GetModel(r0_38)
  -- line: [545, 547] id: 38
  return r0_0
end
function r2_0.GetEventName(r0_39)
  -- line: [549, 551] id: 39
  return ""
end
function r2_0.GetView(r0_40, r1_40)
  -- line: [553, 555] id: 40
  return r2_0.Super.GetView(r0_40, r1_40, r1_0.UIName)
end
return r2_0
