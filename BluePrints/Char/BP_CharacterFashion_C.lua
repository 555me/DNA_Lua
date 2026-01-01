-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Char\BP_CharacterFashion_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
require("Utils")
local r0_0 = Class("BluePrints.Common.FashionComponent_C")
function r0_0.EnableDrawMaterialCharacterRim(r0_1, r1_1)
  -- line: [200, 212] id: 1
  for r5_1 = 1, r0_1.AllMaterials:Length(), 1 do
    local r6_1 = r0_1.AllMaterials:GetRef(r5_1)
    if IsValid(r6_1) then
      if r1_1 then
        r6_1:SetScalarParameterValue("RimIntensity", 1)
      else
        r6_1:SetScalarParameterValue("RimIntensity", 0)
      end
    end
  end
end
function r0_0.ShowDamage(r0_2)
  -- line: [237, 247] id: 2
  if r0_2.AllMaterials:Length() > 0 then
    for r4_2 = 1, r0_2.AllMaterials:Length(), 1 do
      local r5_2 = r0_2.AllMaterials:GetRef(r4_2)
      if IsValid(r5_2) then
        r5_2:SetScalarParameterValue("StartTime_BeAttacked", UE4.UGameplayStatics.GetTimeSeconds(r0_2))
      end
    end
  end
end
function r0_0.ShowDissolve(r0_3, r1_3)
  -- line: [249, 259] id: 3
  for r5_3 = 1, r0_3.AllMaterials:Length(), 1 do
    local r6_3 = r0_3.AllMaterials:GetRef(r5_3)
    if IsValid(r6_3) then
      r6_3:SetScalarParameterValue("StartTime_Dissolve", UE4.UGameplayStatics.GetTimeSeconds(r0_3))
      r6_3:SetScalarParameterValue("Duration_Dissolve", r1_3)
      r6_3.NextPass = nil
    end
  end
end
function r0_0.GetPartMesh(r0_4, r1_4)
  -- line: [282, 292] id: 4
  local r2_4 = r0_4:GetOwner()
  if r1_4 == "Horn" then
    local r3_4 = TArray(USkeletalMeshComponent)
    r3_4:Add(r2_4.Mesh)
    return r3_4
  end
  if r2_4.SuitMeshComponentsMap then
    return r2_4.SuitMeshComponentsMap:FindRef(r1_4)
  end
end
function r0_0.ColletctPartMeshIds(r0_5, r1_5, r2_5)
  -- line: [294, 307] id: 5
  if not r1_5 then
    return 
  end
  local r3_5 = r1_5.AccessorySuit and {}
  local r4_5, r5_5 = r0_5:GetOwnerPartMeshInfo(r1_5.SkinId)
  table.insert(r2_5, r4_5)
  for r10_5, r11_5 in pairs(CommonConst.NewCharAccessoryTypes) do
    local r12_5 = r3_5[r11_5]
    if r12_5 and r12_5 ~= r4_5 then
      table.insert(r2_5, r12_5)
    end
  end
  -- close: r6_5
end
function r0_0.InitAppearanceSuit(r0_6, r1_6)
  -- line: [309, 347] id: 6
  rawset(r0_6, "AppearanceSuitInfo", r1_6)
  rawset(r0_6, "Type2Id", rawget(r0_6, "Type2Id") and TMap(FName, 0))
  r0_6:InitWeaponColor(r1_6.Colors)
  if not r1_6 then
    return 
  end
  local r2_6 = r0_6:GetOwner()
  if not r2_6 then
    return 
  end
  if r2_6.ChangeSkinModel then
    r2_6:ChangeSkinModel(r1_6.SkinId)
  end
  r0_6:InitSkinColors(r1_6.Colors)
  local r3_6 = r1_6.AccessorySuit and {}
  local r4_6, r5_6 = r0_6:GetOwnerPartMeshInfo(r2_6.CurrentSkinId)
  local r6_6 = r1_6.IsShowPartMesh
  if r6_6 == nil then
    r6_6 = true and r1_6.IsShowPartMesh
  else
    goto label_53	-- block#12 is visited secondly
  end
  for r11_6, r12_6 in pairs(CommonConst.NewCharAccessoryTypes) do
    local r13_6 = r3_6[r12_6] and -1
    if r5_6 == r11_6 and r13_6 > 0 and r13_6 ~= r4_6 then
      r6_6 = false
    end
    r0_6:ChangeAccessory(r13_6, r11_6)
  end
  -- close: r7_6
  if r2_6.PartsMesh then
    r2_6.PartsMesh:SetVisibility(r6_6, false)
  end
  if r2_6.InfoForInit then
    r0_6:GradeUpEmissive(r2_6.InfoForInit.GradeLevel)
  end
