-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Play\WBP_Play_Entry_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local r1_0 = Class("BluePrints.UI.BP_UIState_C")
function r1_0.Initialize(r0_1, r1_1)
  -- line: [13, 82] id: 1
  r0_1.Super.Initialize(r0_1)
  r0_1.CurSubUI = nil
  r0_1.CurTabId = nil
  r0_1.NpcId = 910003
  r0_1.IsNeedPlayNpcAnim = true
  r0_1.RecoveringCamera = false
  r0_1.AllTabInfo = {}
  r0_1.IndexToWidgetName = {}
  r0_1.WidgetNameToIndex = {}
  r0_1.SubUI = {}
  r0_1.DefaultSubUIName = "NewDeputeRoot"
  r0_1.AllExcelTabInfo = {
    DataMgr.PlayTab
  }
  r0_1.DisplayTeamHeadUIWidgetName = {
    DungeonSelect = 1,
    NewDeputeRoot = 1,
    HardBossMain = 1,
  }
  r0_1.IsKeyEventOnGamePad = true
  local r2_1 = GWorld:GetAvatar()
  if not r2_1 then
    return false
  end
  if not r0_0.CheckStarterQuestAllDone() then
    r0_1.DefaultSubUIName = "PlayTaskRoot"
    return 
  end
  local r3_1 = r2_1.DailyInitLevel
  local r4_1 = nil
  local r5_1 = nil
  local r6_1 = nil
  for r11_1, r12_1 in pairs(DataMgr.DailyGoalReward) do
    if not r5_1 or r5_1 < r11_1 then
      r5_1 = r11_1
    end
    if r11_1 == r3_1 then
      r4_1 = r11_1
      break
    elseif r3_1 < r11_1 then
      r4_1 = r6_1
      break
    else
      r6_1 = r11_1
    end
  end
  -- close: r7_1
  if not r4_1 then
    r4_1 = r5_1
  end
  local r8_1 = true
  local r9_1 = pairs
  for r13_1, r14_1 in r9_1(DataMgr.DailyGoalReward[r4_1]) do
    if r2_1.DailyTaskProgress[r14_1.RequiredActiveness] ~= CommonConst.DailyTaskState.GetReward then
      r8_1 = false
      break
    end
  end
  -- close: r9_1
  if r8_1 then
    r9_1 = "NewDeputeRoot" and "PlayTaskRoot"
  else
    goto label_102	-- block#23 is visited secondly
  end
  r0_1.DefaultSubUIName = r9_1
end
function r1_0.ReceiveEnterState(r0_2, r1_2)
  -- line: [84, 91] id: 2
  r0_2.Super.ReceiveEnterState(r0_2, r1_2)
  if r0_2.TeamHeadUI then
    r0_2.TeamHeadUI:OnFocusLost()
  end
  EventManager:FireEvent(EventID.EntryReceiveEnterState, r1_2)
end
function r1_0.ReceiveExitState(r0_3, r1_3)
  -- line: [93, 99] id: 3
  r0_3.Super.ReceiveExitState(r0_3, r1_3)
end
function r1_0.RecoverCamera(r0_4)
  -- line: [100, 119] id: 4
  if not r0_4.RecoveringCamera then
    r0_4.RecoveringCamera = true
    if r0_4.IsHome then
      UIManager(r0_4):SwitchFixedCamera(false, r0_4.NpcId, "StyleOfPlay", r0_4, "StyleOfPlay", {
        bDestroyNpc = true,
        IsHaveInOutAnim = r0_4.IsNeedPlayNpcAnim,
      })
      r0_4:PlayNPCAnim(21000502)
      r0_4:DoRecoverCamera()
    else
      if UIManager(r0_4):StateCount() > 1 then
        r0_4.IsNeedPlayNpcAnim = false
      else
        r0_4.IsNeedPlayNpcAnim = true
      end
      UIManager(r0_4):SwitchUINpcCamera(false, "StyleOfPlay", r0_4.NpcId, {
        bDestroyNpc = true,
        IsHaveInOutAnim = r0_4.IsNeedPlayNpcAnim,
      })
      r0_4:DoRecoverCamera()
    end
  end
