-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Common\Tab\PC\WBP_Com_TabIcon_P_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class("BluePrints.UI.BP_EMUserWidget_C")
function r0_0.Update(r0_1, r1_1, r2_1)
  -- line: [37, 90] id: 1
  r0_1.Info = r2_1
  r2_1.UI = r0_1
  r0_1.Idx = r1_1
  r0_1.IsLocked = r2_1.IsLocked
  if r2_1.IconPath then
    r0_1.Img_TabIcon:GetDynamicMaterial():SetTextureParameterValue("Mask", LoadObject(r2_1.IconPath))
  end
  r0_1.Text_Name:SetText(r2_1.Text)
  if r0_1.IsLocked then
    r0_1:PlayAnimation(r0_1.Lock)
  end
  if r0_1.Reddot then
    r0_1:SetReddot(r2_1.IsNew, r2_1.ShowRedDot)
  end
  if r0_1.Reddot_Num then
    r0_1:SetReddotNum(r2_1.ShowRedDotNum)
  end
  r0_1.bClickEnable = not r2_1.IsForbidden
  if not r0_1.bClickEnable then
    r0_1:PlayAnimation(r0_1.Forbidden)
  end
  r0_1.IsOn = r2_1.IsOn
  if r2_1.IsOn then
    if r0_1:IsAnimationPlaying(r0_1.UnHover) then
      r0_1:StopAnimation(r0_1.UnHover)
    end
    r0_1:PlayAnimation(r0_1.Click, 0, 1, 0, 1000)
  else
    r0_1:PlayAnimation(r0_1.Normal, 0, 1, 0, 1000)
  end
  r0_1.ItemSize = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r0_1.Img_TabIcon):GetSize()
  if r0_1.Info.BindReddotNode then
    local r4_1 = r0_1.Info.BindReddotNode
    ReddotManager.RemoveListener(r4_1, r0_1)
    ReddotManager.AddListener(r4_1, r0_1, function(r0_2, r1_2, r2_2, r3_2)
      -- line: [78, 88] id: 2
      if r1_2 > 0 then
        if r2_2 == EReddotType.Normal then
          r0_2:SetReddot(false, true)
        elseif r2_2 == EReddotType.New then
          r0_2:SetReddot(true, false)
        end
      else
        r0_2:SetReddot(false, false)
      end
    end)
  end
end
function r0_0.HideTextName(r0_3, r1_3)
  -- line: [92, 106] id: 3
  if r1_3 then
    r0_3.Panel_Name:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    r0_3.Panel_Name:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r0_3:PlayAnimation(r0_3.Panel_Name_In)
  end
end
function r0_0.GetTabId(r0_4)
  -- line: [108, 110] id: 4
  return r0_4.Info.TabId
end
function r0_0.GetTabIndex(r0_5)
  -- line: [112, 114] id: 5
  return r0_5.Idx
end
function r0_0.SetDisturbIcon(r0_6, r1_6)
  -- line: [116, 129] id: 6
  RunAsyncTask(r0_6, "SetDisturbIconTask", function(r0_7)
    -- line: [117, 128] id: 7
    if r1_6 then
      if not r0_6.DisturbUI then
        r0_6.DisturbUI = UIManager():CreateWidgetAsync(nil, r0_7, "/Game/UI/WBP/Chat/Widget/WBP_Chat_DontDisturb.WBP_Chat_DontDisturb", false)
        r0_6.Group_ChatDontDisturb:AddChild(r0_6.DisturbUI)
      end
      r0_6.Group_ChatDontDisturb:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    else
      r0_6.Group_ChatDontDisturb:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end)
