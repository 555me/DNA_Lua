-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Theater\WBP_Activity_Theater_Toast_PC_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.BP_UIState_C"
})
local r1_0 = require("BluePrints.Story.Talk.View.TalkUtils")
function r0_0.Initialize(r0_1, r1_1)
  -- line: [22, 35] id: 1
  r0_1.RewardList = {}
  r0_1.LevelList = {}
  r0_1.LevelId2Index = {}
  r0_1.StageTime = 0
  r0_1.StepInfo = {}
  r0_1.Step = 0
  r0_1.TheaterConstant = DataMgr.TheaterConstant
  r0_1.CurrentSelectedEntry = nil
  r0_1.CurrentGameRound = 0
  r0_1.CurrentRoundState = false
  r0_1.EnablePerform = true
  r0_1.ReStartPerform = false
end
function r0_0.Construct(r0_2)
  -- line: [37, 52] id: 2
  r0_2:PlayTalk(DataMgr.TheaterConstant.StartGameTalkConfigId.ConstantValue, r0_2:FindTargetNpc())
  r0_2:InitItemInfo()
  r0_2:InitListenEvent()
  r0_2.Panel_Title:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_2.ProgressBar_Title:SetPercent(0)
  r0_2:PlayAnimation(r0_2.Open_In)
  r0_2.Text_open:SetText(GText("TheaterOnline_Game_Start01"))
  r0_2.Text_open2:SetText(GText("TheaterOnline_Game_Start02"))
  AudioManager(r0_2):PlayUISound(r0_2, "event:/ui/common/toast_positive", nil, nil)
end
function r0_0.InitListenEvent(r0_3)
  -- line: [54, 58] id: 3
  r0_3:AddDispatcher(EventID.OnTheaterPerformGameEnd, r0_3, r0_3.TheaterPerformGameEnd)
  r0_3:AddDispatcher(EventID.OnTheaterLevelStart, r0_3, r0_3.OnLevelStart)
  r0_3:AddDispatcher(EventID.OnTheaterPerform, r0_3, r0_3.TheaterPerform)
end
function r0_0.InitItemInfo(r0_4)
  -- line: [60, 92] id: 4
  r0_4.LevelList = {
    {
      LevelId = "1001",
      LevelName = GText("剧院联机-关卡1"),
      LevelIndex = 1,
      PerformId = 0,
    },
    {
      LevelId = "1002",
      LevelName = GText("剧院联机-关卡2"),
      LevelIndex = 2,
      PerformId = 0,
    },
    {
      LevelId = "1003",
      LevelName = GText("剧院联机-关卡3"),
      LevelIndex = 3,
      PerformId = 0,
    },
    {
      LevelId = "1004",
      LevelName = GText("剧院联机-关卡4"),
      LevelIndex = 4,
      PerformId = 0,
    },
    {
      LevelId = "1005",
      LevelName = GText("剧院联机-关卡5"),
      LevelIndex = 5,
      PerformId = 0,
    }
  }
  for r4_4 = 1, 12, 1 do
    local r5_4 = r0_4.StepInfo
    local r6_4 = {}
    local r7_4 = r0_4.TheaterConstant["Step" .. r4_4]
    if r7_4 then
      r7_4 = r0_4.TheaterConstant["Step" .. r4_4].ConstantValue and 0
    else
      goto label_71	-- block#3 is visited secondly
    end
    r6_4.Time = r7_4
    r6_4.Refer = nil
    r6_4.RandomId = nil
    r5_4[r4_4] = r6_4
  end
  r0_4.ListView_Title:ClearListItems()
  local r1_4 = TimeUtils.NowTime()
  for r6_4, r7_4 in pairs(r0_4.LevelList) do
    local r8_4 = NewObject(UIUtils.GetCommonItemContentClass())
    r8_4.LevelId = r7_4.LevelId
    r8_4.LevelName = r7_4.LevelName
    r8_4.Time = r0_4.StepInfo[r6_4 * 2 + 1].Time - r0_4.StepInfo[r6_4 * 2].Time
    r8_4.StartTime = r1_4 + r0_4.StepInfo[r6_4 * 2].Time
    r8_4.EndTime = r1_4 + r0_4.StepInfo[r6_4 * 2 + 1].Time
    r8_4.Index = r6_4
    r8_4.ParentWidget = r0_4
    r0_4.ListView_Title:AddItem(r8_4)
    r0_4.LevelId2Index[r7_4.LevelId] = r6_4
  end
  -- close: r2_4
  r0_4.ListView_Title:RequestRefresh()
