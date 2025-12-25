-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Item\Chest\BP_ChestInteractiveComponent_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.Story.Interactive.InteractiveComponent.BP_InteractiveBaseComponent_C",
  "BluePrints.Common.TimerMgr"
})
local r1_0 = require("BluePrints.Story.Interactive.InteractiveComponent.BP_InteractiveBaseComponent_C")
function r0_0.TriggerEnter(r0_1, r1_1)
  -- line: [19, 22] id: 1
  r0_1.Overridden.TriggerEnter(r0_1, r1_1)
  r0_1.OnInteractiveTriggerEnter:Broadcast(r1_1)
end
function r0_0.TriggerTick(r0_2, r1_2)
  -- line: [23, 27] id: 2
  r0_2.Overridden.TriggerTick(r0_2, r1_2)
  r0_2.OnInteractiveTriggerTick:Broadcast(r1_2)
end
function r0_0.TriggerExit(r0_3, r1_3)
  -- line: [28, 31] id: 3
  r0_3.Overridden.TriggerExit(r0_3, r1_3)
  r0_3.OnInteractiveTriggerExit:Broadcast(r1_3)
end
function r0_0.NotDisplayInteractiveBtn(r0_4, r1_4)
  -- line: [32, 37] id: 4
  r1_0.NotDisplayInteractiveBtn(r0_4, r1_4)
  if r1_4 and r1_4:CheckMechanismEid(r0_4:GetOwner().Eid) and not r0_4:IsCanInteractive(r1_4) then
    r0_4:EndPressInteractive(r1_4, false)
  end
end
function r0_0.InitInteractiveComponent(r0_5, r1_5)
  -- line: [40, 58] id: 5
  if r1_5 == nil then
    return 
  end
  r0_5.bHasId = true
  r0_5.bCanUsed = true
  r0_5.bPressed = false
  r0_5:InitCommonUIConfirmID(r1_5)
  print(_G.LogTag, "LXZ InitInteractiveComponent", r1_5, r0_5:GetOwner():GetName())
  r0_5.InteractiveParam = DataMgr.CommonUIConfirm[r1_5]
  r0_5.MontageName = r0_5.InteractiveParam.TriggerInterAnim
  r0_5.AutoRotate = r0_5.InteractiveParam.AutoRotate
  if r0_5.MontageName then
    r0_5.InteractiveTag = r0_5.InteractiveParam.InteractiveTag and "Interactive"
  end
  r0_5.InteractiveName = r0_5:GetInteractiveName()
end
function r0_0.IsForbidden(r0_6, r1_6)
  -- line: [93, 105] id: 6
  if not IsValid(r1_6) then
    return false
  end
  local r2_6 = r0_6:GetOwner()
  if r2_6 and r2_6.IsForbidden and r2_6:IsForbidden(r1_6) then
    return true
  end
  return not r0_6:CheckInteractiveSucc(r1_6.Eid)
end
function r0_0.IsForbidden_CPP(r0_7, r1_7)
  -- line: [107, 112] id: 7
  if not IsValid(r1_7) then
    return false
  end
  return not r0_7:CheckInteractiveSucc(r1_7.Eid)
end
function r0_0.IsCanPlayMontage(r0_8, r1_8)
  -- line: [114, 119] id: 8
  if r0_8.MontageName then
    return not r1_8.WaitCallBack
  end
  return true
end
function r0_0.OnClicked_Forbidden(r0_9)
  -- line: [121, 123] id: 9
  r0_9:InteractiveFailed()
end
function r0_0.CheckInteractiveSucc(r0_10, r1_10)
  -- line: [125, 131] id: 10
  local r2_10 = r0_0.Super.CheckInteractiveSucc(r0_10, r1_10)
  local r4_10 = r0_10:CheckPlayerTag(Battle(r0_10):GetEntity(r1_10))
  return r2_10 and r4_10
end
function r0_0.CheckPlayerTag(r0_11, r1_11)
  -- line: [133, 140] id: 11
  local r2_11 = r0_0.Super.CheckPlayerTag(r0_11, r1_11)
  if r0_11.InteractiveParam.IfSkipAnim then
    local r3_11 = r0_11:GetOwner()
    if r2_11 then
      r2_11 = r1_11:CanEnterInteractive()
      if r2_11 then
        if r3_11.AutoSyncProp ~= nil then
          r2_11 = r3_11.AutoSyncProp.CharacterTag == "Defeated"
        else
          goto label_24	-- block#5 is visited secondly
        end
      end
    end
  end
  return r2_11
