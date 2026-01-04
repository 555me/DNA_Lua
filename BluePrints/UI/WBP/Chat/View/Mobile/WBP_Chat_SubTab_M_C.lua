-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Chat\View\Mobile\WBP_Chat_SubTab_M_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class("BluePrints.UI.BP_UIState_C")
function r0_0.OnListItemObjectSet(r0_1, r1_1)
  -- line: [36, 42] id: 1
  r0_1.Index = r1_1.Index
  r0_1.ChannelType = r1_1.ChannelType
  r0_1.ParentWidget = r1_1.ParentWidget
  r0_1.ClickCallback = r1_1.ClickCallback
  r0_1:UpdateView(r1_1)
end
function r0_0.SetDisturbIcon(r0_2, r1_2)
  -- line: [44, 57] id: 2
  RunAsyncTask(r0_2, "SetDisturbIconTask", function(r0_3)
    -- line: [45, 56] id: 3
    if r1_2 then
      if not r0_2.DisturbUI then
        r0_2.DisturbUI = UIManager():CreateWidgetAsync(nil, r0_3, "/Game/UI/WBP/Chat/Widget/WBP_Chat_DontDisturb.WBP_Chat_DontDisturb", false)
        r0_2.Group_ChatDontDisturb:AddChild(r0_2.DisturbUI)
      end
      r0_2.Group_ChatDontDisturb:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    else
      r0_2.Group_ChatDontDisturb:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end)
end
function r0_0.UpdateView(r0_4, r1_4)
  -- line: [59, 82] id: 4
  r1_4.UI = r0_4
  r0_4.Info = r1_4
  if r1_4.ChannelIcon then
    local r2_4 = LoadObject(r1_4.ChannelIcon)
    r0_4.Image_Icon:SetBrushResourceObject(r2_4)
    r0_4.Image_Sign:SetBrushResourceObject(r2_4)
  end
  r0_4.Text_TabName:SetText(GText(r1_4.ChannelName))
  if r0_4.Reddot then
    r0_4:SetReddot(r1_4.IsNew, r1_4.ShowRedDot)
  end
  if r0_4.Reddot_Num then
    r0_4:SetReddotNum(r1_4.ShowRedDotNum)
  end
  if r1_4.NeedSelectIdx == r0_4.Index then
    r0_4:SetIsSelected(true)
  else
    r0_4:SetIsSelected(false)
  end
  r0_4:SetDisturbIcon(r1_4.bNotDisturb)
end
function r0_0.SetIsSelected(r0_5, r1_5)
  -- line: [84, 90] id: 5
  if r1_5 then
    r0_5:PlayAnimation(r0_5.Click)
  else
    r0_5:PlayAnimation(r0_5.Normal)
  end
end
function r0_0.SetReddot(r0_6, r1_6, r2_6, r3_6)
  -- line: [92, 112] id: 6
  r0_6.IsNew = r1_6
  r0_6.Upgradeable = r2_6
  r0_6.OtherReddot = r3_6
  if r1_6 then
    r0_6.New:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    return 
  end
  r0_6.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if r0_6.Reddot then
    if r3_6 then
      r0_6.Reddot:SetReddotStyle(1)
      r0_6.Reddot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    elseif r2_6 then
      r0_6.Reddot:SetReddotStyle(1)
      r0_6.Reddot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      r0_6.Reddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
end
function r0_0.SetReddotNum(r0_7, r1_7)
  -- line: [114, 125] id: 7
  if r1_7 ~= nil and r1_7 > 0 then
    r0_7.Reddot_Num:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    if ChatCommon.ReddotMaxCount < r1_7 then
      r0_7.Reddot_Num:SetNum(ChatCommon.ReddotMaxCount .. "+")
    else
      r0_7.Reddot_Num:SetNum(r1_7)
    end
  else
    r0_7.Reddot_Num:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
return r0_0
