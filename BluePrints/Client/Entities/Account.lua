-- filename: @E:/Pack/Branch/OBT10_Geili\Content/Script/BluePrints\Client\Entities\Account.lua
-- version: lua54
-- line: [0, 0] id: 0
local r2_0 = require("NetworkEngine.Common.Assemble")
local r3_0 = require("Utils.HeroUSDKUtils")
local r4_0 = require("Utils.MiscUtils")
local r5_0 = _G.TypeClass("Account", require("BluePrints.Client.Wrapper.Entity").AvatarEntity)
r5_0.__Component__ = {
  "BluePrints.Client.Entities.Components.EntityBase",
  "BluePrints.Client.Entities.Components.Login"
}
function r5_0.Init(r0_1, r1_1)
  -- line: [13, 15] id: 1
  r5_0.Super.Init(r0_1, r1_1)
end
function r5_0.OnBecomePlayer(r0_2)
  -- line: [17, 27] id: 2
  r5_0.Super.OnBecomePlayer(r0_2)
  r0_2.logger.info("Account OnBecomePlayer")
  if r3_0.IsEnable() and not GWorld.NetworkMgr.IsQuickLogin then
    r0_2:SdkLogin()
  else
    local r1_2 = GWorld.NetworkMgr:GetAccountName()
    r0_2:QuickLogin(r4_0.Trim(r1_2), r4_0.Trim(r1_2))
  end
  r0_2:EnterWorld()
end
function r5_0.SdkLogin(r0_3)
  -- line: [29, 87] id: 3
  r0_3.logger.debug("SdkLogin")
  local r1_3 = r3_0.GetUserInfo()
  if not r1_3 then
    error("SdkLogin, but SdkUserInfo is invalid!!!")
    return 
  end
  local r2_3 = HeroUSDKSubsystem()
  local r4_3, r5_3, r6_3 = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UHotUpdateSubsystem):GetClientVersion()
  local r7_3 = {
    Hostnum = GWorld.NetworkMgr.hostnum,
    ConnectType = GWorld.NetworkMgr.ConnectType,
    HotfixIndex = GWorld.HotfixDataIndex and 0,
    ClientVersion = {
      ForceUpdateCheck = DataMgr.HotfixData.force_update_version,
    },
    PatchVersion = {
      [r4_3] = r5_3,
    },
  }
  local r8_3 = {
    AccessToken = r1_3.accessToken,
    SdkUserId = r1_3.sdkUserId,
    UserName = r1_3.userName,
    IsGlobalSDK = r3_0.IsGlobalSDK(),
    DeviceId = r2_3:GetDeviceId(),
  }
  local r9_3 = {
    appkey = r2_3:GetAppKey(),
    channel_id = r2_3:GetChannelId(),
    app_channel_id = r2_3:GetAppChannelId(),
    device_id = r2_3:GetBDCDeviceID(),
    img_channel_id = r2_3:GetMirrorChannelId(),
    click_id = r2_3.InstallClickID,
    os = r2_3:GetOS(),
    sdk_version = r2_3:GetBDCSdkVersion(),
    ads_json = r2_3:GetAdsJson(),
    user_agent = r2_3:GetUserAgent(),
    device_key = r2_3:GetDeviceKey(),
    wegame_distribute_id = r2_3.WeGameDistributionID,
    android_id = r2_3:GetAndroidID(),
    idfa = r2_3:GetIDFA(),
    idfv = r2_3:GetIDFV(),
  }
  if not r3_0.IsGlobalSDK() then
    r9_3.oaid = r2_3.Oaid
  else
    r9_3.gaid = r2_3:GetGaid()
  end
  PrintTable({
    ClientInfo = r7_3,
  }, 2)
  PrintTable({
    SdkInfo = r8_3,
  }, 2)
  r0_3:CallServerMethod("SdkLogin", r8_3, r7_3, r9_3)
end
function r5_0.NotifyBindDevice(r0_4)
  -- line: [89, 107] id: 4
  r0_4.logger.debug("NotifyBindDevice")
  local r1_4 = {
    CloseBtnCallbackFunction = function()
      -- line: [93, 96] id: 5
      r0_4:CallServerMethod("ConfirmBindDevice", false)
    end,
    LeftCallbackFunction = function()
      -- line: [97, 100] id: 6
      r0_4:CallServerMethod("ConfirmBindDevice", false)
    end,
    RightCallbackFunction = function()
      -- line: [101, 103] id: 7
      r0_4:CallServerMethod("ConfirmBindDevice", true)
    end,
  }
  local r2_4 = GWorld.GameInstance:GetGameUIManager()
  r2_4:ShowCommonPopupUI(100071, r1_4, r2_4:GetUIObj("LoginMainPage"))
