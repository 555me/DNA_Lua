-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Armory\Armory_CharOrWeaponLvup_Component.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("Utils.UpgradeUtils")
local r1_0 = {
  LevelUpWidgetMap = {
    [CommonConst.ArmoryType.Char] = "WidgetBlueprint\'/Game/UI/WBP/Armory/Widget/Intensify/WBP_Armory_Upgrade.WBP_Armory_Upgrade\'",
    [CommonConst.ArmoryType.Weapon] = "WidgetBlueprint\'/Game/UI/WBP/Armory/Widget/Intensify/WBP_Armory_Upgrade.WBP_Armory_Upgrade\'",
  },
  InitLevelUpComp = function(r0_1, ...)
    -- line: [17, 52] id: 1
    local r4_1 = nil	-- notice: implicit variable refs by block#[0]
    local r2_1 = nil	-- notice: implicit variable refs by block#[0]
    local r1_1 = nil	-- notice: implicit variable refs by block#[0]
    ... = ... -- error: untaken top expr
    r0_1.Target = r2_1
    r0_1.TargetData = r2_1.Props
    r0_1.Type = r4_1.Type
    r0_1.Tag = r4_1.Tag
    r0_1.CurrentMode = r4_1.BehaviourType
    r0_1:OnExpandList(false, true)
    r0_1.Selective_Listing:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_1:InitTab(GText("UI_COMMONPOP_TITLE_100029") .. "/" .. GText(r0_1.Target:GetName()))
    r0_1.Btn_Upgrade.Button_Area.OnClicked:Clear()
    r0_1.Btn_Upgrade.Button_Area.OnClicked:Add(r0_1, r0_1.OnUpgradeBtnClicked)
    r0_1.Btn_Upgrade:TryOverrideSoundFunc(function()
      -- line: [29, 31] id: 2
      AudioManager(r0_1):PlayUISound(r0_1, "event:/ui/common/click_btn_confirm", nil, nil)
    end)
    r0_1:AddDispatcher(EventID.OnWeaponLevelUp, r0_1, r0_1.OnTargetLevelUp)
    r0_1:AddDispatcher(EventID.OnCharLevelUp, r0_1, r0_1.OnTargetLevelUp)
    r0_1:AddDispatcher(EventID.OnResourcesChanged, r0_1, r0_1.OnLvUpResourcesChanged)
    r0_1:ShowWarning(false)
    local r6_1 = {
      Parent = r0_1,
      Target = r0_1.Target,
      Type = r0_1.Type,
      Tag = r0_1.Tag,
    }
    r0_1.IntensifyWidget = nil
    r0_1:InitLvUpIntensify(r1_0.LevelUpWidgetMap[r1_1], r6_1)
    r0_1:InitLvUpView(r4_1)
    r0_1.WidgetSwitcher_Mode:SetActiveWidgetIndex(0)
    r0_1.Panel_Max:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_1:InitLvUpPanelInfo()
    r0_1.InitTimer = r0_1:AddTimer(0.2, function()
      -- line: [49, 51] id: 3
      r0_1:RefreshBaseInfo()
    end)
  end,
  OnUpgradeBtnClicked = function(r0_4)
    -- line: [54, 58] id: 4
    if r0_4.CurrentMode == "LevelUp" then
      r0_4:TryToLevelUp()
    end
  end,
  InitLvUpIntensify = function(r0_5, r1_5, r2_5)
    -- line: [60, 67] id: 5
    if r0_5.IntensifyWidget then
      return 
    end
    r0_5.VB_Node:ClearChildren()
    r0_5:CreateLvUpWidget(r1_5, r2_5)
  end,
  CreateLvUpWidget = function(r0_6, r1_6, r2_6)
    -- line: [69, 99] id: 6
    r0_6.IntensifyWidget = UIManager(r0_6):CreateWidget(r1_6, true)
    r0_6.VB_Node:AddChild(r0_6.IntensifyWidget)
    if r0_6.IntensifyWidget then
      if not r2_6 then
        r2_6 = {}
      end
      r2_6.Parent = r0_6
      r0_6.IntensifyWidget:SetCallbacks({
        OnLevelUpAnimFinishedCallback = r0_6.OnLevelUpAnimFinishedCallback,
        OnLevelUpSuccessCallback = function()
          -- line: [77, 79] id: 7
          return r0_6.ComparedAttrs, nil, DataMgr[r0_6.Type][r0_6.TargetId][r0_6.Type .. "MaxLevel"] <= r0_6.Level
        end,
        OnLevelUpFinalCallback = r0_6.UpdateBtnState,
      })
      r0_6.IntensifyWidget:Init(r2_6)
      if r0_6.IntensifyWidget:IsVisible() then
        r0_6.IntensifyWidget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      end
      local r3_6 = r0_6.IntensifyWidget.Main.Slot
      local r4_6 = FAnchors()
      r4_6.Minimum = FVector2D(0, 0)
      r4_6.Maximum = FVector2D(1, 1)
      r3_6:SetAnchors(r4_6)
      r3_6:SetOffsets(FMargin(0, 0, 0, 0))
      r3_6:SetAlignment(FVector2D(0, 0))
      r0_6.CurrentSubUI = r0_6.IntensifyWidget
      r0_6.CurrentSubUI.Btn_Min.Button_Area.OnClicked:Add(r0_6, r0_6.OnBtnReduceMaxClicked)
      r0_6.CurrentSubUI.Btn_Max.Button_Area.OnClicked:Add(r0_6, r0_6.OnBtnAddMaxClicked)
      r0_6.CurrentSubUI.Btn_Minus.Button_Area.OnClicked:Add(r0_6, r0_6.PreLevel)
      r0_6.CurrentSubUI.Btn_Add.Button_Area.OnClicked:Add(r0_6, r0_6.NextLevel)
    end
  end,
  InitLvUpPanelInfo = function(r0_8)
    -- line: [101, 121] id: 8
    r0_8.Panel_Info:SetVisibility(UIConst.VisibilityOp.Visible)
    local r1_8 = r0_8.Target.Props
    if r0_8.Type == CommonConst.ArmoryType.Char then
      local r3_8 = DataMgr.Char[r1_8.CharId].CharRarity
      r0_8.TextBlock_Name:SetText(GText(DataMgr.Char[r1_8.CharId].CharName))
      r0_8:SetElementIcon(DataMgr.BattleChar[r1_8.CharId].Attribute)
      r0_8:SetStars(r3_8)
    elseif r0_8.Type == CommonConst.ArmoryType.Weapon then
      local r3_8 = DataMgr.Weapon[r1_8.WeaponId].WeaponRarity
      r0_8.TextBlock_Name:SetText(GText(DataMgr.Weapon[r1_8.WeaponId].WeaponName))
      r0_8:UpdateWeaponTagIcon()
      r0_8:SetStars(r3_8)
    end
    r0_8.Text_Max:SetText(GText("Pet_LevelUp_LevelMax"))
    r0_8.Btn_Upgrade:SetText(GText("UI_COMMONPOP_TITLE_100029"))
    r0_8.Btn_Upgrade:SetDefaultGamePadImg("Y")
  end,
  SetElementIcon = function(r0_9, r1_9)
    -- line: [123, 138] id: 9
    if r1_9 then
      r0_9.Panel_Element:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      r0_9.Panel_Element:SetVisibility(UIConst.VisibilityOp.Collapsed)
      return 
    end
    local r2_9 = "Armory_" .. r1_9
    r0_9.Image_Element:SetBrushResourceObject(LoadObject("/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. r2_9 .. ".T_" .. r2_9))
    r0_9.Stats_ListView:ClearListItems()
    local r4_9, r5_9 = UIUtils.GetAllElementTypes()
    for r10_9, r11_9 in ipairs(r4_9) do
      r0_9.Stats_ListView:AddItem(r0_9:NewElmtIconContent(r11_9, r5_9[r10_9], r11_9 == r1_9))
    end
    -- close: r6_9
  end,
  NewElmtIconContent = function(r0_10, r1_10, r2_10, r3_10)
    -- line: [140, 147] id: 10
    local r4_10 = NewObject(UIUtils.GetCommonItemContentClass())
    local r5_10 = "Armory_" .. r1_10
    r4_10.Icon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. r5_10 .. ".T_" .. r5_10
    r4_10.Text = GText(r2_10)
    r4_10.IsSelected = r3_10
    return r4_10
  end,
  CloseComp = function(r0_11)
    -- line: [149, 154] id: 11
    if r0_11.InitTimer then
      r0_11:RemoveTimer(r0_11.InitTimer)
      r0_11.InitTimer = nil
    end
  end,
  OnBackgroundClickedComp = function(r0_12)
    -- line: [156, 157] id: 12
  end,
  DestructComp = function(r0_13)
    -- line: [159, 163] id: 13
  end,
  Construct = function(r0_14)
    -- line: [165, 166] id: 14
  end,
  PreLevel = function(r0_15)
    -- line: [168, 175] id: 15
    if r0_15.ComparedLevel + -1 <= r0_15.Level or r0_15.PreLevelTimes == 0 then
      return 
    end
    r0_15.PreLevelTimes = r0_15.PreLevelTimes + 1
    r0_15.NextLevelTimes = r0_15.NextLevelTimes + -1
    r0_15:UpdateLevelUpInfo(r0_15.Level, r0_15.ComparedLevel + -1)
  end,
  NextLevel = function(r0_16)
    -- line: [177, 191] id: 16
    DebugPrint("NextLevel", r0_16.ComparedLevel, r0_16.Level, r0_16.NextLevelTimes)
    if r0_16.MaxLevel < r0_16.ComparedLevel + 1 then
      return 
    end
    if r0_0.CalcCharOrWeaponLevelUp(r0_16.Target, r0_16.Type, r0_16.Level, r0_16.ComparedLevel + 1).CanUpgrade then
      r0_16.PreLevelTimes = r0_16.PreLevelTimes + -1
      r0_16.NextLevelTimes = r0_16.NextLevelTimes + 1
      r0_16:UpdateLevelUpInfo(r0_16.Level, r0_16.ComparedLevel + 1)
    end
  end,
  OnAddBtnForbid = function(r0_17)
    -- line: [193, 201] id: 17
    if r0_17.MaxLevel < r0_17.ComparedLevel + 1 then
      return 
    end
    UIManager(r0_17):ShowUITip("CommonToastMain", GText(r0_0.CalcCharOrWeaponLevelUp(r0_17.Target, r0_17.Type, r0_17.Level, r0_17.ComparedLevel + 1).ErrorText))
  end,
  OnBtnAddMaxClicked = function(r0_18)
    -- line: [203, 230] id: 18
    if r0_18.MaxLevel <= r0_18.ComparedLevel then
      return 
    end
    local r1_18 = r0_18.ComparedLevel + 1
    local r2_18 = nil
    while true do
      local r4_18 = r0_18.LevelUpData[r1_18][r0_18.Type .. "LevelMaxExp"]
      local r5_18 = r0_0.CalcCharOrWeaponLevelUp(r0_18.Target, r0_18.Type, r0_18.Level, r1_18)
      local r6_18 = r5_18.ExpConsume - r5_18.ExpNeed
      if r5_18.CanUpgrade then
        r2_18 = r1_18
        if r6_18 < r4_18 then
          r0_18.PreLevelTimes = r0_18.PreLevelTimes + -1
          local r7_18 = r0_18.NextLevelTimes + 1
          r0_18.NextLevelTimes = r7_18
        end
      end
      r1_18 = r1_18 + 1
      local r7_18 = r0_18.MaxLevel
      if r7_18 >= r1_18 then
        r7_18 = r5_18.CanUpgrade
        if not r7_18 then
          break
        end
      else
        break
      end
    end
    if r2_18 then
      r0_18:UpdateLevelUpInfo(r0_18.Level, r2_18)
    end
  end,
  OnBtnReduceMaxClicked = function(r0_19)
    -- line: [232, 240] id: 19
    if r0_19.ComparedLevel + -1 <= r0_19.Level or r0_19.PreLevelTimes == 0 then
      return 
    end
    r0_19.PreLevelTimes = 0
    r0_19.NextLevelTimes = 0
    r0_19.ComparedLevel = r0_19.Level + 1
    r0_19:UpdateLevelUpInfo(r0_19.Level, r0_19.ComparedLevel)
  end,
  OnLvUpResourcesChanged = function(r0_20, r1_20)
    -- line: [257, 267] id: 20
    if r0_20.CurrentMode ~= "LevelUp" then
      return 
    end
    for r6_20, r7_20 in ipairs(r0_20.CurLvUpResourceIds) do
      if r7_20 == r1_20 then
        if IsValid(r0_20) then
          r0_20:UpdateLevelUpInfo(r0_20.Level, r0_20.ComparedLevel)
          break
        else
          break
        end
      end
    end
    -- close: r2_20
  end,
  InitLvUpView = function(r0_21, r1_21)
    -- line: [269, 293] id: 21
    if nil and not nil then
      goto label_8	-- block#2 is visited secondly
    end
    r0_21.MaxLevel = 1
    r0_21.CashId = CommonConst.Coins.Coin2
    r0_21.TargetId = r0_21.TargetData[r0_21.Type .. "Id"]
    r0_21.Level = r0_21.TargetData.Level
    r0_21.BreakLevel = r0_21.TargetData.EnhanceLevel
    r0_21.PreLevelTimes = 0
    r0_21.NextLevelTimes = 0
    if r0_21.Level < DataMgr[r0_21.Type][r0_21.TargetId][r0_21.Type .. "MaxLevel"] then
      r0_21.MaxLevel, r0_21.RealMaxLevel = r0_0.GetMaxLevel(r0_21.Target, r0_21.Type)
    else
      return 
    end
    r0_21.ComparedLevel = r0_21.Level + 1
    r0_21:UpdateLevelUpInfo(r0_21.Level, r0_21.ComparedLevel)
  end,
  UpdateLevelUpInfo = function(r0_22, r1_22, r2_22)
    -- line: [295, 419] id: 22
    if r0_22.MaxLevel <= r1_22 then
      r0_22:UpdateBtnState(true)
      r0_22:UpdateBreakLevelUpInfo()
      return 
    else
      r0_22:UpdateBtnState(false)
    end
    r0_22.LevelUpData = nil
    if r0_22.Type == "Char" then
      r0_22.LevelUpData = DataMgr.LevelUp
    elseif r0_22.Type == "Weapon" then
      r0_22.LevelUpData = DataMgr.WeaponLevelUp
    end
    local r3_22 = r0_22.LevelUpData[r1_22]
    local r4_22 = r3_22[r0_22.Type .. "LevelMaxExp"]
    local r5_22 = r0_22.Target.Exp
    local r7_22 = r0_22.LevelUpData[r2_22][r0_22.Type .. "LevelMaxExp"]
    local r8_22 = 0
    local r9_22 = nil
    if r2_22 <= r1_22 + 1 or r0_22.PreLevelTimes == 0 then
      r0_22.CurrentSubUI.Btn_Minus:ForbidBtn(true)
      r0_22.CurrentSubUI.Btn_Min:ForbidBtn(true)
      r0_22.CurrentSubUI.Key_Minus:SetRenderOpacity(0.5)
      r0_22.CurrentSubUI.Key_Min:SetRenderOpacity(0.5)
    else
      r0_22.CurrentSubUI.Btn_Minus:ForbidBtn(false)
      r0_22.CurrentSubUI.Btn_Min:ForbidBtn(false)
      r0_22.CurrentSubUI.Key_Minus:SetRenderOpacity(1)
      r0_22.CurrentSubUI.Key_Min:SetRenderOpacity(1)
    end
    if r0_22.MaxLevel <= r2_22 then
      r0_22.CurrentSubUI.Btn_Add:ForbidBtn(true)
      r0_22.CurrentSubUI.Btn_Max:ForbidBtn(true)
      r0_22.CurrentSubUI.Key_Add:SetRenderOpacity(0.5)
      r0_22.CurrentSubUI.Key_Max:SetRenderOpacity(0.5)
    else
      r9_22 = r0_0.CalcCharOrWeaponLevelUp(r0_22.Target, r0_22.Type, r1_22, r2_22 + 1)
      if r9_22.CanUpgrade then
        r0_22.CurrentSubUI.Btn_Add:ForbidBtn(false)
        r0_22.CurrentSubUI.Btn_Max:ForbidBtn(false)
        r0_22.CurrentSubUI.Key_Add:SetRenderOpacity(1)
        r0_22.CurrentSubUI.Key_Max:SetRenderOpacity(1)
      else
        r0_22.CurrentSubUI.Btn_Add:ForbidBtn(true)
        r0_22.CurrentSubUI.Btn_Max:ForbidBtn(true)
        r0_22.CurrentSubUI.Key_Add:SetRenderOpacity(0.5)
        r0_22.CurrentSubUI.Key_Max:SetRenderOpacity(0.5)
      end
    end
    if r2_22 <= r1_22 then
      r2_22 = r1_22
      local r6_22 = r3_22
      r8_22 = r5_22
      r7_22 = r4_22
      r0_22.CanUpgrade = false
    else
      r9_22 = r0_0.CalcCharOrWeaponLevelUp(r0_22.Target, r0_22.Type, r1_22, r2_22)
      r0_22.CanUpgrade = r9_22.CanUpgrade
      r0_22.ResourceUse = r9_22.ResourceUse
      r0_22.CashConsume = r9_22.CashConsume
      r0_22.ExpConsume = r9_22.ExpConsume
      r0_22.ExpNeed = r9_22.ExpNeed
      r0_22.ErrorText = r9_22.ErrorText
      r8_22 = r0_22.ExpConsume - r0_22.ExpNeed
      if r0_22.CanUpgrade and r7_22 <= r8_22 and r2_22 + 1 <= r0_22.MaxLevel then
        local r10_22 = r0_22.CanUpgrade
        local r11_22 = r0_22.ExpConsume
        local r12_22 = r2_22
        if r0_22.ComparedLevel <= r2_22 then
          while r10_22 do
            local r13_22 = r9_22.ExpConsume
            if r11_22 == r13_22 then
              r12_22 = r12_22 + 1
              r13_22 = r0_0.CalcCharOrWeaponLevelUp(r0_22.Target, r0_22.Type, r1_22, r12_22)
              r9_22 = r13_22
              r10_22 = r9_22.CanUpgrade
            else
              break
            end
          end
          r0_22:UpdateLevelUpInfo(r1_22, r12_22 + -1)
        elseif r1_22 < r2_22 + -1 then
          while r10_22 do
            local r13_22 = r9_22.ExpConsume
            if r11_22 == r13_22 and r1_22 < r12_22 then
              r12_22 = r12_22 + -1
              r13_22 = r0_0.CalcCharOrWeaponLevelUp(r0_22.Target, r0_22.Type, r1_22, r12_22)
              r9_22 = r13_22
              r10_22 = r9_22.CanUpgrade
            else
              break
            end
          end
          r0_22:UpdateLevelUpInfo(r1_22, r12_22)
        end
        return 
      end
    end
    if r0_22.MaxLevel <= r2_22 then
      r8_22 = 0
    end
    if r0_22.RealMaxLevel <= r2_22 then
      r0_22.CurrentSubUI.Level_Preview_Max:SetText(r0_22.RealMaxLevel)
      r0_22.CurrentSubUI.Switcher_Level:SetActiveWidgetIndex(1)
    else
      r0_22.CurrentSubUI.Switcher_Level:SetActiveWidgetIndex(0)
    end
    r0_22:UpdataLevelUpAttr(r1_22, r2_22)
    r0_22.CurrentSubUI.Level_Now:SetText(r1_22)
    r0_22.CurrentSubUI.Level_Preview:SetText(r2_22)
    if r9_22 then
      table.insert(r9_22.ResourceUse, {
        ResourceId = r0_22.CashId,
        Count = r0_22.CashConsume,
      })
      r0_22:UpdateLvUpResourceItems(r9_22.ResourceUse)
    end
    if not r0_22.CanUpgrade then
    end
    r0_22.Level = r1_22
    r0_22.ComparedLevel = r2_22
    r0_22.WidgetSwitcher_Hint:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end,
  UpdateLvUpResourceItems = function(r0_23, r1_23)
    -- line: [421, 478] id: 23
    if not r1_23 or #r1_23 == 0 then
      return 
    end
    local r2_23 = {}
    local r3_23 = {}
    for r8_23, r9_23 in ipairs(r1_23) do
      if r9_23.Count and r9_23.Count > 0 then
        table.insert(r2_23, r9_23)
      else
        table.insert(r3_23, r9_23)
      end
    end
    -- close: r4_23
    local r4_23 = 1
    r0_23.CurLvUpResourceIds = {}
    for r9_23, r10_23 in ipairs(r2_23) do
      table.insert(r0_23.CurLvUpResourceIds, r10_23.ResourceId)
      local r11_23 = r0_23["Item_" .. r4_23]
      if IsValid(r11_23) then
        local r12_23 = DataMgr.Resource[r10_23.ResourceId]
        if r12_23 then
          local r13_23 = {
            ItemType = "Resource",
            Id = r10_23.ResourceId,
            Count = r10_23.Count,
            Icon = r12_23.Icon,
            Rarity = r12_23.Rarity and 1,
            IsShowDetails = true,
            MenuPlacement = EMenuPlacement.MenuPlacement_AboveAnchor,
          }
          local r14_23 = GWorld:GetAvatar()
          local r15_23 = nil	-- notice: implicit variable refs by block#[17]
          if r14_23 then
            r15_23 = r14_23:GetResourceNum(r10_23.ResourceId)
            if not r15_23 then
              ::label_90::
              r15_23 = 0
            end
          else
            goto label_90	-- block#16 is visited secondly
          end
          r13_23.Count = r15_23
          r13_23.NeedCount = r10_23.Count
          r11_23:Init(r13_23)
          r11_23:SetVisibility(UIConst.VisibilityOp.Visible)
          r11_23:BindEvents(r0_23, {
            OnMenuOpenChanged = r0_23.ItemMenuAnchorChanged,
          })
        end
      end
      r4_23 = r4_23 + 1
    end
    -- close: r5_23
    for r9_23, r10_23 in ipairs(r3_23) do
      local r11_23 = r0_23["Item_" .. r4_23]
      if IsValid(r11_23) then
        r11_23:Init({})
        r11_23:SetVisibility(UIConst.VisibilityOp.Visible)
      end
      r4_23 = r4_23 + 1
    end
    -- close: r5_23
  end,
  UpdataLevelUpAttr = function(r0_24, r1_24, r2_24)
    -- line: [480, 532] id: 24
    local r3_24 = r0_24.LevelUpData[r1_24]
    local r4_24 = r0_24.LevelUpData[r2_24]
    local r5_24 = {}
    local r6_24 = {}
    local r7_24 = DataMgr["Battle" .. r0_24.Type][r0_24.TargetId]
    local r8_24 = r7_24.ATK and 0
    local r9_24 = r7_24.ATKLevelGrow
    if r8_24 and r9_24 then
      for r14_24, r15_24 in pairs(DataMgr.Attribute) do
        local r16_24 = "ATK_" .. r14_24
        if r7_24[r16_24] then
          r8_24 = r8_24 + r7_24[r16_24]
        end
      end
      -- close: r10_24
      table.insert(r5_24, {
        Key = "ATK",
        Value = r8_24 * r3_24[r9_24],
      })
      table.insert(r6_24, {
        Key = "ATK",
        Value = r8_24 * r4_24[r9_24],
      })
    end
    for r15_24, r16_24 in ipairs({
      "MaxHp",
      "DEF",
      "MaxES"
    }) do
      local r17_24 = r7_24[r16_24]
      local r18_24 = r7_24[r16_24 .. "LevelGrow"]
      if r17_24 and r18_24 then
        local r19_24 = r17_24 * r3_24[r18_24]
        local r20_24 = r17_24 * r4_24[r18_24]
        if CommonUtils.AttrConvert[r16_24] then
          r19_24 = CommonUtils.AttrConvert[r16_24](r19_24)
          r20_24 = CommonUtils.AttrConvert[r16_24](r20_24)
        end
        table.insert(r5_24, {
          Key = r16_24,
          Value = r19_24,
        })
        table.insert(r6_24, {
          Key = r16_24,
          Value = r20_24,
        })
      end
    end
    -- close: r11_24
    local r12_24 = r4_24.ModVolume
    table.insert(r5_24, {
      Key = "ModVolume",
      Value = r3_24.ModVolume,
    })
    table.insert(r6_24, {
      Key = "ModVolume",
      Value = r12_24,
    })
    r0_24.Attrs = {}
    r0_24.ComparedAttrs = {}
    for r17_24, r18_24 in ipairs(r5_24) do
      if r18_24.Value ~= r6_24[r17_24].Value then
        local r19_24 = DataMgr.AttrConfig[r18_24.Key]
        table.insert(r0_24.Attrs, {
          AttrName = r19_24.Name,
          AttrValue = CommonUtils.AttrValueToString(r19_24, r18_24.Value),
          AttrDesc = GText(r19_24.AttrDesc),
        })
        local r20_24 = table.insert
        local r21_24 = r0_24.ComparedAttrs
        local r22_24 = {
          AttrName = r19_24.Name,
          AttrValue = CommonUtils.AttrValueToString(r19_24, r6_24[r17_24].Value and 0),
          Delta = (r6_24[r17_24].Value and 0) - r18_24.Value,
        }
        r20_24(r21_24, r22_24)
      end
    end
    -- close: r13_24
    r0_24.CurrentSubUI:UpdataAttrListView(r0_24.Attrs, r0_24.ComparedAttrs)
  end,
  TryToLevelUp = function(r0_25)
    -- line: [534, 553] id: 25
    local r1_25 = GWorld:GetAvatar()
    if r1_25 == nil then
      return 
    end
    if r0_25.CanUpgrade then
      r0_25:BlockAllUIInput(true)
      r1_25[r0_25.Type .. "LevelUp"](r1_25, r0_25.Target.Uuid, r0_25.Level, r0_25.ComparedLevel)
      local r3_25 = UIManager(r0_25):GetArmoryUIObj()
      if r0_25.Type == "Char" then
        r3_25.ActorController:CharLvUpOrBreakUp()
      elseif r0_25.Type == "Weapon" then
        r3_25.ActorController:WeaponLvUpOrBreakUp()
      end
    else
      UIManager(r0_25):ShowUITip("CommonToastMain", GText(r0_25.ErrorText))
    end
  end,
  ForbiddenUpgradeBtnClicked = function(r0_26)
    -- line: [555, 557] id: 26
    UIManager(r0_26):ShowUITip("CommonToastMain", GText(r0_26.ErrorText))
  end,
  OnTargetLevelUp = function(r0_27, r1_27, r2_27, r3_27, r4_27)
    -- line: [559, 594] id: 27
    local r6_27 = UE4.UGameplayStatics.GetGameInstance(r0_27):GetGameUIManager()
    if not r6_27 then
      return 
    end
    if r1_27 == ErrorCode.RET_SUCCESS then
      local r7_27 = GWorld:GetAvatar()
      if r7_27 and r7_27[r0_27.Type .. "s"][r2_27] and r3_27 == r0_27.Level and r4_27 == r7_27[r0_27.Type .. "s"][r2_27].Level then
        r0_27.Level = r4_27
        r0_27.Target = r7_27[r0_27.Type .. "s"][r2_27]
        if r0_27.Type == "Char" then
          r0_27.ErrorText = "Char_LevelUp_Success"
        elseif r0_27.Type == "Weapon" then
          r0_27.ErrorText = "Weapon_LevelUp_Success"
        end
        r0_27:BlockAllUIInput(true)
        r0_27.CurrentSubUI:OnLevelUpSuccess()
        r0_27.CurrentSubUI.Num_LevelUp:SetText(r4_27)
        r0_27.Btn_Upgrade:ForbidBtn(true)
        r0_27:UpdateLvUpResourceItems({
          {
            ResourceId = nil,
            Count = 0,
          },
          {
            ResourceId = nil,
            Count = 0,
          },
          {
            ResourceId = nil,
            Count = 0,
          },
          {
            ResourceId = nil,
            Count = 0,
          },
          {
            ResourceId = nil,
            Count = 0,
          }
        })
        if r0_27.Params and r0_27.Params.LeftCallbackObj and r0_27.Params.LeftCallbackFunction then
          r0_27.Params.LeftCallbackFunction(r0_27.Params.LeftCallbackObj)
        end
      else
        r0_27.ErrorText = "Unknown_Error"
        r6_27(r0_27):ShowUITip("CommonToastMain", GText(r0_27.ErrorText))
      end
    else
      r6_27:ShowError(r1_27, 1.5)
    end
  end,
  OnLevelUpAnimFinishedCallback = function(r0_28)
    -- line: [596, 631] id: 28
    if r0_28.CurrentMode ~= "LevelUp" then
      return 
    end
    if DataMgr[r0_28.Type][r0_28.TargetId][r0_28.Type .. "MaxLevel"] <= r0_28.Level then
      r0_28:UpdateBtnState(true)
      return 
    end
    r0_28.Btn_Upgrade:ForbidBtn(false)
    r0_28:BlockAllUIInput(false)
    if r0_28.MaxLevel <= r0_28.Level then
      r0_28.VB_Node:ClearChildren()
      r0_28:InitUIInfo(UIConst.LoadInConfig, DataMgr.SystemUI.ArmoryCardLevelWeapon.UIName, nil, r0_28.Type, r0_28.Target, r0_28, {
        Target = r0_28.Target,
        Type = r0_28.Type,
        Tag = r0_28.Tag,
        BehaviourType = "BreakLevelUp",
        IsSwitch = true,
        LeftCallbackObj = r0_28.Params.LeftCallbackObj,
        LeftCallbackFunction = r0_28.Params.LeftCallbackFunction,
        CloseBtnCallbackObj = r0_28.Params.CloseBtnCallbackObj,
        CloseBtnCallbackFunction = r0_28.Params.CloseBtnCallbackFunction,
      })
      return 
    else
      r0_28:InitLvUpView({
        Target = r0_28.Target,
        Type = r0_28.Type,
        Tag = r0_28.Tag,
      })
    end
    if r0_28.Key_Consume and r0_28.CurInputDeviceType == ECommonInputType.Gamepad then
      r0_28.Key_Consume:SetVisibility(UIConst.VisibilityOp.Visible)
    end
  end,
  UpdateBtnState = function(r0_29, r1_29)
    -- line: [633, 647] id: 29
    DebugPrint(WarningTag, "UpdateBtnStateUpdateBtnStateUpdateBtnState", r1_29)
    if r1_29 then
      r0_29.Btn_Upgrade:ForbidBtn(true)
      r0_29.Panel_Max:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      r0_29.CurrentSubUI.Btn_Minus:ForbidBtn(true)
      r0_29.CurrentSubUI.Btn_Min:ForbidBtn(true)
      r0_29:BlockAllUIInput(false)
    else
      r0_29.Btn_Upgrade:ForbidBtn(false)
      r0_29.Panel_Max:SetVisibility(UIConst.VisibilityOp.Collapsed)
      r0_29.CurrentSubUI.Btn_Minus:ForbidBtn(false)
      r0_29.CurrentSubUI.Btn_Min:ForbidBtn(false)
    end
  end,
  RefreshOpInfoByInputDeviceComp = function(r0_30, r1_30, r2_30)
    -- line: [650, 688] id: 30
    r0_30.CurInputDeviceType = r1_30
    if r1_30 == ECommonInputType.Gamepad then
      r0_30:ReNavigateToListItem()
      if r0_30.Key_Consume then
        r0_30.Key_Consume:SetVisibility(UIConst.VisibilityOp.Visible)
        r0_30:SetFocus()
        r0_30:ShowCheckBtn(false)
        r0_30:ShowChooseBtn(false)
      end
      if r0_30.CurrentSubUI.WidgetSwitcher_Min then
        r0_30.CurrentSubUI.WidgetSwitcher_Min:SetActiveWidgetIndex(1)
        r0_30.CurrentSubUI.WidgetSwitcher_Minus:SetActiveWidgetIndex(1)
        r0_30.CurrentSubUI.WidgetSwitcher_Add:SetActiveWidgetIndex(1)
        r0_30.CurrentSubUI.WidgetSwitcher_Max:SetActiveWidgetIndex(1)
      end
      r0_30.Item_1:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
      r0_30.Item_5:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
      for r6_30 = 1, 4, 1 do
        r0_30["Item_" .. r6_30]:SetNavigationRuleExplicit(EUINavigation.Right, r0_30["Item_" .. r6_30 + 1])
        r0_30["Item_" .. r6_30 + 1]:SetNavigationRuleExplicit(EUINavigation.Left, r0_30["Item_" .. r6_30])
      end
      for r6_30 = 1, 5, 1 do
        r0_30["Item_" .. r6_30]:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
        r0_30["Item_" .. r6_30]:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
      end
    else
      if r0_30.Key_Consume then
        r0_30.Key_Consume:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
      if r0_30.CurrentSubUI.WidgetSwitcher_Min then
        r0_30.CurrentSubUI.WidgetSwitcher_Min:SetActiveWidgetIndex(0)
        r0_30.CurrentSubUI.WidgetSwitcher_Minus:SetActiveWidgetIndex(0)
        r0_30.CurrentSubUI.WidgetSwitcher_Add:SetActiveWidgetIndex(0)
        r0_30.CurrentSubUI.WidgetSwitcher_Max:SetActiveWidgetIndex(0)
      end
    end
  end,
  OnFocusReceivedComp = function(r0_31, r1_31, r2_31)
    -- line: [690, 695] id: 31
    if r0_31.CurInputDeviceType == ECommonInputType.Gamepad then
      r0_31:ReNavigateToListItem()
      r0_31.Key_Consume:SetVisibility(UIConst.VisibilityOp.Visible)
    end
  end,
  ReNavigateToListItem = function(r0_32)
    -- line: [698, 717] id: 32
    if CommonUtils:IfExistSystemGuideUI(r0_32) then
      return 
    end
    if r0_32.CurrentMode == "LevelUp" then
      if r0_32.bListExpand then
        local r1_32 = r0_32.Selective_Listing.TileView_Select_Role
        if r1_32:GetNumItems() > 0 then
          local r2_32 = r1_32:BP_GetSelectedItem()
          if r2_32 then
            r1_32:BP_NavigateToItem(r2_32)
          else
            r1_32:NavigateToIndex(0)
          end
        end
      else
        r0_32:SetFocus()
      end
    end
  end,
  OnKeyDownComp = function(r0_33, r1_33, r2_33)
    -- line: [719, 749] id: 33
    if r2_33 == UIConst.GamePadKey.FaceButtonTop and r0_33.CurrentMode == "LevelUp" then
      r0_33:OnUpgradeBtnClicked()
      return true
    elseif r2_33 == UIConst.GamePadKey.FaceButtonRight and r0_33.IsFocusInItem then
      r0_33:SetFocus()
      r0_33.IsFocusInItem = false
      r0_33.Key_Consume:SetVisibility(UIConst.VisibilityOp.Visible)
      r0_33:ShowCheckBtn(false)
      return true
    elseif r2_33 == UIConst.GamePadKey.DPadLeft then
      r0_33:OnBtnReduceMaxClicked()
      return true
    elseif r2_33 == UIConst.GamePadKey.DPadRight then
      r0_33:OnBtnAddMaxClicked()
      return true
    elseif r2_33 == UIConst.GamePadKey.LeftTriggerThreshold then
      r0_33:PreLevel()
      return true
    elseif r2_33 == UIConst.GamePadKey.RightTriggerThreshold then
      r0_33:NextLevel()
      return true
    elseif r2_33 == UIConst.GamePadKey.LeftThumb then
      r0_33.Item_1:SetFocus()
      r0_33.IsFocusInItem = true
      r0_33.Key_Consume:SetVisibility(UIConst.VisibilityOp.Collapsed)
      r0_33:ShowCheckBtn(true)
      return true
    end
    return false
  end,
  OnPreviewKeyDownComp = function(r0_34, r1_34, r2_34)
    -- line: [751, 760] id: 34
    if r2_34 == UIConst.GamePadKey.DPadLeft then
      r0_34:OnBtnReduceMaxClicked()
      return true
    elseif r2_34 == UIConst.GamePadKey.DPadRight then
      r0_34:OnBtnAddMaxClicked()
      return true
    end
    return false
  end,
}
return r1_0
