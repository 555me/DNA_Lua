-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Armory\MainComponent\Armory_ReddotTree_Component.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local r1_0 = require("Utils.SkillUtils")
return {
  MainTabReddotFunc = function(r0_1, r1_1, r2_1, r3_1)
    -- line: [8, 19] id: 1
    local r4_1 = r0_1.MainTabs[r0_1.MainTabName2Idx[r1_1]]
    if not r4_1 then
      return 
    end
    r4_1.IsNew = r2_1
    r4_1.ShowRedDot = r3_1
    if IsValid(r4_1.UI) then
      if r3_1 then
        r2_1 = false
      end
      r4_1.UI:SetReddot(r2_1, r3_1)
    end
  end,
  SubTabReddotFunc = function(r0_2, r1_2, r2_2, r3_2, r4_2)
    -- line: [21, 33] id: 2
    if not r0_2.SubTabName2Idx then
      return 
    end
    local r5_2 = r0_2.SubTabs[r0_2.SubTabName2Idx[r1_2]]
    if not r5_2 then
      return 
    end
    r5_2.IsNew = r2_2
    r5_2.Upgradeable = r3_2
    r5_2.Unlockable = r4_2
    if IsValid(r5_2.Widget) then
      r5_2.Widget:SetReddot(r5_2.IsNew, r5_2.Upgradeable and r5_2.Unlockable)
    end
  end,
  AddMainTabReddotListen = function(r0_3)
    -- line: [35, 89] id: 3
    if r0_3.IsPreviewMode or r0_3.NoReddot then
      return 
    end
    r0_3:RemoveMainTabReddotListen()
    if r0_3.bListened then
      return 
    end
    local function r1_3(r0_4, r1_4, r2_4)
      -- line: [39, 44] id: 4
      r0_3:MainTabReddotFunc(r0_4, r1_4, r2_4)
      if r0_3.CurMainTab.Name == r0_4 then
        r0_3:UpdateBoxReddotView(r1_4, r2_4)
      end
    end
    r0_3:AddMeleeReddotListen(function(r0_5, r1_5)
      -- line: [45, 54] id: 5
      local r2_5 = ReddotManager.GetTreeNode(CommonConst.WeaponType.MeleeWeapon)
      local r3_5 = ReddotManager.GetTreeNode(DataMgr.ReddotNode.MeleeReward.Name)
      local r4_5 = r2_5.Count > 0
      local r5_5 = r3_5.Count > 0
      r1_3(r0_0.ArmoryMainTabNames.Melee, r4_5, r5_5)
      if r0_5.CurMainTab.Name == r0_0.ArmoryMainTabNames.Melee then
        r0_5:UpdateBoxReddotView(r4_5, r5_5)
      end
    end)
    r0_3:AddRangedReddotListen(function(r0_6, r1_6)
      -- line: [55, 64] id: 6
      local r2_6 = ReddotManager.GetTreeNode(CommonConst.WeaponType.RangedWeapon)
      local r3_6 = ReddotManager.GetTreeNode(DataMgr.ReddotNode.RangedReward.Name)
      local r4_6 = r2_6.Count > 0
      local r5_6 = r3_6.Count > 0
      r1_3(r0_0.ArmoryMainTabNames.Ranged, r4_6, r5_6)
      if r0_6.CurMainTab.Name == r0_0.ArmoryMainTabNames.Ranged then
        r0_6:UpdateBoxReddotView(r4_6, r5_6)
      end
    end)
    r0_3:AddBattleItemReddotListen(function(r0_7, r1_7)
      -- line: [65, 67] id: 7
      r0_7:MainTabReddotFunc(r0_0.ArmoryMainTabNames.BattleWheel, r1_7 > 0)
    end)
    r0_3:AddCharReddotReddotListen(function(r0_8)
      -- line: [68, 81] id: 8
      local r1_8 = ReddotManager.GetTreeNode(DataMgr.ReddotNode.NewChar.Name)
      local r2_8 = ReddotManager.GetTreeNode(DataMgr.ReddotNode.NewReleasedChar.Name)
      local r3_8 = ReddotManager.GetTreeNode(DataMgr.ReddotNode.PromoteChar.Name)
      local r4_8 = ReddotManager.GetTreeNode(DataMgr.ReddotNode.CharReward.Name)
      local r5_8 = ReddotManager.GetTreeNode(DataMgr.ReddotNode.UnlockableChar.Name)
      local r6_8 = r1_8.Count
      if r6_8 <= 0 then
        r6_8 = r2_8.Count > 0
      else
        goto label_42	-- block#3 is visited secondly
      end
      local r7_8 = r3_8.Count
      if r7_8 <= 0 then
        r7_8 = r4_8.Count
        if r7_8 <= 0 then
          r7_8 = r5_8.Count > 0
        end
      else
        goto label_53	-- block#8 is visited secondly
      end
      r0_3:MainTabReddotFunc(r0_0.ArmoryMainTabNames.Char, r6_8, r7_8)
      if r0_3.CurMainTab.Name == r0_0.ArmoryMainTabNames.Char then
        r0_3:UpdateBoxReddotView(r6_8, r7_8)
      end
    end)
    r0_3:AddNewPetReddotListen(function(r0_9, r1_9)
      -- line: [82, 87] id: 9
      r0_9:MainTabReddotFunc(r0_0.ArmoryMainTabNames.Pet, r1_9 > 0)
      if r0_9.CurMainTab.Name == r0_0.ArmoryMainTabNames.Pet then
        r0_9:UpdateBoxReddot()
      end
    end)
    r0_3.bListened = true
  end,
  CheckCharPromoteReddot = function(r0_10, r1_10)
    -- line: [91, 99] id: 10
    if r0_0:GetCharByUuid(r0_10.ComparedChar.Uuid) == nil then
      return 
    end
    local r2_10 = ReddotManager.GetTreeNode(DataMgr.ReddotNode.PromoteChar.Name)
    local r3_10 = CommonUtils.ObjId2Str(r1_10.Uuid)
    local r4_10 = ReddotManager.GetLeafNodeCacheDetail(DataMgr.ReddotNode.PromoteChar.Name)
    local r5_10 = r2_10
    if r5_10 then
      r5_10 = r2_10.Count
      if r5_10 > 0 then
        r5_10 = r4_10[r3_10] == 1
      else
        goto label_34	-- block#5 is visited secondly
      end
    end
    return r5_10
  end,
  CheckCharSkillReddot = function(r0_11, r1_11)
    -- line: [101, 109] id: 11
    local r4_11 = ReddotManager.GetTreeNode(CommonConst.DataType.Char .. Const.Skill .. CommonUtils.ObjId2Str(r1_11.Uuid))
    if r4_11 and r4_11.Count > 0 then
      return true
    end
    return r0_11:CheckCharSkillTreeSubNodeReddot(r1_11)
  end,
  CheckCharSkillTreeSubNodeReddot = function(r0_12, r1_12)
    -- line: [111, 126] id: 12
    if DataMgr.SkillTree[r1_12.CharId] then
      for r6_12 = 1, 3, 1 do
        for r10_12 = 2, 3, 1 do
          if not r1_12:CheckSkillTreeNodeIsActive(r6_12, r10_12) and r1_0.CanSkillTreeNodeUnlock(r1_12, r6_12, r10_12).CanUnlock then
            return true
          end
        end
      end
    end
  end,
  CheckCharAppearanceReddot = function(r0_13, r1_13)
    -- line: [128, 149] id: 13
    local r3_13 = GWorld:GetAvatar().CommonChars[r1_13.CharId]
    local r4_13 = 0
    for r9_13, r10_13 in pairs(CommonConst.CharAccessoryTypes) do
      local r11_13 = CommonConst.DataType.CharAccessory .. r10_13
      local r12_13 = ReddotManager.GetTreeNode(r11_13)
      local r13_13 = nil	-- notice: implicit variable refs by block#[4]
      if r12_13 then
        r13_13 = r12_13.Count
        if not r13_13 then
          ::label_26::
          r13_13 = 0
        end
      else
        goto label_26	-- block#3 is visited secondly
      end
      r4_13 = r4_13 + r13_13
      for r18_13, r19_13 in pairs(r3_13.OwnedSkins) do
        r11_13 = r11_13 .. r19_13.SkinId
        local r20_13 = ReddotManager.GetTreeNode(r11_13)
        local r21_13 = nil	-- notice: implicit variable refs by block#[8]
        if r20_13 then
          r21_13 = r20_13.Count
          if not r21_13 then
            ::label_46::
            r21_13 = 0
          end
        else
          goto label_46	-- block#7 is visited secondly
        end
        r4_13 = r4_13 + r21_13
      end
      -- close: r14_13
    end
    -- close: r5_13
    local r6_13 = ReddotManager.GetTreeNode(CommonConst.DataType.Char .. CommonConst.DataType.Skin .. r1_13.CharId)
    local r7_13 = nil	-- notice: implicit variable refs by block#[15]
    if r6_13 then
      r7_13 = r6_13.Count
      if not r7_13 then
        ::label_72::
        r7_13 = 0
      end
    else
      goto label_72	-- block#14 is visited secondly
    end
    return r4_13 + r7_13 > 0
  end,
  CheckWeaponAppearanceReddot = function(r0_14, r1_14)
    -- line: [151, 165] id: 14
    local r2_14 = 0
    local r3_14 = ReddotManager.GetTreeNode(CommonConst.DataType.WeaponAccessory)
    local r4_14 = nil	-- notice: implicit variable refs by block#[3]
    if r3_14 then
      r4_14 = r3_14.Count
      if not r4_14 then
        ::label_12::
        r4_14 = 0
      end
    else
      goto label_12	-- block#2 is visited secondly
    end
    r2_14 = r2_14 + r4_14
    r4_14 = DataMgr.Weapon[r1_14.WeaponId]
    if r4_14 and r4_14.SkinApplicationType then
      for r9_14, r10_14 in pairs(r4_14.SkinApplicationType) do
        local r12_14 = ReddotManager.GetTreeNode(CommonConst.DataType.WeaponSkin .. (r10_14 and ""))
        local r13_14 = nil	-- notice: implicit variable refs by block#[11]
        if r12_14 then
          r13_14 = r12_14.Count
          if not r13_14 then
            ::label_44::
            r13_14 = 0
          end
        else
          goto label_44	-- block#10 is visited secondly
        end
        r2_14 = r2_14 + r13_14
      end
      -- close: r5_14
    end
    return r2_14 > 0
  end,
  UpdateSubTabReddotCommon = function(r0_15, r1_15)
    -- line: [167, 177] id: 15
    if not r0_15.SubTabName2Idx then
      return 
    end
    local r2_15 = r0_15.SubTabs[r0_15.SubTabName2Idx[r1_15]]
    local r3_15 = nil
    local r4_15 = nil
    if r2_15 and r2_15.CheckReddot then
      local r6_15 = {}
      r3_15, r4_15 = r2_15.CheckReddot(r6_15)
    end
    r0_15:SubTabReddotFunc(r1_15, r3_15, r4_15)
  end,
  AddSubTabReddotListen = function(r0_16)
    -- line: [179, 215] id: 16
    if r0_16.IsPreviewMode or r0_16.NoReddot then
      return 
    end
    r0_16:RemoveSubTabReddotListen()
    if r0_16.CurSubTab.Type == CommonConst.ArmoryType.Char then
      r0_16:AddCharAttributeReddotListen(function(r0_17, r1_17)
        -- line: [183, 185] id: 17
        r0_17:UpdateSubTabReddotCommon(r0_0.ArmorySubTabNames.Attribute)
      end, r0_16.ComparedChar.CharId)
      r0_16:AddCharGradeReddotListen(function(r0_18, r1_18)
        -- line: [186, 188] id: 18
        r0_18:UpdateSubTabReddotCommon(r0_0.ArmorySubTabNames.Grade)
      end, r0_16.ComparedChar.CharId)
      r0_16:AddCharAppearanceReddotListen(function(r0_19, r1_19)
        -- line: [189, 195] id: 19
        local r2_19 = r1_19 > 0
        if r0_19.ComparedChar and r0_0:GetCharByUuid(r0_19.ComparedChar.Uuid) == nil then
          r2_19 = false
        end
        r0_19:SubTabReddotFunc(r0_0.ArmorySubTabNames.Appearance, r2_19)
      end, r0_16.ComparedChar.CharId)
      r0_16:AddCharRedordReddotListen(function(r0_20, r1_20)
        -- line: [196, 198] id: 20
        r0_20:SubTabReddotFunc(r0_0.ArmorySubTabNames.Files, r1_20 > 0)
      end, r0_16.ComparedChar.CharId)
      r0_16:AddCharSkillReddotListen(function(r0_21, r1_21)
        -- line: [199, 205] id: 21
        local r2_21 = r1_21 > 0
        if not r2_21 then
          r2_21 = r0_21:CheckCharSkillTreeSubNodeReddot(r0_21.ComparedChar)
        end
        r0_21:SubTabReddotFunc(r0_0.ArmorySubTabNames.Skill, false, r2_21)
      end, r0_16.ComparedChar.Uuid)
    elseif r0_16.CurSubTab.Type == CommonConst.ArmoryType.Weapon then
      r0_16:AddWeaponAttributeReddotListen(function(r0_22)
        -- line: [208, 210] id: 22
        r0_16:UpdateSubTabReddotCommon(r0_0.ArmorySubTabNames.Attribute)
      end, r0_16[r0_16.ComparedWeaponName].WeaponId, CommonUtils.GetWeaponTypeById(r0_16[r0_16.ComparedWeaponName].WeaponId) and "")
      r0_16:AddWeaponAppearanceReddotListen(function(r0_23, r1_23)
        -- line: [211, 213] id: 23
        r0_23:SubTabReddotFunc(r0_0.ArmorySubTabNames.Appearance, r1_23 > 0)
      end, r0_16[r0_16.ComparedWeaponName].WeaponId)
    end
  end,
  RemoveMainTabReddotListen = function(r0_24)
    -- line: [217, 228] id: 24
    if r0_24.IsPreviewMode or r0_24.NoReddot then
      return 
    end
    if not r0_24.bListened then
      return 
    end
    r0_24:RemoveCharReddotListen()
    r0_24:RemoveNewCharReddotListen()
    r0_24:RemoveMeleeReddotListen()
    r0_24:RemoveRangedReddotListen()
    r0_24:RemoveBattleItemReddotListen()
    r0_24:RemovePromoteCharReddotListen()
    r0_24:RemoveNewPetReddotListen()
    r0_24.bListened = false
  end,
  RemoveSubTabReddotListen = function(r0_25)
    -- line: [230, 238] id: 25
    if r0_25.IsPreviewMode or r0_25.NoReddot then
      return 
    end
    r0_25:RemoveCharAttributeReddotListen()
    r0_25:RemoveCharAppearanceReddotListen()
    r0_25:RemoveWeaponAttributeReddotListen()
    r0_25:RemoveWeaponAppearanceReddotListen()
    r0_25:RemoveCharRedordReddotListen()
    r0_25:RemoveCharSkillReddotListen()
  end,
  AddCharReddotReddotListen = function(r0_26, r1_26)
    -- line: [240, 245] id: 26
    if r0_26.IsPreviewMode or r0_26.NoReddot then
      return 
    end
    r0_26:RemoveCharReddotListen()
    ReddotManager.AddListener(DataMgr.ReddotNode.ArmoryMainMenu.Name, r0_26, r1_26)
  end,
  AddNewCharReddotListen = function(r0_27, r1_27)
    -- line: [247, 256] id: 27
    if r0_27.IsPreviewMode or r0_27.NoReddot then
      return 
    end
    r0_27:RemoveNewCharReddotListen()
    local r2_27 = DataMgr.ReddotNode.NewChar.Name
    if not r0_27.NewCharNodeNames then
      r0_27.NewCharNodeNames = {}
    end
    if not r0_27.NewCharNodeNames[r2_27] then
      ReddotManager.AddListener(r2_27, r0_27, r1_27, nil, 1)
      r0_27.NewCharNodeNames[r2_27] = 1
    end
  end,
  RemoveNewCharReddotListen = function(r0_28)
    -- line: [258, 261] id: 28
    if r0_28.IsPreviewMode or r0_28.NoReddot then
      return 
    end
    r0_28:_RemoveReddotListenerCommon(DataMgr.ReddotNode.NewChar.Name)
  end,
  AddNewPetReddotListen = function(r0_29, r1_29)
    -- line: [263, 272] id: 29
    if r0_29.IsPreviewMode or r0_29.NoReddot then
      return 
    end
    r0_29:RemoveNewPetReddotListen()
    local r2_29 = CommonConst.DataType.Pet
    if not r0_29.NewPetNodeNames then
      r0_29.NewPetNodeNames = {}
    end
    if not r0_29.NewPetNodeNames[r2_29] then
      ReddotManager.AddListener(r2_29, r0_29, r1_29, nil, 1)
      r0_29.NewPetNodeNames[r2_29] = 1
    end
  end,
  RemoveNewPetReddotListen = function(r0_30)
    -- line: [274, 277] id: 30
    if r0_30.IsPreviewMode or r0_30.NoReddot then
      return 
    end
    r0_30:_RemoveReddotListenerCommon(CommonConst.DataType.Pet)
  end,
  AddCharSkillReddotListen = function(r0_31, r1_31, r2_31)
    -- line: [281, 290] id: 31
    if r0_31.IsPreviewMode or r0_31.NoReddot then
      return 
    end
    r0_31:RemoveCharSkillReddotListen()
    local r3_31 = CommonConst.DataType.Char .. Const.Skill .. CommonUtils.ObjId2Str(r2_31)
    if not r0_31.CharSkillNodeNames then
      r0_31.CharSkillNodeNames = {}
    end
    if not r0_31.CharSkillNodeNames[r3_31] then
      ReddotManager.AddListener(r3_31, r0_31, r1_31, nil, 1)
      r0_31.CharSkillNodeNames[r3_31] = 1
    end
  end,
  RemoveCharSkillReddotListen = function(r0_32)
    -- line: [292, 295] id: 32
    if r0_32.IsPreviewMode or r0_32.NoReddot then
      return 
    end
    r0_32:_RemoveReddotListenerCommon(CommonConst.DataType.Char .. Const.Skill)
  end,
  AddPromoteCharReddotListen = function(r0_33, r1_33)
    -- line: [297, 306] id: 33
    if r0_33.IsPreviewMode or r0_33.NoReddot then
      return 
    end
    r0_33:RemovePromoteCharReddotListen()
    local r2_33 = DataMgr.ReddotNode.PromoteChar.Name
    if not r0_33.PromoteCharNodeNames then
      r0_33.PromoteCharNodeNames = {}
    end
    if not r0_33.PromoteCharNodeNames[r2_33] then
      ReddotManager.AddListener(r2_33, r0_33, r1_33, nil, 1)
      r0_33.PromoteCharNodeNames[r2_33] = 1
    end
  end,
  RemovePromoteCharReddotListen = function(r0_34)
    -- line: [308, 311] id: 34
    if r0_34.IsPreviewMode or r0_34.NoReddot then
      return 
    end
    r0_34:_RemoveReddotListenerCommon(DataMgr.ReddotNode.PromoteChar.Name)
  end,
  AddCharRedordReddotListen = function(r0_35, r1_35, r2_35)
    -- line: [313, 348] id: 35
    if r0_35.IsPreviewMode or r0_35.NoReddot then
      return 
    end
    r0_35:RemoveCharRedordReddotListen()
    if r0_35.UnownedCharContentMap[r2_35] then
      return 
    end
    local r3_35 = table.concat({
      "CharFile",
      r0_35.ComparedChar.CharId
    }, "_")
    local r4_35 = table.concat({
      "Record",
      r0_35.ComparedChar.CharId
    }, "_")
    r0_0:InitCharRecoedReddotNode(r2_35)
    local r5_35 = ReddotManager.GetTreeNode(r4_35)
    if not r0_35.CharRecordNodeNames then
      r0_35.CharRecordNodeNames = {}
    end
    local r6_35 = {}
    if r5_35 then
      r6_35[r4_35] = {
        1
      }
    end
    if not r0_35.CharRecordNodeNames[r3_35] then
      local r7_35 = {
        [DataMgr.ReddotNode.CharReward.Name] = 1,
      }
    end
    if not r0_35.CharRecordNodeNames[r3_35] and not IsEmptyTable(r6_35) then
      ReddotManager.AddListener(r3_35, r0_35, r1_35, r6_35)
      r0_35.CharRecordNodeNames[r3_35] = 1
    end
  end,
  OnCharUpgraded = function(r0_36, r1_36, r2_36, r3_36, r4_36)
    -- line: [349, 353] id: 36
    if r0_36.IsPreviewMode or r0_36.NoReddot then
      return 
    end
    r0_0:InitCharRecoedReddotNode(r0_0:GetCharByUuid(r2_36).CharId)
  end,
  RemoveCharRedordReddotListen = function(r0_37)
    -- line: [354, 357] id: 37
    if r0_37.IsPreviewMode or r0_37.NoReddot then
      return 
    end
    r0_37:_RemoveReddotListenerCommon("CharRecord")
  end,
  AddCharAttributeReddotListen = function(r0_38, r1_38, r2_38)
    -- line: [359, 371] id: 38
    if r0_38.IsPreviewMode or r0_38.NoReddot then
      return 
    end
    r0_38:RemoveCharAttributeReddotListen()
    local r3_38 = CommonConst.DataType.Char .. r0_0.ArmorySubTabNames.Attribute .. r2_38
    if not r0_38.CharAttributeNodeNames then
      r0_38.CharAttributeNodeNames = {}
    end
    if not r0_38.CharAttributeNodeNames[r3_38] then
      ReddotManager.AddListener(r3_38, r0_38, r1_38, {
        [DataMgr.ReddotNode.CharReward.Name] = 1,
        [DataMgr.ReddotNode.UnlockableChar.Name] = 1,
      })
      r0_38.CharAttributeNodeNames[r3_38] = 1
    end
  end,
  RemoveCharAttributeReddotListen = function(r0_39)
    -- line: [373, 376] id: 39
    if r0_39.IsPreviewMode or r0_39.NoReddot then
      return 
    end
    r0_39:_RemoveReddotListenerCommon(CommonConst.DataType.Char .. r0_0.ArmorySubTabNames.Attribute)
  end,
  AddCharGradeReddotListen = function(r0_40, r1_40, r2_40)
    -- line: [378, 389] id: 40
    if r0_40.IsPreviewMode or r0_40.NoReddot then
      return 
    end
    r0_40:RemoveCharGradeReddotListen()
    local r3_40 = CommonConst.DataType.Char .. r0_0.ArmorySubTabNames.Grade .. r2_40
    if not r0_40.CharGradeNodeNames then
      r0_40.CharGradeNodeNames = {}
    end
    if not r0_40.CharGradeNodeNames[r3_40] then
      ReddotManager.AddListener(r3_40, r0_40, r1_40, {
        [DataMgr.ReddotNode.PromoteChar.Name] = 1,
      })
      r0_40.CharGradeNodeNames[r3_40] = 1
    end
  end,
  RemoveCharGradeReddotListen = function(r0_41)
    -- line: [391, 394] id: 41
    if r0_41.IsPreviewMode or r0_41.NoReddot then
      return 
    end
    r0_41:_RemoveReddotListenerCommon(CommonConst.DataType.Char .. r0_0.ArmorySubTabNames.Grade)
  end,
  AddCharAppearanceReddotListen = function(r0_42, r1_42, r2_42)
    -- line: [396, 418] id: 42
    if r0_42.IsPreviewMode or r0_42.NoReddot then
      return 
    end
    r0_42:RemoveCharAppearanceReddotListen()
    local r3_42 = CommonConst.DataType.Char .. r0_0.ArmorySubTabNames.Appearance .. r2_42
    if not r0_42.CharAppearanceNodeNames then
      r0_42.CharAppearanceNodeNames = {}
    end
    local r5_42 = GWorld:GetAvatar().CommonChars[r2_42]
    local r6_42 = {}
    for r11_42, r12_42 in pairs(CommonConst.CharAccessoryTypes) do
      local r13_42 = CommonConst.DataType.CharAccessory .. r12_42
      local r14_42 = ReddotManager.GetTreeNode(r13_42)
      if r14_42 then
        r14_42 = 1 and nil
      else
        goto label_48	-- block#8 is visited secondly
      end
      r6_42[r13_42] = r14_42
      for r18_42, r19_42 in pairs(r5_42.OwnedSkins) do
        r13_42 = r13_42 .. r19_42.SkinId
        local r20_42 = ReddotManager.GetTreeNode(r13_42)
        if r20_42 then
          r20_42 = 1 and nil
        else
          goto label_67	-- block#12 is visited secondly
        end
        r6_42[r13_42] = r20_42
      end
      -- close: r14_42
    end
    -- close: r7_42
    local r7_42 = CommonConst.DataType.Char .. CommonConst.DataType.Skin .. r2_42
    local r8_42 = ReddotManager.GetTreeNode(r7_42)
    if r8_42 then
      r8_42 = 1 and nil
    else
      goto label_92	-- block#19 is visited secondly
    end
    r6_42[r7_42] = r8_42
    if not r0_42.CharAppearanceNodeNames[r3_42] and not IsEmptyTable(r6_42) then
      ReddotManager.AddListener(r3_42, r0_42, r1_42, r6_42)
      r0_42.CharAppearanceNodeNames[r3_42] = 1
    end
  end,
  RemoveCharAppearanceReddotListen = function(r0_43)
    -- line: [420, 423] id: 43
    if r0_43.IsPreviewMode or r0_43.NoReddot then
      return 
    end
    r0_43:_RemoveReddotListenerCommon(CommonConst.DataType.Char .. r0_0.ArmorySubTabNames.Appearance)
  end,
  AddWeaponAttributeReddotListen = function(r0_44, r1_44, r2_44, r3_44)
    -- line: [425, 441] id: 44
    if r0_44.IsPreviewMode or r0_44.NoReddot then
      return 
    end
    r0_44:RemoveWeaponAttributeReddotListen()
    if not r3_44 then
      r3_44 = ""
    end
    r0_44.WeaponAttributeNodeNames = r0_44.WeaponAttributeNodeNames and {}
    local r4_44 = CommonConst.DataType.Weapon .. r0_0.ArmorySubTabNames.Attribute
    local r5_44 = {}
    if r3_44 == CommonConst.WeaponType.MeleeWeapon then
      local r6_44 = DataMgr.ReddotNode.MeleeReward.Name
      local r7_44 = ReddotManager.GetTreeNode(DataMgr.ReddotNode.MeleeReward.Name)
      if r7_44 then
        r7_44 = 1 and nil
      else
        goto label_47	-- block#10 is visited secondly
      end
      r5_44[r6_44] = r7_44
    elseif r3_44 == CommonConst.WeaponType.RangedWeapon then
      local r6_44 = DataMgr.ReddotNode.RangedReward.Name
      local r7_44 = ReddotManager.GetTreeNode(DataMgr.ReddotNode.RangedReward.Name)
      if r7_44 then
        r7_44 = 1 and nil
      else
        goto label_71	-- block#15 is visited secondly
      end
      r5_44[r6_44] = r7_44
    end
    if not r0_44.WeaponAttributeNodeNames[r4_44] and not IsEmptyTable(r5_44) then
      ReddotManager.AddListener(r4_44, r0_44, r1_44, r5_44)
      r0_44.WeaponAttributeNodeNames[r4_44] = 1
    end
  end,
  RemoveWeaponAttributeReddotListen = function(r0_45)
    -- line: [443, 446] id: 45
    if r0_45.IsPreviewMode or r0_45.NoReddot then
      return 
    end
    r0_45:_RemoveReddotListenerCommon(CommonConst.DataType.Weapon .. r0_0.ArmorySubTabNames.Appearance)
  end,
  AddWeaponAppearanceReddotListen = function(r0_46, r1_46, r2_46)
    -- line: [448, 469] id: 46
    if r0_46.IsPreviewMode or r0_46.NoReddot then
      return 
    end
    r0_46:RemoveWeaponAppearanceReddotListen()
    local r3_46 = CommonConst.DataType.Weapon .. r0_0.ArmorySubTabNames.Appearance .. r2_46
    if not r0_46.WeaponAppearanceNodeNames then
      r0_46.WeaponAppearanceNodeNames = {}
    end
    local r4_46 = {}
    local r5_46 = CommonConst.DataType.WeaponAccessory
    local r6_46 = ReddotManager.GetTreeNode(r5_46)
    if r6_46 then
      r6_46 = 1 and nil
    else
      goto label_36	-- block#7 is visited secondly
    end
    r4_46[r5_46] = r6_46
    r6_46 = DataMgr.Weapon[r2_46]
    if r6_46 and r6_46.SkinApplicationType then
      for r11_46, r12_46 in pairs(r6_46.SkinApplicationType) do
        r5_46 = CommonConst.DataType.WeaponSkin .. (r12_46 and "")
        local r13_46 = ReddotManager.GetTreeNode(r5_46)
        if r13_46 then
          r13_46 = 1 and nil
        else
          goto label_67	-- block#15 is visited secondly
        end
        r4_46[r5_46] = r13_46
      end
      -- close: r7_46
    end
    if not r0_46.WeaponAppearanceNodeNames[r3_46] and not IsEmptyTable(r4_46) then
      ReddotManager.AddListener(r3_46, r0_46, r1_46, r4_46)
      r0_46.WeaponAppearanceNodeNames[r3_46] = 1
    end
  end,
  RemoveWeaponAppearanceReddotListen = function(r0_47)
    -- line: [471, 474] id: 47
    if r0_47.IsPreviewMode or r0_47.NoReddot then
      return 
    end
    r0_47:_RemoveReddotListenerCommon(CommonConst.DataType.Weapon .. r0_0.ArmorySubTabNames.Appearance)
  end,
  AddBattleItemReddotListen = function(r0_48, r1_48)
    -- line: [476, 485] id: 48
    if r0_48.IsPreviewMode or r0_48.NoReddot then
      return 
    end
    r0_48:RemoveBattleItemReddotListen()
    local r2_48 = DataMgr.ReddotNode.ArmoryBattleItem.Name
    if not r0_48.ArmoryBattleItemNodeNames then
      r0_48.ArmoryBattleItemNodeNames = {}
    end
    if not r0_48.ArmoryBattleItemNodeNames[r2_48] then
      ReddotManager.AddListener(r2_48, r0_48, r1_48, nil, 1)
      r0_48.ArmoryBattleItemNodeNames[r2_48] = 1
    end
  end,
  RemoveBattleItemReddotListen = function(r0_49)
    -- line: [487, 490] id: 49
    if r0_49.IsPreviewMode or r0_49.NoReddot then
      return 
    end
    r0_49:_RemoveReddotListenerCommon(DataMgr.ReddotNode.ArmoryBattleItem.Name)
  end,
  RemoveCharReddotListen = function(r0_50, r1_50)
    -- line: [492, 496] id: 50
    if r0_50.IsPreviewMode or r0_50.NoReddot then
      return 
    end
    r0_50:_RemoveReddotListenerCommon(CommonConst.DataType.Char)
    ReddotManager.RemoveListener(DataMgr.ReddotNode.ArmoryMainMenu.Name, r0_50)
  end,
  AddMeleeReddotListen = function(r0_51, r1_51)
    -- line: [498, 510] id: 51
    if r0_51.IsPreviewMode or r0_51.NoReddot then
      return 
    end
    r0_51:RemoveMeleeReddotListen()
    local r2_51 = CommonConst.WeaponType.MeleeWeapon .. "MainTab"
    if not r0_51.MeleeNodeNames then
      r0_51.MeleeNodeNames = {}
    end
    local r3_51 = {
      [DataMgr.ReddotNode.MeleeReward.Name] = -1,
      [CommonConst.WeaponType.MeleeWeapon] = 1,
    }
    if not r0_51.MeleeNodeNames[r2_51] and not IsEmptyTable(r3_51) then
      ReddotManager.AddListener(r2_51, r0_51, r1_51, r3_51, -1)
      r0_51.MeleeNodeNames[r2_51] = 1
    end
  end,
  RemoveMeleeReddotListen = function(r0_52)
    -- line: [512, 515] id: 52
    if r0_52.IsPreviewMode or r0_52.NoReddot then
      return 
    end
    r0_52:_RemoveReddotListenerCommon(CommonConst.WeaponType.MeleeWeapon .. "MainTab")
  end,
  AddRangedReddotListen = function(r0_53, r1_53)
    -- line: [517, 529] id: 53
    if r0_53.IsPreviewMode or r0_53.NoReddot then
      return 
    end
    r0_53:RemoveRangedReddotListen()
    local r2_53 = CommonConst.WeaponType.RangedWeapon .. "MainTab"
    if not r0_53.RangedNodeNames then
      r0_53.RangedNodeNames = {}
    end
    local r3_53 = {
      [DataMgr.ReddotNode.RangedReward.Name] = -1,
      [CommonConst.WeaponType.RangedWeapon] = -1,
    }
    if not r0_53.RangedNodeNames[r2_53] and not IsEmptyTable(r3_53) then
      ReddotManager.AddListener(r2_53, r0_53, r1_53, r3_53, -1)
      r0_53.RangedNodeNames[r2_53] = 1
    end
  end,
  RemoveRangedReddotListen = function(r0_54)
    -- line: [531, 534] id: 54
    if r0_54.IsPreviewMode or r0_54.NoReddot then
      return 
    end
    r0_54:_RemoveReddotListenerCommon(CommonConst.WeaponType.RangedWeapon .. "MainTab")
  end,
  _GetModReddotNodeName = function(r0_55, r1_55)
    -- line: [536, 547] id: 55
    local r2_55 = nil
    local r3_55 = r1_55.Uuid
    if type(r3_55) == "number" then
      r2_55 = r3_55
    else
      r2_55 = CommonUtils.ObjId2Str(r3_55)
    end
    return CommonConst.DataType.Mod .. r2_55
  end,
  AddModReddotListen = function(r0_56, r1_56, r2_56)
    -- line: [549, 572] id: 56
    if r0_56.IsAbyss then
      return 
    end
    if r0_56.IsPreviewMode or r0_56.NoReddot then
      return 
    end
    if r1_56 then
      r0_56:RemoveModReddotListen()
    end
    if not r0_56.ModNodeNames then
      r0_56.ModNodeNames = {}
    end
    local r3_56 = r0_56:_GetModReddotNodeName(r2_56)
    local r4_56 = {}
    for r9_56, r10_56 in pairs(r2_56.ModApplicationType and {}) do
      if DataMgr.ModTag[r10_56] then
        local r11_56 = CommonConst.DataType.Mod .. r10_56
        local r12_56 = ReddotManager.GetTreeNode(r11_56)
        if r12_56 then
          r12_56 = 1 and nil
        else
          goto label_54	-- block#16 is visited secondly
        end
        r4_56[r11_56] = r12_56
      end
    end
    -- close: r5_56
    if not r0_56.ModNodeNames[r3_56] and not IsEmptyTable(r4_56) then
      if not r1_56 then
        ReddotManager.AddNode(r3_56, r4_56, Const.ReddotCacheType.UserCache)
      else
        ReddotManager.AddListener(r3_56, r0_56, r1_56, r4_56)
        r0_56.ModNodeNames[r3_56] = 1
      end
    end
  end,
  RemoveModReddotListen = function(r0_57)
    -- line: [574, 578] id: 57
    if r0_57.IsAbyss then
      return 
    end
    if r0_57.IsPreviewMode or r0_57.NoReddot then
      return 
    end
    r0_57:_RemoveReddotListenerCommon(CommonConst.DataType.Mod)
  end,
  _RemoveReddotListenerCommon = function(r0_58, r1_58)
    -- line: [580, 586] id: 58
    if not r0_58[(r1_58 .. "NodeNames")] then
      return 
    end
    for r6_58, r7_58 in pairs(r0_58[r1_58 .. "NodeNames"] and {}) do
      ReddotManager.RemoveListener(r6_58, r0_58)
    end
    -- close: r2_58
    r0_58[r1_58 .. "NodeNames"] = nil
  end,
}
