-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Common\Level\BP_LevelSequenceStateRecorder_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class("BluePrints.Common.TimerMgr")
function r0_0.ReceiveBeginPlay(r0_1)
  -- line: [18, 26] id: 1
  r0_1.Overridden.ReceiveBeginPlay(r0_1)
  r0_1.PlayEndSequence = {}
  local r1_1 = UGameplayStatics.GetGameMode(r0_1)
  if r1_1 then
    r1_1.LevelSequenceStateRecorders:Add(r0_1.SubRegionId, r0_1)
  end
  r0_1:ClearBinding()
end
function r0_0.Active(r0_2)
  -- line: [43, 58] id: 2
  r0_2:ClearBinding()
  for r6_2, r7_2 in pairs(GWorld:GetAvatar().LevelSequenceStateRecorder) do
    if r7_2.RegionId == r0_2.SubRegionId then
      if r7_2.PlayState == ELevelSequenceRuntimeState.ERunning then
        DebugPrint("LevelStateRecorder", "Recover,ERunning:", r0_2.SubRegionId, r7_2.RecorderId, r7_2.SequenceState)
        r0_2:PlaySequence_CPP(r7_2.RecorderId, r7_2.SequenceState, false, false, true)
      elseif r7_2.PlayState == ELevelSequenceRuntimeState.EComplete then
        DebugPrint("LevelStateRecorder", "Recover,EComplete:", r0_2.SubRegionId, r7_2.RecorderId, r7_2.SequenceState)
        r0_2:PlaySequence_CPP(r7_2.RecorderId, r7_2.SequenceState, true, false, true)
        r0_2.PlayEndSequence[r7_2.RecorderId] = r7_2.SequenceState
      end
    end
  end
  -- close: r2_2
end
function r0_0.PlaySequence_Lua(r0_3, r1_3, r2_3, r3_3, r4_3, r5_3)
  -- line: [60, 114] id: 3
  r0_3.PlayEndSequence[r1_3] = nil
  local r6_3 = nil
  local r7_3 = nil
  if r2_3.IsRevrse then
    r6_3 = r2_3.MarkLableTo
    r7_3 = r2_3.MarkLableFrom
  else
    r6_3 = r2_3.MarkLableFrom
    r7_3 = r2_3.MarkLableTo
  end
  if r4_3 then
    local r8_3 = FMovieSceneSequencePlaybackParams()
    r8_3.MarkedFrame = r7_3
    r8_3.UpdateMethod = EUpdatePositionMethod.Jump
    r8_3.PositionType = EMovieScenePositionType.MarkedFrame
    r3_3:GetSequencePlayer():SetPlaybackPosition(r8_3)
  else
    r0_3:ReportLevelSequenceState(r1_3, r2_3.StateId, ELevelSequenceRuntimeState.ERunning)
    local r8_3 = FMovieSceneSequencePlaybackParams()
    r8_3.PositionType = EMovieScenePositionType.MarkedFrame
    if r5_3 or r2_3.RuntimeState ~= ELevelSequenceRuntimeState.ERunning then
      r8_3.MarkedFrame = r6_3
      r8_3.UpdateMethod = EUpdatePositionMethod.Jump
      r3_3:GetSequencePlayer():SetPlaybackPosition(r8_3)
    end
    r8_3.MarkedFrame = r7_3
    r8_3.UpdateMethod = EUpdatePositionMethod.Play
    r3_3:GetSequencePlayer():PlayTo(r8_3)
    r2_3.RuntimeState = ELevelSequenceRuntimeState.ERunning
    local r9_3 = GWorld.GameInstance:GetGameUIManager()
    if r2_3.HideUI and r9_3 then
      r9_3:HideAllUI_EX({}, true, Const.LevelSequenceStateRecorderTag)
    end
    if r2_3.DisableInput then
      local r10_3 = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
      r10_3:AddDisableInputTag(Const.LevelSequenceStateRecorderTag)
      r9_3:SetUIInputEnable(false, Const.LevelSequenceStateRecorderTag)
      local r11_3 = r9_3:GetUI("BattleMain")
      if r11_3 then
        r11_3:BlockAllUIInput_CPP(true, Const.LevelSequenceStateRecorderTag)
      end
      UGameplayStatics.GetGameMode(r0_3):SetPlayerCharacterForceIdle(r10_3)
    end
  end
