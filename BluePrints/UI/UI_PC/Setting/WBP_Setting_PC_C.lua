-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\UI_PC\Setting\WBP_Setting_PC_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("Utils.SettingUtils")
local r1_0 = require("EMCache.EMCache")
local r2_0 = Class({
  "Blueprints.UI.BP_UIState_C"
})
local r3_0 = FSlateChildSize()
r3_0.SizeRule = UE.ESlateSizeRule.Fill
r3_0.Value = 1
function r2_0.Initialize(r0_1, r1_1)
  -- line: [18, 21] id: 1
  r0_1.NpcId = 900003
  r0_1.IsNeedPlayNpcAnim = true
end
function r2_0.Construct(r0_2)
  -- line: [23, 26] id: 2
  r2_0.Super.Construct(r0_2)
  r0_2.GameInputModeSubsystem = UIManager(r0_2):GetGameInputModeSubsystem()
end
function r2_0.OnLoaded(r0_3, ...)
  -- line: [28, 52] id: 3
  local r2_3 = nil	-- notice: implicit variable refs by block#[0]
  local r1_3 = nil	-- notice: implicit variable refs by block#[0]
  r0_3.Super.OnLoaded(r0_3, ...)
  ... = ... -- error: untaken top expr
  r0_3.LastSystem = r2_3
  r0_3.IsInLoginMainPage = r1_3
  rawset(r0_3, "SettingUIs", {})
  rawset(r0_3, "HoverContentList", {})
  rawset(r0_3, "Platform", CommonUtils.GetDeviceTypeByPlatformName(r0_3))
  rawset(r0_3, "IsUnfoldListOpen", false)
  rawset(r0_3, "AutoClose", false)
  rawset(r0_3, "IsInFullScreenMode", true)
  rawset(r0_3, "ScreenSize", FVector2D(1920, 1080))
  r0_3:PlayInAnim()
  r0_3.ScrollBox_Option:ClearChildren()
  r0_3:InitSettingParameter()
  r0_3:InitCommonTab(1, false)
  r0_3:AddTimer(0.033, r0_3.ListenScreenResolution, true, 0, "ListenScreenResolution", true)
  r1_3 = r0_3.IsInLoginMainPage
  if not r1_3 then
    r1_3 = UIManager(r0_3)
    r1_3:SwitchUINpcCamera(true, "Setting", r0_3.NpcId, {
      IsHaveInOutAnim = r0_3.IsNeedPlayNpcAnim,
    })
  end
  r0_3.RegionOnline = r1_0:Get("AutoJoin")
  r0_3:RefreshOpInfoByInputDevice(UIUtils.UtilsGetCurrentInputType(), UIUtils.UtilsGetCurrentGamepadName())
  r1_3 = r0_3.CurInputDeviceType
  r2_3 = ECommonInputType.Gamepad
  if r1_3 == r2_3 then
    r0_3:FocusToOptionFirstWidget()
  end
end
function r2_0.RefreshOpInfoByInputDevice(r0_4, r1_4, r2_4)
  -- line: [57, 68] id: 4
  if r1_4 == ECommonInputType.Gamepad then
    r0_4:RefreshAllGamePadOperator(r0_4.OptionUnfold_Prefrence.NowOptionId)
  end
  if r0_4.CurInputDeviceType == r1_4 then
    return 
  end
  r0_4.CurInputDeviceType = r1_4
  r0_4:UpdateUIStyleInPlatform(r0_4.CurInputDeviceType == ECommonInputType.Gamepad)
end
function r2_0.UpdateUIStyleInPlatform(r0_5, r1_5)
  -- line: [70, 83] id: 5
  if r0_5.Com_KeyImg_L then
    local r2_5 = r0_5.Com_KeyImg_L
    local r4_5 = nil	-- notice: implicit variable refs by block#[4, 7, 10]
    if r1_5 then
      r4_5 = UE4.ESlateVisibility.SelfHitTestInvisible
      if not r4_5 then
        ::label_12::
        r4_5 = UE4.ESlateVisibility.Collapsed
      end
    else
      goto label_12	-- block#3 is visited secondly
    end
    r2_5:SetVisibility(r4_5)
    r2_5 = r0_5.Com_KeyImg_R
    if r1_5 then
      r4_5 = UE4.ESlateVisibility.SelfHitTestInvisible
      if not r4_5 then
        ::label_25::
        r4_5 = UE4.ESlateVisibility.Collapsed
      end
    else
      goto label_25	-- block#6 is visited secondly
    end
    r2_5:SetVisibility(r4_5)
    r2_5 = r0_5.Image_83
    if r1_5 then
      r4_5 = UE4.ESlateVisibility.SelfHitTestInvisible
      if not r4_5 then
        ::label_38::
        r4_5 = UE4.ESlateVisibility.Collapsed
      end
    else
      goto label_38	-- block#9 is visited secondly
    end
    r2_5:SetVisibility(r4_5)
  end
  if r1_5 then
    r0_5:InitGamepadView()
  elseif UIUtils.IsMobileInput() then
    r0_5:InitMobileView()
  else
    r0_5:InitKeyboardView()
  end
end
function r2_0.InitGamepadView(r0_6)
  -- line: [85, 90] id: 6
  r0_6.ScrollBox_Option:SetScrollWhenFocusChanges(UE4.EScrollWhenFocusChanges.AnimatedScroll)
  if r0_6:HasAnyFocus() then
    r0_6:FocusToOptionFirstWidget()
  end
end
function r2_0.UpdateKeyboardBottonKey(r0_7)
  -- line: [92, 111] id: 7
  local r1_7 = {
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "R",
          ClickCallback = r0_7.OnPressR,
          Owner = r0_7,
        }
      },
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "X",
          ClickCallback = r0_7.OnPressR,
          Owner = r0_7,
        }
      },
      Desc = GText("UI_OPTION_DEFAULT"),
    },
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = r0_7.OnPressESC,
          Owner = r0_7,
        }
      },
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
          ClickCallback = r0_7.OnPressESC,
          Owner = r0_7,
        }
      },
      Desc = GText("UI_BACK"),
    }
  }
  if r0_7.HasBeenChanged then
    table.insert(r1_7, 1, {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Y",
          ClickCallback = r0_7.OnPressY,
          Owner = r0_7,
        }
      },
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "Y",
          ClickCallback = r0_7.OnPressY,
          Owner = r0_7,
        }
      },
      Desc = GText("UI_ACCEPT"),
    })
  end
  if not UIUtils.IsMobileInput() then
    r0_7.Tab_Set:UpdateBottomKeyInfo(r1_7)
  end
end
function r2_0.InitMobileView(r0_8)
  -- line: [113, 115] id: 8
end
function r2_0.InitKeyboardView(r0_9)
  -- line: [117, 120] id: 9
  r0_9.ScrollBox_Option:SetScrollWhenFocusChanges(UE4.EScrollWhenFocusChanges.NoScroll)
  r0_9:UpdateKeyboardBottonKey()
end
function r2_0.OnSettingUINavigateUp(r0_10, r1_10, r2_10)
  -- line: [122, 129] id: 10
  local r3_10 = r0_10.SettingUIs[r0_10.CurrentTab][r2_10 + -1]
  if r3_10 then
    return r3_10:GetLastWidgetToNavigate()
  end
  return nil
end
function r2_0.OnSettingUINavigateDown(r0_11, r1_11, r2_11)
  -- line: [131, 138] id: 11
  local r3_11 = r0_11.SettingUIs[r0_11.CurrentTab][r2_11 + 1]
  if r3_11 then
    return r3_11:GetFirstWidgetToNavigate()
  end
  return nil
end
function r2_0.FocusToOptionFirstWidget(r0_12)
  -- line: [140, 159] id: 12
  if not r0_12.CurrentTab then
    return 
  end
  if r0_12.CurrentTab == 1 and r0_12.MultiPlateIndex == 2 and not r0_12.IsInLoginMainPage then
    if r0_12.OptionUnfold_Prefrence then
      r0_12:AddDelayFrameFunc(function()
        -- line: [146, 148] id: 13
        r0_12.OptionUnfold_Prefrence:SetFocus()
      end, 1)
    end
    return 
  end
  local r1_12 = r0_12.SettingUIs[r0_12.CurrentTab][1]
  if r1_12 then
    r1_12:GetFirstWidgetToNavigate():SetFocus()
  else
    r0_12:SetFocus()
  end
