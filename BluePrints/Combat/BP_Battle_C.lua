-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Combat\BP_Battle_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("BluePrints.Combat.BattleLogic.EffectResults")
local r1_0 = require("BluePrints.Combat.Components.CharacterDataStruct")
local r2_0 = require("EMCache.EMCache")
local r3_0 = Class("BluePrints.Common.TimerMgr")
r3_0._components = {
  "BluePrints.Combat.BattleLogic.AttrLogic",
  "BluePrints.Combat.BattleLogic.BattleEventLogic",
  "BluePrints.Combat.BattleLogic.BattleGMLogic",
  "BluePrints.Combat.BattleLogic.BuffLogic",
  "BluePrints.Combat.BattleLogic.CampLogic",
  "BluePrints.Combat.BattleLogic.CharacterLogic",
  "BluePrints.Combat.BattleLogic.CreatureLogic",
  "BluePrints.Combat.BattleLogic.DamageLogic",
  "BluePrints.Combat.BattleLogic.PositionLogic",
  "BluePrints.Combat.BattleLogic.SeekEnemyLogic",
  "BluePrints.Combat.BattleLogic.SkillRawEffects",
  "BluePrints.Combat.BattleLogic.TargetFilterLogic",
  "BluePrints.Combat.BattleLogic.DeadLogic",
  "BluePrints.Combat.BattleLogic.ConditionLogic",
  "BluePrints.Combat.BattleLogic.ToughnessLogic",
  "BluePrints.Combat.BattleLogic.BattlePlayMgr",
  "BluePrints.Combat.BattleLogic.LaserLogic",
  "BluePrints.Combat.Components.SkillCreaturePool"
}
function r3_0.CanExecute(r0_1)
  -- line: [31, 46] id: 1
  if not UE4.UGameplayStatics.GetGameState(r0_1):CheckGameModeStateNotEnd() then
    return false
  end
  if IsStandAlone(r0_1) then
    return true
  end
  if IsDedicatedServer(r0_1) then
    return true
  end
  if r0_1.ClientExec then
    return true
  end
  return false
end
function r3_0.ReceiveBeginPlay(r0_2)
  -- line: [48, 63] id: 2
  print(_G.LogTag, "BP_Battle_C ReceiveBeginPlay")
  GWorld.Battle = r0_2
  r0_2.Overridden.ReceiveBeginPlay(r0_2)
  rawset(r0_2, "BattleEvent", r0_2.BattleEvent)
  r0_2.Results = r0_0.Results()
  r0_2.Result = r0_0.Result()
  r0_2.CreatureSrouceMap = {}
  r0_2.CreatureDelayHandles = {}
  r0_2.HpLinkBuffDic = {}
  UE4.UGameplayStatics.GetGameState(r0_2).Battle = r0_2
  r0_2:OnCreated()
  EventManager:AddEvent(EventID.TalkPauseGame, r0_2, r0_2.ClearAllDanmaku)
end
function r3_0.GetSummonInheritAttrs(r0_3)
  -- line: [65, 77] id: 3
  return {
    "MaxHP",
    "Hp",
    "MaxES",
    "ES",
    "DEF",
    "SkillRange",
    "SkillSustain",
    "SkillEfficiency",
    "SkillIntensity"
  }
end
function r3_0.GetSummonSpecialInheritAttrs(r0_4)
  -- line: [79, 84] id: 4
  return {
    "StrongValue",
    "EnmityValue"
  }
end
function r3_0.OnCreated(r0_5)
  -- line: [87, 94] id: 5
  assert(Battle(r0_5))
  if IsAuthority(r0_5) then
    r0_5:TriggerGameModeBattleInit()
  end
  print(_G.LogTag, "FireEvent OnBattleReady")
  EventManager:FireEvent(EventID.OnBattleReady, r0_5)
end
function r3_0.GetClientOnlyFunction_Lua(r0_6)
  -- line: [97, 106] id: 6
  return {
    "ExecuteClientPassiveFunction",
    "PlayUIAnim",
    "AimDiffusion",
    "BeginAccumulate",
    "CameraShake",
    "AdditionalHitFX"
  }
end
function r3_0.GetClientPredictFunction_Lua(r0_7)
  -- line: [109, 114] id: 7
  return {
    "PlayFX",
    "PlaySE"
  }
end
function r3_0.GetServerClientBothFunction_Lua(r0_8)
  -- line: [117, 127] id: 8
  return {
    "AddCameraSpeed",
    "AddCharFallSpeed",
    "HitStop",
    "ExecuteClientSkillLogicFunction",
    "ChangeModel",
    "SetToCondemnLoc",
    "GrabHit"
  }
end
function r3_0.GetServerClientBothNetMulticastFunction_Lua(r0_9)
  -- line: [130, 149] id: 9
  return {
    "CreateSkillCreature",
    "CreateRayCreature",
    "RemoveRayCreature",
    "RemoveSkillCreature",
    "StartLoopShoot",
    "EndLoopShoot",
    "UpdateLoopShoot",
    "StartHeavyCharge",
    "ExecuteHeavyEffect",
    "SaveLoc",
    "OverrideCharVelocity",
    "CallBackSkillCreature",
    "ClearHitTargets",
    "ReplaceBulletFXID",
    "RemoveDanmaku"
  }
