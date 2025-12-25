-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Activity\Widget\GuildWar\WBP_Activity_GuildWar_JumpBoard_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("BluePrints.UI.WBP.Activity.Widget.GuildWar.GuildWarUtils")
local r1_0 = Class("BluePrints.UI.BP_EMUserWidget_C")
r1_0._components = {
  "BluePrints.UI.BP_EMUserWidgetUtils_C"
}
function r1_0.Construct(r0_1)
  -- line: [9, 14] id: 1
  r0_1:AddDispatcher(EventID.OnPreRaidRankInfo, r0_1, r0_1.OnPreRaidRankInfo)
  r0_1:AddDispatcher(EventID.OnRaidRankInfo, r0_1, r0_1.OnRaidRankInfo)
  r0_1:AddDispatcher(EventID.OnRaidRankStart, r0_1, r0_1.OnRaidRankStart)
  r0_1:AddDispatcher(EventID.OnReturnToActivityEntry, r0_1, r0_1.OnReturnToActivityEntry)
end
function r1_0.Destruct(r0_2)
  -- line: [16, 18] id: 2
  r0_2:RemoveInputMethodChangedListen()
end
function r1_0.Update(r0_3)
  -- line: [21, 27] id: 3
  if r0_3.SkipNextRefresh then
    r0_3.SkipNextRefresh = false
    return 
  end
  r0_3:RefreshBoardWidget()
end
function r1_0.OnReturnToActivityEntry(r0_4)
  -- line: [30, 33] id: 4
  r0_4.SkipNextRefresh = true
  r0_4:RefreshBoardWidget()
end
function r1_0.Init(r0_5, r1_5, r2_5, r3_5)
  -- line: [36, 51] id: 5
  r0_5.Avatar = r3_5
  r0_5.RootWidget = r0_5.ParentWidget and r0_5.ParentWidget.ParentWidget
  r0_5.EventId = r1_5.EventId
  r0_5:RefreshBoardWidget()
  r0_5.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(r0_5)
  r0_5:AddInputMethodChangedListen()
  r0_5:RefreshOpInfoByInputDevice(r0_5.GameInputModeSubsystem:GetCurrentInputType(), r0_5.GameInputModeSubsystem:GetCurrentGamepadName())
  r0_5:SetJumpPageButtonDisable()
end
function r1_0.SetJumpPageButtonDisable(r0_6)
  -- line: [54, 63] id: 6
  if r0_0.IsRaidTime() then
    return 
  end
  local r1_6 = r0_6.ParentWidget
  if r1_6 and r1_6.WS then
    r1_6.WS:SetActiveWidgetIndex(2)
    r1_6.Text_Complete:SetText(GText("UI_GameEvent_EventEnd"))
  end
end
function r1_0.RefreshBoardWidget(r0_7)
  -- line: [66, 72] id: 7
  if r0_0.IsPreRaidTime() then
    r0_7:RefreshQualificationBoard()
  else
    r0_7:RefreshOfficialBoard()
  end
end
function r1_0.RefreshQualificationBoard(r0_8)
  -- line: [75, 117] id: 8
  local r1_8, r2_8 = r0_0.GetSeasonAndEventData()
  if not r1_8 then
    return 
  end
  local r4_8 = DataMgr.EventMain[r0_8.EventId]
  local r5_8 = r4_8.EventStartTime + r1_8.PreRaidTime * 3600
  local r6_8 = r0_8:GetDateText(r5_8)
  r0_8.WS_Type:SetActiveWidgetIndex(0)
  r0_8.WS_Type:SetVisibility(UIConst.VisibilityOp.Collapsed)
  local r7_8 = r0_8.WB_QualificationBoard
  r7_8.Key_Reward:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "View",
      }
    },
  })
  local r8_8 = TimeUtils.TimestampToDataObj(r5_8)
  local r9_8 = table.concat({
    r0_8:PadZero(r8_8.month),
    "-",
    r0_8:PadZero(r8_8.day),
    " ",
    r0_8:PadZero(r8_8.hour),
    ":",
    r0_8:PadZero(r8_8.min)
  })
  r7_8.Text_Reward:SetText(GText("UI_Event_MidTerm_GotoPreview"))
  r7_8.Btn_Check:Init({
    ClickCallback = r0_8.OnRewardPreviewClicked,
    OwnerWidget = r0_8,
  })
  r7_8.Text_Status:SetText(r9_8)
  r7_8.Text_QualificationMatch:SetText(GText("RaidDungeon_PreRaid_Rank"))
  r7_8.Text_OfficialMathch:SetText(GText("RaidDungeon_Raid_Rank"))
  r7_8.Text_Date:SetText(table.concat({
    r0_8:GetDateText(r4_8.EventStartTime),
    " ~ ",
    r6_8
  }))
  r0_8.Avatar:RaidSeasonGetPreRaidRankInfo(function(r0_9)
    -- line: [107, 111] id: 9
    if not ErrorCode:Check(r0_9) and r0_8 then
      r0_8:SetRankTextureImage(r7_8, 0)
    end
  end)
  r0_8:AddTimer(0.2, function()
    -- line: [113, 116] id: 10
    r0_8.WS_Type:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r7_8:PlayAnimation(r7_8.In)
  end)