end
function r0_0.StartInteractive(r0_12, r1_12)
  -- line: [142, 162] id: 12
  if not r0_12.bEnter then
    return 
  end
  r0_12.CanEnd = true
  print(_G.LogTag, "LXZ StartInteractive", r0_12:IsCanInteractive(r1_12), r0_12:IsCanPlayMontage(r1_12), not r0_12:IsForbidden(r1_12))
  if r0_12:IsCanInteractive(r1_12) and r0_12:IsCanPlayMontage(r1_12) and not r0_12:IsForbidden(r1_12) and not r0_12:IsLocked() then
    local r2_12 = GWorld:GetAvatar()
    local r3_12 = r0_12:GetOwner()
    if r3_12.NeedCallBackInteractive and r2_12 and r2_12.IsInRegionOnline then
      r3_12:SendServerStartInteractive(r1_12.Eid)
    else
      r1_12:InteractiveMechanism(r3_12.Eid, r1_12.Eid, r0_12.NextStateId, r0_12.CommonUIConfirmID, true)
      if r3_12.InteractiveType == Const.PressInteractive then
        r0_12.bPressed = true
      end
    end
  end
end
function r0_0.BtnPressed(r0_13, r1_13)
  -- line: [164, 166] id: 13
  r0_13:StartInteractive(r1_13)
end
function r0_0.BtnReleased(r0_14, r1_14, r2_14)
  -- line: [169, 176] id: 14
  local r3_14 = r0_14:GetOwner()
  if r3_14 and r3_14.InteractiveType == Const.PressInteractive and r0_14.bPressed then
    r0_14:EndPressInteractive(r1_14, false)
  elseif r3_14.InteractiveType == Const.ClickInteractive then
    r0_14:EndInteractive(r1_14)
  end
end
function r0_0.EndInteractive(r0_15, r1_15, r2_15)
  -- line: [178, 190] id: 15
  local r3_15 = r0_15:GetOwner()
  local r4_15 = GWorld:GetAvatar()
  if r3_15 and r3_15.InteractiveType ~= Const.PressInteractive and r1_15:CheckMechanismEid(r0_15:GetOwner().Eid) then
    if r3_15.NeedCallBackInteractive and r4_15 and r4_15.IsInRegionOnline then
      r3_15:SendServerEndInteractive(r1_15.Eid)
    else
      r1_15:DeInteractiveMechanism(r3_15.Eid, r1_15.Eid, r2_15, true, nil, true)
    end
  end
end
function r0_0.BtnClicked(r0_16, r1_16, r2_16)
  -- line: [192, 196] id: 16
  if r0_16:CanPickUpWithOneClick() then
    r0_16:StartInteractive(r1_16)
  end
end
function r0_0.EndPressInteractive(r0_17, r1_17, r2_17, r3_17)
  -- line: [198, 221] id: 17
  local r4_17 = r0_17:GetOwner()
  if r2_17 then
    r0_17.CanEnd = false
  end
  if r4_17 and r4_17.InteractiveType == Const.PressInteractive then
    if r0_17.bPressed then
      if r4_17.SetInteractiveCanUsed then
        r4_17:SetInteractiveCanUsed(false)
      else
        r0_17.bCanUsed = false
      end
    end
    r0_17.bPressed = false
    r1_17:DeInteractiveMechanism(r4_17.Eid, r1_17.Eid, r3_17, r2_17, 0, true)
    r0_17:RemoveTimer(r0_17.Handle)
    r0_17.Handle = nil
  elseif r4_17 and r4_17.InteractiveType == Const.EndByTargetInteractive then
    r1_17:DeInteractiveMechanism(r4_17.Eid, r1_17.Eid, r3_17, r2_17, 0, true)
    r0_17:RemoveTimer(r0_17.Handle)
    r0_17.Handle = nil
  end
