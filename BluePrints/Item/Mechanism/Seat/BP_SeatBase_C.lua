-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Item\Mechanism\Seat\BP_SeatBase_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class("BluePrints.Item.Chest.BP_MechanismBase_C")
local r1_0 = true
function r0_0.ReceiveBeginPlay(r0_1)
  -- line: [13, 29] id: 1
  r0_0.Super.ReceiveBeginPlay(r0_1)
  r0_1.PointArray = r0_1:K2_GetComponentsByClass(LoadClass("/Game/BluePrints/Item/Mechanism/Seat/BP_SeatPointComponent.BP_SeatPointComponent_C"):StaticClass())
  r0_1.PlayerAndSeat = {}
  r0_1.DefaultInteractiveComponent.MergeName = "Seat"
  if r0_1.DefaultInteractiveComponent then
    r0_1.DefaultInteractiveComponent.bCanUsed = true
    r0_1.DefaultInteractiveComponent.IsDefault = true
    r0_1.InteractiveComponents:Clear()
    r0_1.InteractiveComponents:Add(r0_1.DefaultInteractiveComponent)
    r0_1.ChestInteractiveComponent = r0_1.DefaultInteractiveComponent
  end
end
function r0_0.BeginInitInfo(r0_2)
  -- line: [31, 39] id: 2
  print(_G.LogTag, "LXZ BeginInitInfo", r0_2.InitSuccess)
  if r0_2.InitSuccess then
    UGameplayStatics.GetGameState(r0_2):FireRegionOnlineMechanismUser(r0_2.UniqueId, r0_2)
    return 
  end
  r0_2:InitActorInfo_New()
end
function r0_0.AuthorityInitInfo(r0_3, r1_3)
  -- line: [41, 44] id: 3
  r0_0.Super.AuthorityInitInfo(r0_3, r1_3)
end
function r0_0.CommonInitInfo(r0_4, r1_4)
  -- line: [46, 49] id: 4
  r0_0.Super.CommonInitInfo(r0_4, r1_4)
  r0_4.ChestInteractiveComponent.DisPlayInteractiveName = GText(r0_4.ChestInteractiveComponent.InteractiveName)
end
function r0_0.ClientInitInfo(r0_5, r1_5)
  -- line: [51, 53] id: 5
  r0_0.Super.ClientInitInfo(r0_5, r1_5)
end
function r0_0.OnActorReady(r0_6, r1_6)
  -- line: [55, 66] id: 6
  r0_0.Super.OnActorReady(r0_6, r1_6)
  UGameplayStatics.GetGameState(r0_6):FireRegionOnlineMechanismUser(r0_6.UniqueId, r0_6)
  if r0_6.CacheOpenMechanismWithoutInteractive then
    r0_6.CacheOpenMechanismWithoutInteractive.SourceFunc(r0_6, Battle(r0_6):GetEntity(r0_6.CacheOpenMechanismWithoutInteractive.CharacterEid), r0_6.CacheOpenMechanismWithoutInteractive.CallBackFunc, false)
  end
end
function r0_0.SendServerStartInteractive(r0_7, r1_7)
  -- line: [68, 74] id: 7
  if not Battle(r0_7) then
    return 
  end
  r0_7:SpecialRegionOnlineStartLogic(Battle(r0_7):GetEntity(r1_7))
end
function r0_0.SendServerEndInteractive(r0_8, r1_8)
  -- line: [76, 82] id: 8
  if not Battle(r0_8) then
    return 
  end
  r0_8:SpecialRegionOnlineEndLogic(Battle(r0_8):GetEntity(r1_8))
