-- filename: @C:/Pack/Branch/geili11\Content/Script/UnLua.lua
-- version: lua54
-- line: [0, 0] id: 0
if _UNLUA ~= nil then
  return 
end
_UNLUA = 1
local r0_0 = rawget
local r1_0 = rawset
local r2_0 = type
local r3_0 = getmetatable
local r4_0 = setmetatable
local r5_0 = require
local r6_0 = string.sub
local r7_0 = GetUProperty
local r8_0 = SetUProperty
local r9_0 = RegisterClass
local r10_0 = RegisterEnum
local r11_0 = UEPrint and print
local r12_0 = NetPrint
local r13_0 = UE
_NotExist = _NotExist and {}
local r14_0 = _NotExist
local function r15_0(r0_1, r1_1)
  -- line: [94, 125] id: 1
  local r2_1 = r3_0(r0_1)
  local r3_1 = r0_0(r2_1, r1_1)
  if r3_1 == nil then
    r3_1 = r2_1[r1_1]
    if r3_1 == nil then
      r1_0(r2_1, r1_1, r14_0)
      return nil
    end
    r1_0(r2_1, r1_1, r3_1)
  end
  if rawequal(r3_1, r14_0) then
    return nil
  end
  if r2_0(r3_1) == "userdata" then
    return r7_0(r0_1, r3_1)
  end
  r1_0(r0_1, r1_1, r3_1)
  return r3_1
end
local function r16_0(r0_2, r1_2, r2_2)
  -- line: [127, 134] id: 2
  local r4_2 = r3_0(r0_2)[r1_2]
  if r2_0(r4_2) == "userdata" then
    return r8_0(r0_2, r4_2, r2_2)
  end
  r1_0(r0_2, r1_2, r2_2)
end
local function r17_0(r0_3, r1_3)
  -- line: [136, 150] id: 3
  for r6_3, r7_3 in pairs(r0_3) do
    if r6_3 ~= "__index" and r6_3 ~= "__newindex" and r6_3 ~= "Super" and r2_0(r7_3) == "function" then
      r1_0(r1_3, r6_3, r7_3)
    end
  end
  -- close: r2_3
end
local r18_0 = nil
local function r19_0()
  -- line: [153, 155] id: 4
  return r18_0
end
local function r20_0(r0_5)
  -- line: [157, 205] id: 5
  local r1_5 = {
    __index = r15_0,
    __newindex = r16_0,
    Super = nil,
  }
  if r2_0(r0_5) == "table" then
    for r6_5, r7_5 in pairs(r0_5) do
      local r8_5 = nil
      if r2_0(r7_5) == "table" then
        r8_5 = r7_5
      else
        r8_5 = r5_0(r7_5)
      end
      if r8_5 == nil then
        r11_0("Can not require file " .. tostring(r7_5))
      else
        if r1_5.Super == nil then
          r1_5.Super = r8_5
          r4_0(r1_5, r3_0(r1_5.Super))
        end
        r17_0(r8_5, r1_5)
      end
    end
    -- close: r2_5
  elseif r0_5 ~= nil then
    local r2_5 = r5_0(r0_5)
    if r2_5 == nil then
      r11_0("Can not require file " .. tostring(r0_5))
    else
      r1_5.Super = r2_5
      r4_0(r1_5, r3_0(r1_5.Super))
      r17_0(r2_5, r1_5)
    end
  end
  r1_5.Get_G = r19_0
  function r1_5.add_ref(r0_6)
    -- line: [196, 203] id: 6
    if not r1_5.ref_tables then
      r1_5.ref_tables = r4_0({}, {
        __mode = "kv",
      })
    end
    table.insert(r1_5.ref_tables, r0_6)
  end
  return r1_5
end
local function r21_0(r0_7, r1_7)
  -- line: [207, 217] id: 7
  if not r1_7 then
    return false
  end
  for r6_7, r7_7 in pairs(r1_7) do
    if r0_7 == r7_7 then
      return true
    end
  end
  -- close: r2_7
  return false