end
function r2_0.OnGamepadFocusPanelTitle(r0_14)
  -- line: [162, 167] id: 14
  r0_14:UpdateBottomKey({
    {
      UIConst.GamePadImgKey.FaceButtonBottom,
      GText("UI_CTL_Squad_Expand")
    },
    {
      UIConst.GamePadImgKey.FaceButtonRight,
      GText("UI_BACK")
    }
  })
end
function r2_0.UpdateBottomKey(r0_15, r1_15)
  -- line: [169, 182] id: 15
  if UIUtils.IsGamepadInput() then
    local r2_15 = {}
    if r0_15.HasBeenChanged then
      table.insert(r2_15, {
        UIConst.GamePadImgKey.FaceButtonTop,
        GText("UI_ACCEPT")
      })
    end
    table.insert(r2_15, {
      UIConst.GamePadImgKey.FaceButtonLeft,
      GText("UI_OPTION_DEFAULT")
    })
    for r7_15, r8_15 in ipairs(r1_15) do
      table.insert(r2_15, r8_15)
    end
    -- close: r3_15
    r0_15.Tab_Set:UpdateBottomKeyInfo_Quick(r2_15)
  end
end
function r2_0.SetFocus_Lua(r0_16)
  -- line: [184, 191] id: 16
  if r0_16.CurInputDeviceType and r0_16.CurInputDeviceType == ECommonInputType.Gamepad then
    r0_16:AddDelayFrameFunc(function()
      -- line: [186, 188] id: 17
      r0_16:FocusToOptionFirstWidget()
    end, 1)
    return 
  end
end
function r2_0.ListenScreenResolution(r0_18)
  -- line: [195, 205] id: 18
  local r1_18 = FVector2D(0, 0)
  UE4.UWidgetLayoutLibrary.GetViewportSize(r0_18, r1_18)
  if r0_18.ScreenSize ~= r1_18 then
    r0_18.ScreenSize = r1_18
    if r0_18.IsUnfoldListOpen then
      r0_18.WBP_Set_UnfoldList:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    r0_18:OnClickAllLeftMouseButton()
  end
end
function r2_0.InitSettingParameter(r0_19)
  -- line: [207, 209] id: 19
  r0_19.HasBeenChanged = false
end
function r2_0.InitCommonTab(r0_20, r1_20, r2_20)
  -- line: [211, 295] id: 20
  r0_20:InitCommonTabInfo()
  if r0_20.Platform == "PC" then
    r0_20.Tab_Set:Init({
      LeftKey = "Q",
      RightKey = "E",
      Tabs = r0_20.CommonTabInfo,
      DynamicNode = {
        "Back",
        "BottomKey"
      },
      BottomKeyInfo = {},
      TitleName = GText("UI_Esc_CommonSet"),
      StyleName = "Text",
      OwnerPanel = r0_20,
      BackCallback = r0_20.OnPressESC,
    }, r2_20)
    r0_20:UpdateKeyboardBottonKey()
  else
    r0_20.Tab_Set:Init({
      Tabs = r0_20.CommonTabInfo,
      DynamicNode = {
        "Back"
      },
      TitleName = GText("UI_Esc_CommonSet"),
      StyleName = "Text",
      OwnerPanel = r0_20,
      BackCallback = r0_20.OnPressESC,
    }, r2_20)
    r0_20.Btn_Default:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_20.Btn_Default:BindEventOnClicked(r0_20, r0_20.OnPressR)
  end
  if r0_20.Tab_MultiPlate then
    r0_20.Tab_MultiPlate:Init({
      LeftKey = "A",
      RightKey = "D",
      Tabs = {
        {
          Text = GText("UI_OPTION_Keyboard"),
          TabId = 1,
        },
        {
          Text = GText("UI_OPTION_Gamepad"),
          TabId = 2,
        }
      },
    })
  end
  local r3_20 = UIUtils.IsGamepadInput()
  if r3_20 then
    r3_20 = 2 and 1
  else
    goto label_103	-- block#7 is visited secondly
  end
  r0_20.MultiPlateIndex = r3_20
  r0_20.Tab_Set:BindEventOnTabSelected(r0_20, r0_20.OnTabSelected)
  r0_20.Tab_Set:SelectTab(r1_20)
  if r0_20.Tab_MultiPlate then
    r0_20.Tab_MultiPlate:BindEventOnTabSelected(r0_20, r0_20.OnMultiPlateTabSelected)
    r0_20.Tab_MultiPlate:SelectTab(r0_20.MultiPlateIndex)
  end
  r0_20.WBP_Set_UnfoldList:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if r0_20.OptionUnfold_Prefrence then
    r0_20.OptionUnfold_Prefrence:Init(r0_20, "GamepadPreset", DataMgr.Option.GamepadPreset)
  end
  r0_20.GamePadXBOXDirection = {
    WB_Key_View = "Left",
    WB_Key_LBT = "Left",
    WB_Key_L = "Left",
    WB_Key_Direc = "Left",
  }
  if r0_20.OptionUnfold_Prefrence then
    r0_20.Btn_TabL.OnClicked:Clear()
    r0_20.Btn_TabR.OnClicked:Clear()
    r0_20.GamepadBottomContent = "Combo1"
    r0_20.IsTabLClick = true
    r0_20:PlayAnimation(r0_20.TabL_Click)
    r0_20:PlayAnimation(r0_20.TabR_Normal)
    r0_20.Btn_TabL.OnClicked:Add(r0_20, function()
      -- line: [264, 267] id: 21
      AudioManager(r0_20):PlayUISound(r0_20, "event:/ui/common/click_btn_sort_tab", nil, nil)
      r0_20:ShowFightGamepadBottomContent()
    end)
    r0_20.Btn_TabR.OnClicked:Add(r0_20, function()
      -- line: [268, 271] id: 22
      AudioManager(r0_20):PlayUISound(r0_20, "event:/ui/common/click_btn_sort_tab", nil, nil)
      r0_20:ShowSystemGamepadBottomContent()
    end)
    r0_20.Text_TabName_Sel:SetText(GText("UI_CharVoice_Battle"))
    r0_20.Text_TabName_Sel_1:SetText(GText("UI_CTL_System"))
    if r0_20.Com_KeyImg_L then
      r0_20.Com_KeyImg_L:CreateCommonKey({
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "Left",
          }
        },
      })
      r0_20.Com_KeyImg_R:CreateCommonKey({
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "Right",
          }
        },
      })
    end
    r0_20:RefreshAllGamePadOperator(r0_20.OptionUnfold_Prefrence.NowOptionId)
  end
  r0_20:InitLayoutPlantUI()
end
function r2_0.InitLayoutPlantUI(r0_23)
  -- line: [297, 349] id: 23
  r0_23.IsInitLayoutPlan = false
  if r0_23.Platform ~= "Mobile" then
    return 
  end
  if r0_23.CommonTabInfo[r0_23.CurrentTab].TabName ~= "Control" then
    r0_23.Tab_State:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_23.Panel_Tab:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_23.WS_State:SetActiveWidgetIndex(0)
    return 
  end
  local r1_23 = GWorld:GetAvatar()
  if not r1_23 then
    return 
  end
  for r6_23 = r1_23:GetMobileHudPlanCount() + 1, 2, 1 do
    r1_23:AddMobileHudPlan({})
  end
  r0_23.IsInitLayoutPlan = true
  r0_23.CurPlanIndex = r1_23:GetCurrentMobileHudPlanIndex()
  r0_23.Tab_State:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_23.Panel_Tab:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_23.Tab_State:Init({
    Tabs = {
      {
        Text = GText("UI_OPTION_Layout"),
        TabId = 1,
      },
      {
        Text = GText("UI_OPTION_Operation"),
        TabId = 2,
      }
    },
  })
  r0_23.LayoutPlantIndex = nil
  r0_23.Layout_01.Index = 1
  r0_23.Layout_02.Index = 2
  r0_23.Tab_State:BindEventOnTabSelected(r0_23, r0_23.OnOperateTabSelected)
  r0_23.Tab_State:SelectTab(1)
  r0_23.Layout_01.Text_Plan:SetText(GText("UI_Setting_Layout01"))
  r0_23.Layout_02.Text_Plan:SetText(GText("UI_Setting_Layout02"))
  r0_23.Layout_01.Btn_CustomLayout.Text_Button:SetText(GText("UI_Setting_CustomLayout"))
  r0_23.Layout_02.Btn_CustomLayout.Text_Button:SetText(GText("UI_Setting_CustomLayout"))
  r0_23.Layout_01.Btn_Area.OnClicked:Add(r0_23, r0_23.OnClickLayout1)
  r0_23.Layout_02.Btn_Area.OnClicked:Add(r0_23, r0_23.OnClickLayout2)
  r0_23:InitLayoutPlanList()
  local r3_23 = ReddotManager.GetTreeNode("Setting_Layout")
  if r3_23 and r3_23.Count > 0 then
    r0_23.Tab_Set:ShowTabRedDotByTabId(r0_23.CurrentTab, true)
    r0_23.Tab_State:ShowTabRedDotByTabId(1, true)
  else
    r0_23.Tab_Set:ShowTabRedDotByTabId(r0_23.CurrentTab)
    r0_23.Tab_State:ShowTabRedDotByTabId(1)
  end