end
function r0_0.OpenMechanism(r0_9, r1_9)
  -- line: [84, 137] id: 9
  print(_G.LogTag, "LXZ OpenMechanism", r1_9, r0_9:GetName(), r0_9.PlayerAndSeat[r1_9])
  Traceback()
  if r0_9.PlayerAndSeat and r0_9.PlayerAndSeat[r1_9] then
    return 
  end
  local r2_9 = Battle(r0_9):GetEntity(r1_9)
  local r3_9 = r0_9:FindPoint(r1_9)
  local r4_9 = r3_9:FindEnterPoint(r1_9)
  local r7_9 = FVector(r4_9:K2_GetComponentLocation().X, r4_9:K2_GetComponentLocation().Y, r4_9:K2_GetComponentLocation().Z + r2_9.CapsuleComponent.CapsuleHalfHeight + math.max(r2_9:GetFloorInfo().FloorDist, 2.4))
  local r8_9 = r4_9:K2_GetComponentRotation()
  r3_9.IsUsed = true
  r3_9.EnterType = r4_9.Type
  r0_9.PlayerAndSeat[r1_9] = r3_9
  local r11_9 = UGameplayStatics.GetPlayerCharacter(r0_9, 0).Eid
  local r10_9 = r2_9.Eid == r11_9
  print(_G.LogTag, "LXZ OpenMechanism00", r0_9:GetName(), r4_9:K2_GetComponentLocation().Z, r2_9.CapsuleComponent.CapsuleHalfHeight, r5_9)
  if r10_9 then
    r2_9:AddForbidTag("Battle")
    r11_9 = UE4.UGameplayStatics.GetPlayerController(r0_9, 0)
    r2_9:DisableInput(r11_9)
    UE4.ULTweenBPLibrary.Vector3To(r0_9, {
      r0_9,
      function(r0_10, r1_10)
        -- line: [107, 111] id: 10
        r2_9.MoveInput = FVector(0, 0, 0)
        r2_9.MoveInputCache = FVector(0, 0, 0)
        r2_9:K2_SetActorLocationAndRotation(r1_10, r8_9, false, nil, false)
      end
    }, r2_9:K2_GetActorLocation(), r7_9, 0.1, 0):OnComplete({
      r0_9,
      function()
        -- line: [113, 125] id: 11
        r2_9:K2_SetActorLocationAndRotation(r7_9, r8_9, false, nil, false)
        r2_9.OnInteractiveDelegate:Add(r0_9.ChestInteractiveComponent, r0_9.ChestInteractiveComponent.EndInteractive)
        r2_9:GetMovementComponent():SetMovementMode(1)
        r2_9.CapsuleComponent:SetCollisionResponseToChannel(ECollisionChannel.ECC_WorldStatic, ECollisionResponse.ECR_OverLap)
        r2_9.CharSpringArmComponent.bArmCollision = false
        r0_9.CameraProbeSize = r2_9.CharSpringArmComponent.CameraProbeSize
        r2_9.CharSpringArmComponent.CameraProbeSize = 2
        r0_9:SetSittingParam(r2_9, r3_9, r4_9)
        r0_9:ClientPlayAnim(r2_9.Eid, 0, r0_9.Eid)
        r2_9:EnableInput(r11_9)
        EventManager:FireEvent(EventID.OnOpenMechanism, r0_9.Eid)
      end
    })
    -- close: r11_9
  else
    r11_9 = print
    r11_9(_G.LogTag, "LXZ OpenMechanism2222", r2_9:GetName(), r7_9, r8_9, r2_9:K2_GetActorLocation())
    r11_9 = r2_9:GetFloorInfo()
    r11_9 = r11_9.FloorDist
    if r11_9 > 0 then
      r2_9:K2_SetActorLocationAndRotation(r7_9, r8_9, false, nil, false)
    end
    r11_9 = r2_9:GetMovementComponent()
    r11_9:SetMovementMode(1)
    r11_9 = r2_9.CapsuleComponent
    r11_9:SetCollisionResponseToChannel(ECollisionChannel.ECC_WorldStatic, ECollisionResponse.ECR_OverLap)
    r0_9:SetSittingParam(r2_9, r3_9, r4_9)
    r0_9:ClientPlayAnim(r2_9.Eid, 0, r0_9.Eid)
  end
