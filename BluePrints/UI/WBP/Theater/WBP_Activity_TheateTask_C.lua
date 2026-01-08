-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Theater\WBP_Activity_TheateTask_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.BP_UIState_C"
})
function r0_0.Construct(r0_1)
  -- line: [13, 15] id: 1
  r0_1.RegionId = nil
end
function r0_0.InitUI(r0_2)
  -- line: [17, 34] id: 2
  local r1_2 = GWorld:GetAvatar()
  if not r1_2 then
    return 
  end
  r0_2.RegionId = r1_2:GetCurrentRegionId()
  r0_2.Text_Title:SetText(GText("TheaterOnline_Game_Name"))
  r0_2.Text_Progress:SetText(GText("TheaterOnline_Game_Waiting"))
  local r5_2, r6_2 = UIUtils.GetLeftTimeStrStyle2(TimeUtils.NowTime() + r0_2:CalculateRemainTimeToNextHour())
  r0_2.WBP_Com_Time:SetTimeText("", r5_2)
  r0_2:StartCountdownTimer()
end
function r0_0.InitFailUI(r0_3)
  -- line: [36, 48] id: 3
  r0_3.JoinCountDown = true
  r0_3.Text_Title:SetText(GText("TheaterOnline_Game_Name"))
  r0_3.Text_Progress:SetText(GText("TheaterOnline_Game_Sign_Waiting"))
  local r4_3, r5_3 = UIUtils.GetLeftTimeStrStyle2(TimeUtils.NowTime() + r0_3:CalculateRemainTimeToAvailableJoin())
  r0_3.WBP_Com_Time:SetTimeText("", r4_3)
  r0_3:StartCountdownTimer()
end
function r0_0.CalculateRemainTimeToNextHour(r0_4)
  -- line: [50, 67] id: 4
  local r2_4 = os.date("*t", TimeUtils.NowTime())
  local r5_4 = r2_4.min * 60 + r2_4.sec
  local r6_4 = nil
  if r5_4 <= 1800 then
    r6_4 = 1800
  else
    r6_4 = 3600
  end
  return r6_4 - r5_4
end
function r0_0.CalculateRemainTimeToAvailableJoin(r0_5)
  -- line: [69, 77] id: 5
  local r1_5 = DataMgr.TheaterConstant.NpcInteractON.ConstantValue
  local r2_5 = TimeUtils.NowTime()
  if r2_5 % 1800 <= r1_5 then
    return r1_5 - r2_5 % 1800
  end
  return 0
end
function r0_0.StartCountdownTimer(r0_6)
  -- line: [79, 89] id: 6
  if r0_6.CountdownTimer then
    r0_6:RemoveTimer(r0_6.CountdownTimer)
  end
  r0_6.CountdownTimer = r0_6:AddTimer(1, function()
    -- line: [86, 88] id: 7
    r0_6:UpdateCountdown()
  end, true, 0, "TheaterCountdown", true)
end
function r0_0.UpdateCountdown(r0_8)
  -- line: [91, 127] id: 8
  local r1_8 = TimeUtils.NowTime()
  local r2_8 = nil
  if r0_8.JoinCountDown then
    r2_8 = r0_8:CalculateRemainTimeToAvailableJoin()
  else
    r2_8 = r0_8:CalculateRemainTimeToNextHour()
  end
  if r2_8 <= 0 then
    if r0_8.CountdownTimer then
      r0_8:RemoveTimer(r0_8.CountdownTimer)
      r0_8.CountdownTimer = nil
    end
    r0_8:Close()
  else
    local r4_8, r5_8 = UIUtils.GetLeftTimeStrStyle2(r1_8 + r2_8)
    r0_8.WBP_Com_Time:SetTimeText("", r4_8)
  end
  local r3_8 = GWorld:GetAvatar()
  if not r3_8 then
    return 
  end
  local r4_8 = r3_8.CurrentRegionId
  if not UE4.UGameplayStatics.GetGameState(GWorld.GameInstance):IsInRegion() or r4_8 ~= 101901 then
    r0_8:Close()
  elseif r3_8:IsInHardBoss() then
    r0_8:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    r0_8:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end
function r0_0.Close(r0_9)
  -- line: [129, 144] id: 9
  local r1_9 = UIManager(r0_9):GetUI("BattleMain")
  if r1_9 and r1_9.TheaterCheckTimer then
    r1_9:RemoveTimer(r1_9.TheaterCheckTimer)
    r1_9.TheaterCheckTimer = nil
  end
  if r0_9.CountdownTimer then
    r0_9:RemoveTimer(r0_9.CountdownTimer)
    r0_9.CountdownTimer = nil
  end
  r0_9.IsInit = true
  r0_9.Super.Close(r0_9)
end
return r0_0
