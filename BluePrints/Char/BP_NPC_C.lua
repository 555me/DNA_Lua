-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Char\BP_NPC_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("DataMgr")
require("UnLua")
local r0_0 = require("Utils.MiscUtils")
local r1_0 = require("BluePrints.Story.Talk.Component.SoundOralComponent").FSoundOralComponent
local r2_0 = require("BluePrints.Story.StoryPlayableUtils").StoryPlayableUtils
local r3_0 = require("BluePrints.Common.ClientEvent.ClientEventUtils")
local r4_0 = Class({
  "BluePrints.Char.BP_NpcCharacterBase_C"
})
local r5_0 = UE.EStoryLogType.NPC
function r4_0.ReceiveBeginPlay(r0_1)
  -- line: [24, 80] id: 1
  rawset(r0_1, "AutoSyncProp", r0_1.AutoSyncProp)
  EventManager:AddEvent(EventID.OnBattleReady, r0_1, r0_1.OnBattleReady_TryInitCharacterInfo)
  EventManager:AddEvent(EventID.EnableNpcSideBubble, r0_1, r0_1.TryEnableNpcSideBubble)
  EventManager:AddEvent(EventID.OnNpcEnterOrQuitSpecialQuest, r0_1, r0_1.UpdateNpcSpecialState)
  r0_1.LuaTimerHandles = {}
  if IsValid(r0_1.NS_NPC_Weita) and CommonUtils.GetDeviceTypeByPlatformName(r0_1) == "Mobile" then
    r0_1.NS_NPC_Weita:K2_DestroyComponent(r0_1)
    DebugPrint("NS_NPC_Weita Destroyed")
  end
  r0_1.IsDestroied = false
  r0_1.IsShowSideIndicator = false
  r0_1.IsInSpecialQuest = false
  r0_1.IsNeedCollapsedOtherBubble = false
  if not IsAuthority(r0_1) then
    r0_1.InitTags:Add("WaitForInitComponent", false)
    r0_1:AddTimer(0.01, r0_1.RemoveWaitInitTagInitComponent, false, 0.01, "RemoveWaitInitTagInitComponent")
  end
end
function r4_0.RemoveWaitInitTagInitComponent(r0_2)
  -- line: [82, 84] id: 2
  r0_2:TryInitCharacterInfo("WaitForInitComponent")
end
function r4_0.OnBattleReady_TryInitCharacterInfo(r0_3, r1_3)
  -- line: [86, 90] id: 3
  if Battle(r0_3) == r1_3 then
    r0_3:TryInitCharacterInfo("Battle")
  end
end
function r4_0.AuthorityInitInfo(r0_4, r1_4)
  -- line: [93, 98] id: 4
  r4_0.Super.AuthorityInitInfo(r0_4, r1_4)
  if r0_4.NpcAnimInstance then
    r0_4.NpcAnimInstance.CanTurn = r0_4.CanTurn
  end
end
function r4_0.CommonInitInfo(r0_5, r1_5)
  -- line: [100, 103] id: 5
  r4_0.Super.CommonInitInfo(r0_5, r1_5)
  r0_5:InitInfo(r1_5)
end
function r4_0.OnCharacterReady(r0_6, r1_6)
  -- line: [111, 113] id: 6
  r4_0.Super.OnCharacterReady(r0_6, r1_6)
end
function r4_0.ReceiveOnCharacterReady(r0_7)
  -- line: [115, 126] id: 7
  if r0_7.UnitId == 818054 then
    local r1_7 = r3_0:GetCurrentDoingDynamicEvent()
    if r1_7 and (r1_7.DynamicQuestId == 207315 or r1_7.DynamicQuestId == 207345 or r1_7.DynamicQuestId == 207355) then
      r0_7:AddTimer(2, function()
        -- line: [119, 123] id: 8
        if r0_7:GetMovementComponent() and r0_7:GetMovementComponent().MovementMode == EMovementMode.MOVE_None then
          r0_7:GetMovementComponent():SetMovementMode(EMovementMode.Move_NavWalking)
        end
      end, true, 0, "TempSetMoveMode")
    end
  end
end
function r4_0.OverrideOnPostInitSucc(r0_9, r1_9)
  -- line: [146, 148] id: 9
  r0_9.OnPostInitSucc = r1_9
end
function r4_0.JointFinalAnimPath(r0_10, r1_10, r2_10)
  -- line: [150, 161] id: 10
  local r3_10 = DataMgr.Npc[r1_10].ModelId
  assert(r3_10, "Can\'t find model id for npc: " .. r1_10)
  local r4_10 = DataMgr.Model[r3_10]
  local r6_10 = r4_10.MontagePrefix
  local r7_10 = string.gsub(r4_10.MontageFolder, "Montage", "Sequence")
  DebugPrint(r1_10, r3_10, "SequenceFolder", r7_10, "Prefix", r6_10)
  return r7_10 .. "Interactive/" .. r6_10 .. r2_10
end
function r4_0.JointFinalAnimPathMechInteractive(r0_11, r1_11, r2_11)
  -- line: [163, 174] id: 11
  local r3_11 = DataMgr.Npc[r1_11].ModelId
  assert(r3_11, "Can\'t find model id for npc: " .. r1_11)
  local r4_11 = DataMgr.Model[r3_11]
  local r6_11 = r4_11.MontagePrefix
  local r7_11 = string.gsub(r4_11.MontageFolder, "Montage", "Sequence")
  DebugPrint(r1_11, r3_11, "SequenceFolder", r7_11, "Prefix", r6_11)
  return r7_11 .. "Interactive/MechInteractive/" .. r6_11 .. r2_11
end
function r4_0.AuthorityCommonInitMonsterInfo(r0_12)
  -- line: [176, 178] id: 12
  r4_0.Super.AuthorityCommonInitMonsterInfo(r0_12)
end
function r4_0.ReceiveEndPlay(r0_13)
  -- line: [199, 212] id: 13
  r4_0.Super.ReceiveEndPlay(r0_13)
  EventManager:RemoveEvent(EventID.EnableNpcSideBubble, r0_13)
  EventManager:RemoveEvent(EventID.TalkEnableMonsterSpawn, r0_13)
  EventManager:RemoveEvent(EventID.OnNpcEnterOrQuitSpecialQuest, r0_13)
  UE4.UGameplayStatics.GetGameState(r0_13):RecordNpcEntity(r0_13, false)
  if r0_13.IsSitting then
    r0_13:SetIdlePose(nil, nil)
  end
  r0_13:UnRegisterHeadUI()
  r0_13.IsDestroied = true
end
function r4_0.ForceResetDynamics(r0_14, r1_14)
  -- line: [214, 230] id: 14
  if r0_14.Mesh and r0_14.EnableResetPhysic then
    if r1_14 then
      r0_14.Mesh:ResetAnimInstanceDynamics(ETeleportType.ResetPhysics)
      return 
    end
    if UE4.UKismetMathLibrary.Vector_DistanceSquared(r0_14.LastFloorResultLoc, r0_14.RootComponent.RelativeLocation) >= 100 then
      r0_14.Mesh:ResetAnimInstanceDynamics(ETeleportType.ResetPhysics)
    end
  end