end
function r0_0.CloseMechanism(r0_12, r1_12, r2_12)
  -- line: [139, 169] id: 12
  if not Battle(r0_12) then
    return 
  end
  local r3_12 = Battle(r0_12):GetEntity(r1_12)
  local r4_12 = UGameplayStatics.GetPlayerCharacter(r0_12, 0)
  if not IsValid(r3_12) or not IsValid(r4_12) then
    return 
  end
  print(_G.LogTag, "LXZ CloseMechanism", r4_12, r0_12)
  local r5_12 = r3_12.Eid == r4_12.Eid
  if IsValid(r3_12) then
    if r5_12 then
      r3_12.OnInteractiveDelegate:Remove(r0_12.ChestInteractiveComponent, r0_12.ChestInteractiveComponent.EndInteractive)
      r3_12.CharSpringArmComponent.bArmCollision = true
      r3_12.CharSpringArmComponent.CameraProbeSize = r0_12.CameraProbeSize
    end
    r3_12:GetMovementComponent().bAllowPhysicsRotationDuringAnimRootMotion = true
    local r6_12 = r0_12:GetLeavingPoint(r3_12)
    if r0_12.PlayerAndSeat[r3_12.Eid] then
      r0_12.PlayerAndSeat[r3_12.Eid].EnterType = r6_12.Type
      r0_12:SetLeavingParam(r3_12, r0_12.PlayerAndSeat[r1_12], r6_12)
      r0_12:ClientPlayAnim(r1_12, 2, r0_12.Eid)
    end
  end
  if r0_12.PlayerAndSeat[r3_12.Eid] then
    r0_12.PlayerAndSeat[r1_12].IsUsed = false
    r0_12.PlayerAndSeat[r1_12] = nil
  end
end
function r0_0.ForceCloseMechanism(r0_13, r1_13, r2_13)
  -- line: [171, 181] id: 13
  local r3_13 = Battle(r0_13):GetEntity(r1_13)
  if IsMainPlayer then
    r3_13.OnInteractiveDelegate:Remove(r0_13.ChestInteractiveComponent, r0_13.ChestInteractiveComponent.EndInteractive)
  end
  r3_13.CapsuleComponent:SetCollisionResponseToChannel(ECollisionChannel.ECC_WorldStatic, ECollisionResponse.ECR_Block)
  r3_13:GetMovementComponent().bAllowPhysicsRotationDuringAnimRootMotion = true
  r3_13:GetMovementComponent():SetMovementMode(1)
  r0_13.PlayerAndSeat[r1_13].IsUsed = false
  r0_13.PlayerAndSeat[r1_13] = nil
end
function r0_0.PlayAnim(r0_14, r1_14, r2_14, r3_14)
  -- line: [183, 197] id: 14
  local r4_14 = Battle(r0_14):GetEntity(r1_14)
  if r2_14 == 0 then
    r0_14.ChestInteractiveComponent:OnStartInteractive(Battle(r0_14):GetEntity(r1_14), r0_14.ChestInteractiveComponent.MontageName .. "_" .. r0_14.PlayerAndSeat[r4_14.Eid].EnterType .. "_Montage", r3_14)
  end
  if r2_14 == 1 then
  end
  if r2_14 == 2 then
    r0_14.ChestInteractiveComponent:OnEndInteractive(Battle(r0_14):GetEntity(r1_14), r0_14.ChestInteractiveComponent.MontageName, r3_14)
    r4_14.Mesh:GetAnimInstance():Montage_JumpToSection("SitEnd" .. r0_14.PlayerAndSeat[r4_14.Eid].EnterType)
  end
end
function r0_0.GetCanOpen(r0_15, r1_15)
  -- line: [199, 208] id: 15
  local r2_15 = true
  for r6_15 = 1, r0_15.PointArray:Length(), 1 do
    if r2_15 then
      r2_15 = r0_15.PointArray[r6_15].IsUsed
    end
  end
  r0_15.CanOpen = not r2_15
  local r4_15 = DataMgr.PlayerStateMachine[Battle(r0_15):GetEntity(r1_15).AutoSyncProp.CharacterTag]
  r0_15.CanOpen = r0_15.CanOpen and not r4_15.Seating
end
function r0_0.FindPoint(r0_16, r1_16)
  -- line: [210, 239] id: 16
  local r2_16 = nil
  if r0_16.RegionOnlineInteractiveMessage:Find(r1_16) then
    local r3_16 = r0_16.RegionOnlineInteractiveMessage:Find(r1_16)
    for r8_16, r9_16 in pairs(r0_16.PointArray) do
      if r9_16.Index == r3_16 then
        r2_16 = r9_16
      end
    end
    -- close: r4_16
  else
    local r3_16 = 99999
    for r7_16 = 1, r0_16.PointArray:Length(), 1 do
      if not r0_16.PointArray[r7_16].IsUsed then
        local r8_16 = r0_16:SeatGetPlayerPointDis(Battle(r0_16):GetEntity(r1_16), r0_16.PointArray[r7_16])
        if r2_16 == nil or r8_16 < r3_16 or r8_16 == r3_16 and 0.5 <= math.random() then
          r2_16 = r0_16.PointArray[r7_16]
          r3_16 = r8_16
        end
      end
    end
  end
  if not r2_16 then
    print(_G.LogTag, "LXZ FindPoint Failed", r0_16:GetName(), r1_16, r0_16.PointArray:Length())
  end
  return r2_16
