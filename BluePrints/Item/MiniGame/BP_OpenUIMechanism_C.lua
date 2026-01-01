-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Item\MiniGame\BP_OpenUIMechanism_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class("BluePrints/Item/Chest/BP_MechanismBase_C")
function r0_0.AuthorityInitInfo(r0_1, r1_1)
  -- line: [12, 15] id: 1
  r0_0.Super.AuthorityInitInfo(r0_1, r1_1)
  r0_1.CanOpen = true
end
function r0_0.CommonInitInfo(r0_2, r1_2)
  -- line: [17, 30] id: 2
  r0_0.Super.CommonInitInfo(r0_2, r1_2)
  r0_2.InteractiveType = Const.EndByTargetInteractive
  r0_2.ChestInteractiveComponent.InteractiveTag = "Interactive"
  r0_2.CanOpen = true
  r0_2.ExtraInfo = {}
  for r6_2, r7_2 in pairs(r0_2.UnitParams) do
    if r6_2 == "UIName" then
      r0_2.UIName = r0_2.UnitParams.UIName and "HardBossLevelChoose"
    else
      r0_2.ExtraInfo[r6_2] = r7_2
    end
  end
  -- close: r2_2
end
function r0_0.OpenMechanism(r0_3, r1_3)
  -- line: [32, 34] id: 3
end
function r0_0.OpenUI(r0_4, r1_4, r2_4)
  -- line: [36, 39] id: 4
  r0_4.UINextStateId = r2_4
  r0_4:BroadcastOpenMechanism(r1_4)
end
function r0_0.CloseMechanism(r0_5, r1_5)
  -- line: [41, 51] id: 5
  if IsAuthority(r0_5) then
    r0_5.CombatStateChangeComponent:TriggerOnEventEnd(r0_5.UINextStateId)
    if r0_5.bIsSuccess then
      r0_5:ChangeState("InteractDone", r1_5)
    else
      r0_5:ChangeState("InteractBreak", r1_5)
    end
  end
  r0_5:BroadcastCloseMechanism(r1_5)
end
function r0_0.BroadcastOpenMechanism_Lua(r0_6, r1_6)
  -- line: [53, 61] id: 6
  if IsAuthority(r0_6) and not IsStandAlone(r0_6) then
    return 
  end
  if UE4.UGameplayStatics.GetPlayerCharacter(r0_6, 0).Eid ~= r1_6 then
    return 
  end
  r0_6:LoadGameUI(r1_6)
end
function r0_0.BroadcastCloseMechanism_Lua(r0_7, r1_7)
  -- line: [63, 71] id: 7
  if IsAuthority(r0_7) and not IsStandAlone(r0_7) then
    return 
  end
  if UE4.UGameplayStatics.GetPlayerCharacter(r0_7, 0).Eid ~= r1_7 then
    return 
  end
  r0_7:UnLoadGameUI(r1_7)
end
function r0_0.LoadGameUI(r0_8, r1_8)
  -- line: [73, 90] id: 8
  UE4.UGameplayStatics.GetGameInstance(r0_8):GetGameUIManager():CloseResidentUI()
  Battle(r0_8):GetEntity(r1_8):SetCharacterTag("Interactive")
  r0_8.CurrentUI = r0_8:RealLoadGameUI()
  r0_8.CanOpen = false
end
function r0_0.RealLoadGameUI(r0_9)
  -- line: [92, 95] id: 9
  return UIManager(r0_9):LoadUINew(r0_9.UIName, r0_9.ExtraInfo)
end
function r0_0.UnLoadGameUI(r0_10, r1_10)
  -- line: [97, 120] id: 10
  if UE4.UGameplayStatics.GetPlayerPawn(r0_10, 0).Eid ~= r1_10 then
    return 
  end
  UE4.UGameplayStatics.GetGameInstance(r0_10):GetGameUIManager():OpenResidentUI()
  local r4_10 = Battle(r0_10):GetEntity(r1_10)
  local r5_10 = UE4.UGameplayStatics.GetPlayerController(r0_10, 0)
  if r4_10.AutoSyncProp.CharacterTag == "Interactive" then
    r4_10:SetCharacterTagIdle()
  end
  r0_10.CanOpen = true
end
function r0_0.EndInteractive(r0_11, r1_11, r2_11)
  -- line: [122, 125] id: 11
  r0_11:SetVariableBool("bIsSuccess", r2_11, r1_11.Eid)
  r0_11.ChestInteractiveComponent:EndInteractive(r1_11)
end
function r0_0.GetCanOpen(r0_12, r1_12)
  -- line: [127, 138] id: 12
  local r2_12 = Battle(r0_12)
  if not r2_12 then
    return 
  end
  local r3_12 = r2_12:GetEntity(r1_12)
  if r3_12 and not r3_12:CanEnterInteractive() then
    r0_12.CanOpen = false
  else
    r0_12.CanOpen = true
  end
end
return r0_0
