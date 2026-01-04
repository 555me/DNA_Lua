-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\HeroUSDK\HeroUSDKSubSystem_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("Utils.HeroUSDKUtils")
local r1_0 = require("rapidjson")
local r2_0 = require("EMCache.EMCache")
local r3_0 = require("Utils.MiscUtils")
local r4_0 = Class()
function r4_0.LoadCloudGameCursorTexture(r0_1)
  -- line: [10, 31] id: 1
  DebugPrint("HeroUSDKSubSystem_C:LoadCloudGameCursorTexture")
  for r6_1, r7_1 in pairs({
    "",
    "/Game/UI/Texture/Static/Image/CloudGame/T_Mouse_Default.T_Mouse_Default",
    "/Game/UI/Texture/Static/Image/CloudGame/T_Mouse_EditText.T_Mouse_EditText",
    "",
    "",
    "/Game/UI/Texture/Static/Image/CloudGame/T_Mouse_ResizeSE.T_Mouse_ResizeSE",
    "/Game/UI/Texture/Static/Image/CloudGame/T_Mouse_ResizeSW.T_Mouse_ResizeSW",
    "",
    "",
    "/Game/UI/Texture/Static/Image/CloudGame/T_Mouse_Click.T_Mouse_Click",
    "/Game/UI/Texture/Static/Image/CloudGame/T_Mouse_Hand.T_Mouse_Hand",
    "/Game/UI/Texture/Static/Image/CloudGame/T_Mouse_Grab.T_Mouse_Grab"
  }) do
    DebugPrint("HeroUSDKSubSystem_C:LoadCloudGameCursorTexture,", r7_1)
    local r8_1 = nil
    r0_1.MouseCursors:Add(r8_1)
  end
  -- close: r2_1
end
function r4_0.BindDelegates(r0_2)
  -- line: [33, 48] id: 2
  r0_2.HeroSDKLogoutDelegate:Bind(r0_2, r0_2.OnLogout)
  r0_2.HeroSDKSwitchAccountDelegate:Bind(r0_2, r0_2.OnSwitchAccount)
  r0_2.HeroSDKLoginInvalidDelegate:Bind(r0_2, r0_2.OnLoginInvalid)
  r0_2.HeroSDKPayDelegate:Bind(r0_2, r0_2.PayCallBack)
  r0_2.HeroSDKExitDelegate:Bind(r0_2, r0_2.OnExit)
  r0_2.HeroSDKAccountCancallationDelegate:Bind(r0_2, r0_2.OnAccountCancallation)
  if r0_2.HeroMarketConversionDataSuccessDelegate then
    r0_2.HeroMarketConversionDataSuccessDelegate:Bind(r0_2, r0_2.OnMarketConversionDataSuccess)
  end
  r0_2.HeroSDKAccountUnCancallationDelegate:Bind(r0_2, r0_2.OnAccountUnCancallation)
  r0_2.HeroSDKLoginDelegate:Bind(r0_2, r0_2.OnHeroSDKLogin)
  r0_2.HeroSDKCmpDelegate:Bind(r0_2, r0_2.OnHeroSDKCmp)
  EventManager:AddEvent(EventID.OnCharLevelUpInBattle, r0_2, r0_2.OnLevelUp)
end
function r4_0.OnHeroSDKCmp(r0_3, r1_3, r2_3)
  -- line: [50, 52] id: 3
  DebugPrint("USDK OnHeroSDKCmp: Result:", r1_3, r2_3)
end
function r4_0.OnHeroSDKLogin(r0_4, r1_4, r2_4, r3_4)
  -- line: [54, 65] id: 4
  DebugPrint("USDK OnHeroSDKLogin: Result:", r1_4, r3_4)
  if UGameplayStatics.GetCurrentLevelName(r0_4) == "Login" then
    local r4_4 = GWorld.GameInstance:GetGameUIManager():GetUIObj("LoginMainPage")
    if r4_4 then
      r4_4:OnHeroSDKLogin(r1_4, r2_4, r3_4)
    end
  else
    r0_4:TryToGoToLoginScene()
  end
  r0_4.bSwitchAccount = false
end
function r4_0.OnAccountUnCancallation(r0_5, r1_5, r2_5)
  -- line: [67, 72] id: 5
  DebugPrint("USDK OnAccountUnCancallation: Result:", r1_5, r2_5)
  if r1_5 == 0 then
    r0_5:TryToGoToLoginScene()
  end
