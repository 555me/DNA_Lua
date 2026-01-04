-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Managers\SystemGuideManager.lua
-- version: lua54
-- line: [0, 0] id: 0
return {
  GuideDic = {},
  GuideUnfinishedDic = {},
  GuideQueue = {},
  IsGuideStoryRunning = false,
  RunningId = -1,
  bOpenDebug = false,
  GuideEventList = {},
  AddListenerSystemGuide = function(r0_1)
    -- line: [12, 17] id: 1
    r0_1:ClearSystemGuideData()
    r0_1:InitSystemGuideData()
    r0_1:RemoveSystemGuideEvents()
    r0_1:AddSystemGuideEvents()
  end,
  AddSystemGuideEvents = function(r0_2)
    -- line: [19, 41] id: 2
    r0_2:AddSystemGuideEvent(EventID.SystemGuideEnterRegion, r0_2.EnterRegionEvent)
    r0_2:AddSystemGuideEvent(EventID.SystemGuideExitRegion, r0_2.ExitRegionEvent)
    r0_2:AddSystemGuideEvent(EventID.SystemGuideEnterDungeon, r0_2.EnterDungeonEvent)
    r0_2:AddSystemGuideEvent(EventID.SystemGuideExitDungeon, r0_2.ExitDungeonEvent)
    r0_2:AddSystemGuideEvent(EventID.LoadUI, r0_2.LoadUIEvent)
    r0_2:AddSystemGuideEvent(EventID.UnLoadUI, r0_2.UnLoadUIEvent)
    r0_2:AddSystemGuideEvent(EventID.QuestFinished, r0_2.FinishQuestEvent)
    r0_2:AddSystemGuideEvent(EventID.QuestChainFinished, r0_2.FinishQuestChainEvent)
    r0_2:AddSystemGuideEvent(EventID.OnSystemUnlockEnding, r0_2.UIUnlockRuleIdsFinishedEvent)
    r0_2:AddSystemGuideEvent(EventID.OnBecomeViewTarget, r0_2.OnBecomeViewTarget)
    r0_2:AddSystemGuideEvent(EventID.OnEndViewTarget, r0_2.OnEndViewTarget)
    r0_2:AddSystemGuideEvent(EventID.SetInputMode, r0_2.SetInputModeEvent)
    r0_2:AddSystemGuideEvent(EventID.ImpressionTalk, r0_2.ImpressionTalkEvent)
    r0_2:AddSystemGuideEvent(EventID.TalkComp, r0_2.TalkCompEvent)
    r0_2:AddSystemGuideEvent(EventID.OnSystemUnlockWorkingStart, r0_2.SystemUnlockWorkingStartEvent)
    r0_2:AddSystemGuideEvent(EventID.OnSystemUnlockWorkingEnd, r0_2.SystemUnlockWorkingEndEvent)
    r0_2:AddSystemGuideEvent(EventID.FirstSeenTag, r0_2.FirstSeenTagEvent)
    r0_2:AddSystemGuideEvent(EventID.FirstDynQuest, r0_2.FirstDynQuest)
    r0_2:AddSystemGuideEvent(EventID.EndTalk, r0_2.FirstPanFixTalk)
    r0_2:AddSystemGuideEvent(EventID.ConditionComplete, r0_2.ConditionCompleteEvent)
  end,
  IsNeedAddListener = function(r0_3, r1_3)
    -- line: [43, 82] id: 3
    for r6_3, r7_3 in pairs(r0_3.GuideUnfinishedDic) do
      if (r1_3 == EventID.SystemGuideEnterRegion or r1_3 == EventID.SystemGuideExitRegion) and r7_3.Data.IsInRegion ~= nil then
        return true
      elseif (r1_3 == EventID.SystemGuideEnterDungeon or r1_3 == EventID.SystemGuideExitDungeon) and r7_3.Data.EnterDungeon ~= nil then
        return true
      elseif (r1_3 == EventID.LoadUI or r1_3 == EventID.UnLoadUI) and r7_3.Data.OpenInterface ~= nil then
        return true
      elseif r1_3 == EventID.QuestFinished and r7_3.Data.FinishQuest ~= nil then
        return true
      elseif r1_3 == EventID.QuestChainFinished and r7_3.Data.FinishQuestChain ~= nil then
        return true
      elseif r1_3 == EventID.OnSystemUnlockEnding and r7_3.Data.UIUnlockRule ~= nil then
        return true
      elseif r1_3 == EventID.SetInputMode and r7_3.Data.PlayerInControl ~= nil then
        return true
      elseif r1_3 == EventID.ImpressionTalk and r7_3.Data.SpecialCondition == "ImpressionTalk" then
        return true
      elseif r1_3 == EventID.TalkComp and r7_3.Data.SpecialCondition ~= "ImpressionTalk" then
        return true
      elseif r1_3 == EventID.OnSystemUnlockWorkingStart or r1_3 == EventID.OnSystemUnlockWorkingEnd then
        return true
      elseif r1_3 == EventID.FirstSeenTag and r7_3.Data.FirstSeenTag ~= nil then
        return true
      elseif r1_3 == EventID.FirstDynQuest and r7_3.Data.SpecialCondition == "FirstDynQuest" then
        return true
      elseif r1_3 == EventID.EndTalk and r7_3.Data.SpecialCondition == "FirstPanFixTalk" then
        return true
      elseif r1_3 == EventID.ConditionComplete and r7_3.Data.ConditionCheck ~= nil then
        return true
      elseif r1_3 == EventID.OnEndViewTarget then
        return true
      elseif r1_3 == EventID.OnBecomeViewTarget then
        return true
      end
    end
    -- close: r2_3
    return false
  end,
  TryRemoveUnusedListener = function(r0_4)
    -- line: [84, 95] id: 4
    if #r0_4.GuideEventList > 0 then
      for r4_4 = #r0_4.GuideEventList, 1, -1 do
        local r5_4 = r0_4.GuideEventList[r4_4]
        if r0_4:IsNeedAddListener(r5_4) == false then
          table.remove(r0_4.GuideEventList, r4_4)
          EventManager:RemoveEvent(r5_4, r0_4)
          DebugPrint("SystemGuide EventManager:RemoveEvent:", r5_4)
        end
      end
    end
  end,
  AddSystemGuideEvent = function(r0_5, r1_5, r2_5)
    -- line: [97, 104] id: 5
    if r0_5:IsNeedAddListener(r1_5) then
      table.insert(r0_5.GuideEventList, r1_5)
      EventManager:AddEvent(r1_5, r0_5, r2_5)
      DebugPrint("SystemGuide EventManager:AddEvent:", r1_5)
    end
  end,
  RemoveSystemGuideEvents = function(r0_6)
    -- line: [106, 114] id: 6
    if #r0_6.GuideEventList > 0 then
      for r4_6 = 1, #r0_6.GuideEventList, 1 do
        EventManager:RemoveEvent(r0_6.GuideEventList[r4_6], r0_6)
      end
    end
    r0_6.GuideEventList = {}
    DebugPrint("SystemGuide EventManager:RemoveAllEvents")
  end,
  ClearSystemGuideData = function(r0_7)
    -- line: [116, 123] id: 7
    DebugPrint("SystemGuide ClearSystemGuideData")
    r0_7.GuideDic = {}
    r0_7.GuideUnfinishedDic = {}
    r0_7.GuideQueue = {}
    r0_7.IsGuideStoryRunning = false
    r0_7.RunningId = -1
  end,
  InitSystemGuideData = function(r0_8)
    -- line: [125, 182] id: 8
    DebugPrint("SystemGuide InitSystemGuideData")
    r0_8.Avatar = GWorld:GetAvatar()
    if not r0_8.Avatar then
      return 
    end
    if CommonUtils.GetDeviceTypeByPlatformName(r0_8) == "PC" then
      r0_8.Platform = "PC"
    else
      r0_8.Platform = "Mobile"
    end
    for r5_8, r6_8 in pairs(DataMgr.SystemGuide) do
      local r7_8 = {
        Data = r6_8,
        Finished = false,
        FinishedQuest = false,
        FinishedQuestChain = false,
        UIUnlockRule = false,
        FinishedOpenInterface = false,
        FinishedEnterDungeon = false,
        FinishedEnterRegion = false,
        FinishedPlayerInControl = true,
        FinishedPreSysGuide = false,
        FinishedSpecialCondition = false,
        FinishedOutTalkComp = true,
        FinishedSystemUnlockWorking = true,
        FinishedFirstSeenTag = false,
        ConditionCheck = false,
        GuideStart = r6_8.GuideStart,
      }
      if r6_8.PreSysGuideId == nil then
        r7_8.FinishedPreSysGuide = true
      end
      if r6_8.FinishQuest == nil then
        r7_8.FinishedQuest = true
      end
      if r6_8.FinishQuestChain == nil then
        r7_8.FinishedQuestChain = true
      end
      if r6_8.UIUnlockRule == nil then
        r7_8.UIUnlockRule = true
      end
      if r6_8.OpenInterface == nil then
        r7_8.FinishedOpenInterface = true
      end
      if r6_8.EnterDungeon == nil then
        r7_8.FinishedEnterDungeon = true
      end
      if r6_8.IsInRegion == nil then
        r7_8.FinishedEnterRegion = true
      end
      if r6_8.ConditionCheck == nil then
        r7_8.ConditionCheck = true
      end
      if r6_8.SpecialCondition == nil then
        r7_8.FinishedSpecialCondition = true
      end
      if r6_8.FirstSeenTag == nil then
        r7_8.FinishedFirstSeenTag = true
      end
      if (r6_8.FinishQuest ~= nil or r6_8.FinishQuestChain ~= nil or r6_8.UIUnlockRule ~= nil) and r6_8.EnterDungeon == nil and r6_8.IsInRegion == nil then
        DebugPrint("Error: EnterDungeon and IsInRegion are all empty -> SysGuideId:" .. r6_8.SysGuideId)
      end
      r0_8.GuideDic[r6_8.SysGuideId] = r7_8
      r0_8.GuideUnfinishedDic[r6_8.SysGuideId] = r7_8
    end
    -- close: r1_8
    r0_8:InitSystemGuideState()
    for r5_8, r6_8 in pairs(DataMgr.SystemGuide) do
      local r7_8 = r0_8.GuideDic[r6_8.SysGuideId]
      local r8_8 = r0_8.GuideDic[r6_8.PreSysGuideId]
      if r8_8 ~= nil and r8_8.Finished then
        r0_8.GuideDic[r6_8.SysGuideId].FinishedPreSysGuide = true
      end
    end
    -- close: r1_8
  end,
  InitSystemGuideState = function(r0_9)
    -- line: [185, 235] id: 9
    for r5_9, r6_9 in pairs(DataMgr.SystemGuide) do
      local r7_9 = r0_9.GuideDic[r6_9.SysGuideId]
      local r8_9 = GWorld:GetAvatar()
      if r8_9 then
        r7_9.Finished = r8_9.SystemGuides:GetSystemGuide(r6_9.SysGuideId):IsFinished()
        if r7_9.Finished then
          r0_9:RemoveFinishedItemById(r6_9.SysGuideId)
          local r9_9 = r0_9:GetItemByPreSysGuideId(r6_9.SysGuideId)
          if #r9_9 > 0 then
            for r13_9 = 1, #r9_9, 1 do
              r0_9.GuideDic[r9_9[r13_9]].FinishedPreSysGuide = true
            end
          end
        end
        if r7_9.Data.FinishQuest ~= nil and r8_9:IsQuestFinished(r7_9.Data.FinishQuest) then
          r7_9.FinishedQuest = true
        end
        if r7_9.Data.FinishQuestChain ~= nil and r8_9:IsQuestChainFinished(r7_9.Data.FinishQuestChain) then
          r7_9.FinishedQuestChain = true
        end
        if r7_9.Data.UIUnlockRule ~= nil and r8_9:CheckUIUnlocked_Internal(r7_9.Data.UIUnlockRule) and r8_9:HasUIUnlockTask() == false then
          r7_9.UIUnlockRule = true
        end
        if r7_9.Data.OpenInterface ~= nil then
          local r9_9 = UIManager(GWorld.GameInstance):GetUIObj(r7_9.Data.OpenInterface)
          if r9_9 ~= nil and r9_9:IsHide() == false then
            r7_9.FinishedOpenInterface = true
          end
        end
      end
    end
    -- close: r1_9
  end,
  InitCondition = function(r0_10)
    -- line: [238, 251] id: 10
    for r5_10, r6_10 in pairs(DataMgr.SystemGuide) do
      local r7_10 = r0_10.GuideDic[r6_10.SysGuideId]
      local r8_10 = GWorld:GetAvatar()
      if r8_10 then
        r7_10.Finished = r8_10.SystemGuides:GetSystemGuide(r6_10.SysGuideId):IsFinished()
        if r7_10.Finished then
          return 
        end
        if r7_10.Data.ConditionCheck ~= nil then
          r7_10.ConditionCheck = ConditionUtils.CheckCondition(r8_10, r7_10.Data.ConditionCheck)
        end
      end
    end
    -- close: r1_10
  end,
  SendDataToServer = function(r0_11, r1_11)
    -- line: [254, 265] id: 11
    r0_11:TryRemoveUnusedListener()
    local r2_11 = GWorld:GetAvatar()
    if r2_11 == nil then
      DebugPrint("ERROR:Avatar == nil SendDataToServer:" .. r1_11)
      return 
    end
    r2_11:FinishSystemGuide(r1_11)
    print(_G.LogTag, r1_11, "SystemGuideFinished")
  end,
  FinishSystemGuideCallback = function(r0_12, r1_12, r2_12)
    -- line: [267, 273] id: 12
    DebugPrint("SystemGuideFinished callback", r1_12, r2_12)
    if r2_12 == nil then
      return 
    end
    UIManager(GWorld.GameInstance):LoadUI(UIConst.LoadInConfig, "GetItemPage", UIConst.ZORDER_ABOVE_SystemGuide, nil, nil, nil, r2_12)
  end,
  GetItemByUIKey = function(r0_13, r1_13)
    -- line: [275, 287] id: 13
    local r2_13 = {}
    if r1_13 == nil then
      DebugPrint("SystemGuide GetItemByUIKey UIKey Is nil")
      return r2_13
    end
    for r7_13, r8_13 in pairs(r0_13.GuideUnfinishedDic) do
      if r1_13 == r8_13.Data.OpenInterface then
        table.insert(r2_13, r8_13.Data.SysGuideId)
      end
    end
    -- close: r3_13
    return r2_13
  end,
  GetItemByDungeonId = function(r0_14, r1_14)
    -- line: [289, 297] id: 14
    local r2_14 = {}
    for r7_14, r8_14 in pairs(r0_14.GuideUnfinishedDic) do
      if r1_14 == r8_14.Data.EnterDungeon then
        table.insert(r2_14, r8_14.Data.SysGuideId)
      end
    end
    -- close: r3_14
    return r2_14
  end,
  GetItemByRegion = function(r0_15)
    -- line: [299, 307] id: 15
    local r1_15 = {}
    for r6_15, r7_15 in pairs(r0_15.GuideUnfinishedDic) do
      if r7_15.Data.IsInRegion == 1 then
        table.insert(r1_15, r7_15.Data.SysGuideId)
      end
    end
    -- close: r2_15
    return r1_15
  end,
  GetItemByPlayerInControl = function(r0_16)
    -- line: [309, 317] id: 16
    local r1_16 = {}
    for r6_16, r7_16 in pairs(r0_16.GuideUnfinishedDic) do
      if r7_16.Data.PlayerInControl == 1 then
        table.insert(r1_16, r7_16.Data.SysGuideId)
      end
    end
    -- close: r2_16
    return r1_16
  end,
  GetItemByOutTalkComp = function(r0_17)
    -- line: [319, 327] id: 17
    local r1_17 = {}
    for r6_17, r7_17 in pairs(r0_17.GuideUnfinishedDic) do
      if r7_17.Data.SpecialCondition ~= "ImpressionTalk" then
        table.insert(r1_17, r7_17.Data.SysGuideId)
      end
    end
    -- close: r2_17
    return r1_17
  end,
  GetItemBySystemUnlockWorking = function(r0_18)
    -- line: [329, 335] id: 18
    local r1_18 = {}
    for r6_18, r7_18 in pairs(r0_18.GuideUnfinishedDic) do
      table.insert(r1_18, r7_18.Data.SysGuideId)
    end
    -- close: r2_18
    return r1_18
  end,
  GetItemBySpecialCondition = function(r0_19, r1_19)
    -- line: [337, 345] id: 19
    local r2_19 = {}
    for r7_19, r8_19 in pairs(r0_19.GuideUnfinishedDic) do
      if r1_19 == r8_19.Data.SpecialCondition then
        table.insert(r2_19, r8_19.Data.SysGuideId)
      end
    end
    -- close: r3_19
    return r2_19
  end,
  GetItemByQuestId = function(r0_20, r1_20)
    -- line: [347, 355] id: 20
    local r2_20 = {}
    for r7_20, r8_20 in pairs(r0_20.GuideUnfinishedDic) do
      if r1_20 == r8_20.Data.FinishQuest then
        table.insert(r2_20, r8_20.Data.SysGuideId)
      end
    end
    -- close: r3_20
    return r2_20
  end,
  GetItemByQuestChainId = function(r0_21, r1_21)
    -- line: [357, 365] id: 21
    local r2_21 = {}
    for r7_21, r8_21 in pairs(r0_21.GuideUnfinishedDic) do
      if r1_21 == r8_21.Data.FinishQuestChain then
        table.insert(r2_21, r8_21.Data.SysGuideId)
      end
    end
    -- close: r3_21
    return r2_21
  end,
  GetItemByUIUnlockRuleId = function(r0_22, r1_22)
    -- line: [367, 375] id: 22
    local r2_22 = {}
    for r7_22, r8_22 in pairs(r0_22.GuideUnfinishedDic) do
      if r1_22 == r8_22.Data.UIUnlockRule then
        table.insert(r2_22, r8_22.Data.SysGuideId)
      end
    end
    -- close: r3_22
    return r2_22
  end,
  GetItemByPreSysGuideId = function(r0_23, r1_23)
    -- line: [377, 385] id: 23
    local r2_23 = {}
    for r7_23, r8_23 in pairs(r0_23.GuideUnfinishedDic) do
      if r1_23 == r8_23.Data.PreSysGuideId then
        table.insert(r2_23, r8_23.Data.SysGuideId)
      end
    end
    -- close: r3_23
    return r2_23
  end,
  GetItemByFirstSeenTag = function(r0_24, r1_24)
    -- line: [387, 395] id: 24
    local r2_24 = {}
    for r7_24, r8_24 in pairs(r0_24.GuideUnfinishedDic) do
      if r1_24 == r8_24.Data.FirstSeenTag then
        table.insert(r2_24, r8_24.Data.SysGuideId)
      end
    end
    -- close: r3_24
    return r2_24
  end,
  GetItemByConditionCheck = function(r0_25, r1_25)
    -- line: [397, 405] id: 25
    local r2_25 = {}
    for r7_25, r8_25 in pairs(r0_25.GuideUnfinishedDic) do
      if r1_25 == r8_25.Data.ConditionCheck then
        table.insert(r2_25, r8_25.Data.SysGuideId)
      end
    end
    -- close: r3_25
    return r2_25
  end,
  TryRunStoryByGuideId = function(r0_26, r1_26, r2_26, r3_26)
    -- line: [407, 446] id: 26
    if r2_26 == r0_26.RunningId then
      return 
    end
    if not r0_26.Avatar then
      return 
    end
    if r0_26.GuideDic[r2_26].Finished == false and r0_26.GuideDic[r2_26].IsBroken ~= true and r0_26.GuideDic[r2_26].FinishedPreSysGuide and r0_26.GuideDic[r2_26].FinishedQuest and r0_26.GuideDic[r2_26].FinishedQuestChain and r0_26.GuideDic[r2_26].UIUnlockRule and r0_26.GuideDic[r2_26].FinishedOpenInterface and r0_26.GuideDic[r2_26].FinishedEnterDungeon and r0_26.GuideDic[r2_26].FinishedEnterRegion and r0_26.GuideDic[r2_26].FinishedPlayerInControl and r0_26.GuideDic[r2_26].FinishedSpecialCondition and r0_26.GuideDic[r2_26].FinishedOutTalkComp and r0_26.GuideDic[r2_26].FinishedFirstSeenTag and r0_26.GuideDic[r2_26].ConditionCheck and r0_26.GuideDic[r2_26].FinishedSystemUnlockWorking and r0_26.GuideDic[r2_26].GuideStart == 0 then
      if r3_26 ~= true then
        table.insert(r0_26.GuideQueue, r2_26)
      end
      if r0_26.IsGuideStoryRunning == false then
        r0_26:RunStory(r0_26.GuideDic[r2_26].Data)
      end
    elseif r3_26 and r0_26.RunningId ~= r2_26 then
      r0_26:GuideQueueRemove(r2_26, "TryRunStoryByGuideIdDelay")
    elseif r0_26.Platform == "PC" and r0_26.bOpenDebug then
      PrintTable(r0_26.GuideDic[r2_26], 3, "SystemGuide TryRunSourceFail")
    end
  end,
  PrintDataInfo = function(r0_27, r1_27, r2_27)
    -- line: [448, 466] id: 27
  end,
  GuideQueueRemove = function(r0_28, r1_28, r2_28)
    -- line: [468, 483] id: 28
    if #r0_28.GuideQueue > 0 then
      for r6_28 = 1, #r0_28.GuideQueue, 1 do
        if r0_28.GuideQueue[r6_28] == r1_28 and r0_28.RunningId ~= r1_28 then
          table.remove(r0_28.GuideQueue, r6_28)
          DebugPrint("SystemGuideQueueRemove:" .. r1_28 .. ",Source:" .. (r2_28 and ""))
        end
      end
      if #r0_28.GuideQueue > 0 then
        r0_28:TryRunStoryByGuideId("GuideQueueNext,RemoveId:" .. r1_28, r0_28.GuideQueue[1], true)
      else
        UIManager():FallbackAfterLoadingMgr()
      end
    end
  end,
  LoadUIEvent = function(r0_29, r1_29)
    -- line: [485, 488] id: 29
    DebugPrint("SystemGuide LoadUIEvent UIKey:", r1_29)
    r0_29:ShowUIEvent(r1_29)
  end,
  ShowUIEvent = function(r0_30, r1_30)
    -- line: [490, 506] id: 30
    if r0_30.Invalid then
      return 
    end
    DebugPrint("SystemGuide ShowUIEvent UIKey:", r1_30)
    local r2_30 = r0_30:GetItemByUIKey(r1_30)
    if r1_30 == "BattleMain" then
      local r3_30 = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
      if r3_30 and r3_30.CleanInputWhenEnterTalk then
        r3_30:CleanInputWhenEnterTalk(false)
      end
    end
    if #r2_30 > 0 then
      for r6_30 = 1, #r2_30, 1 do
        r0_30.GuideDic[r2_30[r6_30]].FinishedOpenInterface = true
        r0_30:TryRunStoryByGuideId("LoadUIEvent:" .. r1_30, r2_30[r6_30])
      end
    end
  end,
  UnLoadUIEvent = function(r0_31, r1_31)
    -- line: [508, 511] id: 31
    DebugPrint("SystemGuide UnLoadUIEvent UIKey:", r1_31)
    r0_31:HideUIEvent(r1_31)
  end,
  HideUIEvent = function(r0_32, r1_32)
    -- line: [513, 530] id: 32
    if r0_32.Invalid then
      return 
    end
    DebugPrint("SystemGuide HideUIEvent UIKey:", r1_32)
    local r2_32 = r0_32:GetItemByUIKey(r1_32)
    if #r2_32 > 0 then
      for r6_32 = 1, #r2_32, 1 do
        r0_32.GuideDic[r2_32[r6_32]].FinishedOpenInterface = false
        if #r0_32.GuideQueue > 0 then
          for r10_32 = 1, #r0_32.GuideQueue, 1 do
            if r0_32.GuideQueue[r10_32] == r2_32[r6_32] and r0_32.RunningId ~= r2_32[r6_32] then
              table.remove(r0_32.GuideQueue, r10_32)
              DebugPrint("SystemGuideQueueRemoveUnLoadUIEvent:" .. r2_32[r6_32])
            end
          end
        end
      end
    end
  end,
  EnterRegionEvent = function(r0_33)
    -- line: [532, 542] id: 33
    if r0_33.Invalid then
      return 
    end
    DebugPrint("SystemGuide EnterRegionEvent")
    local r1_33 = r0_33:GetItemByRegion()
    if #r1_33 > 0 then
      for r5_33 = 1, #r1_33, 1 do
        r0_33.GuideDic[r1_33[r5_33]].FinishedEnterRegion = true
        r0_33:TryRunStoryByGuideId("EnterRegionEvent", r1_33[r5_33])
      end
    end
  end,
  ExitRegionEvent = function(r0_34)
    -- line: [544, 561] id: 34
    if r0_34.Invalid then
      return 
    end
    DebugPrint("SystemGuide ExitRegionEvent")
    local r1_34 = r0_34:GetItemByRegion()
    if #r1_34 > 0 then
      for r5_34 = 1, #r1_34, 1 do
        r0_34.GuideDic[r1_34[r5_34]].FinishedEnterRegion = false
        if #r0_34.GuideQueue > 0 then
          for r9_34 = 1, #r0_34.GuideQueue, 1 do
            if r0_34.GuideQueue[r9_34] == r1_34[r5_34] and r0_34.RunningId ~= r1_34[r5_34] then
              table.remove(r0_34.GuideQueue, r9_34)
              DebugPrint("SystemGuideQueueRemoveExitRegionEvent:" .. r1_34[r5_34])
            end
          end
        end
      end
    end
  end,
  EnterDungeonEvent = function(r0_35, r1_35)
    -- line: [563, 574] id: 35
    if r0_35.Invalid then
      return 
    end
    DebugPrint("SystemGuide EnterDungeonEvent DungeonId:", r1_35)
    EventManager:FireEvent(EventID.SystemGuideExitRegion)
    local r2_35 = r0_35:GetItemByDungeonId(r1_35)
    if #r2_35 > 0 then
      for r6_35 = 1, #r2_35, 1 do
        r0_35.GuideDic[r2_35[r6_35]].FinishedEnterDungeon = true
        r0_35:TryRunStoryByGuideId("EnterDungeonEvent,DungeonId:" .. r1_35, r2_35[r6_35])
      end
    end
  end,
  ExitDungeonEvent = function(r0_36, r1_36)
    -- line: [576, 593] id: 36
    if r0_36.Invalid then
      return 
    end
    DebugPrint("SystemGuide ExitDungeonEvent DungeonId:", r1_36)
    local r2_36 = r0_36:GetItemByDungeonId(r1_36)
    if #r2_36 > 0 then
      for r6_36 = 1, #r2_36, 1 do
        r0_36.GuideDic[r2_36[r6_36]].FinishedEnterDungeon = false
        if #r0_36.GuideQueue > 0 then
          for r10_36 = 1, #r0_36.GuideQueue, 1 do
            if r0_36.GuideQueue[r10_36] == r2_36[r6_36] and r0_36.RunningId ~= r2_36[r6_36] then
              table.remove(r0_36.GuideQueue, r10_36)
              DebugPrint("SystemGuideQueueRemoveExitDungeonEvent:" .. r2_36[r6_36])
            end
          end
        end
      end
    end
  end,
  SystemUnlockWorkingStartEvent = function(r0_37)
    -- line: [595, 612] id: 37
    if r0_37.Invalid then
      return 
    end
    DebugPrint("SystemGuide SystemUnlockWorkingStartEvent")
    local r1_37 = r0_37:GetItemBySystemUnlockWorking()
    if #r1_37 > 0 then
      for r5_37 = 1, #r1_37, 1 do
        r0_37.GuideDic[r1_37[r5_37]].FinishedSystemUnlockWorking = false
        if #r0_37.GuideQueue > 0 then
          for r9_37 = 1, #r0_37.GuideQueue, 1 do
            if r0_37.GuideQueue[r9_37] == r1_37[r5_37] and r0_37.RunningId ~= r1_37[r5_37] then
              table.remove(r0_37.GuideQueue, r9_37)
              DebugPrint("SystemGuideQueueRemoveSystemUnlockWorkingStartEvent:" .. r1_37[r5_37])
            end
          end
        end
      end
    end
  end,
  SystemUnlockWorkingEndEvent = function(r0_38)
    -- line: [614, 626] id: 38
    if r0_38.Invalid then
      return 
    end
    DebugPrint("SystemGuide SystemUnlockWorkingEndEvent")
    local r1_38 = r0_38:GetItemBySystemUnlockWorking()
    if #r1_38 > 0 then
      for r5_38 = 1, #r1_38, 1 do
        if r0_38.GuideDic[r1_38[r5_38]].FinishedSystemUnlockWorking == false then
          r0_38.GuideDic[r1_38[r5_38]].FinishedSystemUnlockWorking = true
          r0_38:TryRunStoryByGuideId("SystemUnlockWorkingEndEvent:", r1_38[r5_38])
        end
      end
    end
  end,
  FirstSeenTagEvent = function(r0_39, r1_39)
    -- line: [628, 638] id: 39
    if r0_39.Invalid then
      return 
    end
    DebugPrint("SystemGuide FirstSeenTagEvent ", r1_39)
    local r2_39 = r0_39:GetItemByFirstSeenTag(r1_39)
    if #r2_39 > 0 then
      for r6_39 = 1, #r2_39, 1 do
        r0_39.GuideDic[r2_39[r6_39]].FinishedFirstSeenTag = true
        r0_39:TryRunStoryByGuideId("FirstSeenTagEvent:" .. r1_39, r2_39[r6_39])
      end
    end
  end,
  FirstDynQuest = function(r0_40)
    -- line: [640, 650] id: 40
    if r0_40.Invalid then
      return 
    end
    DebugPrint("Systemguide FirstDynQuest")
    local r1_40 = r0_40:GetItemBySpecialCondition("FirstDynQuest")
    if #r1_40 > 0 then
      for r5_40 = 1, #r1_40, 1 do
        r0_40.GuideDic[r1_40[r5_40]].FinishedSpecialCondition = true
        r0_40:TryRunStoryByGuideId("FirstDynQuest", r1_40[r5_40])
      end
    end
  end,
  FirstPanFixTalk = function(r0_41, r1_41)
    -- line: [652, 669] id: 41
    if r0_41.Invalid then
      return 
    end
    if r1_41.TalkType ~= "PanFixSimple" then
      return 
    end
    DebugPrint("Systemguide FirstPanFixTalk")
    local r2_41 = r0_41:GetItemBySpecialCondition("FirstPanFixTalk")
    if #r2_41 > 0 then
      for r6_41 = 1, #r2_41, 1 do
        r0_41.GuideDic[r2_41[r6_41]].FinishedSpecialCondition = true
        r0_41:TryRunStoryByGuideId("FirstPanFixTalk", r2_41[r6_41])
      end
    end
  end,
  ConditionCompleteEvent = function(r0_42, r1_42)
    -- line: [671, 688] id: 42
    if r0_42.Invalid then
      return 
    end
    local r2_42 = GWorld:GetAvatar()
    if not r2_42 then
      return 
    end
    DebugPrint("Systemguide ConditionCheck", r1_42)
    local r3_42 = ConditionUtils.CheckCondition(r2_42, r1_42)
    local r4_42 = r0_42:GetItemByConditionCheck(r1_42)
    if #r4_42 > 0 then
      for r8_42 = 1, #r4_42, 1 do
        r0_42.GuideDic[r4_42[r8_42]].ConditionCheck = r3_42
        r0_42:TryRunStoryByGuideId("ConditionCheck", r4_42[r8_42])
      end
    end
  end,
  FinishSystemGuideEvent = function(r0_43, r1_43)
    -- line: [692, 704] id: 43
    DebugPrint("SystemGuide FinishSystemGuideEvent GuideId:", r1_43)
    r0_43.GuideDic[r1_43].Finished = true
    r0_43:RemoveFinishedItemById(r1_43)
    r0_43:SendDataToServer(r1_43)
    local r2_43 = r0_43:GetItemByPreSysGuideId(r1_43)
    if #r2_43 > 0 then
      for r6_43 = 1, #r2_43, 1 do
        r0_43.GuideDic[r2_43[r6_43]].FinishedPreSysGuide = true
        r0_43:TryRunStoryByGuideId("FinishedPreSysGuide:" .. r1_43, r2_43[r6_43])
      end
    end
  end,
  FinishQuestEvent = function(r0_44, r1_44)
    -- line: [706, 716] id: 44
    if r0_44.Invalid then
      return 
    end
    DebugPrint("SystemGuide FinishQuestEvent Id:", r1_44)
    local r2_44 = r0_44:GetItemByQuestId(r1_44)
    if #r2_44 > 0 then
      for r6_44 = 1, #r2_44, 1 do
        r0_44.GuideDic[r2_44[r6_44]].FinishedQuest = true
        r0_44:TryRunStoryByGuideId("FinishQuestEvent", r2_44[r6_44])
      end
    end
  end,
  FinishQuestChainEvent = function(r0_45, r1_45)
    -- line: [718, 728] id: 45
    if r0_45.Invalid then
      return 
    end
    DebugPrint("SystemGuide FinishQuestChainEvent Id:", r1_45)
    local r2_45 = r0_45:GetItemByQuestChainId(r1_45)
    if #r2_45 > 0 then
      for r6_45 = 1, #r2_45, 1 do
        r0_45.GuideDic[r2_45[r6_45]].FinishedQuestChain = true
        r0_45:TryRunStoryByGuideId("FinishQuestChainEvent", r2_45[r6_45])
      end
    end
  end,
  UIUnlockRuleIdsFinishedEvent = function(r0_46, r1_46)
    -- line: [730, 734] id: 46
    for r6_46, r7_46 in pairs(r1_46:ToTable()) do
      r0_46:UIUnlockRuleIdFinishedEvent(r7_46)
    end
    -- close: r2_46
  end,
  UIUnlockRuleIdFinishedEvent = function(r0_47, r1_47)
    -- line: [736, 746] id: 47
    if r0_47.Invalid then
      return 
    end
    DebugPrint("SystemGuide UIUnlockRuleIdFinishedEvent Id:", r1_47)
    local r2_47 = r0_47:GetItemByUIUnlockRuleId(r1_47)
    if #r2_47 > 0 then
      for r6_47 = 1, #r2_47, 1 do
        r0_47.GuideDic[r2_47[r6_47]].UIUnlockRule = true
        r0_47:TryRunStoryByGuideId("UIUnlockRuleIdFinishedEvent", r2_47[r6_47])
      end
    end
  end,
  UIUnlockRuleIdUnFinishedEvent = function(r0_48, r1_48)
    -- line: [748, 765] id: 48
    if r0_48.Invalid then
      return 
    end
    DebugPrint("SystemGuide UIUnlockRuleIdUnFinishedEvent Id:", r1_48)
    local r2_48 = r0_48:GetItemByUIUnlockRuleId(r1_48)
    if #r2_48 > 0 then
      for r6_48 = 1, #r2_48, 1 do
        r0_48.GuideDic[r2_48[r6_48]].UIUnlockRule = false
        if #r0_48.GuideQueue > 0 then
          for r10_48 = 1, #r0_48.GuideQueue, 1 do
            if r0_48.GuideQueue[r10_48] == r2_48[r6_48] and r0_48.RunningId ~= r2_48[r6_48] then
              table.remove(r0_48.GuideQueue, r10_48)
              DebugPrint("UIUnlockRuleIdUnFinishedEvent:" .. r2_48[r6_48])
            end
          end
        end
      end
    end
  end,
  OnBecomeViewTarget = function(r0_49)
    -- line: [767, 770] id: 49
    r0_49.OnBecomeView = true
    r0_49:SetInputModeEvent(r0_49.IsUIOnly)
  end,
  OnEndViewTarget = function(r0_50)
    -- line: [772, 775] id: 50
    r0_50.OnBecomeView = false
    r0_50:SetInputModeEvent(r0_50.IsUIOnly)
  end,
  SetInputModeEvent = function(r0_51, r1_51)
    -- line: [778, 802] id: 51
    if r0_51.Invalid then
      return 
    end
    r0_51.IsUIOnly = r1_51
    DebugPrint("SystemGuide SetInputModeEvent IsUIOnly:", r1_51)
    local r2_51 = r0_51:GetItemByPlayerInControl()
    if #r2_51 > 0 then
      for r6_51 = 1, #r2_51, 1 do
        if not r1_51 and r0_51.OnBecomeView then
          r0_51.GuideDic[r2_51[r6_51]].FinishedPlayerInControl = true
          r0_51:TryRunStoryByGuideId("SetInputModeEvent:IsUIOnly==False", r2_51[r6_51])
        else
          r0_51.GuideDic[r2_51[r6_51]].FinishedPlayerInControl = false
          if #r0_51.GuideQueue > 0 then
            for r10_51 = 1, #r0_51.GuideQueue, 1 do
              if r0_51.GuideQueue[r10_51] == r2_51[r6_51] and r0_51.RunningId ~= r2_51[r6_51] then
                table.remove(r0_51.GuideQueue, r10_51)
                DebugPrint("SystemGuideQueueRemoveSetInputModeEvent:" .. r2_51[r6_51])
              end
            end
          end
        end
      end
    end
  end,
  TalkCompEvent = function(r0_52, r1_52)
    -- line: [804, 826] id: 52
    DebugPrint("Systemguide TalkCompEvent IsInTalkComp:", r1_52)
    if r0_52.Invalid then
      return 
    end
    local r2_52 = r0_52:GetItemByOutTalkComp()
    if #r2_52 > 0 then
      for r6_52 = 1, #r2_52, 1 do
        if r1_52 == false then
          r0_52.GuideDic[r2_52[r6_52]].FinishedOutTalkComp = true
          r0_52:TryRunStoryByGuideId("TalkCompEvent:IsInTalkComp==False", r2_52[r6_52])
        else
          r0_52.GuideDic[r2_52[r6_52]].FinishedOutTalkComp = false
          if #r0_52.GuideQueue > 0 then
            for r10_52 = 1, #r0_52.GuideQueue, 1 do
              if r0_52.GuideQueue[r10_52] == r2_52[r6_52] and r0_52.RunningId ~= r2_52[r6_52] then
                table.remove(r0_52.GuideQueue, r10_52)
                DebugPrint("SystemGuideQueueRemoveTalkCompEvent:" .. r2_52[r6_52])
              end
            end
          end
        end
      end
    end
  end,
  ImpressionTalkEvent = function(r0_53)
    -- line: [828, 838] id: 53
    if r0_53.Invalid then
      return 
    end
    DebugPrint("Systemguide ImpressionTalkEvent")
    local r1_53 = r0_53:GetItemBySpecialCondition("ImpressionTalk")
    if #r1_53 > 0 then
      for r5_53 = 1, #r1_53, 1 do
        r0_53.GuideDic[r1_53[r5_53]].FinishedSpecialCondition = true
        r0_53:TryRunStoryByGuideId("ImpressionTalkEvent", r1_53[r5_53])
      end
    end
  end,
  RunStory = function(r0_54, r1_54)
    -- line: [863, 941] id: 54
    local r2_54 = r1_54.GuideStoryline
    local r3_54 = r1_54.GuideEnd
    local r4_54 = r1_54.SysGuideId
    DebugPrint("RunStory,GuideId:" .. r4_54)
    if DataMgr.SystemGuide[r4_54].PlayerInControl == 1 then
      local r5_54 = UE4.URuntimeCommonFunctionLibrary.GetInputMode(GWorld.GameInstance:GetWorld())
      DebugPrint("GuideId:", r4_54, "CurMode:", r5_54, "PlayerInControl Systemguide RunStory")
      if r5_54 == "UIOnly" then
        DebugPrint("GuideId:", r4_54, "CurMode:", r5_54, "PlayerInControl Systemguide RunStory Error ")
        r0_54:SetInputModeEvent(true)
        r0_54:GuideQueueRemove(r4_54, "PlayerInControlRunStoryError")
        return 
      end
    end
    local r5_54 = DataMgr.SystemGuide[r4_54].UIUnlockRule
    if r5_54 ~= nil then
      local r6_54 = GWorld:GetAvatar()
      if r6_54 and r6_54:HasUIUnlockTask() then
        DebugPrint("GuideId:", r4_54, "Quest:", r5_54, "HasUIUnlockTask Systemguide RunStory Error ")
        r0_54:UIUnlockRuleIdUnFinishedEvent(r5_54)
        r0_54:GuideQueueRemove(r4_54, "HasUIUnlockTaskRunStoryError")
        return 
      end
    end
    DebugPrint("RunStory,SystemGuideId:" .. r4_54)
    local r6_54 = DataMgr.SystemGuide[r4_54].GuideChannel
    if not r6_54 then
      DebugPrint("引导缺少通道配置", r4_54)
      return 
    end
    local r7_54 = USubsystemBlueprintLibrary.GetWorldSubsystem(GWorld.GameInstance, UGameFlowManager)
    r0_54.Flow = r7_54:CreateFlow(r6_54)
    r0_54.Flow.OnBegin:Add(r0_54.Flow, function()
      -- line: [902, 939] id: 55
      EventManager:FireEvent(EventID.OnGuideStart, r4_54)
      r0_54.RunningId = r4_54
      r0_54.IsGuideStoryRunning = true
      if r3_54 == 0 then
        r0_54:FinishSystemGuideEvent(r4_54)
        local function r0_55()
          -- line: [908, 915] id: 56
          r0_54:RemoveFlow()
          r0_54.RunningId = -1
          r0_54.IsGuideStoryRunning = false
          r0_54:GuideQueueRemove(r4_54, "FinishSystemGuideEvent,FinishGuideType == 0")
          EventManager:FireEvent(EventID.OnGuideEnd, r4_54)
          r0_54:SetFocusOnGamepad()
        end
        GWorld.StoryMgr:RunStory(r2_54, nil, nil, r0_55, r0_55)
        DebugPrint("SystemGuideManagerRunStory", r2_54, r4_54, r3_54)
      elseif r3_54 == 1 then
        GWorld.StoryMgr:RunStory(r2_54, nil, nil, function()
          -- line: [919, 927] id: 57
          r0_54:RemoveFlow()
          r0_54.RunningId = -1
          r0_54.IsGuideStoryRunning = false
          r0_54:GuideQueueRemove(r4_54, "FinishSystemGuideEvent,FinishGuideType == 1")
          r0_54:FinishSystemGuideEvent(r4_54)
          EventManager:FireEvent(EventID.OnGuideEnd, r4_54)
          r0_54:SetFocusOnGamepad()
        end, function()
          -- line: [928, 935] id: 58
          r0_54:RemoveFlow()
          r0_54.RunningId = -1
          r0_54.IsGuideStoryRunning = false
          r0_54:GuideQueueRemove(r4_54, "FinishSystemGuideEvent,FinishGuideType == 1")
          EventManager:FireEvent(EventID.OnGuideEnd, r4_54)
          r0_54:SetFocusOnGamepad()
        end)
        DebugPrint("SystemGuideManagerRunStory", r2_54, r4_54, r3_54)
      end
    end)
    r7_54:AddFlow(r0_54.Flow)
  end,
  SetFocusOnGamepad = function(r0_59)
    -- line: [943, 952] id: 59
    if not (UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad) then
      return 
    end
    local r2_59 = UIManager(GWorld.GameInstance):GetLastestAndFocusableUIWidgetObj()
    if r2_59 ~= nil then
      r2_59:SetFocus()
    end
  end,
  RemoveFlow = function(r0_60)
    -- line: [954, 960] id: 60
    USubsystemBlueprintLibrary.GetWorldSubsystem(GWorld.GameInstance, UGameFlowManager):RemoveFlow(r0_60.Flow)
    DebugPrint("lkkRemoveFlow", r0_60.RunningId, DataMgr.SystemGuide[r0_60.RunningId].GuideChannel)
    r0_60.Flow = nil
  end,
  RemoveCurStl = function(r0_61)
    -- line: [962, 970] id: 61
    local r1_61 = r0_61.RunningId
    if r1_61 ~= -1 then
      r0_61.GuideDic[r1_61].IsBroken = true
    end
  end,
  GMEnforceFinishAllSysGuide = function(r0_62)
    -- line: [972, 992] id: 62
    local r1_62 = GWorld:GetAvatar()
    if not r1_62 then
      return 
    end
    for r6_62, r7_62 in pairs(DataMgr.SystemGuide) do
      local r8_62 = r0_62.GuideDic[r7_62.SysGuideId]
      if r8_62 == nil then
        DebugPrint("ERROR:SystemGuideManager Item is nil, SysGuideId:", r7_62.SysGuideId)
      else
        r8_62.Finished = r1_62.SystemGuides:GetSystemGuide(r7_62.SysGuideId):IsFinished()
        if not r8_62.Finished then
          r8_62.Finished = true
          r0_62:RemoveFinishedItemById(r7_62.SysGuideId)
          r0_62:SendDataToServer(r7_62.SysGuideId)
        end
      end
    end
    -- close: r2_62
  end,
  RemoveFinishedItemById = function(r0_63, r1_63)
    -- line: [994, 1001] id: 63
    for r6_63, r7_63 in pairs(r0_63.GuideUnfinishedDic) do
      if r7_63.Data.SysGuideId == r1_63 then
        r0_63.GuideUnfinishedDic[r6_63] = nil
        DebugPrint("SystemGuide RemoveFinishedItemById:", r1_63)
      end
    end
    -- close: r2_63
  end,
  RunGuideById = function(r0_64, r1_64)
    -- line: [1004, 1035] id: 64
    local r2_64 = GWorld:GetAvatar()
    if not r2_64 then
      return 
    end
    if r2_64.SystemGuides:GetSystemGuide(r1_64):IsFinished() then
      return 
    end
    if r0_64.GuideDic[r1_64] and r0_64.GuideDic[r1_64].GuideStart then
      if r0_64.GuideDic[r1_64].GuideStart == 0 then
        return 
      end
      if r0_64.GuideDic[r1_64].Finished == false and r0_64.GuideDic[r1_64].IsBroken ~= true and r0_64.GuideDic[r1_64].FinishedPreSysGuide and r0_64.GuideDic[r1_64].FinishedQuest and r0_64.GuideDic[r1_64].FinishedQuestChain and r0_64.GuideDic[r1_64].UIUnlockRule and r0_64.GuideDic[r1_64].FinishedOpenInterface and r0_64.GuideDic[r1_64].FinishedEnterDungeon and r0_64.GuideDic[r1_64].FinishedEnterRegion and r0_64.GuideDic[r1_64].FinishedPlayerInControl and r0_64.GuideDic[r1_64].FinishedSpecialCondition and r0_64.GuideDic[r1_64].FinishedOutTalkComp and r0_64.GuideDic[r1_64].FinishedFirstSeenTag and r0_64.GuideDic[r1_64].ConditionCheck and r0_64.GuideDic[r1_64].FinishedSystemUnlockWorking then
        r0_64:RunStory(r0_64.GuideDic[r1_64].Data)
      elseif r0_64.Platform == "PC" and r0_64.bOpenDebug then
        PrintTable(r0_64.GuideDic[r1_64], 3, "SystemGuide TryRunSourceFail")
      end
    end
  end,
}
