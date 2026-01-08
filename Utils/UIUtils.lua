-- filename: @C:/Pack/Branch/geili11\Content/Script/Utils\UIUtils.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("EMCache.EMCache")
local r1_0 = require("BluePrints.Common.DataStructure")
local r2_0 = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local r3_0 = require("Utils.TimeUtils")
local r4_0 = require("BluePrints.Client.CustomTypes.SimpleRewardBox")
local r5_0 = require("Utils.SkillUtils")
local r6_0 = require("Utils")
local r7_0 = require("Utils.MiscUtils")
local r8_0 = require("BluePrints.UI.WBP.Bag.BagCommon")
local r9_0 = r1_0.Deque
local r10_0 = Class()
r10_0._components = {
  "BluePrints.Combat.Components.UIHitFeedbackComponent"
}
r10_0.Handled = UE4.UWidgetBlueprintLibrary.Handled()
r10_0.Handle = r10_0.Handled
r10_0.Unhandled = UE4.UWidgetBlueprintLibrary.Unhandled()
function r10_0.ShowGotItemTipsUI(r0_1, r1_1, r2_1, r3_1)
  -- line: [24, 109] id: 1
  local r4_1 = DataMgr[r0_1][r1_1]
  if not r4_1 or not r4_1.Icon then
    return 
  end
  local r5_1 = GWorld.GameInstance
  local r6_1 = UGameplayStatics.GetPlayerCharacter(r5_1, 0)
  local r7_1 = r5_1:GetGameUIManager()
  local r8_1 = r0_0:Get("PickUp", true) and {}
  local r9_1 = false
  if r0_1 == "Pet" then
    r9_1 = true
  end
  if (r0_1 == "Resource" or r0_1 == "Mod") and r4_1.Type ~= "Ordinary" then
    r9_1 = true
  end
  if r4_1.UseEffectType ~= "GetResource" and r4_1.UseEffectType ~= "GetWeapon" and r4_1.UseEffectType ~= "GetMod" or r0_1 == "Pet" then
    local r10_1 = r7_1:GetUIObj("BattleMain")
    if not r10_1 then
      DebugPrint("ZDX BattleMain is nil")
      return 
    end
    local r11_1 = nil
    local r12_1 = r8_1[r0_1]
    if r12_1 ~= nil then
      r12_1 = r8_1[r0_1][r1_1] == nil
    else
      goto label_68	-- block#20 is visited secondly
    end
    if r12_1 or r9_1 then
      if r10_1.Pos_SpecialDrops and not r10_1.Pos_SpecialDrops:HasAnyChildren() then
        r11_1 = r7_1:_CreateWidgetNew("BattleSpecialDrops")
        r10_1.Pos_SpecialDrops:AddChildToOverlay(r11_1)
      elseif r10_1.Pos_Drops then
        r11_1 = r10_1.Pos_SpecialDrops:GetChildAt(0)
      end
      if r11_1 then
        if r11_1.bShowing and r11_1.ItemType ~= "Pet" and r11_1.ItemType == r0_1 and r11_1.ItemId == r1_1 then
          r11_1.ItemCount = r11_1.ItemCount + r2_1
          r11_1.Text_Num:SetText(r11_1.ItemCount)
          return 
        end
        if r11_1.ItemDataInfoDict[r0_1] and r11_1.ItemDataInfoDict[r0_1][r1_1] and not r11_1.ItemDataInfoDict[r0_1][r1_1].IsNew then
          r11_1.ItemDataInfoDict[r0_1][r1_1].ItemCount = r11_1.ItemDataInfoDict[r0_1][r1_1].ItemCount + r2_1
        else
          r11_1.UITopTipsList:PushBack({
            ItemId = r1_1,
            ItemType = r0_1,
          })
          if not r11_1.ItemDataInfoDict[r0_1] then
            r11_1.ItemDataInfoDict[r0_1] = {}
          end
          if not r11_1.ItemDataInfoDict[r0_1][r1_1] then
            r11_1.ItemDataInfoDict[r0_1][r1_1] = {
              ItemId = r1_1,
              ItemType = r0_1,
              ItemCount = r2_1,
              IsNew = r12_1,
              AdditionalParam = r3_1,
            }
          end
        end
      end
      if r8_1[r0_1] == nil then
        r8_1[r0_1] = {}
      end
      if r8_1[r0_1][r1_1] == nil then
        r8_1[r0_1][r1_1] = 1
        r0_0:Set("PickUp", r8_1, true)
      end
      r11_1:PopSpecialDropQueue()
    end
    if not r9_1 and not r12_1 then
      r10_1:SetSubSystemVisibility("Pos_Drops", ESlateVisibility.SelfHitTestInvisible)
      if r10_1.Pos_Drops and not r10_1.Pos_Drops:HasAnyChildren() then
        r11_1 = r7_1:_CreateWidgetNew("BattleNormalDrops")
        r10_1.Pos_Drops:AddChildToOverlay(r11_1)
      elseif r10_1.Pos_Drops then
        r11_1 = r10_1.Pos_Drops:GetChildAt(0)
      end
      if r11_1 then
        table.insert(r11_1.TickWaitingList, {
          ItemId = r1_1,
          ItemCount = r2_1,
          TableName = r0_1,
        })
        r11_1:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      end
    end
  end
end
function r10_0.ShowHudReward(r0_2, r1_2)
  -- line: [119, 179] id: 2
  local r4_2 = GWorld.GameInstance:GetGameUIManager():LoadUINew("CommonHudReward", r0_2, r1_2)
  r4_2:InitRewardInfo(r0_2, r1_2)
  return r4_2
end
function r10_0.ShowHudRewardConvert(r0_3, r1_3)
  -- line: [182, 201] id: 3
  local r2_3 = {}
  for r7_3, r8_3 in pairs(r1_3) do
    local r9_3 = string.match(r7_3, "^(.*)s$")
    if r9_3 then
      r9_3 = r9_3
    end
    for r14_3, r15_3 in pairs(r8_3) do
      local r16_3 = 0
      for r21_3, r22_3 in pairs(r15_3) do
        r16_3 = r16_3 + r22_3
      end
      -- close: r17_3
      table.insert(r2_3, {
        ItemId = r14_3,
        ItemType = r9_3,
        Count = r16_3,
        Rarity = ItemUtils.GetItemRarity(r14_3, r9_3),
      })
    end
    -- close: r10_3
  end
  -- close: r3_3
  return r10_0.ShowHudReward(r0_3, r2_3)
end
function r10_0.ShowGetItemPage(r0_4, r1_4, r2_4, r3_4, r4_4, r5_4, r6_4, r7_4, r8_4, r9_4, r10_4)
  -- line: [212, 223] id: 4
  local r11_4 = USubsystemBlueprintLibrary.GetWorldSubsystem(GWorld.GameInstance, UGameFlowManager)
  local r12_4 = r11_4:CreateFlow("GetItemPage")
  local r13_4 = GWorld.GameInstance:GetGameUIManager()
  r12_4.OnBegin:Add(r12_4, function()
    -- line: [217, 221] id: 5
    local r0_5 = r4_4
    if r0_5 then
      r0_5 = "GetItemPageSP" and "GetItemPage"
    else
      goto label_6	-- block#2 is visited secondly
    end
    r10_0.ShowGetItemPageInternal(r0_4, r1_4, r2_4, r3_4, r4_4, r5_4, r6_4, r7_4, r8_4, r9_4, r10_4)
    r13_4:AddFlow(r0_5, r12_4)
  end)
  r11_4:AddFlow(r12_4)
end
function r10_0.ShowGetItemPageInternal(r0_6, r1_6, r2_6, r3_6, r4_6, r5_6, r6_6, r7_6, r8_6, r9_6, r10_6)
  -- line: [225, 268] id: 6
  if not r0_6 then
    r0_6 = -1
  end
  if not r1_6 then
    r1_6 = -1
  end
  if not r2_6 then
    r2_6 = -1
  end
  if not r5_6 then
    r5_6 = -1
  end
  if not r6_6 then
    r6_6 = -1
  end
  if not r7_6 then
    r7_6 = false
  end
  local r11_6 = "GetItemPage"
  if r4_6 then
    r11_6 = "GetItemPageSP"
  end
  local r13_6 = GWorld.GameInstance:GetGameUIManager()
  local function r14_6()
    -- line: [251, 260] id: 7
    if r0_6 == "Char" and not r9_6 then
      local r1_7 = r1_6
      local r0_7 = DataMgr.Char[r1_7]
      if r0_7 then
        r1_7 = r0_7.RegainCharItemId and nil
      else
        goto label_15	-- block#4 is visited secondly
      end
      local r2_7 = nil	-- notice: implicit variable refs by block#[8]
      if r0_7 then
        r2_7 = r0_7.RegainCharItemNum
        if not r2_7 then
          ::label_21::
          r2_7 = nil
        end
      else
        goto label_21	-- block#7 is visited secondly
      end
      r13_6:LoadUINew(r11_6, "Resource", r1_7, r2_7, r3_6, r5_6, r6_6, r7_6, r10_6)
    else
      r13_6:LoadUINew(r11_6, r0_6, r1_6, r2_6, r3_6, r5_6, r6_6, r7_6, r10_6)
    end
  end
  if r3_6 then
    r10_0.ShowGetCharWeaponPage(r3_6, r14_6, nil, nil, r8_6)
  else
    r10_0.ShowGetCharWeaponPage({
      [r0_6 .. "s"] = {
        [r1_6] = r2_6,
      },
    }, r14_6, nil, nil, r8_6)
  end
end
function r10_0.ShowGetCharWeaponPage(r0_8, r1_8, r2_8, r3_8, r4_8)
  -- line: [274, 353] id: 8
  local r6_8 = GWorld.GameInstance:GetGameUIManager()
  local r7_8 = {
    {
      ShowType = CommonConst.DataType.Skin,
      UIName = "GetCharPage",
    },
    {
      ShowType = CommonConst.DataType.Char,
      UIName = "GetCharPage",
    },
    {
      ShowType = CommonConst.DataType.WeaponSkin,
      UIName = "GetWeaponPage",
    },
    {
      ShowType = CommonConst.DataType.Weapon,
      UIName = "GetWeaponPage",
    },
    {
      ShowType = CommonConst.DataType.Resource,
      UIName = "GetCharPage",
    }
  }
  coroutine.resume(coroutine.create(function()
    -- line: [299, 351] id: 9
    local r0_9 = coroutine.running()
    for r5_9, r6_9 in ipairs(r7_8) do
      local r7_9 = r6_9.ShowType
      local r8_9 = nil
      if r0_8 then
        r8_9 = r0_8[r7_9 .. "s"]
      end
      if r4_8 then
        r8_9 = nil
      end
      if r8_9 and next(r8_9) then
        local r9_9 = {}
        for r14_9, r15_9 in pairs(r8_9) do
          local r16_9 = true
          if r7_9 == CommonConst.DataType.Resource and not ItemUtils.CheckGestureItemResourceNeedDisplay(r14_9) then
            r16_9 = false
          end
          if r7_9 == CommonConst.DataType.Skin and not ItemUtils.CheckGestureSkinNeedDisplay(r14_9) then
            r16_9 = false
          end
          if r16_9 then
            if r3_8 then
              for r20_9 = 1, r15_9, 1 do
                table.insert(r9_9, r14_9)
              end
            else
              table.insert(r9_9, r14_9)
            end
          end
        end
        -- close: r10_9
        if r9_9 and next(r9_9) then
          r6_8:LoadUINew(r6_9.UIName, {
            TargetIdList = r9_9,
            TargetType = r7_9,
            CallbackFunc = function()
              -- line: [338, 340] id: 10
              coroutine.resume(r0_9)
            end,
            bGacha = r3_8,
          })
          coroutine.yield()
        end
      end
    end
    -- close: r1_9
    if r1_8 then
      r1_8(r2_8)
    end
  end))
end
function r10_0.ShowGetItemPageAndOpenBagIfNeeded(r0_11, r1_11, r2_11, r3_11, r4_11, r5_11, r6_11, r7_11, r8_11, r9_11, r10_11)
  -- line: [364, 409] id: 11
  local r11_11 = false
  local r12_11 = nil
  local r13_11 = r10_11 and nil
  local r14_11 = false
  if r3_11 and r3_11.Resources then
    for r19_11, r20_11 in pairs(r3_11.Resources) do
      local r21_11 = DataMgr.Resource[r19_11]
      if r21_11 and r21_11.MaterialClassify == r8_0.ItemTypeToTabId.ConsumableItem then
        r11_11 = true
        r12_11 = tostring(r19_11)
      end
      if r21_11 and r21_11.ResourceSType == "GestureItem" then
        r14_11 = true
      end
    end
    -- close: r15_11
  elseif r1_11 then
    local r15_11 = DataMgr.Resource[r1_11]
    if r15_11 and r15_11.MaterialClassify == r8_0.ItemTypeToTabId.ConsumableItem then
      r11_11 = true
      r12_11 = tostring(r1_11)
    end
    if r15_11 and r15_11.ResourceSType == "GestureItem" then
      r14_11 = true
    end
  end
  if r14_11 and r13_11 == nil then
    r13_11 = GText("UI_GestureItem_Goto_Bag")
  end
  r10_0.ShowGetItemPage(r0_11, r1_11, r2_11, r3_11, r4_11, function()
    -- line: [393, 407] id: 12
    if r11_11 then
      GWorld.GameInstance:GetGameUIManager():ShowCommonPopupUI(100250, {
        LeftCallbackFunction = r5_11,
        RightCallbackFunction = function(r0_13, r1_13, r2_13)
          -- line: [397, 399] id: 13
          r10_0.OpenSystem(2, false, r8_0.ItemTypeToTabId.ConsumableItem, r12_11)
        end,
      })
    elseif r5_11 then
      r5_11()
    end
  end, r6_11, r7_11, r8_11, r9_11, r13_11)
end
function r10_0.GetCommonDragDropOperationClass()
  -- line: [414, 419] id: 14
  if not r10_0._DragDropOperationClass then
    r10_0._DragDropOperationClass = r7_0.LazyLoadClass("/Game/UI/Blueprint/CommonDragDropOperation.CommonDragDropOperation_C", true)
  end
  return r10_0._DragDropOperationClass:get()
end
function r10_0.GetCommonItemContentClass()
  -- line: [424, 429] id: 15
  if not r10_0._ItemObjectClass then
    r10_0._ItemObjectClass = r7_0.LazyLoadClass("/Game/UI/Blueprint/CommonItemContent.CommonItemContent_C", true)
  end
  return r10_0._ItemObjectClass:get()
end
function r10_0.GetMaxScrollOffsetOfListView(r0_16)
  -- line: [432, 449] id: 16
  local r1_16 = r0_16:GetDisplayedEntryWidgets()
  if r1_16:Length() == 0 then
    return 0
  end
  local r2_16 = UIManager(r0_16):GetWidgetRenderSize(r1_16:GetRef(1))
  local r3_16 = UIManager(r0_16):GetWidgetRenderSize(r0_16)
  if r3_16 == 0 then
    r0_16:ForceLayoutPrepass()
    r3_16 = UIManager:GetWidgetRenderSize(r0_16)
  end
  local r4_16 = r0_16:GetNumItems()
  local r5_16 = 0
  if r0_16.Orientation == EOrientation.Orient_Horizontal then
    r5_16 = ((r4_16 + -1) * r0_16.EntrySpacing + r4_16 * r2_16.X - r3_16.X) / r2_16.X
  elseif r0_16.Orientation == EOrientation.Orient_Vertical then
    r5_16 = ((r4_16 + -1) * r0_16.EntrySpacing + r4_16 * r2_16.Y - r3_16.Y) / r2_16.Y
  end
  return r5_16
