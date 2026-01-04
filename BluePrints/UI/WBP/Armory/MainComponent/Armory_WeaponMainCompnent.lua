-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Armory\MainComponent\Armory_WeaponMainCompnent.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local r1_0 = require("Utils.UpgradeUtils")
local r2_0 = require("BluePrints.Common.MVC.Model.WeaponModel")
local r3_0 = {
  ComponentInitDispatcher = function(r0_1)
    -- line: [8, 18] id: 1
    r0_1:AddDispatcher(EventID.OnWeaponLevelUp, r0_1, r0_1.OnWeaponUpgraded)
    r0_1:AddDispatcher(EventID.OnWeaponBreakLevelUp, r0_1, r0_1.OnWeaponUpgraded)
    r0_1:AddDispatcher(EventID.OnWeaponGradeLevelUp, r0_1, r0_1.OnWeaponGradeLevelUp)
    r0_1:AddDispatcher(EventID.OnWeaponColorsChanged, r0_1, r0_1.OnWeaponColorsChanged)
    r0_1:AddDispatcher(EventID.OnChangeWeapon, r0_1, r0_1.OnChangeWeapon)
    r0_1:AddDispatcher(EventID.OnNewWeaponObtained, r0_1, r0_1.OnNewWeaponObtained)
    r0_1:AddDispatcher(EventID.OnWeaponDeleted, r0_1, r0_1.OnWeaponDeleted)
    r0_1:AddDispatcher(EventID.OnWeaponRewardStateChanged, r0_1, r0_1.OnWeaponRewardStateChanged)
  end,
  Construct = function(r0_2)
    -- line: [20, 61] id: 2
    r0_2.AllWeaponMainTabNames = {
      r0_0.ArmoryMainTabNames.Melee,
      r0_0.ArmoryMainTabNames.Ranged,
      r0_0.ArmoryMainTabNames.Weapon
    }
    r0_2.WeaponMainFuncName = {
      "Main_InitSubUI",
      "Main_InitKeySetting",
      "Main_OnRoleListItemClicked",
      "Main_SelectRoleListItem",
      "Main_Close",
      "Main_UpdateResourceInfos",
      "Main_PreSubTabChange",
      "Main_PreMainTabChange",
      "Main_OnLockBtnClicked",
      "Main_OnBagItemLockedOrUnlocked",
      "Main_OnBtnIntensifyClicked",
      "Main_OnTableKeyDown",
      "Main_OnTableKeyUp",
      "Main_OnArmoryModClosed",
      "Main_OnUKeyDown",
      "Main_ReceiveEnterState",
      "Main_SetAllReddotRead",
      "Main_UpdateBoxReddot",
      "Main_CreateItemContents",
      "Main_SortItemContents",
      "Main_PreprocessContents",
      "Main_OnLeftThumbstickKeyDown",
      "Main_OnLeftThumbstickKeyUp",
      "Main_OnViewKeyDown",
      "Main_InitRoleList",
      "Main_OnFocusReceived",
      "Main_OnLockKeyDown",
      "Main_UpdateGamepadStyle",
      "Main_JumpToSubPage",
      "Main_OnArmoryTargetStateChanged"
    }
    for r6_2, r7_2 in pairs({
      CommonConst.ArmoryTag.Melee,
      CommonConst.ArmoryTag.Ranged
    }) do
      local r8_2 = pairs
      local r9_2 = r0_2.WeaponMainFuncName
      for r12_2, r13_2 in r8_2(r9_2) do
        local r14_2 = r7_2 .. r13_2
        local r16_2 = r13_2
        local r15_2 = r0_2["Weapon" .. r16_2]
        r0_2[r14_2] = r15_2
      end
      -- close: r8_2
    end
    -- close: r2_2
  end,
  MeleeMain_Init = function(r0_3)
    -- line: [65, 68] id: 3
    r0_3.WeaponTag = CommonConst.ArmoryTag.Melee
    r0_3:WeaponMain_Init()
  end,
  RangedMain_Init = function(r0_4)
    -- line: [71, 74] id: 4
    r0_4.WeaponTag = CommonConst.ArmoryTag.Ranged
    r0_4:WeaponMain_Init()
  end,
  UWeaponMain_Init = function(r0_5)
    -- line: [77, 80] id: 5
    r0_5.WeaponTag = CommonConst.ArmoryTag.UWeapon
    r0_5:WeaponMain_Init()
  end,
  CreateMainTabs = function(r0_6)
    -- line: [82, 84] id: 6
    r0_6:ComponentRegisterUWeaponFunctions()
  end,
  ComponentRegisterUWeaponFunctions = function(r0_7)
    -- line: [87, 96] id: 7
    for r5_7, r6_7 in pairs(r0_7.MainTabs) do
      if string.find(r6_7.Name, CommonConst.ArmoryTag.UWeapon) then
        for r11_7, r12_7 in pairs(r0_7.WeaponMainFuncName) do
          r0_7[r6_7.Name .. r12_7] = r0_7["Weapon" .. r12_7]
        end
        -- close: r7_7
        r0_7[r6_7.Name .. "Main_Init"] = r0_7.UWeaponMain_Init
      end
    end
    -- close: r1_7
  end,
  WeaponMain_OnArmoryTargetStateChanged = function(r0_8, r1_8)
    -- line: [98, 122] id: 8
    local r2_8, r3_8 = next(r1_8.Weapons)
    if r3_8 == nil then
      r2_8, r3_8 = next(r1_8.UWeapons)
    end
    if r0_8.IsPreviewMode or r3_8.WeaponId ~= r0_8[r0_8.ComparedWeaponName].WeaponId then
      return 
    end
    r0_8[r0_8.CmpContentName].Target = r3_8
    local r4_8 = r0_8[r0_8.CmpContentName]
    r4_8.GradeLevel = r3_8.GradeLevel
    r4_8.LevelCardNum = r3_8.GradeLevel
    r4_8.Avatar = r1_8
    if r0_8.WeaponTag == CommonConst.ArmoryTag.UWeapon then
      r0_8:CharMain_OnArmoryTargetStateChanged(r1_8)
      r0_8[r0_8.ComparedWeaponName] = r3_8
      r0_8:UpdateWeaponInfos()
      r0_8:CreateAndSelectSubTab()
    else
      r0_8[r0_8.CmpContentName] = nil
      r0_8:WeaponMain_OnRoleListItemClicked(r4_8)
    end
  end,
  WeaponMain_Init = function(r0_9)
    -- line: [124, 142] id: 9
    r0_9.Panel_SubTab:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r0_9.Btn_Edit:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_9:UpdateWeaponTag()
    r0_9:SwitchContentsArray()
    if not r0_9.WeaponItemContentsArray then
      r0_9:WeaponMain_PreprocessContents(r0_9.WeaponTag)
    end
    if r0_9.WeaponTag == CommonConst.ArmoryTag.UWeapon then
      r0_9.Panel_SubTab:SetVisibility(UIConst.VisibilityOp.Collapsed)
      r0_9:UpdateWeaponInfos()
      r0_9:CreateAndSelectSubTab()
    else
      r0_9:InitRoleList()
      r0_9:SelectRoleListItem(r0_9[r0_9.CmpContentName])
    end
    r0_9:PlayAnimation(r0_9.RoleList_In)
    r0_9:UpdateBoxReddot()
  end,
  WeaponMain_JumpToSubPage = function(r0_10, r1_10)
    -- line: [144, 153] id: 10
    if not r1_10 or not IsValid(r0_10.CurrentSubUI) then
      return 
    end
    if r1_10 == r0_0.ArmorySubPageName.Mod and r0_10.CurSubTab.Name == r0_0.ArmorySubTabNames.Attribute then
      r0_10.CurrentSubUI:OnModBtnClicked()
    end
  end,
  UpdateWeaponTag = function(r0_11, r1_11)
    -- line: [155, 161] id: 11
    r0_11.WeaponTag = r0_11.WeaponTag and r1_11 and "Weapon"
    r0_11.CurrentWeaponName = "Current" .. r0_11.WeaponTag
    r0_11.ComparedWeaponName = "Compared" .. r0_11.WeaponTag
    r0_11.CurContentName = r0_11.WeaponTag .. "Main_CurContent"
    r0_11.CmpContentName = r0_11.WeaponTag .. "Main_CmpContent"
  end,
  WeaponMain_PreprocessContents = function(r0_12, r1_12, r2_12)
    -- line: [163, 244] id: 12
    if not r2_12 then
      r2_12 = {}
    end
    local r3_12 = r2_12.SelectedTargetUuid
    local r4_12 = r2_12.SelectedTargetId
    local r5_12 = r2_12.SelectedTargetIndex
    r0_12:UpdateWeaponTag(r1_12)
    local r6_12 = r0_0:GetAvatar()
    if r0_12.WeaponTag == CommonConst.ArmoryTag.UWeapon then
      local r7_12 = nil
      local r8_12 = nil
      local r9_12 = nil
      local r10_12 = r0_12.CharMain_CmpContent
      if r10_12 then
        r9_12 = r10_12.AvatarMax
        r8_12 = r10_12.AvatarPrime
        r7_12 = r10_12.Avatar
        r6_12 = r7_12
        if r6_12 then
          r6_12 = r6_12
        end
      end
      r0_12[r0_12.CurrentWeaponName] = r6_12.UWeapons[r0_12.ComparedChar.UWeaponEids[r0_12.CurMainTab.TabData.UWeaponIdx]]
      r0_12[r0_12.ComparedWeaponName] = r0_12[r0_12.CurrentWeaponName]
      r0_12[r0_12.CurContentName] = {
        Type = CommonConst.ArmoryType.Weapon,
        Tag = CommonConst.ArmoryTag.UWeapon,
        Avatar = r7_12,
        AvatarPrime = r8_12,
        AvatarMax = r9_12,
      }
      r0_12[r0_12.CmpContentName] = r0_12[r0_12.CurContentName]
    else
      r0_12:SwitchContentsArray()
      if not r0_12.WeaponItemContentsMap or r0_12.bRecreateContent then
        r0_12:WeaponMain_CreateItemContents()
        r0_12:SwitchContentsArray()
      end
      local r7_12 = r0_12.WeaponItemContentsArray
      local r8_12 = r0_0:GetAvatar()
      if r3_12 then
        r0_12[r0_12.ComparedWeaponName] = r8_12.Weapons[r3_12]
      elseif r4_12 then
        for r13_12, r14_12 in ipairs(r7_12) do
          if r14_12.UnitId == r4_12 then
            r0_12[r0_12.ComparedWeaponName] = r8_12.Weapons[r14_12.Uuid] and r14_12.Target
          end
        end
        -- close: r9_12
      elseif r5_12 then
        local r9_12 = r7_12[r5_12]
        if r9_12 then
          r0_12[r0_12.ComparedWeaponName] = r8_12.Weapons[r9_12.Uuid] and r9_12.Target
        end
      end
      local r9_12 = r8_12[r0_12.WeaponTag .. "Weapon"]
      if r9_12 and r0_12.WeaponItemContentsMap[r9_12] then
        r0_12[r0_12.CurrentWeaponName] = r8_12.Weapons[r9_12]
      end
      r0_12[r0_12.ComparedWeaponName] = r0_12[r0_12.ComparedWeaponName] and r0_12[r0_12.CurrentWeaponName]
      local r10_12 = r0_12[r0_12.ComparedWeaponName]
      if r10_12 then
        r0_12[r0_12.ComparedWeaponName] = r8_12.Weapons[r10_12.Uuid] and r10_12
      end
      if r0_12[r0_12.CurrentWeaponName] then
        r0_12:WeaponMain_InitContentState()
        r0_12:WeaponMain_SortItemContents()
      else
        r0_12:WeaponMain_SortItemContents()
        r0_12:WeaponMain_InitContentState()
      end
      r10_12 = r0_12[r0_12.ComparedWeaponName]
      if r10_12 then
        local r11_12 = r0_12.WeaponItemContentsMap[r10_12.Uuid]
        if r11_12 then
          r0_12[r0_12.ComparedWeaponName] = r8_12.Weapons[r10_12.Uuid] and r11_12.Target
        else
          r0_12[r0_12.ComparedWeaponName] = nil
        end
        r10_12 = r0_12[r0_12.ComparedWeaponName]
        r11_12 = r10_12 and r0_12.WeaponItemContentsMap[r10_12.Uuid]
        if r11_12 then
          r0_12[r0_12.ComparedWeaponName] = r8_12.Weapons[r10_12.Uuid] and r11_12.Target
        else
          r0_12[r0_12.ComparedWeaponName] = nil
        end
      end
      if not r0_12[r0_12.ComparedWeaponName] and r7_12[1] then
        r0_12[r0_12.ComparedWeaponName] = r8_12[r0_12.WeaponTag .. "Weapon"][r7_12[1].Uuid] and r7_12[1].Target
      end
      r0_12:WeaponMain_InitContentState()
    end
  end,
  SwitchContentsArray = function(r0_13)
    -- line: [246, 252] id: 13
    r0_13.WeaponItemContentsMap = r0_13[r0_13.WeaponTag .. "ItemContentsMap"]
    r0_13.WeaponItemContentsArray = r0_13[r0_13.WeaponTag .. "ItemContentsArray"]
    r0_13.BP_WeaponItemContents = r0_13["BP_" .. r0_13.WeaponTag .. "ItemContents"]
    r0_13.UnownedWeaponContentMap = r0_13[r0_13.WeaponTag .. "UnownedWeaponContentMap"]
    r0_13.WeaponId2Contents = r0_13[r0_13.WeaponTag .. "WeaponId2Contents"]
  end,
  WeaponMain_InitSubUI = function(r0_14)
    -- line: [255, 274] id: 14
    local r3_14 = {
      Target = r1_14,
      Char = r0_14.ComparedChar,
      Type = r0_14[r0_14.CmpContentName].Type,
      Tag = r0_14[r0_14.CmpContentName].Tag,
      IsTargetUnowned = r0_0:GetWeaponByUuid(r0_14[r0_14.ComparedWeaponName].Uuid) == nil,
    }
    if r0_14.CurSubTab.Name == r0_0.ArmorySubTabNames.Attribute then
      r3_14.ModSuitIndex = r0_14.Params.ModSuitIndex
      r3_14.AvatarPrime = r0_14[r0_14.CmpContentName].AvatarPrime
      r3_14.AvatarMax = r0_14[r0_14.CmpContentName].AvatarMax
    end
    r0_14:DefaultInitSubUI(r3_14)
    if r0_14.CurSubTab.Name == r0_0.ArmorySubTabNames.Attribute then
      r0_14:WeaponMain_InitSubUI_Attribute()
    end
  end,
  WeaponMain_ReceiveEnterState = function(r0_15)
    -- line: [277, 284] id: 15
    r0_15:ResetWeaponData()
    if r0_15.CurSubTab.Name ~= r0_0.ArmorySubTabNames.Grade then
      r0_15:InitSubUI()
    end
    r0_15:UpdateSubTabReddotCommon(r0_0.ArmorySubTabNames.Attribute)
    r0_15:UpdateSubTabReddotCommon(r0_0.ArmorySubTabNames.Grade)
  end,
  WeaponMain_InitSubUI_Attribute = function(r0_16)
    -- line: [288, 298] id: 16
    if r0_16.CurrentSubUI then
      r0_16.CurrentSubUI:BindEvents(r0_16, {
        OnBtnIntensifyClicked = r0_16.WeaponMain_OnBtnIntensifyClicked,
        OnBtnReplaceClicked = r0_16.WeaponMain_OnBtnReplaceClicked,
        OnForbiddenBtnIntensifyClicked = r0_16.WeaponMain_OnForbiddenBtnIntensifyClicked,
        OnForbiddenBtnReplaceClicked = r0_16.WeaponMain_OnForbiddenBtnReplaceClicked,
      })
    end
    r0_16:WeaponMain_UpdatAttributeButton()
  end,
  Component_BeforeClose = function(r0_17)
    -- line: [300, 302] id: 17
    r0_17:RemoveDispatcher(EventID.OnChangeWeapon)
  end,
  WeaponMain_UpdatAttributeButton = function(r0_18)
    -- line: [304, 355] id: 18
    if r0_18.CurSubTab.Name ~= r0_0.ArmorySubTabNames.Attribute then
      return 
    end
    r0_18.AttributeButtonStyleParams = {
      {},
      {}
    }
    if string.find(r0_18.CurMainTab.Name, r0_0.ArmoryMainTabNames.UWeapon) then
      r0_18.AttributeButtonStyleParams[1].Visibility = UIConst.VisibilityOp.Collapsed
      r0_18.AttributeButtonStyleParams[2].Visibility = UIConst.VisibilityOp.Collapsed
      if r0_18.CurrentChar == r0_18.ComparedChar then
        r0_18.CurrentSubUI:SetOpenModParams(nil)
      else
        r0_18.CurrentSubUI:SetOpenModParams({
          CharUuid = r0_18.ComparedChar.Uuid,
        })
      end
    else
      if DataMgr.Weapon[r0_18[r0_18.ComparedWeaponName].WeaponId].WeaponMaxLevel <= r0_18[r0_18.ComparedWeaponName].Level then
        r0_18.AttributeButtonStyleParams[1].Text = GText("Max_Level_Achieved")
        r0_18.AttributeButtonStyleParams[1].ForbidBtn = true
      else
        if r1_0.GetMaxLevel(r0_18[r0_18.ComparedWeaponName], CommonConst.ArmoryType.Weapon) <= r0_18[r0_18.ComparedWeaponName].Level then
          r0_18.AttributeButtonStyleParams[1].Text = GText("UI_FUNC_BREAKLEVELUP")
        else
          r0_18.AttributeButtonStyleParams[1].Text = GText("UI_FUNC_LEVELUP")
        end
        r0_18.AttributeButtonStyleParams[1].ForbidBtn = false
      end
      r0_18.AttributeButtonStyleParams[1].Visibility = UIConst.VisibilityOp.SelfHitTestInvisible
      r0_18.AttributeButtonStyleParams[2].Visibility = UIConst.VisibilityOp.SelfHitTestInvisible
      if r0_18[r0_18.CurContentName] == r0_18[r0_18.CmpContentName] then
        r0_18.AttributeButtonStyleParams[2].Text = GText("UI_Bag_Equipped")
        r0_18.AttributeButtonStyleParams[2].ForbidBtn = true
      else
        r0_18.AttributeButtonStyleParams[2].Text = GText("UI_Armory_Weapon_Equipe")
        r0_18.AttributeButtonStyleParams[2].ForbidBtn = false
      end
      if r0_18.CurrentChar == r0_18.ComparedChar then
        if r0_18[r0_18.CurContentName] == r0_18[r0_18.CmpContentName] then
          r0_18.CurrentSubUI:SetOpenModParams(nil)
        else
          r0_18.CurrentSubUI:SetOpenModParams({
            [r0_18[r0_18.CmpContentName].Tag .. "Uuid"] = r0_18[r0_18.CmpContentName].Uuid,
          })
        end
      else
        r0_18.CurrentSubUI:SetOpenModParams({
          [r0_18[r0_18.CmpContentName].Tag .. "Uuid"] = r0_18[r0_18.CmpContentName].Uuid,
        })
      end
    end
    if r0_18.Params.bHideDeployBtn then
      r0_18.AttributeButtonStyleParams[2].Visibility = UIConst.VisibilityOp.Collapsed
    end
    r0_18.CurrentSubUI:UpdateButtonStyle(r0_18.AttributeButtonStyleParams)
  end,
  UpdateWeaponInfos = function(r0_19)
    -- line: [361, 392] id: 19
    local r1_19 = nil
    r0_19.Stats:SetVisibility(UIConst.VisibilityOp.Collapsed)
    if r0_19.WeaponTag == r0_0.ArmoryMainTabNames.UWeapon then
      r1_19 = DataMgr.UWeapon[r0_19[r0_19.ComparedWeaponName].WeaponId]
      r0_19.Tab_L:SetVisibility(UIConst.VisibilityOp.Collapsed)
      r0_19.EMListView_SubTab:SetVisibility(UIConst.VisibilityOp.Collapsed)
      r0_19.Panel_Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
    else
      r1_19 = DataMgr.Weapon[r0_19[r0_19.ComparedWeaponName].WeaponId]
      r0_19.Tab_L:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      if r0_19.IsPreviewMode or not r0_19[r0_19.CmpContentName].IsOwned then
        r0_19.Panel_Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
      else
        r0_19.Panel_Lock:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
        if r0_19[r0_19.ComparedWeaponName].IsLock and r0_19[r0_19.ComparedWeaponName]:IsLock() then
          r0_19.Switcher_Lock:SetActiveWidgetIndex(0)
        else
          r0_19.Switcher_Lock:SetActiveWidgetIndex(1)
        end
      end
    end
    if r0_19.bHideBoxBtn or r0_19.IsMultiWeaponTag then
      r0_19.BoxWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
    else
      r0_19.BoxWidget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
    r0_19:WeaponMain_UpdateWeaponTagIcon()
    r0_19.TextBlock_Name:SetText(GText(r1_19.WeaponName))
    r0_19:SetStars(r1_19.WeaponRarity and 0)
  end,
  WeaponMain_UpdateWeaponTagIcon = function(r0_20)
    -- line: [394, 428] id: 20
    local r1_20 = r0_20[r0_20.ComparedWeaponName]
    local r2_20, r3_20, r4_20, r5_20 = UIUtils.GetAllWeaponTags()
    local r6_20 = nil
    local r7_20 = nil
    local r8_20 = nil
    if r1_20:HasTag("Melee") then
      r7_20 = r3_20
      r6_20 = r2_20
    else
      r7_20 = r5_20
      r6_20 = r4_20
    end
    for r13_20, r14_20 in ipairs(r6_20) do
      if r1_20:HasTag(r14_20) then
        r8_20 = r14_20
        break
      end
    end
    -- close: r9_20
    if r8_20 then
      r0_20.Panel_Element:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      r0_20.Panel_Element:SetVisibility(UIConst.VisibilityOp.Collapsed)
      return 
    end
    local r9_20 = DataMgr.WeaponTag[r8_20]
    if not r9_20 then
      return 
    end
    r0_20.Image_Element:SetBrushResourceObject(LoadObject(r9_20.Icon and ""))
    r0_20.Stats_ListView:ClearListItems()
    for r16_20, r17_20 in ipairs(r6_20) do
      local r18_20 = DataMgr.WeaponTag[r17_20]
      local r19_20 = r0_20.Stats_ListView
      local r23_20 = r18_20 and r18_20.Icon
      r19_20:AddItem(r0_20:NewWeaponTagIconContent(r23_20, r7_20[r16_20], r17_20 == r8_20))
    end
    -- close: r12_20
  end,
  NewWeaponTagIconContent = function(r0_21, r1_21, r2_21, r3_21)
    -- line: [430, 436] id: 21
    local r4_21 = NewObject(UIUtils.GetCommonItemContentClass())
    r4_21.Icon = r1_21 and ""
    r4_21.Text = GText(r2_21)
    r4_21.IsSelected = r3_21
    return r4_21
  end,
  WeaponMain_UpdateBoxReddot = function(r0_22)
    -- line: [439, 442] id: 22
    local r1_22 = ReddotManager.GetTreeNode(r0_22.WeaponTag)
    r0_22:UpdateBoxReddotView(r1_22 and r1_22.Count > 0, false)
  end,
  WeaponMain_OnRoleListItemClicked = function(r0_23, r1_23)
    -- line: [447, 459] id: 23
    if r0_23[r0_23.CmpContentName] == r1_23 then
      return 
    end
    r0_23[r0_23.ComparedWeaponName] = r0_0:GetAvatar().Weapons[r1_23.Uuid] and r1_23.Target
    if r0_23.WeaponTag == r0_0.ArmoryMainTabNames.UWeapon then
      r0_23:UpdateWeaponInfos()
      r0_23:CreateAndSelectSubTab()
    else
      r0_23:SelectRoleListItem(r1_23)
    end
  end,
  WeaponMain_SelectRoleListItem = function(r0_24, r1_24)
    -- line: [462, 482] id: 24
    if r0_24.bFromArchive then
      r0_0:SetArchiveReddotRead(r1_24)
    end
    r0_0:SetItemIsSelected(r0_24[r0_24.CmpContentName], false)
    r0_0:SetItemIsSelected(r1_24, true)
    r0_24[r0_24.CmpContentName] = r1_24
    r0_24:UpdateWeaponInfos()
    if r1_24.Avatar then
      r0_24.ActorController:SetAvatar(r1_24.Avatar)
    end
    r0_24.ActorController:ChangeWeaponModel(r0_24[r0_24.ComparedWeaponName])
    r0_24.ActorController:SetAvatar(r0_0:GetAvatar())
    r0_24:CreateAndSelectSubTab({
      Weapon = r0_24[r0_24.ComparedWeaponName],
    })
    if r1_24.IsOwned then
      r0_0:SetItemReddotRead(r1_24, true)
      r0_24:AddSubTabReddotListen()
    end
    r0_24:UpdateWeaponCardLevel()
  end,
  UpdateWeaponCardLevel = function(r0_25)
    -- line: [484, 499] id: 25
    for r5_25, r6_25 in ipairs(r0_25.SubTabs) do
      if r6_25.Name == r0_0.ArmorySubTabNames.Grade then
        r6_25.Number = r0_25[r0_25.ComparedWeaponName].GradeLevel
        local r8_25 = r0_25[r0_25.ComparedWeaponName].WeaponId
        local r7_25 = DataMgr.WeaponCardLevel[r8_25]
        if r7_25 then
          r8_25 = r7_25.CardLevelMax and 0
        else
          goto label_24	-- block#4 is visited secondly
        end
        r6_25.IsMaxLevel = r8_25 <= r6_25.Number
        local r9_25 = r6_25.Widget
        if r9_25 then
          r9_25:SetNumber(r6_25.Number)
          r9_25:SetIsMaxLevel(r6_25.IsMaxLevel)
          break
        else
          break
        end
      end
    end
    -- close: r1_25
  end,
}
local function r4_0(r0_26, r1_26)
  -- line: [501, 509] id: 26
  local r2_26 = nil
  if r0_26.WeaponTag == r0_0.ArmoryMainTabNames.Weapon then
    r2_26 = r0_26.WeaponTag
  else
    r2_26 = r1_26
  end
  return r2_26
