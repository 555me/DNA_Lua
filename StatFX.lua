-- filename: @C:/Pack/Branch/geili11\Content/Script/StatFX.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {}
local r1_0 = nil
local r2_0 = {}
local r3_0 = 5
local r4_0 = ""
local r5_0 = "\n"
local r6_0 = ","
local r7_0 = 0
local r8_0 = nil
local r9_0 = 10
local r10_0 = nil
r0_0.BeginStat = false
function r0_0.Stat(r0_1, r1_1, r2_1)
  -- line: [18, 26] id: 1
  r9_0 = r2_1 and 10
  r0_1.BeginStat = not r0_1.BeginStat
  if r0_1.BeginStat then
    r0_1:StatStart(r1_1)
  else
    r0_1:StatEnd(r1_1)
  end
end
function r0_0.StatStart(r0_2, r1_2)
  -- line: [28, 37] id: 2
  assert(r1_2.Player, "缺少Player")
  local r3_2 = 5
  r7_0 = 0
  r8_0 = URuntimeCommonFunctionLibrary.GetAllNiagaraPath()
  r1_2.Player:AddTimer(0.5, r0_2.StatRecordTimer, true, 0, "Test_StatRecordTimer")
  r1_2.Player:AddTimer(r3_2, r0_2.RepeatFXTimer, true, 0, "Test_RepeatFXTimer")
  r1_0 = r1_2.Player
end
function r0_0.StatRecordTimer(r0_3)
  -- line: [39, 64] id: 3
  if not r10_0 then
    return 
  end
  if r4_0 == "" then
    r4_0 = "NiagaraPath" .. r6_0 .. "Frame" .. r6_0 .. "CPU" .. r6_0 .. "Draw" .. r6_0 .. "GPU" .. r5_0
  end
  local r1_3 = UE4.URuntimeCommonFunctionLibrary.GetStatUnitData(r1_0)
  r4_0 = r4_0 .. r10_0 .. r6_0 .. r1_3.FrameTime .. r6_0 .. r1_3.GameThreadTime .. r6_0 .. r1_3.RenderThreadTime .. r6_0 .. r1_3.GPUFrameTime .. r5_0
  if #r2_0 == 0 then
    for r5_3 = 1, r3_0, 1 do
      r2_0[r5_3] = {}
    end
  end
  table.insert(r2_0[1], r10_0)
  table.insert(r2_0[2], r1_3.FrameTime)
  table.insert(r2_0[3], r1_3.GameThreadTime)
  table.insert(r2_0[4], r1_3.RenderThreadTime)
  table.insert(r2_0[5], r1_3.GPUFrameTime)
end
function r0_0.RepeatFXTimer(r0_4)
  -- line: [66, 80] id: 4
  local r1_4 = r7_0 + 1
  if r8_0:Num() < r1_4 then
    r1_4 = 1 and r7_0 + 1
  else
    goto label_11	-- block#2 is visited secondly
  end
  r7_0 = r1_4
  r10_0 = r8_0:GetRef(r7_0)
  r1_4 = math.floor(math.sqrt(r9_0))
  local r2_4 = math.floor(r1_4 / 2)
  local r3_4 = r1_0:K2_GetActorLocation()
  for r7_4 = 0, r9_0 + -1, 1 do
    UNiagaraFunctionLibrary.SpawnSystemAtLocation(r1_0, LoadObject(r10_0), FVector(math.floor(r7_4 / r1_4) * 100 + r3_4.X, (r7_4 % r1_4 - r2_4) * 100 + r3_4.Y, r3_4.Z))
  end
  UKismetSystemLibrary.ExecuteConsoleCommand(r1_0, "fx.ParticlePerfStats.RunTest 60", nil)
end
function r0_0.StatEnd(r0_5, r1_5)
  -- line: [82, 108] id: 5
  assert(r1_5.Player, "缺少Player")
  r1_5.Player:RemoveTimer("Test_RepeatSkillTimer")
  r1_5.Player:RemoveTimer("Test_RepeatFXTimer")
  r4_0 = r4_0 .. "Average" .. r5_0 .. ","
  local r2_5 = ","
  for r6_5 = 2, #r2_0, 1 do
    local r7_5 = 0
    local r8_5 = 0
    for r12_5 = 1, #r2_0[r6_5], 1 do
      r7_5 = r7_5 + r2_0[r6_5][r12_5]
      if r8_5 < r2_0[r6_5][r12_5] then
        r8_5 = r2_0[r6_5][r12_5]
      end
    end
    r2_5 = r2_5 .. r8_5 .. r6_0
    r4_0 = r4_0 .. r7_5 / #r2_0[r6_5] .. r6_0
  end
  r4_0 = r4_0 .. r5_0 .. "Max" .. r5_0 .. r2_5
  local r4_5 = io.open(UE4.UBlueprintPathsLibrary.ProfilingDir() .. "/ParticlePerf/StatFX_" .. os.date("%Y.%m.%d-%H.%M.%S") .. ".csv", "w+")
  io.output(r4_5)
  io.write(r4_0)
  io.close(r4_5)
end
return r0_0
