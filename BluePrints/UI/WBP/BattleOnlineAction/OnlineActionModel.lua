-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\BattleOnlineAction\OnlineActionModel.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("BluePrints.UI.WBP.BattleOnlineAction.OnlineActionCommon")
local r1_0 = Class("BluePrints.Common.MVC.Model")
function r1_0.Init(r0_1)
  -- line: [6, 87] id: 1
  DebugPrint("OnlineActionModel Init")
  r1_0.Super.Init(r0_1)
  r0_1._Avatar = nil
  r0_1:GetAvatar()
  r0_1.ActionResourceId = 0
  r0_1.ActionUniqueId = 0
  r0_1.MaxPlayerNum = 0
  r0_1.NearbyPlayerInfos = {}
  r0_1.ApplyInfos = {}
  r0_1.InvitationInfos = {}
  r0_1.NameTemp = {}
  ReddotManager.AddNodeEx("OnlineActionBtn")
end
function r1_0.CreatFakeInvitationInfo(r0_2)
  -- line: [89, 154] id: 2
  r0_2.InvitationInfos = {}
  r0_2.ApplyInfos = {}
  for r4_2 = 1, 20, 1 do
    table.insert(r0_2.InvitationInfos, {
      Uid = "FakeUid" .. r4_2,
      NickName = "FakePlayer" .. r4_2,
      Actor = nil,
      Eid = "FakeEid" .. r4_2,
      Level = 10,
      HeadIconId = 10001,
      HeadFrameId = -1,
      TitleBefore = 10001,
      TitleAfter = 0,
      TitleFrame = 10001,
      bNew = true,
      RecivedTime = os.clock(),
      RemainTime = r0_0.AutoRejectTime,
    })
    table.insert(r0_2.ApplyInfos, {
      Uid = "FakeUid" .. r4_2,
      NickName = "FakePlayer" .. r4_2,
      Actor = nil,
      Eid = "FakeEid" .. r4_2,
      Level = 10,
      InteractiveId = 1,
      HeadIconId = 10001,
      HeadFrameId = -1,
      TitleBefore = 10001,
      TitleAfter = 0,
      TitleFrame = 10001,
      bNew = true,
      RecivedTime = os.clock(),
      RemainTime = r0_0.AutoRejectTime,
    })
    table.insert(r0_2.NearbyPlayerInfos, {
      Uid = "FakeUid" .. r4_2,
      NickName = "FakePlayer" .. r4_2,
      ObjId = "FakeObjId" .. r4_2,
      Actor = nil,
      Level = 10,
      HeadIconId = 10001,
      HeadFrameId = -1,
      TitleBefore = 10001,
      TitleAfter = 0,
      TitleFrame = 10001,
    })
  end
  ReddotManager.IncreaseLeafNodeCount("OnlineActionBtn", 1)
end
function r1_0.GetActionUniqueId(r0_3)
  -- line: [156, 161] id: 3
  if r0_3.ActionUniqueId ~= 0 then
    return r0_3.ActionUniqueId
  end
  return nil
end
function r1_0.GetResourceIdByUniqueId(r0_4, r1_4)
  -- line: [164, 171] id: 4
  local r3_4 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance).RegionOnlineMechanismMap:Find(r1_4)
  if not r3_4 then
    return 0
  end
  return r3_4.ResourceId
end
function r1_0.GetActionNameByUniqueId(r0_5, r1_5)
  -- line: [173, 182] id: 5
  local r2_5 = r0_5:GetResourceIdByUniqueId(r1_5)
  if r2_5 == 0 then
    return ""
  end
  if DataMgr.Resource[r2_5] and DataMgr.Resource[r2_5].ResourceName then
    return DataMgr.Resource[r2_5].ResourceName
  end
  return ""
end
function r1_0.GetMaxInteractiveNum(r0_6, r1_6)
  -- line: [184, 193] id: 6
  local r2_6 = r0_6:GetResourceIdByUniqueId(r1_6)
  if r2_6 == 0 then
    return 1
  end
  if DataMgr.Resource[r2_6] and DataMgr.Resource[r2_6].InteractPlayerNum then
    return DataMgr.Resource[r2_6].InteractPlayerNum
  end
  return 1