end
local function r5_0(r0_27, r1_27, r2_27)
  -- line: [511, 520] id: 27
  r0_27["BP_" .. r2_27 .. "ItemContents"]:Add(r1_27)
  table.insert(r0_27[r2_27 .. "ItemContentsArray"], r1_27)
  r0_27[r2_27 .. "ItemContentsMap"][r1_27.Uuid] = r1_27
  r0_27[r0_27.WeaponTag .. "WeaponId2Contents"][r1_27.UnitId] = r0_27[r3_27][r1_27.UnitId] and {}
  r0_27[r3_27][r1_27.UnitId][r1_27.Uuid] = r1_27
  r0_27:OnRoleListContentCreated(r1_27)
  return r1_27
end
local function r6_0(r0_28, r1_28, r2_28)
  -- line: [522, 533] id: 28
  local r3_28 = r1_28:HasTag("Melee")
  if r3_28 then
    r3_28 = "Melee" and "Ranged"
  else
    goto label_8	-- block#2 is visited secondly
  end
  local r4_28 = r4_0(r0_28, r3_28)
  if r0_28[r4_28 .. "ItemContentsMap"] == nil then
    return 
  end
  local r5_28 = r2_28 and r0_0:NewCharOrWeaponItemContent(r1_28, CommonConst.ArmoryType.Weapon, r3_28, nil, r0_28.ReddotFrom)
  r5_28.LevelCardNum = r1_28.GradeLevel
  r5_28.bHideItemLevel = r0_28.bFromArchive
  r5_28.IsOwned = true
  return r5_0(r0_28, r5_28, r4_28)
