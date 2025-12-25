-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\UI_PC\Abyss\WBP_Abyss_Main_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("Utils.TimeUtils")
local r1_0 = require("EMCache.EMCache")
local r2_0 = Class("BluePrints.UI.BP_UIState_C")
function r2_0.Construct(r0_1)
  -- line: [7, 14] id: 1
  r0_1.CurFocusedLevel = nil
  r0_1.NodeLevelContent = nil
  r0_1.LastLevelContent = nil
  r0_1.CanJump = false
  r0_1.AbyssMainInitFinished = false
  r0_1.Super.Construct(r0_1)
end
function r2_0.Destruct(r0_2)
  -- line: [16, 20] id: 2
  r0_2:DestructMgr()
  r0_2:DestructAbyssMain()
  r0_2.Super.Destruct(r0_2)
end
function r2_0.OnLoaded(r0_3, ...)
  -- line: [22, 28] id: 3
  local r3_3 = nil	-- notice: implicit variable refs by block#[0]
  local r2_3 = nil	-- notice: implicit variable refs by block#[0]
  local r1_3 = nil	-- notice: implicit variable refs by block#[0]
  r0_3.Super.OnLoaded(r0_3, ...)
  ... = ... -- error: untaken top expr
  r0_3.IsFromActivity = r3_3
  r0_3:InitMgr()
  r0_3:InitAbyssMain(r1_3, r2_3)
end
function r2_0.InitAbyssMain(r0_4, r1_4, r2_4)
  -- line: [30, 36] id: 4
  if not r2_4 then
    r0_4:InitInfo(r1_4)
  end
  r0_4:OpenSubUI({
    Idx = "AbyssMain",
  }, r2_4)
  r0_4:ShowReviewPopUp()
end
function r2_0.DestructAbyssMain(r0_5)
  -- line: [38, 50] id: 5
  if r0_5.FirstTimer then
    r0_5:RemoveTimer(r0_5.FirstTimer)
    r0_5.FirstTimer = nil
  end
  if r0_5.ScrollTimer then
    r0_5:RemoveTimer(r0_5.ScrollTimer)
    r0_5.ScrollTimer = nil
  end
  r0_5:ClearListenEvent()
  r0_5.List_Level:ClearListItems()
  AudioManager(r0_5):StopSound(r0_5, "AbyssMainOpenSound")
end
function r2_0.SwitchIn(r0_6, r1_6, r2_6, r3_6)
  -- line: [52, 67] id: 6
  if not r1_6 and not r0_6.AbyssMainInitFinished then
    r0_6:InitInfo(r2_6)
  end
  r0_6:InitTable()
  if r0_6:IsAnyAnimationPlaying() then
    r0_6:StopAllAnimations()
  end
  AudioManager(r0_6):PlayUISound(r0_6, "event:/ui/activity/open", "AbyssMainOpenSound", nil)
  if r3_6 then
    r0_6:PlayAnimation(r0_6.Back)
  else
    r0_6:PlayAnimation(r0_6.In)
  end
  r0_6.Main:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end
function r2_0.SwitchOut(r0_7)
  -- line: [69, 82] id: 7
  r0_7.Main:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  r0_7.Tip_Fragment:Hide()
  if not r0_7.BindOutAnimation then
    r0_7:BindToAnimationFinished(r0_7.Out, {
      r0_7,
      function()
        -- line: [73, 75] id: 8
        r0_7.Main:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
    })
    r0_7.BindOutAnimation = true
  end
  AudioManager(r0_7):SetEventSoundParam(r0_7, "AbyssMainOpenSound", {
    ToEnd = 1,
  })
  AudioManager(r0_7):StopSound(r0_7, "AbyssMainOpenSound")
  r0_7:PlayAnimation(r0_7.Out)
end
function r2_0.SetRewardParams(r0_9)
  -- line: [84, 212] id: 9
  r0_9.Params = {}
  local r1_9 = {
    Items = {},
    ShowIcon = true,
    IconPath = "PaperSprite\'/Game/UI/Texture/Static/Atlas/Abyss/T_Abyss_Star02.T_Abyss_Star02\'",
    Text_Total = "Abyss_RewardProgress_Difficulty",
    ReceiveAllCallBack = r0_9.GetAllRewards,
    ReceiveAllParam = {
      SelectAbyssId = r0_9.SelectAbyssId,
    },
    SortType = 2,
    Rewards = {},
    NowNum = 0,
    NumMax = 0,
    ReceiveButtonText = "UI_Achievement_GetAllReward",
  }
  local r2_9 = GWorld:GetAvatar()
  if r2_9 then
    local r3_9 = r2_9.Abysses[r0_9.SelectAbyssId]
    if DataMgr.AbyssSeason[r0_9.SelectAbyssId] then
      r1_9.NowNum = r3_9:GetAllPassRoomCount()
      local r4_9 = DataMgr.AbyssSeason[r0_9.SelectAbyssId].AbyssRewardList and {}
      local r5_9 = nil
      local r6_9 = {}
      local r7_9 = nil
      for r12_9, r13_9 in ipairs(r4_9) do
        local r14_9 = DataMgr.AbyssRewardList[r13_9]
        if r14_9 then
          if r5_9 and r5_9.RewardAddOn then
            local r15_9 = r5_9.Level
            while r15_9 < r14_9.Level do
              local r16_9 = CommonUtils.DeepCopy(r7_9)
              r16_9.SourceNum = r15_9
              r16_9.ItemId = r15_9
              r16_9.CanReceive = r3_9:CheckRewardCanGet(r15_9)
              r16_9.RewardsGot = r3_9:CheckRewardIsGot(r15_9)
              table.insert(r1_9.Items, r16_9)
              r15_9 = r15_9 + r5_9.RewardAddOn
            end
          end
          r7_9 = {
            Text = GText("UI_ModGuideBook_RewardView"),
            ItemId = r13_9,
            CanReceive = r3_9:CheckRewardCanGet(r14_9.Level),
            RewardsGot = r3_9:CheckRewardIsGot(r14_9.Level),
            InProgress = false,
            Rewards = {},
            Nums = 1,
            NotreachText = "UI_GameEvent_ToBeFinished",
            Hint = "Abyss_RewardList_Content",
            ShowIcon = true,
            IconPath = "PaperSprite\'/Game/UI/Texture/Static/Atlas/Abyss/T_Abyss_Star02.T_Abyss_Star02\'",
            ReceiveCallBack = r0_9.GetRewards,
            LeftAligned = true,
            SourceNum = r14_9.Level,
            ReceiveButtonText = "UI_Achievement_GetReward",
            ReceiveParm = {
              SelectAbyssId = r0_9.SelectAbyssId,
            },
            IsWalnutReward = r14_9.WalnutReward,
          }
          r6_9 = {}
          local r16_9 = DataMgr.Reward[r14_9.Reward]
          if r16_9 then
            local r17_9 = r16_9.Id and {}
            local r18_9 = r16_9.Count and {}
            local r19_9 = r16_9.Type and {}
            for r23_9 = 1, #r17_9, 1 do
              local r24_9 = r17_9[r23_9]
              table.insert(r6_9, {
                ItemType = r19_9[r23_9],
                ItemId = r24_9,
                Count = RewardUtils:GetCount(r18_9[r23_9]),
                Rarity = ItemUtils.GetItemRarity(r24_9, r19_9[r23_9]),
              })
            end
          end
          r7_9.Rewards = r6_9
          r5_9 = DataMgr.AbyssRewardList[r13_9]
          if r14_9.RewardAddOn == nil then
            table.insert(r1_9.Items, r7_9)
          end
        end
      end
      -- close: r8_9
      if r5_9 then
        r1_9.NumMax = r5_9.Level
        r1_9.NumMax = tostring(r1_9.NumMax)
      end
      if r5_9 and r5_9.RewardAddOn then
        table.insert(r1_9.Items, r7_9)
        if r5_9.Level < r1_9.NowNum then
          local r8_9 = r5_9.Level + r5_9.RewardAddOn
          local r9_9 = r1_9.NowNum + r5_9.RewardAddOn * 5
          while r8_9 <= r9_9 do
            local r10_9 = CommonUtils.DeepCopy(r7_9)
            r10_9.SourceNum = r8_9
            r10_9.ItemId = r8_9
            r10_9.CanReceive = r3_9:CheckRewardCanGet(r8_9)
            r10_9.RewardsGot = r3_9:CheckRewardIsGot(r8_9)
            table.insert(r1_9.Items, r10_9)
            r8_9 = r8_9 + r5_9.RewardAddOn
          end
          r1_9.NumMax = tostring(r8_9 - r5_9.RewardAddOn)
        end
      end
      r0_9.Params.ConfigData = r1_9
    end
  end
  r0_9.Params.Title = GText(DataMgr.AbyssSeason[r0_9.SelectAbyssId].AbyssRewardListTitle)
  local r5_9 = DataMgr.AbyssSeason[r0_9.SelectAbyssId].AbyssSeasonId
  if r5_9 then
    local r7_9 = DataMgr.AbyssSeasonList[r5_9].AbyssEndTime
    if r7_9 then
      r0_9.Params.TitleWidget = "DiaglogTitle_Time"
      r0_9.Params.CountDownParams = {
        Name = nil,
        RemainTime = r7_9 - r0_0.NowTime(),
      }
    end
  end
  r0_9:RefreshTipFragment(r0_9.Params.ConfigData.Items)