end
function r0_0.ResetPerformedRound(r0_5)
  -- line: [94, 146] id: 5
  local r1_5 = TimeUtils.NowTime() - r0_5.ActivityStartTime
  local r2_5 = nil
  local r3_5 = 0
  r0_5:AddDelayFrameFunc(function()
    -- line: [99, 145] id: 6
    for r3_6 = 2, 11, 1 do
      local r4_6 = r0_5.StepInfo[r3_6].Time
      local r5_6 = r0_5.StepInfo[r3_6 + 1]
      if r5_6 then
        r5_6 = r0_5.StepInfo[r3_6 + 1].Time and math.huge
      else
        goto label_20	-- block#3 is visited secondly
      end
      if r5_6 < r1_5 then
        if r3_6 % 2 == 0 then
          local r6_6 = math.tointeger(r3_6 / 2)
          r3_5 = (r6_6 + -1) * 0.25
          local r7_6 = r0_5.ListView_Title:GetItemAt(r6_6 + -1)
          if r7_6.SelfWidget then
            local r8_6 = UE4.UGameplayStatics.GetGameInstance(r0_5)
            if r8_6.TheaterPerformState and r8_6.TheaterPerformState[r6_6] == true then
              r7_6.SelfWidget:PlayAnimation(r7_6.SelfWidget.Success)
            else
              r7_6.SelfWidget:PlayAnimation(r7_6.SelfWidget.Fail)
            end
            r7_6.SelfWidget.Image_Time:SetVisibility(UE4.ESlateVisibility.Collapsed)
          end
          r0_5.ProgressBar_Title:SetPercent((r6_6 + -1) * 0.25)
        end
      elseif r3_6 % 2 ~= 0 then
        r0_5.ProgressBar_Title:SetPercent(r3_5 + (r1_5 - r4_6) / (r5_6 - r4_6) * 0.25)
        break
      else
        local r6_6 = math.tointeger(r3_6 / 2)
        local r7_6 = r0_5.ListView_Title:GetItemAt(r6_6 + -1)
        if r7_6.SelfWidget then
          r7_6.SelfWidget:PlayAnimation(r7_6.SelfWidget.Fail)
          r7_6.SelfWidget.Image_Time:SetVisibility(UE4.ESlateVisibility.Collapsed)
          r0_5.InterruptedRound = r6_6
        end
        r0_5.ProgressBar_Title:SetPercent((r6_6 + -1) * 0.25)
        break
      end
    end
    r0_5:StartStageTimer()
  end, 5)
end
function r0_0.OnLoaded(r0_7, ...)
  -- line: [148, 150] id: 7
  r0_7.Super.OnLoaded(r0_7, ...)
end
function r0_0.UpdatePerformList(r0_8, r1_8)
  -- line: [152, 159] id: 8
  if not r1_8 then
    return 
  end
  for r6_8, r7_8 in pairs(r1_8) do
    r0_8.LevelList[r6_8].PerformId = r7_8
  end
  -- close: r2_8
end
function r0_0.TheaterPerform(r0_9, r1_9)
  -- line: [161, 182] id: 9
  DebugPrint("ayff test Perform :", r1_9)
  if r0_9.CurrentRoundState == true then
    return 
  end
  if not r0_9.EnablePerform then
    DebugPrint("ayff 当前不允许表演，忽略此次请求")
    return 
  end
  local r2_9 = GWorld:GetAvatar()
  if not r2_9 then
    return 
  end
  local function r3_9(r0_10, r1_10)
    -- line: [174, 177] id: 10
    DebugPrint("ayff test 剧院回调：", ErrorCode:Name(r0_10), r1_10)
    r0_9:TheaterPerformCallback(r0_10, r1_10)
  end
  local r4_9 = r0_9.CurLevelIndex and 0
  if r4_9 ~= 0 then
    r2_9:TheaterPerform(math.tointeger(r1_9), r4_9, r3_9)
  end