end
local function r7_0(r0_29, r1_29, r2_29)
  -- line: [535, 550] id: 29
  local r3_29 = r1_29:HasTag("Melee")
  if r3_29 then
    r3_29 = "Melee" and "Ranged"
  else
    goto label_8	-- block#2 is visited secondly
  end
  local r4_29 = r4_0(r0_29, r3_29)
  if r0_29[r4_29 .. "ItemContentsMap"] == nil then
    return 
  end
  local r5_29 = r2_29 and r0_0:NewCharOrWeaponItemContent(r1_29, CommonConst.ArmoryType.Weapon, r3_29, true, r0_29.ReddotFrom)
  r5_29.HasReward = r0_0:TryAddWeaponRewardReddot(r1_29.WeaponId)
  r5_29.LevelCardNum = r1_29.GradeLevel
  r5_29.bHideItemLevel = r0_29.bFromArchive
  r5_29.IsOwned = false
  r5_29.LockType = 2
  r5_29.Level = nil
  r0_29[r4_29 .. "UnownedWeaponContentMap"][r5_29.UnitId] = r5_29
  return r5_0(r0_29, r5_29, r4_29)
end
local function r8_0(r0_30, r1_30, r2_30)
  -- line: [552, 571] id: 30
  local r3_30 = r2_30:HasTag("Melee")
  if r3_30 then
    r3_30 = "Melee" and "Ranged"
  else
    goto label_8	-- block#2 is visited secondly
  end
  r0_30[r3_30 .. "ItemContentsMap"][r1_30.Uuid] = nil
  local r4_30 = r0_0:NewCharOrWeaponItemContent(r2_30, CommonConst.ArmoryType.Weapon, r3_30, nil, r0_30.ReddotFrom)
  r0_30[r0_30.WeaponTag .. "WeaponId2Contents"][r1_30.UnitId][r1_30.Uuid] = nil
  r1_30.Uuid = r4_30.Uuid
  r0_30[r3_30 .. "ItemContentsMap"][r1_30.Uuid] = r1_30
  r0_30[r0_30.WeaponTag .. "WeaponId2Contents"][r1_30.UnitId][r1_30.Uuid] = r1_30
  r1_30.bHideItemLevel = r0_30.bFromArchive
  r1_30.IsOwned = true
  r1_30.LockType = r4_30.LockType
  r1_30.Level = r4_30.Level
  r1_30.IsNew = r4_30.IsNew
  r1_30.Upgradeable = r4_30.Upgradeable
  r1_30.RedDotType = r4_30.RedDotType
  r1_30.Target = nil
  r1_30.AvatarPrime = nil
  r1_30.AvatarMax = nil
  r1_30.Avatar = nil
