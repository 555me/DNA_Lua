-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Client\Entities\Components\FeiNaMgr.lua
-- version: lua54
-- line: [0, 0] id: 0
return {
  EnterWorld = function(r0_1)
    -- line: [2, 4] id: 1
    UIUtils.RefreshFeinaRewardReddot()
  end,
  GetFeiNaProgressRewerd = function(r0_2, r1_2, r2_2, r3_2)
    -- line: [6, 17] id: 2
    r0_2:CallServer("GetFeiNaProgressRewerd", function(r0_3, r1_3)
      -- line: [7, 15] id: 3
      r0_2.logger.debug("ZJT_ GetFeiNaProgressRewerd ", r0_3, r1_3)
      if ErrorCode:Check(r0_3) == false then
        return 
      end
      if r1_2 then
        r1_2(r0_3, r1_3)
      end
    end, r2_2, r3_2)
  end,
  GetAllFeiNaProgressRewerd = function(r0_4, r1_4, r2_4)
    -- line: [19, 31] id: 4
    r0_4:CallServer("GetAllFeiNaProgressRewerd", function(r0_5, r1_5)
      -- line: [20, 28] id: 5
      r0_4.logger.debug("ZJT_ GetAllFeiNaProgressRewerd ", r0_5, r1_5)
      if ErrorCode:Check(r0_5) == false then
        return 
      end
      if r2_4 then
        r2_4(r0_5, r1_5)
      end
    end, r1_4)
  end,
  GetFeinaRewardInfo = function(r0_6, r1_6)
    -- line: [33, 36] id: 6
    return r0_6.FeiNaDungeonData[r1_6] and r0_6.FeiNaDungeonData[r1_6].RewardsGot
  end,
  IsPassDungeon = function(r0_7, r1_7)
    -- line: [38, 44] id: 7
    if not r1_7 then
      return false
    end
    local r2_7 = r0_7.Dungeons
    if r2_7 then
      r2_7 = r0_7.Dungeons[r1_7] and r0_7.Dungeons[r1_7].IsPass and false
    else
      goto label_16	-- block#5 is visited secondly
    end
    return r2_7
  end,
  _OnPropChangeFeiNaDungeonData = function(r0_8)
    -- line: [46, 78] id: 8
    local r1_8 = GWorld:GetAvatar()
    if not r1_8 then
      return 
    end
    for r6_8, r7_8 in pairs(DataMgr.FeinaEvent) do
      for r12_8, r13_8 in pairs(r7_8.DungeonId) do
        local r14_8 = r1_8:GetFeinaRewardInfo(r13_8)
        if r14_8 then
          for r19_8, r20_8 in pairs(r14_8) do
            if r20_8 == 1 then
              if not ReddotManager.GetTreeNode("FeinaEventReward") then
                ReddotManager.AddNodeEx("FeinaEventReward")
              end
              local r22_8 = ReddotManager.GetLeafNodeCacheDetail("FeinaEventReward")
              if not r22_8[r6_8] then
                r22_8[r6_8] = {}
              end
              if not r22_8[r6_8][r13_8] then
                r22_8[r6_8][r13_8] = {}
              end
              if not r22_8[r6_8][r13_8][r19_8] then
                r22_8[r6_8][r13_8][r19_8] = 1
                ReddotManager.IncreaseLeafNodeCount("FeinaEventReward")
              end
            end
          end
          -- close: r15_8
        end
      end
      -- close: r8_8
    end
    -- close: r2_8
  end,
}
