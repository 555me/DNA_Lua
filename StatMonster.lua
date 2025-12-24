-- filename: @C:/Pack/Branch/geili11\Content/Script/StatMonster.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {}
local r1_0 = {
  6001011,
  6002011,
  6003001,
  6004013,
  7001012,
  7001013,
  7001017,
  7002011,
  7003011,
  8500001
}
local r2_0 = {}
local r3_0 = {}
local r4_0 = nil
local r5_0 = {}
local r6_0 = 4
local r7_0 = ""
local r8_0 = "\n"
local r9_0 = "        "
r0_0.BeginStat = false
function r0_0.Stat(r0_1, r1_1)
  -- line: [30, 37] id: 1
  r0_1.BeginStat = not r0_1.BeginStat
  if r0_1.BeginStat then
    r0_1:StatStart(r1_1)
  else
    r0_1:StatEnd(r1_1)
  end
end
function r0_0.StatStart(r0_2, r1_2)
  -- line: [39, 53] id: 2
  assert(r1_2.Player, "缺少Player")
  r4_0 = r1_2.Player
  local r2_2 = 5
  local r3_2 = 0.5
  r0_2:CreateMonster(function(r0_3)
    -- line: [45, 51] id: 3
    r0_2:AddMon(r0_3)
    if #r2_0 == #r1_0 then
      r1_2.Player:AddTimer(r2_2, r0_2.RepeatSkillTimer, true, 0, "Test_RepeatSkillTimer")
      r1_2.Player:AddTimer(r3_2, r0_2.StatRecordTimer, true, 0, "Test_StatRecordTimer")
    end
  end)
end
function r0_0.CreateMonster(r0_4, r1_4)
  -- line: [55, 76] id: 4
  local r2_4 = 0
  local r3_4 = 0
  local r4_4 = 5
  local r5_4 = 300
  local r6_4 = UE4.UGameplayStatics.GetGameMode(r4_0)
  local r7_4 = r4_0:K2_GetActorLocation() + r4_0:GetActorForwardVector() * 100
  for r11_4 = 1, #r1_0, 1 do
    r6_4.EMGameState.EventMgr:GMCreateTestMonster(nil, r1_0[r11_4], 1, r7_4 + FVector(r2_4 * r5_4, r3_4 * r5_4, 0), r1_4, {
      CachePreloadInfo = 1,
    })
    if r4_4 <= r2_4 + 1 then
      r2_4 = 0
      r3_4 = r3_4 + 1
    end
  end
end
function r0_0.AddMon(r0_5, r1_5)
  -- line: [78, 83] id: 5
  table.insert(r2_0, r1_5)
  table.insert(r3_0, 1)
  r1_5.EMAnimInstance:SetRootMotionMode(ERootMotionMode.NoRootMotionExtraction)
end
function r0_0.RepeatSkillTimer(r0_6)
  -- line: [85, 95] id: 6
  for r5_6, r6_6 in pairs(r2_0) do
    local r7_6 = r3_0[r5_6]
    if r6_6:TestUseSkill(r7_6) then
      r3_0[r5_6] = r7_6 + 1
    else
      r3_0[r5_6] = 1
    end
  end
  -- close: r1_6
end
function r0_0.StatRecordTimer(r0_7)
  -- line: [97, 118] id: 7
  if r7_0 == "" then
    r7_0 = "Frame" .. r9_0 .. "CPU" .. r9_0 .. "Draw" .. r9_0 .. "GPU" .. r8_0
  end
  local r1_7 = UE4.URuntimeCommonFunctionLibrary.GetStatUnitData(r4_0)
  r7_0 = r7_0 .. r1_7.FrameTime .. r9_0 .. r1_7.GameThreadTime .. r9_0 .. r1_7.RenderThreadTime .. r9_0 .. r1_7.GPUFrameTime .. r8_0
  if #r5_0 == 0 then
    for r5_7 = 1, r6_0, 1 do
      r5_0[r5_7] = {}
    end
  end
  table.insert(r5_0[1], r1_7.FrameTime)
  table.insert(r5_0[2], r1_7.GameThreadTime)
  table.insert(r5_0[3], r1_7.RenderThreadTime)
  table.insert(r5_0[4], r1_7.GPUFrameTime)
end
function r0_0.StatEnd(r0_8, r1_8)
  -- line: [120, 148] id: 8
  assert(r1_8.Player, "缺少Player")
  r1_8.Player:RemoveTimer("Test_RepeatSkillTimer")
  r1_8.Player:RemoveTimer("Test_StatRecordTimer")
  r7_0 = r7_0 .. "Average" .. r8_0
  local r2_8 = ""
  for r6_8 = 1, #r5_0, 1 do
    local r7_8 = 0
    local r8_8 = 0
    for r12_8 = 1, #r5_0[r6_8], 1 do
      r7_8 = r7_8 + r5_0[r6_8][r12_8]
      if r8_8 < r5_0[r6_8][r12_8] then
        r8_8 = r5_0[r6_8][r12_8]
      end
    end
    r2_8 = r2_8 .. r8_8 .. r9_0
    r7_0 = r7_0 .. r7_8 / #r5_0[r6_8] .. r9_0
  end
  r7_0 = r7_0 .. r8_0 .. "Max" .. r8_0 .. r2_8
  local r4_8 = io.open(UE4.UBlueprintPathsLibrary.ProjectLogDir() .. "/StatMonster" .. os.date("%Y.%m.%d-%H.%M.%S") .. ".txt", "w+")
  io.output(r4_8)
  io.write(r7_0)
  io.close(r4_8)
  r4_0 = nil
end
function r0_0.StatMem(r0_9, r1_9)
  -- line: [152, 165] id: 9
  assert(r1_9.Player, "缺少Player")
  r4_0 = r1_9.Player
  local r2_9 = 0
  r0_9:CreateMonster(function(r0_10)
    -- line: [157, 163] id: 10
    r0_9:AddMon(r0_10)
    r2_9 = r2_9 + 1
    if r2_9 == #r1_0 then
      r0_9:StatMemRecord()
    end
  end)
end
function r0_0.StatMemRecord(r0_11)
  -- line: [167, 190] id: 11
  r7_0 = ""
  for r4_11 = 1, #r2_0, 1 do
    r7_0 = r7_0 .. r2_0[r4_11].UnitId .. r8_0
    local r5_11 = r2_0[r4_11].CachePreloadData
    if r5_11 and not IsEmptyTable(r5_11) then
      for r9_11 = 1, #r5_11, 1 do
        r7_0 = r7_0 .. r5_11[r9_11] .. r8_0
      end
    else
      r7_0 = r7_0 .. "NULL" .. r8_0
    end
  end
  local r2_11 = io.open(UE4.UBlueprintPathsLibrary.ProjectLogDir() .. "/StatMonsterMem" .. os.date("%Y.%m.%d-%H.%M.%S") .. ".txt", "w+")
  io.output(r2_11)
  io.write(r7_0)
  io.close(r2_11)
  r4_0 = nil
end
return r0_0
