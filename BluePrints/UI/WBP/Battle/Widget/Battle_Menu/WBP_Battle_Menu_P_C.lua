-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Battle\Widget\Battle_Menu\WBP_Battle_Menu_P_C.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = "RightMouseButton"
local r1_0 = "Gamepad_RightShoulder"
local r2_0 = {
  "BATTLE_WHEEL_DISPLAY_TITLE1",
  "BATTLE_WHEEL_DISPLAY_TITLE2",
  "BATTLE_WHEEL_DISPLAY_TITLE3"
}
local r3_0 = Class("BluePrints.UI.BP_UIState_C")
function r3_0.UpdateArgs(r0_1, r1_1)
  -- line: [14, 18] id: 1
  DebugPrint("gmy@WBP_Battle_Menu_P_C M:UpdateArgs", r1_1)
  r0_1:InitEvents()
  r0_1.Battle_Menu:UpdateArgs(r1_1)
end
function r3_0.SelectAndCloseMenu(r0_2)
  -- line: [20, 24] id: 2
  r0_2:StopAllAnimations()
  r0_2.Battle_Menu:SelectAndCloseMenu()
  r0_2:Close()
end
function r3_0.InitUIInfo(r0_3, r1_3, r2_3, r3_3, ...)
  -- line: [27, 79] id: 3
  r3_0.Super.InitUIInfo(r0_3, r1_3, r2_3, r3_3, ...)
  local r4_3 = "RightMouseButton"
  local r5_3 = r0_3.GameInputModeSubsystem:GetCurrentInputType()
  local r6_3 = {}
  if r5_3 == ECommonInputType.Gamepad then
    r4_3 = "RB"
    r0_3.bIsGamepad = true
    r0_3.GameInputModeSubsystem:SetNavigateWidgetVisibility(true)
    r0_3.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
    r6_3 = {
      {
        Type = "Img",
        ImgShortPath = r4_3,
      }
    }
  else
    r6_3 = {
      {
        Type = "Text",
        Text = r4_3,
      }
    }
  end
  r0_3.Key_Option:CreateCommonKey({
    KeyInfoList = r6_3,
  })
  local r7_3 = r0_3.Battle_Menu
  if r7_3 then
    r7_3 = r0_3.Battle_Menu
    r7_3.Owner = r0_3
  end
  ... = ... -- error: untaken top expr
  r0_3.QuestBattleWheelID = r7_3
  r0_3.Battle_Menu:InitQuestBattleWheel(r0_3.QuestBattleWheelID)
  if r0_3.Btn_Close then
    r0_3.Btn_Close.OnClicked:Add(r0_3, function()
      -- line: [65, 77] id: 4
      if not r0_3 then
        return 
      end
      local r0_4 = GWorld:GetMainPlayer()
      if r0_4 and not r0_3.Battle_Menu.bIsClosing then
        r0_4:CloseBattleWheel()
      end
    end)
  end
end
function r3_0.OnLoaded(r0_5)
  -- line: [82, 85] id: 5
  DebugPrint("gmy@WBP_Battle_Menu_P_C M:OnLoaded", r0_5, r0_5.Battle_Menu, r0_5.Com_Bg)
  r0_5.Battle_Menu:OnLoaded()
end
function r3_0.CalculateMousePos(r0_6)
  -- line: [87, 101] id: 6
  local r1_6 = r0_6.Battle_Menu.Bg01:GetTickSpaceGeometry()
  local r3_6 = USlateBlueprintLibrary.LocalToAbsolute(r1_6, USlateBlueprintLibrary.GetLocalSize(r1_6) / 2)
  local r4_6 = UE4.UGameplayStatics.GetPlayerController(r0_6, 0)
  local r5_6, r6_6 = USlateBlueprintLibrary.AbsoluteToViewport(r0_6, r3_6)
  local r8_6 = USlateBlueprintLibrary.GetLocalSize(r0_6:GetTickSpaceGeometry())
  local r9_6 = UIManager(r0_6):GetViewportSize()
  r4_6:SetMouseLocation(math.floor(r6_6.X / r8_6.X * r9_6.X), math.floor(r6_6.Y / r8_6.Y * r9_6.Y))
