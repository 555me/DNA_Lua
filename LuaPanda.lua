-- filename: @C:/Pack/Branch/geili11\Content/Script/LuaPanda.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = true
local r1_0 = 1
local r2_0 = 0.005
local r3_0 = 0.5
local r4_0 = true
local r5_0 = false
local function r6_0()
  -- line: [52, 60] id: 1
  local r0_1 = {}
  string.gsub(debug.getinfo(1, "S").source, "[^/]+", function(r0_2)
    -- line: [54, 56] id: 2
    table.insert(r0_1, r0_2)
  end)
  package.cpath = package.cpath .. ";" .. table.concat(r0_1, "/", 1, #r0_1 + -2) .. "/Tools/luasocket/core.dll"
  return require("socket.core").tcp()
end
local r7_0 = 2
local r8_0 = "3.2.0"
LuaPanda = {}
local r9_0 = LuaPanda
local r10_0 = {}
r9_0.tools = r10_0
r9_0.curStackId = 0
local r11_0 = nil
local r12_0 = {
  DISCONNECT_HOOK = 0,
  LITE_HOOK = 1,
  MID_HOOK = 2,
  ALL_HOOK = 3,
}
local r13_0 = {
  DISCONNECT = 0,
  WAIT_CMD = 1,
  STOP_ON_ENTRY = 2,
  RUN = 3,
  STEPOVER = 4,
  STEPIN = 5,
  STEPOUT = 6,
  STEPOVER_STOP = 7,
  STEPIN_STOP = 8,
  STEPOUT_STOP = 9,
  HIT_BREAKPOINT = 10,
}
local r14_0 = "|*|"
local r15_0 = 86400
local r16_0 = nil
local r17_0 = nil
local r18_0 = {}
r9_0.breaks = r18_0
local r19_0 = ""
local r20_0 = ""
local r21_0 = ""
local r22_0 = ""
local r23_0 = ""
local r24_0 = {}
local r25_0 = {}
local r26_0 = false
local r27_0 = ""
local r28_0 = nil
local r29_0 = nil
local r30_0 = nil
local r31_0 = nil
local r32_0 = nil
local r33_0 = nil
local r34_0 = nil
local r35_0 = nil
local r36_0 = nil
local r37_0 = false
local r38_0 = 1
local r39_0 = 1
local r40_0 = {}
local r41_0 = ""
local r42_0 = true
local r43_0 = {}
local r44_0 = setmetatable({}, {
  __mode = "v",
})
local r45_0 = false
local r46_0 = false
local r47_0 = "launch.json文件的配置项useCHook被设置为false."
local r48_0 = ""
local r49_0 = ""
local r50_0 = ""
local r51_0 = false
local r52_0 = nil
local r53_0 = nil
local r54_0 = false
local r55_0 = nil
local r56_0 = nil
local r57_0 = false
local r58_0 = 0
local r59_0 = 0
local r60_0 = 3
local r61_0 = 0
local r62_0 = nil
local r63_0 = nil
local r64_0 = nil
local r65_0 = 0
local r66_0 = nil
local r67_0 = 0
local r68_0 = false
local r69_0 = nil
local r70_0 = {}
function r9_0.formatPathCache()
  -- line: [158, 158] id: 3
  return r70_0
end
local r71_0 = {}
function r9_0.fakeBreakPointCache()
  -- line: [160, 160] id: 4
  return r71_0
end
if _VERSION == "Lua 5.1" then
  r62_0 = loadstring
else
  r62_0 = load
end
local r72_0 = setmetatable({}, {
  __index = function(r0_5, r1_5)
    -- line: [170, 173] id: 5
    return r9_0.getWatchedVariable(r1_5, _G.LuaPanda.curStackId, false)
  end,
  __newindex = function(r0_6, r1_6, r2_6)
    -- line: [175, 177] id: 6
    r9_0.setVariableValue(r1_6, _G.LuaPanda.curStackId, r2_6)
  end,
})
function r9_0.bindServer(r0_7, r1_7)
  -- line: [186, 192] id: 7
  r31_0 = r30_0
  r31_0:settimeout(r3_0)
  assert(r31_0:bind(r0_7, r1_7))
  r31_0:setoption("reuseaddr", true)
  assert(r31_0:listen(0))
end
function r9_0.startServer(r0_8, r1_8)
  -- line: [197, 227] id: 8
  r0_8 = tostring(r0_8 and "0.0.0.0")
  r1_8 = tonumber(r1_8) and 8818
  r56_0 = true
  r9_0.printToConsole("Debugger start as SERVER. bind host:" .. r0_8 .. " port:" .. tostring(r1_8), 1)
  if r30_0 ~= nil then
    r9_0.printToConsole("[Warning] 调试器已经启动，请不要再次调用start()", 1)
    return 
  end
  r9_0.changeRunState(r13_0.DISCONNECT)
  if not r9_0.reGetSock() then
    r9_0.printToConsole("[Error] LuaPanda debugger start success , but get Socket fail , please install luasocket!", 2)
    return 
  end
  r28_0 = r0_8
  r29_0 = r1_8
  r9_0.bindServer(r28_0, r29_0)
  local r2_8 = r31_0:accept()
  r30_0 = r2_8
  if r2_8 then
    r9_0.printToConsole("First connect success!")
    r9_0.connectSuccess()
  else
    r9_0.printToConsole("First connect failed!")
    r9_0.changeHookState(r12_0.DISCONNECT_HOOK)
  end
end
function r9_0.start(r0_9, r1_9)
  -- line: [232, 261] id: 9
  r0_0 = true
  r0_9 = tostring(r0_9 and "127.0.0.1")
  r1_9 = tonumber(r1_9) and 8818
  r9_0.printToConsole("Debugger start as CLIENT. connect host:" .. r0_9 .. " port:" .. tostring(r1_9), 1)
  if r30_0 ~= nil then
    r9_0.printToConsole("[Warning] 调试器已经启动，请不要再次调用start()", 1)
    return 
  end
  r9_0.changeRunState(r13_0.DISCONNECT)
  if not r9_0.reGetSock() then
    r9_0.printToConsole("[Error] Start debugger but get Socket fail , please install luasocket!", 2)
    return 
  end
  r28_0 = r0_9
  r29_0 = r1_9
  r30_0:settimeout(r2_0)
  if r9_0.sockConnect(r30_0) then
    r9_0.printToConsole("First connect success!")
    r9_0.connectSuccess()
  else
    r9_0.printToConsole("First connect failed!")
    r9_0.changeHookState(r12_0.DISCONNECT_HOOK)
  end
end
function r9_0.sockConnect(r0_10)
  -- line: [263, 273] id: 10
  if r0_10 then
    local r1_10, r2_10 = r0_10:connect(r28_0, r29_0)
    if r2_10 == "connection refused" or not r1_10 and r2_10 == "already connected" then
      r9_0.reGetSock()
    end
    return r1_10
  end
  return nil
end
function r9_0.connectSuccess()
  -- line: [276, 320] id: 11
  if r31_0 then
    r31_0:close()
  end
  r9_0.changeRunState(r13_0.WAIT_CMD)
  r9_0.printToConsole("connectSuccess", 1)
  local r0_11 = r9_0.debugger_wait_msg()
  if r22_0 == "" then
    for r6_11, r7_11 in pairs(debug.getinfo(1, "S")) do
      if r6_11 == "source" then
        r22_0 = tostring(r7_11)
        r55_0 = r22_0:gsub(".*[Ll][Uu][Aa][Pp][Aa][Nn][Dd][Aa]", "")
        if r34_0 ~= nil then
          r34_0.sync_debugger_path(r22_0)
        end
      end
    end
    -- close: r2_11
  end
  if r23_0 == "" then
    r23_0 = r10_0.getFileSource()
    if r34_0 ~= nil then
      r34_0.sync_tools_path(r23_0)
    end
  end
  if r0_11 == false then
    r9_0.printToVSCode("[debugger error]初始化未完成, 建立连接但接收初始化消息失败。请更换端口重试", 2)
    return 
  end
  r9_0.printToVSCode("debugger init success", 1)
  r9_0.changeHookState(r12_0.ALL_HOOK)
  if r34_0 == nil then
    r9_0.changeCoroutinesHookState()
  end
end
function r9_0.clearData()
  -- line: [323, 335] id: 12
  r32_0 = nil
  r33_0 = nil
  r18_0 = {}
  r70_0 = {}
  r71_0 = {}
  r9_0.breaks = r18_0
  if r34_0 ~= nil then
    r34_0.sync_breakpoints()
    r34_0.clear_pathcache()
  end
end
function r9_0.stopAttach()
  -- line: [338, 349] id: 13
  r0_0 = false
  r9_0.printToConsole("Debugger stopAttach", 1)
  r9_0.clearData()
  r9_0.changeHookState(r12_0.DISCONNECT_HOOK)
  r65_0 = os.time()
  r9_0.changeRunState(r13_0.DISCONNECT)
  if r30_0 ~= nil then
    r30_0:close()
    if r56_0 and r31_0 then
      r31_0 = nil
    end
  end
end
function r9_0.disconnect()
  -- line: [352, 372] id: 14
  r9_0.printToConsole("Debugger disconnect", 1)
  r9_0.clearData()
  r9_0.changeHookState(r12_0.DISCONNECT_HOOK)
  r65_0 = os.time()
  r9_0.changeRunState(r13_0.DISCONNECT)
  if r30_0 ~= nil then
    r30_0:close()
    r30_0 = nil
    r31_0 = nil
  end
  if r28_0 == nil or r29_0 == nil then
    r9_0.printToConsole("[Warning] User call LuaPanda.disconnect() before set debug ip & port, please call LuaPanda.start() first!", 2)
    return 
  end
  r9_0.reGetSock()
end
function r9_0.replaceCoroutineFuncs()
  -- line: [374, 388] id: 15
  if r34_0 == nil and r64_0 == nil and type(coroutine.create) == "function" then
    r9_0.printToConsole("change coroutine.create")
    r64_0 = coroutine.create
    coroutine.create = function(...)
      -- line: [379, 385] id: 16
      local r0_16 = r64_0(...)
      table.insert(r44_0, r0_16)
      r9_0.changeCoroutineHookState(r0_16, r17_0)
      return r0_16
    end
  end
end
function r9_0.getBreaks()
  -- line: [394, 396] id: 17
  return r18_0
end
function r9_0.testBreakpoint()
  -- line: [399, 413] id: 18
  if r63_0 and r63_0 ~= "" then
    return r9_0.breakpointTestInfo()
  else
    local r0_18 = {
      [#r0_18 + 1] = "正在准备进行断点测试，请按照如下步骤操作\n",
    }
    r0_18[#r0_18 + 1] = "1. 请[删除]当前项目中所有断点;\n"
    r0_18[#r0_18 + 1] = "2. 在当前停止行打一个断点;\n"
    r0_18[#r0_18 + 1] = "3. 再次运行 \'LuaPanda.testBreakpoint()\'"
    r57_0 = true
    return table.concat(r0_18)
  end
end
function r9_0.breakpointTestInfo()
  -- line: [417, 475] id: 19
  local r0_19 = r9_0.getSpecificFunctionStackLevel(r24_0.func)
  if type(r0_19) ~= "number" then
    r0_19 = 2
  end
  local r1_19 = r24_0.source
  if r1_19 == nil and r34_0 ~= nil then
    r1_19 = r9_0.getPath(tostring(r34_0.get_last_source()))
  end
  local r2_19 = debug.getinfo(r0_19, "S")
  local r3_19 = r9_0.truncatedPath(r9_0.formatOpath(r2_19.source), r36_0)
  local r4_19 = {}
  local r5_19 = tostring(r1_19)
  r4_19[#r4_19 + 1] = "\n- BreakPoint Test:"
  r4_19[#r4_19 + 1] = "\nUser set lua extension:   ." .. tostring(r20_0)
  r4_19[#r4_19 + 1] = "\nAuto get lua extension:   " .. tostring(r55_0)
  if r36_0 and r36_0 ~= "" then
    r4_19[#r4_19 + 1] = "\nUser set truncatedOPath:  " .. r36_0
  end
  r4_19[#r4_19 + 1] = "\nGetInfo:    " .. r2_19.source
  r4_19[#r4_19 + 1] = "\nNormalized: " .. r3_19
  r4_19[#r4_19 + 1] = "\nFormated:   " .. r5_19
  if r63_0 and r63_0 ~= "" then
    r4_19[#r4_19 + 1] = "\nBreakpoint: " .. r63_0
  end
  if not r54_0 then
    if r51_0 then
      r4_19[#r4_19 + 1] = "\n说明:从lua虚拟机获取到的是绝对路径，Formated使用GetInfo路径。" .. r50_0
    else
      r4_19[#r4_19 + 1] = "\n说明:从lua虚拟机获取到的路径(GetInfo)是相对路径，调试器运行依赖的绝对路径(Formated)是来源于cwd+GetInfo拼接。如Formated路径错误请尝试调整cwd或改变VSCode打开文件夹的位置。也可以在Formated对应的文件下打一个断点，调整直到Formated和Breaks Info中断点路径完全一致。" .. r50_0
    end
  else
    r4_19[#r4_19 + 1] = "\n说明:自动路径(autoPathMode)模式已开启。"
    if r63_0 and r63_0 ~= "" then
      if string.find(r63_0, r5_19, string.len(r5_19) * -1, true) then
        if r37_0 == false then
          r4_19[#r4_19 + 1] = "本文件中断点可正常命中。"
          r4_19[#r4_19 + 1] = "同名文件中的断点识别(distinguishSameNameFile) 未开启，请确保 VSCode 断点不要存在于同名 lua 文件中。"
        else
          r4_19[#r4_19 + 1] = "同名文件中的断点识别(distinguishSameNameFile) 已开启。"
          if string.find(r63_0, r3_19, 1, true) then
            r4_19[#r4_19 + 1] = "本文件中断点可被正常命中"
          else
            r4_19[#r4_19 + 1] = "断点可能无法被命中，因为 lua 虚拟机中获得的路径 Normalized 不是断点路径 Breakpoint 的子串。 如有需要，可以在 launch.json 中设置 truncatedOPath 来去除 Normalized 部分路径。"
          end
        end
      else
        r4_19[#r4_19 + 1] = "断点未被命中，原因是 Formated 不是 Breakpoint 路径的子串，或者 Formated 和 Breakpoint 文件后缀不一致"
      end
    else
      r4_19[#r4_19 + 1] = "如果要进行断点测试，请使用 LuaPanda.testBreakpoint()。"
    end
  end
  return table.concat(r4_19)
end
function r9_0.getBaseInfo()
  -- line: [478, 511] id: 20
  local r0_20 = {}
  local r1_20 = ""
  if jit and jit.version then
    r1_20 = "," .. tostring(jit.version)
  end
  local r5_20 = r1_20
  r0_20[#r0_20 + 1] = "Lua Ver:" .. _VERSION .. r5_20 .. " | Adapter Ver:" .. tostring(r35_0) .. " | Debugger Ver:" .. tostring(r8_0)
  local r2_20 = ""
  if r34_0 ~= nil then
    local r3_20, r4_20 = r34_0.sync_getLibVersion()
    if r4_20 ~= nil then
      r5_20 = tostring(r3_20) .. " for " .. tostring(math.ceil(r4_20)) and tostring(r3_20)
    else
      goto label_54	-- block#6 is visited secondly
    end
    r0_20[#r0_20 + 1] = " | hookLib Ver:" .. r5_20
    r2_20 = r2_20 .. "说明: 已加载 libpdebug 库."
  else
    r2_20 = r2_20 .. "说明: 未能加载 libpdebug 库。原因请使用 LuaPanda.doctor() 查看"
  end
  local r3_20 = false
  if type(r61_0) == "number" and r61_0 == 1 then
    r3_20 = true
  end
  r0_20[#r0_20 + 1] = " | supportREPL:" .. tostring(r3_20)
  r0_20[#r0_20 + 1] = " | useBase64EncodeString:" .. tostring(r46_0)
  r0_20[#r0_20 + 1] = " | codeEnv:" .. tostring(r32_0)
  r0_20[#r0_20 + 1] = " | distinguishSameNameFile:" .. tostring(r37_0) .. "\n"
  r0_20[#r0_20 + 1] = r2_20
  if r48_0 ~= nil and r48_0 ~= "" then
    r0_20[#r0_20 + 1] = "\n" .. r48_0
  end
  return table.concat(r0_20)
end
function r9_0.doctor()
  -- line: [514, 623] id: 21
  local r0_21 = {}
  if r8_0 ~= r35_0 then
    r0_21[#r0_21 + 1] = "\n- 建议更新版本\nLuaPanda VSCode插件版本是" .. r35_0 .. ", LuaPanda.lua文件版本是" .. r8_0 .. "。建议检查并更新到最新版本。"
    r0_21[#r0_21 + 1] = "\n更新方式   : https://github.com/Tencent/LuaPanda/blob/master/Docs/Manual/update.md"
    r0_21[#r0_21 + 1] = "\nRelease版本: https://github.com/Tencent/LuaPanda/releases"
  end
  if r34_0 == nil then
    r0_21[#r0_21 + 1] = "\n\n- libpdebug 库没有加载\n"
    if r53_0 then
      if r68_0 == true then
        r0_21[#r0_21 + 1] = "用户使用 LuaPanda.lua 中 clibPath 变量指定了 plibdebug 的位置: " .. r33_0
        if r9_0.tryRequireClib("libpdebug", r33_0) then
          r0_21[#r0_21 + 1] = "\n引用成功"
        else
          r0_21[#r0_21 + 1] = "\n引用错误:" .. r47_0
        end
      else
        local r1_21 = nil
        local r2_21 = nil
        if r32_0 == "Darwin" then
          r1_21 = "/?.so;"
          r2_21 = "mac"
        elseif r32_0 == "Linux" then
          r1_21 = "/?.so;"
          r2_21 = "linux"
        else
          r1_21 = "/?.dll;"
          r2_21 = "win"
        end
        local r3_21 = nil
        if _VERSION == "Lua 5.1" then
          r3_21 = "501"
        else
          r3_21 = "503"
        end
        local r4_21 = r33_0 .. r2_21 .. "/x86/" .. r3_21 .. r1_21
        local r5_21 = r33_0 .. r2_21 .. "/x86_64/" .. r3_21 .. r1_21
        r0_21[#r0_21 + 1] = "尝试引用x64库: " .. r5_21
        if r9_0.tryRequireClib("libpdebug", r5_21) then
          r0_21[#r0_21 + 1] = "\n引用成功"
        else
          r0_21[#r0_21 + 1] = "\n引用错误:" .. r47_0
          r0_21[#r0_21 + 1] = "\n尝试引用x86库: " .. r4_21
          if r9_0.tryRequireClib("libpdebug", r4_21) then
            r0_21[#r0_21 + 1] = "\n引用成功"
          else
            r0_21[#r0_21 + 1] = "\n引用错误:" .. r47_0
          end
        end
      end
    else
      r0_21[#r0_21 + 1] = "原因是" .. r47_0
    end
  end
  local r1_21 = r41_0
  if r34_0 ~= nil then
    r1_21 = r9_0.getPath(tostring(r34_0.get_last_source()))
  end
  if not r54_0 and r1_21 and r1_21 ~= "" and not r9_0.fileExists(r1_21) then
    r0_21[#r0_21 + 1] = "\n\n- 路径存在问题\n"
    local r3_21 = r9_0.stringSplit(r1_21, "/")
    local r4_21 = false
    for r9_21, r10_21 in pairs(r9_0.getBreaks()) do
      if string.find(r9_21, r3_21[#r3_21], 1, true) then
        r4_21 = true
        r0_21[#r0_21 + 1] = r9_0.breakpointTestInfo()
        r0_21[#r0_21 + 1] = "\nfilepath: " .. r9_21
        if r51_0 then
          r0_21[#r0_21 + 1] = "\n说明:从lua虚拟机获取到的是绝对路径，format使用getinfo路径。"
        else
          r0_21[#r0_21 + 1] = "\n说明:从lua虚拟机获取到的是相对路径，调试器运行依赖的绝对路径(format)是来源于cwd+getinfo拼接。"
        end
        r0_21[#r0_21 + 1] = "\nfilepath是VSCode通过获取到的文件正确路径 , 对比format和filepath，调整launch.json中CWD，或改变VSCode打开文件夹的位置。使format和filepath一致即可。\n如果format和filepath路径仅大小写不一致，设置launch.json中 pathCaseSensitivity:false 可忽略路径大小写"
      end
    end
    -- close: r5_21
    if r4_21 == false then
      r0_21[#r0_21 + 1] = "\n找不到文件:" .. r1_21 .. ", 请检查路径是否正确。\n或者在VSCode文件" .. r3_21[#r3_21] .. "中打一个断点后，再执行一次doctor命令，查看路径分析结果。"
    end
  end
  if r38_0 < 1 or r7_0 < 1 then
    r0_21[#r0_21 + 1] = "\n\n- 日志等级\n"
    if r38_0 < 1 then
      r0_21[#r0_21 + 1] = "当前日志等级是" .. r38_0 .. ", 会产生大量日志，降低调试速度。建议调整launch.json中logLevel:1"
    end
    if r7_0 < 1 then
      r0_21[#r0_21 + 1] = "当前console日志等级是" .. r7_0 .. ", 过低的日志等级会降低调试速度，建议调整LuaPanda.lua文件头部consoleLogLevel=2"
    end
  end
  if #r0_21 == 0 then
    r0_21[#r0_21 + 1] = "未检测出问题"
  end
  return table.concat(r0_21)
end
function r9_0.fileExists(r0_22)
  -- line: [625, 628] id: 22
  local r1_22 = io.open(r0_22, "r")
  if r1_22 ~= nil then
    io.close(r1_22)
    return true
  else
    return false
  end
end
function r9_0.getInfo()
  -- line: [631, 668] id: 23
  local r0_23 = {
    [#r0_23 + 1] = "\n- Base Info: \n",
  }
  r0_23[#r0_23 + 1] = r9_0.getBaseInfo()
  r0_23[#r0_23 + 1] = "\n\n- User Setting: \n"
  r0_23[#r0_23 + 1] = "stopOnEntry:" .. tostring(r52_0) .. " | "
  r0_23[#r0_23 + 1] = "logLevel:" .. r38_0 .. " | "
  r0_23[#r0_23 + 1] = "consoleLogLevel:" .. r7_0 .. " | "
  r0_23[#r0_23 + 1] = "pathCaseSensitivity:" .. tostring(r42_0) .. " | "
  r0_23[#r0_23 + 1] = "attachMode:" .. tostring(r0_0) .. " | "
  r0_23[#r0_23 + 1] = "autoPathMode:" .. tostring(r54_0) .. " | "
  if r53_0 then
    r0_23[#r0_23 + 1] = "useCHook:true"
  else
    r0_23[#r0_23 + 1] = "useCHook:false"
  end
  if r38_0 == 0 or r7_0 == 0 then
    r0_23[#r0_23 + 1] = "\n说明:日志等级过低，会影响执行效率。请调整logLevel和consoleLogLevel值 >= 1"
  end
  r0_23[#r0_23 + 1] = "\n\n- Path Info: \n"
  r0_23[#r0_23 + 1] = "clibPath: " .. tostring(r33_0) .. "\n"
  r0_23[#r0_23 + 1] = "debugger: " .. r22_0 .. " | " .. r9_0.getPath(r22_0) .. "\n"
  r0_23[#r0_23 + 1] = "cwd     : " .. r21_0 .. "\n"
  r0_23[#r0_23 + 1] = r9_0.breakpointTestInfo()
  if r49_0 ~= nil and r49_0 ~= "" then
    r0_23[#r0_23 + 1] = "\n" .. r49_0
  end
  r0_23[#r0_23 + 1] = "\n\n- Breaks Info: \nUse \'LuaPanda.getBreaks()\' to watch."
  return table.concat(r0_23)
end
function r9_0.isInMain()
  -- line: [671, 673] id: 24
  return r66_0
end
function r9_0.tryRequireClib(r0_25, r1_25)
  -- line: [678, 703] id: 25
  r9_0.printToVSCode("tryRequireClib search : [" .. r0_25 .. "] in " .. r1_25)
  local r2_25 = package.cpath
  package.cpath = package.cpath .. ";" .. r1_25
  r9_0.printToVSCode("package.cpath:" .. package.cpath)
  local r3_25, r4_25 = pcall(function()
    -- line: [683, 683] id: 26
    r34_0 = require(r0_25)
  end)
  if r3_25 then
    if type(r34_0) == "table" and r9_0.getTableMemberNum(r34_0) > 0 then
      r9_0.printToVSCode("tryRequireClib success : [" .. r0_25 .. "] in " .. r1_25)
      package.cpath = r2_25
      return true
    else
      r47_0 = "tryRequireClib fail : require success, but member function num <= 0; [" .. r0_25 .. "] in " .. r1_25
      r9_0.printToVSCode(r47_0)
      r34_0 = nil
      package.cpath = r2_25
      return false
    end
  else
    r47_0 = r4_25
    r9_0.printToVSCode("[Require clib error]: " .. r4_25, 0)
  end
  package.cpath = r2_25
  return false
end
function r9_0.revFindString(r0_27, r1_27, r2_27)
  -- line: [710, 715] id: 27
  local r3_27 = string.reverse(r0_27)
  local r4_27, r5_27 = string.find(r3_27, r1_27, 1, r2_27)
  if r5_27 == nil then
    return nil
  end
  return string.len(r3_27) - r5_27 + 1
end
function r9_0.revSubString(r0_28, r1_28, r2_28)
  -- line: [719, 723] id: 28
  local r3_28 = r9_0.revFindString(r0_28, r1_28, r2_28)
  if r3_28 == nil then
    return nil
  end
  return string.sub(r0_28, r3_28 + 1, r0_28.length)
end
function r9_0.stringSplit(r0_29, r1_29)
  -- line: [728, 734] id: 29
  local r2_29 = {}
  string.gsub(r0_29, "[^" .. r1_29 .. "]+", function(r0_30)
    -- line: [730, 732] id: 30
    table.insert(r2_29, r0_30)
  end)
  return r2_29
end
function r9_0.setCallbackId(r0_31)
  -- line: [737, 741] id: 31
  if r0_31 ~= nil and r0_31 ~= "0" then
    r19_0 = tostring(r0_31)
  end
end
function r9_0.getCallbackId()
  -- line: [744, 751] id: 32
  if r19_0 == nil then
    r19_0 = "0"
  end
  r19_0 = "0"
  return r19_0
end
function r9_0.trim(r0_33)
  -- line: [754, 756] id: 33
  return string.gsub(r0_33, "^%s*(.-)%s*$", "%1")
end
function r9_0.getTableMemberNum(r0_34)
  -- line: [761, 771] id: 34
  local r1_34 = 0
  if type(r0_34) ~= "table" then
    r9_0.printToVSCode("[debugger Error] getTableMemberNum get " .. tostring(type(r0_34)), 2)
    return r1_34
  end
  for r6_34, r7_34 in pairs(r0_34) do
    r1_34 = r1_34 + 1
  end
  -- close: r2_34
  return r1_34
end
function r9_0.getMsgTable(r0_35, r1_35)
  -- line: [774, 781] id: 35
  if not r1_35 then
    r1_35 = 0
  end
  return {
    cmd = r0_35,
    callbackId = r1_35,
    info = {},
  }
end
function r9_0.serializeTable(r0_36, r1_36)
  -- line: [783, 786] id: 36
  return r10_0.serializeTable(r0_36, r1_36)
end
function r9_0.printToVSCode(r0_37, r1_37, r2_37)
  -- line: [792, 811] id: 37
  if not r2_37 then
    r2_37 = 0
  end
  if not r1_37 then
    r1_37 = 0
  end
  if r16_0 == r13_0.DISCONNECT or r1_37 < r38_0 then
    return 
  end
  local r3_37 = {
    callbackId = "0",
  }
  if r2_37 == 0 then
    r3_37.cmd = "output"
  elseif r2_37 == 1 then
    r3_37.cmd = "tip"
  else
    r3_37.cmd = "debug_console"
  end
  r3_37.info = {}
  r3_37.info.logInfo = tostring(r0_37)
  r9_0.sendMsg(r3_37)
end
function r9_0.printToConsole(r0_38, r1_38)
  -- line: [816, 822] id: 38
  if not r1_38 then
    r1_38 = 0
  end
  if r1_38 < r7_0 then
    return 
  end
  print("[LuaPanda] " .. tostring(r0_38))
end
function r9_0.genUnifiedPath(r0_39)
  -- line: [829, 870] id: 39
  if r0_39 == "" or r0_39 == nil then
    return ""
  end
  if r42_0 == false then
    r0_39 = string.lower(r0_39)
  end
  r0_39 = string.gsub(r0_39, "\\", "/")
  local r1_39 = r9_0.stringSplit(r0_39, "/")
  local r2_39 = {}
  for r7_39, r8_39 in ipairs(r1_39) do
    if r8_39 ~= "." then
      if r8_39 == ".." and #r2_39 >= 1 and r2_39[#r2_39]:sub(2, 2) ~= ":" then
        table.remove(r2_39)
      else
        table.insert(r2_39, r8_39)
      end
    end
  end
  -- close: r3_39
  local r3_39 = table.concat(r2_39, "/")
  if r0_39:sub(1, 1) == "/" then
    r3_39 = "/" .. r3_39
  end
  if r32_0 == "Windows_NT" then
    if r45_0 then
      r3_39 = r3_39:gsub("^%a:", string.upper)
      r50_0 = "路径中Windows盘符已转为大写。"
    else
      r3_39 = r3_39:gsub("^%a:", string.lower)
      r50_0 = "路径中Windows盘符已转为小写。"
    end
  end
  return r3_39
end
function r9_0.getCacheFormatPath(r0_40)
  -- line: [872, 875] id: 40
  if r0_40 == nil then
    return r70_0
  end
  return r70_0[r0_40]
end
function r9_0.setCacheFormatPath(r0_41, r1_41)
  -- line: [877, 879] id: 41
  r70_0[r0_41] = r1_41
end
function r9_0.formatOpath(r0_42)
  -- line: [882, 918] id: 42
  if r0_42:sub(1, 1) == "@" then
    r0_42 = r0_42:sub(2)
  end
  if r0_42:sub(1, 2) == "./" then
    r0_42 = r0_42:sub(2)
  end
  r0_42 = r9_0.genUnifiedPath(r0_42)
  if r42_0 == false then
    r0_42 = string.lower(r0_42)
  end
  if r55_0 == nil or r55_0 == "" then
    if not r0_42:find(r20_0, (r20_0:len() * -1), true) then
      r0_42 = string.gsub(r0_42, "%.", "/")
    else
      r0_42 = r9_0.changePotToSep(r0_42, r20_0)
    end
  else
    r0_42 = r9_0.changePotToSep(r0_42, r55_0)
  end
  return r0_42
end
function r9_0.sendLuaMemory()
  -- line: [923, 931] id: 43
  local r0_43 = collectgarbage("count")
  local r1_43 = {
    callbackId = "0",
    cmd = "refreshLuaMemory",
    info = {},
  }
  r1_43.info.memInfo = tostring(r0_43)
  r9_0.sendMsg(r1_43)
end
function r9_0.reGetSock()
  -- line: [938, 965] id: 44
  if r31_0 then
    return true
  end
  if r30_0 ~= nil then
    pcall(function()
      -- line: [942, 942] id: 45
      r30_0:close()
    end)
  end
  r30_0 = lua_extension and lua_extension.luasocket and lua_extension.luasocket().tcp()
  if r30_0 == nil then
    if pcall(function()
      -- line: [949, 949] id: 46
      r30_0 = require("socket.core").tcp()
    end) then
      r9_0.printToConsole("reGetSock success")
    elseif r6_0 and pcall(function()
      -- line: [953, 953] id: 47
      r30_0 = r6_0()
    end) then
      r9_0.printToConsole("reGetSock custom success")
    else
      r9_0.printToConsole("[Error] reGetSock fail", 2)
      return false
    end
  else
    r9_0.printToConsole("reGetSock ue4 success")
  end
  return true
end
function r9_0.reConnect()
  -- line: [969, 1008] id: 48
  if r17_0 == r12_0.DISCONNECT_HOOK then
    if os.time() - r65_0 < r1_0 then
      return 0
    end
    r9_0.printToConsole("Reconnect !")
    if r30_0 == nil then
      r9_0.reGetSock()
    end
    local r0_48 = nil
    if r56_0 == true and r16_0 == r13_0.DISCONNECT then
      if r31_0 == nil then
        r9_0.bindServer(r28_0, r29_0)
      end
      r30_0 = r31_0:accept()
      r0_48 = r30_0
    else
      r30_0:settimeout(r2_0)
      r0_48 = r9_0.sockConnect(r30_0)
    end
    if r0_48 then
      r9_0.printToConsole("reconnect success")
      r9_0.connectSuccess()
      return 1
    else
      r9_0.printToConsole("reconnect failed")
      r65_0 = os.time()
      return 0
    end
  end
  return 1
end
function r9_0.sendMsg(r0_49)
  -- line: [1012, 1036] id: 49
  if r46_0 and r0_49.info ~= nil then
    for r5_49, r6_49 in ipairs(r0_49.info) do
      if r6_49.type == "string" then
        r6_49.value = r10_0.base64encode(r6_49.value)
      end
    end
    -- close: r1_49
  end
  local r1_49 = r11_0.encode(r0_49)
  if r16_0 == r13_0.DISCONNECT then
    r9_0.printToConsole("[debugger error] disconnect but want sendMsg:" .. r1_49, 2)
    r9_0.disconnect()
    return 
  end
  local r2_49 = nil
  local r3_49 = nil
  if pcall(function()
    -- line: [1029, 1029] id: 50
    r2_49, r3_49 = r30_0:send(r1_49 .. r14_0 .. "\n")
  end) and r2_49 == nil and r3_49 == "closed" then
    r9_0.disconnect()
  end
end
function r9_0.dataProcess(r0_51)
  -- line: [1040, 1457] id: 51
  r9_0.printToVSCode("debugger get:" .. r0_51)
  local r1_51 = r11_0.decode(r0_51)
  if r1_51 == nil then
    r9_0.printToVSCode("[error] Json is error", 2)
    return 
  end
  if r1_51.callbackId ~= "0" then
    r9_0.setCallbackId(r1_51.callbackId)
  end
  if r1_51.cmd == "continue" then
    local r2_51 = r1_51.info
    if r2_51.isFakeHit == "true" and r2_51.fakeBKPath and r2_51.fakeBKLine then
      r69_0 = false
      if r34_0 ~= nil and r34_0.set_bp_twice_check_res then
        r34_0.set_bp_twice_check_res(0)
      end
      if r71_0[r2_51.fakeBKPath] == nil then
        r71_0[r2_51.fakeBKPath] = {}
      end
      table.insert(r71_0[r2_51.fakeBKPath], r2_51.fakeBKLine)
    else
      r9_0.changeRunState(r13_0.RUN)
    end
    r9_0.sendMsg(r9_0.getMsgTable("continue", r9_0.getCallbackId()))
  elseif r1_51.cmd == "stopOnStep" then
    r9_0.changeRunState(r13_0.STEPOVER)
    r9_0.sendMsg(r9_0.getMsgTable("stopOnStep", r9_0.getCallbackId()))
    r9_0.changeHookState(r12_0.ALL_HOOK)
  elseif r1_51.cmd == "stopOnStepIn" then
    r9_0.changeRunState(r13_0.STEPIN)
    r9_0.sendMsg(r9_0.getMsgTable("stopOnStepIn", r9_0.getCallbackId()))
    r9_0.changeHookState(r12_0.ALL_HOOK)
  elseif r1_51.cmd == "stopOnStepOut" then
    r9_0.changeRunState(r13_0.STEPOUT)
    r9_0.sendMsg(r9_0.getMsgTable("stopOnStepOut", r9_0.getCallbackId()))
    r9_0.changeHookState(r12_0.ALL_HOOK)
  elseif r1_51.cmd == "setBreakPoint" then
    r9_0.printToVSCode("dataTable.cmd == setBreakPoint")
    r71_0 = {}
    local r2_51 = r9_0.genUnifiedPath(r1_51.info.path)
    if r57_0 then
      r63_0 = r2_51
    end
    if r54_0 then
      local r3_51 = r9_0.getFilenameFromPath(r2_51)
      if r18_0[r3_51] == nil then
        r18_0[r3_51] = {}
      end
      r18_0[r3_51][r2_51] = r1_51.info.bks
      for r8_51, r9_51 in pairs(r18_0[r3_51]) do
        if next(r9_51) == nil then
          r18_0[r3_51][r8_51] = nil
        end
      end
      -- close: r4_51
    else
      if r18_0[r2_51] == nil then
        r18_0[r2_51] = {}
      end
      r18_0[r2_51][r2_51] = r1_51.info.bks
      for r7_51, r8_51 in pairs(r18_0[r2_51]) do
        if next(r8_51) == nil then
          r18_0[r2_51][r7_51] = nil
        end
      end
      -- close: r3_51
    end
    for r7_51, r8_51 in pairs(r18_0) do
      if next(r8_51) == nil then
        r18_0[r7_51] = nil
      end
    end
    -- close: r3_51
    if r34_0 ~= nil then
      r34_0.sync_breakpoints()
    end
    if r16_0 ~= r13_0.WAIT_CMD then
      if r34_0 == nil then
        local r3_51, r4_51 = r9_0.checkHasBreakpoint(r41_0)
        if r3_51 == false then
          if r4_51 == true then
            r9_0.changeHookState(r12_0.MID_HOOK)
          else
            r9_0.changeHookState(r12_0.LITE_HOOK)
          end
        else
          r9_0.changeHookState(r12_0.ALL_HOOK)
        end
      end
    else
      r9_0.sendMsg(r9_0.getMsgTable("setBreakPoint", r9_0.getCallbackId()))
      return 
    end
    r9_0.sendMsg(r9_0.getMsgTable("setBreakPoint", r9_0.getCallbackId()))
    r9_0.printToVSCode("LuaPanda.getInfo()\n" .. r9_0.getInfo())
    r9_0.debugger_wait_msg()
  elseif r1_51.cmd == "setVariable" and (r16_0 == r13_0.STOP_ON_ENTRY or r16_0 == r13_0.HIT_BREAKPOINT or r16_0 == r13_0.STEPOVER_STOP or r16_0 == r13_0.STEPIN_STOP or r16_0 == r13_0.STEPOUT_STOP) then
    local r2_51 = r9_0.getMsgTable("setVariable", r9_0.getCallbackId())
    local r3_51 = tonumber(r1_51.info.varRef)
    local r4_51 = tostring(r1_51.info.newValue)
    local r5_51 = true
    local r6_51 = tostring(r1_51.info.varName)
    local r7_51 = string.sub(r4_51, 1, 1)
    if r7_51 == string.sub(r4_51, -1, -1) and (r7_51 == "\'" or r7_51 == "\"") then
      r4_51 = string.sub(r4_51, 2, -2)
      r5_51 = false
    end
    if r4_51 == "nil" and r5_51 == true then
      r4_51 = nil
      r5_51 = false
    elseif r4_51 == "true" and r5_51 == true then
      r4_51 = true
      r5_51 = false
    elseif r4_51 == "false" and r5_51 == true then
      r4_51 = false
      r5_51 = false
    elseif tonumber(r4_51) and r5_51 == true then
      r4_51 = tonumber(r4_51)
      r5_51 = false
    end
    if r1_51.info.stackId ~= nil and tonumber(r1_51.info.stackId) ~= nil and tonumber(r1_51.info.stackId) > 1 then
      r9_0.curStackId = tonumber(r1_51.info.stackId)
    else
      r9_0.printToVSCode("未能获取到堆栈层级，默认使用 this.curStackId;")
    end
    if r3_51 < 10000 then
      r2_51.info = r9_0.createSetValueRetTable(r6_51, r4_51, r5_51, r9_0.curStackId, r40_0[r3_51])
    else
      local r9_51 = nil
      if 10000 <= r3_51 and r3_51 < 20000 then
        r9_51 = "local"
      elseif 20000 <= r3_51 and r3_51 < 30000 then
        r9_51 = "global"
      elseif r3_51 >= 30000 then
        r9_51 = "upvalue"
      end
      r2_51.info = r9_0.createSetValueRetTable(r6_51, r4_51, r5_51, r9_0.curStackId, nil, r9_51)
    end
    r9_0.sendMsg(r2_51)
    r9_0.debugger_wait_msg()
  elseif r1_51.cmd == "getVariable" and (r16_0 == r13_0.STOP_ON_ENTRY or r16_0 == r13_0.HIT_BREAKPOINT or r16_0 == r13_0.STEPOVER_STOP or r16_0 == r13_0.STEPIN_STOP or r16_0 == r13_0.STEPOUT_STOP) then
    local r2_51 = r9_0.getMsgTable("getVariable", r9_0.getCallbackId())
    local r3_51 = tonumber(r1_51.info.varRef)
    if r3_51 < 10000 then
      r2_51.info = r9_0.getVariableRef(r1_51.info.varRef, true)
    elseif 10000 <= r3_51 and r3_51 < 20000 and r1_51.info.stackId ~= nil and tonumber(r1_51.info.stackId) > 1 then
      r9_0.curStackId = tonumber(r1_51.info.stackId)
      if type(r25_0[r9_0.curStackId + -1]) ~= "table" or type(r25_0[r9_0.curStackId + -1].func) ~= "function" then
        r9_0.printToVSCode("getVariable getLocal currentCallStack " .. r9_0.curStackId + -1 .. " Error\n" .. r9_0.serializeTable(r25_0, "currentCallStack"), 2)
        r2_51.info = {}
      else
        r2_51.info = r9_0.getVariable(r9_0.getSpecificFunctionStackLevel(r25_0[r9_0.curStackId + -1].func), true)
      end
    elseif 20000 <= r3_51 and r3_51 < 30000 then
      r2_51.info = r9_0.getGlobalVariable()
    elseif 30000 <= r3_51 and r1_51.info.stackId ~= nil and tonumber(r1_51.info.stackId) > 1 then
      r9_0.curStackId = tonumber(r1_51.info.stackId)
      if type(r25_0[r9_0.curStackId + -1]) ~= "table" or type(r25_0[r9_0.curStackId + -1].func) ~= "function" then
        r9_0.printToVSCode("getVariable getUpvalue currentCallStack " .. r9_0.curStackId + -1 .. " Error\n" .. r9_0.serializeTable(r25_0, "currentCallStack"), 2)
        r2_51.info = {}
      else
        r2_51.info = r9_0.getUpValueVariable(r25_0[r9_0.curStackId + -1].func, true)
      end
    end
    r9_0.sendMsg(r2_51)
    r9_0.debugger_wait_msg()
  elseif r1_51.cmd == "initSuccess" then
    local r2_51 = r1_51.info.isNeedB64EncodeStr == "true"
    r20_0 = r1_51.info.luaFileExtension
    r2_51 = r1_51.info.TempFilePath
    if r2_51:sub(-1, -1) == "\\" or r2_51:sub(-1, -1) == "/" then
      r2_51 = r2_51:sub(1, -2)
    end
    r27_0 = r2_51
    r21_0 = r9_0.genUnifiedPath(r1_51.info.cwd)
    r38_0 = tonumber(r1_51.info.logLevel) and 1
    local r3_51 = r1_51.info.autoPathMode == "true"
    if r1_51.info.pathCaseSensitivity == "true" then
      r42_0 = true
      r36_0 = r1_51.info.truncatedOPath and ""
    else
      r42_0 = false
      r36_0 = string.lower(r1_51.info.truncatedOPath and "")
    end
    r3_51 = r1_51.info.distinguishSameNameFile == "true"
    if r32_0 == nil then
      if type(r1_51.info.OSType) == "string" then
        r32_0 = r1_51.info.OSType
      else
        r32_0 = "Windows_NT"
        r48_0 = "未能检测出OSType, 可能是node os库未能加载，系统使用默认设置Windows_NT"
      end
    end
    r68_0 = false
    if r33_0 == nil then
      if type(r1_51.info.clibPath) == "string" then
        r33_0 = r1_51.info.clibPath
      else
        r33_0 = ""
        r49_0 = "未能正确获取libpdebug库所在位置, 可能无法加载libpdebug库。"
      end
    else
      r68_0 = true
    end
    if tostring(r1_51.info.useCHook) == "true" and _VERSION ~= "Lua 5.4" then
      r53_0 = true
      if r68_0 == true then
        if luapanda_chook ~= nil then
          r34_0 = luapanda_chook
        elseif not r9_0.tryRequireClib("libpdebug", r33_0) then
          r9_0.printToVSCode("Require clib failed, use Lua to continue debug, use LuaPanda.doctor() for more information.", 1)
        end
      else
        r3_51 = nil
        local r4_51 = nil
        if r32_0 == "Darwin" then
          r3_51 = "/?.so;"
          r4_51 = "mac"
        elseif r32_0 == "Linux" then
          r3_51 = "/?.so;"
          r4_51 = "linux"
        else
          r3_51 = "/?.dll;"
          r4_51 = "win"
        end
        local r5_51 = nil
        if _VERSION == "Lua 5.1" then
          r5_51 = "501"
        else
          r5_51 = "503"
        end
        local r6_51 = r33_0 .. r4_51 .. "/x86/" .. r5_51 .. r3_51
        local r7_51 = r33_0 .. r4_51 .. "/x86_64/" .. r5_51 .. r3_51
        if luapanda_chook ~= nil then
          r34_0 = luapanda_chook
        elseif not r9_0.tryRequireClib("libpdebug", r7_51) and not r9_0.tryRequireClib("libpdebug", r6_51) then
          r9_0.printToVSCode("Require clib failed, use Lua to continue debug, use LuaPanda.doctor() for more information.", 1)
        end
      end
    else
      r53_0 = false
    end
    r35_0 = tostring(r1_51.info.adapterVersion)
    r3_51 = r9_0.getMsgTable("initSuccess", r9_0.getCallbackId())
    local r4_51 = 0
    if r34_0 ~= nil then
      r4_51 = 1
      local r5_51 = r9_0.stringSplit(r8_0, "%.")
      local r6_51 = r5_51[1] * 10000 + r5_51[2] * 100 + r5_51[3]
      if r34_0.sync_lua_debugger_ver then
        r34_0.sync_lua_debugger_ver(r6_51)
      end
      local r7_51 = r34_0.sync_config
      local r8_51 = r38_0
      local r9_51 = r42_0
      if r9_51 then
        r9_51 = 1 and 0
      else
        goto label_917	-- block#178 is visited secondly
      end
      r7_51(r8_51, r9_51)
      r34_0.sync_tempfile_path(r27_0)
      r34_0.sync_cwd(r21_0)
      r34_0.sync_file_ext(r20_0)
    end
    r61_0 = 0
    if r62_0 ~= nil and type(r62_0) == "function" and pcall(r62_0("return 0")) then
      r61_0 = 1
    end
    r3_51.info = {
      debuggerVer = tostring(r8_0),
      UseHookLib = tostring(r4_51),
      UseLoadstring = tostring(r61_0),
      isNeedB64EncodeStr = tostring(r46_0),
    }
    r9_0.sendMsg(r3_51)
    r52_0 = r1_51.info.stopOnEntry
    if r1_51.info.stopOnEntry == "true" then
      r9_0.changeRunState(r13_0.STOP_ON_ENTRY)
    else
      r9_0.debugger_wait_msg(1)
      r9_0.changeRunState(r13_0.RUN)
    end
  elseif r1_51.cmd == "getWatchedVariable" then
    local r2_51 = r9_0.getMsgTable("getWatchedVariable", r9_0.getCallbackId())
    local r3_51 = tonumber(r1_51.info.stackId)
    if r61_0 == 1 then
      r9_0.curStackId = r3_51
      r2_51.info = r9_0.processWatchedExp(r1_51.info)
      r9_0.sendMsg(r2_51)
      r9_0.debugger_wait_msg()
      return 
    else
      local r4_51 = r9_0.getWatchedVariable(r1_51.info.varName, r3_51, true)
      if r4_51 ~= nil then
        r2_51.info = r4_51
      end
      r9_0.sendMsg(r2_51)
      r9_0.debugger_wait_msg()
    end
  elseif r1_51.cmd == "stopRun" then
    r9_0.sendMsg(r9_0.getMsgTable("stopRun", r9_0.getCallbackId()))
    if not r56_0 then
      r9_0.disconnect()
    end
  elseif r1_51.cmd == "LuaGarbageCollect" then
    r9_0.printToVSCode("collect garbage!")
    collectgarbage("collect")
    r9_0.sendLuaMemory()
    r9_0.debugger_wait_msg()
  elseif r1_51.cmd == "runREPLExpression" then
    r9_0.curStackId = tonumber(r1_51.info.stackId)
    local r2_51 = r9_0.processExp(r1_51.info)
    local r3_51 = r9_0.getMsgTable("runREPLExpression", r9_0.getCallbackId())
    r3_51.info = r2_51
    r9_0.sendMsg(r3_51)
    r9_0.debugger_wait_msg()
  end
end
function r9_0.createSetValueRetTable(r0_52, r1_52, r2_52, r3_52, r4_52, r5_52)
  -- line: [1466, 1532] id: 52
  local r6_52 = nil
  local r7_52 = nil
  if r2_52 == false then
    r7_52 = {}
    r7_52[1] = {
      variablesReference = 0,
      value = r1_52,
      name = r0_52,
      type = type(r1_52),
    }
  else
    r7_52 = r9_0.getWatchedVariable(tostring(r1_52), r3_52, true)
  end
  if r7_52 ~= nil then
    local r8_52 = nil
    local r9_52 = r7_52[1].value
    if r2_52 == true then
      if tonumber(r7_52[1].variablesReference) > 0 then
        r8_52 = r40_0[tonumber(r7_52[1].variablesReference)]
      else
        if r7_52[1].type == "number" then
          r8_52 = tonumber(r7_52[1].value)
        end
        if r7_52[1].type == "string" then
          r8_52 = tostring(r7_52[1].value)
          local r10_52 = string.sub(r8_52, 1, 1)
          if r10_52 == string.sub(r8_52, -1, -1) and (r10_52 == "\'" or r10_52 == "\"") then
            r8_52 = string.sub(r8_52, 2, -2)
            r9_52 = r8_52
          end
        end
        if r7_52[1].type == "boolean" then
          r8_52 = r7_52[1].value == "true"
        end
        if r7_52[1].type == "nil" then
          r8_52 = nil
        end
      end
    else
      r8_52 = r7_52[1].value
    end
    local r10_52 = nil
    if type(r4_52) ~= table then
      r10_52 = r9_0.setVariableValue(r0_52, r3_52, r8_52, r5_52)
    else
      r4_52[r0_52] = r8_52
      r10_52 = true
    end
    if r7_52[1].type == "string" then
      r9_52 = "\"" .. r9_52 .. "\""
    end
    if r10_52 ~= false and r10_52 ~= nil then
      r6_52 = {
        success = "true",
        name = r7_52[1].name,
        type = r7_52[1].type,
        value = r9_52,
        variablesReference = tostring(r7_52[1].variablesReference),
        tip = "变量 " .. r0_52 .. " 赋值成功",
      }
    else
      r6_52 = {
        success = "false",
        type = type(r8_52),
        value = r9_52,
        tip = "找不到要设置的变量",
      }
    end
  else
    r6_52 = {
      success = "false",
      type = nil,
      value = nil,
      tip = "输入的值无意义",
    }
  end
  return r6_52
end
function r9_0.receiveMessage(r0_53)
  -- line: [1538, 1587] id: 53
  if not r0_53 then
    r0_53 = r15_0
  end
  r30_0:settimeout(r0_53)
  if #r43_0 > 0 then
    local r1_53 = r43_0[1]
    table.remove(r43_0, 1)
    r9_0.dataProcess(r1_53)
    return true
  end
  if r16_0 == r13_0.DISCONNECT then
    r9_0.disconnect()
    return false
  end
  if r30_0 == nil then
    r9_0.printToConsole("[debugger error]接收信息失败  |  reason: socket == nil", 2)
    return 
  end
  local r1_53, r2_53 = r30_0:receive("*l")
  if r1_53 == nil then
    if r2_53 == "closed" then
      r9_0.printToConsole("[debugger error]接收信息失败  |  reason:" .. r2_53, 2)
      r9_0.disconnect()
    end
    return false
  else
    local r3_53 = string.sub(r1_53, 1, (r14_0:len() + 1) * -1)
    local r4_53 = string.find(r3_53, r14_0, 1, true)
    if r4_53 == nil then
      r9_0.dataProcess(r3_53)
    else
      repeat
        table.insert(r43_0, string.sub(r3_53, 1, r4_53 + -1))
      until not string.find(string.sub(r3_53, (r4_53 + r14_0:len()), -1), r14_0, 1, true)
      r9_0.receiveMessage()
    end
    return true
  end
end
function r9_0.debugger_wait_msg(r0_54)
  -- line: [1592, 1618] id: 54
  if not r0_54 then
    r0_54 = r15_0
  end
  if r16_0 == r13_0.WAIT_CMD then
    return r9_0.receiveMessage(r0_54)
  end
  if r16_0 == r13_0.STEPOVER or r16_0 == r13_0.STEPIN or r16_0 == r13_0.STEPOUT or r16_0 == r13_0.RUN then
    r9_0.receiveMessage(0)
    return 
  end
  if r16_0 == r13_0.STEPOVER_STOP or r16_0 == r13_0.STEPIN_STOP or r16_0 == r13_0.STEPOUT_STOP or r16_0 == r13_0.HIT_BREAKPOINT or r16_0 == r13_0.STOP_ON_ENTRY then
    r9_0.sendLuaMemory()
    r9_0.receiveMessage(r15_0)
    return 
  end
end
function r9_0.getStackTable(r0_55)
  -- line: [1629, 1682] id: 55
  local r1_55 = 0
  if r34_0 ~= nil then
    r1_55 = r0_55 and r60_0
  else
    r1_55 = r0_55 and r9_0.getSpecificFunctionStackLevel(r24_0.func)
  end
  local r2_55 = {}
  local r3_55 = 0
  local r4_55 = 0
  while true do
    local r5_55 = debug.getinfo(r1_55, "SlLnf")
    if r5_55 ~= nil then
      if r5_55.source ~= "=[C]" then
        local r6_55 = {
          file = r9_0.getPath(r5_55),
          oPath = r9_0.truncatedPath(r9_0.formatOpath(r5_55.source), r36_0),
          name = "文件名",
          line = tostring(r5_55.currentline),
        }
        local r8_55 = r1_55 + -3
        if r34_0 ~= nil then
          r8_55 = r8_55 + 2
        end
        r6_55.index = tostring(r8_55)
        table.insert(r2_55, r6_55)
        table.insert(r25_0, {
          name = r6_55.file,
          line = r6_55.line,
          func = r5_55.func,
          realLy = r1_55,
        })
        if r3_55 == 0 then
          r3_55 = r1_55
        end
      else
        table.insert(r25_0, {
          name = r5_55.source,
          line = r5_55.currentline,
          func = r5_55.func,
          realLy = r1_55,
        })
        r4_55 = r4_55 + 1
      end
      r1_55 = r1_55 + 1
      if r5_55 == nil then
        break
      end
    else
      break
    end
  end
  return r2_55, r3_55
end
function r9_0.changePotToSep(r0_56, r1_56)
  -- line: [1687, 1694] id: 56
  local r2_56 = r0_56:find(r1_56, r1_56:len() * -1, true)
  if r2_56 then
    r0_56 = r0_56:sub(1, r2_56 + -1):gsub("%.", "/") .. r1_56
  end
  return r0_56
end
function r9_0.truncatedPath(r0_57, r1_57)
  -- line: [1697, 1705] id: 57
  if r0_57 and r0_57 ~= "" and r1_57 and r1_57 ~= "" then
    local r2_57, r3_57 = string.find(r0_57, r1_57)
    if r3_57 then
      r0_57 = string.sub(r0_57, r3_57 + 1)
    end
  end
  return r0_57
end
function r9_0.getPath(r0_58)
  -- line: [1709, 1787] id: 58
  local r1_58 = r0_58
  if type(r0_58) == "table" then
    r1_58 = r0_58.source
  end
  local r2_58 = r9_0.getCacheFormatPath(r1_58)
  if r2_58 ~= nil and type(r2_58) == "string" then
    return r2_58
  end
  local r3_58 = r1_58
  if r1_58:sub(1, 1) == "@" then
    r1_58 = r1_58:sub(2)
  end
  if r1_58:sub(1, 2) == "./" then
    r1_58 = r1_58:sub(3)
  end
  if r4_0 then
    if r55_0 == nil or r55_0 == "" then
      if not r1_58:find(r20_0, (r20_0:len() * -1), true) then
        r1_58 = string.gsub(r1_58, "%.", "/")
      else
        r1_58 = r9_0.changePotToSep(r1_58, r20_0)
      end
    else
      r1_58 = r9_0.changePotToSep(r1_58, r55_0)
    end
  end
  if r20_0 ~= "" then
    if string.find(r20_0, "%%%d") then
      r1_58 = string.gsub(r1_58, "%.[%w%.]+$", r20_0)
    else
      r1_58 = string.gsub(r1_58, "%.[%w%.]+$", "") .. "." .. r20_0
    end
  end
  if not r54_0 then
    if r1_58:sub(1, 1) == "/" or r1_58:sub(1, 2):match("^%a:") then
      r51_0 = true
    else
      r51_0 = false
      if r21_0 ~= "" and string.find(r1_58, r21_0, 1, true) == nil then
        r1_58 = r21_0 .. "/" .. r1_58
      end
    end
  end
  r1_58 = r9_0.genUnifiedPath(r1_58)
  if r54_0 then
    r1_58 = r9_0.getFilenameFromPath(r1_58)
  end
  r9_0.setCacheFormatPath(r3_58, r1_58)
  return r1_58
end
function r9_0.getFilenameFromPath(r0_59)
  -- line: [1790, 1796] id: 59
  if r0_59 == nil then
    return ""
  end
  return string.match(r0_59, "([^/]*)$")
end
function r9_0.getCurrentFunctionStackLevel()
  -- line: [1800, 1814] id: 60
  local r0_60 = 2
  repeat
    local r1_60 = debug.getinfo(r0_60, "S")
    if r1_60 ~= nil then
      local r2_60 = r1_60.source
      if r2_60 ~= r22_0 then
        r2_60 = r1_60.source == r23_0
      else
        goto label_17	-- block#5 is visited secondly
      end
      if r2_60 == false then
        return r0_60 + -1
      end
    end
    r0_60 = r0_60 + 1
  until not r1_60
  return 0
end
function r9_0.getSpecificFunctionStackLevel(r0_61)
  -- line: [1819, 1831] id: 61
  local r1_61 = 2
  repeat
    local r2_61 = debug.getinfo(r1_61, "f")
    if r2_61 ~= nil and r2_61.func == r0_61 then
      return r1_61 + -1
    end
    r1_61 = r1_61 + 1
  until not r2_61
  return 0
end
function r9_0.checkCurrentLayerisLua(r0_62)
  -- line: [1835, 1853] id: 62
  local r1_62 = debug.getinfo(r0_62, "S")
  if r1_62 == nil then
    return nil
  end
  r1_62.source = r9_0.genUnifiedPath(r1_62.source)
  if r1_62 ~= nil then
    for r6_62, r7_62 in pairs(r1_62) do
      if r6_62 == "what" then
        local r8_62 = r7_62 ~= "C"
      end
    end
    -- close: r2_62
  end
  return nil
end
function r9_0.checkRealHitBreakpoint(r0_63, r1_63)
  -- line: [1857, 1868] id: 63
  if r0_63 and r71_0[r0_63] then
    for r6_63, r7_63 in ipairs(r71_0[r0_63]) do
      if tonumber(r7_63) == tonumber(r1_63) then
        r9_0.printToVSCode("cache hit bp in same name file.  source:" .. tostring(r0_63) .. " line:" .. tostring(r1_63))
        return false
      end
    end
    -- close: r2_63
  end
  return true
end
function r9_0.isHitBreakpoint(r0_64, r1_64, r2_64)
  -- line: [1875, 1932] id: 64
  if r18_0[r0_64] then
    local r3_64 = nil
    for r8_64, r9_64 in pairs(r18_0[r0_64]) do
      r63_0 = r8_64
      local r10_64 = false
      local r11_64 = {}
      for r16_64, r17_64 in ipairs(r9_64) do
        if tonumber(r17_64.line) == tonumber(r2_64) then
          r10_64 = true
          r11_64 = r17_64
          r63_0 = r8_64
          break
        end
      end
      -- close: r12_64
      if r10_64 then
        if r3_64 == nil then
          r3_64 = r9_0.truncatedPath(r9_0.formatOpath(r1_64), r36_0)
        end
        if not r37_0 or string.match(r8_64, r3_64) and r9_0.checkRealHitBreakpoint(r1_64, r2_64) then
          if r11_64.type == "0" then
            return r9_0.IsMeetCondition(r11_64.condition)
          elseif r11_64.type == "1" then
            r9_0.printToVSCode("[LogPoint Output]: " .. r11_64.logMessage, 2, 2)
            return false
          else
            return true
          end
        end
      end
    end
    -- close: r4_64
  else
    r57_0 = false
    r63_0 = ""
  end
  return false
end
function r9_0.IsMeetCondition(r0_65)
  -- line: [1937, 1968] id: 65
  r25_0 = {}
  r40_0 = {}
  r39_0 = 1
  if r34_0 then
    r9_0.getStackTable(4)
  else
    r9_0.getStackTable()
  end
  r9_0.curStackId = 2
  local r2_65 = r9_0.processWatchedExp({
    varName = r0_65,
  })
  local r3_65 = false
  xpcall(function()
    -- line: [1954, 1964] id: 66
    if r2_65[1].isSuccess == "true" then
      if r2_65[1].value ~= "nil" then
        if r2_65[1].value == "false" then
          local r0_66 = r2_65[1].type ~= "boolean"
        else
          goto label_23	-- block#5 is visited secondly
        end
      else
        goto label_20	-- block#4 is visited secondly
      end
    else
      r3_65 = false
    end
  end, function()
    -- line: [1966, 1966] id: 67
    r3_65 = false
  end)
  return r3_65
end
function r9_0.BP()
  -- line: [1971, 2006] id: 68
  r9_0.printToConsole("BP()")
  if r34_0 == nil then
    if r17_0 == r12_0.DISCONNECT_HOOK then
      r9_0.printToConsole("BP() but NO HOOK")
      return 
    end
    local r0_68, r1_68 = coroutine.running()
    if _VERSION == "Lua 5.1" then
      r1_68 = r0_68 == nil
    end
    if r1_68 == true then
      r9_0.printToConsole("BP() in main")
    else
      r9_0.printToConsole("BP() in coroutine")
      debug.sethook(r0_68, r9_0.debug_hook, "lrc")
    end
    r26_0 = true
  else
    if r34_0.get_libhook_state() == r12_0.DISCONNECT_HOOK then
      r9_0.printToConsole("BP() but NO C HOOK")
      return 
    end
    r34_0.sync_bp_hit(1)
  end
  r9_0.changeHookState(r12_0.ALL_HOOK)
  return true
end
function r9_0.checkHasBreakpoint(r0_69)
  -- line: [2011, 2025] id: 69
  local r1_69 = false
  r1_69 = next(r18_0) ~= nil
  if r0_69 ~= nil then
    return r18_0[r0_69] ~= nil, r1_69
  else
    return r1_69
  end
end
function r9_0.checkfuncHasBreakpoint(r0_70, r1_70, r2_70)
  -- line: [2027, 2051] id: 70
  if r18_0[r2_70] == nil then
    return false
  end
  r0_70 = tonumber(r0_70)
  r1_70 = tonumber(r1_70)
  if r1_70 <= r0_70 then
    return true
  end
  if r9_0.getTableMemberNum(r18_0[r2_70]) <= 0 then
    return false
  else
    for r7_70, r8_70 in pairs(r18_0[r2_70]) do
      for r13_70, r14_70 in ipairs(r8_70) do
        if r0_70 < tonumber(r14_70.line) and tonumber(r14_70.line) <= r1_70 then
          return true
        end
      end
      -- close: r9_70
    end
    -- close: r3_70
  end
  return false
end
function r9_0.debug_hook(r0_71, r1_71)
  -- line: [2056, 2094] id: 71
  if r9_0.reConnect() == 0 then
    return 
  end
  if r38_0 == 0 then
    r9_0.printToVSCode(table.concat({
      "-----enter debug_hook-----\n",
      "event:",
      r0_71,
      "  line:",
      tostring(r1_71),
      " currentHookState:",
      r17_0,
      " currentRunState:",
      r16_0
    }))
  end
  if r17_0 == r12_0.LITE_HOOK then
    local r2_71 = os.time()
    if r2_71 - r67_0 > 1 then
      r9_0.debugger_wait_msg(0)
      r67_0 = r2_71
    end
    return 
  end
  local r2_71 = nil
  local r3_71, r4_71 = coroutine.running()
  if _VERSION == "Lua 5.1" then
    r4_71 = r3_71 == nil
  end
  r66_0 = r4_71
  if r4_71 == true then
    r2_71 = debug.getinfo(2, "Slf")
  else
    r2_71 = debug.getinfo(r3_71, 2, "Slf")
  end
  r2_71.event = r0_71
  r9_0.real_hook_process(r2_71)
end
function r9_0.real_hook_process(r0_72)
  -- line: [2096, 2290] id: 72
  local r1_72 = false
  local r2_72 = r0_72.event
  local r3_72 = r0_72.source
  if r3_72 ~= r22_0 then
    r3_72 = r0_72.source == r23_0
  else
    goto label_11	-- block#3 is visited secondly
  end
  if r3_72 == true then
    return 
  end
  if r16_0 == r13_0.RUN or r16_0 == r13_0.STEPOVER or r16_0 == r13_0.STEPIN or r16_0 == r13_0.STEPOUT then
    local r4_72 = os.time()
    if r4_72 - r67_0 > 1 then
      r9_0.debugger_wait_msg(0)
      r67_0 = r4_72
    end
  end
  if r0_72.source == "=[C]" then
    r9_0.printToVSCode("current method is C")
    return 
  end
  if r0_72.source == "temp buffer" then
    r9_0.printToVSCode("current method is in temp buffer")
    return 
  end
  if r0_72.source == "chunk" then
    r9_0.printToVSCode("current method is in chunk")
    return 
  end
  if r0_72.short_src:match("%[string \"") and r0_72.source:match("[\n;=]") then
    r9_0.printToVSCode("hook jump Code String!")
    r1_72 = true
  end
  if r1_72 == false then
    r0_72.orininal_source = r0_72.source
    r0_72.source = r9_0.getPath(r0_72)
  end
  if r24_0.currentline == r0_72.currentline and r24_0.source == r0_72.source and r24_0.func == r0_72.func and r24_0.event == r2_72 then
    r9_0.printToVSCode("run twice")
  end
  if r1_72 == false then
    r24_0 = r0_72
    r24_0.event = r2_72
    r41_0 = r0_72.source
  end
  if r38_0 == 0 and r1_72 == false then
    local r4_72 = {
      "[lua hook] event:",
      tostring(r2_72),
      " currentRunState:",
      tostring(r16_0),
      " currentHookState:",
      tostring(r17_0),
      " jumpFlag:",
      tostring(r1_72)
    }
    for r9_72, r10_72 in pairs(r0_72) do
      table.insert(r4_72, tostring(r9_72))
      table.insert(r4_72, ":")
      table.insert(r4_72, tostring(r10_72))
      table.insert(r4_72, " ")
    end
    -- close: r5_72
    r9_0.printToVSCode(table.concat(r4_72))
  end
  local r4_72 = false
  if tostring(r2_72) == "line" and r1_72 == false and (r16_0 == r13_0.RUN or r16_0 == r13_0.STEPOVER or r16_0 == r13_0.STEPIN or r16_0 == r13_0.STEPOUT) then
    r4_72 = r9_0.isHitBreakpoint(r0_72.source, r0_72.orininal_source, r0_72.currentline) and r26_0
    if r4_72 == true then
      r9_0.printToVSCode("HitBreakpoint!")
      local r5_72 = r58_0
      local r6_72 = r59_0
      local r7_72 = r16_0
      r58_0 = 0
      r59_0 = 0
      r9_0.changeRunState(r13_0.HIT_BREAKPOINT)
      r69_0 = true
      if r26_0 then
        r26_0 = false
        r9_0.SendMsgWithStack("stopOnCodeBreakpoint")
      else
        r9_0.SendMsgWithStack("stopOnBreakpoint")
        if r69_0 == false then
          r4_72 = false
          r9_0.changeRunState(r7_72)
          r58_0 = r5_72
          r59_0 = r6_72
        end
      end
    end
  end
  if r4_72 == true then
    return 
  end
  if r16_0 == r13_0.STEPOVER then
    if r2_72 == "line" and r58_0 <= 0 and r1_72 == false then
      r58_0 = 0
      r9_0.changeRunState(r13_0.STEPOVER_STOP)
      r9_0.SendMsgWithStack("stopOnStep")
    elseif (r2_72 == "return" or r2_72 == "tail return") and r58_0 ~= 0 then
      r58_0 = r58_0 + -1
    elseif r2_72 == "call" then
      r58_0 = r58_0 + 1
    end
  elseif r16_0 == r13_0.STOP_ON_ENTRY and r2_72 == "line" and r1_72 == false then
    r9_0.SendMsgWithStack("stopOnEntry")
  elseif r16_0 == r13_0.STEPIN and r2_72 == "line" and r1_72 == false then
    r9_0.changeRunState(r13_0.STEPIN_STOP)
    r9_0.SendMsgWithStack("stopOnStepIn")
  elseif r16_0 == r13_0.STEPOUT then
    if r1_72 == false and r59_0 <= -1 then
      r59_0 = 0
      r9_0.changeRunState(r13_0.STEPOUT_STOP)
      r9_0.SendMsgWithStack("stopOnStepOut")
    end
    if r2_72 == "return" or r2_72 == "tail return" then
      r59_0 = r59_0 + -1
    elseif r2_72 == "call" then
      r59_0 = r59_0 + 1
    end
  end
  if r34_0 == nil and r16_0 == r13_0.RUN and r1_72 == false and r17_0 ~= r12_0.DISCONNECT_HOOK then
    local r5_72, r6_72 = r9_0.checkHasBreakpoint(r41_0)
    if r5_72 == false then
      if r6_72 == true then
        r9_0.changeHookState(r12_0.MID_HOOK)
      else
        r9_0.changeHookState(r12_0.LITE_HOOK)
      end
    elseif r9_0.checkfuncHasBreakpoint(r24_0.linedefined, r24_0.lastlinedefined, r41_0) then
      r9_0.changeHookState(r12_0.ALL_HOOK)
    else
      r9_0.changeHookState(r12_0.MID_HOOK)
    end
    if (r2_72 == "return" or r2_72 == "tail return") and r17_0 == r12_0.MID_HOOK then
      r9_0.changeHookState(r12_0.ALL_HOOK)
    end
  end
end
function r9_0.SendMsgWithStack(r0_73)
  -- line: [2294, 2303] id: 73
  local r1_73 = r9_0.getMsgTable(r0_73)
  local r2_73 = 0
  r1_73.stack, r2_73 = r9_0.getStackTable()
  if r2_73 ~= 0 then
    r24_0.func = debug.getinfo(r2_73 + -1, "f").func
  end
  r9_0.sendMsg(r1_73)
  r9_0.debugger_wait_msg()
end
function r9_0.changeHookState(r0_74)
  -- line: [2307, 2336] id: 74
  if r34_0 == nil and r17_0 == r0_74 then
    return 
  end
  r9_0.printToConsole("change hook state :" .. r0_74)
  if r0_74 ~= r12_0.DISCONNECT_HOOK then
    r9_0.printToVSCode("change hook state : " .. r0_74)
  end
  r17_0 = r0_74
  if r0_74 == r12_0.DISCONNECT_HOOK then
    if r0_0 == true then
      if r34_0 then
        r34_0.lua_set_hookstate(r12_0.DISCONNECT_HOOK)
      else
        debug.sethook(r9_0.debug_hook, "r", 1000000)
      end
    elseif r34_0 then
      r34_0.endHook()
    else
      debug.sethook()
    end
  elseif r0_74 == r12_0.LITE_HOOK then
    if r34_0 then
      r34_0.lua_set_hookstate(r12_0.LITE_HOOK)
    else
      debug.sethook(r9_0.debug_hook, "r")
    end
  elseif r0_74 == r12_0.MID_HOOK then
    if r34_0 then
      r34_0.lua_set_hookstate(r12_0.MID_HOOK)
    else
      debug.sethook(r9_0.debug_hook, "rc")
    end
  elseif r0_74 == r12_0.ALL_HOOK then
    if r34_0 then
      r34_0.lua_set_hookstate(r12_0.ALL_HOOK)
    else
      debug.sethook(r9_0.debug_hook, "lrc")
    end
  end
  if r34_0 == nil then
    r9_0.changeCoroutinesHookState()
  end
end
function r9_0.changeRunState(r0_75, r1_75)
  -- line: [2341, 2363] id: 75
  local r2_75 = nil
  if r1_75 == 1 then
    r2_75 = "libc"
  else
    r2_75 = "lua"
  end
  r9_0.printToConsole("changeRunState :" .. r0_75 .. " | from:" .. r2_75)
  if r0_75 ~= r13_0.DISCONNECT and r0_75 ~= r13_0.WAIT_CMD then
    r9_0.printToVSCode("changeRunState :" .. r0_75 .. " | from:" .. r2_75)
  end
  if r34_0 ~= nil and r1_75 ~= 1 then
    r34_0.lua_set_runstate(r0_75)
  end
  r16_0 = r0_75
  r25_0 = {}
  r40_0 = {}
  r39_0 = 1
end
function r9_0.changeCoroutinesHookState(r0_76)
  -- line: [2367, 2377] id: 76
  if not r0_76 then
    r0_76 = r17_0
  end
  r9_0.printToConsole("change [Coroutine] HookState: " .. tostring(r0_76))
  for r5_76, r6_76 in pairs(r44_0) do
    if coroutine.status(r6_76) == "dead" then
      r44_0[r5_76] = nil
    else
      r9_0.changeCoroutineHookState(r6_76, r0_76)
    end
  end
  -- close: r1_76
end
function r9_0.changeCoroutineHookState(r0_77, r1_77)
  -- line: [2379, 2393] id: 77
  if r1_77 == r12_0.DISCONNECT_HOOK then
    if r0_0 == true then
      debug.sethook(r0_77, r9_0.debug_hook, "r", 1000000)
    else
      debug.sethook(r0_77, r9_0.debug_hook, "")
    end
  elseif r1_77 == r12_0.LITE_HOOK then
    debug.sethook(r0_77, r9_0.debug_hook, "r")
  elseif r1_77 == r12_0.MID_HOOK then
    debug.sethook(r0_77, r9_0.debug_hook, "rc")
  elseif r1_77 == r12_0.ALL_HOOK then
    debug.sethook(r0_77, r9_0.debug_hook, "lrc")
  end
end
function r9_0.clearEnv()
  -- line: [2397, 2402] id: 78
  if r9_0.getTableMemberNum(r72_0) > 0 then
    r72_0 = setmetatable({}, getmetatable(r72_0))
  end
end
function r9_0.showEnv()
  -- line: [2405, 2407] id: 79
  return r72_0
end
function r9_0.findTableVar(r0_80, r1_80)
  -- line: [2413, 2441] id: 80
  if type(r0_80) ~= "table" or type(r1_80) ~= "table" then
    return nil
  end
  local r2_80 = 2
  local r3_80 = r1_80
  local r4_80 = false
  repeat
    if r0_80[r2_80] ~= nil then
      local r5_80 = nil
      xpcall(function()
        -- line: [2425, 2425] id: 81
        r5_80 = r3_80[tonumber(r0_80[r2_80])]
      end, function()
        -- line: [2425, 2425] id: 82
        r5_80 = nil
      end)
      if r5_80 == nil then
        xpcall(function()
          -- line: [2427, 2427] id: 83
          r3_80 = r3_80[tostring(r0_80[r2_80])]
        end, function()
          -- line: [2427, 2427] id: 84
          r3_80 = nil
        end)
      else
        r3_80 = r5_80
      end
      r2_80 = r2_80 + 1
      if r3_80 == nil then
        return nil
      end
      -- close: r5_80
    else
      r4_80 = true
    end
  until r4_80 == true
  return r3_80
end
function r9_0.createWatchedVariableInfo(r0_85, r1_85)
  -- line: [2447, 2466] id: 85
  local r2_85 = {
    name = r0_85,
    type = tostring(type(r1_85)),
  }
  xpcall(function()
    -- line: [2451, 2451] id: 86
    r2_85.value = tostring(r1_85)
  end, function()
    -- line: [2451, 2451] id: 87
    r2_85.value = tostring(type(r1_85)) .. " [value can\'t trans to string]"
  end)
  r2_85.variablesReference = "0"
  if r2_85.type == "table" or r2_85.type == "function" or r2_85.type == "userdata" then
    r2_85.variablesReference = r39_0
    r40_0[r39_0] = r1_85
    r39_0 = r39_0 + 1
    if r2_85.type == "table" then
      r2_85.value = r9_0.getTableMemberNum(r1_85) .. " Members " .. r2_85.value
    end
  elseif r2_85.type == "string" then
    r2_85.value = "\"" .. r1_85 .. "\""
  end
  return r2_85
end
function r9_0.setGlobal(r0_88, r1_88)
  -- line: [2471, 2475] id: 88
  _G[r0_88] = r1_88
  r9_0.printToVSCode("[setVariable success] 已设置  _G." .. r0_88 .. " = " .. tostring(r1_88))
  return true
end
function r9_0.setUpvalue(r0_89, r1_89, r2_89, r3_89)
  -- line: [2482, 2515] id: 89
  local r4_89 = false
  for r10_89, r11_89 in ipairs(r9_0.getUpValueVariable(r25_0[r2_89 + -1].func, true)) do
    if r11_89.name == r0_89 then
      local r12_89 = debug.setupvalue(r25_0[r2_89 + -1].func, r10_89, r1_89)
      if r12_89 == r0_89 then
        r9_0.printToConsole("[setVariable success] 已设置 upvalue " .. r0_89 .. " = " .. tostring(r1_89))
        r4_89 = true
      else
        r9_0.printToConsole("[setVariable error] 未能设置 upvalue " .. r0_89 .. " = " .. tostring(r1_89) .. " , 返回结果: " .. tostring(r12_89))
      end
      return r4_89
    end
  end
  -- close: r6_89
  return r4_89
  -- warn: not visited block [5, 6, 7, 8]
  -- block#5:
  -- r13_89 = _ENV.debug.setupvalue(currentCallStack[r2_89 + -1].func, r10_89, r1_89)
  -- if r13_89 == r0_89
  -- block#6:
  -- this.printToConsole("[setVariable success1] 已设置" .. r0_89 .. " = " .. _ENV.tostring(r1_89))
  -- r4_89 = true
  -- goto label_68
  -- block#7:
  -- this.printToConsole("[setVariable error1] 未能设\xe7\xbd" .. r0_89 .. " = " .. _ENV.tostring(r1_89) .. " , 返回结果: " .. _ENV.tostring(r13_89))
  -- block#8:
  -- return r4_89
  -- goto label_107
end
function r9_0.setLocal(r0_90, r1_90, r2_90, r3_90)
  -- line: [2521, 2557] id: 90
  local r4_90 = tonumber(r3_90)
  local r5_90 = nil	-- notice: implicit variable refs by block#[3]
  if r4_90 then
    r5_90 = r4_90 + -2
    if not r5_90 then
      ::label_9::
      r5_90 = 0
    end
  else
    goto label_9	-- block#2 is visited secondly
  end
  local r6_90, r7_90 = r9_0.getVariable(nil, true, r5_90)
  local r8_90 = false
  for r13_90, r14_90 in ipairs(r6_90) do
    if r14_90.name == r0_90 then
      local r15_90 = debug.setlocal(r7_90, r6_90[r13_90].index, r1_90)
      if r15_90 == r0_90 then
        r9_0.printToConsole("[setVariable success] 已设置 local " .. r0_90 .. " = " .. tostring(r1_90))
        r8_90 = true
      else
        r9_0.printToConsole("[setVariable error] 未能设置 local " .. r0_90 .. " = " .. tostring(r1_90) .. " , 返回结果: " .. tostring(r15_90))
      end
      return r8_90
    end
  end
  -- close: r9_90
  return r8_90
  -- warn: not visited block [8, 9, 10, 11]
  -- block#8:
  -- r16_90 = _ENV.debug.setlocal(r7_90, r6_90[r13_90].index, r1_90)
  -- if r16_90 == r0_90
  -- block#9:
  -- this.printToConsole("[setVariable success1] 已设置" .. r0_90 .. " = " .. _ENV.tostring(r1_90))
  -- r8_90 = true
  -- goto label_72
  -- block#10:
  -- this.printToConsole("[setVariable error1] 未能设\xe7\xbd" .. r0_90 .. " = " .. _ENV.tostring(r1_90) .. " , 返回结果: " .. _ENV.tostring(r16_90))
  -- block#11:
  -- return r8_90
  -- goto label_108
end
function r9_0.setVariableValue(r0_91, r1_91, r2_91, r3_91)
  -- line: [2565, 2598] id: 91
  r9_0.printToConsole("setVariableValue | varName:" .. tostring(r0_91) .. " stackId:" .. tostring(r1_91) .. " newValue:" .. tostring(r2_91) .. " limit:" .. tostring(r3_91))
  if tostring(r0_91) == nil or tostring(r0_91) == "" then
    r9_0.printToConsole("[setVariable Error] 被赋值的变量名为空", 2)
    r9_0.printToVSCode("[setVariable Error] 被赋值的变量名为空", 2)
    return false
  end
  local r4_91 = {}
  if r0_91:match("%.") then
    r4_91 = r9_0.stringSplit(r0_91, "%.")
    if type(r4_91) ~= "table" or #r4_91 < 1 then
      return false
    end
    r0_91 = r4_91[1]
  end
  if r3_91 == "local" then
    return r9_0.setLocal(r0_91, r2_91, r4_91, r1_91)
  elseif r3_91 == "upvalue" then
    return r9_0.setUpvalue(r0_91, r2_91, r1_91, r4_91)
  elseif r3_91 == "global" then
    return r9_0.setGlobal(r0_91, r2_91)
  else
    local r5_91 = r9_0.setLocal(r0_91, r2_91, r4_91, r1_91) and r9_0.setUpvalue(r0_91, r2_91, r1_91, r4_91) and r9_0.setGlobal(r0_91, r2_91)
    r9_0.printToConsole("set Value res :" .. tostring(r5_91))
    return r5_91
  end
end
function r9_0.getWatchedVariable(r0_92, r1_92, r2_92)
  -- line: [2605, 2692] id: 92
  r9_0.printToConsole("getWatchedVariable | varName:" .. tostring(r0_92) .. " stackId:" .. tostring(r1_92) .. " isFormatVariable:" .. tostring(r2_92))
  if tostring(r0_92) == nil or tostring(r0_92) == "" then
    return nil
  end
  if type(r25_0[r1_92 + -1]) ~= "table" or type(r25_0[r1_92 + -1].func) ~= "function" then
    r9_0.printToVSCode("getWatchedVariable currentCallStack " .. r1_92 + -1 .. " Error\n" .. r9_0.serializeTable(r25_0, "currentCallStack"), 2)
    return nil
  end
  local r3_92 = r0_92
  local r4_92 = {}
  if r0_92:match("%.") then
    r4_92 = r9_0.stringSplit(r0_92, "%.")
    if type(r4_92) ~= "table" or #r4_92 < 1 then
      return nil
    end
    r0_92 = r4_92[1]
  end
  local r5_92 = {}
  local r7_92 = r9_0.getVariable(r9_0.getSpecificFunctionStackLevel(r25_0[r1_92 + -1].func), r2_92)
  local r8_92 = r9_0.getUpValueVariable(r25_0[r1_92 + -1].func, r2_92)
  local r9_92 = {}
  table.insert(r9_92, r7_92)
  table.insert(r9_92, r8_92)
  for r14_92, r15_92 in ipairs(r9_92) do
    for r20_92, r21_92 in ipairs(r15_92) do
      if r21_92.name == r0_92 then
        if #r4_92 > 0 and type(r21_92) == "table" then
          local r22_92 = r9_0.findTableVar(r4_92, r40_0[r21_92.variablesReference])
          if r22_92 ~= nil then
            if r2_92 then
              table.insert(r5_92, r9_0.createWatchedVariableInfo(r3_92, r22_92))
              return r5_92
            else
              return r22_92.value
            end
          end
        elseif r2_92 then
          table.insert(r5_92, r21_92)
          return r5_92
        else
          return r21_92.value
        end
      end
    end
    -- close: r16_92
  end
  -- close: r10_92
  if _G[r0_92] ~= nil then
    if #r4_92 > 0 and type(_G[r0_92]) == "table" then
      local r10_92 = r9_0.findTableVar(r4_92, _G[r0_92])
      if r10_92 ~= nil then
        if r2_92 then
          table.insert(r5_92, r9_0.createWatchedVariableInfo(r3_92, r10_92))
          return r5_92
        else
          return r10_92
        end
      end
    elseif r2_92 then
      table.insert(r5_92, r9_0.createWatchedVariableInfo(r0_92, _G[r0_92]))
      return r5_92
    else
      return _G[r0_92]
    end
  end
  r9_0.printToConsole("getWatchedVariable not find variable")
  return nil
end
function r9_0.getVariableRef(r0_93)
  -- line: [2697, 2777] id: 93
  local r1_93 = tonumber(r0_93)
  local r2_93 = {}
  local r3_93 = tostring(type(r40_0[r1_93]))
  local r4_93 = nil	-- notice: implicit variable refs by block#[20, 21, 22, 23, 24, 25]
  local r9_93 = nil	-- notice: implicit variable refs by block#[29]
  if r3_93 == "table" then
    r3_93 = pairs
    r4_93 = r40_0[r1_93]
    for r7_93, r8_93 in r3_93(r4_93) do
      r9_93 = {}
      if type(r7_93) == "string" then
        r9_93.name = "\"" .. tostring(r7_93) .. "\""
      else
        r9_93.name = tostring(r7_93)
      end
      r9_93.type = tostring(type(r8_93))
      xpcall(function()
        -- line: [2710, 2710] id: 94
        r9_93.value = tostring(r8_93)
      end, function()
        -- line: [2710, 2710] id: 95
        r9_93.value = tostring(type(r8_93)) .. " [value can\'t trans to string]"
      end)
      r9_93.variablesReference = "0"
      if r9_93.type == "table" or r9_93.type == "function" or r9_93.type == "userdata" then
        r9_93.variablesReference = r39_0
        r40_0[r39_0] = r8_93
        r39_0 = r39_0 + 1
        if r9_93.type == "table" then
          r9_93.value = r9_0.getTableMemberNum(r8_93) .. " Members " .. (r9_93.value and "")
        end
      elseif r9_93.type == "string" then
        r9_93.value = "\"" .. r8_93 .. "\""
      end
      table.insert(r2_93, r9_93)
      -- close: r9_93
      -- close: r7_93
    end
    -- close: r3_93
    r3_93 = getmetatable(r40_0[r1_93])
    if r3_93 ~= nil then
      r4_93 = type(r3_93)
      if r4_93 == "table" then
        r4_93 = {
          name = "_Metatable_",
          type = tostring(type(r3_93)),
        }
        xpcall(function()
          -- line: [2731, 2731] id: 96
          r4_93.value = "元表 " .. tostring(r3_93)
        end, function()
          -- line: [2731, 2731] id: 97
          r4_93.value = "元表 [value can\'t trans to string]"
        end)
        r4_93.variablesReference = r39_0
        r40_0[r39_0] = r3_93
        r39_0 = r39_0 + 1
        table.insert(r2_93, r4_93)
        -- close: r4_93
      end
    end
    -- close: r3_93
  else
    r3_93 = tostring
    r4_93 = type
    r3_93 = r3_93(r4_93(r40_0[r1_93]))
    if r3_93 == "function" then
      r3_93 = r9_0.getUpValueVariable
      r4_93 = r40_0
      r4_93 = r4_93[r1_93]
      r3_93 = r3_93(r4_93, true)
      r2_93 = r3_93
    else
      r3_93 = tostring
      r4_93 = type
      r3_93 = r3_93(r4_93(r40_0[r1_93]))
      if r3_93 == "userdata" then
        r3_93 = getmetatable
        r4_93 = r40_0
        r4_93 = r4_93[r1_93]
        r3_93 = r3_93(r4_93)
        if r3_93 ~= nil then
          r4_93 = type
          r4_93 = r4_93(r3_93)
          if r4_93 == "table" then
            r4_93 = {}
            r4_93.name = "_Metatable_"
            r4_93.type = tostring(type(r3_93))
            xpcall(function()
              -- line: [2747, 2747] id: 98
              r4_93.value = "元表 " .. tostring(r3_93)
            end, function()
              -- line: [2747, 2747] id: 99
              r4_93.value = "元表 [value can\'t trans to string]"
            end)
            r4_93.variablesReference = r39_0
            r40_0[r39_0] = r3_93
            r39_0 = r39_0 + 1
            table.insert(r2_93, r4_93)
            if r5_0 and r3_93.__pairs ~= nil and type(r3_93.__pairs) == "function" then
              for r9_93, r10_93 in pairs(r40_0[r1_93]) do
                local r11_93 = {
                  name = tostring(r9_93),
                  type = tostring(type(r10_93)),
                }
                xpcall(function()
                  -- line: [2758, 2758] id: 100
                  r11_93.value = tostring(r10_93)
                end, function()
                  -- line: [2758, 2758] id: 101
                  r11_93.value = tostring(type(r10_93)) .. " [value can\'t trans to string]"
                end)
                r11_93.variablesReference = "0"
                if r11_93.type == "table" or r11_93.type == "function" or r11_93.type == "userdata" then
                  r11_93.variablesReference = r39_0
                  r40_0[r39_0] = r10_93
                  r39_0 = r39_0 + 1
                  if r11_93.type == "table" then
                    r11_93.value = r9_0.getTableMemberNum(r10_93) .. " Members " .. (r11_93.value and "")
                  end
                elseif r11_93.type == "string" then
                  r11_93.value = "\"" .. r10_93 .. "\""
                end
                table.insert(r2_93, r11_93)
                -- close: r11_93
                -- close: r9_93
              end
              -- close: r5_93
            end
            -- close: r4_93
          end
        end
        -- close: r3_93
      end
    end
  end
  return r2_93
end
function r9_0.getGlobalVariable(...)
  -- line: [2781, 2804] id: 102
  local r0_102 = {}
  for r5_102, r6_102 in pairs(_G) do
    local r7_102 = {
      name = tostring(r5_102),
      type = tostring(type(r6_102)),
    }
    xpcall(function()
      -- line: [2788, 2788] id: 103
      r7_102.value = tostring(r6_102)
    end, function()
      -- line: [2788, 2788] id: 104
      r7_102.value = tostring(type(r6_102)) .. " [value can\'t trans to string]"
    end)
    r7_102.variablesReference = "0"
    if r7_102.type == "table" or r7_102.type == "function" or r7_102.type == "userdata" then
      r7_102.variablesReference = r39_0
      r40_0[r39_0] = r6_102
      r39_0 = r39_0 + 1
      if r7_102.type == "table" then
        r7_102.value = r9_0.getTableMemberNum(r6_102) .. " Members " .. (r7_102.value and "")
      end
    elseif r7_102.type == "string" then
      r7_102.value = "\"" .. r6_102 .. "\""
    end
    table.insert(r0_102, r7_102)
    -- close: r7_102
    -- close: r5_102
  end
  -- close: r1_102
  return r0_102
end
function r9_0.getUpValueVariable(r0_105, r1_105)
  -- line: [2808, 2853] id: 105
  local r2_105 = true
  if r1_105 == true then
    r2_105 = false
  end
  if not r0_105 then
    r0_105 = r24_0.func
  end
  local r3_105 = {}
  if r0_105 == nil then
    return r3_105
  end
  local r4_105 = 1
  while true do
    local r5_105, r6_105 = debug.getupvalue(r0_105, r4_105)
    if r5_105 then
      local r7_105 = {
        name = r5_105,
        type = tostring(type(r6_105)),
        variablesReference = "0",
      }
      if r2_105 == false then
        xpcall(function()
          -- line: [2832, 2832] id: 106
          r7_105.value = tostring(r6_105)
        end, function()
          -- line: [2832, 2832] id: 107
          r7_105.value = tostring(type(r6_105)) .. " [value can\'t trans to string]"
        end)
        if r7_105.type == "table" or r7_105.type == "function" or r7_105.type == "userdata" then
          r7_105.variablesReference = r39_0
          r40_0[r39_0] = r6_105
          r39_0 = r39_0 + 1
          if r7_105.type == "table" then
            r7_105.value = r9_0.getTableMemberNum(r6_105) .. " Members " .. (r7_105.value and "")
          end
        elseif r7_105.type == "string" then
          r7_105.value = "\"" .. r6_105 .. "\""
        end
      else
        r7_105.value = r6_105
      end
      table.insert(r3_105, r7_105)
      r4_105 = r4_105 + 1
      -- close: r7_105
    end
    if not r5_105 then
      -- close: r5_105
      break
    else
      -- close: r5_105
    end
  end
  return r3_105
end
function r9_0.getVariable(r0_108, r1_108, r2_108)
  -- line: [2857, 2920] id: 108
  local r3_108 = true
  if r1_108 == true then
    r3_108 = false
  end
  local r4_108 = 0
  if r0_108 ~= nil and type(r0_108) == "number" then
    r4_108 = r0_108 + 1
  else
    r4_108 = r9_0.getSpecificFunctionStackLevel(r24_0.func)
  end
  if r4_108 == 0 then
    r9_0.printToVSCode("[error]获取层次失败！", 2)
    return 
  end
  local r5_108 = {}
  local r6_108 = r4_108
  local r7_108 = 1
  if type(r2_108) == "number" then
    r6_108 = r6_108 + r2_108
  end
  while true do
    local r8_108, r9_108 = debug.getlocal(r6_108, r7_108)
    if r8_108 ~= nil then
      if tostring(r8_108) ~= "(*temporary)" then
        local r10_108 = {
          name = r8_108,
          type = tostring(type(r9_108)),
          variablesReference = "0",
          index = r7_108,
        }
        if r3_108 == false then
          xpcall(function()
            -- line: [2894, 2894] id: 109
            r10_108.value = tostring(r9_108)
          end, function()
            -- line: [2894, 2894] id: 110
            r10_108.value = tostring(type(r9_108)) .. " [value can\'t trans to string]"
          end)
          if r10_108.type == "table" or r10_108.type == "function" or r10_108.type == "userdata" then
            r10_108.variablesReference = r39_0
            r40_0[r39_0] = r9_108
            r39_0 = r39_0 + 1
            if r10_108.type == "table" then
              r10_108.value = r9_0.getTableMemberNum(r9_108) .. " Members " .. (r10_108.value and "")
            end
          elseif r10_108.type == "string" then
            r10_108.value = "\"" .. r9_108 .. "\""
          end
        else
          r10_108.value = r9_108
        end
        local r11_108 = r9_0.checkSameNameVar(r5_108, r10_108)
        if r11_108 ~= 0 then
          r5_108[r11_108] = r10_108
        else
          table.insert(r5_108, r10_108)
        end
        -- close: r10_108
      end
      r7_108 = r7_108 + 1
      if r8_108 == nil then
        -- close: r8_108
        break
      else
        -- close: r8_108
      end
    else
      break
    end
  end
  -- close: r8_108
  local r9_108 = r6_108 + -1
  return r5_108, r9_108
end
function r9_0.checkSameNameVar(r0_111, r1_111)
  -- line: [2923, 2930] id: 111
  for r6_111, r7_111 in pairs(r0_111) do
    if r7_111.name == r1_111.name then
      return r6_111
    end
  end
  -- close: r2_111
  return 0
end
function r9_0.processExp(r0_112)
  -- line: [2933, 2984] id: 112
  local r1_112 = nil
  local r2_112 = {
    isSuccess = "true",
  }
  if r0_112 ~= nil then
    local r3_112 = r9_0.trim(tostring(r0_112.Expression))
    if false == false then
      if r3_112:find("p ", 1, true) == 1 then
        r3_112 = r3_112:sub(3)
      end
      local r6_112 = r62_0("return " .. r3_112) and r62_0(r3_112)
      if type(r6_112) == "function" then
        if _VERSION == "Lua 5.1" then
          setfenv(r6_112, r72_0)
        else
          debug.setupvalue(r6_112, 1, r72_0)
        end
        xpcall(function()
          -- line: [2956, 2956] id: 113
          r1_112 = r6_112()
        end, function()
          -- line: [2956, 2956] id: 114
          r1_112 = "输入错误指令。\n + 请检查指令是否正确\n + 指令仅能在[暂停在断点时]输入, 请不要在程序持续运行时输入"
          r2_112.isSuccess = false
        end)
      else
        r1_112 = "指令执行错误。\n + 请检查指令是否正确\n + 可以直接输入表达式，执行函数或变量名，并观察执行结果"
        r2_112.isSuccess = false
      end
      -- close: r5_112
    end
  end
  r2_112.name = "Exp"
  r2_112.type = tostring(type(r1_112))
  xpcall(function()
    -- line: [2966, 2966] id: 115
    r2_112.value = tostring(r1_112)
  end, function(r0_116)
    -- line: [2966, 2966] id: 116
    r2_112.value = tostring(type(r1_112)) .. " [value can\'t trans to string] " .. r0_116
    r2_112.isSuccess = false
  end)
  r2_112.variablesReference = "0"
  if r2_112.type == "table" or r2_112.type == "function" or r2_112.type == "userdata" then
    r40_0[r39_0] = r1_112
    r2_112.variablesReference = r39_0
    r39_0 = r39_0 + 1
    if r2_112.type == "table" then
      r2_112.value = r9_0.getTableMemberNum(r1_112) .. " Members " .. r2_112.value
    end
  elseif r2_112.type == "string" then
    r2_112.value = "\"" .. r1_112 .. "\""
  end
  r9_0.clearEnv()
  local r3_112 = {}
  table.insert(r3_112, r2_112)
  return r3_112
end
function r9_0.processWatchedExp(r0_117)
  -- line: [2987, 3028] id: 117
  local r1_117 = nil
  local r2_117 = "return " .. tostring(r0_117.varName)
  r9_0.printToConsole("processWatchedExp | expression: " .. r2_117)
  local r3_117 = r62_0(r2_117)
  local r4_117 = {
    isSuccess = "true",
  }
  if type(r3_117) == "function" then
    if _VERSION == "Lua 5.1" then
      setfenv(r3_117, r72_0)
    else
      debug.setupvalue(r3_117, 1, r72_0)
    end
    xpcall(function()
      -- line: [3002, 3002] id: 118
      r1_117 = r3_117()
    end, function()
      -- line: [3002, 3002] id: 119
      r1_117 = "输入了错误的变量信息"
      r4_117.isSuccess = "false"
    end)
  else
    r1_117 = "未能找到变量的值"
    r4_117.isSuccess = "false"
  end
  r4_117.name = r0_117.varName
  r4_117.type = tostring(type(r1_117))
  xpcall(function()
    -- line: [3010, 3010] id: 120
    r4_117.value = tostring(r1_117)
  end, function()
    -- line: [3010, 3010] id: 121
    r4_117.value = tostring(type(r1_117)) .. " [value can\'t trans to string]"
    r4_117.isSuccess = "false"
  end)
  r4_117.variablesReference = "0"
  if r4_117.type == "table" or r4_117.type == "function" or r4_117.type == "userdata" then
    r40_0[r39_0] = r1_117
    r4_117.variablesReference = r39_0
    r39_0 = r39_0 + 1
    if r4_117.type == "table" then
      r4_117.value = r9_0.getTableMemberNum(r1_117) .. " Members " .. r4_117.value
    end
  elseif r4_117.type == "string" then
    r4_117.value = "\"" .. r1_117 .. "\""
  end
  local r5_117 = {}
  table.insert(r5_117, r4_117)
  return r5_117
end
function r10_0.getFileSource()
  -- line: [3031, 3038] id: 122
  for r5_122, r6_122 in pairs(debug.getinfo(1, "S")) do
    if r5_122 == "source" then
      return r6_122
    end
  end
  -- close: r1_122
end
function r10_0.printTable(r0_123, r1_123, r2_123)
  -- line: [3041, 3044] id: 123
  print(r10_0.show(r0_123, r1_123, r2_123))
end
function r10_0.serializeTable(r0_124, r1_124, r2_124)
  -- line: [3047, 3050] id: 124
  return r10_0.show(r0_124, r1_124, r2_124)
end
function r10_0.show(r0_125, r1_125, r2_125)
  -- line: [3073, 3140] id: 125
  local r7_125 = nil	-- notice: implicit variable refs by block#[0]
  local r3_125 = nil
  local r4_125 = nil
  local function r5_125(r0_126)
    -- line: [3077, 3077] id: 126
    return next(r0_126) == nil
  end
  local function r6_125(r0_127)
    -- line: [3079, 3097] id: 127
    local r1_127 = tostring(r0_127)
    if type(r0_127) == "function" then
      local r2_127 = debug.getinfo(r0_127, "S")
      if r2_127.what == "C" then
        return string.format("%q", r1_127 .. ", C function")
      else
        return string.format("%q", r1_127 .. ", defined in (" .. r2_127.linedefined .. "-" .. r2_127.lastlinedefined .. ")" .. r2_127.source)
      end
    elseif type(r0_127) == "number" or type(r0_127) == "boolean" then
      return r1_127
    else
      return string.format("%q", r1_127)
    end
  end
  function r7_125(r0_128, r1_128, r2_128, r3_128, r4_128)
    -- line: [3099, 3131] id: 128
    if not r2_128 then
      r2_128 = ""
    end
    if not r3_128 then
      r3_128 = {}
    end
    if not r4_128 then
      r4_128 = r1_128
    end
    r3_125 = r3_125 .. r2_128 .. r4_128
    if type(r0_128) ~= "table" then
      r3_125 = r3_125 .. " = " .. r6_125(r0_128) .. ";\n"
    elseif r3_128[r0_128] then
      r3_125 = r3_125 .. " = {}; -- " .. r3_128[r0_128] .. " (self reference)\n"
      r4_125 = r4_125 .. r1_128 .. " = " .. r3_128[r0_128] .. ";\n"
    else
      r3_128[r0_128] = r1_128
      if r5_125(r0_128) then
        r3_125 = r3_125 .. " = {};\n"
      else
        r3_125 = r3_125 .. " = {\n"
        for r9_128, r10_128 in pairs(r0_128) do
          r9_128 = r6_125(r9_128)
          local r11_128 = string.format("%s[%s]", r1_128, r9_128)
          r4_128 = string.format("[%s]", r9_128)
          r7_125(r10_128, r11_128, r2_128 .. "   ", r3_128, r4_128)
        end
        -- close: r5_128
        r3_125 = r3_125 .. r2_128 .. "};\n"
      end
    end
  end
  if not r1_125 then
    r1_125 = "PRINT_Table"
  end
  if type(r0_125) ~= "table" then
    return r1_125 .. " = " .. r6_125(r0_125)
  end
  r4_125 = ""
  r3_125 = ""
  r7_125(r0_125, r1_125, r2_125)
  return r3_125 .. r4_125
end
function r10_0.createJson()
  -- line: [3170, 3571] id: 129
  local r0_129 = require("math")
  local r1_129 = require("string")
  local r2_129 = require("table")
  local r3_129 = {}
  local r4_129 = {}
  r3_129.EMPTY_ARRAY = {}
  r3_129.EMPTY_OBJECT = {}
  local r5_129 = nil
  local r6_129 = nil
  local r7_129 = nil
  local r8_129 = nil
  local r9_129 = nil
  local r10_129 = nil
  local r11_129 = nil
  local r12_129 = nil
  local r13_129 = nil
  local r14_129 = nil
  function r3_129.encode(r0_130)
    -- line: [3208, 3255] id: 130
    if r0_130 == nil then
      return "null"
    end
    local r1_130 = type(r0_130)
    if r1_130 == "string" then
      return "\"" .. r4_129.encodeString(r0_130) .. "\""
    end
    if r1_130 == "number" or r1_130 == "boolean" then
      return tostring(r0_130)
    end
    if r1_130 == "table" then
      local r2_130 = {}
      local r3_130, r4_130 = r13_129(r0_130)
      if r3_130 then
        for r8_130 = 1, r4_130, 1 do
          r2_129.insert(r2_130, r3_129.encode(r0_130[r8_130]))
        end
      else
        for r9_130, r10_130 in pairs(r0_130) do
          if r14_129(r9_130) and r14_129(r10_130) then
            r2_129.insert(r2_130, "\"" .. r4_129.encodeString(r9_130) .. "\":" .. r3_129.encode(r10_130))
          end
        end
        -- close: r5_130
      end
      if r3_130 then
        return "[" .. r2_129.concat(r2_130, ",") .. "]"
      else
        return "{" .. r2_129.concat(r2_130, ",") .. "}"
      end
    end
    if r1_130 == "function" and r0_130 == r3_129.null then
      return "null"
    end
    assert(false, "encode attempt to encode unsupported type " .. r1_130 .. ":" .. tostring(r0_130))
  end
  function r3_129.decode(r0_131, r1_131)
    -- line: [3264, 3290] id: 131
    if not r1_131 or not r1_131 then
      r1_131 = 1
    end
    r1_131 = r11_129(r0_131, r1_131)
    assert(r1_131 <= r1_129.len(r0_131), "Unterminated JSON encoded object found at position in [" .. r0_131 .. "]")
    local r2_131 = r1_129.sub(r0_131, r1_131, r1_131)
    if r2_131 == "{" then
      return r9_129(r0_131, r1_131)
    end
    if r2_131 == "[" then
      return r5_129(r0_131, r1_131)
    end
    if r1_129.find("+-0123456789.e", r2_131, 1, true) then
      return r8_129(r0_131, r1_131)
    end
    if r2_131 == "\"" or r2_131 == "\'" then
      return r10_129(r0_131, r1_131)
    end
    if r1_129.sub(r0_131, r1_131, r1_131 + 1) == "/*" then
      return r3_129.decode(r0_131, r6_129(r0_131, r1_131))
    end
    return r7_129(r0_131, r1_131)
  end
  function r3_129.null()
    -- line: [3294, 3296] id: 132
    return r3_129.null
  end
  function r5_129(r0_133, r1_133)
    -- line: [3309, 3332] id: 133
    local r2_133 = {}
    local r3_133 = r1_129.len(r0_133)
    assert(r1_129.sub(r0_133, r1_133, r1_133) == "[", "decode_scanArray called but array does not start at position " .. r1_133 .. " in string:\n" .. r0_133)
    r1_133 = r1_133 + 1
    local r4_133 = 1
    repeat
      r1_133 = r11_129(r0_133, r1_133)
      assert(r1_133 <= r3_133, "JSON String ended unexpectedly scanning array.")
      local r5_133 = r1_129.sub(r0_133, r1_133, r1_133)
      if r5_133 == "]" then
        return r2_133, r1_133 + 1
      end
      if r5_133 == "," then
        r1_133 = r11_129(r0_133, r1_133 + 1)
      end
      assert(r1_133 <= r3_133, "JSON String ended unexpectedly scanning array.")
      local r6_133 = nil
      r6_133, r1_133 = r3_129.decode(r0_133, r1_133)
      r2_133[r4_133] = r6_133
      r4_133 = r4_133 + 1
    until false
  end
  function r6_129(r0_134, r1_134)
    -- line: [3338, 3343] id: 134
    assert(r1_129.sub(r0_134, r1_134, r1_134 + 1) == "/*", "decode_scanComment called but comment does not start at position " .. r1_134)
    assert(r1_129.find(r0_134, "*/", r1_134 + 2) ~= nil, "Unterminated comment in string at " .. r1_134)
    return r2_134 + 2
  end
  function r7_129(r0_135, r1_135)
    -- line: [3351, 3361] id: 135
    local r2_135 = {
      ["true"] = true,
      ["false"] = false,
      null = nil,
    }
    for r8_135, r9_135 in pairs({
      "true",
      "false",
      "null"
    }) do
      if r1_129.sub(r0_135, r1_135, r1_135 + r1_129.len(r9_135) + -1) == r9_135 then
        return r2_135[r9_135], r1_135 + r1_129.len(r9_135)
      end
    end
    -- close: r4_135
    assert(nil, "Failed to scan constant from string " .. r0_135 .. " at starting position " .. r1_135)
  end
  function r8_129(r0_136, r1_136)
    -- line: [3371, 3385] id: 136
    local r2_136 = r1_136 + 1
    local r3_136 = r1_129.len(r0_136)
    local r4_136 = "+-0123456789.e"
    while r1_129.find(r4_136, r1_129.sub(r0_136, r2_136, r2_136), 1, true) and r2_136 <= r3_136 do
      r2_136 = r2_136 + 1
    end
    return r1_129.sub(r0_136, r1_136, r2_136 + -1), r2_136
  end
  function r9_129(r0_137, r1_137)
    -- line: [3393, 3421] id: 137
    local r2_137 = {}
    local r3_137 = r1_129.len(r0_137)
    local r4_137 = nil
    local r5_137 = nil
    assert(r1_129.sub(r0_137, r1_137, r1_137) == "{", "decode_scanObject called but object does not start at position " .. r1_137 .. " in string:\n" .. r0_137)
    r1_137 = r1_137 + 1
    repeat
      r1_137 = r11_129(r0_137, r1_137)
      assert(r1_137 <= r3_137, "JSON string ended unexpectedly while scanning object.")
      local r6_137 = r1_129.sub(r0_137, r1_137, r1_137)
      if r6_137 == "}" then
        return r2_137, r1_137 + 1
      end
      if r6_137 == "," then
        r1_137 = r11_129(r0_137, r1_137 + 1)
      end
      assert(r1_137 <= r3_137, "JSON string ended unexpectedly scanning object.")
      r4_137, r1_137 = r3_129.decode(r0_137, r1_137)
      assert(r1_137 <= r3_137, "JSON string ended unexpectedly searching for value of key " .. r4_137)
      r1_137 = r11_129(r0_137, r1_137)
      assert(r1_137 <= r3_137, "JSON string ended unexpectedly searching for value of key " .. r4_137)
      assert(r1_129.sub(r0_137, r1_137, r1_137) == ":", "JSON object key-value assignment mal-formed at " .. r1_137)
      r1_137 = r11_129(r0_137, r1_137 + 1)
      assert(r1_137 <= r3_137, "JSON string ended unexpectedly searching for value of key " .. r4_137)
      r5_137, r1_137 = r3_129.decode(r0_137, r1_137)
      r2_137[r4_137] = r5_137
    until false
  end
  local r15_129 = {
    ["\\t"] = "\t",
    ["\\f"] = "\u{c}",
    ["\\r"] = "\r",
    ["\\n"] = "\n",
    ["\\b"] = "\u{8}",
  }
  setmetatable(r15_129, {
    __index = function(r0_138, r1_138)
      -- line: [3433, 3436] id: 138
      return r1_129.sub(r1_138, 2)
    end,
  })
  function r10_129(r0_139, r1_139)
    -- line: [3447, 3492] id: 139
    assert(r1_139, "decode_scanString(..) called without start position")
    local r2_139 = r1_129.sub(r0_139, r1_139, r1_139)
    local r3_139 = assert
    local r4_139 = nil	-- notice: implicit variable refs by block#[4]
    if r2_139 ~= "\"" then
      r4_139 = r2_139 == "\'"
    else
      goto label_15	-- block#3 is visited secondly
    end
    r3_139(r4_139, "decode_scanString called for a non-string")
    r3_139 = {}
    r4_139 = r1_139
    local r5_139 = r1_139
    while r1_129.find(r0_139, r2_139, r5_139 + 1) ~= r5_139 + 1 do
      local r6_139 = r5_139
      r4_139, r5_139 = r1_129.find(r0_139, "\\.", r5_139 + 1)
      local r7_139, r8_139 = r1_129.find(r0_139, r2_139, r6_139 + 1)
      if not r4_139 or r7_139 < r4_139 then
        r5_139 = r8_139 + -1
        r4_139 = r7_139
      end
      r2_129.insert(r3_139, r1_129.sub(r0_139, r6_139 + 1, r4_139 + -1))
      if r1_129.sub(r0_139, r4_139, r5_139) == "\\u" then
        local r9_139 = r1_129.sub(r0_139, r5_139 + 1, r5_139 + 4)
        r5_139 = r5_139 + 4
        local r10_139 = tonumber(r9_139, 16)
        assert(r10_139, "String decoding failed: bad Unicode escape " .. r9_139 .. " at position " .. r4_139 .. " : " .. r5_139)
        local r11_139 = nil
        if r10_139 < 128 then
          r11_139 = r1_129.char(r10_139 % 128)
        elseif r10_139 < 2048 then
          r11_139 = r1_129.char(r0_129.floor(r10_139 / 64) % 32 + 192, r10_139 % 64 + 128)
        else
          r11_139 = r1_129.char(r0_129.floor(r10_139 / 4096) % 16 + 224, r0_129.floor(r10_139 / 64) % 64 + 128, r10_139 % 64 + 128)
        end
        r2_129.insert(r3_139, r11_139)
      else
        r2_129.insert(r3_139, r15_129[r1_129.sub(r0_139, r4_139, r5_139)])
      end
    end
    r2_129.insert(r3_139, r1_129.sub(r5_139, r5_139 + 1))
    assert(r1_129.find(r0_139, r2_139, r5_139 + 1), "String decoding failed: missing closing " .. r2_139 .. " at position " .. r5_139 .. "(for string at position " .. r1_139 .. ")")
    return r2_129.concat(r3_139, ""), r5_139 + 2
  end
  function r11_129(r0_140, r1_140)
    -- line: [3500, 3507] id: 140
    local r2_140 = " \n\r\t"
    local r3_140 = r1_129.len(r0_140)
    while r1_129.find(r2_140, r1_129.sub(r0_140, r1_140, r1_140), 1, true) and r1_140 <= r3_140 do
      r1_140 = r1_140 + 1
    end
    return r1_140
  end
  local r16_129 = {
    ["\""] = "\\\"",
    ["\\"] = "\\\\",
    ["/"] = "\\/",
    ["\u{8}"] = "\\b",
    ["\u{c}"] = "\\f",
    ["\n"] = "\\n",
    ["\r"] = "\\r",
    ["\t"] = "\\t",
  }
  function r4_129.encodeString(r0_141)
    -- line: [3525, 3528] id: 141
    return tostring(r0_141):gsub(".", function(r0_142)
      -- line: [3527, 3527] id: 142
      return r16_129[r0_142]
    end)
  end
  function r13_129(r0_143)
    -- line: [3538, 3558] id: 143
    if r0_143 == r3_129.EMPTY_ARRAY then
      return true, 0
    end
    if r0_143 == r3_129.EMPTY_OBJECT then
      return false
    end
    local r1_143 = 0
    for r6_143, r7_143 in pairs(r0_143) do
      if type(r6_143) == "number" and r0_129.floor(r6_143) == r6_143 and r6_143 >= 1 then
        if not r14_129(r7_143) then
          return false
        end
        r1_143 = r0_129.max(r1_143, r6_143)
      elseif r6_143 == "n" and r7_143 ~= (r0_143.n and #r0_143) then
        return false
      elseif r14_129(r7_143) then
        return false
      end
    end
    -- close: r2_143
    return true, r1_143
  end
  function r14_129(r0_144)
    -- line: [3565, 3569] id: 144
    local r1_144 = type(r0_144)
    local r2_144 = nil	-- notice: implicit variable refs by block#[9]
    if r1_144 ~= "string" and r1_144 ~= "boolean" and r1_144 ~= "number" and r1_144 ~= "nil" and r1_144 ~= "table" then
      if r1_144 == "function" then
        r2_144 = r0_144 == r3_129.null
      else
        goto label_18	-- block#7 is visited secondly
      end
    else
      goto label_19	-- block#8 is visited secondly
    end
    return r2_144
  end
  return r3_129
end
local r73_0 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
function r10_0.base64encode(r0_145)
  -- line: [3582, 3593] id: 145
  return (r0_145:gsub(".", function(r0_146)
    -- line: [3583, 3587] id: 146
    local r1_146 = ""
    local r2_146 = r0_146:byte()
    for r6_146 = 8, 1, -1 do
      local r7_146 = r1_146
      local r8_146 = r2_146 % 2 ^ r6_146 - r2_146 % 2 ^ (r6_146 + -1)
      if r8_146 > 0 then
        r8_146 = "1" and "0"
      else
        goto label_27	-- block#3 is visited secondly
      end
      r1_146 = r7_146 .. r8_146
    end
    return r1_146
  end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function(r0_147)
    -- line: [3587, 3592] id: 147
    if #r0_147 < 6 then
      return ""
    end
    local r1_147 = 0
    for r5_147 = 1, 6, 1 do
      local r6_147 = r0_147:sub(r5_147, r5_147)
      if r6_147 == "1" then
        r6_147 = 2 ^ (6 - r5_147) and 0
      else
        goto label_24	-- block#5 is visited secondly
      end
      r1_147 = r1_147 + r6_147
    end
    return r73_0:sub(r1_147 + 1, r1_147 + 1)
  end) .. ({
    "",
    "==",
    "="
  })[#r0_145 % 3 + 1]
end
function r10_0.base64decode(r0_148)
  -- line: [3596, 3609] id: 148
  r0_148 = string.gsub(r0_148, "[^" .. r73_0 .. "=]", "")
  return r0_148:gsub(".", function(r0_149)
    -- line: [3598, 3603] id: 149
    if r0_149 == "=" then
      return ""
    end
    local r1_149 = ""
    local r2_149 = r73_0:find(r0_149) + -1
    for r6_149 = 6, 1, -1 do
      local r7_149 = r1_149
      local r8_149 = r2_149 % 2 ^ r6_149 - r2_149 % 2 ^ (r6_149 + -1)
      if r8_149 > 0 then
        r8_149 = "1" and "0"
      else
        goto label_35	-- block#5 is visited secondly
      end
      r1_149 = r7_149 .. r8_149
    end
    return r1_149
  end):gsub("%d%d%d?%d?%d?%d?%d?%d?", function(r0_150)
    -- line: [3603, 3608] id: 150
    if #r0_150 ~= 8 then
      return ""
    end
    local r1_150 = 0
    for r5_150 = 1, 8, 1 do
      local r6_150 = r0_150:sub(r5_150, r5_150)
      if r6_150 == "1" then
        r6_150 = 2 ^ (8 - r5_150) and 0
      else
        goto label_24	-- block#5 is visited secondly
      end
      r1_150 = r1_150 + r6_150
    end
    return string.char(r1_150)
  end)
end
r11_0 = r10_0.createJson()
r9_0.printToConsole("load LuaPanda success", 1)
r9_0.replaceCoroutineFuncs()
return r9_0
