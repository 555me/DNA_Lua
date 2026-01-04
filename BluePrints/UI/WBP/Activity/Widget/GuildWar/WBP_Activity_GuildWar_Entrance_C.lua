-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Activity\Widget\GuildWar\WBP_Activity_GuildWar_Entrance_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("BluePrints.UI.WBP.Activity.Widget.EastSeason.EastSeasonQuestUtils")
local r1_0 = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local r2_0 = require("BluePrints.UI.WBP.Activity.ActivityReddotHelper")
local r3_0 = require("BluePrints.UI.WBP.Activity.Widget.GuildWar.GuildWarUtils")
local r4_0 = Class("BluePrints.UI.BP_EMUserWidget_C")
function r4_0.Construct(r0_1)
  -- line: [10, 29] id: 1
  EventManager:AddEvent(EventID.OnRaidRankInfoTopN, r0_1, r0_1.InitOnGetTopN)
  EventManager:AddEvent(EventID.OnRaidRankInfo, r0_1, r0_1.InitOnRankInfoSelf)
  EventManager:AddEvent(EventID.OnRaidRankStart, r0_1, r0_1.ShowRankingButton)
  EventManager:AddEvent(EventID.OnResourcesChanged, r0_1, r0_1.RefreshShopCoinQuantity)
  r0_1.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(r0_1)
  r0_1:AddInputMethodChangedListen()
  if not ReddotManager.GetTreeNode(r3_0.ReddotNodeKey) then
    ReddotManager.AddNodeEx(r3_0.ReddotNodeKey)
  end
  if not r0_1.AddListenerFinish then
    r0_1.AddListenerFinish = true
    ReddotManager.AddListener(r3_0.ReddotNodeKey, r0_1, r0_1.RefreshReddot)
    ReddotManager.AddListener(r3_0.ReddotRewardKey, r0_1, r0_1.RefreshQuestReddot)
  end
end
function r4_0.Destruct(r0_2)
  -- line: [31, 39] id: 2
  EventManager:RemoveEvent(EventID.OnRaidRankInfoTopN, r0_2)
  EventManager:RemoveEvent(EventID.OnRaidRankInfo, r0_2)
  EventManager:RemoveEvent(EventID.OnRaidRankStart, r0_2)
  r0_2:RemoveInputMethodChangedListen()
  ReddotManager.RemoveListener(r3_0.ReddotNodeKey, r0_2)
  ReddotManager.RemoveListener(r3_0.ReddotRewardKey, r0_2)
end
function r4_0.Init(r0_3, r1_3, r2_3, r3_3)
  -- line: [41, 81] id: 3
  r0_3.Avatar = r3_3
  r0_3.RootWidget = r0_3.ParentWidget and r0_3.ParentWidget.ParentWidget
  local r4_3 = r0_3.Avatar.RaidSeasons[r0_3.Avatar.CurrentRaidSeasonId]
  if not r4_3 then
    return 
  end
  r0_3.Entrance_Shop:Init(r0_3, r0_3.GoToShopClick, "RaidDungeon_Shop_Name", "X")
  r0_3.Entrance_Quest:Init(r0_3, r0_3.OnQuestBtnClicked, "RaidDungeon_Rank_Task", "Y")
  r0_3:ShowRankingButton()
  r0_3.EventId = r4_3.EventId
  local r5_3 = DataMgr.EventMain[r0_3.EventId]
  if r5_3 then
    r0_3.Entrance_Shop:SetTimeText(r5_3.EventEndTime)
  end
  r0_3.CoinId = r0_3:GetCoinIdByShop(r4_3.Shop)
  r0_3:RefreshShopCoinQuantity()
  r0_3.Entrance_Shop:SetCoinIconByShop(r0_3.CoinId)
  r0_3.ParentWidget.Group_BtnBuy:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_3:RefreshOpInfoByInputDevice(r0_3.GameInputModeSubsystem:GetCurrentInputType(), r0_3.GameInputModeSubsystem:GetCurrentGamepadName())
  if r0_3.ParentWidget and r0_3.ParentWidget.NotNeedShowButtonActivityId then
    r0_3.ParentWidget.NotNeedShowButtonActivityId[r0_3.EventId] = true
  end
  r0_3:RefreshReddot()
