-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Client\Entities\Components\DispathMgr.lua
-- version: lua54
-- line: [0, 0] id: 0
return {
  EnterWorld = function(r0_1)
    -- line: [3, 22] id: 1
    local r1_1 = GWorld:GetAvatar()
    if not r1_1 then
      return 
    end
    DebugPrint("dispatch111111111111111")
    if not ReddotManager.GetTreeNode(DataMgr.ReddotNode.Dispatch.Name) then
      ReddotManager.AddNode(DataMgr.ReddotNode.Dispatch.Name)
    end
    ReddotManager.ClearLeafNodeCount(DataMgr.ReddotNode.Dispatch.Name, true)
    for r6_1, r7_1 in pairs(DataMgr.Dispatch) do
      local r8_1 = r1_1.Dispatches[r6_1]
      local r9_1 = ReddotManager.GetLeafNodeCacheDetail(DataMgr.ReddotNode.Dispatch.Name)
      if r9_1 and r8_1 and (r8_1.State == CommonConst.DispatchState.Perfect or r8_1.State == CommonConst.DispatchState.Success or r8_1.State == CommonConst.DispatchState.Qualified or r8_1.State == CommonConst.DispatchState.Disqualified) then
        r9_1[r6_1] = true
        ReddotManager.IncreaseLeafNodeCount(DataMgr.ReddotNode.Dispatch.Name, 1)
      end
    end
    -- close: r2_1
  end,
  LeaveWorld = function(r0_2)
    -- line: [24, 26] id: 2
  end,
  StartDispatch = function(r0_3, r1_3, r2_3, r3_3)
    -- line: [28, 36] id: 3
    r0_3:CallServer("StartDispatch", function(r0_4)
      -- line: [29, 34] id: 4
      if r0_4 == ErrorCode.RET_SUCCESS then
        EventManager:FireEvent(EventID.StartDispatch, r1_3)
      end
      DebugPrint("ZJT_ 11111111 StartDispatch ", r0_4, r1_3, r2_3, r3_3)
    end, r1_3, r2_3, r3_3)
  end,
  OnDispatchComplete = function(r0_5, r1_5, r2_5, r3_5)
    -- line: [38, 42] id: 5
    r0_5:_TryAddReddotCacheDetail(r1_5)
    EventManager:FireEvent(EventID.OnDispatchComplete, r1_5)
    DebugPrint("ZJT_ 11111111 OnDispatchComplete ", r1_5, r2_5, r3_5)
  end,
  UpdateDispatchCondition = function(r0_6, r1_6)
    -- line: [44, 47] id: 6
    DebugPrint("ZJT_ 11111111 UpdateDispatchCondition Out ", r1_6)
    UIManager(r0_6):ShowDispatchTip(r1_6)
  end,
  CancelDispatch = function(r0_7, r1_7)
    -- line: [49, 56] id: 7
    r0_7:CallServer("CancelDispatch", function(r0_8)
      -- line: [50, 54] id: 8
      if r0_8 == ErrorCode.RET_SUCCESS then
        EventManager:FireEvent(EventID.CancelDispatch, r1_7)
      end
    end, r1_7)
  end,
  CompleteDispatch = function(r0_9, r1_9)
    -- line: [58, 67] id: 9
    r0_9:CallServer("CompleteDispatch", function(r0_10, r1_10)
      -- line: [59, 65] id: 10
      if r0_10 == ErrorCode.RET_SUCCESS then
        EventManager:FireEvent(EventID.CompleteDispatch, r1_10, r1_9)
        r0_9:_TryCutReddotCacheDetail({
          r1_9
        })
      end
      DebugPrint("ZJT_ 11111111 CompleteDispatch ", r1_9)
    end, r1_9)
  end,
  GetAllDispatchReward = function(r0_11, r1_11)
    -- line: [69, 78] id: 11
    r0_11:CallServer("GetAllDispatchReward", function(r0_12, r1_12)
      -- line: [70, 76] id: 12
      if r0_12 == ErrorCode.RET_SUCCESS then
        EventManager:FireEvent(EventID.GetAllDispatchReward, r1_12, r1_11)
        r0_11:_TryCutReddotCacheDetail(r1_11)
      end
      DebugPrint("ZJT_ 11111111 GetAllDispatchReward ")
    end, r1_11)
  end,
  OnDispatchListCoolingComplete = function(r0_13, r1_13)
    -- line: [80, 83] id: 13
    DebugPrint("ZJT_ 11111111 OnDispatchListCoolingComplete", r1_13)
    EventManager:FireEvent(EventID.OnDispatchListCoolingComplete, r1_13)
  end,
  ServerNotifyClientGetNewDispatch = function(r0_14, r1_14)
    -- line: [85, 89] id: 14
    DebugPrint("ZJT_ 11111111111111111111 ServerNotifyClientGetNewDispatch ", r1_14)
    EventManager:FireEvent(EventID.OnDispatchListCoolingComplete, r1_14)
    r0_14:OnActivateDynamicQuest(r1_14)
  end,
  OnDispatchExistingComplete = function(r0_15, r1_15)
    -- line: [91, 94] id: 15
    EventManager:FireEvent(EventID.OnDispatchExistingComplete, r1_15)
    DebugPrint("ZJT_ 11111111 OnDispatchExistingComplete", r1_15)
  end,
  _TryAddReddotCacheDetail = function(r0_16, r1_16)
    -- line: [96, 104] id: 16
    local r2_16 = ReddotManager.GetLeafNodeCacheDetail(DataMgr.ReddotNode.Dispatch.Name)
    if r2_16 and r2_16[r1_16] == nil then
      r2_16[r1_16] = true
    end
    if r2_16[r1_16] then
      ReddotManager.IncreaseLeafNodeCount(DataMgr.ReddotNode.Dispatch.Name)
    end
  end,
  _TryCutReddotCacheDetail = function(r0_17, r1_17)
    -- line: [106, 116] id: 17
    local r2_17 = ReddotManager.GetLeafNodeCacheDetail(DataMgr.ReddotNode.Dispatch.Name)
    if r2_17 then
      for r7_17, r8_17 in ipairs(r1_17) do
        if r2_17[r8_17] then
          r2_17[r8_17] = nil
        end
      end
      -- close: r3_17
    end
    ReddotManager.DecreaseLeafNodeCount(DataMgr.ReddotNode.Dispatch.Name, #r1_17)
  end,
}
