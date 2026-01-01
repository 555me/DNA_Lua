-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\UI_PC\Battle\ExclusiveSkill\Battle_ShuimuSkill_PC.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class("BluePrints.UI.UI_PC.Battle.ExclusiveSkill.Base.Battle_Skill_UI_Base")
local r1_0 = 1
local r2_0 = 5
function r0_0.Initialize(r0_1, r1_1)
  -- line: [8, 18] id: 1
  r0_1.Super.Initialize(r0_1)
  r0_1.OwnerPlayer = nil
  r0_1.BattleSkillHelpInfo = {}
  r0_1.MaxSummonerCount = nil
  r0_1.AllSummonerInfo = {}
  r0_1.SummonBarList = {}
  r0_1.SummonerGlowList = {}
  r0_1.EffectList = {}
  r0_1.TextList = {}
end
function r0_0.OnLoaded(r0_2, r1_2, r2_2)
  -- line: [20, 25] id: 2
  r0_2.Super.OnLoaded(r0_2, r1_2, r2_2)
  r0_2:InitPanelInfo()
  r0_2:RefreshNode(r2_2, r1_2)
  r0_2:InitListenEvent()
end
function r0_0.InitPanelInfo(r0_3)
  -- line: [27, 33] id: 3
  for r4_3 = 1, r2_0, 1 do
    r0_3.EffectList[r4_3] = r0_3[string.format("Battle_ShuimuSkill_Effect_PC_%d", r4_3)]
  end
  r0_3.ProgressPercentMinCache = r0_3.ProgressPercentMin
  r0_3.ProgressPercentMaxCache = r0_3.ProgressPercentMax
end
function r0_0.InitListenEvent(r0_4)
  -- line: [35, 38] id: 4
  r0_4:AddDispatcher(EventID.OnCharCallSummoner, r0_4, r0_4.OnSummonerAdd)
  r0_4:AddDispatcher(EventID.OnCharGradeLevelUp, r0_4, r0_4.OnCharGradeLevelUp)
end
function r0_0.RefreshNode(r0_5, r1_5, r2_5)
  -- line: [40, 58] id: 5
  r0_5.OwnerPlayer = r2_5
  if not IsValid(r0_5.OwnerPlayer) or not r1_5 then
    return 
  end
  r0_5.BattleSkillHelpInfo = r1_5
  r0_5.MaxSummonerCount = r1_5.MaxSummonerCount
  r0_5.SummonerId = r1_5.SummonerId
  for r6_5 = 1, r2_0, 1 do
    if r6_5 <= r0_5.MaxSummonerCount then
      r0_5["Summoner_" .. tostring(r6_5)]:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      r0_5:SetSummonerItem(r6_5, false)
    else
      r0_5["Summoner_" .. tostring(r6_5)]:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
end
function r0_0.OnSummonerAdd(r0_6, r1_6, r2_6)
  -- line: [60, 95] id: 6
  if r0_6:IsMainPlayerSummon(r1_6, r0_6.OwnerPlayer, r0_6.SummonerId) then
    if r1_6 ~= nil and r1_6.UnitId == r0_6.SummonerId then
      local r3_6 = 1
      local r4_6 = math.huge
      local r5_6 = 0
      for r10_6, r11_6 in ipairs(r0_6.AllSummonerInfo) do
        if r0_6:IsSummonerLiving(r11_6.Entity) then
          local r12_6 = UE4.UBattleFunctionLibrary.GetSummonRemainingLifeTime(r11_6.Entity)
          if r12_6 < r4_6 then
            r4_6 = r12_6
            r3_6 = r10_6
          end
          r5_6 = r5_6 + 1
        else
          r3_6 = r10_6
          break
        end
      end
      -- close: r6_6
      local r6_6 = r5_6 + 1
      if r0_6.MaxSummonerCount <= r5_6 then
        r6_6 = r3_6
      end
      r0_6.AllSummonerInfo[r6_6] = {
        Entity = r1_6,
        MaxLifeTime = r2_6,
      }
      r0_6:SetEffectItem(r6_6, true)
    end
    if not r0_6.OwnerPlayer:IsExistTimer("RefreshAllSummonerInfo") then
      r0_6.OwnerPlayer:AddTimer(0.1, function()
        -- line: [90, 92] id: 7
        r0_6:RefreshAllSummonerInfo()
      end, true, 0, "RefreshAllSummonerInfo")
    end
  end
