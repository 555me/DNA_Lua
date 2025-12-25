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
function r4_0.OnShopClose(r0_17)
  -- line: [242, 245] id: 17
  r0_17:RefreshShopCoinQuantity()
  r3_0.RefreshShopReddot()
end
function r4_0.GoToShopClick(r0_18)
  -- line: [248, 254] id: 18
  local r1_18 = DataMgr.EventPortal[r0_18.EventId]
  if not r1_18.EventShop then
    return 
  end
  PageJumpUtils:JumpToTargetPageByJumpId(r1_18.EventShop, r0_18.OnShopClose, r0_18)
end
function r4_0.OnQuestDialogClose(r0_19)
  -- line: [257, 259] id: 19
  r3_0.RefreshQuestReddot()
end
function r4_0.OnQuestBtnClicked(r0_20)
  -- line: [262, 274] id: 20
  r3_0.RefreshQuestReddot(true)
  if GWorld:GetAvatar().CommonQuestActivity[r0_20.EventId] then
    local r2_20 = r0_20:MakeRaidRewardData(r0_20.EventId)
    r2_20.Title = GText("RaidDungeon_Rank_Task")
    r2_20.CloseBtnCallbackFunction = r0_20.OnQuestDialogClose
    UIManager(GWorld.GameInstance):ShowCommonPopupUI(100173, r2_20, GWorld.GameInstance)
  else
    UIManager(r0_20):ShowUITip(UIConst.Tip_CommonToast, GText("无法获取任务数据"))
  end
end
function r4_0.MakeRaidRewardData(r0_21, r1_21)
  -- line: [277, 376] id: 21
  local r2_21 = GWorld:GetAvatar()
  local r3_21 = {
    ConfigData = {},
  }
  r3_21.ConfigData.TabInfo = {}
  r3_21.ConfigData.Items = {}
  r3_21.ConfigData.HasTab = true
  r3_21.ConfigData.Datas = {}
  local r4_21 = {}
  for r9_21, r10_21 in pairs(DataMgr.CommonQuestPhase) do
    if r10_21.EventId == r1_21 then
      table.insert(r4_21, r10_21)
    end
  end
  -- close: r5_21
  table.sort(r4_21, function(r0_22, r1_22)
    -- line: [291, 293] id: 22
    return r0_22.Index < r1_22.Index
  end)
  for r9_21, r10_21 in pairs(r4_21) do
    local r11_21 = r10_21.QuestPhaseId
    local r12_21 = 1
    if r10_21.EventId == r1_21 then
      local r13_21 = {
        Index = r12_21,
      }
      r12_21 = r12_21 + 1
      r13_21.Type = r11_21
      r13_21.Title = r10_21.QuestPhaseName
      r13_21.ReddotName = "RaidReward"
      r13_21.IconPath = r10_21.SplineBP
      r13_21.IsShowIcon = true
      table.insert(r3_21.ConfigData.TabInfo, r13_21)
      local r14_21 = {
        ShowIcon = false,
      }
      r14_21.NowNum, r14_21.NumMax = r0_0:GetQuestPhaseInfo(r1_21, r11_21)
      r14_21.ReceiveAllCallBack = r0_21.GetAllRaidRewards
      r14_21.ReceiveAllParam = {}
      r14_21.ReceiveAllParam.EventId = r1_21
      r14_21.ReceiveAllParam.QuestPhaseId = r11_21
      r14_21.Type = r11_21
      r14_21.Text_Total = string.format(GText("Abyss_RewardList_Title"))
      r14_21.ReceiveButtonText = GText("UI_Archive_CollectionClaimAll")
      local r15_21 = r2_21.CommonQuestActivity[r1_21]
      if not r15_21 then
        DebugPrint("Avatar.CommonQuestActivity is nil, EvantId: ", r1_21)
        return 
      end
      local r16_21 = {}
      for r21_21, r22_21 in pairs(DataMgr.CommonQuestDetail) do
        if r22_21.QuestPhaseId == r11_21 then
          local r23_21 = {
            ItemId = r21_21,
          }
          local r24_21 = r15_21[r21_21].Progress
          if r15_21[r21_21].Target <= r24_21 then
            r24_21 = r15_21[r21_21].RewardsGot == false
          else
            goto label_135	-- block#12 is visited secondly
          end
          r23_21.CanReceive = r24_21
          r23_21.Type = r11_21
          r23_21.RewardsGot = r15_21[r21_21].RewardsGot
          r23_21.NotreachText = GText("UI_Archive_CollectionInProgress")
          r23_21.Hint = GText(r22_21.StarterQuestDes)
          r23_21.ReddotName = "RaidReward"
          r23_21.ReceiveButtonText = GText("UI_Archive_CollectionClaim")
          r23_21.Num = r22_21.Target
          r23_21.ReceiveCallBack = r0_21.GetRaidReward
          r23_21.ReceiveParm = {}
          r23_21.ReceiveParm.QuestId = r21_21
          r23_21.ReceiveParm.EventId = r1_21
          r24_21 = {}
          for r29_21, r30_21 in ipairs(r22_21.QuestReward) do
            local r31_21 = DataMgr.Reward[r30_21]
            if r31_21 then
              local r32_21 = r31_21.Id and {}
              local r33_21 = r31_21.Count and {}
              local r34_21 = r31_21.Type and {}
              for r38_21 = 1, #r32_21, 1 do
                local r39_21 = r32_21[r38_21]
                table.insert(r24_21, {
                  ItemType = r34_21[r38_21],
                  ItemId = r39_21,
                  Count = RewardUtils:GetCount(r33_21[r38_21]),
                  Rarity = ItemUtils.GetItemRarity(r39_21, r34_21[r38_21]),
                })
              end
            end
          end
          -- close: r25_21
          r23_21.Rewards = r24_21
          table.insert(r16_21, r23_21)
        end
      end
      -- close: r17_21
      table.sort(r16_21, function(r0_23, r1_23)
        -- line: [366, 368] id: 23
        return r0_23.Num < r1_23.Num
      end)
      r14_21.Items = r16_21
      r3_21.ConfigData.Datas[r11_21] = r14_21
    end
  end
  -- close: r5_21
  r3_21.ConfigData.Type = r3_21.ConfigData.TabInfo[1].Type
  r3_21.ConfigData.ReddotName = "RaidReward"
  return r3_21
