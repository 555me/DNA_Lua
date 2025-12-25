-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Theater\WBP_Activity_Theater_Toast_PC_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.BP_UIState_C"
})
function r0_0.Initialize(r0_1, r1_1)
  -- line: [21, 32] id: 1
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
end
function r0_0.Construct(r0_2)
  -- line: [34, 49] id: 2
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
  -- line: [51, 55] id: 3
  r0_3:AddDispatcher(EventID.OnTheaterPerformGameEnd, r0_3, r0_3.TheaterPerformGameEnd)
  r0_3:AddDispatcher(EventID.OnTheaterLevelStart, r0_3, r0_3.OnLevelStart)
  r0_3:AddDispatcher(EventID.OnTheaterPerform, r0_3, r0_3.TheaterPerform)
end
function r0_0.InitItemInfo(r0_4)
  -- line: [57, 85] id: 4
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
  for r5_4, r6_4 in pairs(r0_4.LevelList) do
    local r7_4 = NewObject(UIUtils.GetCommonItemContentClass())
    r7_4.LevelId = r6_4.LevelId
    r7_4.LevelName = r6_4.LevelName
    r7_4.Time = r0_4.StepInfo[r5_4 * 2 + 1].Time - r0_4.StepInfo[r5_4 * 2].Time
    r7_4.Index = r5_4
    r7_4.ParentWidget = r0_4
    r0_4.ListView_Title:AddItem(r7_4)
    r0_4.LevelId2Index[r6_4.LevelId] = r5_4
  end
  -- close: r1_4
end
function r0_0.OnLoaded(r0_5, ...)
  -- line: [87, 89] id: 5
  r0_5.Super.OnLoaded(r0_5, ...)
end
function r0_0.UpdatePerformList(r0_6, r1_6)
  -- line: [91, 98] id: 6
  if not r1_6 then
    return 
  end
  for r6_6, r7_6 in pairs(r1_6) do
    r0_6.LevelList[r6_6].PerformId = r7_6
  end
  -- close: r2_6
end
function r0_0.TheaterPerform(r0_7, r1_7)
  -- line: [100, 117] id: 7
  DebugPrint("ayff test Perform :", r1_7)
  if r0_7.CurrentRoundState == true then
    return 
  end
  local r2_7 = GWorld:GetAvatar()
  if not r2_7 then
    return 
  end
  local function r3_7(r0_8, r1_8)
    -- line: [109, 112] id: 8
    DebugPrint("ayff test 剧院回调：", ErrorCode:Name(r0_8), r1_8)
    r0_7:TheaterPerformCallback(r0_8, r1_8)
  end
  local r4_7 = r0_7.CurLevelIndex and 0
  if r4_7 ~= 0 then
    r2_7:TheaterPerform(math.tointeger(r1_7), r4_7, r3_7)
  end
end
function r0_0.TheaterPerformCallback(r0_9, r1_9, r2_9)
  -- line: [119, 135] id: 9
  DebugPrint("ayff 剧院活动表演结果:", ErrorCode:Name(r1_9), r2_9)
  local r3_9 = DataMgr.ErrorCode[r1_9]
  if r3_9 then
    r3_9 = DataMgr.ErrorCode[r1_9].ErrorCodeContent and GText("无误")
  else
    goto label_19	-- block#2 is visited secondly
  end
  DebugPrint("ayff 剧院活动表演结果提示内容:", r3_9)
  if r1_9 == ErrorCode.RET_SUCCESS then
    r0_9:AddTimer(DataMgr.TheaterConstant.TheaterPerformResultDelay.ConstantValue and 0, function()
      -- line: [125, 128] id: 10
      r0_9:PlayAnimation(r0_9.Tips_Success)
      AudioManager(r0_9):PlayUISound(r0_9, "event:/ui/activity/theater_online_skill_match", nil, nil)
    end, false, 0, "TheaterPerformResultDelay")
    if r0_9.CurrentSelectedEntry then
      r0_9.CurrentSelectedEntry:SetSuccess(true)
      r0_9.CurrentRoundState = true
    end
  end
