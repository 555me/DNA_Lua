-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\UI_PC\Abyss\WBP_Abyss_Lineup_C.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local r1_0 = require("Utils.TimeUtils")
local r2_0 = require("EMCache.EMCache")
local r3_0 = require("Utils.UIUtils")
local r4_0 = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})
local r5_0 = CommonConst.AbyssTeamNoChar
local r6_0 = CommonConst.AbyssTeamNoPet
r4_0._components = {
  "BluePrints.UI.WBP.Abyss.MainComponent.Abyss_CharMainComponent",
  "BluePrints.UI.WBP.Abyss.MainComponent.Abyss_PetMainComponent",
  "BluePrints.UI.WBP.Abyss.MainComponent.Abyss_WeaponMainComponent"
}
r4_0.ESlotName = {
  Char = 1,
  MeleeWeapon = 2,
  RangedWeapon = 3,
  Phantom1 = 4,
  PhantomWeapon1 = 5,
  Phantom2 = 6,
  PhantomWeapon2 = 7,
  Pet = 8,
  Null = 0,
}
r4_0.SlotName2Type = {
  [r4_0.ESlotName.Char] = "Char",
  [r4_0.ESlotName.Pet] = "Pet",
  [r4_0.ESlotName.RangedWeapon] = "Ranged",
  [r4_0.ESlotName.MeleeWeapon] = "Melee",
  [r4_0.ESlotName.Phantom1] = "Char",
  [r4_0.ESlotName.PhantomWeapon1] = "Weapon",
  [r4_0.ESlotName.Phantom2] = "Char",
  [r4_0.ESlotName.PhantomWeapon2] = "Weapon",
}
r4_0.SlotType2DataType = {
  Char = "Char",
  Pet = "Pet",
  Weapon = "Weapon",
  Ranged = "Weapon",
  Melee = "Weapon",
}
r4_0.SlotName2TextMap = {
  [r4_0.ESlotName.Char] = GText("UI_Armory_Char"),
  [r4_0.ESlotName.Pet] = GText("MAIN_UI_PET"),
  [r4_0.ESlotName.RangedWeapon] = GText("Ranged") .. GText("UI_SHOP_SUBTAB_NAME_WEAPON"),
  [r4_0.ESlotName.MeleeWeapon] = GText("Melee") .. GText("UI_SHOP_SUBTAB_NAME_WEAPON"),
  [r4_0.ESlotName.Phantom1] = GText("UI_STAT_Sigil") .. "1",
  [r4_0.ESlotName.PhantomWeapon1] = GText("UI_STAT_Sigil") .. "1" .. GText("UI_SHOP_SUBTAB_NAME_WEAPON"),
  [r4_0.ESlotName.Phantom2] = GText("UI_STAT_Sigil") .. "2",
  [r4_0.ESlotName.PhantomWeapon2] = GText("UI_STAT_Sigil") .. "2" .. GText("UI_SHOP_SUBTAB_NAME_WEAPON"),
}
r4_0.EDirection = {
  Left = 1,
  Right = 2,
  Up = 3,
  Down = 4,
}
r4_0.GamepadIcons = {
  "Controller_SwitchTeam"
}
function r4_0.Construct(r0_1)
  -- line: [70, 90] id: 1
  r0_1.Platform = CommonUtils.GetDeviceTypeByPlatformName(GWorld.GameInstance)
  r0_1.TypeTabs = {
    [r0_1.SlotName2Type[r0_1.ESlotName.RangedWeapon]] = r0_1.List_Lineup.Type_Range,
    [r0_1.SlotName2Type[r0_1.ESlotName.MeleeWeapon]] = r0_1.List_Lineup.Type_Melee,
  }
  r0_1.List_Lineup.Type_Range:Init(r0_1.SlotName2Type[r0_1.ESlotName.RangedWeapon], r0_1)
  r0_1.List_Lineup.Type_Melee:Init(r0_1.SlotName2Type[r0_1.ESlotName.MeleeWeapon], r0_1)
  r0_1.List_Lineup.Tab_Primary:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_1.Btn_Save:SetText(GText("UI_RegionMap_Save"))
  r0_1.Btn_Save:Init(r0_1, r0_1.SaveLineup)
  r0_1.Btn_Click.OnClicked:Add(r0_1, r0_1.OnBackgroundClicked)
  r0_1:InitSelectiveList()
  r0_1:InitItemDetailWidget()
  r0_1:InitGamepadKeys()
  r0_1:InitListenEvent()
end
function r4_0.IsMobile(r0_2)
  -- line: [92, 94] id: 2
  return r0_2.Platform == CommonConst.CLIENT_DEVICE_TYPE.MOBILE
end
function r4_0.InitGamepadKeys(r0_3)
  -- line: [96, 117] id: 3
  if r0_3:IsMobile() then
    return 
  end
  r0_3.Icon_Key_Save:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "X",
      }
    },
  })
  r0_3.Controller_SwitchTeam:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "Vertical",
      }
    },
    Desc = GText("UI_Abyss_SwitchTeam"),
  })
end
function r4_0.InitWidget(r0_4)
  -- line: [119, 153] id: 4
  r0_4.bInList = false
  r0_4.CurDungeonPanel = r0_4.Team_Detail1
  if not GWorld:GetAvatar() then
    DebugPrint("lhr@阵容配置界面Avatar获取失败")
    return 
  end
  r0_4.Btn_Save:SetForbidden(true)
  if r0_4.Dungeons then
    for r6_4, r7_4 in pairs(r0_4.Dungeons) do
      if r7_4 then
        r7_4:ClearAllSlots(true)
      else
        DebugPrint("lhr@WBP_Abyss_Lineup_C:Enter, 阵容面板初始化失败")
      end
    end
    -- close: r2_4
  end
  r0_4.Dungeons = {}
  r0_4.Uuid2SlotMap = {}
  r0_4.CurSlotType = ""
  r0_4.CurSlotName = r0_4.ESlotName.Null
  r0_4.CurWeaponType = r0_4.CurWeaponType and r0_4.SlotName2Type[r0_4.ESlotName.MeleeWeapon]
  r0_4:CharMain_InitWidget()
  r0_4:WeaponMain_InitWidget()
  r0_4:PetMain_InitWidget()
end
function r4_0.Destruct(r0_5)
  -- line: [155, 163] id: 5
  if IsValid(r0_5.GameInputModeSubsystem) then
    r0_5.GameInputModeSubsystem.OnInputMethodChanged:Remove(r0_5, r0_5.RefreshOpInfoByInputDevice)
  end
  if r0_5.SetFocusTimer then
    r0_5:RemoveTimer(r0_5.SetFocusTimer)
    r0_5.SetFocusTimer = nil
  end
