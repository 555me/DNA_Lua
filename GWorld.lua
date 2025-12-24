-- filename: @C:/Pack/Branch/geili11\Content/Script/GWorld.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("NetworkEngine.Common.IdManager")
local r1_0 = require("NetworkEngine.Common.LogManager")
local r2_0 = require("BluePrints.Story.StoryMgr")
local r3_0 = require("Utils.MiscUtils")
local r4_0 = {
  logger = r1_0:GenClientLogger(),
  GameInstance = nil,
  NetworkMgr = nil,
  EntityManager = nil,
  EntityFactory = nil,
  IdManager = r0_0,
  ServerListMgr = nil,
  CachedUI = {},
  BP_Avatar = nil,
  LimitCallMethods = {},
  GlobalCallbackId = 0,
  StoryMgr = r2_0(),
  bDebugServer = false,
  IsForbidEntityMessage = false,
  DefaultDevice = nil,
  IsDev = true,
  EnterMode = "",
  EnterPlatform = "",
  ChooseServerArea = "China",
  ServerAreaToGroupId = {
    Asian = 1001,
    HMT = 1002,
    Europe = 1003,
    America = 1004,
    China = 1005,
  },
  DevServerAreaToGroupId = {
    America = 501,
    Asian = 502,
    Europe = 503,
    HMT = 504,
    China = 101,
  },
  GetAvatarInfos = nil,
  IsOpenWroldRegion = false,
  HotfixDataIndex = DataMgr.HotfixData.index,
  IsGlobalServer = function(r0_1)
    -- line: [66, 68] id: 1
    return AHotUpdateGameMode.IsGlobalPak()
  end,
  IsChinaServer = function(r0_2)
    -- line: [69, 71] id: 2
    return AHotUpdateGameMode.IsGlobalPak() == false
  end,
  OpenWorldRegionState = function(r0_3)
    -- line: [73, 75] id: 3
    r4_0.IsOpenWroldRegion = true
  end,
  CloseWorldRegionState = function(r0_4)
    -- line: [77, 79] id: 4
    r4_0.IsOpenWroldRegion = false
  end,
  GetWorldRegionState = function(r0_5)
    -- line: [81, 83] id: 5
    return r4_0.IsOpenWroldRegion
  end,
  GenCallbackId = function(r0_6)
    -- line: [85, 88] id: 6
    r0_6.GlobalCallbackId = r0_6.GlobalCallbackId + 1
    return r0_6.GlobalCallbackId
  end,
  GetBPAvatar = function(r0_7)
    -- line: [91, 93] id: 7
    return r0_7.BP_Avatar
  end,
  GetAvatar = function(r0_8)
    -- line: [96, 101] id: 8
    if r0_8.BP_Avatar then
      return r0_8.BP_Avatar:GetClientAvatar()
    end
    return nil
  end,
  GetDSEntity = function(r0_9)
    -- line: [104, 110] id: 9
    if r0_9.BP_Avatar then
      return r0_9.BP_Avatar:GetDSEntity()
    end
    return nil
  end,
  GetServerEntity = function(r0_10)
    -- line: [113, 129] id: 10
    if not r0_10.BP_Avatar then
      return nil
    end
    local r1_10 = r0_10.BP_Avatar:GetClientAvatar()
    if r1_10 then
      return r1_10
    end
    r1_10 = r0_10.BP_Avatar:GetDSEntity()
    if r1_10 then
      return r1_10
    end
    return nil
  end,
  DSBLog = function(r0_11, ...)
    -- line: [131, 138] id: 11
    local r1_11 = r0_11:GetDSEntity()
    if not r1_11 then
      return 
    end
    r1_11:BLog(...)
  end,
  GetCurrentTime = function(r0_12)
    -- line: [140, 142] id: 12
    return UE4.UGameplayStatics.GetTimeSeconds(r0_12.GameInstance)
  end,
  IsSkynetServer = function(r0_13)
    -- line: [146, 148] id: 13
    return false
  end,
  GetMainPlayer = function(r0_14)
    -- line: [151, 159] id: 14
    if r0_14.GameInstance then
      local r1_14 = UE4.UGameplayStatics.GetPlayerController(r0_14.GameInstance, 0)
      if IsValid(r1_14) and r1_14.GetMyPawn then
        return r1_14:GetMyPawn()
      end
    end
    return nil
  end,
  ForbidEntityMessage = function(r0_15, r1_15)
    -- line: [161, 163] id: 15
    local r2_15 = tonumber(r1_15)
    if r2_15 == 1 then
      r2_15 = true and false
    else
      goto label_8	-- block#2 is visited secondly
    end
    r4_0.IsForbidEntityMessage = r2_15
  end,
  IsStandAlone = function(r0_16)
    -- line: [166, 168] id: 16
    return IsStandAlone(r0_16.GameInstance)
  end,
  IsDedicatedServer = function(r0_17)
    -- line: [170, 179] id: 17
    if r4_0.IsDev then
      return IsDedicatedServer(r0_17.GameInstance)
    end
    if r4_0._IsDedicatedServer == nil then
      r4_0._IsDedicatedServer = IsDedicatedServer(r0_17.GameInstance)
    end
    return r4_0._IsDedicatedServer
  end,
  IsListenServer = function(r0_18)
    -- line: [181, 183] id: 18
    return r3_0.IsListenServer(r0_18.GameInstance)
  end,
  IsClient = function(r0_19)
    -- line: [185, 187] id: 19
    return IsClient(r0_19.GameInstance)
  end,
  GameModeIndex = 0,
  GameModes = {},
  _CurrentGameMode = nil,
  GameModeNumber = 0,
}
local r5_0 = UE4.UGameplayStatics.GetGameMode
UE4.UGameplayStatics.GetGameMode = function(...)
  -- line: [197, 202] id: 20
  if r4_0._CurrentGameMode then
    return r4_0._CurrentGameMode
  end
  return r5_0(...)
