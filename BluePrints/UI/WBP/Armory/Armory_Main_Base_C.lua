-- filename: @E:/Pack/Branch/OBT10_Geili\Content/Script/BluePrints\UI\WBP\Armory\Armory_Main_Base_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local r1_0 = require("BluePrints.UI.WBP.Armory.ActorController.Armory_ActorController")
local r2_0 = require("BluePrints.Common.MVC.Model.WeaponModel")
local r3_0 = require("Utils.UIUtils")
local r4_0 = UE4.UWidgetBlueprintLibrary.Handled()
local r5_0 = Class("BluePrints.UI.BP_UIState_C")
function r5_0.Construct(r0_1)
  -- line: [19, 63] id: 1
  r0_1.Loaded = false
  r5_0.Super.Construct(r0_1)
  r0_1:CreateConstInfos()
  r0_1:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_1.TextBlock_Name:SetText("")
  r0_1.EMListView_SubTab:SetScrollbarVisibility(UIConst.VisibilityOp.Collapsed)
  r0_1.EMListView_SubTab:DisableScroll(true)
  r0_1.WaitForCloseEventCount = 0
  r0_1.NoneTab = {
    Name = "None",
  }
  r0_1.CurMainTab = r0_1.NoneTab
  r0_1.CurSubTab = r0_1.NoneTab
  r0_1.Panel_SubUI:ClearChildren()
  r0_1.SubUIs = {}
  r0_1.SelectedContents = {}
  r0_1.ComponentReceivedEvent = {}
  r0_1:UnbindFromAnimationStarted(r0_1.Auto_Out, {
    r0_1,
    r0_1.OnOutAnimStarted
  })
  r0_1:BindToAnimationStarted(r0_1.Auto_Out, {
    r0_1,
    r0_1.OnOutAnimStarted
  })
  r0_1:UnbindFromAnimationFinished(r0_1.Auto_Out, {
    r0_1,
    r0_1.OnOutAnimFinished
  })
  r0_1:BindToAnimationFinished(r0_1.Auto_Out, {
    r0_1,
    r0_1.OnOutAnimFinished
  })
  r0_1:UnbindFromAnimationFinished(r0_1.RoleList_In, {
    r0_1,
    r0_1.OnRoleListInAnimFinished
  })
  r0_1:BindToAnimationFinished(r0_1.RoleList_In, {
    r0_1,
    r0_1.OnRoleListInAnimFinished
  })
  r0_1:UnbindFromAnimationStarted(r0_1.RoleList_In, {
    r0_1,
    r0_1.OnRoleListInAnimStarted
  })
  r0_1:BindToAnimationStarted(r0_1.RoleList_In, {
    r0_1,
    r0_1.OnRoleListInAnimStarted
  })
  r0_1.EMListView_SubTab.BP_OnItemClicked:Clear()
  r0_1.EMListView_SubTab.BP_OnItemClicked:Add(r0_1, r0_1.OnSubTabItemClicked)
  r0_1.EMListView_Role.BP_OnItemClicked:Clear()
  r0_1.EMListView_Role.BP_OnItemClicked:Add(r0_1, function(r0_2, r1_2)
    -- line: [46, 48] id: 2
    r0_2:OnRoleListItemClicked(r1_2)
  end)
  r0_1.EMListView_Role.BP_OnEntryInitialized:Clear()
  r0_1.EMListView_Role.BP_OnEntryInitialized:Add(r0_1, r0_1.OnRoleListEntryInitialized)
  r0_1.Btn_Edit:BindEventOnClicked(r0_1, r0_1.OnEditBtnClicked)
  r0_1.Btn_Locked:BindEventOnClicked(r0_1, r0_1.OnLockBtnClicked)
  r0_1.Btn_Locked:TryOverrideSoundFunc(function()
    -- line: [53, 55] id: 3
    AudioManager(r0_1):PlayUISound(r0_1, "event:/ui/common/click_btn_small", nil, nil)
  end)
  r0_1.Button_Element.OnHovered:Add(r0_1, r0_1.OnBtnElementHovered)
  r0_1.Button_Element.OnUnhovered:Add(r0_1, r0_1.OnBtnElementUnhovered)
  r0_1.Image_Click.OnMouseButtonDownEvent:Unbind()
  r0_1.Image_Click.OnMouseButtonDownEvent:Bind(r0_1, r0_1.On_Image_Click_MouseButtonDown)
  if GWorld.GameInstance then
    GWorld.GameInstance:SetHighFrequencyMemoryCheckGCEnabled(true, "ArmoryMain")
  end
end
function r5_0.GetDesiredFocusTargetInfo(r0_4, r1_4)
  -- line: [65, 67] id: 4
  r1_4.Widget = r0_4
end
function r5_0.InitDispatcher(r0_5)
  -- line: [69, 77] id: 5
  r0_5:AddDispatcher(EventID.OnArmoryPreviewModeStateChanged, r0_5, r0_5.OnPreviewModeStateChanged)
  if r0_5.IsPreviewMode then
    return 
  end
  r0_5:AddDispatcher(EventID.OnArmoryTargetStateChanged, r0_5, r0_5.OnArmoryTargetStateChanged)
  r0_5:AddDispatcher(EventID.OnUpdateBagItem, r0_5, r0_5.OnBagItemLockedOrUnlocked)
  r0_5:ComponentInitDispatcher()
end
function r5_0.OnArmoryTargetStateChanged(r0_6, ...)
  -- line: [79, 81] id: 6
  r0_6:CallFunctionByName(r0_6.CurMainTab.Name .. "Main_OnArmoryTargetStateChanged", ...)
end
function r5_0.ComponentInitDispatcher(r0_7)
  -- line: [83, 84] id: 7
end
function r5_0.On_Image_Click_MouseButtonDown(r0_8, r1_8, r2_8)
  -- line: [88, 90] id: 8
  return r0_8:OnPointerDown(r1_8, r2_8)
end
function r5_0.OnMouseWheel(r0_9, r1_9, r2_9)
  -- line: [92, 97] id: 9
  if r0_9.ComponentReceivedEvent.WheelScroll then
    return r4_0
  end
  return r0_9:OnMouseWheelScroll(r1_9, r2_9)
end
function r5_0.OnMouseButtonUp(r0_10, r1_10, r2_10)
  -- line: [99, 101] id: 10
  return r0_10:OnPointerUp(r1_10, r2_10)
end
function r5_0.OnMouseMove(r0_11, r1_11, r2_11)
  -- line: [103, 105] id: 11
  return r0_11:OnPointerMove(r1_11, r2_11)
end
function r5_0.OnTouchEnded(r0_12, r1_12, r2_12)
  -- line: [107, 109] id: 12
  return r0_12:OnPointerUp(r1_12, r2_12)
end
function r5_0.OnTouchMoved(r0_13, r1_13, r2_13)
  -- line: [111, 113] id: 13
  return r0_13:OnPointerMove(r1_13, r2_13)
end
function r5_0.OnMouseCaptureLost(r0_14)
  -- line: [115, 117] id: 14
  r0_14:OnPointerCaptureLost()
end
function r5_0.OnEditBtnClicked(r0_15)
  -- line: [119, 121] id: 15
  r0_15:CallFunctionByName(r0_15.CurMainTab.Name .. "Main_OnEditBtnClicked")
end
function r5_0.OnLockBtnClicked(r0_16)
  -- line: [123, 125] id: 16
  r0_16:CallFunctionByName(r0_16.CurMainTab.Name .. "Main_OnLockBtnClicked")
end
function r5_0.OnBtnElementHovered(r0_17)
  -- line: [127, 129] id: 17
  r0_17:ShowElementTips(true)
end
function r5_0.OnBtnElementUnhovered(r0_18)
  -- line: [131, 133] id: 18
  r0_18:ShowElementTips(false)
end
function r5_0.OnBackgroundClicked(r0_19)
  -- line: [135, 138] id: 19
  r0_19:CallFunctionByName(r0_19.CurMainTab.Name .. "Main_OnBackgroundClicked")
  EventManager:FireEvent(EventID.OnMenuClose)
end
function r5_0.CallFunctionByName(r0_20, r1_20, ...)
  -- line: [142, 146] id: 20
  if r0_20[r1_20] then
    return r0_20[r1_20](r0_20, ...)
  end