end
function r4_0.InitTable(r0_6)
  -- line: [165, 217] id: 6
  r0_6.BottomKeyInfo = {
    {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "A",
          Owner = r0_6,
        }
      },
      Desc = GText("UI_Tips_Ensure"),
      bLongPress = false,
    },
    {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "A",
          Owner = r0_6,
        }
      },
      Desc = GText("UI_CTL_Add/Remove"),
      bLongPress = false,
    },
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Escape",
          ClickCallback = r0_6.OnReturnKeyDown,
          Owner = r0_6,
        }
      },
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
          ClickCallback = r0_6.OnReturnKeyDown,
          Owner = r0_6,
        }
      },
      Desc = GText("UI_BACK"),
      bLongPress = false,
    }
  }
  local r1_6 = {}
  for r6_6, r7_6 in ipairs(r0_6.BottomKeyInfo) do
    table.insert(r1_6, r7_6)
  end
  -- close: r2_6
  r0_6.TabConfigData = {
    TitleName = GText("Abyss_PartySetup"),
    DynamicNode = {
      "Back",
      "BottomKey"
    },
    StyleName = "Text",
    OwnerPanel = r0_6.Root,
    BackCallback = r0_6.Root.OnClickBack,
    BottomKeyInfo = r1_6,
  }
  r0_6.Root:InitOtherPageTab(r0_6.TabConfigData, {}, true)
  r0_6:ShowConfirmBtn(false)
  r0_6:ShowAddAndRemoveBtn(false)
end
function r4_0.AddTabItem(r0_7, r1_7)
  -- line: [219, 226] id: 7
  local r2_7 = r0_7.Root.Com_Tab
  if not r2_7 then
    return 
  end
  r2_7.ConfigData.BottomKeyInfo[r1_7] = r0_7.BottomKeyInfo[r1_7]
end
function r4_0.RemoveTabItem(r0_8, r1_8)
  -- line: [228, 235] id: 8
  local r2_8 = r0_8.Root.Com_Tab
  if not r2_8 then
    return 
  end
  r2_8.ConfigData.BottomKeyInfo[r1_8] = {}
end
function r4_0.ShowConfirmBtn(r0_9, r1_9)
  -- line: [237, 247] id: 9
  local r2_9 = r0_9.Root.Com_Tab
  if not r2_9 then
    return 
  end
  if r0_9:IsMobile() then
    return 
  end
  if r1_9 then
    r0_9:AddTabItem(1)
  else
    r0_9:RemoveTabItem(1)
  end
  r2_9:UpdateHotKeyInfo(r0_9.CurGamepadName)
end
function r4_0.ShowAddAndRemoveBtn(r0_10, r1_10)
  -- line: [249, 259] id: 10
  local r2_10 = r0_10.Root.Com_Tab
  if not r2_10 then
    return 
  end
  if r0_10:IsMobile() then
    return 
  end
  if r1_10 then
    r0_10:AddTabItem(2)
  else
    r0_10:RemoveTabItem(2)
  end
  r2_10:UpdateHotKeyInfo(r0_10.CurGamepadName)
end
function r4_0.OnBackgroundClicked(r0_11)
  -- line: [261, 266] id: 11
  if r0_11.bItemDetailsShowed then
    r0_11:ShowItemDetails(false)
  end
  r0_11:SetContentIsSelected(r0_11.SelectedContent, false)
end
function r4_0.Enter(r0_12, r1_12, r2_12, r3_12)
  -- line: [268, 288] id: 12
  r0_12.Saved = true
  r0_12.InList = nil
  r0_12.ReturnPressed = false
  r0_12.bItemDetailsShowed = false
  r0_12.AbyssId = r1_12.AbyssId
  r0_12.TeamInfos = r1_12.TeamInfos
  r0_12.LevelIndex = r1_12.LevelIndex
  r0_12:InitWidget()
  r0_12:RefreshBaseInfo()
  r0_12:InitDungeons(r1_12.DungeonIds, r2_12)
  r0_12:InitDetailPanels()
  r0_12:ClearListenEvent()
  local r4_12 = r3_12 and r0_12.ESlotName.Char
  if r0_12.CurDungeonPanel then
    r0_12.CurDungeonPanel:SelectSlot(r4_12, false, true)
  end
  r0_12:DelaySetFocusTarget(nil, 0.2)
end
function r4_0.InitDungeons(r0_13, r1_13, r2_13)
  -- line: [290, 319] id: 13
  if not r1_13 or type(r1_13) ~= "table" then
    DebugPrint("lhr@WBP_Abyss_Lineup_C:Enter, 副本Id无效")
    return 
  end
  r0_13.DungeonIds = r1_13
  if #r1_13 == 1 then
    r0_13.Team_Detail2:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_13.Dungeons = {
      [1] = r0_13.Team_Detail1,
    }
  else
    r0_13.Team_Detail2:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_13.Dungeons = {
      [1] = r0_13.Team_Detail1,
      [2] = r0_13.Team_Detail2,
    }
  end
  local r3_13 = r2_13 and 1
  r0_13.CurDungeonPanel = r0_13.Dungeons[r3_13]
  for r8_13, r9_13 in pairs(r0_13.Dungeons) do
    if r9_13 then
      r9_13:Init(r8_13, r0_13, r0_13.DungeonIds[r8_13], r8_13 == r3_13)
    else
      DebugPrint("lhr@WBP_Abyss_Lineup_C:InitDungeons, 阵容面板初始化失败")
    end
  end
  -- close: r4_13
end
function r4_0.InitDetailPanels(r0_14)
  -- line: [321, 361] id: 14
  local r1_14 = GWorld:GetAvatar()
  if not r1_14 then
    DebugPrint("WBP_Abyss_Lineup_C:InitDetailPanels, 配置面板初始化失败，Avatar无效")
    return 
  end
  for r6_14, r7_14 in pairs(r0_14.ESlotName) do
    for r12_14, r13_14 in pairs(r0_14.Dungeons) do
      local r14_14 = r0_14.TeamInfos[r12_14][r6_14]
      if r14_14 and r0_14:CheckUnit(r14_14) then
        local r15_14 = r0_14.SlotName2Type[r7_14]
        local r16_14 = r0_14.SlotType2DataType[r15_14]
        local r17_14 = r1_14[r16_14 .. "s"][r14_14]
        if not r17_14 then
          GWorld.logger.error("WBP_Abyss_Lineup_C:InitDetailPanels@该Uuid对应的物品已失效" .. CommonUtils.ObjId2Str(r14_14))
        end
        local r18_14 = r17_14 and r17_14:Data()
        local r19_14 = {
          Type = r16_14,
          Icon = r18_14 and r18_14.Icon,
          Rarity = r18_14 and r18_14.Rarity and r18_14[r16_14 .. "Rarity"],
          GachaIcon = r18_14 and r18_14.GachaIcon,
          Uuid = r14_14,
        }
        if r16_14 == "Weapon" then
          for r25_14, r26_14 in pairs({
            CommonConst.ArmoryTag.Melee,
            CommonConst.ArmoryTag.Ranged
          }) do
            if r17_14 and r17_14:HasTag(r26_14) then
              r19_14.Tag = r26_14
              r0_14:CallFunctionByName(r26_14 .. "Main_Init")
              break
            end
          end
          -- close: r21_14
        else
          r0_14:CallFunctionByName(r15_14 .. "Main_Init")
        end
        r13_14:UpdateSlot(r7_14, r19_14)
      end
    end
    -- close: r8_14
  end
  -- close: r2_14
end
function r4_0.CheckUnit(r0_15, r1_15)
  -- line: [363, 369] id: 15
  if type(r1_15) == "number" then
    return r1_15 ~= r6_0
  else
    return r1_15 ~= r5_0
  end
