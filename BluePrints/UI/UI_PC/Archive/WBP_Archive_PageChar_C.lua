-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\UI_PC\Archive\WBP_Archive_PageChar_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.BP_UIState_C"
})
r0_0._components = {
  "BluePrints.UI.UI_PC.Common.HorizontalListViewResizeComp"
}
function r0_0.Construct(r0_1)
  -- line: [18, 42] id: 1
  r0_1.Super.Construct(r0_1)
  r0_1.FirstFocus = false
  r0_1.FilterTags = {}
  r0_1.FilterNames = {}
  r0_1.FilterIcons = {}
  r0_1.List_Item:SetControlScrollbarInside(true)
  r0_1.List_Item.BP_OnEntryInitialized:Clear()
  r0_1.List_Item.OnCreateEmptyContent:Bind(r0_1, function(r0_2)
    -- line: [28, 33] id: 2
    local r1_2 = NewObject(UIUtils.GetCommonItemContentClass())
    r1_2.Icon = nil
    r1_2.Parent = r0_2
    return r1_2
  end)
  r0_1.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(UE4.UGameplayStatics.GetPlayerController(r0_1, 0))
  if IsValid(r0_1.GameInputModeSubsystem) then
    r0_1:RefreshOpInfoByInputDevice(r0_1.GameInputModeSubsystem:GetCurrentInputType(), r0_1.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  r0_1:InitListenEvent()
  r0_1:InitWidgetInfoInGamePad()
end
function r0_0.Destruct(r0_3)
  -- line: [47, 55] id: 3
  r0_3.Super.Destruct(r0_3)
  r0_3.List_Item.BP_OnEntryInitialized:Remove(r0_3, r0_3.OnObjectSetFinished)
  r0_3:HorizontalListViewResize_TearDown()
  r0_3:ClearListenEvent()
  if r0_3.NodeName then
    ReddotManager.RemoveListener(r0_3.NodeName, r0_3)
  end
end
function r0_0.OnLoaded(r0_4, ...)
  -- line: [57, 77] id: 4
  local r2_4 = nil	-- notice: implicit variable refs by block#[0]
  local r1_4 = nil	-- notice: implicit variable refs by block#[0]
  r0_4.Super.OnLoaded(r0_4, ...)
  ... = ... -- error: untaken top expr
  r0_4.Type = r2_4
  r0_4.Name = r1_4
  r0_4:InitFilter()
  r0_4:InitCommonTab()
  r0_4:PlayInAnim()
  r1_4 = r0_4.Name
  if r1_4 == "Character" then
    r0_4.NodeName = "ArchiveNewChar"
  else
    r1_4 = r0_4.Name
    if r1_4 == "Melee" then
      r0_4.NodeName = "ArchiveNewMelee"
    else
      r1_4 = r0_4.Name
      if r1_4 == "Ranged" then
        r0_4.NodeName = "ArchiveNewRanged"
      end
    end
  end
  r1_4 = r0_4.NodeName
  if r1_4 then
    r1_4 = ReddotManager.GetTreeNode(r0_4.NodeName)
    if not r1_4 then
      ReddotManager.AddNode(r0_4.NodeName)
    end
    ReddotManager.AddListener(r0_4.NodeName, r0_4, r0_4.RefreshReddot)
  end
end
function r0_0.InitFilter(r0_5)
  -- line: [79, 109] id: 5
  r0_5.List_Item:SetFocus()
  r0_5.List_Item.BP_OnEntryInitialized:Clear()
  r0_5.List_Item.BP_OnEntryInitialized:Add(r0_5, r0_5.OnObjectSetFinished)
  local r1_5 = nil
  local r2_5 = nil
  if r0_5.Name == "Character" then
    r1_5, r2_5 = UIUtils.GetAllElementTypes()
  else
    local r3_5, r4_5, r5_5, r6_5 = UIUtils.GetAllWeaponTags()
    if r0_5.Name == "Melee" then
      r2_5 = r4_5
      r1_5 = r3_5
    elseif r0_5.Name == "Ranged" then
      r2_5 = r6_5
      r1_5 = r5_5
    end
  end
  r0_5.FilterTags = CommonUtils.DeepCopy(r1_5)
  r0_5.FilterNames = CommonUtils.DeepCopy(r2_5)
  for r7_5, r8_5 in pairs(r0_5.FilterTags) do
    if r0_5.Name == "Character" then
      local r9_5 = "Tab_" .. r8_5
      table.insert(r0_5.FilterIcons, "/Game/UI/Texture/Dynamic/Atlas/Tab/T_" .. r9_5 .. ".T_" .. r9_5)
    elseif r0_5.Name == "Melee" or r0_5.Name == "Ranged" then
      local r9_5 = DataMgr.WeaponTag[r8_5]
      table.insert(r0_5.FilterIcons, r9_5 and r9_5.Icon)
    end
  end
  -- close: r3_5
  table.insert(r0_5.FilterTags, 1, "All")
  table.insert(r0_5.FilterNames, 1, "UI_ALL")
  table.insert(r0_5.FilterIcons, 1, "/Game/UI/Texture/Static/Atlas/Armory/T_Armory_Select.T_Armory_Select")
end
function r0_0.InitCommonTab(r0_6)
  -- line: [111, 144] id: 6
  r0_6.AllTabInfo = {}
  for r5_6, r6_6 in ipairs(r0_6.FilterTags) do
    table.insert(r0_6.AllTabInfo, {
      Text = GText(r0_6.FilterNames[r5_6]),
      IconPath = r0_6.FilterIcons[r5_6],
      TabId = r6_6,
      SortId = -r5_6,
    })
  end
  -- close: r1_6
  r0_6.Index2TabId = {}
  r0_6.TabId2Index = {}
  for r5_6, r6_6 in pairs(r0_6.AllTabInfo) do
    r0_6.Index2TabId[r5_6] = r6_6.TabId
    r0_6.TabId2Index[r6_6.TabId] = r5_6
  end
  -- close: r1_6
  r0_6.TabConfigData = {
    TitleName = GText(DataMgr.ArchiveInfo[r0_6.Type].ArchiveTitle),
    LeftKey = "Q",
    RightKey = "E",
    Tabs = r0_6.AllTabInfo,
    DynamicNode = {
      "Back",
      "ResourceBar",
      "BottomKey"
    },
    StyleName = "Text",
    OwnerPanel = r0_6,
    BackCallback = r0_6.OnClickBack,
    BottomKeyInfo = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
          }
        },
        Desc = GText("UI_Tips_Ensure"),
        bLongPress = false,
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = r0_6.OnClickBack,
            Owner = r0_6,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
          }
        },
        Desc = GText("UI_BACK"),
        bLongPress = false,
      }
    },
  }
  r0_6.Com_Tab:Init(r0_6.TabConfigData, true)
  r0_6.Com_Tab:BindEventOnTabSelected(r0_6, r0_6.TabItemClick)
  r0_6.Com_Tab:SelectTabById(r0_6.FilterTags[1])
