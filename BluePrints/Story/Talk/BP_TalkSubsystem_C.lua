-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Story\Talk\BP_TalkSubsystem_C.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = Class({
  "BluePrints.Common.TimerMgr"
})
local r1_0 = require("BluePrints.Story.Talk.Base.ETalkType")
local r2_0 = require("BluePrints.Story.Talk.Base.ETaskState")
local r3_0 = require("BluePrints.Story.Talk.Base.ETaskCheckResult")
local r4_0 = require("BluePrints.Story.Talk.Base.ETalkInterruptType")
local r5_0 = Class("BluePrints.Story.Talk.Base.TalkTaskDataProcesser")
local r6_0 = Class("BluePrints.Story.Talk.Base.TalkInterruptComponent")
local r7_0 = require("BluePrints.Story.Talk.View.TalkUtils")
local r8_0 = {
  [r1_0.Guide] = true,
  [r1_0.ForgingGuide] = true,
  [r1_0.HintGuide] = true,
  [r1_0.Bubble] = true,
  [r1_0.Boss] = true,
  [r1_0.AudioOnly] = true,
}
local r9_0 = {
  r1_0.Guide,
  r1_0.HintGuide,
  r1_0.QueueGuide,
  r1_0.ForgingGuide,
  r1_0.UnimportGuide
}
function r0_0.ReceiveInitialize(r0_1)
  -- line: [28, 47] id: 1
  r0_1.TalkTaskDataProcesser = r5_0:New()
  r0_1.TalkInterruptComponent = r6_0:New()
  r0_1.TalkTasks = {}
  r0_1.TalkTaskDatas = {}
  r0_1.TaskKeys = {}
  r0_1.PausedTasks = {}
  r0_1.PausedByTasks = {}
  r0_1.RegisteredDatas = {}
  r0_1.RegisteredDataKey = 0
  r0_1.PauseAffectTaskTag = {}
  r0_1:InitializeTaskTables()
  r0_1.bPauseAdvance = false
  r0_1.bGamePaused = false
  r0_1.bPauseLightTask = false
  EventManager:AddEvent(EventID.CharRecover, r0_1, r0_1.OnPlayerRecover)
  EventManager:AddEvent(EventID.CharDie, r0_1, r0_1.OnPlayerDead)
end
function r0_0.ReceiveDeinitialize(r0_2)
  -- line: [49, 72] id: 2
  EventManager:RemoveEvent(EventID.CharRecover, r0_2)
  EventManager:RemoveEvent(EventID.CharDie, r0_2)
  r0_2:CleanTimer()
  if r0_2.TalkTasks then
    local r1_2 = {}
    for r6_2, r7_2 in pairs(r0_2.TalkTasks) do
      r1_2[r6_2] = r7_2
    end
    -- close: r2_2
    for r6_2, r7_2 in pairs(r1_2) do
      r7_2:Clear()
    end
    -- close: r2_2
  end
  r0_2.TalkTasks = {}
  r0_2.TalkTaskDatas = {}
  r0_2.PausedTasks = {}
  r0_2.PausedByTasks = {}
  r0_2.RegisteredDatas = {}
  r0_2.TalkTaskDataProcesser:Clear()
  r0_2.TalkInterruptComponent:Clear()
end
function r0_0.PlayTalk(r0_3, r1_3, r2_3, r3_3)
  -- line: [74, 120] id: 3
  if not r1_3 or not r2_3 then
    return false
  end
  local function r4_3()
    -- line: [79, 83] id: 4
    if IsValid(r2_3) and r2_3.OnPlayTalkEnd then
      r2_3.OnPlayTalkEnd:Broadcast()
    end
  end
  DebugPrint("TS:PlayTalk", r1_3, r2_3)
  local r5_3 = r0_3:GetRegisteredTalkData(r1_3)
  if r5_3 then
    r5_3.AudioAttachActor = r3_3
    r0_3:RegisterTalkTask(r1_3, r4_3)
    return true
  end
  local r6_3 = DataMgr.TalkTrigger[r1_3]
  if not r6_3 then
    GWorld.GameInstance:GetTalkContext():StartTalk(nil, r1_3 .. ".story", r1_3, nil, nil, {
      Func = r4_3,
      Obj = r2_3,
    }, nil)
    return true
  end
  if r6_3.StoryLinePath then
    local r7_3 = GWorld.GameInstance:GetTalkContext()
    if r7_3 then
      r7_3:StartTalk(r1_3, nil, nil, nil, nil, {
        Func = r4_3,
        Obj = r2_3,
      })
      return true
    end
  else
    r0_3:RegisterTalkTask(r0_3:RegisterTalkData({
      AudioAttachActor = r3_3,
      TalkType = r6_3.TalkType,
      FirstDialogueId = r6_3.DialogueId,
      BlendInTime = 0.5,
      BlendOutTime = 0.5,
    }), r4_3)
    return true
  end
  return false
