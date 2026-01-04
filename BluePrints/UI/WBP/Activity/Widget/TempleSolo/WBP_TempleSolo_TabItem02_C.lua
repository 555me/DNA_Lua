-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Activity\Widget\TempleSolo\WBP_TempleSolo_TabItem02_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.BP_UIState_C"
})
function r0_0.Construct(r0_1)
  -- line: [17, 19] id: 1
  r0_1.Btn_Click.OnClicked:Add(r0_1, r0_1.OnButtonClicked)
end
function r0_0.Destruct(r0_2)
  -- line: [24, 26] id: 2
  ReddotManager.RemoveListener("TempleSoloNewLevel", r0_2)
end
function r0_0.OnListItemObjectSet(r0_3, r1_3)
  -- line: [28, 39] id: 3
  r0_3:Init(r1_3)
  r0_3.New:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if not r0_3.ListenerAdded then
    r0_3.ListenerAdded = true
    if not ReddotManager.GetTreeNode("TempleSoloNewLevel") then
      ReddotManager.AddNodeEx("TempleSoloNewLevel")
    end
    ReddotManager.AddListenerEx("TempleSoloNewLevel", r0_3, r0_3.UpdateReddot)
  end
end
function r0_0.Init(r0_4, r1_4)
  -- line: [41, 71] id: 4
  r0_4.Content = r1_4
  r0_4.TempleId = r1_4.TempleId
  r0_4.TempleTypeId = r1_4.TempleTypeId
  r0_4.IsHardMode = r1_4.IsHardMode
  r0_4.Level = r1_4.Level
  r0_4.Parent = r1_4.Parent
  r0_4.EventId = r1_4.EventId
  r0_4.State = "Received"
  r0_4.IsSelected = false
  r0_4.Text_Num:SetText(tostring(r1_4.Level))
  r0_4.Text_Num_Hover:SetText(tostring(r1_4.Level))
  if r0_4.IsHardMode then
    r0_4.Panel_Challenge:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_4.Text_Challenge:SetText(GText("UI_TempleEvent_HardModeShort"))
  else
    r0_4.Panel_Challenge:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  r0_4.TEMPLE_TYPE_COLOR = {
    [1080011] = "Red",
    [1080012] = "Blue",
    [1080013] = "Yellow",
  }
  r0_4:SetColor()
  r0_4:SetState(r0_4.TempleId)
  if r1_4.DelaySelected then
    r0_4:SetSelected(true)
  end
end
function r0_0.SetState(r0_5, r1_5)
  -- line: [73, 101] id: 5
  if not r1_5 then
    r1_5 = r0_5.TempleId
  end
  r0_5.State = "Received"
  local r2_5 = DataMgr.TempleEventLevel[r1_5]
  local r3_5 = r2_5.PreDungeon
  if not r2_5 then
    return 
  end
  local r4_5 = r2_5.UnlockDate
  if r4_5 and TimeUtils.NowTime() < r4_5 then
    r0_5.State = "Lock"
  elseif not r0_5.Parent:CheckPreDungeonPass(r3_5) then
    r0_5.State = "Lock"
  else
    local r5_5 = GWorld:GetAvatar()
    if r5_5 and r5_5.Temple[r0_5.EventId] then
      local r6_5 = r5_5.Temple[r0_5.EventId].FinishStars[r1_5] and 0
      if r0_5.IsHardMode and r6_5 == 3 then
        r0_5.State = "Clear"
      elseif r6_5 == 3 then
        r0_5.State = "Clear"
      end
    end
  end
  r0_5:PlayAnimation(r0_5[r0_5.State])
  r0_5:TryIncreaceTempleSoloNewLevelReddot()
end
function r0_0.OnButtonClicked(r0_6)
  -- line: [103, 107] id: 6
  if r0_6.IsSelected then
    return 
  end
  r0_6.IsSelected = true
  r0_6.Parent:OnSubTabItemClicked(r0_6.Content)