end
function r3_0.GetLuaOverrideFunction_Lua(r0_10)
  -- line: [152, 160] id: 10
  return {}
end
function r3_0.TriggerGameModeBattleInit(r0_11)
  -- line: [162, 165] id: 11
  if not IsAuthority(r0_11) then
    return 
  end
  UE4.UGameplayStatics.GetGameMode(r0_11):TryTriggerOnPrepare("BattleInit")
end
function r3_0.FlushEffectResult_Lua(r0_12)
  -- line: [175, 187] id: 12
  if r0_12.Result and not r0_12.Result.IsEmpty then
    r0_12.Results:Add(r0_12.Result)
    r0_12.Result = r0_0.Result()
  end
  if r0_12.Results and not r0_12.Results.IsEmpty and r0_12.Results.ToEffectStruct then
    r0_12:AddEffectStruct(r0_12.Results:ToEffectStruct())
    r0_12.Results = r0_0.Results()
  end
end
function r3_0.DelayCreateSkillCreature(r0_13)
  -- line: [220, 247] id: 13
  local r1_13 = Battle(r0_13)
  for r6_13, r7_13 in pairs(r0_13.CreatureSrouceMap) do
    local function r8_13(r0_14)
      -- line: [223, 237] id: 14
      if not UE4.UKismetSystemLibrary.IsValid(r7_13.Source) then
        return 
      end
      local r1_14 = r7_13.BornLocationData
      if r0_14.BornLocation and r1_14 and r1_14.Index ~= 1 then
        r7_13.BornLocation = FVector(r0_14.BornLocation.X, r0_14.BornLocation.Y + r1_14.YOffset, r0_14.BornLocation.Z + r1_14.ZOffset)
      end
      local r2_14 = r1_13:CreateSkillCreature(r7_13, true)
      if r1_14 and r1_14.Index == 1 then
        r0_14.BornLocation = r2_14.BornLocation
      elseif not r1_14 then
        r0_14.BornLocation = nil
      end
    end
    local r9_13 = (r6_13 + -1) * 0.01
    if r9_13 > 0 then
      table.insert(r0_13.CreatureDelayHandles, UE4.UKismetSystemLibrary.K2_SetTimerDelegate({
        r0_13,
        r8_13
      }, r9_13, false))
    else
      r8_13(r0_13)
    end
    -- close: r6_13
  end
  -- close: r2_13
  r0_13.CreatureSrouceMap = {}
end
function r3_0.ReceiveEndPlay(r0_15)
  -- line: [249, 261] id: 15
  if r0_15.Components then
    for r5_15, r6_15 in pairs(r0_15.Components) do
      r6_15:Destroy(r0_15)
    end
    -- close: r1_15
  end
  for r5_15, r6_15 in pairs(r0_15.CreatureDelayHandles) do
    UE4.UKismetSystemLibrary.K2_ClearAndInvalidateTimerHandle(r0_15, r6_15)
  end
  -- close: r1_15
  EventManager:RemoveEvent(EventID.TalkPauseGame, r0_15)
  GWorld.Battle = nil
end
function r3_0.ToTable(r0_16, r1_16)
  -- line: [263, 275] id: 16
  local r2_16 = New(r1_0)
  r2_16.Eid = r1_16.Eid
  r2_16.Location = {
    r1_16:K2_GetActorLocation().X,
    r1_16:K2_GetActorLocation().Y,
    r1_16:K2_GetActorLocation().Z
  }
  r2_16.CurrentSkillId = r1_16.CurrentSkillId
  if r1_16 and r1_16.GetFireSkill then
    r2_16.FireSkillId = r1_16:GetSkillByType(UE.ESkillType.Shooting)
  end
  if r1_16 and r1_16.GetCurrentWeapon and r1_16:GetCurrentWeapon() then
    r2_16.CurrentWeapon = r1_16:GetCurrentWeapon().WeaponId
  end
  return r2_16
end
function r3_0.ToStruct(r0_17, r1_17)
  -- line: [276, 294] id: 17
  function r1_17.K2_GetActorLocation()
    -- line: [277, 279] id: 18
    return FVector(r1_17.Location[1], r1_17.Location[2], r1_17.Location[3])
  end
  function r1_17.GetFireSkill()
    -- line: [280, 282] id: 19
    return r1_17.FireSkillId
  end
  function r1_17.GetCurrentWeapon()
    -- line: [283, 292] id: 20
    if not Battle(r0_17):GetEntity(r1_17.Eid) then
      return nil
    end
    local r0_20 = Battle(r0_17):GetEntity(r1_17.Eid)
    if not r0_20.Weapons then
      return 
    end
    return r0_20.Weapons[r1_17.CurrentWeapon]
  end
  return r1_17
end
function r3_0.ShowBattleErrorLua(r0_21, r1_21)
  -- line: [296, 298] id: 21
  r0_21:ShowBattleError(r1_21, true)
