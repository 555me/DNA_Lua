-- filename: @C:/Pack/Branch/geili11\Content/Script/Utils.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {}
local r1_0 = table.concat
local r2_0 = tostring
local r3_0 = type
local r4_0 = UE4.URuntimeCommonFunctionLibrary.IsDistribution()
local r5_0 = UE4.URuntimeCommonFunctionLibrary.EnableLogInShipping()
local r6_0 = require("Utils.TextUtils")
local r7_0 = require("Utils.MiscUtils")
local r8_0 = nil	-- notice: implicit variable refs by block#[4, 8]
if r4_0 and not r5_0 then
  r8_0 = r7_0.EmptyFunction
  if not r8_0 then
    ::label_28::
    function r8_0(r0_1, r1_1, r2_1, r3_1)
      -- line: [58, 74] id: 1
      if r0_1 == nil then
        return 
      end
      if r3_0(r0_1) ~= "table" then
        print(LogTag, r2_0(r0_1))
        return 
      end
      if not r1_1 then
        r1_1 = 1
      end
      local r4_1 = {
        "PrintTable: ",
        r2_0(r2_1),
        r2_0(r0_1),
        "\n"
      }
      r7_0.GetStrTable(r4_1, r0_1, 1, r1_1, r3_1)
      local r5_1 = r1_0(r4_1)
      print(LogTag, r5_1)
      return r5_1
    end
  end
else
  goto label_28	-- block#3 is visited secondly
end
r0_0.PrintTable = r8_0
if r4_0 and not r5_0 then
  r8_0 = r7_0.EmptyFunction
  if not r8_0 then
    ::label_37::
    function r8_0(r0_2, r1_2, r2_2)
      -- line: [76, 86] id: 2
      local r3_2 = debug.traceback()
      if r1_2 then
        r3_2 = r1_2 .. "\n" .. r3_2
      end
      if not r0_2 then
        r0_2 = LogTag
      end
      if not r2_2 then
        DebugPrint(r0_2, r3_2)
      end
      return r3_2
    end
  end
else
  goto label_37	-- block#7 is visited secondly
end
r0_0.Traceback = r8_0
function r0_0.IsStandAlone(r0_3)
  -- line: [93, 95] id: 3
  return UNeModeFunctionLibrary.IsStandAlone(r0_3)
end
function r0_0.IsDedicatedServer(r0_4)
  -- line: [97, 102] id: 4
  if GWorld._IsDedicatedServer ~= nil and not GWorld.IsDev then
    return GWorld._IsDedicatedServer
  end
  return UNeModeFunctionLibrary.IsDedicatedServer(r0_4)
end
function r0_0.IsClient(r0_5)
  -- line: [104, 106] id: 5
  return UNeModeFunctionLibrary.IsClient(r0_5)
end
function r0_0.IsAuthority(r0_6)
  -- line: [108, 110] id: 6
  return r0_6:GetLocalRole() == 3
end
function r0_0.New(r0_7)
  -- line: [112, 135] id: 7
  if r0_7 == nil then
    return r0_7
  end
  if r3_0(r0_7) ~= "table" then
    return r0_7
  end
  local r1_7 = {}
  local r2_7 = getmetatable(r0_7)
  if r2_7 ~= nil then
    setmetatable(r1_7, r2_7)
  end
  for r7_7, r8_7 in pairs(r0_7) do
    if r3_0(r8_7) == "table" then
      r1_7[r7_7] = New(r8_7)
    else
      r1_7[r7_7] = r8_7
    end
  end
  -- close: r3_7
  return r1_7
end
function r0_0.IsEmptyTable(r0_8)
  -- line: [137, 139] id: 8
  return table.isempty(r0_8)
end
function r8_0(r0_9, r1_9)
  -- line: [141, 147] id: 9
  local r2_9 = {}
  string.gsub(r0_9, "[^" .. r1_9 .. "]+", function(r0_10)
    -- line: [143, 145] id: 10
    table.insert(r2_9, r0_10)
  end)
  return r2_9
end
r0_0.Split = r8_0
if r4_0 and not r5_0 then
  r8_0 = r7_0.EmptyFunction and function(r0_11)
    -- line: [149, 154] id: 11
    GWorld.logger.error(r0_11)
  end
else
  goto label_60	-- block#11 is visited secondly