end
function r1_0.OnLoaded(r0_5, ...)
  -- line: [120, 201] id: 5
  r0_5.Super.OnLoaded(r0_5, ...)
  local r1_5 = r0_5.Rouge_Points
  if r1_5 then
    r0_5.Rouge_Points:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  r0_5.OpenKey = CommonUtils:GetActionMappingKeyName("OpenPlay")
  AudioManager(r0_5):PlayUISound(r0_5, "event:/ui/armory/open", "SystemOpenSound", nil)
  r0_5:PlayBaiAnim()
  r0_5:PlayInAnim()
  r0_5:OpenSubUI(r0_5.DefaultSubUIName)
  ... = ... -- error: untaken top expr
  if r1_5 then
    r0_5:Show()
  end
  local r2_5 = r0_5:GetAttachWidget()
  if not r0_5.TeamHeadUI then
    r0_5.TeamHeadUI = TeamController:OpenHeadUI(r2_5)
    function r0_5.TeamHeadUI.OnTeamMainFocusChanged(r0_6)
      -- line: [138, 192] id: 6
      local r1_6 = nil	-- notice: implicit variable refs by block#[26]
      if r0_6 then
        r1_6 = "Collapsed"
        if not r1_6 then
          ::label_5::
          r1_6 = "SelfHitTestInvisible"
        end
      else
        goto label_5	-- block#2 is visited secondly
      end
      local r2_6 = {
        r0_5.ComTab.Key_Left,
        r0_5.ComTab.Key_Right,
        r0_5.ComTab.Com_KeyTips.Panel_Key,
        r0_5.ComTab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad,
        r0_5.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad.Key
      }
      if r0_5.CurTabId == "NewDeputeRoot" then
        local r3_6 = r0_5.CurSubUI
        if r3_6.DeputeTab:IsVisible() then
          table.insert(r2_6, r3_6.DeputeTab.Key_Left)
          table.insert(r2_6, r3_6.DeputeTab.Key_Right)
        end
        table.insert(r2_6, r0_5.ComTab.Group_Chat:GetChildAt(0).WS_Key)
      end
      if r0_5.CurTabId == "DungeonSelect" then
        local r3_6 = r0_5.CurSubUI
        if r3_6.Tab_Info:IsVisible() then
          table.insert(r2_6, r3_6.Tab_Info.Key_Left)
          table.insert(r2_6, r3_6.Tab_Info.Key_Right)
        end
        table.insert(r2_6, r3_6.Key_More_Gamepad)
        if r3_6.Com_CheckBox_LeftText:IsVisible() then
          table.insert(r2_6, r3_6.Com_CheckBox_LeftText.Com_KeyImg)
        end
        if r3_6.Button_Multi:IsVisible() then
          table.insert(r2_6, r3_6.Button_Multi.Key_GamePad)
        end
        if r3_6.Button_Solo:IsVisible() then
          table.insert(r2_6, r3_6.Button_Solo.Key_GamePad)
        end
        if r3_6.List_Type:IsVisible() then
          table.insert(r2_6, r3_6.Key_Qa_GamePad)
          table.insert(r2_6, r3_6.Key_LT)
          table.insert(r2_6, r3_6.Key_LR)
        end
        if r3_6.DefaultList:IsVisible() then
          table.insert(r2_6, r3_6.DefaultList.Preview.Panel_Controller)
        end
      end
      if r0_5.CurTabId == "HardBossMain" then
        local r3_6 = r0_5.CurSubUI
        if r3_6.HB_Rewards:IsVisible() then
          table.insert(r2_6, r3_6.Key_Rewards)
        end
        if r3_6.Btn_Enter:IsVisible() then
          table.insert(r2_6, r3_6.Btn_Enter.Key_GamePad)
        end
      end
      for r7_6, r8_6 in ipairs(r2_6) do
        r8_6:SetVisibility(UIConst.VisibilityOp[r1_6])
      end
      -- close: r3_6
    end
    if r0_5.DisplayTeamHeadUIWidgetName[r0_5.CurTabId] then
      r0_5.TeamHeadUI:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      r0_5.TeamHeadUI:SetVisibility(UIConst.VisibilityOp.Collapsed)
      r2_5:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
end
function r1_0.OnHardBossMainReddotChange(r0_7)
  -- line: [203, 205] id: 7
  r0_7:OnReddotChange("HardBossMain")
end
function r1_0.OnPlayCommonReddotChange(r0_8)
  -- line: [207, 209] id: 8
  r0_8:OnReddotChange("PlayCommon")
end
function r1_0.OnPlayTaskRootReddotChange(r0_9)
  -- line: [210, 212] id: 9
  r0_9:OnReddotChange("PlayTaskRoot")
