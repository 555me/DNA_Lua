-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Play\Widget\GuildWar\WBP_Activity_GuildWar_InsideBoard_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.BP_UIState_C"
})
function r0_0.Construct(r0_1)
  -- line: [18, 24] id: 1
  r0_1.Super.Construct(r0_1)
  r0_1:AddDispatcher(EventID.OnPreRaidRankInfo, r0_1, r0_1.OnPreRaidRankInfo)
  r0_1:AddDispatcher(EventID.OnRaidRankInfo, r0_1, r0_1.OnRaidRankInfo)
  r0_1.Btn_Check.Btn_Click.OnClicked:Add(r0_1, r0_1.OpenGuildWarRewardPop)
  r0_1.UpdateInsideBoardTime = 60
end
function r0_0.Destruct(r0_2)
  -- line: [26, 29] id: 2
  r0_2.Super.Destruct(r0_2)
  r0_2:ClearUpdateTimer()
end
function r0_0.Init(r0_3)
  -- line: [32, 61] id: 3
  if not r0_3.Avatar then
    r0_3.Avatar = GWorld:GetAvatar()
    if not r0_3.Avatar then
      return 
    end
  end
  r0_3.bAnimation = true
  r0_3:UpdateSeasonData()
  r0_3:ClearUpdateTimer()
  r0_3:TryRaidSeasonRankInfo()
  r0_3.Text_Highest:SetText(GText("RaidDungeon_Max_Point"))
  if r0_3.RaidSeasons:IsPreRaidTime() then
    r0_3.Text_Standard:SetText(GText("RaidDungeon_NextRank_Point"))
    r0_3.Text_Type:SetText(GText("RaidDungeon_PreRaid_Rank"))
    r0_3.Panel_RewardBtn:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_3.Text_Reward:SetText(GText("UI_Event_MidTerm_GotoPreview"))
  elseif r0_3.RaidSeasons:IsRaidTime() then
    r0_3.Panel_RewardBtn:SetVisibility(ESlateVisibility.Collapsed)
    r0_3.Text_Standard:SetText(GText("RaidDungeon_Raid_Rank_Title"))
    r0_3.Text_Type:SetText(GText("RaidDungeon_Raid_Rank"))
  end
  r0_3.UpdateInsideBoardTimer = r0_3:AddTimer(r0_3.UpdateInsideBoardTime, r0_3.TryRaidSeasonRankInfo, true, 0, "UpdateGuildWar_InsideBoard", true)
end
function r0_0.TryRaidSeasonRankInfo(r0_4)
  -- line: [63, 71] id: 4
  if r0_4.RaidSeasons:IsPreRaidTime() then
    r0_4.Avatar:RaidSeasonGetPreRaidRankInfo()
  elseif r0_4.RaidSeasons:IsRaidTime() then
    r0_4.Avatar:RaidSeasonGetRaidRankInfo()
  end
end
function r0_0.UpdateSeasonData(r0_5)
  -- line: [74, 80] id: 5
  if not r0_5.Avatar then
    return 
  end
  r0_5.CurrentRaidSeasonId = r0_5.Avatar.CurrentRaidSeasonId
  r0_5.RaidSeasons = r0_5.Avatar.RaidSeasons[r0_5.CurrentRaidSeasonId]
  r0_5.RaidSeasonData = DataMgr.RaidSeason[r0_5.RaidSeasons.RaidSeasonId]
  r0_5.PreRaidRankData = DataMgr.PreRaidRank[r0_5.RaidSeasonData.PreRaidRank]
end
function r0_0.ClearUpdateTimer(r0_6)
  -- line: [83, 88] id: 6
  if r0_6:IsExistTimer(r0_6.UpdateInsideBoardTimer) then
    r0_6:RemoveTimer(r0_6.UpdateInsideBoardTimer)
    r0_6.UpdateInsideBoardTimer = nil
  end