end
function r0_0.RegisterTalkTask(r0_5, r1_5, r2_5, r3_5)
  -- line: [122, 132] id: 5
  local r4_5, r5_5 = r0_5:CreateTalkTaskData(r1_5)
  r4_5.OnTalkEndCallback = r2_5
  r4_5.OnFailCallback = r3_5
  if r0_5.bPauseAdvance then
    r0_5:DelayRegisterTask(r1_5, r4_5)
  else
    r0_5:RegisterTalkTaskInternal(r1_5, r4_5)
  end
end
function r0_0.ForceInterruptTalk(r0_6, r1_6)
  -- line: [134, 141] id: 6
  DebugPrint("@@@ ForceInterruptTalk 调用强制中断对话接口", r1_6)
  if not r0_6:CheckTalkCanBeInterrupted(r1_6) then
    DebugPrint("@@@ 对话无法被打断", r1_6)
    return 
  end
  r0_6:OnTaskInterrupted(r1_6)
end
function r0_0.ForceInterruptTalkTaskData(r0_7, r1_7)
  -- line: [143, 160] id: 7
  DebugPrint("@@@ ForceInterruptTalkTaskData 调用强制中断对话接口", r1_7)
  local r2_7 = r0_7:GetAllTasks()
  local r3_7 = {}
  for r8_7, r9_7 in pairs(r2_7) do
    r3_7[r8_7] = r9_7
  end
  -- close: r4_7
  for r8_7, r9_7 in pairs(r3_7) do
    local r10_7 = r0_7:GetTaskDataFromTalkTask(r9_7)
    if r10_7 and r1_7(r10_7) then
      r0_7:ForceInterruptTalk(r9_7)
    end
  end
  -- close: r4_7
end
function r0_0.ForceInterruptAllTalks(r0_8)
  -- line: [162, 167] id: 8
  DebugPrint("@@@ ForceInterruptAllTalks 调用强制中断所有对话接口")
  r0_8:ForceInterruptTalkTaskData(function(r0_9)
    -- line: [164, 166] id: 9
    return true
  end)
end
function r0_0.InterruptAllLightTask(r0_10)
  -- line: [169, 183] id: 10
  local r1_10 = {
    AudioOnly = true,
    Boss = true,
    Bubble = true,
    ForgingGuide = true,
    Guide = true,
    HintGuide = true,
    QueueGuide = true,
    UnimportGuide = true,
  }
  r0_10:ForceInterruptTalkTaskData(function(r0_11)
    -- line: [180, 182] id: 11
    return r1_10[r0_11.TalkType]
  end)
end
function r0_0.ForcePauseTalk(r0_12, r1_12, r2_12)
  -- line: [185, 190] id: 12
  DebugPrint("@@@ 调用强制暂停对话接口", r1_12, r2_12)
  r0_12:RecordPausedTasks(r2_12, r1_12)
  r0_12:OnDifferentStateTaskPaused(r1_12)
  r0_12:MoveTaskState(r1_12, r2_0.Paused)
end
function r0_0.TryResumePauseTalk(r0_13, r1_13)
  -- line: [192, 199] id: 13
  DebugPrint("@@@ 尝试恢复被暂停的Talk", r1_13)
  local r2_13 = r0_13:GetPausedTasks(r1_13) and {}
  r0_13:RemovePausedTasks(r1_13)
  for r7_13, r8_13 in pairs(r2_13) do
    r0_13:OnDifferentLastStateTaskPauseResumed(r7_13)
  end
  -- close: r3_13
end
function r0_0.TryAdvanceTaskQueue(r0_14)
  -- line: [201, 219] id: 14
  DebugPrint("@@@ TS:TryAdvanceTaskQueue 尝试推动队列中的下一个TalkTask")
  local r1_14 = nil
  for r6_14, r7_14 in pairs(r1_0) do
    for r13_14, r14_14 in pairs(r0_14:GetTasksQueue(r2_0.Queue, r7_14)) do
      r1_14 = r14_14
      break
    end
    -- close: r9_14
    if r1_14 then
      break
    end
  end
  -- close: r2_14
  if r1_14 then
    DebugPrint("@@@ TS:TryAdvanceTaskQueue 下一个TalkTask存在，尝试Working", r1_14)
    r0_14:TryWorkingTask(r1_14)
  end
end
function r0_0.RegisterTalkData(r0_15, r1_15)
  -- line: [221, 227] id: 15
  r0_15.RegisteredDataKey = r0_15.RegisteredDataKey + 1
  local r2_15 = r0_15.RegisteredDataKey
  r0_15.RegisteredDatas[r2_15] = r1_15
  DebugPrint("@@@ 注册任务数据", r1_15, r2_15)
  return r2_15
end
function r0_0.UnregisterTalkData(r0_16, r1_16)
  -- line: [229, 234] id: 16
  if not r1_16 then
    return 
  end
  r0_16.RegisteredDatas[r1_16] = nil
end
function r0_0.ForceSetStorySkipable(r0_17, r1_17)
  -- line: [236, 241] id: 17
  local r2_17 = GWorld:GetAvatar()
  if r2_17 then
    r2_17.bForceSetStorySkipable = r1_17
  end