end
local function r9_0(r0_31, r1_31)
  -- line: [573, 595] id: 31
  local function r2_31(r0_32)
    -- line: [574, 591] id: 32
    if r0_31[r0_32 .. "ItemContentsMap"] == nil then
      return 
    end
    if r0_31[r0_32 .. "ItemContentsMap"][r1_31] then
      local r2_32 = r0_31[r0_32 .. "ItemContentsMap"][r1_31]
      r0_31["BP_" .. r0_32 .. "ItemContents"]:RemoveItem(r2_32)
      for r7_32, r8_32 in ipairs(r0_31[r0_32 .. "ItemContentsArray"]) do
        if r8_32.Uuid == r1_31 then
          table.remove(r0_31[r0_32 .. "ItemContentsArray"], r7_32)
          break
        end
      end
      -- close: r3_32
      r0_31[r0_31.WeaponTag .. "WeaponId2Contents"][r2_32.UnitId][r2_32.Uuid] = nil
    end
  end
  r2_31(r0_0.ArmoryMainTabNames.Melee)
  r2_31(r0_0.ArmoryMainTabNames.Ranged)
  r2_31(r0_0.ArmoryMainTabNames.Weapon)
end
function r3_0.WeaponMain_CreateItemContents(r0_33)
  -- line: [598, 725] id: 33
  r0_33.WeaponTag = r0_33.WeaponTag and r0_0.ArmoryMainTabNames.Weapon
  local r1_33 = r0_0:GetAvatar()
  r0_33[r0_33.WeaponTag .. "ItemContentsMap"] = {}
  r0_33[r0_33.WeaponTag .. "ItemContentsArray"] = {}
  r0_33[r0_33.WeaponTag .. "UnownedWeaponContentMap"] = {}
  rawset(r0_33, r0_33.WeaponTag .. "WeaponId2Contents", {})
  r0_33["BP_" .. r0_33.WeaponTag .. "ItemContents"]:Clear()
  local r2_33 = {}
  local r3_33 = GWorld:GetAvatar()
  if r3_33 then
    for r8_33, r9_33 in pairs(r3_33.Weapons) do
      r2_33[r9_33.WeaponId] = r9_33
    end
    -- close: r4_33
  end
  local r4_33 = r1_33.Weapons
  if r0_33.Params.WeaponUuids then
    r4_33 = {}
    for r9_33, r10_33 in ipairs(r0_33.Params.WeaponUuids) do
      if r1_33.Weapons[r10_33] then
        table.insert(r4_33, r1_33.Weapons[r10_33])
      end
    end
    -- close: r5_33
  end
  local r5_33 = r0_33.WeaponTag
  if r5_33 == "Weapon" then
    r5_33 = {}
    local function r6_33(r0_34)
      -- line: [627, 641] id: 34
      local r1_34 = r0_34:HasTag("Melee")
      if r1_34 then
        r1_34 = "Melee" and "Ranged"
      else
        goto label_8	-- block#2 is visited secondly
      end
      if r1_34 ~= r5_33[1] then
        table.insert(r5_33, r1_34)
      end
      local r2_34 = r0_0:NewCharOrWeaponItemContent(r0_34, CommonConst.ArmoryType.Weapon, r1_34, nil, r0_33.ReddotFrom)
      r6_0(r0_33, r0_34, r2_34)
      if r0_33.bFromArchive then
        if r2_33[r2_34.UnitId] then
          r2_34.IsOwned = true
        else
          r2_34.IsOwned = false
        end
      end
    end
    if r0_33.DoNotSort and r0_33.IsPreviewMode then
      local r7_33 = {}
      if r0_33.InitialOrderWeaponUuids then
        for r12_33, r13_33 in ipairs(r0_33.InitialOrderWeaponUuids) do
          table.insert(r7_33, r4_33[r13_33])
        end
        -- close: r8_33
      else
        r7_33 = r4_33
      end
      for r12_33, r13_33 in ipairs(r7_33) do
        r6_33(r13_33)
      end
      -- close: r8_33
    else
      for r11_33, r12_33 in pairs(r4_33) do
        r6_33(r12_33)
      end
      -- close: r7_33
    end
    if #r5_33 > 1 then
      r0_33.IsMultiWeaponTag = true
    end
    -- close: r5_33
  else
    function r5_33(r0_35)
      -- line: [664, 672] id: 35
      if r0_35:HasTag(r0_33.WeaponTag) then
        if r2_33[r0_35.WeaponId] or r0_33.IsPreviewMode then
          return r6_0(r0_33, r0_35)
        else
          return r7_0(r0_33, r0_35)
        end
      end
    end
    if r0_33.DoNotSort and r0_33.IsPreviewMode then
      for r10_33, r11_33 in ipairs(r4_33) do
        r5_33(r11_33)
      end
      -- close: r6_33
    else
      for r10_33, r11_33 in pairs(r4_33) do
        r5_33(r11_33)
      end
      -- close: r6_33
      if r0_33.IsPreviewMode or r0_33.Params.WeaponUuids then
        return 
      end
      try({
        exec = function()
          -- line: [686, 716] id: 36
          local function r0_36(r0_37)
            -- line: [688, 699] id: 37
            local r1_37 = DataMgr.BattleWeapon[r0_37]
            if not r1_37 then
              return 
            end
            local r2_37 = r1_37.WeaponTag
            if not r2_37 then
              return 
            end
            for r7_37, r8_37 in pairs(r2_37) do
              if r0_33.WeaponTag == r8_37 then
                return true
              end
            end
            -- close: r3_37
            return false
          end
          r0_0:DontResetUuid(true)
          for r5_36, r6_36 in pairs(DataMgr.Weapon) do
            if not r6_36.IsNotOpen and not r2_33[r5_36] and r0_36(r5_36) and CommonUtils.IsCurrentVersionRealease(CommonConst.DataType.Weapon, r5_36) then
              local r7_36 = r0_0:CreateNewDummyAvatar(r0_0.PreviewTargetStates.Prime, {
                WeaponIds = {
                  r5_36
                },
              })
              local r8_36, r9_36 = next(r7_36.Weapons)
              local r10_36 = r5_33(r9_36)
              r10_36.Target = r9_36
              r10_36.AvatarPrime = r7_36
              r10_36.AvatarMax = r0_0:CreateNewDummyAvatar(r0_0.PreviewTargetStates.Max, {
                WeaponIds = {
                  r5_36
                },
              })
              r10_36.Avatar = r7_36
            end
          end
          -- close: r1_36
          r0_0:DontResetUuid(false)
        end,
        catch = function(r0_38)
          -- line: [717, 721] id: 38
          local r1_38 = debug.traceback()
          if not r0_38 then
            r0_38 = ""
          end
          DebugPrint("Error: CY@ 未解锁武器信息创建失败!\n" .. r0_38 .. "\n" .. r1_38)
        end,
      })
    end
    -- close: r5_33
  end