end
function r4_0.OnMarketConversionDataSuccess(r0_6, r1_6)
  -- line: [74, 85] id: 6
  DebugPrint("USDK OnMarketConversionDataSuccess Data:", r1_6)
  local r2_6 = r2_0:Get("MarketConversionDataSuccess")
  if r2_6 == nil or r2_6 ~= r1_6 then
    r0_6:UploadTrackLog_Lua("attribution", {
      data_info = r1_6,
    })
    r2_0:Set("MarketConversionDataSuccess", r1_6)
  end
end
function r4_0.OnAccountCancallation(r0_7, r1_7, r2_7)
  -- line: [87, 99] id: 7
  DebugPrint("USDK OnAccountCancallation: Result:", r1_7, "Msg:", r2_7)
  if r1_7 == 0 then
    if GWorld.NetworkMgr then
      GWorld.NetworkMgr:Disconnect()
    end
    if UE4.UUIFunctionLibrary.GetDevicePlatformName() == "IOS" then
      r0_7.bAccountCancallation = true
    end
    r0_7:TryToGoToLoginScene()
  end
end
function r4_0.OnExit(r0_8, r1_8, r2_8)
  -- line: [101, 107] id: 8
  DebugPrint("USDK OnExit: Result:", r1_8, "Msg:", r2_8)
  if HeroUSDKSubsystem():IsBilibili() then
    HeroUSDKSubsystem():EMRequestExit()
  end
end
function r4_0.OnLogout(r0_9, r1_9, r2_9)
  -- line: [109, 119] id: 9
  DebugPrint("USDK OnLogOut: Result:", r1_9, "Msg:", r2_9)
  if r1_9 == 0 then
    r0_9:TryToGoToLoginScene()
  end
  local r3_9 = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UNewBdcSubsystem)
  if r3_9 then
    r3_9:Logout()
  end
end
function r4_0.OnSwitchAccount(r0_10, r1_10, r2_10)
  -- line: [121, 127] id: 10
  DebugPrint("USDK OnSwitchAccount: Result:", r1_10, "Msg:", r2_10)
  if r1_10 == 0 then
    r0_10:TryToGoToLoginScene()
    r0_10.bSwitchAccount = true
  end
end
function r4_0.PayCallBack(r0_11, r1_11, r2_11, r3_11)
  -- line: [129, 153] id: 11
  DebugPrint("USDK PayCallBack: Msg:", r1_11, r2_11, r3_11)
  local r4_11 = require("rapidjson")
  local r5_11 = nil	-- notice: implicit variable refs by block#[9, 10]
  if r3_11 and r3_11 ~= "" then
    r5_11 = r4_11.decode(r3_11)
    if not r5_11 then
      ::label_18::
      r5_11 = {}
    end
  else
    goto label_18	-- block#3 is visited secondly
  end
  local r6_11 = nil	-- notice: implicit variable refs by block#[12, 13]
  if r2_11 and r2_11 ~= "" then
    r6_11 = r4_11.decode(r2_11)
    if not r6_11 then
      ::label_29::
      r6_11 = {}
    end
  else
    goto label_29	-- block#7 is visited secondly
  end
  local r7_11 = false
  if not r7_11 and r5_11.code == 20002 then
    r7_11 = true
    local r8_11 = UIManager(r0_11):ShowCommonPopupUI(100235, {
      ShortText = r5_11.msg,
    }, r0_11)
  end
  if not r7_11 and r6_11.code == 20002 then
    r7_11 = true
    local r8_11 = UIManager(r0_11):ShowCommonPopupUI(100235, {
      ShortText = r6_11.msg,
    }, r0_11)
  end
  EventManager:FireEvent(EventID.OnPayCallBack, r1_11, r2_11, r3_11)
end
function r4_0.OnLoginInvalid(r0_12, r1_12)
  -- line: [155, 158] id: 12
  DebugPrint("OnLoginInvalid: KickOffType:", r1_12)
  r0_12:TryToGoToLoginScene(true, r1_12)
end
function r4_0.UploadTrackLog_Lua(r0_13, r1_13, r2_13)
  -- line: [160, 170] id: 13
  if not r2_13 then
    r0_13:UploadEmptyTrackLog(r1_13)
    return 
  end
  if type(r2_13) == "table" then
    r0_13:UploadTrackLog(r1_13, r1_0.encode(r2_13))
  else
    r0_13:UploadTrackLog(r1_13, r2_13)
  end
