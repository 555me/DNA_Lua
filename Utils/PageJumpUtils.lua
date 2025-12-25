-- filename: @C:/Pack/Branch/geili11\Content/Script/Utils\PageJumpUtils.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("Utils.PageJumpFunctionConfig")
local r1_0 = require("BluePrints.UI.WBP.Gacha.GachaModel")
local r2_0 = require("BluePrints.UI.WBP.Activity.ActivityUtils")
local r3_0 = {
  GetItemAccess = function(r0_1, r1_1, r2_1, r3_1, r4_1, r5_1, r6_1)
    -- line: [22, 228] id: 1
    local r7_1 = DataMgr.Access[r4_1]
    assert(r7_1, "找不到AccessData：" .. r4_1)
    local r8_1 = GText(r7_1.AccessText)
    r0_1.UIPageName = nil
    if r5_1 then
      r0_1.UIPageName = r5_1
    elseif r1_1.UIName then
      r0_1.UIPageName = r1_1.UIName
    end
    local r9_1 = nil
    if string.sub(r4_1, 1, 5) == "Shop_" and r4_1 ~= "Shop_Pack" then
      r9_1 = r7_1.AccessParam
      r4_1 = "Shop"
    end
    if string.sub(r4_1, 1, 14) == "ImpressionShop" then
      r4_1 = "ImpressionShop"
    end
    local r10_1 = {
      ItemWidget = r1_1,
      AccessKey = r4_1,
      AccessText = r8_1,
      UIName = r0_1.UIPageName,
      UIUnlockRuleId = r7_1.UIUnlockRuleId,
      AccessParam = r7_1.AccessParam,
    }
    local r12_1 = nil	-- notice: implicit variable refs by block#[31, 34, 36, 37, 38, 40, 43, 54, 58, 64, 68, 72, 73, 76, 77, 79]
    local r15_1 = nil	-- notice: implicit variable refs by block#[33, 35, 42, 52, 54, 58, 62, 64, 66, 72, 76, 79]
    if r7_1.AccessRule == "InterfaceJump" then
      local r11_1 = r0_1:CreateAccessItem(r1_1, r4_1)
      r11_1.Text_Method:SetText(GText(r8_1))
      r11_1.Text_Method02:SetText(GText(r8_1))
      r11_1.Text_Method01:SetText(GText(r8_1))
      r12_1 = tonumber(r7_1.AccessParam)
      if not DataMgr.InterfaceJump[r12_1] then
        return 
      end
      local r13_1 = GWorld:GetAvatar()
      r11_1.IsText = false
      r11_1.IsInteractive = true
      r11_1.IsUnLock = false
      r11_1.Switch_Type:SetActiveWidgetIndex(0)
      if not ConditionUtils.CheckCondition(r13_1, DataMgr.InterfaceJump[r12_1].PortalUnlockCondition) then
        r11_1.IsUnLock = true
        r11_1.Switch_Type:SetActiveWidgetIndex(1)
      else
        r15_1 = GWorld.GameInstance:GetGameUIManager()
        local r16_1, r17_1 = r13_1:CheckSystemUICanOpen(r7_1.UIUnlockRuleId)
        if r16_1 then
          if r0_1.UIPageName and DataMgr.SystemUI[r0_1.UIPageName] and DataMgr.SystemUI[r0_1.UIPageName].IsBanAccess then
            function r11_1.JumpFunc()
              -- line: [79, 81] id: 2
              r15_1:ShowUITip("CommonToastMain", GText("UI_COMMONPOP_TITLE_100059"))
            end
          else
            function r11_1.JumpFunc()
              -- line: [83, 85] id: 3
              r0_1:JumpToTargetPageByJumpId(r12_1)
            end
          end
        else
          local r19_1 = DataMgr.UIUnlockRule[r7_1.UIUnlockRuleId].OpenSystemDesc
          local r20_1 = nil
          if #DataMgr.UIUnlockRule[r7_1.UIUnlockRuleId].OpenConditionId == #r19_1 then
            for r25_1, r26_1 in pairs(r17_1) do
              r20_1 = r19_1[r26_1]
            end
            -- close: r21_1
          else
            r20_1 = r19_1[1]
          end
          function r11_1.JumpFunc()
            -- line: [99, 101] id: 4
            r15_1:ShowUITip("CommonToastMain", r20_1)
          end
          -- close: r18_1
        end
        -- close: r14_1
      end
      r1_1.Method:AddChild(r11_1)
      return 
      -- close: r11_1
    end
    if r4_1 == "Dungeon" or r4_1 == "MonsterStrong" then
      local r11_1 = false
      r12_1 = r0_1.UIPageName
      if r12_1 == "StyleOfPlay" then
        r11_1 = true
      end
      r15_1 = r3_1
      r0_1:CreateJumpToDungeonAccess(r10_1, r15_1, r2_1, r11_1)
      return 
    end
    r12_1 = r4_1
    if string.sub(r12_1, 1, 14) == "Dungeon_ModTab" then
      r15_1 = r2_1
      r0_1:CreateJumpToDungeonModAccess(r10_1, r3_1, r15_1)
      return 
    end
    local r11_1 = r0_1:CreateAccessItem(r1_1, r4_1)
    r12_1 = r11_1.Btn_Click
    r12_1:SetVisibility(ESlateVisibility.Visible)
    if r4_1 == "Shop_Pack" then
      r12_1 = DataMgr
      r12_1 = r12_1.ShopItem2RewardPack
      r12_1 = r12_1[r3_1]
      if r12_1 then
        r12_1 = DataMgr
        r12_1 = r12_1.ShopItem2RewardPack
        r12_1 = r12_1[r3_1]
        r12_1 = r12_1[r2_1]
        if not r12_1 then
          ::label_233::
          return 
        end
      else
        goto label_233	-- block#39 is visited secondly
      end
      r12_1 = GWorld
      r12_1 = r12_1:GetAvatar()
      if not r12_1 then
        return 
      end
      local r13_1 = nil
      r15_1 = DataMgr
      r15_1 = r15_1.ShopItem2RewardPack
      r15_1 = r15_1[r3_1]
      r15_1 = r15_1[r2_1]
      for r18_1, r19_1 in ipairs(r15_1) do
        local r20_1 = r0_1:CreateAccessItem(r1_1, r4_1)
        if r12_1:CheckShopItemCanPurchase(r19_1.ShopItemId) and (not r13_1 or r13_1.TypeId >= r19_1.TypeId) then
          r13_1 = r19_1
        end
      end
      -- close: r14_1
      if not r13_1 then
        return 
      end
      local r14_1, r15_1 = r0_1:CreateJumpToShopAccess("Reward", r13_1.ShopType, r13_1.TypeId, nil, r6_1)
      if not r14_1 then
        return 
      end
      r0_1:ProcessAccessItem(r11_1, r8_1, r0_1.UIPageName, r7_1.UIUnlockRuleId, r15_1)
      r1_1.Method:AddChild(r11_1)
      return 
    end
    if r4_1 == "Shop" then
      r10_1.AccessItem = r11_1
      r15_1 = r9_1
      local r12_1, r13_1 = r0_1:CreateJumpToShopAccess(r3_1, r15_1, r2_1, r10_1, r6_1)
      if not r12_1 then
        return 
      end
      r1_1.Method:AddChild(r10_1.AccessItem)
      return 
    end
    if r4_1 == "ImpressionShop" then
      r10_1.AccessItem = r11_1
      r15_1 = r10_1
      local r12_1, r13_1 = r0_1:CreateJumpToImpressionShopAccess(r2_1, r15_1)
      if not r12_1 then
        return 
      end
      r1_1.Method:AddChild(r10_1.AccessItem)
      return 
    end
    if r4_1 == "Walnut" then
      r15_1 = r3_1
      r0_1:CreateJumpToWalnutBag(r10_1, r15_1, r2_1)
      return 
    end
    if r4_1 == "Forging" then
      r15_1 = r3_1
      local r12_1, r13_1, r14_1 = r0_1:CreateJumpToForge(r11_1, r15_1, r2_1, r8_1)
      if not r12_1 then
        return 
      end
      r0_1:ProcessAccessItem(r11_1, r14_1, r0_1.UIPageName, r7_1.UIUnlockRuleId, r13_1, nil, nil, true)
      r15_1 = r1_1.Method
      r15_1:AddChild(r11_1)
      return 
    end
    if r4_1 == "Home" then
      local r12_1, r13_1 = r0_1:CreateJumpToHome(r11_1)
      if not r12_1 then
        return 
      end
      r0_1:ProcessAccessItem(r11_1, r8_1, r0_1.UIPageName, r7_1.UIUnlockRuleId, r13_1)
      r1_1.Method:AddChild(r11_1)
      return 
    end
    if r4_1 == "HardBoss" then
      r10_1.AccessItem = r11_1
      r15_1 = r10_1
      r12_1 = r0_1:CreateJumpToHardBoss(r2_1, r15_1)
      if r12_1 then
        r12_1 = r1_1.Method
        r12_1:AddChild(r10_1.AccessItem)
      end
      return 
    end
    if r4_1 == "Abyss" then
      r10_1.AccessItem = r11_1
      r15_1 = r10_1
      r12_1 = r0_1:CreateJumpToAbyss(r2_1, r15_1)
      if r12_1 then
        r12_1 = r1_1.Method
        r12_1:AddChild(r10_1.AccessItem)
      end
      return 
    end
    r15_1 = r8_1
    r0_1:ProcessAccessItem(r11_1, r15_1, r0_1.UIPageName, r7_1.UIUnlockRuleId, nil)
    r12_1 = r11_1.Btn_Click
    r12_1:SetVisibility(ESlateVisibility.Collapsed)
    r12_1 = r1_1.Method
    r12_1:AddChild(r11_1)
  end,
  CreateAccessItem = function(r0_5, r1_5, r2_5)
    -- line: [232, 244] id: 5
    local r3_5 = r1_5:CreateWidgetNew("ItemDetailAccess")
    r3_5.Parent = r1_5
    r3_5.Access = r2_5
    r3_5.IsUnLock = true
    if string.sub(r2_5, 1, 5) == "Text_" then
      r3_5.IsText = true
    end
    return r3_5
  end,
  ProcessAccessItem = function(r0_6, r1_6, r2_6, r3_6, r4_6, r5_6, r6_6, r7_6, r8_6)
    -- line: [255, 323] id: 6
    local r10_6 = GWorld.GameInstance:GetGameUIManager()
    r1_6.Text_Method:SetText(GText(r2_6))
    r1_6.Text_Method02:SetText(GText(r2_6))
    r1_6.Text_Method01:SetText(GText(r2_6))
    if not r3_6 then
      DebugPrint("ZDX UIName is nil")
    end
    local r11_6 = GWorld:GetAvatar()
    if not r11_6 then
      return 
    end
    if not r4_6 then
      r1_6.Switch_Type:SetActiveWidgetIndex(2)
      return 
    end
    if not r11_6:CheckUIUnlocked(r4_6) then
      r1_6.Text_Method:SetText(GText("UI_Npc_Name_Wenhao"))
      r1_6.Text_Method02:SetText(GText("UI_Npc_Name_Wenhao"))
      r1_6.Text_Method01:SetText(GText("UI_Npc_Name_Wenhao"))
      r1_6.IsText = true
      r1_6.IsUnLock = true
      r1_6.Switch_Type:SetActiveWidgetIndex(1)
      return 
    end
    if r5_6 then
      r1_6.IsInteractive = true
      r1_6.Switch_Type:SetActiveWidgetIndex(0)
      local r13_6, r14_6 = r11_6:CheckSystemUICanOpen(r4_6)
      if r13_6 or r8_6 then
        if not DataMgr.SystemUI[r3_6] then
          DebugPrint("传入的UIName未在SystemUI中找到：", r3_6)
        elseif DataMgr.SystemUI[r3_6].IsBanAccess then
          function r5_6()
            -- line: [292, 294] id: 7
            r10_6:ShowUITip("CommonToastMain", GText("UI_COMMONPOP_TITLE_100059"))
          end
        end
      else
        local r16_6 = DataMgr.UIUnlockRule[r4_6].OpenSystemDesc
        local r17_6 = nil
        if #DataMgr.UIUnlockRule[r4_6].OpenConditionId == #r16_6 then
          for r22_6, r23_6 in pairs(r14_6) do
            r17_6 = r16_6[r23_6]
          end
          -- close: r18_6
        else
          r17_6 = r16_6[1]
        end
        function r5_6()
          -- line: [308, 310] id: 8
          r10_6:ShowUITip("CommonToastMain", r17_6)
        end
        -- close: r15_6
      end
      r1_6.JumpFunc = r5_6
    else
      r1_6.IsText = true
      r1_6.IsInteractive = false
      r1_6.Switch_Type:SetActiveWidgetIndex(2)
    end
    if r6_6 then
      r6_6(r1_6, r3_6)
    end
  end,
  CloseFrontDialog = function(r0_9)
    -- line: [328, 365] id: 9
    local r2_9 = GWorld.GameInstance:GetGameUIManager()
    local r3_9 = r2_9:GetUI("CommonDialog")
    if r3_9 then
      if r3_9.CloseBtnCallbackFunction then
        r3_9.CloseBtnCallbackFunction(r3_9.CloseBtnCallbackObj, r3_9:PackageResult())
      end
      r3_9:Close()
    end
    local r4_9 = r2_9:GetUI("WalnutRewardDialog")
    if r4_9 then
      r4_9:Close()
    end
    local r5_9 = r2_9:GetUI("PayGiftPopup_Yellow") and r2_9:GetUI("PayGiftPopup_Purple")
    if r5_9 then
      r5_9:Close()
    end
    local r6_9 = r2_9:GetUI("ForgePathView")
    if r6_9 then
      r6_9:Close()
    end
    local r7_9 = r2_9:GetUI("FeinaEventReward")
    if r7_9 then
      r7_9:Close()
    end
    local r8_9 = r2_9:GetUI("GuildWarRewardPop")
    if r8_9 then
      r8_9:OnReturnKeyDown()
    end
  end,
  SortAccessItem = function(r0_10, r1_10)
    -- line: [370, 400] id: 10
    local r2_10 = r1_10:GetAllChildren():ToTable()
    for r6_10 = 1, #r2_10, 1 do
      r2_10[r6_10].Index = r6_10
    end
    r1_10:ClearChildren()
    table.sort(r2_10, function(r0_11, r1_11)
      -- line: [376, 396] id: 11
      if r0_11.IsUnLock and r1_11.IsUnLock then
        if r0_11.IsText and r1_11.IsText then
          return r0_11.Index < r1_11.Index
        end
        if r0_11.IsText or r1_11.IsText then
          return not r0_11.IsText
        end
        return r0_11.Index < r1_11.Index
      end
      if r0_11.IsUnLock or r1_11.IsUnLock then
        return not r0_11.IsUnLock
      end
      if r0_11.IsText and r1_11.IsText then
        return r0_11.Index < r1_11.Index
      end
      if r0_11.IsText or r1_11.IsText then
        return not r0_11.IsText
      end
      return r0_11.Index < r1_11.Index
    end)
    for r7_10, r8_10 in pairs(r2_10) do
      r1_10:AddChild(r8_10)
    end
    -- close: r3_10
  end,
  CreateJumpToDungeonAccess = function(r0_12, r1_12, r2_12, r3_12, r4_12)
    -- line: [403, 482] id: 12
    local r5_12 = nil
    local r6_12 = {}
    local r7_12 = 1
    if r1_12.AccessKey == "Dungeon" then
      r5_12 = DataMgr.Resource2Dungeon[r2_12][r3_12]
      if not r5_12 then
        return 
      end
      table.insert(r6_12, r0_12:GetAccessDungeon(r5_12))
    else
      r7_12 = 2
      r5_12 = DataMgr.Reward2MonsterDungeon[r2_12][r3_12]
      if not r5_12 then
        return 
      end
      for r12_12, r13_12 in pairs(r5_12) do
        table.insert(r6_12, r13_12)
      end
      -- close: r8_12
      table.sort(r6_12, function(r0_13, r1_13)
        -- line: [424, 426] id: 13
        return r0_13.DungeonId < r1_13.DungeonId
      end)
    end
    for r12_12, r13_12 in ipairs(r6_12) do
      local r14_12 = r0_12:CreateAccessItem(r1_12.ItemWidget, r1_12.AccessKey)
      local r15_12 = DataMgr.Dungeon
      local r16_12 = nil
      local r17_12 = nil
      local r18_12 = nil
      if r1_12.AccessKey == "Dungeon" then
        r16_12 = r13_12
        assert(r15_12[r16_12], "找不到DungeonInfo[" .. r16_12 .. "]")
        r18_12 = r1_12.AccessText .. GText(r15_12[r16_12].DungeonName)
      elseif r1_12.AccessKey == "MonsterStrong" then
        r16_12 = r13_12.DungeonId
        r17_12 = r13_12.MonsterId
        assert(r15_12[r16_12], "找不到DungeonInfo[" .. r16_12 .. "]")
        r18_12 = GText(DataMgr.Monster[DataMgr.ModDungeonMonReward[r17_12].MonsterUnitId].UnitName) .. " Lv." .. DataMgr.Dungeon[r16_12].DungeonLevel
      end
      r0_12:ProcessAccessItem(r14_12, r18_12, r1_12.UIName, r1_12.UIUnlockRuleId, function()
        -- line: [443, 445] id: 14
        r0_12:JumpToDungeonPage(r16_12, r7_12, r17_12, r4_12)
      end, function(r0_15, r1_15)
        -- line: [447, 478] id: 15
        if r0_15.IsInteractive == true and (r0_12:CheckDungeonCondition(r15_12[r16_12].Condition) == false or DataMgr.Dungeon2Select[r16_12] and r0_12:CheckDungeonCondition(DataMgr.SelectDungeon[DataMgr.Dungeon2Select[r16_12]].Condition) == false or DataMgr.Dungeon2SubDungeon[r16_12] and DataMgr.Dungeon2Select[DataMgr.Dungeon2SubDungeon[r16_12]] and r0_12:CheckDungeonCondition(DataMgr.SelectDungeon[DataMgr.Dungeon2Select[DataMgr.Dungeon2SubDungeon[r16_12]]].Condition) == false) then
          r0_15.IsInteractive = false
          r0_15.IsUnLock = true
          r0_15.Switch_Type:SetActiveWidgetIndex(1)
          local function r2_15()
            -- line: [459, 469] id: 16
            if DataMgr.Dungeon2Select[r16_12] and r0_12:CheckDungeonCondition(r15_12[r16_12].Condition, true) then
              r0_12:CheckDungeonCondition(DataMgr.SelectDungeon[DataMgr.Dungeon2Select[r16_12]].Condition, true)
            elseif DataMgr.Dungeon2SubDungeon[r16_12] and r0_12:CheckDungeonCondition(r15_12[r16_12].Condition, true) then
              r0_12:CheckDungeonCondition(DataMgr.SelectDungeon[DataMgr.Dungeon2Select[DataMgr.Dungeon2SubDungeon[r16_12]]].Condition, true)
            end
          end
          r0_15.JumpFunc = r2_15
          if DataMgr.SystemUI[r1_15] and not DataMgr.SystemUI[r1_15].IsBanAccess then
            r0_15.JumpFunc = r2_15
          end
        end
      end)
      r1_12.ItemWidget.Method:AddChild(r14_12)
      -- close: r14_12
    end
    -- close: r8_12
  end,
  CreateJumpToDungeonModAccess = function(r0_17, r1_17, r2_17, r3_17)
    -- line: [484, 522] id: 17
    assert(DataMgr.ModSelectDungeon[r1_17.AccessParam], "Mod委托本配置参数错误, ", r1_17.AccessKey)
    local r4_17 = r0_17:CreateAccessItem(r1_17.ItemWidget, r1_17.AccessKey)
    local r5_17 = GText(r1_17.AccessText)
    local r6_17 = nil
    r0_17:ProcessAccessItem(r4_17, r5_17 .. " Lv." .. GText(r1_17.AccessParam), r1_17.UIName, r1_17.UIUnlockRuleId, function()
      -- line: [489, 501] id: 18
      r0_17:CloseFrontDialog()
      if r1_17.UIName == "DeputeDetail" then
        local r2_18 = GWorld.GameInstance:GetGameUIManager():GetUIObj("StyleOfPlay")
        if r2_18.CurTabId == "DungeonSelect" then
          r2_18.CurSubUI.IsFromJump = false
        end
      end
      r0_17:JumpToStyleOfPlaySubUI("NewDeputeRoot", "NightBook", r1_17.AccessParam)
    end, function(r0_19, r1_19)
      -- line: [502, 519] id: 19
      if r0_19.IsInteractive == true and not r0_17:CheckDungeonCondition(DataMgr.ModSelectDungeon[r1_17.AccessParam].Condition) then
        r0_19.IsInteractive = false
        r0_19.IsUnLock = false
        r0_19.Switch_Type:SetActiveWidgetIndex(1)
        local function r2_19()
          -- line: [508, 510] id: 20
          r3_0:CheckDungeonCondition(DataMgr.ModSelectDungeon[r1_17.AccessParam].Condition, true)
        end
        r0_19.JumpFunc = r2_19
        if DataMgr.SystemUI[r1_19] and not DataMgr.SystemUI[r1_19].IsBanAccess then
          r0_19.JumpFunc = r2_19
        end
      end
    end)
    r1_17.ItemWidget.Method:AddChild(r4_17)
  end,
  GetAccessDungeon = function(r0_21, r1_21)
    -- line: [529, 553] id: 21
    local r2_21 = false
    local r3_21 = nil
    local r4_21 = nil
    local r5_21 = 0
    local r6_21 = 999
    local r7_21 = DataMgr.Dungeon
    local r8_21 = pairs
    for r12_21, r13_21 in r8_21(r1_21) do
      if DataMgr.Dungeon2Select[r13_21] or DataMgr.Dungeon2Select[DataMgr.Dungeon2SubDungeon[r13_21]] then
        if r0_21:CheckDungeonCondition(r7_21[r13_21].Condition) and (not r3_21 or r5_21 < DataMgr.Dungeon[r13_21].DungeonLevel or r5_21 == DataMgr.Dungeon[r13_21].DungeonLevel and r3_21 < r13_21) then
          r2_21 = true
          r5_21 = DataMgr.Dungeon[r13_21].DungeonLevel
          r3_21 = r13_21
        end
        if not r4_21 or DataMgr.Dungeon[r13_21].DungeonLevel < r6_21 or r6_21 == DataMgr.Dungeon[r13_21].DungeonLevel and r13_21 < r4_21 then
          r6_21 = DataMgr.Dungeon[r13_21].DungeonLevel
          r4_21 = r13_21
        end
      end
    end
    -- close: r8_21
    if r2_21 then
      r8_21 = r3_21 and r4_21
    else
      goto label_79	-- block#17 is visited secondly
    end
    return r8_21
  end,
  CheckDungeonCondition = function(r0_22, r1_22, r2_22)
    -- line: [556, 570] id: 22
    local r3_22 = GWorld:GetAvatar()
    if not r3_22 then
      return false
    end
    if not r1_22 then
      return true
    end
    for r8_22, r9_22 in pairs(r1_22) do
      if ConditionUtils.CheckCondition(r3_22, r9_22, r2_22) == false then
        return false
      end
    end
    -- close: r4_22
    return true
  end,
  CreateJumpToShopAccess = function(r0_23, r1_23, r2_23, r3_23, r4_23, r5_23)
    -- line: [573, 670] id: 23
    if not DataMgr.ShopItem2ShopSubId[r1_23][r2_23][r3_23] then
      return 
    end
    local r6_23 = setmetatable({}, {
      __index = DataMgr.ShopItem2ShopSubId[r1_23][r2_23][r3_23],
    })
    if not r6_23 or next(r6_23) then
      return 
    end
    table.sort(r6_23, function(r0_24, r1_24)
      -- line: [581, 583] id: 24
      -- notice: unreachable block#3
      local r2_24 = r0_24.AccessOrder
      if not r2_24 then
        r2_24 = r1_24.AccessOrder
        if r2_24 >= 0 then
          r2_24 = 0
        else
          r2_24 = true
        end
      end
      return r2_24
    end)
    local r7_23 = nil
    for r12_23, r13_23 in ipairs(r6_23) do
      if ShopUtils:GetShopItemCanShow(r13_23.ShopItemId) and ShopUtils:GetShopItemPurchaseLimit(r13_23.ShopItemId) ~= 0 then
        r7_23 = r13_23
        break
      end
    end
    -- close: r8_23
    if not r7_23 then
      return false
    end
    local r8_23 = r7_23.ShopItemId
    local r9_23 = r7_23.SubTabId
    local r10_23 = DataMgr.ShopTabSub[r9_23].MainTabId
    if not r5_23 then
      r5_23 = {}
    end
    local function r11_23()
      -- line: [600, 603] id: 25
      r0_23:CloseFrontDialog()
      r0_23:JumpToShopPage(r10_23, r9_23, r8_23, r2_23, r5_23.CallBack, r5_23.CallBackObj)
    end
    local r12_23 = GWorld:GetAvatar()
    if not r12_23 then
      return 
    end
    local function r13_23(r0_26, r1_26)
      -- line: [610, 647] id: 26
      if r0_26.IsInteractive == true then
        local r2_26 = DataMgr.ShopTabMain[r10_23]
        local r3_26 = DataMgr.ShopTabSub[r9_23]
        local r4_26 = false
        if r2_26.ConditionId and not r12_23.CheckUIUnlocked(r12_23, r2_26.ConditionId) then
          if r3_26.UnlockHide then
            return false
          end
          r0_26.IsInteractive = false
          r0_26.IsUnLock = false
          r0_26.Switch_Type:SetActiveWidgetIndex(1)
          function r0_26.JumpFunc()
            -- line: [623, 625] id: 27
            r12_23.CheckUIUnlocked(r12_23, r2_26.ConditionId, true)
          end
          r4_26 = true
        end
        if not r4_26 and r3_26.ConditionId and not r12_23.CheckUIUnlocked(r12_23, r3_26.ConditionId) then
          if r3_26.UnlockHide then
            return false
          end
          r0_26.IsInteractive = false
          r0_26.IsUnLock = false
          r0_26.Switch_Type:SetActiveWidgetIndex(1)
          function r0_26.JumpFunc()
            -- line: [639, 641] id: 28
            r12_23.CheckUIUnlocked(r12_23, r3_26.ConditionId, true)
          end
          r4_26 = true
        end
        -- close: r2_26
      end
    end
    local r14_23 = DataMgr.ShopTabMain[r10_23]
    local r15_23 = DataMgr.ShopTabSub[r9_23]
    if r14_23.ConditionId and not r12_23.CheckUIUnlocked(r12_23, r14_23.ConditionId) and r15_23.UnlockHide then
      return false
    end
    if r15_23.ConditionId and not r12_23.CheckUIUnlocked(r12_23, r15_23.ConditionId) and r15_23.UnlockHide then
      return false
    end
    if r4_23 then
      r0_23:ProcessAccessItem(r4_23.AccessItem, r4_23.AccessText, r4_23.UIName, r4_23.UIUnlockRuleId, r11_23, r13_23)
    end
    return true, r11_23
  end,
  CreateJumpToImpressionShopAccess = function(r0_29, r1_29, r2_29)
    -- line: [673, 753] id: 29
    if not DataMgr.ImpressionShopItem2Shop[r1_29] then
      return false
    end
    local r3_29 = setmetatable({}, {
      __index = DataMgr.ImpressionShopItem2Shop[r1_29],
    })
    if not r3_29 or next(r3_29) then
      return false
    end
    local r4_29 = GWorld:GetAvatar()
    local r5_29 = DataMgr.ImpressionShopInfo
    local r6_29 = DataMgr.ImpressionShop
    local function r7_29(r0_30, r1_30)
      -- line: [684, 689] id: 30
      local r4_30 = ConditionUtils.CheckCondition(r4_29, r5_29[r0_30].ShopUnlockRuleId)
      local r5_30 = ConditionUtils.CheckCondition(r4_29, r5_29[r1_30].ShopUnlockRuleId)
      return r4_30 and not r5_30
    end
    local function r8_29(r0_31, r1_31, r2_31)
      -- line: [690, 695] id: 31
      if r0_31[r2_31] == nil then
        return false
      end
      return r0_31[r2_31] < r1_31[r2_31]
    end
    table.sort(r3_29, function(r0_32, r1_32)
      -- line: [696, 709] id: 32
      local r2_32 = r6_29[r0_32]
      local r3_32 = r6_29[r1_32]
      if r7_29(r2_32.RegionId, r3_32.RegionId) then
        return true
      elseif r7_29(r3_32.RegionId, r2_32.RegionId) then
        return false
      elseif r8_29(r2_32, r3_32, "RegionId") then
        return true
      elseif r8_29(r3_32, r2_32, "RegionId") then
        return false
      else
        return r8_29(r2_32, r3_32, "ImpressionShopId")
      end
    end)
    local r9_29 = nil
    for r14_29, r15_29 in ipairs(r3_29) do
      if ShopUtils:GetImprShopItemPurchaseLimit(r15_29) ~= 0 then
        r9_29 = r15_29
        break
      end
    end
    -- close: r10_29
    if not r9_29 then
      return false
    end
    local r10_29 = r6_29[r9_29]
    local r11_29 = r10_29.SubTabId
    local r12_29 = DataMgr.ImpressionShopSubTab[r11_29].MainTabId
    local function r13_29()
      -- line: [725, 728] id: 33
      r0_29:CloseFrontDialog()
      r0_29:JumpToImprShop(r12_29, r11_29, r9_29)
    end
    local r14_29 = r2_29.AccessItem
    r14_29.IsUnLock = true
    r14_29.IsInteractive = true
    r14_29.Switch_Type:SetActiveWidgetIndex(0)
    r14_29.JumpFunc = r13_29
    local r15_29 = r5_29[r10_29.RegionId]
    if r15_29.ShopUnlockRuleId and not ConditionUtils.CheckCondition(r4_29, r15_29.ShopUnlockRuleId) then
      r14_29.Switch_Type:SetActiveWidgetIndex(1)
      function r14_29.JumpFunc()
        -- line: [740, 742] id: 34
        UIManager(GWorld.GameInstance):ShowUITip("CommonToastMain", GText("UI_LockTips_ImpShopAccess"))
      end
    end
    local r16_29 = r15_29.ShopName and r2_29.AccessText
    r14_29.Text_Method:SetText(GText(r16_29))
    r14_29.Text_Method02:SetText(GText(r16_29))
    r14_29.Text_Method01:SetText(GText(r16_29))
    return true, r13_29
  end,
  CreateJumpToHome = function(r0_35, r1_35)
    -- line: [756, 779] id: 35
    return true, function()
      -- line: [757, 777] id: 36
      local r0_36 = GWorld:GetAvatar()
      if not r0_36 then
        return 
      end
      local r2_36 = GWorld.GameInstance:GetGameUIManager()
      if r0_36:CheckSubRegionType(nil, CommonConst.SubRegionType.Home) then
        r2_36:ShowUITip("CommonToastMain", GText("UI_TOAST_FORGING_WARNING"))
      end
      r0_35:CloseFrontDialog()
      r2_36:ShowCommonPopupUI(100037, {
        RightCallbackObj = r0_35,
        RightCallbackFunction = function(r0_37, r1_37)
          -- line: [771, 774] id: 37
          UE.UGameplayStatics.GetGameMode(r1_35):HandleLevelDeliver(1, 210101, 1)
        end,
        ForbiddenRightCallbackObj = r0_35,
      }, r1_35)
    end
  end,
  CreateJumpToWalnutBag = function(r0_38, r1_38, r2_38, r3_38)
    -- line: [782, 823] id: 38
    local r4_38 = DataMgr.Item2WalnutIdMap[r2_38][r3_38]
    if not r4_38 then
      DebugPrint("ZDX: ItemId:" .. r3_38 .. " not found in Item2WalnutIdMap Config")
      return 
    end
    local r5_38 = {}
    for r10_38, r11_38 in pairs(r4_38) do
      table.insert(r5_38, r11_38)
    end
    -- close: r6_38
    table.sort(r5_38, function(r0_39, r1_39)
      -- line: [793, 795] id: 39
      return r0_39 < r1_39
    end)
    local r6_38 = GWorld:GetAvatar()
    if r6_38 == nil then
      return 
    end
    for r11_38, r12_38 in ipairs(r5_38) do
      local r13_38 = r0_38:CreateAccessItem(r1_38.ItemWidget, r1_38.AccessKey)
      local r14_38 = DataMgr.Walnut[r12_38]
      local r15_38 = 0
      if r6_38.Walnuts.WalnutBag[r12_38] then
        r15_38 = r6_38.Walnuts.WalnutBag[r12_38]
      end
      local r16_38 = string.format("%s %s%d", GText(r14_38.Name), GText("UI_Bag_Sellconfirm_Hold"), r15_38)
      local function r17_38()
        -- line: [809, 812] id: 40
        r0_38:CloseFrontDialog()
        r0_38:JumpToWalnutBagPage(r14_38.WalnutType + 1, r14_38.WalnutId)
      end
      if r15_38 ~= 0 then
        function r17_38()
          -- line: [815, 818] id: 41
          r0_38:CloseFrontDialog()
          r0_38:JumpToWalnutDungeonPage(r14_38.WalnutType, r12_38)
        end
      end
      r0_38:ProcessAccessItem(r13_38, r16_38, r1_38.UIName, r1_38.UIUnlockRuleId, r17_38)
      r1_38.ItemWidget.Method:AddChild(r13_38)
      -- close: r13_38
      -- close: r11_38
    end
    -- close: r7_38
  end,
  CreateJumpToForge = function(r0_42, r1_42, r2_42, r3_42, r4_42)
    -- line: [826, 861] id: 42
    if not DataMgr.Item2DraftIdMap[r2_42] or not DataMgr.Item2DraftIdMap[r2_42][r3_42] or not DataMgr.Item2DraftIdMap[r2_42][r3_42].DraftIds then
      return false
    end
    local r6_42 = GWorld.GameInstance:GetGameUIManager()
    local r7_42 = DataMgr.Item2DraftIdMap[r2_42][r3_42].DraftIds[1]
    local function r8_42()
      -- line: [833, 851] id: 43
      local r1_43 = GWorld:GetAvatar().Drafts
      if not r1_43 or not r1_43[r7_42] then
        r6_42:ShowUITip(UIConst.Tip_CommonToast, GText("Forge_InterfaceJump_Locked"))
        return 
      end
      r0_42:CloseFrontDialog()
      local r2_43 = r6_42:GetUI("ForgeCompenduim")
      if r2_43 then
        r2_43:Close()
      end
      r0_42:JumpToForgePageDraftId(r7_42)
    end
    local r9_42 = require("Blueprints.UI.Forge.ForgeDataModel")
    if r9_42 then
      local r10_42 = r9_42:GetMaxProduceNumByDraftId(r7_42)
      if r10_42 then
        r4_42 = string.format(GText("MAIN_UI_FORGE02"), r10_42)
      end
    end
    return true, r8_42, r4_42
  end,
  CreateJumpToHardBoss = function(r0_44, r1_44, r2_44)
    -- line: [864, 959] id: 44
    local r3_44 = nil
    local r4_44 = false
    local r5_44 = false
    local r6_44 = false
    local r7_44 = GWorld:GetAvatar()
    if r7_44 then
      if r2_44 and r2_44.UIUnlockRuleId then
        r4_44 = r7_44:CheckUIUnlocked(r2_44.UIUnlockRuleId)
      end
      local r8_44 = {}
      for r13_44, r14_44 in pairs(DataMgr.HardbossMain) do
        for r19_44, r20_44 in pairs(r14_44.DifficultyId) do
          table.insert(r8_44, r20_44)
        end
        -- close: r15_44
      end
      -- close: r9_44
      local r9_44 = DataMgr.HardBossDifficulty
      local r10_44 = {}
      for r15_44, r16_44 in pairs(r8_44) do
        table.insert(r10_44, r9_44[r16_44])
      end
      -- close: r11_44
      table.sort(r10_44, function(r0_45, r1_45)
        -- line: [886, 888] id: 45
        return r0_45.DifficultyID < r1_45.DifficultyID
      end)
      for r15_44, r16_44 in ipairs(r10_44) do
        if not r5_44 then
          local r18_44 = UIUtils.GetDynamicRewardInfo(r16_44.DifficultyReward)
          if r18_44 then
            local r19_44 = DataMgr.RewardView[r18_44.RewardView]
            if r19_44 then
              local r20_44 = r19_44.Id and {}
              for r24_44 = 1, #r20_44, 1 do
                if r1_44 == r20_44[r24_44] then
                  r3_44 = r16_44.DifficultyID
                  if r7_44:CheckHardBossCondition(r16_44.DifficultyID) then
                    r5_44 = true
                    break
                  end
                end
              end
            end
          end
        else
          break
        end
      end
      -- close: r11_44
    end
    if r3_44 then
      r6_44 = true
    else
      r6_44 = false
    end
    if not r6_44 then
      return false
    end
    local function r8_44()
      -- line: [922, 942] id: 46
      if not (r4_44 and r5_44) then
        GWorld.GameInstance:GetGameUIManager():ShowUITip(UIConst.Tip_CommonToast, GText("Toast_Access_HardBossUnlock"))
        return 
      end
      local r1_46 = nil
      if r3_44 then
        for r6_46, r7_46 in pairs(DataMgr.HardbossMain) do
          for r12_46, r13_46 in pairs(r7_46.DifficultyId) do
            if r13_46 == r3_44 then
              r1_46 = r7_46.HardBossId
            end
          end
          -- close: r8_46
        end
        -- close: r2_46
      end
      if r1_46 then
        r0_44:JumpToStyleOfPlaySubUI("HardBossMain", r1_46)
      end
    end
    local function r9_44(r0_47, r1_47)
      -- line: [943, 952] id: 47
      r0_47.IsUnLock = r4_44 and r5_44
      if r0_47.IsUnLock then
        r0_47.IsInteractive = true
        r0_47.Switch_Type:SetActiveWidgetIndex(0)
      else
        r0_47.IsInteractive = false
        r0_47.Switch_Type:SetActiveWidgetIndex(1)
      end
    end
    if r2_44 then
      r0_44:ProcessAccessItem(r2_44.AccessItem, r2_44.AccessText, r2_44.UIName, r2_44.UIUnlockRuleId, r8_44, r9_44)
    end
    return true
  end,
  CreateJumpToAbyss = function(r0_48, r1_48, r2_48)
    -- line: [962, 1029] id: 48
    local r3_48 = false
    local r4_48 = GWorld:GetAvatar()
    if r4_48 then
      local r5_48 = r4_48.CurrentAbyssSeasonId
      if r5_48 and DataMgr.AbyssSeasonList[r5_48] then
        local r6_48 = DataMgr.AbyssSeasonList[r5_48].EventId
        if r6_48 and DataMgr.EventPortal[r6_48] then
          local r7_48 = DataMgr.EventPortal[r6_48].RewardPreview
          if r7_48 and DataMgr.RewardView[r7_48] then
            local r8_48 = DataMgr.RewardView[r7_48]
            if r8_48 then
              local r9_48 = r8_48.Id and {}
              for r13_48 = 1, #r9_48, 1 do
                if r1_48 == r9_48[r13_48] then
                  r3_48 = true
                  break
                end
              end
            end
          end
        end
      end
    end
    if not r3_48 then
      return false
    end
    local function r5_48()
      -- line: [991, 1022] id: 49
      local r0_49 = nil
      if r4_48 and r4_48.Abysses then
        local r1_49 = {}
        local r2_49 = DataMgr.AbyssSeason
        for r7_49, r8_49 in pairs(r2_49) do
          if r4_48.Abysses[r7_49] and (not r4_48.Abysses[r7_49].AbyssSeasonId or r4_48.Abysses[r7_49].AbyssSeasonId == r4_48.CurrentAbyssSeasonId) then
            table.insert(r1_49, r7_49)
          end
        end
        -- close: r3_49
        table.sort(r1_49, function(r0_50, r1_50)
          -- line: [1009, 1011] id: 50
          return r2_49[r0_50].Order < r2_49[r1_50].Order
        end)
        for r7_49, r8_49 in ipairs(r1_49) do
          if not r4_48.Abysses[r8_49]:IsLocked() then
            r0_49 = r8_49
          end
        end
        -- close: r3_49
        -- close: r1_49
      end
      if r0_49 then
        r0_48:JumpToAbyssMain(r0_49, false, false)
      end
    end
    if r2_48 then
      r0_48:ProcessAccessItem(r2_48.AccessItem, r2_48.AccessText, r2_48.UIName, r2_48.UIUnlockRuleId, r5_48)
    end
    return true
  end,
  JumpToDungeonPage = function(r0_51, r1_51, r2_51, r3_51, r4_51)
    -- line: [1043, 1127] id: 51
    local r6_51 = GWorld.GameInstance:GetGameUIManager()
    r1_51 = tonumber(r1_51)
    r2_51 = tonumber(r2_51)
    r0_51:CloseFrontDialog()
    local r7_51 = USubsystemBlueprintLibrary.GetWorldSubsystem(GWorld.GameInstance, UGameFlowManager)
    local r8_51 = r7_51:CreateFlow("OpenSystemUI")
    r8_51.OnBegin:Add(r8_51, function()
      -- line: [1053, 1125] id: 52
      local r0_52 = r6_51:GetUIObj("StyleOfPlay")
      if not r0_52 then
        r0_52 = r6_51:LoadUINew("StyleOfPlay")
        r6_51:AddToJumpPageDeque(r0_52)
        r6_51:AddFlow("StyleOfPlay", r8_51)
      else
        r6_51:PlaceJumpUIToTop(r0_52, "StyleOfPlay")
        r7_51:RemoveFlow(r8_51)
      end
      r0_52.IsOpenSelectLevel = false
      local r1_52 = r0_52:OpenSubUI("DungeonSelect")
      local r2_52 = DataMgr.Dungeon2Select
      if r1_52.CurSelectedDungeonId == r1_51 then
        return 
      end
      local r3_52 = r2_52[r1_51] and DataMgr.Dungeon2SubDungeon[r1_51] and r2_52[DataMgr.Dungeon2SubDungeon[r1_51]]
      r1_52.PlayEntry = r0_52
      if not r4_51 then
        r1_52.IsFromJump = true
      end
      local r4_52 = nil
      local r5_52 = nil
      if r2_51 == Const.DeputeType.NightFlightManualDepute then
        r4_52 = DataMgr.ModDungeonMonReward[r3_51].DungeonList
        r5_52 = DataMgr.PlaySubTab.DeputeNightBook.SubTabName
        r1_52:SetNightFlightManualRewardView(DataMgr.ModDungeonMonReward[r3_51].DungeonRewardView)
      else
        r4_52 = DataMgr.SelectDungeon[r3_52].DungeonList
        r5_52 = DataMgr.PlaySubTab.NewDeputeRoot.SubTabName
      end
      r1_52:InitLevelList(r4_52, r1_51, r2_51)
      r0_52:InitOtherPageTab({
        DynamicNode = {
          "Back",
          "ResourceBar",
          "BottomKey"
        },
        BottomKeyInfo = {
          {
            GamePadInfoList = {
              {
                Type = "Add",
              }
            },
            Desc = GText("UI_CTL_DeputeInfo"),
            bLongPress = false,
          },
          {
            KeyInfoList = {
              {
                Type = "Text",
                Text = "Esc",
                ClickCallback = r1_52.OnReturnKeyDown,
                Owner = r1_52,
              }
            },
            GamePadInfoList = {
              {
                Type = "Img",
                ImgShortPath = "B",
                Owner = r1_52,
              }
            },
            Desc = GText("UI_BACK"),
          }
        },
        OwnerPanel = r1_52,
        BackCallback = r1_52.OnReturnKeyDown,
        StyleName = "Text",
        TitleName = GText(r5_52),
        InfoCallback = r1_52.ShowIntro,
      }, nil, true)
    end)
    r7_51:AddFlow(r8_51)
  end,
  JumpToWalnutDungeonPage = function(r0_53, r1_53, r2_53)
    -- line: [1130, 1210] id: 53
    local r3_53 = GWorld:GetAvatar()
    if r3_53 == nil then
      return 
    end
    local r4_53 = nil
    r0_53.ValidWalnutDungeons = r3_53.Walnuts.ValidWalnutDungeons
    for r9_53, r10_53 in pairs(r0_53.ValidWalnutDungeons) do
      if r9_53 == r1_53 then
        r4_53 = r10_53
        break
      end
    end
    -- close: r5_53
    if not r4_53 then
      return 
    end
    table.sort(r4_53, function(r0_54, r1_54)
      -- line: [1147, 1156] id: 54
      local r2_54 = DataMgr.Dungeon[r0_54]
      local r3_54 = DataMgr.Dungeon[r1_54]
      if not r2_54 or not r3_54 then
        return false
      end
      return r2_54.DungeonLevel < r3_54.DungeonLevel
    end)
    local r6_53 = GWorld.GameInstance:GetGameUIManager()
    local r7_53 = r6_53:GetUIObj("StyleOfPlay")
    if not r7_53 then
      r7_53 = r6_53:LoadUINew("StyleOfPlay")
      r6_53:AddToJumpPageDeque(r7_53)
    else
      r6_53:PlaceJumpUIToTop(r7_53, "StyleOfPlay")
    end
    if not r7_53 then
      DebugPrint("ShiLei: JumpToWalnutDungeonPage Failed to load StyleOfPlay UI")
      return 
    end
    r7_53.IsOpenSelectLevel = false
    local r8_53 = r7_53:OpenSubUI("DungeonSelect")
    r8_53.PlayEntry = r7_53
    local r10_53 = DataMgr.Dungeon[r4_53[1]]
    r8_53:SetWalnutType(DataMgr.WalnutType[r1_53])
    r8_53:SetWalnutTitleMatColor(r1_53)
    r8_53:InitLevelList(r4_53, r10_53.DungeonID, Const.DeputeType.WalnutDepute, r2_53)
    r7_53:InitOtherPageTab({
      DynamicNode = {
        "Back",
        "ResourceBar",
        "BottomKey"
      },
      BottomKeyInfo = {
        {
          GamePadInfoList = {
            {
              Type = "Add",
            }
          },
          Desc = GText("UI_CTL_DeputeInfo"),
          bLongPress = false,
        },
        {
          KeyInfoList = {
            {
              Type = "Text",
              Text = "Esc",
              ClickCallback = r8_53.OnReturnKeyDown,
              Owner = r8_53,
            }
          },
          GamePadInfoList = {
            {
              Type = "Img",
              ImgShortPath = "B",
              Owner = r8_53,
            }
          },
          Desc = GText("UI_BACK"),
        }
      },
      OwnerPanel = r8_53,
      BackCallback = r8_53.OnReturnKeyDown,
      StyleName = "Text",
      TitleName = GText("UI_Dungeon_Tab_WalnutDungeon"),
    }, nil, true)
  end,
  JumpToStyleOfPlaySubUI = function(r0_55, r1_55, ...)
    -- line: [1213, 1231] id: 55
    local r3_55 = GWorld.GameInstance:GetGameUIManager()
    r0_55:CloseFrontDialog()
    local r4_55 = r3_55:GetUIObj("StyleOfPlay")
    if not r4_55 then
      r4_55 = r3_55:LoadUINew("StyleOfPlay")
      r3_55:AddToJumpPageDeque(r4_55)
    else
      r3_55:PlaceJumpUIToTop(r4_55, "StyleOfPlay")
    end
    local r5_55 = r4_55:OpenSubUI(r1_55)
    if r5_55.SubUIJumpFunc then
      r5_55:SubUIJumpFunc(...)
    end
  end,
  JumpToRougeMain = function(r0_56, r1_56)
    -- line: [1234, 1264] id: 56
    local r3_56 = GWorld.GameInstance:GetGameUIManager()
    r0_56:CloseFrontDialog()
    if not r1_56 then
      r1_56 = "NormalJump"
    end
    local r4_56 = r3_56:GetUIObj("StyleOfPlay")
    if not r4_56 then
      r4_56 = r3_56:LoadUINew("StyleOfPlay")
      if r1_56 == "NormalJump" then
        r3_56:AddToJumpPageDeque(r4_56)
      end
    else
      r3_56:PlaceJumpUIToTop(r4_56, "StyleOfPlay")
    end
    r4_56.IsOpenSelectLevel = false
    local r5_56 = r4_56:OpenSubUI("RougeMain")
    if r5_56 then
      if r5_56.InDifficultySelect then
        r5_56:BackToRougeMain()
        r5_56:SetJumpType(r1_56)
      else
        r5_56:InitTable(r1_56)
      end
    end
  end,
  JumpToAbyssLevelInfoPage = function(r0_57, r1_57, r2_57, r3_57)
    -- line: [1266, 1272] id: 57
    local r5_57 = GWorld.GameInstance:GetGameUIManager()
    local r6_57 = r5_57:LoadUINew("AbyssMain", r1_57, true)
    r5_57:AddToJumpPageDeque(r6_57)
    r6_57:OpenSubUI({
      Idx = "AbyssSelect",
    }, false, r1_57, r2_57, r3_57)
  end,
  JumpToTryOut = function(r0_58, r1_58, r2_58, r3_58)
    -- line: [1274, 1285] id: 58
    local r5_58 = GWorld.GameInstance:GetGameUIManager()
    local r6_58 = USubsystemBlueprintLibrary.GetWorldSubsystem(GWorld.GameInstance, UGameFlowManager)
    local r7_58 = r6_58:CreateFlow("OpenSystemUI")
    r7_58.OnBegin:Add(r7_58, function()
      -- line: [1279, 1283] id: 59
      r5_58:AddToJumpPageDeque(r5_58:LoadUINew("ActivityMain", nil, r1_58, r2_58, r3_58))
      r5_58:AddFlow("ActivityMain", r7_58)
    end)
    r6_58:AddFlow(r7_58)
  end,
  JumpToPaotai = function(r0_60, r1_60, r2_60)
    -- line: [1287, 1303] id: 60
    local r4_60 = GWorld.GameInstance:GetGameUIManager()
    local r5_60 = USubsystemBlueprintLibrary.GetWorldSubsystem(GWorld.GameInstance, UGameFlowManager)
    local r6_60 = r5_60:CreateFlow("OpenSystemUI")
    r6_60.OnBegin:Add(r6_60, function()
      -- line: [1292, 1301] id: 61
      r4_60:AddToJumpPageDeque(r4_60:LoadUINew("ActivityMain", nil, r1_60))
      local r2_61 = DataMgr.EventPortal[DataMgr.PaotaiEventConstant.PaotaiGameEventId.ConstantValue]
      if r2_61.JumpUIId then
        r3_0:JumpToTargetPageByJumpId(r2_61.JumpUIId, r2_60)
      end
      r4_60:AddFlow("ActivityMain", r6_60)
    end)
    r5_60:AddFlow(r6_60)
  end,
  JumpToFeinaEvent = function(r0_62, r1_62)
    -- line: [1305, 1321] id: 62
    local r3_62 = GWorld.GameInstance:GetGameUIManager()
    local r4_62 = USubsystemBlueprintLibrary.GetWorldSubsystem(GWorld.GameInstance, UGameFlowManager)
    local r5_62 = r4_62:CreateFlow("OpenSystemUI")
    r5_62.OnBegin:Add(r5_62, function()
      -- line: [1310, 1319] id: 63
      r3_62:AddToJumpPageDeque(r3_62:LoadUINew("ActivityMain", nil, r1_62))
      local r2_63 = DataMgr.EventPortal[DataMgr.EventConstant.FeinaEventId.ConstantValue]
      if r2_63.JumpUIId then
        r3_0:JumpToTargetPageByJumpId(r2_63.JumpUIId)
      end
      r3_62:AddFlow("ActivityMain", r5_62)
    end)
    r4_62:AddFlow(r5_62)
  end,
  JumpToTempleSolo = function(r0_64, r1_64)
    -- line: [1323, 1339] id: 64
    local r3_64 = GWorld.GameInstance:GetGameUIManager()
    local r4_64 = USubsystemBlueprintLibrary.GetWorldSubsystem(GWorld.GameInstance, UGameFlowManager)
    local r5_64 = r4_64:CreateFlow("OpenSystemUI")
    r5_64.OnBegin:Add(r5_64, function()
      -- line: [1328, 1337] id: 65
      r3_64:AddToJumpPageDeque(r3_64:LoadUINew("ActivityMain", nil, r1_64))
      local r2_65 = DataMgr.EventPortal[108001]
      if r2_65.JumpUIId then
        r3_0:JumpToTargetPageByJumpId(r2_65.JumpUIId)
      end
      r3_64:AddFlow("ActivityMain", r5_64)
    end)
    r4_64:AddFlow(r5_64)
  end,
  JumpToEventPage = function(r0_66, r1_66)
    -- line: [1341, 1364] id: 66
    local r2_66 = tonumber(r1_66)
    local r4_66 = GWorld.GameInstance:GetGameUIManager()
    if not r2_0.IsTabIdValid(r2_66) then
      r4_66:ShowError(36005, 1.5, UIConst.Tip_CommonToast)
      return 
    end
    local r5_66 = USubsystemBlueprintLibrary.GetWorldSubsystem(GWorld.GameInstance, UGameFlowManager)
    local r6_66 = r5_66:CreateFlow("OpenSystemUI")
    r6_66.OnBegin:Add(r6_66, function()
      -- line: [1352, 1362] id: 67
      local r0_67 = r4_66:GetUIObj("ActivityMain")
      if not r0_67 then
        r0_67 = r4_66:LoadUINew("ActivityMain", nil, r2_66)
        r4_66:AddToJumpPageDeque(r0_67)
      else
        r4_66:PlaceJumpUIToTop(r0_67, "ActivityMain")
        r0_67:JumpToTargetTab(r2_66)
      end
    end)
    r5_66:AddFlow(r6_66)
  end,
  JumpToShopPage = function(r0_68, r1_68, r2_68, r3_68, r4_68, r5_68, r6_68)
    -- line: [1371, 1392] id: 68
    assert(DataMgr.Shop[r4_68], "未找到对应类型的商店，", r4_68)
    local r7_68 = DataMgr.Shop[r4_68].ShopUIName
    if not r7_68 then
      DebugPrint("ZDX_未找到对应跳转商店的UIName", r4_68)
      return 
    end
    r1_68 = tonumber(r1_68)
    r2_68 = tonumber(r2_68)
    local r9_68 = GWorld.GameInstance:GetGameUIManager()
    local r10_68 = r9_68:GetUIObj(r7_68)
    if not r10_68 then
      r10_68 = r9_68:LoadUINew(r7_68, r1_68, r2_68, r3_68, r4_68, r5_68, r6_68)
      r9_68:AddToJumpPageDeque(r10_68)
    else
      r9_68:PlaceJumpUIToTop(r10_68, r7_68)
      r10_68:InitShop(r1_68, r2_68, r3_68, r4_68, r5_68, r6_68)
    end
  end,
  JumpToImprShop = function(r0_69, r1_69, r2_69, r3_69)
    -- line: [1398, 1411] id: 69
    r1_69 = tonumber(r1_69)
    r2_69 = tonumber(r2_69)
    local r4_69 = UIManager(GWorld.GameInstance)
    local r5_69 = r4_69:GetUIObj("ImpressionShop")
    if not r5_69 then
      r5_69 = r4_69:LoadUINew("ImpressionShop", r1_69, r2_69, r3_69)
      r4_69:AddToJumpPageDeque(r5_69)
    else
      r4_69:PlaceJumpUIToTop(r5_69, "ImpressionShop")
      r5_69:InitImpressionShop(r1_69, r2_69, r3_69, true)
    end
  end,
  JumpToWalnutBagPage = function(r0_70, r1_70, r2_70)
    -- line: [1414, 1429] id: 70
    local r4_70 = GWorld.GameInstance:GetGameUIManager()
    local r5_70 = r4_70:GetUIObj("WalnutBagMain")
    if r1_70 == nil then
      r1_70 = DataMgr.Walnut[r2_70].WalnutType
    end
    if not r5_70 then
      r5_70 = r4_70:LoadUINew("WalnutBagMain", r1_70, r2_70)
      r4_70:AddToJumpPageDeque(r5_70)
    else
      r4_70:PlaceJumpUIToTop(r5_70, "WalnutBagMain")
      r5_70:InitJumpParams(r1_70, r2_70)
    end
  end,
  JumpToForgePageDraftId = function(r0_71, r1_71)
    -- line: [1432, 1453] id: 71
    local r3_71 = GWorld.GameInstance:GetGameUIManager()
    local r5_71 = GWorld:GetAvatar().Drafts
    if not r5_71 or not r5_71[r1_71] then
      r3_71:ShowUITip(UIConst.Tip_CommonToast, GText("Forge_InterfaceJump_Locked"))
      return 
    end
    local r6_71 = r3_71:GetUIObj("ForgeMain")
    if r6_71 then
      r6_71:NavigateToTargetDraft(r1_71)
      r3_71:PlaceJumpUIToTop(r6_71, "ForgeMain")
    else
      r6_71 = r3_71:LoadUINew("ForgeMain", {
        NotDelayAddListItem = true,
      })
      r3_71:AddToJumpPageDeque(r6_71)
      r6_71:NavigateToTargetDraft(r1_71)
    end
  end,
  JumpToAnglingMap = function(r0_72, r1_72)
    -- line: [1456, 1466] id: 72
    local r3_72 = GWorld.GameInstance:GetGameUIManager()
    if not r3_72:GetUIObj("AnglingMap") then
      r3_72:AddToJumpPageDeque(r3_72:LoadUINew("AnglingMap", r1_72))
    end
  end,
  JumpToImprShopPage = function(r0_73, r1_73)
    -- line: [1469, 1483] id: 73
    local r3_73 = GWorld.GameInstance:GetGameUIManager()
    r0_73:CloseFrontDialog()
    local r4_73 = r1_73
    local r5_73 = 1
    for r11_73, r12_73 in pairs(DataMgr.ImpressionShopMainTab) do
      if r12_73.RegionId == r4_73 then
        r5_73 = r12_73.MainTabId
      end
    end
    -- close: r7_73
    r3_73:AddToJumpPageDeque(r3_73:LoadUINew("ImpressionShop", r5_73, nil, nil, true))
  end,
  JumpToTargetPointWithConfirm = function(r0_74, r1_74, r2_74, r3_74)
    -- line: [1486, 1508] id: 74
    local function r4_74()
      -- line: [1487, 1488] id: 75
    end
    GWorld.GameInstance:GetGameUIManager():ShowCommonPopupUI(math.tointeger(r3_74), {
      LeftCallbackObj = r0_74,
      LeftCallbackFunction = r4_74,
      RightCallbackObj = r0_74,
      RightCallbackFunction = function()
        -- line: [1490, 1495] id: 76
        local r0_76 = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
        if IsValid(r0_76) then
          r0_76:HandleLevelDeliver(UE4.EModeType.ModeRegion, math.tointeger(r1_74), math.tointeger(r2_74), false)
        end
      end,
      CloseBtnCallbackObj = r0_74,
      CloseBtnCallbackFunction = r4_74,
    })
  end,
}
local function r4_0(r0_77)
  -- line: [1510, 1532] id: 77
  local r1_77 = DataMgr.SystemUI[r0_77]
  if r1_77 and r1_77.System then
    local r2_77 = DataMgr.UIUnlockRule[r1_77.System]
    if r2_77 and r2_77.OpenConditionId then
      local r4_77, r5_77 = GWorld:GetAvatar():CheckSystemUICanOpen(r2_77.UIUnlockRuleId)
      if not r4_77 then
        local r7_77 = r2_77.OpenSystemDesc
        if #r2_77.OpenConditionId == #r7_77 then
          for r12_77, r13_77 in pairs(r5_77) do
            UIManager:ShowUITip(UIConst.Tip_CommonToast, r7_77[r13_77])
          end
          -- close: r8_77
        else
          UIManager:ShowUITip(UIConst.Tip_CommonToast, r7_77[1])
        end
        return false
      end
    end
  end
  return true
