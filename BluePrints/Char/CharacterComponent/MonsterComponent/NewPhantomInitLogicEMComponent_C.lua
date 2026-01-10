-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Char\CharacterComponent\MonsterComponent\NewPhantomInitLogicEMComponent_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("BluePrints.Combat.BattleLogic.EffectResults")
local r1_0 = Class({
  "BluePrints.Common.TimerMgr"
})
function r1_0.NewPhantomInitComponent_OnCharacterReady_AuthorityInit(r0_1, r1_1, r2_1)
  -- line: [9, 25] id: 1
  local r3_1 = r2_1.IntParams:Find("RoleId") and -1
  local r4_1 = r2_1.IntParams:Find("PlayerHp")
  local r5_1 = r2_1.IntParams:Find("PlayerSp")
  local r6_1 = r2_1:GetLuaTable("DeathInfo")
  local r7_1 = r2_1:GetLuaTable("ModPassives")
  local r8_1 = r2_1:GetLuaTable("MeleeWeapon")
  local r9_1 = r2_1:GetLuaTable("RangedWeapon")
  local r10_1 = r2_1:GetLuaTable("UltraWeapons")
  local r11_1 = r2_1:GetLuaTable("ReplaceAttrs")
  r1_1:SetDeathInfo(r6_1)
  r1_1:ServerSetRoleMod(r3_1, r7_1, false)
  r1_1:ServerSetUpWeapons(r8_1, r9_1, r10_1)
  r1_1:InitAllWeaponModifier(r11_1)
  r1_1:InitAvatarBuffs()
end
function r1_0.NewPhantomInitComponent_CallBlueprintCharacterReadyAndBeginPlay(r0_2, r1_2)
  -- line: [27, 54] id: 2
  r1_2.Overridden.OnCharacterReady(r1_2)
  r1_2.Overridden.ReceiveBeginPlay(r1_2)
  if UE4.UUIFunctionLibrary.GetDevicePlatformName(r1_2) == "IOS" and IsStandAlone(r1_2) then
    local r3_2 = UE4.USubsystemBlueprintLibrary.GetWorldSubsystem(r1_2, UE4.UWorldCompositionSubSystem)
    if r3_2 and r3_2:WCIsInDungeon() then
      local r4_2 = r1_2:K2_GetActorLocation()
      local r5_2 = r1_2.CapsuleComponent and r1_2.CapsuleComponent:GetScaledCapsuleHalfHeight()
      local r8_2 = UNavigationFunctionLibrary.BornLocationPhysicsFix(r1_2, r4_2, UE4.UGameplayStatics.GetPlayerCharacter(r1_2, 0):K2_GetActorLocation())
      local r9_2 = FHitResult()
      local r10_2 = FVector(r8_2.X, r8_2.Y, r8_2.Z + r5_2)
      local r11_2 = FVector(r8_2.X, r8_2.Y, r8_2.Z - r5_2)
      DebugPrint("Test Log TeleportLoc", r8_2, "BornLoc", r4_2, "Start", r10_2, "End", r11_2)
      if UE4.UKismetSystemLibrary.LineTraceSingle(r1_2, r10_2, r11_2, ETraceTypeQuery.TraceScene, false, nil, 0, r9_2, true) then
        local r12_2 = r9_2.ImpactPoint
        DebugPrint("Test Log Phantom", r1_2:GetName(), "TeleportLoc", r8_2, "hit Something, ImpactPoint", r12_2)
        r12_2.Z = r12_2.Z + r5_2 + 15
        DebugPrint("Test Log NewLoc", r12_2)
        r1_2:AddDelayFrameFunc(function()
          -- line: [48, 50] id: 3
          r1_2:K2_SetActorLocation(r12_2)
        end, 1)
        -- close: r12_2
      end
    end
  end
end
function r1_0.NewPhantomInitComponent_GetDataInfo(r0_4, r1_4)
  -- line: [56, 63] id: 4
  r1_4.BattleCharInfo = nil
  local r2_4 = r1_4.CurrentRoleId
  if not r2_4 or r2_4 == 0 then
    return 
  end
  r1_4.BattleCharInfo = DataMgr.BattleChar[r2_4]
end
function r1_0.NewPhantomInitComponent_SetPhantomInfo(r0_5, r1_5, r2_5, r3_5)
  -- line: [65, 72] id: 5
  if r2_5 then
    r1_5:SetAttr("Hp", math.min(r2_5, r1_5:GetAttr("MaxHp")))
  end
  if r3_5 then
    r1_5:SetAttr("Sp", math.min(r3_5, r1_5:GetAttr("MaxSp")))
  end
end
function r1_0.NewPhantomInitComponent_TryPlayLevelEnterMontage_Lua(r0_6, r1_6, r2_6)
  -- line: [74, 80] id: 6
  local r3_6 = r1_6:PlayMontageByPath(r2_6)
  r1_6:AddDelayFrameFunc(function()
    -- line: [76, 78] id: 7
    r1_6:SetMeshVisibilityBasedAnimTickOption(EVisibilityBasedAnimTickOption.AlwaysTickPose)
  end, 5)
  return r3_6
end
return r1_0
