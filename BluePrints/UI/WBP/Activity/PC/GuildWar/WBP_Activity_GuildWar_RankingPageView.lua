-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Activity\PC\GuildWar\WBP_Activity_GuildWar_RankingPageView.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("BluePrints.UI.WBP.Armory.ActorController.Armory_ActorController")
local r1_0 = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local r2_0 = require("BluePrints.UI.WBP.Activity.Widget.GuildWar.GuildWarUtils")
local r3_0 = Class({})
function r3_0.OnLoaded(r0_1, ...)
  -- line: [9, 18] id: 1
  local r2_1 = nil	-- notice: implicit variable refs by block#[0]
  local r1_1 = nil	-- notice: implicit variable refs by block#[0]
  ... = ... -- error: untaken top expr
  r0_1.IsFirstOpen = true
  r0_1:InitOnGetTopN(r2_1)
  r0_1:InitRankInfoSelf(r1_1)
  r0_1:InitView()
end
function r3_0.Construct(r0_2)
  -- line: [20, 28] id: 2
  r0_2.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(r0_2)
  if IsValid(r0_2.GameInputModeSubsystem) then
    r0_2.IsGamePad = r0_2.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad
    r0_2.GameInputModeSubsystem.OnInputMethodChanged:Add(r0_2, r0_2.RefreshOpInfoByInputDevice)
  end
  r0_2.Avatar = GWorld:GetAvatar()
end
function r3_0.Destruct(r0_3)
  -- line: [30, 34] id: 3
  if IsValid(r0_3.GameInputModeSubsystem) then
    r0_3.GameInputModeSubsystem.OnInputMethodChanged:Remove(r0_3, r0_3.RefreshOpInfoByInputDevice)
  end
end
function r3_0.RefreshOpInfoByInputDevice(r0_4, r1_4, r2_4)
  -- line: [36, 42] id: 4
  r0_4.IsGamePad = r1_4 == ECommonInputType.Gamepad
  if r0_4.IsGamePad and r0_4.LastClickedItem and UIUtils.HasAnyFocus(r0_4) then
    r0_4.List_Ranking:NavigateToIndex(r0_4.LastClickedItem.RankInfo.RankNum + -1)
  end
end
function r3_0.InitView(r0_5)
  -- line: [44, 53] id: 5
  r0_5.Text_Title:SetText(GText("RaidDungeon_Raid_Rank"))
  r0_5.Text_Ranking:SetText(GText("RaidDungeon_Rank"))
  r0_5.Text_Name:SetText(GText("RaidDungeon_Rank_Name"))
  r0_5.Text_Score:SetText(GText("RaidDungeon_Max_Point_Rank"))
  r0_5.Text_Team:SetText(GText("RaidDungeon_Rank_CharList"))
  r0_5:InitCommonTab()
end
function r3_0.InitOnGetTopN(r0_6, r1_6)
  -- line: [56, 67] id: 6
  r0_6:InitPreviewScene(r1_6)
  if not r1_6 or r2_0.IsEmptyTable(r1_6) then
    r0_6.List_Ranking:ClearListItems()
  else
    r0_6:InitRankInfoTopN(r1_6)
  end
end
function r3_0.InitPreviewScene(r0_7, r1_7)
  -- line: [70, 102] id: 7
  local r2_7 = nil
  if r2_0.IsEmptyTable(r1_7) or r1_7[1].MaxSquad == nil or r1_7[1].MaxSquad == "" then
    r0_7.ActorController = r0_0:New({
      ViewUI = r0_7,
      IsPreviewMode = true,
      Char = r0_7.Avatar.Chars[r0_7.Avatar.CurrentChar],
      EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon,
    })
    r2_7 = r0_7.Avatar.Weapons[r0_7.Avatar.MeleeWeapon]
  else
    local r3_7 = r0_7:CreateDummyAvatarByRankInfo(r1_7[1])
    local r4_7, r5_7 = next(r3_7.Chars)
    r0_7.ActorController = r0_0:New({
      ViewUI = r0_7,
      IsPreviewMode = true,
      Char = r5_7,
      Avatar = r3_7,
      EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon,
    })
    local r6_7, r7_7 = next(r3_7.Weapons)
    r2_7 = r7_7
  end
  r0_7.ActorController:OnOpened()
  if r2_7 then
    r0_7.ActorController:ChangeWeaponModel(r2_7)
    local r3_7 = r2_7:IsMelee()
    if r3_7 then
      r3_7 = "Melee" and "Ranged"
    else
      goto label_78	-- block#8 is visited secondly
    end
    r0_7.ActorController:SetMontageAndCamera("Weapon", r3_7)
  end
