-- filename: @C:/Pack/Branch/geili11\Content/Script/StatLevel.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {}
local r1_0 = nil
local r2_0 = {}
local r3_0 = {}
local r4_0 = 5
local r5_0 = ""
local r6_0 = "\n"
local r7_0 = ","
local r8_0 = LoadClass("/Game/BluePrints/Scene/BP_GridFrame.BP_GridFrame")
local r9_0 = nil
r0_0.BeginStat = false
function r0_0.Stat(r0_1, r1_1)
  -- line: [17, 24] id: 1
  r0_1.BeginStat = not r0_1.BeginStat
  if r0_1.BeginStat then
    r0_1:StatStart(r1_1)
  else
    r0_1:StatEnd(r1_1)
  end
end
ToString = function(r0_2, r1_2)
  -- line: [26, 67] id: 2
  if not r1_2 then
    r1_2 = 1
  end
  if type(r0_2) ~= "table" then
    return tostring(r0_2)
  end
  if r1_2 >= 10 then
    return tostring(r0_2)
  end
  local function r3_2(r0_3)
    -- line: [37, 43] id: 3
    local r1_3 = {}
    for r5_3 = 1, r0_3 * 4, 1 do
      table.insert(r1_3, " ")
    end
    return table.concat(r1_3)
  end
  local r4_2 = {}
  table.insert(r4_2, "{\n")
  local r5_2 = r3_2(r1_2)
  for r10_2, r11_2 in pairs(r0_2) do
    table.insert(r4_2, r5_2)
    local r12_2 = type(r10_2) == "number"
    if r12_2 then
      table.insert(r4_2, "[")
    end
    table.insert(r4_2, ToString(r10_2, r1_2 + 1))
    if r12_2 then
      table.insert(r4_2, "]")
    end
    table.insert(r4_2, " = ")
    table.insert(r4_2, ToString(r11_2, r1_2 + 1))
    table.insert(r4_2, "\n")
  end
  -- close: r6_2
  table.insert(r4_2, r3_2(r1_2 + -1))
  table.insert(r4_2, "}")
  return table.concat(r4_2)
end
function r0_0.StatStart(r0_4, r1_4)
  -- line: [69, 79] id: 4
  assert(r1_4.Player, "缺少Player")
  r0_4.Player = r1_4.Player
  r0_4.GM = r1_4
  r0_4:GetPositionMap()
  UE4.UKismetSystemLibrary.ExecuteConsoleCommand(r0_4.Player, "stat unit", r0_4.Player:GetController())
  r0_4.PointCount = 0
  r0_4.TravelNext(r0_4)