end
function r4_0.GetAllRaidRewards(r0_24, r1_24)
  -- line: [378, 410] id: 24
  local r2_24 = GWorld:GetAvatar()
  if r2_24 then
    r2_24:CommonQuestActivityGetPhaseReward(function(r0_25, r1_25)
      -- line: [381, 407] id: 25
      DebugPrint("@@@Raid GetAllRewards CallBack")
      local r2_25 = false
      local r3_25 = r2_24.CommonQuestActivity[r1_24.EventId]
      for r7_25 = 0, r1_24.SelfWidget.List_Item:GetNumItems() + -1, 1 do
        local r8_25 = r1_24.SelfWidget.List_Item:GetItemAt(r7_25)
        if r8_25 then
          local r9_25 = r3_25[r8_25.ConfigData.ReceiveParm.QuestId].Progress
          if r3_25[r8_25.ConfigData.ReceiveParm.QuestId].Target <= r9_25 then
            r9_25 = r3_25[r8_25.ConfigData.ReceiveParm.QuestId].RewardsGot == false
          else
            goto label_42	-- block#4 is visited secondly
          end
          local r10_25 = r3_25[r8_25.ConfigData.ReceiveParm.QuestId].RewardsGot
          if r9_25 and not r10_25 then
            r2_25 = true
          end
          DebugPrint("@@@Raid GetAllRewards ,Type,ItemId,CanReceive,IsGot", r8_25.ConfigData.Type, r8_25.ConfigData.ItemId, r9_25, r10_25)
          r8_25.ConfigData.CanReceive = r9_25
          r8_25.ConfigData.RewardsGot = r10_25
          if r8_25.SelfWidget then
            r8_25.SelfWidget:RefreshBtn(r10_25)
          end
        end
      end
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, r1_25, false, function()
        -- line: [401, 403] id: 26
        r1_24.SelfWidget:SetFocus()
      end, r1_24.SelfWidget)
      r1_24.SelfWidget:RefreshButton(r2_25)
      DebugPrint("@@@hRaid GetAllRewards HaveReWardToGet", r2_25)
      r1_24.SelfWidget:RefreshReddotInfo()
    end, r1_24.EventId, r1_24.QuestPhaseId)
  end