end
function r2_0.RefreshTipFragment(r0_10, r1_10)
  -- line: [214, 241] id: 10
  r0_10.Tip_Fragment:Hide()
  local r2_10 = GWorld:GetAvatar()
  if not r2_10 then
    return 
  end
  for r7_10, r8_10 in pairs(r1_10) do
    if r8_10.IsWalnutReward and r8_10.CanReceive then
      local r9_10 = r2_10.CurrentAbyssSeasonId
      if r9_10 and DataMgr.AbyssSeasonList[r9_10] then
        local r10_10 = DataMgr.AbyssSeason[r0_10.SelectAbyssId].WalnutId
        local r11_10 = nil
        if r10_10 then
          r11_10 = DataMgr.Walnut[r10_10].Icon
        end
        r0_10.Tip_Fragment:Init({
          Text = string.format(GText("Abyss_CharReward_Walnut"), GText(DataMgr.Char[DataMgr.AbyssSeasonList[r9_10].CharId].CharName)),
          IconPath = r11_10,
        })
        r0_10.Tip_Fragment:PlayInAnim()
      end
      return 
    end
  end
  -- close: r3_10
end
function r2_0.OpenReward(r0_11)
  -- line: [243, 246] id: 11
  r0_11:SetRewardParams()
  UIManager(r0_11):ShowCommonPopupUI(100158, r0_11.Params, r0_11)
