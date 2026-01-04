-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Client\Entities\Components\AvatarInfo.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {}
local r1_0 = require("Utils.HeroUSDKUtils")
local r2_0 = require("Utils.MiscUtils")
local r3_0 = require("BluePrints.UI.WBP.Announcement.AnnounceUtils")
function r0_0.EnterWorld(r0_1)
  -- line: [7, 23] id: 1
  r0_1:InitPortraitReddotNode()
  r0_1:InitPortraitFrameReddotNode()
  r0_1:InitEscPortraitReddotNode()
  r0_1:InitEditBtnReddotNode()
  r0_1.ServerInfo = {}
  if GWorld.IsDev then
    for r5_1, r6_1 in r2_0.PairsByKeys(require("BluePrints.UI.GameLogin.DevServerList")) do
      r0_1.ServerInfo.HostId = r6_1.hostnum
      r0_1.ServerInfo.Area = r6_1.area
      r0_1.ServerInfo.Name = r6_1.name
      r0_1.ServerInfo.IP = r6_1.ip
      r0_1.ServerInfo.Port = r6_1.port
      break
    end
    -- close: r1_1
  end
end
function r0_0.InitEscPortraitReddotNode(r0_2)
  -- line: [25, 39] id: 2
end
function r0_0.InitEditBtnReddotNode(r0_3)
  -- line: [40, 45] id: 3
  if not ReddotManager.GetTreeNode("EditBtn") then
    local r1_3 = ReddotManager.AddNode("EditBtn", nil, 1)
  end
end
function r0_0.InitPortraitReddotNode(r0_4)
  -- line: [47, 74] id: 4
  if not ReddotManager.GetTreeNode("Portrait") then
    local r1_4 = ReddotManager.AddNode("Portrait", nil, 1)
  end
  ReddotManager.ClearLeafNodeCount("Portrait")
  local r2_4 = ReddotManager.GetLeafNodeCacheDetail("Portrait")
  local r3_4 = GWorld:GetAvatar()
  if r3_4 and r3_4.HeadIconList then
    for r8_4, r9_4 in pairs(r2_4) do
      local r10_4 = false
      for r15_4, r16_4 in ipairs(r3_4.HeadIconList) do
        if tostring(r16_4) == r8_4 then
          r10_4 = true
        end
      end
      -- close: r11_4
      if not r10_4 then
        r2_4[r8_4] = nil
      end
    end
    -- close: r4_4
    for r8_4, r9_4 in pairs(r3_4.HeadIconList and {}) do
      if ReddotManager.GetLeafNodeCacheDetail("Portrait")[tostring(r9_4)] then
        ReddotManager.IncreaseLeafNodeCount("Portrait")
      end
    end
    -- close: r4_4
  end
end
function r0_0.InitPortraitFrameReddotNode(r0_5)
  -- line: [76, 103] id: 5
  if not ReddotManager.GetTreeNode("PortraitFrame") then
    local r1_5 = ReddotManager.AddNode("PortraitFrame", nil, 1)
  end
  ReddotManager.ClearLeafNodeCount("PortraitFrame")
  local r2_5 = ReddotManager.GetLeafNodeCacheDetail("PortraitFrame")
  local r3_5 = GWorld:GetAvatar()
  if r3_5 and r3_5.HeadFrameList then
    for r8_5, r9_5 in pairs(r2_5) do
      local r10_5 = false
      for r15_5, r16_5 in ipairs(r3_5.HeadFrameList) do
        if tostring(r16_5) == r8_5 then
          r10_5 = true
        end
      end
      -- close: r11_5
      if not r10_5 then
        r2_5[r8_5] = nil
      end
    end
    -- close: r4_5
    for r8_5, r9_5 in pairs(r3_5.HeadFrameList and {}) do
      if ReddotManager.GetLeafNodeCacheDetail("PortraitFrame")[tostring(r9_5)] then
        ReddotManager.IncreaseLeafNodeCount("PortraitFrame")
      end
    end
    -- close: r4_5
  end
end
function r0_0.EchoAvatar(r0_6, r1_6)
  -- line: [105, 119] id: 6
  if not r1_6 then
    DebugPrint("Index is nil")
    return 
  end
  if not r0_6[r1_6] then
    DebugPrint("self[Index] is nil", r1_6)
    return 
  end
  if type(r0_6[r1_6]) == "table" then
    PrintTable(CommonUtils.BinaryDump(r0_6[r1_6]), 10, "EchoAvatarProp Dump:" .. r1_6)
  else
    DebugPrint("EchoAvatarProp:" .. r1_6, r0_6[r1_6])
  end