end
function r4_0.ResetDynamicsWithCurrentMontageSection(r0_15, r1_15, r2_15)
  -- line: [232, 243] id: 15
  if r0_15.CurrentAnimationMontageSectionName == "" then
    return 
  end
  if r0_15.CurrentAnimationMontageSectionName == r1_15 then
    return 
  end
  DebugPrint("LHQPlayMontage DoRest NewMontageName:", r1_15, "Section:", r2_15, "CurrentNewMontageName:", r0_15.CurrentAnimationMontageSectionName)
  if r0_15.Mesh then
    r0_15.Mesh:ResetAnimInstanceDynamics(ETeleportType.ResetPhysics)
  end
end
function r4_0.CheckCanPart(r0_16)
  -- line: [251, 253] id: 16
  return true
end
function r4_0.StartTalkContext(r0_17, r1_17, r2_17)
  -- line: [259, 261] id: 17
  r0_17.NpcTalkInteractiveComponent:StartTalkContext(r1_17, r2_17)
end
function r4_0.IsCustomNPC(r0_18)
  -- line: [263, 265] id: 18
  return r0_18.Hair_SM ~= nil
end
function r4_0.StartOral(r0_19, r1_19, r2_19)
  -- line: [267, 272] id: 19
  r0_19:StopOral(r0_19.CurrentVoiceName)
  r0_19.CurrentVoiceName = r1_19
  r0_19:BeginLipSync(r2_19)
end
function r4_0.StopOral(r0_20, r1_20)
  -- line: [274, 280] id: 20
  if r0_20.CurrentVoiceName ~= r1_20 then
    return 
  end
  r0_20:EndLipSync()
end
function r4_0.StartSequentialDialogueLipSync(r0_21, r1_21)
  -- line: [283, 291] id: 21
  if not r0_21.SoundOralComponent then
    r0_21.SoundOralComponent = r1_0.New()
  end
  r0_21.CurrentDialogueSequentialId = r1_21
  r0_21.LipSyncComponent.OnBlendStop:Add(r0_21, r0_21.DialogueNextLipSync)
  r0_21:DialogueNextLipSync()
end
function r4_0.DialogueNextLipSync(r0_22)
  -- line: [293, 313] id: 22
  local r1_22 = DataMgr.Dialogue[r0_22.CurrentDialogueSequentialId]
  if not r1_22 then
    r0_22:StopSequentialDialogueLipSync()
    return 
  end
  local r2_22 = r1_22.VoiceName
  if not r2_22 then
    r0_22:StopSequentialDialogueLipSync()
    return 
  end
  local r3_22 = nil
  if not r1_22.DisableMouth then
    r3_22 = r0_22
  end
  r0_22.SoundOralComponent:PlaySoundWithOral(AudioManager(r0_22), r2_22, r3_22)
  r0_22.CurrentDialogueSequentialId = r0_22.CurrentDialogueSequentialId + 1
end
function r4_0.StopSequentialDialogueLipSync(r0_23)
  -- line: [315, 318] id: 23
  r0_23.LipSyncComponent.OnBlendStop:Remove(r0_23, r0_23.DialogueNextLipSync)
  r0_23.CurrentDialogueSequentialId = nil
end
function r4_0.IsNeedHideInTalk(r0_24)
  -- line: [320, 322] id: 24
  return false
end
function r4_0.SetSitPoseInteractive(r0_25, r1_25, r2_25)
  -- line: [324, 359] id: 25
  if r0_25.IsSitting == true then
    EventManager:FireEvent(EventID.OnNpcPoseChange)
    return 
  end
  r0_25.IsSitting = true
  local r3_25 = TArray(AActor)
  local r4_25 = UE4.AMechanismBase
  UE4.UKismetSystemLibrary.BoxOverlapActors(r0_25, r0_25:K2_GetActorLocation(), FVector(50, 50, 150), nil, r4_25, nil, r3_25)
  if r3_25:Length() > 0 then
    r0_25.CurrentSeat = r3_25[1]
    r0_25.CurrentSeat:OpenMechanismWithoutInteractive(r0_25, r1_25, r2_25)
  else
    UE4.UKismetSystemLibrary.BoxOverlapActors(r0_25, r0_25:K2_GetActorLocation(), FVector(100, 100, 150), nil, r4_25, nil, r3_25)
    if r3_25:Length() > 0 then
      r0_25.CurrentSeat = r3_25[1]
      r0_25.CurrentSeat:OpenMechanismWithoutInteractive(r0_25, r1_25, r2_25)
    else
      r0_25.MaxCounter = 0
      r0_25:AddTimer(5, function()
        -- line: [343, 355] id: 26
        DebugPrint("RunSafe Sit NpcUnitId:", r0_25.UnitId, r0_25:GetName())
        UE4.UKismetSystemLibrary.BoxOverlapActors(r0_25, r0_25:K2_GetActorLocation(), FVector(100, 100, 150), nil, r4_25, nil, r3_25)
        r0_25.MaxCounter = r0_25.MaxCounter + 1
        if r0_25.MaxCounter > 20 then
          r0_25:RemoveTimer("SafeSit")
        end
        if r3_25:Length() > 0 then
          r0_25.CurrentSeat = r3_25[1]
          r0_25.CurrentSeat:OpenMechanismWithoutInteractive(r0_25, r1_25, r2_25)
          r0_25:RemoveTimer("SafeSit")
        end
      end, true, 0, "SafeSit")
      EventManager:FireEvent(EventID.OnNpcPoseChange)
    end
  end
