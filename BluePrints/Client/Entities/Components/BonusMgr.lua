local r0_0 = require("BluePrints.Client.CustomTypes.SimpleRewardBox")
return {
  EnterWorld = function(r0_1)
    -- line: [7, 10] id: 1
    r0_1.CachedDungeonRewards = r0_0:New()
    r0_1.CachedDungeonProgressRewards = {}
  end,
  TriggerRewardEvent = function(r0_2, r1_2)
    -- line: [14, 61] id: 2
    DebugPrint("TriggerRewardEvent")
    local r2_2 = r1_2[r0_2.Eid]
    assert(r2_2, "TriggerRewardEvent: LogicReward is nil")
    local r3_2 = r2_2.UpValues
    r0_2:CallServer("TriggerRewardEvent", function(r0_3, r1_3)
      -- line: [22, 58] id: 3
      assert(r0_3 ~= 0, "TriggerRewardEvent RewardHandler == 0")
      local r2_3 = GWorld.GameInstance:GetCurrentGameMode()
      if r0_3 > 0 then
        DebugPrint("TriggerRewardEvent in Dungeon")
        for r6_3 = 1, #r1_3, 1 do
          local r7_3 = r1_3[r6_3]
          local r8_3, r9_3, r10_3, r11_3 = table.unpack(r3_2[r6_3])
          if r8_3 == CommonConst.RewardReason.PickUp then
            r0_2:OnPickUp(r2_3, r7_3, r8_3, r10_3, true)
          else
            r0_2:OnGetRewardInDungeon(r2_3, r7_3, r8_3, r9_3, r10_3)
          end
          if r11_3 then
            r11_3(r7_3)
          end
        end
      else
        DebugPrint("TriggerRewardEvent in Region")
        for r6_3 = 1, #r1_3, 1 do
          local r7_3, r8_3, r9_3, r10_3 = table.unpack(r3_2[r6_3])
          local r11_3 = nil
          local r12_3 = nil
          if r7_3 == CommonConst.RewardReason.PickUp then
            r0_2:OnPickUp(r2_3, r1_3[r6_3], r7_3, r9_3, false)
          else
            r11_3, r12_3 = table.unpack(r1_3[r6_3])
            r0_2:HandleRewardInRegion(r2_3, r11_3, r7_3, r8_3, r9_3, r12_3)
          end
          if r10_3 then
            r10_3(r11_3, r12_3)
          end
        end
      end
    end, r2_2.Rewards)
  end,
  OnGetRewardInDungeon = function(r0_4, r1_4, r2_4, r3_4, r4_4, r5_4)
    -- line: [67, 71] id: 4
    DebugPrintTable(r2_4, 5)
    r1_4:ResolveRewardsInBattle(r2_4, r3_4, r4_4, r5_4, {
      Avatar = CommonUtils.ObjId2Str(r0_4.Eid),
    })
    r0_4:CacheDungeonRewards(r2_4)
  end,
  OnPickUp = function(r0_5, r1_5, r2_5, r3_5, r4_5, r5_5)
    -- line: [73, 93] id: 5
    if r5_5 then
      local r6_5 = r4_5.bExtra
      if r6_5 then
        r6_5 = "Extra" and "Normal"
      else
        goto label_8	-- block#3 is visited secondly
      end
      r0_5.CachedDungeonRewards:Merge(r2_5, nil, r0_0:GetTag(r6_5))
    end
    for r10_5, r11_5 in pairs(r2_5) do
      UIUtils.ShowDungeonRewardUI(r11_5, r3_5, string.sub(r10_5, 1, -2))
    end
    -- close: r6_5
    local r6_5 = r2_5.Resources
    if not r6_5 then
      return 
    end
    local r7_5 = UGameplayStatics.GetPlayerCharacter(r1_5, 0)
    for r12_5, r13_5 in pairs(r6_5) do
      r13_5 = r0_0:GetCount(r13_5)
      r1_5:TriggerOnPlayerGetResource(r7_5, r12_5, r13_5)
    end
    -- close: r8_5
  end,
  OnShowRewardInDungeon = function(r0_6, r1_6)
    -- line: [95, 101] id: 6
    DebugPrint("OnShowRewardInDungeon")
    for r5_6 = 1, #r1_6, 1 do
      local r6_6 = r1_6[r5_6]
      r0_6:CacheRewardsAndShowUI(r6_6[1], r6_6[2])
    end
  end,
  CacheRewardsAndShowUI = function(r0_7, r1_7, r2_7)
    -- line: [103, 106] id: 7
    r0_7:CacheDungeonRewards(r1_7)
    UIUtils.OnGetRewardShowUI(r1_7, r2_7)
  end,
  CacheDungeonRewards = function(r0_8, r1_8)
    -- line: [108, 110] id: 8
    r0_8.CachedDungeonRewards:Merge(r1_8)
  end,
  ResetCachedDungeonRewards = function(r0_9)
    -- line: [112, 115] id: 9
    r0_9.CachedDungeonRewards:Clear()
    r0_9.CachedDungeonProgressRewards = {}
  end,
  GetCachedDungeonRewards = function(r0_10)
    -- line: [117, 119] id: 10
    return r0_10.CachedDungeonRewards
  end,
  UpdateDungeonRewards = function(r0_11, r1_11)
    -- line: [121, 131] id: 11
    DebugPrintTable(r1_11, 5)
    local r2_11 = 0
    for r7_11, r8_11 in pairs(r1_11) do
      r0_11.CachedDungeonProgressRewards[r7_11] = r8_11
      if r2_11 < r7_11 then
        r2_11 = r7_11
      end
    end
    -- close: r3_11
    EventManager:FireEvent(EventID.OnUpdateRewardProgress, r2_11)
  end,
  GetCachedDungeonProgressRewards = function(r0_12)
    -- line: [133, 135] id: 12
    return r0_12.CachedDungeonProgressRewards
  end,
  HandleRewardInRegion = function(r0_13, r1_13, r2_13, r3_13, r4_13, r5_13, r6_13)
    -- line: [140, 155] id: 13
    if not r2_13 or type(r2_13) ~= "table" or next(r2_13) == nil then
      return 
    end
    if r6_13 then
      for r11_13, r12_13 in pairs(r6_13) do
        for r17_13, r18_13 in pairs(r12_13) do
          r1_13:GetRegionDataMgrSubSystem().DataLibrary:SetUnitRegionCacheData(r18_13.RegionDataType, r18_13.SubRegionId, r18_13.LevelName, r18_13.WorldRegionEid, r18_13)
        end
        -- close: r13_13
      end
      -- close: r7_13
    end
    r1_13:ResolveRewardsInBattle(r2_13, r3_13, r4_13, r5_13, {
      RewardDropDatas = r6_13,
      Avatar = CommonUtils.ObjId2Str(r0_13.Eid),
    })
    UIUtils.OnGetRewardShowUI(r2_13, r3_13)
  end,
  GetCharTrialReward = function(r0_14, r1_14, r2_14)
    -- line: [159, 172] id: 14
    r0_14:CallServer("GetCharTrialReward", function(r0_15, r1_15)
      -- line: [160, 169] id: 15
      if not ErrorCode:Check(r0_15) then
        return 
      end
      PrintTable(r1_15, 3)
      if r1_14 then
        r1_14(r2_14, r1_15)
      end
    end, r2_14)
  end,
  OnRewardRateUpdate = function(r0_16, r1_16, r2_16)
    -- line: [174, 180] id: 16
    print(_G.LogTag, "OnRewardRateUpdate", r1_16, r2_16)
    r0_16.RewardParams[r1_16 .. "Rate"] = r2_16
    if r1_16 == "Exp" and r2_16 and GWorld.BP_Avatar then
      GWorld.BP_Avatar.AvatarExpRate = r2_16
    end
  end,
}
