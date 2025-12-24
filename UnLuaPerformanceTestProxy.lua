-- filename: @C:/Pack/Branch/geili11\Content/Script/UnLuaPerformanceTestProxy.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class()
function r0_0.ReceiveBeginPlay(r0_1)
  -- line: [5, 204] id: 1
  local r1_1 = 1000000
  local r2_1 = 1000000000 / r1_1
  local r3_1 = r0_1.Object
  for r7_1 = 1, r1_1, 1 do
    r0_1:NOP()
  end
  local r4_1 = Seconds()
  for r8_1 = 1, r1_1, 1 do
    local r9_1 = r3_1.MeshID
  end
  local r6_1 = "read int32 ; " .. tostring((Seconds() - r4_1) * r2_1)
  r4_1 = Seconds()
  for r10_1 = 1, r1_1, 1 do
    r3_1.MeshID = r10_1
  end
  r6_1 = r6_1 .. "\n" .. "write int32 ; " .. tostring((Seconds() - r4_1) * r2_1)
  r4_1 = Seconds()
  for r10_1 = 1, r1_1, 1 do
    local r11_1 = r3_1.MeshName
  end
  r6_1 = r6_1 .. "\n" .. "read FString ; " .. tostring((Seconds() - r4_1) * r2_1)
  r4_1 = Seconds()
  for r10_1 = 1, r1_1, 1 do
    r3_1.MeshName = "9527"
  end
  r6_1 = r6_1 .. "\n" .. "write FString ; " .. tostring((Seconds() - r4_1) * r2_1)
  r4_1 = Seconds()
  for r10_1 = 1, r1_1, 1 do
    local r11_1 = r3_1.COM
  end
  r6_1 = r6_1 .. "\n" .. "read FVector ; " .. tostring((Seconds() - r4_1) * r2_1)
  local r7_1 = UE.FVector(1, 1, 1)
  r4_1 = Seconds()
  for r11_1 = 1, r1_1, 1 do
    r3_1.COM = r7_1
  end
  r6_1 = r6_1 .. "\n" .. "write FVector ; " .. tostring((Seconds() - r4_1) * r2_1)
  r4_1 = Seconds()
  for r11_1 = 1, r1_1, 1 do
    local r12_1 = r3_1.Positions
  end
  r6_1 = r6_1 .. "\n" .. "read TArray<FVector> ; " .. tostring((Seconds() - r4_1) * r2_1)
  local r8_1 = UE.TArray(UE.FVector)
  r4_1 = Seconds()
  for r12_1 = 1, r1_1, 1 do
    r3_1.PredictedPositions = r8_1
  end
  r6_1 = r6_1 .. "\n" .. "write TArray<FVector> ; " .. tostring((Seconds() - r4_1) * r2_1)
  r4_1 = Seconds()
  for r12_1 = 1, r1_1, 1 do
    r0_1:NOP()
  end
  r6_1 = r6_1 .. "\n" .. "void NOP() ; " .. tostring((Seconds() - r4_1) * r2_1)
  r4_1 = Seconds()
  for r12_1 = 1, r1_1, 1 do
    r0_1:Simulate(0.0167)
  end
  r6_1 = r6_1 .. "\n" .. "void Simulate(float) ; " .. tostring((Seconds() - r4_1) * r2_1)
  r4_1 = Seconds()
  for r12_1 = 1, r1_1, 1 do
    local r13_1 = r0_1:GetMeshID()
  end
  r6_1 = r6_1 .. "\n" .. "int32 GetMeshID() const ; " .. tostring((Seconds() - r4_1) * r2_1)
  r4_1 = Seconds()
  for r12_1 = 1, r1_1, 1 do
    local r13_1 = r0_1:GetMeshName()
  end
  r6_1 = r6_1 .. "\n" .. "const FString& GetMeshName() const ; " .. tostring((Seconds() - r4_1) * r2_1)
  r4_1 = Seconds()
  for r12_1 = 1, r1_1, 1 do
    r0_1:GetCOM(r7_1)
  end
  r6_1 = r6_1 .. "\n" .. "const FVector& GetCOM() const ; " .. tostring((Seconds() - r4_1) * r2_1)
  r4_1 = Seconds()
  for r12_1 = 1, r1_1, 1 do
    local r13_1 = r0_1:UpdateMeshID(1024)
  end
  r6_1 = r6_1 .. "\n" .. "int32 UpdateMeshID(int32) ; " .. tostring((Seconds() - r4_1) * r2_1)
  r4_1 = Seconds()
  for r12_1 = 1, r1_1, 1 do
    local r13_1 = r0_1:UpdateMeshName("1024")
  end
  r6_1 = r6_1 .. "\n" .. "FString UpdateMeshName(const FString&) ; " .. tostring((Seconds() - r4_1) * r2_1)
  local r9_1 = UE.FVector(1, 1, 1)
  local r10_1 = UE.FVector(1, 0, 0)
  r4_1 = Seconds()
  for r14_1 = 1, r1_1, 1 do
    local r15_1 = r0_1:Raycast(r9_1, r10_1)
  end
  r6_1 = r6_1 .. "\n" .. "bool Raycast(const FVector&, const FVector&) const ; " .. tostring((Seconds() - r4_1) * r2_1)
  local r11_1 = UE.TArray(0)
  r4_1 = Seconds()
  for r15_1 = 1, r1_1, 1 do
    r0_1:GetIndices(r11_1)
  end
  r6_1 = r6_1 .. "\n" .. "void GetIndices(TArray<int32>&) const ; " .. tostring((Seconds() - r4_1) * r2_1)
  for r15_1 = 1, 1024, 1 do
    r11_1:Add(r15_1)
  end
  r4_1 = Seconds()
  for r15_1 = 1, r1_1, 1 do
    r0_1:GetIndices(r11_1)
  end
  r6_1 = r6_1 .. "\n" .. "void GetIndices(TArray<int32>&) const with 1024 items ; " .. tostring((Seconds() - r4_1) * r2_1)
  r4_1 = Seconds()
  for r15_1 = 1, r1_1, 1 do
    r0_1:UpdateIndices(r11_1)
  end
  r6_1 = r6_1 .. "\n" .. "void UpdateIndices(const TArray<int32>&) ; " .. tostring((Seconds() - r4_1) * r2_1)
  local r12_1 = UE.TArray(UE.FVector)
  r4_1 = Seconds()
  for r16_1 = 1, r1_1, 1 do
    r0_1:GetPositions(r12_1)
  end
  r6_1 = r6_1 .. "\n" .. "void GetPositions(TArray<FVector>&) const ; " .. tostring((Seconds() - r4_1) * r2_1)
  for r16_1 = 1, 1024, 1 do
    r12_1:Add(UE.FVector(r16_1, r16_1, r16_1))
  end
  r4_1 = Seconds()
  for r16_1 = 1, r1_1, 1 do
    r0_1:GetPositions(r12_1)
  end
  r6_1 = r6_1 .. "\n" .. "void GetPositions(TArray<FVector>&) const with 1024 items ; " .. tostring((Seconds() - r4_1) * r2_1)
  r4_1 = Seconds()
  for r16_1 = 1, r1_1, 1 do
    r0_1:UpdatePositions(r12_1)
  end
  r6_1 = r6_1 .. "\n" .. "void UpdatePositions(const TArray<FVector>&) ; " .. tostring((Seconds() - r4_1) * r2_1)
  r4_1 = Seconds()
  for r16_1 = 1, r1_1, 1 do
    r0_1:GetPredictedPositions(r8_1)
  end
  r6_1 = r6_1 .. "\n" .. "const TArray<FVector>& GetPredictedPositions() const ; " .. tostring((Seconds() - r4_1) * r2_1)
  r4_1 = Seconds()
  for r16_1 = 1, r1_1, 1 do
    local r17_1, r18_1, r19_1 = r0_1:GetMeshInfo(0, "", r7_1, r11_1, r12_1, r8_1)
  end
  r6_1 = r6_1 .. "\n" .. "bool GetMeshInfo(int32&, FString&, FVector&, TArray<int32>&, TArray<FVector>&, TArray<FVector>&) const ; " .. tostring((Seconds() - r4_1) * r2_1)
  r4_1 = Seconds()
  for r16_1 = 1, r1_1, 1 do
    local r17_1 = UE.FHitResult()
  end
  LogPerformanceData(r6_1 .. "\n" .. "FHitResult() ; " .. tostring((Seconds() - r4_1) * r2_1))
end
return r0_0