end
function r4_0.SetSitPoseWithoutInteractive(r0_27, r1_27, r2_27)
  -- line: [361, 468] id: 27
  if r0_27.IsSitting == true then
    EventManager:FireEvent(EventID.OnNpcPoseChange)
    return 
  end
  r0_27.IsSitting = true
  r0_27.IsSpecialSit = true
  r0_27:SetCharacterTag("Seating")
  r0_27.CapsuleComponent:IgnoreActorWhenMoving(r0_27, true)
  local r3_27 = TArray(AActor)
  local r4_27 = TArray(AActor)
  UE4.UKismetSystemLibrary.BoxOverlapActors(r0_27, r0_27.RootComponent:K2_GetComponentLocation(), FVector(80, 80, 30), nil, UE4.AStaticMeshActor, nil, r4_27)
  for r10_27, r11_27 in pairs(r4_27) do
    if r11_27 then
      r0_27.CapsuleComponent:IgnoreActorWhenMoving(r11_27, true)
      r3_27:Add(r11_27)
    end
  end
  -- close: r6_27
  local r6_27 = TArray(AActor)
  UE4.UKismetSystemLibrary.BoxOverlapActors(r0_27, r0_27.RootComponent:K2_GetComponentLocation(), FVector(80, 80, 30), nil, UE4.AMechanismBase, nil, r6_27)
  for r12_27, r13_27 in pairs(r6_27) do
    if r13_27 then
      r0_27.CapsuleComponent:IgnoreActorWhenMoving(r13_27, true)
      r3_27:Add(r13_27)
    end
  end
  -- close: r8_27
  r0_27:GetMovementComponent():LockMovementMode(true, EMovementMode.Move_NavWalking)
  if r0_27:GetMovementComponent() then
    r0_27:GetMovementComponent().GravityScale = 0
    if not r0_27:GetMovementComponent():IsComponentTickEnabled() then
      r0_27:GetMovementComponent():SetComponentTickEnabled(true)
    end
  end
  r0_27:ResetLocation(r3_27)
  if r0_27.NpcAnimInstance then
    r0_27.NpcAnimInstance.EnableDataFootIK = false
  end
  local r8_27 = DataMgr.Npc[r0_27.UnitId].DefaultAction
  local r9_27 = nil
  if r0_27.StaticCreatorDefaultActionIndex and r0_27.StaticCreatorDefaultActionIndex > 0 and r8_27 and r8_27[r0_27.StaticCreatorDefaultActionIndex] then
    r9_27 = r8_27[r0_27.StaticCreatorDefaultActionIndex]
  end
  if r0_27.UnitId and DataMgr.Npc[r0_27.UnitId] and DataMgr.Npc[r0_27.UnitId].SpecialSit then
    r9_27 = DataMgr.Npc[r0_27.UnitId].SpecialSit
  end
  if r2_27 == nil or r2_27 == false then
    r0_27:PlayTalkAction(r9_27, {
      r0_27,
      function()
        -- line: [416, 428] id: 28
        if r1_27 then
          r1_27()
        end
        r0_27:AddTimer(3, function()
          -- line: [420, 426] id: 29
          if r0_27.Mesh:GetAnimInstance():IsPlayingMontagesContainsSection("Loop") and r0_27.Mesh:GetAnimInstance():IsPlayingMontagesContainsSection("SitLoop") then
            r0_27:SetNpcMovementTickEnable(false)
            r0_27:RemoveTimer("DelayCloseNpcMovementTickBySit")
          end
        end, true, 0, "DelayCloseNpcMovementTickBySit")
        EventManager:FireEvent(EventID.OnNpcPoseChange)
      end
    })
  else
    local r10_27 = nil
    local r11_27 = "Interactive/"
    local r12_27 = DataMgr.TalkAction[r9_27]
    if r12_27 then
      r10_27 = r12_27.ActionMontage .. "_Montage"
      if r10_27 then
        r10_27 = r10_27
      end
      r11_27 = r12_27.MontagePrePath
      if r11_27 then
        r11_27 = r11_27
      end
    end
    UResourceLibrary.LoadObjectAsync(r0_27, r0_27:GetMontagePath(r11_27, r10_27), {
      r0_27,
      function(r0_30, r1_30)
        -- line: [439, 458] id: 30
        if r0_27.NpcAnimInstance then
          if r0_27.NpcAnimInstance:IsMontageHasSection(r1_30, "Loop") then
            UE4.UPlayMontageCallbackProxy.CreateProxyObjectForPlayMontage(r0_27.Mesh, r1_30, 1, 0, "Loop")
          elseif r0_27.NpcAnimInstance:IsMontageHasSection(r1_30, "SitLoop") then
            UE4.UPlayMontageCallbackProxy.CreateProxyObjectForPlayMontage(r0_27.Mesh, r1_30, 1, 0, "SitLoop")
          end
        end
        EventManager:FireEvent(EventID.OnNpcPoseChange)
        if r1_27 then
          r1_27()
        end
        r0_27:AddTimer(3, function()
          -- line: [451, 457] id: 31
          if r0_27.Mesh:GetAnimInstance():IsPlayingMontagesContainsSection("Loop") and r0_27.Mesh:GetAnimInstance():IsPlayingMontagesContainsSection("SitLoop") then
            r0_27:SetNpcMovementTickEnable(false)
            r0_27:RemoveTimer("DelayCloseNpcMovementTickBySit")
          end
        end, true, 0, "DelayCloseNpcMovementTickBySit")
      end
    })
    return 
  end
  r0_27:AddTimer(0.1, function()
    -- line: [461, 467] id: 32
    if r0_27.Mesh:GetAnimInstance():Montage_GetCurrentSection() == "SitLoop" then
      r0_27:RemoveTimer("SitToLoop")
      EventManager:FireEvent(EventID.OnNpcPoseChange)
    end
  end, true, 0, "SitToLoop")
end
function r4_0.SetSitPoseWithInteractiveAndNoDown(r0_33, r1_33)
  -- line: [470, 508] id: 33
  if r0_33.IsSitting == true then
    EventManager:FireEvent(EventID.OnNpcPoseChange)
    return 
  end
  r0_33.IsSitting = true
  local r2_33 = TArray(AActor)
  local r3_33 = UE4.AMechanismBase
  UE4.UKismetSystemLibrary.BoxOverlapActors(r0_33, r0_33:K2_GetActorLocation(), FVector(50, 50, 150), nil, r3_33, nil, r2_33)
  if r2_33:Length() > 0 then
    r0_33.CurrentSeat = r2_33[1]
    r0_33.CurrentSeat:OpenMechanismNpcSpecial(r0_33, r1_33)
    r0_33:RealSetSitPoseWithInteractiveAndNoDown(r1_33)
  else
    UE4.UKismetSystemLibrary.BoxOverlapActors(r0_33, r0_33:K2_GetActorLocation(), FVector(100, 100, 150), nil, r3_33, nil, r2_33)
    if r2_33:Length() > 0 then
      r0_33.CurrentSeat = r2_33[1]
      r0_33.CurrentSeat:OpenMechanismNpcSpecial(r0_33, r1_33)
      r0_33:RealSetSitPoseWithInteractiveAndNoDown(r1_33)
    else
      r0_33.MaxCounter = 0
      r0_33:AddTimer(5, function()
        -- line: [491, 504] id: 34
        DebugPrint("RunSafe Sit NpcUnitId:", r0_33.UnitId, r0_33:GetName())
        UE4.UKismetSystemLibrary.BoxOverlapActors(r0_33, r0_33:K2_GetActorLocation(), FVector(100, 100, 150), nil, r3_33, nil, r2_33)
        r0_33.MaxCounter = r0_33.MaxCounter + 1
        if r0_33.MaxCounter > 20 then
          r0_33:RemoveTimer("SafeSit")
        end
        if r2_33:Length() > 0 then
          r0_33.CurrentSeat = r2_33[1]
          r0_33.CurrentSeat:OpenMechanismNpcSpecial(r0_33, r1_33)
          r0_33:RealSetSitPoseWithInteractiveAndNoDown(r1_33)
          r0_33:RemoveTimer("SafeSit")
        end
      end, true, 0, "SafeSit")
      EventManager:FireEvent(EventID.OnNpcPoseChange)
    end
  end
