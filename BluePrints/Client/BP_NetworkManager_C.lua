-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Client\BP_NetworkManager_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class()
local r1_0 = 100074
function r0_0.Initialize(r0_1, r1_1)
  -- line: [13, 15] id: 1
  print(_G.LogTag, "BP_NetworkManager_C:Initialize")
end
function r0_0.LogoutEvent(r0_2)
  -- line: [17, 38] id: 2
  local r1_2 = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UEMSentrySubsystem)
  if r1_2 then
    r1_2:Logout()
  end
  local r2_2 = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UNewBdcSubsystem)
  if r2_2 then
    r2_2:Logout()
  end
  local r3_2 = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UACESubsystem)
  if r3_2 then
    r3_2:Logout()
  end
  if GWorld.GameInstance and GWorld.GameInstance.KeyListRecord then
    GWorld.GameInstance.KeyListRecord = {}
  end
end
function r0_0.DisconnectAndShowUI(r0_3, r1_3)
  -- line: [41, 161] id: 3
  local r2_3 = "Error"
  local r3_3 = GWorld:GetAvatar()
  if r3_3 then
    r2_3 = r3_3.Uid
  end
  if r2_3 == "Error" then
    r2_3 = r1_3.Uid
  end
  r0_3:Disconnect()
  r0_3:LogoutEvent()
  if not r1_3 then
    r1_3 = {}
  end
  PrintTable(r1_3, 2)
  local r4_3 = r1_3.Reason
  local r5_3 = r1_3.BanTime
  local r6_3 = r1_3.RetCode and r1_3.ErrorCode
  if r6_3 == CommonConst.KickAvatarType.KICK_AVATAR_FORCE_PATCH then
    DebugPrint("强制patch 被踢下线")
    UIManager(r0_3):ShowDisconnectUIConfirm(100151, true, {
      LeftCallbackObj = r0_3,
      LeftCallbackFunction = r0_3.TryToGoToLoginScene,
      RightCallbackObj = r0_3,
      RightCallbackFunction = r0_3.TryToGoToLoginScene,
    })
    return 
  elseif r6_3 == CommonConst.KickAvatarType.KICK_AVATAR_BAN or r6_3 == ErrorCode.RET_LOGIN_BY_LIMIT_AVATAR then
    UIManager(r0_3):ShowDisconnectUIConfirm(100051, true, {
      ShortText = string.format(GText("UI_COMMONPOP_TEXT_100052"), tonumber(r2_3) and 0, (function(r0_4)
        -- line: [74, 86] id: 4
        r0_4 = tostring(r0_4)
        if r0_4 == "1" then
          return GText("UI_COMMONPOP_TEXT_100052_1")
        elseif r0_4 == "2" then
          return GText("UI_COMMONPOP_TEXT_100052_2")
        elseif r0_4 == "3" then
          return GText("UI_COMMONPOP_TEXT_100052_3")
        elseif r0_4 == "4" then
          return GText("UI_COMMONPOP_TEXT_100052_4")
        end
        return GText("UI_COMMONPOP_TEXT_100052_0")
      end)(r4_3), os.date("%Y-%m-%d %H:%M:%S", r5_3)),
      LeftCallbackObj = r0_3,
      LeftCallbackFunction = r0_3.TryToGoToLoginScene,
      RightCallbackObj = r0_3,
      RightCallbackFunction = r0_3.TryToGoToLoginScene,
    })
    return 
  end
  DebugPrint("lgc@BP_NetworkManager_C:DisconnectAndShowUI RetCode = " .. tostring(r6_3) .. " BanReason = " .. tostring(r4_3) .. " BanTime = " .. os.date("%Y-%m-%d %H:%M:%S", r5_3))
  if r4_3 == "RelayAvatar" then
    local r7_3 = {
      LeftCallbackObj = r0_3,
      LeftCallbackFunction = r0_3.TryToGoToLoginScene,
      RightCallbackObj = r0_3,
      RightCallbackFunction = r0_3.TryToGoToLoginScene,
      ShortText = string.format(GText("UI_COMMONPOP_TEXT_100073"), tonumber(r2_3) and 0),
    }
    UIManager(r0_3):ShowDisconnectUIConfirm(100073, true, r7_3)
  elseif not r5_3 or not r4_3 then
    r0_3:EndReConnect(false)
    if not GWorld.bLoginConnectFailed then
      EventManager:FireEvent(EventID.OnNetDisconnect)
      r0_3:ShowNetDisconnectUIConfirm(r6_3)
    end
  else
    local r7_3 = GWorld.GameInstance:GetGameUIManager()
    local r8_3 = "CN"
    for r13_3, r14_3 in pairs(CommonConst.SystemLanguages) do
      if CommonConst.SystemLanguage == r14_3 then
        r8_3 = r13_3
        break
      end
    end
    -- close: r9_3
    if r8_3 == "Default" then
      r8_3 = "CN"
    end
    local r9_3 = ""
    if r1_3.ErrorCode == ErrorCode.RET_LOGIN_BY_LIMIT_IP then
      r9_3 = string.format(GText("UI_Forbidden_IP"), os.date("%Y-%m-%d %H:%M:%S", r5_3))
    elseif r1_3.ErrorCode == ErrorCode.RET_LOGIN_BY_LIMIT_DEVICE then
      r9_3 = string.format(GText("UI_Forbidden_Equipment"), os.date("%Y-%m-%d %H:%M:%S", r5_3))
    else
      r9_3 = string.format(GText("UI_COMMONPOP_TEXT_100051"), tonumber(r2_3) and 0, os.date("%Y-%m-%d %H:%M:%S", r5_3))
    end
    r7_3:ShowDisconnectUIConfirm(100051, true, {
      ShortText = r9_3,
      LeftCallbackObj = r0_3,
      LeftCallbackFunction = r0_3.TryToGoToLoginScene,
      RightCallbackObj = r0_3,
      RightCallbackFunction = r0_3.TryToGoToLoginScene,
    })
    if IsStandAlone(GWorld.GameInstance) then
      local r11_3 = GWorld.GameInstance:GetCurrentGameMode()
      if not r11_3 then
        return 
      end
      if r11_3.SetGamePaused then
        r11_3:SetGamePaused(Const.NetWorkFailure_Tag, true)
      end
    end
  end