end
function r4_0.InitSelectiveList(r0_16)
  -- line: [371, 393] id: 16
  r0_16.OrderByDisplayNames = {
    "UI_LEVEL_SELECT",
    "UI_RARITY_NAME"
  }
  r0_16.OrderByAttrNames = {
    "Level",
    "Rarity",
    "SortPriority",
    "UnitId"
  }
  r0_16.PetOrderByAttrNames = {
    "BreakNum",
    "Level",
    "Rarity",
    "SortPriority",
    "UnitId"
  }
  r0_16.CharFilterTags, r0_16.CharFilterNames = r3_0.GetAllElementTypes()
  r0_16.CharFilterIcons = {}
  for r5_16, r6_16 in pairs(r0_16.CharFilterTags) do
    local r7_16 = "Armory_" .. r6_16
    table.insert(r0_16.CharFilterIcons, "/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. r7_16 .. ".T_" .. r7_16)
  end
  -- close: r1_16
  r0_16.MeleeFilterTags, r0_16.MeleeFilterNames, r0_16.RangedFilterTags, r0_16.RangedFilterNames = r3_0.GetAllWeaponTags()
  r0_16.MeleeFilterIcons = {}
  for r5_16, r6_16 in ipairs(r0_16.MeleeFilterTags) do
    local r7_16 = DataMgr.WeaponTag[r6_16]
    table.insert(r0_16.MeleeFilterIcons, r7_16 and r7_16.Icon)
  end
  -- close: r1_16
  r0_16.RangedFilterIcons = {}
  for r5_16, r6_16 in ipairs(r0_16.RangedFilterTags) do
    local r7_16 = DataMgr.WeaponTag[r6_16]
    table.insert(r0_16.RangedFilterIcons, r7_16 and r7_16.Icon)
  end
  -- close: r1_16
end
function r4_0.SetDetailPanelLocation(r0_17, r1_17, r2_17)
  -- line: [395, 407] id: 17
  local r3_17 = ""
  if r1_17 == 1 then
    r3_17 = "Expand"
  elseif r1_17 == 2 then
    r3_17 = "Fold"
  end
  if r2_17 then
    r3_17 = r3_17 .. "_Normal"
  end
  EMUIAnimationSubsystem:EMPlayAnimation(r0_17, r0_17[r3_17])
end
function r4_0.SelectDungeon(r0_18, r1_18, r2_18)
  -- line: [409, 427] id: 18
  local r3_18 = r0_18.CurDungeonPanel.DungeonIndex
  if r3_18 == r1_18 then
    return 
  end
  if not r2_18 then
    r0_18.Dungeons[r3_18]:UnSelectSlot(r0_18.CurSlotName)
    r0_18.Dungeons[r1_18]:SelectSlot(r0_18.ESlotName.Char, false, true)
  end
  for r8_18, r9_18 in pairs(r0_18.Dungeons) do
    if r8_18 == r1_18 then
      r0_18.CurDungeonPanel = r9_18
      r9_18:ExpandPanel()
    else
      r9_18:CollapsePanel()
    end
  end
  -- close: r4_18
  r0_18:DelaySetFocusTarget(nil, 0.2)
end
function r4_0.SlotSelectionChanged(r0_19, r1_19, r2_19, r3_19)
  -- line: [430, 471] id: 19
  if r0_19.Dungeons[r2_19] == nil then
    return 
  end
  if not r0_19:IsListAllowRefresh() then
    return 
  end
  local r4_19 = false
  local r5_19 = r0_19.CurDungeonPanel.DungeonIndex
  if r2_19 ~= r5_19 then
    r0_19:SelectDungeon(r2_19, true)
    r4_19 = true
  end
  local r6_19 = r0_19.CurSlotName
  r0_19.CurSlotName = r1_19
  local r7_19 = r0_19.SlotName2Type[r1_19]
  if r0_19.CurSlotName ~= r6_19 then
    r4_19 = true
  end
  r0_19:DelaySetFocusTarget(r3_19)
  if r4_19 then
    r0_19.CurSlotType = r7_19
    r0_19.Dungeons[r5_19]:UnSelectSlot(r6_19)
    r0_19.CurDungeonPanel:CheckSlot(r1_19)
    r0_19.CurDungeonPanel.CurSlotName = r0_19.CurSlotName
    if r0_19.CurSlotType == "Weapon" then
      r0_19.List_Lineup.Tab_Primary:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      r0_19:PhantomWeaponTypeChanged(r0_19.CurDungeonPanel:GetWeaponType(r0_19.CurSlotName), false, true)
      return 
    else
      r0_19.List_Lineup.Tab_Primary:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    r0_19:ReInitListItems()
  end
end
function r4_0.ReInitListItems(r0_20)
  -- line: [473, 479] id: 20
  r0_20["Current" .. r0_20.CurSlotType .. "Uuid"] = r0_20.CurDungeonPanel:GetCurrentUuid(r0_20.CurSlotName)
  r0_20:CallFunctionByName(r0_20.CurSlotType .. "Main_Init")
  r0_20:InitItemDetailWidget()
  r0_20:FillSelectiveList()
end
function r4_0.OnListInited(r0_21, r1_21)
  -- line: [481, 488] id: 21
  r0_21.bListEmpty = r1_21
  if r0_21.bItemDetailsShowed then
    r0_21:ShowItemDetails(false)
  end
  r0_21:SetContentIsSelected(r0_21.SelectedContent, false)
  r0_21:UpdateTeamIcons()
end
function r4_0.InitItemDetailWidget(r0_22)
  -- line: [490, 512] id: 22
  if r0_22.ItemDetailsWidget then
    r0_22.ItemDetailsWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_22.ItemDetailsWidget:DestroyObject()
  end
  r0_22.ItemDetailsWidget = UIManager(r0_22):_CreateWidgetNew("ItemDetailsMain")
  r0_22:AttachTipsWidget(r0_22.ItemDetailsWidget)
  r0_22.ItemDetailsWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_22.ItemDetailsWidget.Key_Confirm:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "A",
      }
    },
    Desc = GText("UI_Add"),
  })
  r0_22.ItemDetailsWidget.Key_Confirm:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_22.ItemDetailsWidget.Key_Back:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_22.ItemDetailsWidget.bIsFocusable = false
  r0_22.bItemDetailsShowed = false
  r0_22.ItemDetailsContent = nil
end
function r4_0.GetCurrentContent(r0_23)
  -- line: [514, 516] id: 23
  return r0_23[r0_23.CurSlotType .. "Main_CurContent"]
end
function r4_0.CallFunctionByName(r0_24, r1_24, ...)
  -- line: [518, 522] id: 24
  if r0_24[r1_24] then
    return r0_24[r1_24](r0_24, ...)
  end
end
function r4_0.RemoveTeamIcons(r0_25, r1_25)
  -- line: [524, 542] id: 25
  local r2_25 = r0_25.Dungeons[r1_25]
  if not r2_25 then
    DebugPrint("lhr@WBP_Abyss_Lineup_C:RemoveTeamIcons, DungeonIndex对应的关卡阵容面板无效")
    return 
  end
  for r7_25, r8_25 in pairs(r2_25.Slots) do
    if r8_25 and not r8_25.IsEmpty then
      local r9_25 = r0_25.SlotName2Type[r7_25]
      if r9_25 == "Weapon" then
        r9_25 = r2_25:GetWeaponType(r7_25)
      end
      r0_25[r9_25 .. "Main_CurContent"] = nil
      local r10_25 = r0_25[r9_25 .. "ItemContentsMap"][r8_25.Uuid]
      r10_25.TeamIdx = nil
      r0_25:SetContentIsChosen(r10_25, false)
    end
  end
  -- close: r3_25