end
function r5_0.InitUIInfo(r0_21, r1_21, r2_21, r3_21, r4_21)
  -- line: [150, 353] id: 21
  r5_0.Super.InitUIInfo(r0_21, r1_21, r2_21, r3_21, r4_21)
  r0_21.Loaded = false
  if not r4_21 then
    r4_21 = {}
  end
  if CommonUtils:IfExistSystemGuideUI(r0_21) and DataMgr.SystemGuide[SystemGuideManager.RunningId] then
    local r5_21 = DataMgr.SystemGuide[SystemGuideManager.RunningId].GuideInfo
    if r5_21 then
      for r10_21, r11_21 in pairs(r5_21) do
        r4_21[r10_21] = r11_21
      end
      -- close: r6_21
    end
  end
  r0_21.Params = r4_21
  r0_21.OnCloseDelegate = r4_21.OnCloseDelegate
  r0_21.bHideSquadBuildBtn = r4_21.bHideSquadBuildBtn
  r0_21.bFromArchive = r4_21.bFromArchive
  if r0_21.bFromArchive then
    r0_21.ReddotFrom = "Archive"
  end
  r0_21.DoNotSort = r4_21.DoNotSort
  r0_21.bHideBoxBtn = r4_21.bHideBoxBtn
  if r4_21.Title then
    r0_21.MainTabsStyle.TitleName = r4_21.Title
  end
  local r5_21 = r4_21.MainTabName
  local r6_21 = r4_21.SubTabName
  r0_0:SetIsPreviewMode(false)
  r0_21.IsPreviewMode = false
  r0_21.IsCharacterTrialMode = r4_21.IsCharacterTrialMode
  local r7_21 = false
  if r4_21.PreviewCharIds or r4_21.PreviewCharInfos or r4_21.PreviewWeaponIds or r4_21.PreviewWeaponInfos or r4_21.PreviewPetIds or r4_21.PreviewPetInfos then
    try({
      exec = function()
        -- line: [240, 276] id: 22
        r0_0:CreateDummyAvatar({
          CharIds = r4_21.PreviewCharIds,
          WeaponIds = r4_21.PreviewWeaponIds,
          CharInfos = r4_21.PreviewCharInfos,
          WeaponInfos = r4_21.PreviewWeaponInfos,
          UWeaponInfos = r4_21.PreviewUWeaponInfos,
          MeleeWeapon = r4_21.MeleeWeapon,
          RangedWeapon = r4_21.RangedWeapon,
          PetIds = r4_21.PreviewPetIds,
          PetInfos = r4_21.PreviewPetInfos,
        })
        r0_0:SetIsPreviewMode(true)
        if r0_0:HasAvatar(r0_0.PreviewTargetStates.Custom) then
          r0_0:SwitchPreviewTargetState(r0_0.PreviewTargetStates.Custom)
          r0_21.bNeedPreviewSwitcher = false
        elseif r0_0:HasAvatar(r0_0.PreviewTargetStates.Prime) then
          r0_0:SwitchPreviewTargetState(r0_0.PreviewTargetStates.Prime)
          r0_21.bNeedPreviewSwitcher = true
        else
          r0_0:SetIsPreviewMode(false)
          r0_0:DestroyDummyAvatar()
          return 
        end
        r0_21.IsPreviewMode = true
        local r0_22 = r0_0:GetAvatar()
        if not r5_21 then
          if next(r0_22.Chars) then
            r5_21 = r0_0.ArmoryMainTabNames.Char
          elseif next(r0_22.Weapons) then
            r5_21 = r0_0.ArmoryMainTabNames.Weapon
          elseif next(r0_22.Pets) then
            r5_21 = r0_0.ArmoryMainTabNames.Pet
          end
        end
        DebugPrint("CY@ ArmoryPreviewMode")
      end,
      catch = function(r0_23)
        -- line: [277, 282] id: 23
        r7_21 = true
        local r1_23 = debug.traceback()
        if not r0_23 then
          r0_23 = ""
        end
        DebugPrint("Error: CY@ 预览模式Avatar创建失败!\n" .. r0_23 .. "\n" .. r1_23)
      end,
    })
  end
  if r7_21 then
    r0_21.LoadFailed = true
    return 
  end
  local r8_21 = r0_0:GetAvatar()
  if not r8_21 then
    r0_21.LoadFailed = true
    return 
  end
  if r0_21.DoNotSort then
    r0_21:RecordInitialOrder()
  end
  AudioManager(r0_21):PlayUISound(r0_21, "event:/ui/armory/open", "ArmoryOpenedSound", nil)
  r0_21.CurrentChar = r8_21.Chars[r8_21.CurrentChar]
  r0_21.ComparedChar = r0_21.CurrentChar and r8_21.Chars[1]
  local r9_21 = r5_21
  if r0_21.IsPreviewMode then
    if not r4_21.Title then
      r0_21.MainTabsStyle.TitleName = GText("UI_Preview_Title")
    end
    if not r9_21 then
      r0_21.LoadFailed = true
      return 
    end
  end
  if not r9_21 then
    r9_21 = r0_0.ArmoryMainTabNames.Char
  end
  local r10_21 = {
    SelectedTargetUuid = r4_21.SelectedTargetUuid,
    SelectedTargetId = r4_21.SelectedTargetId,
    SelectedTargetIndex = r4_21.SelectedTargetIndex,
  }
  if r0_21.ComparedChar and r9_21 ~= r0_0.ArmoryMainTabNames.Char then
    r0_21:CallFunctionByName("CharMain_PreprocessContents", nil, r10_21)
  end
  r0_21:CallFunctionByName(r9_21 .. "Main_PreprocessContents", r9_21, r10_21)
  local r11_21 = r1_0
  local r13_21 = {
    ViewUI = r0_21,
    IsPreviewMode = r0_21.IsPreviewMode,
    IsCharacterTrialMode = r0_21.IsCharacterTrialMode,
    EPreviewSceneType = r4_21.EPreviewSceneType,
    Char = r0_21.ComparedChar,
    Weapon = r0_21[r0_21.ComparedWeaponName and ""],
    Pet = r0_21.ComparedPet,
    bNeedEndCamera = not r4_21.bNoEndCamera,
    OnRecorverCameraEnd = {
      Func = r0_21.OnRecorverCameraEnd,
      Obj = r0_21,
    },
    OnRecorverCameraStart = {
      Func = r0_21.OnRecorverCameraStart,
      Obj = r0_21,
    },
  }
  r0_21.ActorController = r11_21:New(r13_21)
  r0_21.ActorController:OnOpened()
  r0_21.MainTabsStyle.ShowSquadBuildBtn = r0_21:ShouldShowSquadBuildBtn()
  r0_21:InitMainTabsStyle(r0_21.MainTabsStyle)
  r0_21.Tab_Arm:BindEventOnTabSelected(r0_21, r0_21.OnMainTabClicked)
  r13_21 = {
    Char = r0_21.ComparedChar,
  }
  r0_21:CreateMainTabs(r13_21)
  r0_21:UpdateMainTabs(r0_21.MainTabs)
  r0_21:JumpToTab(r5_21 and r0_21.MainTabs[1].Name, r6_21)
  r0_21:PlayInAnim()
  r0_21:AddMainTabReddotListen()
  r0_21:InitDispatcher()
  r0_21.Loaded = true
  r0_21:AddTimer(0.1, function()
    -- line: [347, 352] id: 24
    local r0_24 = r4_21.SubPageName
    if r0_24 then
      r0_21:JumpToSubPage(r0_24)
    end
  end)
end
function r5_0.JumpToSubPage(r0_25, ...)
  -- line: [355, 357] id: 25
  r0_25:CallFunctionByName(r0_25.CurMainTab.Name .. "Main_JumpToSubPage", ...)
end
function r5_0.RecordInitialOrder(r0_26)
  -- line: [359, 391] id: 26
  local r1_26 = r0_0:GetAvatar()
  local function r2_26(r0_27, r1_27, r2_27)
    -- line: [361, 365] id: 27
    for r7_27, r8_27 in ipairs(r1_27) do
      table.insert(r0_27, r2_27[r8_27])
    end
    -- close: r3_27
  end
  local r3_26 = r0_26.Params
  if r3_26.PreviewCharIds and #r3_26.PreviewCharIds > 0 then
    r0_26.InitialOrderCharUuids = {}
    r2_26(r0_26.InitialOrderCharUuids, r3_26.PreviewCharIds, r1_26.CreateInfo2Uuids.Chars)
  end
  if r3_26.PreviewWeaponIds and #r3_26.PreviewWeaponIds > 0 then
    r0_26.InitialOrderWeaponUuids = {}
    r2_26(r0_26.InitialOrderWeaponUuids, r3_26.PreviewWeaponIds, r1_26.CreateInfo2Uuids.Weapons)
  end
  if r3_26.PreviewPetIds and #r3_26.PreviewPetIds > 0 then
    r0_26.InitialOrderPetUniqueId = {}
    r2_26(r0_26.InitialOrderPetUniqueId, r3_26.PreviewPetIds, r1_26.CreateInfo2Uuids.Pets)
  end
  if r3_26.PreviewCharInfos and #r3_26.PreviewCharInfos > 0 then
    r0_26.InitialOrderCharUuids = {}
    r2_26(r0_26.InitialOrderCharUuids, r3_26.PreviewCharInfos, r1_26.CreateInfo2Uuids.Chars)
  end
  if r3_26.PreviewWeaponInfos and #r3_26.PreviewWeaponInfos > 0 then
    r0_26.InitialOrderWeaponUuids = {}
    r2_26(r0_26.InitialOrderWeaponUuids, r3_26.PreviewWeaponInfos, r1_26.CreateInfo2Uuids.Weapons)
  end
  if r3_26.PreviewPetInfos and #r3_26.PreviewPetInfos > 0 then
    r0_26.InitialOrderPetUniqueId = {}
    r2_26(r0_26.InitialOrderPetUniqueId, r3_26.PreviewPetInfos, r1_26.CreateInfo2Uuids.Pets)
  end