end
function r2_0.InitInfo(r0_12, r1_12)
  -- line: [248, 319] id: 12
  r0_12.AbyssMainInitFinished = true
  r0_12:PlayAnimation(r0_12.Normal)
  r0_12.Btn_BacktoTop.OnClicked:Add(r0_12, r0_12.OnBackBtnClicked)
  r0_12.Btn_BacktoTop.OnHovered:Add(r0_12, r0_12.OnBackBtnHovered)
  r0_12.Btn_BacktoTop.OnUnhovered:Add(r0_12, r0_12.OnBackBtnUnhovered)
  r0_12.Btn_BacktoTop.OnPressed:Add(r0_12, r0_12.OnBackBtnPressed)
  r0_12.Btn_BacktoTop.OnReleased:Add(r0_12, r0_12.OnBackBtnReleased)
  r0_12.Store:BindEventOnClicked(r0_12, r0_12.OpenStore)
  r0_12.Entry.Btn_Click.OnClicked:Add(r0_12, r0_12.OpenEntry)
  r0_12.Mode_01:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_12.Mode_02:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_12.Mode_03:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_12.Text_BacktoTop:SetText(GText("Abyss_Level_Back"))
  r0_12.Store:SetText(GText("Abyss_ExchangeStore"))
  r0_12.Title:SetInfo({
    MainTitle = "Abyss_entry",
  })
  r0_12.BacktoTop:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_12.Panel_RefreshTime:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_12.WBox_Mode:ClearChildren()
  r0_12.Index2AbyssId = {}
  r0_12.AbyssId2Index = {}
  r0_12.Index2LevelId = {}
  r0_12.LevelId2Index = {}
  r0_12.ChangeSpeed = 5
  local r2_12 = {}
  local r3_12 = {
    MainTitle = "Abyss_entry",
  }
  local r4_12 = GWorld:GetAvatar()
  local r5_12 = nil	-- notice: implicit variable refs by block#[19]
  if r4_12 then
    r5_12 = r4_12.CurrentAbyssSeasonId
    if r5_12 and DataMgr.AbyssSeasonList[r5_12] then
      r3_12.SubTitle = DataMgr.AbyssSeasonList[r5_12].AbyssSeasonName
    end
  end
  r0_12.Title:SetInfo(r3_12)
  if r4_12 then
    r5_12 = r4_12.Abysses
    if r5_12 then
      r5_12 = DataMgr.AbyssSeason
      for r10_12, r11_12 in pairs(r5_12) do
        if r4_12.Abysses[r10_12] and (not r4_12.Abysses[r10_12].AbyssSeasonId or r4_12.Abysses[r10_12].AbyssSeasonId == r4_12.CurrentAbyssSeasonId) then
          table.insert(r2_12, r10_12)
        end
      end
      -- close: r6_12
      table.sort(r2_12, function(r0_13, r1_13)
        -- line: [292, 294] id: 13
        return r5_12[r0_13].Order < r5_12[r1_13].Order
      end)
      for r10_12, r11_12 in ipairs(r2_12) do
        r0_12.Index2AbyssId[r10_12] = r11_12
        r0_12.AbyssId2Index[r11_12] = r10_12
      end
      -- close: r6_12
      for r10_12, r11_12 in ipairs(r0_12.Index2AbyssId) do
        local r12_12 = r0_12:CreateWidgetNew("AbyssModeSelection")
        r12_12:BindEventOnClicked(r0_12, r0_12.OnClickedAbyssModeSelectionCell, r12_12)
        r12_12:Init(r0_12, r10_12, r11_12, r4_12.Abysses[r11_12]:IsLocked(), r1_12)
        r0_12.WBox_Mode:AddChild(r12_12)
      end
      -- close: r6_12
      -- close: r5_12
    end
  end
  r5_12 = r0_12.List_Level
  r5_12:SetNavigationRuleCustom(EUINavigation.Left, {
    r0_12,
    r0_12.OnUINavigation
  })
  r5_12 = r0_12.List_Level
  r5_12 = r5_12.BP_OnEntryGenerated
  r5_12:Add(r0_12, r0_12.OnEntryGenerated)
  r5_12 = r0_12.List_Level
  r5_12 = r5_12.BP_OnEntryReleased
  r5_12:Add(r0_12, r0_12.OnEntryReleased)
  r5_12 = UE4
  r5_12 = r5_12.UGameplayStatics
  r5_12 = r5_12.GetPlayerController
  r5_12 = r5_12(r0_12, 0)
  r0_12.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(r5_12)
  if IsValid(r0_12.GameInputModeSubsystem) then
    r0_12:RefreshOpInfoByInputDevice(r0_12.GameInputModeSubsystem:GetCurrentInputType(), r0_12.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  r0_12:InitListenEvent()
  r0_12:InitWidgetInfoInGamePad()
end
function r2_0.OnClickedAbyssModeSelectionCell(r0_14, r1_14, r2_14)
  -- line: [321, 339] id: 14
  if r1_14.IsLocked then
    UIManager(r0_14):ShowUITip(UIConst.Tip_CommonToast, GText(DataMgr.AbyssSeason[r1_14.AbyssId].DifficultyLockToast))
    return 
  end
  if r0_14.SelectCell then
    r0_14.SelectCell:UnSelected()
    r0_14:PlayModeAnimation(r0_14.SelectCell.Index, true)
  end
  r0_14.SelectCell = r1_14
  r0_14.SelectCell:Selected(r2_14)
  r0_14.SelectIndex = r1_14.Index
  r0_14.SelectAbyssId = r1_14.AbyssId
  r0_14.BacktoTop:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_14:RefreshAbyssLevelInfo(r0_14.SelectAbyssId)
  r0_14:RefreshRewardBtnInfo(r0_14.SelectAbyssId)
  r0_14:RefreshTimerInfo(r0_14.SelectAbyssId)
  r0_14:PlayModeAnimation(r0_14.SelectCell.Index, false)
end
function r2_0.PlayModeAnimation(r0_15, r1_15, r2_15)
  -- line: [341, 356] id: 15
  r0_15:AddTimer(0.01, function()
    -- line: [342, 349] id: 16
    r0_15["Mode_0" .. r1_15]:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    if r2_15 then
      r0_15:PlayAnimation(r0_15["Mode0" .. r1_15], 0, 1, 1, 1)
    else
      r0_15:PlayAnimation(r0_15["Mode0" .. r1_15], 0, 1, 0, 1)
    end
  end, false)
end
function r2_0.RefreshAbyssLevelInfo(r0_17, r1_17)
  -- line: [358, 533] id: 17
  local r3_17 = DataMgr.AbyssLevel
  local r4_17 = DataMgr.AbyssSeason[r1_17]
  local r5_17 = r4_17.AbyssType
  r0_17.GotStar = 0
  r0_17.SumStar = 0
  r0_17.Max = 1
  r0_17.Target = 1
  r0_17.AbyssLevelPlayInAnimation = true
  r0_17.IsEndless = false
  if r4_17 and r4_17.AbyssLevelId then
    r0_17.List_Level:ClearListItems()
    r0_17.CurFocusedLevel = nil
    r0_17.NodeLevelContent = nil
    r0_17.LastLevelContent = nil
    r0_17.List_Level:ScrollToTop()
    local r6_17 = "/Game/UI/UI_PC/Common/Common_Item_subsize_PC_Content.Common_Item_subsize_PC_Content_C"
    if r5_17 == 3 then
      r0_17.IsEndless = true
      local r7_17 = GWorld:GetAvatar()
      if r7_17 then
        local r8_17 = nil
        if r4_17.InfiniteNode then
          r8_17 = r4_17.InfiniteNode[1]
        end
        local r11_17 = 1
        for r15_17 = 1, r7_17.Abysses[r1_17].MaxAbyssProgress[1] + 1, 1 do
          if r15_17 > 1 then
            if r7_17.Abysses[r1_17].AbyssLevelList[r15_17 + -1]:IsAbyssLevelPass() then
              r11_17 = r15_17
            else
              break
            end
          else
            r11_17 = r15_17
          end
        end
        local r13_17 = r4_17.AbyssLevelId[(r11_17 + -1) % #r4_17.AbyssLevelId + 1]
        local r14_17 = r3_17[r13_17].AbyssDungeon1
        local r15_17 = r3_17[r13_17].AbyssDungeon2
        local r16_17 = 0
        if DataMgr.AbyssDungeon[r14_17] and DataMgr.AbyssDungeon[r14_17].RoomId then
          r16_17 = r16_17 + #DataMgr.AbyssDungeon[r14_17].RoomId
        end
        if DataMgr.AbyssDungeon[r15_17] and DataMgr.AbyssDungeon[r15_17].RoomId then
          r16_17 = r16_17 + #DataMgr.AbyssDungeon[r15_17].RoomId
        end
        r0_17.Max = r11_17
        r0_17.MaxLevelNum = r11_17
        r0_17.CanJump = false
        if r8_17 then
          r0_17.JumpIndex = (math.floor((r11_17 + -1) / r8_17) + 1) * r8_17
          if r11_17 % r8_17 ~= 0 and r7_17:CheckAbyssCanJump(r1_17, r0_17.JumpIndex) then
            r0_17.CanJump = true
          end
        end
        for r20_17 = 1, r11_17, 1 do
          local r21_17 = NewObject(UE4.LoadClass(r6_17))
          local r22_17 = r4_17.AbyssLevelId[(r20_17 + -1) % #r4_17.AbyssLevelId + 1]
          local r23_17 = r0_17:GetSumLevelStar(r22_17)
          local r24_17 = r0_17:GetGotLevelStar(r1_17, r22_17, r20_17)
          r21_17.AbyssId = r1_17
          r21_17.AbyssLevelId = r22_17
          r21_17.Index = r20_17
          r21_17.IsEndless = true
          r21_17.Root = r0_17
          r21_17.IsLocked = false
          if not r21_17.IsLocked then
            r0_17.Target = r20_17
          end
          if r20_17 == r11_17 then
            r0_17.LastLevelContent = r21_17
            r21_17.IsLastLevel = true
            if r0_17.CanJump then
              r21_17.IsLastNormalLevel = true
            end
          end
          r21_17.SumLevelStar = r23_17
          r21_17.GotLevelStar = r24_17
          r0_17.SumStar = r0_17.SumStar + r23_17
          r0_17.GotStar = r0_17.GotStar + r24_17
          r0_17.List_Level:AddItem(r21_17)
        end
        if r0_17.CanJump then
          local r17_17 = true
          if r1_0:Get("LastUnlockNodeLevel") == r0_17.JumpIndex then
            r17_17 = false
          end
          r0_17.Max = r0_17.Max + 2
          r0_17.MaxLevelNum = r0_17.JumpIndex
          local r18_17 = NewObject(UE4.LoadClass(r6_17))
          r18_17.IsJumpTip = true
          r18_17.AbyssId = r1_17
          r18_17.Root = r0_17
          r0_17.List_Level:AddItem(r18_17)
          local r19_17 = NewObject(UE4.LoadClass(r6_17))
          r0_17.NodeLevelContent = r19_17
          local r20_17 = r4_17.AbyssLevelId[(r0_17.JumpIndex + -1) % #r4_17.AbyssLevelId + 1]
          local r21_17 = r0_17:GetSumLevelStar(r20_17)
          local r22_17 = r0_17:GetGotLevelStar(r1_17, r20_17, r0_17.JumpIndex)
          r19_17.AbyssId = r1_17
          r19_17.AbyssLevelId = r20_17
          r19_17.Index = r0_17.JumpIndex
          r19_17.NodeIndex = math.floor(r0_17.JumpIndex / r8_17)
          r19_17.IsEndless = true
          r19_17.Root = r0_17
          r19_17.IsLocked = false
          if not r19_17.IsLocked then
            r0_17.Target = r0_17.JumpIndex
          end
          r19_17.IsNodeLevel = true
          r19_17.PlayNodeLevelUnlockAnimation = r17_17
          r19_17.SumLevelStar = r21_17
          r19_17.GotLevelStar = r22_17
          r0_17.List_Level:AddItem(r19_17)
        end
      end
    else
      r0_17.IsEndless = false
      r0_17.Max = #r4_17.AbyssLevelId
      r0_17.MaxLevelNum = #r4_17.AbyssLevelId
      for r11_17, r12_17 in ipairs(r4_17.AbyssLevelId) do
        local r13_17 = NewObject(UE4.LoadClass(r6_17))
        local r14_17 = r0_17:GetSumLevelStar(r12_17)
        local r15_17 = r0_17:GetGotLevelStar(r1_17, r12_17, r11_17)
        r13_17.AbyssId = r1_17
        r13_17.AbyssLevelId = r12_17
        r13_17.Index = r11_17
        r13_17.IsEndless = false
        r13_17.Root = r0_17
        r13_17.IsLocked = not r0_17:CheckAbyssLevelIsOpen(r1_17, r12_17, r11_17)
        if not r13_17.IsLocked then
          r0_17.Target = r11_17
        end
        r13_17.SumLevelStar = r14_17
        r13_17.GotLevelStar = r15_17
        r0_17.SumStar = r0_17.SumStar + r14_17
        r0_17.GotStar = r0_17.GotStar + r15_17
        r0_17.List_Level:AddItem(r13_17)
      end
      -- close: r7_17
    end
    r0_17:RemoveTimer(r0_17.FirstTimer)
    if r0_17.IsEndless then
      r0_17.FirstTimer = nil
      r0_17.FirstTimer = r0_17:AddTimer(0.001, function()
        -- line: [512, 528] id: 18
        r0_17.Mid = math.ceil(UIUtils.GetListViewContentMaxCount(r0_17.List_Level) / 2)
        r0_17.List_Level:ScrollToBottom()
        r0_17:AddTimer(0.001, function()
          -- line: [516, 525] id: 19
          r0_17.BottomOffset = r0_17.List_Level:GetScrollOffset()
          r0_17.TargetOffset = r0_17.BottomOffset
        end)
        r0_17:RemoveTimer(r0_17.FirstTimer)
        r0_17.FirstTimer = nil
      end)
    else
      r0_17.List_Level:ScrollIndexIntoView(r0_17.Target + -1)
    end
  end
end
function r2_0.ScrollToOffest(r0_20, r1_20, r2_20, r3_20)
  -- line: [535, 562] id: 20
  r0_20.AbyssLevelPlayInAnimation = r3_20
  r0_20.LerpAlpha = 0
  r0_20.ScrollTimer = r0_20:AddTimer(0.033, function(r0_21, r1_21)
    -- line: [538, 561] id: 21
    r0_20.LerpAlpha = r0_20.LerpAlpha + r0_20.ChangeSpeed * r1_21
    if r0_20.LerpAlpha >= 1 then
      r0_20.LerpAlpha = 1
      r0_20.List_Level:SetScrollOffset(r2_20)
      r0_20.List_Level:SetVisibility(ESlateVisibility.Visible)
      r0_20.AbyssLevelPlayInAnimation = false
      r0_20:RemoveTimer(r0_20.ScrollTimer)
      r0_20.ScrollTimer = nil
      if r0_20.CurFocusedLevel then
        if r0_20.NodeLevelContent then
          r0_20.List_Level:BP_NavigateToItem(r0_20.NodeLevelContent)
        elseif r0_20.LastLevelContent then
          r0_20.List_Level:BP_NavigateToItem(r0_20.LastLevelContent)
        end
      end
      return 
    end
    r0_20.List_Level:SetScrollOffset(UE4.UKismetMathLibrary.Lerp(r1_20, r2_20, r0_20.LerpAlpha))
  end, true, 0, "UpdateOffset", true, 0.033)
end
function r2_0.OnBackBtnClicked(r0_22)
  -- line: [564, 571] id: 22
  r0_22:StopAllBtnAnimations()
  r0_22:PlayAnimation(r0_22.Click)
  if not r0_22.ScrollTimer then
    r0_22:ScrollToOffest(r0_22.List_Level:GetScrollOffset(), r0_22.TargetOffset, false)
  end
end
function r2_0.TryClickedBackBtn_GamePad(r0_23)
  -- line: [573, 580] id: 23
  if r0_23.BacktoTop:GetVisibility() == UIConst.VisibilityOp.Collapsed then
    return false
  else
    r0_23:OnBackBtnClicked()
    return true
  end
end
function r2_0.OnBackBtnHovered(r0_24)
  -- line: [582, 587] id: 24
  r0_24.IsHovering = true
  r0_24:StopAllBtnAnimations()
  r0_24:PlayAnimation(r0_24.Normal)
  r0_24:PlayAnimation(r0_24.Hover)
end
function r2_0.OnBackBtnUnhovered(r0_25)
  -- line: [589, 595] id: 25
  r0_25.IsHovering = false
  if not r0_25.IsPressing then
    r0_25:StopAllBtnAnimations()
    r0_25:PlayAnimation(r0_25.Unhover)
  end
end
function r2_0.OnBackBtnPressed(r0_26)
  -- line: [597, 601] id: 26
  r0_26.IsPressing = true
  r0_26:StopAllBtnAnimations()
  r0_26:PlayAnimation(r0_26.Press)
end
function r2_0.OnBackBtnReleased(r0_27)
  -- line: [603, 612] id: 27
  r0_27.IsPressing = false
  if not r0_27.IsHovering then
    r0_27:StopAllBtnAnimations()
    r0_27:PlayAnimationReverse(r0_27.Press)
  else
    r0_27:StopAllBtnAnimations()
    r0_27:PlayAnimation(r0_27.Normal)
  end
end
function r2_0.StopAllBtnAnimations(r0_28)
  -- line: [614, 620] id: 28
  r0_28:StopAnimation(r0_28.Normal)
  r0_28:StopAnimation(r0_28.Press)
  r0_28:StopAnimation(r0_28.Unhover)
  r0_28:StopAnimation(r0_28.Hover)
  r0_28:StopAnimation(r0_28.Click)
end
function r2_0.RefreshRewardBtnInfo(r0_29, r1_29)
  -- line: [622, 625] id: 29
  r0_29:SetRewardParams()
  r0_29.Reward:Init(r0_29, r0_29.OpenReward, r1_29, r0_29.Params.ConfigData.NowNum, r0_29.Params.ConfigData.NumMax)
end
function r2_0.RefreshTimerInfo(r0_30, r1_30)
  -- line: [627, 649] id: 30
  r0_30:RemoveTimer("RefreshAbyssRewardInfoTimer")
  local r3_30 = DataMgr.AbyssSeason[r1_30].AbyssSeasonId
  if r3_30 then
    local r5_30 = DataMgr.AbyssSeasonList[r3_30].AbyssEndTime
    if r5_30 then
      r0_30.Panel_RefreshTime:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      r0_30:SetTimer(r5_30)
    else
      r0_30.Panel_RefreshTime:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  else
    r0_30.Panel_RefreshTime:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r2_0.SetTimer(r0_31, r1_31)
  -- line: [651, 654] id: 31
  r0_31:Refresh(r1_31)
  r0_31:AddTimer(1, r0_31.Refresh, true, 0, "RefreshAbyssRewardInfoTimer", true, r1_31)
end
function r2_0.Refresh(r0_32, r1_32)
  -- line: [656, 685] id: 32
  local r4_32 = r1_32 - r0_0.NowTime()
  if r4_32 < 0 then
    r4_32 = 0
  end
  local r5_32 = ""
  local r6_32 = 0
  if r4_32 > 86400 then
    r6_32 = r6_32 + 1
    r5_32 = r5_32 .. string.format(GText("UI_Time_Day_NotHighlight"), math.floor(r4_32 / 86400))
    r4_32 = r4_32 % 86400
  end
  if 3600 < r4_32 or r6_32 == 1 then
    r6_32 = r6_32 + 1
    r5_32 = r5_32 .. string.format(GText("UI_Time_Hour_NotHighlight"), math.floor(r4_32 / 3600))
    r4_32 = r4_32 % 3600
  end
  if r4_32 > 60 and r6_32 < 2 or r6_32 == 1 then
    r6_32 = r6_32 + 1
    r5_32 = r5_32 .. string.format(GText("UI_Time_Minute_NotHighlight"), math.floor(r4_32 / 60))
    r4_32 = r4_32 % 60
  end
  if r4_32 > 0 and r6_32 < 2 or r6_32 == 1 then
    r6_32 = r6_32 + 1
    r5_32 = r5_32 .. string.format(GText("UI_Time_Second_NotHighlight"), r4_32)
  end
  r0_32.Text_RemainTime:SetText(r5_32)
end
function r2_0.GetSumLevelStar(r0_33, r1_33)
  -- line: [687, 697] id: 33
  local r2_33 = DataMgr.AbyssLevel[r1_33]
  local r3_33 = 0
  if r2_33.DungeonReward1 then
    r3_33 = r3_33 + r2_33.DungeonReward1
  end
  if r2_33.DungeonReward2 then
    r3_33 = r3_33 + r2_33.DungeonReward2
  end
  return r3_33
end
function r2_0.GetGotLevelStar(r0_34, r1_34, r2_34, r3_34)
  -- line: [699, 714] id: 34
  local r4_34 = GWorld:GetAvatar()
  local r5_34 = 0
  if r4_34 then
    local r6_34 = r4_34.Abysses[r1_34]
    if r6_34.AbyssLevelList[r3_34] then
      r5_34 = r6_34.AbyssLevelList[r3_34].MaxAbyssLevelProgress
    end
  end
  return r5_34
end
function r2_0.GetOffsetByIndex(r0_35, r1_35)
  -- line: [716, 726] id: 35
  if r1_35 <= r0_35.Mid then
    return 0
  elseif r0_35.Max - r1_35 <= r0_35.Mid + -1 then
    return r0_35.BottomOffset
  else
    local r2_35 = r0_35.BottomOffset / (r0_35.Max - r0_35.Mid + 1 - r0_35.Mid)
    return r2_35 * r1_35 + -r2_35 * r0_35.Mid
  end
end
function r2_0.OnClickedAbyssLevelCell(r0_36, r1_36)
  -- line: [728, 734] id: 36
  if r1_36.IsLocked then
    UIManager(r0_36):ShowUITip(UIConst.Tip_CommonToast, string.format(GText("Abyss_BuffLockToast"), r1_36.Index + -1))
    return 
  end
  r0_36:OpenSubUI({
    Idx = "AbyssSelect",
  }, false, r0_36.SelectAbyssId, r1_36.Index)
end
function r2_0.CheckAbyssLevelIsOpen(r0_37, r1_37, r2_37, r3_37)
  -- line: [736, 759] id: 37
  local r4_37 = GWorld:GetAvatar()
  if r4_37 then
    local r5_37 = r4_37.Abysses[r1_37].MaxAbyssProgress
    if r3_37 <= r5_37[1] then
      return true
    elseif r3_37 == r5_37[1] + 1 then
      local r6_37 = DataMgr.AbyssLevel
      local r7_37 = r6_37[r2_37].AbyssDungeon1
      local r8_37 = r6_37[r2_37].AbyssDungeon2
      local r9_37 = 0
      if DataMgr.AbyssDungeon[r7_37] and DataMgr.AbyssDungeon[r7_37].RoomId then
        r9_37 = r9_37 + #DataMgr.AbyssDungeon[r7_37].RoomId
      end
      if DataMgr.AbyssDungeon[r8_37] and DataMgr.AbyssDungeon[r8_37].RoomId then
        r9_37 = r9_37 + #DataMgr.AbyssDungeon[r8_37].RoomId
      end
      if r5_37[2] == r9_37 then
        return true
      end
    end
  end
  return false
end
function r2_0.InitTable(r0_38)
  -- line: [761, 771] id: 38
  r0_38.TabConfigData = {
    TitleName = GText("Abyss_entry"),
    DynamicNode = {
      "Back",
      "BottomKey",
      "ResourceBar"
    },
    StyleName = "Text",
    OwnerPanel = r0_38.Root,
    BackCallback = r0_38.Root.OnClickBack,
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = r0_38.Root.OnClickBack,
            Owner = r0_38.Root,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
          }
        },
        Desc = GText("UI_BACK"),
        bLongPress = false,
      }
    },
    PopupInfoId = DataMgr.SystemUI.AbyssMain.PopupInfoId,
  }
  r0_38.Root:InitOtherPageTab(r0_38.TabConfigData, DataMgr.SystemUI.AbyssMain.TabCoin, true)