end
function r4_0.UpdateTeamIcons(r0_26)
  -- line: [544, 570] id: 26
  for r5_26, r6_26 in pairs(r0_26.Dungeons) do
    for r11_26, r12_26 in pairs(r6_26.Slots) do
      if r12_26 and not r12_26.IsEmpty then
        local r13_26 = r0_26.SlotName2Type[r11_26]
        local r14_26 = false
        if r13_26 == "Weapon" then
          r13_26 = r6_26:GetWeaponType(r11_26)
          if r13_26 == r0_26.CurSlotType then
            r14_26 = true
          end
        elseif r13_26 ~= r0_26.CurSlotType then
        end
        local r15_26 = r0_26[r13_26 .. "ItemContentsMap"][r12_26.Uuid]
        if r15_26 then
          r15_26.TeamIdx = r5_26
          if r14_26 then
            r15_26.TeamCharId = r0_26.CharItemContentsMap[r6_26:GetCurrentUuid(r11_26 + -1)].UnitId
          end
        end
      end
    end
    -- close: r7_26
  end
  -- close: r1_26
end
function r4_0.UpdateSingleTeamIcon(r0_27, r1_27, r2_27, r3_27)
  -- line: [572, 581] id: 27
  local r4_27 = r3_27 and r0_27.CurSlotType
  local r6_27 = "ItemContentsMap"
  local r5_27 = r0_27[r4_27 .. r6_27][r1_27]
  if not r5_27 then
    DebugPrint("lhr@UpdateSingleTeamIcon: Uuid没有对应的Content")
    return 
  end
  if r2_27 then
    r6_27 = r5_27.TeamIdx and nil
  else
    goto label_19	-- block#6 is visited secondly
  end
  r5_27.TeamIdx = r6_27
end
function r4_0.FillSelectiveList(r0_28)
  -- line: [583, 604] id: 28
  r0_28.List_Lineup:BindEvents(r0_28, {
    SortFuncion = r0_28.SortItemContents,
    FilterFunction = r0_28.FilterItemContents,
    OnItemIsHoverChanged = r0_28.OnItemIsHoverChanged,
  })
  if r0_28[r0_28.CurSlotType .. "FilterTags"] then
    r0_28.Filters = r0_28:CreateFilters(r0_28[r0_28.CurSlotType .. "FilterTags"], r0_28[r0_28.CurSlotType .. "FilterNames"], r0_28[r0_28.CurSlotType .. "FilterIcons"])
  else
    r0_28.Filters = nil
  end
  r0_28.List_Lineup:Init(r0_28, {
    Filters = r0_28.Filters,
    OrderByDisplayNames = r0_28.OrderByDisplayNames,
    SortType = CommonConst.DESC,
    ItemContents = r0_28[r0_28.CurSlotType .. "ItemContentsArray"],
    Type = r0_28.CurSlotType,
  })
end
function r4_0.PhantomWeaponTypeChanged(r0_29, r1_29, r2_29, r3_29)
  -- line: [606, 626] id: 29
  if r1_29 == r0_29.SlotName2Type[r0_29.ESlotName.RangedWeapon] or r1_29 == r0_29.SlotName2Type[r0_29.ESlotName.MeleeWeapon] then
    if not r3_29 and not r0_29:IsListAllowRefresh() then
      return 
    end
    if r0_29.CurWeaponType then
      if not r3_29 and r1_29 == r0_29.CurWeaponType then
        return 
      end
      r0_29.TypeTabs[r0_29.CurWeaponType]:SetIsChecked(false)
    end
    r0_29.TypeTabs[r1_29]:SetIsChecked(true, r2_29)
    r0_29.CurWeaponType = r1_29
    r0_29.CurSlotType = r0_29.CurWeaponType
    r0_29:ReInitListItems()
    r0_29:DelaySetFocusTarget(r3_29)
  else
    DebugPrint("lhr@PhantomWeaponTypeChanged:传入武器类型无效,", r1_29)
  end
end
function r4_0.IsListAllowRefresh(r0_30)
  -- line: [628, 633] id: 30
  if not r0_30.List_Lineup then
    return false
  end
  return r0_30.List_Lineup.bAllowRefreshList
end
function r4_0.CreateFilters(r0_31, r1_31, r2_31, r3_31)
  -- line: [635, 645] id: 31
  local r4_31 = {}
  for r9_31, r10_31 in ipairs(r1_31) do
    table.insert(r4_31, {
      Tag = r1_31[r9_31],
      Text = r2_31[r9_31],
      Icon = r3_31[r9_31],
    })
  end
  -- close: r5_31
  return r4_31
end
function r4_0.OnItemIsHoverChanged(r0_32, r1_32, r2_32)
  -- line: [647, 656] id: 32
  if not r1_32.Uuid then
    return 
  end
  if not r0_32.UsingGamepad then
    return 
  end
  if not r0_32.List_Lineup:IsInLSMode() then
    r0_32:ShowItemDetails(r2_32 and not r0_32:IsChar(), r1_32)
  end
end
function r4_0.OnListItemClicked(r0_33, r1_33)
  -- line: [658, 707] id: 33
  if not r1_33.Uuid then
    return 
  end
  if r0_33.Saved then
    r0_33.Btn_Save:SetForbidden(false)
  end
  r0_33.Saved = false
  if not r0_33.UsingGamepad then
    r0_33:ShowItemDetails(not r0_33:IsChar(), r1_33)
  end
  if r1_33.TeamIdx then
    local r2_33 = r0_33.CurDungeonPanel:GetCurrentUuid(r0_33.CurSlotName)
    if r1_33.Uuid == r2_33 then
      r0_33.CurDungeonPanel:ClearSlot(r0_33.CurSlotName)
      r0_33:SetContentIsChosen(r1_33, false)
      if not r0_33.UsingGamepad then
        r0_33:SetContentIsSelected(r1_33, true)
      end
    else
      local r3_33 = r0_33.Uuid2SlotMap[r1_33.Uuid]
      local r4_33 = r0_33.SlotName2Type[r0_33.CurSlotName]
      if r4_33 == "Weapon" then
        r4_33 = r0_33.CurDungeonPanel:GetWeaponType(r0_33.CurSlotName)
      end
      local r5_33 = r0_33[r4_33 .. "ItemContentsMap"][r2_33]
      r0_33.CurDungeonPanel:UpdateSlot(r0_33.CurSlotName, r1_33)
      r0_33.Dungeons[r3_33.DungeonIndex]:UpdateSlot(r3_33.SlotName, r5_33)
      local r6_33 = r1_33.TeamIdx
      local r7_33 = r1_33.TeamCharId
      r0_33:CallFunctionByName(r0_33.CurSlotType .. "Main_OnListItemClicked", r1_33)
      if r5_33 and r5_33.SelfWidget then
        r5_33.TeamIdx = r6_33
        r5_33.TeamCharId = r7_33
        r5_33.SelfWidget:SetTeamIcon(r6_33, r7_33)
      end
      UIManager(GWorld.GameInstance):ShowUITip(UIConst.Tip_CommonToast, GText(r1_33.UnitName) .. GText("Abyss_Party_Replaced") .. "<Highlight>" .. r0_33.CurDungeonPanel.Name .. "·" .. r0_33.SlotName2TextMap[r0_33.CurSlotName] .. "</>")
      return 
    end
  end
  r0_33:CallFunctionByName(r0_33.CurSlotType .. "Main_OnListItemClicked", r1_33)