end
function r0_0.TabItemClick(r0_7, r1_7)
  -- line: [146, 156] id: 7
  r0_7.SelectFirstTime = false
  r0_7.List_Item:SetFocus()
  r0_7.CurTabId = r1_7:GetTabId()
  r0_7:RefreshList(true)
  r0_7:HorizontalListViewResize_SetUp(r0_7.Panel_ListCut, r0_7.List_Item, 0)
  r0_7.Collect:Init(r0_7.Name, r0_7.Type, r1_7.Idx, r1_7.Info.Text, r0_7.Num_Now, r0_7.Num_Total, r0_7)
end
function r0_0.RefreshList(r0_8, r1_8)
  -- line: [158, 185] id: 8
  if r1_8 == nil then
    r1_8 = true
  end
  if r1_8 then
    r0_8:_StopListFramingInAnim()
  else
    r0_8.List_Item:SetRenderOpacity(1)
  end
  r0_8:OnRefreshListBegin()
  r0_8:GetListData()
  r0_8.FirstFocus = false
  r0_8.List_Item:ClearListItems()
  r0_8.ItemId2Index = {}
  r0_8:OnListFillWith()
  r0_8:AddTimer(0.01, function()
    -- line: [178, 184] id: 9
    r0_8:OnRefreshListLater(r1_8)
    r0_8:OnRefreshListEnd()
    if r1_8 then
      r0_8.List_Item:ScrollToTop()
    end
  end, false, 0, "OnRefreshListLater", true)