end
function r5_0.QuickLogin(r0_8, r1_8, r2_8)
  -- line: [109, 153] id: 8
  r0_8.logger.debug("QuickLogin")
  local r3_8 = HeroUSDKSubsystem()
  local r4_8 = GWorld.SdkChannel and 237
  local r5_8 = GWorld.SdkImgChannel and 0
  local r7_8, r8_8, r9_8 = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UHotUpdateSubsystem):GetClientVersion()
  local r10_8 = {
    Hostnum = GWorld.NetworkMgr.hostnum,
    Account = r1_8,
    PassWord = r2_8,
    ConnectType = GWorld.NetworkMgr.ConnectType,
    HotfixIndex = GWorld.HotfixDataIndex and 0,
    ClientVersion = {
      ForceUpdateCheck = DataMgr.HotfixData.force_update_version,
    },
    PatchVersion = {
      [r7_8] = r8_8,
    },
  }
  local r11_8 = {
    appkey = r3_8:GetAppKey(),
    channel_id = r4_8,
    app_channel_id = r3_8:GetAppChannelId(),
    img_channel_id = r5_8,
    device_id = "123124342",
  }
  if not r3_0.IsGlobalSDK() then
    r11_8.oaid = r3_8.Oaid
  end
  local r13_8 = {
    ChannelId = r4_8,
  }
  PrintTable({
    ClientInfo = r10_8,
  }, 2)
  PrintTable({
    BDC_Info = r11_8,
  }, 2)
  r0_8:CallServerMethod("QuickLogin", r10_8, r11_8, r13_8)
end
function r5_0.OnGetAllAvatars(r0_9, r1_9)
  -- line: [155, 165] id: 9
  r0_9.logger.debug("OnGetAllAvatars")
  GWorld.NetworkMgr:Disconnect()
  GWorld.GetAvatarInfos = {}
  for r6_9, r7_9 in ipairs(r1_9) do
    GWorld.GetAvatarInfos[r7_9.Hostnum] = r7_9
  end
  -- close: r2_9
  PrintTable({
    avatars = r1_9,
  }, 5)
  EventManager:FireEvent(EventID.OnGetAllAvatars)
end
function r5_0.OnPatchForceUpdate(r0_10)
  -- line: [167, 176] id: 10
  local r1_10 = GWorld.GameInstance:GetGameUIManager():GetUIObj("LoginMainPage")
  if r1_10 then
    r1_10:ShowLoginUI(false)
  end
  local r2_10 = UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if r2_10 then
    r2_10:StartUpdate()
  end