end
function r5_0.ShouldShowSquadBuildBtn(r0_28)
  -- line: [393, 401] id: 28
  -- notice: unreachable block#9
  local r1_28 = GWorld:GetAvatar()
  if not r1_28 then
    return 
  end
  local r2_28 = DataMgr.UIUnlockRule.Squad
  if r2_28 then
    r2_28 = DataMgr.UIUnlockRule.Squad.ConditionId and 4110
  else
    goto label_17	-- block#4 is visited secondly
  end
  local r3_28 = r0_28.bHideSquadBuildBtn
  if not r3_28 then
    r3_28 = r0_28.IsPreviewMode and ConditionUtils.CheckCondition(r1_28, r2_28)
  else
    r3_28 = false
  end
  return r3_28
end
function r5_0.CreateMainTabs(r0_29, r1_29)
  -- line: [403, 406] id: 29
  r0_29.MainTabs = r0_29:CreateTabInfos(r0_29:GetTabsConfigData(), r1_29)
  r0_29:MappingMainTabIdx()
end
function r5_0.MappingMainTabIdx(r0_30)
  -- line: [408, 413] id: 30
  r0_30.MainTabName2Idx = {}
  for r5_30, r6_30 in ipairs(r0_30.MainTabs) do
    r0_30.MainTabName2Idx[r6_30.Name] = r5_30
  end
  -- close: r1_30
end
function r5_0.MappingSubTabIdx(r0_31)
  -- line: [415, 420] id: 31
  r0_31.SubTabName2Idx = {}
  for r5_31, r6_31 in ipairs(r0_31.SubTabs) do
    r0_31.SubTabName2Idx[r6_31.Name] = r5_31
  end
  -- close: r1_31
end
function r5_0.JumpToTab(r0_32, r1_32, r2_32)
  -- line: [423, 444] id: 32
  r0_32.SubTabName_JumpTo = r2_32
  if #r0_32.MainTabs > 0 and r1_32 then
    local r3_32 = nil
    local r4_32 = nil
    local r5_32 = r0_32.MainTabName2Idx[r1_32]
    local r6_32 = r0_32.MainTabs[r5_32]
    if r6_32 then
      r3_32 = r5_32
      r4_32 = r6_32
    end
    if r3_32 then
      if r0_32.CurMainTab and r4_32.Name == r0_32.CurMainTab.Name then
        r0_32:SelectMainTab(r4_32)
      else
        r0_32.Tab_Arm:SelectTab(r3_32 and 1)
      end
    end
  end
end
function r5_0.OnLoaded(r0_33, ...)
  -- line: [446, 454] id: 33
  r5_0.Super.OnLoaded(r0_33, ...)
  r0_33:BlockAllUIInput(false)
  if r0_33.LoadFailed then
    r0_33:Close()
    return 
  end
  r0_33.Loaded = true
end
function r5_0.CreateTabInfos(r0_34, r1_34, r2_34)
  -- line: [459, 493] id: 34
  if not r2_34 then
    r2_34 = {}
  end
  local r3_34 = r2_34.Char
  local r4_34 = {}
  local r5_34 = r0_0:GetAvatar()
  local r7_34 = r1_34.Tabs
  local r8_34 = 0
  for r13_34, r14_34 in ipairs(r1_34.TabIndexes) do
    local r15_34 = r7_34[r14_34]
    if r15_34.CreateFunc then
      local r16_34 = r15_34.CreateFunc(r5_34, r2_34)
      if r16_34 then
        for r21_34, r22_34 in ipairs(r16_34) do
          local r23_34, r24_34 = r22_34.CheckIsUnlocked(r5_34, r3_34, r2_34)
          if r23_34 then
            table.insert(r4_34, r0_34:CreateTabContent(r22_34, r13_34 + r8_34, r2_34))
            r8_34 = r8_34 + 1
          end
        end
        -- close: r17_34
      end
    else
      local r16_34, r17_34 = r15_34.CheckIsUnlocked(r5_34, r3_34, r2_34)
      if r16_34 then
        table.insert(r4_34, r0_34:CreateTabContent(r15_34, r13_34 + r8_34, r2_34))
      end
    end
  end
  -- close: r9_34
  return r4_34
end
function r5_0.CreateTabContent(r0_35, r1_35, r2_35, r3_35)
  -- line: [495, 522] id: 35
  local r4_35 = nil
  if r3_35.bCreatedWidthClass then
    r4_35 = NewObject(r3_0.GetCommonItemContentClass())
  else
    r4_35 = {}
  end
  r4_35.Owner = r0_35
  r4_35.TabId = r2_35
  r4_35.Name = r1_35.Name
  r4_35.Type = r1_35.Type
  r4_35.Tag = r1_35.Tag
  r4_35.Text = r1_35.Text
  r4_35.IconPath = r1_35.IconPath
  if r0_35.IsPC then
    r4_35.WidgetPath = r1_35.PCWidgetPath
  else
    r4_35.WidgetPath = r1_35.MobileWidgetPath
  end
  if not r0_35.IsPreviewMode then
    r4_35.CheckReddot = r1_35.CheckReddot
    if r1_35.CheckReddot then
      r4_35.IsNew, r4_35.Upgradeable = r1_35.CheckReddot(r3_35)
    end
  end
  r4_35.TabData = r1_35
  return r4_35
end
function r5_0.InitMainTabsStyle(r0_36, r1_36, r2_36)
  -- line: [526, 529] id: 36
  r0_36.CurrentMainTabsStyle = r1_36
  r0_36.Tab_Arm:Init(r1_36, r2_36)
end
function r5_0.UpdateMainTabs(r0_37, r1_37)
  -- line: [532, 535] id: 37
  r0_37.CurrentMainTabsStyle.ForceHideTabs = #r1_37 <= 1
  r0_37.Tab_Arm:UpdateTabs(r1_37)
end
function r5_0.SelectMainTab(r0_38, r1_38)
  -- line: [538, 542] id: 38
  r0_38:CallFunctionByName(r0_38.CurMainTab.Name .. "Main_PreMainTabChange")
  r0_38.CurMainTab = r1_38
  r0_38:CallFunctionByName(r1_38.Name .. "Main_Init")
end
function r5_0.OnMainTabClicked(r0_39, r1_39, r2_39)
  -- line: [545, 552] id: 39
  if r2_39 == r0_39.CurMainTab then
    return 
  end
  r0_39:SelectMainTab(r2_39)
end
function r5_0.UpdateSubTabs(r0_40, r1_40)
  -- line: [559, 587] id: 40
  r0_40.EMListView_SubTab:ClearListItems()
  local r2_40 = r0_40.SubTabName_JumpTo and r0_40.CurSubTab and r0_40.CurSubTab.Name
  local r3_40 = r0_40.CurSubTab and r0_40.CurSubTab.Type
  r0_40.SubTabName_JumpTo = nil
  local r4_40 = nil
  for r9_40, r10_40 in ipairs(r1_40) do
    local r11_40 = nil	-- notice: implicit variable refs by block#[12]
    if r3_40 ~= nil then
      r11_40 = r3_40
      if r11_40 then
        r11_40 = r10_40.Type == r3_40
      end
    else
      goto label_30	-- block#10 is visited secondly
    end
    if r10_40.Name == r2_40 and r11_40 then
      r10_40.IsSelected = true
      r4_40 = r10_40
    else
      r10_40.IsSelected = false
    end
    r0_40.EMListView_SubTab:AddItem(r10_40)
  end
  -- close: r5_40
  if r1_40 and #r1_40 > 1 then
    r0_40.EMListView_SubTab:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    r0_40.EMListView_SubTab:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if r4_40 == nil then
    r4_40 = r1_40[1]
    r4_40.IsSelected = true
  end
  return r4_40