end
function r2_0.InitListenEvent(r0_39)
  -- line: [783, 787] id: 39
  if IsValid(r0_39.GameInputModeSubsystem) then
    r0_39.GameInputModeSubsystem.OnInputMethodChanged:Add(r0_39, r0_39.RefreshOpInfoByInputDevice)
  end
end
function r2_0.ClearListenEvent(r0_40)
  -- line: [789, 793] id: 40
  if IsValid(r0_40.GameInputModeSubsystem) then
    r0_40.GameInputModeSubsystem.OnInputMethodChanged:Remove(r0_40, r0_40.RefreshOpInfoByInputDevice)
  end
end
function r2_0.RefreshOpInfoByInputDevice(r0_41, r1_41, r2_41)
  -- line: [795, 801] id: 41
  if r1_41 == ECommonInputType.Touch then
    return 
  end
  r0_41:UpdateUIStyleInPlatform(r1_41 == ECommonInputType.MouseAndKeyboard)
end
function r2_0.UpdateUIStyleInPlatform(r0_42, r1_42)
  -- line: [803, 809] id: 42
  if r1_42 then
    r0_42:InitKeyboardView()
  else
    r0_42:InitGamepadView()
  end
end
function r2_0.InitGamepadView(r0_43)
  -- line: [811, 838] id: 43
  if r0_43.Controller_Selection then
    r0_43.Controller_Selection:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if r0_43.Controller_Reward then
    r0_43.Controller_Reward:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if r0_43.Controller_Entry then
    r0_43.Controller_Entry:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if r0_43.Controller_BacktoTop then
    r0_43.Controller_BacktoTop:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if r0_43.Controller_Store then
    r0_43.Controller_Store:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  r0_43.Reward:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  r0_43.Entry:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  if r0_43:HasFocusedDescendants() or r0_43:HasAnyUserFocus() then
    if r0_43.SelectCell then
      r0_43.SelectCell:SetFocus()
    else
      r0_43.WBox_Mode:GetChildAt(0):SetFocus()
    end
  end