end
function r4_0.RealSetSitPoseWithInteractiveAndNoDown(r0_35, r1_35)
  -- line: [510, 574] id: 35
  r0_35.IsSitting = true
  r0_35.IsSpecialSit = true
  r0_35:SetCharacterTag("Seating")
  r0_35.CapsuleComponent:IgnoreActorWhenMoving(r0_35, true)
  local r2_35 = TArray(AActor)
  UE4.UKismetSystemLibrary.BoxOverlapActors(r0_35, r0_35.RootComponent:K2_GetComponentLocation(), FVector(80, 80, 30), nil, UE4.AStaticMeshActor, nil, r2_35)
  for r8_35, r9_35 in pairs(r2_35) do
    if r9_35 then
      r0_35.CapsuleComponent:IgnoreActorWhenMoving(r9_35, true)
    end
  end
  -- close: r4_35
  local r4_35 = TArray(AActor)
  UE4.UKismetSystemLibrary.BoxOverlapActors(r0_35, r0_35.RootComponent:K2_GetComponentLocation(), FVector(80, 80, 30), nil, UE4.AMechanismBase, nil, r4_35)
  for r10_35, r11_35 in pairs(r4_35) do
    if r11_35 then
      r0_35.CapsuleComponent:IgnoreActorWhenMoving(r11_35, true)
    end
  end
  -- close: r6_35
  r0_35:GetMovementComponent():LockMovementMode(true, EMovementMode.Move_Walking)
  if r0_35:GetMovementComponent() then
    r0_35:GetMovementComponent().GravityScale = 0
    if not r0_35:GetMovementComponent():IsComponentTickEnabled() then
      r0_35:GetMovementComponent():SetComponentTickEnabled(false)
    end
  end
  r0_35:K2_SetActorLocation(r0_35.BrothLoc, false, nil, false)
  if r0_35.NpcAnimInstance then
    r0_35.NpcAnimInstance.EnableDataFootIK = false
  end
  local r6_35 = DataMgr.Npc[r0_35.UnitId].DefaultAction
  local r7_35 = nil
  if r0_35.StaticCreatorDefaultActionIndex and r0_35.StaticCreatorDefaultActionIndex > 0 and r6_35 and r6_35[r0_35.StaticCreatorDefaultActionIndex] then
    r7_35 = r6_35[r0_35.StaticCreatorDefaultActionIndex]
  end
  UResourceLibrary.LoadObjectAsync(r0_35, r0_35:GetNpcTalkActionPath(r7_35), {
    r0_35,
    function(r0_36, r1_36)
      -- line: [555, 566] id: 36
      if r1_36 then
        r0_0.PlayMontageBySkeletaMesh(r0_35, r0_35.Mesh, r1_36, {
          StartSec = "Loop",
        })
        if r1_35 then
          r1_35()
        end
        EventManager:FireEvent(EventID.OnNpcPoseChange)
      end
    end
  })
end
function r4_0.GetNpcTalkActionPath(r0_37, r1_37)
  -- line: [576, 591] id: 37
  local r2_37 = DataMgr.TalkAction[r1_37]
  if r2_37 == nil then
    Utils.ScreenPrint("ActionId 不存在:" .. tostring(r1_37))
    return ""
  end
  local r3_37 = ""
  local r4_37 = DataMgr.Model[r0_37.ModelId]
  if r2_37.MontagePrePath == nil or r2_37.MontagePrePath == "" then
    r3_37 = string.format("%sInteractive/%s%s_Montage", r4_37.MontageFolder, r4_37.MontagePrefix, r2_37.ActionMontage)
  else
    r3_37 = string.format("%s%s/%s%s_Montage", r4_37.MontageFolder, r2_37.MontagePrePath, r4_37.MontagePrefix, r2_37.ActionMontage)
  end
  return r3_37
end
function r4_0.MoveToSeat(r0_38, r1_38, r2_38)
  -- line: [593, 601] id: 38
  if r1_38 == nil or r2_38 == nil then
    DebugPrint("NPC Can not MoveToSeat Loc == nil or Rot == nil ", r0_38:GetName())
    return 
  end
  DebugPrint("NPC MoveToSeat:", r0_38:GetName())
  r0_38:GetMovementComponent().GravityScale = 0
  r0_38:K2_SetActorLocationAndRotation(r1_38, r2_38, false, nil, false)
end
function r4_0.SetIdlePose(r0_39, r1_39, r2_39)
  -- line: [603, 627] id: 39
  if r0_39.IsSitting == false then
    DebugPrint("NPC Was already Standing :", r0_39:GetName(), r0_39.UnitId)
    EventManager:FireEvent(EventID.OnNpcPoseChange)
    return 
  end
  r0_39.IsSitting = false
  if r0_39.UnitId and DataMgr.Npc[r0_39.UnitId] and DataMgr.Npc[r0_39.UnitId].SpecialSit and DataMgr.Npc[r0_39.UnitId].IsSit == 2 then
    r0_39:RealSetIdlePoseBySpecialSit(r2_39)
    return 
  end
  if not r0_39.CurrentSeat then
    print(_G.LogTag, "Error: LXZ not self.CurrentSeat")
    EventManager:FireEvent(EventID.OnNpcPoseChange)
    return 
  end
  if r1_39 then
    r0_39.CurrentSeat:CloseMechanismWithoutInteractive(r0_39, r2_39)
  else
    r0_39.CurrentSeat:CloseMechanismWithoutMontage(r0_39)
  end
end
function r4_0.RealSetIdlePoseBySpecialSit(r0_40, r1_40, r2_40)
  -- line: [629, 681] id: 40
  if r0_40.IsSitting == true then
    r0_40.IsSitting = false
  end
  r0_40:GetMovementComponent().bAllowPhysicsRotationDuringAnimRootMotion = true
  if (r2_40 == nil or r2_40 == false) and r0_40.NpcAnimInstance then
    if r0_40.NpcAnimInstance:IsPlayingMontagesSection("End") then
      r0_40.Mesh:GetAnimInstance():Montage_JumpToSection("End")
    elseif r0_40.NpcAnimInstance:IsPlayingMontagesSection("SitEnd") then
      r0_40.Mesh:GetAnimInstance():Montage_JumpToSection("SitEnd")
    end
  elseif r0_40.NpcAnimInstance then
    if r0_40.NpcAnimInstance:IsPlayingMontagesSection("End") then
      r0_40.Mesh:GetAnimInstance():Montage_JumpToSectionsEnd("End")
    elseif r0_40.NpcAnimInstance:IsPlayingMontagesSection("SitEnd") then
      r0_40.Mesh:GetAnimInstance():Montage_JumpToSectionsEnd("SitEnd")
    end
  end
  r0_40.IsSpecialSit = false
  r0_40:SetNpcMovementTickEnable(true)
  function r0_40.StandCallBack()
    -- line: [668, 679] id: 41
    if r1_40 then
      r1_40()
    end
    EventManager:FireEvent(EventID.OnNpcPoseChange)
    r0_40:SetCharacterTag("Idle")
    if r0_40.SetNpcMovementTickEnable then
      r0_40:SetNpcMovementTickEnable(false)
    end
    r0_40.Mesh:GetAnimInstance().OnMontageEnded:Remove(r0_40, r0_40.StandCallBack)
    r0_40:GetMovementComponent():LockMovementMode(false, EMovementMode.Move_Walking)
  end
  r0_40.Mesh:GetAnimInstance().OnMontageEnded:Add(r0_40, r0_40.StandCallBack)