end
function r0_0.InitWeaponColor(r0_7, r1_7)
  -- line: [349, 370] id: 7
  local r2_7 = DataMgr.Swatch
  local r3_7 = nil
  r0_7.WeaponColor = nil
  local r4_7 = FLinearColor()
  if r1_7 then
    r3_7 = r2_7[r1_7[#r1_7]]
    if r3_7 then
      r0_7.bHasWeaponColor = true
      if r3_7.ActualR and r3_7.ActualG and r3_7.ActualB then
        r4_7 = FLinearColor(r3_7.ActualR, r3_7.ActualG, r3_7.ActualB)
        r0_7.WeaponColor = r4_7
      elseif r3_7.ColorNumber then
        local r5_7 = UKismetMathLibrary.LinearColor_SetFromSRGB
        local r6_7 = r4_7
        local r7_7 = FColor
        local r8_7 = r3_7.ColorNumber[1] and 0
        local r9_7 = r3_7.ColorNumber[2] and 0
        r5_7(r6_7, r7_7(r8_7, r9_7, r3_7.ColorNumber[3] and 0))
        r0_7.WeaponColor = r4_7
      end
    else
      r0_7.bHasWeaponColor = false
    end
  end
end
function r0_0.InitColorsWithInfo(r0_8)
  -- line: [372, 384] id: 8
  if not r0_8.AppearanceSuitInfo then
    return 
  end
  local r1_8 = r0_8.AppearanceSuitInfo.Colors
  if not r1_8 then
    return 
  end
  r0_8:InitSkinColors(r1_8)
end
function r0_0.InitSkinColors(r0_9, r1_9)
  -- line: [386, 412] id: 9
  if not r1_9 then
    return 
  end
  local r2_9 = DataMgr.Swatch
  local r3_9 = FLinearColor()
  for r7_9 = 1, #r1_9 + -1, 1 do
    local r9_9 = r7_9
    local r10_9 = r2_9[r1_9[r7_9]]
    if r10_9 then
      if r10_9.ActualR and r10_9.ActualG and r10_9.ActualB then
        r3_9 = FLinearColor(r10_9.ActualR, r10_9.ActualG, r10_9.ActualB)
        r0_9:ChangePartColor(r9_9, r3_9, r10_9.Fresnel)
      elseif r10_9.ColorNumber then
        local r11_9 = r10_9.ColorNumber
        local r12_9 = UKismetMathLibrary.LinearColor_SetFromSRGB
        local r13_9 = r3_9
        local r14_9 = FColor
        local r15_9 = r11_9[1] and 0
        local r16_9 = r11_9[2] and 0
        r12_9(r13_9, r14_9(r15_9, r16_9, r11_9[3] and 0))
        r0_9:ChangePartColor(r9_9, r3_9, r10_9.Fresnel)
      end
    end
  end
end
function r0_0.ChangePartColor(r0_10, r1_10, r2_10, r3_10)
  -- line: [421, 427] id: 10
  local r5_10 = r0_10["SetCharTintColor" .. r1_10]
  if r5_10 then
    r5_10(r0_10, r2_10, r3_10)
  end
end
local function r1_0(r0_11, r1_11)
  -- line: [429, 433] id: 11
  r0_11.Type2Id:Remove(r1_11)
  r0_11:ResetSuitAccessoryType()
  r0_11:UpdateSuitAccessoryType2Id(r0_11.Type2Id)
end
local function r2_0(r0_12, r1_12, r2_12)
  -- line: [435, 439] id: 12
  r0_12.Type2Id:Add(r1_12, r2_12)
  r0_12:ResetSuitAccessoryType()
  r0_12:UpdateSuitAccessoryType2Id(r0_12.Type2Id)
end
local r3_0 = {
  [CommonConst.CharAccessoryTypes.FX_Body] = "UpdateFxBody",
  [CommonConst.CharAccessoryTypes.FX_Footprint] = "UpdateFxFoot",
}
function r0_0.ChangeAccessory(r0_13, r1_13, r2_13)
  -- line: [446, 522] id: 13
  if not r1_13 then
    r1_13 = -1
  end
  if CommonConst.ActionAccessoryTypes[r2_13] then
    r1_0(r0_13, r2_13)
    if DataMgr.CharAccessory[r1_13] then
      r2_0(r0_13, r2_13, r1_13)
    end
    return 
  end
  local r3_13 = r0_13:GetOwner()
  r3_13:DetachSuitItem(r2_13)
  local r5_13 = DataMgr.CharAccessory[r0_13.Type2Id:Find(r2_13)]
  if r5_13 and r5_13.IsTail and r3_13.TailMesh then
    r3_13.TailMesh:SetVisibility(true, false)
  end
  r1_0(r0_13, r2_13)
  local r6_13, r7_13 = r0_13:GetOwnerPartMeshInfo()
  if r1_13 == DataMgr.GlobalConstant.EmptyCharAccessoryID.ConstantValue or r1_13 <= 0 then
    if r7_13 and r7_13 == r2_13 then
      r3_13.PartsMesh:SetVisibility(false, false)
    end
    if r3_0[r2_13] and r0_13[r3_0[r2_13]] then
      r0_13[r3_0[r2_13]](r0_13, false)
    end
    return 
  end
  local r8_13 = DataMgr.CharAccessory[r1_13]
  if r8_13 == nil or r1_13 <= 0 or r6_13 == r1_13 then
    if r8_13 == nil and DataMgr.CharPartMesh[r1_13] then
      r3_13.PartsMesh:SetVisibility(true, false)
    end
    return 
  end
  r2_0(r0_13, r2_13, r1_13)
  if r3_0[r2_13] and r0_13[r3_0[r2_13]] then
    r0_13[r3_0[r2_13]](r0_13, not not r8_13.CreatureId)
  end
  if r8_13.IsTail and r3_13.TailMesh then
    r3_13.TailMesh:SetVisibility(false, false)
  end
  if r8_13.CreatureId then
    return 
  end
  local r9_13 = r3_13.ModelId
  local r10_13 = TArray(FString)
  local r11_13 = TArray(FName)
  local r12_13 = TArray(FName)
  local r13_13 = TArray(FString)
  local r14_13 = TArray(FTransform)
  local r15_13 = TArray(0)
  r0_13:AddAccessoryParameter(r1_13, r10_13, r11_13, r14_13, r12_13, r13_13, r9_13, r15_13)
  if r8_13.ChildAccessory then
    for r20_13, r21_13 in ipairs(r8_13.ChildAccessory) do
      r0_13:AddAccessoryParameter(r21_13, r10_13, r11_13, r14_13, r12_13, r13_13, r9_13, r15_13)
    end
    -- close: r16_13
  end
  if r7_13 and r7_13 == r2_13 then
    r3_13.PartsMesh:SetVisibility(false, false)
  end
  r3_13:AttachSuitItems(r8_13.AccessoryType, r10_13, r11_13, r14_13, r13_13, r12_13, r15_13)
  r0_13:ChangePartLook(r2_13, r8_13.ChangeColor and 1)
end
function r0_0.GetOwnerPartMeshInfo(r0_14, r1_14)
  -- line: [524, 540] id: 14
  local r2_14 = r0_14:GetOwner()
  local r3_14 = r1_14 and r2_14 and r2_14.CurrentRoleId
  if not r3_14 then
    return 
  end
  for r8_14, r9_14 in pairs(DataMgr.CharPartMesh) do
    if r9_14.PartName == "PartMesh" then
      for r15_14, r16_14 in pairs(r9_14.Skin and {}) do
        if r16_14 == r3_14 then
          return r8_14, r9_14.AccessoryType
        end
      end
      -- close: r11_14
    end
  end
  -- close: r4_14
end
function r0_0.AddAccessoryParameter(r0_15, r1_15, r2_15, r3_15, r4_15, r5_15, r6_15, r7_15, r8_15)
  -- line: [542, 578] id: 15
  local r9_15 = DataMgr.CharAccessory[r1_15]
  if not r9_15 then
    return 
  end
  local r11_15 = r9_15.AccessorySocket
  r2_15:Add(r9_15.ModelPath)
  r3_15:Add(r11_15)
  local r12_15 = DataMgr.Model[r7_15] and {}
  local r13_15 = r12_15.CharAccessoryOffsetId
  if r13_15 then
    r13_15 = r12_15.CharAccessoryOffsetId[1] and r7_15
  else
    goto label_28	-- block#6 is visited secondly
  end
  local r14_15 = DataMgr.CharAccessoryOffset[r13_15]
  if r14_15 then
    r14_15 = r14_15.OffsetParameter and {}
  else
    goto label_37	-- block#9 is visited secondly
  end
  local r15_15 = nil
  for r20_15, r21_15 in pairs(r14_15) do
    for r26_15, r27_15 in pairs(r21_15) do
      if r26_15 == r9_15.AccessorySocket then
        r15_15 = CommonUtils:DataToFTransform(r27_15)
        r4_15:Add(r15_15)
        break
      end
    end
    -- close: r22_15
  end
  -- close: r16_15
  if not r15_15 then
    r4_15:Add(FTransform())
  end
  if r9_15.NiagaraPath then
    r6_15:Add(r9_15.NiagaraPath)
  end
  if r9_15.AccessorySocket then
    r5_15:Add(r9_15.SocketName)
  end
  if r9_15.VisualEffectId then
    r8_15:Add(r9_15.VisualEffectId)
  end
end
return r0_0