end
function r0_0.Update_LineEffect(r0_8, r1_8, r2_8)
  -- line: [131, 151] id: 8
  if r0_8.IsOn or r0_8.IsLocked or not r0_8.bClickEnable then
    return 
  end
  local r5_8 = UE4.USlateBlueprintLibrary.AbsoluteToLocal(r1_8, UE4.UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(r2_8)) * UE4.UWidgetLayoutLibrary.GetViewportScale(r0_8)
  local r6_8 = r0_8.ItemSize.X * 0.5
  local r7_8 = 0
  if r5_8.X < r6_8 then
    r7_8 = math.max(0, 0.4 - r5_8.X / r6_8 * 0.4)
  else
    r7_8 = math.max(-0.4, (r5_8.X - r6_8) * -0.4 / r6_8)
  end
  r0_8.VX_Line:GetDynamicMaterial():SetScalarParameterValue("Mask_U_offset", r7_8)
end
function r0_0.SetSwitchOn(r0_9, r1_9, r2_9)
  -- line: [153, 188] id: 9
  if r0_9.IsLocked then
    UIManager(r0_9):ShowUITip(UIConst.Tip_CommonToast, r0_9.Info.LockReasonText and "Not Define!!!!")
    return 
  end
  r0_9.IsOn = r1_9
  if r1_9 then
    if r0_9:IsAnimationPlaying(r0_9.UnHover) then
      r0_9:StopAnimation(r0_9.UnHover)
    end
    if r2_9 then
      local function r3_9()
        -- line: [167, 170] id: 10
        r0_9:PlayAnimation(r0_9.Click)
      end
      r0_9:UnbindAllFromAnimationFinished(r0_9.Press)
      r0_9:BindToAnimationFinished(r0_9.Press, {
        r0_9,
        r3_9
      })
      r0_9:HideTextName(false)
      r0_9:PlayAnimation(r0_9.Press)
    else
      r0_9:PlayAnimation(r0_9.Click)
    end
    if r0_9.EventSwitchOn then
      r0_9.EventSwitchOn(r0_9.ObjSwitchOn, r0_9)
    end
  else
    r0_9:StopAllAnimations()
    r0_9:PlayAnimation(r0_9.Normal)
    if r0_9.EventSwitchOff then
      r0_9.EventSwitchOff(r0_9.ObjSwitchOff, r0_9)
    end
  end
end
function r0_0.BindEventOnHoverOnOrOff(r0_11, r1_11, r2_11)
  -- line: [190, 193] id: 11
  r0_11.ObjHoverOnOrOff = r1_11
  r0_11.EventHoverOnOrOff = r2_11
end
function r0_0.UnbindEventOnHoverOnOrOff(r0_12)
  -- line: [195, 198] id: 12
  r0_12.ObjHoverOnOrOff = nil
  r0_12.EventHoverOnOrOff = nil
end
function r0_0.BindEventOnSwitchOn(r0_13, r1_13, r2_13)
  -- line: [200, 203] id: 13
  r0_13.ObjSwitchOn = r1_13
  r0_13.EventSwitchOn = r2_13
end
function r0_0.UnbindEventOnSwitchOn(r0_14)
  -- line: [205, 208] id: 14
  r0_14.ObjSwitchOn = nil
  r0_14.EventSwitchOn = nil
end
function r0_0.BindEventOnSwitchOff(r0_15, r1_15, r2_15)
  -- line: [210, 213] id: 15
  r0_15.ObjSwitchOff = r1_15
  r0_15.EventSwitchOff = r2_15
end
function r0_0.UnbindEventOnSwitchOff(r0_16)
  -- line: [215, 218] id: 16
  r0_16.ObjSwitchOff = nil
  r0_16.EventSwitchOff = nil
end
function r0_0.BindSoundFunc(r0_17, r1_17, r2_17)
  -- line: [220, 223] id: 17
  r0_17.SoundFunc = r1_17
  r0_17.SoundFuncReceiver = r2_17
end
function r0_0.BindHoverSoundFunc(r0_18, r1_18, r2_18)
  -- line: [225, 228] id: 18
  r0_18.HoverSoundFunc = r1_18
  r0_18.SoundFuncReceiver = r2_18
