-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Activity\Widget\View\ActivityEntryBaseView.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("BluePrints.UI.WBP.Activity.ActivityCommon")
local r1_0 = require("BluePrints.UI.WBP.Activity.ActivityReddotHelper")
local r2_0 = require("BluePrints.UI.WBP.Activity.ActivityUtils")
return {
  PlayInAnim = function(r0_1)
    -- line: [16, 22] id: 1
    AudioManager(r0_1):PlayUISound(r0_1, "event:/ui/armory/open", "Activity", nil)
    r0_1:BindToAnimationFinished(r0_1.In, {
      r0_1,
      function()
        -- line: [18, 20] id: 2
        r0_1.IsNotFirstOpenSystem = true
      end
    })
    r0_1:PlayAnimationForward(r0_1.In)
  end,
  PlayOutAnim = function(r0_3)
    -- line: [24, 30] id: 3
    AudioManager(r0_3):SetEventSoundParam(r0_3, "Activity", {
      ToEnd = 1,
    })
    r0_3.WidgetBGAnchor:ClearChildren()
    r0_3:BindToAnimationFinished(r0_3.Out, {
      r0_3,
      r0_3.Close
    })
    r0_3:PlayAnimationForward(r0_3.Out)
  end,
  CheckIsCanCloseSelf = function(r0_4)
    -- line: [32, 37] id: 4
    if r0_4:IsAnimationPlaying(r0_4.In) then
      return false
    end
    return true
  end,
  CheckIsInCloseSelfState = function(r0_5)
    -- line: [39, 44] id: 5
    if r0_5:IsAnimationPlaying(r0_5.Out) then
      return true
    end
    return false
  end,
  CreateEmptyContent = function(r0_6)
    -- line: [46, 50] id: 6
    local r1_6 = NewObject(UIUtils.GetCommonItemContentClass())
    r1_6.IsEmpty = true
    return r1_6
  end,
  InitTabView = function(r0_7, r1_7, r2_7, r3_7, r4_7, r5_7)
    -- line: [52, 184] id: 7
    -- notice: unreachable block#33
    r0_7.Activity_Tab:Init(r1_7)
    r0_7.List_Tab:ClearListItems()
    local r6_7 = 1
    local r7_7 = 1
    local r8_7 = 0
    local r9_7 = 0
    r0_7.LastIndex = #r2_7.Tabs
    local r16_7 = nil	-- notice: implicit variable refs by block#[27, 28, 30, 35, 37]
    for r14_7, r15_7 in ipairs(r2_7.Tabs) do
      r16_7 = NewObject(UIUtils.GetCommonItemContentClass())
      r16_7.TabId = r15_7.TabId
      r16_7.EventId = r15_7.EventId
      r16_7.Name = r15_7.Text
      r16_7.IconPath = r15_7.IconPath
      r16_7.BgPath = r15_7.EventBgPath
      r16_7.TabIconPath = r15_7.EventTabIconPath
      r16_7.ClickCallback = r3_7
      r16_7.VirtualClickCallback = r4_7
      r16_7.ParentWidget = r0_7
      r16_7.bLimit = r15_7.bLimit
      if r15_7.bLimit then
        r16_7.Index = r6_7
        r6_7 = r6_7 + 1
        r8_7 = r8_7 + 1
      else
        r16_7.Index = r7_7
        r7_7 = r7_7 + 1
        r9_7 = r9_7 + 1
      end
      r16_7.IsSelected = r16_7.Index == r5_7
      r0_7.List_Tab:AddItem(r16_7)
      if r16_7.IsSelected then
        r0_7:AddTimer(0.1, function()
          -- line: [92, 94] id: 8
          r0_7.List_Tab:BP_ScrollItemIntoView(r16_7)
        end)
      end
      -- close: r16_7
    end
    -- close: r10_7
    if r0_7.List_Tab:GetNumItems() == 0 then
      r0_7.List_Tab:AddItem(r0_7:CreateEmptyContent())
    end
    if r0_7:IsExistTimer(r0_7.NextFrameListEmpty) then
      r0_7:RemoveTimer(r0_7.NextFrameListEmpty)
    end
    r0_7.NextFrameListEmpty = r0_7:AddTimer(0.01, function()
      -- line: [106, 121] id: 9
      if r0_7.ListTabMaxCount == nil then
        r0_7.ListTabMaxCount = UIUtils.GetListViewContentMaxCount(r0_7.List_Tab)
      end
      local r0_9 = 0
      if r0_7.EventTypeTab.bLimitTime or r0_7.EventTypeTab.bLimitTime == nil then
        r0_9 = r0_7.ListTabMaxCount - r8_7
      else
        r0_9 = r0_7.ListTabMaxCount - r9_7
      end
      DebugPrint("jly@ RestCount: " .. r0_9)
      for r4_9 = 1, r0_9, 1 do
        r0_7.List_Tab:AddItem(r0_7:CreateEmptyContent())
        DebugPrint("jly@ Add: " .. r4_9)
      end
    end)
    if r5_7 ~= nil then
      r0_7.List_Tab:SetSelectedIndex(r5_7 + -1)
    end
    if #r2_7.Tabs > 0 then
      r0_7.List_Tab:SetRenderOpacity(1)
      r0_7.List_Tab:SetVisibility(UIConst.VisibilityOp.Visible)
    else
      r0_7.List_Tab:SetRenderOpacity(0)
      r0_7.List_Tab:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    end
    r0_7.List_Tab.OnListViewScrolled:Add(r0_7, r0_7.OnList_TabScrolled)
    r0_7:AddTimer(0.2, function()
      -- line: [137, 140] id: 10
      if not r0_7 then
        return 
      end
      r0_7:OnList_TabScrolled()
    end)
    if r0_7.InitEventTypeTabReddot == nil then
      r0_7.InitEventTypeTabReddot = true
      r0_7.EventTypeTab:UpdateEventTypeTabReddot(true)
    else
      r0_7.EventTypeTab:UpdateEventTypeTabReddot()
    end
    for r15_7, r16_7 in pairs(r0_7.List_Tab:GetListItems()) do
      if r16_7.bLimit ~= nil then
        local r17_7 = r16_7.bLimit
        if r17_7 then
          r17_7 = r0_7.EventTypeTab:IsLimitTime()
          if not r17_7 then
            ::label_173::
            r17_7 = r16_7.bLimit
            if not r17_7 then
              r17_7 = not r0_7.EventTypeTab:IsLimitTime()
            else
              r17_7 = false
            end
          end
        else
          goto label_173	-- block#30 is visited secondly
        end
        if not r17_7 then
          r0_7.List_Tab:RemoveItem(r16_7)
        end
      end
    end
    -- close: r11_7
    r0_7.List_Tab:RequestFillEmptyContent()
    r16_7 = nil
    UIUtils.BindListViewReddotAndNewClickEvent(r0_7.List_Tab, r0_7.List_RedDotTop, r0_7.List_RedDotBottom, nil, r16_7, function(...)
      -- line: [163, 182] id: 11
      local r0_11 = nil	-- notice: implicit variable refs by block#[0, 2, 4, 6]
      ... = ... -- error: untaken top expr
      if not r0_11 then
        return false
      end
      if r0_11.ShowRedDot then
        return true
      end
      if r0_11.TabId == nil then
        return false
      end
      local r2_11 = ReddotManager.GetTreeNode(r1_0.GetEventTabNodeName(r0_11.TabId))
      if r2_11 == nil or r2_11.Count == nil then
        return false
      else
        local r3_11 = r2_11.Count
        if r3_11 > 0 then
          r3_11 = r2_11.ReddotType == EReddotType.Normal
        else
          goto label_39	-- block#11 is visited secondly
        end
        return r3_11
      end
    end)
  end,
  OnList_TabScrolled = function(r0_12)
    -- line: [186, 217] id: 12
    r0_12:AddTimer(0.033, function()
      -- line: [187, 216] id: 13
      if not r0_12 then
        return 
      end
      UIUtils.UpdateListArrowAndReddot(r0_12.List_Tab, r0_12.List_RedDotTop, r0_12.List_RedDotBottom, r0_12.List_ArrowTop, r0_12.List_ArrowBottom, function(...)
        -- line: [195, 214] id: 14
        local r0_14 = nil	-- notice: implicit variable refs by block#[0, 2, 4, 6]
        ... = ... -- error: untaken top expr
        if not r0_14 then
          return false
        end
        if r0_14.ShowRedDot then
          return true
        end
        if r0_14.TabId == nil then
          return false
        end
        local r2_14 = ReddotManager.GetTreeNode(r1_0.GetEventTabNodeName(r0_14.TabId))
        if r2_14 == nil or r2_14.Count == nil then
          return false
        else
          local r3_14 = r2_14.Count
          if r3_14 > 0 then
            r3_14 = r2_14.ReddotType == EReddotType.Normal
          else
            goto label_39	-- block#11 is visited secondly
          end
          return r3_14
        end
      end)
    end)
  end,
  JumpToTargetTab = function(r0_15, r1_15)
    -- line: [219, 235] id: 15
    if r1_15 == nil then
      return 
    end
    for r6_15 = 0, r0_15.List_Tab:GetNumItems() + -1, 1 do
      local r7_15 = r0_15.List_Tab:GetItemAt(r6_15)
      if r7_15 then
        if r7_15.UI then
          r7_15.UI:SetIsSelected(r6_15 == r1_15 + -1)
        else
          r7_15.IsSelected = r6_15 == r1_15 + -1
        end
      end
    end
  end,
  ShowContentView = function(r0_16, r1_16, r2_16)
    -- line: [237, 261] id: 16
    if r2_16 then
      if r1_16 then
        r0_16.Text_Activity_Empry:SetText(GText("Text_Activity_Empty"))
        r0_16.Group_Empty:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
        r0_16.Group_Normal:SetVisibility(UIConst.VisibilityOp.Collapsed)
        r0_16.Panel_Component:SetVisibility(UIConst.VisibilityOp.Collapsed)
      else
        r0_16.Group_Empty:SetVisibility(UIConst.VisibilityOp.Collapsed)
        r0_16.Group_Normal:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
        r0_16.Panel_Component:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      end
    elseif r1_16 then
      r0_16.Text_Activity_Empry:SetText(GText("Text_Activity_Empty"))
      r0_16.Group_Empty:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      r0_16.Group_Normal:SetVisibility(UIConst.VisibilityOp.Collapsed)
      r0_16:UpdateActivityKeyTips()
    else
      r0_16.Group_Empty:SetVisibility(UIConst.VisibilityOp.Collapsed)
      r0_16.Group_Normal:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  end,
  RefreshViewAfterPageDataSet = function(r0_17, r1_17, r2_17)
    -- line: [263, 322] id: 17
    if not r1_17 then
      return 
    end
    local r3_17 = nil
    if CommonUtils.GetDeviceTypeByPlatformName(r0_17) == CommonConst.CLIENT_DEVICE_TYPE.MOBILE then
      r3_17 = r1_17.EventBgBPPathMobile and r1_17.EventBgBPPathPC
    else
      r3_17 = r1_17.EventBgBPPathPC
    end
    if r3_17 ~= nil then
      r0_17.Image_MainBG:SetVisibility(UIConst.VisibilityOp.Collapsed)
      r0_17.WidgetBGAnchor:ClearChildren()
      local r4_17 = UIManager(r0_17):CreateWidget(r3_17)
      if r4_17.InitUI then
        r4_17:InitUI(r1_17, r2_17)
      end
      if r4_17 ~= nil then
        local r5_17 = r2_17.HideBPNode
        if r5_17 then
          for r10_17, r11_17 in ipairs(r5_17) do
            if r4_17[r11_17] then
              r4_17[r11_17]:SetVisibility(UIConst.VisibilityOp.Collapsed)
            end
          end
          -- close: r6_17
        end
        local r6_17 = r0_17.WidgetBGAnchor:AddChildToOverlay(r4_17)
        r6_17:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
        r6_17:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
        if r2_0.CheckIsActivityLock(r2_17) and r4_17.Lock_In ~= nil then
          r4_17:PlayAnimationForward(r4_17.Lock_In)
        elseif r4_17.In ~= nil then
          r4_17:PlayAnimationForward(r4_17.In)
        end
        if r4_17.Spine_Char ~= nil then
          r4_17.Spine_Char:SetAnimation(0, "In", false)
          r4_17.Spine_Char:AddAnimation(0, "Loop", true, 0)
        end
        if r4_17.PlaySplineAnimation ~= nil then
          r4_17:PlaySplineAnimation()
        end
      end
      r0_17.WidgetBGAnchor:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    elseif r2_17.EventBg then
      r0_17.WidgetBGAnchor:SetVisibility(UIConst.VisibilityOp.Collapsed)
      r0_17.Image_MainBG:SetBrushResourceObject(LoadObject(r2_17.EventBg))
      r0_17.Image_MainBG:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      r0_17.WidgetBGAnchor:SetVisibility(UIConst.VisibilityOp.Collapsed)
      r0_17.Image_MainBG:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    if r1_17.EventBgSound then
      AudioManager(r0_17):PlayUISound(r0_17, "event:" .. r1_17.EventBgSound, r0_0.MainUIName, nil)
    end
  end,
  CreateActivityPage = function(r0_18, r1_18)
    -- line: [325, 341] id: 18
    local r2_18 = nil
    if CommonUtils.GetDeviceTypeByPlatformName(r0_18) == CommonConst.CLIENT_DEVICE_TYPE.PC then
      r2_18 = UIManager(r0_18):CreateWidget(r1_18.PCBluePrint)
    else
      r2_18 = UIManager(r0_18):CreateWidget(r1_18.MobileBluePrint and r1_18.PCBluePrint)
    end
    if r2_18 == nil then
      return 
    end
    r0_18.Group_Anchor:AddChildToOverlay(r2_18)
    local r3_18 = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(r2_18)
    r3_18:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
    r3_18:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
    return r2_18
  end,
  AddActivityPageToNewNode = function(r0_19, r1_19)
    -- line: [343, 350] id: 19
    if r1_19 ~= nil then
      r0_19.Group_Anchor:AddChildToOverlay(r1_19)
      local r2_19 = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(r1_19)
      r2_19:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
      r2_19:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
    end
  end,
}