end
function r0_0.DisconnectAndReturnLogin(r0_5)
  -- line: [164, 169] id: 5
  r0_5:Disconnect()
  r0_5:TryToGoToLoginScene()
  r0_5:LogoutEvent()
end
function r0_0.TryToGoToLoginScene(r0_6)
  -- line: [171, 188] id: 6
  GWorld.GameInstance:ClearExitDungeonData()
  r0_6:EndReConnect(false)
  HeroUSDKSubsystem():TryToGoToLoginScene()
end
function r0_0.SendResolutionTrack(r0_7)
  -- line: [190, 205] id: 7
  local r1_7 = {}
  local r3_7 = GWorld.GameInstance:GetSceneManager():GetWindowSize()
  local r4_7 = UE4.UGameUserSettings:GetGameUserSettings():GetFullscreenMode()
  local r5_7 = {
    [EWindowMode.Fullscreen] = "全屏",
    [EWindowMode.WindowedFullscreen] = "无边框窗口化",
    [EWindowMode.Windowed] = "窗口化",
  }
  local r6_7 = string.format("%dx%d", r3_7.X, r3_7.Y)
  r1_7.display_mode = r5_7[r4_7]
  r1_7.display_resolution = r6_7
  HeroUSDKSubsystem(r0_7):UploadTrackLog_Lua("display_settings", r1_7)
end
function r0_0.OnDisconnectAndLoginAgain(r0_8)
  -- line: [207, 229] id: 8
  r0_8:SendResolutionTrack()
  r0_8:Disconnect()
  local r1_8 = HeroUSDKSubsystem().UserInfo.sdkUserId == ""
  if HeroUSDKSubsystem():IsHeroSDKEnable() and not r1_8 and not UUCloudGameInstanceSubsystem.IsCloudGame() then
    HeroUSDKSubsystem():CleanUpUserInfo()
    if HeroUSDKSubsystem():IsBilibili() then
      HeroUSDKSubsystem():HeroSDKLogout()
    end
  end
  r0_8:LogoutEvent()
  WorldTravelSubsystem():ChangeSceneByAssetPath(Const.DefaultLoginSceneFile)