end
function r0_0.OnAnimationFinished(r0_11, r1_11)
  -- line: [137, 145] id: 11
  if r1_11 == r0_11.Open_In then
    r0_11:PlayAnimation(r0_11.Open_Out)
    r0_11:OnActivityStart()
  elseif r1_11 == r0_11.Tips_Success then
  end
end
function r0_0.OnActivityStart(r0_12)
  -- line: [147, 155] id: 12
  r0_12.Panel_Title:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_12:PlayAnimation(r0_12.Title_In)
  r0_12.ActivityStartTime = TimeUtils.NowTime()
  DebugPrint("ayff 剧院活动开始时间:", r0_12.ActivityStartTime)
  r0_12:StartStageTimer()
end
function r0_0.OnLevelStart(r0_13, r1_13)
  -- line: [157, 204] id: 13
  local r2_13 = r0_13.LevelId2Index[r1_13]
  local r3_13 = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(r0_13.ListView_Title, r2_13 + -1)
  r0_13.CurrentSelectedEntry = r3_13
  r0_13.CurrentRoundState = false
  r0_13.Text_Level:SetText(string.format(GText("TheaterOnline_Game_Round"), r2_13))
  local r5_13 = r0_13.LevelList[r2_13].PerformId
  local r6_13 = nil
  if DataMgr.Pet[r5_13] then
    r6_13 = string.format(GText("TheaterOnline_Game_Match"), GText(DataMgr.Pet[r5_13].Name))
  else
    r6_13 = string.format(GText("TheaterOnline_Game_Motion"), GText(DataMgr.Resource[r5_13].ResourceName))
  end
  r0_13.Text_Message:SetText(r6_13)
  if r3_13 then
    r3_13:OnLevelStart()
    r3_13:PlayAnimation(r3_13.Normal)
  end
  r0_13:PlayAnimation(r0_13.Tips_In)
  r0_13:UpdateProgress(r2_13)
  r0_13.CurrentRountState = false
  r0_13.CurLevelIndex = r2_13
  if r0_13.PlayLoopSoundTimer then
    r0_13:RemoveTimer(r0_13.PlayLoopSoundTimer)
    r0_13.PlayLoopSoundTimer = nil
  end
  AudioManager(r0_13):PlayUISound(r0_13, "event:/ui/activity/theater_online_skill_instruct", nil, nil)
  if r0_13.RestProgressTimer then
    r0_13:RemoveTimer(r0_13.RestProgressTimer)
    r0_13.RestProgressTimer = nil
  end
  local r7_13 = r0_13.LevelList[r2_13].PerformId
  local r8_13 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
  EventManager:FireEvent(EventID.OnTheaterNPCPerform)
  local r9_13 = r0_13:FindTargetNpc()
  if r9_13 then
    r0_13:PerformAction(r7_13, r9_13)
  end
end
function r0_0.FindTargetNpc(r0_14)
  -- line: [206, 234] id: 14
  local r1_14 = TimeUtils.NowTime()
  local r2_14 = nil
  for r7_14, r8_14 in pairs(DataMgr.TheaterNpc) do
    if r8_14.StartTime and r8_14.EndTime and r8_14.StartTime <= r1_14 and r1_14 < r8_14.EndTime then
      r2_14 = r7_14
      DebugPrint("JLY Found valid TheaterNpc, NpcId:", r7_14, "StartTime:", r8_14.StartTime, "EndTime:", r8_14.EndTime, "NowTime:", r1_14)
      break
    end
  end
  -- close: r3_14
  if not r2_14 then
    DebugPrint("JLY No valid TheaterNpc found for current time:", r1_14)
    return nil
  end
  local r4_14 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance).NpcCharacterMap:FindRef(r2_14)
  if not r4_14 then
    DebugPrint("JLY NpcCharacterMap does not contain NpcId:", r2_14)
  end
  return r4_14
