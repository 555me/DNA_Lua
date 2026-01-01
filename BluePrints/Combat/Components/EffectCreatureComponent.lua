-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Combat\Components\EffectCreatureComponent.lua
-- version: lua54
-- line: [0, 0] id: 0
return {
  InitEffectCreatureComponent = function(r0_1)
    -- line: [3, 13] id: 1
    if not r0_1.EffectCreatures then
      r0_1.EffectCreatures = {}
    end
    if not r0_1.EffectRecyclePool then
      r0_1.EffectRecyclePool = {}
    end
    if not r0_1.AsyncEffectCreatures then
      r0_1.AsyncEffectCreatures = {}
    end
  end,
  GetReplaceEffectCreatureIdBySkinId = function(r0_2, r1_2, r2_2)
    -- line: [15, 29] id: 2
    local r3_2 = DataMgr.EffectCreature[r1_2]
    if r3_2 and r3_2.ReplaceBySkin then
      if r2_2 and r2_2 ~= 0 then
        local r4_2 = Battle(r0_2):GetEntity(r2_2)
        if r4_2 and r4_2:IsCharacter() then
          local r5_2 = r4_2.ModelId
          return r5_2 and r3_2.ReplaceBySkin[r5_2]
        end
      else
        local r4_2 = r0_2.ModelId
        return r4_2 and r3_2.ReplaceBySkin[r4_2]
      end
    end
  end,
  AsyncCreateEffectCreatureById = function(r0_3, r1_3, r2_3)
    -- line: [31, 131] id: 3
    local r3_3 = nil
    local r4_3 = r2_3.AttachToCharacter
    local r5_3 = r2_3.Transform
    local r6_3 = r2_3.LoadFinishCallBack
    local r7_3 = r2_3.SocketName
    local r8_3 = r2_3.SkillSpeed
    local r10_3 = r0_3:GetReplaceEffectCreatureIdBySkinId(r1_3, r2_3.SourceEid)
    local r11_3 = r0_3.SumDeltaSeconds
    local r12_3 = r10_3 and r1_3
    local r13_3 = r0_3.EffectRecyclePool[r12_3]
    if r13_3 then
      r13_3 = #r0_3.EffectRecyclePool[r12_3]
      if r13_3 > 0 then
        r13_3 = #r0_3.EffectRecyclePool[r12_3]
        r3_3 = r0_3.EffectRecyclePool[r12_3][r13_3]
        r3_3.LoadTime = r11_3
        r3_3.SkillSpeed = r8_3
        if r3_3.ReplaceSkinEffectCreatureId ~= r10_3 then
          r3_3.ReplaceSkinEffectCreatureId = r10_3
          r3_3:LoadEffectCreatureResource()
        else
          r3_3:Active()
        end
        r0_3.EffectRecyclePool[r12_3][r13_3] = nil
        if not r4_3 then
          r3_3:K2_SetActorLocation(r5_3.Translation, false, nil, false)
          r3_3:K2_SetActorRotation(r5_3.Rotation:ToRotator(), false, nil, false)
          r3_3:SetActorScale3D(r5_3.Scale3D)
        end
        if r6_3 then
          r6_3(r3_3)
        end
        if r3_3 and not r3_3.IsDestroy then
          r0_3:AddOrRemoveEffectCreature(r3_3, true)
          r3_3:PlaySe()
          if r3_3.LoadMeshCallBack then
            r3_3.LoadMeshCallBack()
          end
          r3_3:LoadEffectCreatureResource()
          r3_3.Overridden.ReceiveBeginPlay(r3_3)
        end
      end
    else
      if r10_3 then
        r13_3 = DataMgr.EffectCreature[r10_3] and DataMgr.EffectCreature[r1_3]
      else
        goto label_98	-- block#18 is visited secondly
      end
      local r14_3 = r13_3.EffectCreaturePath and "/Game/BluePrints/Combat/SkillCreatures/BP_EffectCreature.BP_EffectCreature"
      if not r0_3.AsyncEffectCreatures[r1_3] then
        r0_3.AsyncEffectCreatures[r1_3] = {}
      end
      r0_3.AsyncEffectCreatures[r1_3][r2_3] = true
      UE4.UResourceLibrary.LoadClassAsync(r0_3, r14_3, {
        r0_3,
        function(r0_4, r1_4)
          -- line: [78, 129] id: 4
          if not IsValid(r0_4) then
            return 
          end
          if not r0_4.AsyncEffectCreatures[r1_3] then
            return 
          end
          if not r0_4.AsyncEffectCreatures[r1_3][r2_3] then
            return 
          end
          r0_4.AsyncEffectCreatures[r1_3][r2_3] = nil
          if not r1_4 then
            DebugPrint("特效创生物路径为空" .. r14_3)
            return 
          end
          if not r4_3 then
            r3_3 = r0_4:GetWorld():SpawnActor(r1_4, r5_3, UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn)
          else
            local r2_4 = nil
            if r7_3 and r7_3 ~= nil and r0_4.Mesh:GetSocketBoneName(r7_3) ~= "None" then
              r2_4 = r0_4.Mesh:GetSocketTransform(r7_3, UE4.ERelativeTransformSpace.RTS_World)
            else
              r2_4 = FTransform(r0_4:K2_GetActorRotation():ToQuat(), r0_4:K2_GetActorLocation(), r0_4:GetActorScale3D())
            end
            r3_3 = r0_4:GetWorld():SpawnActor(r1_4)
            local r3_4 = r13_3.NotScaledByParent
            if r3_4 then
              r3_4 = UE4.EAttachmentRule.KeepWorld and UE4.EAttachmentRule.SnapToTarget
            else
              goto label_94	-- block#17 is visited secondly
            end
            if r0_4.Mesh then
              r3_3:K2_AttachToComponent(r0_4.Mesh, r7_3, UE4.EAttachmentRule.SnapToTarget, UE4.EAttachmentRule.SnapToTarget, r3_4)
            else
              r3_3:K2_AttachToActor(r0_4, "", UE4.EAttachmentRule.SnapToTarget, UE4.EAttachmentRule.SnapToTarget, r3_4)
            end
            r3_3.CustomTimeDilation = r0_4.CustomTimeDilation
            if r5_3 and (r5_3.Translation ~= Const.ZeroVector or r5_3.Rotation:ToRotator() ~= Const.ZeroRotator or r5_3.Scale3D ~= Const.ZeroVector) then
              r3_3:K2_AddActorLocalTransform(r5_3, false, nil, false)
            end
          end
          r3_3:SetOwner(r0_4)
          r3_3.LoadTime = r11_3
          r3_3.SkillSpeed = r8_3
          r3_3.EffectCreatureId = r1_3
          r3_3.ReplaceSkinEffectCreatureId = r10_3
          r0_4:HideEffectCreatureByTags(r3_3)
          if r6_3 then
            r6_3(r3_3)
          end
          if r3_3 and not r3_3.IsDestroy then
            r0_4:AddOrRemoveEffectCreature(r3_3, true)
            r3_3:PlaySe()
            r3_3:LoadEffectCreatureResource()
            r3_3.Overridden.ReceiveBeginPlay(r3_3)
          end
        end
      })
      -- close: r13_3
    end
  end,
  CreateEffectCreatureById = function(r0_5, r1_5, r2_5)
    -- line: [133, 207] id: 5
    local r3_5 = nil
    local r4_5 = r2_5.Transform
    local r5_5 = r2_5.AttachToCharacter
    local r6_5 = r2_5.SocketName
    local r7_5 = r2_5.SkillSpeed
    local r9_5 = r0_5:GetReplaceEffectCreatureIdBySkinId(r1_5, r2_5.SourceEid)
    local r10_5 = r9_5 and r1_5
    local r11_5 = r0_5.EffectRecyclePool[r10_5]
    if r11_5 then
      r11_5 = #r0_5.EffectRecyclePool[r10_5]
      if r11_5 > 0 then
        r11_5 = #r0_5.EffectRecyclePool[r10_5]
        r3_5 = r0_5.EffectRecyclePool[r10_5][r11_5]
        r3_5.LoadTime = r0_5.SumDeltaSeconds
        r3_5.SkillSpeed = r7_5
        if r3_5.ReplaceSkinEffectCreatureId ~= r9_5 then
          r3_5.ReplaceSkinEffectCreatureId = r9_5
          r3_5:LoadEffectCreatureResource()
        else
          r3_5:Active()
        end
        r0_5.EffectRecyclePool[r10_5][r11_5] = nil
        if not r5_5 then
          r3_5:K2_SetActorLocation(r4_5.Translation, false, nil, false)
          r3_5:K2_SetActorRotation(r4_5.Rotation:ToRotator(), false, nil, false)
          r3_5:SetActorScale3D(r4_5.Scale3D)
        end
        r0_5:AddOrRemoveEffectCreature(r3_5, true)
        r3_5:PlaySe()
      end
    else
      if r9_5 then
        r11_5 = DataMgr.EffectCreature[r9_5] and DataMgr.EffectCreature[r1_5]
      else
        goto label_76	-- block#12 is visited secondly
      end
      local r12_5 = r11_5.EffectCreaturePath and "/Game/BluePrints/Combat/SkillCreatures/BP_EffectCreature.BP_EffectCreature"
      local r13_5 = LoadClass(r12_5)
      if not r13_5 then
        DebugPrint("特效创生物路径为空" .. r12_5)
        return 
      end
      if not r5_5 then
        r3_5 = r0_5:GetWorld():SpawnActor(r13_5, r4_5, UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn)
      else
        local r14_5 = nil
        if r0_5.Mesh and r0_5.Mesh:GetSocketBoneName(r6_5) ~= "None" then
          r14_5 = r0_5.Mesh:GetSocketTransform(r6_5, UE4.ERelativeTransformSpace.RTS_World)
        else
          r14_5 = FTransform(r0_5:K2_GetActorRotation():ToQuat(), r0_5:K2_GetActorLocation(), r0_5:GetActorScale3D())
        end
        r3_5 = r0_5:GetWorld():SpawnActor(r13_5)
        local r15_5 = r11_5.NotScaledByParent
        if r15_5 then
          r15_5 = UE4.EAttachmentRule.KeepWorld and UE4.EAttachmentRule.SnapToTarget
        else
          goto label_151	-- block#25 is visited secondly
        end
        if r0_5.Mesh then
          r3_5:K2_AttachToComponent(r0_5.Mesh, r6_5, UE4.EAttachmentRule.SnapToTarget, UE4.EAttachmentRule.SnapToTarget, r15_5)
        else
          r3_5:K2_AttachToActor(r0_5, "", UE4.EAttachmentRule.SnapToTarget, UE4.EAttachmentRule.SnapToTarget, r15_5)
        end
        r3_5.CustomTimeDilation = r0_5.CustomTimeDilation
        if r4_5 and (r4_5.Translation ~= Const.ZeroVector or r4_5.Rotation:ToRotator() ~= Const.ZeroRotator or r4_5.Scale3D ~= Const.ZeroVector) then
          r3_5:K2_AddActorLocalTransform(r4_5, false, nil, false)
        end
      end
      r3_5.LoadTime = r0_5.SumDeltaSeconds
      r3_5.SkillSpeed = r7_5
      r3_5.ReplaceSkinEffectCreatureId = r9_5
      r3_5:SetOwner(r0_5)
      r3_5.EffectCreatureId = r1_5
      r0_5:HideEffectCreatureByTags(r3_5)
      r3_5:LoadEffectCreatureResource()
      r0_5:AddOrRemoveEffectCreature(r3_5, true)
      r3_5:PlaySe()
    end
    if r3_5.InitialLifeSpan == 0 then
      if not r0_5.EffectCreatures[r1_5] then
        r0_5.EffectCreatures[r1_5] = {}
      end
      table.insert(r0_5.EffectCreatures[r1_5], r3_5)
    end
    return r3_5
  end,
  AsyncCreateEffectCreatureWithCallBack = function(r0_6, r1_6, r2_6, r3_6, r4_6, r5_6)
    -- line: [209, 237] id: 6
    r0_6:InitEffectCreatureComponent()
    if r1_6 == 0 then
      return 
    end
    local r6_6 = DataMgr.EffectCreature[r1_6]
    if not r4_6 or r4_6 == "" or not r4_6 then
      r4_6 = r6_6.SocketName and "root"
    end
    if not r0_6.EffectCreatures[r1_6] then
      r0_6.EffectCreatures[r1_6] = {}
    end
    local function r7_6(r0_7)
      -- line: [219, 224] id: 7
      if r0_7.InitialLifeSpan == 0 then
        table.insert(r0_6.EffectCreatures[r1_6], r0_7)
      end
      r5_6:Execute(r0_7)
    end
    local r8_6 = r0_6:IsCharacter() and r0_6:GetCurrentSkill()
    local r9_6 = r8_6 and r8_6.Data
    local r10_6 = r9_6 and r9_6.SkillSpeedModify
    local r11_6 = nil	-- notice: implicit variable refs by block#[18]
    if r10_6 then
      r11_6 = r0_6:GetCurrentSkillNodeSpeed()
      if not r11_6 then
        ::label_45::
        r11_6 = 1
      end
    else
      goto label_45	-- block#17 is visited secondly
    end
    r0_6:AsyncCreateEffectCreatureById(r1_6, {
      Transform = r2_6,
      AttachToCharacter = r3_6,
      SocketName = r4_6,
      SkillSpeed = r11_6,
      LoadFinishCallBack = r7_6,
    })
  end,
  AsyncCreateEffectCreature = function(r0_8, r1_8, r2_8, r3_8, r4_8, r5_8, r6_8)
    -- line: [239, 269] id: 8
    r0_8:InitEffectCreatureComponent()
    if r1_8 == 0 then
      return 
    end
    local r7_8 = DataMgr.EffectCreature[r1_8]
    if not r4_8 or r4_8 == "" or r4_8 == "None" or not r4_8 then
      r4_8 = r7_8.SocketName and "root"
    end
    if not r0_8.EffectCreatures[r1_8] then
      r0_8.EffectCreatures[r1_8] = {}
    end
    local function r8_8(r0_9)
      -- line: [249, 256] id: 9
      if r0_9.InitialLifeSpan == 0 and not r6_8 then
        table.insert(r0_8.EffectCreatures[r1_8], r0_9)
      end
      if r5_8 then
        r5_8(r0_9)
      end
    end
    local r9_8 = r0_8:IsCharacter() and r0_8:GetCurrentSkill()
    local r10_8 = r9_8 and r9_8.Data
    local r11_8 = r10_8 and r10_8.SkillSpeedModify
    local r12_8 = nil	-- notice: implicit variable refs by block#[19]
    if r11_8 then
      r12_8 = r0_8:GetCurrentSkillNodeSpeed()
      if not r12_8 then
        ::label_47::
        r12_8 = 1
      end
    else
      goto label_47	-- block#18 is visited secondly
    end
    r0_8:AsyncCreateEffectCreatureById(r1_8, {
      Transform = r2_8,
      AttachToCharacter = r3_8,
      SocketName = r4_8,
      SkillSpeed = r12_8,
      LoadFinishCallBack = r8_8,
    })
  end,
  CreateEffectCreature = function(r0_10, r1_10, r2_10, r3_10, r4_10, r5_10)
    -- line: [271, 292] id: 10
    r0_10:InitEffectCreatureComponent()
    if r1_10 == 0 then
      return 
    end
    local r6_10 = DataMgr.EffectCreature[r1_10]
    if not r4_10 or r4_10 == "" or r4_10 == "None" or not r4_10 then
      r4_10 = r6_10.SocketName and "root"
    end
    local r7_10 = r0_10:IsCharacter() and r0_10:GetCurrentSkill()
    local r8_10 = r7_10 and r7_10.Data
    local r9_10 = r8_10 and r8_10.SkillSpeedModify
    local r10_10 = nil	-- notice: implicit variable refs by block#[17]
    if r9_10 then
      r10_10 = r0_10:GetCurrentSkillNodeSpeed()
      if not r10_10 then
        ::label_38::
        r10_10 = 1
      end
    else
      goto label_38	-- block#16 is visited secondly
    end
    local r12_10 = r0_10:CreateEffectCreatureById(r1_10, {
      Transform = r2_10,
      AttachToCharacter = r3_10,
      SocketName = r4_10,
      SkillSpeed = r10_10,
      SourceEid = r5_10,
    })
    r12_10.Overridden.ReceiveBeginPlay(r12_10)
    return r12_10
  end,
  RefreshEffectCreatureByBuff = function(r0_11, r1_11, r2_11, r3_11, r4_11)
    -- line: [294, 313] id: 11
    local r5_11 = r0_11.EffectCreatures and r0_11.EffectCreatures[r1_11]
    if r5_11 and #r5_11 > 0 then
      for r10_11, r11_11 in ipairs(r5_11) do
        if r11_11.SourceBuffId == r2_11 then
          r11_11:OnEffectCreatureBuffChanged(r11_11.Layer, r3_11)
          r11_11.Layer = r3_11
          break
        end
      end
      -- close: r6_11
    else
      local r6_11 = r0_11:CreateEffectCreature(r1_11, nil, true, nil, r4_11)
      if not r6_11 then
        return 
      end
      r6_11.SourceBuffId = r2_11
      r6_11.Layer = r3_11
      r6_11:OnEffectCreatureBuffChanged(0, r3_11)
    end
  end,
  CreateEffectCreatureByPet = function(r0_12, r1_12)
    -- line: [315, 328] id: 12
    r0_12:AsyncCreateEffectCreature(r1_12, nil, true, nil, function(r0_13)
      -- line: [317, 327] id: 13
      local r1_13 = r0_12:GetBattlePet()
      if r1_13.EffectCreature then
        r1_13.EffectCreature:DestroyEffectCreature()
      end
      r1_13.EffectCreature = r0_13
      r0_13:SetActorHiddenInGame(r1_13.IsHideCreature)
      function r0_13.LoadMeshCallBack()
        -- line: [324, 326] id: 14
        EventManager:FireEvent(EventID.OnPetEffectCreatureCreated, r1_13, r0_12)
      end
    end, true)
  end,
  RecycleEffectCreature = function(r0_15, r1_15)
    -- line: [330, 336] id: 15
    local r2_15 = r1_15.ReplaceSkinEffectCreatureId and r1_15.EffectCreatureId
    if not r0_15.EffectRecyclePool[r2_15] then
      r0_15.EffectRecyclePool[r2_15] = {}
    end
    table.insert(r0_15.EffectRecyclePool[r2_15], r1_15)
  end,
  RemoveEffectCreature = function(r0_16, r1_16)
    -- line: [338, 351] id: 16
    if not r0_16.EffectCreatures or not r0_16.EffectCreatures[r1_16] then
      return 
    end
    for r6_16, r7_16 in ipairs(r0_16.EffectCreatures[r1_16]) do
      if IsValid(r7_16) then
        r7_16:DestroyEffectCreature()
      else
        DebugPrint("特效创生物为空但是数据依旧存在，id：" .. r1_16)
      end
    end
    -- close: r2_16
    r0_16.EffectCreatures[r1_16] = nil
    r0_16.AsyncEffectCreatures[r1_16] = nil
  end,
  RemoveEffectCreatureByRef = function(r0_17, r1_17)
    -- line: [353, 371] id: 17
    local r2_17 = r1_17.EffectCreatureId
    if not r0_17.EffectCreatures or not r0_17.EffectCreatures[r2_17] then
      return 
    end
    local r3_17 = {}
    for r8_17, r9_17 in ipairs(r0_17.EffectCreatures[r2_17]) do
      if IsValid(r9_17) then
        if r1_17 == r9_17 then
          r9_17:DestroyEffectCreature()
        else
          table.insert(r3_17, r9_17)
        end
      else
        DebugPrint("特效创生物为空但是数据依旧存在，id：" .. r2_17)
      end
    end
    -- close: r4_17
    r0_17.EffectCreatures[r2_17] = r3_17
  end,
  RemoveEffectCreatureByBuff = function(r0_18, r1_18, r2_18)
    -- line: [373, 388] id: 18
    if not r0_18.EffectCreatures or not r0_18.EffectCreatures[r1_18] then
      return 
    end
    local r3_18 = r0_18.EffectCreatures[r1_18]
    for r7_18 = #r3_18, 1, -1 do
      local r8_18 = r3_18[r7_18]
      if IsValid(r8_18) and r8_18.SourceBuffId and r8_18.SourceBuffId == r2_18 then
        r8_18:DestroyEffectCreature()
        table.remove(r3_18, r7_18)
      else
        DebugPrint("特效创生物为空但是数据依旧存在，id：" .. r1_18)
        table.remove(r3_18, r7_18)
      end
    end
  end,
  RemoveAllEffectCreatureOnCharacterDead = function(r0_19)
    -- line: [390, 414] id: 19
    if r0_19.AsyncEffectCreatures then
      for r5_19, r6_19 in pairs(r0_19.AsyncEffectCreatures) do
        if DataMgr.EffectCreature[r5_19].IsDestroyWithOwner then
          r0_19.AsyncEffectCreatures[r5_19] = nil
        end
      end
      -- close: r1_19
    end
    for r5_19, r6_19 in pairs(r0_19.EffectCreatures) do
      if DataMgr.EffectCreature[r5_19].IsDestroyWithOwner then
        for r11_19 = 1, #r6_19, 1 do
          local r12_19 = r6_19[r11_19]
          if IsValid(r12_19) then
            r12_19:DestroyEffectCreature()
          else
            DebugPrint("特效创生物为空但是数据依旧存在，id：" .. r5_19)
          end
        end
        r0_19.EffectCreatures[r5_19] = {}
      end
    end
    -- close: r1_19
  end,
  RemoveAllEffectCreatureOnCharacterDestroy = function(r0_20)
    -- line: [416, 447] id: 20
    r0_20.AsyncEffectCreatures = {}
    for r5_20, r6_20 in pairs(r0_20.EffectCreatures) do
      for r10_20 = 1, #r6_20, 1 do
        local r11_20 = r6_20[r10_20]
        if IsValid(r11_20) then
          r11_20:DestroyEffectCreature()
        else
          DebugPrint("特效创生物为空但是数据依旧存在，id：" .. r5_20)
        end
      end
    end
    -- close: r1_20
    r0_20.EffectCreatures = {}
    for r5_20, r6_20 in pairs(r0_20.EffectRecyclePool) do
      for r10_20 = 1, #r6_20, 1 do
        local r11_20 = r6_20[r10_20]
        if IsValid(r11_20) then
          r11_20:DestroyEffectCreature()
        end
      end
    end
    -- close: r1_20
    r0_20.EffectRecyclePool = {}
    if r0_20:IsPlayer() then
      local r1_20 = r0_20:GetBattlePet()
      if r1_20 and IsValid(r1_20.EffectCreature) then
        r1_20.EffectCreature:DestroyEffectCreature()
      end
    end
  end,
  RemoveAllEffectCreature = function(r0_21, r1_21)
    -- line: [449, 458] id: 21
    if not r0_21.EffectCreatures then
      return 
    end
    if r1_21 then
      r0_21:RemoveAllEffectCreatureOnCharacterDead()
    else
      r0_21:RemoveAllEffectCreatureOnCharacterDestroy()
    end
  end,
  HideAllEffectCreature = function(r0_22, r1_22, r2_22)
    -- line: [460, 479] id: 22
    r0_22:InitEffectCreatureComponent()
    if not r0_22.EffectCreatureHideTags then
      r0_22.EffectCreatureHideTags = {}
    end
    if not r1_22 then
      return 
    end
    if r2_22 then
      r0_22.EffectCreatureHideTags[r1_22] = true
    else
      r0_22.EffectCreatureHideTags[r1_22] = nil
    end
    for r7_22, r8_22 in pairs(r0_22.EffectCreatures) do
      for r12_22 = 1, #r8_22, 1 do
        local r13_22 = r8_22[r12_22]
        if IsValid(r13_22) then
          r13_22:HideEffectCreatureByTag(r1_22, r2_22)
        end
      end
    end
    -- close: r3_22
  end,
  HideEffectCreatureByTags = function(r0_23, r1_23)
    -- line: [481, 488] id: 23
    if not r0_23.EffectCreatureHideTags then
      return 
    end
    for r6_23, r7_23 in pairs(r0_23.EffectCreatureHideTags) do
      r1_23:HideEffectCreatureByTag(r6_23, true)
    end
    -- close: r2_23
  end,
  HideEffectCreatureById = function(r0_24, r1_24, r2_24, r3_24)
    -- line: [490, 502] id: 24
    r0_24:InitEffectCreatureComponent()
    for r8_24, r9_24 in pairs(r0_24.EffectCreatures) do
      if r8_24 == r3_24 then
        for r13_24 = 1, #r9_24, 1 do
          local r14_24 = r9_24[r13_24]
          if IsValid(r14_24) then
            r14_24:HideEffectCreatureByTag(r1_24, r2_24)
          end
        end
      end
    end
    -- close: r4_24
  end,
  UpdateEffectCreatureModel = function(r0_25, r1_25, r2_25)
    -- line: [504, 517] id: 25
    if not r0_25.EffectCreatures or not r0_25.EffectCreatures[r1_25] then
      return 
    end
    local r3_25 = r0_25.EffectCreatures[r1_25]
    for r7_25 = #r3_25, 1, -1 do
      local r8_25 = r3_25[r7_25]
      if IsValid(r8_25) then
        r8_25:UpdateEffectCreatureModel(r2_25)
      else
        table.remove(r3_25, r7_25)
      end
    end
  end,
  GetEffectCreatureByTag = function(r0_26, r1_26)
    -- line: [519, 548] id: 26
    local r2_26 = TArray(UE4.AEffectCreature)
    if not r0_26.EffectCreatures then
      return r2_26
    end
    for r7_26, r8_26 in pairs(r0_26.EffectCreatures) do
      local r9_26 = DataMgr.EffectCreature[r7_26]
      if r9_26.EffectCreatureTag then
        local r10_26 = false
        for r15_26, r16_26 in ipairs(r9_26.EffectCreatureTag) do
          if r16_26 == r1_26 then
            r10_26 = true
            break
          end
        end
        -- close: r11_26
        if r10_26 then
          for r14_26 = 1, #r8_26, 1 do
            local r15_26 = r8_26[r14_26]
            if IsValid(r15_26) then
              r2_26:Add(r15_26)
            end
          end
        end
      end
    end
    -- close: r3_26
    return r2_26
  end,
  RemoveEffectCreatureByTag = function(r0_27, r1_27)
    -- line: [550, 579] id: 27
    if not r0_27.EffectCreatures then
      return 
    end
    for r6_27, r7_27 in pairs(r0_27.EffectCreatures) do
      local r8_27 = DataMgr.EffectCreature[r6_27]
      if r8_27.EffectCreatureTag then
        local r9_27 = false
        for r14_27, r15_27 in ipairs(r8_27.EffectCreatureTag) do
          if r15_27 == r1_27 then
            r9_27 = true
            break
          end
        end
        -- close: r10_27
        if r9_27 then
          for r13_27 = 1, #r7_27, 1 do
            local r14_27 = r7_27[r13_27]
            if IsValid(r14_27) then
              r14_27:DestroyEffectCreature()
            end
          end
          r0_27.EffectCreatures[r6_27] = {}
          r0_27.AsyncEffectCreatures[r6_27] = {}
        end
      end
    end
    -- close: r2_27
  end,
}