end
function r0_0.SetClickEnable(r0_19, r1_19)
  -- line: [230, 232] id: 19
  r0_19.bClickEnable = r1_19
end
function r0_0.SetLockInfo(r0_20, r1_20)
  -- line: [234, 241] id: 20
  r0_20.IsLocked = r1_20
  if r1_20 then
    r0_20:PlayAnimation(r0_20.Normal)
  else
    r0_20:PlayAnimation(r0_20.Lock)
  end
end
function r0_0.IsTabLocked(r0_21)
  -- line: [243, 245] id: 21
  return r0_21.IsLocked
end
function r0_0.GetIsCanSelect(r0_22)
  -- line: [247, 249] id: 22
  return r0_22.bClickEnable and not r0_22.IsLocked
end
function r0_0.Btn_Click(r0_23)
  -- line: [251, 262] id: 23
  if not r0_23.bClickEnable then
    return 
  end
  if r0_23.SoundFunc then
    r0_23.SoundFunc(r0_23.SoundFuncReceiver, r0_23.Idx)
  end
  if not r0_23.IsOn then
    r0_23:SetSwitchOn(true, false)
  end
end
function r0_0.Btn_Press(r0_24)
  -- line: [264, 273] id: 24
  if r0_24.IsOn or r0_24.IsLocked or not r0_24.bClickEnable then
    return 
  end
  if r0_24:IsAnimationPlaying(r0_24.Press) then
    return 
  end
  r0_24:UnbindAllFromAnimationFinished(r0_24.Press)
  r0_24:PlayAnimation(r0_24.Press)
end
function r0_0.Btn_Hover(r0_25)
  -- line: [275, 288] id: 25
  if r0_25.IsOn or r0_25.IsLocked or not r0_25.bClickEnable then
    return 
  end
  if r0_25.HoverSoundFunc then
    r0_25.HoverSoundFunc(r0_25.SoundFuncReceiver, r0_25.Idx)
  end
  r0_25:PlayAnimation(r0_25.Hover)
  r0_25:HideTextName(false)
  if r0_25.EventHoverOnOrOff then
    r0_25.EventHoverOnOrOff(r0_25.ObjHoverOnOrOff, r0_25, true)
  end
end
function r0_0.Btn_UnHover(r0_26)
  -- line: [290, 307] id: 26
  if r0_26.IsOn or r0_26.IsLocked or not r0_26.bClickEnable then
    return 
  end
  if r0_26:IsAnimationPlaying(r0_26.Hover) then
    r0_26:StopAnimation(r0_26.Hover)
  end
  r0_26:PlayAnimation(r0_26.UnHover)
  r0_26:HideTextName(true)
  if r0_26.EventHoverOnOrOff then
    r0_26.EventHoverOnOrOff(r0_26.ObjHoverOnOrOff, r0_26, false)
  end
end
function r0_0.SetReddot(r0_27, r1_27, r2_27, r3_27)
  -- line: [312, 333] id: 27
  r0_27.IsNew = r1_27
  r0_27.Upgradeable = r2_27
  r0_27.OtherReddot = r3_27
  if r1_27 then
    r0_27.Reddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_27.New:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    return 
  end
  r0_27.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if r0_27.Reddot then
    if r3_27 then
      r0_27.Reddot:SetReddotStyle(1)
      r0_27.Reddot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    elseif r2_27 then
      r0_27.Reddot:SetReddotStyle(0)
      r0_27.Reddot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      r0_27.Reddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
end
function r0_0.SetReddotNum(r0_28, r1_28)
  -- line: [336, 346] id: 28
  if r1_28 ~= nil then
    r1_28 = tostring(r1_28)
    if not string.isempty(r1_28) and r1_28 ~= "0" then
      r0_28.Reddot_Num:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      r0_28.Reddot_Num:SetNum(r1_28)
      return 
    end
  end
  r0_28.Reddot_Num:SetVisibility(UE4.ESlateVisibility.Collapsed)
end
return r0_0