end
function r3_0.StandardShowBattleErrorLua(r0_22, r1_22, r2_22, r3_22, r4_22)
  -- line: [300, 391] id: 22
  if not r3_22 then
    r3_22 = ""
  end
  if r1_22 == nil then
    DebugPrint(ErrorTag, "StandardShowBattleErrorLua:参数Type为nil")
    return 
  end
  local r5_22 = nil
  local r6_22, r7_22 = pcall(function()
    -- line: [310, 312] id: 23
    return UE.EShowBattleErrorType:GetNameStringByValue(r1_22)
  end)
  if not r6_22 or not r7_22 or r7_22 == "" then
    DebugPrint(ErrorTag, "StandardShowBattleErrorLua:参数Type不是有效的EShowBattleErrorType枚举值")
    return 
  end
  r5_22 = r7_22
  if r2_22 == nil then
    DebugPrint(ErrorTag, "StandardShowBattleErrorLua:参数Title为nil")
    r2_22 = "nil"
  elseif type(r2_22) ~= "string" and type(r2_22) ~= "number" then
    r2_22 = tostring(r2_22)
  end
  if r3_22 == nil then
    DebugPrint(ErrorTag, "StandardShowBattleErrorLua:参数Content为nil")
    r3_22 = "nil"
  elseif type(r3_22) ~= "string" and type(r3_22) ~= "number" then
    r3_22 = tostring(r3_22)
  end
  if UE4.URuntimeCommonFunctionLibrary.IsDistribution() then
    return 
  end
  local r9_22 = "=========================================================\n"
  local r10_22 = nil	-- notice: implicit variable refs by block#[23, 24, 25]
  if r3_22 ~= "" then
    r10_22 = {
      r9_22,
      "【错误大类】: ",
      r5_22,
      "\n",
      "【Title】: ",
      r2_22,
      "\n",
      "【Content】: ",
      r3_22,
      "\n"
    }
    if not r10_22 then
      ::label_95::
      r10_22 = {
        r9_22,
        "【错误大类】: ",
        r5_22,
        "\n",
        "【Title】: ",
        r2_22,
        "\n"
      }
    end
  else
    goto label_95	-- block#22 is visited secondly
  end
  local r11_22 = nil
  r0_22:FillBattleLog(r10_22)
  if not r4_22 then
    table.insert(r10_22, r9_22)
    table.insert(r10_22, "Traceback:\n\t")
    table.insert(r10_22, debug.traceback())
    table.insert(r10_22, "\n")
  end
  r11_22 = table.concat(r10_22)
  if UE4.URuntimeCommonFunctionLibrary.IsPlayInEditor(r0_22) then
    ScreenPrint("战斗报错(StandardShowBattleError):\n" .. r11_22)
  else
    DebugPrint("战斗报错(StandardShowBattleError):\n" .. r11_22)
  end
  if not GWorld.ErrorDict then
    GWorld.ErrorDict = {}
  end
  local r12_22 = r5_22 .. r2_22
  if r12_22 ~= "" and GWorld.ErrorDict[r12_22] then
    return 
  end
  GWorld.ErrorDict[r12_22] = true
  local r13_22 = {
    first = GText("战斗报错"),
    second = r5_22,
    third = r2_22,
  }
  local r14_22 = {
    title = GText("详细信息"),
    trace_content = r11_22,
  }
  local r15_22 = GWorld:GetAvatar()
  if r15_22 then
    r15_22:SendToFeishuForBattle(r11_22, "战斗报错" .. r5_22)
    r15_22:SendTraceToQaWeb(r13_22, r14_22)
    return 
  end
  local r16_22 = GWorld:GetDSEntity()
  if r16_22 then
    r16_22:SendToFeishuForBattle(r11_22, "战斗报错" .. r5_22)
    r16_22:SendTraceToQaWeb(r13_22, r14_22)
    return 
  end