end
local function r22_0(r0_8, r1_8)
  -- line: [220, 261] id: 8
  local r2_8 = {}
  for r7_8, r8_8 in pairs(r0_8) do
    if r2_0(r8_8) == "function" and string.sub(r7_8, 1, 2) ~= "__" then
      if r2_8[r7_8] == nil then
        r2_8[r7_8] = {}
      end
      table.insert(r2_8[r7_8], r8_8)
    end
  end
  -- close: r3_8
  local r3_8 = r0_0(r0_8, "_components")
  if r2_0(r3_8) == "table" then
    for r8_8, r9_8 in ipairs(r3_8) do
      for r15_8, r16_8 in pairs(r5_0(r9_8)) do
        local r17_8 = r21_0(r15_8, r1_8)
        if r2_0(r16_8) == "function" and string.sub(r15_8, 1, 2) ~= "__" and not r17_8 then
          if r2_8[r15_8] == nil then
            r2_8[r15_8] = {}
          end
          table.insert(r2_8[r15_8], r16_8)
        end
      end
      -- close: r11_8
    end
    -- close: r4_8
  end
  for r8_8, r9_8 in pairs(r2_8) do
    if #r9_8 == 1 then
      r1_0(r0_8, r8_8, r9_8[1])
    else
      r1_0(r0_8, r8_8, function(...)
        -- line: [252, 256] id: 9
        for r4_9, r5_9 in ipairs(r9_8) do
          r5_9(...)
        end
        -- close: r0_9
      end)
    end
    -- close: r8_8
  end
  -- close: r4_8
end
local function r23_0(r0_10, r1_10)
  -- line: [263, 274] id: 10
  if r2_0(r1_10) == "string" then
    local r2_10 = r6_0(r1_10, 1, 1)
    if r2_10 == "U" or r2_10 == "A" or r2_10 == "F" or r2_10 == "E" or r2_10 == "T" then
      local r3_10 = r13_0[r1_10]
      if r3_10 ~= nil then
        r1_0(r0_10, r1_10, r3_10)
      end
    end
  end
  return r0_0(r0_10, r1_10)
end
if WITH_UE4_NAMESPACE then
  r4_0(_G, {
    __index = r23_0,
  })
  _G.UE4 = r13_0
  r11_0("WITH_UE4_NAMESPACE==true")
else
  r4_0(_G, {
    __index = r23_0,
  })
  _G.UE4 = _G
  _G.UE = _G
  r11_0("WITH_UE4_NAMESPACE==false")
end
math.clamp = function(r0_12, r1_12, r2_12)
  -- line: [305, 313] id: 12
  if r0_12 < r1_12 then
    return r1_12
  end
  if r2_12 < r0_12 then
    return r2_12
  end
  return r0_12
end
math.lerp = function(r0_13, r1_13, r2_13)
  -- line: [315, 317] id: 13
  return r0_13 + (r1_13 - r0_13) * r2_13
end
math.sign = function(r0_14)
  -- line: [319, 323] id: 14
  if r0_14 > 0 then
    return 1
  end
  if r0_14 < 0 then
    return -1
  end
  return 0
end
table.slice = function(r0_15, r1_15, r2_15)
  -- line: [325, 327] id: 15
  return {
    table.unpack(r0_15, r1_15, r2_15)
  }
end
table.reverse = function(r0_16)
  -- line: [329, 335] id: 16
  local r1_16 = #r0_16
  for r5_16 = 1, math.floor(r1_16 / 2), 1 do
    r0_16[r1_16 - r5_16 + 1] = r0_16[r5_16]
    r0_16[r5_16] = r0_16[r1_16 - r5_16 + 1]
  end
  return r0_16
end
table.join = function(...)
  -- line: [337, 346] id: 17
  local r0_17 = {
    ...
  }
  local r1_17 = {}
  for r6_17, r7_17 in ipairs(r0_17) do
    for r12_17, r13_17 in ipairs(r7_17) do
      table.insert(r1_17, r13_17)
    end
    -- close: r8_17
  end
  -- close: r2_17
  return r1_17
end
table.isempty = function(r0_18)
  -- line: [348, 350] id: 18
  local r1_18 = nil	-- notice: implicit variable refs by block#[4]
  if r0_18 ~= nil then
    r1_18 = next(r0_18) == nil
  else
    goto label_8	-- block#3 is visited secondly
  end
  return r1_18
