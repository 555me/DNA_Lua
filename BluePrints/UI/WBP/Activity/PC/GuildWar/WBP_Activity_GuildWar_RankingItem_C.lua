-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Activity\PC\GuildWar\WBP_Activity_GuildWar_RankingItem_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("BluePrints.UI.WBP.Chat.ChatController")
local r1_0 = require("BluePrints.UI.WBP.Friend.FriendController")
local r2_0 = r1_0:GetModel()
local r3_0 = require("BluePrints.UI.WBP.PersonInfo.PersonInfoController")
local r4_0 = require("BluePrints.UI.WBP.Activity.Widget.GuildWar.GuildWarUtils")
local r5_0 = Class("BluePrints.UI.BP_EMUserWidget_C")
local r6_0 = {
  "Texture2D\'/Game/UI/Texture/Static/Atlas/Activity/GuildWar/T_Activity_GuildWar_PatternRanking_1.T_Activity_GuildWar_PatternRanking_1\'",
  "Texture2D\'/Game/UI/Texture/Static/Atlas/Activity/GuildWar/T_Activity_GuildWar_PatternRanking_2.T_Activity_GuildWar_PatternRanking_2\'",
  "Texture2D\'/Game/UI/Texture/Static/Atlas/Activity/GuildWar/T_Activity_GuildWar_PatternRanking_3.T_Activity_GuildWar_PatternRanking_3\'"
}
local r7_0 = {
  "Texture2D\'/Game/UI/Texture/Static/Image/Activity/GuildWar/T_Activity_GuideWar_PatternRanking_L_1.T_Activity_GuideWar_PatternRanking_L_1\'",
  "Texture2D\'/Game/UI/Texture/Static/Image/Activity/GuildWar/T_Activity_GuideWar_PatternRanking_L_2.T_Activity_GuideWar_PatternRanking_L_2\'",
  "Texture2D\'/Game/UI/Texture/Static/Image/Activity/GuildWar/T_Activity_GuideWar_PatternRanking_L_3.T_Activity_GuideWar_PatternRanking_L_3\'"
}
function r5_0.Construct(r0_1)
  -- line: [21, 42] id: 1
  r0_1.RankIconTexture = {}
  for r5_1, r6_1 in ipairs(r6_0) do
    table.insert(r0_1.RankIconTexture, LoadObject(r6_0[r5_1]))
  end
  -- close: r1_1
  r0_1.RankPatternTexture = {}
  for r5_1, r6_1 in ipairs(r7_0) do
    table.insert(r0_1.RankPatternTexture, LoadObject(r7_0[r5_1]))
  end
  -- close: r1_1
  r0_1.Head_Player:BindOnClickEvent(function()
    -- line: [32, 37] id: 2
    r0_1.Head_Anchor:Open(true)
    if r0_1.ParentWidget then
      r0_1.ParentWidget:OnListRankItemClicked(r0_1.Content)
    end
  end)
  r0_1.Head_Anchor.OnGetMenuContentEvent:Bind(r0_1, r0_1.OnAnchorGetUserMenuContent)
  r0_1.Head_Anchor.OnMenuOpenChanged:Add(r0_1, r0_1.HeadMenuOpenChanged)
  r0_1:SetNavigationRuleBase(UE4.EUINavigation.Left, EUINavigationRule.Stop)
  r0_1:SetNavigationRuleBase(UE4.EUINavigation.Right, EUINavigationRule.Stop)
end
function r5_0.Destruct(r0_3)
  -- line: [44, 47] id: 3
  r0_3.Head_Anchor.OnGetMenuContentEvent:Unbind()
  r0_3.Head_Anchor.OnMenuOpenChanged:Remove(r0_3, r0_3.HeadMenuOpenChanged)
end
function r5_0.OnListItemObjectSet(r0_4, r1_4)
  -- line: [49, 73] id: 4
  r1_4.SelfWidget = r0_4
  r0_4.Content = r1_4
  r0_4.RankInfo = r1_4.RankInfo
  r0_4.SelfAvatar = r1_4.SelfAvatar
  r0_4.ParentWidget = r0_4.Content.ParentWidget
  if not r1_4.Empty then
    r0_4.WS_Type:SetActiveWidget(r0_4.Normal_Type)
    r0_4:InitPlayerRank()
    r0_4:InitPlayerInfo()
    r0_4:InitPlayerPoint()
    r0_4:InitPlayerSquad()
    if r0_4.ParentWidget.LastClickedItem == r1_4 then
      r0_4:PlayAnimation(r0_4.Click)
    else
      r0_4:PlayAnimation(r0_4.Normal)
    end
  else
    r0_4.WS_Type:SetActiveWidget(r0_4.Empty_Type)
  end
  r0_4:SetNavigationRuleCustom(EUINavigation.Up, {
    r0_4,
    r0_4.HandleNavigationUp
  })
  r0_4:SetNavigationRuleCustom(EUINavigation.Down, {
    r0_4,
    r0_4.HandleNavigationDown
  })