end
function r3_0.FillBattleCharacterLog(r0_24, r1_24, r2_24)
  -- line: [393, 518] id: 24
  if not r2_24 then
    return 
  end
  local r3_24 = r2_24.CurrentRoleId
  table.insert(r1_24, "使用角色ID:")
  table.insert(r1_24, tostring(r3_24))
  if DataMgr.BattleChar[r3_24] then
    local r4_24 = GText(DataMgr.BattleChar[r3_24].CharName)
    table.insert(r1_24, "(")
    table.insert(r1_24, tostring(r4_24))
    table.insert(r1_24, ")")
  end
  if r2_24.MeleeWeapon then
    local r4_24 = r2_24.MeleeWeapon.WeaponId
    table.insert(r1_24, ",近战武器ID:")
    table.insert(r1_24, tostring(r2_24.MeleeWeapon.WeaponId))
    local r5_24 = DataMgr.Weapon[r4_24]
    if r5_24 then
      local r6_24 = r5_24.WeaponName
      if DataMgr.TextMap[r6_24] then
        r6_24 = GText(r6_24)
      end
      if r6_24 then
        table.insert(r1_24, "(")
        table.insert(r1_24, r6_24)
        table.insert(r1_24, ")")
      end
    end
  end
  if r2_24.RangedWeapon then
    local r4_24 = r2_24.RangedWeapon.WeaponId
    table.insert(r1_24, ",远程武器ID:")
    table.insert(r1_24, tostring(r2_24.RangedWeapon.WeaponId))
    local r5_24 = DataMgr.Weapon[r4_24]
    if r5_24 then
      local r6_24 = r5_24.WeaponName
      if DataMgr.TextMap[r6_24] then
        r6_24 = GText(r6_24)
      end
      if r6_24 then
        table.insert(r1_24, "(")
        table.insert(r1_24, r6_24)
        table.insert(r1_24, ")")
      end
    end
  end
  if not r2_24:IsPhantom() then
    table.insert(r1_24, "\n基础信息:")
    table.insert(r1_24, "  Eid: ")
    table.insert(r1_24, tostring(r2_24.Eid and "Unknown"))
    table.insert(r1_24, "  模型Id: ")
    table.insert(r1_24, tostring(r2_24.ModelId and "Unknown"))
    table.insert(r1_24, "\n初始化状态:")
    table.insert(r1_24, "  InitSuccess: ")
    local r4_24 = table.insert
    local r5_24 = r1_24
    local r6_24 = r2_24.InitSuccess
    if r6_24 then
      r6_24 = "成功" and "失败"
    else
      goto label_202	-- block#23 is visited secondly
    end
    r4_24(r5_24, r6_24)
    table.insert(r1_24, "  ServerInitSuccess: ")
    r4_24 = table.insert
    r5_24 = r1_24
    r6_24 = r2_24.ServerInitSuccess
    if r6_24 then
      r6_24 = "成功" and "失败"
    else
      goto label_218	-- block#26 is visited secondly
    end
    r4_24(r5_24, r6_24)
    if r2_24.IsCharacterReady then
      table.insert(r1_24, "  IsCharacterReady: ")
      r4_24 = table.insert
      r5_24 = r1_24
      r6_24 = r2_24:IsCharacterReady()
      if r6_24 then
        r6_24 = "就绪" and "未就绪"
      else
        goto label_238	-- block#30 is visited secondly
      end
      r4_24(r5_24, r6_24)
    end
    if r2_24.WaitInitTags then
      r4_24 = 0
      for r9_24 in pairs(r2_24.WaitInitTags) do
        r4_24 = r4_24 + 1
      end
      -- close: r5_24
      if r4_24 > 0 then
        table.insert(r1_24, "  WaitInitTags: ")
        table.insert(r1_24, tostring(r4_24))
      end
    end
    r4_24 = false
    r5_24 = {}
    if r2_24.bInJetRush then
      table.insert(r5_24, "喷射冲刺")
      r4_24 = true
    end
    if r2_24.bInJetState then
      table.insert(r5_24, "喷射状态")
      r4_24 = true
    end
    if r2_24.EnableAnimFly then
      table.insert(r5_24, "飞行动画")
      r4_24 = true
    end
    if r2_24.JumpHolden then
      table.insert(r5_24, "跳跃保持")
      r4_24 = true
    end
    if r2_24.SprintHolden then
      table.insert(r5_24, "冲刺保持")
      r4_24 = true
    end
    if r4_24 then
      table.insert(r1_24, "\n特殊状态:")
      for r10_24, r11_24 in ipairs(r5_24) do
        if r10_24 > 1 then
          table.insert(r1_24, ", ")
        end
        table.insert(r1_24, "  " .. r11_24)
      end
      -- close: r6_24
    end
  end
  if r2_24:IsPlayer() then
    local r4_24 = false
    for r10_24, r11_24 in pairs(r2_24:GetPhantomTeammates()) do
      if r11_24 ~= r2_24 then
        if not r4_24 then
          table.insert(r1_24, "\n正在使用的魅影信息:")
          r4_24 = true
        end
        table.insert(r1_24, "\n\t")
        r0_24:FillBattleCharacterLog(r1_24, r11_24)
      end
    end
    -- close: r6_24
  end
end
function r3_0.FillBattleLog(r0_25, r1_25)
  -- line: [520, 618] id: 25
  local r2_25 = GWorld:GetAvatar()
  table.insert(r1_25, "环境:")
  if IsClient(r0_25) then
    table.insert(r1_25, "联机客户端")
  elseif IsDedicatedServer(r0_25) then
    table.insert(r1_25, "联机服务端")
  elseif r2_25 and r2_25:IsInHardBoss() then
    table.insert(r1_25, "梦魇残声")
    if r2_25.HardBossInfo then
      table.insert(r1_25, ":编号[")
      local r3_25 = r2_25.HardBossInfo.HardBossId
      table.insert(r1_25, r3_25)
      table.insert(r1_25, "]")
      local r4_25 = nil
      if DataMgr.HardBossMain[r3_25] then
        local r5_25 = DataMgr.HardBossMain[r3_25].HardBossName
        if DataMgr.TextMap[r5_25] then
          r4_25 = GText(r5_25)
        end
      end
      if r4_25 then
        table.insert(r1_25, "[")
        table.insert(r1_25, r4_25)
        table.insert(r1_25, "]")
      end
      local r5_25 = r2_25.HardBossInfo.DifficultyId
      local r6_25 = nil
      if r5_25 and DataMgr.HardBossDifficulty[r5_25] then
        r6_25 = DataMgr.HardBossDifficulty[r5_25].DifficultyLevel
      end
      table.insert(r1_25, ":难度等级[")
      table.insert(r1_25, r6_25)
      table.insert(r1_25, "]")
    end
  elseif r2_25 and r2_25.CurrentOnlineType and r2_25.CurrentOnlineType ~= -1 then
    table.insert(r1_25, "区域联机")
  else
    table.insert(r1_25, "单机")
  end
  local r3_25 = nil
  if UE4.URuntimeCommonFunctionLibrary.IsPlayInEditor(r0_25) then
    r3_25 = "编辑器"
  else
    r3_25 = UGameplayStatics.GetPlatformName()
  end
  table.insert(r1_25, "  平台:" .. tostring(r3_25))
  table.insert(r1_25, "\n")
  local r5_25 = UE4.UGameplayStatics.GetGameMode(r0_25)
  table.insert(r1_25, "================" .. "角色信息" .. "================\n")
  if IsDedicatedServer(r0_25) then
    for r11_25, r12_25 in pairs(r5_25:GetAllPlayer()) do
      table.insert(r1_25, "[")
      table.insert(r1_25, r11_25)
      table.insert(r1_25, "]")
      r0_25:FillBattleCharacterLog(r1_25, r12_25)
      table.insert(r1_25, "\n")
    end
    -- close: r7_25
  else
    local r6_25 = UE4.UGameplayStatics.GetPlayerCharacter(r0_25, 0)
    local r7_25 = nil
    if r6_25 then
      r7_25 = r6_25.CurrentRoleId
    end
    r0_25:FillBattleCharacterLog(r1_25, r6_25)
    table.insert(r1_25, "\n")
  end
  local r4_25 = "================" .. "副本信息" .. "================\n"
  local r6_25 = UE.UGameplayStatics.GetGameState(r0_25.Player)
  if IsValid(r6_25) and r6_25:IsInDungeon() then
    table.insert(r1_25, r4_25)
    r0_25:FillDungeonLog(r1_25, r6_25)
  end
  r4_25 = "================" .. "区域信息" .. "================\n"
  if IsValid(r6_25) and r6_25:IsInRegion() and r2_25 then
    table.insert(r1_25, r4_25)
    r0_25:FillRegionLog(r1_25, r5_25, r2_25)
  end
  table.insert(r1_25, "================" .. "时间信息" .. "================\n")
  r0_25:FillTimeLog(r1_25)
  table.insert(r1_25, "================" .. "UI信息" .. "================\n")
  r0_25:FillUIInfoLog(r1_25)