end
function r0_0.NotifyDiscoverNewNotice(r0_7)
  -- line: [120, 125] id: 7
  r0_7.logger.info("NotifyDiscoverNewNotice")
  local r1_7 = require("BluePrints.UI.WBP.Announcement.AnnounceUtils")
  if not r1_7 then
    return 
  end
  r1_7:MarkDirty(true)
end
function r0_0.NotifyDiscoverNewGameUICtrl(r0_8)
  -- line: [126, 134] id: 8
  r0_8.logger.info("NotifyDiscoverNewGameUICtrl")
  if r0_8.ServerInfo.HostId then
    require("BluePrints/UI/GameLogin/CdnTool"):GetCdnHideData(r0_8.ServerInfo.HostId)
  else
    DebugPrint("@ljh,刷新Cdn配置失败，未找到合法的HostId")
  end
end
function r0_0.CheckHeadFrameEnough(r0_9, r1_9)
  -- line: [135, 142] id: 9
  for r6_9, r7_9 in pairs(r1_9) do
    if not r0_9.HeadFrameList:HasValue(r6_9) then
      return false
    end
  end
  -- close: r2_9
  return true
end
function r0_0.SetAvatarHeadFrame(r0_10, r1_10, r2_10)
  -- line: [144, 154] id: 10
  DebugPrint("[SetAvatarHeadFrame] NewIconId:" .. r1_10)
  r0_10:CallServer("SetAvatarHeadFrame", function(r0_11)
    -- line: [146, 152] id: 11
    r0_10.logger.debug("SetAvatarHeadFrame callback", r0_11, r1_10)
    if r2_10 then
      r2_10(ErrorCode:Check(r0_11))
    end
  end, r1_10)
end
function r0_0._OnPropChangeSex(r0_12)
  -- line: [155, 157] id: 12
  AudioManager(GWorld):SetVoiceGender()
end
function r0_0._OnPropChangeWeitaSex(r0_13)
  -- line: [158, 160] id: 13
  AudioManager(GWorld):SetVoiceGender()
end
function r0_0._OnPropChangeHeadIconList(r0_14)
  -- line: [161, 173] id: 14
  for r5_14, r6_14 in ipairs(r0_14.HeadIconList) do
    local r7_14 = tostring(r6_14)
    if ReddotManager.GetLeafNodeCacheDetail("Portrait")[r7_14] == nil and r7_14 ~= "10001" then
      UIUtils.TryAddReddotCacheDetail(r7_14, "Portrait")
    end
  end
  -- close: r1_14
end
function r0_0.AutoClaimWeaponBreakCollectReward(r0_15, r1_15)
  -- line: [175, 178] id: 15
  PrintTable(r1_15, 10, "AutoClaimWeaponBreakCollectReward")
  EventManager:FireEvent(EventID.OnAutoClaimWeaponBreakCollectReward)
end
function r0_0._OnPropChangeHeadFrameList(r0_16)
  -- line: [180, 192] id: 16
  for r5_16, r6_16 in ipairs(r0_16.HeadFrameList) do
    local r7_16 = tostring(r6_16)
    if ReddotManager.GetLeafNodeCacheDetail("PortraitFrame")[r7_16] == nil and r7_16 ~= "-1" then
      UIUtils.TryAddReddotCacheDetail(r7_16, "PortraitFrame")
    end
  end
  -- close: r1_16
end
function r0_0.NotifyNextDay5AM(r0_17)
  -- line: [193, 198] id: 17
  DebugPrint("NotifyNextDay5AM, Start Refresh!!!")
  if r0_17:IsInBigWorld() then
    EventManager:FireEvent(EventID.OnRefreshWithNextDay)
  end
end
function r0_0._OnPropChangeCollectRewardExpRecord(r0_18)
  -- line: [200, 202] id: 18
  r0_18.NeedRefreshCollectRewardExpRecord = true
