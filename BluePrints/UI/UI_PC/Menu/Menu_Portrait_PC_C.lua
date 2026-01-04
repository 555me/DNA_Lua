-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\UI_PC\Menu\Menu_Portrait_PC_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "Blueprints.UI.BP_UIState_C"
})
function r0_0.Initialize(r0_1, r1_1)
  -- line: [13, 15] id: 1
  r0_1.Super.Initialize(r0_1)
end
function r0_0.OnLoaded(r0_2, ...)
  -- line: [17, 18] id: 2
end
function r0_0.SetImage(r0_3, r1_3, r2_3, r3_3)
  -- line: [20, 57] id: 3
  if r1_3 == nil then
    r1_3 = "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Armory.T_Entrance_Armory"
  end
  local r4_3 = LoadObject(r1_3)
  if r4_3 ~= nil then
    local r5_3 = r0_3.Img_Item:GetDynamicMaterial()
    if r0_3.IsHeadFrame then
      r0_3.Img_Item:SetBrushResourceObject(r4_3)
    else
      r5_3:SetTextureParameterValue("IconMap", r4_3)
    end
  end
  r0_3.Icon_Empty:SetVisibility(UIConst.VisibilityOp.Collapsed)
  local r5_3 = GWorld:GetAvatar()
  if r5_3 then
    if r2_3 == r5_3.HeadFrameId then
      r0_3:PlayAnimation(r0_3.Select_Normal)
      r0_3:PlayAnimation(r0_3.Click)
      r0_3.IsSelect = true
    end
    if r2_3 == -1 then
      r0_3.Icon_Empty:SetVisibility(UIConst.VisibilityOp.Visible)
    end
  end
  if r0_3.IsSelect then
    r0_3:SetGamePadFocus()
  end
  -- warn: not visited block [9]
  -- block#9:
  -- r0_3:PlayAnimation(r0_3.Select_Normal)
  -- r0_3:PlayAnimation(r0_3.Click)
  -- r0_3.IsSelect = true
  -- goto label_65
end
function r0_0.SetGamePadFocus(r0_4)
  -- line: [59, 67] id: 4
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad and r0_4.GameInputModeSubsystem then
    r0_4.GameInputModeSubsystem:SetTargetUIFocusWidget(r0_4)
    r0_4.GameInputModeSubsystem:UpdateCurrentFocusWidgetPos()
  end
end
function r0_0.OnListItemObjectSet(r0_5, r1_5)
  -- line: [70, 111] id: 5
  r0_5.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(r0_5)
  r0_5.Owner = r1_5.Owner
  r0_5.Content = r1_5
  r0_5:StopAllAnimations()
  r0_5:PlayAnimation(r0_5.Normal)
  r0_5:PlayAnimation(r0_5.UnSelect)
  r0_5.Img_Item:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_5.Btn_Click:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_5:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_5.New:SetEnable(false)
  r0_5.Icon_Empty:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_5.IsSelect = false
  if r1_5.IsEmpty then
    r0_5.IsEmpty = true
    r1_5.SelfWidget = r0_5
    r0_5:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    r0_5.Btn_Click:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    r0_5.Img_Item:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return 
  end
  r1_5.SelfWidget = r0_5
  r0_5.IsHeadFrame = r1_5.IsHeadFrame
  r0_5.PortraitId = r1_5.PortraitId
  if r0_5.IsSelect then
    r0_5:PlayAnimation(r0_5.Select_Normal)
  end
  if r1_5.PortraitId == -1 then
    r0_5.Img_Item:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  r0_5:SetImage(r1_5.PortraitPath, r1_5.PortraitId, r1_5.IsHeadFrame)
  if r1_5.IsHeadFrame then
    r0_5:AddReddotListener("PortraitFrame", r0_5.OnPortraitFrameReddotChange)
  else
    r0_5:AddReddotListener("Portrait", r0_5.OnPortraitReddotChange)
  end
  r0_5.Btn_Click.OnClicked:Add(r0_5, r0_5.OnClicked)
  r0_5.Btn_Click.OnPressed:Add(r0_5, r0_5.OnPressed)
  r0_5.Btn_Click.OnHovered:Add(r0_5, r0_5.OnHovered)
  r0_5.Btn_Click.OnUnHovered:Add(r0_5, r0_5.OnUnHovered)
  r0_5.Btn_Click.OnReleased:Add(r0_5, r0_5.OnBtnReleased)
end
function r0_0.OnHovered(r0_6)
  -- line: [113, 118] id: 6
  r0_6.IsHover = true
  if not r0_6.IsSelect then
    r0_6:PlayAnimation(r0_6.Hover)
  end