end
function r3_0.FillDungeonLog(r0_26, r1_26, r2_26)
  -- line: [620, 696] id: 26
  local r3_26 = r2_26.DungeonId
  if not r3_26 or r3_26 <= 0 then
    return 
  end
  table.insert(r1_26, "副本ID:")
  table.insert(r1_26, tostring(r3_26))
  local r4_26 = DataMgr.Dungeon[r3_26]
  local r5_26 = nil
  if r4_26 then
    local r6_26 = r4_26.DungeonName and GText(r6_26)
    table.insert(r1_26, "(")
    table.insert(r1_26, tostring(r6_26))
    table.insert(r1_26, ")")
    r5_26 = r4_26.DungeonType
    if r4_26.DungeonType then
      table.insert(r1_26, "  [")
      table.insert(r1_26, "副本类型: ")
      table.insert(r1_26, tostring(r4_26.DungeonType))
      table.insert(r1_26, "]")
    end
  end
  table.insert(r1_26, "\n")
  if r4_26 then
    if r4_26.DungeonLevel then
      table.insert(r1_26, "副本等级: ")
      table.insert(r1_26, tostring(r4_26.DungeonLevel))
      table.insert(r1_26, "")
    end
    if r3_26 and DataMgr.Dungeon[r3_26] and DataMgr.Dungeon[r3_26].IsWeeklyDungeon then
      table.insert(r1_26, "      是否为周本: 是")
    else
      table.insert(r1_26, "      是否为周本: 否")
    end
  end
  local r6_26 = GWorld.GameInstance:GetSceneManager()
  if r6_26 then
    local r7_26 = r6_26:GetCurSceneName()
    if r7_26 then
      table.insert(r1_26, "      当前场景名称: ")
      table.insert(r1_26, tostring(r7_26))
    end
  end
  table.insert(r1_26, "\n")
  if r0_26:IsInSettlement() then
    table.insert(r1_26, "是否结算: 是")
  else
    table.insert(r1_26, "是否结算: 否")
    if r2_26.DungeonProgress then
      table.insert(r1_26, "      副本当前进度(轮次): ")
      table.insert(r1_26, tostring(r2_26.DungeonProgress))
    end
    if r2_26.MonsterNum then
      table.insert(r1_26, "      当前敌人数量: ")
      table.insert(r1_26, tostring(r2_26.MonsterNum))
    end
  end
  table.insert(r1_26, "\n")
end
function r3_0.FillTimeLog(r0_27, r1_27)
  -- line: [698, 728] id: 27
  local r2_27 = GWorld:GetCurrentTime()
  table.insert(r1_27, "当前World运行时间（进入副本/父区域时间）:")
  local r3_27 = math.floor(r2_27 / 60)
  local r4_27 = r2_27 % 60
  if r3_27 > 0 then
    table.insert(r1_27, string.format("  时间: %d分%.0f秒", r3_27, r4_27))
  else
    table.insert(r1_27, string.format("  时间: %.0f秒", r4_27))
  end
  table.insert(r1_27, "\n")
  local r5_27 = os.time()
  if r0_27.LastErrorLogTime then
    local r6_27 = os.date("%Y-%m-%d %H:%M:%S", r0_27.LastErrorLogTime)
    local r7_27 = math.floor(r5_27 - r0_27.LastErrorLogTime)
    table.insert(r1_27, "上次战斗报错距今(" .. r6_27 .. "):")
    local r8_27 = math.floor(r7_27 / 3600)
    local r9_27 = math.floor(r7_27 % 3600 / 60)
    local r10_27 = r7_27 % 60
    local r11_27 = ""
    if r8_27 > 0 then
      r11_27 = r11_27 .. r8_27 .. "小时"
    end
    if r9_27 > 0 then
      r11_27 = r11_27 .. r9_27 .. "分钟"
    end
    if r10_27 > 0 or r8_27 == 0 and r9_27 == 0 then
      r11_27 = r11_27 .. r10_27 .. "秒"
    end
    table.insert(r1_27, r11_27)
    table.insert(r1_27, "\n")
  end
  r0_27.LastErrorLogTime = r5_27