end
function r0_0.GetForceStorySkipable(r0_18)
  -- line: [243, 250] id: 18
  local r1_18 = GWorld:GetAvatar()
  if r1_18 then
    return r1_18.bForceSetStorySkipable
  else
    return false
  end
end
function r0_0.ExceptionInterruptTaskBySTL(r0_19, r1_19)
  -- line: [252, 270] id: 19
  if not r1_19 then
    return 
  end
  local r2_19 = r0_19.TalkTasks[r1_19]
  if not r2_19 then
    return 
  end
  DebugPrint("TS:ExceptionInterruptTaskBySTL", r2_19, r1_19)
  r2_19:OnExceptionInterruptedBySTL()
  if r2_19:GetBasicTalkType() ~= r1_0.Guide then
    r0_19:MoveTaskState(r2_19, r2_0.Finished)
    r0_19:ClearRefs(r2_19)
  end
  r0_19:TryFireLeaveStoryEvent()
end
function r0_0.GetAllWorkingTaskDebugLogs(r0_20)
  -- line: [273, 282] id: 20
  local r1_20 = r0_20:GetAllTasks()
  local r2_20 = {}
  for r7_20, r8_20 in pairs(r1_20) do
    if r8_20:GetState() == r2_0.Working then
      table.insert(r2_20, r8_20:GetDebugMetaInfo())
    end
  end
  -- close: r3_20
  return r2_20
end
function r0_0.InitializeTaskTables(r0_21)
  -- line: [287, 293] id: 21
  for r5_21, r6_21 in pairs(r1_0) do
    for r11_21, r12_21 in pairs(r2_0) do
      r0_21[r12_21 .. "TasksOf" .. r6_21] = {}
    end
    -- close: r7_21
  end
  -- close: r1_21
end
function r0_0.RegisterTalkTaskInternal(r0_22, r1_22, r2_22)
  -- line: [303, 317] id: 22
  DebugPrint("@@@ RegisterTalkTaskInternal", r1_22, r2_22)
  local r3_22 = r0_22:CheckCanRegisterTask(r2_22, r2_22.TaskData)
  if r3_22 ~= r3_0.Succeed then
    r0_22:OnCannotRegisterTask(r3_22)
    if r2_22.OnFailCallback then
      r2_22.OnFailCallback()
    end
    return 
  end
  r0_22:RecordTalkTaskAndData(r2_22, r2_22.TaskData, r1_22)
  r0_22:MoveTaskState(r2_22, r2_0.Default)
  r0_22:TryWorkingTask(r2_22)
end
function r0_0.DelayRegisterTask(r0_23, r1_23, r2_23)
  -- line: [319, 322] id: 23
  r0_23.DelayRegisterQueue = r0_23.DelayRegisterQueue and {}
  r0_23.DelayRegisterQueue[r1_23] = r2_23
end
function r0_0.GetDelayRegisterTasks(r0_24)
  -- line: [324, 326] id: 24
  return r0_24.DelayRegisterQueue
end
function r0_0.RemoveDelayRegisterTasks(r0_25)
  -- line: [328, 330] id: 25
  r0_25.DelayRegisterQueue = nil
end
function r0_0.StartRegisterTasks(r0_26, r1_26)
  -- line: [332, 339] id: 26
  if not r1_26 then
    return 
  end
  for r6_26, r7_26 in pairs(r1_26) do
    r0_26:RegisterTalkTaskInternal(r6_26, r7_26)
  end
  -- close: r2_26
end
function r0_0.TryWorkingTask(r0_27, r1_27)
  -- line: [341, 366] id: 27
  local r2_27 = r0_27.TalkTaskDatas[r1_27]
  if not r2_27 then
    r0_27:ClearRefs(r1_27)
    return 
  end
  DebugPrint("@@@ TS:尝试启动Talk", r1_27, r2_27.TalkNodeName)
  if r1_27:IsWorking() then
    DebugPrint("@@@ TS:Talk已在工作中", r1_27, r2_27.TalkNodeName)
    return 
  end
  if r0_27:IsTaskShouldQueue(r1_27, r2_27) then
    DebugPrint("@@@ TS:Task需排队，已加入队列中", r1_27, r2_27.TalkNodeName)
    r0_27:OnTaskQueued(r1_27)
    return 
  end
  if r0_27.bPauseLightTask and r8_0[r1_27:GetTalkType()] then
    r0_27:MoveTaskState(r1_27, r2_0.WaitGameUnpause)
    return 
  end
  r0_27:WorkingTaskInternal(r1_27)
end
function r0_0.WorkingTaskInternal(r0_28, r1_28)
  -- line: [368, 377] id: 28
  DebugPrint("@@@ WorkingTaskInternal", r1_28)
  r0_28:ProcessTalkInterruptEvents(r1_28)
  r0_28:OnTaskWorking(r1_28)
  r1_28:StartWorking(r0_28.TalkTaskDatas[r1_28], {
    r0_28,
    r0_28.OnTaskFinished
  })
  r0_28:ProcessDelayRegisterTasks()