end
function r0_0._StopListFramingInAnim(r0_10)
  -- line: [187, 193] id: 10
  local r1_10 = {
    UIState = r0_10,
  }
  if r0_10._ListAnimTimerKeys then
    r1_10.TimerKeys = r0_10._ListAnimTimerKeys
  end
  UIUtils.StopListViewFramingInAnimation(r0_10.List_Item, r1_10)
end
function r0_0.GetListData(r0_11)
  -- line: [195, 206] id: 11
  r0_11["Get" .. r0_11.Name .. "Data"](r0_11, r0_11.CurTabId)
end
function r0_0.GetCharacterData(r0_12, r1_12)
  -- line: [208, 263] id: 12
  local r2_12 = GWorld:GetAvatar()
  local r3_12 = r2_12.Sex and 0
  local r4_12 = {}
  local r5_12 = DataMgr.GlobalConstant.CurrentVersion.ConstantValue
  if not r0_12.AllCharacterIds then
    r0_12.AllCharacterIds = {}
    for r10_12, r11_12 in pairs(DataMgr.Char) do
      if not r11_12.IsNotOpen and (not r11_12.ReleaseVersion or r11_12.ReleaseVersion <= r5_12) then
        table.insert(r0_12.AllCharacterIds, r11_12.CharId)
        if r11_12.GenderTag and r11_12.GenderTag == r3_12 then
          r4_12[r11_12.CharId] = 0
        end
      end
    end
    -- close: r6_12
  end
  r0_12.ListDatas = {}
  local r6_12 = {}
  local r7_12 = {}
  if r2_12 then
    r6_12 = r2_12.Archives[r0_12.Type].ArchiveList and {}
    r7_12 = r2_12.Chars and {}
  end
  local r8_12 = {}
  local r9_12 = false
  for r14_12, r15_12 in pairs(r7_12) do
    r8_12[r15_12.CharId] = r15_12
    if r4_12[r15_12.CharId] then
      r9_12 = true
      r4_12[r15_12.CharId] = 1
    end
  end
  -- close: r10_12
  if not r9_12 then
    r4_12[Const.DefaultAttributeMaster[r3_12]] = 1
  end
  for r14_12, r15_12 in pairs(r0_12.AllCharacterIds) do
    local r16_12 = DataMgr.Char[r15_12]
    local r17_12 = DataMgr.BattleChar[r16_12.CharId].Attribute
    if (r1_12 == "All" or r17_12 == r1_12) and (not r16_12.GenderTag or r4_12[r15_12] == 1) then
      local r18_12 = false
      if r6_12[r15_12] then
        r18_12 = true
      end
      local r19_12 = {}
      if r8_12[r15_12] then
        r19_12 = r8_12[r15_12]
      end
      r0_12:FillListDatasWithCharacterInfo(r16_12, r19_12, r18_12)
    end
  end
  -- close: r10_12
  r0_12:SortListDatas()