end
function r4_0.InitNpcInteractiveComponent(r0_42)
  -- line: [683, 707] id: 42
  local r1_42 = DataMgr[r0_42.UnitType][r0_42.UnitId]
  if not r1_42 then
    return 
  end
  local r6_42 = nil	-- notice: implicit variable refs by block#[10]
  local r7_42 = nil	-- notice: implicit variable refs by block#[10]
  if r1_42.InteractiveInfo then
    for r6_42, r7_42 in pairs(r1_42.InteractiveInfo) do
      if DataMgr.InteractiveInfo[r6_42].BPPath then
        UResourceLibrary.LoadClassAsync(r0_42, DataMgr.InteractiveInfo[r6_42].BPPath, {
          r0_42,
          function(r0_43, r1_43)
            -- line: [692, 694] id: 43
            r0_42:OnInteractiveComponentClassLoaded(r1_43, r7_42, r6_42)
          end
        })
      end
      -- close: r6_42
    end
    -- close: r2_42
  end
  if r1_42.NpcBiographyId then
    local r2_42 = DataMgr.NpcBiography[r1_42.NpcBiographyId]
    local r3_42 = UResourceLibrary.LoadClassAsync
    local r4_42 = r0_42
    local r5_42 = DataMgr.InteractiveInfo.Biography.BPPath
    r6_42 = {}
    r7_42 = r0_42
    local function r8_42(r0_44, r1_44)
      -- line: [702, 704] id: 44
      r0_42:OnInteractiveComponentClassLoaded(r1_44, 100011, "Biography")
    end
    -- setlist for #6 failed
    r3_42(r4_42, r5_42, r6_42)
  end
end
function r4_0.ReinitDefaultFacial(r0_45)
  -- line: [710, 712] id: 45
  r0_45:NewInitDefaultFacial()
end
function r4_0.InitDefaultFacial(r0_46)
  -- line: [714, 720] id: 46
  local r1_46 = DataMgr.Npc[r0_46.UnitId]
  if r1_46 and r1_46.DefaultExpression then
    DebugPrint("BP_NPC_C:InitDefaultFacial", r0_46:GetName(), r0_46.UnitId)
    r0_46:NewPlayFacial(r1_46.DefaultExpression)
  end
end
function r4_0.NewPlayAction(r0_47, r1_47)
  -- line: [730, 732] id: 47
  r0_47:PlayTalkAction(r1_47)
end
function r4_0.PlayDefaultAnimation(r0_48, r1_48)
  -- line: [734, 745] id: 48
  local r2_48 = DataMgr.Npc[r0_48.UnitId]
  if r2_48 and r2_48.DefaultAction then
    DebugPrint("BP_NPC_C:PlayDefaultAnimation", r0_48:GetName(), r0_48.UnitId)
    local r3_48 = r2_48.DefaultAction
    local r4_48 = nil
    if r0_48.StaticCreatorDefaultActionIndex and r0_48.StaticCreatorDefaultActionIndex > 0 and r3_48 and r3_48[r0_48.StaticCreatorDefaultActionIndex] then
      r4_48 = r3_48[r0_48.StaticCreatorDefaultActionIndex]
    end
    r0_48:PlayTalkAction(r4_48, r1_48)
  end
end
function r4_0.StopDefaultAnimation(r0_49)
  -- line: [747, 758] id: 49
  local r1_49 = DataMgr.Npc[r0_49.UnitId]
  if r1_49 and r1_49.DefaultAction then
    DebugPrint("BP_NPC_C:StopDefaultAnimation", r0_49:GetName(), r0_49.UnitId)
    local r2_49 = r1_49.DefaultAction
    local r3_49 = nil
    if r0_49.StaticCreatorDefaultActionIndex and r0_49.StaticCreatorDefaultActionIndex > 0 and r2_49 and r2_49[r0_49.StaticCreatorDefaultActionIndex] then
      r3_49 = r2_49[r0_49.StaticCreatorDefaultActionIndex]
    end
    r0_49:StopTalkAction(r3_49)
  end
end
function r4_0.PlayDefaultAnimStartAnimation(r0_50, r1_50)
  -- line: [760, 786] id: 50
  local r3_50 = DataMgr.Npc[r0_50.UnitId].DefaultAction
  local r4_50 = nil
  if r0_50.StaticCreatorDefaultActionIndex and r0_50.StaticCreatorDefaultActionIndex > 0 and r3_50 and r3_50[r0_50.StaticCreatorDefaultActionIndex] then
    r4_50 = r3_50[r0_50.StaticCreatorDefaultActionIndex]
  end
  if r4_50 and DataMgr.TalkAction[r4_50] and DataMgr.TalkAction[r4_50].AnimationId then
    UResourceLibrary.LoadObjectAsync(r0_50, r0_50:GetNpcTalkActionPath(r0_50:GetStartOrEndAnimtionName(DataMgr.TalkAction[r4_50].AnimationId, "Start")), {
      r0_50,
      function(r0_51, r1_51)
        -- line: [771, 779] id: 51
        if r1_51 then
          r0_0.PlayMontageBySkeletaMesh(r0_50, r0_50.Mesh, r1_51, {
            StartSec = "Start",
            OnCompleted = r1_50,
          })
        end
      end
    })
  elseif r1_50 then
    r1_50()
  end
end
function r4_0.PlayTalkGroupEndAnimation(r0_52, r1_52)
  -- line: [788, 822] id: 52
  if r0_52.CurrentTalkGroupMontageName ~= nil then
    local r3_52 = r0_52:GetNpcTalkActionPath(r0_52:GetStartOrEndAnimtionName(r0_52.CurrentTalkGroupMontageName, "End"))
    if r3_52 ~= "" then
      UResourceLibrary.LoadObjectAsync(r0_52, r3_52, {
        r0_52,
        function(r0_53, r1_53)
          -- line: [794, 810] id: 53
          if r1_53 and r0_52.NpcAnimInstance and r0_52.NpcAnimInstance:Montage_IsPlaying(r1_53) then
            r0_52.NpcAnimInstance:Montage_JumpToSection("End")
            r0_52:AddTimer(r0_52.NpcAnimInstance:GetMontageSectionTime("End"), function()
              -- line: [798, 804] id: 54
              if r1_52 then
                r1_52()
              end
              r0_52:RemoveTimer("EndAnimationBackTimer")
            end, false, 0, "EndAnimationBackTimer")
          elseif r1_52 then
            r1_52()
          end
        end
      })
    elseif r1_52 then
      r1_52()
    end
  elseif r1_52 then
    r1_52()
  end
end
function r4_0.GetStartOrEndAnimtionName(r0_55, r1_55, r2_55)
  -- line: [824, 840] id: 55
  local r3_55 = string.match(r1_55, ".*()_")
  if r3_55 then
    local r5_55 = string.sub(r1_55, 1, r3_55 + -1) .. "_" .. r2_55
    if DataMgr.TalkAction[r5_55] then
      return r5_55
    else
      return ""
    end
  else
    return ""
  end
end
function r4_0.OnInteractiveComponentClassLoaded(r0_56, r1_56, r2_56, r3_56)
  -- line: [842, 851] id: 56
  local r4_56 = r0_56:AddInteractiveComponent(r1_56)
  if not IsValid(r4_56) then
    return 
  end
  r4_56:InitCommonUIConfirmID(r2_56)
  if r3_56 then
    r0_56[r3_56 .. "Component"] = r4_56
  end
end
function r4_0.GetFreeCameraOffset(r0_57)
  -- line: [855, 857] id: 57
  return r0_57.NpcTalkInteractiveComponent:GetSimpleTalkCenterOffset()
end
function r4_0.PlayTalkSound(r0_58, r1_58, r2_58)
  -- line: [861, 877] id: 58
  if r1_58 == nil then
    DebugPrint("Error: Play talk sound failed, sound path is nil.")
    return 
  end
  if not r2_58 then
    r2_58 = true
  end
  local r3_58 = AudioManager(r0_58)
  if r3_58 == nil then
    DebugPrint("Error: Play talk sound failed, AudioManager is nil.")
  end
  local r5_58 = "event:/" .. string.gsub(r1_58, "%$Locale%$", r3_58:GetLanguage())
  r3_58:PlayNormalSound(r0_58, UE4.UFMODBlueprintStatics.FindEventbyName(r5_58), r5_58, Const.TalkSoundKey, r2_58)
