-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\UI_PC\Common\Common_Item\WBP_Walnut_Item_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.UI_PC.Common.Common_Item.WBP_Com_item_Universal_L_C"
})
function r0_0.InitData(r0_1, r1_1)
  -- line: [13, 18] id: 1
  r0_0.Super.InitData(r0_1, r1_1)
  r0_1.bAllUseAsyncLoadWidget = false
  r0_1.Content.StuffType = r0_1.ItemType
  r0_1.bDontRemoveSubWidget = true
end
function r0_0.InitCompView(r0_2)
  -- line: [20, 37] id: 2
  r0_0.Super.InitCompView(r0_2)
  if r0_2.ItemType == "EmptyGrid" then
    r0_2:CheckAndSetVisibility(r0_2.CountWidget, UIConst.VisibilityOp.Collapsed)
    r0_2:CheckAndSetVisibility(r0_2.LevelWidget, UIConst.VisibilityOp.Collapsed)
    return 
  else
    r0_2:CheckAndSetVisibility(r0_2.LevelWidget, UIConst.VisibilityOp.Collapsed)
    r0_2:CheckAndSetVisibility(r0_2.CountWidget, UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  r0_2:RefreshItemsViewWithStateTag()
  if (not r0_2.Count or r0_2.Count <= 0) and r0_2.CountWidget and IsValid(r0_2.CountWidget) then
    r0_2:ClearBackGroundHeight(true)
  end
end
function r0_0.SetItemMinus(r0_3, r1_3)
  -- line: [39, 42] id: 3
  r0_3.Super.SetItemMinus(r0_3, r1_3)
  r0_3.Content.bMinus = r1_3
end
function r0_0.SetStuffStyleByStateTag(r0_4, r1_4)
  -- line: [44, 63] id: 4
  local r2_4 = r1_4.StateTagInfo
  r0_4.Content.StateTagInfo = r2_4
  if r2_4 == nil then
    r0_4:RefreshItemsViewWithStateTag({
      Name = "Normal",
    }, r1_4)
    return 
  end
  if r0_4.Content ~= nil and r0_4.Content.StateTagInfo ~= nil then
    if r0_4.Content.StateTagInfo.Name == "IsToChoose" then
      r0_4:CheckAndSetVisibility(r0_4.SelectWidget, UIConst.VisibilityOp.Collapsed)
      r0_4:CheckAndSetVisibility(r0_4.SelectCountWidget, UIConst.VisibilityOp.Collapsed)
      r0_4:CheckAndSetVisibility(r0_4.MoneyWidget, UIConst.VisibilityOp.Collapsed)
    elseif r0_4.Content.StateTagInfo.Name == "InSelectList" then
      r0_4:CheckAndSetVisibility(r0_4.MinusWidget, UIConst.VisibilityOp.Collapsed)
      r0_4:CheckAndSetVisibility(r0_4.SelectCountWidget, UIConst.VisibilityOp.Collapsed)
      r0_4:CheckAndSetVisibility(r0_4.MoneyWidget, UIConst.VisibilityOp.Collapsed)
    end
  end
  r0_4:RefreshItemsViewWithStateTag(r1_4)
end
function r0_0.RefreshItemsViewWithStateTag(r0_5, r1_5)
  -- line: [65, 107] id: 5
  r0_5:SetItemMinus(false)
  if not r1_5 then
    r1_5 = r0_5.Content
  end
  local r2_5 = r1_5.StateTagInfo and {}
  if r2_5.Name == "IsToChoose" then
    if r2_5.ExtraData ~= nil then
      r0_5:SetSelectNum(Utils.FormatNumber(r2_5.ExtraData[1], true), Utils.FormatNumber(r2_5.ExtraData[2], true))
      r0_5:SetItemMinus(true)
      r0_5.MinusWidget.Btn_Minus:UnBindEventOnClicked(r0_5, r0_5.CancelSelectClick)
      r0_5.MinusWidget.Btn_Minus:BindEventOnClicked(r0_5, r0_5.CancelSelectClick)
      r0_5:SetItemMoney(r2_5.ExtraData[4], Utils.FormatNumber(math.floor(r2_5.ExtraData[3] + 0.5), true))
    end
    r0_5:CheckAndSetVisibility(r0_5.SelectWidget, UIConst.VisibilityOp.SelfHitTestInvisible)
    r0_5:CheckAndSetVisibility(r0_5.SelectCountWidget, UIConst.VisibilityOp.SelfHitTestInvisible)
  elseif r2_5.Name == "InSelectList" then
    if r2_5.ExtraData ~= nil then
      r0_5:SetItemMinus(true)
      r0_5.MinusWidget.Btn_Minus:UnBindEventOnClicked(r0_5, r0_5.CancelSelectClick)
      r0_5.MinusWidget.Btn_Minus:BindEventOnClicked(r0_5, r0_5.CancelSelectClick)
      r0_5:SetSelectNum(Utils.FormatNumber(r2_5.ExtraData[1], true), Utils.FormatNumber(r2_5.ExtraData[2], true))
      r0_5:SetItemMoney(r2_5.ExtraData[4], Utils.FormatNumber(math.floor(r2_5.ExtraData[3] + 0.5), true))
    end
    r0_5:CheckAndSetVisibility(r0_5.MinusWidget, UIConst.VisibilityOp.SelfHitTestInvisible)
    r0_5:CheckAndSetVisibility(r0_5.SelectCountWidget, UIConst.VisibilityOp.SelfHitTestInvisible)
  elseif r2_5.Name == "Normal" then
    if r2_5.ExtraData ~= nil then
      r0_5:SetSelectNum(0, Utils.FormatNumber(r2_5.ExtraData[1], true))
      r0_5:SetItemMoney(r2_5.ExtraData[3], Utils.FormatNumber(math.floor(r2_5.ExtraData[2] + 0.5), true))
      r0_5:CheckAndSetVisibility(r0_5.MinusWidget, UIConst.VisibilityOp.Collapsed)
      r0_5:CheckAndSetVisibility(r0_5.SelectWidget, UIConst.VisibilityOp.Collapsed)
      r0_5:CheckAndSetVisibility(r0_5.SelectCountWidget, UIConst.VisibilityOp.Collapsed)
    else
      r0_5:CheckAndSetVisibility(r0_5.MinusWidget, UIConst.VisibilityOp.Collapsed)
      r0_5:CheckAndSetVisibility(r0_5.SelectWidget, UIConst.VisibilityOp.Collapsed)
      r0_5:CheckAndSetVisibility(r0_5.SelectCountWidget, UIConst.VisibilityOp.Collapsed)
      r0_5:CheckAndSetVisibility(r0_5.MoneyWidget, UIConst.VisibilityOp.Collapsed)
    end
  end
  r0_5:SetItemShowGrey(r2_5.IsShowGrey)
end
function r0_0.CheckAndSetVisibility(r0_6, r1_6, r2_6)
  -- line: [110, 116] id: 6
  if r0_6.WidgetMap[r1_6] then
    r1_6:SetVisibility(r2_6)
    return true
  end
  return false
end
function r0_0.SetItemShowGrey(r0_7, r1_7)
  -- line: [119, 127] id: 7
  if r1_7 then
    r0_7:SetItemConflict(true)
  else
    r0_7:SetItemConflict(false)
  end
end
function r0_0.CancelSelectClick(r0_8)
  -- line: [130, 140] id: 8
  AudioManager(r0_8):PlayUISound(r0_8, "event:/ui/common/click_btn_return", nil, nil)
  if r0_8.ParentWidget ~= nil and r0_8.Content.StateTagInfo then
    local r1_8 = #r0_8.Content.StateTagInfo.ExtraData
    if type(r0_8.Content.StateTagInfo.ExtraData[r1_8]) == "function" then
      r0_8.Content.StateTagInfo.ExtraData[r1_8](r0_8.ParentWidget, r0_8.Content.Uuid)
    else
      DebugPrint("StateTagInfo.ExtraData[AllCount] Not function!")
    end
  end
end
function r0_0.SetItemConflict(r0_9, r1_9)
  -- line: [143, 145] id: 9
  r0_9:_SetItemConflictImpl(r1_9, GText("UI_Tips_CantSell"))
end
function r0_0.SetItemMoney(r0_10, r1_10, r2_10)
  -- line: [148, 168] id: 10
  if r1_10 and r2_10 then
    if not r0_10.WidgetMap[r0_10.MoneyWidget] then
      r0_10.MoneyWidget = r0_10:CreateWidgetNew("ComItemMoney")
    end
    r0_10.MoneyWidget.Img_Coin:SetBrushResourceObject(LoadObject(DataMgr.Resource[r1_10].Icon))
    r0_10.MoneyWidget.Text_Cost:SetText(r2_10)
    r0_10:AddWidgetToNode(r0_10.MoneyWidget)
    r0_10:AddTimer(0.01, function()
      -- line: [158, 164] id: 11
      if r0_10.ComItemNewReddot and r0_10.WidgetMap[r0_10.ComItemNewReddot] and r0_10.ComItemNewReddot:GetVisibility() ~= UE4.ESlateVisibility.Collapsed then
        r0_10.ComItemNewReddot:RemoveFromParent()
        r0_10.ComItemNewReddot = r0_10:CreateWidgetNew("ComItemNewReddot")
        r0_10:AddWidgetToNode(r0_10.ComItemNewReddot)
      end
    end)
  elseif r0_10.WidgetMap[r0_10.MoneyWidget] then
    r0_10:RemoveWidgetFromNode(r0_10.MoneyWidget)
  end
end
function r0_0.OnMouseButtonDown(r0_12, r1_12, r2_12)
  -- line: [170, 175] id: 12
  if r0_12.ItemType == "EmptyGrid" then
    return UWidgetBlueprintLibrary.Handled()
  end
  return r0_0.Super.OnMouseButtonDown(r0_12, r1_12, r2_12)
end
function r0_0.OnMouseButtonUp(r0_13, r1_13, r2_13)
  -- line: [177, 182] id: 13
  if r0_13.ItemType == "EmptyGrid" then
    return UWidgetBlueprintLibrary.Handled()
  end
  return r0_0.Super.OnMouseButtonUp(r0_13, r1_13, r2_13)
end
return r0_0