end
function r0_0.GetMeleeData(r0_13, r1_13)
  -- line: [265, 303] id: 13
  local r2_13 = DataMgr.GlobalConstant.CurrentVersion.ConstantValue
  if not r0_13.AllMeleeIds then
    r0_13.AllMeleeIds = {}
    for r7_13, r8_13 in pairs(DataMgr.Weapon) do
      if not r8_13.IsNotOpen and (not r8_13.ReleaseVersion or r8_13.ReleaseVersion <= r2_13) and r0_13:DoesWeaponHaveTag(r8_13.WeaponId, "Melee") then
        table.insert(r0_13.AllMeleeIds, r8_13.WeaponId)
      end
    end
    -- close: r3_13
  end
  r0_13.ListDatas = {}
  local r3_13 = {}
  local r4_13 = {}
  local r5_13 = GWorld:GetAvatar()
  if r5_13 then
    r3_13 = r5_13.Archives[r0_13.Type].ArchiveList and {}
    r4_13 = r5_13.Archives[r0_13.Type].ArchiveInfo and {}
  end
  for r10_13, r11_13 in pairs(r0_13.AllMeleeIds) do
    if r1_13 == "All" or r0_13:DoesWeaponHaveTag(r11_13, r1_13) then
      local r12_13 = r1_13
      if r1_13 == "All" then
        r12_13 = r0_13:GetWeaponTag(r11_13)
      end
      local r13_13 = DataMgr.Weapon[r11_13]
      local r14_13 = false
      if r3_13[r11_13] then
        r14_13 = true
      end
      r0_13:FillListDatasWithWeaponInfo(r13_13, r4_13[r11_13] and {}, r14_13, r12_13)
    end
  end
  -- close: r6_13
  r0_13:SortListDatas()
end
function r0_0.GetRangedData(r0_14, r1_14)
  -- line: [305, 343] id: 14
  local r2_14 = DataMgr.GlobalConstant.CurrentVersion.ConstantValue
  if not r0_14.AllRangedIds then
    r0_14.AllRangedIds = {}
    for r7_14, r8_14 in pairs(DataMgr.Weapon) do
      if not r8_14.IsNotOpen and (not r8_14.ReleaseVersion or r8_14.ReleaseVersion <= r2_14) and r0_14:DoesWeaponHaveTag(r8_14.WeaponId, "Ranged") then
        table.insert(r0_14.AllRangedIds, r8_14.WeaponId)
      end
    end
    -- close: r3_14
  end
  r0_14.ListDatas = {}
  local r3_14 = {}
  local r4_14 = {}
  local r5_14 = GWorld:GetAvatar()
  if r5_14 then
    r3_14 = r5_14.Archives[r0_14.Type].ArchiveList and {}
    r4_14 = r5_14.Archives[r0_14.Type].ArchiveInfo and {}
  end
  for r10_14, r11_14 in pairs(r0_14.AllRangedIds) do
    if r1_14 == "All" or r0_14:DoesWeaponHaveTag(r11_14, r1_14) then
      local r12_14 = r1_14
      if r1_14 == "All" then
        r12_14 = r0_14:GetWeaponTag(r11_14)
      end
      local r13_14 = DataMgr.Weapon[r11_14]
      local r14_14 = false
      if r3_14[r11_14] then
        r14_14 = true
      end
      r0_14:FillListDatasWithWeaponInfo(r13_14, r4_14[r11_14] and {}, r14_14, r12_14)
    end
  end
  -- close: r6_14
  r0_14:SortListDatas()
end
function r0_0.DoesWeaponHaveTag(r0_15, r1_15, r2_15)
  -- line: [345, 355] id: 15
  local r3_15 = DataMgr.BattleWeapon[r1_15].WeaponTag
  if r3_15 then
    for r8_15, r9_15 in pairs(r3_15) do
      if r9_15 == r2_15 then
        return true
      end
    end
    -- close: r4_15
  end
  return false