end
function r2_0.InitKeyboardView(r0_44)
  -- line: [840, 858] id: 44
  if r0_44.Controller_Selection then
    r0_44.Controller_Selection:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if r0_44.Controller_Reward then
    r0_44.Controller_Reward:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if r0_44.Controller_Entry then
    r0_44.Controller_Entry:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if r0_44.Controller_BacktoTop then
    r0_44.Controller_BacktoTop:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if r0_44.Controller_Store then
    r0_44.Controller_Store:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  r0_44.Reward:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_44.Entry:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end
function r2_0.InitWidgetInfoInGamePad(r0_45)
  -- line: [860, 921] id: 45
  if r0_45.Icon_Key_Reward then
    r0_45.Icon_Key_Reward:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "Y",
        }
      },
    })
  end
  if r0_45.Icon_Key_Selection then
    r0_45.Icon_Key_Selection:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "LV",
        }
      },
    })
  end
  if r0_45.Icon_Key_BacktoTop then
    r0_45.Icon_Key_BacktoTop:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "LS",
        }
      },
    })
  end
  if r0_45.Icon_Key_Entry then
    r0_45.Icon_Key_Entry:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "View",
        }
      },
    })
  end
  if r0_45.Controller_Store then
    r0_45.Controller_Store:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "X",
        }
      },
    })
  end
  if r0_45.Icon_Key_Selection then
    r0_45.Icon_Key_Selection:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "Vertical",
        }
      },
    })
  end
