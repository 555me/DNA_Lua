-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Client\Entities\Components\RougeLikeMgr.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("Utils.TimeUtils")
local r1_0 = require("BluePrints.UI.UI_PC.RougeLike.RougeAchive.RougeConst")
return {
  EnterWorld = function(r0_1)
    -- line: [5, 7] id: 1
    r0_1:RefreshRougeLikeRewardReddot()
  end,
  EnterRougeLike = function(r0_2, r1_2, r2_2, r3_2)
    -- line: [9, 22] id: 2
    print(_G.LogTag, "EnterRougeLike")
    local function r4_2(r0_3)
      -- line: [11, 18] id: 3
      if not ErrorCode:Check(r0_3) then
        r0_2:ShowErrorByErrorCode("EnterRougeLike", r0_3)
      end
      if r1_2 then
        r1_2(r0_3)
      end
    end
    if not r3_2 then
      r3_2 = 1
    end
    r0_2:CallServer("EnterRougeLike", r4_2, r2_2, r3_2)
  end,
  EnterRoom = function(r0_4, r1_4)
    -- line: [25, 46] id: 4
    print(_G.LogTag, "EnterRoom", r1_4)
    if GWorld.RougeLikeManager then
      GWorld.RougeLikeManager:TriggerRecordProgressData()
    end
    r0_4:CallServer("EnterRoom", function(r0_5, r1_5)
      -- line: [32, 44] id: 5
      if not ErrorCode:Check(r0_5) then
        r0_4:ShowErrorByErrorCode("EnterRoom", r0_5)
        return 
      end
      if not GWorld.RougeLikeManager then
        return 
      end
      GWorld.RougeLikeManager:RefreshRougeInfo(r1_5)
      GWorld.RougeLikeManager:OnEnterRoom()
    end, r1_4)
  end,
  PassRoom = function(r0_6, r1_6)
    -- line: [49, 77] id: 6
    if DataMgr.RougeLikeRoom[GWorld.RougeLikeManager.RoomId].RoomType == 5 then
      DebugPrint("RougeLikeComponent: RougeLikeFinish  RoomIndex:" .. GWorld.RougeLikeManager.RoomIndex .. ", RoomId:" .. GWorld.RougeLikeManager.RoomId)
      UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance):FinishRougeLike(true)
    else
      DebugPrint("RougeLikeComponent: PassRoom  RoomIndex:" .. GWorld.RougeLikeManager.RoomIndex .. ", RoomId:" .. GWorld.RougeLikeManager.RoomId)
      GWorld.RougeLikeManager:TriggerRecordProgressData()
    end
    print(_G.LogTag, "PassRoom")
    local function r4_6(r0_7, r1_7)
      -- line: [62, 74] id: 7
      if not ErrorCode:Check(r0_7) then
        r0_6:ShowErrorByErrorCode("PassRoom", r0_7)
        return 
      end
      if not GWorld.RougeLikeManager then
        return 
      end
      GWorld.RougeLikeManager:RefreshRougeInfo(r1_7, {
        IsPassRoomAward = true,
      })
      GWorld.RougeLikeManager:OnPassRoom()
    end
    if not r1_6 then
      r1_6 = 0
    end
    r0_6:CallServer("PassRoom", r4_6, r1_6)
  end,
  GetTreasure = function(r0_8, r1_8, r2_8)
    -- line: [79, 102] id: 8
    if not r1_8 then
      print(_G.LogTag, "GetTreasure with nil TreasuresId")
      return 
    end
    r0_8:CallServer("GetTreasure", function(r0_9, r1_9)
      -- line: [85, 100] id: 9
      r0_8.logger.debug("GetTreasure callback", r1_8, r0_9)
      if not ErrorCode:Check(r0_9) then
        r0_8:ShowErrorByErrorCode("GetTreasure", r0_9)
        return 
      end
      if not GWorld.RougeLikeManager then
        return 
      end
      GWorld.RougeLikeManager:RefreshRougeInfo(r1_9)
      if r2_8 then
        r2_8(r0_9)
      end
    end, r1_8)
  end,
  GetBlessing = function(r0_10, r1_10, r2_10)
    -- line: [104, 127] id: 10
    if not r1_10 then
      print(_G.LogTag, "GetBlessing with nil BlessingId")
      return 
    end
    r0_10:CallServer("GetBlessing", function(r0_11, r1_11)
      -- line: [110, 125] id: 11
      r0_10.logger.debug("GetBlessing callback", r1_10, r0_11)
      if not ErrorCode:Check(r0_11) then
        r0_10:ShowErrorByErrorCode("GetBlessing", r0_11)
        return 
      end
      if not GWorld.RougeLikeManager then
        return 
      end
      GWorld.RougeLikeManager:RefreshRougeInfo(r1_11)
      if r2_10 then
        r2_10(r0_11)
      end
    end, r1_10)
  end,
  RougeLikeRefundMRT = function(r0_12, r1_12, r2_12)
    -- line: [129, 151] id: 12
    if r1_12 ~= "Blessing" and r1_12 ~= "Treasure" then
      print(_G.LogTag, "RougeLikeRefundMRT with invalid AwardType", r1_12)
      return 
    end
    r0_12:CallServer("RougeLikeRefundMRT", function(r0_13, r1_13)
      -- line: [135, 149] id: 13
      if not ErrorCode:Check(r0_13) then
        r0_12:ShowErrorByErrorCode("RougeLikeRefundMRT", r0_13)
        return 
      end
      if not GWorld.RougeLikeManager then
        return 
      end
      GWorld.RougeLikeManager:RefreshRougeInfo(r1_13)
      if r2_12 then
        r2_12(r0_13)
      end
    end, r1_12)
  end,
  GetCurrentRougeLikeToken = function(r0_14)
    -- line: [153, 156] id: 14
    return r0_14.Resources:QueryResourceCount(r0_14:GetCurrentRougeLikeTokenId())
  end,
  GetCurrentRougeLikeTokenId = function(r0_15)
    -- line: [158, 166] id: 15
    local r2_15 = DataMgr.RougeLikeSeason[r0_15.RougeLike.ProgressingSeasonId]
    if not r2_15 then
      return 0
    end
    return r2_15.TokenId
  end,
  GetCurrentRougeLikeTalent = function(r0_16)
    -- line: [168, 171] id: 16
    return r0_16.Resources:QueryResourceCount(r0_16:GetCurrentRougeLikeTalentId())
  end,
  GetCurrentRougeLikeTalentId = function(r0_17)
    -- line: [173, 180] id: 17
    local r2_17 = DataMgr.RougeLikeSeason[r0_17.RougeLike.ProgressingSeasonId]
    if not r2_17 then
      return 0
    end
    return r2_17.TalentId
  end,
  GetCurrentRougeLikeOuterShopToken = function(r0_18)
    -- line: [182, 185] id: 18
    return r0_18.Resources:QueryResourceCount(r0_18:GetCurrentRougeLikeOuterShopTokenId())
  end,
  GetCurrentRougeLikeOuterShopTokenId = function(r0_19)
    -- line: [187, 194] id: 19
    local r2_19 = DataMgr.RougeLikeSeason[r0_19.RougeLike.ProgressingSeasonId]
    if not r2_19 then
      return 0
    end
    return r2_19.OuterShopTokenId
  end,
  RefreshAward = function(r0_20, r1_20, r2_20)
    -- line: [196, 222] id: 20
    if r1_20 ~= "Blessing" and r1_20 ~= "Treasure" then
      if r2_20 then
        r2_20(ErrorCode.RET_PARAM_ERROR)
      end
      return 
    end
    r0_20:CallServer("RefreshAward", function(r0_21, r1_21)
      -- line: [204, 219] id: 21
      if not ErrorCode:Check(r0_21) then
        r0_20:ShowErrorByErrorCode("RefreshAward", r0_21)
        return 
      end
      if not GWorld.RougeLikeManager then
        return 
      end
      GWorld.RougeLikeManager:RefreshRougeInfo(r1_21, {
        NoNeedTriggerGetAward = true,
      })
      if r2_20 then
        r2_20(r0_21)
      end
    end, r1_20)
  end,
  InterruptRougeLike = function(r0_22)
    -- line: [225, 228] id: 22
    print(_G.LogTag, "InterruptRougeLike")
    r0_22:CallServerMethod("ClearRougeLike")
  end,
  OnRougeLikeEnd = function(r0_23, r1_23, r2_23, r3_23, r4_23, r5_23, r6_23)
    -- line: [230, 243] id: 23
    print(_G.LogTag, "OnRougeLikeEnd", r1_23, r3_23)
    PrintTable(r6_23, 3)
    r0_23:TryToAddRougeLikeRewardReddot(r3_23)
    if UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance):IsInRegion() then
      GWorld.GameInstance:GetGameUIManager():LoadUINew("RougeSettlement", table.pack(r1_23, r2_23, r3_23, r4_23, r5_23, r0_23.RougeLike.ProgressingSeasonId))
    else
      r0_23.FirstTimeRougeLikeReward = r6_23
      GWorld.GameInstance:PushLogicServerCallbackInfo(r1_23, r2_23, r3_23, r4_23, r5_23, r0_23.RougeLike.ProgressingSeasonId)
    end
  end,
  IsRougeLikeInProgress = function(r0_24)
    -- line: [245, 249] id: 24
    local r1_24 = r0_24.RougeLike:IsInProgress()
    print(_G.LogTag, "IsRougeLikeInProgress", r1_24)
    return r1_24
  end,
  UpgradeAward = function(r0_25, r1_25, r2_25, r3_25, r4_25)
    -- line: [251, 292] id: 25
    if r1_25 ~= "Blessing" then
      if r4_25 then
        r4_25(ErrorCode.RET_PARAM_ERROR)
      end
      return 
    end
    print(_G.LogTag, "UpgradeAward", r1_25, r2_25, r3_25)
    r0_25:CallServer("UpgradeAward", function(r0_26, r1_26, r2_26, r3_26)
      -- line: [261, 289] id: 26
      if not GWorld.RougeLikeManager then
        return 
      end
      if ErrorCode:Check(r0_26) then
        local r4_26 = {}
        local r5_26 = r1_25 .. "_Update"
        r4_26[r5_26] = {}
        r4_26[r5_26][r2_25] = r2_26
        GWorld.RougeLikeManager:RefreshRougeInfo(r4_26)
        if r3_25 then
          local r6_26 = GWorld.RougeLikeManager["RefreshShop" .. r1_25]
          if r6_26 then
            r6_26(GWorld.RougeLikeManager, r3_25, r1_26, r3_26)
          else
            print(_G.LogTag, "Cannot refresh shop", r1_25)
          end
        end
      else
        r0_25:ShowErrorByErrorCode("UpgradeAward", r0_26)
      end
      if r4_25 then
        r4_25(r0_26, r2_26)
      end
    end, r1_25, r2_25, r3_25)
  end,
  RougeShopPurchase = function(r0_27, r1_27, r2_27, r3_27, r4_27)
    -- line: [294, 326] id: 27
    if r2_27 ~= "Blessing" and r2_27 ~= "Treasure" and r2_27 ~= "Item" then
      if r4_27 then
        r4_27(ErrorCode.RET_PARAM_ERROR)
      end
      return 
    end
    print(_G.LogTag, "RougeShopPurchase", r2_27, r3_27)
    r0_27:CallServer("RougeShopPurchase", function(r0_28, r1_28, r2_28)
      -- line: [303, 323] id: 28
      if not GWorld.RougeLikeManager then
        return 
      end
      if ErrorCode:Check(r0_28) then
        GWorld.RougeLikeManager:RefreshRougeInfo(r2_28)
        local r3_28 = GWorld.RougeLikeManager["RefreshShop" .. r2_27]
        if r3_28 then
          r3_28(GWorld.RougeLikeManager, r1_27, r3_27, r1_28)
        else
          print(_G.LogTag, "Cannot refresh shop", r2_27)
        end
      else
        r0_27:ShowErrorByErrorCode("RougeShopPurchase", r0_28)
      end
      if r4_27 then
        r4_27(r0_28)
      end
    end, r1_27, r2_27, r3_27)
  end,
  SaveTalent = function(r0_29, r1_29, r2_29)
    -- line: [328, 343] id: 29
    print(_G.LogTag, "SaveTalent")
    r0_29:CallServer("SaveTalent", function(r0_30)
      -- line: [331, 340] id: 30
      if not ErrorCode:Check(r0_30) then
        r0_29:ShowErrorByErrorCode("SaveTalent", r0_30)
        return 
      end
      if r2_29 then
        r2_29(r0_30)
      end
    end, r1_29)
  end,
  SaveOneTalent = function(r0_31, r1_31, r2_31)
    -- line: [345, 359] id: 31
    print(_G.LogTag, "SaveOneTalent", r1_31)
    r0_31:CallServer("SaveTalentForOne", function(r0_32)
      -- line: [348, 356] id: 32
      if r2_31 then
        r2_31(r0_32)
      end
    end, r1_31)
  end,
  OnUpdateRougeLikeInfo = function(r0_33, r1_33)
    -- line: [361, 368] id: 33
    print(_G.LogTag, "OnUpdateRougeLikeInfo")
    if not GWorld.RougeLikeManager then
      return 
    end
    GWorld.RougeLikeManager:RefreshRougeInfo(r1_33)
  end,
  SelectEvent = function(r0_34, r1_34, r2_34)
    -- line: [370, 395] id: 34
    print(_G.LogTag, "SelectEvent", r1_34)
    if GWorld.RougeLikeManager then
      GWorld.RougeLikeManager:ListenDealRewardEvent()
      GWorld.RougeLikeManager:TriggerRecordProgressData()
    end
    r0_34:CallServer("SelectEvent", function(r0_35, r1_35)
      -- line: [378, 392] id: 35
      if not ErrorCode:Check(r0_35, r1_35) then
        return 
      end
      if not GWorld.RougeLikeManager then
        return 
      end
      GWorld.RougeLikeManager:RefreshRougeInfo(r1_35)
      if r2_34 then
        r2_34(r0_35)
      end
    end, r1_34)
  end,
  PassEvent = function(r0_36, r1_36, r2_36)
    -- line: [397, 410] id: 36
    if not r1_36 then
      r1_36 = true
    end
    if not r2_36 then
      r2_36 = {}
    end
    print(_G.LogTag, "PassEvent", r1_36)
    r0_36:CallServerMethod("PassEvent", r1_36, r2_36)
    local r3_36 = GWorld.RougeLikeManager.EventId
    if r3_36 > 0 and DataMgr.RougeLikeEventSelect[r3_36].UseDedicatedSettlementUI then
      GWorld.GameInstance:GetGameUIManager():LoadUINew("RougeGameSettlement", GWorld.RougeLikeManager.EventId, r2_36)
    end
  end,
  OnPassEvent = function(r0_37, r1_37, r2_37)
    -- line: [412, 435] id: 37
    if not ErrorCode:Check(r1_37, r2_37) then
      return 
    end
    if not GWorld.RougeLikeManager then
      return 
    end
    print(_G.LogTag, "OnPassEvent", GWorld.RougeLikeManager.RoomId)
    GWorld.RougeLikeManager:RegisterEventTime()
    local r3_37 = nil
    local r4_37 = GWorld.RougeLikeManager.EventId
    if r4_37 > 0 then
      local r5_37 = DataMgr.RougeLikeEventSelect[r4_37].UseDedicatedSettlementUI
      if r5_37 then
        r3_37 = {
          UseDedicatedSettlementUI = r5_37,
        }
      end
    end
    GWorld.RougeLikeManager:RefreshRougeInfo(r2_37, r3_37)
    GWorld.RougeLikeManager:TryEventPassRoom()
    GWorld.RougeLikeManager:UnRegisterEventTime()
  end,
  SavePlayerSlice = function(r0_38, r1_38)
    -- line: [437, 440] id: 38
    r0_38:CallServerMethod("SavePlayerSlice", SerializeUtils:Serialize(r1_38))
  end,
  GetRougeLikeWeeklyReward = function(r0_39, r1_39, r2_39)
    -- line: [442, 457] id: 39
    print(_G.LogTag, "GetRougeLikeWeeklyReward")
    local function r3_39(r0_40, r1_40)
      -- line: [444, 453] id: 40
      if not ErrorCode:Check(r0_40) then
        r0_39:ShowErrorByErrorCode("SaveTalent", r0_40)
        return 
      end
      if r1_39 then
        r1_39(r1_40)
      end
    end
    if not r2_39 then
      r2_39 = -1
    end
    r0_39:CallServer("GetWeeklyRougeLikeReward", r3_39, r2_39)
  end,
  IsRougeLikeWeeklyRewardGot = function(r0_41, r1_41)
    -- line: [459, 461] id: 41
    return r0_41.RougeLike.WeeklyRewardGot[r1_41] == 1
  end,
  OnGetAward = function(r0_42, r1_42)
    -- line: [463, 471] id: 42
    if not GWorld.RougeLikeManager then
      return 
    end
    print(_G.LogTag, "OnGetAward")
    GWorld.RougeLikeManager:RefreshRougeInfo(r1_42)
    GWorld.RougeLikeManager:TriggerRecordProgressData()
  end,
  _OnPropChangeResources = function(r0_43, r1_43, r2_43)
    -- line: [473, 498] id: 43
    local r3_43 = r1_43[1]
    local r5_43 = DataMgr.RougeLikeSeason[r0_43.RougeLike.ProgressingSeasonId]
    if not r5_43 then
      return 
    end
    if r3_43 == r5_43.TokenId then
      if not r2_43 then
        r2_43 = 0
      end
      if type(r2_43) == "table" then
        r2_43 = r2_43.Count
      end
      local r6_43 = r0_43.Resources:QueryResourceCount(r3_43)
      local r7_43 = r6_43 - r2_43
      if GWorld.RougeLikeManager then
        GWorld.RougeLikeManager.RougeToken = r6_43
      end
      if r7_43 > 0 then
        print(_G.LogTag, "Add Token", r7_43)
        if GWorld.RougeLikeManager then
          GWorld.RougeLikeManager:ShowTokenTips(r7_43)
        end
      end
    end
  end,
  TriggerTMGetReward = function(r0_44)
    -- line: [500, 511] id: 44
    print(_G.LogTag, "TriggerTMGetReward")
    r0_44:CallServer("TriggerTMGetReward", function(r0_45, r1_45)
      -- line: [502, 509] id: 45
      if not ErrorCode:Check(r0_45) then
        r0_44:ShowErrorByErrorCode("TriggerTMGetReward", r0_45)
        return 
      end
      r0_44:OnGetAward(r1_45)
    end)
  end,
  PreFinishRougeLike = function(r0_46, r1_46, r2_46)
    -- line: [513, 523] id: 46
    print(_G.LogTag, "PreFinishRougeLike", r2_46)
    r0_46:CallServer("PreFinishRougeLike", function(r0_47, r1_47)
      -- line: [515, 520] id: 47
      r0_46:OnUpdateRougeLikeInfo(r0_47)
      if r1_46 then
        r1_46(r1_47)
      end
    end, r2_46)
  end,
  PassStory = function(r0_48)
    -- line: [525, 537] id: 48
    print(_G.LogTag, "PassStory")
    r0_48:CallServer("PassStory", function(r0_49, r1_49)
      -- line: [527, 534] id: 49
      if not ErrorCode:Check(r0_49) then
        r0_48:ShowErrorByErrorCode("PassStory", r0_49)
        return 
      end
      r0_48:OnUpdateRougeLikeInfo(r1_49)
    end)
  end,
  SaveContract = function(r0_50, r1_50, r2_50)
    -- line: [539, 550] id: 50
    print(_G.LogTag, "SaveContract")
    r0_50:CallServer("SaveContract", function(r0_51)
      -- line: [541, 547] id: 51
      ErrorCode:Check(r0_51)
      if r1_50 then
        r1_50(r0_51)
      end
    end, r2_50)
  end,
  HasPassedRougeLikeDifficulty = function(r0_52, r1_52)
    -- line: [552, 554] id: 52
    return r0_52.RougeLike.PassCount[r1_52] > 0
  end,
  GetProgressingRougeLikeAbstract = function(r0_53, r1_53)
    -- line: [556, 562] id: 53
    if not r1_53 then
      return 
    end
    r0_53:CallServer("GetProgressingRougeLikeAbstract", r1_53)
  end,
  _OnPropChangeRougeLike = function(r0_54)
    -- line: [564, 566] id: 54
    EventManager:FireEvent(EventID.OnRougeLikeInfoUpdate)
  end,
  GetRougeLikeManualReward = function(r0_55, r1_55, r2_55, r3_55)
    -- line: [568, 581] id: 55
    r0_55:CallServer("GetRougeLikeManualReward", function(r0_56, r1_56)
      -- line: [569, 578] id: 56
      if not ErrorCode:Check(r0_56) then
        r0_55:ShowErrorByErrorCode("GetRougeLikeManualReward", r0_56)
        return 
      end
      if r1_55 then
        r1_55(r0_56, r1_56)
      end
    end, r2_55, r3_55)
  end,
  TryToAddRougeLikeRewardReddot = function(r0_57, r1_57)
    -- line: [583, 603] id: 57
    local r2_57 = DataMgr.RougeLikeReward[r0_57.RougeLike.WeeklyRewardId]
    if r2_57 and r2_57.Reward and r2_57.EachGradePoints then
      local r3_57 = r0_57.RougeLike.WeeklyTotalScore
      local r4_57 = r3_57 - r1_57
      local r5_57 = #r2_57.Reward * r2_57.EachGradePoints
      if r5_57 <= r4_57 then
        return 
      end
      if r5_57 < r3_57 then
        r3_57 = r5_57
      end
      local r6_57 = math.floor(r3_57 / r2_57.EachGradePoints) - math.floor(r4_57 / r2_57.EachGradePoints)
      if r6_57 > 0 then
        if not ReddotManager.GetTreeNode("RougeLikeReward") then
          ReddotManager.AddNode("RougeLikeReward")
        end
        ReddotManager.IncreaseLeafNodeCount("RougeLikeReward", r6_57)
      end
    end
  end,
  OnRefreshRougeLikeRewardReddot = function(r0_58)
    -- line: [605, 610] id: 58
    if not ReddotManager.GetTreeNode("RougeLikeReward") then
      ReddotManager.AddNode("RougeLikeReward")
    end
    ReddotManager.ClearLeafNodeCount("RougeLikeReward")
  end,
  RefreshRougeLikeRewardReddot = function(r0_59)
    -- line: [612, 628] id: 59
    r0_59:OnRefreshRougeLikeRewardReddot()
    if r0_59.RougeLike.WeeklyRewardId then
      local r1_59 = DataMgr.RougeLikeReward[r0_59.RougeLike.WeeklyRewardId]
      local r2_59 = r0_59.RougeLike.WeeklyTotalScore
      if r1_59 and r1_59.Reward and r1_59.EachGradePoints then
        local r3_59 = 0
        for r8_59, r9_59 in ipairs(r1_59.Reward) do
          if r1_59.EachGradePoints * r8_59 <= r2_59 and not r0_59:IsRougeLikeWeeklyRewardGot(r8_59) then
            r3_59 = r3_59 + 1
          end
        end
        -- close: r4_59
        ReddotManager.IncreaseLeafNodeCount("RougeLikeReward", r3_59)
      end
    end
  end,
  RougeLikeTryRecover = function(r0_60, r1_60)
    -- line: [630, 648] id: 60
    print(_G.LogTag, "RougeLikeTryRecover")
    r0_60:CallServer("RougeLikeTryRecover", function(r0_61, r1_61, r2_61)
      -- line: [632, 645] id: 61
      if not ErrorCode:Check(r0_61) then
        r0_60:ShowErrorByErrorCode("RougeLikeTryRecover", r0_61)
        return 
      end
      if not GWorld.RougeLikeManager then
        return 
      end
      if r1_60 then
        r1_60(r1_61, r2_61)
      end
    end)
  end,
  SelectStoryEvent = function(r0_62, r1_62, r2_62)
    -- line: [650, 667] id: 62
    r0_62:CallServer("SelectStoryEvent", function(r0_63)
      -- line: [651, 664] id: 63
      if not ErrorCode:Check(r0_63) then
        r0_62:ShowErrorByErrorCode("SelectStoryEvent", r0_63)
        return 
      end
      if not GWorld.RougeLikeManager then
        return 
      end
      if r2_62 then
        r2_62(r0_63)
      end
    end, r1_62)
  end,
  OnRougeLikeManualUpdate = function(r0_64, r1_64, r2_64)
    -- line: [669, 679] id: 64
    local r3_64 = require("BluePrints.UI.UI_PC.RougeLike.RougeAchive.Rouge_Archive_DataModel")
    if r3_64:CheckArchiveItemIsNew(r1_64, r2_64) then
      r3_64:IncreaseArchiveTypeReddot(r1_64)
    end
    r3_64:UpdateArchiveRewardReddot()
  end,
  NotifyTriggerRougeLikeStoryEvent = function(r0_65, r1_65)
    -- line: [681, 684] id: 65
    print(_G.LogTag, "NotifyTriggerRougeLikeStoryEvent", r1_65)
    r0_65:CallServerMethod("ClientTriggerRougeLikeStoryEvent", r1_65)
  end,
  ShowErrorByErrorCode = function(r0_66, r1_66, r2_66)
    -- line: [687, 705] id: 66
    if not GWorld.RougeLikeManager then
      return 
    end
    local r3_66 = {
      r1_66,
      r2_66,
      "\n"
    }
    GWorld.RougeLikeManager:FillErrorLog(r3_66)
    local r4_66 = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
    if r4_66 then
      r4_66:FillRougeLikeErrorLog(r3_66)
    end
    GWorld.RougeLikeManager:ShowRougeLikeError(table.concat(r3_66, " "))
  end,
}