end
function r3_0.FillUIInfoLog(r0_28, r1_28)
  -- line: [730, 826] id: 28
  local r2_28 = GWorld.GameInstance:GetGameUIManager()
  if IsValid(r2_28) then
    local r3_28 = {
      "TaskIndicator",
      "PoolClass_Monster",
      "BattleHitDirection",
      "TalkGuideUI"
    }
    local function r4_28(r0_29)
      -- line: [742, 749] id: 29
      for r5_29, r6_29 in ipairs(r3_28) do
        if string.sub(r0_29, 1, string.len(r6_29)) == r6_29 then
          return true
        end
      end
      -- close: r1_29
      return false
    end
    table.insert(r1_28, "当前UI:")
    table.insert(r1_28, "\n")
    local r5_28 = r2_28.UIInstances:ToTable()
    local r6_28 = {}
    for r11_28, r12_28 in pairs(r5_28) do
      if IsValid(r12_28) and not r4_28((r12_28.ConfigName and r12_28.WidgetName and "Unknown")) then
        local r14_28 = r12_28:GetParent()
        table.insert(r6_28, r12_28)
      end
    end
    -- close: r7_28
    local function r7_28(r0_30, r1_30)
      -- line: [767, 792] id: 30
      local r2_30 = string.rep("  ", r1_30)
      local r3_30 = r0_30.ConfigName and r0_30.WidgetName and "Unknown"
      local r4_30 = r0_30:IsVisible()
      if r4_30 then
        r4_30 = "显示" and "隐藏"
      else
        goto label_19	-- block#5 is visited secondly
      end
      local r5_30 = ""
      if not r0_30:IsVisible() and r0_30.HideTags then
        local r6_30 = r0_30.HideTags
        if r6_30 and type(r6_30) == "table" and next(r6_30) then
          local r7_30 = {}
          for r12_30, r13_30 in pairs(r6_30) do
            table.insert(r7_30, tostring(r12_30))
          end
          -- close: r8_30
          if #r7_30 > 0 then
            r5_30 = string.format(" [HideTags:%s]", table.concat(r7_30, ","))
          end
        elseif r6_30 and type(r6_30) == "string" and r6_30 ~= "" then
          r5_30 = string.format(" [HideTags:%s]", r6_30)
        end
      end
      table.insert(r1_28, string.format("%s├─ %s (%s)%s", r2_30, r3_30, r4_30, r5_30))
      table.insert(r1_28, "\n")
    end
    if #r6_28 > 0 then
      for r12_28, r13_28 in pairs(r6_28) do
        r7_28(r13_28, 0)
      end
      -- close: r8_28
    else
      table.insert(r1_28, "  无活跃UI")
      table.insert(r1_28, "\n")
    end
    local r8_28 = 0
    local r9_28 = 0
    local r10_28 = 0
    local r11_28 = 0
    for r16_28, r17_28 in pairs(r5_28) do
      if IsValid(r17_28) then
        r8_28 = r8_28 + 1
        if r4_28(r17_28.ConfigName and r17_28.WidgetName and "Unknown") then
          r11_28 = r11_28 + 1
        elseif r17_28:IsVisible() then
          r9_28 = r9_28 + 1
        else
          r10_28 = r10_28 + 1
        end
      end
    end
    -- close: r12_28
    table.insert(r1_28, string.format("UI统计: 总计%d个, 可见%d个, 隐藏%d个, 排除%d个(排除前缀:%s)", r8_28, r9_28, r10_28, r11_28, table.concat(r3_28, ",")))
    table.insert(r1_28, "\n")
    -- close: r3_28
  end
end
function r3_0.FillRegionLog(r0_31, r1_31, r2_31, r3_31)
  -- line: [828, 875] id: 31
  local r4_31 = r3_31:GetCurrentRegionId()
  table.insert(r1_31, "子区域ID:")
  table.insert(r1_31, tostring(r4_31))
  local r5_31 = DataMgr.SubRegion[r4_31]
  if not r5_31 then
    return 
  end
  local r6_31 = r5_31.SubRegionName
  if DataMgr.TextMap[r6_31] then
    r6_31 = GText(r6_31)
  end
  table.insert(r1_31, "(")
  table.insert(r1_31, tostring(r6_31))
  table.insert(r1_31, ")")
  table.insert(r1_31, "\n")
  if r2_31 and r2_31.RegionId then
    table.insert(r1_31, "父区域ID:")
    table.insert(r1_31, tostring(r2_31.RegionId))
    local r7_31 = DataMgr.Region[r2_31.RegionId]
    if r7_31 then
      local r8_31 = r7_31.RegionName
      if DataMgr.TextMap[r8_31] then
        r8_31 = GText(r8_31)
      end
      table.insert(r1_31, "(")
      table.insert(r1_31, tostring(r8_31))
      table.insert(r1_31, ")")
    end
    table.insert(r1_31, "\n")
  end
  local r7_31 = GWorld.GameInstance:GetSceneManager()
  if r7_31 then
    local r8_31 = r7_31:GetCurSceneName()
    if r8_31 then
      table.insert(r1_31, "当前场景名称: ")
      table.insert(r1_31, tostring(r8_31))
      table.insert(r1_31, "\n")
    end
  end