end
function r0_0.GetCollectRewardRecordCache(r0_19)
  -- line: [204, 219] id: 19
  if not r0_19.CollectRewardRecordCache or r0_19.NeedRefreshCollectRewardExpRecord then
    r0_19.CollectRewardRecordCache = {}
    r0_19.NeedRefreshCollectRewardExpRecord = false
    for r5_19, r6_19 in pairs(r0_19.CollectRewardExpRecord) do
      local r7_19 = r0_19.CollectRewardRecordCache
      for r12_19 in r5_19:gmatch("[^%.]+") do
        r7_19[r12_19] = r7_19[r12_19] and {}
        r7_19 = r7_19[r12_19]
      end
      -- close: r8_19
    end
    -- close: r1_19
  end
  return r0_19.CollectRewardRecordCache
end
function r0_0.CheckHeadSculptureEnough(r0_20, r1_20)
  -- line: [221, 228] id: 20
  for r6_20, r7_20 in pairs(r1_20) do
    if not r0_20.HeadIconList:HasValue(r6_20) then
      return false
    end
  end
  -- close: r2_20
  return true
end
function r0_0.SetAvatarHeadIcon(r0_21, r1_21, r2_21)
  -- line: [231, 241] id: 21
  DebugPrint("[SetAvatarHeadIcon] NewIconId:" .. r1_21)
  r0_21:CallServer("SetAvatarHeadIcon", function(r0_22)
    -- line: [233, 239] id: 22
    r0_21.logger.debug("SetAvatarHeadIcon callback", r0_22, r1_21)
    if r2_21 then
      r2_21(ErrorCode:Check(r0_22))
    end
  end, r1_21)
end
function r0_0.NotifyUnlockBGM(r0_23, r1_23)
  -- line: [243, 245] id: 23
  DebugPrint("NotifyUnlockBGM", r1_23)
end
function r0_0.SetAvatarSignature(r0_24, r1_24, r2_24)
  -- line: [247, 264] id: 24
  DebugPrint("[SetAvatarSignature] NewSignature:" .. r1_24)
  r1_0.CheckStringSensitive(GWorld.GameInstance:GetGameUIManager(), r1_24, function(r0_25, r1_25, r2_25)
    -- line: [250, 252] id: 25
    ErrorCode:Check(Const.PlayerSignatureIllegal)
  end, function(r0_26)
    -- line: [253, 262] id: 26
    r0_24:CallServer("SetAvatarSignature", function(r0_27)
      -- line: [254, 260] id: 27
      r0_24.logger.debug("SetAvatarSignature callback", r0_27, r1_24)
      local r1_27 = ErrorCode:Check(r0_27)
      if r2_24 then
        r2_24(r1_27)
      end
    end, r1_24)
  end)
end
function r0_0.CompletedDialogue(r0_28, r1_28)
  -- line: [265, 268] id: 28
  DebugPrint("[CompletedDialogue] DialogueId:" .. r1_28)
  r0_28:CallServerMethod("CompletedDialogue", r1_28)
end
function r0_0.ClearAvatarSignature(r0_29, r1_29)
  -- line: [269, 279] id: 29
  DebugPrint("[ClearAvatarSignature]")
  r0_29:CallServer("SetAvatarSignature", function(r0_30)
    -- line: [271, 277] id: 30
    r0_29.logger.debug("ClearAvatarSignature callback", r0_30)
    local r1_30 = ErrorCode:Check(r0_30)
    if r1_29 then
      r1_29(r1_30)
    end
  end, "")
end
function r0_0.GetAvatarSignature(r0_31)
  -- line: [281, 284] id: 31
  DebugPrint("[GetAvatarSignature]" .. r0_31.Signature)
  return r0_31.Signature
end
function r0_0.SetAvatarBirthday(r0_32, r1_32, r2_32, r3_32)
  -- line: [286, 296] id: 32
  DebugPrint("[SetAvatarBirthday] NewBirthday:" .. r1_32 .. r2_32)
  r0_32:CallServer("SetAvatarBirthday", function(r0_33)
    -- line: [288, 294] id: 33
    r0_32.logger.debug("SetAvatarBirthday callback", r0_33, r1_32, r2_32)
    local r1_33 = ErrorCode:Check(r0_33)
    if r3_32 then
      r3_32(r1_33)
    end
  end, r1_32, r2_32)
end
function r0_0.GetAvatarBirthday(r0_34)
  -- line: [298, 300] id: 34
  return r0_34.Birthday[1], r0_34.Birthday[2], r0_34.Birthday[3]