end
function r0_0.UpdateShow(r0_7)
  -- line: [91, 158] id: 7
  r0_7:UpdateSeasonData()
  local r1_7 = r0_7.RaidSeasons
  if not r1_7 then
    return 
  end
  r0_7.WS_Rank:SetActiveWidgetIndex(0)
  local r2_7 = nil
  if r1_7:IsPreRaidTime() then
    r0_7.Panel_Tip01:SetVisibility(ESlateVisibility.Collapsed)
    if r1_7.MaxPreRaidScore == 0 or r1_7.BanState == 1 then
      r0_7.WS_Rank:SetActiveWidgetIndex(1)
      r0_7.WS_Row01:SetVisibility(ESlateVisibility.Collapsed)
    else
      r0_7.WS_Rank:SetActiveWidgetIndex(0)
      if r0_7.RankInfo.PreRaidGroupId == 1 then
        r0_7.WS_Row01:SetVisibility(ESlateVisibility.Collapsed)
      else
        r0_7.WS_Row01:SetActiveWidgetIndex(0)
        local r3_7 = r0_7.Text_Num
        local r5_7 = r0_7.RankInfo
        if r5_7 then
          r5_7 = r0_7.RankInfo.NextScore and 0
        else
          goto label_63	-- block#10 is visited secondly
        end
        r3_7:SetText(r5_7)
        r0_7.WS_Row01:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      end
    end
    r2_7 = r0_7["Rank_" .. r0_7.RankInfo.PreRaidGroupId]
  elseif r1_7:IsRaidTime() then
    if r1_7.MaxPreRaidScore == 0 or r1_7.BanState == 1 then
      r0_7.Panel_Tip01:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      r0_7.WS_Rank:SetActiveWidgetIndex(1)
      r0_7.WS_Row01:SetActiveWidgetIndex(1)
      r0_7.WS_Row02:SetActiveWidgetIndex(0)
      r0_7.Text_Tip01:SetText(GText("RaidDungeon_PreRaid_Abandon"))
      r0_7.Text_Tip02:SetText(GText("RaidDungeon_PreRaid_Reward"))
    else
      r0_7.Panel_Tip01:SetVisibility(ESlateVisibility.Collapsed)
      r0_7.WS_Row01:SetActiveWidgetIndex(0)
      r0_7.WS_Row02:SetActiveWidgetIndex(0)
      r0_7.Text_Num:SetText(r0_7.Rank and GText("UI_CHAR_FORCE_1101"))
      r0_7.WS_Rank:SetActiveWidgetIndex(0)
      if r0_7.bAnimation then
        AudioManager(r0_7):PlayUISound(r0_7, "event:/ui/activity/gerengonghuizhan_add_rank", nil, nil)
        r0_7:PlayAnimation(r0_7.Ranking_Up)
      end
    end
    DebugPrint("Season.PreRaidGroupId  " .. r1_7.PreRaidGroupId)
    r2_7 = r0_7["Rank_" .. r1_7.PreRaidGroupId]
  end
  local r3_7 = r1_7:IsPreRaidTime()
  if r3_7 then
    r3_7 = r1_7.MaxPreRaidScore and r1_7.MaxRaidScore
  else
    goto label_172	-- block#24 is visited secondly
  end
  if r2_7 then
    local r4_7 = r0_7.Icon_Rank:GetDynamicMaterial()
    if r4_7 then
      r4_7:SetTextureParameterValue("MainTex", r2_7)
    end
    if r0_7.bAnimation then
      AudioManager(r0_7):PlayUISound(r0_7, "event:/ui/activity/gerengonghuizhan_add_level", nil, nil)
      r0_7:PlayAnimation(r0_7.Rank_Up)
    end
  end
  r0_7.Text_Score:SetText(r3_7)
  r0_7.bAnimation = false
end
function r0_0.OnPreRaidRankInfo(r0_8, r1_8)
  -- line: [161, 164] id: 8
  r0_8.RankInfo = r1_8
  r0_8:UpdateShow()
end
function r0_0.OnRaidRankInfo(r0_9, r1_9)
  -- line: [166, 169] id: 9
  r0_9.Rank = r1_9.Rank and -1
  r0_9:UpdateShow()
end
function r0_0.OpenGuildWarRewardPop(r0_10)
  -- line: [171, 174] id: 10
  UIManager(r0_10):LoadUINew("GuildWarRewardPop"):Init()
end
return r0_0