end
r0_0.ScreenPrint = r8_0
function r0_0.GLink(r0_12)
  -- line: [175, 191] id: 12
  local r1_12 = UE.AHotUpdateGameMode.IsGlobalPak()
  local r2_12 = DataMgr.PolicyLink[r0_12]
  if not r2_12 then
    return nil
  end
  local r3_12 = nil
  if r1_12 then
    local r4_12 = EMCache:Get("SystemLanguage") and "CN"
    if r2_12 then
      r3_12 = r2_12["Abroad" .. r4_12] and r2_12.ChinaCN
    end
  elseif r2_12 then
    r3_12 = r2_12.ChinaCN
  end
  return r3_12
end
_G.Link = r0_0.GLink
function r0_0.GText(r0_13)
  -- line: [194, 196] id: 13
  return r6_0:GetDisplayText(r0_13)
end
_G.GText = r0_0.GText
function r0_0.EnText(r0_14)
  -- line: [199, 201] id: 14
  return r6_0:GetDisplayText(r0_14, CommonConst.SystemLanguages.EN)
end
_G.EnText = r0_0.EnText
function r0_0.GDate(r0_15, r1_15, r2_15)
  -- line: [204, 213] id: 15
  if not r2_15 then
    r2_15 = CommonConst.SystemLanguage
  end
  if r2_15 == CommonConst.SystemLanguages.CN or r2_15 == CommonConst.SystemLanguages.JP or r2_15 == CommonConst.SystemLanguages.KR then
    return string.format("%02d-%02d", r0_15, r1_15)
  else
    return string.format("%02d-%02d", r1_15, r0_15)
  end
end
function r0_0.GDate_YMD(r0_16, r1_16, r2_16, r3_16)
  -- line: [215, 225] id: 16
  if not r3_16 then
    r3_16 = CommonConst.SystemLanguage
  end
  if r3_16 == CommonConst.SystemLanguages.CN or r3_16 == CommonConst.SystemLanguages.JP or r3_16 == CommonConst.SystemLanguages.KR then
    return string.format("%02d-%02d-%02d", r0_16, r1_16, r2_16)
  else
    return string.format("%02d-%02d-%02d", r2_16, r1_16, r0_16)
  end
end
function r0_0.GDate_YMD_Timestamp(r0_17, r1_17)
  -- line: [227, 230] id: 17
  local r2_17 = os.date("*t", r0_17)
  return r0_0.GDate_YMD(r2_17.year, r2_17.month, r2_17.day, r1_17)
end
function r0_0.Split(r0_18, r1_18)
  -- line: [232, 243] id: 18
  r0_18 = r2_0(r0_18)
  r1_18 = r2_0(r1_18)
  if r1_18 == "" then
    return false
  end
  local r2_18 = 0
  local r3_18 = {}
  for r8_18, r9_18 in function()
    -- line: [237, 237] id: 19
    return string.find(r0_18, r1_18, r2_18, true)
  end, nil, nil, nil do
    table.insert(r3_18, string.sub(r0_18, r2_18, r8_18 + -1))
    r2_18 = r9_18 + 1
  end
  -- close: r4_18
  table.insert(r3_18, string.sub(r0_18, r2_18))
  return r3_18
end
function r0_0.UIManager(r0_20)
  -- line: [248, 259] id: 20
  if not r0_0.IsValid(r0_0._UIManager) then
    DebugPrint(WarningTag, "Utils.UIManager 重新获得UIManager")
    if not r0_20 then
      r0_20 = GWorld.GameInstance
    end
    r0_0._UIManager = UE4.UGameplayStatics.GetGameInstance(r0_20):GetGameUIManager()
    return r0_0._UIManager
  end
  return r0_0._UIManager
end
_G.UIManager = r0_0.UIManager
function r0_0.GameState(r0_21)
  -- line: [265, 278] id: 21
  if not r0_21 then
    r0_21 = GWorld.GameInstance
  end
  return UE4.UGameplayStatics.GetGameState(r0_21)
end
_G.GameState = r0_0.GameState
r0_0.IsValid = r7_0.IsValid
_G.IsValid = r0_0.IsValid
r0_0.AudioManager_Var = nil
function r0_0.AudioManager(r0_22)
  -- line: [289, 294] id: 22
  if not r0_0.AudioManager_Var then
    r0_0.AudioManager_Var = r7_0.GetAudioManager_Lua(r0_22)
  end
  return r0_0.AudioManager_Var
end
_G.AudioManager = r0_0.AudioManager
function r0_0.HeroUSDKSubsystem(r0_23)
  -- line: [299, 304] id: 23
  if not r0_23 then
    r0_23 = GWorld.GameInstance
  end
  return USubsystemBlueprintLibrary.GetGameInstanceSubsystem(r0_23, UEMHeroUSDKSubsystem)
