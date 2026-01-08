-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Story\Interactive\InteractiveComponent\BP_TheaterOnline_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
require("DataMgr")
local r0_0 = Class("BluePrints.Story.Interactive.InteractiveComponent.BP_InteractiveBaseComponent_C")
function r0_0.ReceiveBeginPlay(r0_1)
  -- line: [8, 11] id: 1
  r0_1.Super.ReceiveBeginPlay(r0_1)
  r0_1.Owner = r0_1:GetOwner()
end
function r0_0.SetComponentInfo(r0_2)
  -- line: [13, 15] id: 2
  r0_2.bIsAccept = false
end
function r0_0.IsCanInteractive(r0_3, r1_3)
  -- line: [17, 33] id: 3
  local r2_3 = GWorld:GetAvatar()
  if not r2_3 then
    return false
  end
  r2_3:TheaterPerformStateGet(function(r0_4, r1_4)
    -- line: [20, 26] id: 4
    if r1_4 and r1_4.IsJoin == false then
      r0_3.bIsAccept = false
    else
      r0_3.bIsAccept = true
    end
  end)
  if r0_3.DistanceCheckComponent(r0_3, r1_3, r0_3.InteractiveDistance, false) and r0_3.CFaceToACheckComponent(r0_3, r1_3, r0_3.InteractiveFaceAngle, false) and not r0_3.bIsAccept then
    return true
  end
  return false
end
function r0_0.StartInteractive(r0_5, r1_5)
  -- line: [35, 57] id: 5
  local r2_5 = GWorld:GetAvatar()
  if not r2_5 then
    return 
  end
  r2_5:TheaterJoinPerformGame(function(r0_6, r1_6)
    -- line: [40, 55] id: 6
    local r2_6 = DataMgr.ErrorCode[r0_6]
    if r2_6 then
      r2_6 = DataMgr.ErrorCode[r0_6].ErrorCodeContent and GText("报名成功")
    else
      goto label_11	-- block#2 is visited secondly
    end
    DebugPrint("ayff test 剧院联机活动加入结果:", r2_6)
    if r0_6 == ErrorCode.RET_SUCCESS then
      UIManager(r0_5):ShowUITip("CommonToastMain", GText("TheaterOnline_Game_Sign_Success"), 3)
      r0_5.bIsAccept = true
      EventManager:FireEvent(EventID.OnTheaterJoinPerformGame)
      return 
    elseif r0_6 == ErrorCode.RET_THEATER_PERFORMGAME_NOT_JOIN_TIME then
      UIManager(r0_5):ShowUITip("CommonToastMain", GText("TheaterOnline_Game_Sign_Fail"), 3)
      EventManager:FireEvent(EventID.OnTheaterJoinPerformGameFail)
    else
      UIManager(r0_5):ShowUITip("CommonToastMain", GText("TheaterOnline_Game_Sign_Fail"), 3)
    end
  end)
end
function r0_0.BtnPressed(r0_7, r1_7)
  -- line: [59, 61] id: 7
  r0_7:StartInteractive(r1_7)
end
return r0_0