end
function r0_0.GMResetAvatarNicknameCD(r0_35)
  -- line: [303, 306] id: 35
  DebugPrint("[GMResetAvatarNicknameCD]")
  r0_35:CallServerMethod("GMResetAvatarNicknameCD")
end
function r0_0.AvatarCreateRole(r0_36, r1_36, r2_36, r3_36)
  -- line: [308, 322] id: 36
  DebugPrint("AvatarCreateRole", r1_36, r2_36)
  r0_36:CallServer("AvatarCreateRole", function(r0_37)
    -- line: [310, 320] id: 37
    DebugPrint("[AvatarCreateRole] ErrCode:", ErrorCode:Name(r0_37))
    local r1_37 = ErrorCode:Check(r0_37)
    if r1_37 then
      local r2_37 = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UEMHeroUSDKSubsystem:StaticClass())
      if r2_37 then
        r2_37:MSDKUploadCommonEventByEventName("create_role")
      end
    end
    r3_36(r1_37)
  end, r1_36, r2_36)
end
function r0_0.SetWeitaInfo(r0_38, r1_38, r2_38, r3_38)
  -- line: [328, 336] id: 38
  DebugPrint("SetWeitaInfo", r1_38, r2_38)
  r0_38:CallServer("SetWeitaInfo", function(r0_39)
    -- line: [330, 334] id: 39
    DebugPrint("[SetWeitaInfo] ErrCode:", ErrorCode:Name(r0_39))
    r3_38(ErrorCode:Check(r0_39))
  end, tostring(r1_38), tonumber(r2_38))
end
function r0_0.SetAvatarNickname(r0_40, r1_40, r2_40)
  -- line: [338, 348] id: 40
  DebugPrint("SetAvatarNickname", r1_40)
  r0_40:CallServer("SetAvatarNickname", function(r0_41)
    -- line: [340, 346] id: 41
    DebugPrint("[SetAvatarNickname] ErrCode:", ErrorCode:Name(r0_41))
    if ErrorCode:Check(r0_41) then
      EventManager:FireEvent(EventID.OnChangeNickName, r1_40)
      r2_40()
    end
  end, r1_40)
end
function r0_0.SetCatName(r0_42, r1_42, r2_42)
  -- line: [350, 357] id: 42
  DebugPrint("SetCatName", r1_42)
  r0_42:CallServer("SetCatName", function(r0_43)
    -- line: [352, 355] id: 43
    DebugPrint("[SetCatName] ErrCode:", ErrorCode:Name(r0_43))
    r2_42(r0_43)
  end, r1_42)
end
function r0_0.GMSetAvatarActionPoint(r0_44, r1_44)
  -- line: [359, 362] id: 44
  DebugPrint("[GMSetAvatarActionPoint] NewActionPoint:", r1_44)
  r0_44:CallServerMethod("GMSetAvatarActionPoint", r1_44)
end
function r0_0.GMCostDungeonActionPoint(r0_45, r1_45)
  -- line: [364, 366] id: 45
  r0_45:CallServerMethod("GMCostDungeonActionPoint", r1_45)
end
function r0_0.PurchaseActionPoint(r0_46, r1_46)
  -- line: [367, 375] id: 46
  r0_46:CallServer("PurchaseActionPoint", function(r0_47)
    -- line: [368, 373] id: 47
    DebugPrint("[PurchaseActionPoint] ErrCode:", ErrorCode:Name(r0_47))
    if r1_46 then
      r1_46(r0_47)
    end
  end)
end
function r0_0.GMSetPlayerExp(r0_48, r1_48)
  -- line: [377, 380] id: 48
  DebugPrint("[GMSetPlayerExp] newPlayerExp:", r1_48)
  r0_48:CallServerMethod("GMSetPlayerExp", r1_48)
end
function r0_0.GMSetPlayerLevel(r0_49, r1_49)
  -- line: [382, 385] id: 49
  DebugPrint("[GMSetPlayerLevel] newPlayerLevel:" .. r1_49)
  r0_49:CallServerMethod("GMSetPlayerLevel", r1_49)
