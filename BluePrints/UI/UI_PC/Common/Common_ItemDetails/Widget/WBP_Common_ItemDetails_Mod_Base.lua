-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\UI_PC\Common\Common_ItemDetails\Widget\WBP_Common_ItemDetails_Mod_Base.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("Utils.CommonUtils")
local r1_0 = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local r2_0 = ModController:GetModel()
local r3_0 = Class("BluePrints.UI.BP_UIState_C")
function r3_0.InitItemInfo(r0_1, r1_1, r2_1, r3_1)
  -- line: [18, 126] id: 1
  r0_1.EffectDetails:ClearChildren()
  local r4_1 = DataMgr.Mod[r2_1]
  local r5_1 = GText(r4_1.TypeName) .. GText(r4_1.Name)
  if ModCommon.DebugMode then
    r5_1 = r5_1 .. "_" .. r2_1
  end
  r0_1.ParentWidget.Text_ItemName:SetText(r5_1)
  if r4_1 and r4_1.FunctionDes then
    r0_1.Text_Describe:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_1.Text_Describe:SetText(GText(r4_1.FunctionDes))
  else
    r0_1.Text_Describe:SetVisibility(ESlateVisibility.Collapsed)
  end
  r0_1.Text_Polarity01:SetText(GText("UI_Tips_Polarity_Cost"))
  if r4_1.Polarity ~= CommonConst.NonePolarity then
    r0_1.Text_Polarity:SetVisibility(UIConst.VisibilityOp.Visible)
    r0_1.Text_Polarity:SetText(r2_0:GetPolarityText(r4_1.Polarity))
  else
    r0_1.Text_Polarity:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  r0_1.Text_MaxLevel:SetText(r4_1.MaxLevel)
  local r6_1 = nil
  local r7_1 = nil
  local r8_1 = nil
  local r9_1 = 0
  local r10_1 = 0
  local r11_1 = ModController:GetAvatar()
  if r11_1 and r2_1 and r11_1.GetModCount2ModId then
    r10_1 = r11_1:GetModCount2ModId(r2_1)
  end
  if r3_1 then
    if type(r3_1) == "string" and r0_0.IsObjIdStr(r3_1) then
      r3_1 = r0_0.Str2ObjId(r3_1)
    end
    r8_1 = r11_1.Mods[r3_1]
    if not r8_1 then
      DebugPrint(WarningTag, "Wbp_common_itemdetails_mod_base,,InitItemInfo , ModServerdata is nil, unitId:", r3_1)
      return 
    end
    if r2_0:IsBugMod(r3_1) then
      if r0_1.ParentWidget then
        r0_1.ParentWidget.ParentWidget:CloseItemDetailsWidget()
      end
      return 
    end
    r6_1 = r8_1.Level
    r7_1 = r8_1.CostMod
    if r8_1.CurrentModCardLevel then
      r9_1 = 0
    end
  else
    r0_1.ParentWidget:SetConflictLine(true, GText("UI_ModTips_MaxLvPreview"), 2)
    r6_1 = r4_1.MaxLevel
    r7_1 = r4_1.Cost + r4_1.MaxLevel * r4_1.CostChange
  end
  if r0_1.ParentWidget.Content.Cost then
    r7_1 = r0_1.ParentWidget.Content.Cost
  end
  r0_1.Text_Level:SetText(r6_1)
  if r4_1.MaxLevel <= r6_1 then
    UResourceLibrary.LoadObjectAsync(r0_1, "/Game/UI/UI_PC/Common/UIVX/Material/MI_Word_Wavenew.MI_Word_Wavenew", {
      r0_1,
      function(r0_2, r1_2)
        -- line: [88, 93] id: 2
        r0_2.Text_Level.Font.FontMaterial = r1_2
        r0_2.Text_Level:SetColorAndOpacity(UUIFunctionLibrary.StringToSlateColor("FFFFFFFF"))
        r0_2.Text_Plus.Font.FontMaterial = r1_2
        r0_2.Text_Plus:SetColorAndOpacity(UUIFunctionLibrary.StringToSlateColor("FFFFFFFF"))
      end
    })
  end
  r0_1.Text_Polarity02:SetText(r7_1)
  r0_1:UpdataEffectDetails(r4_1, r6_1, r8_1)
  r0_1.ParentWidget.Text_Hold02:SetText(r10_1)
  if r0_1.Text_Tag then
    r0_1.Text_Tag:SetVisibility(UIConst.VisibilityOp.Visible)
    local r12_1 = {}
    for r17_1, r18_1 in ipairs(DataMgr.ModTag[r4_1.ApplicationType].ModTagText) do
      table.insert(r12_1, GText(r18_1))
    end
    -- close: r13_1
    r0_1.Text_Tag:SetText(GText("UI_Tips_ModApplicationType") .. table.concat(r12_1, ", "))
  end
  if r8_1 and r8_1:HasCardLevel() then
    r0_1:ShowModStarLevel(r8_1)
  else
    r0_1.ParentWidget.List_ModStar:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if r0_1.ParentWidget.Img_Aura then
    if r4_1.ApplySlot and #r4_1.ApplySlot == 1 and r4_1.ApplySlot[1] == 9 then
      r0_1.ParentWidget.Img_Aura:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    else
      r0_1.ParentWidget.Img_Aura:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  r0_1:OnInitItemInfo(r4_1, r8_1)
