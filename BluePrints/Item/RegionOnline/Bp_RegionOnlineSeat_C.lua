-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Item\RegionOnline\BP_RegionOnlineSeat_C.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = Class("BluePrints.Item.Mechanism.Seat.BP_SeatBase_C")
local r1_0 = require("BluePrints.UI.WBP.BattleOnlineAction.OnlineActionController")
function r0_0.ReceiveBeginPlay(r0_1)
  -- line: [14, 17] id: 1
  r0_0.Super.ReceiveBeginPlay(r0_1)
  r0_1.DefaultInteractiveComponent.MergeName = nil
end
function r0_0.CommonInitInfo(r0_2, r1_2)
  -- line: [19, 28] id: 2
  r0_2.SenderId = r1_2.NameParams:Find("Sender") and ""
  r0_2.ResourceId = r1_2.IntParams:Find("ResourceId")
  local r2_2 = r1_2.NameParams:Find("UniqueId")
  print(_G.LogTag, "LXZ CommonInitInfo", r2_2, r0_2.SenderId, r1_2.NameParams:Find("Sender"))
  if r0_2.UniqueId == "None" and r2_2 then
    r0_2.UniqueId = r1_2.NameParams:Find("UniqueId")
  end
  r0_0.Super.CommonInitInfo(r0_2, r1_2)
end
function r0_0.OnActorReady(r0_3, r1_3)
  -- line: [30, 37] id: 3
  r0_0.Super.OnActorReady(r0_3, r1_3)
  local r2_3 = UGameplayStatics.GetGameState(r0_3)
  if r2_3:CheckDeleteRegionMechanism(r0_3.UniqueId) then
    r2_3:RemoveDeleteRegionMechanism(r0_3.UniqueId)
    r2_3:RemoveMechanismRegionOnline(r0_3.UniqueId, EDestroyReason.OwnerLeaveRegion)
  end
end
function r0_0.SendServerStartInteractive(r0_4, r1_4)
  -- line: [39, 51] id: 4
  local r2_4 = GWorld:GetAvatar()
  local r4_4 = r0_4:FindPoint(r1_4).Index
  local r5_4 = r2_4.Eid
  if r0_4.SenderId and r0_4.SenderId ~= "" then
    r5_4 = CommonUtils.Str2ObjId(r0_4.SenderId)
  end
  UIManager(r0_4):ShowUITip(UIConst.Tip_CommonToast, GText("UI_RegionOnline_Apply_Sent"))
  Battle(r0_4):GetEntity(r1_4).WaitRegionOnlineSeatCB = true
  r2_4:RequestChangeRegionOnlineItemState(r2_4.CurrentOnlineType, r0_4.UniqueId, r5_4, r4_4, r0_4.StateId)
end
function r0_0.OpenMechanism(r0_5, r1_5)
  -- line: [53, 106] id: 5
  if not Battle(r0_5) then
    return 
  end
  local r2_5 = GWorld:GetAvatar()
  if r0_5.PlayerAndSeat and r0_5.PlayerAndSeat[r1_5] then
    return 
  end
  local r3_5 = Battle(r0_5):GetEntity(r1_5)
  local r4_5 = r0_5:FindPoint(r1_5)
  local r5_5 = r4_5:FindEnterPoint(r1_5)
  r4_5.IsUsed = true
  r4_5.EnterType = r5_5.Type
  r0_5.PlayerAndSeat[r1_5] = r4_5
  local r6_5 = UGameplayStatics.GetPlayerCharacter(r0_5, 0)
  local r7_5 = r3_5.Eid == r6_5.Eid
  local r8_5 = r2_5:GetBornedChar(CommonUtils.Str2ObjId(r0_5.SenderId)) and r6_5
  if r7_5 then
    r3_5:AddForbidTag("Battle")
    local r9_5 = r8_5:GetTransform()
    r9_5.Translation.Z = r9_5.Translation.Z - r8_5.CapsuleComponent:GetScaledCapsuleHalfHeight() + r3_5.CapsuleComponent:GetScaledCapsuleHalfHeight()
    r3_5:K2_SetActorTransform(r9_5, false, nil, false)
    r0_5.PlayerMeshTrans = r3_5.Mesh:GetRelativeTransform()
    local r10_5 = r4_5:K2_GetComponentToWorld()
    print(_G.LogTag, "lxz OpenMechanism", r3_5.CapsuleComponent:GetScaledCapsuleHalfHeight())
    r3_5.Mesh:K2_SetWorldTransform(r10_5, false, nil, false)
    r3_5.OnInteractiveDelegate:Add(r0_5.ChestInteractiveComponent, r0_5.ChestInteractiveComponent.EndInteractive)
    r3_5:GetMovementComponent():SetMovementMode(1)
    r3_5.CharSpringArmComponent.bArmCollision = false
    r0_5.CameraProbeSize = r3_5.CharSpringArmComponent.CameraProbeSize
    r3_5.CharSpringArmComponent.CameraProbeSize = 2
    r0_5:SetSittingParam(r3_5, r4_5, r5_5)
    r3_5:EnableInput(UE4.UGameplayStatics.GetPlayerController(r0_5, 0))
    r0_5:ClientPlayAnim(r3_5.Eid, 0, r0_5.Eid)
    EventManager:FireEvent(EventID.OnOpenMechanism, r0_5.Eid)
  else
    r3_5:GetMovementComponent().bForbidBalanceTick = true
    r3_5:SetTickEnabled(ETickCtrlType.DontNeedTick, ETickObjectFlag.FLAG_CHARMOVEMENTCOMPONENT, false)
    local r9_5 = r8_5:GetTransform()
    r9_5.Translation.Z = r9_5.Translation.Z - r8_5.CapsuleComponent:GetScaledCapsuleHalfHeight() + r3_5.CapsuleComponent:GetScaledCapsuleHalfHeight()
    r3_5:K2_SetActorTransform(r9_5, false, nil, false)
    r0_5.PlayerMeshTrans = r3_5.Mesh:GetRelativeTransform()
    r3_5.Mesh:K2_SetWorldTransform(r4_5:K2_GetComponentToWorld(), false, nil, false)
    r3_5:GetMovementComponent():SetMovementMode(1)
    r0_5:SetSittingParam(r3_5, r4_5, r5_5)
    r0_5:ClientPlayAnim(r3_5.Eid, 0, r0_5.Eid)
  end
