-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Activity\Widget\CharTryOut\WBP_Activity_TryOut_P_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local r1_0 = require("BluePrints.UI.WBP.Activity.ActivityCommon")
local r2_0 = require("EMCache.EMCache")
local r3_0 = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})
r3_0._components = {
  "BluePrints.UI.WBP.Activity.Widget.View.ActivityTryOutView"
}
function r3_0.Initialize(r0_1, r1_1)
  -- line: [23, 34] id: 1
  r0_1.OwnerPlayer = nil
  r0_1.CurActivityId = nil
  r0_1.CurSelectIndex = nil
  r0_1.OriginalActivityId = nil
  r0_1.CurCharId = nil
  r0_1.CurSkinId = nil
  r0_1.AllActivityIds = nil
  r0_1.ParentTabId = nil
  r0_1.ParentWidget = nil
  r0_1.FocusWidgetName = nil
end
function r3_0.GetPageName(r0_2)
  -- line: [36, 38] id: 2
  return DataMgr.EventTab[r0_2.ParentTabId].EventTabName
end
function r3_0.GetActivityId(r0_3)
  -- line: [40, 42] id: 3
  return r0_3.CurActivityId
end
function r3_0.GetParentTabId(r0_4)
  -- line: [44, 46] id: 4
  return r0_4.ParentTabId
end
function r3_0.ResetVariable(r0_5)
  -- line: [48, 53] id: 5
  r0_5.CurSelectIndex = 1
  r0_5.CurActivityId = r0_5.OriginalActivityId
  r0_5.FocusWidgetName = nil
end
function r3_0.InitPage(r0_6, r1_6, r2_6, r3_6, r4_6)
  -- line: [55, 65] id: 6
  r0_6.CurSelectIndex = 1
  r0_6.CurActivityId = r1_6
  r0_6.OriginalActivityId = r1_6
  r0_6.ParentTabId = r2_6
  r0_6.AllActivityIds = r3_6
  r0_6.ParentWidget = r4_6
  r0_6:UpdateSubPage()
end
function r3_0.UpdateSubPage(r0_7)
  -- line: [67, 92] id: 7
  local r1_7 = UIManager(r0_7):GetUIObj("ActivityMain")
  if r1_7 and r1_7.TryOutActivityNeedJumpToTabIndex then
    r1_7.NeedJumpToActivityId = nil
    r1_7.TryOutActivityNeedJumpToTabIndex = nil
    r0_7.CurSelectIndex = r1_7.TryOutActivityNeedJumpToTabIndex
  end
  local r2_7 = GWorld:GetAvatar()
  local r3_7 = DataMgr.EventMain[r0_7.CurActivityId]
  local r4_7 = r3_7.EventEndTime
  if r4_7 then
    r4_7 = r3_7.EventEndTime and r3_7.PermanenEventTime
  else
    goto label_28	-- block#5 is visited secondly
  end
  r0_7.ActivityEndTime = r4_7
  r0_7.RewardEndTime = r3_7.RewardEndTime
  r4_7 = DataMgr.CharTrialEvent[r0_7.CurActivityId]
  r0_7.CurCharId = r4_7.CharId
  r0_7.CurSkinId = r4_7.SkinId
  r0_7:RefreshPageStaticView(r3_7, r4_7, r2_7.CharTrial, r0_7.ViewInfoBtnClick, r0_7.GoToGachaClick, r0_7.GoToTargetPageClick, r0_7.TryToGetReward, r0_7.TryToViewCharDetail, r0_7.TryToSelectChar, r0_7.OnStuffDetailOpenChanged)
  r0_7:RefreshPageDynamicView(r2_7.CharTrial[r0_7.CurActivityId])
  r0_7:InitTimeInfo()
end
function r3_0.InitTimeInfo(r0_8)
  -- line: [94, 101] id: 8
  if (r0_8.ActivityEndTime ~= nil or r0_8.RewardEndTime ~= nil) and r0_8.Activity_Time.Com_Time then
    r0_0.RefreshLeftTime(r0_8, r0_8.Activity_Time.Com_Time)
    r0_8:AddTimer(1, r0_0.RefreshLeftTime, true, 0, "RefreshLeftTime", true, r0_8.Activity_Time.Com_Time)
  else
    r0_0.SetLeftTimeView(r0_8.Activity_Time.Com_Time, true)
  end
