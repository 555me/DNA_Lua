-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Theater\WBP_Activity_Theater_Btn_Item03_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})
function r0_0.OnListItemObjectSet(r0_1, r1_1)
  -- line: [13, 18] id: 1
  r0_1:Init(r1_1)
  r0_1.Content = r1_1
  r0_1.Content.SelfWidget = r0_1
end
function r0_0.Init(r0_2, r1_2)
  -- line: [20, 38] id: 2
  r0_2.LevelId = r1_2.LevelId
  r0_2.ParentWidget = r1_2.ParentWidget
  r0_2.TotalTime = r1_2.Time
  r0_2.CountDownTime = r1_2.Time
  r0_2.Index = r1_2.Index
  r0_2.Switch_item:SetActiveWidgetIndex(0)
  if r1_2.IsNotDisplay then
    if r0_2.ParentWidget.CurLevelIndex and r0_2.ParentWidget.CurLevelIndex == r0_2.Index then
      r0_2.CountDownTime = r1_2.EndTime - TimeUtils.NowTime()
      r0_2:OnLevelStart()
    else
      r0_2:PlayAnimation(r0_2.Fail)
      r0_2.Image_Time:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  else
    r0_2:PlayAnimation(r0_2.Normal)
  end
end
function r0_0.OnLevelStart(r0_3)
  -- line: [40, 73] id: 3
  r0_3:PlayAnimation(r0_3.Load)
  r0_3.Text_Time:SetText(tostring(r0_3.CountDownTime))
  r0_3.Image_Time:GetDynamicMaterial():SetScalarParameterValue("Percent", 1)
  if r0_3.CountDownTimer then
    r0_3:RemoveTimer(r0_3.CountDownTimer)
  end
  r0_3.CountDownTimer = r0_3:AddTimer(1, function()
    -- line: [49, 72] id: 4
    if r0_3.FinishPerform then
      r0_3.CountDownTime = 0
    else
      r0_3.CountDownTime = r0_3.CountDownTime + -1
    end
    r0_3.Text_Time:SetText(tostring(r0_3.CountDownTime))
    r0_3.Image_Time:GetDynamicMaterial():SetScalarParameterValue("Percent", r0_3.CountDownTime / r0_3.TotalTime)
    DebugPrint("ayff Theater倒计时:" .. r0_3.CountDownTime)
    if r0_3.CountDownTime <= 10 and r0_3.CountDownTime > 0 then
      r0_3:PlayAnimation(r0_3.Load_Countdown)
      AudioManager(r0_3):PlayUISound(r0_3, "event:/ui/common/countdown_warning_short_reverb", nil, nil)
    elseif r0_3.CountDownTime <= 0 then
      r0_3:RemoveTimer(r0_3.CountDownTimer)
      r0_3.CountDownTimer = nil
      r0_3:OnCountDownFinished()
    else
      r0_3.Switch_item:SetActiveWidgetIndex(1)
    end
  end, true, 0, "LevelCountDown", true)
end
function r0_0.OnCountDownFinished(r0_5)
  -- line: [75, 92] id: 5
  if r0_5.SuccessPerform == true then
    if not r0_5.IsFinished then
      r0_5:PlayAnimation(r0_5.Success)
      r0_5:RemoveTimer("LevelSuccessDelay")
      r0_5.ParentWidget:RemoveTimer("TheaterPerformResultDelay")
      r0_5.ParentWidget:PlayAnimation(r0_5.Tips_Success)
    end
    AudioManager(r0_5):PlayUISound(r0_5, "event:/ui/activity/theater_online_skill_match", nil, nil)
    r0_5.IsFinished = true
  else
    r0_5:PlayAnimation(r0_5.Fail)
    AudioManager(r0_5):PlayUISound(r0_5, "event:/ui/activity/theater_online_skill_match_fail", nil, nil)
  end
  r0_5.YellowBg:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end
function r0_0.SetSuccess(r0_6, r1_6)
  -- line: [94, 106] id: 6
  r0_6.SuccessPerform = r1_6
  if r0_6.SuccessPerform == true then
    r0_6:AddTimer(DataMgr.TheaterConstant.TheaterPerformResultDelay.ConstantValue and 0, function()
      -- line: [100, 104] id: 7
      r0_6:PlayAnimation(r0_6.Success_Load)
      r0_6.Text_Time:SetVisibility(UE4.ESlateVisibility.Collapsed)
      r0_6.IsFinished = true
    end, false, 0, "LevelSuccessDelay")
  end
end
function r0_0.Close(r0_8)
  -- line: [108, 111] id: 8
  r0_8.ParentWidget:Close()
  r0_8.Super.Close(r0_8)
end
function r0_0.Destruct(r0_9)
  -- line: [113, 118] id: 9
  if r0_9.CountDownTimer then
    r0_9:RemoveTimer(r0_9.CountDownTimer)
    r0_9.CountDownTimer = nil
  end
end
return r0_0