end
function r0_0.ProcessDelayRegisterTasks(r0_29)
  -- line: [379, 384] id: 29
  local r1_29 = r0_29:GetDelayRegisterTasks()
  r0_29:RemoveDelayRegisterTasks()
  r0_29:StartRegisterTasks(r1_29)
end
function r0_0.ProcessTalkInterruptEvents(r0_30, r1_30)
  -- line: [386, 394] id: 30
  DebugPrint("@@@ 处理TalkTask的Interrupt关系", r1_30)
  r0_30.bPauseAdvance = true
  r0_30:TasksInterruptedByTask(r1_30)
  r0_30.bPauseAdvance = false
  r0_30:TasksPausedByTask(r1_30)
end
function r0_0.TasksInterruptedByTask(r0_31, r1_31)
  -- line: [396, 405] id: 31
  DebugPrint("@@@ 尝试打断其他对话", r1_31)
  r0_31:PreClearInterruptedTasks(r1_31)
  for r8_31, r9_31 in pairs(r0_31.TalkInterruptComponent:GetSpecificInterruptTypes(r1_31:GetTalkType(), r4_0.Interrupt)) do
    r0_31:InterruptTaskQueue(r2_0.Working, r9_31)
    r0_31:InterruptTaskQueue(r2_0.Paused, r9_31)
  end
  -- close: r4_31
end
function r0_0.TasksPausedByTask(r0_32, r1_32)
  -- line: [407, 415] id: 32
  DebugPrint("@@@ 尝试暂停其他对话", r1_32)
  for r8_32, r9_32 in pairs(r0_32.TalkInterruptComponent:GetSpecificInterruptTypes(r1_32:GetTalkType(), r4_0.Pause)) do
    r0_32:PauseTaskQueue(r1_32, r2_0.Working, r9_32)
    r0_32:PauseTaskQueue(r1_32, r2_0.Paused, r9_32)
  end
  -- close: r4_32
end
function r0_0.OnCannotRegisterTask(r0_33, r1_33)
  -- line: [417, 419] id: 33
  DebugPrint("@@@ 注册任务失败:", r1_33)
end
function r0_0.OnTaskWorking(r0_34, r1_34)
  -- line: [421, 425] id: 34
  DebugPrint("@@@ Talk开始工作", r1_34)
  r0_34:MoveTaskState(r1_34, r2_0.Working)
  r0_34:TryFireEnterStoryEvent(r1_34)
end
function r0_0.OnTaskFinished(r0_35, r1_35, r2_35, r3_35)
  -- line: [427, 431] id: 35
  DebugPrint("@@@ TalkTask执行结束", r1_35)
  r0_35:MoveTaskState(r1_35, r2_0.Finished)
  r0_35:OnTaskFinishedInternal(r1_35, r2_35, r3_35)
end
function r0_0.OnTaskFinishedInternal(r0_36, r1_36, r2_36, r3_36)
  -- line: [433, 444] id: 36
  DebugPrint("@@@ TS:OnTaskFinishedInternal", r1_36, r2_36, r3_36)
  r0_36:TryResumePauseTalk(r1_36)
  r0_36:ClearRefs(r1_36)
  r0_36:TryFireLeaveStoryEvent()
  if r1_36.OnTalkEndCallback then
    r1_36.OnTalkEndCallback(r2_36, r3_36)
  end
  if not r0_36.bPauseAdvance then
    r0_36:TryAdvanceTaskQueue()
  end
end
function r0_0.OnTaskQueued(r0_37, r1_37)
  -- line: [446, 449] id: 37
  DebugPrint("@@@ TS:OnTaskQueued", r1_37)
  r0_37:MoveTaskState(r1_37, r2_0.Queue)
end
function r0_0.OnTaskInterrupted(r0_38, r1_38)
  -- line: [451, 460] id: 38
  DebugPrint("@@@ TS:OnTaskInterrupted", r1_38)
  r0_38:OnDifferentStateTaskInterrupted(r1_38)
  r0_38:MoveTaskState(r1_38, r2_0.Interrupted)
  r0_38:ClearRefs(r1_38)
  if r1_38.OnTalkEndCallback then
    r1_38.OnTalkEndCallback()
  end
  r0_38:TryFireLeaveStoryEvent()
end
function r0_0.OnDifferentStateTaskInterrupted(r0_39, r1_39)
  -- line: [462, 473] id: 39
  local r2_39 = r1_39:GetState()
  DebugPrint("@@@ OnDifferentStateTaskInterrupted", r1_39, r2_39)
  if r2_39 == r2_0.Working then
    r1_39:OnInterrupted()
  elseif r2_39 == r2_0.Paused then
    r1_39:OnInterrupted()
  else
    DebugPrint("@@@ 无法打断除Working以外状态的对话", r2_39, r1_39)
    return 
  end