end
function r0_0.OnFocusReceived(r0_7, r1_7, r2_7)
  -- line: [120, 132] id: 7
  if r0_7.GameInputModeSubsystem and UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    if not r0_7.Owner then
      return r0_0.Super.OnFocusReceived(r0_7, r1_7, r2_7)
    end
    r0_7.GameInputModeSubsystem:SetTargetUIFocusWidget(r0_7)
    r0_7.GameInputModeSubsystem:UpdateCurrentFocusWidgetPos()
    r0_7:AddTimer(0.01, function()
      -- line: [127, 129] id: 8
      r0_7.Owner:OnListItemClicked(r0_7.Content)
    end, false, 0, nil, true)
  end
  return r0_0.Super.OnFocusReceived(r0_7, r1_7, r2_7)
end
function r0_0.OnUnHovered(r0_9)
  -- line: [134, 140] id: 9
  r0_9.IsHover = false
  if not r0_9.IsSelect then
    r0_9:StopAnimation(r0_9.Hover)
    r0_9:PlayAnimation(r0_9.UnHover)
  end
end
function r0_0.OnPressed(r0_10)
  -- line: [142, 147] id: 10
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    return 
  end
  r0_10:PlayAnimation(r0_10.Press)
end
function r0_0.OnBtnReleased(r0_11)
  -- line: [149, 158] id: 11
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    return 
  end
  r0_11:StopAllAnimations()
  r0_11:PlayAnimation(r0_11.Normal)
  if r0_11.IsHover then
    r0_11:PlayAnimation(r0_11.Click)
  end
end
function r0_0.OnClicked(r0_12)
  -- line: [160, 178] id: 12
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    if r0_12.Owner.Switcher_Btn:GetActiveWidgetIndex() == 0 then
      r0_12.Owner:ConfirmChange()
    end
  else
    r0_12.Owner:OnListItemClicked(r0_12.Content)
  end
end
function r0_0.AddReddotListener(r0_13, r1_13, r2_13)
  -- line: [187, 196] id: 13
  if r0_13.ListenedReddot then
    r2_13(r0_13, ReddotManager.GetTreeNode(r1_13).Count)
    return 
  end
  r0_13:RemoveReddotListener(r1_13)
  ReddotManager.AddListener(r1_13, r0_13, r2_13)
  r0_13.ListenedReddot = true
end
function r0_0.RemoveReddotListener(r0_14, r1_14)
  -- line: [198, 204] id: 14
  if r0_14.ListenedReddot then
    ReddotManager.RemoveListener(r1_14, r0_14)
    r0_14.New:SetEnable(false)
    r0_14.ListenedReddot = false
  end
end
function r0_0.OnPortraitReddotChange(r0_15, r1_15)
  -- line: [206, 210] id: 15
  r0_15.New:SetEnable(ReddotManager.GetLeafNodeCacheDetail("Portrait")[tostring(r0_15.Content.PortraitId)] and r1_15 > 0)
end
function r0_0.OnPortraitFrameReddotChange(r0_16, r1_16)
  -- line: [212, 216] id: 16
  r0_16.New:SetEnable(ReddotManager.GetLeafNodeCacheDetail("PortraitFrame")[tostring(r0_16.Content.PortraitId)] and r1_16 > 0)
end
function r0_0.Destruct(r0_17)
  -- line: [218, 227] id: 17
  r0_17:PlayAnimation(r0_17.UnSelect)
  r0_17:PlayAnimation(r0_17.Normal)
  if r0_17.IsHeadFrame then
    r0_17:RemoveReddotListener("PortraitFrame", r0_17.OnPortraitFrameReddotChange)
  else
    r0_17:RemoveReddotListener("Portrait", r0_17.OnPortraitReddotChange)
  end
  r0_17.Super.Destruct(r0_17)
end
function r0_0.OnKeyDown(r0_18, r1_18, r2_18)
  -- line: [229, 244] id: 18
  local r3_18 = false
  local r4_18 = UE4.UKismetInputLibrary.GetKey(r2_18)
  local r5_18 = UE4.UFormulaFunctionLibrary.Key_GetFName(r4_18)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r4_18) and r5_18 ~= "Gamepad_FaceButton_Bottom" and r5_18 == "Gamepad_FaceButton_Right" then
    r3_18 = true
  end
  return r3_18
end
function r0_0.ClearData(r0_19)
  -- line: [246, 256] id: 19
  if r0_19.IsHeadFrame then
    r0_19:RemoveReddotListener("PortraitFrame", r0_19.OnPortraitFrameReddotChange)
  else
    r0_19:RemoveReddotListener("Portrait", r0_19.OnPortraitReddotChange)
  end
  r0_19.IsHeadFrame = nil
  r0_19.PortraitId = nil
  r0_19.New:SetEnable(false)
  r0_19.IsEmpty = false
end
return r0_0