end
function r0_0.CloseMechanism(r0_6, r1_6, r2_6)
  -- line: [108, 136] id: 6
  if not Battle(r0_6) then
    return 
  end
  local r3_6 = Battle(r0_6):GetEntity(r1_6)
  local r5_6 = r3_6.Eid == UGameplayStatics.GetPlayerCharacter(r0_6, 0).Eid
  if IsValid(r3_6) then
    r3_6:GetMovementComponent().bForbidBalanceTick = false
    r3_6:SetTickEnabled(ETickCtrlType.DontNeedTick, ETickObjectFlag.FLAG_CHARMOVEMENTCOMPONENT, true)
    r3_6.OnInteractiveDelegate:Remove(r0_6.ChestInteractiveComponent, r0_6.ChestInteractiveComponent.EndInteractive)
    r3_6:GetMovementComponent().bAllowPhysicsRotationDuringAnimRootMotion = true
    r3_6.CharSpringArmComponent.bArmCollision = true
    r3_6.CharSpringArmComponent.CameraProbeSize = r0_6.CameraProbeSize
    print(_G.LogTag, "LXZ CloseMechanism", r0_6.PlayerMeshTrans)
    r3_6.Mesh:K2_SetRelativeTransform(r0_6.PlayerMeshTrans, false, nil, false)
    local r6_6 = r0_6:GetLeavingPoint(r3_6)
    if r6_6 then
      r0_6.PlayerAndSeat[r3_6.Eid].EnterType = r6_6.Type
      r0_6:SetLeavingParam(r3_6, r0_6.PlayerAndSeat[r1_6], r6_6)
      r0_6:ClientPlayAnim(r1_6, 2, r0_6.Eid)
    end
  end
  if r0_6.PlayerAndSeat[r1_6] then
    r0_6.PlayerAndSeat[r1_6].IsUsed = false
    r0_6.PlayerAndSeat[r1_6] = nil
  end
end
function r0_0.ForceCloseMechanism(r0_7, r1_7, r2_7)
  -- line: [138, 149] id: 7
  if not Battle(r0_7) then
    return 
  end
  local r3_7 = Battle(r0_7):GetEntity(r1_7)
  r3_7.OnInteractiveDelegate:Remove(r0_7.ChestInteractiveComponent, r0_7.ChestInteractiveComponent.EndInteractive)
  r3_7.CapsuleComponent:SetCollisionResponseToChannel(ECollisionChannel.ECC_WorldStatic, ECollisionResponse.ECR_Block)
  r3_7:GetMovementComponent().bAllowPhysicsRotationDuringAnimRootMotion = true
  r3_7:GetMovementComponent():SetMovementMode(1)
end
function r0_0.NotifyUIStop(r0_8)
  -- line: [151, 153] id: 8
  r1_0:OnEndOnlineAction()