end
function r3_0.IsCanChangeToGamePadViewMode(r0_9)
  -- line: [103, 106] id: 9
  return r0_9.FocusWidgetName ~= "CheckRewardDetailView"
end
function r3_0.OnUpdateSubUIViewStyle(r0_10, r1_10, r2_10)
  -- line: [108, 155] id: 10
  if r1_10 then
    r1_10 = r0_10:IsCanChangeToGamePadViewMode()
  end
  if r1_10 then
    if #r0_10.AllActivityIds > 1 then
      r0_10.Key_Left:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      r0_10.Key_Right:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      r0_10.Key_Left:SetVisibility(UIConst.VisibilityOp.Collapsed)
      r0_10.Key_Right:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    r0_10.Key_RewardTitle:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r0_10.TryOutChar_Title.WS_DetailImg:SetActiveWidgetIndex(1)
    r0_10.TryOutSkin_Title.WS_DetailImg:SetActiveWidgetIndex(1)
    r0_10.Btn_Buy.Key_Shop:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    if r0_10.ActivityTryOutAvatarNeedWidget then
      r0_10.ActivityTryOutAvatarNeedWidget.Key_Click:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  else
    r0_10.Key_Left:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_10.Key_Right:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_10.Key_RewardTitle:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_10.TryOutChar_Title.WS_DetailImg:SetActiveWidgetIndex(0)
    r0_10.TryOutSkin_Title.WS_DetailImg:SetActiveWidgetIndex(0)
    r0_10.Btn_Buy.Key_Shop:SetVisibility(UIConst.VisibilityOp.Collapsed)
    if r0_10.ActivityTryOutAvatarNeedWidget then
      r0_10.ActivityTryOutAvatarNeedWidget.Key_Click:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
  if r2_10 then
    if r1_10 then
      r0_10.Btn_Gacha:SetGamepadIconVisibility(true)
      r0_10.Btn_Goto:SetGamepadIconVisibility(true)
      r0_10.Btn_Reward:SetGamePadIconVisible(true)
      if r0_10.ActivityTryOutAvatarNeedWidget then
        r0_10.ActivityTryOutAvatarNeedWidget.Key_Click:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      end
    else
      r0_10.Btn_Gacha:SetGamepadIconVisibility(false)
      r0_10.Btn_Goto:SetGamepadIconVisibility(false)
      r0_10.Btn_Reward:SetGamePadIconVisible(false)
      if r0_10.ActivityTryOutAvatarNeedWidget then
        r0_10.ActivityTryOutAvatarNeedWidget.Key_Click:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
    end
  end
end
function r3_0.UpdatePage(r0_11, r1_11)
  -- line: [157, 171] id: 11
  if false then
    r0_11:BindAllClickFunction(r0_11.ViewInfoBtnClick, r0_11.GoToGachaClick, r0_11.GoToTargetPageClick)
  end
  local r3_11 = GWorld:GetAvatar()
  if r1_11 == r1_0.AllUpdateTag.ActivityTab then
    r0_11:ResetVariable()
  end
  r0_11:UpdateSubPage()
  r0_11:RefreshPageDynamicView(r3_11.CharTrial[r0_11.CurActivityId])
end
function r3_0.GetPageConfigData(r0_12)
  -- line: [173, 175] id: 12
  return DataMgr.CharTrialEvent[r0_12.CurActivityId]
end
function r3_0.RefreshItemStyleByAction(r0_13, r1_13, r2_13)
  -- line: [177, 183] id: 13
  local r3_13 = GWorld:GetAvatar()
  if r1_13 == "TryOutGetReward" then
    r0_13:RefreshItemStyleView(r3_13.CharTrial[r2_13])
  end
end
function r3_0.CleanSelf(r0_14, r1_14)
  -- line: [185, 190] id: 14
  r0_14:RemoveTimer("RefreshLeftTime")
  if r1_14 then
    r0_14:RemoveFromParent()
  end
end
function r3_0.GetCurFocusWidgetInfo(r0_15)
  -- line: [192, 194] id: 15
  return r0_15.FocusWidgetName, r0_15.FocusWidgetWidget
