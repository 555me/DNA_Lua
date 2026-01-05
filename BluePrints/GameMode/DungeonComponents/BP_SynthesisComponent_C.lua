-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\GameMode\DungeonComponents\BP_SynthesisComponent_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.Common.TimerMgr"
})
function r0_0.InitSynthesisComponent(r0_1)
  -- line: [16, 46] id: 1
  r0_1.GameMode = r0_1:GetOwner()
  r0_1.IconPathYellow = "MainMission"
  r0_1.IconPathRed = "DefeatMission"
  r0_1.IconPathSpecialEnemy = "SpecialEnemy"
  r0_1.TextTitle = "DUNGEON_SYNTHESIS_100"
  local r1_1 = DataMgr.Synthesis[r0_1.GameMode.DungeonId]
  if not r1_1 then
    GameState(r0_1):ShowDungeonError("SynthesisComponent:当前副本ID没有填写在对应的副本表中, 读表失败! 读入Id：" .. r0_1.GameMode.DungeonId, Const.DungeonErrorType.DungeonGame, Const.DungeonErrorTitle.Config)
    return 
  end
  r0_1.MonAddRage = r1_1.MonAddRage and 1
  r0_1.BreakableAddRage = r1_1.BreakableAddRage and 0.1
  r0_1.MechanismAddRageMap = r1_1.MechanismAddRageMap and {}
  local r2_1 = r1_1.RageValueStages
  if not r2_1 then
    r2_1 = {}
    local r3_1 = 100
    -- setlist for #2 failed
  end
  r0_1.RageValueStages = r2_1
  r0_1.MaxRageValue = r0_1.RageValueStages[#r0_1.RageValueStages]
  r0_1.SupervisorCreatorIds = r1_1.SupervisorCreatorIds and {}
  r0_1.OccupationTargetNum = r1_1.OccupationTargetNum and 7
  r0_1.BlastMonInterval = r1_1.BlastMonInterval and 60
  r0_1.KeyNeedNum = r1_1.KeyNeedNum and 6
  r0_1.CurMission = ""
  r0_1.OccupateGuide = {}
  DebugPrint("SynthesisComponent: InitSynthesisComponent")
end
function r0_0.InitSynthesisBaseInfo(r0_2)
  -- line: [48, 50] id: 2
  r0_2.GameMode:AddDungeonEvent("SynthesisBuffList")
end
function r0_0.TriggerSynthesisOnEnd(r0_3)
  -- line: [52, 54] id: 3
  r0_3.GameMode:RemoveDungeonEvent("SynthesisBuffList")
end
function r0_0.OnUnitDeadEvent(r0_4, r1_4)
  -- line: [58, 63] id: 4
  local r2_4 = "OnUnitDeadEvent_" .. r0_4.CurMission
  if r0_4[r2_4] then
    r0_4[r2_4](r0_4, r1_4)
  end
end
function r0_0.OnCombatPropDeadEvent(r0_5, r1_5)
  -- line: [65, 70] id: 5
  local r2_5 = "OnCombatPropDeadEvent_" .. r0_5.CurMission
  if r0_5[r2_5] then
    r0_5[r2_5](r0_5, r1_5)
  end
end
function r0_0.OnStaticCreatorEvent(r0_6, r1_6, r2_6, r3_6, r4_6)
  -- line: [72, 77] id: 6
  local r5_6 = "OnStaticCreatorEvent_" .. r0_6.CurMission
  if r0_6[r5_6] then
    r0_6[r5_6](r0_6, r1_6, r2_6, r3_6, r4_6)
  end
end
function r0_0.OnMonsterGuideAdded(r0_7, r1_7)
  -- line: [79, 84] id: 7
  local r2_7 = "OnMonsterGuideAdded_" .. r0_7.CurMission
  if r0_7[r2_7] then
    r0_7[r2_7](r0_7, r1_7)
  end
end
function r0_0.OnDefenceCoreActive(r0_8, r1_8)
  -- line: [86, 91] id: 8
  local r2_8 = "OnDefenceCoreActive_" .. r0_8.CurMission
  if r0_8[r2_8] then
    r0_8[r2_8](r0_8, r1_8)
  end
end
function r0_0.SetMission(r0_9, r1_9)
  -- line: [94, 105] id: 9
  local r2_9 = "Init" .. r1_9 .. "Mission"
  if not r0_9[r2_9] then
    GameState(r0_9):ShowDungeonError("SynthesisComponent:SetMission 传入不存在的任务名！请检查 " .. r0_9.GameMode.DungeonId .. " 传入任务名: " .. r1_9, Const.DungeonErrorType.DungeonGame, Const.DungeonErrorTitle.Config)
    return 
  end
  r0_9.CurMission = r1_9
  r0_9[r2_9](r0_9)
  DebugPrint("SynthesisComponent: SetMission", r0_9.CurMission)
end
function r0_0.GetDungeonJsonAttr(r0_10)
  -- line: [107, 114] id: 10
  local r1_10 = r0_10.GameMode:GetLevelLoader()
  if not r1_10 then
    return {}
  end
  return r1_10.attr and {}
end
function r0_0.InitDestructionMission(r0_11)
  -- line: [117, 141] id: 11
  r0_11:SetRageValue(0)
  r0_11.CurRageStage = 0
  r0_11.SupervisorInfo = {}
  r0_11.SupervisorDeadCount = 0
  r0_11.SupervisorGuideNum = 0
  r0_11:InitCreatorIdToLevelNameMap()
  for r5_11, r6_11 in pairs(r0_11.SupervisorCreatorIds) do
    local r7_11 = r0_11.CreatorIdToLevelName[r6_11]
    local r8_11 = r0_11.GameMode.SubGameModeInfo:FindRef(r7_11)
    if IsValid(r8_11) then
      local r9_11 = TArray(0)
      r9_11:Add(r6_11)
      r8_11:TriggerActiveStaticCreator(r9_11, "DestructionSupervisor", true)
    else
      GameState(r0_11):ShowDungeonError("SynthesisComponent:刷新主管失败，请检查配置  CreatorId: " .. tostring(r6_11) .. "LevelName: " .. tostring(r7_11), Const.DungeonErrorType.DungeonGame, Const.DungeonErrorTitle.Config)
    end
  end
  -- close: r1_11
  r0_11.GameMode:NotifyClientShowDungeonTaskNew("", r0_11.TextTitle, "DUNGEON_SYNTHESIS_113")
  r0_11.GameMode:AddDungeonEvent("SynthesisDestruction")
end
function r0_0.InitCreatorIdToLevelNameMap(r0_12)
  -- line: [143, 154] id: 12
  local r1_12 = r0_12:GetDungeonJsonAttr()
  r0_12.CreatorIdToLevelName = {}
  for r6_12, r7_12 in pairs(r1_12) do
    for r12_12, r13_12 in pairs(r7_12) do
      local r14_12 = string.split(r12_12, "_")[1]
      r0_12.CreatorIdToLevelName[tonumber(r14_12)] = tostring(r7_12[r14_12 .. "_id"])
      break
    end
    -- close: r8_12
  end
  -- close: r2_12
end
function r0_0.OnUnitDeadEvent_Destruction(r0_13, r1_13)
  -- line: [156, 177] id: 13
  if not IsValid(r1_13) then
    return 
  end
  DebugPrint("SynthesisComponent: MonsterDeadAddRage", r0_13.MonAddRage)
  r0_13:AddRageValue(r0_13.MonAddRage)
  if r0_13.SupervisorInfo[r1_13.Eid] and r0_13.SupervisorInfo[r1_13.Eid].IsAlive then
    DebugPrint("SynthesisComponent: SupervisorDead", r1_13.Eid)
    r0_13.SupervisorInfo[r1_13.Eid].IsAlive = false
    r0_13.SupervisorDeadCount = r0_13.SupervisorDeadCount + 1
    r0_13.GameMode.EMGameState.DeadSupervisorEids:Add(r1_13.Eid)
    r0_13.GameMode.EMGameState:MarkDeadSupervisorEidsAsDirtyData()
    if #r0_13.SupervisorCreatorIds <= r0_13.SupervisorDeadCount then
      DebugPrint("SynthesisComponent: 所有主管死亡")
      r0_13.GameMode:RemoveDungeonEvent("SynthesisDestruction")
      r0_13.GameMode:TriggerGameModeEvent("Event_OnAllSupervisorDead")
      r0_13.GameMode:NotifyClientShowDungeonToast("DUNGEON_SYNTHESIS_103", 2, EToastType.Success)
    end
  end
end
function r0_0.OnCombatPropDeadEvent_Destruction(r0_14, r1_14)
  -- line: [179, 196] id: 14
  if not IsValid(r1_14) then
    return 
  end
  local r2_14 = 0
  if r1_14:Cast(ABreakableItem) then
    r2_14 = r0_14.BreakableAddRage
  elseif r0_14.MechanismAddRageMap[r1_14.UnitId] then
    r2_14 = r0_14.MechanismAddRageMap[r1_14.UnitId]
  end
  if r2_14 == 0 then
    return 
  end
  DebugPrint("SynthesisComponent: CombatPropDeadAddRage", r2_14)
  r0_14:AddRageValue(r2_14)
end
function r0_0.OnStaticCreatorEvent_Destruction(r0_15, r1_15, r2_15, r3_15, r4_15)
  -- line: [198, 203] id: 15
  if r1_15 == "DestructionSupervisor" then
    r0_15.SupervisorInfo[r2_15] = {}
    r0_15.SupervisorInfo[r2_15].IsAlive = true
  end
end
function r0_0.OnMonsterGuideAdded_Destruction(r0_16, r1_16)
  -- line: [205, 229] id: 16
  if r0_16.SupervisorInfo[r1_16] == nil then
    return 
  end
  if r0_16.SupervisorInfo[r1_16].IsGuide then
    return 
  end
  r0_16.CurRageStage = r0_16.CurRageStage + 1
  r0_16:AddRageValue(math.ceil(r0_16.MaxRageValue / #r0_16.RageValueStages))
  r0_16.GameMode.EMGameState:MulticastShowDiscoverSupervisorToast(math.floor(100 / #r0_16.RageValueStages))
  r0_16:OnSupervisorGuideAdded(r1_16)
end
function r0_0.OnSupervisorGuideAdded(r0_17, r1_17)
  -- line: [231, 242] id: 17
  DebugPrint("SynthesisComponent: 主管添加指引", r1_17)
  r0_17.GameMode.EMGameState.GuideSupervisorEids:Add(r1_17)
  r0_17.GameMode.EMGameState:MarkGuideSupervisorEidsAsDirtyData()
  r0_17.GameMode:NotifyClientShowDungeonToast("DUNGEON_SYNTHESIS_102", 2, EToastType.Warning)
  r0_17.SupervisorInfo[r1_17].IsGuide = true
  r0_17.SupervisorGuideNum = r0_17.SupervisorGuideNum + 1
  if r0_17.SupervisorGuideNum == #r0_17.SupervisorCreatorIds then
    DebugPrint("SynthesisComponent: 所有主管添加指引完成")
    r0_17.GameMode:NotifyClientShowDungeonTaskNew(r0_17.IconPathSpecialEnemy, r0_17.TextTitle, "DUNGEON_SYNTHESIS_114")
  end
end
function r0_0.SetRageValue(r0_18, r1_18)
  -- line: [244, 249] id: 18
  if r0_18.MaxRageValue < r1_18 then
    r1_18 = r0_18.MaxRageValue
  end
  r0_18.GameMode.EMGameState:SetRageValue(r1_18)
end
function r0_0.GetRageValue(r0_19)
  -- line: [251, 253] id: 19
  return r0_19.GameMode.EMGameState.RageValue
end
function r0_0.AddRageValue(r0_20, r1_20)
  -- line: [255, 271] id: 20
  r0_20.GameMode.EMGameState:SetRageValue(r0_20.GameMode.EMGameState.RageValue + r1_20)
  if #r0_20.RageValueStages <= r0_20.CurRageStage then
    return 
  end
  if r0_20.RageValueStages[r0_20.CurRageStage + 1] <= r0_20.GameMode.EMGameState.RageValue then
    r0_20.CurRageStage = r0_20.CurRageStage + 1
    DebugPrint("SynthesisComponent: OnRageStage", r0_20.CurRageStage)
    if r0_20.SupervisorGuideNum < #r0_20.SupervisorCreatorIds then
      r0_20.GameMode:TriggerGameModeEvent("Event_OnRageStage", r0_20.CurRageStage)
    end
    r0_20:TryAddGuideForSupervisor()
  end
end
function r0_0.TryAddGuideForSupervisor(r0_21)
  -- line: [273, 290] id: 21
  for r5_21, r6_21 in pairs(r0_21.SupervisorCreatorIds) do
    local r8_21 = r0_21.GameMode.EMGameState:GetStaticCreatorInfo(r6_21, true, r0_21.CreatorIdToLevelName[r6_21])
    if IsValid(r8_21) and r8_21.ChildEids:Length() > 0 then
      for r12_21 = 1, r8_21.ChildEids:Length(), 1 do
        local r13_21 = r8_21.ChildEids:GetRef(r12_21)
        if r0_21.SupervisorInfo[r13_21] and not r0_21.SupervisorInfo[r13_21].IsGuide then
          r0_21:OnSupervisorGuideAdded(r13_21)
          DebugPrint("SynthesisComponent: TryAddGuideForSupervisor", r13_21)
          r0_21.GameMode.EMGameState:AddGuideEid(r13_21)
          return 
        end
      end
    end
  end
  -- close: r1_21
  DebugPrint("SynthesisComponent: TryAddGuideForSupervisor 不存在活着的主管")
end
function r0_0.InitOccupationMission(r0_22)
  -- line: [295, 302] id: 22
  r0_22.IsOccupationFinishEventTriggered = false
  r0_22:SetOccupationFinishNum(0)
  r0_22.GameMode:NotifyClientShowDungeonTaskNew(r0_22.IconPathYellow, r0_22.TextTitle, "DUNGEON_SYNTHESIS_115")
  r0_22.GameMode:AddDungeonEvent("SynthesisOccupation")
end
function r0_0.OnOccupationInit(r0_23, r1_23)
  -- line: [304, 318] id: 23
  for r6_23, r7_23 in pairs(r0_23.GameMode:GetAllPlayer()) do
    if not r0_23.OccupateGuide[r7_23.Eid] then
      r0_23.OccupateGuide[r7_23.Eid] = {
        List = {},
      }
    end
    if not r0_23.OccupateGuide[r7_23.Eid].List[r1_23] then
      r0_23.OccupateGuide[r7_23.Eid].List[r1_23] = 0
    end
    print(_G.LogTag, "LXZ Occup OnOccupationInit", r1_23, r7_23.Eid, r0_23.OccupateGuide[r7_23.Eid].CurrentOccupationEid)
    if not r0_23.OccupateGuide[r7_23.Eid].CurrentOccupationEid or r0_23.OccupateGuide[r7_23.Eid].CurrentOccupationEid == 0 then
      print(_G.LogTag, "LXZ Occup AddGuideEid", r1_23, r7_23.Eid, r0_23.OccupateGuide[r7_23.Eid].CurrentOccupationEid)
      r0_23.GameMode.EMGameState:AddGuideEid(r1_23, r7_23.Eid)
    end
  end
  -- close: r2_23
end
function r0_0.OnPlayerEnterOccupation(r0_24, r1_24, r2_24)
  -- line: [321, 339] id: 24
  if not r0_24.OccupateGuide[r1_24.Eid] then
    r0_24.OccupateGuide[r1_24.Eid] = {
      List = {},
    }
  end
  print(_G.LogTag, "LXZ Occup OnPlayerEnterOccupation", r1_24.Eid, r2_24.Eid)
  r0_24.OccupateGuide[r1_24.Eid].CurrentOccupationEid = r2_24.Eid
  for r7_24, r8_24 in pairs(r0_24.OccupateGuide[r1_24.Eid].List) do
    if r7_24 ~= r2_24.Eid then
      r8_24 = 1
      print(_G.LogTag, "LXZ Occup RemoveGuideEid", r7_24, r1_24.Eid, r0_24.OccupateGuide[r1_24.Eid].CurrentOccupationEid)
      r0_24.GameMode.EMGameState:RemoveGuideEid(r7_24, r1_24.Eid)
    else
      r8_24 = 2
      r0_24.GameMode.EMGameState:AddGuideEid(r7_24, r1_24.Eid)
    end
  end
  -- close: r3_24
end
function r0_0.OnPlayerLeaveOccupation(r0_25, r1_25, r2_25)
  -- line: [341, 354] id: 25
  if not r0_25.OccupateGuide[r1_25.Eid] then
    r0_25.OccupateGuide[r1_25.Eid] = {
      List = {},
    }
  end
  print(_G.LogTag, "LXZ Occup OnPlayerLeaveOccupation", r1_25.Eid, r2_25.Eid)
  r0_25.OccupateGuide[r1_25.Eid].CurrentOccupationEid = 0
  for r7_25, r8_25 in pairs(r0_25.OccupateGuide[r1_25.Eid].List) do
    if r8_25 ~= 2 then
      r8_25 = 2
      r0_25.GameMode.EMGameState:AddGuideEid(r7_25, r1_25.Eid)
    end
  end
  -- close: r3_25
end
function r0_0.OnOneOccupationSucceed(r0_26, r1_26)
  -- line: [356, 389] id: 26
  r0_26:SetOccupationFinishNum(r0_26:GetOccupationFinishNum() + 1)
  DebugPrint("SynthesisComponent: OnOneOccupationSucceed ", r0_26:GetOccupationFinishNum())
  GWorld:DSBLog("Info", "SynthesisComponent: OnOneOccupationSucceed Num:" .. r0_26:GetOccupationFinishNum(), "GameMode")
  r0_26.GameMode:TriggerGameModeEvent("Event_OnOneOccupationSucceed")
  for r6_26, r7_26 in pairs(r0_26.GameMode:GetAllPlayer()) do
    local r8_26 = r0_26.OccupateGuide[r7_26.Eid]
    if r8_26 and r8_26.CurrentOccupationEid == r1_26.Eid then
      r8_26.CurrentOccupationEid = 0
      for r13_26, r14_26 in pairs(r8_26.List) do
        if r13_26 ~= r1_26.Eid then
          r0_26.GameMode.EMGameState:AddGuideEid(r13_26, r7_26.Eid)
        end
      end
      -- close: r9_26
    end
    r0_26.GameMode.EMGameState:RemoveGuideEid(r1_26.Eid, r7_26.Eid)
    if r8_26 then
      r8_26[r1_26.Eid] = nil
    end
  end
  -- close: r2_26
  if r0_26.IsOccupationFinishEventTriggered then
    return 
  end
  if r0_26.OccupationTargetNum <= r0_26:GetOccupationFinishNum() then
    DebugPrint("SynthesisComponent: OnOccupationFinished")
    r0_26.IsOccupationFinishEventTriggered = true
    r0_26.GameMode:RemoveDungeonEvent("SynthesisOccupation")
    r0_26.GameMode:TriggerGameModeEvent("Event_OnOccupationFinished")
    r0_26.GameMode:NotifyClientShowDungeonToast("DUNGEON_SYNTHESIS_111", 2, EToastType.Success)
  end
end
function r0_0.SetOccupationFinishNum(r0_27, r1_27)
  -- line: [391, 393] id: 27
  r0_27.GameMode.EMGameState:SetOccupationFinishNum(r1_27)
end
function r0_0.GetOccupationFinishNum(r0_28)
  -- line: [395, 397] id: 28
  return r0_28.GameMode.EMGameState.OccupationFinishNum
end
function r0_0.InitCrackMission(r0_29)
  -- line: [402, 406] id: 29
  r0_29:SetKeySubmitNum(0)
  r0_29.GameMode:NotifyClientShowDungeonTaskNew(r0_29.IconPathYellow, r0_29.TextTitle, "DUNGEON_SYNTHESIS_116")
end
function r0_0.OnExplosionMonTimer(r0_30)
  -- line: [408, 416] id: 30
  if not r0_30.GameMode.EMGameState:CheckGameModeStateEnable() then
    DebugPrint("SynthesisComponent: ExplosionMonTimerEnd DungeonEndEnd")
    r0_30:RemoveTimer("ExplosionMonTimer")
    return 
  end
  DebugPrint("SynthesisComponent: OnExplosionMonTimer")
  r0_30.GameMode:TriggerGameModeEvent("Event_OnExplosionMonsterTimerCountdown")
end
function r0_0.OnKeyDelivered(r0_31, r1_31)
  -- line: [418, 431] id: 31
  r0_31:SetKeySubmitNum(r0_31:GetKeySubmitNum() + 1)
  DebugPrint("SynthesisComponent: OnKeyDelivered", r0_31:GetKeySubmitNum())
  r0_31.GameMode:TriggerGameModeEvent("Event_OnKeyDelivered", r0_31:GetKeySubmitNum())
  if r0_31.KeyNeedNum <= r0_31:GetKeySubmitNum() then
    DebugPrint("SynthesisComponent: CrackMissionFinish")
    r0_31.GameMode:RemoveDungeonEvent("SynthesisCrack")
    r0_31.GameMode:TriggerGameModeEvent("Event_OnCrackFinished")
    r0_31.GameMode:NotifyClientShowDungeonTaskNew("", r0_31.TextTitle, "DUNGEON_SYNTHESIS_118")
    r0_31.GameMode:NotifyClientShowDungeonToast("DUNGEON_SYNTHESIS_110", 2, EToastType.Success)
    r0_31:RemoveTimer("ExplosionMonTimer")
  end
end
function r0_0.OnDefenceCoreActive_Crack(r0_32, r1_32)
  -- line: [433, 438] id: 32
  r0_32:AddTimer(r0_32.BlastMonInterval, r0_32.OnExplosionMonTimer, true, 0, "ExplosionMonTimer")
  r0_32.GameMode:AddDungeonEvent("SynthesisCrack")
  r0_32.GameMode:NotifyClientShowDungeonTaskNew(r0_32.IconPathYellow, r0_32.TextTitle, "DUNGEON_SYNTHESIS_117")
  r0_32.GameMode.EMGameState:SetDungeonUIState(Const.EDungeonUIState.OnTarget)
end
function r0_0.SetKeySubmitNum(r0_33, r1_33)
  -- line: [440, 442] id: 33
  r0_33.GameMode.EMGameState:SetKeySubmitNum(r1_33)
end
function r0_0.GetKeySubmitNum(r0_34)
  -- line: [444, 446] id: 34
  return r0_34.GameMode.EMGameState.KeySubmitNum
end
return r0_0