end
function r4_0.IsChar(r0_34)
  -- line: [709, 711] id: 34
  return r0_34.CurSlotType == CommonConst.ArmoryType.Char
end
function r4_0.GetZOrder(r0_35)
  -- line: [713, 715] id: 35
  return r0_35.Root:GetZOrder()
end
function r4_0.OnFocusReceived(r0_36, r1_36, r2_36)
  -- line: [717, 720] id: 36
  r0_36:SetFocusTarget()
  return r3_0.Handle
end
function r4_0.SortItemContents(r0_37, r1_37, r2_37, r3_37)
  -- line: [722, 739] id: 37
  local r4_37 = r0_37[r0_37.CurSlotType .. "Main_CurContent"] and r0_37[r0_37.CurSlotType .. "Main_CmpContent"]
  local r5_37 = nil
  if r0_37.CurSlotType == "Pet" then
    r5_37 = r0_37.PetOrderByAttrNames
    if r2_37 == 2 then
      r2_37 = 3
    end
  else
    r5_37 = r0_37.OrderByAttrNames
  end
  local r6_37 = {
    r5_37[r2_37]
  }
  for r11_37, r12_37 in ipairs(r5_37) do
    if r11_37 ~= r2_37 then
      table.insert(r6_37, r12_37)
    end
  end
  -- close: r7_37
  r0_0:SortItemContents(r1_37, r6_37, r3_37, r4_37)
end
function r4_0.FilterItemContents(r0_38, r1_38, r2_38)
  -- line: [741, 774] id: 38
  local r3_38 = r0_38.CurSlotType
  local r4_38 = r0_38.SlotType2DataType[r3_38]
  local r5_38 = {}
  local r6_38 = nil
  local r7_38 = nil	-- notice: implicit variable refs by block#[5, 7]
  if r4_38 == "Char" then
    function r7_38(r0_39, r1_39)
      -- line: [748, 751] id: 39
      return r0_39 == DataMgr.BattleChar[r1_39.UnitId].Attribute
    end
    r6_38 = r7_38
  elseif r4_38 == "Weapon" then
    r7_38 = GWorld:GetAvatar()
    function r6_38(r0_40, r1_40)
      -- line: [754, 757] id: 40
      return r7_38.Weapons[r1_40.Uuid]:HasTag(r0_40)
    end
    -- close: r7_38
  elseif r4_38 == "Pet" then
    function r7_38()
      -- line: [759, 761] id: 41
      return true
    end
    r6_38 = r7_38
  end
  if r6_38 then
    r7_38 = ipairs
    for r11_38, r12_38 in r7_38(r1_38) do
      for r17_38, r18_38 in ipairs(r2_38) do
        if r6_38(r0_38[r3_38 .. "FilterTags"][r18_38], r12_38) then
          table.insert(r5_38, r12_38)
          break
        end
      end
      -- close: r13_38
    end
    -- close: r7_38
  end
  return r5_38
end
function r4_0.NewItemContent(r0_42, r1_42, r2_42, r3_42)
  -- line: [776, 800] id: 42
  local r4_42 = NewObject(r3_0.GetCommonItemContentClass())
  r4_42.Uuid = r1_42.Uuid
  r4_42.Type = r2_42
  r4_42.Tag = r3_42
  r4_42.UnitId = r1_42[r2_42 .. "Id"]
  r4_42.UnitName = r1_42[r2_42 .. "Name"]
  r4_42.Rarity = r1_42[r2_42 .. "Rarity"]
  r4_42.Icon = r1_42:Data().Icon
  r4_42.GachaIcon = r1_42:Data().GachaIcon
  r4_42.Level = r1_42.Level
  r4_42.GradeLevel = r1_42.GradeLevel
  r4_42.AnimNameWithCreate = "In_OnlyOpacity"
  local r5_42 = DataMgr["Battle" .. r2_42][r4_42.UnitId].Attribute
  if r5_42 then
    local r6_42 = "Armory_" .. r5_42
    r4_42.AttrIcon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. r6_42 .. ".T_" .. r6_42
  end
  r4_42.SortPriority = r1_42:Data().SortPriority and 0
  r4_42.OnMouseButtonUpEvents = {
    Obj = r0_42,
    Callback = function()
      -- line: [796, 798] id: 43
      r0_42:OnListItemClicked(r4_42)
    end,
  }
  return r4_42
end
function r4_0.NewPetItemContent(r0_44, r1_44)
  -- line: [802, 820] id: 44
  local r2_44 = NewObject(r3_0.GetCommonItemContentClass())
  r2_44.Uuid = r1_44.UniqueId
  r2_44.Type = CommonConst.ArmoryType.Pet
  r2_44.Tag = CommonConst.ArmoryType.Pet
  r2_44.UnitId = r1_44.PetId
  local r3_44 = DataMgr.Pet[r2_44.UnitId]
  r2_44.UnitName = r3_44.Name
  r2_44.Rarity = r3_44.Rarity
  r2_44.Icon = r3_44.Icon
  r2_44.Level = r1_44.Level
  r2_44.BreakNum = r1_44.BreakNum
  r2_44.SortPriority = r3_44.SortPriority and 0
  r2_44.OnMouseButtonUpEvents = {
    Obj = r0_44,
    Callback = function()
      -- line: [816, 818] id: 45
      r0_44:OnListItemClicked(r2_44)
    end,
  }
  return r2_44
end
function r4_0.ShowItemDetails(r0_46, r1_46, r2_46)
  -- line: [823, 845] id: 46
  if r1_46 then
    if r0_46.bListEmpty then
      return 
    end
    if r2_46.Type == "Char" then
      return 
    end
    if r0_46.ItemDetailsContent ~= r2_46 then
      r0_46.ItemDetailsWidget:RefreshItemInfo(r2_46, true)
    end
    r0_46.ItemDetailsWidget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r0_46.ItemDetailsWidget:StopAnimation(r0_46.ItemDetailsWidget.Out)
    r0_46.ItemDetailsWidget:PlayAnimation(r0_46.ItemDetailsWidget.In)
    r0_46.bItemDetailsShowed = true
  elseif r0_46.ItemDetailsWidget then
    r0_46.bItemDetailsShowed = false
    r0_46.ItemDetailsWidget:StopAnimation(r0_46.ItemDetailsWidget.In)
    r0_46.ItemDetailsWidget:PlayAnimation(r0_46.ItemDetailsWidget.Out)
  end
  r0_46.ItemDetailsContent = r2_46
end
function r4_0.AttachTipsWidget(r0_47, r1_47)
  -- line: [847, 849] id: 47
  r0_47.Pos_Tip:AddChild(r1_47)
end
function r4_0.SetContentIsChosen(r0_48, r1_48, r2_48)
  -- line: [851, 862] id: 48
  if r1_48 then
    if r1_48.SelfWidget then
      r0_48:SetContentIsSelected(r1_48, r2_48)
      r1_48.SelfWidget:SetTeamIcon(r2_48 and r1_48.TeamIdx, r1_48.TeamCharId)
      r0_48:PlaySelectSound(r2_48, r1_48.Type)
    elseif not r2_48 then
      r1_48.TeamIdx = nil
      r1_48.TeamCharId = nil
    end
  end
end
function r4_0.SetContentIsSelected(r0_49, r1_49, r2_49)
  -- line: [864, 877] id: 49
  if r1_49 then
    r1_49.IsSelect = r2_49
    if r1_49.SelfWidget then
      r1_49.SelfWidget:SetSelected(r2_49)
    end
    if r2_49 then
      r0_49:SetContentIsSelected(r0_49.SelectedContent, false)
      r0_49.SelectedContent = r1_49
    else
      r0_49.SelectedContent = nil
    end
  end