end
function r0_0.ShowNetDisconnectUIConfirm(r0_9, r1_9)
  -- line: [231, 262] id: 9
  DebugPrint("lgc@BP_NetworkManager_C:ShowNetDisconnectUIConfirm RetCode", tostring(r1_9))
  local r2_9 = true
  if GWorld.GameInstance:GetLoadingUI() then
    r2_9 = false
    if CommonUtils.GetDeviceTypeByPlatformName(GWorld.GameInstance) == "PC" then
      UGameInputModeSubsystem.GetGameInputModeSubsystem(GWorld.GameInstance):SetMouseCursorVisable(true)
    end
  elseif UGameplayStatics.GetCurrentLevelName(r0_9) == "Login" then
    return 
  end
  local r3_9 = GWorld.GameInstance:GetGameUIManager()
  if r3_9 then
    local r4_9 = {
      LeftCallbackObj = r0_9,
      LeftCallbackFunction = r0_9.TryToGoToLoginScene,
      RightCallbackObj = r0_9,
      RightCallbackFunction = r0_9.TryToGoToLoginScene,
    }
    if r1_9 == CommonConst.KickAvatarType.KICK_AVATAR_CHECK_SCRIPT then
      r4_9.ShortText = GText("UI_COMMONPOP_TEXT_100078")
    else
      r4_9.ShortText = GText("UI_COMMONPOP_TEXT_100074")
    end
    r3_9:ShowDisconnectUIConfirm(r1_0, r2_9, r4_9)
  end
end
function r0_0.UpdateNetDisconnectUIConfirm(r0_10)
  -- line: [264, 280] id: 10
  if GWorld.GameInstance:GetGameUIManager():GetUIObj("NetDisConnectedDialog") == nil then
    return 
  end
  if IsStandAlone(GWorld.GameInstance) then
    local r3_10 = GWorld.GameInstance:GetCurrentGameMode()
    if not r3_10 then
      return 
    end
    if r3_10.SetGamePaused then
      r3_10:SetGamePaused(Const.NetWorkFailure_Tag, true)
    end
  end
end
function r0_0.StartShowReConnectUI(r0_11)
  -- line: [282, 292] id: 11
  if not GWorld.GameInstance:GetLoadingUI() and UGameplayStatics.GetCurrentLevelName(r0_11) == "Login" then
    return 
  end
  DebugPrint("NetworkMgr:StartShowReConnectUI")
  local r1_11 = GWorld.GameInstance:GetGameUIManager()
  r0_11.bUIReConnecting = true
  if r1_11 then
    r1_11:LoadUINew("LoadingReconnect")
  end
end
function r0_0.ConnectSuccess(r0_12)
  -- line: [294, 297] id: 12
  DebugPrint("NetworkMgr:ConnectSuccess")
  r0_12:EndReConnect(true)
end
function r0_0.EndReConnect(r0_13, r1_13, r2_13)
  -- line: [299, 331] id: 13
  if not r2_13 then
    DebugPrint("NetworkMgr:EndReConnect")
  end
  if r0_13.bUIReConnecting then
    if r0_13:IsReconnecting() then
      return 
    end
    r0_13.bUIReConnecting = false
    local r3_13 = GWorld.GameInstance:GetGameUIManager()
    if r3_13 then
      local r4_13 = r3_13:GetUIObj("LoadingReconnect")
      if r4_13 then
        if r1_13 then
          r4_13:Close()
        else
          r4_13:RealClose()
        end
      end
      local r5_13 = r3_13:GetUIObj("LoginMainPage")
      if r5_13 then
        r5_13:CloseLoadingReconnect()
      end
    end
  end
end
return r0_0
