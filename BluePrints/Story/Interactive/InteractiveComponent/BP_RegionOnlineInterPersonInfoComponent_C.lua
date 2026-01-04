-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Story\Interactive\InteractiveComponent\BP_RegionOnlineInterPersonInfoComponent_C.lua
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
    [3] = "PersonInfo",
  }
end
function r1_0.SetInteractiveName(r0_3, r1_3)
  -- line: [33, 35] id: 3
  r0_3.DisplayInteractiveName = "添加好友"
end
function r1_0.DisplayInteractiveBtn(r0_4, r1_4)
  -- line: [38, 52] id: 4
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
end
function r1_0.RefreshInteractiveBtn(r0_5, r1_5)
  -- line: [54, 62] id: 5
  local r2_5, r3_5 = r0_5:UpdateLockState()
  if not r3_5 and not r2_5 then
    r2_5 = r0_5:UpdateForbiddenState(r1_5)
  end
  if r2_5 then
    r0_5:UpdateInteractiveUIState()
  end
end
function r1_0.BtnClicked(r0_6, r1_6, r2_6)
  -- line: [64, 74] id: 6
  local r3_6 = GWorld:GetAvatar()
  if r3_6 then
    local r5_6 = (r3_6.RegionAvatars and {})[r0_6.CharObjId]
    local r6_6 = r5_6 and r5_6.AvatarInfo
    if r6_6 and r6_6.Uid then
      TeamController:GetAvatar():CheckOtherPlayerPersonallInfo(r6_6.Uid)
    end
  end
end
function r1_0.IsCanInteractive(r0_7, r1_7)
  -- line: [76, 83] id: 7
  return true
end
function r1_0.NotDisplayInteractiveBtn(r0_8, r1_8)
  -- line: [85, 94] id: 8
  r0_8.CanOpen = false
  r0_8:SetBtnDisplayed(r1_8, false)
  local r3_8 = UGameplayStatics.GetGameInstance(r0_8):GetGameUIManager():GetUIObj(UIConst.InteractiveUIName)
  if not r3_8 then
    return 
  end
  r3_8:RemoveInteractiveItem(r0_8)
end
function r1_0.CheckCanEnterOrEixt(r0_9)
  -- line: [97, 109] id: 9
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
  -- line: [112, 114] id: 10
  return "Texture2D\'/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_CheckPersonalInfo.T_Interactive_CheckPersonalInfo\'"
end
function r1_0.GetInteractiveName(r0_11)
  -- line: [116, 118] id: 11
  return GText("UI_Chat_ShowRecord")
end
function r1_0.InitCommonUIConfirmID(r0_12, r1_12)
  -- line: [120, 130] id: 12
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
