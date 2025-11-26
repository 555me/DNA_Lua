-- filename: @E:/Pack/Branch/OBT10_Geili\Content/Script/BluePrints\Item\Harvest\BP_CombatHarvestBase_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class("BluePrints/Item/CombatProp/BP_CombatPropBase_C")
function r0_0.AuthorityInitInfo(r0_1, r1_1)
  -- line: [14, 23] id: 1
  r0_0.Super.AuthorityInitInfo(r0_1, r1_1)
  r0_1.RareProb = r0_1.UnitParams.RareProb and -1
  r0_1.RareRewardId = r0_1.UnitParams.RareRewardId and 0
  r0_1.bRare = false
end
function r0_0.OnToughnessToZero(r0_2)
  -- line: [25, 38] id: 2
  local r1_2 = r0_2.Normal_State_Id
  if math.random() <= r0_2.RareProb then
    r1_2 = r0_2.Rare_State_Id
    if IsAuthority(r0_2) then
      r0_2.bRare = true
    end
  end
  r0_2:ChangeState("Manual", 0, r1_2)
end
function r0_0.GetCanOpen(r0_3, r1_3)
  -- line: [40, 42] id: 3
  r0_3.CanOpen = true
end
function r0_0.OpenMechanism(r0_4, r1_4)
  -- line: [44, 50] id: 4
  print(_G.LogTag, "LXZ OpenMechanism", r0_4.OpenState)
  if not r0_4.OpenState then
    r0_4:CreateReward(r1_4)
  end
  r0_4:UpdateRegionData("OpenState", true)
end
function r0_0.CreateReward(r0_5, r1_5)
  -- line: [52, 61] id: 5
  local r2_5 = UE4.UGameplayStatics.GetGameMode(r0_5)
  if r2_5 then
    local r3_5 = r0_5:GetTransform()
    local r4_5 = {
      SourceEid = r1_5,
      UniqueSign = r0_5.Eid,
      ParentEid = r0_5.Eid,
      bRare = r0_5.bRare,
      WorldRegionEid = r0_5.WorldRegionEid,
      RegionDataType = r0_5.RegionDataType,
    }
    print(_G.LogTag, "LXZ CreateReward", r0_5.bRare)
    r2_5:TriggerRewardEvent(r0_5.UnitId, CommonConst.RewardReason.Chest, r3_5, r4_5)
  end
end
function r0_0.CreateRegionData(r0_6)
  -- line: [63, 71] id: 6
  r0_6.TN = r0_6:GetAttr("TN")
  r0_6.RegionData = {
    StateId = r0_6.StateId,
    IsActive = r0_6.IsActive,
  }
end
function r0_0.RecoverSavedData(r0_7, r1_7)
  -- line: [73, 83] id: 7
  if not r1_7 then
    return 
  end
  for r6_7, r7_7 in pairs(r1_7) do
    if r0_7[r6_7] ~= nil then
      r0_7[r6_7] = r7_7
    end
  end
  -- close: r2_7
end
return r0_0