end
function r0_0.TheaterPerformCallback(r0_11, r1_11, r2_11)
  -- line: [184, 206] id: 11
  DebugPrint("ayff 剧院活动表演结果:", ErrorCode:Name(r1_11), r2_11)
  local r3_11 = DataMgr.ErrorCode[r1_11]
  if r3_11 then
    r3_11 = DataMgr.ErrorCode[r1_11].ErrorCodeContent and GText("无误")
  else
    goto label_19	-- block#2 is visited secondly
  end
  DebugPrint("ayff 剧院活动表演结果提示内容:", r3_11)
  if r1_11 == ErrorCode.RET_SUCCESS then
    r0_11:AddTimer(DataMgr.TheaterConstant.TheaterPerformResultDelay.ConstantValue and 0, function()
      -- line: [190, 193] id: 12
      r0_11:PlayAnimation(r0_11.Tips_Success)
      AudioManager(r0_11):PlayUISound(r0_11, "event:/ui/activity/theater_online_skill_match", nil, nil)
    end, false, 0, "TheaterPerformResultDelay")
    if r0_11.CurrentSelectedEntry then
      r0_11.CurrentSelectedEntry:SetSuccess(true)
      r0_11.CurrentRoundState = true
    end
    local r5_11 = UE4.UGameplayStatics.GetGameInstance(r0_11)
    if not r5_11.TheaterPerformState then
      r5_11.TheaterPerformState = {}
    end
    r5_11.TheaterPerformState[r0_11.CurLevelIndex] = true
  end
end
function r0_0.OnAnimationFinished(r0_13, r1_13)
  -- line: [208, 216] id: 13
  if r1_13 == r0_13.Open_In then
    r0_13:PlayAnimation(r0_13.Open_Out)
    r0_13:OnActivityStart()
  elseif r1_13 == r0_13.Tips_Success then
  end
end
function r0_0.OnActivityStart(r0_14)
  -- line: [218, 233] id: 14
  r0_14.Panel_Title:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_14:PlayAnimation(r0_14.Title_In)
  if r0_14.ReStartPerform then
    local r1_14 = TimeUtils.NowTime()
    r0_14.ActivityStartTime = r1_14 - r1_14 % 1800
    r0_14:ResetPerformedRound()
  else
    r0_14.ActivityStartTime = TimeUtils.NowTime()
    r0_14:StartStageTimer()
  end
  DebugPrint("ayff 剧院活动开始时间:", r0_14.ActivityStartTime)
end
function r0_0.OnLevelStart(r0_15, r1_15)
  -- line: [235, 286] id: 15
  local r2_15 = r0_15.LevelId2Index[r1_15]
  local r3_15 = r0_15.ListView_Title:GetItemAt(r2_15 + -1)
  local r4_15 = r3_15.SelfWidget
  r0_15.CurrentSelectedEntry = r4_15
  r0_15.CurrentRoundState = false
  r0_15.Text_Level:SetText(string.format(GText("TheaterOnline_Game_Round"), r2_15))
  r0_15.Text_Message:SetText(r1_0:DialogueIdToContent(DataMgr.TheaterRandom[r0_15.LevelList[r2_15].PerformId].TalkConfigId))
  if r4_15 then
    if not r0_15.InterruptedRound or r0_15.InterruptedRound ~= r2_15 then
      r4_15:OnLevelStart()
      r4_15:PlayAnimation(r4_15.Normal)
    end
  else
    r3_15.IsNotDisplay = true
    DebugPrint("ayff 未找到对应的EntryWidget，Index:", r2_15)
  end
  r0_15:PlayAnimation(r0_15.Tips_In)
  r0_15:UpdateProgress(r2_15)
  r0_15.CurrentRountState = false
  r0_15.CurLevelIndex = r2_15
  if r0_15.PlayLoopSoundTimer then
    r0_15:RemoveTimer(r0_15.PlayLoopSoundTimer)
    r0_15.PlayLoopSoundTimer = nil
  end
  AudioManager(r0_15):PlayUISound(r0_15, "event:/ui/activity/theater_online_skill_instruct", nil, nil)
  if r0_15.RestProgressTimer then
    r0_15:RemoveTimer(r0_15.RestProgressTimer)
    r0_15.RestProgressTimer = nil
  end
  local r10_15 = r0_15.LevelList[r2_15].PerformId
  local r11_15 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  EventManager:FireEvent(EventID.OnTheaterNPCPerform)
  local r12_15 = r0_15:FindTargetNpc()
  if r12_15 then
    r0_15:PerformAction(r10_15, r12_15)
  end