end
function r4_0.StopTalkSound(r0_59)
  -- line: [879, 883] id: 59
  local r1_59 = AudioManager(r0_59)
  assert(r1_59, "Stop talk sound failed, AudioManager is nil.")
  r1_59:StopSound(r0_59, Const.TalkSoundKey)
end
function r4_0.PlayFacial(r0_60, r1_60)
  -- line: [885, 904] id: 60
  local r2_60 = DataMgr.Facial[r1_60]
  if r2_60 == nil then
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, r5_0, "表情数据缺失/配置错误", string.format("找不到表情数据，NpcId: %s，表情Id: %s", r0_60.NpcData.UnitId, r1_60))
    return 
  end
  if r2_60.NpcEye then
    r0_60:PlayFacialMontage(r2_60.NpcEye, r2_60.Eye1BlendInTime, nil, true)
  end
  if r2_60.NpcMouth then
    r0_60:PlayFacialMontage(r2_60.NpcMouth, nil, nil, true)
  end
  if r2_60.SoundBaseMouth then
    r0_60:PlayFacialMontage(r2_60.SoundBaseMouth, nil, nil, true)
  end
end
function r4_0.StopFacial(r0_61)
  -- line: [906, 912] id: 61
  if r0_61.NpcAnimInstance == nil then
    return 
  end
  r0_61.NpcAnimInstance:Montage_StopGroupByName(0, Const.CharacterFacialMouthMontageGroupName)
  r0_61.NpcAnimInstance:Montage_StopGroupByName(0, Const.CharacterFacialEyeMontageGroupName)
end
function r4_0.PlayFacialMontage(r0_62, r1_62, r2_62, r3_62, r4_62)
  -- line: [914, 958] id: 62
  if r1_62 == nil then
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, r5_0, "表情蒙太奇资源缺失/配置错误", string.format("Play facial montage failed, montage name is nil, NpcId: %s", r0_62.NpcData.UnitId))
    return 
  end
  if not r3_62 then
    r3_62 = {
      PlayRate = 1,
      StartPos = 0,
      StartSec = "Default",
    }
  end
  local r5_62 = r0_62:GetFacialMontagePath(r1_62)
  if r4_62 then
    UResourceLibrary.LoadObjectAsync(r0_62, r5_62, {
      r0_62,
      function(r0_63, r1_63)
        -- line: [926, 939] id: 63
        if IsValid(r1_63) == false then
          UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, r5_0, "表情蒙太奇资源缺失/配置错误", string.format("Play facial montage failed, montage is invalid, NpcId: %s, MontagePath: %s", r0_62.NpcData.UnitId, r5_62))
          return 
        end
        if r2_62 then
          UTalkFunctionLibrary.SetMontageBlendInTime(r1_63, r2_62)
        end
        if r0_62.NpcAnimInstance then
          r0_62.NpcAnimInstance:Montage_Play(r1_63, 1)
        end
      end
    })
    return 
  end
  local r6_62 = LoadObject(r5_62)
  if IsValid(r6_62) == false then
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, r5_0, "表情蒙太奇资源缺失/配置错误", string.format("Play facial montage failed, montage is invalid, NpcId: %s, MontagePath: %s", r0_62.NpcData.UnitId, r5_62))
    return 
  end
  if r2_62 then
    UTalkFunctionLibrary.SetMontageBlendInTime(r6_62, r2_62)
  end
  if r0_62.NpcAnimInstance then
    r0_62.NpcAnimInstance:Montage_Play(r6_62, 1)
  end
end
function r4_0.GetFacialMontagePath(r0_64, r1_64)
  -- line: [960, 973] id: 64
  local r2_64 = DataMgr.Model[r0_64.NpcData.ModelId]
  if r2_64 == nil then
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, r5_0, "表情模型数据缺失/配置错误", string.format("找不到模型数据，NpcId: %s，模型Id: %s", r0_64.NpcData.UnitId, r0_64.NpcData.ModelId))
    return 
  end
  local r3_64 = ""
  if r2_64.MontageFacePrefix ~= nil then
    return string.format("%sFacial/%s%s_Montage", r2_64.MontageFolder, r2_64.MontageFacePrefix, r1_64)
  end
  return string.format("%sFacial/%s%s_Montage", r2_64.MontageFolder, r2_64.MontagePrefix, r1_64)
end
function r4_0.TickActorGlobalTimeDilation(r0_65)
  -- line: [976, 995] id: 65
  if not r0_65.NpcData.GlobalGameUITagList then
    return 
  end
  local r1_65 = GWorld.GameInstance
  local r2_65 = UE4.UGameplayStatics.GetGameMode(r0_65)
  if not r1_65 or not r2_65 then
    return 
  end
  local r3_65 = UE4.UGameplayStatics.IsGamePaused(r2_65)
  local r4_65 = r1_65:GetGlobalGameUITag()
  for r9_65, r10_65 in pairs(r0_65.NpcData.GlobalGameUITagList) do
    if r1_65:GetGlobalGameUITag() == r10_65 and UE4.UGameplayStatics.IsGamePaused(r2_65) then
      r0_65:SetActorImmunePause(r0_65, false)
      return 
    end
  end
  -- close: r5_65
end
function r4_0.SetActorsImmunePause(r0_66, r1_66, r2_66)
  -- line: [997, 1005] id: 66
  if not r1_66 then
    return 
  end
  for r7_66, r8_66 in pairs(r1_66) do
    r0_66:SetActorImmunePause(r8_66, r2_66)
  end
  -- close: r3_66
end
function r4_0.SetActorImmunePause(r0_67, r1_67, r2_67)
  -- line: [1007, 1025] id: 67
  if r1_67 ~= nil and IsValid(r1_67) then
    r1_67:SetTickableWhenPaused(r2_67)
    local r3_67 = r1_67:K2_GetComponentsByClass(UActorComponent:StaticClass())
    if r3_67 then
      for r8_67, r9_67 in pairs(r3_67) do
        r9_67:SetTickableWhenPaused(r2_67)
      end
      -- close: r4_67
    end
    if URuntimeCommonFunctionLibrary.ObjIsChildOf(r1_67, ACharacterBase) then
      local r4_67 = r1_67:GetAllAttaches()
      if r4_67 then
        r0_67:SetActorsImmunePause(r4_67, r2_67)
      end
    end
  end