end
function r0_0.OnDifferentStateTaskPaused(r0_40, r1_40)
  -- line: [475, 485] id: 40
  DebugPrint("@@@ TS:OnDifferentStateTaskPaused", r1_40, r1_40:GetState())
  local r2_40 = r1_40:GetState()
  if r2_40 == r2_0.Working then
    r1_40:OnPaused()
  elseif r2_40 ~= r2_0.Paused then
    DebugPrint("@@@ 无法暂停除Working以外状态的对话", r2_40, r1_40)
    return 
  end
end
function r0_0.OnDifferentLastStateTaskPauseResumed(r0_41, r1_41)
  -- line: [487, 507] id: 41
  DebugPrint("@@@ TS:OnDifferentLastStateTaskPauseResumed", r1_41)
  local r2_41 = r1_41:GetState()
  if r2_41 ~= r2_0.Paused then
    DebugPrint("@@@ 无法恢复暂停除Paused以外状态的对话", r2_41, r1_41)
    return 
  end
  if not IsEmptyTable(r0_41:GetPausedByTasks(r1_41)) then
    return 
  end
  local r4_41 = r1_41:GetLastState()
  if r4_41 == r2_0.Working then
    r0_41:MoveTaskState(r1_41, r2_0.Working)
    r1_41:OnPauseResumed()
  else
    DebugPrint("@@@ 无法恢复暂停原状态为Working以外的对话", r4_41, r1_41)
    r0_41:ClearRefs(r1_41)
    return 
  end
end
function r0_0.OnGamePauseChanged(r0_42, r1_42)
  -- line: [509, 516] id: 42
  local r2_42 = "GameModePause"
  if r1_42 then
    r0_42:PauseLightTalkTask(r2_42)
  else
    r0_42:ResumeLightTalkTask(r2_42)
  end
end
local r10_0 = "LightTaskPauser"
function r0_0.PauseLightTalkTask(r0_43, r1_43)
  -- line: [519, 530] id: 43
  DebugPrint("@@@ TalkSubsystem:PauseLightTalkTask", r1_43)
  r0_43.PauseAffectTaskTag[r1_43] = true
  r0_43.bPauseLightTask = true
  if not not table.isempty(r0_43.PauseAffectTaskTag) then
    for r7_43, r8_43 in pairs(r8_0) do
      r0_43:PauseTaskQueue(r10_0, r2_0.Working, r7_43)
      r0_43:PauseTaskQueue(r10_0, r2_0.Paused, r7_43)
    end
    -- close: r3_43
  end
end
function r0_0.ResumeLightTalkTask(r0_44, r1_44)
  -- line: [532, 542] id: 44
  DebugPrint("@@@ TalkSubsystem:ResumeLightTalkTask", r1_44)
  r0_44.PauseAffectTaskTag[r1_44] = nil
  local r2_44 = not table.isempty(r0_44.PauseAffectTaskTag)
  if r0_44.bPauseLightTask and not r2_44 then
    r0_44.bPauseLightTask = r2_44
    r0_44:TryResumePauseTalk(r10_0)
    r0_44:TryWorkingWaitGameUnpauseTasks()
  end
end
function r0_0.TryWorkingWaitGameUnpauseTasks(r0_45)
  -- line: [544, 557] id: 45
  for r5_45, r6_45 in pairs(r8_0) do
    local r7_45 = r0_45:GetTasksQueue(r2_0.WaitGameUnpause, r5_45)
    local r8_45 = {}
    for r13_45, r14_45 in pairs(r7_45) do
      r8_45[r13_45] = r14_45
    end
    -- close: r9_45
    for r13_45, r14_45 in pairs(r8_45) do
      DebugPrint("@@@ TryWorkingWaitGameUnpauseTasks", r14_45, r5_45)
      r0_45:TryWorkingTask(r14_45)
    end
    -- close: r9_45
  end
  -- close: r1_45
end
local r11_0 = "DeathPause"
function r0_0.OnPlayerDead(r0_46)
  -- line: [560, 565] id: 46
  for r5_46, r6_46 in pairs(r9_0) do
    r0_46:PauseTaskQueue(r11_0, r2_0.Working, r6_46)
    r0_46:PauseTaskQueue(r11_0, r2_0.Paused, r6_46)
  end
  -- close: r1_46
end
function r0_0.OnPlayerRecover(r0_47)
  -- line: [567, 569] id: 47
  r0_47:TryResumePauseTalk(r11_0)
end
function r0_0.GetTasksQueue(r0_48, r1_48, r2_48)
  -- line: [576, 579] id: 48
  r0_48:CheckType(r2_48)
  return r0_48[r1_48 .. "TasksOf" .. r2_48]
end
function r0_0.GetRegisteredTalkData(r0_49, r1_49)
  -- line: [581, 584] id: 49
  return r0_49.RegisteredDatas[r1_49]
end
function r0_0.GetTaskDataFromTalkTask(r0_50, r1_50)
  -- line: [586, 596] id: 50
  if not r1_50 then
    return 
  end
  local r2_50 = r0_50.TalkTaskDatas[r1_50]
  if not r2_50 then
    return 
  end
  return r2_50