end
function r0_0.WorldTravelSubsystem(r0_24)
  -- line: [306, 311] id: 24
  if not r0_24 then
    r0_24 = GWorld.GameInstance
  end
  return USubsystemBlueprintLibrary.GetGameInstanceSubsystem(r0_24, UWorldTravelSubsystem)
end
function r0_0.TalkSubsystem(r0_25)
  -- line: [314, 319] id: 25
  if not r0_25 then
    r0_25 = GWorld.GameInstance
  end
  return USubsystemBlueprintLibrary.GetWorldSubsystem(r0_25, UTalkSubsystem)
end
function r8_0(...)
  -- line: [321, 334] id: 26
  local r0_26 = require("crypt")
  local r1_26 = r0_26.randomkey()
  local r2_26 = r0_26.randomkey()
  local r3_26 = r0_26.rc4_init(r1_26)
  local r4_26 = r0_26.rc4_init(r1_26)
  if r0_26.rc4_crypt(r4_26, r0_26.rc4_crypt(r4_26, r0_26.rc4_crypt(r3_26, r0_26.rc4_crypt(r3_26, r2_26)))) ~= r2_26 then
    r0_0.ScreenPrint("加密算法验证失败")
  end
end
r8_0()
local function r9_0()
  -- line: [337, 344] id: 27
  if UE4.UDLSSLibrary then
    return UE4.UDLSSLibrary.IsDLSSSupported() and UE4.UDLSSLibrary.IsDLAAEnabled() and UE4.UDLSSLibrary.GetDLSSMode() ~= UE4.UDLSSMode.Off
  end
  return false
end
local r10_0 = {
  k = 1000,
  M = 1000000,
  B = 1000000000,
}
function r0_0.FormatNumber(r0_28, r1_28)
  -- line: [350, 399] id: 28
  if not r1_28 then
    return r7_0.FormatNumberWithCommas(r0_28)
  end
  local r2_28 = r2_0(math.floor(r0_28))
  local r3_28 = string.len(r2_28)
  local r4_28 = nil
  local r5_28 = nil
  local r6_28 = nil
  if r3_28 >= 11 then
    r4_28 = "B"
    r6_28 = "UI_Amount_Billion"
    r5_28 = 9
  elseif r3_28 >= 8 then
    r4_28 = "M"
    r6_28 = "UI_Amount_Million"
    r5_28 = 6
  elseif r3_28 >= 6 then
    r4_28 = "k"
    r6_28 = "UI_Amount_Thousand"
    r5_28 = 3
  end
  if not r4_28 or r10_0[r4_28] == nil then
    return r2_28
  end
  local r7_28 = r7_0.FormatNumberWithCommas(string.sub(r2_28, 1, r3_28 - r5_28))
  if r0_28 % r10_0[r4_28] == 0 then
    return r7_28 .. GText(r6_28)
  else
    local r8_28 = r0_28 * 10 // r10_0[r4_28] % 10
    if r8_28 == 9 then
      return r7_28 .. ".9" .. GText(r6_28)
    else
      local r10_28 = r10_0[r4_28]
      if r0_28 * 100 // r10_28 % 10 >= 5 then
        r10_28 = 1 and 0
      else
        goto label_96	-- block#17 is visited secondly
      end
      r8_28 = r8_28 + r10_28
      if r8_28 > 0 then
        return r7_28 .. "." .. r8_28 .. GText(r6_28)
      else
        return r7_28 .. GText(r6_28)
      end
    end
  end
end
function r0_0.FormatWeaponInfo(r0_29, r1_29)
  -- line: [401, 413] id: 29
  r0_29.SlotData = {}
  r0_29.ModData = {}
  r0_29.ModPassives = nil
  r0_29.SkillInfos = nil
  r0_29.ReplaceAttrs = nil
  r0_29.EnhanceLevel = r1_29.EnhanceLevel and 0
  r0_29.WeaponId = r1_29.WeaponId and 0
  r0_29.GradeLevel = r1_29.GradeLevel and 0
  r0_29.AppearanceInfo = r1_29
  r0_29.AppearanceInfo.EnhanceLevel = nil
  r0_29.AppearanceInfo.GradeLevel = nil
end
r0_0.NPCCreateSubSystem_Var = nil
function r0_0.NPCCreateSubSystem(r0_30)
  -- line: [418, 420] id: 30
  return r0_0.NPCCreateSubSystem_Var and r7_0.GetNPCCreateSubSystem_Lua(r0_30)
end
_G.NPCCreateSubSystem = r0_0.NPCCreateSubSystem
return r0_0