end
function r1_0.RefreshOfficialBoard(r0_11)
  -- line: [120, 164] id: 11
  local r1_11, r2_11 = r0_0.GetSeasonAndEventData()
  if not r1_11 then
    return 
  end
  local r3_11 = r0_11.Avatar.RaidSeasons[r0_11.Avatar.CurrentRaidSeasonId]
  if not r3_11 then
    return 
  end
  r0_11.WS_Type:SetActiveWidgetIndex(1)
  r0_11.WS_Type:SetVisibility(UIConst.VisibilityOp.Collapsed)
  local r5_11 = r1_11.RaidTime * 3600
  local r7_11 = DataMgr.EventMain[r0_11.EventId].EventStartTime + r1_11.PreRaidTime * 3600
  local r8_11 = r0_11:GetDateText(r7_11)
  local r9_11 = r0_11.WB_OfficialBoard
  r9_11.Text_Ranking:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r9_11.Btn_GainReward.Key_Controller:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "View",
      }
    },
  })
  r9_11.Text_Status:SetText(GText("RaidDungeon_PreRaid_End"))
  r9_11.Text_QualificationMatch:SetText(GText("RaidDungeon_PreRaid_Rank"))
  r9_11.Text_OfficialMathch:SetText(GText("RaidDungeon_Raid_Rank"))
  r9_11.Text_Date:SetText(table.concat({
    r8_11,
    " ~ ",
    r0_11:GetDateText(r7_11 + r5_11)
  }))
  r0_11:RefreshPreRaidRewardGot(r9_11)
  r0_11:SetRankTextureImage(r9_11, r3_11.PreRaidGroupId)
  r0_11.Avatar:RaidSeasonGetRaidRankInfo(function(r0_12)
    -- line: [155, 159] id: 12
    if not ErrorCode:Check(r0_12) and r0_11 then
      r0_11:InitRaidRankText(0)
    end
  end)
  r0_11:AddTimer(0.2, function()
    -- line: [160, 163] id: 13
    r0_11.WS_Type:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r9_11:PlayAnimation(r9_11.In)
  end)
end
function r1_0.OnPreRaidRankInfo(r0_14, r1_14)
  -- line: [167, 171] id: 14
  if r1_14 and r0_0.IsPreRaidTime() then
    r0_14:SetRankTextureImage(r0_14.WB_QualificationBoard, r1_14.PreRaidGroupId)
  end
end
function r1_0.OnRaidRankInfo(r0_15, r1_15)
  -- line: [174, 177] id: 15
  r0_15:InitRaidRankText(r1_15 and r1_15.Rank)
end
function r1_0.OnRaidRankStart(r0_16, r1_16, r2_16)
  -- line: [180, 185] id: 16
  r0_16:RefreshOfficialBoard()
  if r2_16 then
    r0_16:SetRankTextureImage(r0_16.WB_OfficialBoard, r2_16)
  end
end
function r1_0.RefreshPreRaidRewardGot(r0_17, r1_17)
  -- line: [188, 208] id: 17
  local r2_17 = GWorld:GetAvatar()
  if not r2_17 then
    return 
  end
  local r3_17 = r2_17.RaidSeasons[r2_17.CurrentRaidSeasonId]
  if not r3_17 then
    return 
  end
  if r3_17.PreRaidGroupId > 0 and not r3_17:IsPreRaidRewardGot() then
    r1_17.Btn_GainReward:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r1_17.Btn_GainReward:Init(r0_17, r0_17.OnRewardGotBtnClicked)
  else
    r1_17.Btn_GainReward:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  r0_0.RefreshRewardGotReddot()
end
function r1_0.InitRaidRankText(r0_18, r1_18)
  -- line: [211, 222] id: 18
  local r2_18 = r0_18.WB_OfficialBoard.Text_Ranking
  if not r2_18 then
    return 
  end
  if r1_18 and r1_18 > 0 then
    r2_18:SetText(GText("RaidDungeon_Rank") .. " " .. r1_18)
    r2_18:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    r2_18:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r1_0.OnRewardGotBtnClicked(r0_19)
  -- line: [224, 258] id: 19
  AudioManager(r0_19):PlayUISound(r0_19, "event:/ui/activity/shop_small_btn_click", "", nil)
  local function r1_19(r0_20, r1_20)
    -- line: [226, 253] id: 20
    if r0_19.RootWidget and r0_19.RootWidget.BlockAllUIInput then
      r0_19.RootWidget:BlockAllUIInput(false)
    end
    r0_19:RefreshPreRaidRewardGot(r0_19.WB_OfficialBoard)
    if not ErrorCode:Check(r0_20) then
      return 
    end
    local r2_20 = DataMgr.PreRaidRank[1]
    local r3_20 = r0_19.Avatar.RaidSeasons[r0_19.Avatar.CurrentRaidSeasonId]
    if not r3_20 or not r3_20.PreRaidGroupId then
      DebugPrint("获取不到预选赛分组信息!")
      return 
    end
    local r5_20 = RewardUtils:GetRewards(r2_20.RankReward[r3_20.PreRaidGroupId], nil)
    if r0_19.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
      r0_19:AddTimer(0.8, function()
        -- line: [247, 249] id: 21
        UIManager(r0_19):LoadUINew("GetItemPage", nil, nil, nil, r5_20, r0_19.PlayOutAnim, r0_19, true)
      end)
    else
      UIManager(r0_19):LoadUINew("GetItemPage", nil, nil, nil, r5_20, r0_19.PlayOutAnim, r0_19, true)
    end
  end
  if r0_19.RootWidget and r0_19.RootWidget.BlockAllUIInput then
    r0_19.RootWidget:BlockAllUIInput(true)
  end
  r0_19.Avatar:RaidSeasonGetPreRankReward(r1_19)