end
function r2_0.InitLayoutPlanList(r0_24)
  -- line: [351, 382] id: 24
  r0_24.List_CustomOption:ClearListItems()
  local r1_24 = {
    "LeftBulletJumpShow",
    "LeftShootShow"
  }
  table.sort(r1_24, function(r0_25, r1_25)
    -- line: [357, 365] id: 25
    local r2_25 = DataMgr.Option[r0_25]
    local r3_25 = DataMgr.Option[r1_25]
    if r2_25.SortId and r3_25.SortId then
      return r2_25.SortId < r3_25.SortId
    else
      return r0_25 < r1_25
    end
  end)
  for r5_24 = 1, #r1_24, 1 do
    local r6_24 = NewObject(UIUtils.GetCommonItemContentClass())
    r6_24.Cache = DataMgr.Option[r1_24[r5_24]].Cache
    r6_24.ParentWidget = r0_24
    function r6_24.UpdateBottomKeyFunc(r0_26)
      -- line: [371, 373] id: 26
    end
    function r6_24.OnItemNavigateUp(r0_27, r1_27)
      -- line: [374, 376] id: 27
      return nil
    end
    function r6_24.OnItemNavigateDown(r0_28, r1_28)
      -- line: [377, 379] id: 28
      return nil
    end
    r0_24.List_CustomOption:AddItem(r6_24)
  end
end
function r2_0.OnClickLayout1(r0_29)
  -- line: [384, 396] id: 29
  if r0_29.Layout_02.LayoutState == UIConst.ButtonState.Click then
    r0_29.Layout_02:PlayAnimation(r0_29.Layout_02.Normal)
    r0_29.Layout_02.LayoutState = UIConst.ButtonState.None
  end
  r0_29.CurPlanIndex = 1
  EventManager:FireEvent(EventID.OnSwitchMobileHUDLayout, 1)
  local r1_29 = GWorld:GetAvatar()
  if not r1_29 then
    return 
  end
  r1_29:SwitchMobileHudPlan(r0_29.CurPlanIndex)
end
function r2_0.OnClickLayout2(r0_30)
  -- line: [398, 418] id: 30
  if r0_30.Layout_01.LayoutState == UIConst.ButtonState.Click then
    r0_30.Layout_01:PlayAnimation(r0_30.Layout_01.Normal)
    r0_30.Layout_01.LayoutState = UIConst.ButtonState.None
  end
  r0_30.CurPlanIndex = 2
  r1_0:Set("FirstOpenLayoutPlan", true, true)
  r0_30.Layout_02.New:SetVisibility(UE4.ESlateVisibility.Collapsed)
  EventManager:FireEvent(EventID.OnSwitchMobileHUDLayout, 2)
  local r1_30 = GWorld:GetAvatar()
  if not r1_30 then
    return 
  end
  r1_30:SwitchMobileHudPlan(r0_30.CurPlanIndex)
  local r2_30 = ReddotManager.GetTreeNode("Setting_Layout")
  if r2_30 and r2_30.Count > 0 then
    r0_30.Tab_Set:ShowTabRedDotByTabId(r0_30.CurrentTab)
    r0_30.Tab_State:ShowTabRedDotByTabId(1)
    ReddotManager.ClearLeafNodeCount("Setting_Layout")
  end
end
function r2_0.OnOperateTabSelected(r0_31, r1_31)
  -- line: [420, 433] id: 31
  if r0_31.LayoutPlantIndex == r1_31.Idx then
    return 
  end
  r0_31.LayoutPlantIndex = r1_31.Idx
  if r0_31.LayoutPlantIndex == 1 then
    r0_31.WS_State:SetActiveWidgetIndex(1)
    r0_31.Layout_01:InitLayoutPlan(r0_31.CurPlanIndex)
    r0_31.Layout_02:InitLayoutPlan(r0_31.CurPlanIndex)
  else
    r0_31.WS_State:SetActiveWidgetIndex(0)
    r0_31:UpdateEmptyGridCount()
  end
end
function r2_0.ShowFightGamepadBottomContent(r0_32)
  -- line: [435, 444] id: 32
  if r0_32.GamepadBottomContent == "Combo1" then
    return 
  end
  r0_32:PlayAnimation(r0_32.TabL_Click)
  r0_32:PlayAnimation(r0_32.TabR_Normal)
  r0_32.IsTabLClick = true
  r0_32.GamepadBottomContent = "Combo1"
  r0_32:RefreshGamepadOperationSystemBottom(r0_32.OptionUnfold_Prefrence.NowOptionId)
end
function r2_0.ShowSystemGamepadBottomContent(r0_33)
  -- line: [446, 455] id: 33
  if r0_33.GamepadBottomContent == "Combo2" then
    return 
  end
  r0_33:PlayAnimation(r0_33.TabR_Click)
  r0_33:PlayAnimation(r0_33.TabL_Normal)
  r0_33.IsTabLClick = false
  r0_33.GamepadBottomContent = "Combo2"
  r0_33:RefreshGamepadOperationSystemBottom(r0_33.OptionUnfold_Prefrence.NowOptionId)
end
function r2_0.OnMultiPlateTabSelected(r0_34, r1_34)
  -- line: [457, 524] id: 34
  if r0_34.MultiPlateIndex == r1_34.Idx then
    return 
  end
  if r0_34.OptionUnfold_Prefrence.IsListOpen then
    r0_34.OptionUnfold_Prefrence:OnClickSubOptionList()
  end
  if r0_34.HasBeenChanged then
    if r0_34.MultiPlateIndex == 2 and r1_34.Idx == 1 then
      UIManager(r0_34):ShowCommonPopupUI(100190, {
        LeftCallbackObj = r0_34,
        LeftCallbackFunction = function()
          -- line: [470, 481] id: 35
          r0_34.MultiPlateTabUpdate = true
          r0_34:RestoreOldValueSet()
          r0_34:InitSettingParameter()
          r0_34:UpdateKeyboardBottonKey()
          r0_34.OptionUnfold_Prefrence:RestoreOldGamepadPresetInLocal()
          r0_34.MultiPlateIndex = r1_34.Idx
          r0_34.WidgetSwitcher_MP:SetActiveWidgetIndex(r0_34.MultiPlateIndex + -1)
          if r0_34.MultiPlateIndex + -1 == 1 then
            r0_34:UpdateEmptyGridCount()
          end
        end,
        RightCallbackObj = r0_34,
        RightCallbackFunction = function()
          -- line: [483, 491] id: 36
          r0_34.MultiPlateTabUpdate = true
          r0_34:SaveAllSetting()
          r0_34.MultiPlateIndex = r1_34.Idx
          r0_34.WidgetSwitcher_MP:SetActiveWidgetIndex(r0_34.MultiPlateIndex + -1)
          if r0_34.MultiPlateIndex + -1 == 1 then
            r0_34:UpdateEmptyGridCount()
          end
        end,
        ShortText = string.format(GText(DataMgr.CommonPopupUIContext[100190].PopoverText), r0_34.OptionUnfold_Prefrence:GetGamepadPresetOptionContentText()),
      }, r0_34)
    elseif r0_34.MultiPlateIndex == 1 and r1_34.Idx == 2 then
      UIManager(r0_34):ShowCommonPopupUI(100010, {
        LeftCallbackObj = r0_34,
        LeftCallbackFunction = function()
          -- line: [497, 504] id: 37
          r0_34:OnCancelClickOtherSet()
          r0_34.MultiPlateIndex = r1_34.Idx
          r0_34.WidgetSwitcher_MP:SetActiveWidgetIndex(r0_34.MultiPlateIndex + -1)
          if r0_34.MultiPlateIndex + -1 == 1 then
            r0_34:UpdateEmptyGridCount()
          end
        end,
        RightCallbackObj = r0_34,
        RightCallbackFunction = function()
          -- line: [506, 513] id: 38
          r0_34:SaveAllSetting()
          r0_34.MultiPlateIndex = r1_34.Idx
          r0_34.WidgetSwitcher_MP:SetActiveWidgetIndex(r0_34.MultiPlateIndex + -1)
          if r0_34.MultiPlateIndex + -1 == 1 then
            r0_34:UpdateEmptyGridCount()
          end
        end,
      }, r0_34)
    end
  else
    r0_34.MultiPlateIndex = r1_34.Idx
    r0_34.WidgetSwitcher_MP:SetActiveWidgetIndex(r0_34.MultiPlateIndex + -1)
    if r0_34.MultiPlateIndex + -1 == 1 then
      r0_34:UpdateEmptyGridCount()
    end
    r0_34:FocusToOptionFirstWidget()
  end