end
function r0_0.FindTargetNpc(r0_16)
  -- line: [288, 316] id: 16
  local r1_16 = TimeUtils.NowTime()
  local r2_16 = nil
  for r7_16, r8_16 in pairs(DataMgr.TheaterNpc) do
    if r8_16.StartTime and r8_16.EndTime and r8_16.StartTime <= r1_16 and r1_16 < r8_16.EndTime then
      r2_16 = r7_16
      DebugPrint("JLY Found valid TheaterNpc, NpcId:", r7_16, "StartTime:", r8_16.StartTime, "EndTime:", r8_16.EndTime, "NowTime:", r1_16)
      break
    end
  end
  -- close: r3_16
  if not r2_16 then
    DebugPrint("JLY No valid TheaterNpc found for current time:", r1_16)
    return nil
  end
  local r4_16 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance).NpcCharacterMap:FindRef(r2_16)
  if not r4_16 then
    DebugPrint("JLY NpcCharacterMap does not contain NpcId:", r2_16)
  end
  return r4_16
end
function r0_0.PerformAction(r0_17, r1_17, r2_17)
  -- line: [318, 371] id: 17
  local r3_17 = GWorld:GetAvatar()
  local r4_17 = DataMgr.TheaterRandom[r1_17]
  local r6_17 = GWorld.GameInstance
  r0_17.BubbleTalkKey = r6_17:GetTalkContext():StartTalk(r4_17.TalkConfigId, nil, nil, r3_17, r2_17, nil)
  if r4_17.Refer == "Pet" then
    local r8_17 = UE4.UGameplayStatics.GetGameState(r6_17)
    local r9_17 = r4_17.PetNPCID and 900015
    local r10_17 = r0_17.TheaterConstant.PetCreatorID.ConstantValue
    local r11_17 = r8_17:GetStaticCreatorInfo(r10_17)
    if not IsValid(r11_17) then
      DebugPrint("静态点不存在:", r10_17)
      return 
    end
    local r12_17 = r11_17:K2_GetActorLocation()
    local r13_17 = r11_17:K2_GetActorRotation()
    DebugPrint("静态点位置:", r12_17.X, r12_17.Y, r12_17.Z)
    local r14_17 = AEventMgr.CreateUnitContext()
    r14_17.UnitId = r9_17
    r14_17.UnitType = "NPC"
    r14_17.Loc = r12_17
    r14_17.Rotation = r13_17
    r14_17.IntParams:Add("Level", 1)
    r8_17.EventMgr:CreateUnitNew(r14_17, false)
    r0_17.CreatedPetId = r9_17
  elseif r4_17.Refer == "Resource" then
    local r8_17 = DataMgr.Resource[r1_17]
    if r8_17 then
      r2_17:PlayTalkAction(r8_17.PlayAnim)
    end
  end
  if r4_17.MontageName then
    r2_17:NewPlayFacial(r4_17.MontageName)
  end
end
function r0_0.ClearPerformAction(r0_18)
  -- line: [373, 418] id: 18
  if r0_18.BubbleTalkKey then
    local r1_18 = TalkSubsystem()
    if r1_18 then
      r1_18:ForceInterruptTalkTaskData(function(r0_19)
        -- line: [377, 379] id: 19
        return r0_19.FilePath == r0_18.BubbleTalkKey
      end)
    end
    r0_18.BubbleTalkKey = nil
  end
  DebugPrint("JLY ClearPerformAction - 开始清除Pet, CreatedPetId:", r0_18.CreatedPetId)
  if r0_18.CreatedPetId then
    DebugPrint("JLY ClearPerformAction - 存在CreatedPetId:", r0_18.CreatedPetId)
    local r1_18 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
    if not r1_18 then
      DebugPrint("JLY ClearPerformAction - 错误: 无法获取GameState")
      r0_18.CreatedPetId = nil
      return 
    end
    DebugPrint("JLY ClearPerformAction - 成功获取GameState, 准备查找Pet, PetId:", r0_18.CreatedPetId)
    local r2_18 = r1_18:GetNpcInfo(r0_18.CreatedPetId)
    if r2_18 then
      DebugPrint("JLY ClearPerformAction - 找到Pet对象, 检查有效性")
      if IsValid(r2_18) then
        DebugPrint("JLY ClearPerformAction - Pet有效, 开始销毁, PetId:", r0_18.CreatedPetId)
        r2_18:EMActorDestroy(EDestroyReason.TalkContext)
        DebugPrint("JLY ClearPerformAction - Pet销毁完成, PetId:", r0_18.CreatedPetId)
      else
        DebugPrint("JLY ClearPerformAction - Pet对象无效, PetId:", r0_18.CreatedPetId)
      end
    else
      DebugPrint("JLY ClearPerformAction - 错误: 未找到Pet对象, PetId:", r0_18.CreatedPetId)
    end
    r0_18.CreatedPetId = nil
    DebugPrint("JLY ClearPerformAction - 已清空CreatedPetId")
  else
    DebugPrint("JLY ClearPerformAction - CreatedPetId为空, 无需清除Pet")
  end
  local r1_18 = r0_18:FindTargetNpc()
  if r1_18 then
    r1_18:PlayDefaultAnimation()
    r1_18:NewInitDefaultFacial()
  end