end
local r7_0 = {
  Char = "event:/ui/armory/click_select_role",
  Weapon = "event:/ui/armory/click_select_weapon",
  Pet = "event:/ui/common/click_select_pet",
  Default = "event:/ui/common/click_mid",
}
local r8_0 = {
  Char = "event:/ui/common/role_replace",
  Weapon = "event:/ui/common/weapon_replace",
  Pet = "event:/ui/common/role_replace",
}
function r4_0.PlaySelectSound(r0_50, r1_50, r2_50)
  -- line: [892, 899] id: 50
  if not r1_50 then
    AudioManager(r0_50):PlayUISound(r0_50, r7_0.Default, nil, nil)
  else
    AudioManager(r0_50):PlayUISound(r0_50, r7_0[r2_50], nil, nil)
    AudioManager(r0_50):PlayUISound(r0_50, r8_0[r2_50], nil, nil)
  end
end
function r4_0.SaveLineup(r0_51)
  -- line: [901, 951] id: 51
  if r0_51.Saved then
    if r0_51.UsingGamepad then
      r0_51.Btn_Save:SetForbidden(true)
      UIManager(GWorld.GameInstance):ShowUITip(UIConst.Tip_CommonToast, GText("UI_PersonInfo_Saved"))
    else
      r0_51:OnReturnKeyDown()
    end
    return 
  end
  local r1_51 = GWorld:GetAvatar()
  if not r1_51 then
    DebugPrint("lhr@阵容配置界面保存失败：Avatar获取失败")
    return 
  end
  local r2_51 = {
    [1] = {
      Char = r5_0,
      MeleeWeapon = r5_0,
      RangedWeapon = r5_0,
      Phantom1 = r5_0,
      PhantomWeapon1 = r5_0,
      Phantom2 = r5_0,
      PhantomWeapon2 = r5_0,
      Pet = r6_0,
    },
    [2] = {
      Char = r5_0,
      MeleeWeapon = r5_0,
      RangedWeapon = r5_0,
      Phantom1 = r5_0,
      PhantomWeapon1 = r5_0,
      Phantom2 = r5_0,
      PhantomWeapon2 = r5_0,
      Pet = r6_0,
    },
  }
  for r7_51, r8_51 in pairs(r0_51.Dungeons) do
    for r13_51, r14_51 in pairs(r0_51.ESlotName) do
      local r15_51 = r8_51:GetCurrentUuid(r14_51)
      if r15_51 then
        r2_51[r7_51][r13_51] = r15_51
      end
    end
    -- close: r9_51
  end
  -- close: r3_51
  r1_51:SaveAbyssTeam(function(r0_52)
    -- line: [933, 948] id: 52
    if r0_52 == ErrorCode.RET_SUCCESS then
      r0_51.Saved = true
    elseif DataMgr.ErrorCode[r0_52] then
      UIManager(r0_51):ShowUITip(UIConst.Tip_CommonTop, DataMgr.ErrorCode[r0_52].ErrorCodeContent)
    end
    if r0_51.UsingGamepad then
      r0_51.Btn_Save:SetForbidden(true)
      UIManager(GWorld.GameInstance):ShowUITip(UIConst.Tip_CommonToast, GText("UI_PersonInfo_Saved"))
    else
      r0_51:OnReturnKeyDown()
    end
  end, r0_51.AbyssId, r0_51.LevelIndex, r2_51)
end
function r4_0.GetCurModType(r0_53)
  -- line: [953, 955] id: 53
  return r0_53.SlotType2DataType[r0_53.SlotName2Type[r0_53.CurSlotName]]
end
function r4_0.GetModType(r0_54, r1_54)
  -- line: [957, 959] id: 54
  return r0_54.SlotType2DataType[r0_54.SlotName2Type[r1_54]]
end
function r4_0.InitListenEvent(r0_55)
  -- line: [961, 967] id: 55
  r0_55.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(UE4.UGameplayStatics.GetPlayerController(r0_55, 0))
  if IsValid(r0_55.GameInputModeSubsystem) then
    r0_55.GameInputModeSubsystem.OnInputMethodChanged:Add(r0_55, r0_55.RefreshOpInfoByInputDevice)
  end
end
function r4_0.RefreshBaseInfo(r0_56)
  -- line: [969, 974] id: 56
  if IsValid(r0_56.GameInputModeSubsystem) then
    r0_56:RefreshOpInfoByInputDevice(r0_56.GameInputModeSubsystem:GetCurrentInputType(), r0_56.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end
function r4_0.OnPreviewKeyDown(r0_57, r1_57, r2_57)
  -- line: [976, 1019] id: 57
  if CommonUtils:IfExistSystemGuideUI(r0_57) then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  local r3_57 = UE4.UKismetInputLibrary.GetKey(r2_57)
  local r4_57 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_57)
  local r5_57 = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_57) then
    if r4_57 == "Gamepad_DPad_Down" and not r0_57.bInList and r0_57.Dungeons and #r0_57.Dungeons > 1 then
      local r6_57 = r0_57.CurDungeonPanel.DungeonIndex
      if r6_57 < #r0_57.Dungeons then
        r0_57:SelectDungeon(r6_57 + 1)
      end
      r5_57 = true
    elseif r4_57 == "Gamepad_DPad_Left" and not r0_57.bInList then
      r5_57 = true
    elseif r4_57 == "Gamepad_DPad_Right" and not r0_57.bInList then
      r5_57 = true
    end
  end
  if r5_57 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
  -- warn: not visited block [7, 8, 9]
  -- block#7:
  -- r6_57 = r0_57.CurDungeonPanel.DungeonIndex
  -- if r6_57 > 1
  -- block#8:
  -- r0_57:SelectDungeon(r6_57 + -1)
  -- block#9:
  -- r5_57 = true
  -- goto label_88