end
function r0_0.PlayAnim(r0_9, r1_9, r2_9, r3_9)
  -- line: [154, 171] id: 9
  local r4_9 = Battle(r0_9):GetEntity(r1_9)
  if r2_9 == 0 then
    r0_9.ChestInteractiveComponent:OnStartInteractive(Battle(r0_9):GetEntity(r1_9), r0_9.PointMontage:Find(r0_9.PlayerAndSeat[r1_9].Index) and "Gesture_Car_Interactive_Montage", r3_9, "Gesture")
  end
  if r2_9 == 1 then
  end
  if r2_9 == 2 then
    r0_9.ChestInteractiveComponent:OnEndInteractive(Battle(r0_9):GetEntity(r1_9), r0_9.ChestInteractiveComponent.MontageName, r3_9)
    r4_9:StopMontage()
    r4_9:GetMovementComponent().RootMotionZScale = 1
  end
end
function r0_0.CheckInteractiveIdValid(r0_10, r1_10)
  -- line: [173, 183] id: 10
  if not r0_10.PlayerAndSeat then
    return true
  end
  for r6_10, r7_10 in pairs(r0_10.PlayerAndSeat) do
    if r7_10.Index == r1_10 then
      return false
    end
  end
  -- close: r2_10
  return true
end
function r0_0.OnEMActorDestroy(r0_11, r1_11)
  -- line: [185, 203] id: 11
  if not Battle(r0_11) then
    return 
  end
  for r6_11, r7_11 in pairs(r0_11.PlayerAndSeat) do
    local r8_11 = Battle(r0_11):GetEntity(r6_11)
    if IsValid(r8_11) then
      r8_11:DeInteractiveMechanism(r0_11.Eid, r6_11, 0, true, r0_11.ChestInteractiveComponent.NextStateId, true, r7_11.Index)
    end
  end
  -- close: r2_11
  r0_11.PlayerAndSeat = {}
  if r0_11.SenderId then
    local r2_11 = UGameplayStatics.GetGameState(r0_11)
    r2_11.RegionOnlineMechanismMap:Remove(r0_11.SenderId)
    r2_11:RemovePlayerMechanismRegionOnline(r0_11.SenderId, r0_11.UniqueId, false)
  end
  r0_0.Super.OnEMActorDestroy(r0_11, r1_11)
end
function r0_0.ReceiveEndPlay(r0_12, r1_12)
  -- line: [206, 224] id: 12
  if not Battle(r0_12) then
    return 
  end
  for r6_12, r7_12 in pairs(r0_12.PlayerAndSeat) do
    local r8_12 = Battle(r0_12):GetEntity(r6_12)
    if IsValid(r8_12) then
      r0_12.ChestInteractiveComponent:EndInteractive(r8_12)
      r8_12.CapsuleComponent:SetCollisionResponseToChannel(ECollisionChannel.ECC_WorldStatic, ECollisionResponse.ECR_Block)
    end
  end
  -- close: r2_12
  r0_12.PlayerAndSeat = {}
  if r0_12.SenderId then
    local r2_12 = UGameplayStatics.GetGameState(r0_12)
    r2_12.RegionOnlineMechanismMap:Remove(r0_12.SenderId)
    r2_12:RemovePlayerMechanismRegionOnline(r0_12.SenderId, r0_12.UniqueId, false)
  end
  r0_0.Super.ReceiveEndPlay(r0_12, r1_12)
end
function r0_0.GetCanOpen(r0_13, r1_13)
  -- line: [226, 241] id: 13
  local r2_13 = GWorld:GetAvatar()
  if not r2_13 then
    return 
  end
  local r4_13 = CommonUtils.ObjId2Str(r2_13.Eid) == r0_13.SenderId
  local r5_13 = Battle(r0_13):GetEntity(r1_13)
  r0_13.CanOpen = not DataMgr.PlayerStateMachine[r5_13.AutoSyncProp.CharacterTag].Seating
  if r4_13 or r5_13.WaitRegionOnlineSeatCB then
    r0_13.CanOpen = false
    return 
  end
end
function r0_0.IsForbidden(r0_14, r1_14)
  -- line: [242, 254] id: 14
  local r2_14 = r0_14:GetValidPoint()
  local r3_14 = r0_14.ChestInteractiveComponent.InteractiveName
  for r8_14, r9_14 in pairs(r2_14) do
    if r9_14.Valid or r9_14.Eid == r1_14.Eid then
      r0_14.ChestInteractiveComponent.InteractiveName = GText(DataMgr.CommonUIConfirm[r0_14.ChestInteractiveComponent.CommonUIConfirmID].ConfirmText)
      return false
    end
  end
  -- close: r4_14
  r0_14.ChestInteractiveComponent.InteractiveName = "UI_RegionOnline_SitOccupied"
  return true
end
return r0_0
