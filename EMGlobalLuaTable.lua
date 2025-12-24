-- filename: @C:/Pack/Branch/geili11\Content/Script/EMGlobalLuaTable.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("Utils.MiscUtils")
local r1_0 = require("Utils.HeroUSDKUtils")
local r2_0 = {
  TriggerBattleEvent = function(r0_1, r1_1, ...)
    -- line: [7, 10] id: 1
    r0_1:TriggerLuaBattleEvent(r1_1, ...)
  end,
  TriggerEventManager = function(r0_2, ...)
    -- line: [12, 16] id: 2
    EventManager:FireEvent(r0_2, ...)
  end,
  RemoveEvent = function(r0_3, r1_3)
    -- line: [18, 20] id: 3
    EventManager:RemoveEvent(r0_3, r1_3)
  end,
  TriggerDungeonComponentFun = function(r0_4, r1_4, ...)
    -- line: [22, 26] id: 4
    if r0_4 and r1_4 then
      r0_4:TriggerDungeonComponentFun(r1_4, ...)
    end
  end,
  SkillUtilsSplitEval = function(r0_5)
    -- line: [28, 31] id: 5
    return require("Utils.SkillUtils").SplitEval(r0_5, "$")
  end,
  GetTaskTargetPointPos = function()
    -- line: [33, 40] id: 6
    local r1_6 = GWorld.GameInstance:GetGameUIManager():GetUIObj("TaskIndicator")
    if IsValid(r1_6) and r1_6.TargetPointPos ~= nil then
      return r1_6.TargetPointPos
    end
    return UE4.FVector(0, 0, 0)
  end,
  GetTransEPhysicalSurface = function(r0_7)
    -- line: [42, 44] id: 7
    return r0_0.TransEPhysicalSurface(r0_7)
  end,
  ShowRougeLikeError = function(r0_8)
    -- line: [46, 49] id: 8
    require("BluePrints.GameMode.BP_RougeLikeManager_C"):ShowRougeLikeError(r0_8)
  end,
  MakeTempFlexibleMap = function(r0_9)
    -- line: [52, 63] id: 9
    local r1_9 = {}
    local r2_9 = r0_9:Num()
    for r7_9, r8_9 in pairs(r0_9) do
      r1_9[r2_9] = {
        NpcArray = r7_9,
        IsHide = r8_9,
      }
      r2_9 = r2_9 + -1
    end
    -- close: r3_9
    return r1_9
  end,
  CustomNpcFlexibShow = function(r0_10)
    -- line: [66, 153] id: 10
    local r1_10 = GWorld:GetAvatar()
    if not r1_10 then
      return true
    end
    local r2_10 = r2_0.MakeTempFlexibleMap(r0_10)
    for r6_10 = 1, r0_10:Num(), 1 do
      local r7_10 = r2_10[r6_10].NpcArray.Quest.QuestId
      local r8_10 = r2_10[r6_10].NpcArray.Quest.MyQuestState
      local r9_10 = r2_10[r6_10].NpcArray.ImpressionTalk.TalkTriggerId
      local r10_10 = r2_10[r6_10].NpcArray.ImpressionTalk.TalkQuestState
      local r11_10 = r2_10[r6_10].NpcArray.QuestChain.QuestChainId
      local r12_10 = r2_10[r6_10].NpcArray.QuestChain.QuestChainState
      if r2_10[r6_10].NpcArray.EditableStructType == 0 then
        local r13_10 = tonumber(string.sub(r7_10, 1, 6))
        local r14_10 = {
          Doing = 1,
          Success = 2,
        }
        if r1_10.QuestChains[r13_10] then
          local r15_10 = r1_10.QuestChains[r13_10]
          if r8_10 == r14_10.Doing and r15_10.DoingQuestId == r7_10 then
            return r2_10[r6_10].IsHide
          elseif r8_10 == r14_10.Success and r15_10:CheckQuestIdComplete(r7_10) then
            return r2_10[r6_10].IsHide
          end
        end
      elseif r2_10[r6_10].NpcArray.EditableStructType == 1 then
        local r13_10 = {
          Compelete = 0,
          UnCompelete = 1,
          CheckSuccess = 2,
          CheckFail = 3,
        }
        if r10_10 == r13_10.Compelete and r1_10:IsStorylineComplete(r9_10) then
          return r2_10[r6_10].IsHide
        elseif r10_10 == r13_10.UnCompelete and r1_10:IsStorylineUnComplete(r9_10) then
          return r2_10[r6_10].IsHide
        elseif r10_10 == r13_10.CheckSuccess and r1_10:IsStorylineSuccess(r9_10) then
          return r2_10[r6_10].IsHide
        elseif r10_10 == r13_10.CheckFail and r1_10:IsStorylineFailure(r9_10) then
          return r2_10[r6_10].IsHide
        end
      elseif r2_10[r6_10].NpcArray.EditableStructType == 2 then
        local r13_10 = {
          Doing = 1,
          Success = 2,
        }
        if r1_10.QuestChains[r11_10] then
          local r14_10 = r1_10.QuestChains[r11_10]
          if r12_10 == r13_10.Doing and r14_10:IsDoing() then
            return r2_10[r6_10].IsHide
          elseif r12_10 == r13_10.Success and r14_10:IsFinish() then
            return r2_10[r6_10].IsHide
          end
        end
      end
    end
    return true
  end,
  GenerateEnhanceLogName = function()
    -- line: [155, 171] id: 11
    local r1_11 = os.date("%Y_%m_%d_%H_%M", os.time())
    local r2_11 = r1_0.GetUserInfo().sdkUserId
    if r2_11 ~= "" then
      r1_11 = string.format("%s-%s", r1_11, r2_11)
    end
    local r3_11 = GWorld:GetAvatar()
    if r3_11 then
      r1_11 = string.format("%s-%d", r1_11, r3_11.Uid)
    end
    return r1_11
  end,
  ShowEnhanceLogUploadTip = function(...)
    -- line: [173, 184] id: 12
    local r0_12 = {
      ...
    }
    local r1_12 = r0_12[1]
    local r2_12 = r0_12[2]
    if r1_12 == UE4.EUploadEnhanceLogResult.Success then
      UIManager(self):ShowUITip(UIConst.Tip_CommonToast, string.format(GText("UI_Opition_Log_Finish"), r2_12))
    else
      UIManager(self):ShowUITip(UIConst.Tip_CommonToast, string.format(GText("UI_Opition_Log_UpdateFail"), tostring(r1_12)))
    end
  end,
  ShowClearLogTip = function()
    -- line: [186, 188] id: 13
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Opition_Log_Cleand"))
  end,
  CustomNpcAtmosShow = function(r0_14)
    -- line: [191, 210] id: 14
    if r0_14:Num() == 0 then
      return true
    end
    local r1_14 = GWorld:GetAvatar()
    if r1_14 then
      local r2_14 = r1_14.Suits:GetSuitBase(CommonConst.SuitType.PlayerCharacterSuit)
      if r2_14 and r2_14:GetSubSuitBase(CommonConst.PlayerCharacterSuit.NpcHideShowTag) then
        for r8_14, r9_14 in pairs(r2_14:GetSubSuitBase(CommonConst.PlayerCharacterSuit.NpcHideShowTag)) do
          if r0_14:Contains(r8_14) and r9_14 == true then
            return false
          end
        end
        -- close: r4_14
      end
    end
    return true
  end,
}
return r2_0