end
function r2_0.RefreshAllGamePadOperator(r0_39, r1_39)
  -- line: [526, 529] id: 39
  r0_39:RefreshGamepadOperationSystemByIndex(r1_39, r0_39.WBP_Set_GamePadXBOX_C_1)
  r0_39:RefreshGamepadOperationSystemByIndex(r1_39, r0_39.WBP_Set_GamePadPS5)
end
function r2_0.RefreshGamepadOperationSystemByIndex(r0_40, r1_40, r2_40)
  -- line: [531, 573] id: 40
  local r3_40 = r0_40.Node_GamePad
  local r5_40 = UIUtils.UtilsGetCurrentGamepadName()
  if r5_40 == "PS" then
    r5_40 = 1 and 0
  else
    goto label_10	-- block#2 is visited secondly
  end
  r3_40:SetActiveWidgetIndex(r5_40)
  r2_40.WB_Key_XYBA:ClearChildren()
  r2_40.WB_Key_R:ClearChildren()
  r2_40.WB_Key_RBT:ClearChildren()
  r2_40.WB_Key_Menu:ClearChildren()
  r2_40.WB_Key_View:ClearChildren()
  r2_40.WB_Key_LBT:ClearChildren()
  r2_40.WB_Key_L:ClearChildren()
  r2_40.WB_Key_Direc:ClearChildren()
  r3_40 = {}
  for r8_40, r9_40 in pairs(DataMgr.GamepadSet) do
    table.insert(r3_40, r9_40)
  end
  -- close: r4_40
  table.sort(r3_40, function(r0_41, r1_41)
    -- line: [545, 545] id: 41
    return r0_41.Order < r1_41.Order
  end)
  for r8_40, r9_40 in ipairs(r3_40) do
    local r10_40 = ""
    if r9_40.KeyRegion[r1_40] then
      r10_40 = r9_40.KeyRegion[r1_40]
    else
      r10_40 = r9_40.KeyRegion[1]
    end
    local r11_40 = UIUtils.GetIconListByActionNameAndSetNum(r9_40.ActionName, r1_40)
    if r2_40[r10_40] then
      local r12_40 = r0_40.GamePadXBOXDirection[r10_40]
      if r12_40 then
        r12_40 = "/Game/UI/WBP/Set/Widget/WBP_Set_KeyGamePad_L.WBP_Set_KeyGamePad_L" and "/Game/UI/WBP/Set/Widget/WBP_Set_KeyGamePad_R.WBP_Set_KeyGamePad_R"
      else
        goto label_85	-- block#13 is visited secondly
      end
      local r13_40 = UIManager(r0_40):CreateWidget(r12_40, false)
      r2_40[r10_40]:AddChild(r13_40)
      r13_40.Key_GamePad:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
      local r14_40 = r9_40.TextHighLight
      if r14_40 then
        r14_40 = string.format("<Highlight>%s</>", GText(r9_40.KeyText)) and GText(r9_40.KeyText)
      else
        goto label_115	-- block#16 is visited secondly
      end
      local r15_40 = r13_40.Key_GamePad
      local r17_40 = {}
      local r18_40 = {}
      local r19_40 = {
        Type = "Img",
      }
      local r20_40 = nil	-- notice: implicit variable refs by block#[20]
      if r11_40 then
        r20_40 = r11_40[1]
        if not r20_40 then
          ::label_132::
          r20_40 = r9_40.GamepadIcon[1]
        end
      else
        goto label_132	-- block#19 is visited secondly
      end
      r19_40.ImgShortPath = r20_40
      -- setlist for #18 failed
      r17_40.KeyInfoList = r18_40
      r17_40.Desc = r14_40
      r15_40:CreateCommonKey(r17_40)
    end
  end
  -- close: r4_40
  r0_40:PlayAnimation(r0_40.GamePadChange)
  r0_40:RefreshGamepadOperationSystemBottom(r1_40)
end
function r2_0.RefreshGamepadOperationSystemBottom(r0_42, r1_42)
  -- line: [575, 636] id: 42
  if not UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0) then
    return 
  end
  r0_42.HB_Combination:ClearChildren()
  local r3_42 = {}
  local r4_42 = {}
  for r9_42, r10_42 in pairs(DataMgr.GamepadSet) do
    if r10_42.KeyRegion[1] and r10_42.KeyRegion[1] == r0_42.GamepadBottomContent then
      table.insert(r4_42, r10_42)
    end
  end
  -- close: r5_42
  table.sort(r4_42, function(r0_43, r1_43)
    -- line: [588, 588] id: 43
    return r0_43.Order < r1_43.Order
  end)
  for r9_42, r10_42 in ipairs(r4_42) do
    if r10_42.KeyRegion then
      local r11_42 = UIUtils.GetIconListByActionNameAndSetNum(r10_42.ActionName, r1_42)
      if r11_42 then
        local r12_42 = r10_42.TextHighLight
        if r12_42 then
          r12_42 = string.format("<Highlight>%s</>", GText(r10_42.KeyText)) and GText(r10_42.KeyText)
        else
          goto label_70	-- block#12 is visited secondly
        end
        table.insert(r3_42, {
          r11_42,
          r12_42
        })
      end
    end
  end
  -- close: r5_42
  local r5_42 = #r3_42
  if r5_42 == 0 then
    return 
  end
  for r10_42 = 1, math.modf(r5_42 / 2 + 0.5), 1 do
    local r11_42 = r10_42 * 2 + -1
    local r13_42 = UIManager(r0_42):CreateWidget("/Game/UI/WBP/Set/Widget/WBP_Set_KeyCombination.WBP_Set_KeyCombination", false)
    r0_42.HB_Combination:AddChild(r13_42)
    UWidgetLayoutLibrary.SlotAsHorizontalBoxSlot(r13_42):SetSize(r3_0)
    local r15_42 = {}
    for r19_42 = 1, #r3_42[r11_42], 1 do
      table.insert(r15_42, {
        Type = "Img",
        ImgShortPath = r3_42[r11_42][1][r19_42],
      })
    end
    r13_42.Key_Combination_1:CreateSubKeyDesc({
      KeyInfoList = r15_42,
      Desc = r3_42[r11_42][2],
      Type = "Add",
    })
    if r3_42[r11_42 + 1] then
      r15_42 = {}
      for r20_42 = 1, #r3_42[(r11_42 + 1)], 1 do
        table.insert(r15_42, {
          Type = "Img",
          ImgShortPath = r3_42[r11_42 + 1][1][r20_42],
        })
      end
      r13_42.Key_Combination_2:CreateSubKeyDesc({
        KeyInfoList = r15_42,
        Desc = r3_42[r11_42 + 1][2],
        Type = "Add",
      })
    else
      r13_42.Key_Combination_2:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
  r0_42:PlayAnimation(r0_42.Combination_Change)