end
function r0_0.PerformAction(r0_15, r1_15, r2_15)
  -- line: [236, 289] id: 15
  local r3_15 = GWorld:GetAvatar()
  local r4_15 = DataMgr.TheaterRandom[r1_15]
  local r6_15 = GWorld.GameInstance
  r0_15.BubbleTalkKey = r6_15:GetTalkContext():StartTalk(r4_15.TalkConfigId, nil, nil, r3_15, r2_15, nil)
  if r4_15.Refer == "Pet" then
    local r8_15 = UE4.UGameplayStatics.GetGameState(r6_15)
    local r9_15 = r4_15.PetNPCID and 900015
    local r10_15 = r0_15.TheaterConstant.PetCreatorID.ConstantValue
    local r11_15 = r8_15:GetStaticCreatorInfo(r10_15)
    if not IsValid(r11_15) then
      DebugPrint("静态点不存在:", r10_15)
      return 
    end
    local r12_15 = r11_15:K2_GetActorLocation()
    local r13_15 = r11_15:K2_GetActorRotation()
    DebugPrint("静态点位置:", r12_15.X, r12_15.Y, r12_15.Z)
    local r14_15 = AEventMgr.CreateUnitContext()
    r14_15.UnitId = r9_15
    r14_15.UnitType = "NPC"
    r14_15.Loc = r12_15
    r14_15.Rotation = r13_15
    r14_15.IntParams:Add("Level", 1)
    r8_15.EventMgr:CreateUnitNew(r14_15, false)
    r0_15.CreatedPetId = r9_15
  elseif r4_15.Refer == "Resource" then
    local r8_15 = DataMgr.Resource[r1_15]
    if r8_15 then
      r2_15:PlayTalkAction(r8_15.PlayAnim)
    end
  end
  if r4_15.MontageName then
    r2_15:NewPlayFacial(r4_15.MontageName)
  end
end
function r0_0.ClearPerformAction(r0_16)
  -- line: [291, 336] id: 16
  if r0_16.BubbleTalkKey then
    local r1_16 = TalkSubsystem()
    if r1_16 then
      r1_16:ForceInterruptTalkTaskData(function(r0_17)
        -- line: [295, 297] id: 17
        return r0_17.FilePath == r0_16.BubbleTalkKey
      end)
    end
    r0_16.BubbleTalkKey = nil
  end
  DebugPrint("JLY ClearPerformAction - 开始清除Pet, CreatedPetId:", r0_16.CreatedPetId)
  if r0_16.CreatedPetId then
    DebugPrint("JLY ClearPerformAction - 存在CreatedPetId:", r0_16.CreatedPetId)
    local r1_16 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
    if not r1_16 then
      DebugPrint("JLY ClearPerformAction - 错误: 无法获取GameState")
      r0_16.CreatedPetId = nil
      return 
    end
    DebugPrint("JLY ClearPerformAction - 成功获取GameState, 准备查找Pet, PetId:", r0_16.CreatedPetId)
    local r2_16 = r1_16:GetNpcInfo(r0_16.CreatedPetId)
    if r2_16 then
      DebugPrint("JLY ClearPerformAction - 找到Pet对象, 检查有效性")
      if IsValid(r2_16) then
        DebugPrint("JLY ClearPerformAction - Pet有效, 开始销毁, PetId:", r0_16.CreatedPetId)
        r2_16:EMActorDestroy(EDestroyReason.TalkContext)
        DebugPrint("JLY ClearPerformAction - Pet销毁完成, PetId:", r0_16.CreatedPetId)
      else
        DebugPrint("JLY ClearPerformAction - Pet对象无效, PetId:", r0_16.CreatedPetId)
      end
    else
      DebugPrint("JLY ClearPerformAction - 错误: 未找到Pet对象, PetId:", r0_16.CreatedPetId)
    end
    r0_16.CreatedPetId = nil
    DebugPrint("JLY ClearPerformAction - 已清空CreatedPetId")
  else
    DebugPrint("JLY ClearPerformAction - CreatedPetId为空, 无需清除Pet")
  end
  local r1_16 = r0_16:FindTargetNpc()
  if r1_16 then
    r1_16:PlayDefaultAnimation()
    r1_16:NewInitDefaultFacial()
  end