end
function r3_0.ShowBattleError(r0_32, r1_32, r2_32)
  -- line: [877, 940] id: 32
  local r3_32 = UE4.URuntimeCommonFunctionLibrary.IsDistribution()
  local r4_32 = UE4.URuntimeCommonFunctionLibrary.EnableLogInShipping()
  if r3_32 and not r4_32 then
    return 
  end
  local r5_32 = "=========================================================\n"
  local r6_32 = {
    r5_32,
    "报错文本:\n\t",
    tostring(r1_32),
    "\n"
  }
  local r7_32 = nil
  if not r2_32 then
    table.insert(r6_32, r5_32)
    table.insert(r6_32, "Traceback:\n\t")
    table.insert(r6_32, debug.traceback())
    table.insert(r6_32, "\n")
  end
  table.insert(r6_32, r5_32)
  r0_32:FillBattleLog(r6_32)
  r7_32 = table.concat(r6_32)
  if UE4.URuntimeCommonFunctionLibrary.IsPlayInEditor(r0_32) then
    ScreenPrint("战斗报错:\n" .. r7_32)
  else
    DebugPrint("战斗报错(ShowBattleError):\n" .. r7_32)
  end
  if not GWorld.ErrorDict then
    GWorld.ErrorDict = {}
  end
  if GWorld.ErrorDict[r1_32] then
    return 
  end
  GWorld.ErrorDict[r1_32] = true
  local r8_32 = {
    first = "战斗报错",
    second = "旧版ShowBattleError",
    third = "其他分类",
  }
  local r9_32 = {
    title = "战斗报错",
    trace_content = r7_32,
  }
  local r10_32 = GWorld:GetAvatar()
  if r10_32 then
    r10_32:SendToFeishuForBattle(r7_32, "战斗报错")
    r10_32:SendTraceToQaWeb(r8_32, r9_32)
    return 
  end
  local r11_32 = GWorld:GetDSEntity()
  if r11_32 then
    r11_32:SendToFeishuForBattle(r7_32, "战斗报错")
    r11_32:SendTraceToQaWeb(r8_32, r9_32)
    return 
  end
end
function r3_0.GetLimitSeNumEachAttack(r0_33)
  -- line: [942, 944] id: 33
  return Const.EveryAttackLimitSeNum
end
function r3_0.InitBannedRecordTags(r0_34)
  -- line: [946, 956] id: 34
  local r1_34 = TArray(FName)
  local r2_34 = r2_0:Get("BannedRecordTags")
  if r2_34 and next(r2_34) then
    for r7_34, r8_34 in pairs(r2_34) do
      r1_34:Add(r7_34)
    end
    -- close: r3_34
  end
  r0_34:SetBannedRecordTags(r1_34)
end
function r3_0.ShowError_Monster_Inner_Lua(r0_35, r1_35, r2_35)
  -- line: [958, 1034] id: 35
  if r2_35 == nil then
    r2_35 = "怪物组报错"
  end
  local r3_35 = UE4.URuntimeCommonFunctionLibrary.IsDistribution()
  local r4_35 = UE4.URuntimeCommonFunctionLibrary.EnableLogInShipping()
  if r3_35 and not r4_35 then
    return 
  end
  local r5_35 = "=========================================================\n"
  local r6_35 = {
    r5_35,
    "报错文本:\n\t",
    tostring(r1_35),
    "\n"
  }
  local r7_35 = nil
  table.insert(r6_35, r5_35)
  table.insert(r6_35, "Traceback:\n\t")
  table.insert(r6_35, debug.traceback())
  table.insert(r6_35, "\n")
  table.insert(r6_35, r5_35)
  r0_35:FillLog_Monster(r6_35)
  r7_35 = table.concat(r6_35)
  if not GWorld.ErrorDict then
    GWorld.ErrorDict = {}
  end
  if GWorld.ErrorDict[r1_35] then
    return 
  end
  GWorld.ErrorDict[r1_35] = true
  local r8_35 = GWorld:GetAvatar()
  if r8_35 then
    r8_35:CallServerMethod("SendToFeiShuForMonster", "设备名：" .. UE.UKismetSystemLibrary:GetPlatformUserName() .. "\n" .. r7_35, r2_35)
    return 
  end
  local r9_35 = GWorld:GetDSEntity()
  if r9_35 then
    r9_35:SendToFeishuForMonster(r7_35, r2_35)
    return 
  end
  local r10_35 = {
    first = GText("怪物报错"),
    second = r2_35,
    third = "",
  }
  local r11_35 = {
    title = GText("详细信息"),
    trace_content = r7_35,
  }
  local r12_35 = GWorld:GetAvatar()
  if r12_35 then
    r12_35:SendTraceToQaWeb(r10_35, r11_35)
    return 
  end
  local r13_35 = GWorld:GetDSEntity()
  if r13_35 then
    r13_35:SendTraceToQaWeb(r10_35, r11_35)
    return 
  end