end
table.findValue = function(r0_19, r1_19, r2_19)
  -- line: [352, 363] id: 19
  if not r2_19 then
    function r2_19(r0_20, r1_20)
      -- line: [354, 356] id: 20
      return r0_20 == r1_20
    end
  end
  for r7_19, r8_19 in pairs(r0_19) do
    if r2_19(r8_19, r1_19) then
      return r8_19, r7_19
    end
  end
  -- close: r3_19
end
string.split = function(r0_21, r1_21)
  -- line: [366, 372] id: 21
  local r2_21 = {}
  string.gsub(r0_21, "[^" .. r1_21 .. "]+", function(r0_22)
    -- line: [368, 370] id: 22
    table.insert(r2_21, r0_22)
  end)
  return r2_21
end
string.trim = function(r0_23)
  -- line: [374, 376] id: 23
  return string.gsub(r0_23, "^[%s\n\r\t]*(.-)[%s\n\r\t]*$", "%1")
end
string.startswith = function(r0_24, r1_24)
  -- line: [378, 380] id: 24
  return string.sub(r0_24, 1, string.len(r1_24)) == r1_24
end
string.endswith = function(r0_25, r1_25)
  -- line: [382, 385] id: 25
  local r2_25 = string.len(r0_25)
  return string.sub(r0_25, r2_25 - string.len(r1_25) + 1, r2_25) == r1_25
end
string.insert = function(r0_26, r1_26, r2_26)
  -- line: [387, 389] id: 26
  return string.sub(r0_26, 1, r1_26) .. r2_26 .. string.sub(r0_26, r1_26 + 1)
end
string.isempty = function(r0_27)
  -- line: [391, 393] id: 27
  local r1_27 = nil	-- notice: implicit variable refs by block#[4]
  if r0_27 ~= nil then
    r1_27 = r0_27 == ""
  else
    goto label_5	-- block#3 is visited secondly
  end
  return r1_27
end
local function r25_0(r0_28, ...)
  -- line: [403, 428] id: 28
  if not r0_28.catch then
    function r0_28.catch(r0_29)
      -- line: [405, 418] id: 29
      LogError(Traceback(ErrorTag, r0_29, false))
      local r1_29 = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld and GWorld.GameInstance, UEMSentrySubsystem)
      if r1_29 then
        local r2_29 = "nil"
        if WorldTravelSubsystem and WorldTravelSubsystem() then
          r2_29 = tostring(WorldTravelSubsystem():GetCurrentSceneId())
        end
        r1_29:ReportLuaTrace(debug.traceback(tostring(r0_29), 2), {
          SceneId = r2_29,
          SceneName = "unlua.try",
          Location = "unlua.try",
        })
      end
    end
  end
  local r1_28 = table.pack(xpcall(r0_28.exec, r0_28.catch, ...))
  local r2_28 = r1_28[1]
  if r0_28.final then
    r0_28.final(r2_28, ...)
  end
  if r2_28 then
    return table.unpack(r1_28, 2)
  end
end
_G.try = r25_0
_G.CreateCoroutine = function(r0_30, ...)
  -- line: [435, 439] id: 30
  return coroutine.create(function(...)
    -- line: [436, 438] id: 31
    r25_0({
      exec = r0_30,
    }, ...)
  end)
end
_G.RunAsyncTask = function(r0_32, r1_32, r2_32)
  -- line: [446, 455] id: 32
  if r0_32[r1_32] then
    return 
  end
  r0_32[r1_32] = coroutine.create(function()
    -- line: [448, 453] id: 33
    local r0_33 = r0_32[r1_32]
    r25_0({
      exec = r2_32,
    }, r0_33, r0_32)
    r0_32[r1_32] = nil
    coroutine.close(r0_33)
  end)
  coroutine.resume(r0_32[r1_32])
end
_G.ForceStopAsyncTask = function(r0_34, r1_34)
  -- line: [458, 466] id: 34
  if not r0_34[r1_34] then
    return 
  end
  local r2_34 = r0_34[r1_34]
  r0_34[r1_34] = nil
  local r3_34 = coroutine.status(r2_34)
  if r3_34 == "running" or r3_34 == "suspended" then
    coroutine.close(r2_34)
  end
end
_G.print = function(r0_11, ...)
  -- line: [296, 302] id: 11
  if _G.LogTag == "nil" then
    r11_0(r0_11, ...)
  elseif r0_11 == _G.LogTag then
    r11_0(r0_11, ...)
  end
