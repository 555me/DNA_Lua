-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Story\Interactive\InteractiveComponent\BP_RegionOnlineInterAddFriendComponent_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
require("DataMgr")
local r0_0 = require("EMCache.EMCache")
local r1_0 = Class("BluePrints.Story.Interactive.InteractiveComponent.BP_InteractiveBaseComponent_C")
function r1_0.ReceiveBeginPlay(r0_1)
  -- line: [18, 21] id: 1
  r0_1.Priority = "Normal"
end
function r1_0.InitRegionInfo(r0_2, r1_2, r2_2)
  -- line: [23, 31] id: 2
  r0_2.CharEid = r1_2
  r0_2.CharObjId = r2_2
  r0_2.Content = {
    [1] = r1_2,
    [2] = r2_2,
    [3] = "AddFriend",
  }
end
function r1_0.SetInteractiveName(r0_3, r1_3)
  -- line: [33, 35] id: 3
  r0_3.DisplayInteractiveName = "添加好友"
end
function r1_0.DisplayInteractiveBtn(r0_4, r1_4)
  -- line: [38, 54] id: 4
  if not r0_4.CanOpen then
    return 
  end
  local r3_4 = UGameplayStatics.GetGameInstance(r0_4):GetGameUIManager():LoadUINew(UIConst.InteractiveUIName)
  if not r3_4 then
    return 
  end
  print(_G.LogTag, "DisplayInteractiveBtn")
  r3_4:AddInteractiveItem(r0_4)
  r0_4:SetBtnDisplayed(r1_4, true)
  r0_4:RefreshInteractiveBtn(r1_4)
  r0_4.IsDisplayed = true
  DebugPrint("JLY BP_RegionOnlineInterAddFriendComponent_C:DisplayInteractiveBtn")
end
function r1_0.RefreshInteractiveBtn(r0_5, r1_5)
  -- line: [56, 64] id: 5
  local r2_5, r3_5 = r0_5:UpdateLockState()
  if not r3_5 and not r2_5 then
    r2_5 = r0_5:UpdateForbiddenState(r1_5)
  end
  if r2_5 then
    r0_5:UpdateInteractiveUIState()
  end
end
function r1_0.BtnClicked(r0_6, r1_6, r2_6)
  -- line: [66, 76] id: 6
  local r3_6 = GWorld:GetAvatar()
  if r3_6 then
    local r5_6 = (r3_6.RegionAvatars and {})[r0_6.CharObjId]
    FriendController:OpenAddFriendDialog(UGameplayStatics.GetGameInstance(r0_6):GetGameUIManager():LoadUINew(UIConst.InteractiveUIName), r5_6 and r5_6.AvatarInfo)
  end
end
function r1_0.IsCanInteractive(r0_7, r1_7)
  -- line: [78, 85] id: 7
  return true
end
function r1_0.NotDisplayInteractiveBtn(r0_8, r1_8)
  -- line: [87, 98] id: 8
  r0_8.CanOpen = false
  r0_8:SetBtnDisplayed(r1_8, false)
  local r3_8 = UGameplayStatics.GetGameInstance(r0_8):GetGameUIManager():GetUIObj(UIConst.InteractiveUIName)
  if not r3_8 then
    DebugPrint("JLY BP_RegionOnlineInterAddFriendComponent_C:Not InteractiveUI")
    return 
  end
  r3_8:RemoveInteractiveItem(r0_8)
  DebugPrint("JLY BP_RegionOnlineInterAddFriendComponent_C:RemoveInteractiveItem")
end
function r1_0.CheckCanEnterOrEixt(r0_9)
  -- line: [101, 113] id: 9
  if not r0_9:GetOwner().UnitId then
    return false
  end
  if not DataMgr.Mechanism[r0_9:GetOwner().UnitId] and not r0_9:GetOwner():IsMonster() then
    return false
  end
  if not r0_9:GetOwner().MontageName and not r0_9.MontageName then
    return false
  end
  return true
end
function r1_0.GetInteractiveIcon(r0_10, r1_10)
  -- line: [116, 118] id: 10
  return "Texture2D\'/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_AddFriend.T_Interactive_AddFriend\'"
end
function r1_0.GetInteractiveName(r0_11)
  -- line: [120, 122] id: 11
  return GText("UI_Friend_AddFriend")
end
function r1_0.InitCommonUIConfirmID(r0_12, r1_12)
  -- line: [124, 134] id: 12
  r0_12.CommonUIConfirmID = r1_12
  local r2_12 = DataMgr.CommonUIConfirm[r1_12]
  if not r2_12 then
    return 
  end
  r0_12.InteractiveDistance = r2_12.InteractiveRadius and r0_12.InteractiveDistance
  r0_12.InteractiveAngle = r2_12.InteractiveAngle and r0_12.InteractiveAngle
  r0_12.InteractiveFaceAngle = r2_12.PlayerFaceAngle and r0_12.InteractiveFaceAngle
  r0_12.ListPriority = r2_12.InteractivePriority and 0
end
return r1_0