end
local r11_0 = 0.05
function r10_0.GetListViewContentMaxCount(r0_17, r1_17, r2_17, r3_17)
  -- line: [461, 518] id: 17
  if not r0_17:IsVisible() then
    r6_0.Traceback(WarningTag, LXYTag .. "UIUtils.GetListViewContentMaxCount：ListView必须是可见的")
    return 0
  end
  if not r1_17 then
    r1_17 = r0_17:GetDisplayedEntryWidgets()
  end
  if r1_17:Length() == 0 then
    r6_0.Traceback(WarningTag, LXYTag .. "UIUtils.GetListViewContentMaxCount：ListView必须先生成一个ItemUI才能准确计算个数")
    return 0
  end
  local r4_17 = GWorld.GameInstance:GetGameUIManager()
  local r5_17 = r4_17:GetWidgetRenderSize(r0_17)
  local r6_17 = r0_17:GetParent()
  if r6_17:Cast(UScrollBox) then
    r5_17 = r4_17:GetWidgetRenderSize(r6_17)
  end
  local r7_17 = r4_17:GetWidgetRenderSize(r1_17:GetRef(1).WidgetTree.RootWidget)
  if r0_17.Orientation == EOrientation.Orient_Horizontal then
    r7_17 = r7_17.X + r0_17.EntrySpacing
    r5_17 = r5_17.X
  elseif r0_17.Orientation == EOrientation.Orient_Vertical then
    r7_17 = r7_17.Y + r0_17.EntrySpacing
    r5_17 = r5_17.Y
  end
  local r8_17 = r5_17 / r7_17 - r0_17.EntrySpacing / r7_17
  local r9_17 = math.ceil(r8_17 - r11_0)
  if r2_17 then
    r0_17:SetScrollbarVisibility(UIConst.VisibilityOp.Collapsed)
  else
    r0_17:SetScrollbarVisibility(UIConst.VisibilityOp.Hidden)
  end
  if r0_17.SetControlScrollbarInside then
    r0_17:SetControlScrollbarInside(false)
  end
  local r10_17 = r0_17:GetNumItems()
  if (r11_0 < r9_17 - r8_17 and not r2_17 or r9_17 < r10_17) and r0_17.SetControlScrollbarInside then
    r0_17:SetControlScrollbarInside(true)
  end
  local r11_17 = CommonUtils.GetDeviceTypeByPlatformName()
  if r11_17 == "Mobile" then
    r11_17 = r0_17.bControlScrollbarInside
    if r11_17 then
      r11_17 = r0_17.SetControlScrollbarInside
      if r11_17 then
        r0_17:SetControlScrollbarInside(false)
      end
      r0_17:SetScrollbarVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  end
  if r10_17 > 0 then
    if not r3_17 then
      r11_17 = math.max(0, r9_17 - r10_17) and 0
    else
      goto label_157	-- block#30 is visited secondly
    end
    r0_17:SetEmptyGridItemCount(r11_17)
  else
    DebugPrint(ErrorTag, "GetListViewContentMaxCount: 当前列表没有填充过Item, 请手动调用列表的SetEmptyGridItemCount来设置空态格子数")
  end
  DebugPrint("ListViewCount", r8_17, r9_17)
  return r9_17
end
function r10_0.GetTileViewContentMaxCount(r0_18, r1_18, r2_18, r3_18)
  -- line: [528, 605] id: 18
  local r4_18 = GWorld.GameInstance:GetGameUIManager()
  local r5_18 = r4_18:GetWidgetRenderSize(r0_18)
  local r6_18 = r0_18:GetParent()
  if r6_18:Cast(UScrollBox) then
    r5_18 = r4_18:GetWidgetRenderSize(r6_18)
  end
  local r7_18 = r5_18.X
  local r8_18 = r0_18:GetEntryWidth()
  local r9_18 = r5_18.Y
  local r10_18 = r0_18:GetEntryHeight()
  local r11_18 = 0
  local r12_18 = 0
  if r2_18 then
    r0_18:SetScrollbarVisibility(ESlateVisibility.Collapsed)
  else
    r0_18:SetScrollbarVisibility(ESlateVisibility.Hidden)
  end
  if r0_18.SetControlScrollbarInside then
    r0_18:SetControlScrollbarInside(false)
  end
  if r0_18.Orientation == EOrientation.Orient_Horizontal then
    local r13_18 = r7_18 / r8_18
    r11_18 = math.ceil(r13_18 - r11_0)
    if r11_0 < r11_18 - r13_18 and not r2_18 and r0_18.SetControlScrollbarInside then
      r0_18:SetControlScrollbarInside(true)
    end
    r12_18 = 1
  elseif r0_18.Orientation == EOrientation.Orient_Vertical then
    r11_18 = math.floor((r7_18 - r0_18.ScrollBarDesireSize) / r8_18)
    local r14_18 = r9_18 / r10_18
    r12_18 = math.ceil(r14_18 - r11_0)
    DebugPrint("TileViewCount", r14_18, r12_18)
    if r11_0 < r12_18 - r14_18 and not r2_18 and r0_18.SetControlScrollbarInside then
      r0_18:SetControlScrollbarInside(true)
    end
  end
  if r11_18 * r12_18 < r0_18:GetNumItems() and r0_18.SetControlScrollbarInside then
    r0_18:SetControlScrollbarInside(true)
  end
  if CommonUtils.GetDeviceTypeByPlatformName() == "Mobile" and r0_18.bControlScrollbarInside then
    if r0_18.SetControlScrollbarInside then
      r0_18:SetControlScrollbarInside(false)
    end
    r0_18:SetScrollbarVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  local r13_18 = r0_18:GetNumItems()
  if r13_18 > 0 then
    local r14_18 = 0
    if not r3_18 then
      if r13_18 - r11_18 * r12_18 <= 0 then
        r14_18 = r11_18 * r12_18 - r13_18
      else
        r14_18 = r11_18 - r13_18 % r11_18
      end
    end
    r0_18:SetEmptyGridItemCount(r14_18)
  else
    DebugPrint(ErrorTag, "GetTileViewContentMaxCount: 当前列表没有填充过Item, 请手动调用列表的SetEmptyGridItemCount来设置空态格子数")
  end
  if not r1_18 then
    return r11_18 * r12_18
  elseif r1_18 == "X" then
    return r11_18
  elseif r1_18 == "Y" then
    return r12_18
  elseif r1_18 == "XY" then
    return r11_18, r12_18
  end
  assert(false, "UIUtils.GetTileViewContentMaxCount: Option参数错误")
end
function r10_0.PlayListViewFramingInAnimation(r0_19, r1_19, r2_19)
  -- line: [615, 664] id: 19
  if not r2_19 then
    r2_19 = {
      Interval = nil,
      AnimName = nil,
      Visiblity = nil,
      Callback = nil,
      ListViewOpacity = nil,
      bInteractableInAnim = nil,
    }
  end
  local r3_19 = r2_19.Interval
  if r3_19 ~= nil then
    r3_19 = r2_19.Interval
    if r3_19 ~= 0 then
      r3_19 = r2_19.Interval and 0.0333
    end
  else
    goto label_20	-- block#5 is visited secondly
  end
  local r4_19 = r2_19.AnimName
  if r4_19 ~= nil then
    r4_19 = r2_19.AnimName and "In"
  else
    goto label_27	-- block#8 is visited secondly
  end
  local r5_19 = r9_0.New()
  r1_19:SetRenderOpacity(0)
  if r2_19.bInteractableInAnim == false then
    r1_19:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  end
  local r6_19, r7_19 = r0_19:AddTimer(0.01, function()
    -- line: [624, 661] id: 20
    r1_19:SetRenderOpacity(r2_19.ListViewOpacity and 1)
    local r0_20 = r1_19:GetDisplayedEntryWidgets()
    local r1_20 = 1
    if r1_19:IsA(UTileView) and r1_19.GetNumItemsPerLine then
      r1_20 = r1_19:GetNumItemsPerLine()
    end
    for r6_20 = 1, math.floor(r0_20:Num() / r1_20), 1 do
      local r7_20 = {}
      local r8_20 = (r6_20 + -1) * r1_20
      for r12_20 = 1, r1_20, 1 do
        local r13_20 = r0_20:GetRef(r8_20 + r12_20)
        r13_20:StopAnimation(r13_20[r4_19])
        r13_20:SetVisibility(UIConst.VisibilityOp.Collapsed)
        table.insert(r7_20, r13_20)
      end
      local r9_20 = nil
      local r10_20 = nil
      r9_20, r10_20 = r0_19:AddTimer(r6_20 * r3_19, function()
        -- line: [643, 657] id: 21
        local r0_21 = r2_19.Visibility
        if r0_21 ~= nil then
          r0_21 = r2_19.Visibility and UIConst.VisibilityOp.Visible
        else
          goto label_6	-- block#2 is visited secondly
        end
        for r5_21, r6_21 in ipairs(r7_20) do
          r6_21:SetVisibility(r0_21)
          r6_21:StopAllAnimations()
          r6_21:PlayAnimation(r6_21[r4_19])
        end
        -- close: r1_21
        r5_19:PopFront()
        if r5_19:IsEmpty() then
          if r2_19.bInteractableInAnim == false then
            r1_19:SetVisibility(UIConst.VisibilityOp.Visible)
          end
          if r2_19.Callback then
            r2_19.Callback()
          end
        end
      end, false, 0, nil, true)
      r5_19:PushBack(r10_20)
      -- close: r7_20
    end
    r5_19:PopFront()
  end, false, 0, nil, true)
  r5_19:PushBack(r7_19)
  return r5_19
end
function r10_0.StopListViewFramingInAnimation(r0_22, r1_22)
  -- line: [673, 693] id: 22
  if not r1_22 then
    r1_22 = {
      UIState = nil,
      TimerKeys = nil,
      Visibility = UIConst.VisibilityOp.Visible,
    }
  end
  r0_22:SetRenderOpacity(0)
  local r2_22 = r0_22:GetDisplayedEntryWidgets()
  for r6_22 = 1, r2_22:Length(), 1 do
    local r7_22 = r2_22:GetRef(r6_22)
    if r7_22.Normal then
      r7_22:PlayAnimationForward(r7_22.Normal, 10000)
    end
    local r10_22 = r1_22.Visibility
    if r10_22 then
      r10_22 = r1_22.Visibility and UIConst.VisibilityOp.Visible
    else
      goto label_38	-- block#7 is visited secondly
    end
    r7_22:SetVisibility(r10_22)
  end
  if not r1_22.TimerKeys or not r1_22.UIState then
    return 
  end
  for r7_22, r8_22 in ipairs(r1_22.TimerKeys:ToArr()) do
    if r1_22.UIState:IsExistTimer(r8_22) then
      r1_22.UIState:RemoveTimer(r8_22, true)
    end
  end
  -- close: r3_22