end
function r1_0.OnReddotChange(r0_10, r1_10)
  -- line: [213, 231] id: 10
  local r2_10 = r0_10.WidgetNameToIndex[r1_10]
  if r2_10 then
    local r3_10 = ReddotManager.GetTreeNode(r1_10)
    local r4_10 = false
    if r3_10 and r3_10.Count > 0 then
      r4_10 = true
    end
    local r5_10 = r0_10.ComTab.EMScrollBox_TabItem:GetChildAt(math.max(r2_10 + -1, 0))
    if r5_10 and r5_10.Info.WidgetUIName == r1_10 then
      if r4_10 then
        r5_10.Reddot:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      else
        r5_10.Reddot:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
    end
  end
end
function r1_0.PlayBaiAnim(r0_11, r1_11)
  -- line: [233, 250] id: 11
  local r2_11 = GWorld:GetAvatar()
  if not r2_11 then
    return 
  end
  r0_11:EnableTickWhenPaused(true)
  r0_11.IsHome = r2_11:CheckSubRegionType(nil, CommonConst.SubRegionType.Home)
  if r0_11.IsHome then
    UIManager(r0_11):SwitchFixedCamera(true, r0_11.NpcId, "StyleOfPlay", r0_11, "StyleOfPlay", {
      bDestroyNpc = true,
      IsHaveInOutAnim = r0_11.IsNeedPlayNpcAnim,
    })
    r0_11:PlayNPCAnim(21000501)
  else
    UIManager(r0_11):SwitchUINpcCamera(true, "StyleOfPlay", r0_11.NpcId, {
      IsHaveInOutAnim = r0_11.IsNeedPlayNpcAnim,
    })
  end
end
function r1_0.Construct(r0_12)
  -- line: [252, 254] id: 12
  r1_0.Super.Construct(r0_12)
end
function r1_0.Destruct(r0_13)
  -- line: [256, 264] id: 13
  if r0_13.CurTabId then
    SystemGuideManager:HideUIEvent(r0_13.CurTabId)
  end
  AudioManager(r0_13):StopSound(r0_13, "SystemOpenSound")
  r0_13:RecoverCamera()
  r0_13.Super.Destruct(r0_13)
end
function r1_0.PlayNPCAnim(r0_14, r1_14)
  -- line: [266, 287] id: 14
  local r2_14 = UE4.ANpcCharacter.GetNpc(r0_14, r0_14.NpcId)
  if r2_14 then
    if r2_14.NPCNameWidgetComponent then
      local r3_14 = r2_14.NPCNameWidgetComponent:GetWidget()
      if r3_14 then
        r3_14:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
    end
    if r2_14.BubbleWidgetComponent then
      local r3_14 = r2_14.BubbleWidgetComponent:GetWidget()
      if r3_14 then
        r3_14:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
    end
    r2_14:PlayUITalkAction(r1_14)
  end
end
function r1_0.SwitchCamera(r0_15, r1_15)
  -- line: [289, 314] id: 15
  local r2_15 = UGameplayStatics.GetPlayerController(r0_15, 0)
  if r1_15 then
    if IsValid(r0_15.CameraHandle) then
      ULTweenBPLibrary.KillIfIsTweening(r0_15, r0_15.CameraHandle)
    end
    local r3_15 = UGameplayStatics.GetPlayerCharacter(r0_15, 0)
    if r3_15 then
      r3_15:SetActorHideTag("StyleOfPlay", false)
    end
  else
    local r3_15 = UGameplayStatics.GetActorOfClass(r0_15, r0_15.CameraClass)
    if r3_15 then
      r3_15.Camera:K2_SetRelativeLocation(r3_15.DefaultLocation, false, nil, false)
      r2_15:SetViewTargetWithBlend(r3_15, 0, EViewTargetBlendFunction.VTBlend_Linear, 0, false)
      r0_15:MoveCamera(r3_15.Camera)
    end
    local r4_15 = UGameplayStatics.GetPlayerCharacter(r0_15, 0)
    if r4_15 then
      r4_15:SetActorHideTag("StyleOfPlay", true)
    end
  end
end
function r1_0.MoveCamera(r0_16, r1_16)
  -- line: [317, 324] id: 16
  r0_16.CameraHandle = ULTweenBPLibrary.Vector3To(r0_16, {
    r0_16,
    function(r0_17, r1_17)
      -- line: [320, 322] id: 17
      r1_16:K2_SetRelativeLocation(r1_17, false, nil, false)
    end
  }, r1_16.RelativeLocation, FVector(0), 0.5, 0, 17)
