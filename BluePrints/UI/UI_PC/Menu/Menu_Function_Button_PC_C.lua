-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\UI_PC\Menu\Menu_Function_Button_PC_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("EMCache.EMCache")
local r1_0 = Class("BluePrints.UI.BP_UIState_C")
r1_0._components = {
  "BluePrints.UI.UI_PC.Menu.Reddot.MainUIItem_ReddotTree_Component"
}
function r1_0.OnLoaded(r0_1, ...)
  -- line: [16, 19] id: 1
  r0_1:InitButton()
  r0_1.BtnId = 1
end
function r1_0.Construct(r0_2)
  -- line: [21, 24] id: 2
  r0_2:AddDispatcher(EventID.ConditionComplete, r0_2, r0_2.OnConditionComplete)
  r0_2.ConditionMap = {}
end
function r1_0.OnConditionComplete(r0_3, r1_3)
  -- line: [26, 31] id: 3
  if r0_3.ConditionMap[r1_3] then
    r0_3:UpdateGuidePoint()
  end
end
function r1_0.UpdateGuidePoint(r0_4)
  -- line: [33, 73] id: 4
  if r0_4.Type == "Small" then
    return 
  end
  local r1_4 = {}
  local r2_4 = GWorld:GetAvatar()
  for r7_4, r8_4 in pairs(DataMgr.MainUIGuidePoint) do
    if r8_4.EnterId == r0_4.EnterId then
      table.insert(r1_4, r8_4)
    end
  end
  -- close: r3_4
  local r3_4 = false
  for r8_4, r9_4 in pairs(r1_4) do
    if r9_4 then
      local r10_4 = false
      if r9_4.ShowCondition then
        r10_4 = ConditionUtils.CheckCondition(r2_4, r9_4.ShowCondition)
        DebugPrint("@@@Updateguidepoint Menu_Function_Button_P EnterId,ShowCondition", r9_4.EnterId, r10_4)
        r0_4.ConditionMap[r9_4.ShowCondition] = true
      end
      if r9_4.HideCondition then
        local r11_4 = ConditionUtils.CheckCondition(r2_4, r9_4.HideCondition)
        DebugPrint("@@@Updateguidepoint Menu_Function_Button_P EnterId,HideCondition", r9_4.EnterId, r11_4)
        if r11_4 then
          r10_4 = false
        end
        r0_4.ConditionMap[r9_4.HideCondition] = true
      end
      if not r3_4 then
        r3_4 = r10_4
        DebugPrint("@@@Updateguidepoint Menu_Function_Button_P UpdateCurrentShow EnterId,CurrentPointShow", r9_4.EnterId, r3_4)
      end
    end
  end
  -- close: r4_4
  DebugPrint("@@@Updateguidepoint Menu_Function_Button_P Update Final Current Show,CurrentPointShow", r3_4)
  if r3_4 then
    r0_4.Icon_GuidePoint:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    r0_4.Icon_GuidePoint:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r1_0.LoadImage(r0_5, r1_5, r2_5)
  -- line: [75, 101] id: 5
  if not r0_5.ConditionMap then
    r0_5.ConditionMap = {}
  end
  r0_5.Type = r2_5
  local r3_5 = DataMgr.MainUI
  local r4_5 = r1_5
  r0_5.EnterId = r4_5
  local r5_5 = r3_5[r4_5].Icon
  if r5_5 == nil then
    r5_5 = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Armory.T_Entrance_Armory"
  end
  r0_5:SetButtonStyle(r5_5)
  if r4_5 == CommonConst.ArmoryEnterId then
    r0_5:UpdateArmoryIcon()
  end
  if r2_5 == "Large" then
    r0_5.Text_Entrance_World:SetText(EnText(r3_5[r4_5].Name))
  end
  if r2_5 ~= "Small" then
    r0_5.Text_Entrance:SetText(GText(r3_5[r4_5].Name))
  end
  r0_5:PlayAnimation(r0_5.Normal)
  r0_5:ReddotTreePlugIn(r3_5[r4_5], "Esc")
  r0_5:UpdateGuidePoint()
