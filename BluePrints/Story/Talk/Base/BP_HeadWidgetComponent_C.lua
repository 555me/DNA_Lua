-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Story\Talk\Base\BP_HeadWidgetComponent_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class("BluePrints.Common.TimerMgr")
local r1_0 = require("BluePrints.UI.TaskPanel.TaskUtils")
local r2_0 = require("Const")
function r0_0.Initialize(r0_1, r1_1)
  -- line: [12, 17] id: 1
  r0_1.OwnerLocation = nil
  r0_1.State = 0
  r0_1.HeadImpressionWidgetMgr = nil
  r0_1.HideTags = {}
end
function r0_0.ReceiveBeginPlay(r0_2)
  -- line: [19, 29] id: 2
  r0_2.Owner = r0_2:GetOwner()
  if r0_2.Owner.Eid then
    UIManager(r0_2):AddWidgetComponentToList(r0_2.Owner.Eid, "NPCHeadWidget", r0_2)
  else
    UIManager(r0_2):AddWidgetComponentToList(r0_2.Owner, "NPCHeadWidget", r0_2)
  end
  r0_2.Overridden.ReceiveBeginPlay(r0_2)
end
function r0_0.ReceiveEndPlay(r0_3, r1_3)
  -- line: [31, 35] id: 3
  UIManager(r0_3):RemoveWidgetComponentToList(r0_3.Owner.Eid, "NPCHeadWidget")
  r0_3:TryReleaseWidgetInternal()
  r0_3.Owner = nil
end
function r0_0.UnsetAttachedWidget(r0_4, r1_4)
  -- line: [38, 40] id: 4
  r1_4.AttachedWidgetComponent = nil
end
function r0_0.GetOrCreateWidget(r0_5, r1_5)
  -- line: [42, 98] id: 5
  if not r0_5:CheckCanGetWidget(r1_5) then
    return 
  end
  if r0_5.ReleaseTimer then
    r0_5:RemoveTimer(r0_5.ReleaseTimer)
    r0_5.ReleaseTimer = nil
  end
  local r2_5 = r0_5:GetWidget()
  if IsValid(r2_5) then
    return r2_5
  end
  local r3_5 = UNpcHeadUISubsystem.GetHeadUISubsystem(r0_5)
  if r3_5 then
    r2_5 = r3_5:TryGetHeadWidget(r0_5)
  end
  if not r2_5 then
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, UE.EStoryLogType.NPC, "获取头顶UI失败", string.format("HeadWidgetComponent获取头顶Widget时失败 NPCId:%d", r0_5:GetOwner().NpcId))
    return 
  end
  r2_5:InitSubWidgets()
  r0_5:SetWidget(r2_5)
  r2_5:SetAttachedWidget(r0_5)
  r2_5:SetWidgetInitBubble(r0_5)
  r0_5:UpdateUniformWidgetHide()
  if not r0_5.bIsRegionPlayerHeadUI then
    r0_5:OcclusionTestFuncWithoutAnim()
  end
  if r0_5.bIsRegionPlayerHeadUI then
    r0_5.RealVisibility = UIConst.VisibilityOp.Collapsed
    function r0_5.BindFunc(r0_6, r1_6)
      -- line: [78, 92] id: 6
      if r2_5.bTempHide then
        return 
      end
      r0_5:SetWidgetHiddenByTag(r1_6 == UIConst.VisibilityOp.Collapsed, "OutTag")
    end
    r2_5.OnVisibilityChanged:Add(r0_5, r0_5.BindFunc)
    r2_5:SetVisibility(ESlateVisibility.Collapsed)
  end
  return r2_5
end
function r0_0.CheckCanGetWidget(r0_7, r1_7)
  -- line: [100, 115] id: 7
  if UE4.URegionSyncSubsystem.GetInstance(r0_7) ~= nil then
    return true
  end
  if (r1_7 == "Impression" or r1_7 == "Name") and (not r0_7.Owner or not r0_7.Owner.Mesh or not r0_7.Owner.Mesh.SkeletalMesh) then
    return false
  end
  if not r0_7.Owner then
    return false
  end
  return true
end
function r0_0.TryReleaseWidgetInternal(r0_8)
  -- line: [117, 142] id: 8
  r0_8:RemoveOcclusionTestTimer()
  r0_8:SetWidgetRenderOpacity(1)
  r0_8.HideTags.Occlusion = nil
  r0_8:CleanTimer()
  local r1_8 = r0_8:GetWidget()
  if not IsValid(r1_8) then
    return 
  end
  r1_8.HideTags = {}
  local r2_8 = UNpcHeadUISubsystem.GetHeadUISubsystem(r0_8)
  if r0_8:GetOwner() and r2_8 then
    if r0_8.BindFunc then
      r1_8.OnVisibilityChanged:Remove(r0_8, r0_8.BindFunc)
      r0_8.BindFunc = nil
    end
    r2_8:TryReleaseHeadWidget(r0_8, r1_8)
  end
  r0_8:SetWidget(nil)
  r1_8:UnsetAttachedWidget()
  r0_8.ReleaseTimer = nil
end
function r0_0.EnableWidget(r0_9, r1_9, ...)
  -- line: [144, 151] id: 9
  local r2_9 = r0_9:GetOrCreateWidget(r1_9)
  if not IsValid(r2_9) then
    return 
  end
  r2_9:EnableWidget(r1_9, ...)