end
function r0_0.ForceEndInteractive(r0_18, r1_18, r2_18, r3_18)
  -- line: [224, 231] id: 18
  if r0_18:GetOwner().InteractiveType == Const.ClickInteractive then
    r0_18:EndInteractive(r1_18, r3_18)
  else
    r0_18:EndPressInteractive(r1_18, r2_18, r3_18)
  end
end
function r0_0.DisplayInteractiveBtn(r0_19, r1_19)
  -- line: [233, 241] id: 19
  local r3_19 = UGameplayStatics.GetGameInstance(r0_19):GetGameUIManager():LoadUINew(UIConst.InteractiveUIName)
  if not r3_19 then
    return 
  end
  r3_19:AddInteractiveItem(r0_19)
  r0_19:SetBtnDisplayed(r1_19, true)
end
function r0_0.NotDisplayInteractiveBtn(r0_20, r1_20)
  -- line: [243, 254] id: 20
  if not r1_20 then
    return 
  end
  r0_20:SetBtnDisplayed(r1_20, false)
  local r3_20 = UGameplayStatics.GetGameInstance(r0_20):GetGameUIManager():GetUIObj(UIConst.InteractiveUIName)
  if not r3_20 then
    return 
  end
  r3_20:RemoveInteractiveItem(r0_20)
end
function r0_0.IsLastingInteract(r0_21)
  -- line: [256, 265] id: 21
  if r0_21.InteractiveTime > 0 then
    return true
  end
  local r1_21 = r0_21:GetOwner()
  if r1_21 and r1_21.InteractiveType == Const.PressInteractive then
    return true
  end
  return false
end
function r0_0.GetNeedLongPressTime(r0_22)
  -- line: [267, 273] id: 22
  local r1_22 = r0_22:GetOwner()
  if r1_22 and r1_22.GetNeedLongPressTime then
    return r1_22:GetNeedLongPressTime()
  end
  return 0
end
function r0_0.GetLongPressedPercent(r0_23)
  -- line: [275, 281] id: 23
  local r1_23 = r0_23:GetOwner()
  if r1_23 and r1_23.GetLongPressedPercent then
    return r1_23:GetLongPressedPercent()
  end
  return 0
end
function r0_0.GetReduceTime(r0_24)
  -- line: [283, 289] id: 24
  local r1_24 = r0_24:GetOwner()
  if r1_24 and r1_24.GetReduceTime then
    return r1_24:GetReduceTime()
  end
  return 0.1
end
function r0_0.GetInteractiveIcon(r0_25, r1_25)
  -- line: [291, 310] id: 25
  if r0_25.OverriddenIcon then
    return r0_25.OverriddenIcon
  end
  if r0_25:IsLocked() then
    return "Texture2D\'/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Lock.T_Interactive_Lock\'"
  end
  local r2_25 = r0_25:GetOwner()
  if not r2_25 then
    return nil
  end
  if not r2_25.UsePlayerId and r0_25:IsForbidden(r1_25) then
    return "Texture2D\'/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Forbidden.T_Interactive_Forbidden\'"
  end
  local r3_25 = DataMgr.CommonUIConfirm[r0_25.CommonUIConfirmID]
  if not r3_25 or not r3_25.Icon then
    return nil
  end
  return r3_25.Icon
end
function r0_0.OverrideInteractiveIcon(r0_26, r1_26)
  -- line: [312, 314] id: 26
  rawset(r0_26, "OverriddenIcon", r1_26)
end
function r0_0.CanPickUpWithOneClick(r0_27)
  -- line: [317, 330] id: 27
  if not r0_27:GetOwner().UnitId then
    return false
  end
  local r1_27 = r0_27:GetOwner().UnitId
  if not DataMgr.Mechanism[r1_27] then
    return false
  end
  if DataMgr.Mechanism[r1_27].UnitRealType == "Collection" then
    return true
  end
  return false
end
function r0_0.GetQuestID(r0_28)
  -- line: [332, 335] id: 28
  return r0_28:GetOwner().QuestChainId
end
function r0_0.GetSpecialQuestID(r0_29)
  -- line: [337, 343] id: 29
  local r1_29 = r0_29:GetOwner()
  if r1_29 then
    return r1_29.ExtraRegionInfo.SpecialQuestId
  end
  return nil
end
return r0_0