end
function r3_0.WeaponMain_SortAndInitRoleList(r0_39)
  -- line: [727, 736] id: 39
  if r0_39[r0_39.CurrentWeaponName] then
    r0_39:WeaponMain_InitContentState()
    r0_39:WeaponMain_SortItemContents()
  else
    r0_39:WeaponMain_SortItemContents()
    r0_39:WeaponMain_InitContentState()
  end
  r0_39:InitRoleList()
end
function r3_0.WeaponMain_InitRoleList(r0_40)
  -- line: [738, 747] id: 40
  r0_40.EMListView_Role:ClearListItems()
  for r5_40, r6_40 in ipairs(r0_40.WeaponItemContentsArray) do
    r0_40.EMListView_Role:AddItem(r6_40)
    if r6_40.IsSelect then
      r0_40.EMListView_Role:BP_ScrollItemIntoView(r6_40)
    end
  end
  -- close: r1_40
  r0_40.EMListView_Role:RegenerateAllEntries()
end
function r3_0.WeaponMain_SortItemContents(r0_41)
  -- line: [749, 758] id: 41
  if r0_41.DoNotSort then
    return 
  end
  r0_0:SortItemContents(r0_41.WeaponItemContentsArray, {
    "Level",
    "Rarity",
    "SortPriority",
    "UnitId"
  }, CommonConst.DESC, r0_41.CurContentName and r0_41[r0_41.CurContentName], r0_0.IsOwnedCmpFunc)