end
function r3_0.CreateDummyAvatarByRankInfo(r0_8, r1_8)
  -- line: [104, 131] id: 8
  if not r1_8 then
    return 
  end
  local r2_8 = SerializeUtils:UnSerialize(r1_8.MaxSquad)
  if not r2_8 or r2_0.IsEmptyTable(r2_8) then
    return 
  end
  local r3_8 = r2_8.AvatarInfo and r2_8.AvatarInfo.CharacterInfo
  if not r3_8 then
    return 
  end
  if r2_0.IsEmptyTable(r3_8.RoleInfo) or r2_0.IsEmptyTable(r3_8.MeleeWeapon) then
    return 
  end
  local r4_8 = {}
  r1_0._CreateDummyAvatarCustom(r4_8, {
    CharInfos = {
      r3_8.RoleInfo
    },
    WeaponInfos = {
      r3_8.MeleeWeapon
    },
  })
  return r4_8
end
function r3_0.SetRankingPlayerPreview(r0_9, r1_9)
  -- line: [134, 149] id: 9
  if not r0_9.ActorController or not r1_9 then
    return 
  end
  local r2_9 = r0_9:CreateDummyAvatarByRankInfo(r1_9)
  if r2_9 then
    local r3_9, r4_9 = next(r2_9.Chars)
    local r5_9, r6_9 = next(r2_9.Weapons)
    local r7_9 = r6_9:IsMelee()
    if r7_9 then
      r7_9 = "Melee" and "Ranged"
    else
      goto label_24	-- block#6 is visited secondly
    end
    r0_9.ActorController:SetAvatar(r2_9)
    r0_9.ActorController:ChangeCharModel(r4_9)
    r0_9.ActorController:ChangeWeaponModel(r6_9)
    r0_9.ActorController:SetMontageAndCamera("Weapon", r7_9)
  end
end
function r3_0.InitRankInfoTopN(r0_10, r1_10)
  -- line: [152, 194] id: 10
  if not r1_10 or r2_0.IsEmptyTable(r1_10) then
    r0_10.WS_Type:SetActiveWidget(r0_10.Com_Empty)
    r0_10.Text_Empty:SetText(GText("RaidDungeon_Rank_Empty"))
    return 
  end
  r0_10.WS_Type:SetActiveWidget(r0_10.List_Ranking)
  r0_10.List_Ranking:ClearListItems()
  local r2_10 = 0
  for r7_10, r8_10 in pairs(r1_10 and {}) do
    if r8_10.BanState ~= 1 then
      r2_10 = r2_10 + 1
      local r9_10 = NewObject(UIUtils.GetCommonItemContentClass())
      r9_10.RankInfo = r8_10
      r9_10.RoleInfo, r9_10.PetInfo = r0_10:GetMaxScoreSquad(r8_10.MaxSquad)
      r9_10.RankInfo.RankNum = r2_10
      r9_10.ParentWidget = r0_10
      r9_10.SelfAvatar = r0_10.Avatar
      r0_10.List_Ranking:AddItem(r9_10)
      PrintTable(r9_10.RoleInfo and r8_10.MaxSquad and "该玩家阵容为空", 2, string.format("看看排行榜第 %d 名的阵容数据：", r7_10))
    end
  end
  -- close: r3_10
  r0_10.List_Ranking:NavigateToIndex(0)
  r0_10.ValidItemNum = r2_10
  r0_10.List_Ranking.BP_OnItemClicked:Clear()
  r0_10.List_Ranking.BP_OnItemClicked:Add(r0_10, r0_10.OnListRankItemClicked)
  r0_10.List_Ranking.BP_OnItemIsHoveredChanged:Clear()
  r0_10.List_Ranking.BP_OnItemIsHoveredChanged:Add(r0_10, r0_10.OnListRankItemIsHoveredChanged)
  r0_10.List_Ranking.OnListViewScrolled:Add(r0_10, r0_10.OnListRankScrolled)