end
function r0_0.StartStageTimer(r0_18)
  -- line: [338, 348] id: 18
  if r0_18.StageCheckTimer then
    r0_18:RemoveTimer(r0_18.StageCheckTimer)
  end
  r0_18.StageCheckTimer = r0_18:AddTimer(1, function()
    -- line: [343, 345] id: 19
    r0_18:CheckCurrentStage()
  end, true, 0, "StageCheck", true)
  r0_18:CheckCurrentStage()
end
function r0_0.CheckCurrentStage(r0_20)
  -- line: [350, 378] id: 20
  if not r0_20.ActivityStartTime then
    return 
  end
  local r1_20 = GWorld:GetAvatar()
  if not r1_20 then
    return 
  end
  local r2_20 = r1_20.CurrentRegionId
  if not UE4.UGameplayStatics.GetGameState(GWorld.GameInstance):IsInRegion() or r2_20 ~= 101901 then
    DebugPrint("ayff 离开剧院区域，关闭剧院活动UI regionid:", r2_20)
    r0_20:Close()
  end
  local r5_20 = TimeUtils.NowTime() - r0_20.ActivityStartTime
  local r6_20 = r0_20:GetCurrentStageByTime(r5_20)
  if r6_20 ~= r0_20.CurrentStage then
    r0_20.CurrentStage = r6_20
    r0_20:ExecuteStage(r6_20, r5_20)
  end
end
function r0_0.GetCurrentStageByTime(r0_21, r1_21)
  -- line: [380, 393] id: 21
  for r5_21 = 1, 12, 1 do
    local r6_21 = r0_21.StepInfo[r5_21].Time
    local r7_21 = r0_21.StepInfo[r5_21 + 1]
    if r7_21 then
      r7_21 = r0_21.StepInfo[r5_21 + 1].Time and math.huge
    else
      goto label_20	-- block#3 is visited secondly
    end
    DebugPrint("ayff 阶段:", r5_21, "开始时间:", r6_21, "下阶段开始时间:", r7_21)
    if r6_21 <= r1_21 and r1_21 < r7_21 then
      return r5_21
    end
  end
  return 12
end
function r0_0.ExecuteStage(r0_22, r1_22, r2_22)
  -- line: [395, 423] id: 22
  DebugPrint("ayff 执行阶段:", r1_22, "经过时间:", r2_22)
  local r3_22 = nil	-- notice: implicit variable refs by block#[7, 12, 16]
  if r1_22 == 1 then
    r3_22 = r0_22.LevelList[1].LevelId
    r0_22:AddTimer(0.1, function()
      -- line: [401, 403] id: 23
      r0_22:OnOpeningStart(r3_22)
    end)
    -- close: r3_22
  elseif r1_22 == 2 or r1_22 == 4 or r1_22 == 6 or r1_22 == 8 or r1_22 == 10 then
    r3_22 = math
    r3_22 = r3_22.floor
    r3_22 = r3_22(r1_22 / 2)
    r0_22:OnLevelStart(r0_22.LevelList[r3_22].LevelId)
  elseif r1_22 == 3 or r1_22 == 5 or r1_22 == 7 or r1_22 == 9 then
    r3_22 = r0_22.LevelList
    r3_22 = r3_22[math.floor((r1_22 + 1) / 2)]
    r3_22 = r3_22.LevelId
    r0_22:OnRestStart(r3_22)
  elseif r1_22 == 11 then
    r0_22:OnEndingStart()
  elseif r1_22 == 12 then
    r0_22:TheaterPerformGameEnd()
    r3_22 = r0_22.StageCheckTimer
    if r3_22 then
      r0_22:RemoveTimer(r0_22.StageCheckTimer)
      r0_22.StageCheckTimer = nil
    end
  end
