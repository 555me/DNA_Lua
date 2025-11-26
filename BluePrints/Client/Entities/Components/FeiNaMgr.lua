-- filename: @E:/Pack/Branch/OBT10_Geili\Content/Script/BluePrints\Client\Entities\Components\FeiNaMgr.lua
-- version: lua54
-- line: [0, 0] id: 0
return {
  GetFeiNaProgressRewerd = function(r0_1, r1_1, r2_1, r3_1)
    -- line: [3, 14] id: 1
    r0_1:CallServer("GetFeiNaProgressRewerd", function(r0_2, r1_2)
      -- line: [4, 12] id: 2
      r0_1.logger.debug("ZJT_ GetFeiNaProgressRewerd ", r0_2, r1_2)
      if ErrorCode:Check(r0_2) == false then
        return 
      end
      if r1_1 then
        r1_1(r0_2, r1_2)
      end
    end, r2_1, r3_1)
  end,
  GetAllFeiNaProgressRewerd = function(r0_3, r1_3, r2_3)
    -- line: [16, 28] id: 3
    r0_3:CallServer("GetAllFeiNaProgressRewerd", function(r0_4, r1_4)
      -- line: [17, 25] id: 4
      r0_3.logger.debug("ZJT_ GetAllFeiNaProgressRewerd ", r0_4, r1_4)
      if ErrorCode:Check(r0_4) == false then
        return 
      end
      if r2_3 then
        r2_3(r0_4, r1_4)
      end
    end, r1_3)
  end,
  GetFeinaRewardInfo = function(r0_5, r1_5)
    -- line: [30, 33] id: 5
    return r0_5.FeiNaDungeonData[r1_5] and r0_5.FeiNaDungeonData[r1_5].RewardsGot
  end,
  IsPassDungeon = function(r0_6, r1_6)
    -- line: [35, 41] id: 6
    if not r1_6 then
      return false
    end
    local r2_6 = r0_6.Dungeons
    if r2_6 then
      r2_6 = r0_6.Dungeons[r1_6] and r0_6.Dungeons[r1_6].IsPass and false
    else
      goto label_16	-- block#5 is visited secondly
    end
    return r2_6
  end,
  _OnPropChangeFeiNaDungeonData = function(r0_7)
    -- line: [43, 75] id: 7
    local r1_7 = GWorld:GetAvatar()
    if not r1_7 then
      return 
    end
    for r6_7, r7_7 in pairs(DataMgr.FeinaEvent) do
      for r12_7, r13_7 in pairs(r7_7.DungeonId) do
        local r14_7 = r1_7:GetFeinaRewardInfo(r13_7)
        if r14_7 then
          for r19_7, r20_7 in pairs(r14_7) do
            if r20_7 == 1 then
              if not ReddotManager.GetTreeNode("FeinaEventReward") then
                ReddotManager.AddNodeEx("FeinaEventReward")
              end
              local r22_7 = ReddotManager.GetLeafNodeCacheDetail("FeinaEventReward")
              if not r22_7[r6_7] then
                r22_7[r6_7] = {}
              end
              if not r22_7[r6_7][r13_7] then
                r22_7[r6_7][r13_7] = {}
              end
              if not r22_7[r6_7][r13_7][r19_7] then
                r22_7[r6_7][r13_7][r19_7] = 1
                ReddotManager.IncreaseLeafNodeCount("FeinaEventReward")
              end
            end
          end
          -- close: r15_7
        end
      end
      -- close: r8_7
    end
    -- close: r2_7
  end,
}