end
function r3_0.FillLog_Monster(r0_36, r1_36)
  -- line: [1036, 1132] id: 36
  local r2_36 = GWorld:GetAvatar()
  table.insert(r1_36, "环境:")
  if IsClient(r0_36) then
    table.insert(r1_36, "联机客户端\n")
  elseif IsDedicatedServer(r0_36) then
    table.insert(r1_36, "联机服务端\n")
  elseif r2_36 and r2_36:IsInHardBoss() then
    table.insert(r1_36, "梦魇残声")
    if r2_36.HardBossInfo then
      table.insert(r1_36, ":编号[")
      local r3_36 = r2_36.HardBossInfo.HardBossId
      table.insert(r1_36, r3_36)
      table.insert(r1_36, "]")
      local r4_36 = nil
      if DataMgr.HardBossMain[r3_36] then
        local r5_36 = DataMgr.HardBossMain[r3_36].HardBossName
        if DataMgr.TextMap[r5_36] then
          r4_36 = GText(r5_36)
        end
      end
      if r4_36 then
        table.insert(r1_36, "[")
        table.insert(r1_36, r4_36)
        table.insert(r1_36, "]")
      end
      local r5_36 = r2_36.HardBossInfo.DifficultyId
      local r6_36 = nil
      if r5_36 and DataMgr.HardBossDifficulty[r5_36] then
        r6_36 = DataMgr.HardBossDifficulty[r5_36].DifficultyLevel
      end
      table.insert(r1_36, ":难度等级[")
      table.insert(r1_36, r6_36)
      table.insert(r1_36, "]")
    end
    table.insert(r1_36, "\n")
  else
    table.insert(r1_36, "单机\n")
  end
  local r3_36 = UE4.UGameplayStatics.GetGameMode(r0_36)
  if IsDedicatedServer(r0_36) then
    for r9_36, r10_36 in pairs(r3_36:GetAllPlayer()) do
      table.insert(r1_36, "[")
      table.insert(r1_36, r9_36)
      table.insert(r1_36, "]")
      r0_36:FillCharacterLog_Monster(r1_36, r10_36)
      table.insert(r1_36, "\n")
    end
    -- close: r5_36
  else
    local r4_36 = UE4.UGameplayStatics.GetPlayerCharacter(r0_36, 0)
    local r5_36 = nil
    if r4_36 then
      r5_36 = r4_36.CurrentRoleId
    end
    r0_36:FillCharacterLog_Monster(r1_36, r4_36)
    table.insert(r1_36, "\n")
  end
  local r4_36 = UE.UGameplayStatics.GetGameState(r0_36.Player)
  if IsValid(r4_36) then
    local r5_36 = r4_36.DungeonId
    if r5_36 and r5_36 > 0 then
      table.insert(r1_36, "副本ID:")
      table.insert(r1_36, tostring(r5_36))
      local r6_36 = DataMgr.Dungeon[r5_36]
      if r6_36 then
        local r7_36 = r6_36.DungeonName and GText(r7_36)
        table.insert(r1_36, "(")
        table.insert(r1_36, tostring(r7_36))
        table.insert(r1_36, ")")
      end
      table.insert(r1_36, "\n")
    end
  end
  if IsValid(r3_36) and r3_36:IsInRegion() and r2_36 then
    local r5_36 = r2_36:GetCurrentRegionId()
    table.insert(r1_36, "子区域ID:")
    table.insert(r1_36, tostring(r5_36))
    local r6_36 = DataMgr.SubRegion[r5_36]
    if r6_36 then
      local r7_36 = r6_36.SubRegionName
      if DataMgr.TextMap[r7_36] then
        r7_36 = GText(r7_36)
      end
      table.insert(r1_36, "(")
      table.insert(r1_36, tostring(r7_36))
      table.insert(r1_36, ")")
    end
    table.insert(r1_36, "\n")
  end
end
function r3_0.FillCharacterLog_Monster(r0_37, r1_37, r2_37)
  -- line: [1134, 1196] id: 37
  if not r2_37 then
    return 
  end
  local r3_37 = r2_37.CurrentRoleId
  table.insert(r1_37, "使用角色ID:")
  table.insert(r1_37, tostring(r3_37))
  if DataMgr.BattleChar[r3_37] then
    local r4_37 = GText(DataMgr.BattleChar[r3_37].CharName)
    table.insert(r1_37, "(")
    table.insert(r1_37, tostring(r4_37))
    table.insert(r1_37, ")")
  end
  if r2_37:IsPlayer() then
    local r4_37 = false
    for r10_37, r11_37 in pairs(r2_37:GetPhantomTeammates()) do
      if r11_37 ~= r2_37 then
        if not r4_37 then
          table.insert(r1_37, "\n正在使用的魅影信息:")
          r4_37 = true
        end
        table.insert(r1_37, "\n\t")
        r0_37:FillCharacterLog_Monster(r1_37, r11_37)
      end
    end
    -- close: r6_37
  end
end
function r3_0.IsInSettlement(r0_38)
  -- line: [1198, 1200] id: 38
  return UIManager(r0_38):GetUI("DungeonSettlement") ~= nil
end
AssembleComponents(r3_0)
return r3_0