end
function r5_0.CreateAndSelectSubTab(r0_41, r1_41)
  -- line: [589, 599] id: 41
  local r2_41 = r0_41.MainTabs[r0_41.MainTabName2Idx[r0_41.CurMainTab.Name]].TabData
  local r3_41 = {
    Char = r0_41.ComparedChar,
    bCreatedWidthClass = true,
  }
  for r8_41, r9_41 in pairs(r1_41 and {}) do
    r3_41[r8_41] = r9_41
  end
  -- close: r4_41
  r0_41.SubTabs = r0_41:CreateTabInfos(r2_41, r3_41)
  r0_41:MappingSubTabIdx()
  r0_41:SelectSubTab(r0_41:UpdateSubTabs(r0_41.SubTabs))
end
function r5_0.SelectSubTab(r0_42, r1_42)
  -- line: [602, 617] id: 42
  if r0_42.CurSubTab then
    r0_42.CurSubTab.IsSelected = false
    if r0_42.CurSubTab.Widget then
      r0_42.CurSubTab.Widget:SetIsSelected(false)
    end
  end
  r1_42.IsSelected = true
  if r1_42.Widget then
    r1_42.Widget:SetIsSelected(true)
  end
  r0_42:CallFunctionByName(r0_42.CurMainTab.Name .. "Main_PreSubTabChange")
  r0_42.CurSubTab = r1_42
  r0_42:UpdateMontageAndCamera()
  r0_42:InitSubUI()
end
function r5_0.OnSubTabItemClicked(r0_43, r1_43)
  -- line: [620, 626] id: 43
  if r1_43 == r0_43.CurSubTab then
    return 
  end
  AudioManager(r0_43):PlayUISound(r0_43, "event:/ui/common/click_level_02", nil, nil)
  r0_43:SelectSubTab(r1_43)
end
function r5_0.InitSubUI(r0_44)
  -- line: [633, 635] id: 44
  r0_44:CallFunctionByName(r0_44.CurMainTab.Name .. "Main_InitSubUI")
end
function r5_0.DefaultInitSubUI(r0_45, r1_45)
  -- line: [638, 691] id: 45
  local r2_45 = nil
  if r0_45.CurMainTab.WidgetPath then
    r2_45 = r0_45.CurMainTab.Name
  else
    r2_45 = r0_45.CurSubTab.Type .. r0_45.CurSubTab.Name
  end
  local r3_45 = r0_45.SubUIs[r2_45]
  if r3_45 == nil then
    local r5_45 = UE4.UGameplayStatics.GetGameInstance(r0_45):GetGameUIManager()
    local r6_45 = r0_45.CurMainTab.WidgetPath and r0_45.CurSubTab.WidgetPath
    if r5_45 and r6_45 then
      r3_45 = r5_45:CreateWidget(r6_45, false)
      if r3_45 then
        r0_45.Panel_SubUI:AddChild(r3_45)
        local r7_45 = r3_45.Slot
        local r8_45 = FAnchors()
        r8_45.Minimum = FVector2D(0, 0)
        r8_45.Maximum = FVector2D(1, 1)
        r7_45:SetAnchors(r8_45)
        r7_45:SetOffsets(FMargin(0, 0, 0, 0))
        r0_45.SubUIs[r2_45] = r3_45
        if (r0_45.CurSubTab.Type == CommonConst.ArmoryType.Weapon or r0_45.CurSubTab.Type == CommonConst.ArmoryType.Char) and r0_45.CurSubTab.Name == r0_0.ArmorySubTabNames.Attribute then
          r0_45.SubUIs[CommonConst.ArmoryType.Weapon .. r0_45.CurSubTab.Name] = r3_45
          r0_45.SubUIs[CommonConst.ArmoryType.Char .. r0_45.CurSubTab.Name] = r3_45
        end
      end
    end
  end
  DebugPrint("CY@ Armory:InitSubUI " .. (r2_45 and ""))
  r0_45.SubUIs[r2_45] = r3_45
  if r0_45.CurrentSubUI and r3_45 ~= r0_45.CurrentSubUI then
    r0_45.CurrentSubUI:PlayOutAnim()
    UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r0_45.CurrentSubUI):SetZOrder(0)
  end
  if r3_45 and r3_45.Init then
    if not r1_45 then
      r1_45 = {}
    end
    r0_45:ModifySubUIInitParams(r1_45)
    r3_45:Init(r1_45)
    r3_45:SetVisibility(UIConst.VisibilityOp.Visible)
    r3_45:PlayInAnim()
    UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r3_45):SetZOrder(1)
    if r3_45:IsVisible() then
      r3_45:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
    r0_45.CurrentSubUI = r3_45
  end
end
function r5_0.ModifySubUIInitParams(r0_46, r1_46)
  -- line: [693, 700] id: 46
  r1_46.Parent = r0_46
  r1_46.IsPreviewMode = r1_46.IsPreviewMode and r0_46.IsPreviewMode
  r1_46.bNeedPreviewSwitcher = r0_46.bNeedPreviewSwitcher
  r1_46.IsCharacterTrialMode = r0_46.IsCharacterTrialMode
  r1_46.bFormPersonalPage = r0_46.Params.bFormPersonalPage
  r0_46:CallFunctionByName(r0_46.CurMainTab.Name .. "Main_ModifySubUIInitParams", r1_46)
end
function r5_0.InitRoleList(r0_47, ...)
  -- line: [702, 704] id: 47
  r0_47:CallFunctionByName(r0_47.CurMainTab.Name .. "Main_InitRoleList", ...)
end
function r5_0.OnRoleListContentCreated(r0_48, r1_48)
  -- line: [706, 708] id: 48
end
function r5_0.OnRoleListItemClicked(r0_49, r1_49)
  -- line: [710, 716] id: 49
  if r0_49.ComponentReceivedEvent.OnRoleListItemClicked then
    return 
  end
  r0_49:CallFunctionByName(r0_49.CurMainTab.Name .. "Main_OnRoleListItemClicked", r1_49)
  r0_49.EMListView_Role:BP_ScrollItemIntoView(r1_49)
end
function r5_0.SelectRoleListItem(r0_50, r1_50)
  -- line: [718, 723] id: 50
  if r0_50.ComponentReceivedEvent.SelectRoleListItem then
    return 
  end
  r0_50:CallFunctionByName(r0_50.CurMainTab.Name .. "Main_SelectRoleListItem", r1_50)
end
function r5_0.OnRoleListEntryInitialized(r0_51, r1_51, r2_51)
  -- line: [725, 730] id: 51
  if r0_51.ComponentReceivedEvent.OnRoleListEntryInitialized then
    return 
  end
  r0_51:CallFunctionByName(r0_51.CurMainTab.Name .. "Main_OnRoleListEntryInitialized", r1_51, r2_51)
end
function r5_0.UpdateResourceInfos(r0_52, ...)
  -- line: [733, 735] id: 52
  r0_52:CallFunctionByName(r0_52.CurMainTab.Name .. "Main_UpdateResourceInfos", ...)
end
function r5_0.UpdateBoxReddot(r0_53, ...)
  -- line: [738, 743] id: 53
  if r0_53.IsPreviewMode then
    return 
  end
  r0_53:CallFunctionByName(r0_53.CurMainTab.Name .. "Main_UpdateBoxReddot", ...)
end
function r5_0.SetStars(r0_54, r1_54)
  -- line: [746, 751] id: 54
  r0_54.ListView_Star:ClearListItems()
  for r5_54 = 1, r1_54, 1 do
    r0_54.ListView_Star:AddItem(NewObject(r3_0.GetCommonItemContentClass()))
  end
end
function r5_0.ShowElementTips(r0_55, r1_55)
  -- line: [753, 759] id: 55
  if r1_55 then
    r0_55.Stats:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    r0_55.Stats:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r5_0.SetAllReddotRead(r0_56, ...)
  -- line: [761, 763] id: 56
  r0_56:CallFunctionByName(r0_56.CurMainTab.Name .. "Main_SetAllReddotRead", ...)
end
function r5_0.ReceiveEnterState(r0_57, r1_57)
  -- line: [765, 780] id: 57
  r5_0.Super.ReceiveEnterState(r0_57, r1_57)
  r0_57:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_57.IsSecondaryUI = UIManager(r0_57):StateCount() > 1
  if r0_57.Loaded then
    DebugPrint("CY@ Armory:" .. r0_57.CurMainTab.Name .. "Main_ReceiveEnterState")
    r0_57:CallFunctionByName(r0_57.CurMainTab.Name .. "Main_ReceiveEnterState", r1_57)
    if not r0_57.ReceiveEnterStateNoAnim then
      r0_57:PlayAnimation(r0_57.RoleList_In)
      r0_57:PlayAnimation(r0_57.BG_BackFirst)
    end
  else
    r0_57:BlockAllUIInput(true)
  end
  r0_57.ReceiveEnterStateNoAnim = false
end
function r5_0.ReceiveExitState(r0_58, r1_58)
  -- line: [782, 785] id: 58
  r5_0.Super.ReceiveExitState(r0_58, r1_58)
  r0_58:BlockAllUIInput(false)