end
function r0_0.GetPausedTasks(r0_51, r1_51)
  -- line: [598, 600] id: 51
  return r0_51.PausedTasks[r1_51]
end
function r0_0.GetPausedByTasks(r0_52, r1_52)
  -- line: [602, 604] id: 52
  return r0_52.PausedByTasks[r1_52]
end
function r0_0.GetAllTasks(r0_53)
  -- line: [606, 608] id: 53
  return r0_53.TalkTasks
end
function r0_0.RemovePausedTasks(r0_54, r1_54, r2_54)
  -- line: [610, 625] id: 54
  DebugPrint("@@@ 清除被暂停的TalkTask", r1_54, r2_54)
  local r3_54 = r0_54:GetPausedTasks(r1_54)
  if not r3_54 then
    return 
  end
  for r8_54, r9_54 in pairs(r3_54) do
    if r2_54 then
      r0_54:RemovePausedTasks(r8_54, r2_54)
    end
    r0_54.PausedByTasks[r8_54][r1_54] = nil
  end
  -- close: r4_54
  r0_54.PausedTasks[r1_54] = nil
end
function r0_0.CheckType(r0_55, r1_55)
  -- line: [627, 634] id: 55
  if not (r1_55 and r1_0[r1_55] ~= nil) then
    error("尝试访问非ETalkType中的Type，具体为" .. r1_55)
    return 
  end
  return true
end
function r0_0.CheckTalkCanBeInterrupted(r0_56, r1_56)
  -- line: [636, 648] id: 56
  local r2_56 = r1_56:GetState()
  if r2_56 == r2_0.Interrupted or r2_56 == r2_0.Finished then
    return false
  end
  return true
end
function r0_0.IsTaskShouldQueue(r0_57, r1_57, r2_57)
  -- line: [650, 660] id: 57
  for r9_57, r10_57 in pairs(r0_57.TalkInterruptComponent:GetSpecificInterruptTypes(r1_57:GetTalkType(), r4_0.Queue)) do
    if not IsEmptyTable(r0_57:GetTasksQueue(r2_0.Working, r10_57)) then
      return true
    end
  end
  -- close: r5_57
  return false
end
function r0_0.TryFireEnterStoryEvent(r0_58, r1_58)
  -- line: [670, 686] id: 58
  if not r0_58.bInImmersiveTalk then
    r0_58.bInImmersiveTalk = r0_58:CheckInImmersiveTalk()
    DebugPrint("TS:TryFireEnterStoryEvent", r0_58.bInImmersiveTalk)
    if r0_58.bInImmersiveTalk then
      local r2_58 = r0_58.TalkTaskDatas[r1_58]
      EventManager:FireEvent(EventID.EnterImmersiveTalk, r2_58 and r2_58.TalkTriggerId)
      if r0_58.OnStoryBegin then
        r0_58.OnStoryBegin:Broadcast()
      end
    end
  end
  if GWorld.GameInstance then
    DebugPrint("TS: 开TalkContext Tick")
    GWorld.GameInstance.bTalkContextTickable = true
  end
end
function r0_0.TryFireLeaveStoryEvent(r0_59)
  -- line: [688, 706] id: 59
  if r0_59.bInImmersiveTalk then
    r0_59.bInImmersiveTalk = r0_59:CheckInImmersiveTalk()
    DebugPrint("TS:TryFireLeaveStoryEvent", r0_59.bInImmersiveTalk)
    if not r0_59.bInImmersiveTalk then
      EventManager:FireEvent(EventID.LeaveImmersiveTalk)
      if r0_59.OnStoryEnd then
        r0_59.OnStoryEnd:Broadcast()
      end
    end
  end
  r7_0:RemovePlayerInvincible()
  if IsEmptyTable(r0_59.TalkTasks) and GWorld.GameInstance then
    DebugPrint("TS: 停TalkContext Tick")
    GWorld.GameInstance.bTalkContextTickable = false
  end
end
local r12_0 = {
  r1_0.Black,
  r1_0.BlackISS,
  r1_0.Cinematic,
  r1_0.Show,
  r1_0.FaultBlack,
  r1_0.FixSimple,
  r1_0.FreeSimple,
  r1_0.Simple,
  r1_0.Impression,
  r1_0.QuestImpression
}
function r0_0.CheckInImmersiveTalk(r0_60)
  -- line: [720, 733] id: 60
  local r1_60 = false
  local r2_60 = nil
  for r7_60, r8_60 in pairs(r12_0) do
    if not IsEmptyTable(r0_60:GetTasksQueue(r2_0.Working, r8_60)) then
      r1_60 = true
      r2_60 = r8_60
      break
    end
  end
  -- close: r3_60
  DebugPrint("TS:CheckInImmersiveTalk 检测是否处于沉浸式剧情中:", r1_60, r2_60)
  return r1_60
end
function r0_0.CheckCanRegisterTask(r0_61, r1_61, r2_61)
  -- line: [735, 741] id: 61
  if r0_61:CheckBlockedByOthers(r1_61:GetTalkType()) then
    return r3_0.BlockedByOtherTask
  end
  return r3_0.Succeed
