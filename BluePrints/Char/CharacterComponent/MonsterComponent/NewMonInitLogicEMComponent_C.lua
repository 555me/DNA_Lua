-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Char\CharacterComponent\MonsterComponent\NewMonInitLogicEMComponent_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("BluePrints.Combat.BattleLogic.EffectResults")
local r1_0 = Class({
  "BluePrints.Common.TimerMgr"
})
function r1_0.NewMonInitComponent_GetDataInfo(r0_1, r1_1)
  -- line: [11, 18] id: 1
  r1_1.BattleCharInfo = nil
  local r2_1 = r1_1.CurrentRoleId
  if not r2_1 or r2_1 == 0 then
    return 
  end
  r1_1.BattleCharInfo = DataMgr.BattleMonster[r2_1]
end
function r1_0.NewMonInitComponent_TriggerSTLPostStaticCreatorEvent(r0_2, r1_2, r2_2)
  -- line: [29, 31] id: 2
  r1_2:TriggerSTLEvent("STLPostStaticCreatorEvent", r2_2)
end
function r1_0.NewMonInitComponent_GetData(r0_3, r1_3, r2_3, r3_3)
  -- line: [33, 35] id: 3
  r1_3.Data = DataMgr[r2_3][r3_3]
end
function r1_0.NewMonInitComponent_HardBossBTRunning(r0_4, r1_4)
  -- line: [37, 39] id: 4
  return r1_4.BossBattleInfo.HardBossBTRunning
end
function r1_0.NewMonInitComponent_SyncServerBornInfo(r0_5, r1_5)
  -- line: [41, 43] id: 5
  r1_5.ServerBornInfo = r1_5.BornInfo:ToEffectStruct()
end
function r1_0.NewMonInitComponent_CallBPReceiveBeginPlay(r0_6, r1_6)
  -- line: [45, 84] id: 6
  r1_6.Overridden.ReceiveBeginPlay(r1_6)
  if not IsAuthority(r1_6) and r1_6.bIsFromCache then
    for r6_6, r7_6 in pairs(r1_6.Weapons) do
      if r7_6 ~= r1_6.UsingWeapon and not r7_6.bChildWeapon then
        r7_6:ShouldHideWeapon(true)
      end
    end
    -- close: r2_6
  end
  r1_6.bEnableAnimSequenceCacheOpt = true
  if r1_6.TryStartOutAirWallCheck and IsAuthority(r1_6) then
    r1_6:TryStartOutAirWallCheck()
  end
  if r1_6.TryStartServerBasedMovementTimer and IsClient(r1_6) and CommonUtils.GetDeviceTypeByPlatformName(r0_6) == CommonConst.CLIENT_DEVICE_TYPE.PC then
    r1_6:TryStartServerBasedMovementTimer()
  end
  if r1_6.TryCheckBornPosTimer and IsAuthority(r1_6) and Const.EnableRougeLikeBornCheck then
    r1_6:TryCheckBornPosTimer()
  end
  local r2_6 = DataMgr.Monster[r1_6.UnitId]
  if r2_6 == nil then
    return 
  end
  if IsAuthority(r1_6) then
    return 
  end
  local r3_6 = r1_6:GetActorScale3D()
  local r4_6 = r3_6:SizeSquared()
  if r2_6.CapsuleScale and 1.1 < r2_6.CapsuleScale and math.abs(r4_6 - 7.32421875) < 0.0001 or math.abs(r4_6 + -48) < 0.0001 then
    r1_6:SetActorScale3D(r3_6 / r2_6.CapsuleScale)
  end
end
function r1_0.NewMonInitComponent_TriggerDungeonComponentFun(r0_7, r1_7, r2_7)
  -- line: [86, 88] id: 7
  return r1_7:TriggerDungeonComponentFun(r2_7)
end
function r1_0.NewMonInitComponent_AddGMBuff(r0_8, r1_8, r2_8, r3_8)
  -- line: [91, 95] id: 8
  for r8_8, r9_8 in pairs(r2_8.GMMonsterBuff) do
    Battle(r1_8):AddBuffToTarget(r1_8, r1_8, r9_8, -1, r3_8, nil)
  end
  -- close: r4_8