end
function r0_0.SetSittingParam(r0_17, r1_17, r2_17, r3_17)
  -- line: [242, 264] id: 17
  r1_17:SetCollisionType("CapsuleComponent", "MonsterPawn", ECollisionResponse.ECR_OverLap, false)
  r1_17:SetCollisionType("CapsuleComponent", "Pawn", ECollisionResponse.ECR_OverLap, false)
  local r4_17 = r0_17:SeatGetUpDiff(r1_17.Mesh, r2_17, 50, true)
  local r5_17 = 30
  local r6_17 = ""
  if r1_17:IsNPC() == false then
    r6_17 = DataMgr.BattleChar[r1_17.CurrentRoleId].BattleCharTag[1]
  end
  if r6_17 == "Girl" then
    r5_17 = 30
  elseif r6_17 == "Man" then
    r5_17 = 20
  elseif r6_17 == "Woman" then
    r5_17 = 30
  else
    r5_17 = 20
  end
  if r1_17:GetMovementComponent() then
    r1_17:GetMovementComponent().RootMotionZScale = r4_17 / r5_17
  end
end
function r0_0.SetLeavingParam(r0_18, r1_18, r2_18, r3_18)
  -- line: [267, 287] id: 18
  r1_18:SetCollisionType("CapsuleComponent", "MonsterPawn", ECollisionResponse.ECR_Block, false)
  r1_18:SetCollisionType("CapsuleComponent", "Pawn", ECollisionResponse.ECR_Block, false)
  local r4_18 = r0_18:SeatGetUpDiff(r1_18.Mesh, r3_18, r1_18.OriginHalfHeight, false)
  local r5_18 = 30
  local r6_18 = ""
  if r1_18:IsNPC() == false then
    r6_18 = DataMgr.BattleChar[r1_18.CurrentRoleId].BattleCharTag[1]
  end
  if r6_18 == "Girl" then
    r5_18 = 30
  elseif r6_18 == "Man" then
    r5_18 = 20
  elseif r6_18 == "Woman" then
    r5_18 = 30
  else
    r5_18 = 20
  end
  r1_18:GetMovementComponent().RootMotionZScale = r4_18 / r5_18
end
function r0_0.GetLeavingType(r0_19, r1_19)
  -- line: [289, 320] id: 19
  local r2_19 = {
    "F",
    "R",
    "F",
    "L",
    "F",
    "R",
    "F"
  }
  local r3_19 = r1_19.MoveInputCache.X
  local r4_19 = r1_19.MoveInputCache.Y
  local r5_19 = UE4.UKismetMathLibrary.GetForwardVector(r1_19:K2_GetActorRotation())
  local r6_19 = r1_19.CharCameraComponent:GetForwardVector()
  local r7_19 = UE4.UKismetMathLibrary.Normal2D(FVector2D(r5_19.X, r5_19.Y))
  local r8_19 = UE4.UKismetMathLibrary.Normal2D(FVector2D(r6_19.X, r6_19.Y))
  local r10_19 = UE4.UKismetMathLibrary.DegAcos(r7_19.X * r8_19.X + r7_19.Y * r8_19.Y)
  if r7_19.Y * r8_19.X - r7_19.X * r8_19.Y > 0 then
    r10_19 = 360 - r10_19
  end
  if r10_19 > 315 then
    r10_19 = r10_19 - 315
  end
  local r11_19 = 1
  local r12_19 = (r10_19 + 45) // 90
  if math.abs(r4_19) <= math.abs(r3_19) then
    if r3_19 > 0 then
      r11_19 = 1
    else
      r11_19 = 3
    end
  elseif r4_19 > 0 then
    r11_19 = 2
  else
    r11_19 = 4
  end
  return r2_19[r11_19 + r12_19]