end
function r0_0.CheckBlockedByOthers(r0_62, r1_62)
  -- line: [743, 755] id: 62
  DebugPrint("@@@ CheckBlockedByOthers", r1_62)
  for r7_62, r8_62 in pairs(r0_62.TalkInterruptComponent:GetSpecificInterruptTypes(r1_62, r4_0.Blocked)) do
    DebugPrint("@@@ CheckBlockedBy", r8_62)
    if not IsEmptyTable(r0_62:GetTasksQueue(r2_0.Working, r8_62)) then
      DebugPrint("@@@ " .. r1_62 .. "任务被正在运行中的" .. r8_62 .. "任务阻塞")
      return true
    end
  end
  -- close: r3_62
  return false
end
function r0_0.RecordTalkTaskAndData(r0_63, r1_63, r2_63, r3_63)
  -- line: [757, 764] id: 63
  DebugPrint("@@@ RecordTalkTaskAndData", r1_63)
  if r1_63 and r3_63 then
    r0_63.TaskKeys[r1_63] = r3_63
    r0_63.TalkTasks[r3_63] = r1_63
    r0_63.TalkTaskDatas[r1_63] = r2_63
  end
end
function r0_0.UnrecordTalkTask(r0_64, r1_64)
  -- line: [766, 777] id: 64
  if not r1_64 then
    return 
  end
  DebugPrint("@@@ UnrecordTalkTaskAndData", r1_64)
  local r2_64 = r0_64.TaskKeys[r1_64]
  if r2_64 then
    r0_64.TalkTasks[r2_64] = nil
    r0_64.TalkTaskDatas[r1_64] = nil
    r0_64.TaskKeys[r1_64] = nil
  end
end
function r0_0.MoveTaskState(r0_65, r1_65, r2_65)
  -- line: [779, 790] id: 65
  local r3_65 = r1_65:GetState()
  if r3_65 == r2_65 then
    return 
  end
  r0_65:OnTaskExitState(r1_65)
  r1_65:SetState(r2_65)
  r0_65:OnTaskEnterState(r1_65)
  DebugPrint("@@@ TS: 移动TaskState " .. r3_65 .. " -> " .. r2_65, r1_65)
end
function r0_0.OnTaskEnterState(r0_66, r1_66)
  -- line: [792, 797] id: 66
  r0_66:GetTasksQueue(r1_66:GetState(), r1_66:GetTalkType())[r1_66] = r1_66
end
function r0_0.OnTaskExitState(r0_67, r1_67)
  -- line: [799, 804] id: 67
  r0_67:GetTasksQueue(r1_67:GetState(), r1_67:GetTalkType())[r1_67] = nil
end
function r0_0.CreateTalkTaskData(r0_68, r1_68)
  -- line: [806, 810] id: 68
  local r6_68 = nil	-- notice: implicit variable refs by block#[0]
  r5_68, r6_68 = r0_68.TalkTaskDataProcesser:ProcessRawTalkData(r0_68:GetRegisteredTalkData(r1_68))
  return r5_68, r6_68
end
function r0_0.ClearRefs(r0_69, r1_69)
  -- line: [812, 817] id: 69
  DebugPrint("@@@ TS:ClearRefs", r1_69)
  r0_69:MoveTaskState(r1_69, r2_0.Finished)
  r0_69:UnrecordTalkTask(r1_69)
  r0_69:ClearInvalidTaskQueues()
end
function r0_0.ClearInvalidTaskQueues(r0_70)
  -- line: [819, 824] id: 70
  for r5_70, r6_70 in pairs(r1_0) do
    r0_70:ClearTaskQueue(r2_0.Finished, r6_70)
    r0_70:ClearTaskQueue(r2_0.Interrupted, r6_70)
  end
  -- close: r1_70
end
function r0_0.ClearTaskQueue(r0_71, r1_71, r2_71)
  -- line: [826, 828] id: 71
  r0_71[r1_71 .. "TasksOf" .. r2_71] = {}
end
function r0_0.InterruptTaskQueue(r0_72, r1_72, r2_72)
  -- line: [830, 841] id: 72
  local r3_72 = r0_72:GetTasksQueue(r1_72, r2_72)
  local r4_72 = {}
  for r9_72, r10_72 in pairs(r3_72) do
    r4_72[r9_72] = r10_72
  end
  -- close: r5_72
  for r9_72, r10_72 in pairs(r4_72) do
    DebugPrint("@@@ InterruptTaskQueue", r10_72, r1_72, r2_72)
    r0_72:ForceInterruptTalk(r10_72)
  end
  -- close: r5_72