end
function r0_0.DisableWidget(r0_10, r1_10, ...)
  -- line: [153, 160] id: 10
  local r2_10 = r0_10:GetWidget()
  if r2_10 then
    r2_10:DisableWidget(r1_10, ...)
  end
end
function r0_0.NeedForceInit(r0_11)
  -- line: [162, 164] id: 11
  return r0_11.State == 0
end
function r0_0.OnChangeActiveWidgets(r0_12, r1_12)
  -- line: [170, 180] id: 12
  r0_12.State = r1_12
  if r1_12 == 0 then
    if not r0_12.ReleaseTimer then
      r0_12.ReleaseTimer = r0_12:AddTimer(0.3, r0_12.TryReleaseWidgetInternal)
    end
  else
    r0_12:AddOcclusionTestTimer()
  end
end
function r0_0.UpdateUniformWidgetHide(r0_13)
  -- line: [182, 194] id: 13
  local r1_13 = r0_13:IsHidden()
  local r2_13 = r0_13:GetWidget()
  if IsValid(r2_13) then
    r2_13.bTempHide = true
    if r1_13 then
      r2_13:Hide()
    else
      r2_13:Show()
    end
    r2_13.bTempHide = nil
  end
end
function r0_0.SetUniformWidgetHideTags(r0_14, r1_14)
  -- line: [197, 200] id: 14
  r0_14.HideTags = r1_14
  r0_14:UpdateUniformWidgetHide()
end
function r0_0.SetUniformWidgetHideTag(r0_15, r1_15, r2_15)
  -- line: [204, 207] id: 15
  r0_15:UpdateTag(r1_15, r2_15)
  r0_15:UpdateUniformWidgetHide()
end
function r0_0.SetWidgetHiddenByTag(r0_16, r1_16, r2_16)
  -- line: [209, 211] id: 16
  r0_16:SetUniformWidgetHideTag(r1_16, r2_16)
end
function r0_0.SetUniformWidgetHideWithAnim(r0_17, r1_17, r2_17)
  -- line: [215, 222] id: 17
  local r3_17 = r0_17:GetWidget()
  if r0_17:CheckAndUpdateTag(r1_17, r2_17) and IsValid(r3_17) then
    r3_17:PlayHideAnimation(r1_17)
  end
  r0_17:TriggerAllSpecialSideIndicatorUIObjVisible(r1_17)
end
function r0_0.TriggerAllSpecialSideIndicatorUIObjVisible(r0_18, r1_18)
  -- line: [224, 234] id: 18
  if not r0_18.Owner then
    return 
  end
  local r2_18 = UIManager(r0_18):GetUIObj("UnSpecialSide_" .. tostring(r0_18.Owner.UnitId))
  if r2_18 and r1_18 == true then
    r2_18:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  elseif r2_18 and r1_18 == false then
    r2_18:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r0_0.IsHidden(r0_19)
  -- line: [237, 239] id: 19
  return not IsEmptyTable(r0_19.HideTags)
end
function r0_0.UpdateTag(r0_20, r1_20, r2_20)
  -- line: [243, 249] id: 20
  if r1_20 then
    r0_20.HideTags[r2_20] = 1
  else
    r0_20.HideTags[r2_20] = nil
  end
end
function r0_0.CheckAndUpdateTag(r0_21, r1_21, r2_21)
  -- line: [254, 258] id: 21
  local r3_21 = r0_21:IsHidden()
  r0_21:UpdateTag(r1_21, r2_21)
  return r3_21 ~= r0_21:IsHidden()
end
function r0_0.SetWidgetRenderOpacity(r0_22, r1_22)
  -- line: [260, 265] id: 22
  local r2_22 = r0_22:GetWidget()
  if IsValid(r2_22) then
    r2_22.Root:SetRenderOpacity(r1_22)
  end
end
local function r3_0(r0_23, r1_23)
  -- line: [267, 276] id: 23
  local r3_23 = 3
  if CommonConst.SystemLanguage == CommonConst.SystemLanguages.EN then
    r3_23 = 2
  end
  local r4_23 = string.len(r0_23) / 3
  local r5_23 = nil	-- notice: implicit variable refs by block#[5]
  if r1_23 then
    r5_23 = 10
    if not r5_23 then
      ::label_20::
      r5_23 = 22
    end
  else
    goto label_20	-- block#4 is visited secondly
  end
  r5_23 = r4_23 / r5_23
  return math.max(r5_23 * r2_0.BubbleTimePerLine, r2_0.BubbleTimePerLine)
end
function r0_0.EnableBubbleWidget(r0_24, r1_24, r2_24, r3_24)
  -- line: [278, 298] id: 24
  local r4_24 = "Long_Bubble"
  if r3_24 then
    r4_24 = "Short_Bubble"
  end
  r0_24:DisableWidget(r4_24)
  if r0_24.DisableBubbleTimer then
    r0_24:RemoveTimer(r0_24.DisableBubbleTimer)
    r0_24.DisableBubbleTimer = nil
  end
  local r5_24 = GText(r1_24)
  if r2_24 and r2_24 < 0 then
    r2_24 = r3_0(r5_24, r3_24)
  end
  r0_24:EnableWidget(r4_24, r5_24, nil, r2_24)
  if r2_24 and r2_24 >= 0 then
    r0_24.DisableBubbleTimer = r0_24:AddTimer(r2_24, function()
      -- line: [294, 296] id: 25
      r0_24:DisableWidget(r4_24)
    end, false)
  end
end
return r0_0