end
function r0_0.RefreshAllSummonerInfo(r0_8)
  -- line: [97, 125] id: 8
  local r1_8 = 0
  for r6_8, r7_8 in ipairs(r0_8.AllSummonerInfo) do
    if r0_8.MaxSummonerCount < r6_8 then
      return 
    end
    if r0_8:IsSummonerLiving(r7_8.Entity) then
      r1_8 = r1_8 + 1
      r0_8:SetSummonerItem(r6_8, true, r7_8)
    else
      r0_8:SetSummonerItem(r6_8, false)
      r7_8.Entity = nil
    end
  end
  -- close: r2_8
  local r2_8 = #r0_8.AllSummonerInfo
  if r2_8 < r0_8.MaxSummonerCount then
    for r6_8 = r2_8 + 1, r0_8.MaxSummonerCount, 1 do
      r0_8:SetSummonerItem(r6_8, false)
    end
  end
  if r1_8 <= 0 and IsValid(r0_8.OwnerPlayer) then
    r0_8.OwnerPlayer:RemoveTimer("RefreshAllSummonerInfo")
  end
end
function r0_0.SetSummonerItem(r0_9, r1_9, r2_9, r3_9)
  -- line: [127, 149] id: 9
  r0_9.VisibleStatus = r0_9.VisibleStatus and {}
  r0_9.VisibleStatus[r1_9] = r2_9
  local r5_9 = r0_9.VisibleStatus[r1_9] ~= r2_9
  if r2_9 then
    local r6_9 = UE4.UBattleFunctionLibrary.GetSummonRemainingLifeTime(r3_9.Entity)
    r0_9:SetSummonPercent(r1_9, r0_9:GetPercentValue(r6_9 / r3_9.MaxLifeTime))
    r0_9.EffectList[r1_9].Text_Time:SetText(string.format("%.0fs", r6_9))
  elseif r5_9 then
    r0_9:SetSummonPercent(r1_9, r0_9:GetPercentValue(0))
    r0_9.EffectList[r1_9].Text_Time:SetText("")
    r0_9:SetEffectItem(r1_9, false)
  end
end
function r0_0.SetEffectItem(r0_10, r1_10, r2_10)
  -- line: [151, 158] id: 10
  local r3_10 = r0_10.EffectList[r1_10]
  if r2_10 then
    r3_10:PlayAnimation(r3_10.To_Active)
  else
    r3_10:PlayAnimation(r3_10.To_Inactive)
  end
end
function r0_0.GetPercentValue(r0_11, r1_11)
  -- line: [160, 166] id: 11
  local r2_11 = UKismetMathLibrary.MapRangeClamped(r1_11, 0, 1, r0_11.ProgressPercentMinCache, r0_11.ProgressPercentMaxCache)
  if r2_11 == 0 then
    return r0_11.ProgressPercentMinCache
  end
  return r2_11
end
function r0_0.IsSummonerLiving(r0_12, r1_12)
  -- line: [168, 170] id: 12
  return r1_12 and IsValid(r1_12) and UE4.UBattleFunctionLibrary.GetSummonRemainingLifeTime(r1_12) > 0
end
function r0_0.OnCharGradeLevelUp(r0_13, r1_13, r2_13, r3_13)
  -- line: [172, 181] id: 13
  if r1_13 == ErrorCode.RET_SUCCESS then
    r3_13 = r3_13 + 1
    if r2_13 == GWorld:GetAvatar().CurrentChar then
      r0_13:RefreshNode(DataMgr.BattleCharUI[r1_0][r3_13].Params, r0_13.OwnerPlayer)
    end
  end
end
function r0_0.SetSummonPercent(r0_14, r1_14, r2_14)
  -- line: [183, 190] id: 14
  if r0_14.EffectList[r1_14] then
    r0_14.EffectList[r1_14].Img_Summoner_Bar:GetDynamicMaterial():SetScalarParameterValue("Percent", r0_14:GetPercentValue(r2_14))
  end
end
return r0_0