end
function r0_0.GetLeavingPoint(r0_20, r1_20)
  -- line: [322, 327] id: 20
  if not r0_20.PlayerAndSeat or not r0_20.PlayerAndSeat[r1_20.Eid] then
    return 
  end
  return r0_20.PlayerAndSeat[r1_20.Eid]:FindLeavingPoint(r0_20:GetLeavingType(r1_20))
end
function r0_0.NpcGetLeavingPoint(r0_21, r1_21)
  -- line: [329, 334] id: 21
  if not r0_21.PlayerAndSeat[r1_21.Eid] then
    return nil
  end
  return r0_21.PlayerAndSeat[r1_21.Eid]:NpcFindLeavingPoint(r1_21)
end
function r0_0.OnEMActorDestroy(r0_22, r1_22)
  -- line: [336, 346] id: 22
  for r6_22, r7_22 in pairs(r0_22.PlayerAndSeat) do
    local r8_22 = Battle(r0_22):GetEntity(r6_22)
    print(_G.LogTag, "LXZ OnEMActorDestroy", r0_22:GetName(), r8_22, IsValid(r8_22))
    if IsValid(r8_22) then
      r0_22.ChestInteractiveComponent:EndInteractive(r8_22)
    end
  end
  -- close: r2_22
  r0_22.PlayerAndSeat = {}
  r0_0.Super.OnEMActorDestroy(r0_22, r1_22)