end
function r3_0.JumpToTargetPageByJumpId(r0_78, r1_78, ...)
  -- line: [1534, 1596] id: 78
  local r2_78 = false
  local r3_78 = DataMgr.InterfaceJump[r1_78]
  if not r3_78 then
    DebugPrint("JumpToTargetPageByJumpId Error, Data not find in InterfaceJump, JumpId is", r1_78)
    return r2_78
  end
  local r5_78 = GWorld.GameInstance:GetGameUIManager()
  if not ConditionUtils.CheckCondition(GWorld:GetAvatar(), r3_78.PortalUnlockCondition) then
    r5_78:ShowUITip(UIConst.Tip_CommonToast, r3_78.PortalUnlockTips)
    return r2_78
  end
  local r7_78 = r3_78.JumpParameter1
  if not r4_0(r7_78) then
    return r2_78
  end
  local r8_78 = {}
  for r12_78 = 2, 10, 1 do
    local r13_78 = r3_78["JumpParameter" .. r12_78]
    if r13_78 ~= nil then
      table.insert(r8_78, r13_78)
    end
  end
  for r14_78, r15_78 in ipairs({
    ...
  }) do
    table.insert(r8_78, r15_78)
  end
  -- close: r10_78
  if r3_78.JumpType == "SelfDefinedJump" then
    if type(r0_0[r7_78]) == "function" then
      r0_0[r7_78](table.unpack(r8_78))
      r2_78 = true
    elseif type(r0_78[r7_78]) == "function" then
      r0_78[r7_78](r0_78, table.unpack(r8_78))
      r2_78 = true
    else
      DebugPrint("JumpToTargetPageByJumpId Error, SelfDefined funtion not find, Function Name is", r7_78)
      return r2_78
    end
  else
    r0_78:CloseFrontDialog()
    local r10_78 = r5_78:GetUIObj(r7_78)
    if not r10_78 then
      r10_78 = r5_78:LoadUINew(r7_78, table.unpack(r8_78))
      r5_78:AddToJumpPageDeque(r10_78)
    else
      r5_78:PlaceJumpUIToTop(r10_78, r7_78)
    end
    r2_78 = true
  end
  return r2_78