end
function r2_0.InitCommonTabInfo(r0_44)
  -- line: [638, 690] id: 44
  r0_44.CommonTabInfo = {}
  r0_44.TabNums = 0
  for r5_44, r6_44 in ipairs(DataMgr.OptionTab) do
    if r0_44.Platform == "PC" or r0_44.Platform == "Mobile" and not r6_44.IsMobileHide then
      local r7_44 = r6_44.Tag
      local r8_44 = DataMgr.Option2Tag[r7_44 .. r0_44.Platform]
      if r7_44 == "Key" and not r0_44.IsInLoginMainPage then
        r0_44.TabNums = r0_44.TabNums + 1
        r0_44.CommonTabInfo[r0_44.TabNums] = {
          Text = GText(r6_44.TabName),
          TabId = r0_44.TabNums,
          TabName = r6_44.Tag,
          IconPath = r6_44.Icon,
          Regions = 2,
          RegionNames = {
            [1] = GText("UI_Option_Area_6"),
            [2] = GText("UI_Option_Area_7"),
          },
        }
      elseif r8_44 and r0_44:CheckSpecialHide(r8_44) then
        r0_44.TabNums = r0_44.TabNums + 1
        local r9_44 = 0
        local r10_44 = {}
        local r11_44 = nil
        for r16_44, r17_44 in pairs(r8_44) do
          r11_44 = DataMgr.Option[r17_44]
          local r18_44 = r11_44.Region
          if r10_44[r18_44] == nil then
            r10_44[r18_44] = r11_44.RegionName
          end
          if r9_44 < r18_44 then
            r9_44 = r18_44
          end
        end
        -- close: r12_44
        r0_44.CommonTabInfo[r0_44.TabNums] = {
          Text = GText(r11_44.TagName),
          TabId = r0_44.TabNums,
          TabName = r6_44.Tag,
          IconPath = r6_44.Icon,
          Regions = r9_44,
          RegionNames = r10_44,
        }
        if r7_44 == "Other" then
          r0_44.CommonTabInfo[r0_44.TabNums].BindReddotNode = "Setting_Tab_Other"
        end
      end
    end
  end
  -- close: r1_44
end
function r2_0.CheckSpecialHide(r0_45, r1_45)
  -- line: [693, 701] id: 45
  for r6_45, r7_45 in pairs(r1_45) do
    if r0_45:CheckOptionSpecialHide(r7_45, DataMgr.Option[r7_45].SpecialHide) then
      return true
    end
  end
  -- close: r2_45
  return false
end
function r2_0.CheckOptionSpecialHide(r0_46, r1_46, r2_46)
  -- line: [704, 766] id: 46
  local r3_46 = GWorld:GetAvatar()
  if r3_46 and r3_46.CdnHideData then
    local r4_46 = r3_46.CdnHideData.option
    if r4_46 then
      for r9_46, r10_46 in pairs(r4_46) do
        for r15_46, r16_46 in pairs(r10_46.gameCtrlOption) do
          if r16_46 == r1_46 then
            r2_46 = r10_46.config
            return r2_46
          end
        end
        -- close: r11_46
      end
      -- close: r5_46
    end
  end
  local r4_46 = DataMgr.Option[r1_46]
  if r4_46.HideOnPhone and UIUtils.IsMobileInput() then
    return false
  end
  if r4_46.HideOnPC and UIUtils.IsPCInput() then
    return false
  end
  if UE4.UUCloudGameInstanceSubsystem.IsCloudGame() and r0_46:CheckIsUCloudHide(r1_46) then
    return false
  end
  if r0_46:CheckIsExamineDistribution(r1_46) then
    return false
  end
  if r0_46:CheckIsInLogin(r1_46) then
    return false
  end
  if r2_46 and r2_46 == CommonConst.SpecialHideAnyWhere then
    return false
  end
  if URuntimeCommonFunctionLibrary.IsDLSSSupported() then
    if r1_46 == "FSR" then
      return false
    end
  else
    if r1_46 == "DLSS" then
      return false
    end
    if r1_46 == "DLSSOption" then
      return false
    end
  end
  if r1_46 == "RayTracing" and not r0_0.IsOpenRayTracing() then
    return false
  end
  local r5_46 = HeroUSDKSubsystem(r0_46):IsGlobalSDK()
  if r2_46 == nil or r2_46 == CommonConst.SpecialHideNoWhere then
    return true
  elseif r5_46 and r2_46 == CommonConst.SpecialHideCN then
    return true
  elseif not r5_46 and r2_46 == CommonConst.SpecialHideAboard then
    return true
  end
  return false
end
function r2_0.CheckIsUCloudHide(r0_47, r1_47)
  -- line: [768, 774] id: 47
  if DataMgr.Option[r1_47].UCloudHide then
    return true
  end
  return false
end
function r2_0.CheckIsExamineDistribution(r0_48, r1_48)
  -- line: [776, 796] id: 48
  if ({
    CustomerService = true,
    ExchangeCode = true,
    LogOffAccount = false,
  })[r1_48] and AHotUpdateGameMode.IsExamineDistribution() then
    return true
  elseif r1_48 == "CustomerService" then
    if HeroUSDKSubsystem(r0_48):IsBilibili() then
      return true
    end
  elseif r1_48 == "LogOffAccount" then
    if HeroUSDKSubsystem(r0_48):IsBilibili() then
      return true
    end
  else
    return false
  end
  return false
end
function r2_0.CheckIsInLogin(r0_49, r1_49)
  -- line: [798, 810] id: 49
  local r2_49 = DataMgr.Option[r1_49]
  if r2_49.GameHide == nil or r2_49.GameHide == CommonConst.SpecialHideNoWhere then
    return false
  end
  if r0_49.IsInLoginMainPage and r2_49.GameHide == CommonConst.SpecialHideCN then
    return true
  end
  if not r0_49.IsInLoginMainPage and r2_49.GameHide == CommonConst.SpecialHideAboard then
    return true
  end
  return false
end
function r2_0.ReceiveEnterState(r0_50, r1_50)
  -- line: [812, 817] id: 50
  r0_50.Super.ReceiveEnterState(r0_50, r1_50)
  if r1_50 == UE4.EStackAction.Push then
    r0_50:SetFocus()
  end
end
function r2_0.ScrollToOffset(r0_51, r1_51)
  -- line: [819, 821] id: 51
  r0_51.ScrollBox_Option:SetScrollOffset(r1_51)
end
function r2_0.GetScrollOffset(r0_52)
  -- line: [823, 825] id: 52
  return r0_52.ScrollBox_Option:GetScrollOffset()