end
function r0_0.GetWeaponTag(r0_16, r1_16)
  -- line: [357, 369] id: 16
  local r2_16 = DataMgr.BattleWeapon[r1_16].WeaponTag
  if r2_16 then
    for r7_16, r8_16 in pairs(r2_16) do
      for r13_16, r14_16 in ipairs(r0_16.FilterTags) do
        if r8_16 == r14_16 then
          return r8_16
        end
      end
      -- close: r9_16
    end
    -- close: r3_16
  end
  return nil
end
function r0_0.SetupListContent(r0_17, r1_17, r2_17, r3_17)
  -- line: [371, 400] id: 17
  r3_17.Index = r1_17
  r3_17.Id = r2_17.Id
  r3_17.Type = r2_17.Type
  r3_17.Name = r2_17.Name
  r3_17.Rarity = r2_17.Rarity
  r3_17.ItemIcon = r2_17.Icon
  r3_17.TypeIcon = r2_17.TagIcon
  r3_17.IsLock = not r2_17.Unlock
  r3_17.IsNew = r0_17:CheckIsNew(r0_17.NodeName, r2_17.Id)
  r3_17.EnhanceLevel = r2_17.EnhanceLevel and 0
  r3_17.GradeLevel = r2_17.GradeLevel and 0
  r3_17.OnMouseButtonUpEvent = {
    Callback = r0_17.ClickListItem,
    Obj = r0_17,
    Params = {
      r3_17
    },
  }
end
function r0_0.OnListFillWith(r0_18)
  -- line: [402, 415] id: 18
  r0_18.Num_Now = 0
  r0_18.Num_Total = 0
  for r5_18, r6_18 in ipairs(r0_18.ListDatas) do
    r0_18.Num_Total = r0_18.Num_Total + 1
    local r7_18 = NewObject(UIUtils.GetCommonItemContentClass())
    r0_18:SetupListContent(r5_18, r6_18, r7_18)
    if r6_18.Unlock then
      r0_18.Num_Now = r0_18.Num_Now + 1
    end
    r0_18.ItemId2Index[r6_18.Id] = r5_18
    r0_18.List_Item:AddItem(r7_18)
  end
  -- close: r1_18
end
function r0_0.OnRefreshListLater(r0_19, r1_19)
  -- line: [417, 432] id: 19
  if r1_19 then
    r0_19._ListAnimTimerKeys = UIUtils.PlayListViewFramingInAnimation(r0_19, r0_19.List_Item, {
      Interval = 0.01,
      Callback = function()
        -- line: [428, 430] id: 20
      end,
    })
  end
end
function r0_0.OnRefreshListBegin(r0_21)
  -- line: [434, 435] id: 21
end
function r0_0.OnRefreshListEnd(r0_22)
  -- line: [437, 438] id: 22
end
function r0_0.FillListDatasWithCharacterInfo(r0_23, r1_23, r2_23, r3_23)
  -- line: [440, 460] id: 23
  local r4_23 = DataMgr.BattleChar[r1_23.CharId].Attribute
  local r5_23 = nil
  if r4_23 then
    local r6_23 = "Armory_" .. r4_23
    r5_23 = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. r6_23 .. ".T_" .. r6_23
  end
  table.insert(r0_23.ListDatas, {
    Type = "Character",
    Id = r1_23.CharId,
    Name = r1_23.CharName,
    Rarity = r1_23.CharRarity,
    Icon = r1_23.Icon,
    Tag = r4_23,
    TagIcon = r5_23,
    SortPriority = r1_23.SortPriority,
    Unlock = r3_23,
    EnhanceLevel = r2_23.EnhanceLevel,
    GradeLevel = r2_23.GradeLevel,
  })
