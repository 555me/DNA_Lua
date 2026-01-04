-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Play\Widget\GuildWar\WBP_Activity_GuildWar_LevelItem_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Const.RomanNum
local r1_0 = Class({
  "BluePrints.UI.BP_UIState_C"
})
r1_0._components = {
  "BluePrints.UI.WBP.Play.Widget.GuildWar.GuildWarView"
}
function r1_0.Construct(r0_1)
  -- line: [15, 23] id: 1
  r1_0.Super.Construct(r0_1)
  r0_1.IsSelect = false
  r0_1.Text_LvName:SetText(GText("UI_LEVEL_NAME"))
  r0_1.New_Tag:SetVisibility(ESlateVisibility.Collapsed)
  r0_1.Btn_Click.OnClicked:Add(r0_1, r0_1.OnSubCellClicked)
  r0_1.Mobile = CommonUtils.GetDeviceTypeByPlatformName(r0_1) == "Mobile"
  r0_1.Text_Unlock:SetText(GText("UI_RaidDungeon_Unlock_Time"))
end
function r1_0.Destruct(r0_2)
  -- line: [25, 29] id: 2
  if r0_2:IsExistTimer(r0_2.UpdateGuildWarTimer) then
    r0_2:RemoveTimer(r0_2.UpdateGuildWarTimer)
  end
end
function r1_0.BindEventOnClicked(r0_3, r1_3, r2_3, ...)
  -- line: [32, 39] id: 3
  if not r1_3 or not r2_3 then
    return 
  end
  r0_3.Obj = r1_3
  r0_3.Func = r2_3
  r0_3.Params = {
    ...
  }
end
function r1_0.OnFocusReceived(r0_4, r1_4, r2_4)
  -- line: [42, 47] id: 4
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    r0_4:OnSubCellClicked()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end
function r1_0.InitDungeonInfo(r0_5, r1_5, r2_5, r3_5, r4_5)
  -- line: [50, 96] id: 5
  r0_5.DungeonId = r1_5
  r0_5.Parent = r4_5
  local r5_5 = DataMgr.Dungeon[r1_5]
  if not r5_5 then
    DebugPrint("ZDX_找不到关卡数据:", r1_5)
    return 
  end
  r0_5.Bottom:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  if r0_5:CheckDungeonCondition(r1_5) then
    r0_5:PlayAnimation(r0_5.Normal)
  else
    r0_5:PlayAnimation(r0_5.Lock)
    if r0_5:IsExistTimer(r0_5.UpdateGuildWarTimer) then
      r0_5:RemoveTimer(r0_5.UpdateGuildWarTimer)
    end
    r0_5.UpdateGuildWarTimer = r0_5:AddTimer(3, function()
      -- line: [71, 75] id: 6
      r0_5:RefreshBtnState()
      r0_5:ShowTips(false)
      r0_5:RemoveTimer(r0_5.UpdateGuildWarTimer)
    end, true, 0, "UpdateGuildWar_LevelItem", true)
  end
  if r3_5 then
    r0_5.Title_Level:SetText(GText(r5_5.DungeonName))
  else
    r0_5.Title_Level:SetText(GText(r0_0[r2_5]))
  end
  r0_5.Text_Up:SetText(GText("RaidDungeon_Base_Point_Up"))
  if r5_5.DungeonLevel then
    r0_5.Text_Lv:SetVisibility(ESlateVisibility.Visible)
    r0_5.Text_Lv:SetText(r5_5.DungeonLevel)
  else
    r0_5.Text_Lv:SetVisibility(ESlateVisibility.Collapsed)
  end
end
function r1_0.OnSubCellClicked(r0_7)
  -- line: [99, 112] id: 7
  if r0_7.IsSelect then
    return 
  end
  AudioManager(r0_7):PlayUISound(r0_7, "event:/ui/activity/gerengonghuizhan_level_btn_click", nil, nil)
  if r0_7:CheckDungeonCondition(r0_7.DungeonId) then
    if DataMgr.RaidDungeon[r0_7.DungeonId].DifficultyLevel <= 1 then
      r0_7:PlayAnimationForward(r0_7.Click_Normal)
    else
      r0_7:PlayAnimationForward(r0_7.Click)
    end
  end
  if r0_7.Obj and r0_7.Func then
    r0_7.Func(r0_7.Obj, table.unpack(r0_7.Params))
  end
end
function r1_0.IsShowBottom(r0_8)
  -- line: [115, 121] id: 8
end
function r1_0.SetDifficultyLevel(r0_9)
  -- line: [124, 126] id: 9
end
function r1_0.SetTimeShow(r0_10)
  -- line: [128, 133] id: 10
  r0_10:UpdateTimeCountDown()
  r0_10:AddTimer(1, r0_10.UpdateTimeCountDown, false, 3, "GuildWar_LevelItem_UpdateTimeContent")
  r0_10:ShowTips(true)
  r0_10:AddTimer(3, function()
    -- line: [132, 132] id: 11
    r0_10:ShowTips(false)
  end, false, 0, "GuildWar_LevelItemTips_UpdateTimeContent")
end
function r1_0.UpdateTimeCountDown(r0_12)
  -- line: [135, 141] id: 12
  local r3_12, r4_12 = UIUtils.GetLeftTimeStrStyle2(DataMgr.RaidDungeon[r0_12.DungeonId].UnlockDate)
  r0_12.Time:SetTimeText("", r3_12)
  r0_12:RefreshBtnState()
end
function r1_0.ShowTips(r0_13, r1_13)
  -- line: [143, 145] id: 13
  local r2_13 = r0_13.Panel_Tip
  local r4_13 = nil	-- notice: implicit variable refs by block#[3]
  if r1_13 then
    r4_13 = ESlateVisibility.SelfHitTestInvisible
    if not r4_13 then
      ::label_8::
      r4_13 = ESlateVisibility.Collapsed
    end
  else
    goto label_8	-- block#2 is visited secondly
  end
  r2_13:SetVisibility(r4_13)
end
function r1_0.IsMatching(r0_14)
  -- line: [147, 150] id: 14
  return UIManager(r0_14):GetUIObj("DungeonMatchTimingBar") and true
end
function r1_0.RefreshBtnState(r0_15)
  -- line: [152, 163] id: 15
  if r0_15:CheckDungeonCondition(r0_15.DungeonId) then
    if not r0_15.IsSelect then
      r0_15:PlayAnimation(r0_15.Normal)
    end
  else
    r0_15:PlayAnimation(r0_15.Lock)
  end
end
function r1_0.OnMouseEnter(r0_16, r1_16, r2_16)
  -- line: [165, 175] id: 16
  r0_16.IsEnter = true
  if r0_16.Mobile or r0_16.IsSelect or r0_16:IsPlayingAnimation(r0_16.Click) then
    return 
  end
  r0_16:StopAnimation(r0_16.UnHover)
  r0_16:PlayAnimation(r0_16.Hover)
end
function r1_0.OnMouseLeave(r0_17, r1_17, r2_17)
  -- line: [177, 184] id: 17
  r0_17.IsEnter = false
  if r0_17.Mobile or r0_17.IsSelect then
    return 
  end
  r0_17:StopAnimation(r0_17.Hover)
  r0_17:PlayAnimation(r0_17.Unhover)
end
AssembleComponents(r1_0)
return r1_0