end
function r2_0.OnTabSelected(r0_53, r1_53, r2_53)
  -- line: [827, 939] id: 53
  r0_53.WBP_Set_UnfoldList:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_53.NewTabId = r1_53.Idx
  if r0_53.HasBeenChanged then
    if r0_53.HasBeenChanged == "GamepadPresetSave" then
      UIManager(r0_53):ShowCommonPopupUI(100190, {
        LeftCallbackObj = r0_53,
        LeftCallbackFunction = function()
          -- line: [836, 839] id: 54
          r0_53.OptionUnfold_Prefrence:RestoreOldGamepadPresetInLocal()
          r0_53:OnCancelClickOtherSet()
        end,
        RightCallbackObj = r0_53,
        RightCallbackFunction = r0_53.OnConfirmClickOtherSet,
        ShortText = string.format(GText(DataMgr.CommonPopupUIContext[100190].PopoverText), r0_53.OptionUnfold_Prefrence:GetGamepadPresetOptionContentText()),
      }, r0_53)
    else
      UIManager(r0_53):ShowCommonPopupUI(100010, {
        LeftCallbackObj = r0_53,
        LeftCallbackFunction = r0_53.OnCancelClickOtherSet,
        RightCallbackObj = r0_53,
        RightCallbackFunction = r0_53.OnConfirmClickOtherSet,
      }, r0_53)
    end
    return 
  end
  if r0_53.CurrentTab ~= nil then
    for r7_53, r8_53 in pairs(r0_53.SettingUIs[r0_53.CurrentTab]) do
      if r8_53.OnParentTabSwitch then
        r8_53:OnParentTabSwitch()
      end
    end
    -- close: r3_53
  end
  r0_53.CurrentTab = r1_53.Idx
  r0_53.CurrentWidget = r1_53
  if r0_53.EmptySettingUI then
    r0_53.ScrollBox_Option:RemoveChild(r0_53.EmptySettingUI)
    r0_53.EmptySettingUI = nil
  end
  r0_53.ScrollBox_Option:ScrollToStart()
  local r3_53 = false
  if r0_53.SettingUIs[r0_53.CurrentTab] == nil then
    r0_53.SettingUIs[r0_53.CurrentTab] = {}
    for r7_53 = 1, r0_53.CommonTabInfo[r0_53.CurrentTab].Regions, 1 do
      local r8_53 = r0_53:CreateWidgetNew("SettingList")
      r0_53.ScrollBox_Option:AddChild(r8_53)
      UE4.UWidgetLayoutLibrary.SlotAsScrollBoxSlot(r8_53):SetPadding(FMargin(0, 0, 0, 0))
      r0_53.SettingUIs[r0_53.CurrentTab][r7_53] = r8_53
    end
    r3_53 = true
  end
  if r2_53 ~= nil then
    r3_53 = r2_53
  end
  for r8_53, r9_53 in pairs(r0_53.SettingUIs) do
    for r14_53, r15_53 in pairs(r9_53) do
      r15_53:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    -- close: r10_53
  end
  -- close: r4_53
  for r8_53, r9_53 in pairs(r0_53.SettingUIs[r0_53.CurrentTab]) do
    if r9_53.OnParentTabSwitch then
      r9_53:OnParentTabSwitch()
    end
    r9_53:Init(r0_53, r0_53.CommonTabInfo[r0_53.CurrentTab].TabName, r8_53, r0_53.CommonTabInfo[r0_53.CurrentTab].RegionNames[r8_53], r3_53)
    r0_53.ScrollBox_Option:SetConsumeMouseWheel(EConsumeMouseWheel.WhenScrollingPossible)
    r9_53:PlayInAnim()
    if r9_53.bIsFocusable then
      r9_53:SetFocus()
    end
  end
  -- close: r4_53
  if r0_53.EmptySettingUI == nil then
    local r4_53 = r0_53:CreateWidgetNew("SettingList")
    r0_53.ScrollBox_Option:AddChild(r4_53)
    UE4.UWidgetLayoutLibrary.SlotAsScrollBoxSlot(r4_53):SetPadding(FMargin(0, 0, 0, 0))
    r0_53.EmptySettingUI = r4_53
    r0_53.EmptySettingUI:PlayInAnim()
  end
  r0_53:UpdateEmptyGridCount()
  if r0_53.CommonTabInfo[r0_53.CurrentTab].TabName == "Key" and r0_53.Tab_MultiPlate then
    r0_53.WidgetSwitcher_MP:SetActiveWidgetIndex(r0_53.MultiPlateIndex + -1)
    r0_53.Tab_MultiPlate:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_53.Panel_SubTab:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  elseif r0_53.Tab_MultiPlate then
    r0_53.WidgetSwitcher_MP:SetActiveWidgetIndex(0)
    r0_53.Tab_MultiPlate:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_53.Panel_SubTab:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if r0_53.Tab_State and r0_53.IsInitLayoutPlan then
    if r0_53.CommonTabInfo[r0_53.CurrentTab].TabName ~= "Control" then
      r0_53.Tab_State:SetVisibility(UE4.ESlateVisibility.Collapsed)
      r0_53.Panel_Tab:SetVisibility(UE4.ESlateVisibility.Collapsed)
      r0_53.Tab_State:SelectTab(2)
    else
      r0_53.Tab_State:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      r0_53.Panel_Tab:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      r0_53.Tab_State:SelectTab(1)
    end
  end
  r0_53:AddTimer(0.1, function()
    -- line: [936, 938] id: 55
    r0_53:FocusToOptionFirstWidget()
  end)
end
function r2_0.UpdateEmptyGridCount(r0_56)
  -- line: [942, 982] id: 56
  if not IsValid(r0_56.EmptySettingUI) then
    return 
  end
  local r1_56 = nil
  if r0_56:IsExistTimer("GetEmptyGridCount") then
    r0_56:RemoveTimer("GetEmptyGridCount")
  end
  r0_56:AddTimer(0.033, function()
    -- line: [950, 979] id: 57
    local r0_57 = 0
    for r5_57, r6_57 in pairs(r0_56.SettingUIs[r0_56.CurrentTab]) do
      r0_57 = r0_57 + r6_57:GetCurrentStateGrideCount()
    end
    -- close: r1_57
    local r1_57 = r0_56.SettingUIs[r0_56.CurrentTab][1].List_Options
    local r2_57 = r1_57:GetDisplayedEntryWidgets()
    if r2_57:Length() == 0 then
      r0_56.EmptySettingUI:SetVisibility(ESlateVisibility.Collapsed)
      return 
    end
    r1_56 = UIManager(r0_56):GetWidgetRenderSize(r2_57:GetRef(1).WidgetTree.RootWidget).Y + r1_57.EntrySpacing
    local r5_57, r6_57 = math.modf(UIManager(r0_56):GetWidgetRenderSize(r0_56.ScrollBox_Option).Y / r1_56)
    if r6_57 >= 0.5 then
      r5_57 = r5_57 + 1
    end
    if r5_57 < r0_57 then
      r0_56.ScrollBox_Option:SetScrollBarVisibility(ESlateVisibility.Visible)
      r0_56.EmptySettingUI:SetVisibility(ESlateVisibility.Collapsed)
    elseif r0_57 == r5_57 then
      r0_56.ScrollBox_Option:SetScrollBarVisibility(ESlateVisibility.Collapsed)
      r0_56.EmptySettingUI:SetVisibility(ESlateVisibility.Collapsed)
    else
      r0_56.ScrollBox_Option:SetScrollBarVisibility(ESlateVisibility.Collapsed)
      r0_56.EmptySettingUI:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      r0_56.EmptySettingUI:SetEmptyGrid(r0_56, r5_57 - r0_57)
    end
  end, false, 0, "GetEmptyGridCount", true)
end
function r2_0.OnPreviewMouseButtonDown(r0_58, r1_58, r2_58)
  -- line: [984, 999] id: 58
  if UE4.UKismetInputLibrary.PointerEvent_IsMouseButtonDown(r2_58, UE4.EKeys.LeftMouseButton) then
    local r3_58 = UE4.UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(r2_58)
    local r4_58 = r0_58.WBP_Set_UnfoldList:GetCachedGeometry()
    if r0_58.WBP_Set_UnfoldList:IsVisible() and UE4.USlateBlueprintLibrary.IsUnderLocation(r4_58, r3_58) then
      return UE4.UWidgetBlueprintLibrary.Unhandled()
    end
    r0_58:OnClickAllLeftMouseButton()
    if r0_58.OptionUnfold_Prefrence then
      r0_58.OptionUnfold_Prefrence:OnClickLeftMouseButton()
    end
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end
function r2_0.OnKeyDown(r0_59, r1_59, r2_59)
  -- line: [1001, 1045] id: 59
  local r4_59 = UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_59))
  local r5_59 = false
  if UE4.UKismetStringLibrary.StartsWith(r4_59, "GamePad") then
    r5_59 = r0_59:OnGamePadDown(r4_59)
  elseif r4_59 == "Escape" then
    UIUtils.PlayCommonBtnSe(r0_59)
    r0_59:OnPressESC()
  elseif r4_59 == "Y" then
    r0_59:OnPressY()
  elseif r4_59 == "R" then
    r0_59:OnPressR()
  elseif r4_59 == "Q" and r0_59.CurrentTab ~= 1 then
    local r6_59 = UIManager(r0_59):GetUI("CommonTipSecond")
    if r6_59 then
      r6_59:Close()
    end
    r0_59.NextTabIsLeft = true
    r0_59.Tab_Set:TabToLeft()
  elseif r4_59 == "E" and r0_59.CurrentTab ~= r0_59.TabNums then
    local r6_59 = UIManager(r0_59):GetUI("CommonTipSecond")
    if r6_59 then
      r6_59:Close()
    end
    r0_59.NextTabIsLeft = false
    r0_59.Tab_Set:TabToRight()
  elseif r4_59 == "A" and r0_59.CurrentTab == 1 and r0_59.MultiPlateIndex ~= 1 and r0_59.Tab_MultiPlate and r0_59.Tab_MultiPlate:GetVisibility() ~= UE4.ESlateVisibility.Collapsed then
    r0_59.Tab_MultiPlate:Handle_KeyEventOnPC(r4_59)
    r0_59.MultiPlateIndex = 1
  elseif r4_59 == "D" and r0_59.CurrentTab == 1 and r0_59.Tab_MultiPlate:GetVisibility() ~= UE4.ESlateVisibility.Collapsed and r0_59.MultiPlateIndex ~= 2 and r0_59.Tab_MultiPlate and r0_59.Tab_MultiPlate:GetVisibility() ~= UE4.ESlateVisibility.Collapsed then
    r0_59.Tab_MultiPlate:Handle_KeyEventOnPC(r4_59)
    r0_59.MultiPlateIndex = 2
  end
  if r5_59 then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end
function r2_0.RefreshGamepadOperationSystemBottomContent(r0_60, r1_60)
  -- line: [1047, 1053] id: 60
  if r1_60 == UIConst.GamePadKey.DPadLeft and r0_60.CurrentTab == 1 and r0_60.MultiPlateIndex == 2 then
    r0_60:ShowFightGamepadBottomContent()
  elseif r1_60 == UIConst.GamePadKey.DPadRight and r0_60.CurrentTab == 1 and r0_60.MultiPlateIndex == 2 then
    r0_60:ShowSystemGamepadBottomContent()
  end
