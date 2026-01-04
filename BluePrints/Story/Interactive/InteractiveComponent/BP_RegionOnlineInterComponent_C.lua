-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Story\Interactive\InteractiveComponent\BP_RegionOnlineInterComponent_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
require("DataMgr")
local r0_0 = require("EMCache.EMCache")
local r1_0 = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.Story.Interactive.InteractiveComponent.BP_InteractiveBaseComponent_C"
})
function r1_0.ReceiveBeginPlay(r0_1)
  -- line: [20, 23] id: 1
  r0_1.Priority = "Normal"
end
function r1_0.InitRegionInfo(r0_2, r1_2, r2_2)
  -- line: [25, 28] id: 2
  r0_2.CharEid = r1_2
  r0_2.CharObjId = r2_2
end
function r1_0.SetInteractiveName(r0_3, r1_3)
  -- line: [30, 36] id: 3
  r0_3.InteractiveName = r1_3
  r0_3.DisplayInteractiveName = GText(r1_3)
  if r0_3.DisplayInteractiveName == "" then
    r0_3.DisplayInteractiveName = r1_3
  end
end
function r1_0.DisplayInteractiveBtn(r0_4, r1_4)
  -- line: [39, 59] id: 4
  local r3_4 = UGameplayStatics.GetGameInstance(r0_4):GetGameUIManager():LoadUINew(UIConst.InteractiveUIName)
  if not r3_4 then
    return 
  end
  print(_G.LogTag, "DisplayInteractiveBtn")
  r3_4:AddInteractiveItem(r0_4)
  r0_4:SetBtnDisplayed(r1_4, true)
  r0_4:RefreshInteractiveBtn(r1_4)
  local r4_4 = r0_4:GetOwner()
  if r4_4.RegionInterAddFriendComp then
    r4_4.RegionInterAddFriendComp.CanOpen = true
  end
  if r4_4.RegionInterInviteTeamComp then
    r4_4.RegionInterInviteTeamComp.CanOpen = true
  end
  if r4_4.RegionInterPersonInfoComp then
    r4_4.RegionInterPersonInfoComp.CanOpen = true
  end
end
function r1_0.RefreshInteractiveBtn(r0_5, r1_5)
  -- line: [61, 69] id: 5
  local r2_5, r3_5 = r0_5:UpdateLockState()
  if not r3_5 and not r2_5 then
    r2_5 = r0_5:UpdateForbiddenState(r1_5)
  end
  if r2_5 then
    r0_5:UpdateInteractiveUIState()
  end
end
function r1_0.CheckAndDisplayAddFriendBtn(r0_6, r1_6, r2_6)
  -- line: [71, 86] id: 6
  local r3_6 = GWorld:GetAvatar()
  if r3_6 then
    local r5_6 = (r3_6.RegionAvatars and {})[r0_6.CharObjId]
    local r6_6 = r5_6 and r5_6.AvatarInfo
    if r6_6 and not require("BluePrints.UI.WBP.Friend.FriendModel"):GetFriendDict()[r6_6.Uid] then
      r2_6:DisplayInteractiveBtn(r1_6)
      return 
    end
  end
end
function r1_0.BtnClicked(r0_7, r1_7, r2_7)
  -- line: [88, 102] id: 7
  r0_7:NotDisplayInteractiveBtnSelf(r1_7)
  local r3_7 = r0_7:GetOwner()
  r0_7:AddTimer(0.1, function()
    -- line: [91, 101] id: 8
    if r3_7.RegionInterAddFriendComp then
      r0_7:CheckAndDisplayAddFriendBtn(r1_7, r3_7.RegionInterAddFriendComp)
    end
    if r3_7.RegionInterInviteTeamComp then
      r3_7.RegionInterInviteTeamComp:DisplayInteractiveBtn(r1_7)
    end
    if r3_7.RegionInterPersonInfoComp then
      r3_7.RegionInterPersonInfoComp:DisplayInteractiveBtn(r1_7)
    end
  end)
end
function r1_0.NotDisplayInteractiveBtn(r0_9, r1_9)
  -- line: [104, 116] id: 9
  r0_9:NotDisplayInteractiveBtnSelf(r1_9)
  local r2_9 = r0_9:GetOwner()
  if r2_9.RegionInterAddFriendComp then
    r2_9.RegionInterAddFriendComp:NotDisplayInteractiveBtn(r1_9)
  end
  if r2_9.RegionInterInviteTeamComp then
    r2_9.RegionInterInviteTeamComp:NotDisplayInteractiveBtn(r1_9)
  end
  if r2_9.RegionInterPersonInfoComp then
    r2_9.RegionInterPersonInfoComp:NotDisplayInteractiveBtn(r1_9)
  end
end
function r1_0.NotDisplayInteractiveBtnSelf(r0_10, r1_10)
  -- line: [118, 126] id: 10
  r0_10:SetBtnDisplayed(r1_10, false)
  local r3_10 = UGameplayStatics.GetGameInstance(r0_10):GetGameUIManager():GetUIObj(UIConst.InteractiveUIName)
  if not r3_10 then
    return 
  end
  r3_10:RemoveInteractiveItem(r0_10)
end
function r1_0.CheckCanEnterOrEixt(r0_11)
  -- line: [128, 140] id: 11
  if not r0_11:GetOwner().UnitId then
    return false
  end
  if not DataMgr.Mechanism[r0_11:GetOwner().UnitId] and not r0_11:GetOwner():IsMonster() then
    return false
  end
  if not r0_11:GetOwner().MontageName and not r0_11.MontageName then
    return false
  end
  return true
end
function r1_0.GetInteractiveIcon(r0_12, r1_12)
  -- line: [143, 157] id: 12
  if r0_12:IsLocked() then
    return "Texture2D\'/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Lock.T_Interactive_Lock\'"
  end
  if r0_12:IsForbidden(r1_12) then
    return "Texture2D\'/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Forbidden.T_Interactive_Forbidden\'"
  end
  local r2_12 = DataMgr.CommonUIConfirm[r0_12.CommonUIConfirmID]
  if not r2_12 or not r2_12.Icon then
    return nil
  end
  return r2_12.Icon
end
function r1_0.GetInteractiveName(r0_13)
  -- line: [160, 172] id: 13
  local r1_13 = GWorld:GetAvatar()
  local r2_13 = ""
  if not r0_13.CharObjId then
    return GText(r2_13)
  end
  local r3_13 = GWorld:GetAvatar()
  if r3_13 then
    local r5_13 = (r3_13.RegionAvatars and {})[r0_13.CharObjId]
    r2_13 = r5_13 and r5_13.AvatarInfo.Nickname
  end
  return GText(r2_13)
end
function r1_0.InitCommonUIConfirmID(r0_14, r1_14)
  -- line: [178, 188] id: 14
  r0_14.CommonUIConfirmID = r1_14
  local r2_14 = DataMgr.CommonUIConfirm[r1_14]
  if not r2_14 then
    return 
  end
  r0_14.InteractiveDistance = r2_14.InteractiveRadius and r0_14.InteractiveDistance
  r0_14.InteractiveAngle = r2_14.InteractiveAngle and r0_14.InteractiveAngle
  r0_14.InteractiveFaceAngle = r2_14.PlayerFaceAngle and r0_14.InteractiveFaceAngle
  r0_14.ListPriority = r2_14.InteractivePriority and 0
end
return r1_0