end
function r4_0.OnKeyDown(r0_58, r1_58, r2_58)
  -- line: [1021, 1085] id: 58
  local r3_58 = UE4.UKismetInputLibrary.GetKey(r2_58)
  local r4_58 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_58)
  local r5_58 = true
  local r6_58 = UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_58)
  if r6_58 and r4_58 ~= "Gamepad_FaceButton_Right" then
    if r4_58 == "Gamepad_Special_Right" then
      r6_58 = r0_58.bInList
      if not r6_58 then
        r6_58 = r0_58.CurDungeonPanel.Btn_MonsterInfo.IsPressing
        if not r6_58 then
          r0_58.CurDungeonPanel.Btn_MonsterInfo:OnBtnPressed()
        end
      end
    elseif r4_58 == "Gamepad_Special_Left" then
      r6_58 = r0_58.bInList
      if not r6_58 then
        r6_58 = r0_58.CurDungeonPanel.Btn_Entry.IsPressing
        if not r6_58 then
          r0_58.CurDungeonPanel.Btn_Entry:OnBtnPressed()
        end
      end
    elseif r4_58 == "Gamepad_FaceButton_Left" then
      r6_58 = r0_58.Btn_Save.IsPressing
      if not r6_58 then
        r0_58.Btn_Save:OnBtnPressed()
      end
    elseif r4_58 == "Gamepad_LeftShoulder" then
      r6_58 = r0_58.bInList
      if r6_58 then
        r6_58 = r0_58.CurSlotName
        if r6_58 ~= r0_58.ESlotName.PhantomWeapon1 then
          r6_58 = r0_58.CurSlotName
          if r6_58 == r0_58.ESlotName.PhantomWeapon2 then
            ::label_76::
            r0_58:PhantomWeaponTypeChanged("Melee", true)
          end
        else
          goto label_76	-- block#18 is visited secondly
        end
      end
    elseif r4_58 == "Gamepad_RightShoulder" then
      r6_58 = r0_58.bInList
      if r6_58 then
        r6_58 = r0_58.CurSlotName
        if r6_58 ~= r0_58.ESlotName.PhantomWeapon1 then
          r6_58 = r0_58.CurSlotName
          if r6_58 == r0_58.ESlotName.PhantomWeapon2 then
            ::label_96::
            r0_58:PhantomWeaponTypeChanged("Ranged", true)
          end
        else
          goto label_96	-- block#23 is visited secondly
        end
      end
    elseif r4_58 == "Gamepad_LeftThumbstick" then
      r6_58 = r0_58.bInList
      if not r6_58 then
        r0_58.CurDungeonPanel.Btn_Clear:OnBtnClicked()
      end
    elseif r4_58 == "Gamepad_FaceButton_Top" then
      r6_58 = r0_58.bInList
      if not r6_58 then
        r0_58.CurDungeonPanel.Btn_Mod:OnBtnClicked()
      end
    else
      r5_58 = false
    end
  elseif r4_58 ~= "Escape" then
    if r4_58 == "A" then
      r6_58 = r0_58.CurSlotName
      if r6_58 ~= r0_58.ESlotName.PhantomWeapon1 then
        r6_58 = r0_58.CurSlotName
        if r6_58 == r0_58.ESlotName.PhantomWeapon2 then
          ::label_138::
          r0_58:PhantomWeaponTypeChanged("Melee", true)
        end
      else
        goto label_138	-- block#36 is visited secondly
      end
    elseif r4_58 == "D" then
      r6_58 = r0_58.CurSlotName
      if r6_58 ~= r0_58.ESlotName.PhantomWeapon1 then
        r6_58 = r0_58.CurSlotName
        if r6_58 == r0_58.ESlotName.PhantomWeapon2 then
          ::label_155::
          r0_58:PhantomWeaponTypeChanged("Ranged", true)
        end
      else
        goto label_155	-- block#40 is visited secondly
      end
    else
      r5_58 = false
    end
  end
  if r5_58 then
    r6_58 = UE4.UWidgetBlueprintLibrary.Handled() and UE4.UWidgetBlueprintLibrary.UnHandled()
  else
    goto label_169	-- block#44 is visited secondly
  end
  return r6_58
end
function r4_0.OnKeyUp(r0_59, r1_59, r2_59)
  -- line: [1087, 1126] id: 59
  local r4_59 = UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_59))
  if r0_59.bInList and r0_59.List_Lineup:OnListKeyUp(r1_59, r2_59) then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  local r5_59 = true
  local r6_59 = nil	-- notice: implicit variable refs by block#[22]
  if r4_59 == "Gamepad_FaceButton_Right" or r4_59 == "Escape" then
    r6_59 = r0_59.bInList
    if not r6_59 then
      r6_59 = r0_59.ReturnPressed
      if not r6_59 then
        r0_59.ReturnPressed = true
        r0_59:OnReturnKeyDown()
      else
        r0_59.ReturnPressed = false
      end
    else
      r0_59:SetFocusTarget(false)
    end
  elseif r4_59 == "Gamepad_Special_Right" then
    r6_59 = r0_59.bInList
    if not r6_59 then
      r0_59.CurDungeonPanel.Btn_MonsterInfo:OnBtnReleased()
      r0_59.CurDungeonPanel.Btn_MonsterInfo:OnBtnClicked()
    end
  elseif r4_59 == "Gamepad_Special_Left" then
    r6_59 = r0_59.bInList
    if not r6_59 then
      r0_59.CurDungeonPanel.Btn_Entry:OnBtnReleased()
      r0_59.CurDungeonPanel.Btn_Entry:OnBtnClicked()
      r0_59.ReturnPressed = true
    end
  elseif r4_59 == "Gamepad_FaceButton_Left" then
    r0_59.Btn_Save:OnBtnReleased()
    r0_59.Btn_Save:OnBtnClicked()
  else
    r5_59 = false
  end
  if r5_59 then
    r6_59 = UE4.UWidgetBlueprintLibrary.Handled()
    if not r6_59 then
      ::label_93::
      r6_59 = UE4.UWidgetBlueprintLibrary.UnHandled()
    end
  else
    goto label_93	-- block#21 is visited secondly
  end
  return r6_59
end
function r4_0.OnAnalogValueChanged(r0_60, r1_60, r2_60)
  -- line: [1129, 1144] id: 60
  local r4_60 = UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_60))
  if r4_60 == "Gamepad_LeftX" or r4_60 == "Gamepad_LeftY" then
    local r5_60 = UKismetInputLibrary.GetAnalogValue(r2_60)
    if (r5_60 and 0.5 < r5_60 or r5_60 < -0.5) and IsValid(r0_60.GameInputModeSubsystem) and not r0_60.UsingGamepad then
      r0_60:RefreshOpInfoByInputDevice(ECommonInputType.Gamepad, r0_60.GameInputModeSubsystem:GetCurrentGamepadName())
    end
    return r3_0.Unhandled
  end
  return r3_0.Handled
end
function r4_0.CreateCDTimer(r0_61)
  -- line: [1146, 1150] id: 61
  r0_61.CdTimer = r0_61:AddTimer(0.15, function()
    -- line: [1147, 1149] id: 62
    r0_61.CdTimer = nil
  end, nil, nil, nil, true)
end
function r4_0.ClearListenEvent(r0_63)
  -- line: [1153, 1157] id: 63
  for r5_63, r6_63 in pairs(r0_63.Dungeons) do
    r6_63:ClearListenEvent()
  end
  -- close: r1_63
end
function r4_0.ResetListenEvent(r0_64)
  -- line: [1159, 1163] id: 64
  for r5_64, r6_64 in pairs(r0_64.Dungeons) do
    r6_64:ResetListenEvent()
  end
  -- close: r1_64
end
function r4_0.RefreshOpInfoByInputDevice(r0_65, r1_65, r2_65)
  -- line: [1165, 1186] id: 65
  if r0_65:IsMobile() then
    return 
  end
  if r1_65 == ECommonInputType.MouseAndKeyboard then
    r0_65.UsingGamepad = false
    if r0_65.bItemDetailsShowed then
      r0_65:ShowItemDetails(false)
    end
    r0_65:SetContentIsSelected(r0_65.SelectedContent, false)
  else
    r0_65.UsingGamepad = true
    r0_65.CurGamepadName = r2_65
    if r0_65:HasFocusedDescendants() or r0_65:HasAnyUserFocus() then
      r0_65:SetFocusTarget()
    end
  end
  r0_65:OnUpdateUIStyleByInputTypeChange(r1_65, r2_65)