end
function r4_0.PlayUITalkAction(r0_68, r1_68, r2_68)
  -- line: [1029, 1068] id: 68
  local r3_68 = DataMgr.NPCDialogue[r1_68]
  assert(r3_68, string.format("%s 在 NPCDialogue 表中不存在。", r1_68))
  local r4_68 = r3_68.ActionMontage
  local r5_68 = LoadObject(r4_68)
  assert(r5_68, string.format("%s 不存在", r4_68))
  if r3_68.EndLoopMontage then
    local function r6_68()
      -- line: [1038, 1046] id: 69
      local r1_69 = LoadObject(r3_68.EndLoopMontage)
      assert(r1_69, string.format("%s 不存在", r1_69))
      UE4.UPlayMontageCallbackProxy.CreateProxyObjectForPlayMontage(r0_68.Mesh, r1_69, 1, 0, r3_68.EndLoopMontageSection)
      if type(r2_68) == "table" then
        r2_68[2](r2_68[1])
      end
    end
    r0_0.PlayMontageBySkeletaMesh(r0_68, r0_68.Mesh, r5_68, {
      OnCompleted = r6_68,
      StartSec = r3_68.MontageSection,
      OnInterrupted = r6_68,
    })
  else
    local function r6_68()
      -- line: [1055, 1059] id: 70
      if type(r2_68) == "table" then
        r2_68[2](r2_68[1])
      end
    end
    r0_0.PlayMontageBySkeletaMesh(r0_68, r0_68.Mesh, r5_68, {
      OnCompleted = r6_68,
      StartSec = r3_68.MontageSection,
      OnInterrupted = r6_68,
    })
  end
end
function r4_0.TriggerNpcGlobalTimeDilation(r0_71, r1_71)
  -- line: [1070, 1072] id: 71
  r0_71:SetActorImmunePause(r0_71, r1_71)
end
function r4_0.PreEnterStory(r0_72, r1_72, r2_72, r3_72)
  -- line: [1075, 1099] id: 72
  r0_72.bInStory = true
  if r2_72 then
    r0_72.CharacterFashion:CacheMeshMaterials(r0_72.Mesh)
    r0_72.CharacterFashion:ReplaceMeshAllDynamicMaterialAsParent(r0_72.Mesh)
  end
  r0_72:AddTimer(0.01, function()
    -- line: [1083, 1092] id: 73
    r0_72.NativeMeshTickOptions = {}
    for r5_73, r6_73 in pairs(r0_72:K2_GetComponentsByClass(USkeletalMeshComponent):ToTable()) do
      if IsValid(r6_73) then
        r0_72.NativeMeshTickOptions[r6_73] = r6_73.VisibilityBasedAnimTickOption
        r6_73.VisibilityBasedAnimTickOption = EVisibilityBasedAnimTickOption.AlwaysTickPoseAndRefreshBones
      end
    end
    -- close: r1_73
  end)
  if r3_72 and r0_72.StopBT then
    r0_72:StopBT("Talk")
  end
  r2_0:ExecuteStoryDelegate(r1_72)
end
function r4_0.PreExitStory(r0_74, r1_74, r2_74)
  -- line: [1101, 1120] id: 74
  r0_74.bInStory = false
  if r2_74 and r0_74.RestartBT then
    r0_74:RestartBT()
  end
  local r3_74 = TArray(UMaterialInterface)
  r0_74.CharacterFashion:UncacheMeshMaterials(r0_74.Mesh, r3_74)
  r0_74.CharacterFashion:SetMeshMaterials(r0_74.Mesh, r3_74)
  for r8_74, r9_74 in pairs(r0_74.NativeMeshTickOptions and {}) do
    if IsValid(r8_74) then
      r8_74.VisibilityBasedAnimTickOption = r9_74
    end
  end
  -- close: r4_74
  r0_74.NativeMeshTickOptions = nil
  r2_0:ExecuteStoryDelegate(r1_74)
end
function r4_0.IsInStory(r0_75)
  -- line: [1122, 1124] id: 75
  return r0_75.bInStory
end
function r4_0.InitNpcAccessories(r0_76, r1_76)
  -- line: [1128, 1143] id: 76
  local r2_76 = GWorld:GetAvatar()
  if r2_76 then
    for r7_76, r8_76 in pairs(r2_76.Chars) do
      if r8_76.CharId == r1_76 then
        r0_76:InitAppearanceSuit(r8_76:DumpAppearanceSuit(r2_76))
        break
      end
    end
    -- close: r3_76
  end
end
function r4_0.RefreshNpcAccessories(r0_77, r1_77)
  -- line: [1170, 1183] id: 77
  local r2_77 = GWorld:GetAvatar()
  if r2_77 then
    r0_77:InitAppearanceSuit(r1_77:DumpAppearanceSuit(r2_77))
  end
end
function r4_0.CommonOnEMActorDestroy(r0_78, r1_78)
  -- line: [1198, 1201] id: 78
  r0_78.GameplayTagsTable = nil
end
function r4_0.OnEMActorDestroy_Lua(r0_79, r1_79)
  -- line: [1203, 1232] id: 79
  local r2_79 = UGameplayStatics.GetGameMode(r0_79)
  if IsValid(r0_79.CurrentSeat) then
    r0_79.CurrentSeat:CloseMechanismNpcSpecial(r0_79)
  end
  if r0_79.UnitId == 818054 then
    r0_79:RemoveTimer("TempSetMoveMode")
  end
  if r2_79 then
    r2_79:GetRegionDataMgrSubSystem():DeadRegionActorData(r0_79, r1_79, r2_79:GetActorLevelName(r0_79))
  end
  r0_79:CommonOnEMActorDestroy(r1_79)
  if IsAuthority(r0_79) then
    r0_79:ServerOnEMActorDestroy(r1_79)
  end
end
function r4_0.ServerOnEMActorDestroy(r0_80, r1_80)
  -- line: [1234, 1241] id: 80
  r0_80:ServerClearMonsterExtraInfo(r1_80)
end
function r4_0.PlayMonsterBirthFX(r0_81)
  -- line: [1251, 1252] id: 81
end
function r4_0.GetBlueprintPath(r0_82)
  -- line: [1254, 1256] id: 82
  return r0_82.Data.UnitBPPath
end
function r4_0.TempSetNpcData(r0_83, r1_83)
  -- line: [1285, 1298] id: 83
  local r2_83 = DataMgr.Npc[r1_83]
  if r1_83 and r1_83 > 0 and r2_83 ~= nil then
    r0_83.UnitType = "Npc"
    r0_83.NpcId = r1_83
    r0_83.bInStory = true
    local r3_83 = UE4.UGameplayStatics.GetGameState(r0_83)
    local r4_83 = r3_83.NpcCharacterMap:FindRef(r0_83.UnitId)
    if r3_83 and r4_83 == nil then
      r3_83.NpcCharacterMap:Add(r0_83.UnitId, r0_83)
    end
  end
end
function r4_0.InitNpcSideQuestBubbleBrush(r0_84, r1_84)
  -- line: [1300, 1308] id: 84
  if r0_84.HeadWidgetComponent and r0_84.HeadWidgetComponent:GetWidget() then
    if DataMgr.QuestChain[r1_84] and DataMgr.QuestChain[r1_84].QuestChainType == Const.SpecialSideQuestChainType then
      r0_84.HeadWidgetComponent:GetWidget().Com_GuidePoint.Img_GuidePoint_Icon:SetBrushResourceObject(LoadObject("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_SpSideMission_Un.T_Gp_SpSideMission_Un"))
    else
      r0_84.HeadWidgetComponent:GetWidget().Com_GuidePoint.Img_GuidePoint_Icon:SetBrushResourceObject(LoadObject("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_SideMission_Un.T_Gp_SideMission_Un"))
    end
  end
end
function r4_0.UpdateNpcSpecialState(r0_85)
  -- line: [1310, 1315] id: 85
  local r1_85 = GWorld:GetAvatar()
  if r1_85 then
    r0_85.IsInSpecialQuest = r1_85.InSpecialQuest
  end