end
function r0_0.OpenMechanismWithoutInteractive(r0_23, r1_23, r2_23, r3_23)
  -- line: [349, 491] id: 23
  if not r0_23.InitSuccess then
    r0_23.CacheOpenMechanismWithoutInteractive = {
      CharacterEid = r1_23.Eid,
      CallBackFunc = r2_23,
      SourceFunc = r0_23.OpenMechanismWithoutInteractive,
    }
    return 
  end
  if not IsValid(r1_23) then
    return 
  end
  local r4_23 = r0_23:FindPoint(r1_23.Eid)
  if not r4_23 then
    print(_G.LogTag, "LXZ OpenMechanismWithoutInteractive", r1_23:GetName(), r0_23:GetName())
    return 
  end
  local r5_23 = r4_23:NpcFindEnterPoint(r1_23)
  local r7_23 = FVector(r5_23:K2_GetComponentLocation().X, r5_23:K2_GetComponentLocation().Y, r1_23:K2_GetActorLocation().Z)
  local r8_23 = r5_23:K2_GetComponentRotation()
  r4_23.IsUsed = true
  r4_23.EnterType = r5_23.Type
  r0_23.PlayerAndSeat[r1_23.Eid] = r4_23
  UE4.ULTweenBPLibrary.Vector3To(r0_23, {
    r0_23,
    function(r0_24, r1_24)
      -- line: [377, 381] id: 24
      r1_23.MoveInput = FVector(0, 0, 0)
      r1_23.MoveInputCache = FVector(0, 0, 0)
      r1_23:K2_SetActorLocationAndRotation(r1_24, r8_23, false, nil, false)
    end
  }, r1_23:K2_GetActorLocation(), r7_23, 0.1, 0):OnComplete({
    r0_23,
    function()
      -- line: [382, 480] id: 25
      if not IsValid(r1_23) then
        return 
      end
      local r0_25 = UE4.UGameplayStatics.GetPlayerCharacter(r0_23, 0)
      r1_23:SetCharacterTag(r0_23.ChestInteractiveComponent.InteractiveTag)
      r0_23:SetSittingParam(r1_23, r4_23, r5_23)
      r1_23.CapsuleComponent:IgnoreActorWhenMoving(r0_23, true)
      r1_23.CapsuleComponent:IgnoreActorWhenMoving(r0_25, true)
      local r1_25 = TArray(AActor)
      UE4.UKismetSystemLibrary.BoxOverlapActors(r0_23, r5_23:K2_GetComponentLocation() + FVector(0, 0, r1_23.CapsuleComponent.CapsuleHalfHeight + 2), FVector(80, 80, 30), nil, UE4.AStaticMeshActor, nil, r1_25)
      for r7_25, r8_25 in pairs(r1_25) do
        if r8_25 then
          r1_23.CapsuleComponent:IgnoreActorWhenMoving(r8_25, true)
        end
      end
      -- close: r3_25
      if r1_23:GetMovementComponent() then
        r1_23.SitGravityScale = r1_23:GetMovementComponent().GravityScale
        r1_23:GetMovementComponent().GravityScale = 0
        if r1_23.SetNpcMovementTickEnable then
          r1_23:SetNpcMovementTickEnable(true)
        else
          r1_23:GetMovementComponent():SetComponentTickEnabled(true)
        end
        r1_23:GetMovementComponent():OnNpcSeatingBegin()
      end
      r1_23:NpcSitSeat_Transform(r4_23, r5_23, r1_23.CapsuleComponent.CapsuleHalfHeight)
      if r1_23.NpcAnimInstance then
        r1_23.NpcAnimInstance.EnableDataFootIK = false
      end
      local r5_25 = {
        OnCompleted = function()
          -- line: [430, 432] id: 26
        end,
        OnNotifyBegin = function()
          -- line: [434, 441] id: 27
          if r2_23 then
            r2_23()
          end
          EventManager:FireEvent(EventID.OnNpcPoseChange)
          r1_23:SetNpcMovementTickEnable(false)
        end,
      }
      if r0_23.PlayerAndSeat[r1_23.Eid] and r0_23.PlayerAndSeat[r1_23.Eid].EnterType then
        local r6_25 = r0_23.ChestInteractiveComponent.MontageName .. "_" .. r0_23.PlayerAndSeat[r1_23.Eid].EnterType .. "_Montage"
        local r7_25 = "Interactive/MechInteractive"
        if r1_23.NpcId and DataMgr.Npc[r1_23.NpcId] and DataMgr.Npc[r1_23.NpcId].SpecialSit then
          local r9_25 = DataMgr.TalkAction[DataMgr.Npc[r1_23.NpcId].SpecialSit]
          if r9_25 then
            r6_25 = r9_25.ActionMontage .. "_Montage"
            if r6_25 then
              r6_25 = r6_25
            end
            r7_25 = r9_25.MontagePrePath
            if r7_25 then
              r7_25 = r7_25
            end
          end
        end
        if r3_23 == nil or r3_23 == false then
          r1_23:PlayActionMontage(r7_25, r6_25, r5_25, false, true, false)
        else
          local r8_25 = r1_23:GetMontagePath(r7_25, r6_25)
          r1_23:K2_SetActorLocationAndRotation(r4_23:K2_GetComponentLocation(), r8_23, false, nil, false)
          UResourceLibrary.LoadObjectAsync(r0_23, r8_25, {
            r0_23,
            function(r0_28, r1_28)
              -- line: [463, 469] id: 28
              UE4.UPlayMontageCallbackProxy.CreateProxyObjectForPlayMontage(r1_23.Mesh, r1_28, 1, 0, "SitLoop")
              EventManager:FireEvent(EventID.OnNpcPoseChange)
              if r2_23 then
                r2_23()
              end
            end
          })
          return 
        end
      end
      r1_23:AddTimer(0.1, function()
        -- line: [473, 479] id: 29
        if r1_23.Mesh:GetAnimInstance():Montage_GetCurrentSection() == "SitLoop" then
          r1_23:RemoveTimer("SitToLoop")
          EventManager:FireEvent(EventID.OnNpcPoseChange)
        end
      end, true, 0, "SitToLoop")
    end
  })
  r1_23:AddTimer(3, function()
    -- line: [481, 490] id: 30
    local r0_30 = r1_23.Mesh:GetAnimInstance():IsPlayingMontagesContainsSection("SitLoop")
    if r1_23:GetMovementComponent() and r1_23:GetMovementComponent().OnNpcSeatingEnd then
      r1_23:GetMovementComponent():OnNpcSeatingEnd(EMovementMode.MOVE_NavWalking)
    end
    if r0_30 then
      r1_23:SetNpcMovementTickEnable(false)
      r1_23:RemoveTimer("DelayCloseNpcMovementTickBySit")
    end
  end, true, 0, "DelayCloseNpcMovementTickBySit")