end
function r3_0.JumpToTargetPage(r0_79, r1_79, ...)
  -- line: [1599, 1615] id: 79
  if not r1_79 then
    DebugPrint("JumpToTargetPage Error, TargetUIName is nil")
    return 
  end
  local r3_79 = GWorld.GameInstance:GetGameUIManager()
  local r4_79 = r3_79:GetUIObj(r1_79)
  if not r4_79 then
    r4_79 = r3_79:LoadUINew(r1_79, ...)
    r3_79:AddToJumpPageDeque(r4_79)
  else
    r3_79:PlaceJumpUIToTop(r4_79, r1_79)
  end
end
function r3_0.JumpToGachaPage(r0_80, r1_80)
  -- line: [1619, 1669] id: 80
  local r3_80 = GWorld.GameInstance:GetGameUIManager()
  local r4_80 = r3_80:GetUIObj("GachaMain")
  local r5_80 = GWorld:GetAvatar()
  r1_80 = tonumber(r1_80)
  local r6_80 = r1_0:GetEffectiveGachaInfo()
  if not r5_80 or not r6_80 or not r6_80[r1_80] or not next(r6_80[r1_80]) then
    r3_80:ShowUITip("CommonToastMain", GText("UI_CharTrial_GachaLocked"), 1.5)
    return 
  end
  local r7_80 = false
  local r8_80 = false
  for r13_80, r14_80 in pairs(r6_80[r1_80]) do
    local r15_80 = r5_80.SkinGachaPool[r14_80]
    if r15_80 and r15_80.Usable == 1 then
      r7_80 = true
    end
    local r16_80 = DataMgr.SkinGacha[r14_80]
    if r16_80 then
      local r17_80 = r16_80.ConditionId
      local r18_80 = true
      if r17_80 then
        r18_80 = ConditionUtils.CheckCondition(r5_80, r17_80)
      end
      if r18_80 then
        r8_80 = true
      end
    end
  end
  -- close: r9_80
  if not r7_80 then
    r3_80:ShowUITip("CommonToastMain", GText("UI_CharTrial_NotInGachaPeriod"), 1.5)
    return 
  end
  if not r8_80 then
    r3_80:ShowUITip("CommonToastMain", GText("UI_CharTrial_GachaLocked"), 1.5)
    return 
  end
  if not r4_80 then
    UIUtils.OpenSystem(CommonConst.GachaEnterId, false, {
      InitGachaTabId = r1_80,
    })
    r3_80:AddToJumpPageDeque(r3_80:GetUI("GachaMain"))
  else
    r3_80:PlaceJumpUIToTop(r4_80, "GachaMain")
    r4_80:InitGachaUI(r1_80)
  end
