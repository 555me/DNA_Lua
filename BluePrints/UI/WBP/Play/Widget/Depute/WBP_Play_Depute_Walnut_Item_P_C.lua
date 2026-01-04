-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Play\Widget\Depute\WBP_Play_Depute_Walnut_Item_P_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})
function r0_0.OnListItemObjectSet(r0_1, r1_1)
  -- line: [26, 37] id: 1
  r0_1.Root:SetRenderOpacity(0)
  r0_1.ScrollBox_List:ClearChildren()
  r0_1.Content = r1_1
  r0_1.DungeonData = r1_1.DungeonData
  r0_1.DungeonIds = r1_1.DungeonIds
  r0_1.Parent = r1_1.Parent
  r1_1.SelfWidget = r0_1
  r0_1:InitItemContent()
  r0_1.ScrollBox_List:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Wrap)
end
function r0_0.BP_OnEntryReleased(r0_2)
  -- line: [39, 43] id: 2
  if r0_2.Content then
    r0_2.Content.SelfWidget = nil
  end
end
function r0_0.SetWalnutTitleMatColor(r0_3, r1_3)
  -- line: [45, 59] id: 3
  if r1_3 == 1 then
    r0_3.TextColor = r0_3.Sx_Text_WalnutTypeTitleMatColor
    r0_3.ImageBG_LightColor = r0_3.Sx_ImageBG_LightColor
    r0_3.VX_BGLightColor = r0_3.Sx_VX_BGLightColor
  elseif r1_3 == 2 then
    r0_3.TextColor = r0_3.Zl_Text_WalnutTypeTitleMatColor
    r0_3.ImageBG_LightColor = r0_3.Zl_ImageBG_LightColor
    r0_3.VX_BGLightColor = r0_3.Zl_VX_BGLightColor
  else
    r0_3.TextColor = r0_3.Hl_Text_WalnutTypeTitleMatColor
    r0_3.ImageBG_LightColor = r0_3.Hl_ImageBG_LightColor
    r0_3.VX_BGLightColor = r0_3.Hl_VX_BGLightColor
  end
end
function r0_0.InitItemContent(r0_4)
  -- line: [61, 174] id: 4
  if not r0_4.DungeonData then
    return 
  end
  r0_4.Mobile = CommonUtils.GetDeviceTypeByPlatformName(r0_4) == "Mobile"
  r0_4:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_4:PlayAnimation(r0_4.In)
  local r1_4 = DataMgr.WalnutType[r0_4.DungeonData.WalnutType]
  if not r1_4 then
    DebugPrint("Error: WalnutTypeData not found for WalnutType: ", r0_4.DungeonData.WalnutType)
    return 
  end
  r0_4.Image_WalnutIcon:SetBrushResourceObject(LoadObject(r1_4.TypeIcon))
  r0_4.Text_WalnutTypeTitle:SetText(GText(r1_4.Name))
  r0_4.Text_HaveTitle:SetText(GText("UI_NUM_NAME"))
  r0_4.Text_Open:SetText(GText("UI_Walnut_Dungeon_Opening"))
  r0_4.ImageBG_LightColor = FLinearColor()
  r0_4.VX_BGLightColor = FLinearColor()
  r0_4.TextColor = FLinearColor()
  r0_4:SetWalnutTitleMatColor(r0_4.DungeonData.WalnutType)
  r0_4.ImageBG_Light:SetColorAndOpacity(r0_4.ImageBG_LightColor)
  r0_4.VX_BGLight:SetColorAndOpacity(r0_4.VX_BGLightColor)
  r0_4.Text_WalnutTypeTitle:GetDynamicFontMaterial():SetVectorParameterValue("MainColor", r0_4.TextColor)
  local r4_4 = GWorld:GetAvatar()
  if not r4_4 then
    return 
  end
  r0_4.WalnutsInBag = r4_4.Walnuts.WalnutBag
  local r5_4 = 0
  for r10_4, r11_4 in pairs(r0_4.WalnutsInBag) do
    local r12_4 = DataMgr.Walnut[r10_4]
    if r12_4 and r0_4.DungeonData.WalnutType == r12_4.WalnutType then
      r5_4 = r5_4 + r11_4
    end
  end
  -- close: r6_4
  r0_4.Text_HaveNum:SetText(r5_4)
  table.sort(r0_4.DungeonIds, function(r0_5, r1_5)
    -- line: [140, 149] id: 5
    local r2_5 = DataMgr.Dungeon[r0_5]
    local r3_5 = DataMgr.Dungeon[r1_5]
    if not r2_5 or not r3_5 then
      return false
    end
    return r2_5.DungeonLevel < r3_5.DungeonLevel
  end)
  r0_4.ItemTable = {}
  local r6_4 = 0
  for r11_4, r12_4 in pairs(r0_4.DungeonIds) do
    local r13_4 = DataMgr.Dungeon[r12_4]
    if not r13_4 then
      DebugPrint("Error: Cannot find dungeon data for DungeonId:", r12_4)
      break
    else
      r6_4 = r6_4 + 1
      local r14_4 = UIManager(r0_4):_CreateWidgetNew("Walnut_LevelItem")
      r14_4:Init(r13_4, r0_4.DungeonIds, r1_4, r0_4.DungeonData.WalnutType, r0_4.Parent)
      r0_4.ScrollBox_List:AddChild(r14_4)
    end
  end
  -- close: r7_4
  r0_4.ScrollBox_List:GetChildAt(r6_4 + -1):SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  if r6_4 >= 3 then
    return 
  end
  for r10_4 = 1, 3 - r6_4, 1 do
    local r11_4 = UIManager(r0_4):_CreateWidgetNew("Walnut_LevelItem")
    r11_4:Init(nil)
    r0_4.ScrollBox_List:AddChild(r11_4)
  end
end
function r0_0.OnMouseEnter(r0_6, r1_6, r2_6)
  -- line: [178, 186] id: 6
  r0_6.IsEnter = true
  if r0_6.IsUnLocked or r0_6.Mobile or r0_6:IsAnimationPlaying(r0_6.In) then
    return 
  end
  AudioManager(r0_6):PlayUISound(r0_6, "event:/ui/common/mihan_camp_hover", nil, nil)
  r0_6:StopAllAnimations()
  r0_6:PlayAnimation(r0_6.Hover)
end
function r0_0.OnMouseLeave(r0_7, r1_7, r2_7)
  -- line: [188, 195] id: 7
  r0_7.IsEnter = false
  if r0_7.IsUnLocked or r0_7.Mobile or r0_7:IsAnimationPlaying(r0_7.In) then
    return 
  end
  r0_7:StopAllAnimations()
  r0_7:PlayAnimation(r0_7.Unhover)
end
function r0_0.OnFocusReceived(r0_8, r1_8, r2_8)
  -- line: [197, 203] id: 8
  r0_8.ScrollBox_List:GetChildAt(0).Btn_Click:SetFocus()
  r0_8.Parent:UpdatKeyDisplay()
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end
return r0_0