end
function r1_0.EnableTickWhenPaused(r0_18, r1_18)
  -- line: [326, 339] id: 18
  local r2_18 = UE4.ALTweenActor.GetLTweenInstance(r0_18:GetWorld())
  if r1_18 then
    if r2_18 then
      r2_18:SetTickableWhenPaused(true)
    end
    UE4.UGameplayStatics.GetPlayerController(r0_18, 0).bShouldPerformFullTickWhenPaused = true
  else
    if r2_18 then
      r2_18:SetTickableWhenPaused(false)
    end
    UE4.UGameplayStatics.GetPlayerController(r0_18, 0).bShouldPerformFullTickWhenPaused = false
  end
end
function r1_0.PlayInAnim(r0_19)
  -- line: [341, 346] id: 19
  if r0_19:IsAnimationPlaying(r0_19.In) then
    return 
  end
  r0_19:PlayAnimationForward(r0_19.In)
end
function r1_0.OpenSubUI(r0_20, r1_20)
  -- line: [348, 392] id: 20
  local r2_20 = true
  local r3_20 = false
  if r0_20.CurrentExcelTabInfo then
    for r8_20, r9_20 in pairs(r0_20.CurrentExcelTabInfo) do
      if r9_20.WidgetUI == r1_20 then
        r2_20 = false
        r3_20 = true
      end
    end
    -- close: r4_20
  end
  if r2_20 then
    local r4_20 = false
    for r9_20, r10_20 in pairs(r0_20.AllExcelTabInfo) do
      if not r4_20 then
        for r15_20, r16_20 in pairs(r10_20) do
          if r16_20.WidgetUI == r1_20 then
            r0_20.CurrentExcelTabInfo = r10_20
            r4_20 = true
            break
          end
        end
        -- close: r11_20
      else
        break
      end
    end
    -- close: r5_20
    if not r4_20 then
      r0_20.CurrentExcelTabInfo = nil
      r0_20:RemoveReddotListener()
    end
    r2_20 = r4_20
  end
  if r2_20 then
    r0_20:InitTabInfo()
    r0_20:AddReddotListener()
    r0_20:SelectTabByWidgetName(r1_20)
    return r0_20:GetSubUIByWidgetName(r1_20)
  elseif r3_20 then
    r0_20:SelectTabByWidgetName(r1_20)
    return r0_20:GetSubUIByWidgetName(r1_20)
  else
    return r0_20:RealOpenSubUI({
      TabId = r1_20,
    })
  end
end
function r1_0.InitTabInfo(r0_21)
  -- line: [394, 416] id: 21
  local r1_21 = CommonUtils.Copy(r0_21.CurrentExcelTabInfo)
  r0_21.SortedTabInfo = {}
  for r6_21, r7_21 in pairs(r1_21) do
    table.insert(r0_21.SortedTabInfo, r7_21)
  end
  -- close: r2_21
  for r6_21, r7_21 in pairs(r0_21.SortedTabInfo) do
    r7_21.IsLocked = true
    if r7_21.TabUnlockRuleId then
      local r8_21 = DataMgr.UIUnlockRule[r7_21.TabUnlockRuleId]
      local r9_21 = r8_21.UIUnlockRuleId
      r7_21.LockReasonText = GText(r8_21.UIUnlockDesc)
      local r11_21 = GWorld:GetAvatar()
      if r11_21 and r9_21 then
        r7_21.IsLocked = not r11_21:CheckUIUnlocked(r9_21)
      end
    else
      r7_21.IsLocked = false
    end
  end
  -- close: r2_21
  r0_21:FinishInitTab()
end
function r1_0.FinishInitTab(r0_22)
  -- line: [418, 422] id: 22
  r0_22:SortTab()
  r0_22:InitSortedTab()
  r0_22:InitCommonTab()
end
function r1_0.SortTab(r0_23)
  -- line: [424, 440] id: 23
  table.sort(r0_23.SortedTabInfo, function(r0_24, r1_24)
    -- line: [425, 439] id: 24
    if r0_24.IsLocked then
      if r1_24.IsLocked then
        return r1_24.Sequence < r0_24.Sequence
      else
        return false
      end
    elseif r1_24.IsLocked then
      return true
    else
      return r1_24.Sequence < r0_24.Sequence
    end
  end)
end
function r1_0.InitSortedTab(r0_25)
  -- line: [442, 461] id: 25
  r0_25.AllTabInfo = {}
  r0_25.IndexToWidgetName = {}
  r0_25.WidgetNameToIndex = {}
  for r5_25, r6_25 in pairs(r0_25.SortedTabInfo) do
    table.insert(r0_25.AllTabInfo, {
      WidgetUIName = r6_25.WidgetUI,
      Text = GText(r6_25.TabName),
      TabId = r6_25.WidgetUI,
      SortId = -r5_25,
      Callback = "RealOpenSubUI",
      ItemDefaultCapcity = 999,
      IsLocked = r6_25.IsLocked,
      LockReasonText = r6_25.LockReasonText,
      IconPath = r6_25.Icon,
    })
    r0_25.IndexToWidgetName[r5_25] = r6_25.WidgetUI
    r0_25.WidgetNameToIndex[r6_25.WidgetUI] = r5_25
  end
  -- close: r1_25
