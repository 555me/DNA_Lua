-- filename: @C:/Pack/Branch/geili11\Content/Script/StoryCreator\StoryLogic\StorylineNodes\QuestNodes\UpdateTaskBarAndTaskMainNode.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")
local r1_0 = require("BluePrints.UI.TaskPanel.TaskUtils")
local r2_0 = require("BluePrints.Common.ClientEvent.ClientEventUtils")
function r0_0.Init(r0_1)
  -- line: [5, 11] id: 1
  r0_1.NewDescription = ""
  r0_1.NewDetail = ""
  r0_1.CurQuestChainId = 0
  r0_1.CurDoingQuestId = 0
  r0_1.SubTaskTargetIndex = 0
end
function r0_0.Start(r0_2, r1_2)
  -- line: [13, 40] id: 2
  local r2_2 = GWorld:GetAvatar()
  if not r2_2 then
    r0_2:FinishAction()
    return 
  end
  r0_2.Context = r1_2
  if r2_2.InSpecialQuest and r2_0:GetCurrentEvent() and r2_0:GetCurrentEvent().PreQuestChainId then
    r0_2.CurQuestChainId = r2_0:GetCurrentEvent().PreQuestChainId
  else
    r0_2.CurQuestChainId = r0_2.QuestChainId
  end
  if r2_2.QuestChains[r0_2.CurQuestChainId] then
    r0_2.CurDoingQuestId = r2_2.QuestChains[r0_2.CurQuestChainId].DoingQuestId
  else
    r0_2.CurDoingQuestId = r0_2.QuestData.QuestId
  end
  r1_0:SetQuestExtraInfo(r0_2.CurQuestChainId, r0_2.CurDoingQuestId, {
    NodeKey = r0_2.Key,
    Node = r0_2,
    Description = r0_2.NewDescription,
    Detail = r0_2.NewDetail,
    SubTaskIndex = r0_2.SubTaskTargetIndex,
  })
  r0_2:OnChooseTrack()
end
function r0_0.OnCancelTrack(r0_3)
  -- line: [42, 43] id: 3
end
function r0_0.OnChooseTrack(r0_4)
  -- line: [45, 78] id: 4
  local r1_4 = GWorld:GetAvatar()
  if not r1_4 then
    r0_4:FinishAction()
    return 
  end
  local r2_4 = false
  r0_4.CurQuestChainId = r0_4.QuestChainId
  if r1_4.InSpecialQuest then
    r0_4.CurQuestChainId = r2_0:GetCurrentEvent().PreQuestChainId
  end
  if r1_4.QuestChains[r0_4.CurQuestChainId] then
    r0_4.CurDoingQuestId = r1_4.QuestChains[r0_4.CurQuestChainId].DoingQuestId
  end
  if r1_4.TrackingQuestChainId == r0_4.CurQuestChainId and r1_4.TrackingQuestChainId ~= 0 and r0_4.CurQuestChainId ~= 0 then
    r2_4 = true
  end
  if r0_4.bIsDynamicEvent and r0_4.NewDescription ~= "" then
    local r5_4 = GWorld.GameInstance:GetGameUIManager():GetUIObj("BattleMain"):GetOrAddDynamicEventWidget()
    if r5_4 then
      r5_4:SetEventInfo(nil, r0_4.NewDescription)
    end
  end
  if r2_4 then
    r0_4:ChangeMainTaskBarInfo()
  else
    r0_4:FinishAction()
  end