end
function r0_0.StartStageTimer(r0_20)
  -- line: [420, 430] id: 20
  if r0_20.StageCheckTimer then
    r0_20:RemoveTimer(r0_20.StageCheckTimer)
  end
  r0_20.StageCheckTimer = r0_20:AddTimer(1, function()
    -- line: [425, 427] id: 21
    r0_20:CheckCurrentStage()
  end, true, 0, "StageCheck", true)
  r0_20:CheckCurrentStage()
end
function r0_0.CheckCurrentStage(r0_22)
  -- line: [432, 460] id: 22
  if not r0_22.ActivityStartTime then
    return 
  end
  local r1_22 = GWorld:GetAvatar()
  if not r1_22 then
    return 
  end
  local r2_22 = r1_22.CurrentRegionId
  if not UE4.UGameplayStatics.GetGameState(GWorld.GameInstance):IsInRegion() or r1_22:IsInHardBoss() or r2_22 ~= 101901 then
    DebugPrint("ayff 离开剧院区域，关闭剧院活动UI regionid:", r2_22)
    r0_22:Close()
  end
  local r5_22 = TimeUtils.NowTime() - r0_22.ActivityStartTime
  local r6_22 = r0_22:GetCurrentStageByTime(r5_22)
  if r6_22 ~= r0_22.CurrentStage then
    r0_22.CurrentStage = r6_22
    r0_22:ExecuteStage(r6_22, r5_22)
  end
end
function r0_0.GetCurrentStageByTime(r0_23, r1_23)
  -- line: [462, 475] id: 23
  for r5_23 = 1, 12, 1 do
    local r6_23 = r0_23.StepInfo[r5_23].Time
    local r7_23 = r0_23.StepInfo[r5_23 + 1]
    if r7_23 then
      r7_23 = r0_23.StepInfo[r5_23 + 1].Time and math.huge
    else
      goto label_20	-- block#3 is visited secondly
    end
    DebugPrint("ayff 阶段:", r5_23, "开始时间:", r6_23, "下阶段开始时间:", r7_23)
    if r6_23 <= r1_23 and r1_23 < r7_23 then
      return r5_23
    end
  end
  return 12
end
function r0_0.ExecuteStage(r0_24, r1_24, r2_24)
  -- line: [477, 507] id: 24
  DebugPrint("ayff 执行阶段:", r1_24, "经过时间:", r2_24)
  local r3_24 = nil	-- notice: implicit variable refs by block#[7, 12, 16]
  if r1_24 == 1 then
    r3_24 = r0_24.LevelList[1].LevelId
    r0_24:AddTimer(0.1, function()
      -- line: [483, 485] id: 25
      r0_24:OnOpeningStart(r3_24)
    end)
    -- close: r3_24
  elseif r1_24 == 2 or r1_24 == 4 or r1_24 == 6 or r1_24 == 8 or r1_24 == 10 then
    r3_24 = math
    r3_24 = r3_24.floor
    r3_24 = r3_24(r1_24 / 2)
    r0_24:OnLevelStart(r0_24.LevelList[r3_24].LevelId)
  elseif r1_24 == 3 or r1_24 == 5 or r1_24 == 7 or r1_24 == 9 then
    r3_24 = r0_24.LevelList
    r3_24 = r3_24[math.floor((r1_24 + 1) / 2)]
    r3_24 = r3_24.LevelId
    r0_24:OnRestStart(r3_24)
    r0_24:ClearPerformAction()
  elseif r1_24 == 11 then
    r0_24:OnEndingStart()
    r0_24:ClearPerformAction()
  elseif r1_24 == 12 then
    r0_24:TheaterPerformGameEnd()
    r3_24 = r0_24.StageCheckTimer
    if r3_24 then
      r0_24:RemoveTimer(r0_24.StageCheckTimer)
      r0_24.StageCheckTimer = nil
    end
  end