end
function r5_0.BP_OnEntryReleased(r0_5)
  -- line: [75, 78] id: 5
  r0_5.Content.SelfWidget = nil
  r0_5:PlayAnimation(r0_5.Normal)
end
function r5_0.OnFocusReceived(r0_6, r1_6, r2_6)
  -- line: [80, 85] id: 6
  if r0_6.ParentWidget then
    r0_6.ParentWidget:OnListRankItemClicked(r0_6.Content)
  end
  return UIUtils.Handled
end
function r5_0.HandleNavigationUp(r0_7)
  -- line: [87, 97] id: 7
  if not r0_7.RankInfo or not r0_7.RankInfo.RankNum then
    return 
  end
  local r1_7 = r0_7.RankInfo.RankNum + -1
  if r1_7 > 0 then
    r0_7.ParentWidget.List_Ranking:NavigateToIndex(r1_7 + -1)
  end
end
function r5_0.HandleNavigationDown(r0_8)
  -- line: [99, 109] id: 8
  if not r0_8.RankInfo or not r0_8.RankInfo.RankNum then
    return 
  end
  local r1_8 = r0_8.RankInfo.RankNum + -1
  if r1_8 < r0_8.ParentWidget.ValidItemNum + -1 then
    r0_8.ParentWidget.List_Ranking:NavigateToIndex(r1_8 + 1)
  end
end
function r5_0.InitPlayerRank(r0_9)
  -- line: [112, 141] id: 9
  local r1_9 = r0_9.RankInfo.BanState
  if r1_9 and r1_9 == 1 then
    r0_9.Text_Ranking:SetText(GText("RaidDungeon_Rank_Ban"))
    r0_9.Image_RankIcon:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_9.Image_RankPattern:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return 
  end
  local r2_9 = r0_9.RankInfo.RankNum
  if not r2_9 then
    return 
  end
  if r2_9 >= 1 and r2_9 <= 3 then
    r0_9.Image_RankIcon:SetVisibility(UIConst.VisibilityOp.Visible)
    r0_9.Image_RankPattern:SetVisibility(UIConst.VisibilityOp.Visible)
    r0_9.Image_RankIcon:SetBrushFromTexture(r0_9.RankIconTexture[r2_9])
    r0_9.Image_RankPattern:SetBrushFromTexture(r0_9.RankPatternTexture[r2_9])
  else
    r0_9.Image_RankIcon:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_9.Image_RankPattern:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if r2_9 > 0 then
    r0_9.Text_Ranking:SetText(r2_9)
  else
    r0_9.Text_Ranking:SetText(GText("RaidDungeon_Rank_Empty"))
  end
end
function r5_0.InitPlayerInfo(r0_10)
  -- line: [144, 182] id: 10
  if not r0_10.RankInfo then
    return 
  end
  if r0_10.RankInfo.HeadIconId then
    r0_10.Head_Player:SetHeadIconById(r0_10.RankInfo.HeadIconId)
  end
  if r0_10.RankInfo.HeadFrameId then
    r0_10.Head_Player:SetHeadFrame(r0_10.RankInfo.HeadFrameId)
  end
  r0_10.Text_Level:SetText(tostring(r0_10.RankInfo.Level))
  r0_10.Text_Name:SetText(GText(r0_10.RankInfo.Nickname and ""))
  local r1_10 = r0_10.RankInfo.TitleBefore
  if r1_10 == nil then
    r1_10 = r0_10.RankInfo.TitleAfter == nil
  else
    goto label_47	-- block#10 is visited secondly
  end
  local r2_10 = r0_10.RankInfo.TitleBefore
  if r2_10 < 0 then
    r2_10 = r0_10.RankInfo.TitleAfter < 0
  else
    goto label_57	-- block#14 is visited secondly
  end
  if r1_10 or r2_10 then
    r0_10.WS_Title:SetActiveWidgetIndex(1)
    return 
  end
  r0_10.WS_Title:SetActiveWidgetIndex(0)
  local r3_10 = r0_10.RankInfo.TitleFrame and 10001
  r0_10.Overlay_Title:ClearChildren()
  local r4_10 = UIManager(r0_10):LoadTitleFrameWidget(r3_10)
  if r4_10 then
    r0_10.Overlay_Title:AddChildToOverlay(r4_10)
    r4_10:SetTitleContent(r0_10.RankInfo.TitleBefore, r0_10.RankInfo.TitleAfter)
  end