end
function r4_0.ShowRankingButton(r0_4)
  -- line: [83, 100] id: 4
  if not r3_0.IsPreRaidTime() then
    r0_4.Entrance_Ranking:Init(r0_4, r0_4.OnRankBtnClicked, "RaidDungeon_Rank", "RS")
    r0_4.Entrance_Ranking:SetVisibility(UIConst.VisibilityOp.Visible)
    local r1_4 = r0_4.Avatar.RaidSeasons[r0_4.Avatar.CurrentRaidSeasonId]
    if r1_4 and r1_4.PreRaidGroupId < 1 then
      r0_4.ForbidRank = true
      r0_4.Entrance_Ranking:SetForbiddenState(true)
    end
  else
    r0_4.Entrance_Ranking:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r4_0.RefreshReddot(r0_5)
  -- line: [103, 106] id: 5
  r0_5:RefreshShopReddot()
  r0_5:RefreshEntranceReddot()
end
function r4_0.RefreshShopReddot(r0_6)
  -- line: [109, 122] id: 6
  local r1_6 = ReddotManager.GetLeafNodeCacheDetail(r3_0.ReddotNodeKey)
  if not r1_6 or not r1_6[r0_6.EventId] then
    r0_6.Entrance_Shop:SetReddotVisibility("Collapsed")
    return 
  end
  if r1_6[r0_6.EventId][r3_0.ShopCacheKey] then
    r0_6.Entrance_Shop:SetReddotVisibility("SelfHitTestInvisible")
  else
    r0_6.Entrance_Shop:SetReddotVisibility("Collapsed")
  end
end
function r4_0.RefreshQuestReddot(r0_7, r1_7, r2_7, r3_7)
  -- line: [125, 131] id: 7
  if r1_7 > 0 then
    r0_7.Entrance_Quest:SetReddotVisibility("SelfHitTestInvisible")
  else
    r0_7.Entrance_Quest:SetReddotVisibility("Collapsed")
  end
end
function r4_0.RefreshEntranceReddot(r0_8)
  -- line: [134, 156] id: 8
  if not r3_0.IsRaidTime() then
    return 
  end
  local r1_8 = r0_8.ParentWidget.Btn_Confirm
  if not r1_8 then
    return 
  end
  local r2_8 = ReddotManager.GetLeafNodeCacheDetail(r3_0.ReddotNodeKey)
  if not r2_8 or not r2_8[r0_8.EventId] then
    r1_8:SetReddotVisibility(UIConst.VisibilityOp.Collapsed)
    return 
  end
  if r2_8[r0_8.EventId][r3_0.EntranceCacheKey] then
    r1_8:SetReddotVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    r1_8:SetReddotVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r4_0.GetCoinIdByShop(r0_9, r1_9)
  -- line: [159, 173] id: 9
  local r2_9 = nil
  for r7_9, r8_9 in pairs(DataMgr.ShopItem2ShopSubId.Resource[r1_9] and {}) do
    local r9_9 = r8_9[1]
    if r9_9 then
      r2_9 = r9_9.SubTabId
      break
    else
      break
    end
  end
  -- close: r3_9
  if not r2_9 then
    return 
  end
  return DataMgr.ShopTabSub[r2_9].TabCoin[1]
end
function r4_0.RefreshShopCoinQuantity(r0_10, r1_10)
  -- line: [176, 183] id: 10
  if r1_10 and r1_10 ~= r0_10.CoinId then
    return 
  end
  r0_10.Entrance_Shop:SetCoinQuantity(r0_10.Avatar:GetResourceNum(r0_10.CoinId))
  r3_0.RefreshShopReddot()
end
function r4_0.TryOpenRankTopN(r0_11)
  -- line: [186, 191] id: 11
  if r0_11.RankInfo and r0_11.TopNInfo and r0_11.OpenRankTag then
    r0_11.OpenRankTag = nil
    UIManager():LoadUINew("GuildWarRank", r0_11.RankInfo, r0_11.TopNInfo)
  end
end
function r4_0.InitOnGetTopN(r0_12, r1_12)
  -- line: [194, 199] id: 12
  r0_12.TopNInfo = r1_12 and {}
  if r0_12.OpenRankTag then
    r0_12:TryOpenRankTopN()
  end
end
function r4_0.InitOnRankInfoSelf(r0_13, r1_13)
  -- line: [202, 207] id: 13
  r0_13.RankInfo = r1_13 and {}
  if r0_13.OpenRankTag then
    r0_13:TryOpenRankTopN()
  end