end
function r1_0.GetMaxPlayerNum(r0_7)
  -- line: [196, 222] id: 7
  r0_7.ActionResourceId = r0_7:GetResourceIdByUniqueId(r0_7.ActionUniqueId)
  if not r0_7.ActionResourceId or r0_7.ActionResourceId == 0 then
    if not r0_7.ActionUniqueId then
      ScreenPrint("获得当前动作的可容纳人数失败，没找到对应的Resource self.ActionResourceId=" .. tostring(r0_7.ActionResourceId))
      return 1
    end
    r0_7.ActionResourceId = r0_7:GetResourceIdByUniqueId(r0_7.ActionUniqueId)
  end
  if not r0_7.ActionResourceId or r0_7.ActionResourceId == 0 then
    ScreenPrint("获得当前动作的可容纳人数仍然失败，没找到对应的Resource self.ActionResourceId=" .. tostring(r0_7.ActionResourceId))
    return 1
  end
  if DataMgr.Resource[r0_7.ActionResourceId] and DataMgr.Resource[r0_7.ActionResourceId].InteractPlayerNum then
    r0_7.MaxPlayerNum = DataMgr.Resource[r0_7.ActionResourceId].InteractPlayerNum
  else
    if not DataMgr.Resource[r0_7.ActionResourceId] then
      ScreenPrint("获得当前动作的可容纳人数仍然失败，没找到对应的Resource self.ActionResourceId=" .. tostring(r0_7.ActionResourceId))
      return 1
    end
    DebugPrintTable(DataMgr.Resource[r0_7.ActionResourceId])
    ScreenPrint("！！！！请检查资源表的InteractPlayerNum获得当前动作的可容纳人数失败，没找到对应的InteractPlayer self.ActionResourceId=" .. tostring(r0_7.ActionResourceId))
    r0_7.MaxPlayerNum = 1
  end
  DebugPrint("联机动作获取人数 GetMaxPlayerNum: MaxPlayerNum=" .. tostring(r0_7.MaxPlayerNum))
  return r0_7.MaxPlayerNum and 1
end
function r1_0.HaveOtherInvitation(r0_8)
  -- line: [224, 229] id: 8
  if not r0_8.InvitationInfos or next(r0_8.InvitationInfos) == nil then
    return false
  end
  return true
end
function r1_0.HaveOtherApply(r0_9)
  -- line: [232, 237] id: 9
  if not r0_9.ApplyInfos or next(r0_9.ApplyInfos) == nil then
    return false
  end
  return true
end
function r1_0.GetNearbyPlayerInfos(r0_10)
  -- line: [239, 241] id: 10
  return r0_10.NearbyPlayerInfos
end
function r1_0.GetApplyInfos(r0_11)
  -- line: [243, 245] id: 11
  return r0_11.ApplyInfos
end
function r1_0.GetInvitationInfos(r0_12)
  -- line: [247, 249] id: 12
  return r0_12.InvitationInfos
end
function r1_0.RemoveInvitationInfo(r0_13, r1_13)
  -- line: [251, 262] id: 13
  for r6_13, r7_13 in pairs(r0_13.InvitationInfos and {}) do
    if r7_13 == r1_13 then
      table.remove(r0_13.InvitationInfos, r6_13)
      DebugPrint("RemoveInvitationInfo: Removed invitation for Uid: " .. (r1_13.Uid and ""))
      r0_13:CheckIsNeedHideBtn()
      return 
    end
  end
  -- close: r2_13
  DebugPrint("RemoveInvitationInfo: Info not found in invitations: " .. (r1_13.Uid and ""))
end
function r1_0.CheckIsNeedHideBtn(r0_14)
  -- line: [264, 280] id: 14
  local r1_14 = r0_14:GetController()
  if r1_14 and r1_14.OpenReason ~= 1 then
    local r2_14 = r0_14.InvitationInfos and next(r0_14.InvitationInfos) ~= nil
    local r3_14 = r0_14.ApplyInfos and next(r0_14.ApplyInfos) ~= nil
    if not r2_14 and not r3_14 then
      r1_14:HideBtn()
    end
  end
  if r1_14 and r1_14.OpenReason == 2 then
    local r2_14 = r0_14.InvitationInfos
    if not r2_14 or next(r2_14) == nil then
      r1_14:HideBtn()
    end
  end