end
function r0_0.OnMouseEnter(r0_7, r1_7, r2_7)
  -- line: [109, 114] id: 7
  if not r0_7.IsSelected then
    r0_7:PlayAnimation(r0_7.Hover)
    r0_7.IsHoverState = true
  end
end
function r0_0.OnMouseLeave(r0_8, r1_8)
  -- line: [116, 121] id: 8
  if not r0_8.IsSelected and r0_8.IsHoverState then
    r0_8:PlayAnimation(r0_8.UnHover)
    r0_8.IsHoverState = false
  end
end
function r0_0.SetSelected(r0_9, r1_9)
  -- line: [123, 155] id: 9
  if r1_9 then
    r0_9.IsSelected = true
    r0_9:StopAllAnimations()
    if r0_9.State == "Lock" then
      r0_9:PlayAnimation(r0_9.Lock_Click)
    else
      r0_9:PlayAnimation(r0_9.Click)
    end
    if not ReddotManager.GetTreeNode("TempleSoloNewLevel") then
      ReddotManager.AddNodeEx("TempleSoloNewLevel")
    end
    local r2_9 = ReddotManager.GetLeafNodeCacheDetail("TempleSoloNewLevel")
    if r2_9[r0_9.Content.TempleId] == 1 then
      r2_9[r0_9.Content.TempleId] = 0
      ReddotManager.DecreaseLeafNodeCount("TempleSoloNewLevel")
      local r3_9 = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(r0_9.Parent.List_Tab, r0_9.Parent.List_Tab:GetIndexForItem(r0_9.Parent.CurrentSelectTabContent))
      if r3_9 then
        r3_9:UpdateReddot()
      end
      r0_9.New:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  else
    r0_9.IsSelected = false
    r0_9:PlayAnimation(r0_9.Normal)
    r0_9:AddTimer(0.01, function()
      -- line: [151, 153] id: 10
      r0_9:PlayAnimation(r0_9[r0_9.State])
    end)
  end
end
function r0_0.SetColor(r0_11)
  -- line: [157, 170] id: 11
  local r1_11 = r0_11.TEMPLE_TYPE_COLOR[r0_11.TempleTypeId]
  r0_11.Text_Num:SetColorAndOpacity(r0_11["Color_" .. r1_11])
  r0_11.Text_Challenge:SetColorAndOpacity(r0_11["Color_" .. r1_11])
  r0_11.BG_VX_Click_1:SetBrushTintColor(r0_11["Color_" .. r1_11])
  r0_11.BG_VX_Glow:SetBrushTintColor(r0_11["Color_" .. r1_11])
  r0_11.BG_VX_Glow_1:SetBrushTintColor(r0_11["Color_" .. r1_11])
  local r2_11 = r0_11.RetainerBox_0:GetEffectMaterial()
  if r2_11 then
    r2_11:SetVectorParameterValue("MainColor", r0_11["Color_" .. r1_11].SpecifiedColor)
  end
end
function r0_0.UpdateReddot(r0_12)
  -- line: [172, 182] id: 12
  if not ReddotManager.GetTreeNode("TempleSoloNewLevel") then
    ReddotManager.AddNodeEx("TempleSoloNewLevel")
  end
  if ReddotManager.GetLeafNodeCacheDetail("TempleSoloNewLevel")[r0_12.Content.TempleId] == 1 then
    r0_12.New:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  else
    r0_12.New:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r0_0.TryIncreaceTempleSoloNewLevelReddot(r0_13)
  -- line: [184, 194] id: 13
  if not ReddotManager.GetTreeNode("TempleSoloNewLevel") then
    ReddotManager.AddNodeEx("TempleSoloNewLevel")
  end
  local r1_13 = ReddotManager.GetLeafNodeCacheDetail("TempleSoloNewLevel")
  if not r1_13[r0_13.Content.TempleId] and r0_13.State ~= "Lock" then
    r1_13[r0_13.Content.TempleId] = 1
    ReddotManager.IncreaseLeafNodeCount("TempleSoloNewLevel")
    r0_13.New:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  end
end
return r0_0