end
function r1_0.AddReddotListener(r0_26)
  -- line: [463, 471] id: 26
  if r0_26.IndexToWidgetName then
    for r5_26, r6_26 in ipairs(r0_26.IndexToWidgetName) do
      if DataMgr.ReddotNode[r6_26] then
        ReddotManager.AddListener(r6_26, r0_26, r0_26["On" .. r6_26 .. "ReddotChange"])
      end
    end
    -- close: r1_26
  end
end
function r1_0.RemoveReddotListener(r0_27)
  -- line: [473, 481] id: 27
  if r0_27.IndexToWidgetName then
    for r5_27, r6_27 in ipairs(r0_27.IndexToWidgetName) do
      if DataMgr.ReddotNode[r6_27] then
        ReddotManager.RemoveListener(r6_27, r0_27)
      end
    end
    -- close: r1_27
  end
end
function r1_0.InitCommonTab(r0_28)
  -- line: [483, 506] id: 28
  r0_28.TabConfigData = {
    TitleName = GText("MAIN_UI_PLAY"),
    LeftKey = "Q",
    RightKey = "E",
    Tabs = r0_28.AllTabInfo,
    DynamicNode = {
      "Back",
      "ResourceBar",
      "BottomKey"
    },
    StyleName = "TextImage",
    OwnerPanel = r0_28,
    BackCallback = r0_28.OnClickBack,
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = r0_28.OnClickBack,
            Owner = r0_28,
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
          }
        },
        Desc = GText("UI_BACK"),
        bLongPress = false,
      }
    },
  }
  r0_28.ComTab:Init(r0_28.TabConfigData, true)
  r0_28.ComTab:BindEventOnTabSelected(r0_28, r0_28.RealOpenSubUI)
end
function r1_0.SelectTabByWidgetName(r0_29, r1_29)
  -- line: [510, 512] id: 29
  r0_29:SelectTabById(r1_29)
end
function r1_0.SelectTabById(r0_30, r1_30)
  -- line: [514, 516] id: 30
  r0_30.ComTab:SelectTabById(r1_30)
end
function r1_0.SelectTab(r0_31, r1_31)
  -- line: [518, 520] id: 31
  r0_31.ComTab:SelectTab(r1_31)
end
function r1_0.InitOtherPageTab(r0_32, r1_32, r2_32, r3_32, r4_32, r5_32)
  -- line: [522, 532] id: 32
  if r1_32 then
    r1_32.OverridenTopResouces = r2_32 and DataMgr.SystemUI.StyleOfPlay.TabCoin
  end
  r0_32.ComTab:Init(r1_32, r3_32)
  r0_32.ComTab:BindEventOnTabSelected(r4_32, r5_32)
end
function r1_0.UpdateOtherPageTab(r0_33, r1_33)
  -- line: [535, 539] id: 33
  if CommonUtils.GetDeviceTypeByPlatformName() ~= "Mobile" then
    r0_33.ComTab:UpdateBottomKeyInfo(r1_33)
  end
end
function r1_0.GetSubUIByWidgetName(r0_34, r1_34)
  -- line: [550, 554] id: 34
  if r0_34.SubUI then
    return r0_34.SubUI[r1_34]
  end