end
function r1_0.RemoveApplyInfo(r0_15, r1_15)
  -- line: [282, 293] id: 15
  for r6_15, r7_15 in pairs(r0_15.ApplyInfos) do
    if r7_15 == r1_15 then
      table.remove(r0_15.ApplyInfos, r6_15)
      DebugPrint("RemoveApplyInfo: Removed apply for Uid: " .. r1_15.Uid)
      r0_15:CheckIsNeedHideBtn()
      return 
    end
  end
  -- close: r2_15
  DebugPrint("RemoveApplyInfo: Info not found in applys: " .. r1_15.Uid)
end
function r1_0.SetAllInfoRead(r0_16)
  -- line: [295, 303] id: 16
  for r5_16, r6_16 in pairs(r0_16.InvitationInfos) do
    r6_16.bNew = false
  end
  -- close: r1_16
  for r5_16, r6_16 in pairs(r0_16.ApplyInfos) do
    r6_16.bNew = false
  end
  -- close: r1_16
  ReddotManager.ClearLeafNodeCount("OnlineActionBtn")
end
function r1_0.ChangeAction(r0_17, r1_17)
  -- line: [306, 325] id: 17
  if r1_17 then
    r0_17.ActionUniqueId = r1_17
  else
    r0_17.MaxPlayerNum = 1
  end