end
function r4_0.OnUpdateUIStyleByInputTypeChange(r0_66, r1_66, r2_66)
  -- line: [1189, 1217] id: 66
  if r0_66:IsMobile() then
    return 
  end
  if r1_66 == ECommonInputType.Gamepad then
    r0_66.Controller_Save:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    if r0_66.bInList then
      r0_66.List_Lineup:OnUpdateUIStyleByInputTypeChange(r1_66, r2_66)
      return 
    end
    for r7_66, r8_66 in pairs(r0_66.GamepadIcons) do
      if r0_66[r8_66] then
        r0_66[r8_66]:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      end
    end
    -- close: r3_66
    r0_66.List_Lineup:OnUpdateUIStyleByInputTypeChange(ECommonInputType.Touch)
    r0_66.CurDungeonPanel:OnUpdateUIStyleByInputTypeChange(r1_66, r2_66)
  else
    r0_66.Controller_Save:SetVisibility(UE4.ESlateVisibility.Collapsed)
    for r7_66, r8_66 in pairs(r0_66.GamepadIcons) do
      if r0_66[r8_66] then
        r0_66[r8_66]:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
    end
    -- close: r3_66
    r0_66.List_Lineup:OnUpdateUIStyleByInputTypeChange(r1_66, r2_66)
    r0_66.CurDungeonPanel:OnUpdateUIStyleByInputTypeChange(r1_66, r2_66)
  end
end
function r4_0.SwitchGamepadUIMode(r0_67, r1_67)
  -- line: [1219, 1253] id: 67
  if not r0_67.UsingGamepad then
    return 
  end
  if r1_67 then
    r0_67.List_Lineup:OnUpdateUIStyleByInputTypeChange(ECommonInputType.Gamepad)
    for r6_67, r7_67 in pairs(r0_67.GamepadIcons) do
      if r0_67[r7_67] then
        r0_67[r7_67]:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
    end
    -- close: r2_67
    r0_67.CurDungeonPanel:OnUpdateUIStyleByInputTypeChange(ECommonInputType.MouseAndKeyboard)
    r0_67:ShowConfirmBtn(false)
    r0_67:ShowAddAndRemoveBtn(true)
  else
    r0_67.List_Lineup:OnUpdateUIStyleByInputTypeChange(ECommonInputType.Touch)
    for r6_67, r7_67 in pairs(r0_67.GamepadIcons) do
      if r0_67[r7_67] then
        r0_67[r7_67]:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      end
    end
    -- close: r2_67
    r0_67.CurDungeonPanel:OnUpdateUIStyleByInputTypeChange(ECommonInputType.Gamepad)
    r0_67:ShowConfirmBtn(true)
    r0_67:ShowAddAndRemoveBtn(false)
    r0_67:SetContentIsSelected(r0_67.SelectedContent, false)
  end
end
function r4_0.DelaySetFocusTarget(r0_68, r1_68, r2_68)
  -- line: [1256, 1264] id: 68
  if r0_68.SetFocusTimer then
    r0_68:RemoveTimer(r0_68.SetFocusTimer)
  end
  r0_68.SetFocusTimer = r0_68:AddTimer(r2_68 and 0.1, function()
    -- line: [1260, 1263] id: 69
    r0_68:SetFocusTarget(r1_68)
    r0_68.SetFocusTimer = nil
  end, nil, nil, nil, true)
end
function r4_0.SetFocusTarget(r0_70, r1_70)
  -- line: [1266, 1301] id: 70
  if not r0_70.UsingGamepad then
    return 
  end
  if r1_70 ~= nil then
    if r1_70 == r0_70.bInList then
      return 
    end
    r0_70.bInList = r1_70
  end
  if r0_70.bInList then
    local r2_70 = r0_70:GetCurrentContent() and r0_70.List_Lineup.List_Select:GetItemAt(0)
    if r2_70 then
      r0_70.GameInputModeSubsystem:SetTargetUIFocusWidget(r2_70.SelfWidget)
      r0_70.GameInputModeSubsystem:UpdateCurrentFocusWidgetPos()
      r0_70.List_Lineup.List_Select:BP_NavigateToItem(r2_70)
    else
      r0_70.List_Lineup:SetCurrentTabItemFocus()
    end
  else
    local r2_70 = r0_70.CurDungeonPanel
    local r3_70 = r2_70
    if r2_70 then
      local r4_70 = r2_70.Slots[r0_70.CurSlotName]
      if r4_70 then
        r3_70 = r4_70
      end
    end
    if r3_70 then
      r3_70:SetFocus()
    end
  end
  r0_70:SwitchGamepadUIMode(r0_70.bInList)
end
function r4_0.BP_GetDesiredFocusTarget(r0_71)
  -- line: [1303, 1306] id: 71
  r0_71:SetFocusTarget()
  return nil
end
function r4_0.ShowReturnConfirmWindow(r0_72)
  -- line: [1308, 1327] id: 72
  local r1_72 = {}
  if r0_72.ReturnTimer then
    r0_72:RemoveTimer(r0_72.ReturnTimer)
  end
  function r1_72.LeftCallbackFunction()
    -- line: [1314, 1316] id: 73
    r0_72:SetFocus()
  end
  function r1_72.OnCloseCallbackFunction()
    -- line: [1317, 1322] id: 74
    r0_72:SetFocus()
    r0_72.ReturnTimer = r0_72:AddTimer(1, function()
      -- line: [1319, 1321] id: 75
      r0_72.ReturnPressed = false
    end, nil, nil, nil, true)
  end
  function r1_72.RightCallbackFunction()
    -- line: [1323, 1325] id: 76
    r0_72.Root:OpenSubUI(r0_72.PreWidgetInfo, true)
  end
  r0_72:ShowConfirmWindow(100149, r1_72, r0_72.Root)
end
function r4_0.ShowConfirmWindow(r0_77, r1_77, r2_77, r3_77)
  -- line: [1329, 1333] id: 77
  UE4.UGameplayStatics.GetGameInstance(r0_77):GetGameUIManager():ShowCommonPopupUI(r1_77, r2_77, r3_77)
end
function r4_0.OnReturnKeyDown(r0_78)
  -- line: [1335, 1346] id: 78
  if not r0_78.Saved then
    r0_78:ShowReturnConfirmWindow()
    return 
  end
  local r1_78 = r0_78.Root:OpenSubUI(r0_78.PreWidgetInfo, true)
  if r0_78.SetFocusTimer then
    r0_78:RemoveTimer(r0_78.SetFocusTimer)
    r0_78.SetFocusTimer = nil
  end
end
function r4_0.SwitchIn(r0_79, ...)
  -- line: [1348, 1357] id: 79
  local r3_79 = nil	-- notice: implicit variable refs by block#[0]
  local r2_79 = nil	-- notice: implicit variable refs by block#[0]
  local r1_79 = nil	-- notice: implicit variable refs by block#[0]
  ... = ... -- error: untaken top expr
  r0_79:InitTable()
  r0_79:Enter(r1_79, r2_79, r3_79)
  if r0_79:IsAnyAnimationPlaying() then
    r0_79:StopAllAnimations()
  end
  r0_79:PlayAnimation(r0_79.In)
  r0_79:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end
function r4_0.SwitchOut(r0_80)
  -- line: [1359, 1370] id: 80
  r0_80:ResetListenEvent()
  r0_80:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  if not r0_80.BindOutAnimation then
    r0_80:BindToAnimationFinished(r0_80.Out, {
      r0_80,
      function()
        -- line: [1363, 1365] id: 81
        r0_80:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
    })
    r0_80.BindOutAnimation = true
  end
  r0_80:PlayAnimation(r0_80.Out)
end
AssembleComponents(r4_0)
return r4_0