end
function r1_0.Destruct(r0_6)
  -- line: [103, 106] id: 6
  r0_6:ReddotTreePlugOut()
  r1_0.Super.Destruct(r0_6)
end
function r1_0.UpdateArmoryIcon(r0_7)
  -- line: [108, 117] id: 7
  local r1_7 = GWorld:GetAvatar()
  if not r1_7 then
    return 
  end
  r0_7:SetButtonStyle(DataMgr.Char[r1_7.Chars[r1_7.CurrentChar].CharId].EscIcon)
end
function r1_0.SetButtonStyle(r0_8, r1_8)
  -- line: [119, 129] id: 8
  local r2_8 = LoadObject(r1_8)
  if r2_8 ~= nil then
    local r3_8 = r0_8.Icon_Entrance:GetDynamicMaterial()
    if r3_8 then
      r3_8:SetTextureParameterValue("IconTex", r2_8)
    else
      r0_8.Icon_Entrance:SetBrushResourceObject(r2_8)
    end
  end
end
function r1_0.BtnOnClick(r0_9)
  -- line: [133, 150] id: 9
  if r0_9.Type == "Small" then
    AudioManager(r0_9):PlayUISound(nil, "event:/ui/common/click_btn_sort_tab", nil, nil)
  elseif r0_9.Type == "Large" then
    AudioManager(r0_9):PlayUISound(nil, "event:/ui/common/click_mid", nil, nil)
  else
    AudioManager(r0_9):PlayUISound(nil, "event:/ui/common/click_mid", nil, nil)
  end
  local r1_9 = DataMgr.MainUI[r0_9.EnterId]
  if r0_9.LinkName and r1_9 and r1_9.IfNoUI then
    r0_9.Link = GLink(r0_9.LinkName)
    UE4.UKismetSystemLibrary.LaunchURL(r0_9.Link)
  elseif r0_9.LinkName then
    UIUtils.OpenSystem(r0_9.BtnId, true, r0_9.LinkName)
  else
    UIUtils.OpenSystem(r0_9.BtnId, true)
  end
end
function r1_0.UpdateRedDot(r0_10)
  -- line: [154, 156] id: 10
end
function r1_0.SetRedDot(r0_11, r1_11, r2_11, r3_11, r4_11)
  -- line: [158, 175] id: 11
  r0_11.New:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_11.Reddot:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if r1_11 then
    r0_11.New:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    return 
  end
  if r2_11 then
    r0_11.Reddot:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  if r3_11 == 3 and r4_11 > 0 then
    r0_11.Reddot:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_11.Reddot_Num:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_11.Reddot_Num:SetNum(r4_11)
  else
    r0_11.Reddot_Num:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r1_0.InitButton(r0_12, r1_12, r2_12, r3_12)
  -- line: [177, 199] id: 12
  r0_12.Owner = r1_12
  if r2_12 then
    r0_12:SetRenderOpacity(0.6)
    if r3_12 then
      local function r4_12(r0_13)
        -- line: [182, 184] id: 13
        UIManager(r0_13):ShowUITip("CommonToastMain", GText(r3_12))
      end
      r0_12.Button_Area:SetForbidden(true)
      r0_12:SetRedDot(false)
      r0_12.Button_Area.OnClicked:Add(r0_12, r4_12)
    end
    return 
  end
  r0_12.Button_Area.OnClicked:Add(r0_12, r0_12.OnBtnClicked)
  r0_12.Button_Area.OnPressed:Add(r0_12, r0_12.OnBtnPressed)
  if CommonUtils.GetDeviceTypeByPlatformName(r0_12) == "PC" then
    r0_12.Button_Area.OnHovered:Add(r0_12, r0_12.OnBtnHovered)
    r0_12.Button_Area.OnUnhovered:Add(r0_12, r0_12.OnBtnUnhovered)
  end
  r0_12.Button_Area.OnReleased:Add(r0_12, r0_12.OnBtnReleased)