end
function r1_0.RealOpenSubUI(r0_35, r1_35)
  -- line: [556, 704] id: 35
  local r2_35 = r1_35.TabId
  if r1_35.GetTabId then
    r2_35 = r1_35:GetTabId()
  end
  local r3_35 = r0_35:GetAttachWidget()
  if r0_35.TeamHeadUI then
    if r0_35.DisplayTeamHeadUIWidgetName[r2_35] then
      r0_35.TeamHeadUI:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      r0_35.TeamHeadUI:SetVisibility(UIConst.VisibilityOp.Collapsed)
      r3_35:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
  if r0_35.CurTabId == r2_35 then
    return r0_35.CurSubUI
  end
  if r0_35.CurTabId ~= nil then
    if r0_35.CurSubUI:IsAnyAnimationPlaying() then
      r0_35.CurSubUI:StopAllAnimations()
    end
    if r0_35.CurSubUI.WBP_Play_PanelBG and r0_35.CurSubUI.WBP_Play_PanelBG:IsAnyAnimationPlaying() then
      r0_35.CurSubUI.WBP_Play_PanelBG:StopAllAnimations()
    end
    r0_35.CurSubUI:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
    if r0_35.CurSubUI.RetainerBox and r0_35.CurSubUI.Panel_Level then
      r0_35.CurSubUI.Panel_Level:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
    end
    if r0_35.CurSubUI.SecondaryPageName == r2_35 then
      r0_35.CurSubUI:PlayAnimationForward(r0_35.CurSubUI.Next)
    elseif r0_35.CurSubUI.Out and r0_35.CurTabId ~= "DungeonSelect" then
      r0_35.CurSubUI:PlayAnimationForward(r0_35.CurSubUI.Out)
    else
      r0_35.CurSubUI:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    if r0_35.CurSubUI.SwitchOut then
      r0_35.CurSubUI:SwitchOut()
    end
    SystemGuideManager:HideUIEvent(r0_35.CurTabId)
  end
  local r4_35 = r0_35.CurTabId
  r0_35.CurTabId = r2_35
  local r8_35 = nil	-- notice: implicit variable refs by block#[62]
  if r0_35.SubUI[r0_35.CurTabId] == nil then
    local r6_35 = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0):GetMyPawn()
    local r7_35 = r0_35.CurTabId
    r8_35 = r6_35.UIModePlatform
    if r8_35 == "Mobile" then
      r8_35 = DataMgr.WidgetUI[r7_35 .. "Mobile"]
      if r8_35 then
        r8_35 = r7_35 .. "Mobile"
        r7_35 = r8_35
      end
    else
      r8_35 = DataMgr.WidgetUI[r7_35 .. "PC"]
      if r8_35 then
        r8_35 = r7_35 .. "PC"
        r7_35 = r8_35
      end
    end
    r8_35 = r0_35:CreateWidgetNew(r7_35)
    if r8_35 ~= nil then
      if r0_35.CurTabId == "HardBossMain" then
        r0_35.Group_HardBoss:AddChild(r8_35)
        r8_35.ParentPanel = r0_35.Group_HardBoss
      elseif r0_35.CurTabId == "PlayCommon" then
        r0_35.Group_Permanent:AddChild(r8_35)
        r8_35.ParentPanel = r0_35.Group_Permanent
        r8_35.ParentPanel = r0_35.Group_Play
      elseif r0_35.CurTabId == "NewDeputeRoot" then
        r8_35:PlayAnimation(r0_35.In)
        r0_35.Group_Depute:AddChild(r8_35)
        r8_35.ParentPanel = r0_35.Group_Depute
      elseif r0_35.CurTabId == "PlayTaskRoot" then
        r0_35.Group_Task:AddChild(r8_35)
        r8_35.ParentPanel = r0_35.Group_Task
      else
        r0_35.Group_Root:AddChild(r8_35)
        r8_35.ParentPanel = r0_35.Group_Root
      end
      r8_35.Root = r0_35
      r8_35.WidgetInfo = r1_35
      local r9_35 = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r8_35)
      if r9_35 then
        local r10_35 = FAnchors()
        r10_35.Minimum = FVector2D(0, 0)
        r10_35.Maximum = FVector2D(1, 1)
        r9_35:SetOffsets(FMargin(0, 0, 0, 0))
        r9_35:SetAnchors(r10_35)
      end
      r0_35.SubUI[r0_35.CurTabId] = r8_35
      if r8_35.Out then
        r8_35:BindToAnimationFinished(r8_35.Out, {
          r0_35,
          function()
            -- line: [653, 655] id: 36
            r8_35:SetVisibility(UE4.ESlateVisibility.Collapsed)
          end
        })
      end
      if r8_35.Next and r7_35 ~= "RougeMain" then
        r8_35:BindToAnimationFinished(r8_35.Next, {
          r0_35,
          function()
            -- line: [659, 661] id: 37
            r8_35:SetVisibility(UE4.ESlateVisibility.Collapsed)
          end
        })
      end
    end
    -- close: r5_35
  end
  r0_35.CurSubUI = r0_35.SubUI[r0_35.CurTabId]
  if r0_35.CurSubUI:IsAnyAnimationPlaying() then
    r0_35.CurSubUI:StopAllAnimations()
  end
  r0_35.CurSubUI:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  if r0_35.CurSubUI.RetainerBox and r0_35.CurSubUI.Panel_Level then
    r0_35.CurSubUI.Panel_Level:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  if r0_35.CurSubUI.SecondaryPageName == r4_35 then
    r0_35.CurSubUI:PlayAnimationForward(r0_35.CurSubUI.Back)
  elseif r0_35.CurSubUI.In then
    r0_35.CurSubUI:PlayAnimationForward(r0_35.CurSubUI.In)
  else
    r0_35.CurSubUI:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  r0_35.CurSubUI:SetFocus()
  if r0_35.CurSubUI.SwitchIn then
    r0_35.CurSubUI:SwitchIn()
  end
  SystemGuideManager:ShowUIEvent(r0_35.CurTabId)
  function r8_35()
    -- line: [698, 702] id: 38
    if r0_35.CurSubUI:GetVisibility() == UE4.ESlateVisibility.Collapsed then
      r0_35.CurSubUI:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  end
  r0_35:AddTimer(0.01, r8_35, false)
  return r0_35.CurSubUI