end
function r4_0.TryToGoToLoginScene(r0_14, r1_14, r2_14)
  -- line: [173, 267] id: 14
  print("TryToGoToLogin")
  if r0_14.bSwitchAccount then
    DebugPrint("USDK TryToGoToLoginScene return because switch account")
    r0_14.bSwitchAccount = false
    return 
  end
  local r3_14 = HeroUSDKSubsystem():IsBilibili()
  if GWorld.NetworkMgr then
    GWorld.NetworkMgr:Disconnect()
  end
  local function r4_14()
    -- line: [185, 187] id: 15
    UKismetSystemLibrary.QuitGame(r0_14, UGameplayStatics.GetPlayerController(r0_14, 0), EQuitPreference.Quit, true)
  end
  if UGameplayStatics.GetCurrentLevelName(r0_14) == "Login" then
    local r5_14 = GWorld.GameInstance:GetGameUIManager():GetUIObj("LoginMainPage")
    if r5_14 then
      r5_14:OnLogout()
    end
    r0_14:CloseLoadingReconnect()
    if r1_14 and r0_14:IsAntiAddctionType(r2_14) then
      if UE4.UUIFunctionLibrary.GetDevicePlatformName() == "IOS" then
        UIManager(r0_14):ShowDisconnectUIConfirm(100072, true)
        return 
      end
      if r3_14 then
        r4_14()
      elseif r0_14:NeedShowAntiAddctionDialog(r2_14) then
        UIManager(r0_14):ShowDisconnectUIConfirm(100072, true, {
          RightCallbackObj = r0_14,
          RightCallbackFunction = r4_14,
          LeftCallbackObj = r0_14,
          LeftCallbackFunction = r4_14,
        })
      else
        r4_14()
      end
    end
    return 
  end
  local function r5_14()
    -- line: [228, 244] id: 16
    local r0_16 = r0_14.UserInfo.sdkUserId == ""
    if HeroUSDKSubsystem():IsHeroSDKEnable() and not UUCloudGameInstanceSubsystem.IsCloudGame() then
      HeroUSDKSubsystem():CleanUpUserInfo()
      local r1_16 = UE4.UUIFunctionLibrary.GetDevicePlatformName()
      if r0_14:IsAntiAddctionType(r2_14) then
        if not r1_14 and r3_14 and not r0_16 then
          HeroUSDKSubsystem():HeroSDKLogout()
        elseif r1_14 and r1_16 ~= "IOS" then
          r4_14()
          return 
        end
      end
    end
    WorldTravelSubsystem():ChangeSceneByAssetPath(Const.DefaultLoginSceneFile)
  end
  if r1_14 and not r3_14 then
    if not r0_14:IsAntiAddctionType(r2_14) then
      r5_14()
      return 
    end
    if r0_14:NeedShowAntiAddctionDialog(r2_14) then
      UIManager(r0_14):ShowDisconnectUIConfirm(100072, true, {
        LeftCallbackObj = r0_14,
        LeftCallbackFunction = r5_14,
        RightCallbackObj = r0_14,
        RightCallbackFunction = r5_14,
      })
    else
      r4_14()
    end
  else
    r5_14()
  end
end
function r4_0.IsAntiAddctionType(r0_17, r1_17)
  -- line: [270, 275] id: 17
  if r1_17 == UE4.EUsdkKickOffType.AccountCancel or r1_17 == UE4.EUsdkKickOffType.LoginInvalid then
    return false
  end
  return true
end
function r4_0.NeedShowAntiAddctionDialog(r0_18, r1_18)
  -- line: [277, 288] id: 18
  if UUsdkSettings:GetDefaultObject().Channel == EHeroUSDKChannel.WeGame and (r1_18 == UE4.EUsdkKickOffType.WeGame_kSystemStatePlatformOffline or r1_18 == UE4.EUsdkKickOffType.WeGame_kSystemStatePlatformExit or r1_18 == UE4.EUsdkKickOffType.WeGame_kSystemStatePlayerOwnershipExpired or r1_18 == UE4.EUsdkKickOffType.WeGame_kSystemStatePlayerOwnershipBanned) then
    return false
  end
  return true
end
function r4_0.CloseLoadingReconnect(r0_19)
  -- line: [290, 296] id: 19
  local r1_19 = UIManager(r0_19):GetUIObj("LoginMainPage")
  if r1_19 then
    r1_19:CloseLoadingReconnect()
  end