end
function r2_0.OnGamePadDown(r0_61, r1_61)
  -- line: [1055, 1088] id: 61
  local r2_61 = false
  if r1_61 == Const.GamepadFaceButtonRight and r0_61.IsUnfoldListOpen and r0_61.OnUnfoldListClosed then
    r0_61.OnUnfoldListClosed()
    r0_61.OnUnfoldListClosed = nil
    return true
  elseif r1_61 == Const.GamepadFaceButtonUp then
    r0_61:OnPressY()
    r2_61 = true
  elseif r1_61 == Const.GamepadFaceButtonLeft then
    r0_61:OnPressR()
    r2_61 = true
  end
  if not r2_61 then
    r2_61 = r0_61.Tab_Set:Handle_KeyEventOnGamePad(r1_61)
  end
  if r1_61 == Const.GamepadLeftTrigger and r0_61.CurrentTab == 1 and r0_61.MultiPlateIndex ~= 1 and r0_61.Tab_MultiPlate and r0_61.Tab_MultiPlate:GetVisibility() ~= UE4.ESlateVisibility.Collapsed then
    r0_61.Tab_MultiPlate:Handle_KeyEventOnGamePad(r1_61)
    r0_61.MultiPlateIndex = 1
  elseif r1_61 == Const.GamepadRightTrigger and r0_61.CurrentTab == 1 and r0_61.MultiPlateIndex ~= 2 and r0_61.Tab_MultiPlate and r0_61.Tab_MultiPlate:GetVisibility() ~= UE4.ESlateVisibility.Collapsed then
    r0_61.Tab_MultiPlate:Handle_KeyEventOnGamePad(r1_61)
    r0_61.MultiPlateIndex = 2
  elseif r1_61 == UIConst.GamePadKey.DPadLeft and r0_61.CurrentTab == 1 and r0_61.MultiPlateIndex == 2 then
    r0_61:ShowFightGamepadBottomContent()
  elseif r1_61 == UIConst.GamePadKey.DPadRight and r0_61.CurrentTab == 1 and r0_61.MultiPlateIndex == 2 then
    r0_61:ShowSystemGamepadBottomContent()
  end
  return r2_61
end
function r2_0.OnPreviewKeyDown(r0_62, r1_62, r2_62)
  -- line: [1090, 1099] id: 62
  local r4_62 = UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_62))
  if r4_62 == UIConst.GamePadKey.DPadLeft and r0_62.CurrentTab == 1 and r0_62.MultiPlateIndex == 2 then
    r0_62:ShowFightGamepadBottomContent()
  elseif r4_62 == UIConst.GamePadKey.DPadRight and r0_62.CurrentTab == 1 and r0_62.MultiPlateIndex == 2 then
    r0_62:ShowSystemGamepadBottomContent()
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end
function r2_0.AddHoverContent(r0_63, r1_63)
  -- line: [1101, 1109] id: 63
  r0_63.HoverContentList[r1_63] = true
  for r6_63, r7_63 in pairs(r0_63.HoverContentList) do
    if r6_63 ~= r1_63 and r7_63 and r6_63.OnBtnAreaUnHover then
      r6_63:OnBtnAreaUnHover()
      r0_63.HoverContentList[r6_63] = nil
    end
  end
  -- close: r2_63
end
function r2_0.RemoveHoverContent(r0_64, r1_64)
  -- line: [1111, 1115] id: 64
  if r0_64.HoverContentList[r1_64] then
    r0_64.HoverContentList[r1_64] = nil
  end
end
function r2_0.OnPressESC(r0_65)
  -- line: [1117, 1151] id: 65
  if r0_65.HasBeenChanged then
    if r0_65.HasBeenChanged == "GamepadPresetSave" then
      UIManager(r0_65):ShowCommonPopupUI(100190, {
        LeftCallbackObj = r0_65,
        LeftCallbackFunction = function()
          -- line: [1124, 1127] id: 66
          r0_65.OptionUnfold_Prefrence:RestoreOldGamepadPresetInLocal()
          r0_65:OnESCClickCancel()
        end,
        RightCallbackObj = r0_65,
        RightCallbackFunction = function()
          -- line: [1129, 1132] id: 67
          r0_65:SaveAllSetting(true)
          r0_65:CloseSelf()
        end,
        ShortText = string.format(GText(DataMgr.CommonPopupUIContext[100190].PopoverText), r0_65.OptionUnfold_Prefrence:GetGamepadPresetOptionContentText()),
      }, r0_65)
    else
      UIManager(r0_65):ShowCommonPopupUI(100010, {
        LeftCallbackObj = r0_65,
        LeftCallbackFunction = r0_65.OnESCClickCancel,
        RightCallbackObj = r0_65,
        RightCallbackFunction = r0_65.OnConfirmPressESC,
      }, r0_65)
    end
  else
    r0_65:SetInputUIOnly(false)
    local r1_65 = UIManager(r0_65):GetUI("CommonTipSecond")
    if r1_65 then
      r1_65:Close()
    end
    r0_65:CloseSelf()
  end
end
function r2_0.OnPressY(r0_68)
  -- line: [1153, 1160] id: 68
  if r0_68.HasBeenChanged then
    UIUtils.PlayCommonBtnSe(r0_68)
    r0_68:SaveAllSetting()
  else
    return 
  end
end
function r2_0.OnPressR(r0_69)
  -- line: [1162, 1168] id: 69
  UIUtils.PlayCommonBtnSe(r0_69)
  UIManager(r0_69):ShowCommonPopupUI(100011, {
    RightCallbackObj = r0_69,
    RightCallbackFunction = r0_69.OnConfirmPressR,
  }, r0_69)
end
function r2_0.CommonTabToLast(r0_70)
  -- line: [1170, 1172] id: 70
  r0_70.Tab_Set:SelectTab(r0_70.CurrentTab)
end
function r2_0.CommonTabToNext(r0_71)
  -- line: [1174, 1176] id: 71
  r0_71.Tab_Set:SelectTab(r0_71.NewTabId)
end
function r2_0.OnConfirmPressESC(r0_72)
  -- line: [1178, 1182] id: 72
  r0_72:SaveAllSetting(true)
  r0_72.AutoClose = true
end
function r2_0.OnESCClickCancel(r0_73)
  -- line: [1184, 1187] id: 73
  r0_73:RestoreOldValueSet()
  r0_73:CloseSelf()
end
function r2_0.OnConfirmPressR(r0_74)
  -- line: [1189, 1191] id: 74
  r0_74:RestoreAllDefaultSet()
end
function r2_0.OnConfirmClickOtherSet(r0_75)
  -- line: [1193, 1196] id: 75
  r0_75:SaveAllSetting()
  r0_75:CommonTabToNext()
end
function r2_0.OnCancelClickOtherSet(r0_76)
  -- line: [1198, 1203] id: 76
  r0_76:RestoreOldValueSet()
  r0_76:InitSettingParameter()
  r0_76:UpdateKeyboardBottonKey()
  r0_76:CommonTabToNext()
end
function r2_0.OnClickBlankArea(r0_77)
  -- line: [1205, 1207] id: 77
  r0_77:CommonTabToLast()
end
function r2_0.ClearSettingListUnfoldState(r0_78)
  -- line: [1209, 1213] id: 78
  for r5_78, r6_78 in pairs(r0_78.SettingUIs[r0_78.CurrentTab]) do
    r6_78:ClearSettingOptionUnfoldState()
  end
  -- close: r1_78
end
function r2_0.SaveAllSetting(r0_79)
  -- line: [1215, 1227] id: 79
  r0_79.HasBeenChanged = false
  r0_79:UpdateKeyboardBottonKey()
  if r0_79.CurrentTab == 1 and r0_79.MultiPlateIndex == 2 then
    r0_79.OptionUnfold_Prefrence:SaveGamepadPresetOptionSettingInLocal()
  else
    for r5_79, r6_79 in pairs(r0_79.SettingUIs[r0_79.CurrentTab]) do
      if r6_79 and r6_79.SaveSetting then
        r6_79:SaveSetting()
      end
    end
    -- close: r1_79
  end