end
function r1_0.OnKeyUp(r0_39, r1_39, r2_39)
  -- line: [707, 725] id: 39
  local r3_39 = r1_0.Super.OnKeyUp(r0_39, r1_39, r2_39)
  local r5_39 = UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_39))
  if r5_39 == UIConst.GamePadKey.SpecialRight and r0_39.TeamHeadUI and r0_39.TeamHeadUI.DoGamepadBtnRelease then
    r0_39.TeamHeadUI:DoGamepadBtnRelease()
    if not r0_39.TeamHeadUI.bIsFocusable and not TeamController:IsTeamPopupBarOpenInGamepad() then
      r0_39.ComTab:Handle_KeyEventOnGamePad(r5_39)
      EventManager:FireEvent(EventID.NightBookSpecialRightUp)
    end
  elseif r5_39 == r0_39.OpenKey then
    r0_39.IsCanCloseByHotKey = true
  end
  return r3_39
end
function r1_0.OnKeyDown(r0_40, r1_40, r2_40)
  -- line: [727, 795] id: 40
  if CommonUtils:IfExistSystemGuideUI(r0_40) then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  if r0_40.IsOpenSelectLevel then
    return 
  end
  local r3_40 = false
  if r0_40.CurSubUI and r0_40.CurSubUI.HandleKeyDown then
    r3_40 = r0_40.CurSubUI:HandleKeyDown(r1_40, r2_40)
  end
  if not r3_40 then
    local r4_40 = UE4.UKismetInputLibrary.GetKey(r2_40)
    local r5_40 = UE4.UFormulaFunctionLibrary.Key_GetFName(r4_40)
    if UE4.UKismetInputLibrary.Key_IsGamepadKey(r4_40) then
      if r5_40 == UIConst.GamePadKey.SpecialRight and r0_40.TeamHeadUI and r0_40.TeamHeadUI.DoGamepadBtnPress then
        r0_40.TeamHeadUI:DoGamepadBtnPress()
        r3_40 = true
      elseif r5_40 ~= UIConst.GamePadKey.SpecialRight and r0_40.IsKeyEventOnGamePad then
        r3_40 = r0_40.ComTab:Handle_KeyEventOnGamePad(r5_40)
      end
      if r5_40 == UIConst.GamePadKey.FaceButtonRight and r0_40.TeamHeadUI and r0_40.TeamHeadUI.bIsFocusable then
        local r6_40 = r0_40.Group_Depute:GetChildAt(0)
        if IsValid(r6_40) and r6_40:IsVisible() then
          for r11_40, r12_40 in pairs(r6_40.PanelRoot:GetAllChildren()) do
            if r12_40:IsVisible() then
              r12_40:SetFocus()
            end
          end
          -- close: r7_40
        end
        local r7_40 = r0_40.Group_HardBoss:GetChildAt(0)
        if IsValid(r7_40) and r7_40:IsVisible() then
          r7_40.List_Boss:SetFocus()
        end
        r0_40.TeamHeadUI.bIsFocusable = false
        r3_40 = true
      end
    elseif r5_40 == "Escape" then
      r3_40 = true
      r0_40:OnReturnKeyDown()
    elseif r5_40 == "Q" then
      r3_40 = true
      r0_40.ComTab:TabToLeft()
    elseif r5_40 == "E" then
      r3_40 = true
      r0_40.ComTab:TabToRight()
    elseif r5_40 == r0_40.OpenKey and r0_40.IsCanCloseByHotKey then
      r3_40 = true
      r0_40:OnReturnKeyDown()
    elseif r5_40 == "SpaceBar" then
      EventManager:FireEvent(EventID.AllDailyTaskRewardKey)
    end
  end
  if r3_40 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end