end
function r4_0.OnLevelUp(r0_20)
  -- line: [298, 305] id: 20
  local r1_20 = UGameplayStatics.GetPlayerCharacter(r0_20, 0)
  if not IsValid(r1_20) then
    return 
  end
  r0_20:HeroSDKRoleLevelUp(r0_0.GenHeroHDCGameRoleInfo(r1_20.CurrentRoleId, r1_20.BattleCharInfo.CharName, r1_20:GetAttr("Level")))
end
function r4_0.OnLoginSuccess(r0_21)
  -- line: [307, 321] id: 21
  local r1_21 = GWorld:GetAvatar()
  if r1_21 then
    if r1_21.Nickname and r1_21.Nickname ~= "" then
      r0_21:HeroSDKRoleEnterGame(r0_0.GenHeroHDCGameRoleInfo())
    end
    local r2_21 = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UNewBdcSubsystem)
    if r2_21 then
      r2_21:Login(r0_21.UserInfo.sdkUserId, CommonUtils.ObjId2Str2(r1_21.Eid))
    end
    r0_21:SetNewBDCPublicAttriubute(tostring(r1_21.Uid), tostring(r1_21.Hostnum))
  end
end
function r4_0.RequestUploadChatData_Lua(r0_22, r1_22, r2_22, r3_22)
  -- line: [323, 325] id: 22
  r0_22:RequestUploadChatData(r0_0.GenHeroUSDKUploadChatItemData(r1_22), {
    r2_22,
    r3_22
  })
end
function r4_0.RequestUploadReportData_Lua(r0_23, r1_23, r2_23, r3_23)
  -- line: [327, 329] id: 23
  r0_23:RequestUploadChatData(r0_0.GenHeroUSDKUploadChatItemData(r1_23), {
    r2_23,
    r3_23
  })
end
function r4_0.RequestUploadBanLog_Lua(r0_24, r1_24, r2_24, r3_24)
  -- line: [331, 333] id: 24
  r0_24:RequestUploadLogData(r0_0.GenHeroUSDKUploadLogItemData(r1_24), {
    r2_24,
    r3_24
  })
end
function r4_0.UploadBDCTrackInfoWhenChangeScene(r0_25)
  -- line: [335, 361] id: 25
  if USubsystemBlueprintLibrary.GetWorldSubsystem(r0_25, UBDCUploadSubsystem) then
    USubsystemBlueprintLibrary.GetWorldSubsystem(r0_25, UBDCUploadSubsystem):UploadAllBDCTrackInfo()
  end
  local r1_25 = UGameplayStatics.GetPlayerCharacter(r0_25, 0)
  if not IsValid(r1_25) then
    return 
  end
  if not r1_25.UploadBDCTrackInfo then
    return 
  end
end
function r4_0.UploadBigWorldPathInfo(r0_26, r1_26)
  -- line: [364, 374] id: 26
  if not r1_26.UploadBDCTrackInfo then
    return 
  end
  if not r1_26.UploadBDCTrackInfo.BigWorldPathInfo then
    return 
  end
  for r6_26, r7_26 in pairs(r1_26.UploadBDCTrackInfo.BigWorldPathInfo) do
    r0_26:UploadTrackLog_Lua("event_explore", r7_26)
  end
  -- close: r2_26
end
function r4_0.UploadWeaponUseCountInfo(r0_27, r1_27)
  -- line: [377, 388] id: 27
  if not r1_27.UploadBDCTrackInfo then
    return 
  end
  if not r1_27.UploadBDCTrackInfo.WeaponUseCount then
    return 
  end
  for r6_27, r7_27 in pairs(r1_27.UploadBDCTrackInfo.WeaponUseCount) do
    r0_27:UploadTrackLog_Lua("weapon_usage_record", r7_27)
  end
  -- close: r2_27
  r1_27.UploadBDCTrackInfo.WeaponUseCount = {}
end
function r4_0.UploadSkillUseCountInfo(r0_28, r1_28)
  -- line: [391, 401] id: 28
  if not r1_28.UploadBDCTrackInfo.SkillUseCount then
    return 
  end
  for r6_28, r7_28 in pairs(r1_28.UploadBDCTrackInfo.SkillUseCount) do
    r0_28:UploadTrackLog_Lua("skill_usage_record", r7_28)
  end
  -- close: r2_28
  if r1_28.UploadBDCTrackInfo.CondemnSkillCountInfo then
    r0_28:UploadTrackLog_Lua("sentence_number", r1_28.UploadBDCTrackInfo.CondemnSkillCountInfo)
  end