end
function r3_0.EnterStuffViewMode(r0_16)
  -- line: [196, 210] id: 16
  if r0_16.FocusWidgetName == "CheckRewardDetailView" then
    return r0_16:LeaveStuffViewMode()
  end
  r0_16.Item_1:SetFocus()
  r0_16.FocusWidgetName = "CheckRewardDetailView"
  r0_16.FocusWidgetWidget = r0_16.Item_1
  if r0_16.ParentWidget then
    r0_16.ParentWidget:UpdateActivityKeyTips("CheckRewardDetailView", r0_16.Item_1)
  end
  r0_16:OnUpdateSubUIViewStyle(false, true)
  r0_16.IsInStuffViewMode = true
  return true
end
function r3_0.LeaveStuffViewMode(r0_17)
  -- line: [212, 226] id: 17
  if r0_17.FocusWidgetName == nil then
    return false
  end
  r0_17.FocusWidgetName = nil
  r0_17.FocusWidgetWidget = nil
  if r0_17.ParentWidget then
    r0_17.ParentWidget:UpdateActivityKeyTips()
    r0_17.ParentWidget:SetFocus()
  end
  r0_17:OnUpdateSubUIViewStyle(true, true)
  r0_17.IsInStuffViewMode = false
  return true
end
function r3_0.SelectOtherCharItem(r0_18, r1_18)
  -- line: [228, 239] id: 18
  local r2_18 = nil
  if r1_18 then
    r2_18 = math.min(r1_0.MaxTryOutItemCount, r0_18.CurSelectIndex + 1)
  else
    r2_18 = math.max(0, r0_18.CurSelectIndex + -1)
  end
  local r3_18 = r0_18["CharacterItem_" .. r2_18]
  if r3_18 then
    r3_18:OnBtnStateChange(true)
  end
end
function r3_0.ViewInfoBtnClick(r0_19)
  -- line: [242, 252] id: 19
  local r1_19 = DataMgr.EventMain[r0_19.CurActivityId]
  if not r1_19.EventRule then
    DebugPrint("ViewInfoBtn Click, EventRule is nil, EventId is", r0_19.CurActivityId)
    return 
  end
  UIManager(r0_19):ShowCommonPopupUI(100192, {
    ShortText = GText(r1_19.EventRule),
  }, r0_19)
end
function r3_0.GoToTargetPageClick(r0_20)
  -- line: [254, 283] id: 20
  UIManager(r0_20):ShowCommonPopupUI(100214, {
    RightCallbackFunction = function(r0_21, r1_21, r2_21)
      -- line: [257, 278] id: 21
      GWorld:GetAvatar():EnterCharTrialByEvent(nil, DataMgr.CharTrial[DataMgr.CharTrialEvent[r0_20.CurActivityId].CharTrialId].TrialDungeonId, r0_20.CurActivityId)
      local r7_21 = UIManager(r0_20):GetUIObj("ActivityMain")
      local r8_21 = 1
      if r7_21 then
        r8_21 = r7_21.CurTabId
      end
      GWorld.GameInstance:SetExitDungeonData({
        Type = "TryOut",
        CurTabIndex = r8_21,
        ActivityId = r0_20.CurActivityId,
        CurSelectIndex = r0_20.CurSelectIndex,
      })
    end,
    RightCallbackObj = r0_20,
  }, r0_20)
end
function r3_0.GoToGachaClick(r0_22)
  -- line: [285, 301] id: 22
  if r0_22.ParentWidget and type(r0_22.ParentWidget.CheckIsInCloseSelfState) == "function" and r0_22.ParentWidget:CheckIsInCloseSelfState() then
    DebugPrint("ActivityTryOut=GoToGachaClick, ParentWidget is in close self state, So return")
    return 
  end
  if r0_22.IsInStuffViewMode then
    return 
  end
  local r1_22 = DataMgr.CharTrialEvent[r0_22.CurActivityId]
  if r1_22.GachaTabId then
    PageJumpUtils:JumpToGachaPage(r1_22.GachaTabId)
  elseif r1_22.InterfaceJumpId then
    PageJumpUtils:JumpToTargetPageByJumpId(r1_22.InterfaceJumpId)
  end
end
function r3_0.OnStuffDetailOpenChanged(r0_23, r1_23, r2_23)
  -- line: [303, 312] id: 23
  if not r0_23.ParentWidget then
    return 
  end
  if r1_23 then
    r0_23.ParentWidget:UpdateActivityKeyTips("EmptyView", nil, false)
  else
    r0_23.ParentWidget:UpdateActivityKeyTips(r0_23.FocusWidgetName, r0_23.FocusWidgetWidget, false)
  end