end
function r3_0.JumpToArmory(r0_81, r1_81)
  -- line: [1672, 1694] id: 81
  local r2_81 = "ArmoryMain"
  if not r4_0(r2_81) then
    return 
  end
  local r3_81 = USubsystemBlueprintLibrary.GetWorldSubsystem(GWorld.GameInstance, UGameFlowManager)
  local r4_81 = r3_81:CreateFlow("OpenSystemUI")
  r4_81.OnBegin:Add(r4_81, function()
    -- line: [1680, 1692] id: 82
    local r0_82 = GWorld.GameInstance:GetGameUIManager()
    local r1_82 = r0_82:GetUIObj(r2_81)
    if not r1_82 then
      r1_82 = r0_82:LoadUINew(r2_81, r1_81)
      r0_82:AddToJumpPageDeque(r1_82)
      r0_82:AddFlow(r2_81, r4_81)
    else
      r0_82:PlaceJumpUIToTop(r1_82, r2_81)
      r3_81:RemoveFlow(r4_81)
    end
  end)
  r3_81:AddFlow(r4_81)
end
function r3_0.JumpToAbyssMain(r0_83, ...)
  -- line: [1696, 1704] id: 83
  local r1_83 = "AbyssMain"
  if not r4_0(r1_83) then
    return 
  end
  r0_83:CloseFrontDialog()
  r0_83:JumpToTargetPage(r1_83, ...)
end
function r3_0.JumpToAbyssMainFromActivity(r0_84)
  -- line: [1706, 1708] id: 84
  r0_84:JumpToAbyssMain(false, false, true)
end
return r3_0
