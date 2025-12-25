-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Armory\MainComponent\Armory_CharMainCompnent.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("Utils.UpgradeUtils")
local r1_0 = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local r2_0 = require("Utils.SkillUtils")
local r3_0 = {
  ComponentInitDispatcher = function(r0_1)
    -- line: [8, 19] id: 1
    r0_1:AddDispatcher(EventID.OnCharLevelUp, r0_1, r0_1.OnCharUpgraded)
    r0_1:AddDispatcher(EventID.OnCharBreakLevelUp, r0_1, r0_1.OnCharUpgraded)
    r0_1:AddDispatcher(EventID.OnCharGradeLevelUp, r0_1, r0_1.OnCharGradeLevelUp)
    r0_1:AddDispatcher(EventID.OnCharSkillLevelUp, r0_1, r0_1.OnCharSkillLevelUp)
    r0_1:AddDispatcher(EventID.OnSwitchCurrentChar, r0_1, r0_1.OnSwitchCurrentChar)
    r0_1:AddDispatcher(EventID.OnNewCharObtained, r0_1, r0_1.OnNewCharObtained)
    r0_1:AddDispatcher(EventID.OnCharCardLevelResourcesChanged, r0_1, r0_1.OnCharCardLevelResourcesChanged)
    r0_1:AddDispatcher(EventID.OnCharRewardStateChanged, r0_1, r0_1.OnCharRewardStateChanged)
  end,
  CharMain_Close = function(r0_2)
    -- line: [21, 22] id: 2
  end,
  CharMain_OnArmoryTargetStateChanged = function(r0_3, r1_3)
    -- line: [24, 50] id: 3
    local r2_3, r3_3 = next(r1_3.Chars)
    if r0_3.IsPreviewMode or r3_3.CharId ~= r0_3.ComparedChar.CharId then
      return 
    end
    r0_3.CharMain_CmpContent.Target = r3_3
    local r4_3 = r0_3.CharMain_CmpContent
    r4_3.GradeLevel = r3_3.GradeLevel
    r4_3.Avatar = r1_3
    if r0_3.CurMainTab.Name == r1_0.ArmoryMainTabNames.Char then
      r0_3.CharMain_CmpContent = nil
      r0_3:CharMain_OnRoleListItemClicked(r4_3)
    else
      r0_3.ComparedChar = r4_3.Target
      r0_3:CreateMainTabs({
        Char = r0_3.ComparedChar,
        Avatar = r4_3.Avatar,
      })
      local r5_3 = r0_3.MainTabName2Idx[r0_3.CurMainTab.Name]
      if r0_3.MainTabs[r5_3] and r0_3.MainTabs[r5_3].Name == r0_3.CurMainTab.Name then
        r0_3.CurMainTab = r0_3.MainTabs[r5_3]
        r0_3.CurMainTab.IsOn = true
        r0_3:UpdateMainTabs(r0_3.MainTabs)
        r0_3.CurMainTab.IsOn = false
      end
      r0_3.CharMain_CmpContent = r4_3
      r0_3:AddMainTabReddotListen()
    end
  end,
  CharMain_Init = function(r0_4)
    -- line: [52, 62] id: 4
    r0_4.Panel_SubTab:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r0_4.Btn_Edit:SetVisibility(UIConst.VisibilityOp.Collapsed)
    if not r0_4.CharItemContentsMap then
      r0_4:CharMain_PreprocessContents()
    end
    r0_4:CharMain_SortAndInitRoleList()
    r0_4:CharMain_SelectRoleListItem(r0_4.CharMain_CmpContent)
    r0_4:PlayAnimation(r0_4.RoleList_In)
    r0_4:UpdateBoxReddot()
  end,
  CharMain_JumpToSubPage = function(r0_5, r1_5)
    -- line: [64, 73] id: 5
    if not r1_5 or not IsValid(r0_5.CurrentSubUI) then
      return 
    end
    if r1_5 == r1_0.ArmorySubPageName.Mod and r0_5.CurSubTab.Name == r1_0.ArmorySubTabNames.Attribute then
      r0_5.CurrentSubUI:OnModBtnClicked()
    end
  end,
  CharMain_PreprocessContents = function(r0_6, r1_6, r2_6)
    -- line: [75, 112] id: 6
    if not r2_6 then
      r2_6 = {}
    end
    local r3_6 = r2_6.SelectedTargetUuid
    local r4_6 = r2_6.SelectedTargetId
    local r5_6 = r2_6.SelectedTargetIndex
    r0_6:CharMain_CreateItemContents()
    local r6_6 = r1_0:GetAvatar()
    local r7_6 = r0_6.CharItemContentsArray
    if r3_6 then
      r0_6.ComparedChar = r6_6.Chars[r3_6]
    elseif r4_6 then
      for r12_6, r13_6 in ipairs(r7_6) do
        if r13_6.UnitId == r4_6 then
          r0_6.ComparedChar = r6_6.Chars[r13_6.Uuid] and r13_6.Target
        end
      end
      -- close: r8_6
    elseif r5_6 then
      local r8_6 = r7_6[r5_6]
      if r8_6 then
        r0_6.ComparedChar = r6_6.Chars[r8_6.Uuid] and r8_6.Target
      end
    end
    if r0_6.ComparedChar then
      local r8_6 = r0_6.CharItemContentsMap[r0_6.ComparedChar.Uuid]
      if r8_6 then
        r0_6.ComparedChar = r6_6.Chars[r0_6.ComparedChar.Uuid] and r8_6.Target
      else
        r0_6.ComparedChar = nil
      end
    end
    if not r0_6.ComparedChar and r7_6[1] then
      r0_6.ComparedChar = r6_6.Chars[r7_6[1].Uuid] and r7_6[1].Target
    end
    r0_6:CharMain_InitContentState()
    r0_6:CharMain_SortItemContents()
  end,
  CharMain_InitSubUI = function(r0_7)
    -- line: [114, 139] id: 7
    local r1_7 = r0_7.ComparedChar
    local r3_7 = {
      CharUuid = r1_7.Uuid,
      Target = r1_7,
      Type = r0_7.CurSubTab.Type,
      Tag = r0_7.CurSubTab.Tag,
      IsTargetUnowned = r1_0:GetCharByUuid(r1_7.Uuid) == nil,
    }
    if r0_7.CurSubTab.Name == r1_0.ArmorySubTabNames.Attribute then
      r3_7.bHideUWeaponMod = r0_7.Params.bFormPersonalPage
      r3_7.AvatarPrime = r0_7.CharMain_CmpContent.AvatarPrime
      r3_7.AvatarMax = r0_7.CharMain_CmpContent.AvatarMax
      r3_7.CurrentAvatar = r0_7.CharMain_CmpContent.Avatar
      r3_7.EscapeArmoryCharID = r0_7.Params.EscapeArmoryCharID
    elseif r0_7.CurSubTab.Name == r1_0.ArmorySubTabNames.Files then
      r3_7.bNeedStandBtn = r0_7.Params.bNeedStandBtn
    elseif r0_7.CurSubTab.Name == r1_0.ArmorySubTabNames.Appearance then
      r3_7.AppearanceIndex = r0_7.Params.AppearanceIndex
    end
    r0_7:DefaultInitSubUI(r3_7)
    if r0_7.CurSubTab.Name == r1_0.ArmorySubTabNames.Attribute then
      r0_7:CharMain_InitSubUI_Attribute()
    end
  end,
  CharMain_ReceiveEnterState = function(r0_8)
    -- line: [142, 151] id: 8
    r0_8:ResetCharData()
    r0_8:_UpdateSkillUpgradeReddot(r1_0:GetAvatar(), r0_8.ComparedChar.Uuid)
    if r0_8.CurSubTab.Name ~= r1_0.ArmorySubTabNames.Skill then
      r0_8:InitSubUI()
    end
    r0_8:UpdateSubTabReddotCommon(r1_0.ArmorySubTabNames.Attribute)
    r0_8:UpdateSubTabReddotCommon(r1_0.ArmorySubTabNames.Skill)
  end,
  CharMain_InitSubUI_Attribute = function(r0_9)
    -- line: [155, 165] id: 9
    if r0_9.CurrentSubUI then
      r0_9.CurrentSubUI:BindEvents(r0_9, {
        OnBtnIntensifyClicked = r0_9.CharMain_OnBtnIntensifyClicked,
        OnBtnReplaceClicked = r0_9.CharMain_OnBtnReplaceClicked,
        OnForbiddenBtnIntensifyClicked = r0_9.CharMain_OnForbiddenBtnIntensifyClicked,
        OnForbiddenBtnReplaceClicked = r0_9.CharMain_OnForbiddenBtnReplaceClicked,
      })
    end
    r0_9:CharMain_UpdatAttributeButton()
  end,
  CharMain_UpdatAttributeButton = function(r0_10)
    -- line: [167, 202] id: 10
    if r0_10.CurSubTab.Name ~= r1_0.ArmorySubTabNames.Attribute then
      return 
    end
    r0_10.AttributeButtonStyleParams = {
      {},
      {}
    }
    if DataMgr.Char[r0_10.ComparedChar.CharId].CharMaxLevel <= r0_10.ComparedChar.Level then
      r0_10.AttributeButtonStyleParams[1].Text = GText("Max_Level_Achieved")
      r0_10.AttributeButtonStyleParams[1].ForbidBtn = true
    else
      if r0_0.GetMaxLevel(r0_10.ComparedChar, CommonConst.ArmoryType.Char) <= r0_10.ComparedChar.Level then
        r0_10.AttributeButtonStyleParams[1].Text = GText("UI_FUNC_BREAKLEVELUP")
      else
        r0_10.AttributeButtonStyleParams[1].Text = GText("UI_FUNC_LEVELUP")
      end
      r0_10.AttributeButtonStyleParams[1].ForbidBtn = false
    end
    r0_10.AttributeButtonStyleParams[1].Visibility = UIConst.VisibilityOp.SelfHitTestInvisible
    r0_10.AttributeButtonStyleParams[2].Visibility = UIConst.VisibilityOp.SelfHitTestInvisible
    if r0_10.CharMain_CurContent == r0_10.CharMain_CmpContent then
      r0_10.AttributeButtonStyleParams[2].Text = GText("UI_Armory_AlreadyPut")
      r0_10.AttributeButtonStyleParams[2].ForbidBtn = true
    else
      r0_10.AttributeButtonStyleParams[2].Text = GText("UI_Armory_PutOn")
      r0_10.AttributeButtonStyleParams[2].ForbidBtn = false
    end
    if r0_10.Params.bHideDeployBtn then
      r0_10.AttributeButtonStyleParams[2].Visibility = UIConst.VisibilityOp.Collapsed
    end
    r0_10.CurrentSubUI:UpdateButtonStyle(r0_10.AttributeButtonStyleParams)
    if r0_10.CurrentChar == r0_10.ComparedChar then
      r0_10.CurrentSubUI:SetOpenModParams(nil)
    else
      r0_10.CurrentSubUI:SetOpenModParams({
        CharUuid = r0_10.ComparedChar.Uuid,
      })
    end
  end,
  UpdateCharInfos = function(r0_11)
    -- line: [209, 224] id: 11
    r0_11.Panel_Element:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r0_11.Tab_L:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    if r0_11.bHideBoxBtn then
      r0_11.BoxWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
    else
      r0_11.BoxWidget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
    r0_11.Panel_Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
    local r1_11 = DataMgr.Char[r0_11.ComparedChar.CharId]
    r0_11.TextBlock_Name:SetText(GText(r1_11.CharName))
    r0_11:SetStars(r1_11.CharRarity and 0)
    r0_11:CharMain_SetElementIcon(DataMgr.BattleChar[r0_11.ComparedChar.CharId].Attribute)
  end,
  CharMain_SetElementIcon = function(r0_12, r1_12)
    -- line: [226, 241] id: 12
    if r1_12 then
      r0_12.Panel_Element:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      r0_12.Panel_Element:SetVisibility(UIConst.VisibilityOp.Collapsed)
      return 
    end
    local r2_12 = "Armory_" .. r1_12
    r0_12.Image_Element:SetBrushResourceObject(LoadObject("/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. r2_12 .. ".T_" .. r2_12))
    r0_12.Stats_ListView:ClearListItems()
    local r4_12, r5_12 = UIUtils.GetAllElementTypes()
    for r10_12, r11_12 in ipairs(r4_12) do
      r0_12.Stats_ListView:AddItem(r0_12:NewElmtIconContent(r11_12, r5_12[r10_12], r11_12 == r1_12))
    end
    -- close: r6_12
  end,
  NewElmtIconContent = function(r0_13, r1_13, r2_13, r3_13)
    -- line: [243, 250] id: 13
    local r4_13 = NewObject(UIUtils.GetCommonItemContentClass())
    local r5_13 = "Armory_" .. r1_13
    r4_13.Icon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. r5_13 .. ".T_" .. r5_13
    r4_13.Text = GText(r2_13)
    r4_13.IsSelected = r3_13
    return r4_13
  end,
  CharMain_UpdateBoxReddot = function(r0_14)
    -- line: [253, 259] id: 14
    local r1_14 = ReddotManager.GetTreeNode(DataMgr.ReddotNode.PromoteChar.Name)
    local r2_14 = ReddotManager.GetTreeNode(DataMgr.ReddotNode.NewChar.Name)
    local r3_14 = r2_14 and r2_14.Count > 0
    r0_14:UpdateBoxReddotView(r3_14, r1_14 and r1_14.Count > 0)
  end,
  OnRoleListEntryGenerated = function(r0_15, r1_15)
    -- line: [261, 263] id: 15
    if not r1_15 then
      return 
    end
  end,
  OnRoleListEntryReleased = function(r0_16, r1_16)
    -- line: [265, 267] id: 16
    if not r1_16 then
      return 
    end
  end,
  CharMain_OnRoleListItemClicked = function(r0_17, r1_17)
    -- line: [273, 293] id: 17
    if r0_17.CharMain_CmpContent == r1_17 then
      return 
    end
    r0_17.ComparedChar = r1_0:GetAvatar().Chars[r1_17.Uuid] and r1_17.Target
    r0_17:CreateMainTabs({
      Char = r0_17.ComparedChar,
      Avatar = r1_17.Avatar,
    })
    local r3_17 = r0_17.MainTabName2Idx[r0_17.CurMainTab.Name]
    if r0_17.MainTabs[r3_17] and r0_17.MainTabs[r3_17].Name == r0_17.CurMainTab.Name then
      r0_17.CurMainTab = r0_17.MainTabs[r3_17]
      r0_17.CurMainTab.IsOn = true
      r0_17:UpdateMainTabs(r0_17.MainTabs)
      r0_17.CurMainTab.IsOn = false
      r0_17:SelectRoleListItem(r1_17)
    else
      r0_17:UpdateMainTabs(r0_17.MainTabs)
      r0_17.Tab_Arm:SelectTab(1)
    end
    r0_17:AddMainTabReddotListen()
  end,
  CharMain_SelectRoleListItem = function(r0_18, r1_18)
    -- line: [296, 317] id: 18
    if r0_18.bFromArchive then
      r1_0:SetArchiveReddotRead(r1_18)
    end
    r1_0:SetItemIsSelected(r0_18.CharMain_CmpContent, false)
    r1_0:SetItemIsSelected(r1_18, true)
    r0_18.CharMain_CmpContent = r1_18
    r0_18:UpdateCharInfos()
    if r0_18.CharMain_CmpContent.Avatar then
      r0_18.ActorController:SetAvatar(r0_18.CharMain_CmpContent.Avatar)
    end
    r0_18.ActorController:ChangeCharModel(r0_18.ComparedChar)
    r0_18.ActorController:SetAvatar(r1_0:GetAvatar())
    r0_18:CreateAndSelectSubTab()
    r0_18:UpdateCharCardLevel()
    r1_0:SetItemReddotRead(r1_18, true)
    if r1_18.IsOwned then
      r0_18:_UpdateSkillUpgradeReddot(r1_0:GetAvatar(), r1_18.Uuid)
      r0_18:AddSubTabReddotListen()
    end
  end,
  UpdateCharCardLevel = function(r0_19)
    -- line: [319, 333] id: 19
    for r5_19, r6_19 in ipairs(r0_19.SubTabs) do
      if r6_19.Name == r1_0.ArmorySubTabNames.Grade then
        r6_19.Number = r0_19.ComparedChar.GradeLevel
        r6_19.IsMaxLevel = DataMgr.GlobalConstant.CharCardLevelMax.ConstantValue <= r6_19.Number
        local r8_19 = r6_19.Widget
        if r8_19 then
          r8_19:SetNumber(r6_19.Number)
          r8_19:SetIsMaxLevel(r6_19.IsMaxLevel)
          break
        else
          break
        end
      end
    end
    -- close: r1_19
  end,
}
local function r4_0(r0_20, r1_20)
  -- line: [335, 345] id: 20
  local r2_20 = r1_0:NewCharOrWeaponItemContent(r1_20, CommonConst.ArmoryType.Char, CommonConst.ArmoryTag.Char, nil, r0_20.ReddotFrom)
  r2_20.bHideItemLevel = r0_20.bFromArchive
  r2_20.IsOwned = true
  r0_20.BP_CharItemContents:Add(r2_20)
  r0_20.CharItemContentsMap[r1_20.Uuid] = r2_20
  r0_20.CharId2Content[r1_20.CharId] = r2_20
  table.insert(r0_20.CharItemContentsArray, r2_20)
  r0_20:OnRoleListContentCreated(r2_20)
  return r2_20
end
local function r5_0(r0_21, r1_21)
  -- line: [347, 366] id: 21
  local r2_21 = r1_0:NewCharOrWeaponItemContent(r1_21, CommonConst.ArmoryType.Char, CommonConst.ArmoryTag.Char, true, r0_21.ReddotFrom)
  r2_21.bHideItemLevel = true
  r2_21.IsOwned = false
  r2_21.LockType = 2
  r2_21.Level = nil
  r2_21.Unlockable = not not r1_0:TryAddUnlockableCharReddot(r1_21.CharId)
  r2_21.IsNew = r1_0:TryAddNewReleasedCharReddot(r1_21.CharId)
  if r2_21.Unlockable then
    r2_21.RedDotType = UIConst.RedDotType.CommonRedDot
  elseif r2_21.IsNew then
    r2_21.RedDotType = UIConst.RedDotType.NewRedDot
  end
  r0_21.BP_CharItemContents:Add(r2_21)
  r0_21.CharItemContentsMap[r1_21.Uuid] = r2_21
  r0_21.UnownedCharContentMap[r1_21.CharId] = r2_21
  table.insert(r0_21.CharItemContentsArray, r2_21)
  r0_21:OnRoleListContentCreated(r2_21)
  return r2_21
end
local function r6_0(r0_22, r1_22, r2_22)
  -- line: [368, 388] id: 22
  r0_22.CharItemContentsMap[r1_22.Uuid] = nil
  if r0_22.UnownedCharContentMap[r1_22.UnitId] then
    r0_22.UnownedCharContentMap[r1_22.UnitId] = nil
  end
  local r3_22 = r1_0:NewCharOrWeaponItemContent(r2_22, CommonConst.ArmoryType.Char, CommonConst.ArmoryTag.Char, nil, r0_22.ReddotFrom)
  r1_22.Uuid = r3_22.Uuid
  r0_22.CharItemContentsMap[r1_22.Uuid] = r1_22
  r0_22.CharId2Content[r1_22.UnitId] = r1_22
  r1_22.bHideItemLevel = r0_22.bFromArchive
  r1_22.IsOwned = true
  r1_22.LockType = r3_22.LockType
  r1_22.Level = r3_22.Level
  r1_22.IsNew = r3_22.IsNew
  r1_22.Upgradeable = r3_22.Upgradeable
  r1_22.RedDotType = r3_22.RedDotType
  r1_22.Target = nil
  r1_22.AvatarPrime = nil
  r1_22.AvatarMax = nil
  r1_22.Avatar = nil
end
function r3_0.CharMain_CreateItemContents(r0_23)
  -- line: [391, 470] id: 23
  local r1_23 = r1_0:GetAvatar()
  rawset(r0_23, "CharItemContentsMap", {})
  rawset(r0_23, "CharItemContentsArray", {})
  rawset(r0_23, "UnownedCharContentMap", {})
  rawset(r0_23, "CharId2Content", {})
  r0_23.BP_CharItemContents:Clear()
  local r2_23 = {}
  local r3_23 = GWorld:GetAvatar()
  if r3_23 then
    for r8_23, r9_23 in pairs(r3_23.Chars) do
      r2_23[r9_23.CharId] = r9_23
    end
    -- close: r4_23
  end
  local function r4_23(r0_24)
    -- line: [405, 411] id: 24
    if r2_23[r0_24.CharId] or r0_23.IsPreviewMode then
      return r4_0(r0_23, r0_24)
    else
      return r5_0(r0_23, r0_24)
    end
  end
  local r5_23 = r1_23.Chars
  if r0_23.Params.CharUuids then
    r5_23 = {}
    for r10_23, r11_23 in ipairs(r0_23.Params.CharUuids) do
      if r1_23.Chars[r11_23] then
        table.insert(r5_23, r1_23.Chars[r11_23])
      end
    end
    -- close: r6_23
  end
  if r0_23.DoNotSort and r0_23.IsPreviewMode then
    local r6_23 = {}
    if r0_23.InitialOrderCharUuids then
      for r11_23, r12_23 in ipairs(r0_23.InitialOrderCharUuids) do
        table.insert(r6_23, r5_23[r12_23])
      end
      -- close: r7_23
    else
      r6_23 = r5_23
    end
    for r11_23, r12_23 in ipairs(r6_23) do
      r4_23(r12_23)
    end
    -- close: r7_23
  else
    for r10_23, r11_23 in pairs(r5_23) do
      r4_23(r11_23)
    end
    -- close: r6_23
    if r0_23.IsPreviewMode or r0_23.Params.CharUuids then
      return 
    end
    try({
      exec = function()
        -- line: [443, 462] id: 25
        r1_0:DontResetUuid(true)
        local r1_25 = Const.DefaultAttributeMaster[1 - r3_23.Sex]
        for r6_25, r7_25 in pairs(DataMgr.Char) do
          if not r7_25.IsNotOpen and r1_25 ~= r6_25 and not r2_23[r6_25] and CommonUtils.IsCurrentVersionRealease(CommonConst.DataType.Char, r6_25) then
            local r8_25 = r1_0:CreateNewDummyAvatar(r1_0.PreviewTargetStates.Prime, {
              CharIds = {
                r6_25
              },
            })
            local r9_25, r10_25 = next(r8_25.Chars)
            local r11_25 = r4_23(r10_25)
            r11_25.Target = r10_25
            r11_25.AvatarPrime = r8_25
            r11_25.AvatarMax = r1_0:CreateNewDummyAvatar(r1_0.PreviewTargetStates.Max, {
              CharIds = {
                r6_25
              },
            })
            r11_25.Avatar = r8_25
          end
        end
        -- close: r2_25
        r1_0:DontResetUuid(false)
      end,
      catch = function(r0_26)
        -- line: [463, 467] id: 26
        local r1_26 = debug.traceback()
        if not r0_26 then
          r0_26 = ""
        end
        DebugPrint("Error: CY@ 未解锁角色信息创建失败!\n" .. r0_26 .. "\n" .. r1_26)
      end,
    })
  end
end
function r3_0.CharMain_SortItemContents(r0_27)
  -- line: [472, 493] id: 27
  if r0_27.DoNotSort then
    return 
  end
  r1_0:SortItemContents(r0_27.CharItemContentsArray, {
    "Level",
    "SortPriority",
    "UnitId"
  }, CommonConst.DESC, r0_27.CharMain_CurContent, function(r0_28, r1_28)
    -- line: [481, 492] id: 28
    if r0_28.IsOwned or r1_28.IsOwned then
      return r1_0.IsOwnedCmpFunc(r0_28, r1_28)
    end
    if r0_28.Unlockable ~= r1_28.Unlockable then
      if r0_28.Unlockable then
        return true
      else
        return false
      end
    end
  end)
end
function r3_0.CharMain_SortAndInitRoleList(r0_29)
  -- line: [495, 499] id: 29
  r0_29:CharMain_InitContentState()
  r0_29:CharMain_SortItemContents()
  r0_29:InitRoleList()
end
function r3_0.CharMain_InitRoleList(r0_30)
  -- line: [501, 511] id: 30
  r0_30.EMListView_Role:ClearListItems()
  for r5_30, r6_30 in ipairs(r0_30.CharItemContentsArray) do
    r0_30.EMListView_Role:AddItem(r6_30)
    if r6_30.IsSelect then
      r0_30.EMListView_Role:BP_ScrollItemIntoView(r6_30)
    end
  end
  -- close: r1_30
  r0_30.EMListView_Role:RegenerateAllEntries()
end
function r3_0.CharMain_InitContentState(r0_31)
  -- line: [513, 530] id: 31
  if r0_31.CharMain_CurContent then
    r0_31.CharMain_CurContent.bInGear = false
  end
  if r0_31.CharMain_CmpContent then
    r0_31.CharMain_CmpContent.IsSelect = false
  end
  if r0_31.CurrentChar then
    r0_31.CharMain_CurContent = r0_31.CharItemContentsMap[r0_31.CurrentChar.Uuid]
    if r0_31.CharMain_CurContent then
      r0_31.CharMain_CurContent.bInGear = true
    end
  end
  if not r0_31.CharMain_CmpContent or not r0_31.CharMain_CmpContent.Avatar then
    r0_31.CharMain_CmpContent = r0_31.CharItemContentsMap[r0_31.ComparedChar.Uuid]
  end
  r0_31.CharMain_CmpContent.IsSelect = true
end
function r3_0.CharMain_UpdateResourceInfos(r0_32)
  -- line: [532, 534] id: 32
  r0_32.Tab_Arm:UpdateResource()
end
function r3_0.CharMain_OnBtnIntensifyClicked(r0_33)
  -- line: [536, 573] id: 33
  local r1_33 = r0_33.CurSubTab.Type
  local r2_33 = r0_33.CurSubTab.Tag
  local r3_33 = r0_33.ComparedChar.CharId
  local r5_33 = r0_33.ComparedChar.Level
  if r5_33 < DataMgr.Char[r3_33].CharMaxLevel then
    local r6_33 = {
      Target = r0_33.ComparedChar,
      Type = r1_33,
      Tag = r2_33,
      HideItemTips = true,
    }
    local r7_33 = DataMgr.CharBreak[r3_33]
    local r8_33 = r7_33 and r7_33[r0_33.ComparedChar.EnhanceLevel + 1]
    local r9_33 = DataMgr.SystemUI.ArmoryCardLevelWeapon
    if r8_33 then
      if r5_33 < r8_33.CharBreakLevel then
        r6_33.BehaviourType = "LevelUp"
        UIManager(r0_33):LoadUI(UIConst.LoadInConfig, r9_33.UIName, r0_33:GetZOrder(), CommonConst.ArmoryType.Char, r0_33.ComparedChar, r0_33, r6_33)
      else
        r6_33.BehaviourType = "BreakLevelUp"
        UIManager(r0_33):LoadUI(UIConst.LoadInConfig, r9_33.UIName, r0_33:GetZOrder(), CommonConst.ArmoryType.Char, r0_33.ComparedChar, r0_33, r6_33)
      end
    else
      r6_33.BehaviourType = "LevelUp"
      UIManager(r0_33):LoadUI(UIConst.LoadInConfig, r9_33.UIName, r0_33:GetZOrder(), CommonConst.ArmoryType.Char, r0_33.ComparedChar, r0_33, r6_33)
    end
  else
    UIManager(r0_33):ShowUITip("CommonToastMain", GText("Max_Level_Achieved"))
  end
end
function r3_0.CharMain_OnBtnReplaceClicked(r0_34)
  -- line: [575, 580] id: 34
  if not r0_34.ComparedChar or not r0_34.ComparedChar.Uuid or r0_34.ComparedChar == r0_34.CurrentChar then
    return 
  end
  r0_34:ServerSwitchRole()
end
function r3_0.ServerSwitchRole(r0_35)
  -- line: [582, 587] id: 35
  local r1_35 = r1_0:GetAvatar()
  if not r1_35 then
    return 
  end
  r0_35:BlockAllUIInput(true)
  r1_35:SwitchCurrentChar(r0_35.ComparedChar.Uuid)
end
function r3_0.CharMain_OnForbiddenBtnIntensifyClicked(r0_36)
  -- line: [589, 591] id: 36
  UIManager(r0_36):ShowUITip("CommonToastMain", GText("Max_Level_Achieved"))
end
function r3_0.CharMain_OnForbiddenBtnReplaceClicked(r0_37)
  -- line: [593, 594] id: 37
end
function r3_0.PlayRoleSelectedSound(r0_38)
  -- line: [596, 598] id: 38
  AudioManager(r0_38):PlayItemSound(r0_38, r0_38.ComparedChar.CharId, "Click", "Char")
end
function r3_0._UpdateSkillUpgradeReddot(r0_39, r1_39, r2_39)
  -- line: [600, 617] id: 39
  if r0_39.IsPreviewMode or r1_0:GetCharByUuid(r2_39) == nil then
    return 
  end
  if not r2_39 then
    r2_39 = r0_39.ComparedChar.Uuid
  end
  local r3_39 = CommonConst.DataType.Char .. Const.Skill
  local r4_39 = r1_39.Chars[r2_39]
  if r4_39 == nil then
    return 
  end
  for r9_39, r10_39 in pairs(r4_39.Skills) do
    local r11_39 = r2_0.CalcSkillCanLvup(r10_39.SkillId, r10_39.Level, r10_39.Level + 1, r2_39)
    r1_0:TryAddNewCharSkillReddot(r10_39, nil, r2_39, r11_39.CanLevelUp)
    if not r11_39.CanLevelUp then
      r1_0:SetItemReddotRead({
        Type = r3_39,
        CharUuid = r2_39,
        SkillId = r10_39.SkillId,
      }, false, true)
    end
  end
  -- close: r5_39
end
function r3_0.CharMain_PreMainTabChange(r0_40)
  -- line: [619, 622] id: 40
  r0_40:ShowElementTips(false)
  r0_40:RemoveSubTabReddotListen()
end
function r3_0.CharMain_PreSubTabChange(r0_41)
  -- line: [624, 627] id: 41
  r0_41:ResetCharData()
end
function r3_0.ResetCharData(r0_42)
  -- line: [629, 639] id: 42
  local r1_42 = r1_0:GetAvatar()
  if r0_42.CharMain_CmpContent and r0_42.CharMain_CmpContent.Avatar then
    r1_42 = r0_42.CharMain_CmpContent.Avatar
  end
  r0_42.ComparedChar = r1_42.Chars[r0_42.ComparedChar.Uuid] and r0_42.CharMain_CmpContent and r0_42.CharMain_CmpContent.Target
  if r0_42.CurrentChar then
    r0_42.CurrentChar = r1_42.Chars[r0_42.CurrentChar.Uuid]
  end
end
function r3_0.OnNewCharObtained(r0_43, r1_43)
  -- line: [642, 661] id: 43
  local r3_43 = r1_0:GetAvatar().Chars[r1_43]
  if not r3_43 or r0_43.CharItemContentsMap[r1_43] then
    return 
  end
  local r4_43 = r0_43.UnownedCharContentMap[r3_43.CharId]
  if r4_43 then
    r6_0(r0_43, r4_43, r3_43)
    local r5_43 = r0_43.CharMain_CmpContent.UnitId == r4_43.UnitId
    if r5_43 then
      r0_43.ComparedChar = r3_43
    end
    r0_43:CharMain_SortAndInitRoleList()
    if r5_43 then
      r0_43:SelectRoleListItem(r4_43)
    end
    r0_43:UpdateBoxReddot()
  end
end
function r3_0.OnSwitchCurrentChar(r0_44, r1_44)
  -- line: [664, 680] id: 44
  r0_44:BlockAllUIInput(false)
  if not ErrorCode:Check(r1_44) then
    return 
  end
  local r2_44 = r1_0:GetAvatar()
  r0_44.CurrentChar = r2_44.Chars[r2_44.CurrentChar]
  r0_44.ComparedChar = r0_44.CurrentChar
  if r0_44.CurMainTab.Name ~= r1_0.ArmoryMainTabNames.Char then
    return 
  end
  AudioManager(r0_44):PlayUISound(r0_44, "event:/ui/common/click_btn_confirm_positive", nil, nil)
  r1_0:SetItemInGear(r0_44.CharMain_CurContent, false)
  r1_0:SetItemInGear(r0_44.CharMain_CmpContent, true)
  r0_44.CharMain_CurContent = r0_44.CharMain_CmpContent
  r0_44:CharMain_UpdatAttributeButton()
end
function r3_0.OnCharUpgraded(r0_45, r1_45, r2_45, r3_45, r4_45)
  -- line: [682, 698] id: 45
  local r6_45 = r1_0:GetAvatar().Chars[r2_45]
  if not r6_45 then
    return 
  end
  r0_45:ResetCharData()
  local r7_45 = r0_45.CharItemContentsMap[r2_45]
  if not r7_45 then
    return 
  end
  r1_0:SetItemLevel(r7_45, r6_45.Level)
  if r0_45.CharMain_CmpContent == r7_45 then
    r0_45:InitSubUI()
  end
  r0_45:CharMain_SortAndInitRoleList()
end
function r3_0.OnCharSkillLevelUp(r0_46, r1_46, r2_46, r3_46)
  -- line: [700, 705] id: 46
  r0_46:ResetCharData()
  local r4_46 = r1_0:GetAvatar()
  r1_0:SetItemReddotRead({
    Type = CommonConst.DataType.Char .. Const.Skill,
    CharUuid = r0_46.ComparedChar.Uuid,
    SkillId = r2_46,
  }, false, true)
  r0_46:_UpdateSkillUpgradeReddot(r4_46)
end
function r3_0.OnCharGradeLevelUp(r0_47, r1_47, r2_47, r3_47)
  -- line: [707, 715] id: 47
  if not r1_0:GetAvatar().Chars[r2_47] then
    return 
  end
  r0_47:ResetCharData()
  r0_47:UpdateCharCardLevel()
end
function r3_0.OnCharCardLevelResourcesChanged(r0_48, r1_48, r2_48, r3_48)
  -- line: [718, 781] id: 48
  if r0_48.IsPreviewMode then
    return 
  end
  local r4_48 = nil
  if r3_48 then
    if not r0_48.CharItemContentsMap then
      return 
    end
    r0_48:ResetCharData()
    local r6_48 = r1_0:GetAvatar().Chars[r3_48]
    r4_48 = r0_48.CharItemContentsMap[r3_48]
    if r6_48 and r4_48 then
      r4_48.Upgradeable = r0_0.CheckCharCanUpgradeCardLevel(r6_48)
      if r4_48.IsNew then
        r4_48.RedDotType = UIConst.RedDotType.NewRedDot
      elseif r4_48.Upgradeable then
        r4_48.RedDotType = UIConst.RedDotType.CommonRedDot
      else
        r4_48.RedDotType = nil
      end
      if r4_48.SelfWidget then
        r4_48.SelfWidget:SetRedDot(r4_48.RedDotType)
      end
      if r4_48.Widget then
        r4_48.Widget:SetReddot(r4_48.RedDotType)
      end
      if r6_48 == r0_48.ComparedChar and r0_48.CurSubTab and r0_48.CurSubTab.Type == CommonConst.ArmoryType.Char then
        r0_48:SubTabReddotFunc(r1_0.ArmorySubTabNames.Grade, nil, r4_48.Upgradeable)
      end
    end
  else
    if not r0_48.UnownedCharContentMap then
      return 
    end
    r4_48 = r0_48.UnownedCharContentMap[r2_48]
    if r4_48 then
      r4_48.Unlockable = not not r1_0:TryAddUnlockableCharReddot(r2_48)
      if r4_48.Unlockable then
        r4_48.RedDotType = UIConst.RedDotType.CommonRedDot
        r0_48:CharMain_SortAndInitRoleList()
      elseif r4_48.IsNew then
        r4_48.RedDotType = UIConst.RedDotType.NewRedDot
      else
        r4_48.RedDotType = nil
      end
    end
  end
  if not r4_48 then
    return 
  end
  if r4_48.SelfWidget then
    r4_48.SelfWidget:SetRedDot(r4_48.RedDotType)
  end
  if r4_48.Widget then
    r4_48.Widget:SetReddot(r4_48.RedDotType)
  end
  if r4_48 == r0_48.CharMain_CmpContent then
    r0_48:UpdateSubTabReddotCommon(r1_0.ArmorySubTabNames.Attribute)
  end
end
function r3_0.OnCharRewardStateChanged(r0_49, r1_49)
  -- line: [783, 797] id: 49
  if r0_49.IsPreviewMode then
    return 
  end
  local r2_49 = r0_49.CharId2Content[r1_49]
  if not r2_49 then
    return 
  end
  r2_49.HasReward = GWorld:GetAvatar():IsCharHasReward(r1_49)
  r1_0:UpdateContentRetDotType(r2_49)
  if r2_49 == r0_49.CharMain_CmpContent then
    r0_49:UpdateSubTabReddotCommon(r1_0.ArmorySubTabNames.Attribute)
  end
end
function r3_0.CharMain_OnFocusReceived(r0_50, r1_50)
  -- line: [799, 800] id: 50
end
function r3_0.CharMain_InitKeySetting(r0_51, r1_51, r2_51, r3_51)
  -- line: [803, 824] id: 51
  if not r0_51.bHideSquadBuildBtn or not r0_51.IsPreviewMode then
    r0_51:AddKeyEvents(r1_51, r0_51.MenuKeyDownEvents)
  end
  r0_51:AddKeyEvents(r2_51, r0_51.LeftThumbstickKeyUpEvents)
  r0_51.LeftThumbstickBottomKeyInfoList.Desc = GText("UI_CTL_CheckProperty")
  table.insert(r3_51, r0_51.LeftThumbstickBottomKeyInfoList)
  r0_51:AddKeyEvents(r1_51, r0_51.LeftThumbstickKeyDownEvents, r0_51.MainTabKeyDownEvents, r0_51.CommonKeyDownEvents)
  if r0_51.Tab_L:IsVisible() then
    table.insert(r3_51, r0_51.RoleUpDownBottomKeyInfoList)
    r0_51:AddKeyEvents(r1_51, r0_51.RoleTabKeyDownEvents)
  end
  if r0_51.CurSubTab.Name == r1_0.ArmorySubTabNames.Attribute and not r0_51.AttributeButtonStyleParams[1].ForbidBtn and not r0_51.IsPreviewMode and r1_0:GetCharByUuid(r0_51.ComparedChar.Uuid) ~= nil then
    r0_51:AddKeyEvents(r1_51, r0_51.UpgradeKeyDownEvents)
  end
  table.insert(r3_51, r0_51.ESCKeyInfoList)
end
function r3_0.CharMain_InitNavigationRules(r0_52)
  -- line: [826, 828] id: 52
  r0_52:InitNavigationRulesCommon()
end
function r3_0.CharMain_OnSubTabLeftKeyDown(r0_53)
  -- line: [830, 834] id: 53
  if r0_53.CurrentSubUI and r0_53.CurrentSubUI.OnTabLeftKeyDown then
    r0_53.CurrentSubUI:OnTabLeftKeyDown()
  end
end
function r3_0.CharMain_OnSubTabRightKeyDown(r0_54)
  -- line: [836, 840] id: 54
  if r0_54.CurrentSubUI and r0_54.CurrentSubUI.OnTabRightKeyDown then
    r0_54.CurrentSubUI:OnTabRightKeyDown()
  end
end
function r3_0.CharMain_OnLeftThumbstickKeyDown(r0_55)
  -- line: [842, 844] id: 55
  r0_55:ShowElementTips(true)
end
function r3_0.CharMain_OnLeftThumbstickKeyUp(r0_56)
  -- line: [846, 848] id: 56
  r0_56:ShowElementTips(false)
end
function r3_0.CharMain_OnViewKeyDown(r0_57)
  -- line: [850, 851] id: 57
end
function r3_0.CharMain_OnRightThumbstickKeyDown(r0_58)
  -- line: [853, 854] id: 58
end
return r3_0