end
function r0_0.CloseMechanismWithoutInteractive(r0_31, r1_31, r2_31)
  -- line: [493, 536] id: 31
  r1_31:GetMovementComponent().bAllowPhysicsRotationDuringAnimRootMotion = true
  r1_31:SetNpcMovementTickEnable(true)
  local r3_31 = r0_31:NpcGetLeavingPoint(r1_31)
  r0_31.PlayerAndSeat[r1_31.Eid].EnterType = r3_31.Type
  r0_31:SetLeavingParam(r1_31, r0_31.PlayerAndSeat[r1_31.Eid], r3_31)
  local r4_31 = "SitEnd" .. r0_31.PlayerAndSeat[r1_31.Eid].EnterType
  if r1_31.NpcId and DataMgr.Npc[r1_31.NpcId] and DataMgr.Npc[r1_31.NpcId].SpecialSit then
    r4_31 = "SitEnd"
  end
  r1_31.Mesh:GetAnimInstance():Montage_JumpToSection(r4_31)
  if r1_31.Mesh:GetAnimInstance() and r1_31.Mesh:GetAnimInstance().GetMontageSectionTime then
    r1_31:AddTimer(r1_31.Mesh:GetAnimInstance():GetMontageSectionTime(r4_31), function()
      -- line: [522, 534] id: 32
      if r2_31 then
        r2_31()
      end
      r0_31.PlayerAndSeat[r1_31.Eid].IsUsed = false
      r0_31.PlayerAndSeat[r1_31.Eid] = nil
      EventManager:FireEvent(EventID.OnNpcPoseChange)
      r1_31:AddTimer(3, function()
        -- line: [528, 531] id: 33
        r1_31:SetNpcMovementTickEnable(false)
        r1_31:RemoveTimer("DelayCloseNpcMovementTickByStand")
      end, true, 0, "DelayCloseNpcMovementTickByStand")
      r1_31:SetCharacterTag("Idle")
      r1_31:RemoveTimer("StandCallBackTimer")
    end, false, 0, "StandCallBackTimer")
  end
end
function r0_0.CloseMechanismWithoutMontage(r0_34, r1_34)
  -- line: [538, 568] id: 34
  r1_34:GetMovementComponent().bAllowPhysicsRotationDuringAnimRootMotion = true
  local r2_34 = r0_34:NpcGetLeavingPoint(r1_34)
  if r2_34 then
    r0_34.PlayerAndSeat[r1_34.Eid].EnterType = r2_34.Type
    r0_34:SetLeavingParam(r1_34, r0_34.PlayerAndSeat[r1_34.Eid], r2_34)
    local r3_34 = r2_34:K2_GetComponentLocation()
    r3_34.Z = r3_34.Z + r1_34.CapsuleComponent.CapsuleHalfHeight + 2
    r1_34:K2_SetActorLocation(r3_34, false, nil, false)
  else
    r1_34:K2_SetActorLocation(r1_34.RootComponent:K2_GetComponentLocation() + r1_34:GetActorForWardVector() * 50, false, nil, false)
  end
  local r3_34 = r1_34.Mesh:GetAnimInstance():GetCurrentActiveMontage()
  if r3_34 then
    r1_34.Mesh:GetAnimInstance():Montage_Stop(0, r3_34)
  end
  if IsValid(r0_34.PlayerAndSeat[r1_34.Eid]) then
    r0_34.PlayerAndSeat[r1_34.Eid].IsUsed = false
  end
  r0_34.PlayerAndSeat[r1_34.Eid] = nil
  r1_34:SetCharacterTag("Idle")
  if r1_34.SetNpcMovementTickEnable then
    r1_34:SetNpcMovementTickEnable(false)
  end
end
function r0_0.OpenMechanismNpcSpecial(r0_35, r1_35, r2_35)
  -- line: [571, 586] id: 35
  if not r1_35 then
    return 
  end
  if not r0_35.InitSuccess then
    r0_35.CacheOpenMechanismWithoutInteractive = {
      CharacterEid = r1_35.Eid,
      CallBackFunc = r2_35,
      SourceFunc = r0_35.OpenMechanismNpcSpecial,
    }
    return 
  end
  local r3_35 = r0_35:FindPoint(r1_35.Eid)
  if r3_35 then
    r3_35.IsUsed = true
    r3_35.EnterType = "F"
    r0_35.PlayerAndSeat[r1_35.Eid] = r3_35
  end
  return r3_35