end
function r4_0.AddGameMode(r0_21, r1_21)
  -- line: [204, 215] id: 21
  r0_21.GameModeIndex = r0_21.GameModeIndex + 1
  r0_21.GameModes[r0_21.GameModeIndex] = r1_21
  r0_21.GameModeNumber = r0_21.GameModeNumber + 1
  r0_21._CurrentGameMode = r1_21
  if r0_21.GameModeNumber > 1 then
    r0_21._CurrentGameMode = nil
  end
  return r0_21.GameModeIndex
end
function r4_0.RemoveGameMode(r0_22, r1_22)
  -- line: [217, 222] id: 22
  r4_0.GameModeNumber = r4_0.GameModeNumber + -1
  r0_22.GameModes[r0_22.GameModeIndex] = nil
  r0_22._CurrentGameMode = nil
end
r4_0.GameStateIndex = 0
r4_0.GameStates = {}
r4_0._CurrentGameState = nil
r4_0.GameStateNumber = 0
local r6_0 = UE4.UGameplayStatics.GetGameState
UE4.UGameplayStatics.GetGameState = function(...)
  -- line: [231, 239] id: 23
  if URuntimeCommonFunctionLibrary.IsPlayInEditor(...) then
    return r6_0(...)
  end
  if r4_0._CurrentGameState then
    return r4_0._CurrentGameState
  end
  return r6_0(...)
end
function r4_0.AddGameState(r0_24, r1_24)
  -- line: [241, 252] id: 24
  r0_24.GameStateIndex = r0_24.GameStateIndex + 1
  r0_24.GameStates[r0_24.GameStateIndex] = r1_24
  r0_24.GameStateNumber = r0_24.GameStateNumber + 1
  r0_24._CurrentGameState = r1_24
  if r0_24.GameStateNumber > 1 then
    r0_24._CurrentGameState = nil
  end
  return r0_24.GameStateIndex
end
function r4_0.RemoveGameState(r0_25, r1_25)
  -- line: [254, 259] id: 25
  r4_0.GameStateNumber = r4_0.GameStateNumber + -1
  r0_25.GameStates[r0_25.GameStateIndex] = nil
  r0_25._CurrentGameState = nil
end
return r4_0