end
function r0_0.OnOpeningStart(r0_26, r1_26)
  -- line: [509, 522] id: 26
  local r4_26 = r0_26.ListView_Title:GetItemAt(r0_26.LevelId2Index[r1_26] + -1).SelfWidget
  if r4_26 then
    r4_26:PlayAnimation(r4_26.Normal_Loop)
    r0_26.PlayLoopSoundTimer = r0_26:AddTimer(1, function()
      -- line: [518, 520] id: 27
      AudioManager(r0_26):PlayUISound(r0_26, "event:/ui/activity/theater_online_waiting", nil, nil)
    end, true)
  end
end
function r0_0.OnRestStart(r0_28, r1_28)
  -- line: [524, 544] id: 28
  local r4_28 = r0_28.ListView_Title:GetItemAt(r0_28.LevelId2Index[r1_28] + -1).SelfWidget
  if r4_28 then
    r4_28:PlayAnimation(r4_28.Normal_Loop)
  end
  r0_28.PlayLoopSoundTimer = r0_28:AddTimer(1, function()
    -- line: [534, 536] id: 29
    AudioManager(r0_28):PlayUISound(r0_28, "event:/ui/activity/theater_online_waiting", nil, nil)
  end, true)
  r0_28.Panel_Toast_Tips:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_28.RestProgressTimer = r0_28:AddTimer(0.1, function()
    -- line: [539, 542] id: 30
    r0_28.ProgressBar_Title:SetPercent(r0_28.ProgressBar_Title.Percent + 0.0025)
  end, true)
  r0_28.CurLevelIndex = 0
end
function r0_0.OnEndingStart(r0_31)
  -- line: [546, 547] id: 31
end
function r0_0.OnStandbyStart(r0_32)
  -- line: [549, 550] id: 32
end
function r0_0.TheaterPerformGameEnd(r0_33)
  -- line: [552, 563] id: 33
  DebugPrint("ayff 剧院活动结束 start close ui")
  UIManager(r0_33):ShowUITip("CommonToastMain", GText("TheaterOnline_Game_Finish"), 3)
  UE4.UGameplayStatics.GetGameState(GWorld.GameInstance):ShowSynthesisSuccessEffect(0)
  r0_33:PlayTalk(DataMgr.TheaterConstant.EndGameTalkConfigId.ConstantValue, r0_33:FindTargetNpc())
  UE4.UGameplayStatics.GetGameInstance(r0_33).TheaterPerformState = nil
  r0_33:Close()
end
function r0_0.UpdateProgress(r0_34, r1_34)
  -- line: [565, 568] id: 34
  r0_34.ProgressBar_Title:SetPercent((r1_34 + -1) * 0.25)
end
function r0_0.Close(r0_35)
  -- line: [570, 577] id: 35
  if r0_35.ParentWidget then
    r0_35.ParentWidget.Pos_Rouge_CountDown:ClearChildren()
    r0_35.ParentWidget.Pos_Rouge_CountDown:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  r0_35.IsInit = true
  r0_35.Super.Close(r0_35)
end
function r0_0.Destruct(r0_36)
  -- line: [579, 589] id: 36
  if r0_36.StageCheckTimer then
    r0_36:RemoveTimer(r0_36.StageCheckTimer)
    r0_36.StageCheckTimer = nil
  end
  if r0_36.RestProgressTimer then
    r0_36:RemoveTimer(r0_36.RestProgressTimer)
    r0_36.RestProgressTimer = nil
  end
end
function r0_0.PlayTalk(r0_37, r1_37, r2_37)
  -- line: [591, 599] id: 37
  if not r2_37 then
    return 
  end
  r0_37.BubbleTalkKey = GWorld.GameInstance:GetTalkContext():StartTalk(r1_37, nil, nil, GWorld:GetAvatar(), r2_37, nil)
end
return r0_0