end
function r4_0.OnRankBtnClicked(r0_14)
  -- line: [210, 239] id: 14
  if r0_14.ForbidRank then
    UIManager(r0_14):ShowUITip(UIConst.Tip_CommonToast, GText("RaidDungeon_PreRaid_Abandon_Toast"))
    return 
  end
  if not r0_14.RootWidget or not r0_14.RootWidget.BlockAllUIInput then
    return 
  end
  r0_14.OpenRankTag = true
  r0_14.RootWidget:BlockAllUIInput(true, "RaidSeasonGetRaidRankInfo")
  r0_14.Avatar:RaidSeasonGetRaidRankInfo(function(r0_15)
    -- line: [223, 229] id: 15
    r0_14.RootWidget:BlockAllUIInput(false, "RaidSeasonGetRaidRankInfo")
    if not ErrorCode:Check(r0_15) and r0_14 then
      r0_14.RankInfo = {}
      r0_14:TryOpenRankTopN()
    end
  end)
  r0_14.RootWidget:BlockAllUIInput(true, "RaidSeasonGetRaidRankTopN")
  r0_14.Avatar:RaidSeasonGetRaidRankTopN(function(r0_16)
    -- line: [232, 238] id: 16
    r0_14.RootWidget:BlockAllUIInput(false, "RaidSeasonGetRaidRankTopN")
    if not ErrorCode:Check(r0_16) and r0_14 then
      r0_14.TopNInfo = {}
      r0_14:TryOpenRankTopN()
    end
  end)
end
function r4_0.GoToShopClick(r0_17)
  -- line: [242, 248] id: 17
  local r1_17 = DataMgr.EventPortal[r0_17.EventId]
  if not r1_17.EventShop then
    return 
  end
  PageJumpUtils:JumpToTargetPageByJumpId(r1_17.EventShop)
end
function r4_0.OnQuestDialogClose(r0_18)
  -- line: [251, 253] id: 18
  r3_0.RefreshQuestReddot()
end
function r4_0.OnQuestBtnClicked(r0_19)
  -- line: [256, 268] id: 19
  r3_0.RefreshQuestReddot(true)
  if GWorld:GetAvatar().CommonQuestActivity[r0_19.EventId] then
    local r2_19 = r0_19:MakeRaidRewardData(r0_19.EventId)
    r2_19.Title = GText("RaidDungeon_Rank_Task")
    r2_19.CloseBtnCallbackFunction = r0_19.OnQuestDialogClose
    UIManager(GWorld.GameInstance):ShowCommonPopupUI(100173, r2_19, GWorld.GameInstance)
  else
    UIManager(r0_19):ShowUITip(UIConst.Tip_CommonToast, GText("无法获取任务数据"))
  end