end
function r4_0.TryEnableNpcSideBubble(r0_86, r1_86, r2_86)
  -- line: [1317, 1326] id: 86
  if MissionIndicatorManager.MissionNpcSideBubbles[r0_86.UnitId] and r1_86 == r0_86.UnitId and r2_86 then
    r0_86.IsShowSideIndicator = r2_86
    r0_86:InitNpcSideQuestBubbleBrush(MissionIndicatorManager.MissionNpcSideBubbles[r0_86.UnitId])
    r0_86:EnableNpcSideBubbleWidget(r2_86)
  elseif r2_86 == false and r1_86 == r0_86.UnitId then
    r0_86.IsShowSideIndicator = r2_86
    r0_86:EnableNpcSideBubbleWidget(r2_86)
  end
end
function r4_0.EnableHeadIconWidget(r0_87, r1_87)
  -- line: [1328, 1334] id: 87
  if r0_87.IsNeedCollapsedOtherBubble == false then
    r0_87:EnableHeadWidget("HeadIcon", r1_87, r0_87)
  else
    r0_87:EnableHeadWidget("HeadIcon", false, r0_87)
  end
end
function r4_0.EnableNpcSideBubbleWidget(r0_88, r1_88)
  -- line: [1336, 1342] id: 88
  if r0_88.IsShowSideIndicator and r1_88 and (r0_88.IsInSpecialQuest == false or r0_88.IsInSpecialQuest == nil) then
    r0_88:EnableHeadWidget("NpcSideIndicator", r1_88, r0_88)
  else
    r0_88:EnableHeadWidget("NpcSideIndicator", false, r0_88)
  end
end
function r4_0.CollapsedOtherBubble(r0_89)
  -- line: [1344, 1347] id: 89
  r0_89:EnableHeadIconWidget(false)
  r0_89:EnableImpressionWidget(false)
end
function r4_0.EnableImpressionWidget(r0_90, r1_90)
  -- line: [1349, 1355] id: 90
  if r0_90.IsNeedCollapsedOtherBubble == false then
    r0_90:EnableHeadWidget("Impression", r1_90, r0_90)
  else
    r0_90:EnableHeadWidget("Impression", false, r0_90)
  end
end
function r4_0.EnableNameWidget(r0_91, r1_91)
  -- line: [1357, 1361] id: 91
  local r3_91 = r0_91.UnitId
  local r2_91 = DataMgr[r0_91.UnitType][r3_91]
  if r2_91 then
    r3_91 = r2_91.UnitName and ""
  else
    goto label_10	-- block#2 is visited secondly
  end
  r0_91:EnableHeadWidget("Name", r1_91, GText(r3_91))
end
function r4_0.EnableBubbleWidget(r0_92, r1_92, r2_92, r3_92)
  -- line: [1363, 1369] id: 92
  if r0_92.IsNeedCollapsedOtherBubble == false then
    r0_92:EnableHeadWidget("Bubble", r1_92, r2_92, r3_92)
  else
    r0_92:EnableHeadWidget("Bubble", false, r2_92, r3_92)
  end
end
function r4_0.EnableBubbleRewardWidget(r0_93, r1_93)
  -- line: [1371, 1378] id: 93
  if r0_93.IsNeedCollapsedOtherBubble == false then
    r0_93:EnableHeadWidget("Bubble_Reward", r1_93)
  else
    r0_93:EnableHeadWidget("Bubble", false)
  end
end
function r4_0.GetHitMontageRule(r0_94)
  -- line: [1380, 1382] id: 94
  return nil
end
function r4_0.GetHitMontageFolderAndPrefix(r0_95)
  -- line: [1384, 1386] id: 95
  return nil, nil
end
function r4_0.DisableInteractiveScene(r0_96, r1_96)
  -- line: [1388, 1390] id: 96
  r0_96.bDisableInteractiveScene = r1_96
end
function r4_0.IsbDisableInteractiveScene(r0_97)
  -- line: [1392, 1394] id: 97
  return r0_97.bDisableInteractiveScene and false
end
function r4_0.ResetLocation(r0_98, r1_98)
  -- line: [1398, 1433] id: 98
  if r0_98.Data and r0_98.Data.IgnoreFixLocation == true then
    return 
  end
  local r2_98 = r0_98:K2_GetActorLocation()
  local r3_98 = r0_98.CapsuleComponent:GetScaledCapsuleHalfHeight()
  local r4_98 = r0_98.CapsuleComponent:GetScaledCapsuleRadius()
  local r7_98 = r2_98 + FVector(0, 0, -500)
  local r8_98 = FHitResult()
  local r9_98 = FHitResult()
  local r10_98 = r3_98 - r4_98
  local r11_98 = UE4.UKismetSystemLibrary.CapsuleTraceSingle(r0_98, r2_98 + FVector(0, 0, math.max(r3_98 - r4_98, r4_98)), r7_98, r4_98, r4_98, ETraceTypeQuery.TraceScene, false, r1_98, 0, r8_98, true)
  local r12_98 = UE4.UKismetSystemLibrary.LineTraceSingle(r0_98, r2_98 + FVector(0, 0, r3_98), r7_98, ETraceTypeQuery.TraceScene, false, r1_98, 0, r9_98, true)
  if r11_98 and r12_98 and r4_98 < r8_98.ImpactPoint.Z - r9_98.Location.Z then
    DebugPrint("BP_NPC_C CapsuleTraceSingle 打中位置：", r8_98.ImpactPoint, "打中目标：", r8_98.Actor:GetName(), "Pawn名字：", r0_98:GetName())
    r11_98 = r12_98
    r8_98 = r9_98
    r10_98 = r3_98
  end
  if r11_98 then
    local r13_98 = FVector(r8_98.Location.X, r8_98.Location.Y, r8_98.Location.Z + r10_98)
    DebugPrint("BP_NPC_C半高：", r3_98, "打中位置：", r8_98.ImpactPoint, "打中目标：", r8_98.Actor:GetName(), "Pawn名字：", r0_98:GetName(), "SurfacePos：", r13_98, "============sssss================")
    r0_98:K2_SetActorLocation(r13_98, false, nil, false)
    if r3_98 * 2 < math.abs(r8_98.ImpactPoint.Z - r2_98.Z) then
      Utils.ScreenPrint("BP_NPC_C静态刷新点位置异常,Pawn名字：" .. r0_98:GetName() .. " SpawnPos.Z：" .. r2_98.Z .. " ImpactPoint.Z:" .. r8_98.ImpactPoint.Z)
    end
  end
  r0_98:AdjustNpcFloorHeight()
end
function r4_0.TriggerFallingCallable(r0_99)
  -- line: [1435, 1438] id: 99
end
function r4_0.TriggerWaterFallingCallable(r0_100)
  -- line: [1440, 1443] id: 100
end
function r4_0.GetTalkInteractiveComponent(r0_101)
  -- line: [1445, 1447] id: 101
  return r0_101.NpcTalkInteractiveComponent
end
function r4_0.ClearCharacterBattleInfo(r0_102, r1_102, r2_102)
  -- line: [1449, 1452] id: 102
  r4_0.Super.ClearCharacterBattleInfo(r0_102, r1_102, r2_102)
  r0_102.IsSitting = false
end
return r4_0