end
function r0_0.NotifyAvatarLevelUpdate(r0_50, r1_50)
  -- line: [387, 425] id: 50
  local r2_50 = r1_50.Level
  local r3_50 = r1_50.Exp
  local r4_50 = r0_50.Level
  local r5_50 = r0_50.Exp
  DebugPrint("[NotifyAvatarLevelUpdate]:", r2_50, r3_50, r4_50, r5_50)
  local r6_50 = {
    OldLevel = r2_50,
    OldExp = r3_50,
    CurLevel = r4_50,
    CurExp = r5_50,
    ShowProgresBar = true,
  }
  if (r2_50 ~= r4_50 or r3_50 >= r5_50) and r2_50 < r4_50 then
  end
  local r7_50 = GWorld.GameInstance:GetGameUIManager()
  if r7_50 then
    r7_50:TryShowPlayerLevelUpInfo(r6_50)
  end
end
function r0_0.FilterStringSensitiveWord(r0_51, r1_51, r2_51)
  -- line: [435, 441] id: 51
  r0_51:CallServer("FilterStringSensitiveWord", function(r0_52, r1_52)
    -- line: [436, 439] id: 52
    DebugPrint("FilterStringSensitiveWord Cb:", r0_52, r1_52)
    r2_51(r0_52, r1_52)
  end, r1_51)
end
function r0_0.RpcRecorderRestart(r0_53)
  -- line: [443, 446] id: 53
  require("NetworkEngine.Rpc.RpcRecorder"):Restart()
end
function r0_0.RpcRecorderPrint(r0_54, r1_54)
  -- line: [448, 452] id: 54
  require("NetworkEngine.Rpc.RpcRecorder"):Print(tonumber(r1_54 and 2))
end
function r0_0.RpcRecorderSaveStart(r0_55, r1_55)
  -- line: [454, 457] id: 55
  require("NetworkEngine.Rpc.RpcRecorder"):StartRecord("F:/DefaultRpcRecorder.bin")
end
function r0_0.RpcRecorderSaveStop(r0_56)
  -- line: [459, 462] id: 56
  require("NetworkEngine.Rpc.RpcRecorder"):EndRecord()
end
function r0_0.RpcRecorderLoadTest(r0_57)
  -- line: [464, 468] id: 57
  PrintTable(require("NetworkEngine.Rpc.RpcRecorder"):LoadRecordMsg("F:/DefaultRpcRecorder.bin"), 10, "RpcRecorderLoadTest")
end
function r0_0.GetAvatarLevelRewards(r0_58, r1_58, r2_58)
  -- line: [470, 483] id: 58
  print(_G.LogTag, "GetAvatarLevelRewards")
  r0_58:CallServer("GetAvatarLevelRewards", function(r0_59, r1_59)
    -- line: [472, 480] id: 59
    if not ErrorCode:Check(r0_59) then
      return 
    end
    if r1_58 then
      r1_58(r1_59)
    end
  end, r2_58)
end
function r0_0.OnHourlyRefresh(r0_60, r1_60)
  -- line: [486, 490] id: 60
  r0_60.logger.debug("OnHourlyRefresh", TimeUtils.TimeToStr(r1_60))
  EventManager:FireEvent(EventID.OnHourlyRefresh)
  r0_60:OnRefreshShop(r1_60)
end
function r0_0.OnDailyRefresh(r0_61, r1_61)
  -- line: [492, 500] id: 61
  r0_61.logger.debug("OnDailyRefresh", TimeUtils.TimeToStr(r1_61))
  EventManager:FireEvent(EventID.OnDailyRefresh)
  r0_61:OnRefreshShop(r1_61)
  r0_61:OnDynamicQuestDayLimitTimesChange(false)
  r0_61:OnDailyRefreshGachaCache()
  r0_61:OnDailyRefreshGachaBubble()
  r0_61:OnDailyRefreshPaotaiGameNewLevel()
end
function r0_0.OnWeeklyRefresh(r0_62, r1_62)
  -- line: [502, 507] id: 62
  r0_62.logger.debug("OnWeeklyRefresh", TimeUtils.TimeToStr(r1_62))
  EventManager:FireEvent(EventID.OnWeeklyRefresh)
  r0_62:OnRefreshShop(r1_62)
  r0_62:OnRefreshRougeLikeRewardReddot()
end
function r0_0.OnMonthlyRefresh(r0_63, r1_63)
  -- line: [509, 513] id: 63
  r0_63.logger.debug("OnMonthlyRefresh", TimeUtils.TimeToStr(r1_63))
  EventManager:FireEvent(EventID.OnMonthlyRefresh)
  r0_63:OnRefreshShop(r1_63)
end
return r0_0