end
function r4_0.MakeRaidRewardData(r0_20, r1_20)
  -- line: [271, 370] id: 20
  local r2_20 = GWorld:GetAvatar()
  local r3_20 = {
    ConfigData = {},
  }
  r3_20.ConfigData.TabInfo = {}
  r3_20.ConfigData.Items = {}
  r3_20.ConfigData.HasTab = true
  r3_20.ConfigData.Datas = {}
  local r4_20 = {}
  for r9_20, r10_20 in pairs(DataMgr.CommonQuestPhase) do
    if r10_20.EventId == r1_20 then
      table.insert(r4_20, r10_20)
    end
  end
  -- close: r5_20
  table.sort(r4_20, function(r0_21, r1_21)
    -- line: [285, 287] id: 21
    return r0_21.Index < r1_21.Index
  end)
  for r9_20, r10_20 in pairs(r4_20) do
    local r11_20 = r10_20.QuestPhaseId
    local r12_20 = 1
    if r10_20.EventId == r1_20 then
      local r13_20 = {
        Index = r12_20,
      }
      r12_20 = r12_20 + 1
      r13_20.Type = r11_20
      r13_20.Title = r10_20.QuestPhaseName
      r13_20.ReddotName = "RaidReward"
      r13_20.IconPath = r10_20.SplineBP
      r13_20.IsShowIcon = true
      table.insert(r3_20.ConfigData.TabInfo, r13_20)
      local r14_20 = {
        ShowIcon = false,
      }
      r14_20.NowNum, r14_20.NumMax = r0_0:GetQuestPhaseInfo(r1_20, r11_20)
      r14_20.ReceiveAllCallBack = r0_20.GetAllRaidRewards
      r14_20.ReceiveAllParam = {}
      r14_20.ReceiveAllParam.EventId = r1_20
      r14_20.ReceiveAllParam.QuestPhaseId = r11_20
      r14_20.Type = r11_20
      r14_20.Text_Total = string.format(GText("Abyss_RewardList_Title"))
      r14_20.ReceiveButtonText = GText("UI_Archive_CollectionClaimAll")
      local r15_20 = r2_20.CommonQuestActivity[r1_20]
      if not r15_20 then
        DebugPrint("Avatar.CommonQuestActivity is nil, EvantId: ", r1_20)
        return 
      end
      local r16_20 = {}
      for r21_20, r22_20 in pairs(DataMgr.CommonQuestDetail) do
        if r22_20.QuestPhaseId == r11_20 then
          local r23_20 = {
            ItemId = r21_20,
          }
          local r24_20 = r15_20[r21_20].Progress
          if r15_20[r21_20].Target <= r24_20 then
            r24_20 = r15_20[r21_20].RewardsGot == false
          else
            goto label_135	-- block#12 is visited secondly
          end
          r23_20.CanReceive = r24_20
          r23_20.Type = r11_20
          r23_20.RewardsGot = r15_20[r21_20].RewardsGot
          r23_20.NotreachText = GText("UI_Archive_CollectionInProgress")
          r23_20.Hint = GText(r22_20.StarterQuestDes)
          r23_20.ReddotName = "RaidReward"
          r23_20.ReceiveButtonText = GText("UI_Archive_CollectionClaim")
          r23_20.Num = r22_20.Target
          r23_20.ReceiveCallBack = r0_20.GetRaidReward
          r23_20.ReceiveParm = {}
          r23_20.ReceiveParm.QuestId = r21_20
          r23_20.ReceiveParm.EventId = r1_20
          r24_20 = {}
          for r29_20, r30_20 in ipairs(r22_20.QuestReward) do
            local r31_20 = DataMgr.Reward[r30_20]
            if r31_20 then
              local r32_20 = r31_20.Id and {}
              local r33_20 = r31_20.Count and {}
              local r34_20 = r31_20.Type and {}
              for r38_20 = 1, #r32_20, 1 do
                local r39_20 = r32_20[r38_20]
                table.insert(r24_20, {
                  ItemType = r34_20[r38_20],
                  ItemId = r39_20,
                  Count = RewardUtils:GetCount(r33_20[r38_20]),
                  Rarity = ItemUtils.GetItemRarity(r39_20, r34_20[r38_20]),
                })
              end
            end
          end
          -- close: r25_20
          r23_20.Rewards = r24_20
          table.insert(r16_20, r23_20)
        end
      end
      -- close: r17_20
      table.sort(r16_20, function(r0_22, r1_22)
        -- line: [360, 362] id: 22
        return r0_22.Num < r1_22.Num
      end)
      r14_20.Items = r16_20
      r3_20.ConfigData.Datas[r11_20] = r14_20
    end
  end
  -- close: r5_20
  r3_20.ConfigData.Type = r3_20.ConfigData.TabInfo[1].Type
  r3_20.ConfigData.ReddotName = "RaidReward"
  return r3_20
end
function r4_0.GetAllRaidRewards(r0_23, r1_23)
  -- line: [372, 404] id: 23
  local r2_23 = GWorld:GetAvatar()
  if r2_23 then
    r2_23:CommonQuestActivityGetPhaseReward(function(r0_24, r1_24)
      -- line: [375, 401] id: 24
      DebugPrint("@@@Raid GetAllRewards CallBack")
      local r2_24 = false
      local r3_24 = r2_23.CommonQuestActivity[r1_23.EventId]
      for r7_24 = 0, r1_23.SelfWidget.List_Item:GetNumItems() + -1, 1 do
        local r8_24 = r1_23.SelfWidget.List_Item:GetItemAt(r7_24)
        if r8_24 then
          local r9_24 = r3_24[r8_24.ConfigData.ReceiveParm.QuestId].Progress
          if r3_24[r8_24.ConfigData.ReceiveParm.QuestId].Target <= r9_24 then
            r9_24 = r3_24[r8_24.ConfigData.ReceiveParm.QuestId].RewardsGot == false
          else
            goto label_42	-- block#4 is visited secondly
          end
          local r10_24 = r3_24[r8_24.ConfigData.ReceiveParm.QuestId].RewardsGot
          if r9_24 and not r10_24 then
            r2_24 = true
          end
          DebugPrint("@@@Raid GetAllRewards ,Type,ItemId,CanReceive,IsGot", r8_24.ConfigData.Type, r8_24.ConfigData.ItemId, r9_24, r10_24)
          r8_24.ConfigData.CanReceive = r9_24
          r8_24.ConfigData.RewardsGot = r10_24
          if r8_24.SelfWidget then
            r8_24.SelfWidget:RefreshBtn(r10_24)
          end
        end
      end
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, r1_24, false, function()
        -- line: [395, 397] id: 25
        r1_23.SelfWidget:SetFocus()
      end, r1_23.SelfWidget)
      r1_23.SelfWidget:RefreshButton(r2_24)
      DebugPrint("@@@hRaid GetAllRewards HaveReWardToGet", r2_24)
      r1_23.SelfWidget:RefreshReddotInfo()
    end, r1_23.EventId, r1_23.QuestPhaseId)
  end
