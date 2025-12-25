-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Theater\WBP_Activity_TheateTask_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.BP_UIState_C"
})
function r0_0.Construct(r0_1)
  -- line: [13, 16] id: 1
  r0_1.RegionId = nil
  r0_1:InitUI()
end
function r0_0.InitUI(r0_2)
  -- line: [18, 35] id: 2
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
function r0_0.CalculateRemainTimeToNextHour(r0_3)
  -- line: [37, 54] id: 3
  local r2_3 = os.date("*t", TimeUtils.NowTime())
  local r5_3 = r2_3.min * 60 + r2_3.sec
  local r6_3 = nil
  if r5_3 <= 1800 then
    r6_3 = 1800
  else
    r6_3 = 3600
  end
  return r6_3 - r5_3
end
function r0_0.StartCountdownTimer(r0_4)
  -- line: [56, 66] id: 4
  if r0_4.CountdownTimer then
    r0_4:RemoveTimer(r0_4.CountdownTimer)
  end
  r0_4.CountdownTimer = r0_4:AddTimer(1, function()
    -- line: [63, 65] id: 5
    r0_4:UpdateCountdown()
  end, true, 0, "TheaterCountdown", true)
end
function r0_0.UpdateCountdown(r0_6)
  -- line: [68, 98] id: 6
  local r1_6 = TimeUtils.NowTime()
  local r2_6 = r0_6:CalculateRemainTimeToNextHour()
  if r2_6 <= 0 then
    if r0_6.CountdownTimer then
      r0_6:RemoveTimer(r0_6.CountdownTimer)
      r0_6.CountdownTimer = nil
    end
    r0_6:Close()
  else
    local r4_6, r5_6 = UIUtils.GetLeftTimeStrStyle2(r1_6 + r2_6)
    r0_6.WBP_Com_Time:SetTimeText("", r4_6)
  end
  local r3_6 = GWorld:GetAvatar()
  if not r3_6 then
    return 
  end
  local r4_6 = r3_6.CurrentRegionId
  if not UE4.UGameplayStatics.GetGameState(GWorld.GameInstance):IsInRegion() or r4_6 ~= 101901 or r3_6:IsInHardBoss() then
    DebugPrint("ayff 离开剧院区域，关闭剧院活动倒计时 regionid:", r4_6)
    r0_6:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    r0_6:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end
function r0_0.Close(r0_7)
  -- line: [100, 108] id: 7
  if r0_7.CountdownTimer then
    r0_7:RemoveTimer(r0_7.CountdownTimer)
    r0_7.CountdownTimer = nil
  end
  r0_7.IsInit = true
  r0_7.Super.Close(r0_7)
end
return r0_0