end
function r0_0.FillListDatasWithWeaponInfo(r0_24, r1_24, r2_24, r3_24, r4_24)
  -- line: [462, 483] id: 24
  local r5_24 = nil
  if r4_24 then
    local r6_24 = DataMgr.WeaponTag[r4_24]
    if r6_24 then
      r5_24 = r6_24.Icon
    end
  end
  local r6_24 = table.insert
  local r7_24 = r0_24.ListDatas
  local r8_24 = {
    Type = "Weapon",
    Id = r1_24.WeaponId,
    Name = r1_24.WeaponName,
    Rarity = r1_24.WeaponRarity,
    Icon = r1_24.Icon,
    Tag = r4_24,
    TagIcon = r5_24,
    SortPriority = r1_24.SortPriority and 0,
    Unlock = r3_24,
    EnhanceLevel = r2_24[1],
    GradeLevel = r2_24[2],
  }
  r6_24(r7_24, r8_24)
end
function r0_0.SortListDatas(r0_25)
  -- line: [485, 501] id: 25
  table.sort(r0_25.ListDatas, function(r0_26, r1_26)
    -- line: [486, 500] id: 26
    if r0_26.Unlock ~= r1_26.Unlock then
      if r0_26.Unlock then
        return true
      else
        return false
      end
    elseif r0_26.Rarity ~= r1_26.Rarity then
      return r1_26.Rarity < r0_26.Rarity
    elseif r0_26.SortPriority ~= r1_26.SortPriority then
      return r1_26.SortPriority < r0_26.SortPriority
    else
      return r0_26.Id < r1_26.Id
    end
  end)
end
function r0_0.OnKeyDown(r0_27, r1_27, r2_27)
  -- line: [503, 534] id: 27
  local r3_27 = UE4.UKismetInputLibrary.GetKey(r2_27)
  local r4_27 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_27)
  local r5_27 = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_27) then
    if r4_27 == UIConst.GamePadKey.FaceButtonTop then
      r5_27 = true
      r0_27.Collect:OnCellClicked()
    elseif r4_27 == UIConst.GamePadKey.FaceButtonRight then
      r5_27 = true
      r0_27:OnReturnKeyDown()
    elseif r4_27 == UIConst.GamePadKey.LeftShoulder then
      r5_27 = r0_27.Com_Tab:Handle_KeyEventOnGamePad(r4_27)
    elseif r4_27 == UIConst.GamePadKey.RightShoulder then
      r5_27 = r0_27.Com_Tab:Handle_KeyEventOnGamePad(r4_27)
    end
  elseif r4_27 == "Escape" then
    r5_27 = true
    r0_27:OnReturnKeyDown()
  elseif r4_27 == "Q" then
    r0_27.Com_Tab:TabToLeft()
  elseif r4_27 == "E" then
    r0_27.Com_Tab:TabToRight()
  end
  if r5_27 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end
function r0_0.OnReturnKeyDown(r0_28)
  -- line: [536, 539] id: 28
  UIUtils.PlayCommonBtnSe(r0_28)
  r0_28:OnClickBack()
end
function r0_0.OnClickBack(r0_29)
  -- line: [541, 545] id: 29
  if r0_29:CheckIsCanCloseSelf() then
    r0_29:PlayOutAnim()
  end
end
function r0_0.CheckIsCanCloseSelf(r0_30)
  -- line: [547, 552] id: 30
  if r0_30:IsAnimationPlaying(r0_30.In) then
    return false
  end
  return true
end
function r0_0.PlayInAnim(r0_31)
  -- line: [554, 561] id: 31
  if r0_31:IsAnimationPlaying(r0_31.In) then
    return 
  end
  AudioManager(r0_31):PlayUISound(r0_31, "event:/ui/armory/open", "ArchivePageCharOpenSound", nil)
  r0_31:PlayAnimationForward(r0_31.In)
  r0_31.Main:SetRenderOpacity(1)
end
function r0_0.PlayOutAnim(r0_32)
  -- line: [563, 571] id: 32
  if r0_32:IsAnimationPlaying(r0_32.Out) then
    return 
  end
  AudioManager(r0_32):SetEventSoundParam(r0_32, "ArchivePageCharOpenSound", {
    ToEnd = 1,
  })
  r0_32:BlockAllUIInput(true)
  r0_32:BindToAnimationFinished(r0_32.Out, {
    r0_32,
    r0_32.Close
  })
  r0_32:PlayAnimationForward(r0_32.Out)