end
function r4_0.GetRaidReward(r0_26, r1_26)
  -- line: [406, 441] id: 26
  local r2_26 = GWorld:GetAvatar()
  if r2_26 then
    r2_26:CommonQuestActivityGetReward(function(r0_27, r1_27)
      -- line: [409, 438] id: 27
      if not ErrorCode:Check(r0_27) then
        return 
      end
      DebugPrint("@@@Raid GetReward CallBack")
      local r2_27 = false
      local r3_27 = r2_26.CommonQuestActivity[r1_26.ConfigData.ReceiveParm.EventId]
      for r7_27 = 0, r1_26.Owner.List_Item:GetNumItems() + -1, 1 do
        local r8_27 = r1_26.Owner.List_Item:GetItemAt(r7_27)
        if r8_27 then
          local r9_27 = r3_27[r8_27.ConfigData.ReceiveParm.QuestId].Progress
          if r3_27[r8_27.ConfigData.ReceiveParm.QuestId].Target <= r9_27 then
            r9_27 = r3_27[r8_27.ConfigData.ReceiveParm.QuestId].RewardsGot == false
          else
            goto label_51	-- block#6 is visited secondly
          end
          local r10_27 = r3_27[r8_27.ConfigData.ReceiveParm.QuestId].RewardsGot
          if r9_27 and not r10_27 then
            r2_27 = true
          end
          DebugPrint("@@@Raid GetReward ,Type,ItemId,CanReceive,IsGot", r8_27.ConfigData.Type, r8_27.ConfigData.ItemId, r9_27, r10_27)
          r8_27.ConfigData.CanReceive = r9_27
          r8_27.ConfigData.RewardsGot = r10_27
          if r8_27.SelfWidget then
            r8_27.SelfWidget:RefreshBtn(r10_27)
          end
        end
      end
      r1_26.SelfWidget:RefreshReddotInfo()
      r1_26.Owner:RefreshButton(r2_27)
      DebugPrint("@@@Raid GetReward HaveReWardToGet", r2_27)
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, r1_27, false, function()
        -- line: [435, 437] id: 28
        r1_26.SelfWidget:SetFocus()
      end, r1_26.SelfWidget)
    end, r1_26.ConfigData.ReceiveParm.EventId, r1_26.ConfigData.ReceiveParm.QuestId)
  end
end
function r4_0.AddInputMethodChangedListen(r0_29)
  -- line: [444, 448] id: 29
  if IsValid(r0_29.GameInputModeSubsystem) then
    r0_29.GameInputModeSubsystem.OnInputMethodChanged:Add(r0_29, r0_29.RefreshOpInfoByInputDevice)
  end
end
function r4_0.RemoveInputMethodChangedListen(r0_30)
  -- line: [450, 454] id: 30
  if IsValid(r0_30.GameInputModeSubsystem) then
    r0_30.GameInputModeSubsystem.OnInputMethodChanged:Remove(r0_30, r0_30.RefreshOpInfoByInputDevice)
  end
end
function r4_0.RefreshOpInfoByInputDevice(r0_31, r1_31, r2_31)
  -- line: [456, 463] id: 31
  if r1_31 == ECommonInputType.MouseAndKeyboard then
    r0_31:SetGamepadView(false)
  elseif r1_31 == ECommonInputType.Gamepad then
    r0_31:SetGamepadView(true)
  end
end
function r4_0.SetGamepadView(r0_32, r1_32)
  -- line: [465, 470] id: 32
  local r2_32 = nil	-- notice: implicit variable refs by block#[3]
  if r1_32 then
    r2_32 = "SelfHitTestInvisible"
    if not r2_32 then
      ::label_5::
      r2_32 = "Collapsed"
    end
  else
    goto label_5	-- block#2 is visited secondly
  end
  r0_32.Entrance_Ranking:SetGamepadVisibility(r2_32)
  r0_32.Entrance_Shop:SetGamepadVisibility(r2_32)
  r0_32.Entrance_Quest:SetGamepadVisibility(r2_32)
end
function r4_0.HandleKeyDownOnGamePad(r0_33, r1_33)
  -- line: [472, 485] id: 33
  local r2_33 = false
  if r1_33 == UIConst.GamePadKey.RightThumb and not r3_0.IsPreRaidTime() then
    r2_33 = true
    r0_33:OnRankBtnClicked()
  elseif r1_33 == UIConst.GamePadKey.FaceButtonTop then
    r2_33 = true
    r0_33:OnQuestBtnClicked()
  end
  return r2_33
end
return r4_0