end
function r3_0.WeaponMain_InitContentState(r0_42)
  -- line: [760, 785] id: 42
  if r0_42[r0_42.CurContentName] then
    r0_42[r0_42.CurContentName].bInGear = false
  end
  if r0_42[r0_42.CmpContentName] then
    r0_42[r0_42.CmpContentName].IsSelect = false
  end
  if r0_42[r0_42.CurrentWeaponName] then
    r0_42[r0_42.CurContentName] = r0_42.WeaponItemContentsMap[r0_42[r0_42.CurrentWeaponName].Uuid]
    if r0_42[r0_42.CurContentName] then
      r0_42[r0_42.CurContentName].bInGear = true
    end
  end
  local r1_42 = r0_42[r0_42.ComparedWeaponName]
  if r1_42 then
    r0_42[r0_42.ComparedWeaponName] = r0_0:GetAvatar().Weapons[r1_42.Uuid] and r1_42
  elseif not r1_42 then
    local r2_42 = r0_0:GetAvatar()
    local r3_42 = r0_42.WeaponItemContentsArray[1]
    r0_42[r0_42.ComparedWeaponName] = r2_42.Weapons[r3_42.Uuid] and r3_42.Target
  end
  r0_42[r0_42.CmpContentName] = r0_42.WeaponItemContentsMap[r0_42[r0_42.ComparedWeaponName].Uuid]
  r0_42[r0_42.CmpContentName].IsSelect = true
end
function r3_0.WeaponMain_UpdateResourceInfos(r0_43)
  -- line: [787, 789] id: 43
  r0_43.Tab_Arm:UpdateResource()
end
function r3_0.WeaponMain_OnBtnIntensifyClicked(r0_44)
  -- line: [791, 826] id: 44
  local r1_44 = r0_44.CurSubTab.Type
  local r2_44 = r0_44.CurSubTab.Tag
  local r3_44 = r0_44[r0_44.ComparedWeaponName].WeaponId
  local r5_44 = r0_44[r0_44.ComparedWeaponName].Level
  if r5_44 < DataMgr.Weapon[r3_44].WeaponMaxLevel then
    local r6_44 = {
      Target = r0_44[r0_44.ComparedWeaponName],
      Type = r1_44,
      Tag = r2_44,
      HideItemTips = true,
    }
    local r7_44 = DataMgr.WeaponBreak[r3_44]
    local r8_44 = r7_44 and r7_44[r0_44[r0_44.ComparedWeaponName].EnhanceLevel + 1]
    local r9_44 = DataMgr.SystemUI.ArmoryCardLevelWeapon
    if r8_44 then
      if r5_44 < r8_44.WeaponBreakLevel then
        r6_44.BehaviourType = "LevelUp"
        UIManager(r0_44):LoadUI(UIConst.LoadInConfig, r9_44.UIName, r0_44:GetZOrder(), CommonConst.ArmoryType.Weapon, r0_44[r0_44.ComparedWeaponName], r0_44, r6_44)
      else
        r6_44.BehaviourType = "BreakLevelUp"
        UIManager(r0_44):LoadUI(UIConst.LoadInConfig, r9_44.UIName, r0_44:GetZOrder(), CommonConst.ArmoryType.Weapon, r0_44[r0_44.ComparedWeaponName], r0_44, r6_44)
      end
    else
      r6_44.BehaviourType = "LevelUp"
      UIManager(r0_44):LoadUI(UIConst.LoadInConfig, r9_44.UIName, r0_44:GetZOrder(), CommonConst.ArmoryType.Weapon, r0_44[r0_44.ComparedWeaponName], r0_44, r6_44)
    end
  else
    UIManager(r0_44):ShowUITip("CommonToastMain", GText("Max_Level_Achieved"))
  end
end
function r3_0.CharMain_OnForbiddenBtnIntensifyClicked(r0_45)
  -- line: [828, 830] id: 45
  UIManager(r0_45):ShowUITip("CommonToastMain", GText("Max_Level_Achieved"))
end
function r3_0.WeaponMain_OnBtnReplaceClicked(r0_46)
  -- line: [833, 861] id: 46
  local r1_46 = r0_0:GetAvatar()
  local r2_46 = r0_46[r0_46.ComparedWeaponName]
  local r3_46 = r2_46.Uuid
  if not r0_46.WeaponTag or not r3_46 then
    return 
  end
  if r2_46.AssisterId and r2_46.AssisterId ~= 0 then
    local function r4_46()
      -- line: [841, 843] id: 47
      r0_46:BlockAllUIInput(false)
    end
    UIManager(r0_46):ShowCommonPopupUI(100044, {
      ShortText = string.format(GText(DataMgr.CommonPopupUIContext[100044].PopoverText), GText(r2_46.WeaponName), GText(r1_46.Resources[r2_46.AssisterId].ResourceName)),
      LeftCallbackFunction = r4_46,
      CloseBtnCallbackFunction = r4_46,
      RightCallbackFunction = function()
        -- line: [844, 847] id: 48
        r0_46:BlockAllUIInput(true)
        r1_46:SwitchWeapon(r0_46.WeaponTag, r3_46)
      end,
    }, r0_46)
  else
    r0_46:BlockAllUIInput(true)
    r1_46:SwitchWeapon(r0_46.WeaponTag, r3_46)
  end