end
function r5_0.OnArmoryModClosed(r0_59, ...)
  -- line: [788, 798] id: 59
  if r0_59.CurrentChar then
    r0_59.CurrentChar = r0_0:GetAvatar().Chars[r0_59.CurrentChar.Uuid]
  end
  if r0_59.ComponentReceivedEvent.OnModClosed then
    return 
  end
  r0_59:CallFunctionByName(r0_59.CurMainTab.Name .. "Main_OnArmoryModClosed", ...)
  r0_59:UpdateMontageAndCamera()
end
function r5_0.UpdateMontageAndCamera(r0_60, r1_60)
  -- line: [801, 804] id: 60
  r0_60.ActorController:FixedCameraTransTimeOnce(r1_60)
  r0_60.ActorController:SetMontageAndCamera(r0_60.CurSubTab.Type, r0_60.CurMainTab.Name, r0_60.CurSubTab.Tag)
end
function r5_0.ResetActorRotation(r0_61)
  -- line: [806, 808] id: 61
  r0_61.ActorController:ResetActorRotation()
end
function r5_0.PlayInAnim(r0_62)
  -- line: [810, 812] id: 62
  r0_62.Tab_Arm:PlayInAnim()
end
function r5_0.OnOutAnimStarted(r0_63)
  -- line: [814, 816] id: 63
  r0_63:ModifyWaitForCloseEventCount(true)
end
function r5_0.OnOutAnimFinished(r0_64)
  -- line: [818, 820] id: 64
  r0_64:ModifyWaitForCloseEventCount(false)
end
function r5_0.OnRoleListInAnimStarted(r0_65)
  -- line: [822, 823] id: 65
end
function r5_0.OnRoleListInAnimFinished(r0_66)
  -- line: [825, 826] id: 66
end
function r5_0.ModifyWaitForCloseEventCount(r0_67, r1_67)
  -- line: [828, 837] id: 67
  if r1_67 then
    r0_67.WaitForCloseEventCount = r0_67.WaitForCloseEventCount + 1
  else
    r0_67.WaitForCloseEventCount = r0_67.WaitForCloseEventCount + -1
    if r0_67.WaitForCloseEventCount <= 0 then
      r0_67:RealClose()
    end
  end
end
function r5_0.PlayOutAnim(r0_68)
  -- line: [839, 850] id: 68
  AudioManager(r0_68):SetEventSoundParam(r0_68, "ArmoryOpenedSound", {
    ToEnd = 1,
  })
  for r5_68, r6_68 in pairs(r0_68.SubUIs) do
    if r6_68 ~= r0_68.CurrentSubUI then
      r6_68:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
  -- close: r1_68
  if r0_68.CurrentSubUI and r0_68.CurrentSubUI.PlayOutAnim then
    r0_68.CurrentSubUI:PlayOutAnim()
  end
  r0_68:StopAnimation(r0_68.RoleList_In)
end
function r5_0.OnBagItemLockedOrUnlocked(r0_69, ...)
  -- line: [852, 854] id: 69
  r0_69:CallFunctionByName(r0_69.CurMainTab.Name .. "Main_OnBagItemLockedOrUnlocked", ...)
end
function r5_0.Close(r0_70)
  -- line: [856, 883] id: 70
  r0_70.bRealClosed = false
  r0_70:ModifyWaitForCloseEventCount(true)
  r5_0.Super.Close(r0_70)
  r0_70:BlockAllUIInput(true)
  if r0_70.IsPreviewMode then
    r0_70:ModifyWaitForCloseEventCount(true)
    r0_70:BindToAnimationFinished(r0_70.Auto_Out, {
      r0_70,
      function()
        -- line: [863, 863] id: 71
        r0_70:ModifyWaitForCloseEventCount(false)
      end
    })
  elseif not r0_70.IsSecondaryUI then
    if not UIManager(r0_70):GetUIObj(UIConst.MenuWorld) then
      r3_0.PlayBattleMainInAnim()
    end
    r0_70:PlayOutAnim()
  end
  r0_70:CallFunctionByName(r0_70.CurMainTab.Name .. "Main_Close")
  r0_70:Component_BeforeClose()
  if r0_70.ActorController and not r0_70.IsPreviewMode then
    r0_70.ActorController:OnClosed()
  end
  r0_70:ModifyWaitForCloseEventCount(false)
end
function r5_0.Component_BeforeClose(r0_72)
  -- line: [885, 886] id: 72
end
function r5_0.OnRecorverCameraStart(r0_73)
  -- line: [889, 891] id: 73
  r0_73:ModifyWaitForCloseEventCount(true)
end
function r5_0.OnRecorverCameraEnd(r0_74)
  -- line: [893, 895] id: 74
  r0_74:ModifyWaitForCloseEventCount(false)
end
function r5_0.OnBackBtnClicked(r0_75)
  -- line: [897, 902] id: 75
  if r0_75.ComponentReceivedEvent.Back then
    return 
  end
  r0_75:Close()
end
function r5_0.RealClose(r0_76)
  -- line: [904, 917] id: 76
  if r0_76.WaitForCloseEventCount > 0 then
    return 
  end
  if r0_76.bRealClosed then
    return 
  end
  r0_76.bRealClosed = true
  r0_76:BlockAllUIInput(false)
  r5_0.Super.RealClose(r0_76)
  if r0_76.OnCloseDelegate and r0_76.OnCloseDelegate[2] then
    r0_76.OnCloseDelegate[2](r0_76.OnCloseDelegate[1], r0_76.OnCloseDelegate[3])
  end
end
function r5_0.Destruct(r0_77)
  -- line: [919, 932] id: 77
  r5_0.Super.Destruct(r0_77)
  if r0_77.ActorController then
    r0_77.ActorController:OnDestruct()
  end
  r0_77:RemoveMainTabReddotListen()
  r0_77:RemoveSubTabReddotListen()
  if r0_77.IsPreviewMode then
    r0_0:DestroyDummyAvatar()
  end
  if GWorld.GameInstance then
    GWorld.GameInstance:SetHighFrequencyMemoryCheckGCEnabled(false, "ArmoryMain")
  end
end
function r5_0.OnPreviewModeStateChanged(r0_78)
  -- line: [934, 945] id: 78
  if not r0_78.IsPreviewMode then
    return 
  end
  if r0_78.ActorController then
    r0_78.ActorController:SetAvatar(r0_0:GetAvatar())
  end
  r0_78.bRecreateContent = true
  r0_78:CallFunctionByName(r0_78.CurMainTab.Name .. "Main_PreprocessContents")
  r0_78.bRecreateContent = false
  r0_78:CallFunctionByName(r0_78.CurMainTab.Name .. "Main_Init")
end
function r5_0.GetConstTab(r0_79, r1_79, r2_79)
  -- line: [947, 957] id: 79
  local r4_79 = r0_79.MainTabs[r0_79.MainTabName2Idx[r1_79]]
  if r4_79 then
    if r2_79 and r4_79.TabData.Tabs then
      return r4_79.TabData.Tabs[r2_79]
    else
      return r4_79.TabData
    end
  end
end
function r5_0.PlayMainTabSound(r0_80, r1_80)
  -- line: [959, 976] id: 80
  local r2_80 = r0_80.MainTabs[r1_80]
  local r3_80 = r0_80.MainTabSoundPath[r2_80.Name]
  if r3_80 then
    AudioManager(r0_80):PlayUISound(r0_80, r3_80, nil, nil)
  elseif string.find(r2_80.Name, r0_0.ArmoryMainTabNames.UWeapon) then
    local r4_80 = r0_0:GetAvatar()
    local r5_80 = r0_80.ComparedChar.UWeapon[r2_80.TabData.UWeaponIdx]
    local r6_80 = r5_80 and r4_80.UWeapons[r5_80]
    if r6_80 then
      if r6_80:HasTag(CommonConst.ArmoryTag.Melee) then
        AudioManager(r0_80):PlayUISound(r0_80, r0_80.MainTabSoundPath[CommonConst.ArmoryTag.Melee], nil, nil)
      else
        AudioManager(r0_80):PlayUISound(r0_80, r0_80.MainTabSoundPath[CommonConst.ArmoryTag.Ranged], nil, nil)
      end
    end
  end