end
function r0_0.TraceNext(r0_5, r1_5, r2_5, r3_5)
  -- line: [81, 130] id: 5
  local r4_5 = 1
  local r5_5 = r2_5 - r1_5 + FVector(0, 0, 1) * r1_5.Z * 2 + FVector(1, 0, 0) * 1000 * r3_5 + FVector(0, 1, 0) * 1000 * r4_5
  if not UE4.UKismetMathLibrary.IsPointInBox(r5_5, r2_5, r1_5) then
    return 
  end
  while UE4.UKismetMathLibrary.IsPointInBox(r5_5, r2_5, r1_5) do
    local r6_5 = FVector(0, 0, 1)
    r6_5 = r5_5 - r6_5 * r1_5.Z * 2
    local r7_5 = TArray(AActor)
    local r8_5 = TArray(FHitResult)
    UE4.UKismetSystemLibrary.LineTraceMulti(r0_5.Player, r5_5, r6_5, UE4.ETraceTypeQuery.TraceOverlap, false, r7_5, 1, r8_5, true)
    local r9_5 = nil
    local r10_5 = false
    for r15_5, r16_5 in pairs(r8_5) do
      local r17_5 = UE4.UKismetMathLibrary.EqualEqual_ClassClass(r16_5.Actor:GetClass(), AStaticMeshActor:StaticClass())
      local r18_5 = UE4.UKismetMathLibrary.EqualEqual_ClassClass(r16_5.Actor:GetClass(), ALandscape:StaticClass())
      if r16_5.ImpactNormal.Z == 1 and (r17_5 or r18_5) then
        if not r9_5 then
          r9_5 = r16_5.ImpactPoint.Z - r0_5.Player.CapsuleComponent:GetUnscaledCapsuleHalfHeight() * 2 + 4
        end
        local r20_5 = r0_5.Player.CapsuleComponent:GetUnscaledCapsuleHalfHeight() * 2 < math.abs(r16_5.ImpactPoint.Z - r9_5)
        r9_5 = r16_5.ImpactPoint.Z
        local r21_5 = FFindFloorResult()
        r0_5.Player:GetMovementComponent():K2_FindFloor(FVector(r16_5.ImpactPoint.X, r16_5.ImpactPoint.Y, r16_5.ImpactPoint.Z) + FVector(0, 0, 1) * (r0_5.Player.CapsuleComponent:GetUnscaledCapsuleHalfHeight() + -2), r21_5)
        if r20_5 and r21_5.bWalkableFloor then
          if r10_5 then
            print(_G.LogTag, "77777", r15_5, r16_5.ImpactPoint, UE4.UKismetSystemLibrary.GetDisplayName(r16_5.Actor), r21_5.bWalkableFloor, r21_5.bBlockingHit)
            table.insert(r3_0, FVector(r16_5.ImpactPoint.X, r16_5.ImpactPoint.Y, r16_5.ImpactPoint.Z))
          end
          if not r10_5 then
            r10_5 = true
          end
        end
      end
    end
    -- close: r11_5
    r4_5 = r4_5 + 1
    r5_5 = r2_5 - r1_5 + FVector(0, 0, 1) * r1_5.Z * 2 + FVector(1, 0, 0) * 1000 * r3_5 + FVector(0, 1, 0) * 1000 * r4_5
  end
  r0_5:TraceNext(r1_5, r2_5, r3_5 + 1)