end
function r2_0.GetDesiredFocusTarget_AbyssMain(r0_46)
  -- line: [923, 930] id: 46
  if r0_46.SelectCell then
    return r0_46.SelectCell
  else
    return r0_46.WBox_Mode:GetChildAt(0)
  end
end
function r2_0.OpenStore(r0_47)
  -- line: [932, 934] id: 47
  PageJumpUtils:JumpToShopPage(nil, nil, nil, "AbyssShop")
end
function r2_0.InitMgr(r0_48)
  -- line: [938, 943] id: 48
  r0_48.StackSubUI = {}
  r0_48.SubUI = {}
  EventManager:AddEvent(EventID.OnCurrentAbyssSeasonIdChange, r0_48, r0_48.ShowSeasonEndPopup)
  r0_48:PlayInAnim()
end
function r2_0.DestructMgr(r0_49)
  -- line: [945, 947] id: 49
  EventManager:RemoveEvent(EventID.OnCurrentAbyssSeasonIdChange, r0_49)
end
function r2_0.ShowSeasonEndPopup(r0_50)
  -- line: [949, 958] id: 50
  local r1_50 = UIManager(r0_50)
  r1_50:ShowCommonPopupUI(100225, {
    RightCallbackFunction = function()
      -- line: [952, 956] id: 51
      r1_50:CloseAllUI_EX({
        "BattleMain"
      }, "AbyssSeasonChange")
      UIUtils.PlayBattleMainInAnim()
    end,
  })
end
function r2_0.PlayInAnim(r0_52)
  -- line: [960, 968] id: 52
  r0_52:AddTimer(0.01, function()
    -- line: [961, 967] id: 53
    if r0_52.Com_Tab.Play_WBP_Com_Tab_P_In then
      r0_52.Com_Tab:Play_WBP_Com_Tab_P_In()
    elseif r0_52.Com_Tab.Play_Com_Tab_M_In then
      r0_52.Com_Tab:Play_Com_Tab_M_In()
    end
  end, false)