end
function r2_0.RestoreAllDefaultSet(r0_80)
  -- line: [1229, 1248] id: 80
  r0_80.HasBeenChanged = false
  r0_80:UpdateKeyboardBottonKey()
  if r0_80.CurrentTab == 1 and r0_80.MultiPlateIndex == 2 then
    r0_80.OptionUnfold_Prefrence:RestoreDefaultGamepadPresetInLocal()
  elseif r0_80.CommonTabInfo[r0_80.CurrentTab].TabName == "Control" and r0_80.LayoutPlantIndex == 1 then
    for r4_80 = 0, r0_80.List_CustomOption:GetNumItems() + -1, 1 do
      local r5_80 = r0_80.List_CustomOption:GetItemAt(r4_80)
      if r5_80 and r5_80.SelfWidget and r5_80.SelfWidget.RestoreDefaultOptionSet then
        r5_80.SelfWidget:RestoreDefaultOptionSet()
      end
    end
  else
    for r5_80, r6_80 in pairs(r0_80.SettingUIs[r0_80.CurrentTab]) do
      if r6_80 and r6_80.RestoreDefaultSet then
        r6_80:RestoreDefaultSet()
      end
    end
    -- close: r1_80
  end
end
function r2_0.RestoreOldValueSet(r0_81)
  -- line: [1250, 1256] id: 81
  for r5_81, r6_81 in pairs(r0_81.SettingUIs[r0_81.CurrentTab]) do
    if r6_81 and r6_81.RestoreOldValueSet then
      r6_81:RestoreOldValueSet()
    end
  end
  -- close: r1_81
end
function r2_0.OnClickAllLeftMouseButton(r0_82)
  -- line: [1258, 1264] id: 82
  for r5_82, r6_82 in pairs(r0_82.SettingUIs[r0_82.CurrentTab]) do
    if r6_82 and r6_82.OnClickLeftMouseButton then
      r6_82:OnClickLeftMouseButton()
    end
  end
  -- close: r1_82
end
function r2_0.UpdateUnfoldListPosition(r0_83, r1_83, r2_83)
  -- line: [1266, 1274] id: 83
  local r3_83 = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r0_83.WBP_Set_UnfoldList)
  if r2_83 then
    r3_83:SetAlignment(FVector2D(0.5, 1))
  else
    r3_83:SetAlignment(FVector2D(0.5, 0))
  end
  r3_83:SetPosition(r1_83)
end
function r2_0.BindUnfoldListClosedCallback(r0_84, r1_84)
  -- line: [1276, 1278] id: 84
  r0_84.OnUnfoldListClosed = r1_84
end
function r2_0.ChangeUnfoldListSelection(r0_85, r1_85)
  -- line: [1280, 1290] id: 85
  for r7_85, r8_85 in pairs(r0_85.WBP_Set_UnfoldList.SubOption_List:GetListItems()) do
    r8_85.SelectedOptionId = r1_85
  end
  -- close: r3_85
  for r8_85, r9_85 in pairs(r0_85.WBP_Set_UnfoldList.SubOption_List:GetDisplayedEntryWidgets()) do
    r9_85:UpdateEntrySelection()
  end
  -- close: r4_85
end
function r2_0.FocusToSelectedUnfoldListOption(r0_86)
  -- line: [1292, 1307] id: 86
  local r1_86 = r0_86.WBP_Set_UnfoldList.SubOption_List:GetListItems()
  for r6_86 = 0, r0_86.WBP_Set_UnfoldList.SubOption_List:GetNumItems() + -1, 1 do
    local r7_86 = r1_86:GetRef(r6_86 + 1)
    if r7_86 and r7_86.SelectedOptionId == r7_86.Id then
      r0_86.WBP_Set_UnfoldList.SubOption_List:NavigateToIndex(r6_86)
      break
    end
  end
  r0_86:UpdateBottomKey({
    {
      UIConst.GamePadImgKey.FaceButtonBottom,
      GText("UI_Tips_Ensure")
    },
    {
      UIConst.GamePadImgKey.FaceButtonRight,
      GText("UI_Tips_Close")
    }
  })
end
function r2_0.SetSettingUnfoldListPC(r0_87, r1_87)
  -- line: [1309, 1341] id: 87
  if r1_87 then
    r0_87.WBP_Set_UnfoldList:StopAllAnimations()
    r0_87.WBP_Set_UnfoldList:PlayAnimation(r0_87.WBP_Set_UnfoldList.In)
    if r0_87:IsExistTimer("SetList") then
      r0_87:RemoveTimer("SetList")
    end
    r0_87.IsUnfoldListOpen = true
    r0_87.WBP_Set_UnfoldList:SetVisibility(UE4.ESlateVisibility.Visible)
    r0_87.ScrollBox_Option:SetConsumeMouseWheel(EConsumeMouseWheel.Never)
    if UIUtils.IsGamepadInput() then
      r0_87:AddTimer(0.1, function()
        -- line: [1321, 1323] id: 88
        r0_87:FocusToSelectedUnfoldListOption()
      end)
    end
  else
    if r0_87.IsUnfoldListOpen then
      r0_87.IsUnfoldListOpen = false
      r0_87.WBP_Set_UnfoldList:SetVisibility(UE4.ESlateVisibility.Collapsed)
      r0_87.WBP_Set_UnfoldList:StopAllAnimations()
      r0_87.WBP_Set_UnfoldList:PlayAnimation(r0_87.WBP_Set_UnfoldList.Out)
      r0_87.ScrollBox_Option:SetConsumeMouseWheel(EConsumeMouseWheel.WhenScrollingPossible)
      r0_87:AddTimer(r0_87.WBP_Set_UnfoldList.Out:GetEndTime(), function()
        -- line: [1333, 1335] id: 89
        r0_87.WBP_Set_UnfoldList:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end, false, 0, "SetList", true)
    end
    r0_87.WBP_Set_UnfoldList:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r2_0.PlayInAnim(r0_90)
  -- line: [1343, 1350] id: 90
  if r0_90.IsInLoginMainPage then
    r0_90:PlayAnimation(r0_90.logIn)
  else
    r0_90:PlayAnimation(r0_90.In)
  end
  AudioManager(r0_90):PlayUISound(r0_90, "event:/ui/armory/open", "OpenShopSetting", nil)
end
function r2_0.CloseSelf(r0_91)
  -- line: [1352, 1361] id: 91
  if r0_91.OptionUnfold_Prefrence and r0_91.OptionUnfold_Prefrence.IsListOpen then
    r0_91.OptionUnfold_Prefrence:OnClickSubOptionList()
  end
  r0_91:BlockAllUIInput(true)
  r0_91:StopAnimation(r0_91.In)
  r0_91:PlayAnimation(r0_91.Out)
  AudioManager(r0_91):SetEventSoundParam(r0_91, "OpenShopSetting", {
    ToEnd = 1,
  })
  r0_91:BindToAnimationFinished(r0_91.Out, {
    r0_91,
    r0_91.Close
  })
end
function r2_0.Close(r0_92)
  -- line: [1363, 1390] id: 92
  r0_92:UnbindAllFromAnimationFinished(r0_92.Out)
  for r5_92, r6_92 in pairs(r0_92.SettingUIs) do
    for r11_92, r12_92 in pairs(r6_92) do
      if r12_92 and r12_92.OnParentClosed then
        r12_92:OnParentClosed()
      end
    end
    -- close: r7_92
  end
  -- close: r1_92
  local r1_92 = UIManager(r0_92):GetUI(UIConst.MenuWorld) and UIManager(r0_92):GetUI(UIConst.MenuLevel)
  if r1_92 and not r0_92.CloseEsc then
    r1_92:PlayInAnim()
  end
  if r1_92 and r0_92.CloseEsc then
    r1_92.CloseByChild = true
  end
  if not r0_92.IsInLoginMainPage then
    UIManager(r0_92):SwitchUINpcCamera(false, "Setting", r0_92.NpcId, {
      bDestroyNpc = true,
      IsHaveInOutAnim = r0_92.IsNeedPlayNpcAnim,
    })
  end
  if r0_92.LastSystem and r0_92.LastSystem.SetFocus then
    r0_92.LastSystem:SetFocus()
  end
  if r0_92.RegionOnline ~= r1_0:Get("AutoJoin") then
    EventManager:FireEvent(EventID.ChangeRegionOnline, r1_0:Get("AutoJoin"))
  end
  r0_92.Super.Close(r0_92)
end
function r2_0.CloseSelfAndEsc(r0_93)
  -- line: [1392, 1395] id: 93
  r0_93.CloseEsc = true
  r0_93:Close()
end
return r2_0
