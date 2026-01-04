-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\GameMode\Components\RougeLikeComponent.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
require("Const")
local r0_0 = require("BluePrints.UI.TaskPanel.TaskUtils")
return {
  TriggerRougeLikeEnd = function(r0_1, r1_1)
    -- line: [10, 42] id: 1
    if not GWorld.RougeLikeManager then
      r0_1.EMGameState:ShowDungeonError("TriggerRougeLikeEnd 拿不到 RougeLikeManager", Const.DungeonErrorType.DungeonGame, Const.DungeonErrorTitle.FindObject)
      return 
    end
    DebugPrint("TriggerRougeLikeEnd RoomId", GWorld.RougeLikeManager.RoomId)
    local r2_1 = r0_1.LevelGameMode:StopAndGetRougeLikeTimer()
    local function r3_1()
      -- line: [20, 29] id: 2
      local r0_2 = GWorld:GetAvatar()
      if r0_2 then
        r0_2:PassRoom(r0_1.LevelGameMode:StopAndGetRougeLikeTimer())
      else
        r0_1.EMGameState:ShowDungeonError("TriggerRougeLikeEnd 拿不到 Avatar", Const.DungeonErrorType.DungeonGame, Const.DungeonErrorTitle.FindObject)
      end
    end
    if r1_1 then
      if DataMgr.RougeLikeRoomType[DataMgr.RougeLikeRoom[GWorld.RougeLikeManager.RoomId].RoomType].EnableTimeDilation then
        GWorld.RougeLikeManager:EnterRougeLikeBulletTime(0.2, 1, r3_1)
      else
        r3_1()
      end
    else
      r3_1()
    end
  end,
  FinishRougeLike = function(r0_3, r1_3, r2_3)
    -- line: [44, 65] id: 3
    if r0_3:IsDungeonInSettlement() then
      return 
    end
    local function r3_3(r0_4)
      -- line: [49, 56] id: 4
      DebugPrint("RougeLikeComponent:RealFinishRougeLike bStoryEvent", r0_4)
      if r0_4 then
        r0_3:ShowFinishRougeStory(r1_3, r2_3)
      else
        r0_3:TriggerRealFinish(r1_3, r2_3)
      end
    end
    GWorld.RougeLikeManager:TriggerRecordProgressData({
      IsRougeFinished = true,
      IsWin = r1_3,
    })
    GWorld:GetAvatar():PreFinishRougeLike(r3_3, r1_3)
  end,
  ShowFinishRougeStory = function(r0_5, r1_5, r2_5)
    -- line: [67, 74] id: 5
    EventManager:AddEvent(EventID.OnRougeLikeStoryEventEnd, r0_5, function()
      -- line: [68, 72] id: 6
      DebugPrint("RougeLikeComponent:ReceivedEvent EventID.OnRougeLikeStoryEventEnd")
      EventManager:RemoveEvent(EventID.OnRougeLikeStoryEventEnd, r0_5)
      r0_5:TriggerRealFinish(r1_5, r2_5)
    end)
    GWorld.RougeLikeManager:ShowRougeStoryEvent()
  end,
  TriggerRealFinish = function(r0_7, r1_7, r2_7)
    -- line: [76, 86] id: 7
    if r1_7 then
      r0_7:TriggerDungeonWin()
    elseif r2_7 then
      r0_7:TriggerPlayerFailed(r2_7)
    else
      r0_7:TriggerDungeonFailed()
    end
  end,
  OnRougeLikeEnterNextRoom = function(r0_8)
    -- line: [89, 112] id: 8
    DebugPrint("RougeLike OnRougeLikeEnterNextRoom RoomIndex:", GWorld.RougeLikeManager.RoomIndex, "RoomId:", GWorld.RougeLikeManager.RoomId)
    if GWorld.RougeLikeManager.IsListeningDealRewardEvent then
      r0_8.EMGameState:ShowDungeonError("RougeLike Error! 进入下一房间时,ListeningDealRewardEvent没有被清除！联系ljl检查！", Const.DungeonErrorType.DungeonGame, Const.DungeonErrorTitle.Process)
      GWorld.RougeLikeManager.IsListeningDealRewardEvent = false
    end
    GWorld.RougeLikeManager:RemoveDataManagerInfos(r0_8.RougeLikeLastRoomId, true)
    GWorld.RougeLikeManager:RegisterNextRoomData(r0_8.RougeLikeCurRoomId)
    r0_8:ClearMonsterSpawnDivisions()
    r0_8:InitMonsterSpawnDivisions(r0_8.EMGameState.MonsterSpawnPointParams)
    r0_8:RefreshRougeBattleUI(false, true)
    Battle(r0_8):TriggerBattleEvent(BattleEventName.RougeEnterNewRoom, UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0))
  end,
  CreateProbabilityMonster = function(r0_9, r1_9, r2_9)
    -- line: [115, 152] id: 9
    if not r2_9 then
      return 
    end
    local r3_9 = r0_9.LevelGameMode:GetLevelLoader()
    if r3_9 == nil then
      return 
    end
    local r4_9 = UE4.UGameplayStatics.GetGameMode(r0_9)
    local r5_9 = r4_9:GetAllPlayer()[1].CurrentLocation
    local r6_9 = UKismetMathLibrary.Vector_Zero()
    local r7_9 = false
    for r11_9 = 1, r4_9.EmergencyMonsterSpawnLoc.RandomTime, 1 do
      if UNavigationSystemV1.K2_GetRandomLocationInNavigableRadius(r0_9, r5_9, r6_9, r0_9.EmergencyMonsterSpawnLoc.MaxDistance) == true and math.abs(r5_9.Z - r6_9.Z) <= r0_9.EmergencyMonsterSpawnLoc.MaxZDistance and r3_9:GetLevelIdByLocation(r5_9) == r3_9:GetLevelIdByLocation(r6_9) and UNavigationFunctionLibrary.CheckTwoPosHasPath(r5_9, r6_9, r0_9) == EPathConnectType.HasPath then
        r7_9 = true
        break
      end
    end
    if r7_9 == false then
      r6_9 = r4_9:GetMonsterCustomLoc(nil)
    end
    if UKismetMathLibrary.EqualEqual_VectorVector(r6_9, UKismetMathLibrary.Vector_Zero(), 0.001) == false then
      local r8_9 = AEventMgr.CreateUnitContext()
      r8_9.UnitType = "Monster"
      r8_9.UnitId = r2_9
      r8_9.Loc = r6_9
      r8_9.MonsterSpawn = r4_9.LevelGameMode.FixedMonsterSpawn
      r8_9.IntParams:Add("Level", r4_9:GetFixedGamemodeLevel())
      r4_9.EMGameState.EventMgr:CreateUnitNew(r8_9, false)
      r0_9[r1_9 .. "MonsterSpawnProbability"] = nil
    end
  end,
  PreCreateProbabilityMonster = function(r0_10, r1_10, r2_10)
    -- line: [155, 158] id: 10
    r0_10:CreateProbabilityMonster(r1_10, r2_10)
    r0_10[r1_10 .. "MonsterTimer"] = nil
  end,
  CheckCreateProbabilityMonster = function(r0_11, r1_11)
    -- line: [161, 202] id: 11
    DebugPrint("[THY] RougeLike CheckCreateSpecialMonster", r1_11)
    if GWorld.RougeLikeManager.RoomIndex < DataMgr.RougeLikeDifficulty[GWorld.RougeLikeManager.DifficultyId].TMMinRoom then
      return 
    end
    local r2_11 = DataMgr.RougeLikeRoom[r0_11.RougeLikeCurRoomId]
    if r2_11 and r2_11.RoomType ~= 1 and r2_11.RoomType ~= 6 then
      DebugPrint("[THY]  CheckCreateSpecialMonster: RoomInfo.RoomType ~= 1 and RoomInfo.RoomType ~= 6")
      return 
    end
    if r0_11[r1_11 .. "MonsterTimer"] ~= nil then
      return 
    end
    local r3_11 = DataMgr.RougeLikeDifficulty[GWorld.RougeLikeManager.DifficultyId]
    if not r3_11 then
      return 
    end
    if not r0_11[(r1_11 .. "MonsterCreatedNum")] then
      r0_11[r1_11 .. "MonsterCreatedNum"] = 0
    end
    if r0_11[r1_11 .. "MonsterCreatedNum"] >= r3_11.TMMaxNum then
      DebugPrint("[THY] ThisMonsterCreatedNum is upper limit", r0_11[r1_11 .. "MonsterCreatedNum"])
      r0_11[r1_11 .. "MonsterTimer"] = nil
      return 
    end
    if r0_11[r1_11 .. "MonsterSpawnProbability"] < math.random() then
      return 
    end
    local r4_11 = math.random(r3_11.TMBornTime[1], r3_11.TMBornTime[2])
    DebugPrint("[THY] After ", r4_11, "s, CreateTreasureMonster, and TreasureMonsterCreatedNum is", r0_11[(r1_11 .. "MonsterCreatedNum")] + 1)
    r0_11[r1_11 .. "MonsterTimer"] = r0_11:AddTimer(r4_11, function()
      -- line: [201, 201] id: 12
      r0_11:PreCreateProbabilityMonster(r1_11, r3_11.TMId)
    end, false)
  end,
  SetProbabilityMonsterSpawnProbability = function(r0_13, r1_13, r2_13, r3_13)
    -- line: [205, 218] id: 13
    if not r3_13 or not r3_13.TMProbability then
      return 
    end
    if r2_13.RoomType ~= 1 and r2_13.RoomType ~= 6 then
      return 
    end
    if r0_13[r1_13 .. "MonsterSpawnProbability"] then
      r0_13[r1_13 .. "MonsterSpawnProbability"] = r0_13[(r1_13 .. "MonsterSpawnProbability")] + r3_13.TMProbability[2]
    else
      r0_13[r1_13 .. "MonsterSpawnProbability"] = r3_13.TMProbability[1]
    end
    DebugPrint("[THY] RougeLike", r1_13, "MonsterSpawnProbability is ", r0_13[r1_13 .. "MonsterSpawnProbability"])
  end,
  TryCreateProbabilityMonsterInRougeLike = function(r0_14)
    -- line: [220, 232] id: 14
    local r1_14 = DataMgr.RougeLikeRoom[r0_14.LevelGameMode.RougeLikeCurRoomId]
    local r2_14 = DataMgr.RougeLikeDifficulty[GWorld.RougeLikeManager.DifficultyId]
    if r1_14 and r2_14 then
      r0_14.LevelGameMode:SetProbabilityMonsterSpawnProbability("Treasure", r1_14, r2_14)
      r0_14.LevelGameMode:CheckCreateProbabilityMonster("Treasure")
      return 
    end
    DebugPrint("RoomInfo or DifficultyInfo can not be found")
  end,
  OnRougeLikeRoomInit = function(r0_15)
    -- line: [235, 243] id: 15
    r0_15.RougeLikeLastRoomId = r0_15.RougeLikeCurRoomId
    r0_15.RougeLikeCurRoomId = GWorld.RougeLikeManager.RoomId
    DebugPrint("RougeLike OnRougeLikeRoomInit", GWorld.RougeLikeManager.RoomIndex, "LastRoomId:", r0_15.RougeLikeLastRoomId, "CurRoomId:", r0_15.RougeLikeCurRoomId)
    r0_15:SetRougeLikeGameModeLevel()
    r0_15:StartRougeLikeTimer()
    r0_15:ShowRougeLikeSubTask(false)
  end,
  SetRougeLikeGameModeLevel = function(r0_16)
    -- line: [245, 266] id: 16
    local r1_16 = GWorld.RougeLikeManager
    if not IsValid(r1_16) then
      r0_16.EMGameState:ShowDungeonError("RougeLike Error! 找不到GWorld.RougeLikeManager", Const.DungeonErrorType.DungeonGame, Const.DungeonErrorTitle.FindObject)
      return 
    end
    local r2_16 = DataMgr.RougeLikeDifficulty[r1_16.DifficultyId]
    if not r2_16 then
      r0_16.EMGameState:ShowDungeonError("RougeLike Error! 没有对应RougeLikeDifficulty, DifficultyId: " .. r1_16.DifficultyId, Const.DungeonErrorType.DungeonGame, Const.DungeonErrorTitle.Config)
      return 
    end
    local r3_16 = r2_16.RoomLevel
    if not r3_16 then
      r0_16.EMGameState:ShowDungeonError("RougeLike Error! 没有对应RoomLevel, DifficultyId: ", r1_16.DifficultyId, Const.DungeonErrorType.DungeonGame, Const.DungeonErrorTitle.Config)
      return 
    end
    local r4_16 = r3_16[r1_16.RoomIndex] and 0
    r0_16:SetGameModeLevel(r4_16)
    DebugPrint("RougeLike SetRougeLikeGameModeLevel Succeed! DifficultyId: ", r1_16.DifficultyId, " RoomIndex: ", r1_16.RoomIndex, " GameModeLevel: ", r4_16)
  end,
  StartRougeLikeTimer = function(r0_17)
    -- line: [268, 275] id: 17
    r0_17.RougeLikeTotalTime = 0
    r0_17:AddTimer(0.1, function()
      -- line: [270, 272] id: 18
      r0_17.RougeLikeTotalTime = r0_17.RougeLikeTotalTime + 0.1
    end, true, 0, "RougeLikeTimer")
    DebugPrint("RougeLike TimerStart")
  end,
  StopAndGetRougeLikeTimer = function(r0_19)
    -- line: [277, 281] id: 19
    r0_19:RemoveTimer("RougeLikeTimer")
    DebugPrint("RougeLike TimerStop. TotalTime:", r0_19.RougeLikeTotalTime)
    return r0_19.RougeLikeTotalTime and 0
  end,
  SpawnRougeLikeRoomShops = function(r0_20)
    -- line: [283, 288] id: 20
    if GWorld.RougeLikeManager == nil then
      return 
    end
    GWorld.RougeLikeManager:SpawnRoomShops()
  end,
  RefreshRougeBattleUI = function(r0_21, r1_21, r2_21)
    -- line: [291, 311] id: 21
    local r3_21 = nil
    if r1_21 then
      r3_21 = Const.EDungeonUIState.OnTarget
    else
      r3_21 = Const.EDungeonUIState.None
    end
    r0_21.EMGameState:SetDungeonUIState(r3_21)
    local r4_21 = GWorld.GameInstance:GetGameUIManager()
    if not r4_21 then
      return 
    end
    local r5_21 = r4_21:GetUIObj("Rouge_BattleProgress")
    if r5_21 then
      r5_21:RefreshVisibility()
    end
    if r2_21 then
      r0_21.EMGameState:SetRougeBattleNums(0)
    end
  end,
  InitRougeLikeSubTask = function(r0_22, r1_22)
    -- line: [313, 315] id: 22
    r0_22:ShowRougeLikeSubTask(true, r1_22)
  end,
  ShowRougeLikeSubTask = function(r0_23, r1_23, r2_23)
    -- line: [317, 331] id: 23
    local r3_23 = r0_0:GetTaskBarWidget()
    if not r3_23 then
      DebugPrint("RougeLikeComponent:ShowRougeLikeSubTask, 找不到任务栏")
      return 
    end
    if r1_23 then
      r0_23.LevelGameMode.RougeLikeSubTaskText = r2_23
      r3_23:AddOptionalTask(r2_23)
    else
      r0_23.LevelGameMode.RougeLikeSubTaskText = nil
      r3_23:RemoveOptionalTask()
    end
  end,
  TriggerRougeLikePassEvent = function(r0_24, r1_24, r2_24, r3_24)
    -- line: [333, 350] id: 24
    local r4_24 = GWorld:GetAvatar()
    if not r4_24 then
      r0_24.EMGameState:ShowDungeonError("EMGameMode::TriggerRougeLikePassEvent No  Avatar", Const.DungeonErrorType.DungeonGame, Const.DungeonErrorTitle.FindObject)
      return 
    end
    if r1_24 == "" then
      DebugPrint("RougeLikeComponent::TriggerRougeLikePassEvent NotGame")
      r4_24:PassEvent()
    else
      DebugPrint("RougeLikeComponent::TriggerRougeLikePassEvent MiniGameName", r1_24, "FinialScore", r2_24, "IsWin", r3_24)
      r4_24:PassEvent(r3_24, {
        Score = r2_24,
      })
    end
  end,
  SpeciaMonsterOnDeadReal = function(r0_25, r1_25, r2_25)
    -- line: [352, 385] id: 25
    local r3_25 = GWorld:GetAvatar()
    if r3_25 and r3_25:IsInRougeLike() then
      DebugPrint("[THY]  MonsterIsDead")
      if r1_25 ~= "Treasure" then
        return 
      end
      local r4_25 = DataMgr.RougeLikeDifficulty[GWorld.RougeLikeManager.DifficultyId]
      if not r4_25 then
        return 
      end
      DebugPrint("RougeLikeComponent:SpeciaMonsterOnDeadReal UnitId", r2_25, "TMId", r4_25.TMId)
      if r2_25 ~= r4_25.TMId then
        return 
      end
      if r0_25[r1_25 .. "MonsterCreatedNum"] then
        r0_25[r1_25 .. "MonsterCreatedNum"] = r0_25[(r1_25 .. "MonsterCreatedNum")] + 1
      else
        r0_25[r1_25 .. "MonsterCreatedNum"] = 1
      end
      r3_25:TriggerTMGetReward()
      if r1_25 == "Treasure" then
        r3_25:SavePlayerSlice({
          Type = Const.RougeSliceInfoType.TreasureMonCount,
          Value = {
            TreasureMonCount = r0_25.TreasureMonsterCreatedNum,
          },
        })
        DebugPrint("RougeLike SaveTreasureMonCount =", r0_25.TreasureMonsterCreatedNum)
      end
    end
  end,
  SpeciaMonsterOnDead = function(r0_26, r1_26)
    -- line: [386, 389] id: 26
    r0_26:SpeciaMonsterOnDeadReal("Treasure", r1_26)
  end,
  IsAllRoomPassed = function(r0_27)
    -- line: [393, 402] id: 27
    local r1_27 = DataMgr.RougeLikeDifficulty[GWorld.RougeLikeManager.DifficultyId]
    if not r1_27 then
      return false
    end
    local r2_27 = r1_27.RoomRandom
    if not r2_27 then
      return false
    end
    return #r2_27 == GWorld.RougeLikeManager.PassRooms:Num()
  end,
  TriggerAllContractDungeonEffect = function(r0_28)
    -- line: [404, 406] id: 28
    GWorld.RougeLikeManager:TriggerAllContractDungeonEffect()
  end,
  GetContractMonsterNum = function(r0_29)
    -- line: [408, 430] id: 29
    local r1_29 = GWorld.RougeLikeManager
    local r2_29 = r1_29.Contract
    local r3_29 = 0
    if r2_29 ~= nil then
      for r8_29, r9_29 in pairs(r2_29) do
        local r10_29 = DataMgr.RougeLikeRoom[r1_29.RoomId].RoomType
        local r11_29 = DataMgr.RougelikeContract[r8_29]
        if r11_29.UnitType == "Monster" then
          local r13_29 = r11_29.RoomType
          for r17_29 = 1, #r13_29, 1 do
            if r10_29 == r13_29[r17_29] then
              r3_29 = r3_29 + r11_29.UnitNum[r9_29]
              break
            end
          end
        end
      end
      -- close: r4_29
    end
    DebugPrint("HTY GetContractMonsterNum: ", r3_29)
    return r3_29
  end,
  StartRougeMiniGame = function(r0_30, r1_30, r2_30)
    -- line: [432, 442] id: 30
    local r3_30 = "StartRouge" .. r1_30 .. "MiniGame"
    if r0_30[r3_30] then
      DebugPrint("RougeLikeComponent:StartRougeMiniGame MiniGameName", r1_30, "MiniGameId", r2_30)
      r0_30.EMGameState.RougeMiniGameProgressing = true
      r0_30.RougeMiniGameName = r1_30
      r0_30[r3_30](r0_30, r2_30)
    else
      r0_30.EMGameState:ShowDungeonError("RougeLikeComponent:StartRougeMiniGame FunName", r3_30, "未实现 或 不存在该玩法", Const.DungeonErrorType.DungeonGame, Const.DungeonErrorTitle.Implement)
    end
  end,
  EndRougeMiniGame = function(r0_31, r1_31)
    -- line: [444, 456] id: 31
    if r0_31.RougeMiniGameName then
      local r2_31 = "EndRouge" .. r0_31.RougeMiniGameName .. "MiniGame"
      if r0_31[r2_31] then
        DebugPrint("RougeLikeComponent:EndRougeMiniGame MiniGameName", r0_31.RougeMiniGameName)
        r0_31[r2_31](r0_31, r1_31)
        r0_31.EMGameState.RougeMiniGameProgressing = false
        r0_31.RougeMiniGameName = nil
      else
        r0_31.EMGameState:ShowDungeonError("RougeLikeComponent:StartRougeMiniGame FunName", r2_31, "未实现 或 不存在该玩法", Const.DungeonErrorType.DungeonGame, Const.DungeonErrorTitle.Implement)
      end
    end
  end,
  RougeShowUITip = function(r0_32, r1_32, r2_32)
    -- line: [458, 465] id: 32
    if r2_32 then
      UIManager(r0_32):ShowUITip(UIConst.Tip_CommonWarning, r1_32, 2)
    else
      UIManager(r0_32):LoadUINew("ExploreToastSuccess", r1_32)
    end
  end,
  OnCanonMonsterDead = function(r0_33, r1_33)
    -- line: [468, 486] id: 33
    if not IsValid(r1_33) then
      r0_33.EMGameState:ShowDungeonError("RougeLikeComponent:OnCanonMonsterDead Monster is nil", Const.DungeonErrorType.DungeonGame, Const.DungeonErrorTitle.FindObject)
      return 
    end
    local r2_33 = r1_33.MonsterDeathReason
    DebugPrint("RougeLikeComponent:OnCanonMonsterDead UnitId", r1_33.UnitId, "DeathReason", EDeathReason:GetNameByValue(r2_33))
    local r3_33 = 0
    local r4_33 = DataMgr.CanonMiniGame[r1_33.UnitId]
    if r4_33 then
      if r2_33 == EDeathReason.KillSelf then
        r3_33 = r4_33.SelfKillScore and 0
      else
        r3_33 = r4_33.KillScore and 0
      end
    end
    r0_33:AddCanonScore(r3_33)
  end,
  AddCanonScore = function(r0_34, r1_34)
    -- line: [488, 492] id: 34
    r0_34.CanonScore = (r0_34.CanonScore and 0) + r1_34
    EventManager:FireEvent(EventID.OnRougeLikeCanonScoreAdd, r0_34.CanonScore, r1_34)
    DebugPrint("RougeLikeComponent:AddCanonScore Score", r1_34, "CurrentScore:", r0_34.CanonScore)
  end,
  GetCanonScore = function(r0_35)
    -- line: [494, 496] id: 35
    return r0_35.CanonScore and 0
  end,
  StartRougeCanonMiniGame = function(r0_36, r1_36)
    -- line: [498, 501] id: 36
    r0_36:OnWaveStart()
    EventManager:FireEvent(EventID.StartRougeCanonMiniGame)
  end,
  EndRougeCanonMiniGame = function(r0_37, r1_37)
    -- line: [503, 523] id: 37
    r0_37:EndInteractive()
    r0_37:RemoveTimer("RougeCanonStartCountDown")
    r0_37:RemoveTimer("RougeCanonShowToast")
    r0_37:RemoveTimer("RougeCanonTimer")
    local r2_37 = UIManager(r0_37):GetUIObj("GuideCountDown")
    if r2_37 then
      r2_37:OnCountDownEnd()
    end
    local r3_37 = r0_37:GetWaveStartBP()
    if r3_37 then
      r3_37:OnOutAnimationEnd()
    end
    EventManager:FireEvent(EventID.EndRougeCanonMiniGame)
    r0_37:TriggerRougeLikePassEvent("Canon", r0_37:GetCanonScore(), r1_37)
    r0_37:PostCustomEvent("CanonGameEnd")
  end,
  RealStartRougeCanon = function(r0_38)
    -- line: [525, 528] id: 38
    r0_38:PostCustomEvent("CanonGameMonsterStart")
    r0_38:StartRougeCanonTimer()
  end,
  StartRougeCanonTimer = function(r0_39)
    -- line: [530, 550] id: 39
    local r1_39 = UIManager(r0_39):GetUIObj("BattleMain")
    if IsValid(r1_39) then
      r1_39:StartRougeCanonCountDown()
    end
    r0_39.RougeCanonTime = r0_39.TotalTime
    r0_39:AddTimer(0.1, function()
      -- line: [536, 548] id: 40
      r0_39.RougeCanonTime = r0_39.RougeCanonTime - 0.1
      if r0_39.RougeCanonTime < 0 then
        r0_39.RougeCanonTime = 0
      end
      if IsValid(r1_39) then
        r1_39:RefreshRougeGameCountDown(r0_39.RougeCanonTime)
      end
      if r0_39.RougeCanonTime == 0 then
        r0_39:EndRougeCanonMiniGame(true)
        r0_39:RemoveTimer("RougeCanonTimer")
      end
    end, true, 0, "RougeCanonTimer")
  end,
  EndInteractive = function(r0_41)
    -- line: [552, 563] id: 41
    local r1_41 = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
    if r1_41 then
      local r2_41 = r1_41.MechanismEid
      if r2_41 ~= 0 then
        local r3_41 = Battle(GWorld.GameInstance):GetEntity(r2_41)
        if r3_41 and r3_41.ChestInteractiveComponent then
          r3_41.ChestInteractiveComponent:ForceEndInteractive(r1_41, false, Const.ForceEndInteractive)
        end
      end
    end
  end,
  GetWaveStartBP = function(r0_42)
    -- line: [565, 572] id: 42
    local r1_42 = UIManager(r0_42):GetUIObj("WaveStartBP") and UIManager(r0_42):LoadUINew("WaveStartBP")
    r1_42:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
    return r1_42
  end,
  OnWaveStart = function(r0_43)
    -- line: [574, 592] id: 43
    local r1_43 = 1
    local r2_43 = r0_43:GetWaveStartBP()
    if r2_43 then
      r2_43:SetVisibility(ESlateVisibility.Collapsed)
      r2_43.Text_WaveStart:SetText(GText("RougePaotaiMiniGameStart"))
      r2_43:UnbindAllFromAnimationFinished(r2_43.Out)
      r2_43:BindToAnimationFinished(r2_43.Out, {
        r2_43,
        r2_43.Close
      })
      r0_43:AddTimer(r0_43.Countdown, function()
        -- line: [582, 586] id: 44
        r2_43:SetVisibility(ESlateVisibility.HitTestInvisible)
        r2_43:PlayInAnimation()
        r0_43:RealStartRougeCanon()
      end, false, 0, "RougeCanonStartCountDown")
      r0_43:AddTimer(r0_43.Countdown + r1_43, function()
        -- line: [587, 589] id: 45
        r2_43:PlayOutAnimation()
      end, false, 0, "RougeCanonShowToast")
    end
    r0_43:ShowCountDown()
  end,
  ShowCountDown = function(r0_46)
    -- line: [594, 600] id: 46
    (UIManager(r0_46):GetUIObj("GuideCountDown") and UIManager(r0_46):LoadUINew("GuideCountDown")):InitializeData(r0_46.Countdown)
  end,
  StartRougeMorseMiniGame = function(r0_47, r1_47)
    -- line: [605, 611] id: 47
    local r2_47 = DataMgr.MorseMiniGame[r1_47]
    assert(r2_47, "MorseMiniGame读表不存在，MiniGameId:" .. r1_47)
    r0_47.CurMorseMiniGameId = r1_47
    UIManager(r0_47):LoadUINew("Morse", r2_47.Difficulty, r2_47.TotalTime, r0_47, r0_47.EndRougeMiniGame)
  end,
  EndRougeMorseMiniGame = function(r0_48, r1_48)
    -- line: [613, 626] id: 48
    assert(r0_48.CurMorseMiniGameId, "CurMorseMiniGameId不存在！")
    local r2_48 = DataMgr.MorseMiniGame[r0_48.CurMorseMiniGameId]
    local r3_48 = 0
    if r1_48 then
      r3_48 = r2_48.SuccScore
    else
      r3_48 = r2_48.FailScore
    end
    r0_48:TriggerRougeLikePassEvent("Morse", r3_48, r1_48)
  end,
  FillRougeLikeErrorLog = function(r0_49, r1_49)
    -- line: [630, 650] id: 49
    table.insert(r1_49, "副本状态GameModeState: " .. EGameModeState:GetNameByValue(r0_49.GameState.GameModeState) .. "\n")
    table.insert(r1_49, "当前副本是否结算: " .. tostring(r0_49:IsDungeonInSettlement()) .. "\n")
    table.insert(r1_49, "战斗关进度：" .. tostring(r0_49.EMGameState.RougeBattleCount) .. "/" .. tostring(r0_49.EMGameState.RougeBattleMaxNum) .. "\n")
    table.insert(r1_49, "盗宝怪刷新数: " .. tostring(r0_49.TreasureMonsterCreatedNum) .. "\n")
    table.insert(r1_49, "盗宝怪刷新概率: " .. tostring(r0_49.TreasureMonsterSpawnProbability) .. "\n")
    local r2_49 = UE.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
    if r2_49 then
      local r3_49 = r2_49.PlayerState
      if r3_49 then
        table.insert(r1_49, "玩家死亡(复活)次数 / 最大死亡(复活)次数：" .. tostring(r3_49.RecoveryCount) .. "/" .. tostring(r3_49.RecoveryMaxCount) .. "\n")
      end
    end
    local r3_49 = ""
    for r8_49, r9_49 in pairs(r0_49.SubGameModeInfo) do
      r3_49 = r9_49.RougeMiniGameName
    end
    -- close: r4_49
    table.insert(r1_49, "当前MiniGame名称: " .. tostring(r3_49) .. "\n")
  end,
}