end
function r0_0.CloseMechanismNpcSpecial(r0_36, r1_36, r2_36)
  -- line: [588, 593] id: 36
  if IsValid(r0_36.PlayerAndSeat[r1_36.Eid]) then
    r0_36.PlayerAndSeat[r1_36.Eid].IsUsed = false
  end
  r0_36.PlayerAndSeat[r1_36.Eid] = nil
end
function r0_0.SpecialRegionOnlineStartLogic(r0_37, r1_37)
  -- line: [596, 619] id: 37
  local r2_37 = GWorld:GetAvatar()
  local r3_37 = UE4.UGameplayStatics.GetPlayerCharacter(r0_37, 0)
  if not r2_37 or not r1_37 then
    return 
  end
  print(_G.LogTag, "LXZ SpecialRegionOnlineStartLogic", r1_37:GetName())
  local r4_37 = r0_37.PlayerAndSeat[r1_37.Eid] and r0_37:FindPoint(r1_37.Eid)
  if not r4_37 then
    return 
  end
  print(_G.LogTag, "LXZ SpecialRegionOnlineStartLogic111", r0_37.UniqueId, r0_37.SenderId)
  local r5_37 = r4_37.Index
  local r6_37 = r2_37.Eid
  if r0_37.SenderId and r0_37.SenderId ~= "" then
    print(_G.LogTag, "LXZ SpecialRegionOnlineStartLogic222", r0_37.UniqueId)
    r6_37 = CommonUtils.Str2ObjId(r0_37.SenderId)
  end
  r2_37:RequestChangeRegionOnlineItemState(r2_37.CurrentOnlineType, r0_37.UniqueId, r6_37, r5_37, r0_37.StateId, r0_37.BpBorn)
end
function r0_0.SpecialRegionOnlineEndLogic(r0_38, r1_38)
  -- line: [622, 640] id: 38
  local r2_38 = GWorld:GetAvatar()
  local r3_38 = UE4.UGameplayStatics.GetPlayerCharacter(r0_38, 0)
  if not r2_38 or not r1_38 then
    return 
  end
  print(_G.LogTag, "LXZ SpecialRegionOnlineEndLogic", r1_38:GetName())
  local r4_38 = r0_38.PlayerAndSeat[r1_38.Eid]
  if not r4_38 then
    return 
  end
  print(_G.LogTag, "LXZ SpecialRegionOnlineEndLogic111", r0_38.SenderId)
  local r5_38 = r4_38.Index
  local r6_38 = r2_38.Eid
  if r0_38.SenderId and r0_38.SenderId ~= "" then
    r6_38 = CommonUtils.Str2ObjId(r0_38.SenderId)
  end
  r2_38:RequestLeaveRegionOnlineItem(r2_38.CurrentOnlineType, r0_38.UniqueId, r6_38, r5_38)
end
function r0_0.IsCanOnlineInteractive(r0_39, r1_39)
  -- line: [642, 667] id: 39
  if not r1_39 then
    return false
  end
  if UE4.UGameplayStatics.GetPlayerCharacter(r0_39, 0) ~= r1_39 then
    return true
  end
  if (r1_39:K2_GetActorLocation() - r0_39:K2_GetActorLocation()):Size() >= 800 then
    return false
  end
  if not r0_39.ChestInteractiveComponent:CheckPlayerTag(r1_39) then
    return false
  end
  if r1_39:GetIsInDelivery() then
    ScreenPrint("玩家传送中，不允许坐下")
    return false
  end
  if USubsystemBlueprintLibrary.GetWorldSubsystem(GWorld.GameInstance, UTalkSubsystem):IsInImmersiveStory() then
    ScreenPrint("玩家剧情中，不允许坐下")
    return false
  end
  return true
end
function r0_0.GetValidPoint(r0_40)
  -- line: [670, 684] id: 40
  local r1_40 = {}
  for r6_40, r7_40 in pairs(r0_40.PointArray) do
    local r8_40 = true
    local r9_40 = 0
    for r14_40, r15_40 in pairs(r0_40.PlayerAndSeat) do
      if r15_40.Index == r7_40.Index then
        r8_40 = false
        r9_40 = r14_40
      end
    end
    -- close: r10_40
    r1_40[r7_40.Index] = {
      Valid = r8_40,
      Eid = r9_40,
    }
  end
  -- close: r2_40
  return r1_40
end
return r0_0