end
_G.Get_G = r19_0
_G.netprint = r12_0
_G.ServerPrint = LogEMServer
_G.Index = r15_0
_G.NewIndex = r16_0
_G.Class = r20_0
_G.CopyTable = r17_0
_G.DrawDebugTest = false
_G.AutoCameraReset = true
_G.ShouldUseCreaturePool = true
_G.LogTag = "nil"
_G.ErrorTag = "::Error::"
_G.WarningTag = "::Warning::"
_G.DebugTag = "::Debug::"
_G.AssembleComponents = r22_0
_G.TypeClassModule = r5_0("NetworkEngine.Class")
_G.TypeClass = _G.TypeClassModule.Class
_G.DataMgr = r5_0("DataMgr")
_G.CommonConst = r5_0("CommonConst")
_G.Const = r5_0("Const")
_G.UIConst = r5_0("BluePrints.UI.UIConst")
_G.GWorld = r5_0("GWorld")
_G.BattleEventName = r5_0("BluePrints/Combat/BattleEvents/BattleEventName")
_G.EventManager, _G.EventID = table.unpack(r5_0("BluePrints.Managers.EventManager"))
_G.DialogEvent = r5_0("BluePrints.UI.UI_PC.Common.Common_Dialog.DialogEvent")
_G.ErrorCode = r5_0("BluePrints.Client.ErrorCode")
_G.ConditionUtils = r5_0("BluePrints.Common.ConditionUtils")
_G.AvatarUtils = r5_0("BluePrints.Client.AvatarUtils")
_G.ItemUtils = r5_0("Utils.ItemUtils")
_G.CommonUtils = r5_0("Utils.CommonUtils")
_G.RpcUtils = r5_0("Utils.RpcUtils")
_G.RewardUtils = r5_0("Utils.RewardUtils")
_G.UIUtils = r5_0("Utils.UIUtils")
_G.UseDungeonLevelBounds = false
_G.UseMinimumLoad = true
_G.LuaMemoryManager = r5_0("LuaMemoryManager")
_G.SystemGuideManager = r5_0("BluePrints.Managers.SystemGuideManager")
_G.MissionIndicatorManager = r5_0("BluePrints.Managers.MissionIndicatorManager")
_G.ReddotManager = r5_0("BluePrints.UI.Reddot.ReddotManager")
_G.I18nUtils = r5_0("Utils.I18nUtils")
_G.PageJumpUtils = r5_0("Utils.PageJumpUtils")
_G.ShopUtils = r5_0("Utils.ShopUtils")
_G.RougeUtils = r5_0("Utils.RougeUtils")
_G.SerializeUtils = r5_0("Utils.SerializeUtils")
_G.TestClass = TestClass and function()
  -- line: [517, 526] id: 35
  local r0_35 = {}
  r0_35.__index = r0_35
  function r0_35.New()
    -- line: [520, 524] id: 36
    local r0_36 = {}
    r4_0(r0_36, r0_35)
    return r0_36
  end
  return r0_35
end
_G.Serpent = r5_0("Utils.Serpent")
_G.EMGlobalLuaTable = r5_0("EMGlobalLuaTable")
_G.ServerConfig = r5_0("ServerConfig")
_G.Json = r5_0("rapidjson")
_G.bson = r5_0("bson")
_G.Utils = r5_0("Utils")
_G.TimeUtils = r5_0("Utils.TimeUtils")
_G.StubInfos = r5_0("StubInfos")
_G.EMCache = r5_0("EMCache.EMCache")
for r34_0, r35_0 in pairs(r5_0("Utils")) do
  r1_0(_G, r34_0, r35_0)
end
-- close: r30_0
local r30_0 = r13_0.FEffectStruct
local r31_0 = r13_0.FSkillEffectInfo
local r32_0 = r13_0.FMonsterSpawnPointParam
local r33_0 = r13_0.FPointCheckInfo
local r34_0 = r13_0.FNameArray
local r35_0 = r13_0.FMonsterEidArray
local r36_0 = r13_0.FClientTimerStruct
local r37_0 = r13_0.FClientTimerInfo
local r38_0 = r13_0.FSkillLevelStruct
local r39_0 = r13_0.FMessage
r5_0("SetupClient"):Setup()
r5_0("LogPrint")