end
function r0_0.PauseTaskQueue(r0_73, r1_73, r2_73, r3_73)
  -- line: [843, 855] id: 73
  DebugPrint("@@@ 暂停TalkTask队列", r1_73, r2_73, r3_73)
  local r4_73 = r0_73:GetTasksQueue(r2_73, r3_73)
  local r5_73 = {}
  for r10_73, r11_73 in pairs(r4_73) do
    r5_73[r10_73] = r11_73
  end
  -- close: r6_73
  for r10_73, r11_73 in pairs(r5_73) do
    DebugPrint("@@@ PauseTaskQueue", r11_73, r2_73, r3_73)
    r0_73:ForcePauseTalk(r11_73, r1_73)
  end
  -- close: r6_73
end
function r0_0.RecordPausedTasks(r0_74, r1_74, r2_74)
  -- line: [857, 863] id: 74
  DebugPrint("@@@ 记录被暂停的TalkTask", r1_74, r2_74)
  r0_74.PausedTasks[r1_74] = r0_74.PausedTasks[r1_74] and {}
  r0_74.PausedTasks[r1_74][r2_74] = 1
  r0_74.PausedByTasks[r2_74] = r0_74.PausedByTasks[r2_74] and {}
  r0_74.PausedByTasks[r2_74][r1_74] = 1
end
function r0_0.PreClearInterruptedTasks(r0_75, r1_75)
  -- line: [867, 876] id: 75
  for r8_75, r9_75 in pairs(r0_75.TalkInterruptComponent:GetSpecificInterruptTypes(r1_75:GetTalkType(), r4_0.Interrupt)) do
    for r15_75, r16_75 in pairs(r0_75:GetTasksQueue(r2_0.Working, r9_75)) do
      r0_75:RemovePausedTasks(r16_75, true)
    end
    -- close: r11_75
  end
  -- close: r4_75
end
function r0_0.PlayUIAnimationSequenceEvent(r0_76, r1_76, r2_76, r3_76, r4_76)
  -- line: [878, 895] id: 76
  DebugPrint("BP_TalkSubsystem:PlayUIAnimationSequenceEvent", r1_76, r2_76, r4_76)
  local r5_76 = UIManager(r0_76):GetUIObj(r1_76) and UIManager(r0_76):LoadUINew(r1_76, r3_76)
  if not r5_76 or not r5_76[r2_76] then
    return 
  end
  r5_76:PlayAnimation(r5_76[r2_76])
  if r4_76 then
    r0_76:AddTimer(r5_76[r2_76]:GetEndTime(), function()
      -- line: [891, 893] id: 77
      UIManager(r0_76):UnLoadUINew(r1_76)
    end)
  end
end
function r0_0.ScreenCaptureForUISequenceEvent(r0_78, r1_78, r2_78, r3_78)
  -- line: [897, 926] id: 78
  local r4_78 = UIManager(r0_78):GetUIObj(r1_78)
  if not r4_78 or not r4_78[r2_78] then
    return 
  end
  local r5_78 = r4_78[r2_78]:GetDynamicMaterial()
  if not r5_78 then
    return 
  end
  local r6_78 = UGameplayStatics.GetPlayerCharacter(r0_78, 0)
  local r7_78 = UKismetRenderingLibrary.CreateRenderTarget2D(r0_78)
  local r8_78 = UWidgetLayoutLibrary.GetViewportSize(r0_78)
  URuntimeCommonFunctionLibrary.RenderTarget2DResize(r7_78, r8_78.X, r8_78.Y)
  local r9_78 = NewObject(USceneCaptureComponent2D, r6_78)
  r9_78:K2_AttachToComponent(r6_78.CharCameraComponent)
  r9_78:K2_SetRelativeTransform(FTransform(), false, nil, false)
  URuntimeCommonFunctionLibrary.RegisterComponent(r9_78)
  r9_78.FOVAngle = r6_78.CharCameraComponent.FieldOfView
  r9_78.TextureTarget = r7_78
  r9_78.CaptureSource = ESceneCaptureSource.SCS_FinalColorHDR
  r9_78:SetComponentTickEnabled(false)
  r9_78.bCaptureEveryFrame = false
  r9_78.bCaptureOnMovement = false
  for r14_78, r15_78 in pairs(r3_78:ToTable()) do
    r5_78:SetTextureParameterValue(r15_78, r7_78)
  end
  -- close: r10_78
  r9_78:CaptureScene()
  r9_78:K2_DestroyComponent(r9_78)
end
function r0_0.GetNpcPlayDialogueCallback(r0_79, r1_79)
  -- line: [928, 948] id: 79
  local r2_79 = DataMgr.Npc[r1_79]
  if not r2_79 then
    return nil
  end
  if r2_79.NpcType == "Show" then
    return {
      Func = function(r0_80, r1_80)
        -- line: [934, 946] id: 80
        local r2_80 = GWorld:GetAvatar()
        if not r2_80 then
          return 
        end
        if r2_80:CheckSignBoardNpcTalkIsRecord(r1_79, r1_80) then
          return 
        end
        if not r2_80:CheckSignBoardNpcTalkValid(r1_79, r1_80) then
          return 
        end
        r2_80:TriggerRecordSignBoardNpcTalk(r1_79, r1_80)
      end,
    }
  end
end
return r0_0