end
function r3_0.OnChangeWeapon(r0_49, r1_49)
  -- line: [864, 880] id: 49
  r0_49:BlockAllUIInput(false)
  if r1_49 ~= ErrorCode.RET_SUCCESS then
    return 
  end
  if r0_49.ComponentReceivedEvent.OnChangeWeapon then
    return 
  end
  AudioManager(r0_49):PlayUISound(r0_49, "event:/ui/common/weapon_replace", nil, nil)
  r0_0:SetItemInGear(r0_49[r0_49.CurContentName], false)
  r0_0:SetItemInGear(r0_49[r0_49.CmpContentName], true)
  r0_0:SetContentPhantomIcon(r0_49[r0_49.CurContentName])
  r0_0:SetContentPhantomIcon(r0_49[r0_49.CmpContentName])
  r0_49[r0_49.CurrentWeaponName] = r0_49[r0_49.ComparedWeaponName]
  r0_49[r0_49.CurContentName] = r0_49[r0_49.CmpContentName]
  r0_49:WeaponMain_UpdatAttributeButton()
end
function r3_0.WeaponMain_OnForbiddenBtnConfirm1Clicked(r0_50)
  -- line: [882, 884] id: 50
  UIManager(r0_50):ShowUITip("CommonToastMain", GText("Max_Level_Achieved"))
end
function r3_0.WeaponMain_OnForbiddenBtnConfirm2Clicked(r0_51)
  -- line: [886, 887] id: 51
end
function r3_0.WeaponMain_PreMainTabChange(r0_52)
  -- line: [889, 892] id: 52
  r0_52:ShowElementTips(false)
  r0_52:RemoveSubTabReddotListen()
end
function r3_0.WeaponMain_PreSubTabChange(r0_53)
  -- line: [894, 897] id: 53
  r0_53:ResetWeaponData()
end
function r3_0.WeaponMain_SetAllReddotRead(r0_54)
  -- line: [900, 906] id: 54
  for r5_54, r6_54 in ipairs(r0_54.WeaponItemContentsArray) do
    if r6_54.IsOwned then
      r0_0:SetItemReddotRead(r6_54, true)
    end
  end
  -- close: r1_54
end
function r3_0.ResetWeaponData(r0_55)
  -- line: [909, 925] id: 55
  local r1_55 = r0_0:GetAvatar()
  if r0_55.WeaponTag == CommonConst.ArmoryTag.UWeapon then
    local r2_55 = r0_55.ComparedChar.UWeaponEids[r0_55.CurMainTab.TabData.UWeaponIdx]
    if r0_55.CharMain_CmpContent and r0_55.CharMain_CmpContent.Avatar then
      r1_55 = r0_55.CharMain_CmpContent.Avatar
      if r1_55 then
        r1_55 = r1_55
      end
    end
    r0_55[r0_55.CurrentWeaponName] = r1_55.UWeapons[r2_55]
    r0_55[r0_55.ComparedWeaponName] = r0_55[r0_55.CurrentWeaponName]
  else
    r0_55[r0_55.ComparedWeaponName] = r1_55.Weapons[r0_55[r0_55.ComparedWeaponName].Uuid] and r0_55[r0_55.ComparedWeaponName]
    if r0_55[r0_55.CurrentWeaponName] then
      r0_55[r0_55.CurrentWeaponName] = r1_55.Weapons[r0_55[r0_55.CurrentWeaponName].Uuid]
    end
  end
end
function r3_0.OnNewWeaponObtained(r0_56, r1_56)
  -- line: [927, 962] id: 56
  if r0_56.Params.WeaponUuids then
    return 
  end
  if not r0_56.WeaponItemContentsMap then
    return 
  end
  local r3_56 = r0_0:GetAvatar().Weapons[r1_56]
  if not r3_56 or r0_56.WeaponItemContentsMap[r3_56.Uuid] then
    return 
  end
  local r4_56 = r0_56.UnownedWeaponContentMap[r3_56.WeaponId]
  local r5_56 = r4_56 and r0_56[r0_56.CmpContentName].UnitId == r4_56.UnitId
  if r4_56 then
    r8_0(r0_56, r4_56, r3_56)
    if r5_56 then
      r0_56[r0_56.ComparedWeaponName] = r3_56
    end
  else
    r6_0(r0_56, r3_56)
  end
  if r0_56[r0_56.CurrentWeaponName] then
    r0_56:WeaponMain_InitContentState()
    r0_56:WeaponMain_SortItemContents()
  else
    r0_56:WeaponMain_SortItemContents()
    r0_56:WeaponMain_InitContentState()
  end
  r0_56:InitRoleList()
  if r5_56 then
    r0_56:SelectRoleListItem(r4_56)
  end
  r0_56:UpdateSubTabReddotCommon(r0_0.ArmorySubTabNames.Grade)
  r0_56:UpdateBoxReddot()
end
function r3_0.OnWeaponDeleted(r0_57, r1_57)
  -- line: [964, 975] id: 57
  if r0_57.Params.WeaponUuids then
    return 
  end
  r9_0(r0_57, r1_57)
  if not r0_57.WeaponItemContentsMap then
    return 
  end
  r0_57:InitRoleList()
  r0_57:UpdateSubTabReddotCommon(r0_0.ArmorySubTabNames.Grade)
  r0_57:UpdateBoxReddot()
end
function r3_0.OnWeaponRewardStateChanged(r0_58, r1_58)
  -- line: [977, 994] id: 58
  if r0_58.IsPreviewMode or not r0_58.WeaponId2Contents then
    return 
  end
  local r2_58 = r0_58.WeaponId2Contents[r1_58]
  if not r2_58 then
    return 
  end
  local r4_58 = GWorld:GetAvatar():IsWeaponHasReward(r1_58)
  for r9_58, r10_58 in pairs(r2_58) do
    r10_58.HasReward = r4_58
    r0_0:UpdateContentRetDotType(r10_58)
    if r10_58 == r0_58[r0_58.CmpContentName] then
      r0_58:UpdateSubTabReddotCommon(r0_0.ArmorySubTabNames.Attribute)
    end
  end
  -- close: r5_58
end
function r3_0.WeaponMain_OnLockBtnClicked(r0_59)
  -- line: [996, 1017] id: 59
  if r0_59[r0_59.ComparedWeaponName]:IsLock() then
    local function r1_59()
      -- line: [998, 1000] id: 60
      r0_59:SetFocus()
    end
    UIManager(r0_59):ShowCommonPopupUI(100019, {
      LeftCallbackFunction = r1_59,
      RightCallbackFunction = function()
        -- line: [1001, 1006] id: 61
        r0_59:SetFocus()
        local r0_61 = r0_0:GetAvatar()
        r0_59:BlockAllUIInput(true)
        r0_61:UnLockResourceInBag(CommonConst.AllType.Weapon, r0_59[r0_59.ComparedWeaponName].Uuid)
      end,
      CloseBtnCallbackFunction = r1_59,
    }, r0_59)
  else
    r0_59:BlockAllUIInput(true)
    r0_0:GetAvatar():LockResourceInBag(CommonConst.AllType.Weapon, r0_59[r0_59.ComparedWeaponName].Uuid)
  end