end
function r0_0.Close(r0_33)
  -- line: [573, 575] id: 33
  r0_33.Super.Close(r0_33)
end
function r0_0.ClickListItem(r0_34, r1_34)
  -- line: [577, 583] id: 34
  if r0_34.Name == "Character" then
    r0_34:ClickListChar(r1_34)
  elseif r0_34.Name == "Melee" or r0_34.Name == "Ranged" then
    r0_34:ClickListWeapon(r1_34)
  end
end
function r0_0.ClickListChar(r0_35, r1_35)
  -- line: [585, 606] id: 35
  local r2_35 = {}
  for r7_35, r8_35 in ipairs(r0_35.ListDatas) do
    table.insert(r2_35, r8_35.Id)
  end
  -- close: r3_35
  UIManager(r0_35):LoadUINew("ArmoryDetail", {
    PreviewCharIds = r2_35,
    SelectedTargetId = r1_35.Id,
    EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewArmory,
    bNoEndCamera = true,
    bFromArchive = true,
    bHideCharAppearance = true,
    DoNotSort = true,
    bNeedStandBtn = true,
    OnCloseDelegate = nil,
  })
end
function r0_0.ClickListWeapon(r0_36, r1_36)
  -- line: [608, 625] id: 36
  local r2_36 = {}
  for r7_36, r8_36 in ipairs(r0_36.ListDatas) do
    table.insert(r2_36, r8_36.Id)
  end
  -- close: r3_36
  UIManager(r0_36):LoadUINew("ArmoryDetail", {
    PreviewWeaponIds = r2_36,
    SelectedTargetId = r1_36.Id,
    EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewArmory,
    bNoEndCamera = true,
    bFromArchive = true,
    bHideWeaponAppearance = true,
    DoNotSort = true,
    OnCloseDelegate = nil,
  })
end
function r0_0.InitListenEvent(r0_37)
  -- line: [627, 631] id: 37
  if IsValid(r0_37.GameInputModeSubsystem) then
    r0_37.GameInputModeSubsystem.OnInputMethodChanged:Add(r0_37, r0_37.RefreshOpInfoByInputDevice)
  end
end
function r0_0.ClearListenEvent(r0_38)
  -- line: [633, 637] id: 38
  if IsValid(r0_38.GameInputModeSubsystem) then
    r0_38.GameInputModeSubsystem.OnInputMethodChanged:Remove(r0_38, r0_38.RefreshOpInfoByInputDevice)
  end
end
function r0_0.RefreshOpInfoByInputDevice(r0_39, r1_39, r2_39)
  -- line: [639, 645] id: 39
  if r1_39 == ECommonInputType.Touch then
    return 
  end
  r0_39:UpdateUIStyleInPlatform(r1_39 == ECommonInputType.MouseAndKeyboard)
end
function r0_0.UpdateUIStyleInPlatform(r0_40, r1_40)
  -- line: [647, 653] id: 40
  if r1_40 then
    r0_40:InitKeyboardView()
  else
    r0_40:InitGamepadView()
  end
end
function r0_0.InitGamepadView(r0_41)
  -- line: [655, 659] id: 41
  if UIUtils.HasAnyFocus(r0_41) then
    r0_41.List_Item:SetFocus()
  end
end
function r0_0.InitKeyboardView(r0_42)
  -- line: [661, 666] id: 42
end
function r0_0.InitWidgetInfoInGamePad(r0_43)
  -- line: [668, 677] id: 43
  r0_43.Collect:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "Y",
      }
    },
  })
end
function r0_0.BP_GetDesiredFocusTarget(r0_44)
  -- line: [679, 681] id: 44
  return r0_44.List_Item