end
function r0_0.OnMarkedFrameEnd(r0_4, r1_4, r2_4, r3_4, r4_4)
  -- line: [116, 153] id: 4
  if r0_4.PauseTag then
    return 
  end
  local r5_4 = GWorld.GameInstance:GetGameUIManager()
  if r2_4.HideUI and r5_4 then
    r5_4:HideAllUI_EX({}, false, Const.LevelSequenceStateRecorderTag)
  end
  if r2_4.DisableInput then
    UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0):RemoveDisableInputTag(Const.LevelSequenceStateRecorderTag)
    r5_4:SetUIInputEnable(true, Const.LevelSequenceStateRecorderTag)
    local r7_4 = r5_4:GetUI("BattleMain")
    if r7_4 then
      r7_4:BlockAllUIInput_CPP(false, Const.LevelSequenceStateRecorderTag)
    end
  end
  DebugPrint("LevelStateRecorder", "MarkedFrameEnd", r0_4.SubRegionId, r1_4, r2_4.StateId, r2_4.IsLoop, r2_4.AutoChangeState)
  if r2_4.IsLoop then
    r0_4:PlaySequence_Lua(r1_4, r2_4, r3_4, false, true)
  elseif r2_4.AutoChangeState then
    r2_4.RuntimeState = ELevelSequenceRuntimeState.EComplete
    r0_4:ReportLevelSequenceState(r1_4, r2_4.StateId, ELevelSequenceRuntimeState.EComplete)
  end
  if not r2_4.IsLoop then
    r0_4.PlayEndSequence[r1_4] = r2_4.StateId
    if IsValid(r4_4) and r4_4.OnSequencePlayEnd then
      r4_4.OnSequencePlayEnd:Broadcast()
    end
  end
end
function r0_0.ReportLevelSequenceState(r0_5, r1_5, r2_5, r3_5)
  -- line: [155, 170] id: 5
  local r4_5 = GWorld:GetAvatar()
  for r9_5, r10_5 in pairs(r4_5.LevelSequenceStateRecorder) do
    if r10_5.RegionId == r0_5.SubRegionId and r10_5.RecorderId == r1_5 then
      if r10_5.SequenceState == r2_5 and r10_5.PlayState == r3_5 then
        return 
      else
        break
      end
    end
  end
  -- close: r5_5
  DebugPrint("LevelStateRecorder", "Report", r0_5.SubRegionId, r1_5, r2_5, r3_5)
  r4_5:ReportLevelSequenceState(r0_5.SubRegionId, r1_5, r2_5, r3_5)
end
function r0_0.AddBinding(r0_6, r1_6, r2_6, r3_6, r4_6)
  -- line: [172, 197] id: 6
  local r5_6 = UGameplayStatics.GetGameState(r0_6)
  for r10_6, r11_6 in pairs(r2_6:ToTable()) do
    local r12_6 = r5_6.StaticCreatorMap:Find(r11_6.CreatorId)
    if r12_6 then
      local r13_6 = r12_6:GetActorToChildEids():ToTable()
      if #r13_6 ~= 0 then
        local r14_6 = Battle(r0_6):GetEntity(r13_6[1])
        if IsValid(r14_6) then
          r1_6:AddBindingByTag(r11_6.Tag, r14_6, false)
        end
      end
      table.insert(r0_6.BindingCreator, r12_6)
      r12_6.OnStaticCreatorChildReadyDelegate:Add(r0_6, function(r0_7, r1_7)
        -- line: [185, 192] id: 7
        if IsValid(r1_7) then
          r1_6:AddBindingByTag(r11_6.Tag, r1_7, false)
          if r0_7.PlayEndSequence[r3_6] == r4_6 then
            r0_7:PlaySequence_CPP(r3_6, r4_6, true, false, true)
          end
        end
      end)
    else
      GWorld.logger.error("LevelSequence AddBinding Error, Creator Not Found!!! Tag:", r11_6.Tag, "CreatorId:", r11_6.CreatorId)
    end
    -- close: r10_6
  end
  -- close: r6_6
end
function r0_0.ClearBinding(r0_8)
  -- line: [199, 206] id: 8
  if r0_8.BindingCreator then
    for r5_8, r6_8 in pairs(r0_8.BindingCreator) do
      r6_8.OnStaticCreatorChildReadyDelegate:Clear()
    end
    -- close: r1_8
  end
  r0_8.BindingCreator = {}
end
return r0_0