end
function r3_0.InitRankInfoSelf(r0_11, r1_11)
  -- line: [197, 224] id: 11
  local r3_11 = r0_11.Avatar.RaidSeasons[r0_11.Avatar.CurrentRaidSeasonId]
  local r4_11 = {}
  if not r1_11 then
    r1_11 = {}
  end
  local r5_11 = r1_11.Rank
  if r5_11 then
    r5_11 = r1_11.Rank
    if r5_11 > 0 then
      r5_11 = r1_11.Rank and -1
    end
  else
    goto label_21	-- block#5 is visited secondly
  end
  r4_11.RankNum = r5_11
  r4_11.BanState = r3_11.BanState
  r4_11.HeadIconId = r0_11.Avatar.HeadIconId
  r4_11.HeadFrameId = r0_11.Avatar.HeadFrameId
  r4_11.Level = r0_11.Avatar.Level
  r4_11.Nickname = r0_11.Avatar.Nickname
  r4_11.TitleBefore = r0_11.Avatar.TitleBefore
  r4_11.TitleAfter = r0_11.Avatar.TitleAfter
  r4_11.TitleFrame = r0_11.Avatar.TitleFrame
  r4_11.Score = r3_11.MaxRaidScore
  local r5_11, r6_11 = r0_11:GetMaxScoreSquad(r1_11.MaxSquad)
  local r7_11 = {
    RankInfo = r4_11,
    ParentWidget = r0_11,
    RoleInfo = r5_11,
    PetInfo = r6_11,
  }
  r0_11.SelfItemData = r7_11
  r0_11.Ranking_Myself:OnListItemObjectSet(r7_11)
  r0_11.Ranking_Myself.Button_Myself.OnPressed:Add(r0_11, r0_11.OnMyselfButtonPressed)
  r0_11.Ranking_Myself.Button_Myself.OnClicked:Add(r0_11, r0_11.OnMyselfButtonClicked)
  r0_11.Ranking_Myself.Button_Myself.OnHovered:Add(r0_11, r0_11.OnMyselfButtonHovered)
end
function r3_0.GetMaxScoreSquad(r0_12, r1_12)
  -- line: [227, 274] id: 12
  if not r1_12 then
    return 
  end
  local r2_12 = SerializeUtils:UnSerialize(r1_12)
  if not r2_12 or r2_0.IsEmptyTable(r2_12) then
    return 
  end
  local r3_12 = {}
  local r4_12 = {}
  if r2_12.AvatarInfo then
    local r5_12 = r2_12.AvatarInfo.CharacterInfo
    if r5_12 and r5_12.RoleInfo then
      r3_12[1] = {
        id = r5_12.RoleInfo.RoleId,
        level = r5_12.RoleInfo.Level,
      }
    end
    local r6_12 = 2
    local r7_12 = r2_12.AvatarInfo.PhantomInfo1
    if r7_12 and r7_12.RoleInfo then
      r3_12[r6_12] = {
        id = r7_12.RoleInfo.RoleId,
        level = r7_12.RoleInfo.Level,
      }
      r6_12 = r6_12 + 1
    end
    local r8_12 = r2_12.AvatarInfo.PhantomInfo2
    if r8_12 and r8_12.RoleInfo then
      r3_12[r6_12] = {
        id = r8_12.RoleInfo.RoleId,
        level = r8_12.RoleInfo.Level,
      }
    end
  end
  if r2_12.CommonCombatInfo then
    r4_12 = {
      id = r2_12.CommonCombatInfo.pet_id,
      level = r2_12.CommonCombatInfo.pet_level,
    }
  end
  return r3_12, r4_12