end
function r3_0.WeaponMain_OnBagItemLockedOrUnlocked(r0_62, r1_62, r2_62, r3_62)
  -- line: [1019, 1044] id: 62
  r0_62:BlockAllUIInput(false)
  if not ErrorCode:Check(r2_62) then
    return 
  end
  if r1_62 == "StateChange" then
    r0_62:ResetWeaponData()
    local r5_62 = r0_0:GetAvatar().Weapons[r3_62]
    local r6_62 = r0_62.WeaponItemContentsMap[r3_62]
    if r5_62 and r6_62 then
      r6_62.IsLocked = r5_62:IsLock()
      local r7_62 = r6_62.IsLocked
      if r7_62 then
        r7_62 = 1 and 0
      else
        goto label_34	-- block#7 is visited secondly
      end
      r6_62.LockType = r7_62
      if r6_62.SelfWidget then
        r6_62.SelfWidget:SetLock(r6_62.LockType)
      end
      if r6_62.IsLocked then
        UIManager(r0_62):ShowError(7006, nil, UIConst.Tip_CommonToast)
        r0_62.Switcher_Lock:SetActiveWidgetIndex(0)
      else
        UIManager(r0_62):ShowError(7007, nil, UIConst.Tip_CommonToast)
        r0_62.Switcher_Lock:SetActiveWidgetIndex(1)
      end
    end
  end
end
function r3_0.WeaponMain_OnFocusReceived(r0_63, r1_63)
  -- line: [1046, 1047] id: 63
end
function r3_0.WeaponMain_InitKeySetting(r0_64, r1_64, r2_64, r3_64)
  -- line: [1050, 1076] id: 64
  if not r0_64.bHideSquadBuildBtn or not r0_64.IsPreviewMode then
    r0_64:AddKeyEvents(r1_64, r0_64.MenuKeyDownEvents)
  end
  r0_64:AddKeyEvents(r1_64, r0_64.LeftThumbstickKeyDownEvents, r0_64.MainTabKeyDownEvents, r0_64.CommonKeyDownEvents)
  r0_64.LeftThumbstickBottomKeyInfoList.Desc = GText("UI_Weapon_Type")
  table.insert(r3_64, r0_64.LeftThumbstickBottomKeyInfoList)
  r0_64:AddKeyEvents(r2_64, r0_64.LeftThumbstickKeyUpEvents)
  if r0_64.Tab_L:IsVisible() then
    table.insert(r3_64, r0_64.RoleUpDownBottomKeyInfoList)
    r0_64:AddKeyEvents(r1_64, r0_64.RoleTabKeyDownEvents)
  end
  if r0_64.WeaponTag ~= CommonConst.ArmoryTag.UWeapon and not r0_64.IsPreviewMode and r0_0:GetWeaponByUuid(r0_64[r0_64.ComparedWeaponName].Uuid) ~= nil then
    r0_64:AddKeyEvents(r1_64, r0_64.LockKeyDownEvents)
    if r0_64.CurSubTab.Name == r0_0.ArmorySubTabNames.Attribute and not r0_64.AttributeButtonStyleParams[1].ForbidBtn then
      r0_64:AddKeyEvents(r1_64, r0_64.UpgradeKeyDownEvents)
    elseif r0_64.CurSubTab.Name == r0_0.ArmorySubTabNames.Appearance then
      r0_64:AddKeyEvents(r1_64, r0_64.SubTabKeyDownEvents)
    end
  end
  table.insert(r0_64.BottomKeyInfo, r0_64.ESCKeyInfoList)
end
function r3_0.WeaponMain_InitNavigationRules(r0_65)
  -- line: [1078, 1080] id: 65
  r0_65:InitNavigationRulesCommon()
end
function r3_0.WeaponMain_OnTableKeyDown(r0_66)
  -- line: [1083, 1087] id: 66
  if r0_66.CurrentSubUI and r0_66.CurrentSubUI.OnContrastKeyDown then
    r0_66.CurrentSubUI:OnContrastKeyDown()
  end
end
function r3_0.WeaponMain_OnTableKeyUp(r0_67)
  -- line: [1089, 1093] id: 67
  if r0_67.CurrentSubUI and r0_67.CurrentSubUI.OnContrastKeyDown then
    r0_67.CurrentSubUI:OnContrastKeyUp()
  end
end
function r3_0.WeaponMain_OnLeftThumbstickKeyDown(r0_68)
  -- line: [1095, 1097] id: 68
  r0_68:ShowElementTips(true)
end
function r3_0.WeaponMain_OnLeftThumbstickKeyUp(r0_69)
  -- line: [1099, 1101] id: 69
  r0_69:ShowElementTips(false)
end
function r3_0.WeaponMain_OnViewKeyDown(r0_70)
  -- line: [1103, 1104] id: 70
end
function r3_0.WeaponMain_OnLockKeyDown(r0_71)
  -- line: [1106, 1108] id: 71
  r0_71:WeaponMain_OnLockBtnClicked()
end
function r3_0.WeaponMain_UpdateGamepadStyle(r0_72)
  -- line: [1112, 1126] id: 72
  if r0_72.IsGamepadInput and r0_72.WeaponTag ~= CommonConst.ArmoryTag.UWeapon and not r0_72.IsPreviewMode and not r0_72.IsListExpanded then
    r0_72.Key_GamePad_Lock:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "Right",
        }
      },
    })
    r0_72.Key_GamePad_Lock:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    r0_72.Key_GamePad_Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r3_0.OnWeaponUpgraded(r0_73, r1_73, r2_73)
  -- line: [1128, 1144] id: 73
  local r4_73 = r0_0:GetAvatar().Weapons[r2_73]
  if not r4_73 then
    return 
  end
  local r5_73 = r0_73:WeaponMain_FindContent(r2_73)
  if not r5_73 then
    return 
  end
  r0_73:ResetWeaponData()
  r0_0:SetItemLevel(r5_73, r4_73.Level)
  if r0_73[r0_73.CmpContentName] == r5_73 then
    r0_73:InitSubUI()
  end
  r0_73:WeaponMain_SortAndInitRoleList()
end
function r3_0.OnWeaponGradeLevelUp(r0_74, r1_74, r2_74, r3_74, r4_74)
  -- line: [1146, 1170] id: 74
  local r6_74 = r0_0:GetAvatar().Weapons[r2_74]
  if not r6_74 then
    return 
  end
  local r7_74 = r0_74:WeaponMain_FindContent(r2_74)
  if not r7_74 then
    return 
  end
  r0_74:ResetWeaponData()
  r7_74.GradeLevel = r6_74.GradeLevel
  r7_74.LevelCardNum = r6_74.GradeLevel
  if r7_74.Widget then
    r7_74.Widget:OnListItemObjectSet(r7_74)
  end
  if r7_74.SelfWidget then
    r7_74.SelfWidget:OnListItemObjectSet(r7_74)
  end
  if r0_74[r0_74.ComparedWeaponName] == r6_74 then
    r0_74:UpdateWeaponCardLevel()
    r0_74:UpdateSubTabReddotCommon(r0_0.ArmorySubTabNames.Grade)
    r0_74:InitSubUI()
  end
end
function r3_0.WeaponMain_FindContent(r0_75, r1_75)
  -- line: [1172, 1179] id: 75
  for r6_75, r7_75 in ipairs(r0_75.AllWeaponMainTabNames) do
    local r8_75 = r0_75[r7_75 .. "ItemContentsMap"]
    if r8_75 and r8_75[r1_75] then
      return r8_75[r1_75]
    end
  end
  -- close: r2_75
end
function r3_0.OnWeaponColorsChanged(r0_76)
  -- line: [1181, 1183] id: 76
  r0_76:ResetWeaponData()
end
return r3_0
