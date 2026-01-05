-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Item\Supply\BP_OccupationMechanism_C.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = Class({
  "BluePrints.Item.BP_CombatItemBase_C"
})
function r0_0.CommonInitInfo(r0_1, r1_1)
  -- line: [14, 21] id: 1
  r0_0.Super.CommonInitInfo(r0_1, r1_1)
  r0_1.Speed = 1
  r0_1.Range = r0_1.UnitParams.Range and 500
  r0_1.UIRange = r0_1.UnitParams.UIRange and 500
  r0_1.Height = r0_1.UnitParams.Height and 500
  r0_1.Time = r0_1.UnitParams.Time and 0.2
end
function r0_0.ClientInitInfo(r0_2, r1_2)
  -- line: [22, 32] id: 2
  r0_0.Super.ClientInitInfo(r0_2, r1_2)
  r0_2.ProgressWidget:GetWidget():Init(math.floor(r0_2.OccupateProgress))
  if r0_2:CheckRange(UE4.UGameplayStatics.GetPlayerCharacter(r0_2, 0)) then
    r0_2.ProgressWidget:GetWidget():OnOccupationContinue()
  else
    r0_2.ProgressWidget:GetWidget():OnOccupationPause()
  end
end
function r0_0.OnActorReady(r0_3, r1_3)
  -- line: [34, 47] id: 3
  r0_0.Super.OnActorReady(r0_3, r1_3)
  r0_3.DeactiveGuideIgnoreList:Add(r0_3.Eid)
  if IsAuthority(r0_3) then
    r0_3:DeactiveGuide()
    UE4.UGameplayStatics.GetGameMode(r0_3):TriggerDungeonComponentFun("OnOccupationInit", r0_3.Eid)
    r0_3:StartOccupateProgress()
    r0_3:AddOccupateProgress()
  end
end
function r0_0.WaitStartOccupateProgress(r0_4)
  -- line: [49, 53] id: 4
  if IsAuthority(r0_4) then
    r0_4:AddTimer(r0_4.Time, r0_4.StartOccupateProgress, false, 0, "Occupation")
  end
end
function r0_0.OnOneOccupationSucceed(r0_5)
  -- line: [55, 72] id: 5
  local r2_5 = r0_5:CheckRange(UGameplayStatics.GetPlayerCharacter(r0_5, 0))
  if (not IsAuthority(r0_5) or IsStandAlone(r0_5)) and r2_5 then
    if r2_5 then
      UIManager(r0_5):LoadUINew("ExploreToastSuccess", GText("DUNGEON_SYNTHESIS_111"))
    end
    r0_5.Overridden.OnOneOccupationSucceed(r0_5)
  end
  if IsAuthority(r0_5) then
    if not r0_5.bTriggerGameMode then
      r0_5.bTriggerGameMode = true
      UE4.UGameplayStatics.GetGameMode(r0_5):TriggerDungeonComponentFun("OnOneOccupationSucceed", r0_5)
    end
    r0_5:EMActorDestroy(EDestroyReason.MechanismDead)
  end
end
function r0_0.OnRep_OccupateProgress(r0_6)
  -- line: [74, 86] id: 6
  if not r0_6.ProgressWidget:GetWidget() then
    r0_6:AddTimer(0.1, function()
      -- line: [76, 81] id: 7
      if r0_6.ProgressWidget:GetWidget() then
        r0_6.ProgressWidget:GetWidget():OnProgressChange(r0_6.OccupateProgress)
        r0_6:RemoveTimer("OnRepOccupateProgress")
      end
    end, true, 0, "OnRepOccupateProgress")
    return 
  end
  r0_6.ProgressWidget:GetWidget():OnProgressChange(r0_6.OccupateProgress)
  AudioManager(r0_6):PlayFMODSound(r0_6, nil, "event:/ui/common/week_level_progress_grow", "OccupateProgress")
end
function r0_0.OnPlayerIn(r0_8)
  -- line: [88, 91] id: 8
  print(_G.LogTag, "LXZ OnPlayerIn")
  r0_8.ProgressWidget:GetWidget():OnPlayerIn()
end
function r0_0.OnPlayerOut(r0_9)
  -- line: [93, 96] id: 9
  print(_G.LogTag, "LXZ OnPlayerOut")
  r0_9.ProgressWidget:GetWidget():OnPlayerOut()
end
function r0_0.OnPlayerIn_Server(r0_10, r1_10)
  -- line: [98, 103] id: 10
  print(_G.LogTag, "LXZ OnPlayerIn")
  UE4.UGameplayStatics.GetGameMode(r0_10):TriggerDungeonComponentFun("OnPlayerEnterOccupation", r1_10, r0_10)
end
function r0_0.OnPlayerOut_Server(r0_11, r1_11)
  -- line: [105, 110] id: 11
  print(_G.LogTag, "LXZ OnPlayerOut")
  UE4.UGameplayStatics.GetGameMode(r0_11):TriggerDungeonComponentFun("OnPlayerLeaveOccupation", r1_11, r0_11)
end
function r0_0.OnOccupationPause(r0_12)
  -- line: [112, 117] id: 12
  r0_12.Overridden.OnOccupationPause(r0_12)
  if r0_12.ProgressWidget:GetWidget() and (IsClient(r0_12) or IsStandAlone(r0_12)) then
    r0_12.ProgressWidget:GetWidget():OnOccupationPause()
  end
end
function r0_0.OnOccupationContinue(r0_13)
  -- line: [119, 124] id: 13
  r0_13.Overridden.OnOccupationContinue(r0_13)
  if r0_13.ProgressWidget:GetWidget() and (IsClient(r0_13) or IsStandAlone(r0_13)) then
    r0_13.ProgressWidget:GetWidget():OnOccupationContinue()
  end
end
function r0_0.OnEMActorDestroy(r0_14, r1_14)
  -- line: [126, 136] id: 14
  if IsAuthority(r0_14) and r0_14.OccupateProgress >= 100 then
    r0_14:RemoveTimer("Occupation")
    r0_14:RemoveTimer("OccupationSucceed")
    for r7_14, r8_14 in pairs(UE4.UGameplayStatics.GetGameMode(r0_14):GetAllPlayer()) do
      r0_14:ActiveAllGuide(nil, r8_14.Eid)
      r0_14:DeactiveGuide(r8_14.Eid)
    end
    -- close: r3_14
  end
end
function r0_0.ReceiveEndPlay(r0_15, r1_15)
  -- line: [138, 144] id: 15
  r0_0.Super.ReceiveEndPlay(r0_15, r1_15)
  if IsAuthority(r0_15) then
    r0_15:RemoveTimer("Occupation")
    r0_15:RemoveTimer("OccupationSucceed")
  end
end
return r0_0