end
function r3_0.Construct(r0_7)
  -- line: [103, 105] id: 7
  r0_7.FrameCounter = 0
end
function r3_0.Tick(r0_8, r1_8, r2_8)
  -- line: [107, 112] id: 8
  r0_8.FrameCounter = r0_8.FrameCounter + 1
  if r0_8.FrameCounter == 3 then
    r0_8:CalculateMousePos()
  end
end
function r3_0.InitEvents(r0_9)
  -- line: [114, 118] id: 9
  DebugPrint("gmy@WBP_Battle_Menu_P_C M:InitEvents")
  r0_9:AddDispatcher(EventID.GameViewportInputKeyReleased, r0_9, r0_9.HandleKeyReleased)
  r0_9:AddDispatcher(EventID.OnDisplayIndexChanged, r0_9, r0_9.RefreshDisplayIndex)
end
function r3_0.HandleKeyReleased(r0_10, r1_10)
  -- line: [120, 138] id: 10
  DebugPrint("gmy@WBP_Battle_Menu_P_C M:HandleKeyReleased", r0_10.Battle_Menu, r1_10.KeyName)
  local r2_10 = CommonUtils:GetKeyName("OpenBattleWheel")
  if r0_0 == r1_10.KeyName or r1_0 == r1_10.KeyName then
    r0_10.Battle_Menu:OnChangeDisplayWheel()
  elseif r1_10.KeyName == r2_10 or r1_10.KeyName == Const.GamepadLeftTrigger or r1_10.KeyName == Const.GamepadFaceButtonRight then
    r0_10:AddTimer(2, function()
      -- line: [127, 136] id: 11
      DebugPrint("gmy@WBP_Battle_Menu_P_C M:HandleKeyReleased11111", r0_10.Battle_Menu.bIsClosing)
      local r0_11 = GWorld:GetMainPlayer()
      if r0_11 and not r0_10.Battle_Menu.bIsClosing then
        r0_11:CloseBattleWheel()
      end
    end)
  end
end
function r3_0.RefreshDisplayIndex(r0_12, r1_12, r2_12)
  -- line: [140, 160] id: 12
  local r3_12 = nil
  r0_12.Text_Num:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  if r2_12 and r1_12 == 1 then
    r3_12 = GText("UI_BattleWheel_Explore")
    r0_12.Text_Name:SetText(GText("UI_BattleWheel_Explore"))
    r0_12.Text_Num:SetVisibility(UIConst.VisibilityOp.Collapsed)
  elseif r2_12 and r1_12 ~= 1 then
    r3_12 = GText("MAIN_UI_BATTLEWHEEL") .. r1_12 + -1
    r0_12.Text_Name:SetText(GText("MAIN_UI_BATTLEWHEEL"))
    r0_12.Text_Num:SetText(r1_12 + -1)
  else
    r3_12 = GText("MAIN_UI_BATTLEWHEEL") .. r1_12
    r0_12.Text_Name:SetText(GText("MAIN_UI_BATTLEWHEEL"))
    r0_12.Text_Num:SetText(r1_12)
  end
  r0_12.Text_Option:SetText(GText("BattleWheel_SwitchWheel"))
  DebugPrint("gmy@WBP_Battle_Menu_P_C M:RefreshDisplayIndex", r3_12, r1_12, r2_12)
end
function r3_0.Destruct(r0_13)
  -- line: [162, 165] id: 13
  r3_0.Super.Destruct(r0_13)
  r0_13:RemoveAllDispatcher()
end
function r3_0.CloseMenu(r0_14)
  -- line: [172, 176] id: 14
  r0_14:StopAllAnimations()
  r0_14.Battle_Menu:CloseMenu()
  r0_14:Close()
end
function r3_0.Close(r0_15)
  -- line: [178, 181] id: 15
  r3_0.Super.Close(r0_15)
  r0_15.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
end
return r3_0