end
function r0_0.ChangeMainTaskBarInfo(r0_5)
  -- line: [80, 174] id: 5
  local r1_5 = r1_0:GetTaskBarWidget()
  if not r1_5 then
    r0_5:FinishAction()
    return 
  end
  local r2_5 = GWorld:GetAvatar()
  if not r2_5 then
    r0_5:FinishAction()
    return 
  end
  local r3_5 = r0_5.CurQuestChainId
  local r5_5 = r2_5.InSpecialQuest
  local r6_5 = r1_0:GetQuestExtraInfo(r3_5, r2_5.QuestChains[r3_5].DoingQuestId)
  if not r6_5 or r6_5 == nil or IsEmptyTable(r6_5) then
    r0_5:FinishAction()
    return 
  end
  local r7_5 = ""
  if r0_5.Key ~= nil and r6_5[r0_5.Key] then
    r7_5 = r6_5[r0_5.Key].Description
  else
    for r12_5, r13_5 in pairs(r6_5) do
      if r13_5.Node and r13_5.Node.Type == "UpdateTaskBarAndTaskMainNode" then
        r7_5 = r13_5.Description
        break
      end
    end
    -- close: r8_5
  end
  if r7_5 == "" then
    r0_5:FinishAction()
    return 
  end
  r7_5 = GText(r7_5)
  local function r8_5(r0_6, r1_6)
    -- line: [120, 129] id: 6
    if r0_6 then
      r1_5.CurSpecialTaskInfo.TaskDescribe = r1_6
      r1_5.Text_TaskContent:SetText(r1_5.CurSpecialTaskInfo.TaskDescribe)
    else
      r1_5.CurTaskInfo.TaskDescribe = r1_6
      r1_5.Text_TaskContent:SetText(r1_5.CurTaskInfo.TaskDescribe)
    end
    r0_5:FinishAction()
  end
  local r9_5 = r0_5.SubTaskTargetIndex
  if r9_5 > 0 then
    r9_5 = r1_5.SubTaskWidgetsTable["Branch_" .. tostring(r0_5.SubTaskTargetIndex)]
    if r9_5 then
      r9_5 = r1_5.SubTaskWidgetsTable["Branch_" .. tostring(r0_5.SubTaskTargetIndex)]
      if IsValid(r9_5) then
        r9_5:BindToAnimationFinished(r9_5.CompletionTask, {
          r9_5,
          function()
            -- line: [136, 141] id: 7
            r9_5:UnbindAllFromAnimationFinished(r9_5.CompletionTask)
            r9_5.Text_Describe:SetText(r7_5)
            EMUIAnimationSubsystem:EMPlayAnimation(r9_5, r9_5.Refresh)
            r0_5:FinishAction()
          end
        })
        EMUIAnimationSubsystem:EMPlayAnimation(r9_5, r9_5.CompletionTask)
      end
      -- close: r9_5
    end
  else
    r9_5 = r1_5:IsAnimationPlaying(r1_5.Main_Task_In)
    if r9_5 then
      r1_5:BindToAnimationFinished(r1_5.Main_Task_In, {
        r1_5,
        function()
          -- line: [147, 150] id: 8
          r1_5:UnbindAllFromAnimationFinished(r1_5.Main_Task_In)
          r8_5(r5_5, r7_5)
        end
      })
    else
      r9_5 = r1_5:IsAnimationPlaying(r1_5.Main_Task_Out)
      if r9_5 then
        r1_5:BindToAnimationFinished(r1_5.Main_Task_Out, {
          r1_5,
          function()
            -- line: [154, 157] id: 9
            r1_5:UnbindAllFromAnimationFinished(r1_5.Main_Task_Out)
            r8_5(r5_5, r7_5)
          end
        })
      else
        if r5_5 then
          r9_5 = r1_5.CurSpecialTaskInfo
          r9_5.TaskDescribe = r7_5
          r9_5 = r1_5.Text_TaskContent
          r9_5:SetText(r1_5.CurSpecialTaskInfo.TaskDescribe)
        else
          r9_5 = r1_5.CurTaskInfo
          r9_5.TaskDescribe = r7_5
          r9_5 = r1_5.Text_TaskContent
          r9_5:SetText(r1_5.CurTaskInfo.TaskDescribe)
        end
        r1_5:PlayAnimation(r1_5.Main_Task_In)
        r1_5:BindToAnimationFinished(r1_5.Main_Task_In, {
          r1_5,
          function()
            -- line: [169, 172] id: 10
            r1_5:UnbindAllFromAnimationFinished(r1_5.Main_Task_In)
            r0_5:FinishAction()
          end
        })
      end
    end
  end
end
function r0_0.FinishAction(r0_11)
  -- line: [177, 182] id: 11
  if r0_11.HasFinished then
    return 
  end
  r0_11:Finish()
end
function r0_0.Clear(r0_12)
  -- line: [184, 186] id: 12
end
function r0_0.OnQuestlineFail(r0_13)
  -- line: [188, 190] id: 13
  r1_0:ClearQuestExtraInfo(r0_13.CurQuestChainId, r0_13.CurDoingQuestId, r0_13.Key)
end
function r0_0.ClearWhenQuestSuccess(r0_14)
  -- line: [192, 194] id: 14
  r1_0:ClearQuestExtraInfo(r0_14.CurQuestChainId, r0_14.CurDoingQuestId, r0_14.Key)
end
return r0_0
