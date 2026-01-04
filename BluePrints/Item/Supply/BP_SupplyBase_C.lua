-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Item\Supply\BP_SupplyBase_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.Item.Chest.BP_MechanismBase_C",
  "BluePrints.Common.TimerMgr"
})
function r0_0.OnActorReady(r0_1, r1_1)
  -- line: [18, 20] id: 1
  r0_0.Super.OnActorReady(r0_1, r1_1)
end
function r0_0.AuthorityInitInfo(r0_2, r1_2)
  -- line: [23, 26] id: 2
  r0_0.Super.AuthorityInitInfo(r0_2, r1_2)
end
function r0_0.CommonInitInfo(r0_3, r1_3)
  -- line: [28, 32] id: 3
  r0_0.Super.CommonInitInfo(r0_3, r1_3)
  r0_3.InteractiveType = Const.EndByTargetInteractive
  r0_3.ChestInteractiveComponent.DisPlayInteractiveName = GText(r0_3.ChestInteractiveComponent.InteractiveName)
end
function r0_0.ClientInitInfo(r0_4, r1_4)
  -- line: [34, 36] id: 4
  r0_0.Super.ClientInitInfo(r0_4, r1_4)
end
function r0_0.ActiveMaterialNotify(r0_5)
  -- line: [51, 58] id: 5
  if r0_5.CanOpen and r0_5.OpenState == false then
    r0_5:SetTargetMaterialParam(r0_5.SetCountParamName, r0_5.SetCountParamValueMax)
    r0_5:SetTargetMaterialParam(r0_5.SetTimeParamName, r0_5.SetTimeParamValueMax)
    r0_5:SetTargetMaterialParam(r0_5.SetCurrentTimeParamName, UE4.UGameplayStatics.GetTimeSeconds(r0_5))
  end
end
function r0_0.DelayDestory(r0_6)
  -- line: [62, 67] id: 6
  if r0_6 == nil then
    return 
  end
  r0_6:AddTimer(5, r0_6.DestorySupply)
end
function r0_0.DestorySupply(r0_7)
  -- line: [69, 72] id: 7
  print(_G.LogTag, "Eid ::: " .. r0_7.Eid)
  r0_7:EMActorDestroy(EDestroyReason.MechanismDead)
end
function r0_0.OpenMechanism(r0_8, r1_8)
  -- line: [75, 86] id: 8
  if r1_8 == nil or r0_8 == nil or not r0_8.CanOpen then
    return 
  end
  r0_8.CanOpen = false
  if IsAuthority(r0_8) then
    r0_8:TriggerGameModeEvent("OnSupplyInteractive")
    r0_8.NowPlayerEid = r1_8
    r0_8:ClientPlayAnim(r1_8, 0, r0_8.Eid)
    r0_8:AddTimer(r0_8.SetInteractiveTime, r0_8.InteractiveHandle, false, 0, "SupplayInteractive", false, r1_8)
  end
end
function r0_0.InteractiveHandle(r0_9, r1_9)
  -- line: [88, 106] id: 9
  if r0_9.OpenState then
    if not r0_9.OpenState then
      r0_9.CanOpen = true
    end
    return 
  end
  r0_9.OpenState = true
  r0_9:AddSurvivalValue()
  local r2_9 = UE4.UGameplayStatics.GetGameMode(r0_9)
  if r2_9 then
    r2_9:TriggerDungeonAchieve("OnInteractiveSupplyBase", r1_9)
  end
  local r3_9 = Battle(r0_9):GetEntity(r1_9)
  if not r3_9 then
    return 
  end
  r3_9:DeInteractiveMechanism(r0_9.Eid, r1_9, 0, true)
end
function r0_0.CloseMechanism(r0_10, r1_10, r2_10)
  -- line: [108, 115] id: 10
  if IsAuthority(r0_10) then
    r0_10:DeactiveGuide()
    r0_10:ClientPlayAnim(r1_10, 2, r0_10.Eid)
    r0_10:DelayDestory()
    r0_10.NowPlayerEid = 0
  end
end
function r0_0.PlayAnim(r0_11, r1_11, r2_11, r3_11)
  -- line: [117, 129] id: 11
  if r2_11 == 0 then
    r0_11.ChestInteractiveComponent:OnStartInteractive(Battle(r0_11):GetEntity(r1_11), r0_11.ChestInteractiveComponent.MontageName, r3_11)
    r0_11:SetTargetMaterialParam(r0_11.SetTimeParamName, r0_11.SetTimeParamValue)
    r0_11:ActiveSpecialEffects()
  end
  if r2_11 == 1 then
  end
  if r2_11 == 2 then
    r0_11.ChestInteractiveComponent:OnEndInteractive(Battle(r0_11):GetEntity(r1_11), r0_11.ChestInteractiveComponent.MontageName, r3_11)
  end
end
function r0_0.AddSurvivalValue(r0_12)
  -- line: [131, 138] id: 12
  local r1_12 = DataMgr.GlobalConstant.BigSurvivalMechanism.ConstantValue
  local r2_12 = UE4.UGameplayStatics.GetGameMode(r0_12)
  if r2_12 then
    r2_12:TriggerDungeonComponentFun("AddSurvivalValue", r1_12)
  end
end
function r0_0.OnRep_NowPlayerEid(r0_13)
  -- line: [140, 145] id: 13
  if r0_13.NowPlayerEid == 0 then
    return 
  end
end
AssembleComponents(r0_0)
return r0_0