end
function r1_0.NewMonInitComponent_CacheBornInfo(r0_9, r1_9)
  -- line: [99, 103] id: 9
  if not r1_9.BornInfo then
    r1_9.BornInfo = r0_0.Result()
  end
end
function r1_0.NewMonInitComponent_GetAirWallStaticId(r0_10, r1_10)
  -- line: [105, 108] id: 10
  return UE4.UGameplayStatics.GetGameMode(r1_10).BossBattleInfo.AirWallStaticId
end
function r1_0.NewMonInitComponent_AddRoleSkillByContext(r0_11, r1_11, r2_11)
  -- line: [110, 125] id: 11
  local r3_11 = r2_11:GetLuaTable("SkillInfos")
  local r4_11 = TArray(FSkillInitInfo)
  if r3_11 and next(r3_11) then
    for r9_11, r10_11 in ipairs(r3_11) do
      local r11_11 = FSkillInitInfo()
      r11_11.SkillId = r10_11.SkillId
      r11_11.SkillLevel = r10_11.SkillInfo.Level and 1
      r11_11.SkillGrade = r10_11.SkillInfo.Grade and 0
      r4_11:Add(r11_11)
    end
    -- close: r5_11
  end
  r1_11:AddRoleSkill(r1_11.CurrentRoleId, r4_11)
end
function r1_0.NewMonInitComponent_TryPlayBirthMontage_Lua(r0_12, r1_12, r2_12)
  -- line: [128, 135] id: 12
  local r3_12 = r1_12:PlayMontageByPath(r2_12)
  r1_12:AddDelayFrameFunc(function()
    -- line: [130, 133] id: 13
    r1_12:SetMeshVisibilityBasedAnimTickOption(EVisibilityBasedAnimTickOption.AlwaysTickPose)
    r1_12:SetActorHideTag("Birth", false)
  end, 5)
  return r3_12
end
function r1_0.NewMonInitComponent_InitBossBillBoard(r0_14, r1_14, r2_14, r3_14)
  -- line: [137, 159] id: 14
  local r5_14 = UE4.UGameplayStatics.GetGameInstance(r1_14):GetGameUIManager()
  if r3_14 == EBossUIType.None then
    if r5_14:GetUIObj("BossBlood") then
      r5_14:UnLoadUI("BossBlood")
    end
    r1_14.BossBloodUI = r5_14:LoadUINew("BossBlood", r1_14, r2_14, r3_14)
  else
    local r6_14 = r5_14:GetUIObj("DoubleBossBlood") and r5_14:LoadUINew("DoubleBossBlood")
    if r6_14 then
      if r3_14 == EBossUIType.Left then
        r1_14.BossBloodUI = r6_14.Boss_1
      else
        r1_14.BossBloodUI = r6_14.Boss_2
      end
      r6_14:ActiveBossUI()
      r1_14.BossBloodUI:InitBossUI(r1_14, r2_14, r3_14)
    end
  end
  r1_14.BillboardComponent.IsInit = true
  r1_14.BillboardComponent.Owner = r1_14
end
function r1_0.NewMonInitComponent_OnCharacterReady_SpecialTakeRecord(r0_15, r1_15)
  -- line: [162, 167] id: 15
  r1_15:AddInteractiveTrigger()
  r1_15:SetInteractiveTriggerDistance(r1_15:GetAttr("DropDistance"))
  r1_15:GetController():ForbidWeapon()
end
function r1_0.NewMonInitComponent_EnterPoolSetDataInfo(r0_16, r1_16)
  -- line: [172, 180] id: 16
  r1_16.Data = DataMgr.Monster[r1_16.UnitId]
  r1_16.BattleCharInfo = nil
  local r2_16 = r1_16.CurrentRoleId
  if not r2_16 or r2_16 == 0 then
    return 
  end
  r1_16.BattleCharInfo = DataMgr.BattleMonster[r2_16]
end
return r1_0
