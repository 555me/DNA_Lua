-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Client\Entities\Components\BlueMgr.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("BluePrints.Client.Wrapper.Decorator")
local r1_0 = require("Blueprints.UI.Forge.ForgeDataModel")
local r2_0 = {}
for r7_0, r8_0 in pairs(r0_0) do
  r2_0[r7_0] = r8_0
end
-- close: r3_0
setmetatable(r2_0, getmetatable(r0_0))
function r2_0.EnterWorld(r0_1)
  -- line: [10, 12] id: 1
  r1_0:Initialize()
end
function r2_0.StartProduct(r0_2, r1_2, r2_2, r3_2)
  -- line: [14, 22] id: 2
  r0_2.logger.debug("ZJT_ StartProduct ClientCallServer DraftId ", r1_2, r3_2)
  if not r2_2 then
    r2_2 = {}
  end
  r0_2:CallServer("StartProduct", function(r0_3)
    -- line: [17, 20] id: 3
    r0_2.logger.debug("ZJT_ StartProduct ServerCallClient ", r1_2, r0_3)
    EventManager:FireEvent(EventID.OnStartProduce, r1_2, r0_3)
  end, r1_2, r3_2, r2_2)
end
function r2_0.CompleteProduct(r0_4, r1_4)
  -- line: [24, 31] id: 4
  r0_4.logger.debug("ZJT_ CompleteProduct DraftId", r1_4)
  r0_4:CallServer("CompleteProduct", function(r0_5, r1_5)
    -- line: [26, 29] id: 5
    r0_4.logger.debug("ZJT_ CompleteProduct Callback ", r1_4, r0_5)
    EventManager:FireEvent(EventID.OnCompleteProduce, {
      [r1_4] = r1_5,
    }, r0_5)
  end, r1_4)
end
function r2_0.OnBlueProductComplete(r0_6, r1_6)
  -- line: [33, 40] id: 6
  DebugPrint("Tianyi@ OnBlueProductComplete")
  EventManager:FireEvent(EventID.OnBlueComplete, r1_6)
  r0_6.logger.debug("ZJT_ SeverCallClient OnBlueProductComplete ", r1_6)
  r1_0:IncreaseReddotByDraftInfo(r1_6)
end
function r2_0.AccelerateProduct(r0_7, r1_7)
  -- line: [42, 49] id: 7
  r0_7.logger.debug("ZJT_ AccelerateBlueProduct DraftId", r1_7)
  r0_7:CallServer("AccelerateProduct", function(r0_8)
    -- line: [44, 47] id: 8
    r0_7.logger.debug("ZJT_ AccelerateBlueProduct ServerCallClient ", r0_8)
    EventManager:FireEvent(EventID.OnAccerateProduce, r1_7, r0_8)
  end, r1_7)
end
function r2_0.CancelProduct(r0_9, r1_9)
  -- line: [51, 58] id: 9
  r0_9.logger.debug("ZJT_ CancelProduct DraftId ")
  r0_9:CallServer("CancelProduct", function(r0_10, r1_10, r2_10)
    -- line: [53, 56] id: 10
    r0_9.logger.debug("ZJT_ ServerCallClient CancelProduct DraftId ", r1_9, r0_10)
    EventManager:FireEvent(EventID.OnCancelProduce, r1_9, r0_10, r1_10, r2_10)
  end, r1_9)
end
function r2_0.GetAllDraftCompleteReward(r0_11, r1_11)
  -- line: [60, 66] id: 11
  r0_11:CallServer("GetAllDraftCompleteReward", function(r0_12, r1_12)
    -- line: [61, 64] id: 12
    r0_11.logger.debug("ZJT_ ServerCallClient GetAllDraftCompleteReward ", r0_12)
    EventManager:FireEvent(EventID.OnCompleteBatchProduce, r1_12, r0_12)
  end, r1_11)
end
function r2_0._OnPropChangeDrafts(r0_13, r1_13)
  -- line: [69, 78] id: 13
  local r2_13 = {}
  for r7_13, r8_13 in ipairs(r1_13) do
    if r0_13.Drafts[r8_13] then
      table.insert(r2_13, r8_13)
    end
  end
  -- close: r3_13
  EventManager:FireEvent(EventID.OnGetNewDraft, r2_13)
end
function r2_0.CheckDraftEnough(r0_14, r1_14)
  -- line: [81, 98] id: 14
  if next(r1_14) == nil then
    return true
  end
  for r6_14, r7_14 in pairs(r1_14) do
    if not DataMgr.Draft[r6_14] then
      return false
    end
    local r8_14 = r0_14.Drafts[r6_14]
    if not r8_14 then
      return false
    end
    if r8_14.Count <= 0 and not r8_14.IsInfinity and r7_14 <= r8_14.Count then
      return false
    end
  end
  -- close: r2_14
  return true
end
return r2_0