end
function r2_0.OpenSubUI(r0_54, r1_54, ...)
  -- line: [970, 1026] id: 54
  local r2_54 = nil
  if r1_54 and r1_54.Idx then
    r2_54 = r1_54.Idx
  end
  if r0_54.CurTabId == r2_54 then
    return r0_54.CurSubUI
  end
  if r0_54.CurSubUI and r0_54.CurSubUI.SwitchOut then
    r0_54.CurSubUI:SwitchOut(...)
  end
  if r2_54 then
    if not r0_54.SubUI[r2_54] then
      if r2_54 ~= "AbyssMain" then
        local r3_54 = r0_54:CreateWidgetNew(r2_54)
        if r3_54 then
          r0_54.Group_Root:AddChild(r3_54)
          r3_54.Root = r0_54
          r3_54.WidgetInfo = r1_54
          if r0_54.CurSubUI then
            r3_54.PreWidgetInfo = r0_54.CurSubUI.WidgetInfo
          end
          local r4_54 = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r3_54)
          if r4_54 then
            local r5_54 = FAnchors()
            r5_54.Minimum = FVector2D(0, 0)
            r5_54.Maximum = FVector2D(1, 1)
            r4_54:SetOffsets(FMargin(0, 0, 0, 0))
            r4_54:SetAnchors(r5_54)
          end
          r0_54.SubUI[r2_54] = r3_54
        end
      else
        local r3_54 = r0_54
        r3_54.Root = r0_54
        r3_54.WidgetInfo = r1_54
        r0_54.SubUI[r2_54] = r3_54
      end
    end
    r0_54.CurTabId = r2_54
    r0_54.CurSubUI = r0_54.SubUI[r2_54]
    if r0_54.CurSubUI and r0_54.CurSubUI.SwitchIn then
      r0_54.CurSubUI:SwitchIn(...)
      r0_54.CurSubUI:SetFocus()
    end
  end
  return r0_54.CurSubUI
end
function r2_0.BP_GetDesiredFocusTarget(r0_55)
  -- line: [1028, 1034] id: 55
  if r0_55.CurSubUI == r0_55 then
    return r0_55:GetDesiredFocusTarget_AbyssMain()
  else
    return r0_55.CurSubUI
  end
end
function r2_0.OnPreviewKeyDown(r0_56, r1_56, r2_56)
  -- line: [1036, 1050] id: 56
  local r3_56 = UE4.UKismetInputLibrary.GetKey(r2_56)
  local r4_56 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_56)
  local r5_56 = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_56) and r4_56 == "Gamepad_LeftThumbstick" then
    r5_56 = r0_56:TryClickedBackBtn_GamePad()
  end
  if r5_56 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
end
function r2_0.OnKeyDown(r0_57, r1_57, r2_57)
  -- line: [1052, 1085] id: 57
  local r3_57 = UE4.UKismetInputLibrary.GetKey(r2_57)
  local r4_57 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_57)
  local r5_57 = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_57) then
    if r4_57 == "Gamepad_FaceButton_Top" then
      r5_57 = true
      r0_57.Reward:OnBtnClicked()
    elseif r4_57 == "Gamepad_FaceButton_Left" then
      r5_57 = true
      r0_57.Store:OnBtnClicked()
    elseif r4_57 == "Gamepad_Special_Left" then
      r5_57 = true
      r0_57.Entry:OnBtnClicked()
      r0_57:OpenEntry()
    elseif r4_57 == "Gamepad_FaceButton_Right" then
      r5_57 = true
      r0_57:OnReturnKeyDown()
    end
    if not r5_57 then
      r5_57 = r0_57.Com_Tab:Handle_KeyEventOnGamePad(r4_57)
    end
  elseif r4_57 == "Escape" then
    r5_57 = true
    r0_57:OnReturnKeyDown()
  end
  if r5_57 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end
function r2_0.OnReturnKeyDown(r0_58)
  -- line: [1087, 1090] id: 58
  UIUtils.PlayCommonBtnSe(r0_58)
  r0_58:OnClickBack()
end
function r2_0.OnClickBack(r0_59)
  -- line: [1092, 1104] id: 59
  if r0_59.Com_Tab:IsAnimationPlaying(r0_59.Com_Tab.In) then
    return 
  end
  if r0_59.CurSubUI ~= r0_59 and r0_59.CurSubUI.OnReturnKeyDown then
    r0_59.CurSubUI:OnReturnKeyDown()
  else
    r0_59:ReturnPreWidget()
  end
end
function r2_0.ReturnPreWidget(r0_60)
  -- line: [1106, 1113] id: 60
  if not r0_60.CurSubUI or not r0_60.CurSubUI.PreWidgetInfo then
    r0_60:PlayOutAnim()
  elseif r0_60.CurSubUI then
    r0_60:OpenSubUI(r0_60.CurSubUI.PreWidgetInfo)
  end
end
function r2_0.PlayOutAnim(r0_61)
  -- line: [1115, 1127] id: 61
  r0_61:UnbindAllFromAnimationFinished(r0_61.Out)
  if r0_61:IsAnimationPlaying(r0_61.Out) then
    return 
  end
  r0_61:BindToAnimationFinished(r0_61.Out, {
    r0_61,
    r0_61.Close
  })
  r0_61:PlayAnimationForward(r0_61.Out)
  r0_61.Com_Tab:PlayAnimationForward(r0_61.Com_Tab.Out)
  if r0_61.IsFromActivity then
    EventManager:FireEvent(EventID.OnReturnToActivityEntry)
    EventManager:FireEvent(EventID.OnActivityEntryShowVisible)
  end
end
function r2_0.InitOtherPageTab(r0_62, r1_62, r2_62, r3_62, r4_62, r5_62)
  -- line: [1129, 1135] id: 62
  if r1_62 then
    r1_62.OverridenTopResouces = r2_62 and DataMgr.SystemUI.AbyssMain.TabCoin
  end
  r0_62.Com_Tab:Init(r1_62, r3_62)
  r0_62.Com_Tab:BindEventOnTabSelected(r4_62, r5_62)
end
function r2_0.Close(r0_63)
  -- line: [1137, 1147] id: 63
  if r0_63.SubUI then
    for r5_63, r6_63 in pairs(r0_63.SubUI) do
      if r6_63 ~= r0_63 then
        r6_63:RemoveFromParent()
      end
    end
    -- close: r1_63
  end
  r0_63.Super.Close(r0_63)