end
function r4_0.GetRaidReward(r0_27, r1_27)
  -- line: [412, 447] id: 27
  local r2_27 = GWorld:GetAvatar()
  if r2_27 then
    r2_27:CommonQuestActivityGetReward(function(r0_28, r1_28)
      -- line: [415, 444] id: 28
      if not ErrorCode:Check(r0_28) then
        return 
      end
      DebugPrint("@@@Raid GetReward CallBack")
      local r2_28 = false
      local r3_28 = r2_27.CommonQuestActivity[r1_27.ConfigData.ReceiveParm.EventId]
      for r7_28 = 0, r1_27.Owner.List_Item:GetNumItems() + -1, 1 do
        local r8_28 = r1_27.Owner.List_Item:GetItemAt(r7_28)
        if r8_28 then
          local r9_28 = r3_28[r8_28.ConfigData.ReceiveParm.QuestId].Progress
          if r3_28[r8_28.ConfigData.ReceiveParm.QuestId].Target <= r9_28 then
            r9_28 = r3_28[r8_28.ConfigData.ReceiveParm.QuestId].RewardsGot == false
          else
            goto label_51	-- block#6 is visited secondly
          end
          local r10_28 = r3_28[r8_28.ConfigData.ReceiveParm.QuestId].RewardsGot
          if r9_28 and not r10_28 then
            r2_28 = true
          end
          DebugPrint("@@@Raid GetReward ,Type,ItemId,CanReceive,IsGot", r8_28.ConfigData.Type, r8_28.ConfigData.ItemId, r9_28, r10_28)
          r8_28.ConfigData.CanReceive = r9_28
          r8_28.ConfigData.RewardsGot = r10_28
          if r8_28.SelfWidget then
            r8_28.SelfWidget:RefreshBtn(r10_28)
          end
        end
      end
      r1_27.SelfWidget:RefreshReddotInfo()
      r1_27.Owner:RefreshButton(r2_28)
      DebugPrint("@@@Raid GetReward HaveReWardToGet", r2_28)
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, r1_28, false, function()
        -- line: [441, 443] id: 29
        r1_27.SelfWidget:SetFocus()
      end, r1_27.SelfWidget)
    end, r1_27.ConfigData.ReceiveParm.EventId, r1_27.ConfigData.ReceiveParm.QuestId)
  end
end
function r4_0.AddInputMethodChangedListen(r0_30)
  -- line: [450, 454] id: 30
  if IsValid(r0_30.GameInputModeSubsystem) then
    r0_30.GameInputModeSubsystem.OnInputMethodChanged:Add(r0_30, r0_30.RefreshOpInfoByInputDevice)
  end
end
function r4_0.RemoveInputMethodChangedListen(r0_31)
  -- line: [456, 460] id: 31
  if IsValid(r0_31.GameInputModeSubsystem) then
    r0_31.GameInputModeSubsystem.OnInputMethodChanged:Remove(r0_31, r0_31.RefreshOpInfoByInputDevice)
  end
end
function r4_0.RefreshOpInfoByInputDevice(r0_32, r1_32, r2_32)
  -- line: [462, 469] id: 32
  if r1_32 == ECommonInputType.MouseAndKeyboard then
    r0_32:SetGamepadView(false)
  elseif r1_32 == ECommonInputType.Gamepad then
    r0_32:SetGamepadView(true)
  end
end
function r4_0.SetGamepadView(r0_33, r1_33)
  -- line: [471, 476] id: 33
  local r2_33 = nil	-- notice: implicit variable refs by block#[3]
  if r1_33 then
    r2_33 = "SelfHitTestInvisible"
    if not r2_33 then
      ::label_5::
      r2_33 = "Collapsed"
    end
  else
    goto label_5	-- block#2 is visited secondly
  end
  r0_33.Entrance_Ranking:SetGamepadVisibility(r2_33)
  r0_33.Entrance_Shop:SetGamepadVisibility(r2_33)
  r0_33.Entrance_Quest:SetGamepadVisibility(r2_33)
end
function r4_0.HandleKeyDownOnGamePad(r0_34, r1_34)
  -- line: [478, 491] id: 34
  local r2_34 = false
  if r1_34 == UIConst.GamePadKey.RightThumb and not r3_0.IsPreRaidTime() then
    r2_34 = true
    r0_34:OnRankBtnClicked()
  elseif r1_34 == UIConst.GamePadKey.FaceButtonTop then
    r2_34 = true
    r0_34:OnQuestBtnClicked()
  end
  return r2_34
end
return r4_0