end
function r3_0.ShowModStarLevel(r0_3, r1_3)
  -- line: [128, 139] id: 3
  r0_3.ParentWidget.List_ModStar:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_3.ParentWidget.List_ModStar:ClearListItems()
  for r5_3 = 1, r1_3.ModCardLevelMax, 1 do
    local r6_3 = NewObject(UIUtils.GetCommonItemContentClass())
    r6_3.Idx = r5_3
    r6_3.bActivate = r5_3 <= r1_3.CurrentModCardLevel
    r6_3.bGolden = false
    r0_3.ParentWidget.List_ModStar:AddItem(r6_3)
  end
  r0_3.ParentWidget.List_ModStar:RegenerateAllEntries()
end
function r3_0.OnInitItemInfo(r0_4, r1_4, r2_4)
  -- line: [142, 143] id: 4
end
function r3_0.UpdataEffectDetails(r0_5, r1_5, r2_5, r3_5)
  -- line: [145, 175] id: 5
  local r4_5 = r1_5.AddAttrs
  if r4_5 then
    for r9_5, r10_5 in ipairs(r4_5) do
      local r11_5 = DataMgr.AttrConfig[r10_5.AttrName]
      if r11_5 then
        local r12_5, r13_5 = r1_0:GenModAttrData(r10_5, r2_5, r11_5, r1_5.Id)
        local r14_5 = GText(r11_5.Name)
        local r15_5 = UIManager(r0_5):_CreateWidgetNew("CommonItemDetailsEffect")
        r15_5.Text_Effect:SetText(r14_5 .. r13_5)
        r15_5.Switch_Type:SetActiveWidgetIndex(0)
        r0_5.EffectDetails:AddChild(r15_5)
      end
    end
    -- close: r5_5
  end
  if r3_5 and r3_5.AddCharModCost then
    local r6_5 = GText("UI_Mod_CostIncrease")
    local r7_5 = UIManager(r0_5):_CreateWidgetNew("CommonItemDetailsEffect")
    r7_5.Text_Effect:SetText(r6_5 .. "+" .. r3_5:CalcExtralCharVolume())
    r7_5.Switch_Type:SetActiveWidgetIndex(0)
    r0_5.EffectDetails:AddChild(r7_5)
  end
  if r1_5.PassiveEffectsDesc then
    local r5_5 = r1_0:GenModPassiveEffectDesc(r1_5, r2_5)
    local r6_5 = UIManager(r0_5):_CreateWidgetNew("CommonItemDetailsEffect")
    r6_5.Text_Effect01:SetText(GText("UI_MOD_Effect") .. r5_5)
    r6_5.Switch_Type:SetActiveWidgetIndex(1)
    r0_5.EffectDetails:AddChild(r6_5)
  end
end
return r3_0