end
function r2_0.GetRewards(r0_64, r1_64)
  -- line: [1151, 1164] id: 64
  local r2_64 = GWorld:GetAvatar()
  if r2_64 then
    r2_64:GetAbyssReward(r1_64.ConfigData.ReceiveParm.SelectAbyssId, r1_64.ConfigData.SourceNum, function(r0_65, r1_65)
      -- line: [1154, 1160] id: 65
      r1_64.ConfigData.CanReceive = r2_65:CheckRewardCanGet(r1_64.ConfigData.SourceNum)
      r1_64.ConfigData.RewardsGot = r2_64.Abysses[r1_64.ConfigData.ReceiveParm.SelectAbyssId]:CheckRewardIsGot(r1_64.ConfigData.SourceNum)
      r1_64.SelfWidget:RefreshBtn(r0_65 == 0)
      r1_64.Owner:RefreshButton(r2_65:CheckHaveRewardToGet())
    end)
  end
end
function r2_0.GetAllRewards(r0_66, r1_66)
  -- line: [1166, 1189] id: 66
  local r2_66 = GWorld:GetAvatar()
  if r2_66 then
    r2_66:GetAbyssAllReward(r1_66.SelectAbyssId, function(r0_67, r1_67)
      -- line: [1169, 1186] id: 67
      local r2_67 = false
      for r6_67 = 0, r1_66.SelfWidget.List_Item:GetNumItems() + -1, 1 do
        local r7_67 = r1_66.SelfWidget.List_Item:GetItemAt(r6_67)
        local r8_67 = r2_66.Abysses[r1_66.SelectAbyssId]
        local r9_67 = r8_67:CheckRewardCanGet(r7_67.ConfigData.SourceNum)
        local r10_67 = r8_67:CheckRewardIsGot(r7_67.ConfigData.SourceNum)
        if r9_67 then
          r2_67 = true
        end
        r7_67.ConfigData.CanReceive = r9_67
        r7_67.ConfigData.RewardsGot = r10_67
        if r7_67.SelfWidget then
          r7_67.SelfWidget:RefreshBtn(r10_67)
        end
      end
      r1_66.SelfWidget:RefreshButton(r2_67)
    end)
  end
end
function r2_0.OpenEntry(r0_68)
  -- line: [1191, 1197] id: 68
  local r2_68 = UIManager(r0_68):LoadUINew("AbyssEntry", {
    Type = 3,
    AbyssId = r0_68.SelectAbyssId,
  })
end
function r2_0.ShowReviewPopUp(r0_69)
  -- line: [1199, 1222] id: 69
  local r1_69 = GWorld:GetAvatar()
  local r2_69 = r1_69.CurrentAbyssSeasonId
  if not DataMgr.AbyssSeasonList[r2_69] then
    return 
  end
  if r1_0:Get("LastViewAbyss") == r2_69 then
    return 
  end
  r1_0:Set("LastViewAbyss", r2_69)
  local r3_69 = DataMgr.AbyssSeasonList[r2_69].LastSeason
  if not r3_69 then
    return 
  end
  local r4_69 = r1_69:GetAbyssSeasonBestAbyssId(r3_69)
  if not r4_69 then
    return 
  end
  UIManager(r0_69):ShowCommonPopupUI(100191, {
    SeasonId = r3_69,
    AbyssId = r4_69,
  }, r0_69)
end
function r2_0.TryChangeSelectedTab(r0_70, r1_70, r2_70)
  -- line: [1224, 1230] id: 70
  if r1_70 == EUINavigation.Up then
    return r0_70:OnNavigationToIndex(r2_70, r2_70 + -1)
  elseif r1_70 == EUINavigation.Down then
    return r0_70:OnNavigationToIndex(r2_70, r2_70 + 1)
  end
end
function r2_0.OnNavigationToIndex(r0_71, r1_71, r2_71)
  -- line: [1232, 1239] id: 71
  if r2_71 <= 0 or #r0_71.Index2AbyssId < r2_71 then
    return r0_71.WBox_Mode:GetChildAt(r1_71 + -1)
  end
  local r3_71 = r0_71.WBox_Mode:GetChildAt(r2_71 + -1)
  r3_71:OnCellClicked()
  return r3_71
end
function r2_0.FocusToFirstMission(r0_72)
  -- line: [1241, 1243] id: 72
  return r0_72:NavigateToFirstDisplayedItem(r0_72.List_Level)
end
function r2_0.NavigateToFirstDisplayedItem(r0_73, r1_73)
  -- line: [1245, 1267] id: 73
  local r2_73 = r1_73:GetDisplayedEntryWidgets()
  if r2_73:Length() > 0 then
    local r3_73 = nil
    for r7_73 = 1, r2_73:Length(), 1 do
      local r8_73 = r2_73:GetRef(r7_73)
      if r8_73.Content.Index and not r3_73 then
        r3_73 = r8_73
      end
    end
    if r3_73 then
      r1_73:BP_NavigateToItem(r3_73.Content)
      return r3_73
    end
  end
  return r1_73
end
function r2_0.OnUINavigation(r0_74, r1_74)
  -- line: [1269, 1277] id: 74
  if r1_74 == EUINavigation.Left then
    if r0_74.CurFocusedLevel then
      r0_74.CurFocusedLevel:HideIcon()
    end
    r0_74.CurFocusedLevel = nil
    return r0_74.SelectCell
  end
end
function r2_0.NavigateToNodeLevel(r0_75, r1_75)
  -- line: [1279, 1285] id: 75
  local r4_75 = r0_75.List_Level:GetItemAt(r0_75.List_Level:GetIndexForItem(r1_75.Content) + 2)
  r0_75.List_Level:BP_NavigateToItem(r4_75)
  return r4_75.Entry
end
function r2_0.NavigateToLastNormalLevel(r0_76, r1_76)
  -- line: [1287, 1293] id: 76
  local r4_76 = r0_76.List_Level:GetItemAt(r0_76.List_Level:GetIndexForItem(r1_76.Content) + -2)
  r0_76.List_Level:BP_NavigateToItem(r4_76)
  return r4_76.Entry
end
function r2_0.TryChangeCurFocusedMissionList(r0_77, r1_77)
  -- line: [1295, 1301] id: 77
  if r0_77.CurFocusedLevel then
    r0_77.CurFocusedLevel:HideIcon()
  end
  r0_77.CurFocusedLevel = r1_77
  r0_77.CurFocusedLevel:ShowIcon()
end
function r2_0.OnEntryGenerated(r0_78, r1_78)
  -- line: [1303, 1315] id: 78
  if r0_78.IsEndless and r1_78.Content.IsLastLevel then
    r0_78.BacktoTop:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  -- warn: not visited block [3]
  -- block#3:
  -- r0_78.BacktoTop:SetVisibility(_ENV.UIConst.VisibilityOp.Collapsed)
  -- goto label_27
end
function r2_0.OnEntryReleased(r0_79, r1_79)
  -- line: [1317, 1329] id: 79
  if r0_79.IsEndless and r1_79.Content.IsLastLevel then
    r0_79.BacktoTop:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  -- warn: not visited block [3]
  -- block#3:
  -- r0_79.BacktoTop:SetVisibility(_ENV.UIConst.VisibilityOp.SelfHitTestInvisible)
  -- goto label_27
end
return r2_0