function r1_0.OnPreviewKeyDown(r0_41, r1_41, r2_41)
  -- line: [797, 816] id: 41
  local r3_41 = false
  if r0_41.CurSubUI and r0_41.CurSubUI.HandlePreviewKeyDown then
    r3_41 = r0_41.CurSubUI:HandlePreviewKeyDown(r1_41, r2_41)
  end
  if not r3_41 then
    local r4_41 = UE4.UKismetInputLibrary.GetKey(r2_41)
    local r5_41 = UE4.UFormulaFunctionLibrary.Key_GetFName(r4_41)
    if UE4.UKismetInputLibrary.Key_IsGamepadKey(r4_41) then
    end
  end
  if r3_41 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return r1_0.Super.OnPreviewKeyDown(r0_41, r1_41, r2_41)
  end
end
function r1_0.OnReturnKeyDown(r0_42)
  -- line: [818, 821] id: 42
  UIUtils.PlayCommonBtnSe(r0_42)
  r0_42:OnClickBack()
end
function r1_0.OnClickBack(r0_43)
  -- line: [823, 829] id: 43
  if r0_43.TeamHeadUI.bIsFocusable then
    return 
  end
  if r0_43:IsAnimationPlaying(r0_43.In) then
    return 
  end
  r0_43:PlayOutAnim()
end
function r1_0.GetAttachWidget(r0_44)
  -- line: [831, 840] id: 44
  local r1_44 = nil
  if CommonUtils.GetDeviceTypeByPlatformName(r0_44) == "Mobile" then
    r1_44 = r0_44.ComTab.Panel_Team
  else
    r1_44 = r0_44.ComTab.Group_Team
  end
  r1_44:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  return r1_44
end
function r1_0.PlayOutAnim(r0_45)
  -- line: [842, 883] id: 45
  if r0_45:IsAnimationPlaying(r0_45.Out) then
    return 
  end
  AudioManager(r0_45):SetEventSoundParam(r0_45, "SystemOpenSound", {
    ToEnd = 1,
  })
  r0_45:BlockAllUIInput(true)
  if r0_45.CurSubUI.RetainerBox and r0_45.CurSubUI.Panel_Level then
    r0_45.CurSubUI.Panel_Level:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  end
  r0_45:BindToAnimationFinished(r0_45.Out, {
    r0_45,
    r0_45.Close
  })
  if r0_45.CurSubUI:IsAnyAnimationPlaying() then
    r0_45.CurSubUI:StopAllAnimations()
  end
  r0_45.CurSubUI:PlayAnimationForward(r0_45.CurSubUI.Out)
  if r0_45.IsAddInDeque then
    r0_45:PlayAnimationForward(r0_45.Out, UIConst.AnimOutSpeedWithPageJump.NormalFastSpeed)
  else
    r0_45:PlayAnimationForward(r0_45.Out)
  end
  local r1_45 = r0_45:GetAttachWidget()
  if TeamController:GetHeadUI(r1_45) and r0_45.TeamHeadUI then
    TeamController:GetHeadUI(r1_45):Close()
    r1_45:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_45.TeamHeadUI = nil
  end
  r0_45:RecoverCamera()
  local r3_45 = UIManager(r0_45):GetUnderState()
  if r3_45 then
    local r4_45 = r3_45:GetName()
    DebugPrint("JLY 上一个栈的UI是:", r4_45)
    if r4_45 == "ActivityMain" then
      EventManager:FireEvent(EventID.OnReturnToActivityEntry)
      EventManager:FireEvent(EventID.OnActivityEntryShowVisible)
    end
  end
end
function r1_0.ShowIntro(r0_46)
  -- line: [885, 890] id: 46
end
function r1_0.SetFocus_Lua(r0_47)
  -- line: [892, 894] id: 47
  r0_47.CurSubUI:SetFocus()
end
function r1_0.Close(r0_48)
  -- line: [896, 915] id: 48
  if r0_48.SubUI then
    for r5_48, r6_48 in pairs(r0_48.SubUI) do
      r6_48:RemoveFromParent()
    end
    -- close: r1_48
  end
  r0_48:RemoveReddotListener()
  UIManager(r0_48):HideNpcActor(false, "StyleOfPlay", r0_48.NpcId)
  if UIManager(r0_48):StateCount() > 1 then
    UIManager(r0_48):HideNpcById(r0_48.NpcId, true, "StyleOfPlay")
  end
  r0_48.Super.Close(r0_48)
end
function r1_0.BP_GetDesiredFocusTarget(r0_49)
  -- line: [917, 923] id: 49
  if r0_49.CurSubUI then
    return r0_49.CurSubUI
  else
    return r0_49
  end
end
return r1_0