end
function r5_0.CreateConstInfos(r0_81)
  -- line: [979, 1490] id: 81
  r0_81.MainTabsStyle = {
    TitleName = GText("MAIN_UI_ARMORY"),
    LeftKey = r0_81.MainTabLeftKey,
    RightKey = r0_81.MainTabRightKey,
    Tabs = {},
    DynamicNode = {
      "Back",
      "ResourceBar",
      "BottomKey"
    },
    BottomKeyInfo = {},
    StyleName = r0_81.MainTabStyleName,
    InfoCallback = r0_81.OnInfoClicked,
    BackCallback = r0_81.OnBackBtnClicked,
    OwnerPanel = r0_81,
  }
  r0_81.MainTabSoundPath = {
    [r0_0.ArmoryMainTabNames.Char] = "event:/ui/armory/click_select_role",
    [r0_0.ArmoryMainTabNames.Melee] = "event:/ui/armory/click_select_weapon",
    [r0_0.ArmoryMainTabNames.Ranged] = "event:/ui/armory/click_select_gun",
    [r0_0.ArmoryMainTabNames.Pet] = "event:/ui/common/click_select_pet",
  }
  function r0_81.AlwaysReturnTrue()
    -- line: [1006, 1008] id: 82
    return true
  end
  r0_81.WeaponGradeSubTab = {
    PCWidgetPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/PC/WBP_Armoy_Enhance_P.WBP_Armoy_Enhance_P\'",
    MobileWidgetPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/Mobile/WBP_Armoy_Enhance_M.WBP_Armoy_Enhance_M\'",
    Name = r0_0.ArmorySubTabNames.Grade,
    Type = CommonConst.ArmoryType.Weapon,
    Tag = CommonConst.ArmoryTag.Grade,
    Text = GText(DataMgr.WeaponTab[2].Text),
    IconPath = DataMgr.WeaponTab[2].IconPath,
    CheckIsUnlocked = function(r0_83, r1_83, r2_83)
      -- line: [1017, 1026] id: 83
      if r0_81.Params.bHideWeaponGrade then
        return false
      end
      local r3_83 = r2_83 and r2_83.Weapon
      local r4_83 = r3_83 and DataMgr.WeaponCardLevel[r3_83.WeaponId]
      if r4_83 and r4_83.CardLevelMax then
        return true
      end
    end,
    CheckReddot = function(r0_84)
      -- line: [1027, 1033] id: 84
      local r1_84 = r0_84.Weapon and r0_81[r0_81.ComparedWeaponName]
      local r2_84 = r2_0:GetConsumeWeaponCount(r1_84.Uuid)
      local r4_84 = r1_84.WeaponId
      local r3_84 = DataMgr.WeaponCardLevel[r4_84]
      if r3_84 then
        r4_84 = r3_84.CardLevelMax and 0
      else
        goto label_19	-- block#4 is visited secondly
      end
      local r5_84 = false
      local r6_84 = nil	-- notice: implicit variable refs by block#[9]
      if r2_84 > 0 then
        r6_84 = r1_84.GradeLevel < r4_84
      else
        goto label_26	-- block#7 is visited secondly
      end
      return r5_84, r6_84
    end,
  }
  r0_81.WeaponAppearanceSubTab = {
    PCWidgetPath = "/Game/UI/WBP/Armory/PC/WBP_Armory_Appearance_P.WBP_Armory_Appearance_P",
    MobileWidgetPath = "/Game/UI/WBP/Armory/Mobile/WBP_Armory_Appearance_M.WBP_Armory_Appearance_M",
    Name = r0_0.ArmorySubTabNames.Appearance,
    Type = CommonConst.ArmoryType.Weapon,
    Tag = CommonConst.ArmoryTag.Appearance,
    Text = GText(DataMgr.WeaponTab[3].Text),
    IconPath = DataMgr.WeaponTab[3].IconPath,
    EnableMouseWheel = true,
    EnableDrag = true,
    CheckIsUnlocked = function(r0_85, r1_85)
      -- line: [1045, 1050] id: 85
      if r0_81.Params.bHideWeaponAppearance then
        return false
      end
      return r0_85:CheckUIUnlocked("Swatch")
    end,
    CheckReddot = function(r0_86)
      -- line: [1051, 1057] id: 86
      local r1_86 = r0_86.Weapon and r0_81[r0_81.ComparedWeaponName]
      if r0_0:GetWeaponByUuid(r1_86.Uuid) == nil then
        return 
      end
      return r0_81.CheckWeaponAppearanceReddot and r0_81:CheckWeaponAppearanceReddot(r1_86), false
    end,
  }
  r0_81.WeaponTabIndexes = {
    r0_0.ArmorySubTabNames.Attribute,
    r0_0.ArmorySubTabNames.Grade,
    r0_0.ArmorySubTabNames.Appearance
  }
  local r1_81 = {}
  local r2_81 = {}
  local r3_81 = r0_0.ArmoryMainTabNames.Char
  local r4_81 = {
    Name = r0_0.ArmoryMainTabNames.Char,
    Text = GText(DataMgr.ArmoryTab[1].Text),
    IconPath = DataMgr.ArmoryTab[1].IconPath,
  }
  r4_81.Tabs = {
    [r0_0.ArmorySubTabNames.Attribute] = {
      PCWidgetPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/PC/WBP_Armory_RoleInfo_P.WBP_Armory_RoleInfo_P\'",
      MobileWidgetPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/Mobile/WBP_Armory_RoleInfo_M.WBP_Armory_RoleInfo_M\'",
      Name = r0_0.ArmorySubTabNames.Attribute,
      Type = CommonConst.ArmoryType.Char,
      Tag = CommonConst.ArmoryTag.Char,
      Text = GText(DataMgr.CharTab[1].Text),
      IconPath = DataMgr.CharTab[1].IconPath,
      EnableMouseWheel = true,
      EnableDrag = true,
      CheckIsUnlocked = function()
        -- line: [1084, 1086] id: 87
        return not r0_81.Params.bHideCharAttribute
      end,
      CheckReddot = function(r0_88)
        -- line: [1087, 1093] id: 88
        local r1_88 = r0_88.Char and r0_81.ComparedChar
        if r0_81.IsPreviewMode or not r1_88 then
          return false
        end
        return false, r0_0:TryAddCharRewardReddot(r1_88.CharId) and r0_0:TryAddUnlockableCharReddot(r1_88.CharId)
      end,
    },
    [r0_0.ArmorySubTabNames.Skill] = {
      PCWidgetPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/PC/WBP_Armory_CharSkill_P.WBP_Armory_CharSkill_P\'",
      MobileWidgetPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/Mobile/WBP_Armory_CharSkill_M.WBP_Armory_CharSkill_M\'",
      Name = r0_0.ArmorySubTabNames.Skill,
      Type = CommonConst.ArmoryType.Char,
      Tag = CommonConst.ArmoryTag.Skill,
      Text = GText(DataMgr.CharTab[2].Text),
      IconPath = DataMgr.CharTab[2].IconPath,
      CheckIsUnlocked = function(r0_89, r1_89)
        -- line: [1103, 1113] id: 89
        if r0_81.Params.bHideCharSkill then
          return false
        end
        local r2_89 = r1_89 and r1_89.Skills
        if r0_81.IsPreviewMode then
          return r2_89
        else
          return r2_89 and r0_89:CheckUIUnlocked("Skill")
        end
      end,
      CheckReddot = function(r0_90)
        -- line: [1114, 1120] id: 90
        -- notice: unreachable block#8
        local r1_90 = r0_90.Char and r0_81.ComparedChar
        if r0_0:GetCharByUuid(r1_90.Uuid) == nil then
          return 
        end
        local r2_90 = false
        local r3_90 = r0_81.IsPreviewMode
        if not r3_90 then
          r3_90 = r0_81.CheckCharSkillReddot and r0_81:CheckCharSkillReddot(r1_90)
        else
          r3_90 = false
        end
        return r2_90, r3_90
      end,
    },
    [r0_0.ArmorySubTabNames.Grade] = {
      PCWidgetPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/PC/WBP_Armory_Inron_P.WBP_Armory_Inron_P\'",
      MobileWidgetPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/Mobile/WBP_Armory_Inron_M.WBP_Armory_Inron_M\'",
      Name = r0_0.ArmorySubTabNames.Grade,
      Type = CommonConst.ArmoryType.Char,
      Tag = CommonConst.ArmoryTag.Grade,
      Text = GText(DataMgr.CharTab[3].Text),
      IconPath = DataMgr.CharTab[3].IconPath,
      CheckIsUnlocked = function(r0_91, r1_91)
        -- line: [1132, 1142] id: 91
        if r0_81.Params.bHideCharGrade then
          return false
        end
        local r2_91 = r1_91 and DataMgr.CharCardLevelUp[r1_91.CharId]
        if r0_81.IsPreviewMode then
          return r2_91
        else
          return r2_91 and r0_91:CheckUIUnlocked("CardLevel")
        end
      end,
      CheckReddot = function(r0_92)
        -- line: [1143, 1149] id: 92
        -- notice: unreachable block#8
        local r1_92 = r0_92.Char and r0_81.ComparedChar
        if r0_0:GetCharByUuid(r1_92.Uuid) == nil then
          return 
        end
        local r2_92 = false
        local r3_92 = r0_81.IsPreviewMode
        if not r3_92 then
          r3_92 = r0_81.CheckCharPromoteReddot and r0_81:CheckCharPromoteReddot(r1_92)
        else
          r3_92 = false
        end
        return r2_92, r3_92
      end,
    },
    [r0_0.ArmorySubTabNames.Appearance] = {
      PCWidgetPath = "/Game/UI/WBP/Armory/PC/WBP_Armory_Appearance_P.WBP_Armory_Appearance_P",
      MobileWidgetPath = "/Game/UI/WBP/Armory/Mobile/WBP_Armory_Appearance_M.WBP_Armory_Appearance_M",
      Name = r0_0.ArmorySubTabNames.Appearance,
      Type = CommonConst.ArmoryType.Char,
      Tag = CommonConst.ArmoryTag.Appearance,
      Text = GText(DataMgr.CharTab[4].Text),
      IconPath = DataMgr.CharTab[4].IconPath,
      EnableMouseWheel = true,
      EnableDrag = true,
      CheckIsUnlocked = function()
        -- line: [1161, 1163] id: 93
        return not r0_81.Params.bHideCharAppearance
      end,
      CheckReddot = function(r0_94)
        -- line: [1164, 1170] id: 94
        local r1_94 = r0_94.Char and r0_81.ComparedChar
        if r0_0:GetCharByUuid(r1_94.Uuid) == nil then
          return 
        end
        return r0_81.CheckCharAppearanceReddot and r0_81:CheckCharAppearanceReddot(r1_94), false
      end,
    },
    [r0_0.ArmorySubTabNames.Files] = {
      PCWidgetPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/PC/WBP_Armory_Record_P.WBP_Armory_Record_P\'",
      MobileWidgetPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/Mobile/WBP_Armory_Record_M.WBP_Armory_Record_M\'",
      Name = r0_0.ArmorySubTabNames.Files,
      Type = CommonConst.ArmoryType.Char,
      Tag = CommonConst.ArmoryTag.Files,
      Text = GText(DataMgr.CharTab[5].Text),
      IconPath = DataMgr.CharTab[5].IconPath,
      CheckIsUnlocked = function(r0_95, r1_95)
        -- line: [1181, 1189] id: 95
        local r2_95 = Const.DefaultAttributeMaster
        if r0_81.Params.bHideCharFiles or r1_95.CharId == r2_95[0] or r1_95.CharId == r2_95[1] then
          return false
        end
        return not r0_81.Params.bHideCharFiles
      end,
    },
  }
  r4_81.TabIndexes = {
    r0_0.ArmorySubTabNames.Attribute,
    r0_0.ArmorySubTabNames.Skill,
    r0_0.ArmorySubTabNames.Grade,
    r0_0.ArmorySubTabNames.Appearance,
    r0_0.ArmorySubTabNames.Files
  }
  function r4_81.CheckIsUnlocked(r0_96, r1_96)
    -- line: [1199, 1201] id: 96
    -- notice: unreachable block#3
    local r2_96 = r0_81.Params.bHideCharTab
    if not r2_96 then
      r2_96 = not not r1_96
    else
      r2_96 = false
    end
    return r2_96
  end
  r2_81[r3_81] = r4_81
  r4_81 = {
    Name = r0_0.ArmoryMainTabNames.Melee,
    Text = GText(DataMgr.ArmoryTab[2].Text),
    IconPath = DataMgr.ArmoryTab[2].IconPath,
  }
  r4_81.Tabs = {
    [r0_0.ArmorySubTabNames.Attribute] = {
      PCWidgetPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/PC/WBP_Armory_RoleInfo_P.WBP_Armory_RoleInfo_P\'",
      MobileWidgetPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/Mobile/WBP_Armory_RoleInfo_M.WBP_Armory_RoleInfo_M\'",
      Name = r0_0.ArmorySubTabNames.Attribute,
      Type = CommonConst.ArmoryType.Weapon,
      Tag = CommonConst.ArmoryTag.Melee,
      Text = GText(DataMgr.WeaponTab[1].Text),
      IconPath = DataMgr.WeaponTab[1].IconPath,
      EnableMouseWheel = true,
      EnableDrag = true,
      CheckIsUnlocked = function()
        -- line: [1218, 1220] id: 97
        return not r0_81.Params.bHideWeaponAttribute
      end,
      CheckReddot = function(r0_98)
        -- line: [1221, 1227] id: 98
        local r1_98 = r0_98.Weapon and r0_81[r0_81.ComparedWeaponName]
        if r0_81.IsPreviewMode or not r1_98 then
          return false
        end
        return false, r0_0:TryAddWeaponRewardReddot(r1_98.WeaponId)
      end,
    },
    [r0_0.ArmorySubTabNames.Grade] = r0_81.WeaponGradeSubTab,
    [r0_0.ArmorySubTabNames.Appearance] = r0_81.WeaponAppearanceSubTab,
  }
  r4_81.TabIndexes = r0_81.WeaponTabIndexes
  function r4_81.CheckIsUnlocked(r0_99, r1_99)
    -- line: [1233, 1252] id: 99
    if r0_81.Params.bHideMeleeTab then
      return false
    end
    if r0_81.IsPreviewMode and not r1_99 then
      return false
    else
      local r2_99 = r0_99.MeleeWeapon
      if r2_99 and r0_99.Weapons[r2_99] then
        return true
      end
      for r8_99, r9_99 in pairs(r0_99.Weapons) do
        if r9_99:HasTag("Melee") then
          return true
        end
      end
      -- close: r4_99
      return false
    end
  end
  r2_81[r0_0.ArmoryMainTabNames.Melee] = r4_81
  r4_81 = {
    Name = r0_0.ArmoryMainTabNames.Ranged,
    Type = CommonConst.ArmoryType.Weapon,
    Tag = CommonConst.ArmoryTag.Ranged,
    Text = GText(DataMgr.ArmoryTab[3].Text),
    IconPath = DataMgr.ArmoryTab[3].IconPath,
  }
  r4_81.Tabs = {
    [r0_0.ArmorySubTabNames.Attribute] = {
      PCWidgetPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/PC/WBP_Armory_RoleInfo_P.WBP_Armory_RoleInfo_P\'",
      MobileWidgetPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/Mobile/WBP_Armory_RoleInfo_M.WBP_Armory_RoleInfo_M\'",
      Name = r0_0.ArmorySubTabNames.Attribute,
      Type = CommonConst.ArmoryType.Weapon,
      Tag = CommonConst.ArmoryTag.Ranged,
      Text = GText(DataMgr.WeaponTab[1].Text),
      IconPath = DataMgr.WeaponTab[1].IconPath,
      EnableMouseWheel = true,
      EnableDrag = true,
      CheckIsUnlocked = function()
        -- line: [1271, 1273] id: 100
        return not r0_81.Params.bHideWeaponAttribute
      end,
      CheckReddot = function(r0_101)
        -- line: [1274, 1280] id: 101
        local r1_101 = r0_101.Weapon and r0_81[r0_81.ComparedWeaponName]
        if r0_81.IsPreviewMode or not r1_101 then
          return false
        end
        return false, r0_0:TryAddWeaponRewardReddot(r1_101.WeaponId)
      end,
    },
    [r0_0.ArmorySubTabNames.Grade] = r0_81.WeaponGradeSubTab,
    [r0_0.ArmorySubTabNames.Appearance] = r0_81.WeaponAppearanceSubTab,
  }
  r4_81.TabIndexes = r0_81.WeaponTabIndexes
  function r4_81.CheckIsUnlocked(r0_102, r1_102)
    -- line: [1286, 1305] id: 102
    if r0_81.Params.bHideRangedTab then
      return false
    end
    if r0_81.IsPreviewMode and not r1_102 then
      return false
    else
      local r2_102 = r0_102.RangedWeapon
      if r2_102 and r0_102.Weapons[r2_102] then
        return true
      end
      for r8_102, r9_102 in pairs(r0_102.Weapons) do
        if r9_102:HasTag("Ranged") then
          return true
        end
      end
      -- close: r4_102
      return false
    end
  end
  r2_81[r0_0.ArmoryMainTabNames.Ranged] = r4_81
  r2_81[r0_0.ArmoryMainTabNames.UWeapon] = {
    CreateFunc = function(r0_103, r1_103)
      -- line: [1308, 1367] id: 103
      local r2_103 = r1_103.Char
      local r3_103 = {
        Type = CommonConst.ArmoryType.Weapon,
        Tag = CommonConst.ArmoryTag.UWeapon,
        Text = GText(DataMgr.ArmoryTab[4].Text),
        IconPath = DataMgr.ArmoryTab[4].IconPath,
      }
      r3_103.Tabs = {
        [r0_0.ArmorySubTabNames.Attribute] = {
          PCWidgetPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/PC/WBP_Armory_RoleInfo_P.WBP_Armory_RoleInfo_P\'",
          MobileWidgetPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/Mobile/WBP_Armory_RoleInfo_M.WBP_Armory_RoleInfo_M\'",
          Name = r0_0.ArmorySubTabNames.Attribute,
          Type = CommonConst.ArmoryType.Weapon,
          Tag = CommonConst.ArmoryTag.UWeapon,
          EnableMouseWheel = true,
          EnableDrag = true,
          CheckIsUnlocked = r0_81.AlwaysReturnTrue,
        },
      }
      r3_103.TabIndexes = {
        r0_0.ArmorySubTabNames.Attribute
      }
      function r3_103.CheckIsUnlocked()
        -- line: [1331, 1333] id: 104
        return not r0_81.Params.bHideUltraTab
      end
      local function r4_103(r0_105)
        -- line: [1335, 1341] id: 105
        local r1_105 = {}
        for r6_105, r7_105 in pairs(r0_105) do
          r1_105[r6_105] = r7_105
        end
        -- close: r2_105
        return r1_105
      end
      local r5_103 = {}
      local r6_103 = false
      if r0_81.IsPreviewMode then
        r6_103 = true
      else
        r6_103 = r0_103:CheckUIUnlocked("UWeapon")
      end
      if r1_103.Avatar then
        r0_103 = r1_103.Avatar
      end
      if r2_103 and r6_103 then
        for r11_103, r12_103 in ipairs(r2_103.UWeaponEids) do
          if r12_103 and r0_103.UWeapons[r12_103] and not DataMgr.UWeapon[r0_103.UWeapons[r12_103].WeaponId].IsInvisible then
            local r14_103 = r4_103(r3_103)
            r14_103.Name = r0_0.ArmoryMainTabNames.UWeapon .. r11_103
            r14_103.UWeaponIdx = r11_103
            table.insert(r5_103, r14_103)
          end
        end
        -- close: r7_103
      end
      return r5_103
    end,
  }
  r3_81 = r0_0.ArmoryMainTabNames.Pet
  r4_81 = {
    Name = r0_0.ArmoryMainTabNames.Pet,
    Type = CommonConst.ArmoryType.Pet,
    Tag = CommonConst.ArmoryTag.Pet,
    Text = GText(DataMgr.ArmoryTab[5].Text),
    IconPath = DataMgr.ArmoryTab[5].IconPath,
  }
  r4_81.Tabs = {
    [r0_0.ArmorySubTabNames.Attribute] = {
      PCWidgetPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/PC/WBP_Armory_PetAttr_P.WBP_Armory_PetAttr_P\'",
      MobileWidgetPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/Mobile/WBP_Armory_PetAttr_M.WBP_Armory_PetAttr_M\'",
      Name = r0_0.ArmorySubTabNames.Attribute,
      Type = CommonConst.ArmoryType.Pet,
      Tag = r0_0.ArmorySubTabNames.Attribute,
      Text = GText(DataMgr.PetTab[1].Text),
      IconPath = DataMgr.PetTab[1].IconPath,
      EnableMouseWheel = true,
      EnableDrag = true,
      CheckIsUnlocked = function(r0_106, r1_106, r2_106)
        -- line: [1386, 1394] id: 106
        if r0_81.Params.bHidePetAttribute then
          return false
        end
        if not r2_106.Pet then
          return false
        end
        return not r2_106.Pet:IsResourcePet()
      end,
    },
    [r0_0.ArmorySubTabNames.Entry] = {
      PCWidgetPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/PC/WBP_Armory_PetEntry_P.WBP_Armory_PetEntry_P\'",
      MobileWidgetPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/Mobile/WBP_Armory_PetEntry_M.WBP_Armory_PetEntry_M\'",
      Name = r0_0.ArmorySubTabNames.Entry,
      Type = CommonConst.ArmoryType.Pet,
      Tag = r0_0.ArmorySubTabNames.Entry,
      Text = GText(DataMgr.PetTab[2].Text),
      IconPath = DataMgr.PetTab[2].IconPath,
      CheckIsUnlocked = function()
        -- line: [1404, 1406] id: 107
        -- notice: unreachable block#3
        local r0_107 = r0_81.Params.bHidePetEntry
        if not r0_107 then
          r0_107 = not r0_81.IsPreviewMode
        else
          r0_107 = false
        end
        return r0_107
      end,
    },
  }
  r4_81.TabIndexes = {
    r0_0.ArmorySubTabNames.Attribute,
    r0_0.ArmorySubTabNames.Entry
  }
  function r4_81.CheckIsUnlocked(r0_108, r1_108)
    -- line: [1413, 1429] id: 108
    if r0_81.Params.bHidePetTab then
      return false
    end
    local r2_108 = false
    if r0_108.Pets then
      local r3_108 = DataMgr.Pet
      for r8_108, r9_108 in pairs(r0_108.Pets) do
        if r3_108[r9_108.PetId] and not r9_108:IsResourcePet() then
          r2_108 = true
          break
        end
      end
      -- close: r4_108
    end
    return r2_108 and r0_108:CheckUIUnlocked("Pet"), ""
  end
  r2_81[r3_81] = r4_81
  r2_81[r0_0.ArmoryMainTabNames.BattleWheel] = {
    PCWidgetPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/PC/WBP_Armory_BattleMenu_P.WBP_Armory_BattleMenu_P\'",
    MobileWidgetPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/Mobile/WBP_Armory_BattleMenu_M.WBP_Armory_BattleMenu_M\'",
    Name = r0_0.ArmoryMainTabNames.BattleWheel,
    Text = GText(DataMgr.ArmoryTab[6].Text),
    IconPath = DataMgr.ArmoryTab[6].IconPath,
    EnableMouseWheel = false,
    EnableDrag = false,
    CheckIsUnlocked = function(r0_109, r1_109)
      -- line: [1439, 1445] id: 109
      if r0_81.IsPreviewMode or r0_81.Params.bHideBattleWheel then
        return false, ""
      end
      return r0_109:CheckUIUnlocked("BattleWheel"), ""
    end,
  }
  r4_81 = {
    Name = r0_0.ArmoryMainTabNames.Weapon,
    Type = CommonConst.ArmoryType.Weapon,
    Tag = CommonConst.ArmoryType.Weapon,
  }
  r4_81.Tabs = {
    [r0_0.ArmorySubTabNames.Attribute] = {
      PCWidgetPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/PC/WBP_Armory_RoleInfo_P.WBP_Armory_RoleInfo_P\'",
      MobileWidgetPath = "WidgetBlueprint\'/Game/UI/WBP/Armory/Mobile/WBP_Armory_RoleInfo_M.WBP_Armory_RoleInfo_M\'",
      Name = r0_0.ArmorySubTabNames.Attribute,
      Type = CommonConst.ArmoryType.Weapon,
      Tag = CommonConst.ArmoryType.Weapon,
      Text = GText(DataMgr.WeaponTab[1].Text),
      IconPath = DataMgr.WeaponTab[1].IconPath,
      EnableMouseWheel = true,
      EnableDrag = true,
      CheckIsUnlocked = function()
        -- line: [1462, 1464] id: 110
        return not r0_81.Params.bHideWeaponAttribute
      end,
    },
    [r0_0.ArmorySubTabNames.Grade] = r0_81.WeaponGradeSubTab,
    [r0_0.ArmorySubTabNames.Appearance] = r0_81.WeaponAppearanceSubTab,
  }
  r4_81.TabIndexes = r0_81.WeaponTabIndexes
  function r4_81.CheckIsUnlocked(r0_111, r1_111)
    -- line: [1470, 1477] id: 111
    if r0_81.Params.bHideWeaponTab then
      return false
    end
    if r0_81.IsPreviewMode and not r1_111 and r0_111.Weapons and next(r0_111.Weapons) then
      return true
    end
  end
  r2_81[r0_0.ArmoryMainTabNames.Weapon] = r4_81
  r1_81.Tabs = r2_81
  r1_81.TabIndexes = {
    r0_0.ArmoryMainTabNames.Char,
    r0_0.ArmoryMainTabNames.Melee,
    r0_0.ArmoryMainTabNames.Ranged,
    r0_0.ArmoryMainTabNames.UWeapon,
    r0_0.ArmoryMainTabNames.Pet,
    r0_0.ArmoryMainTabNames.BattleWheel,
    r0_0.ArmoryMainTabNames.Weapon
  }
  r0_81.ConstTabsConfig = r1_81
end
function r5_0.GetTabsConfigData(r0_112)
  -- line: [1492, 1498] id: 112
  if r0_112.IsPreviewMode then
    return r0_112.ConstTabsConfig
  else
    return r0_112.ConstTabsConfig
  end
end
return r5_0