end
function r5_0.InitPlayerPoint(r0_11)
  -- line: [185, 192] id: 11
  local r1_11 = r0_11.RankInfo.Score
  if r1_11 then
    r0_11.Text_Score:SetText(r1_11)
  else
    r0_11.Text_Score:SetText("--")
  end
end
function r5_0.InitPlayerSquad(r0_12)
  -- line: [195, 227] id: 12
  local r1_12 = r0_12.Content.RoleInfo
  local r2_12 = r0_12.Content.PetInfo
  for r6_12 = 1, 4, 1 do
    local r7_12 = r0_12["Slot_0" .. r6_12]
    local r8_12 = nil
    local r9_12 = nil
    if r6_12 <= 3 then
      r8_12 = r1_12 and r1_12[r6_12]
      local r10_12 = r8_12 and DataMgr.Char[r8_12.id]
      r9_12 = r10_12 and r10_12.Icon
    else
      r8_12 = r2_12
      local r10_12 = r8_12 and DataMgr.Pet[r8_12.id]
      r9_12 = r10_12 and r10_12.GachaIcon
    end
    if r8_12 and r9_12 then
      local r10_12 = LoadObject(r9_12)
      local r11_12 = r7_12.Img_Avatar:GetDynamicMaterial()
      if r10_12 and r11_12 then
        r11_12:SetTextureParameterValue("IconMap", r10_12)
      end
      r7_12.Text_Level:SetText(r8_12.level)
      r7_12.Switch_Type:SetActiveWidget(r7_12.Img_Avatar)
    else
      r7_12.Switch_Type:SetActiveWidget(r7_12.Empty)
      r7_12.Panel_Level:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
end
function r5_0.OnAnchorGetUserMenuContent(r0_13)
  -- line: [230, 262] id: 13
  local function r2_13(r0_16, r1_16)
    -- line: [242, 252] id: 16
    r0_16.Text = GText("UI_Chat_ShowRecord")
    function r0_16.Callback()
      -- line: [244, 251] id: 17
      if r1_16.Uid == r0_13.SelfAvatar.Uid then
        r3_0:OpenView()
      else
        GWorld:GetAvatar():CheckOtherPlayerPersonallInfo(r1_16.Uid)
      end
      r0_13.Head_Anchor:Close()
    end
  end
  local r3_13 = {
    function(r0_14, r1_14)
      -- line: [231, 240] id: 14
      if not r2_0:GetFriendDict()[r1_14.Uid] then
        r0_14.Text = GText("UI_Friend_AddFriend")
        function r0_14.Callback()
          -- line: [234, 237] id: 15
          r1_0:OpenAddFriendDialog(r0_13, r1_14)
          r0_13.Head_Anchor:Close()
        end
      end
    end,
    r2_13
  }
  if r0_13.RankInfo.Uid == r0_13.SelfAvatar.Uid or r2_0:GetFriendDict()[r0_13.RankInfo.Uid] then
    r3_13 = {
      r2_13
    }
  end
  return r0_0:OpenPlayerBtnList(r0_13, r0_13.RankInfo, r3_13)
end
function r5_0.HeadMenuOpenChanged(r0_18, r1_18)
  -- line: [265, 267] id: 18
  r0_18.ParentWidget:UpdateTapBottomKeyInfo(r1_18)
end
function r5_0.OnKeyDown(r0_19, r1_19, r2_19)
  -- line: [270, 291] id: 19
  local r3_19 = UE4.UKismetInputLibrary.GetKey(r2_19)
  local r4_19 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_19)
  local r5_19 = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_19) then
    if r4_19 == "Gamepad_FaceButton_Bottom" then
      r0_19.Head_Anchor:Open(true)
      r5_19 = true
    elseif r4_19 == "Gamepad_FaceButton_Right" and r0_19.Head_Anchor:IsOpen() then
      r0_19.Head_Anchor:Close()
      r0_19:SetFocus()
      r5_19 = true
    end
  end
  if r5_19 then
    return UWidgetBlueprintLibrary.Handled()
  else
    return UWidgetBlueprintLibrary.UnHandled()
  end
end
return r5_0