end
function r5_0.LoginResult(r0_11, r1_11, r2_11)
  -- line: [178, 243] id: 11
  r0_11.LoginQueuePopUI = nil
  if not r2_11 then
    r2_11 = {}
  end
  local r3_11 = r2_11.Reason and ""
  r0_11.logger.debug("LoginResult", r1_11, r3_11)
  if r1_11 ~= ErrorCode.RET_SUCCESS and GWorld.NetworkMgr then
    GWorld.NetworkMgr:Disconnect()
    local r4_11 = ErrorCode.RET_LOGIN_IN_DIFF_DEVICE
    if r1_11 ~= r4_11 then
      r4_11 = ErrorCode.RET_LOGIN_REFUSE_BIND_DEVICE
      if r1_11 ~= r4_11 then
        r4_11 = r1_11 == ErrorCode.RET_LOGIN_WHITE_LIST_CHECK_FAILED
      end
    else
      goto label_41	-- block#10 is visited secondly
    end
    if r1_11 == ErrorCode.RET_LOGIN_BY_CLIENT_VERSION_TOO_LOW then
      GWorld.GameInstance:GetGameUIManager():ShowCommonPopupUI(100151, {
        CloseBtnCallbackFunction = r0_11.OnPatchForceUpdate,
        LeftCallbackFunction = r0_11.OnPatchForceUpdate,
        RightCallbackFunction = r0_11.OnPatchForceUpdate,
      }, r0_11)
    elseif r1_11 == ErrorCode.RET_LOGIN_BY_PATCH_VERSION_TOO_LOW then
      local r5_11 = string.split(r3_11, " ")
      local r7_11 = tonumber(r5_11[#r5_11]) and -1
      local r8_11 = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UHotUpdateSubsystem)
      r8_11.CacheServerPatchVersion = r7_11
      r8_11:SetServerPatchVersionVerifing()
      GWorld.GameInstance:GetGameUIManager():ShowCommonPopupUI(100151, {
        CloseBtnCallbackFunction = r0_11.OnPatchForceUpdate,
        LeftCallbackFunction = r0_11.OnPatchForceUpdate,
        RightCallbackFunction = r0_11.OnPatchForceUpdate,
      }, r0_11)
    elseif r1_11 == ErrorCode.RET_LOGIN_TO_TARGET_SERVER then
      local r5_11 = r2_11.TargetHostnum
      if not r5_11 then
        r0_11.logger.error("LoginResult RET_LOGIN_TO_TARGET_SERVER but TargetHostnum is nil")
        return 
      end
      local r7_11 = GWorld.GameInstance:GetGameUIManager():GetUIObj("LoginMainPage")
      if not r7_11 then
        r0_11.logger.error("LoginResult RET_LOGIN_TO_TARGET_SERVER but LoginMainPage is nil")
        return 
      end
      r0_11.logger.debug("LoginResult RET_LOGIN_TO_TARGET_SERVER to ", r5_11)
      r7_11:LoginToTargetServer(r5_11)
    elseif r1_11 == ErrorCode.RET_LOGIN_QUIT_QUEUE and GWorld.NetworkMgr then
      GWorld.NetworkMgr:Disconnect()
      GWorld.NetworkMgr:LogoutEvent()
    elseif r1_11 == ErrorCode.RET_LOGIN_AUTH_FAILED then
      HeroUSDKSubsystem():HeroSDKLogout()
    elseif not r4_11 then
      GWorld.NetworkMgr:DisconnectAndShowUI(r2_11)
    end
    HeroUSDKSubsystem():CloseLoadingReconnect()
    PrintTable(r2_11, 2, "login_result code:" .. tostring(r1_11))
    if r1_11 == ErrorCode.RET_LOGIN_IN_DIFF_DEVICE then
      UIManager(GWorld.GameInstance):ShowUITip(UIConst.Tip_CommonToast, GText("UI_CBT1_WARNBINDING_TOAST"))
    elseif r1_11 == ErrorCode.RET_LOGIN_WHITE_LIST_CHECK_FAILED then
      UIManager(GWorld.GameInstance):ShowCommonPopupUI(100121)
    end
  end
end
function r5_0.OnHotfixWhenLogin(r0_12, r1_12, r2_12)
  -- line: [245, 252] id: 12
  r0_12.logger.debug("OnHotfixWhenLogin", r1_12, r2_12)
  if r2_12 then
    require("HotFix").ExecHotFix(r2_12, r1_12)
    GWorld.HotfixDataIndex = r2_12
  end
end
function r5_0.OnNoticeLoginQueue(r0_13, r1_13, r2_13)
  -- line: [254, 277] id: 13
  r0_13.logger.debug(string.format("Account:OnNoticeLoginQueue QueueSite:%s QueueLength:%s", r1_13, r2_13))
  if r0_13.LoginQueuePopUI then
    return 
  end
  local r3_13 = GWorld.GameInstance:GetGameUIManager()
  local r4_13 = r3_13:GetUIObj("LoginMainPage")
  if r4_13 then
    r4_13:CloseLoadingReconnect()
  end
  r0_13.LoginQueuePopUI = r3_13:ShowCommonPopupUI(100265, {
    CloseBtnCallbackFunction = function()
      -- line: [266, 268] id: 14
      r0_13:CallServerMethod("QuitLoginQueue")
    end,
    LeftCallbackFunction = function()
      -- line: [269, 271] id: 15
      r0_13:CallServerMethod("QuitLoginQueue")
    end,
    RightCallbackFunction = function()
      -- line: [272, 274] id: 16
      r0_13:CallServerMethod("QuitLoginQueue")
    end,
  })
end
r2_0.AssembleComponents(r5_0)
return r5_0