end
function r10_0.UpdateListReddot(r0_23, r1_23, r2_23, r3_23, r4_23, r5_23)
  -- line: [706, 807] id: 23
  -- notice: unreachable block#45
  -- notice: unreachable block#41
  if not r0_23 then
    return 
  end
  local r6_23 = TArray(UObject)
  local r7_23 = TArray(UObject)
  local r8_23 = TArray(UObject)
  r0_23:GetEntryWidgetsVisibilityState(r6_23, r7_23, r8_23)
  r6_23 = r6_23:ToTable()
  r7_23 = r7_23:ToTable()
  r8_23 = r8_23:ToTable()
  local r9_23 = r0_23:GetListItems():ToTable()
  if #r9_23 == 0 then
    return 
  end
  local function r10_23(r0_24)
    -- line: [717, 723] id: 24
    local r1_24 = {}
    for r6_24, r7_24 in ipairs(r0_24) do
      if r7_24.Content then
        table.insert(r1_24, r7_24.Content)
      end
    end
    -- close: r2_24
    return r1_24
  end
  local r11_23 = r10_23(r6_23)
  local r12_23 = r10_23(r7_23)
  local r13_23 = r10_23(r8_23)
  local function r14_23(r0_25)
    -- line: [727, 732] id: 25
    for r5_25, r6_25 in ipairs(r9_23) do
      if r6_25 == r0_25 then
        return r5_25
      end
    end
    -- close: r1_25
    return nil
  end
  local r15_23 = 1
  local r16_23 = #r9_23
  if #r12_23 > 0 or #r11_23 > 0 or #r13_23 > 0 then
    local r17_23 = r11_23[1] and r12_23[1] and r13_23[1]
    local r18_23 = r13_23[#r13_23] and r12_23[#r12_23] and r11_23[#r11_23]
    local function r19_23(r0_26)
      -- line: [738, 743] id: 26
      for r5_26, r6_26 in ipairs(r9_23) do
        if r6_26 == r0_26 then
          return r5_26
        end
      end
      -- close: r1_26
      return nil
    end
    if r17_23 then
      r15_23 = r19_23(r17_23) and 1
    else
      goto label_81	-- block#15 is visited secondly
    end
    if r18_23 then
      r16_23 = r19_23(r18_23) and #r9_23
    else
      goto label_89	-- block#18 is visited secondly
    end
  end
  local r17_23 = {}
  local r18_23 = {}
  for r23_23, r24_23 in ipairs(r9_23) do
    if r15_23 and r23_23 < r15_23 then
      table.insert(r17_23, r24_23)
    elseif r16_23 and r16_23 < r23_23 then
      table.insert(r18_23, r24_23)
    end
  end
  -- close: r19_23
  local r19_23 = {}
  for r24_23, r25_23 in ipairs(r17_23) do
    table.insert(r19_23, r25_23)
  end
  -- close: r20_23
  for r24_23, r25_23 in ipairs(r11_23) do
    table.insert(r19_23, r25_23)
  end
  -- close: r20_23
  local r20_23 = {}
  for r25_23, r26_23 in ipairs(r18_23) do
    table.insert(r20_23, r26_23)
  end
  -- close: r21_23
  local r21_23 = false
  local r22_23 = false
  local r23_23 = false
  local r24_23 = false
  local function r25_23(r0_27)
    -- line: [764, 781] id: 27
    for r5_27, r6_27 in ipairs(r0_27) do
      local r7_27 = false
      local r8_27 = false
      if r5_23 then
        r7_27, r8_27 = r5_23(r6_27)
      end
      local r9_27 = r14_23(r6_27)
      if r9_27 and r15_23 and r16_23 then
        if r9_27 <= r15_23 then
          if r7_27 then
            r21_23 = true
          end
          if r8_27 and not r7_27 then
            r23_23 = true
          end
        elseif r16_23 <= r9_27 then
          if r7_27 then
            r22_23 = true
          end
          if r8_27 and not r7_27 then
            r24_23 = true
          end
        end
      end
    end
    -- close: r1_27
  end
  r25_23(r19_23)
  r25_23(r20_23)
  local r26_23 = "Loop_T"
  local r27_23 = "Loop_D"
  if r0_23.Orientation == UE.EOrientation.Orient_Horizontal then
    r26_23 = "Loop_L"
    r27_23 = "Loop_R"
  end
  local function r28_23(r0_28, r1_28, r2_28)
    -- line: [790, 801] id: 28
    if not r0_28 then
      return 
    end
    local r3_28 = r0_28[r2_28]
    if r1_28 then
      r0_28:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      if r3_28 and not r0_28:IsAnimationPlaying(r3_28) then
        r0_28:PlayAnimation(r3_28, 0, 0)
      end
    else
      r0_28:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
  r28_23(r1_23, r21_23, r26_23)
  local r29_23 = r28_23
  local r30_23 = r3_23
  local r31_23 = nil	-- notice: implicit variable refs by block#[42, 46]
  if not r21_23 then
    r31_23 = r23_23
  else
    r31_23 = false
  end
  r29_23(r30_23, r31_23, r26_23)
  r28_23(r2_23, r22_23, r27_23)
  r29_23 = r28_23
  r30_23 = r4_23
  if not r22_23 then
    r31_23 = r24_23
  else
    r31_23 = false
  end
  r29_23(r30_23, r31_23, r27_23)
end
function r10_0.UpdateScrollBoxReddot(r0_29, r1_29, r2_29, r3_29, r4_29, r5_29)
  -- line: [818, 902] id: 29
  -- notice: unreachable block#22
  -- notice: unreachable block#30
  if not r0_29 then
    return 
  end
  local r6_29 = TArray(UObject)
  local r7_29 = TArray(UObject)
  local r8_29 = TArray(UObject)
  local r9_29 = TArray(UObject)
  local r10_29 = TArray(UObject)
  r0_29:GetChildWidgetsPosInScrollBox(r6_29, r7_29, r8_29, r9_29, r10_29)
  local r11_29 = false
  local r12_29 = false
  local r13_29 = false
  local r14_29 = false
  local function r15_29(r0_30)
    -- line: [832, 850] id: 30
    local r1_30 = false
    local r2_30 = false
    for r7_30, r8_30 in pairs(r0_30) do
      local r9_30 = nil
      local r10_30 = nil
      if r5_29 ~= nil then
        r9_30, r10_30 = r5_29(r8_30)
      else
        r10_30 = false
        r9_30 = false
      end
      if r9_30 then
        r1_30 = true
      end
      if r10_30 then
        r2_30 = true
      end
    end
    -- close: r3_30
    return r1_30, r2_30
  end
  local r16_29 = false
  local r17_29 = false
  r16_29, r17_29 = r15_29(r6_29:ToTable())
  if r16_29 then
    r11_29 = true
  end
  if r17_29 then
    r13_29 = true
  end
  r16_29, r17_29 = r15_29(r7_29:ToTable())
  if r16_29 then
    r11_29 = true
  end
  if r17_29 then
    r13_29 = true
  end
  r16_29, r17_29 = r15_29(r10_29:ToTable())
  if r16_29 then
    r12_29 = true
  end
  if r17_29 then
    r14_29 = true
  end
  local r18_29 = "Loop_T"
  local r19_29 = "Loop_D"
  local r21_29 = EOrientation.Orient_Horizontal
  if r0_29.Orientation == r21_29 then
    r18_29 = "Loop_L"
    r19_29 = "Loop_R"
  end
  local function r20_29(r0_31, r1_31, r2_31)
    -- line: [870, 882] id: 31
    if not r0_31 then
      return 
    end
    local r3_31 = r0_31[r2_31]
    if r1_31 then
      r0_31:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      if r3_31 and not r0_31:IsAnimationPlaying(r3_31) then
        r0_31:PlayAnimation(r3_31, 0, 0)
      end
    else
      r0_31:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
  print("lgc@ :", "bHasFrontReddot", tostring(r11_29), "bHasBackReddot", tostring(r12_29), "bHasFrontNew", tostring(r13_29), "bHasBackNew", tostring(r14_29))
  if r1_29 then
    r20_29(r1_29, r11_29, r18_29)
  end
  if r3_29 then
    if not r11_29 then
      r21_29 = r13_29
    else
      r21_29 = false
    end
    r20_29(r3_29, r21_29, r18_29)
  end
  if r2_29 then
    r20_29(r2_29, r12_29, r19_29)
  end
  if r4_29 then
    if not r12_29 then
      r21_29 = r14_29
    else
      r21_29 = false
    end
    r20_29(r4_29, r21_29, r19_29)
  end
end
function r10_0.UpdateScrollBoxArrow(r0_32, r1_32, r2_32, r3_32)
  -- line: [909, 929] id: 32
  if not r0_32 then
    return 
  end
  local r4_32 = r0_32:GetScrollOffset()
  local r5_32 = r0_32:GetScrollOffsetOfEnd()
  if not r3_32 then
    r3_32 = 0
  end
  if r1_32 then
    if r4_32 > 0 and r3_32 < r4_32 then
      r1_32:SetVisibility(ESlateVisibility.Visible)
    else
      r1_32:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  if r2_32 then
    local r6_32 = r5_32 - r4_32
    if r4_32 < r5_32 and r3_32 < r6_32 then
      r2_32:SetVisibility(ESlateVisibility.Visible)
    else
      r2_32:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
end
function r10_0.UpdateListArrow(r0_33, r1_33, r2_33)
  -- line: [935, 966] id: 33
  if not r0_33 then
    return 
  end
  local r3_33 = r0_33:GetDisplayedEntryWidgets():ToTable()
  local r4_33 = r0_33:GetListItems():ToTable()
  if #r3_33 == 0 or #r4_33 == 0 then
    if r1_33 then
      r1_33:SetVisibility(ESlateVisibility.Collapsed)
    end
    if r2_33 then
      r2_33:SetVisibility(ESlateVisibility.Collapsed)
    end
    return 
  end
  local r5_33 = 100000
  local r6_33 = -1
  for r11_33, r12_33 in ipairs(r3_33) do
    local r14_33 = r0_33:GetIndexForItem(r12_33.Content)
    if r14_33 then
      r5_33 = math.min(r5_33, r14_33)
      r6_33 = math.max(r6_33, r14_33)
    end
  end
  -- close: r7_33
  local r10_33 = nil	-- notice: implicit variable refs by block#[20, 28]
  if r1_33 then
    if r5_33 > 0 then
      r10_33 = ESlateVisibility.Visible
      if not r10_33 then
        ::label_70::
        r10_33 = ESlateVisibility.Collapsed
      end
    else
      goto label_70	-- block#19 is visited secondly
    end
    r1_33:SetVisibility(r10_33)
  end
  if r2_33 then
    if r6_33 < #r4_33 + -1 then
      r10_33 = ESlateVisibility.Visible
      if not r10_33 then
        ::label_89::
        r10_33 = ESlateVisibility.Collapsed
      end
    else
      goto label_89	-- block#27 is visited secondly
    end
    r2_33:SetVisibility(r10_33)
  end
end
function r10_0.UpdateListArrowAndReddot(r0_34, r1_34, r2_34, r3_34, r4_34, r5_34)
  -- line: [976, 1121] id: 34
  if not r0_34 then
    return 
  end
  local r6_34 = r0_34
  local r7_34 = TArray(UObject)
  local r8_34 = TArray(UObject)
  local r9_34 = TArray(UObject)
  r0_34:GetEntryWidgetsVisibilityState(r7_34, r8_34, r9_34)
  r7_34 = r7_34:ToTable()
  r8_34 = r8_34:ToTable()
  r9_34 = r9_34:ToTable()
  local r10_34 = r0_34:GetListItems():ToTable()
  if #r10_34 == 0 then
    return 
  end
  local function r11_34(r0_35)
    -- line: [989, 995] id: 35
    local r1_35 = {}
    for r6_35, r7_35 in ipairs(r0_35) do
      if r7_35.Content then
        table.insert(r1_35, r7_35.Content)
      end
    end
    -- close: r2_35
    return r1_35
  end
  local r12_34 = r11_34(r7_34)
  local r13_34 = r11_34(r8_34)
  local r14_34 = r11_34(r9_34)
  local function r15_34(r0_36)
    -- line: [999, 1004] id: 36
    for r5_36, r6_36 in ipairs(r10_34) do
      if r6_36 == r0_36 then
        return r5_36
      end
    end
    -- close: r1_36
    return nil
  end
  table.sort(r12_34, function(r0_37, r1_37)
    -- line: [1005, 1005] id: 37
    return r15_34(r0_37) < r15_34(r1_37)
  end)
  table.sort(r14_34, function(r0_38, r1_38)
    -- line: [1006, 1006] id: 38
    return r15_34(r1_38) < r15_34(r0_38)
  end)
  local r16_34 = nil
  local r17_34 = 1
  local r18_34 = nil
  local r19_34 = #r10_34
  if #r13_34 > 0 or #r12_34 > 0 or #r14_34 > 0 then
    r16_34 = r12_34[1] and r13_34[1] and r14_34[1]
    r18_34 = r14_34[1] and r13_34[#r13_34] and r12_34[1]
    if r16_34 then
      r17_34 = r15_34(r16_34) and 1
    else
      goto label_91	-- block#15 is visited secondly
    end
    if r18_34 then
      r19_34 = r15_34(r18_34) and #r10_34
    else
      goto label_99	-- block#18 is visited secondly
    end
  end
  local r20_34 = {}
  local r21_34 = {}
  for r26_34, r27_34 in ipairs(r10_34) do
    if r17_34 and r26_34 < r17_34 then
      table.insert(r20_34, r27_34)
    elseif r19_34 and r19_34 < r26_34 then
      table.insert(r21_34, r27_34)
    end
  end
  -- close: r22_34
  local r22_34 = {}
  for r27_34, r28_34 in ipairs(r20_34) do
    table.insert(r22_34, r28_34)
  end
  -- close: r23_34
  for r27_34, r28_34 in ipairs(r12_34) do
    table.insert(r22_34, r28_34)
  end
  -- close: r23_34
  local r23_34 = {}
  for r28_34, r29_34 in ipairs(r21_34) do
    table.insert(r23_34, r29_34)
  end
  -- close: r24_34
  local r24_34 = false
  local r25_34 = false
  local function r26_34(r0_39)
    -- line: [1033, 1048] id: 39
    for r5_39, r6_39 in ipairs(r0_39) do
      local r7_39 = false
      local r8_39 = false
      if r5_34 then
        r7_39 = r5_34(r6_39)
      end
      r8_39 = r15_34(r6_39)
      if r8_39 and r17_34 and r19_34 and r19_34 <= r8_39 and r7_39 then
        r25_34 = true
      end
    end
    -- close: r1_39
    -- warn: not visited block [8]
    -- block#8:
    -- bHasFrontReddot = true
    -- goto label_39
  end
  r26_34(r22_34)
  r26_34(r23_34)
  if not r8_34 or #r8_34 <= 3 then
    if r1_34 then
      r1_34:SetVisibility(ESlateVisibility.Collapsed)
    end
    if r2_34 then
      r2_34:SetVisibility(ESlateVisibility.Collapsed)
    end
    if r3_34 then
      r3_34:SetVisibility(ESlateVisibility.Collapsed)
    end
    if r4_34 then
      r4_34:SetVisibility(ESlateVisibility.Collapsed)
    end
    return 
  end
  if not r10_34 or #r10_34 == 0 then
    if r1_34 then
      r1_34:SetVisibility(ESlateVisibility.Collapsed)
    end
    if r2_34 then
      r2_34:SetVisibility(ESlateVisibility.Collapsed)
    end
    if r3_34 then
      r3_34:SetVisibility(ESlateVisibility.Collapsed)
    end
    if r4_34 then
      r4_34:SetVisibility(ESlateVisibility.Collapsed)
    end
    return 
  end
  if #r10_34 <= #r8_34 then
    if r1_34 then
      r1_34:SetVisibility(ESlateVisibility.Collapsed)
    end
    if r2_34 then
      r2_34:SetVisibility(ESlateVisibility.Collapsed)
    end
    if r3_34 then
      r3_34:SetVisibility(ESlateVisibility.Collapsed)
    end
    if r4_34 then
      r4_34:SetVisibility(ESlateVisibility.Collapsed)
    end
    return 
  end
  local r27_34 = "Loop_T"
  local r28_34 = "Loop_D"
  if r6_34.Orientation == EOrientation.Orient_Horizontal then
    r27_34 = "Loop_L"
    r28_34 = "Loop_R"
  end
  local function r29_34(r0_40, r1_40, r2_40)
    -- line: [1084, 1095] id: 40
    if not r0_40 then
      return 
    end
    local r3_40 = r0_40[r2_40]
    if r1_40 then
      r0_40:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      if r3_40 and not r0_40:IsAnimationPlaying(r3_40) then
        r0_40:PlayAnimation(r3_40, 0, 0)
      end
    else
      r0_40:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
  local r30_34 = r17_34 > 1
  local r31_34 = r19_34 < #r10_34
  if not r18_34 or r18_34.IsEmpty then
    r31_34 = false
  end
  if r1_34 then
    r29_34(r1_34, r24_34, r27_34)
  end
  local r35_34 = nil	-- notice: implicit variable refs by block#[87, 96]
  if r3_34 then
    if r30_34 and not r24_34 then
      r35_34 = ESlateVisibility.Visible
      if not r35_34 then
        ::label_312::
        r35_34 = ESlateVisibility.Collapsed
      end
    else
      goto label_312	-- block#86 is visited secondly
    end
    r3_34:SetVisibility(r35_34)
  end
  if r2_34 then
    r29_34(r2_34, r25_34, r28_34)
  end
  if r4_34 then
    if r31_34 and not r25_34 then
      r35_34 = ESlateVisibility.Visible
      if not r35_34 then
        ::label_334::
        r35_34 = ESlateVisibility.Collapsed
      end
    else
      goto label_334	-- block#95 is visited secondly
    end
    r4_34:SetVisibility(r35_34)
  end
end
function r10_0.BindScrollBoxReddotAndNewClickEvent(r0_41, r1_41, r2_41, r3_41, r4_41, r5_41)
  -- line: [1131, 1199] id: 41
  if not r0_41 then
    return 
  end
  local function r6_41(r0_42, r1_42, r2_42)
    -- line: [1133, 1185] id: 42
    if not r0_42 or not r0_42.Btn_Click then
      return 
    end
    r0_42.Btn_Click.OnClicked:Clear()
    r0_42.Btn_Click.OnHovered:Clear()
    r0_42.Btn_Click.OnHovered:Add(r0_41, function()
      -- line: [1137, 1139] id: 43
      AudioManager(r0_42):PlayUISound(nil, "event:/ui/common/red_point_out_bound", nil, nil)
    end)
    r0_42.Btn_Click.OnClicked:Add(r0_41, function()
      -- line: [1140, 1184] id: 44
      AudioManager(r0_42):PlayUISound(nil, "event:/ui/common/click_btn_small", nil, nil)
      local r0_44 = TArray(UObject)
      local r1_44 = TArray(UObject)
      local r2_44 = TArray(UObject)
      local r3_44 = TArray(UObject)
      local r4_44 = TArray(UObject)
      r0_41:GetChildWidgetsPosInScrollBox(r0_44, r1_44, r2_44, r3_44, r4_44)
      local r5_44 = {}
      if r1_42 then
        for r10_44, r11_44 in ipairs(r0_44:ToTable()) do
          table.insert(r5_44, r11_44)
        end
        -- close: r6_44
        for r10_44, r11_44 in ipairs(r1_44:ToTable()) do
          table.insert(r5_44, r11_44)
        end
        -- close: r6_44
        for r10_44, r11_44 in ipairs(r5_44) do
          local r12_44, r13_44 = r5_41(r11_44)
          if r2_42 and r12_44 or not r2_42 and r13_44 then
            r0_41:ScrollWidgetIntoView(r11_44, true)
            return 
          end
        end
        -- close: r6_44
      else
        for r10_44, r11_44 in ipairs(r3_44:ToTable()) do
          table.insert(r5_44, r11_44)
        end
        -- close: r6_44
        for r10_44, r11_44 in ipairs(r4_44:ToTable()) do
          table.insert(r5_44, r11_44)
        end
        -- close: r6_44
        for r9_44 = #r5_44, 1, -1 do
          local r10_44 = r5_44[r9_44]
          local r11_44, r12_44 = r5_41(r10_44)
          if r2_42 and r11_44 or not r2_42 and r12_44 then
            r0_41:ScrollWidgetIntoView(r10_44, true)
            return 
          end
        end
      end
    end)
  end
  r6_41(r1_41, true, true)
  r6_41(r2_41, false, true)
  r6_41(r3_41, true, false)
  r6_41(r4_41, false, false)
  local function r7_41(r0_45)
    -- line: [1190, 1194] id: 45
    if r0_45 and r0_45.Normal and r0_45.PlayAnimation then
      r0_45:PlayAnimation(r0_45.Normal)
    end
  end
  r7_41(r1_41)
  r7_41(r2_41)
  r7_41(r3_41)
  r7_41(r4_41)
end
function r10_0.GetListViewEntryItemsVisibilityState(r0_46, r1_46, r2_46, r3_46, r4_46, r5_46)
  -- line: [1210, 1291] id: 46
  if not r0_46 then
    return 
  end
  for r9_46 = #r1_46, 1, -1 do
    table.remove(r1_46, r9_46)
  end
  for r9_46 = #r2_46, 1, -1 do
    table.remove(r2_46, r9_46)
  end
  for r9_46 = #r3_46, 1, -1 do
    table.remove(r3_46, r9_46)
  end
  for r9_46 = #r4_46, 1, -1 do
    table.remove(r4_46, r9_46)
  end
  for r9_46 = #r5_46, 1, -1 do
    table.remove(r5_46, r9_46)
  end
  local r6_46 = r0_46:GetListItems():ToTable()
  if #r6_46 == 0 then
    return 
  end
  local r7_46 = TArray(UObject)
  local r8_46 = TArray(UObject)
  local r9_46 = TArray(UObject)
  r0_46:GetEntryWidgetsVisibilityState(r7_46, r8_46, r9_46)
  local function r10_46(r0_47)
    -- line: [1233, 1239] id: 47
    local r1_47 = {}
    for r6_47, r7_47 in ipairs(r0_47) do
      if r7_47.Content then
        table.insert(r1_47, r7_47.Content)
      end
    end
    -- close: r2_47
    return r1_47
  end
  local r11_46 = r10_46(r7_46:ToTable())
  local r12_46 = r10_46(r8_46:ToTable())
  local r13_46 = r10_46(r9_46:ToTable())
  local function r14_46(r0_48)
    -- line: [1243, 1248] id: 48
    for r5_48, r6_48 in ipairs(r6_46) do
      if r6_48 == r0_48 then
        return r5_48
      end
    end
    -- close: r1_48
    return nil
  end
  local r15_46 = 1
  local r16_46 = #r6_46
  if #r12_46 > 0 or #r11_46 > 0 or #r13_46 > 0 then
    local r17_46 = r11_46[1] and r12_46[1] and r13_46[1]
    local r18_46 = r13_46[#r13_46] and r12_46[#r12_46] and r11_46[#r11_46]
    if r17_46 then
      r15_46 = r14_46(r17_46) and 1
    else
      goto label_124	-- block#30 is visited secondly
    end
    if r18_46 then
      r16_46 = r14_46(r18_46) and #r6_46
    else
      goto label_132	-- block#33 is visited secondly
    end
  end
  for r21_46, r22_46 in ipairs(r6_46) do
    if r21_46 < r15_46 then
      table.insert(r1_46, r22_46)
    elseif r16_46 < r21_46 then
      table.insert(r5_46, r22_46)
    else
      local r23_46 = false
      for r28_46, r29_46 in ipairs(r11_46) do
        if r29_46 == r22_46 then
          table.insert(r2_46, r22_46)
          r23_46 = true
          break
        end
      end
      -- close: r24_46
      if not r23_46 then
        for r28_46, r29_46 in ipairs(r12_46) do
          if r29_46 == r22_46 then
            table.insert(r3_46, r22_46)
            r23_46 = true
            break
          end
        end
        -- close: r24_46
      end
      if not r23_46 then
        for r28_46, r29_46 in ipairs(r13_46) do
          if r29_46 == r22_46 then
            table.insert(r4_46, r22_46)
            r23_46 = true
            break
          end
        end
        -- close: r24_46
      end
    end
  end
  -- close: r17_46
end
function r10_0.BindListViewReddotAndNewClickEvent(r0_49, r1_49, r2_49, r3_49, r4_49, r5_49)
  -- line: [1301, 1371] id: 49
  if not r0_49 then
    return 
  end
  local function r6_49(r0_50, r1_50, r2_50)
    -- line: [1303, 1357] id: 50
    if not r0_50 or not r0_50.Btn_Click then
      return 
    end
    r0_50.Btn_Click.OnClicked:Clear()
    r0_50.Btn_Click.OnHovered:Clear()
    r0_50.Btn_Click.OnHovered:Add(r0_49, function()
      -- line: [1307, 1309] id: 51
      AudioManager(r0_50):PlayUISound(nil, "event:/ui/common/red_point_out_bound", nil, nil)
    end)
    r0_50.Btn_Click.OnClicked:Add(r0_49, function()
      -- line: [1310, 1356] id: 52
      AudioManager(r0_50):PlayUISound(nil, "event:/ui/common/click_btn_small", nil, nil)
      local r0_52 = {}
      local r1_52 = {}
      local r2_52 = {}
      local r3_52 = {}
      local r4_52 = {}
      r10_0.GetListViewEntryItemsVisibilityState(r0_49, r0_52, r1_52, r2_52, r3_52, r4_52)
      local r5_52 = {}
      if r1_50 then
        for r10_52, r11_52 in ipairs(r0_52) do
          table.insert(r5_52, r11_52)
        end
        -- close: r6_52
        for r10_52, r11_52 in ipairs(r1_52) do
          table.insert(r5_52, r11_52)
        end
        -- close: r6_52
        for r10_52, r11_52 in ipairs(r5_52) do
          local r12_52, r13_52 = r5_49(r11_52)
          if r2_50 and r12_52 or not r2_50 and r13_52 then
            r0_49:ScrollItemIntoViewWithAnim(r11_52, true, UE4.EDescendantScrollDestination.TopOrLeft)
            return 
          end
        end
        -- close: r6_52
      else
        for r10_52, r11_52 in ipairs(r3_52) do
          table.insert(r5_52, r11_52)
        end
        -- close: r6_52
        for r10_52, r11_52 in ipairs(r4_52) do
          table.insert(r5_52, r11_52)
        end
        -- close: r6_52
        for r9_52 = #r5_52, 1, -1 do
          local r10_52 = r5_52[r9_52]
          local r11_52, r12_52 = r5_49(r10_52)
          if r2_50 and r11_52 or not r2_50 and r12_52 then
            r0_49:ScrollItemIntoViewWithAnim(r10_52, true, UE4.EDescendantScrollDestination.BottomOrRight)
            return 
          end
        end
      end
    end)
  end
  r6_49(r1_49, true, true)
  r6_49(r2_49, false, true)
  r6_49(r3_49, true, false)
  r6_49(r4_49, false, false)
  local function r7_49(r0_53)
    -- line: [1362, 1366] id: 53
    if r0_53 and r0_53.Normal and r0_53.PlayAnimation then
      r0_53:PlayAnimation(r0_53.Normal)
    end
  end
  r7_49(r1_49)
  r7_49(r2_49)
  r7_49(r3_49)
  r7_49(r4_49)
end
function r10_0.OpenSystem(r0_54, r1_54, ...)
  -- line: [1422, 1486] id: 54
  local r2_54 = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if not r2_54 or not IsValid(r2_54) then
    return 
  end
  local r3_54 = DataMgr.MainUI[r0_54]
  local r4_54 = nil
  if r3_54 and r3_54.SystemUIName then
    r4_54 = r3_54.SystemUIName
  else
    return 
  end
  local r5_54 = false
  if r3_54.ShowCondition or r3_54.EscShowCondition then
    r5_54 = true
  end
  if r3_54 and r10_0.CheckCdnHide(r4_54, true) then
    return 
  end
  if not r10_0.CheckSystemCanOpen(DataMgr.SystemUI[r4_54]) then
    return 
  end
  local r7_54 = GWorld.GameInstance:GetGameUIManager()
  local r8_54 = r7_54:GetUI(UIConst.MenuWorld)
  local r9_54 = false
  if type(r1_54) == "boolean" then
    r9_54 = true
  elseif type(r1_54) == "string" then
    r8_54[r1_54] = true
  end
  local r10_54 = r3_54.UIUnlockRuleName
  if r0_54 == CommonConst.ArmoryEnterId then
    local r11_54 = r2_54:CharacterInTag("Skill") and r2_54:IsSafeToCancelSkill()
    if r2_54:CanEnterInteractive() and (r2_54:CharacterInTag("Idle") or r11_54) and r2_54.PlayerAnimInstance and (r2_54.PlayerAnimInstance.IdletagName == "0" or r2_54.PlayerAnimInstance.IdletagName == "EmoIdle") then
      if r10_0.CheckSystemIsUnlock(r4_54, r10_54, r9_54, r5_54, ...) and r11_54 then
        r2_54:StopSkill(UE.ESkillStopReason.ArmoryCancel)
      end
    elseif not r9_54 then
      r7_54:ShowUITip(UIConst.Tip_CommonTop, GText("UI_Toast_Armory_Forbid"))
    else
      r7_54:ShowUITip(UIConst.Tip_CommonToast, GText("UI_Toast_Armory_Forbid"))
    end
  elseif r4_54 == "NpcSwitchMain" then
    if r2_54:IsSeating() then
      r7_54:ShowUITip(UIConst.Tip_CommonTop, GText("UI_Toast_NpcSwitch_Forbid"))
    else
      r10_0.CheckSystemIsUnlock(r4_54, r10_54, r9_54, r5_54, ...)
    end
  elseif r4_54 == "ShopMain" then
    r10_0.CheckSystemIsUnlock(r4_54, r10_54, r9_54, r5_54, nil, nil, nil, "Shop")
  else
    r10_0.CheckSystemIsUnlock(r4_54, r10_54, r9_54, r5_54, ...)
  end
end
function r10_0.CheckSystemCanOpen(r0_55)
  -- line: [1489, 1516] id: 55
  local r1_55 = GWorld.GameInstance:GetGameUIManager()
  local r2_55 = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if r0_55 and r0_55.CombatconditionIdList ~= nil then
    local r3_55 = true
    local r4_55 = nil
    for r9_55, r10_55 in ipairs(r0_55.CombatconditionIdList) do
      if not Battle(r2_55):CheckConditionNew(r10_55, r2_55, nil, "From Guide_Touch:Init") then
        r3_55 = false
        r4_55 = r9_55
        break
      end
    end
    -- close: r5_55
    if not r3_55 then
      if r0_55.ConditiontextList and r0_55.ConditiontextList[r4_55] ~= nil then
        DebugPrint("The UI Load in fail, Because Combatcondition is not met, The CombatconditionId is", r0_55.CombatconditionIdList[r4_55])
        r1_55:ShowUITip(UIConst.Tip_CommonTop, GText(r0_55.ConditiontextList[r4_55]))
      end
      return false
    end
  end
  return true
end
function r10_0.CheckSystemIsUnlock(r0_56, r1_56, r2_56, r3_56, ...)
  -- line: [1519, 1553] id: 56
  ... = ... -- error: untaken top expr
  local r9_56 = GWorld.GameInstance:GetGameUIManager()
  if r1_56 then
    local r10_56 = DataMgr.UIUnlockRule
    local r11_56 = r10_56[r1_56].UIUnlockRuleId
    local r12_56 = r10_56[r1_56].OpenSystemDesc
    local r13_56 = r10_56[r1_56].OpenConditionId
    local r14_56 = GWorld:GetAvatar()
    if r14_56 then
      if r14_56:CheckUIUnlocked(r11_56) then
        local r16_56, r17_56 = r14_56:CheckSystemUICanOpen(r11_56)
        local r4_56 = nil	-- notice: implicit variable refs by block#[4]
        local r5_56 = nil	-- notice: implicit variable refs by block#[4]
        local r6_56 = nil	-- notice: implicit variable refs by block#[4]
        local r7_56 = nil	-- notice: implicit variable refs by block#[4]
        local r8_56 = nil	-- notice: implicit variable refs by block#[4]
        if r16_56 then
          r10_0.FinalOpenSystem(r0_56, r2_56, r3_56, r4_56, r5_56, r6_56, r7_56, r8_56)
          return true
        elseif #r13_56 == #r12_56 then
          for r22_56, r23_56 in pairs(r17_56) do
            r9_56:ShowUITip(UIConst.Tip_CommonToast, r12_56[r23_56])
          end
          -- close: r18_56
        else
          r9_56:ShowUITip(UIConst.Tip_CommonToast, r12_56[1])
        end
      else
        r9_56:ShowUITip(UIConst.Tip_CommonToast, r10_56[r1_56].UIUnlockDesc)
      end
    end
  else
    r10_0.FinalOpenSystem(r0_56, r2_56, r3_56, ...)
    return true
  end
  return false
end
function r10_0.FinalOpenSystem(r0_57, r1_57, r2_57, ...)
  -- line: [1556, 1577] id: 57
  local r3_57 = {
    ...
  }
  if r0_57 == "AnnouncementMain" then
    r10_0.FinalOpenSystemInternal(r0_57, r1_57, r2_57, table.unpack(r3_57))
  else
    local r4_57 = USubsystemBlueprintLibrary.GetWorldSubsystem(GWorld.GameInstance, UGameFlowManager)
    local r5_57 = r4_57:CreateFlow("OpenSystemUI")
    local r6_57 = GWorld.GameInstance:GetGameUIManager()
    r5_57.OnBegin:Add(r5_57, function()
      -- line: [1564, 1574] id: 58
      if IsValid(r6_57:GetUI(r0_57)) then
        DebugPrint("JLY 系统ui重复打开，请检查逻辑, Name is ", r0_57)
        r4_57:RemoveFlow(r5_57)
      else
        r10_0.FinalOpenSystemInternal(r0_57, r1_57, r2_57, table.unpack(r3_57))
        r6_57:AddFlow(r0_57, r5_57)
      end
    end)
    r4_57:AddFlow(r5_57)
    -- close: r4_57
  end
end
function r10_0.FinalOpenSystemInternal(r0_59, r1_59, r2_59, ...)
  -- line: [1580, 1613] id: 59
  local r3_59 = GWorld.GameInstance:GetGameUIManager()
  if r1_59 then
    if r0_59 == "AnnouncementMain" then
      require("BluePrints.UI.WBP.Announcement.AnnounceUtils"):OpenAnnouncementMain(AnnounceCommon.ShowTag.InGame, nil, nil, r3_59:GetUI(UIConst.MenuWorld))
      return 
    end
    r3_59:LoadUINew(r0_59, ...)
    return 
  else
    local r4_59 = r3_59:GetUI("BattleMain")
    if r4_59 ~= nil and r4_59.Char_Skill ~= nil and type(r4_59.Char_Skill.HandleEventByInterrupt) == "function" then
      r4_59.Char_Skill:HandleEventByInterrupt()
    end
    if r4_59 ~= nil and not r1_59 and r2_59 then
      r4_59:PlayOutAnim(nil, nil, r0_59)
      if r3_59:LoadUINew(r0_59, ...) == nil then
        r4_59:RemovePlayInOutSystems(r0_59)
        r4_59:TryRecoverUI()
      end
    else
      r3_59:LoadUINew(r0_59, ...)
    end
  end
end
function r10_0.OpenEsc()
  -- line: [1615, 1641] id: 60
  local r0_60 = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if r0_60 and r0_60.SkillFeature then
    return 
  end
  if r0_60:GetESCMenuForbiddenState() then
    return 
  end
  local r1_60 = GWorld.GameInstance:GetGameUIManager()
  local r2_60 = GWorld:GetAvatar()
  local r3_60 = DataMgr.SystemUI[UIConst.CommonSetUP]
  if r3_60 and r3_60.Params.BlockedUIName then
    for r8_60, r9_60 in ipairs(r3_60.Params.BlockedUIName) do
      local r10_60 = r1_60:GetUIObj(r9_60)
      if r10_60 and r10_60:IsPlayingAnimation() then
        return 
      end
    end
    -- close: r4_60
  end
  if r10_0.IsMenuWorld() then
    r1_60:LoadUINew(UIConst.MenuWorld)
  else
    r1_60:LoadUINew(UIConst.MenuLevel)
  end
end
function r10_0.IsMenuWorld()
  -- line: [1643, 1666] id: 61
  local r0_61 = GWorld.GameInstance:GetCurrentDungeonId()
  local r1_61 = GWorld:GetAvatar()
  if r1_61 and r0_61 and r0_61 <= 0 then
    local r2_61 = r1_61:IsInHardBoss()
    local r3_61 = false
    if r1_61:IsInSpecialQuest() then
      local r4_61 = DataMgr.SpecialQuestConfig[r1_61.SpecialQuestId]
      if r4_61 and r4_61.UniversalConfigId then
        local r5_61 = DataMgr.UniversalConfig[r4_61.UniversalConfigId]
        if r5_61 and r5_61.IfChangeESC then
          r3_61 = true
        end
      end
    end
    if r2_61 or r1_61.SpecialQuestId and r3_61 then
      return false
    else
      return true
    end
  else
    return false
  end
end
function r10_0.PlayBattleMainInAnim()
  -- line: [1668, 1675] id: 62
  local r1_62 = GWorld.GameInstance:GetGameUIManager():GetUI("BattleMain")
  if r1_62 ~= nil then
    r1_62:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r1_62:TryRecoverUI()
  end
end
function r10_0.CheckAndPlayBattleMainInAnim(r0_63)
  -- line: [1677, 1687] id: 63
  local r2_63 = GWorld.GameInstance:GetGameUIManager():GetUI("BattleMain")
  if r2_63 ~= nil then
    r2_63:UnLoadSystem(r0_63)
  end
end
function r10_0.CheckIsShouldHandleAnalogInput(r0_64)
  -- line: [1691, 1698] id: 64
  if r10_0.UtilsGetCurrentGamepadName() == "PS" then
    return 0.015 < math.abs(r0_64)
  end
  return true
end
function r10_0.PlayCommonBtnSe(r0_65)
  -- line: [1701, 1704] id: 65
  UE4.UFMODBlueprintStatics.PlayEvent2D(nil, UE4.UFMODBlueprintStatics.FindEventbyName("event:/ui/common/click"))
end
function r10_0.PlayCommonForbiddenBtnSe(r0_66)
  -- line: [1705, 1707] id: 66
  UE4.UFMODBlueprintStatics.PlayEvent2D(nil, UE4.UFMODBlueprintStatics.FindEventbyName("event:/ui/common/click_btn_disable"))
end
function r10_0.GetAllElementTypes()
  -- line: [1710, 1727] id: 67
  if not r10_0.ElementTypes then
    r10_0.ElementTypes = {}
    r10_0.ElementTypeNames = {}
    local r0_67 = {}
    for r5_67, r6_67 in pairs(DataMgr.Attribute) do
      if r6_67.DisplayPriority then
        table.insert(r0_67, r6_67)
      end
    end
    -- close: r1_67
    table.sort(r0_67, function(r0_68, r1_68)
      -- line: [1720, 1720] id: 68
      return r0_68.DisplayPriority < r1_68.DisplayPriority
    end)
    for r5_67, r6_67 in ipairs(r0_67) do
      table.insert(r10_0.ElementTypes, r6_67.ID)
      table.insert(r10_0.ElementTypeNames, "UI_Attr_" .. r6_67.ID .. "_Name")
    end
    -- close: r1_67
  end
  return r10_0.ElementTypes, r10_0.ElementTypeNames
end
function r10_0.GetAllWeaponTags()
  -- line: [1729, 1753] id: 69
  if not r10_0.MeleeTags or not r10_0.RangedTags then
    r10_0.MeleeTags = {}
    r10_0.MeleeTagNames = {}
    r10_0.RangedTags = {}
    r10_0.RangedTagNames = {}
    local r0_69 = {}
    for r5_69, r6_69 in pairs(DataMgr.WeaponTag) do
      if r6_69.WeaponTagfilter == "MeleeType" then
        table.insert(r10_0.MeleeTags, r5_69)
      elseif r6_69.WeaponTagfilter == "RangedType" then
        table.insert(r10_0.RangedTags, r5_69)
      end
    end
    -- close: r1_69
    table.sort(r10_0.MeleeTags)
    table.sort(r10_0.RangedTags)
    for r5_69, r6_69 in ipairs(r10_0.MeleeTags) do
      table.insert(r10_0.MeleeTagNames, DataMgr.WeaponTag[r6_69].WeaponTagTextmap and "")
    end
    -- close: r1_69
    for r5_69, r6_69 in ipairs(r10_0.RangedTags) do
      table.insert(r10_0.RangedTagNames, DataMgr.WeaponTag[r6_69].WeaponTagTextmap and "")
    end
    -- close: r1_69
  end
  return r10_0.MeleeTags, r10_0.MeleeTagNames, r10_0.RangedTags, r10_0.RangedTagNames
end
function r10_0.CanApplyWeaponSkin(r0_70, r1_70)
  -- line: [1755, 1765] id: 70
  local r2_70 = DataMgr.Weapon[r0_70]
  if r2_70 and r2_70.SkinApplicationType then
    for r7_70, r8_70 in pairs(r2_70.SkinApplicationType) do
      if r8_70 == r1_70 then
        return true
      end
    end
    -- close: r3_70
  end
  return false
end
function r10_0.ShowDungeonRewardUI(r0_71, r1_71, r2_71)
  -- line: [1767, 1787] id: 71
  if not r0_71 then
    return 
  end
  if not IsStandAlone(GWorld.GameInstance) and not IsClient(GWorld.GameInstance) then
    return 
  end
  if GWorld.GameInstance:GetTalkContext():HasHiddenGameUI() then
    table.insert(GWorld.GameInstance.CacheShowRewardUIParams, {
      r0_71,
      r1_71,
      r2_71
    })
    return 
  end
  for r8_71, r9_71 in pairs(r0_71) do
    if type(r9_71) == "table" then
      r9_71 = r4_0:GetCount(r9_71)
    end
    r10_0.ShowGotItemTipsUI(r2_71, r8_71, r9_71)
  end
  -- close: r4_71
end
function r10_0.OnGetRewardShowUI(r0_72, r1_72)
  -- line: [1789, 1793] id: 72
  r10_0.ShowDungeonRewardUI(r0_72.Resources, r1_72, "Resource")
  r10_0.ShowDungeonRewardUI(r0_72.Weapons, r1_72, "Weapon")
  r10_0.ShowDungeonRewardUI(r0_72.Mods, r1_72, "Mod")
end
function r10_0.GenRougeBlessingDesc(r0_73, r1_73, r2_73)
  -- line: [1796, 1824] id: 73
  local r3_73 = DataMgr.RougeLikeBlessing[r0_73]
  local r4_73 = DataMgr.Mod[r3_73.BlessingMod]
  local r5_73 = GText(r3_73.Desc)
  if r3_73 then
    for r10_73, r11_73 in pairs(r4_73.AddAttrs and {}) do
      local r12_73 = DataMgr.AttrConfig[r11_73.AttrName]
      if r12_73 then
        local r13_73, r14_73 = r10_0.GenRougeModAttrData(r11_73, r1_73, r12_73, r3_73.BlessingMod)
        local r15_73 = string.find(r14_73, "%%", 1)
        if r15_73 then
          r14_73 = r14_73 .. "%"
        end
        if r2_73 then
          local r16_73, r17_73 = r10_0.GenRougeModAttrData(r11_73, r2_73, r12_73, r3_73.BlessingMod)
          if r15_73 then
            r17_73 = r17_73 .. "%"
          end
          if r14_73 ~= r17_73 then
            r14_73 = r14_73 .. "->" .. r17_73
          end
        end
        r5_73 = string.gsub(r5_73, "#" .. r10_73, r14_73)
      end
    end
    -- close: r6_73
    r5_73 = r10_0.GenRougeModPassiveEffectDesc(r5_73, r4_73, r1_73, r2_73, false, true)
  end
  return r5_73
end
function r10_0.GenRougeBlessingSimpleDesc(r0_74)
  -- line: [1826, 1830] id: 74
  return GText(DataMgr.RougeLikeBlessing[r0_74].SimpleDesc)
end
function r10_0.GenRougeModPassiveEffectDesc(r0_75, r1_75, r2_75, r3_75, r4_75, r5_75)
  -- line: [1832, 1851] id: 75
  if not r2_0 then
    r2_0 = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
  end
  if r3_75 == nil then
    r3_75 = r2_75 and r3_75
  end
  for r10_75, r11_75 in pairs(r1_75.DescValues and {}) do
    local r12_75 = string.match(r11_75, "%%") and ""
    local r13_75 = r2_0:_ModAttrGrowDesc2(r11_75, r2_75, r2_75, r12_75, r4_75, r5_75) and ""
    if r13_75 == "" then
      r13_75 = r2_0:_SkillGrowDesc(r11_75, r2_75, r2_75, r12_75, r4_75, r5_75)
      if r13_75 then
        r13_75 = r13_75
      end
    end
    if r3_75 then
      local r14_75 = r2_0:_ModAttrGrowDesc2(r11_75, r3_75, r3_75, r12_75, r4_75, r5_75) and ""
      if r14_75 == "" then
        r14_75 = r2_0:_SkillGrowDesc(r11_75, r3_75, r3_75, r12_75, r4_75, r5_75)
        if r14_75 then
          r14_75 = r14_75
        end
      end
      if r13_75 ~= r14_75 then
        r13_75 = r13_75 .. "->" .. r14_75
      end
    end
    r0_75 = string.gsub(r0_75, "$" .. r10_75, r13_75)
  end
  -- close: r6_75
  return r0_75
end
function r10_0.GenRougeTreasureDesc(r0_76)
  -- line: [1853, 1882] id: 76
  if not r2_0 then
    r2_0 = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
  end
  local r1_76 = DataMgr.RougeLikeTreasure[r0_76]
  if r1_76 then
    local r2_76 = GText(r1_76.Desc)
    local r3_76 = DataMgr.Mod[r1_76.TreasureMod]
    if not r1_76.ServerBuild and not r1_76.ClientBuild and not r3_76 then
      UE.ARougeLikeManager.ShowRougeLikeError(tostring(r0_76) .. "号宝物不是ServerBuild与ClientBuild，但Mod数据为空请策划检查")
    end
    if r3_76 then
      for r8_76, r9_76 in pairs(r3_76.AddAttrs and {}) do
        local r10_76 = DataMgr.AttrConfig[r9_76.AttrName]
        if r10_76 then
          local r11_76, r12_76 = r10_0.GenRougeModAttrData(r9_76, 0, r10_76, r1_76.TreasureMod)
          r2_76 = string.gsub(r2_76, "#" .. r8_76, r12_76 .. (string.match(r12_76, "%%") and ""))
        end
      end
      -- close: r4_76
      r2_76 = r10_0.GenRougeModPassiveEffectDesc(r2_76, r3_76, 0, nil, false, true)
    end
    return r10_0.GenRougeServerDesc(r2_76, r1_76, 0)
  else
    UE.ARougeLikeManager.ShowRougeLikeError(tostring(r0_76) .. "号宝物数据为空请策划检查")
  end
end
function r10_0.GenRougeServerDesc(r0_77, r1_77, r2_77)
  -- line: [1884, 1892] id: 77
  for r7_77, r8_77 in pairs(r1_77.ServerBuildValue and {}) do
    local r9_77 = string.match(r8_77, "%%") and ""
    local r10_77 = ""
    r0_77 = string.gsub(r0_77, "@" .. r7_77, r5_0.CalcSkillDesc(r8_77, r2_77) .. r9_77)
  end
  -- close: r3_77
  return r0_77
end
function r10_0.GetRealCurrentTreasureGroupNum(r0_78)
  -- line: [1895, 1915] id: 78
  local r1_78 = 0
  if UE.ARougeLikeManager then
    local r2_78 = DataMgr.TreasureGroup
    local r3_78 = DataMgr.RougeLikeTreasure
    if not r3_78[r0_78] or not r3_78[r0_78].TreasureGroup then
      return 0
    end
    local r4_78 = r3_78[r0_78].TreasureGroup
    if not r2_78[r4_78] then
      return 0
    end
    for r9_78, r10_78 in pairs(r2_78[r4_78].ActivateNeed) do
      if UE.ARougeLikeManager.IsTreasureExist(GWorld.GameInstance, r10_78) then
        r1_78 = r1_78 + 1
      end
    end
    -- close: r5_78
    return r1_78
  end
  return r1_78
end
function r10_0.GetCurrentTreasureGroupNum(r0_79)
  -- line: [1917, 1937] id: 79
  local r1_79 = 0
  if UE.ARougeLikeManager then
    local r2_79 = DataMgr.TreasureGroup
    local r3_79 = DataMgr.RougeLikeTreasure
    if not r3_79[r0_79] or not r3_79[r0_79].TreasureGroup then
      return 0
    end
    local r4_79 = r3_79[r0_79].TreasureGroup
    if not r2_79[r4_79] then
      return 0
    end
    for r9_79, r10_79 in pairs(r2_79[r4_79].ActivateNeed) do
      if r10_79 ~= r0_79 and UE.ARougeLikeManager.IsTreasureExist(GWorld.GameInstance, r10_79) then
        r1_79 = r1_79 + 1
      end
    end
    -- close: r5_79
    return r1_79
  end
  return r1_79
end
function r10_0.GetTreasureGroupNum(r0_80)
  -- line: [1939, 1955] id: 80
  local r1_80 = 0
  if UE.ARougeLikeManager then
    local r2_80 = DataMgr.TreasureGroup
    local r3_80 = DataMgr.RougeLikeTreasure
    if not r3_80[r0_80] or not r3_80[r0_80].TreasureGroup then
      return 0
    end
    local r4_80 = r3_80[r0_80].TreasureGroup
    if not r2_80[r4_80] or not r2_80[r4_80].ActivateNeed then
      return 0
    end
    r1_80 = #r2_80[r4_80].ActivateNeed
    return r1_80
  end
  return r1_80
end
function r10_0.GenRougeTreasureSimpleDesc(r0_81)
  -- line: [1958, 1962] id: 81
  return GText(DataMgr.RougeLikeTreasure[r0_81].SimpleDesc)
end
function r10_0.GenRougeTalentDesc(r0_82)
  -- line: [1964, 1983] id: 82
  local r1_82 = DataMgr.RougeLikeTalent[r0_82]
  local r2_82 = DataMgr.Mod[r1_82.TalentMod]
  local r3_82 = GText(r1_82.Desc)
  if r1_82 then
    if r2_82 then
      for r8_82, r9_82 in pairs(r2_82.AddAttrs and {}) do
        local r10_82 = DataMgr.AttrConfig[r9_82.AttrName]
        if r10_82 then
          local r11_82, r12_82 = r10_0.GenRougeModAttrData(r9_82, 0, r10_82, r1_82.TalentMod)
          r3_82 = string.gsub(r3_82, "#" .. r8_82, r12_82 .. (string.match(r12_82, "%%") and ""))
        end
      end
      -- close: r4_82
      r3_82 = r10_0.GenRougeModPassiveEffectDesc(r3_82, r2_82, 0)
    end
    r3_82 = r10_0.GenRougeServerDesc(r3_82, r1_82, 0)
  end
  return r3_82
end
function r10_0.GetLeftTimeStrStyle1(r0_83, r1_83)
  -- line: [1985, 2011] id: 83
  if r0_83 <= r3_0.NowTime() then
    return "TimeOut"
  end
  local r4_83 = UKismetMathLibrary.Subtract_DateTimeDateTime(URuntimeCommonFunctionLibrary.GetDateTimeFromUnixTime(r0_83), URuntimeCommonFunctionLibrary.GetDateTimeFromUnixTime(r1_83 and r3_0.NowTime()))
  local r5_83 = ""
  local r6_83 = 0
  if UKismetMathLibrary.GetDays(r4_83) > 0 then
    r6_83 = r6_83 + 1
    r5_83 = r5_83 .. string.format(GText("UI_SHOP_REMAINTIME_DAY"), UKismetMathLibrary.GetDays(r4_83))
  end
  if UKismetMathLibrary.GetHours(r4_83) > 0 or r6_83 == 1 then
    r6_83 = r6_83 + 1
    r5_83 = r5_83 .. string.format(GText("UI_SHOP_REMAINTIME_HOUR"), UKismetMathLibrary.GetHours(r4_83))
  end
  if UKismetMathLibrary.GetMinutes(r4_83) > 0 and r6_83 < 2 or r6_83 == 1 then
    r6_83 = r6_83 + 1
    r5_83 = r5_83 .. string.format(GText("UI_SHOP_REMAINTIME_MINUTE"), UKismetMathLibrary.GetMinutes(r4_83))
  end
  if UKismetMathLibrary.GetSeconds(r4_83) > 0 and r6_83 < 2 or r6_83 == 1 then
    r6_83 = r6_83 + 1
    r5_83 = r5_83 .. string.format(GText("UI_SHOP_REMAINTIME_SECOND"), UKismetMathLibrary.GetSeconds(r4_83))
  end
  return r5_83
end
function r10_0.GetLeftTimeStrStyle2(r0_84, r1_84)
  -- line: [2013, 2047] id: 84
  if r0_84 == nil or r0_84 <= r3_0.NowTime() then
    return {
      {
        TimeType = "Min",
        TimeValue = 0,
      },
      {
        TimeType = "Sec",
        TimeValue = 0,
      }
    }, 0
  end
  local r4_84 = UKismetMathLibrary.Subtract_DateTimeDateTime(URuntimeCommonFunctionLibrary.GetDateTimeFromUnixTime(r0_84), URuntimeCommonFunctionLibrary.GetDateTimeFromUnixTime(r1_84 and r3_0.NowTime()))
  local r5_84 = {}
  local r6_84 = 0
  local r7_84 = UKismetMathLibrary.GetDays(r4_84)
  if r7_84 > 0 then
    r6_84 = r6_84 + 1
    table.insert(r5_84, {
      TimeType = "Day",
      TimeValue = r7_84,
    })
  end
  local r8_84 = UKismetMathLibrary.GetHours(r4_84)
  if r8_84 > 0 or r6_84 == 1 then
    r6_84 = r6_84 + 1
    table.insert(r5_84, {
      TimeType = "Hour",
      TimeValue = r8_84,
    })
  end
  local r9_84 = UKismetMathLibrary.GetMinutes(r4_84)
  if r6_84 <= 1 then
    r6_84 = r6_84 + 1
    table.insert(r5_84, {
      TimeType = "Min",
      TimeValue = r9_84,
    })
  end
  local r10_84 = UKismetMathLibrary.GetSeconds(r4_84)
  if r10_84 > 0 and r6_84 < 2 or r6_84 == 1 then
    r6_84 = r6_84 + 1
    table.insert(r5_84, {
      TimeType = "Sec",
      TimeValue = r10_84,
    })
  end
  return r5_84, r6_84
end
function r10_0.GenRougeModAttrData(r0_85, r1_85, r2_85, r3_85)
  -- line: [2049, 2057] id: 85
  if not r2_0 then
    r2_0 = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
  end
  local r4_85 = r0_85.Rate ~= nil
  local r5_85 = r2_0:CalcModAttrByLevel(r0_85, r1_85, nil, r3_85)
  return r5_85, CommonUtils.AttrValueToString(r2_85, r5_85, r4_85, true)
end
function r10_0.SwitchGuideHead(r0_86, r1_86)
  -- line: [2059, 2068] id: 86
  local r2_86 = "/Game/UI/Blueprint/EMUIFunctionLibrary"
  local r3_86 = LoadClass(r2_86)
  if r3_86 then
    return r3_86.SwitchGuideHead(r0_86, r1_86)
  else
    DebugPrint("Error: UIFunctionLibClass不存在，路径", r2_86)
    return false
  end
end
function r10_0.ShowActionRecover(r0_87)
  -- line: [2070, 2082] id: 87
end
function r10_0.GetCharName(r0_88)
  -- line: [2085, 2093] id: 88
  if r0_88:IsPlayer() then
    return r0_88:GetNickName()
  elseif r0_88:IsPhantom() then
    return r10_0.GetPhantomName(r0_88)
  end
  return "nil"
end
function r10_0.GetPhantomName(r0_89)
  -- line: [2095, 2131] id: 89
  if not r0_89 or not r0_89:IsPhantom() then
    return "nil"
  end
  local r1_89 = ""
  local r2_89 = DataMgr.BattleChar[r0_89.CurrentRoleId].CharName
  if string.find(DataMgr.TextMap_ContentEN[r2_89].ContentEN, "{nickname") and not IsStandAlone(r0_89) then
    local r3_89 = GameState(r0_89):GetPhantomState(r0_89.Eid)
    if not r3_89 then
      local r4_89 = r0_89.PhantomOwner
      if r4_89 then
        local r5_89 = GameState(r0_89):GetPlayerState(r4_89.Eid)
        if r5_89 and r5_89.PlayerName then
          r1_89 = r5_89.PlayerName
        end
      end
    else
      local r4_89 = r3_89.OwnerEid
      if r4_89 then
        local r5_89 = GameState(r0_89):GetPlayerState(r4_89)
        if r5_89 and r5_89.PlayerName then
          r1_89 = r5_89.PlayerName
        else
          r1_89 = GText(r2_89)
        end
      else
        r1_89 = "<ERROR>"
      end
    end
  else
    r1_89 = GText(r2_89)
  end
  return r1_89
end
function r10_0.UtilsGetCurrentInputType()
  -- line: [2133, 2139] id: 90
  local r0_90 = UGameInputModeSubsystem.GetGameInputModeSubsystem(GWorld.GameInstance)
  if IsValid(r0_90) then
    return r0_90:GetCurrentInputType()
  end
  return ECommonInputType.MouseAndKeyboard
end
function r10_0.IsKeyboardInput()
  -- line: [2141, 2144] id: 91
  local r0_91 = r10_0.UtilsGetCurrentInputType()
  local r1_91 = UE4.ECommonInputType.MouseAndKeyboard
  if r0_91 == r1_91 then
    r1_91 = CommonUtils.GetDeviceTypeByPlatformName() == "PC"
  else
    goto label_12	-- block#2 is visited secondly
  end
  return r1_91
end
function r10_0.IsGamepadInput()
  -- line: [2146, 2149] id: 92
  return r10_0.UtilsGetCurrentInputType() == UE4.ECommonInputType.Gamepad
end
function r10_0.IsMobileInput()
  -- line: [2151, 2153] id: 93
  return CommonUtils.GetDeviceTypeByPlatformName() == "Mobile"
end
function r10_0.IsPCInput()
  -- line: [2155, 2157] id: 94
  return CommonUtils.GetDeviceTypeByPlatformName() == "PC"
end
function r10_0.UtilsGetCurrentGamepadName()
  -- line: [2159, 2168] id: 95
  if CommonUtils.GetDeviceTypeByPlatformName() == "Mobile" then
    return "Generic"
  end
  local r0_95 = UGameInputModeSubsystem.GetGameInputModeSubsystem(GWorld.GameInstance)
  if IsValid(r0_95) then
    return r0_95:GetCurrentGamepadName()
  end
  return "Generic"
end
function r10_0.UtilsGetKeyIconPathInGamepad(r0_96, r1_96)
  -- line: [2172, 2185] id: 96
  if r1_96 == nil then
    r1_96 = r10_0.UtilsGetCurrentGamepadName()
  end
  local r2_96 = nil
  local r3_96 = nil
  local r4_96 = string.gsub(r0_96, " ", "_")
  if r1_96 == "PS" then
    r2_96 = "Texture2D\'/Game/UI/Texture/Dynamic/Atlas/Key/PS5/T_Key_%s.T_Key_%s\'"
  else
    r2_96 = "Texture2D\'/Game/UI/Texture/Dynamic/Atlas/Key/XBOX/T_Key_%s.T_Key_%s\'"
  end
  return string.format(r2_96, r4_96, r4_96)
end
function r10_0.UtilsGetKeyIconPathInGamepadByInstruction(r0_97, r1_97)
  -- line: [2187, 2200] id: 97
  if r1_97 == nil then
    r1_97 = r10_0.UtilsGetCurrentGamepadName()
  end
  local r2_97 = nil
  local r3_97 = nil
  local r4_97 = string.gsub(r0_97, " ", "_")
  if r1_97 == "PS" then
    r2_97 = "Texture2D\'/Game/UI/Texture/Dynamic/Atlas/Instruction/PS5/T_Key_%s.T_Key_%s\'"
  else
    r2_97 = "Texture2D\'/Game/UI/Texture/Dynamic/Atlas/Instruction/XBOX/T_Key_%s.T_Key_%s\'"
  end
  return string.format(r2_97, r4_97, r4_97)
end
function r10_0.GetNoneAccessoryIconPath()
  -- line: [2203, 2205] id: 98
  return "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Forbid.T_Armory_Forbid"
end
function r10_0.TrySubReddotCacheDetail(r0_99, r1_99)
  -- line: [2208, 2215] id: 99
  local r2_99 = tostring(r0_99)
  local r3_99 = ReddotManager.GetLeafNodeCacheDetail(r1_99)
  if r3_99 and r3_99[r2_99] then
    r3_99[r2_99] = false
    ReddotManager.DecreaseLeafNodeCount(r1_99)
  end
end
function r10_0.TryAddReddotCacheDetail(r0_100, r1_100)
  -- line: [2217, 2224] id: 100
  local r2_100 = tostring(r0_100)
  local r3_100 = ReddotManager.GetLeafNodeCacheDetail(r1_100)
  if r3_100 and not r3_100[r2_100] then
    r3_100[r2_100] = true
    ReddotManager.IncreaseLeafNodeCount(r1_100)
  end
end
function r10_0.TrySubReddotCacheDetailNumber(r0_101, r1_101)
  -- line: [2225, 2232] id: 101
  local r2_101 = r0_101
  local r3_101 = ReddotManager.GetLeafNodeCacheDetail(r1_101)
  if r3_101 and r3_101[r2_101] then
    r3_101[r2_101] = false
    ReddotManager.DecreaseLeafNodeCount(r1_101)
  end
end
function r10_0.TryAddReddotCacheDetailNumber(r0_102, r1_102)
  -- line: [2234, 2241] id: 102
  local r2_102 = r0_102
  local r3_102 = ReddotManager.GetLeafNodeCacheDetail(r1_102)
  if r3_102 and not r3_102[r2_102] then
    r3_102[r2_102] = true
    ReddotManager.IncreaseLeafNodeCount(r1_102)
  end
end
function r10_0.SetReddotTreeLeafNodeCount(r0_103, r1_103)
  -- line: [2244, 2253] id: 103
  local r2_103 = ReddotManager.GetTreeNode(r0_103)
  assert(r2_103, "[jiangtianyi]ReddotManager.SetReddotTreeLeafNodeCount: Failed to find leaf node " .. r0_103)
  local r3_103 = r2_103.Count
  if r1_103 < r3_103 then
    ReddotManager.DecreaseLeafNodeCount(r0_103, r3_103 - r1_103)
  elseif r3_103 < r1_103 then
    ReddotManager.IncreaseLeafNodeCount(r0_103, r1_103 - r3_103)
  end
end
function r10_0.GetExcelWeaponTagString(r0_104)
  -- line: [2255, 2270] id: 104
  local r1_104 = DataMgr.BattleChar[r0_104]
  local r2_104 = r1_104 and r1_104.ExcelWeaponTags
  if r2_104 then
    local r3_104 = nil
    if type(r2_104) == "table" then
      r3_104 = GText(DataMgr.WeaponTag[r2_104[1]].WeaponTagTextmap)
      for r7_104 = 2, #r2_104, 1 do
        r3_104 = r3_104 .. "/" .. GText(DataMgr.WeaponTag[r2_104[r7_104]].WeaponTagTextmap)
      end
    else
      r3_104 = GText(DataMgr.WeaponTag[r2_104].WeaponTagTextmap)
    end
    return r3_104
  end
end
function r10_0.GetExcelWeaponTags(r0_105)
  -- line: [2272, 2287] id: 105
  local r1_105 = DataMgr.BattleChar[r0_105]
  local r2_105 = r1_105 and r1_105.ExcelWeaponTags
  local r3_105 = {}
  if r2_105 then
    if type(r2_105) == "table" then
      table.insert(r3_105, r2_105[1])
      for r7_105 = 2, #r2_105, 1 do
        table.insert(r3_105, r2_105[r7_105])
      end
    else
      table.insert(r3_105, r2_105)
    end
    return r3_105
  end
end
function r10_0.GetDispathchColorNameByType(r0_106)
  -- line: [2289, 2299] id: 106
  if r0_106 == "Battle" then
    return "Red"
  elseif r0_106 == "Collect" or r0_106 == "Mine" or r0_106 == "Fish" or r0_106 == "Pet" then
    return "Blue"
  elseif r0_106 == "Benefit" or r0_106 == "Morality" or r0_106 == "Wisdom" or r0_106 == "Empathy" or r0_106 == "Chaos" then
    return "Green"
  elseif r0_106 == "Workaholic" or r0_106 == "Rigorous" or r0_106 == "Skilled" or r0_106 == "Lucky" then
    return "Special"
  end
end
function r10_0.NumberToChinese(r0_107)
  -- line: [2301, 2307] id: 107
  return ({
    "零",
    "一",
    "二",
    "三",
    "四",
    "五",
    "六",
    "七",
    "八",
    "九"
  })[r0_107 + 1]
end
function r10_0.GenAbyssEntryDesc(r0_108, r1_108, r2_108, r3_108)
  -- line: [2309, 2328] id: 108
  if not r2_0 then
    r2_0 = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
  end
  if r3_108 == nil then
    r3_108 = r2_108 and r3_108
  end
  for r8_108, r9_108 in pairs(r1_108 and {}) do
    local r10_108 = string.match(r9_108, "%%") and ""
    local r11_108 = r2_0:_ModAttrGrowDesc2(r9_108, r2_108, r2_108, r10_108) and ""
    if r11_108 == "" then
      r11_108 = r5_0.CalcSkillDesc(r9_108, r2_108) .. r10_108
      if r11_108 then
        r11_108 = r11_108
      end
    end
    if r3_108 then
      local r12_108 = r2_0:_ModAttrGrowDesc2(r9_108, r3_108, r3_108, r10_108) and ""
      if r12_108 == "" then
        r12_108 = r5_0.CalcSkillDesc(r9_108, r2_108) .. r10_108
        if r12_108 then
          r12_108 = r12_108
        end
      end
      if r11_108 ~= r12_108 then
        r11_108 = r11_108 .. "->" .. r12_108
      end
    end
    r0_108 = string.gsub(r0_108, "#" .. r8_108, r11_108)
  end
  -- close: r4_108
  return r0_108
end
function r10_0.GenerateArmoryPreviewParamsBySquadInfo(r0_109, r1_109)
  -- line: [2330, 2358] id: 109
  local r2_109 = 1
  local function r3_109(r0_110, r1_110)
    -- line: [2332, 2342] id: 110
    local r2_110 = r0_110.ModData
    if not r2_110 then
      return 
    end
    if r1_110 then
      r2_110 = r1_110.ModSlotPolarity and {}
    else
      goto label_9	-- block#4 is visited secondly
    end
    r0_110.ModSuitIndex = 1
    r0_110.SlotData = {}
    for r7_110, r8_110 in ipairs(r0_110.ModData) do
      r8_110.Uuid = r2_109
      local r9_110 = r0_110.SlotData
      local r10_110 = {
        SlotId = r7_110,
        Polarity = r2_110[r7_110] and -1,
        ModEid = r2_109,
      }
      r9_110[r7_110] = r10_110
      r2_109 = r2_109 + 1
    end
    -- close: r3_110
  end
  local r5_109 = AvatarUtils:GetDefaultBattleInfo(r0_109.Avatar and GWorld:GetAvatar(), r1_109) and {}
  r3_109(r5_109.RoleInfo, r1_109.Char)
  r0_109.PreviewCharInfos = {
    r5_109.RoleInfo
  }
  r3_109(r5_109.MeleeWeapon, r1_109.MeleeWeapon)
  r3_109(r5_109.RangedWeapon, r1_109.RangedWeapon)
  r0_109.PreviewWeaponInfos = {
    r5_109.MeleeWeapon,
    r5_109.RangedWeapon
  }
  r0_109.PreviewUWeaponInfos = {}
  if r5_109.UltraWeapons then
    for r10_109, r11_109 in ipairs(r5_109.UltraWeapons) do
      r3_109(r11_109, r1_109.UltraWeapons[r10_109])
      table.insert(r0_109.PreviewUWeaponInfos, r11_109)
    end
    -- close: r6_109
  end
  return r0_109
end
function r10_0.LoadSkillIconById(r0_111)
  -- line: [2360, 2372] id: 111
  local r1_111 = DataMgr.Skill[r0_111]
  local r2_111 = r1_111 and r1_111[1] and r1_111[1][0]
  local r3_111 = nil
  if r2_111 then
    local r4_111 = r2_111.SkillBtnIcon
    if r4_111 then
      r3_111 = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Skill/T_" .. r4_111 .. ".T_" .. r4_111)
    end
  end
  if not r3_111 then
    r3_111 = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Skill/T_Skill_Heitao_Skill01.T_Skill_Heitao_Skill01")
  end
  return r3_111
end
function r10_0.CalcWidgetCenter(r0_112)
  -- line: [2374, 2378] id: 112
  local r1_112 = r0_112:GetTickSpaceGeometry()
  return USlateBlueprintLibrary.LocalToAbsolute(r1_112, USlateBlueprintLibrary.GetLocalSize(r1_112) / 2)
end
function r10_0.CheckScrollBoxCanScroll(r0_113)
  -- line: [2382, 2385] id: 113
  return r0_113:GetScrollOffsetOfEnd() > 5
end
function r10_0.ScrollBoxByGamepad(r0_114, r1_114, r2_114, r3_114)
  -- line: [2392, 2402] id: 114
  if not r2_114 then
    r2_114 = 20
  end
  if not r3_114 then
    r3_114 = 5
  end
  local r4_114 = UKismetInputLibrary.GetAnalogValue(r1_114) * -1 * r2_114
  if math.abs(r4_114) < r3_114 then
    return 
  end
  r0_114:SetScrollOffset(math.clamp(r0_114:GetScrollOffset() + r4_114, 0, r0_114:GetScrollOffsetOfEnd()))
end
function r10_0.HasAnyFocus(r0_115)
  -- line: [2404, 2406] id: 115
  return r0_115:HasAnyUserFocus() and r0_115:HasFocusedDescendants()
end
function r10_0.GetIconListByActionName(r0_116)
  -- line: [2409, 2423] id: 116
  local r1_116 = r0_0:Get("GamepadLayout") and tonumber(DataMgr.Option.GamepadPreset.DefaultValue)
  local r2_116 = nil
  local r3_116 = DataMgr.GamepadMap[r0_116]
  if r3_116 then
    r2_116 = r3_116.GamepadIcon[r1_116]
  else
    print(_G.ErrorTag, r0_116, "：此Action没有对应的键位，请检查拼写或检查GamepadSet表里是否有填写")
  end
  if not r2_116 then
    print(_G.ErrorTag, r0_116, "：目前的预设方案没有对应的键位，请检查GamepadSet表里是否有填写")
  else
    return r2_116
  end
end
function r10_0.GetIconListByActionNameAndSetNum(r0_117, r1_117)
  -- line: [2425, 2430] id: 117
  local r2_117 = DataMgr.GamepadMap[r0_117]
  if r2_117 then
    return r2_117.GamepadIcon[r1_117]
  end
end
function r10_0.GetTextFont(r0_118)
  -- line: [2438, 2459] id: 118
  assert(r0_118:IsA(UTextLayoutWidget), "UIUtils.GetTextFont, 错误，参数TextWidget必须是文本控件")
  local r1_118 = nil
  if r0_118:IsA(URichTextBlock) then
    if r0_118.bOverrideDefaultStyle then
      r1_118 = r0_118.DefaultTextStyleOverride.Font
    else
      r1_118 = r0_118.DefaultTextStyle.Font
    end
  elseif r0_118:IsA(UTextBlock) then
    r1_118 = r0_118.Font
  elseif r0_118:IsA(UMultiLineEditableText) then
    r1_118 = r0_118.WidgetStyle.Font
  elseif r0_118:IsA(UMultiLineEditableTextBox) then
    r1_118 = r0_118.WidgetStyle.Font
  end
  if not r1_118 then
    GWorld.logger.error("UIUtils.GetTextFont 参数TextWidget是不支持的文本文本控件，其他文本控件类型有需要的再考虑扩展")
  end
  return r1_118
end
function r10_0.CheckCdnHide(r0_119, r1_119)
  -- line: [2461, 2484] id: 119
  local r2_119 = GWorld:GetAvatar()
  local r3_119 = {}
  if r2_119 and r2_119.CdnHideData and r2_119.CdnHideData.game_ui then
    r3_119 = r2_119.CdnHideData.game_ui
  else
    return false
  end
  for r8_119, r9_119 in pairs(DataMgr.MainUI) do
    if r0_119 == r9_119.SystemUIName then
      for r14_119, r15_119 in pairs(r3_119) do
        if r15_119.config == false then
          for r20_119, r21_119 in pairs(r15_119.gameCtrlGameUI) do
            if r21_119 == r9_119.Name then
              r10_0.ShowMainUIFobidToast(r9_119)
              return true
            end
          end
          -- close: r16_119
        end
      end
      -- close: r10_119
    end
  end
  -- close: r4_119
  return false
end
function r10_0.ShowMainUIFobidToast(r0_120)
  -- line: [2486, 2497] id: 120
  if r0_120.UIUnlockRuleName then
    local r2_120 = DataMgr.UIUnlockRule[r0_120.UIUnlockRuleName].OpenSystemDesc
    if r2_120 then
      local r3_120 = GWorld.GameInstance:GetGameUIManager()
      if r3_120 then
        r3_120:ShowUITip(UIConst.Tip_CommonToast, r2_120[1])
      end
    end
  end
end
function r10_0.CalcOnelineTextDesireHeight(r0_121)
  -- line: [2503, 2511] id: 121
  assert(r0_121:IsA(UTextLayoutWidget), "UIUtils.CalcOnelineTextDesireHeight, 错误，参数TextWidget必须是文本控件")
  local r1_121 = r10_0.GetTextFont(r0_121)
  if not r1_121 then
    return 
  end
  return r0_121.Margin.Top + r0_121.Margin.Bottom + UUIFunctionLibrary.GetFontHeight(r1_121) * r0_121.LineHeightPercentage
end
function r10_0.SetTextJustificationByLineCount(r0_122, r1_122, r2_122, r3_122)
  -- line: [2518, 2556] id: 122
  assert(r0_122:IsA(UTextLayoutWidget), "UIUtils.LayoutTextByLineRule, 错误，参数TextWidget必须是文本控件")
  local r4_122 = r0_122:GetDesiredSize().Y
  if r4_122 == 0 then
    r0_122:ForceLayoutPrepass()
    r4_122 = r0_122:GetDesiredSize().Y
  end
  if r4_122 == 0 then
    GWorld.logger.error("UIUtils.LayoutTextByLineRule 参数TextWidget没有绘制完或者自身高度就是0，无法判断什么时候该换行")
    return 
  end
  if not r2_122 then
    r2_122 = 1
  end
  if not r3_122 then
    r3_122 = {
      ETextJustify.Center,
      ETextJustify.Left
    }
  end
  if r1_122 then
    for r9_122, r10_122 in ipairs(r3_122) do
      if r10_122 == ETextJustify.Center then
        r0_122:SetJustification(r10_122)
        return 
      end
    end
    -- close: r5_122
  end
  local r5_122 = 0.5
  if r10_0.IsGamepadInput() and string.match(r0_122:GetText(), "<img.-%s*></>") then
    r5_122 = 1
  end
  if r4_122 <= r10_0.CalcOnelineTextDesireHeight(r0_122) * (r2_122 + r5_122) then
    r0_122:SetJustification(r3_122[1])
  else
    r0_122:SetJustification(r3_122[2])
  end
end
function r10_0.LoadPreviewSkillDetails(r0_123, r1_123)
  -- line: [2559, 2622] id: 123
  if not r0_123 then
    return 
  end
  if not r1_123 then
    r1_123 = {}
  end
  local r2_123 = DataMgr.SystemUI.SkillDetails
  local r4_123 = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  local r5_123 = {}
  local r6_123 = {}
  local r7_123 = nil
  local r8_123 = nil
  local r9_123 = nil
  if not IsStandAlone(r4_123) then
    local r10_123 = GWorld:GetAvatar()
    for r15_123, r16_123 in pairs(r10_123.Chars) do
      if r16_123.CharId == r4_123.CurrentRoleId then
        r5_123 = AvatarUtils:GetCharBattleInfo(r10_123, r16_123, r16_123.ModSuitIndex).RoleInfo
        break
      end
    end
    -- close: r11_123
  else
    r9_123 = r4_123.InfoForInit
    r5_123 = CommonUtils.CopyTable(r4_123.InfoForInit)
  end
  if r9_123 then
    if r9_123.MeleeWeapon then
      r7_123 = CommonUtils.CopyTable(r9_123.MeleeWeapon)
      if r7_123 then
        table.insert(r6_123, r7_123)
      end
    end
    if r9_123.RangedWeapon then
      r8_123 = CommonUtils.CopyTable(r9_123.RangedWeapon)
      if r8_123 then
        table.insert(r6_123, r8_123)
      end
    end
  end
  r5_123.ModSuitIndex = r5_123.ModSuitIndex and 1
  r5_123.SlotData = r5_123.SlotData and {}
  for r14_123, r15_123 in ipairs(r5_123.ModData and {}) do
    r5_123.SlotData[r14_123] = r5_123.SlotData[r14_123] and {}
    local r16_123 = r5_123.SlotData[r14_123]
    r16_123.SlotId = r16_123.SlotId and r14_123
    r16_123.Polarity = r16_123.Polarity and -1
    if not r15_123.Uuid or r15_123.Uuid == "" or r15_123.Uuid == 0 or r15_123.Uuid == -1 then
      r15_123.Uuid = r14_123
    end
    if not r16_123.ModEid or r16_123.ModEid == "" or r16_123.ModEid == 0 or r16_123.ModEid == -1 then
      r16_123.ModEid = r15_123.Uuid
    end
  end
  -- close: r10_123
  UIManager(r0_123):LoadUI(UIConst.LoadInConfig, r2_123.UIName, r0_123:GetZOrder(), {
    OnClosedObj = r0_123,
    OnClosedCallback = r1_123.OnClosedCallback,
    PreviewCharInfos = {
      r5_123
    },
    PreviewWeaponInfos = r6_123,
    MeleeWeapon = r7_123,
    RangedWeapon = r8_123,
    IsPreviewMode = true,
  })
end
function r10_0.GenRougeCombatTermDesc(r0_124, r1_124)
  -- line: [2624, 2632] id: 124
  local r2_124 = {
    r0_124
  }
  r10_0.AddHyperLink(r2_124, r1_124, 1)
  local r3_124 = ""
  for r8_124, r9_124 in ipairs(r2_124) do
    r3_124 = r3_124 .. r9_124
  end
  -- close: r4_124
  return r3_124
end
function r10_0.AddHyperLink(r0_125, r1_125, r2_125)
  -- line: [2634, 2649] id: 125
  if #r1_125 < r2_125 then
    return 
  end
  local r3_125 = GText(DataMgr.CombatTerm[r1_125[r2_125]].CombatTerm)
  local r4_125, r5_125, r6_125 = UKismetStringLibrary.Split(r0_125[#r0_125], r3_125)
  if not r6_125 then
    r10_0.AddHyperLink(r0_125, r1_125, r2_125 + 1)
  else
    r0_125[#r0_125] = r4_125
    r10_0.AddHyperLink(r0_125, r1_125, r2_125 + 1)
    table.insert(r0_125, "<H_Under>" .. r3_125 .. "</>")
    table.insert(r0_125, r5_125)
    r10_0.AddHyperLink(r0_125, r1_125, r2_125)
  end
end
function r10_0.OnDefinitionLinkClicked(r0_126, r1_126, r2_126)
  -- line: [2655, 2680] id: 126
  if not r0_126 or not r1_126 or not next(r1_126) then
    return 
  end
  local r3_126 = {
    DefinitionItems = {},
  }
  for r8_126, r9_126 in ipairs(r1_126) do
    local r10_126 = DataMgr.CombatTerm[r9_126]
    if r10_126 then
      if r2_126 == r9_126 then
        r3_126.CurrentItemIndex = r8_126 + -1
      end
      table.insert(r3_126.DefinitionItems, {
        Index = r8_126 + -1,
        Name = GText(r10_126.CombatTerm),
        Des = GText(r10_126.CombatTermExplaination),
      })
    end
  end
  -- close: r4_126
  r0_126.DefinitionWidget = UIManager(r0_126):ShowCommonPopupUI(100266, r3_126)
end
function r10_0.AddDefinitionHyperLink(r0_127, r1_127, r2_127)
  -- line: [2683, 2702] id: 127
  if #r1_127 < r2_127 then
    return 
  end
  if not DataMgr.CombatTerm[r1_127[r2_127]] then
    return 
  end
  local r4_127 = GText(DataMgr.CombatTerm[r1_127[r2_127]].CombatTerm)
  local r5_127, r6_127, r7_127 = UKismetStringLibrary.Split(r0_127[#r0_127], r4_127)
  if not r7_127 then
    r10_0.AddDefinitionHyperLink(r0_127, r1_127, r2_127 + 1)
  else
    r0_127[#r0_127] = r5_127
    r10_0.AddDefinitionHyperLink(r0_127, r1_127, r2_127 + 1)
    table.insert(r0_127, table.concat({
      "<a href=\"",
      r1_127[r2_127],
      "\"",
      " color=\"#E0A24A\">",
      r4_127,
      "</>"
    }))
    table.insert(r0_127, r6_127)
    r10_0.AddDefinitionHyperLink(r0_127, r1_127, r2_127)
  end
end
function r10_0.SetDefinitionText(r0_128, r1_128)
  -- line: [2707, 2717] id: 128
  if not r0_128 or not r1_128 or not r1_128 then
    return 
  end
  local r3_128 = {
    tostring(r0_128:GetText())
  }
  r10_0.AddDefinitionHyperLink(r3_128, r1_128, 1)
  r0_128:SetText(GText(table.concat(r3_128)))
end
function r10_0.InitDefinitionTextWidget(r0_129, r1_129, r2_129, r3_129)
  -- line: [2724, 2747] id: 129
  if not r0_129 or not r1_129 then
    return 
  end
  local r5_129 = r1_129:GetDecoratorByClass(UE.UClass.Load("/Game/UI/Blueprint/BP_HyperLinkDecorator.BP_HyperLinkDecorator_C"))
  if r5_129 then
    r5_129.BP_OnClicked:Clear()
    r5_129.BP_OnClicked:Add(r0_129, function(r0_130, r1_130)
      -- line: [2732, 2739] id: 130
      if not r0_130 then
        return 
      end
      if r3_129 and type(r3_129) == "function" then
        r3_129(r0_130, r0_129[r2_129], r1_130)
      else
        r10_0.OnDefinitionLinkClicked(r0_129, r0_129[r2_129], r1_130)
      end
    end)
  end
  r0_129:AddDelayFrameFunc(function()
    -- line: [2741, 2746] id: 131
    if r0_129 and r0_129.bSkipDefinitionAutoInit then
      return 
    end
    r10_0.SetDefinitionText(r1_129, r0_129[r2_129])
  end, 2, "UpdateTargetTextFunc")
end
function r10_0.AddPositioningTagToPanel(r0_132, r1_132)
  -- line: [2749, 2787] id: 132
  if not r0_132 or not r1_132 then
    return 
  end
  local r2_132 = 0
  local r3_132 = DataMgr.BattleChar[r1_132]
  if r3_132 and r3_132.Positioning then
    local r4_132 = r0_132:GetChildAt(0)
    if not r4_132 then
      return 
    end
    local r5_132 = UIManager(r0_132)
    local r6_132 = UGameplayStatics.GetObjectClass(r4_132)
    for r11_132, r12_132 in pairs(r3_132.Positioning) do
      local r13_132 = DataMgr.Positioning[r12_132]
      if r13_132 then
        r4_132 = r0_132:GetChildAt(r2_132)
        if not r4_132 then
          r4_132 = r5_132:CreateWidget(r6_132)
          r0_132:AddChild(r4_132)
        end
        if r13_132.Icon then
          r4_132:SetIcon(LoadObject(r13_132.Icon))
        end
        r2_132 = r2_132 + 1
      end
    end
    -- close: r7_132
  end
  if r2_132 > 0 then
    r0_132:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    for r9_132 = r0_132:GetChildrenCount() + -1, r2_132, -1 do
      r0_132:RemoveChildAt(r9_132)
    end
  else
    r0_132:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end
function r10_0.GetCharMiniIconPath(r0_133)
  -- line: [2789, 2792] id: 133
  local r1_133 = "T_Normal_" .. DataMgr.BattleChar[r0_133].GuideIconImg
  return "Texture2D\'/Game/UI/Texture/Dynamic/Image/Head/Mini/" .. r1_133 .. "." .. r1_133 .. "\'"
end
function r10_0.OpenPopupToArmory(r0_134, r1_134)
  -- line: [2798, 2826] id: 134
  UIManager(r0_134):ShowCommonPopupUI(100217, {
    RightCallbackFunction = function(r0_135, r1_135, r2_135)
      -- line: [2800, 2802] id: 135
      r2_135.ClickResult = true
    end,
    RightCallbackObj = r0_134,
    OnCloseCallbackFunction = function(r0_136, r1_136, r2_136)
      -- line: [2804, 2818] id: 136
      if r2_136.ClickResult == true then
        DebugPrint("OpenArmoryFromPopup")
        PageJumpUtils:JumpToTargetPageByJumpId(52)
        if UIManager(r0_134):GetUIObj("ArmoryMain") then
          UIManager(r0_134):GetUIObj("ArmoryMain").OnCloseDelegate = {
            nil,
            function()
              -- line: [2810, 2812] id: 137
              r10_0:OpenPopupToArmory()
            end,
            r0_134
          }
        else
          ScreenPrint("没有找到军械库界面，关闭界面后不会打开弹窗。")
        end
      end
    end,
  }, r0_134)
end
function r10_0.CalculateHoleTitle(r0_138, r1_138)
  -- line: [2829, 2847] id: 138
  local r2_138 = nil
  local r3_138 = nil
  if r0_138 ~= -1 and DataMgr.Title[r0_138] then
    r2_138 = DataMgr.Title[r0_138].Name and nil
  end
  if r1_138 ~= -1 and DataMgr.Title[r1_138].Name then
    r3_138 = DataMgr.Title[r1_138].Name and nil
  end
  if r2_138 then
    r2_138 = GText(r2_138) and ""
  end
  if r3_138 then
    r3_138 = GText(r3_138) and ""
  end
  local r4_138 = r2_138 and ""
  return r4_138 .. (r3_138 and "")
end
function r10_0.GetSortedTitleTable()
  -- line: [2850, 2873] id: 139
  local r0_139 = GWorld:GetAvatar()
  local r1_139 = {}
  local r2_139 = {}
  for r8_139, r9_139 in pairs(r0_139.Titles) do
    if DataMgr.Title[r8_139] then
      local r10_139 = DataMgr.Title[r8_139]
      local r11_139 = {
        Name = r10_139.Name,
        TitleID = r10_139.TitleID,
      }
      if r10_139.IfSuffix then
        table.insert(r2_139, r11_139)
      else
        table.insert(r1_139, r11_139)
      end
    end
  end
  -- close: r4_139
  return r1_139, r2_139
end
function r10_0.SetTextColorInMaterialByRarity(r0_140, r1_140, r2_140, r3_140)
  -- line: [2878, 2894] id: 140
  local r4_140 = r2_140:GetDynamicFontMaterial()
  if r3_140 == 5 then
    r4_140:SetTextureParameterValue("IconTex", r1_140.Img_Text_5)
  elseif r3_140 == 4 then
    r4_140:SetTextureParameterValue("IconTex", r1_140.Img_Text_4)
  elseif r3_140 == 3 then
    r4_140:SetTextureParameterValue("IconTex", r1_140.Img_Text_3)
  elseif r3_140 == 2 then
    r4_140:SetTextureParameterValue("IconTex", r1_140.Img_Text_2)
  elseif r3_140 == 1 then
    r4_140:SetTextureParameterValue("IconTex", r1_140.Img_Text_1)
  else
    r4_140:SetTextureParameterValue("IconTex", r1_140.Img_Text_0)
  end
end
function r10_0.SetTitle(r0_141, r1_141, r2_141)
  -- line: [2900, 2937] id: 141
  if r0_141 then
    r0_141:ClearChildren()
    r0_141:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    return 
  end
  if not r1_141 then
    return 
  end
  local r3_141 = r1_141.TitleBefore
  local r4_141 = r1_141.TitleAfter
  local r5_141 = r1_141.TitleFrame
  if (not r3_141 or r3_141 <= 0) and (not r4_141 or r4_141 <= 0) then
    return 
  end
  r0_141:SetVisibility(UIConst.VisibilityOp.Visible)
  local r7_141 = GWorld.GameInstance:GetGameUIManager()
  if r7_141 and r7_141.LoadTitleFrameWidget then
    local r8_141 = r7_141:LoadTitleFrameWidget(r5_141 and -1)
    if r8_141 then
      if r0_141:AddChild(r8_141) then
        if r8_141.SetTitleContent then
          r8_141:SetTitleContent(r3_141, r4_141)
        elseif r8_141.SetTitle then
          r8_141:SetTitle(r3_141, r4_141)
        elseif r8_141.SetEmpty and (not r3_141 or r3_141 <= 0) and (not r4_141 or r4_141 <= 0) then
          r8_141:SetEmpty()
        end
      end
      if r2_141 and r8_141.In then
        r8_141:PlayAnimation(r8_141.In)
      end
    end
  end
end
function r10_0.SetUpScrollBox(r0_142)
  -- line: [2939, 2951] id: 142
  if not r0_142 then
    DebugPrint("Invalid scroll box parameter")
    return 
  end
  if r10_0.IsMobileInput() then
    r0_142:SetControlScrollbarInside(false)
  else
    r0_142:SetScrollBarVisibility(UIConst.VisibilityOp.Hidden)
    r0_142:SetControlScrollbarInside(true)
  end
end
function r10_0.GetRootUWidget(r0_143)
  -- line: [2956, 2968] id: 143
  if not r0_143 then
    return nil
  end
  if r0_143.GetUWidgetSoul then
    return r0_143:GetUWidgetSoul()
  elseif r0_143.WidgetTree and r0_143.WidgetTree.RootWidget then
    return r0_143.WidgetTree.RootWidget
  end
  return nil
end
function r10_0.GatFastKeyInfo(r0_144, r1_144, r2_144)
  -- line: [2970, 2980] id: 144
  if not r1_144 then
    r1_144 = "A"
  end
  return {
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = r1_144,
      }
    },
    Desc = r2_144,
  }
end
function r10_0.GetDynamicRewardInfo(r0_145, r1_145)
  -- line: [2982, 2997] id: 145
  if not r1_145 then
    r1_145 = r3_0.NowTime()
  end
  local r2_145 = DataMgr.DynamicReward[r0_145]
  if not r2_145 then
    return 
  end
  for r7_145, r8_145 in pairs(r2_145) do
    if r7_145 <= r1_145 then
      for r13_145, r14_145 in pairs(r8_145) do
        if r1_145 <= r13_145 then
          return r14_145
        end
      end
      -- close: r9_145
    end
  end
  -- close: r3_145
end
function r10_0.LongPressKey(r0_146, r1_146, r2_146, r3_146)
  -- line: [2999, 3032] id: 146
  if r1_146:IsAnimationPlaying(r1_146.LongPress) then
    return 
  end
  AudioManager(r1_146):PlayUISound(r1_146, "event:/ui/common/btn_press", "LongPress", nil)
  r1_146:UnbindAllFromAnimationFinished(r1_146.LongPress)
  r1_146:BindToAnimationFinished(r1_146.LongPress, function()
    -- line: [3008, 3025] id: 147
    ScreenPrint("LongPressKey")
    if not r1_146.IsLongPressing then
      return 
    end
    AudioManager(r1_146):StopSound(r1_146, "LongPress")
    if r2_146 then
      r2_146()
    end
    r1_146:PlayAnimation(r1_146.Normal)
    r1_146.IsLongPressing = false
  end)
  if not r1_146 then
    return 
  end
  r1_146.IsLongPressing = true
  r1_146:PlayAnimation(r1_146.LongPress)
end
function r10_0.StopLongPressKey(r0_148, r1_148)
  -- line: [3034, 3046] id: 148
  if not r1_148.IsLongPressing then
    return 
  end
  AudioManager(r1_148):StopSound(r1_148, "LongPress")
  r1_148:UnbindAllFromAnimationFinished(r1_148.LongPress)
  r1_148:StopAllAnimations()
  r1_148:PlayAnimation(r1_148.Normal)
  r1_148.IsLongPressing = false
end
function r10_0.GetMinAndMaxDisplayedItemIndex(r0_149)
  -- line: [3049, 3063] id: 149
  local r1_149 = r0_149:GetDisplayedEntryWidgets():ToTable()
  local r2_149 = #r1_149
  local r3_149 = 0
  for r8_149, r9_149 in ipairs(r1_149) do
    local r10_149 = r0_149:GetIndexForItem(UUserObjectListEntryLibrary.GetListItemObject(r9_149)) + 1
    if r10_149 < r2_149 then
      r2_149 = r10_149
    end
    if r3_149 < r10_149 then
      r3_149 = r10_149
    end
  end
  -- close: r4_149
  return r2_149, r3_149
end
function r10_0.OpenMultiplayerChallengeLevelChoose(r0_150)
  -- line: [3066, 3070] id: 150
  GWorld.GameInstance:GetGameUIManager():LoadUINew("MultiplayerChallenge", r0_150)
end
function r10_0.SetFocusSecretly(r0_151)
  -- line: [3073, 3082] id: 151
  local r1_151 = UGameInputModeSubsystem.GetGameInputModeSubsystem(r0_151)
  r1_151:SetNavigateWidgetOpacity(0)
  r0_151:SetFocus()
  require("BluePrints.Common.StageTimerMgr").AddTimer(r0_151, 0.25, function()
    -- line: [3078, 3080] id: 152
    r1_151:SetNavigateWidgetOpacity(1)
  end, nil, nil, nil, true, UE4.ETickingGroup.TG_EndPhysics)
end
function r10_0.GetRelativePositionInParent(r0_153, r1_153, r2_153)
  -- line: [3089, 3135] id: 153
  local r3_153 = r0_153:GetParent() and r0_153
  local r4_153 = r3_153:GetCachedGeometry()
  local r5_153 = UE4.USlateBlueprintLibrary.AbsoluteToLocal(r4_153, r1_153)
  local r6_153 = UE4.USlateBlueprintLibrary.GetLocalSize(r4_153)
  local r7_153 = r3_153.Slot
  if r7_153 then
    local r8_153 = FVector2D(r7_153:GetPosition().X, r7_153:GetPosition().Y)
    local r9_153 = nil
    local r10_153 = r0_153:GetCachedGeometry()
    local r11_153 = nil	-- notice: implicit variable refs by block#[8]
    if r0_153 then
      r11_153 = r0_153.RenderTransform.Scale.X
      if not r11_153 then
        ::label_39::
        r11_153 = 1
      end
    else
      goto label_39	-- block#5 is visited secondly
    end
    local r12_153 = UE4.USlateBlueprintLibrary.GetLocalSize(r10_153)
    local r13_153 = r0_153.Slot:GetAnchors()
    local r14_153 = r0_153.Slot:GetAlignment()
    if r2_153 == nil then
      r2_153 = FVector2D(r12_153.X / 2, r12_153.Y / 2)
    end
    r9_153 = FVector2D(r12_153.X * (r14_153.X - r2_153.X / r12_153.X), r12_153.Y * (r14_153.Y - r2_153.Y / r12_153.Y))
    return FVector2D(r8_153.X + r5_153.X - r6_153.X * math.max(r13_153.Maximum.X, r13_153.Minimum.X) + r9_153.X + r12_153.X * (1 - r11_153) * (r2_153.X / r12_153.X - 0.5), r8_153.Y + r5_153.Y - r6_153.Y * math.max(r13_153.Maximum.Y, r13_153.Minimum.Y) + r9_153.Y + r12_153.Y * (1 - r11_153) * (r2_153.Y / r12_153.Y - 0.5))
  end
  return r5_153
end
function r10_0.ConvertScreenToChildLocalPosition(r0_154, r1_154, r2_154, r3_154)
  -- line: [3142, 3181] id: 154
  local r5_154 = (r1_154:GetParent() and r1_154):GetCachedGeometry()
  local r6_154 = UE4.USlateBlueprintLibrary.AbsoluteToLocal(r5_154, r2_154)
  local r7_154 = UE4.USlateBlueprintLibrary.GetLocalSize(r5_154)
  local r8_154 = r1_154.Slot
  if r8_154 then
    local r9_154 = FVector2D(r8_154:GetPosition().X, r8_154:GetPosition().Y)
    local r10_154 = UIManager(r0_154):GetWorldPosition(r1_154)
    local r11_154 = r1_154:GetCachedGeometry()
    local r12_154 = UE4.USlateBlueprintLibrary.GetAbsoluteSize(r11_154)
    local r13_154 = UE4.USlateBlueprintLibrary.GetLocalSize(r11_154)
    local r15_154 = UE4.USlateBlueprintLibrary.AbsoluteToLocal(r5_154, FVector2D(r10_154.X + r12_154.X * r3_154.X / r13_154.X, r10_154.Y + r12_154.Y * r3_154.Y / r13_154.Y))
    return FVector2D(r9_154.X + r6_154.X - r15_154.X, r9_154.Y + r6_154.Y - r15_154.Y)
  end
  return r6_154
end
function r10_0.RefreshFeinaRewardReddot()
  -- line: [3183, 3233] id: 155
  local r0_155 = GWorld:GetAvatar()
  if not r0_155 then
    return 
  end
  if not ReddotManager.GetTreeNode("FeinaEventReward") then
    ReddotManager.AddNodeEx("FeinaEventReward")
  end
  ReddotManager.ClearLeafNodeCount("FeinaEventReward", true)
  local r2_155 = ReddotManager.GetLeafNodeCacheDetail("FeinaEventReward")
  for r7_155, r8_155 in pairs(DataMgr.FeinaEvent) do
    local r9_155 = false
    for r14_155, r15_155 in pairs(r8_155.DungeonId) do
      local r16_155 = r0_155:GetFeinaRewardInfo(r15_155)
      if r16_155 then
        local r17_155 = false
        for r22_155, r23_155 in pairs(r16_155) do
          if r23_155 == 1 then
            if not r2_155[r7_155] then
              r2_155[r7_155] = {}
            end
            if not r2_155[r7_155][r15_155] then
              r2_155[r7_155][r15_155] = {}
            end
            if not r2_155[r7_155][r15_155][r22_155] then
              r2_155[r7_155][r15_155][r22_155] = 1
            end
            ReddotManager.IncreaseLeafNodeCount("FeinaEventReward")
            r17_155 = true
            r9_155 = true
          elseif r23_155 == 2 and r2_155[r7_155] and r2_155[r7_155][r15_155] and r2_155[r7_155][r15_155][r22_155] then
            r2_155[r7_155][r15_155][r22_155] = nil
          end
        end
        -- close: r18_155
        if not r17_155 and r2_155[r7_155] and r2_155[r7_155][r15_155] then
          r2_155[r7_155][r15_155] = nil
        end
      end
    end
    -- close: r10_155
    if not r9_155 and r2_155[r7_155] then
      r2_155[r7_155] = nil
    end
  end
  -- close: r3_155
end
AssembleComponents(r10_0)
return r10_0