end
function r0_0.TrySetFocusFirstTime(r0_45, r1_45)
  -- line: [683, 689] id: 45
  if not r0_45.SelectFirstTime then
    r0_45.SelectFirstTime = true
    r0_45.List_Item:BP_NavigateToItem(r1_45.Content)
  end
end
function r0_0.CheckIsNew(r0_46, r1_46, r2_46)
  -- line: [691, 704] id: 46
  if not r1_46 or not r2_46 then
    return false
  end
  if not ReddotManager.GetTreeNode(r1_46) then
    ReddotManager.AddNode(r1_46)
  end
  local r4_46 = ReddotManager.GetLeafNodeCacheDetail(r1_46)[r2_46] == 1
end
function r0_0.RefreshReddot(r0_47)
  -- line: [706, 757] id: 47
  local r1_47 = ReddotManager.GetLeafNodeCacheDetail(r0_47.NodeName)
  r0_47.Index2ReddotNum = {}
  if r1_47 then
    for r6_47, r7_47 in pairs(r1_47) do
      if r7_47 == 1 then
        if r0_47.Name == "Character" then
          local r10_47 = r0_47.TabId2Index[DataMgr.BattleChar[DataMgr.Char[r6_47].CharId].Attribute]
          if r10_47 == 6 then
            local r11_47 = 1
          end
          if not r0_47.Index2ReddotNum[r10_47] then
            r0_47.Index2ReddotNum[r10_47] = 1
          else
            r0_47.Index2ReddotNum[r10_47] = r0_47.Index2ReddotNum[r10_47] + 1
          end
          local r11_47 = r0_47.TabId2Index.All
          if not r0_47.Index2ReddotNum[r11_47] then
            r0_47.Index2ReddotNum[r11_47] = 1
          else
            r0_47.Index2ReddotNum[r11_47] = r0_47.Index2ReddotNum[r11_47] + 1
          end
        elseif r0_47.Name == "Melee" or r0_47.Name == "Ranged" then
          for r12_47, r13_47 in ipairs(r0_47.FilterTags) do
            if r13_47 == "All" or r0_47:DoesWeaponHaveTag(r6_47, r13_47) then
              local r14_47 = r0_47.TabId2Index[r13_47]
              if not r0_47.Index2ReddotNum[r14_47] then
                r0_47.Index2ReddotNum[r14_47] = 1
              else
                r0_47.Index2ReddotNum[r14_47] = r0_47.Index2ReddotNum[r14_47] + 1
              end
            end
          end
          -- close: r8_47
        end
      end
    end
    -- close: r2_47
    r0_47:RefreshTabReddot()
  end
  for r7_47, r8_47 in pairs(r0_47.List_Item:GetListItems()) do
    r8_47.IsNew = false
    if r8_47.Id and r1_47[r8_47.Id] == 1 then
      r8_47.IsNew = true
    end
  end
  -- close: r3_47
  for r8_47, r9_47 in pairs(r0_47.List_Item:GetDisplayedEntryWidgets()) do
    r9_47:SetNew(r9_47.Content.IsNew)
  end
  -- close: r4_47
end
function r0_0.OnObjectSetFinished(r0_48, r1_48, r2_48)
  -- line: [759, 764] id: 48
  if r1_48.Index == 1 and not r0_48.FirstFocus then
    r0_48.FirstFocus = true
    r0_48.List_Item:BP_NavigateToItem(r1_48)
  end
end
function r0_0.RefreshTabReddot(r0_49)
  -- line: [766, 776] id: 49
  if r0_49.AllTabInfo then
    for r5_49, r6_49 in pairs(r0_49.AllTabInfo) do
      if r0_49.Index2ReddotNum and r0_49.Index2ReddotNum[r5_49] then
        r0_49.Com_Tab:ShowTabRedDot(r5_49, true)
      else
        r0_49.Com_Tab:ShowTabRedDot(r5_49, false)
      end
    end
    -- close: r1_49
  end
end
AssembleComponents(r0_0)
return r0_0