end
function r1_0.FindPlayerAround(r0_18)
  -- line: [327, 396] id: 18
  r0_18._Avatar = GWorld:GetAvatar()
  if r0_18._Avatar.CurrentOnlineType == -1 then
    return 
  end
  r0_18.NearbyPlayerInfos = {}
  local r1_18 = UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if not r1_18 then
    ScreenPrint("FindPlayerAround: MainPlayer is nil")
    return 
  end
  local r2_18 = r1_18:K2_GetActorLocation()
  local r3_18 = UE4.UKismetMathLibrary.Vector_Distance
  local r4_18 = r0_18._Avatar.CurrentRegionId
  for r9_18, r10_18 in pairs(r0_18._Avatar.RegionAvatars) do
    DebugPrint("FindPlayerAround: Checking player with ObjId: " .. tostring(r9_18))
    local r11_18 = r0_18._Avatar:GetBornedChar(r9_18)
    if r11_18 and r10_18.AvatarInfo.CurrentRegionId == r0_18._Avatar.CurrentRegionId then
      DebugPrint("FindPlayerAround: OtherPlayer found for ObjId: " .. tostring(r9_18))
      local r12_18 = r11_18:K2_GetActorLocation()
      DebugPrint("FindPlayerAround: OtherPlayerLocation for ObjId " .. tostring(r9_18) .. ": " .. tostring(r12_18))
      local r13_18 = r3_18(r2_18, r12_18)
      DebugPrint("FindPlayerAround: Distance to ObjId " .. tostring(r9_18) .. ": " .. tostring(r13_18))
      if r13_18 < r0_0.NearbtPlayDistance then
        DebugPrint("FindPlayerAround: Player with ObjId " .. tostring(r10_18.AvatarInfo.Nickname) .. " is nearby")
        if not r11_18:CharacterInTag("Seating") then
          DebugPrint("FindPlayerAround: Player with ObjId " .. tostring(r10_18.AvatarInfo.Nickname) .. " is not in the same region")
          local r14_18 = table.insert
          local r15_18 = r0_18.NearbyPlayerInfos
          local r16_18 = {
            Uid = r10_18.AvatarInfo.Uid,
            NickName = r10_18.AvatarInfo.Nickname,
            Eid = r9_18,
            Actor = r11_18,
            Level = r10_18.AvatarInfo.Level and 1,
            TitleBefore = r10_18.AvatarInfo.TitleBefore,
            TitleAfter = r10_18.AvatarInfo.TitleAfter,
            TitleFrame = r10_18.AvatarInfo.TitleFrame and 10001,
            HeadIconId = r10_18.AvatarInfo.HeadIconId,
            HeadFrameId = r10_18.AvatarInfo.HeadFrameId,
          }
          r14_18(r15_18, r16_18)
          if r0_0.MaxNearbyPlayers <= #r0_18.NearbyPlayerInfos then
            DebugPrint("FindPlayerAround: MaxNearbyPlayers reached 达到最大玩家人数，不再搜索")
            break
          end
        end
      else
        DebugPrint("FindPlayerAround: Player with ObjId " .. tostring(r9_18) .. " is too far")
      end
    else
      DebugPrint("FindPlayerAround: OtherPlayer is nil for ObjId: " .. tostring(r9_18))
    end
  end
  -- close: r5_18
  DebugPrint("FindPlayerAround: Found " .. tostring(#r0_18.NearbyPlayerInfos) .. " nearby players")
end
function r1_0.CheckNearbyInfoVaild(r0_19, r1_19)
  -- line: [398, 426] id: 19
  local r2_19 = r1_19.Eid
  local r3_19 = r0_19._Avatar:GetBornedChar(r2_19)
  if not r3_19 then
    ScreenPrint("CheckNearbyInfoVaild: 玩家" .. CommonUtils.ObjId2Str(r2_19) .. "不存在")
    return -1
  end
  local r4_19 = UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if not r4_19 then
    DebugPrint("CheckNearbyInfoVaild: MainPlayer is nil")
    return -1
  end
  if r0_0.NearbtPlayDistance <= UE4.UKismetMathLibrary.Vector_Distance(r4_19:K2_GetActorLocation(), r3_19:K2_GetActorLocation()) then
    return -1
  end
  if r3_19:CharacterInTag("Seating") then
    return -2
  end
  return true
end
function r1_0.AddInvitationInfo(r0_20, r1_20, r2_20, r3_20)
  -- line: [428, 453] id: 20
  r0_20._Avatar = GWorld:GetAvatar()
  local r4_20 = r0_20._Avatar.RegionAvatars[r1_20]
  if not r4_20 then
    return 
  end
  local r5_20 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  local r6_20 = {
    Uid = r4_20.AvatarInfo.Uid,
    NickName = r4_20.AvatarInfo.Nickname,
    Actor = r0_20._Avatar:GetBornedChar(r4_20.AvatarInfo.ObjId),
    Eid = r1_20,
    UniqueId = r2_20,
    Level = r4_20.AvatarInfo.Level and 1,
    InteractiveId = r3_20,
    HeadIconId = r4_20.AvatarInfo.HeadIconId,
    HeadFrameId = r4_20.AvatarInfo.HeadFrameId,
    TitleBefore = r4_20.AvatarInfo.TitleBefore,
    TitleAfter = r4_20.AvatarInfo.TitleAfter,
  }
  local r7_20 = r4_20.AvatarInfo.TitleFrame
  r6_20.TitleFrame = r7_20
  r6_20.bNew = true
  if r5_20 then
    r7_20 = r5_20.ReplicatedRealTimeSeconds and 0
  else
    goto label_60	-- block#6 is visited secondly
  end
  r6_20.RecivedTime = r7_20
  r6_20.RemainTime = r0_0.AutoRejectTime
  table.insert(r0_20.InvitationInfos, r6_20)
  return r6_20
end
function r1_0.AddApplyInfo(r0_21, r1_21, r2_21, r3_21)
  -- line: [455, 483] id: 21
  r0_21._Avatar = GWorld:GetAvatar()
  local r4_21 = r0_21._Avatar.RegionAvatars[r1_21]
  if not r4_21 then
    ScreenPrint("OnlineAction 收到了申请，但是玩家" .. CommonUtils.ObjId2Str(r1_21) .. "不存在")
    return 
  end
  local r5_21 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  local r6_21 = {
    Uid = r4_21.AvatarInfo.Uid,
    NickName = r4_21.AvatarInfo.Nickname,
    Actor = r0_21._Avatar:GetBornedChar(r4_21.AvatarInfo.ObjId),
    Eid = r1_21,
    Level = r4_21.AvatarInfo.Level and 1,
    UniqueId = r2_21,
    InteractiveId = r3_21,
    HeadIconId = r4_21.AvatarInfo.HeadIconId,
    HeadFrameId = r4_21.AvatarInfo.HeadFrameId,
    TitleBefore = r4_21.AvatarInfo.TitleBefore,
    TitleAfter = r4_21.AvatarInfo.TitleAfter,
  }
  local r7_21 = r4_21.AvatarInfo.TitleFrame
  r6_21.TitleFrame = r7_21
  r6_21.bNew = true
  if r5_21 then
    r7_21 = r5_21.ReplicatedRealTimeSeconds and 0
  else
    goto label_69	-- block#6 is visited secondly
  end
  r6_21.RecivedTime = r7_21
  r6_21.RemainTime = r0_0.AutoRejectTime
  table.insert(r0_21.ApplyInfos, r6_21)
  return r6_21
end
function r1_0.NotifyTick(r0_22, r1_22)
  -- line: [485, 527] id: 22
  local r2_22 = r0_22:GetController()
  local r3_22 = false
  if not r0_22.UGameplayStatics then
    r0_22.UGameplayStatics = UE4.UGameplayStatics
  end
  if not r0_22.GameInstance then
    r0_22.GameInstance = GWorld.GameInstance
  end
  local r4_22 = r0_22.UGameplayStatics
  if r4_22 then
    r4_22 = r0_22.UGameplayStatics.GetRealTimeSeconds(r0_22.GameInstance) and 0
  else
    goto label_24	-- block#6 is visited secondly
  end
  if not r0_22.ActionUniqueId then
    return 
  end
  for r8_22 = #r0_22.InvitationInfos, 1, -1 do
    local r9_22 = r0_22.InvitationInfos[r8_22]
    r9_22.RemainTime = r0_0.AutoRejectTime - r4_22 - (r9_22.RecivedTime and r4_22)
    if r9_22.RemainTime <= 0 then
      r2_22:SendRejectInvitation(r9_22)
      r0_22:RemoveInvitationInfo(r9_22)
      r3_22 = true
    end
  end
  for r8_22 = #r0_22.ApplyInfos, 1, -1 do
    local r9_22 = r0_22.ApplyInfos[r8_22]
    r9_22.RemainTime = r0_0.AutoRejectTime - r4_22 - (r9_22.RecivedTime and r4_22)
    if r9_22.RemainTime <= 0 then
      r2_22:SendRejectApplication(r9_22)
      r0_22:RemoveApplyInfo(r9_22)
      r3_22 = true
    end
  end
  if r3_22 then
    r0_22:CheckbHasAnyNewInfo()
  end
end
function r1_0.ClearAllApply(r0_23)
  -- line: [530, 532] id: 23
  r0_23.ApplyInfos = {}
end
function r1_0.CheckbHasAnyNewInfo(r0_24)
  -- line: [534, 547] id: 24
  for r5_24, r6_24 in pairs(r0_24.InvitationInfos) do
    if r6_24.bNew then
      return true
    end
  end
  -- close: r1_24
  for r5_24, r6_24 in pairs(r0_24.ApplyInfos) do
    if r6_24.bNew then
      return true
    end
  end
  -- close: r1_24
  return false
end
function r1_0.GetPlayerName(r0_25, r1_25)
  -- line: [549, 558] id: 25
  local r2_25 = r0_25._Avatar.RegionAvatars[r1_25]
  if r2_25 then
    return r2_25.AvatarInfo.Nickname
  else
    ScreenPrint("OnlineAction 收到了申请，但是玩家" .. tostring(r1_25) .. "不存在")
  end
  return ""
end
function r1_0.GetPlayerActor(r0_26, r1_26)
  -- line: [561, 571] id: 26
  if not r0_26._Avatar.RegionAvatars[r1_26] then
    return false
  end
  local r3_26 = r0_26._Avatar:GetBornedChar(r1_26)
  if not r3_26 then
    return false
  end
  return r3_26
end
function r1_0.GetPlayerName(r0_27, r1_27)
  -- line: [685, 691] id: 27
  local r2_27 = r0_27._Avatar.RegionAvatars[r1_27]
  if r2_27 then
    return r2_27.AvatarInfo.Nickname
  end
  return ""
end
function r1_0.IsInRegionOnline(r0_28)
  -- line: [693, 695] id: 28
  return r0_28._Avatar and r0_28._Avatar.IsInRegionOnline
end
function r1_0.GetController(r0_29)
  -- line: [697, 704] id: 29
  if r0_29.Controller then
    return r0_29.Controller
  else
    r0_29.Controller = require("BluePrints.UI.WBP.BattleOnlineAction.OnlineActionController")
  end
  return r0_29.Controller
end
function r1_0.Destory(r0_30)
  -- line: [706, 715] id: 30
  DebugPrint("OnlineActionModel Destory")
  r0_30.NearbyPlayerInfos = nil
  r0_30.ApplyInfos = nil
  r0_30.InvitationInfos = nil
  r0_30.Controller = nil
  r0_30.UGameplayStatics = nil
  r0_30.GameInstance = nil
  r1_0.Super.Destory(r0_30)
end
function r1_0.SortByRemainTime(r0_31, r1_31, r2_31)
  -- line: [717, 753] id: 31
  local r3_31 = nil
  if r1_31 == 1 then
    r3_31 = r0_31.ApplyInfos
  elseif r1_31 == 3 then
    r3_31 = r0_31.InvitationInfos
  else
    return 
  end
  if not r3_31 or next(r3_31) == nil then
    return 
  end
  local r4_31 = r2_31 ~= false
  table.sort(r3_31, function(r0_32, r1_32)
    -- line: [729, 752] id: 32
    local r2_32 = nil	-- notice: implicit variable refs by block#[6, 8, 12]
    if r0_32 then
      r2_32 = r0_32.RemainTime
      if not r2_32 then
        ::label_5::
        r2_32 = 0
      end
    else
      goto label_5	-- block#2 is visited secondly
    end
    local r3_32 = nil	-- notice: implicit variable refs by block#[6, 8, 12]
    if r1_32 then
      r3_32 = r1_32.RemainTime
      if not r3_32 then
        ::label_11::
        r3_32 = 0
      end
    else
      goto label_11	-- block#5 is visited secondly
    end
    local r4_32 = nil	-- notice: implicit variable refs by block#[22, 24, 28]
    if r2_32 ~= r3_32 then
      r4_32 = r4_31
      if r4_32 then
        r4_32 = r3_32 < r2_32
        return r4_32
      else
        r4_32 = r2_32 < r3_32
        return r4_32
      end
    end
    if r0_32 then
      r4_32 = r0_32.RecivedTime
      if not r4_32 then
        ::label_33::
        r4_32 = 0
      end
    else
      goto label_33	-- block#18 is visited secondly
    end
    local r5_32 = nil	-- notice: implicit variable refs by block#[22, 24, 28]
    if r1_32 then
      r5_32 = r1_32.RecivedTime
      if not r5_32 then
        ::label_39::
        r5_32 = 0
      end
    else
      goto label_39	-- block#21 is visited secondly
    end
    if r4_32 ~= r5_32 then
      if r4_31 then
        return r4_32 < r5_32
      else
        return r5_32 < r4_32
      end
    end
    return false
  end)
end
function r1_0.GetMechanism(r0_33)
  -- line: [755, 763] id: 33
  local r2_33 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance).RegionOnlineMechanismMap:Find(r0_33.ActionUniqueId)
  if not r2_33 then
    DebugPrint("寻找机关失败，机关不存在  " .. r0_33.ActionUniqueId)
    return false
  end
  return r2_33
end
function r1_0.GetSeatVaildInfo(r0_34)
  -- line: [765, 773] id: 34
  local r1_34 = r0_34:GetMechanism()
  if not r1_34 then
    return false
  end
  local r2_34 = r1_34:GetValidPoint()
  DebugPrintTable(r2_34)
  return r2_34
end
function r1_0.IfHaveSeatValid(r0_35)
  -- line: [775, 786] id: 35
  local r1_35 = r0_35:GetSeatVaildInfo()
  if not r1_35 then
    return false
  end
  for r6_35, r7_35 in pairs(r1_35) do
    if r7_35 and r6_35 + 1 <= r0_35.MaxPlayerNum then
      return true
    end
  end
  -- close: r2_35
  return false
end
function r1_0.GetMechanismByUniqueId(r0_36, r1_36)
  -- line: [789, 794] id: 36
  if not r1_36 then
    return false
  end
  local r2_36 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  if not r2_36 then
    return false
  end
  return r2_36.RegionOnlineMechanismMap:Find(r1_36)
end
function r1_0.IsSeatValid(r0_37, r1_37, r2_37)
  -- line: [796, 800] id: 37
  if not r1_37 then
    return false
  end
  if r2_37 == nil then
    return false
  end
  return r1_37:CheckInteractiveIdValid(r2_37)
end
function r1_0.CheckJoinValid(r0_38, r1_38, r2_38, r3_38)
  -- line: [804, 842] id: 38
  local r4_38 = r0_38:GetPlayerActor(r1_38)
  if not r4_38 then
    return -1
  end
  if r4_38:CharacterInTag("Seating") then
    return -3
  end
  local r5_38 = r0_38:GetMechanismByUniqueId(r2_38)
  if not r5_38 then
    return -2
  end
  if r0_0.NearbtPlayDistance < UE4.UKismetMathLibrary.Vector_Distance(r4_38:K2_GetActorLocation(), r5_38:K2_GetActorLocation()) then
    return -2
  end
  if r3_38 ~= nil and not r0_38:IsSeatValid(r5_38, r3_38) then
    return -4
  elseif not r0_38:IfHaveSeatValid() then
    return -4
  end
  return 0
end
return r1_0
