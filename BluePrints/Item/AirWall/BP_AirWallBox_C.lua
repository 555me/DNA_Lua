-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Item\AirWall\BP_AirWallBox_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.Item.BP_CombatItemBase_C"
})
function r0_0.ReceiveBeginPlay(r0_1)
  -- line: [34, 59] id: 1
  r0_0.Super.ReceiveBeginPlay(r0_1)
  EventManager:AddEvent(EventID.OnLevelDeliverBlackCurtainEnd, r0_1, r0_1.CloseLoading)
  EventManager:AddEvent(EventID.CloseLoading, r0_1, r0_1.CloseLoading)
  local r1_1 = UGameplayStatics.GetGameState(r0_1)
  local r2_1 = r1_1 and r1_1:IsInDungeon()
  if r1_1 and r2_1 and r0_1.OutAirWallCheckBox and IsAuthority(r0_1) then
    DebugPrint(r0_1:GetName() .. " @gulinan Start Huaxu region dungeon AirDoorBoxOutCheck")
    r1_1.CheckOutAirDoorBoxTransform = r0_1.OutAirWallCheckBox:K2_GetComponentToWorld()
    r1_1.CheckOutAirBoxLocal = r0_1.OutAirWallCheckBox.BoxExtent * r0_1:GetActorScale3D()
  end
end
function r0_0.ReceiveEndPlay(r0_2)
  -- line: [87, 92] id: 2
  EventManager:RemoveEvent(EventID.OnLevelDeliverBlackCurtainEnd, r0_2)
  EventManager:RemoveEvent(EventID.CloseLoading, r0_2)
end
function r0_0.OnRep_Size(r0_3)
  -- line: [94, 96] id: 3
  r0_3:SetBoxExtent(r0_3.Size)
end
function r0_0.AuthorityInitInfo(r0_4, r1_4)
  -- line: [98, 104] id: 4
  r0_0.Super.AuthorityInitInfo(r0_4, r1_4)
  if not r0_4.BpBorn then
    r0_4.Size = r1_4.Creator.TriggerBoxContent
    r0_4:SetBoxExtent(r1_4.Creator.TriggerBoxContent, r1_4.Creator.TriggerTipsBoxContent)
  end
end
function r0_0.CommonInitInfo(r0_5, r1_5)
  -- line: [106, 121] id: 5
  r0_0.Super.CommonInitInfo(r0_5, r1_5)
  local r2_5 = r0_5.UnitParams.DynamicEffectId
  local r3_5 = r0_5.UnitParams.ConstantEffectId
  if not r2_5 or not r3_5 then
    return 
  end
  local r4_5 = DataMgr.VisualEffect[r2_5].EffectParam.color
  local r5_5 = DataMgr.VisualEffect[r3_5].EffectParam.color
  r0_5.ApproachEffect:GetMaterials():GetRef(1):SetVectorParameterValue("Color", FLinearColor(r4_5[1], r4_5[2], r4_5[3], r4_5[4]))
  r0_5.ResidentEffect:GetMaterials():GetRef(1):SetVectorParameterValue("MainTexColor", FLinearColor(r5_5[1], r5_5[2], r5_5[3], r5_5[4]))
end
function r0_0.SetBoxExtent_Multicast(r0_6, r1_6)
  -- line: [123, 139] id: 6
  local r2_6 = FVector(0, 0, 0)
  if r1_6 ~= nil then
    r2_6.X = r0_6:GetScale(r1_6.X)
    r2_6.Y = r0_6:GetScale(r1_6.Y)
    r2_6.Z = r0_6:GetScale(r1_6.Z) / 2
  end
  if r0_6.Type == 2 then
    r2_6.Z = r0_6:GetScale(r1_6.Z)
  else
    r2_6.Z = r0_6:GetScale(r1_6.Z) / 2
  end
  r0_6:SetActorScale(r2_6)
  if r0_6.EMAutoGenerateModifier then
    r0_6.EMAutoGenerateModifier:SpawnAllModifiers()
  end
end
function r0_0.GetScale(r0_7, r1_7)
  -- line: [141, 148] id: 7
  if r1_7 < 0 then
    r1_7 = 0
  else
    r1_7 = r1_7 / 100
  end
  return r1_7
end
function r0_0.CloseLoading(r0_8)
  -- line: [151, 157] id: 8
  if r0_8.EMAutoGenerateModifier then
    r0_8:AddTimer(1.5, function()
      -- line: [153, 155] id: 9
      r0_8.EMAutoGenerateModifier:RefreshNavmodifier()
    end)
  end
end
return r0_0