end
function r0_0.GetPositionMap(r0_6)
  -- line: [132, 149] id: 6
  local r1_6 = UE4.UGameplayStatics.GetActorOfClass(r0_6.Player, r8_0)
  if not r1_6 then
    DebugPrint("当前关卡并可非拼接子关卡   ", UE4.UGameplayStatics.GetCurrentLevelName(r0_6.Player))
    return 
  end
  r0_6:TraceNext(r1_6:GetActorScale3D() * 100 / 2, r1_6:K2_GetActorLocation(), 1)
  print(_G.LogTag, "111111111111111111111111111111", #r3_0)
  print(_G.LogTag, "111111111", ToString(r3_0))
end
function r0_0.TravelNext(r0_7)
  -- line: [151, 171] id: 7
  r0_7.PointCount = r0_7.PointCount + 1
  if #r3_0 < r0_7.PointCount then
    print(_G.LogTag, "Point Scan Over")
    r0_7:StatEnd(r0_7.GM)
    return 
  end
  r0_7.Player:AddGravityModifier(UE4.EGravityModifierTag.AnimNotify, 0)
  local r1_7 = r3_0[r0_7.PointCount]
  print(_G.LogTag, "get one Point ", r0_7.PointCount, r3_0[r0_7.PointCount])
  local r2_7 = FVector(r1_7.X, r1_7.Y, r1_7.Z) + FVector(0, 0, 1) * (r0_7.Player.CapsuleComponent:GetUnscaledCapsuleHalfHeight() + -2)
  local r3_7 = FFindFloorResult()
  r0_7.Player:GetMovementComponent():K2_FindFloor(r2_7, r3_7)
  print(_G.LogTag, "Start New Poin", r0_7.PointCount, r2_7, r3_7.bBlockingHit, r3_7.bWalkableFloor)
  r0_7.Player:K2_SetActorLocation(r2_7, false, nil, false)
  r0_7.RotCount = 0
  r0_7.InitialForward = FVector(1, 0, 0)
  r0_0.RotateCamera(nil, r0_7)
end
function r0_0.RotateCamera(r0_8, r1_8)
  -- line: [173, 191] id: 8
  local r2_8 = r1_8.Player:GetController()
  local r4_8 = UE4.UKismetMathLibrary.GreaterGreater_VectorRotator(r1_8.InitialForward, FRotator(0, r1_8.RotCount * 90, 0)):ToRotator()
  r4_8.Pitch = 15
  r1_8.RotCount = r1_8.RotCount + 1
  r2_8:SetControlRotation(r4_8)
  if r1_8.RotCount > 4 then
    print("One Point Rot Done")
    r1_8:TravelNext()
    return 
  end
  print(_G.LogTag, "Start New Rot", r4_8)
  r1_8.Player:AddTimer(1, r0_0.RecordInfo, false, 0, "Test_StatLevelRecorder", false, r1_8)
  r1_8.Player:AddTimer(2, r0_0.RotateCamera, false, 0, "Test_StatLevelTimer", false, r1_8)
end
function r0_0.RecordInfo(r0_9, r1_9)
  -- line: [193, 215] id: 9
  local r2_9 = UE4.URuntimeCommonFunctionLibrary.GetStatUnitData(r1_9.Player)
  local r3_9 = r1_9.Player:K2_GetActorLocation()
  local r5_9 = r1_9.Player:GetController():GetControllerForwardOrRight(true)
  local r6_9 = {
    Position = {},
  }
  r6_9.Position.X = r3_9.X
  r6_9.Position.Y = r3_9.Y
  r6_9.Position.Z = r3_9.Z
  r6_9.Forward = {}
  r6_9.Forward.X = r5_9.X
  r6_9.Forward.Y = r5_9.Y
  r6_9.Forward.Z = r5_9.Z
  r6_9.FrameTime = r2_9.FrameTime
  r6_9.GameThreadTime = r2_9.GameThreadTime
  r6_9.RenderThreadTime = r2_9.RenderThreadTime
  r6_9.GPUFrameTime = r2_9.GPUFrameTime
  r6_9.NumDrawCalls = r2_9.NumDrawCalls
  r6_9.NumPrimitives = r2_9.NumPrimitives
  table.insert(r2_0, r6_9)
  print(_G.LogTag, "hhhhhhhhhhhhhhhhhhhhhhhhhh one imformation recorded")
end
function r0_0.StatEnd(r0_10, r1_10)
  -- line: [217, 263] id: 10
  assert(r1_10.Player, "缺少Player")
  print("Scan Done")
  r1_10.Player:RemoveTimer("Test_StatLevelTimer")
  r1_10.Player:RemoveTimer("Test_StatLevelRecorder")
  print(_G.LogTag, "11111111111111111111111", ToString(r2_0))
  local r2_10 = 0
  local r3_10 = {}
  local r4_10 = 0
  local r5_10 = {}
  for r10_10, r11_10 in pairs(r2_0) do
    if r2_10 < r11_10.FrameTime then
      r2_10 = r11_10.FrameTime
      r3_10 = r11_10
    end
    if r4_10 < r11_10.NumDrawCalls then
      r4_10 = r11_10.NumDrawCalls
      r5_10 = r11_10
    end
  end
  -- close: r6_10
  local r7_10 = io.open(UE4.UBlueprintPathsLibrary.ProjectLogDir() .. "/StatLevel_" .. UE4.UGameplayStatics.GetCurrentLevelName(r1_10.Player) .. "_" .. os.date("%Y.%m.%d-%H.%M.%S") .. ".txt", "w+")
  io.output(r7_10)
  io.write("All Record Info = " .. ToString(r2_0) .. "," .. "\n" .. "MaxFrameTimeRecord = " .. ToString(r3_10) .. "," .. "\n" .. "MaxDrawCallsRecord = " .. ToString(r5_10))
  io.close(r7_10)
  UE4.UKismetSystemLibrary.ExecuteConsoleCommand(r0_10.Player, "stat unit", r0_10.Player:GetController())
end
return r0_0