end
function r4_0.UploadPlayerHurtInfo(r0_29, r1_29)
  -- line: [404, 411] id: 29
  if not r1_29.UploadBDCTrackInfo.DamageTrack then
    return 
  end
  for r6_29, r7_29 in ipairs(r1_29.UploadBDCTrackInfo.DamageTrack) do
    r0_29:UploadTrackLog_Lua("player_hurt_record", r7_29)
  end
  -- close: r2_29
end
function r4_0.UploadBulletJumpCountInfo(r0_30, r1_30)
  -- line: [414, 419] id: 30
  if not r1_30.UploadBDCTrackInfo.BulletJumpCountTrack then
    return 
  end
  r0_30:UploadTrackLog_Lua("bullet_jump_number", r1_30.UploadBDCTrackInfo.BulletJumpCountTrack)
end
function r4_0.UploadSlideCountInfo(r0_31, r1_31)
  -- line: [422, 427] id: 31
  if not r1_31.UploadBDCTrackInfo.SlideCountTrack then
    return 
  end
  r0_31:UploadTrackLog_Lua("sliding_tackle_number", r1_31.UploadBDCTrackInfo.SlideCountTrack)
end
function r4_0.UploadJumpCountInfo(r0_32, r1_32)
  -- line: [430, 435] id: 32
  if not r1_32.UploadBDCTrackInfo.JumpCountInfo then
    return 
  end
  r0_32:UploadTrackLog_Lua("jump_number", r1_32.UploadBDCTrackInfo.JumpCountInfo)
end
function r4_0.UploadSecondJumpCountInfo(r0_33, r1_33)
  -- line: [438, 443] id: 33
  if not r1_33.UploadBDCTrackInfo.JumpSecondCountInfo then
    return 
  end
  r0_33:UploadTrackLog_Lua("double_jump_number", r1_33.UploadBDCTrackInfo.JumpSecondCountInfo)
end
function r4_0.UploadWallJumpCountInfo(r0_34, r1_34)
  -- line: [446, 451] id: 34
  if not r1_34.UploadBDCTrackInfo.JumpWallCountInfo then
    return 
  end
  r0_34:UploadTrackLog_Lua("climb_wall_number", r1_34.UploadBDCTrackInfo.JumpWallCountInfo)
end
function r4_0.UploadFlyShootCountInfo(r0_35, r1_35)
  -- line: [454, 459] id: 35
  if not r1_35.UploadBDCTrackInfo.FlyShootCountInfo then
    return 
  end
  r0_35:UploadTrackLog_Lua("fly_shoot_number", r1_35.UploadBDCTrackInfo.FlyShootCountInfo)
end
function r4_0.UploadDeadInfo(r0_36, r1_36)
  -- line: [462, 469] id: 36
  if not r1_36.UploadBDCTrackInfo.DeadInfo then
    return 
  end
  for r6_36, r7_36 in ipairs(r1_36.UploadBDCTrackInfo.DeadInfo) do
    r0_36:UploadTrackLog_Lua("player_death", r7_36)
  end
  -- close: r2_36
end
function r4_0.UploadRecoveryInfo(r0_37, r1_37)
  -- line: [472, 479] id: 37
  if not r1_37.UploadBDCTrackInfo.RecoveryInfo then
    return 
  end
  for r6_37, r7_37 in ipairs(r1_37.UploadBDCTrackInfo.RecoveryInfo) do
    r0_37:UploadTrackLog_Lua("player_recovery", r7_37)
  end
  -- close: r2_37
end
function r4_0.UploadSkipTalkInfo(r0_38, r1_38)
  -- line: [482, 489] id: 38
end
function r4_0.ShowExitGameDialog(r0_39)
  -- line: [491, 496] id: 39
  local r1_39 = GWorld.GameInstance:GetGameUIManager():GetUIObj("LoginMainPage")
  if r1_39 then
    r1_39:ShowExitGamePopupUI()
  end
end
function r4_0.EMHeroSDKSwitchAccount(r0_40)
  -- line: [498, 507] id: 40
  if UE4.UUIFunctionLibrary.GetDevicePlatformName() == "Android" and not r0_40:IsGlobalSDK() then
    DebugPrint("HeroUSDKSubSystem_C HeroSDKLogout")
    r0_40:HeroSDKLogout()
  else
    DebugPrint("HeroUSDKSubSystem_C HeroSDKSwitchAccount")
    r0_40:HeroSDKSwitchAccount()
  end
end
return r4_0