end
function r1_0.OnRewardPreviewClicked(r0_22, r1_22)
  -- line: [260, 264] id: 22
  AudioManager(r0_22):PlayUISound(r0_22, "event:/ui/activity/shop_small_btn_click", "", nil)
  UIManager(r0_22):LoadUINew("GuildWarRewardPop"):Init()
end
function r1_0.SetRankTextureImage(r0_23, r1_23, r2_23)
  -- line: [266, 273] id: 23
  local r3_23 = r2_23 and 0
  if r3_23 < 0 or type(r3_23) ~= "number" then
    r3_23 = 0
  end
  r1_23.Icon_Rank:SetBrush(r0_23["Rank_" .. r3_23])
end
function r1_0.PadZero(r0_24, r1_24)
  -- line: [275, 277] id: 24
  local r2_24 = nil	-- notice: implicit variable refs by block#[3]
  if r1_24 < 10 then
    r2_24 = "0" .. tostring(r1_24)
    if not r2_24 then
      ::label_9::
      r2_24 = tostring(r1_24)
    end
  else
    goto label_9	-- block#2 is visited secondly
  end
  return r2_24
end
function r1_0.GetDateText(r0_25, r1_25)
  -- line: [279, 285] id: 25
  if type(r1_25) ~= "number" then
    return 
  end
  local r2_25 = TimeUtils.TimestampToDataObj(r1_25)
  return table.concat({
    r2_25.year,
    "-",
    r0_25:PadZero(r2_25.month),
    "-",
    r0_25:PadZero(r2_25.day)
  })
end
function r1_0.AddInputMethodChangedListen(r0_26)
  -- line: [287, 291] id: 26
  if IsValid(r0_26.GameInputModeSubsystem) then
    r0_26.GameInputModeSubsystem.OnInputMethodChanged:Add(r0_26, r0_26.RefreshOpInfoByInputDevice)
  end
end
function r1_0.RemoveInputMethodChangedListen(r0_27)
  -- line: [293, 297] id: 27
  if IsValid(r0_27.GameInputModeSubsystem) then
    r0_27.GameInputModeSubsystem.OnInputMethodChanged:Remove(r0_27, r0_27.RefreshOpInfoByInputDevice)
  end
end
function r1_0.RefreshOpInfoByInputDevice(r0_28, r1_28, r2_28)
  -- line: [299, 306] id: 28
  if r1_28 == ECommonInputType.MouseAndKeyboard then
    r0_28:InitKeyBoardView()
  elseif r1_28 == ECommonInputType.Gamepad then
    r0_28:InitGamepadView()
  end
end
function r1_0.InitKeyBoardView(r0_29)
  -- line: [308, 321] id: 29
  if r0_0.IsPreRaidTime() then
    r0_29.WB_QualificationBoard.WS_Controller:SetActiveWidget(r0_29.WB_QualificationBoard.Btn_Check)
    return 
  end
  local r1_29 = r0_29.Avatar.RaidSeasons[r0_29.Avatar.CurrentRaidSeasonId]
  if not r1_29 then
    return 
  end
  if not r1_29:IsPreRaidRewardGot() then
    r0_29.WB_OfficialBoard.Btn_GainReward.Key_Controller:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r1_0.InitGamepadView(r0_30)
  -- line: [323, 336] id: 30
  if r0_0.IsPreRaidTime() then
    r0_30.WB_QualificationBoard.WS_Controller:SetActiveWidget(r0_30.WB_QualificationBoard.Key_Reward)
    return 
  end
  local r1_30 = r0_30.Avatar.RaidSeasons[r0_30.Avatar.CurrentRaidSeasonId]
  if not r1_30 then
    return 
  end
  if not r1_30:IsPreRaidRewardGot() then
    r0_30.WB_OfficialBoard.Btn_GainReward.Key_Controller:SetVisibility(UIConst.VisibilityOp.Visible)
  end
end
function r1_0.HandleKeyDownOnGamePad(r0_31, r1_31)
  -- line: [338, 349] id: 31
  local r2_31 = false
  if r1_31 == UIConst.GamePadKey.SpecialLeft then
    r2_31 = true
    if r0_0.IsPreRaidTime() then
      r0_31:OnRewardPreviewClicked()
    else
      r0_31:OnRewardGotBtnClicked()
    end
  end
  return r2_31
end
AssembleComponents(r1_0)
return r1_0