end
function r0_0.OnOpeningStart(r0_24, r1_24)
  -- line: [425, 436] id: 24
  local r3_24 = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(r0_24.ListView_Title, r0_24.LevelId2Index[r1_24] + -1)
  if r3_24 then
    r3_24:PlayAnimation(r3_24.Normal_Loop)
    r0_24.PlayLoopSoundTimer = r0_24:AddTimer(1, function()
      -- line: [432, 434] id: 25
      AudioManager(r0_24):PlayUISound(r0_24, "event:/ui/activity/theater_online_waiting", nil, nil)
    end, true)
  end
end
function r0_0.OnRestStart(r0_26, r1_26)
  -- line: [438, 456] id: 26
  local r3_26 = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(r0_26.ListView_Title, r0_26.LevelId2Index[r1_26] + -1)
  if r3_26 then
    r3_26:PlayAnimation(r3_26.Normal_Loop)
  end
  r0_26.PlayLoopSoundTimer = r0_26:AddTimer(1, function()
    -- line: [446, 448] id: 27
    AudioManager(r0_26):PlayUISound(r0_26, "event:/ui/activity/theater_online_waiting", nil, nil)
  end, true)
  r0_26.Panel_Toast_Tips:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_26.RestProgressTimer = r0_26:AddTimer(0.1, function()
    -- line: [451, 454] id: 28
    r0_26.ProgressBar_Title:SetPercent(r0_26.ProgressBar_Title.Percent + 0.0025)
  end, true)
  r0_26.CurLevelIndex = 0
end
function r0_0.OnEndingStart(r0_29)
  -- line: [458, 459] id: 29
end
function r0_0.OnStandbyStart(r0_30)
  -- line: [461, 462] id: 30
end
function r0_0.TheaterPerformGameEnd(r0_31)
  -- line: [464, 470] id: 31
  DebugPrint("ayff 剧院活动结束 start close ui")
  UIManager(r0_31):ShowUITip("CommonToastMain", GText("TheaterOnline_Game_Finish"), 3)
  r0_31:PlayTalk(DataMgr.TheaterConstant.EndGameTalkConfigId.ConstantValue, r0_31:FindTargetNpc())
  r0_31:Close()
end
function r0_0.UpdateProgress(r0_32, r1_32)
  -- line: [472, 475] id: 32
  r0_32.ProgressBar_Title:SetPercent((r1_32 + -1) * 0.25)
end
function r0_0.Close(r0_33)
  -- line: [477, 483] id: 33
  if r0_33.ParentWidget then
    r0_33.ParentWidget.Pos_Rouge_CountDown:ClearChildren()
    r0_33.ParentWidget.Pos_Rouge_CountDown:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  r0_33.Super.Close(r0_33)
end
function r0_0.Destruct(r0_34)
  -- line: [485, 495] id: 34
  if r0_34.StageCheckTimer then
    r0_34:RemoveTimer(r0_34.StageCheckTimer)
    r0_34.StageCheckTimer = nil
  end
  if r0_34.RestProgressTimer then
    r0_34:RemoveTimer(r0_34.RestProgressTimer)
    r0_34.RestProgressTimer = nil
  end
end
function r0_0.PlayTalk(r0_35, r1_35, r2_35)
  -- line: [497, 505] id: 35
  if not r2_35 then
    return 
  end
  r0_35.BubbleTalkKey = GWorld.GameInstance:GetTalkContext():StartTalk(r1_35, nil, nil, GWorld:GetAvatar(), r2_35, nil)
end
return r0_0