end
function r3_0.OnMyselfButtonClicked(r0_13)
  -- line: [277, 292] id: 13
  if not r0_13.IsGamePad then
    r0_13.Ranking_Myself:PlayAnimation(r0_13.Ranking_Myself.Click)
  end
  local r1_13 = r0_13.SelfItemData.RankInfo.RankNum
  if r1_13 and r1_13 >= 1 then
    if r0_13.LastClickedItem and r0_13.LastClickedItem.RankInfo.RankNum ~= r1_13 then
      local r2_13 = r0_13.LastClickedItem
      if r2_13 then
        r2_13 = r0_13.LastClickedItem.SelfWidget and nil
      else
        goto label_30	-- block#8 is visited secondly
      end
      if r2_13 then
        r2_13:PlayAnimation(r2_13.Normal)
      end
      r0_13.LastClickedItem = nil
    end
    r0_13.List_Ranking:NavigateToIndex(r1_13 + -1)
  end
end
function r3_0.OnMyselfButtonPressed(r0_14)
  -- line: [294, 296] id: 14
  r0_14.Ranking_Myself:PlayAnimation(r0_14.Ranking_Myself.Press)
end
function r3_0.OnMyselfButtonHovered(r0_15)
  -- line: [298, 301] id: 15
  r0_15.Ranking_Myself:StopAnimation(r0_15.Ranking_Myself.UnHover)
  r0_15.Ranking_Myself:PlayAnimation(r0_15.Ranking_Myself.Hover)
end
function r3_0.OnListRankItemIsHoveredChanged(r0_16, r1_16, r2_16)
  -- line: [303, 324] id: 16
  if r0_16.IsGamePad then
    return 
  end
  if r1_16.IsSelected or r1_16.Empty then
    return 
  end
  local r3_16 = r1_16.SelfWidget
  if not r3_16 then
    return 
  end
  if r0_16.LastClickedItem == r1_16 then
    return 
  end
  if r2_16 then
    r3_16:StopAnimation(r3_16.UnHover)
    r3_16:PlayAnimation(r3_16.Hover)
  else
    r3_16:StopAnimation(r3_16.Hover)
    r3_16:PlayAnimation(r3_16.UnHover)
  end
end
function r3_0.OnListRankScrolled(r0_17)
  -- line: [326, 336] id: 17
  if not r0_17.LastClickedItem then
    return 
  end
  local r1_17 = r0_17.LastClickedItem.SelfWidget
  if not r1_17 then
    return 
  end
  r1_17.Head_Anchor:Close()
end
function r3_0.OnListRankItemClicked(r0_18, r1_18)
  -- line: [338, 366] id: 18
  if r1_18.Empty then
    return 
  end
  if r0_18.LastClickedItem == r1_18 then
    return 
  end
  local r2_18 = r1_18.SelfWidget
  if not r2_18 then
    return 
  end
  if not r0_18.IsFirstOpen then
    r0_18:SetRankingPlayerPreview(r1_18.RankInfo)
  end
  r0_18.IsFirstOpen = nil
  r2_18:StopAnimation(r2_18.Normal)
  r2_18:PlayAnimation(r2_18.Click)
  if r0_18.LastClickedItem then
    local r3_18 = r0_18.LastClickedItem.SelfWidget
    if r3_18 then
      r3_18:StopAnimation(r3_18.Click)
      r3_18:PlayAnimation(r3_18.Normal)
    end
  end
  r0_18.LastClickedItem = r1_18
end
return r3_0