end
function r1_0.PlayButtonClickSound(r0_14)
  -- line: [202, 204] id: 14
  UIUtils.PlayCommonBtnSe(r0_14)
end
function r1_0.PlayButtonClickAnimation(r0_15)
  -- line: [206, 209] id: 15
  r0_15:StopAllAnimations()
  r0_15:PlayAnimation(r0_15.Click)
end
function r1_0.OnBtnClicked(r0_16)
  -- line: [211, 227] id: 16
  r0_16:PlayButtonClickAnimation()
  if r0_16.Owner then
    r0_16.Owner:PlayAnimation(r0_16.Owner.Normal)
  end
  if r0_16.Owner and r0_16.Owner.IsEditOpen then
    r0_16.Owner.IsEditOpen = false
    r0_16.Owner:BindToAnimationFinished(r0_16.Owner.Edit_List_Out, {
      r0_16.Owner,
      function()
        -- line: [218, 221] id: 17
        r0_16:BtnOnClick()
        r0_16.Owner:UnbindAllFromAnimationFinished(r0_16.Owner.Edit_List_Out)
      end
    })
    r0_16.Owner:PlayAnimation(r0_16.Owner.Edit_List_Out)
  else
    r0_16:BtnOnClick()
  end
end
function r1_0.PlayButtonPressAnim(r0_18)
  -- line: [231, 235] id: 18
  r0_18:StopAllAnimations()
  r0_18:PlayAnimation(r0_18.Press)
end
function r1_0.OnBtnPressed(r0_19)
  -- line: [237, 240] id: 19
  r0_19.IsPressing = true
  r0_19:PlayButtonPressAnim()
end
function r1_0.PlayButtonHoverAnim(r0_20)
  -- line: [244, 248] id: 20
  r0_20:StopAllAnimations()
  r0_20:PlayAnimation(r0_20.Hover)
end
function r1_0.OnBtnHovered(r0_21)
  -- line: [250, 253] id: 21
  r0_21.IsHovering = true
  r0_21:PlayButtonHoverAnim()
end
function r1_0.SetBtnHovered(r0_22, r1_22)
  -- line: [255, 261] id: 22
  if r1_22 then
    r0_22:OnBtnHovered()
  else
    r0_22:OnBtnUnhovered()
  end
end
function r1_0.PlayButtonReleaseButHoverAnim(r0_23)
  -- line: [266, 269] id: 23
  r0_23:StopAllAnimations()
  r0_23:PlayButtonHoverAnim()
end
function r1_0.PlayButtonReleaseAndUnHoverAnim(r0_24)
  -- line: [271, 274] id: 24
  r0_24:StopAllAnimations()
  r0_24:SwitchNormalAnimation()
end
function r1_0.OnBtnReleased(r0_25)
  -- line: [276, 287] id: 25
  r0_25.IsPressing = false
  if CommonUtils.GetDeviceTypeByPlatformName(r0_25) == "PC" then
    if not r0_25.IsHovering then
      r0_25:PlayButtonReleaseAndUnHoverAnim()
    else
      r0_25:PlayButtonReleaseButHoverAnim()
    end
  else
    r0_25:PlayAnimation(r0_25.Normal)
  end
end
function r1_0.PlayButtonUnHoverAnim(r0_26)
  -- line: [291, 294] id: 26
  r0_26:StopAllAnimations()
  r0_26:SwitchNormalAnimation()
end
function r1_0.OnBtnUnhovered(r0_27)
  -- line: [296, 301] id: 27
  r0_27.IsHovering = false
  if not r0_27.IsPressing then
    r0_27:PlayButtonUnHoverAnim()
  end
end
function r1_0.SwitchNormalAnimation(r0_28)
  -- line: [304, 307] id: 28
  r0_28:PlayAnimation(r0_28.UnHover)
end
AssembleComponents(r1_0)
return r1_0