end
function r3_0.TryToGetReward(r0_24)
  -- line: [314, 318] id: 24
  local r1_24 = GWorld:GetAvatar()
  if r1_24 == nil then
    return 
  end
  r1_24:GetCharTrialReward(r0_0.OnGetTryOutActivityRewardBack, r0_24.CurActivityId)
end
function r3_0.TryToViewCharDetail(r0_25)
  -- line: [320, 331] id: 25
  if r0_25.IsInStuffViewMode then
    return 
  end
  UIManager(r0_25):LoadUINew("ArmoryDetail", {
    PreviewCharIds = {
      r0_25:GetPageConfigData().CharId
    },
    bHideCharAppearance = true,
    bHideWeaponAppearance = true,
    EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon,
    OnCloseDelegate = nil,
  })
end
function r3_0.TryToSelectChar(r0_26, r1_26, r2_26, r3_26)
  -- line: [333, 349] id: 26
  if r0_26.CurActivityId == r1_26 then
    return 
  end
  r0_26:CancelCharSelectView()
  r0_26.CurSelectIndex = r2_26
  r0_26.CurActivityId = r1_26
  r0_26.CurCharId = r3_26
  r0_26:UnBindAllClickFunction()
  r0_26:UpdateSubPage()
  if r0_26.ParentWidget then
    r0_26.ParentWidget:RefreshViewAfterPageDataSet(DataMgr.EventMain[r0_26.CurActivityId], r0_26:GetPageConfigData())
    r0_26.ParentWidget:UpdateTabRedInfoByActivityID(nil, r1_26)
  end
end
function r3_0.HandleKeyDownInPage(r0_27, r1_27, r2_27)
  -- line: [351, 361] id: 27
  local r3_27 = false
  local r4_27 = UE4.UKismetInputLibrary.GetKey(r2_27)
  local r5_27 = UE4.UFormulaFunctionLibrary.Key_GetFName(r4_27)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r4_27) then
    r3_27 = r0_27:OnGamePadButtonDown(r5_27)
  else
    r3_27 = false
  end
  return r3_27
end
function r3_0.OnGamePadButtonDown(r0_28, r1_28)
  -- line: [363, 366] id: 28
  return r0_28:Handle_KeyDownOnGamePad(r1_28)
end
function r3_0.Handle_KeyDownOnGamePad(r0_29, r1_29)
  -- line: [368, 415] id: 29
  local r2_29 = false
  if r1_29 == UIConst.GamePadKey.FaceButtonLeft then
    r2_29 = true
    r0_29:GoToGachaClick()
  elseif r1_29 == UIConst.GamePadKey.FaceButtonBottom then
    r2_29 = true
    r0_29:GoToTargetPageClick()
  elseif r1_29 == UIConst.GamePadKey.LeftThumb then
    r2_29 = r0_29:EnterStuffViewMode()
  elseif r1_29 == UIConst.GamePadKey.RightThumb and r0_29.ActivityTryOutAvatarNeedWidget and not r0_29.IsInStuffViewMode then
    r0_29.ActivityTryOutAvatarNeedWidget:OnClick()
    r2_29 = true
  elseif r1_29 == UIConst.GamePadKey.FaceButtonRight then
    r2_29 = r0_29:LeaveStuffViewMode()
  elseif r1_29 == UIConst.GamePadKey.FaceButtonTop then
    r2_29 = true
    r0_29:TryToGetReward()
  elseif r1_29 == UIConst.GamePadKey.SpecialLeft then
    if r0_29.CurSkinId then
      r0_29.TryOutSkin_Title:BtnClicked()
      return true
    end
    r2_29 = true
    r0_29:TryToViewCharDetail()
  elseif r1_29 == UIConst.GamePadKey.SpecialRight then
    r2_29 = true
    r0_29:ViewInfoBtnClick()
  elseif r1_29 == UIConst.GamePadKey.LeftTriggerThreshold then
    r0_29:SelectOtherCharItem(false)
  elseif r1_29 == UIConst.GamePadKey.RightTriggerThreshold then
    r0_29:SelectOtherCharItem(true)
  end
  return r2_29
end
AssembleComponents(r3_0)
return r3_0
