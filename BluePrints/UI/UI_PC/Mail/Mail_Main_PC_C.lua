-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\UI_PC\Mail\Mail_Main_PC_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "Blueprints.UI.BP_UIState_C"
})
function r0_0.PreConstruct(r0_1, r1_1)
  -- line: [11, 16] id: 1
  r0_1.WBP_Mail_Root.bIsFocusable = true
  r0_1.bIsFocusable = true
  r0_1.WBP_Mail_Root.bShoulFocusToLastFocusedWidget = true
  r0_1.bShoulFocusToLastFocusedWidget = true
end
function r0_0.OnLoaded(r0_2, ...)
  -- line: [19, 42] id: 2
  r0_2.Super.OnLoaded(r0_2, ...)
  r0_2.Platform = CommonUtils.GetDeviceTypeByPlatformName(r0_2)
  AudioManager(r0_2):PlayUISound(r0_2, "event:/ui/armory/open", "MailMain", nil)
  if r0_2.Platform == "PC" then
    local r1_2 = {}
    table.insert(r1_2, {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = r0_2.OnPressESC,
          Owner = r0_2,
        }
      },
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
          ClickCallback = r0_2.OnPressESC,
          Owner = r0_2,
        }
      },
      Desc = GText("UI_BACK"),
    })
    r0_2.Common_Tab:Init({
      DynamicNode = {
        "Back",
        "BottomKey"
      },
      LeftKey = "NotShow",
      RightKey = "NotShow",
      TitleName = GText("MAIN_UI_MAIL"),
      BottomKeyInfo = r1_2,
      StyleName = "Text",
      OwnerPanel = r0_2,
      BackCallback = r0_2.OnPressESC,
    })
  else
    r0_2.Common_Tab:Init({
      DynamicNode = {
        "Back"
      },
      TitleName = GText("MAIN_UI_MAIL"),
      StyleName = "Text",
      OwnerPanel = r0_2,
      BackCallback = r0_2.OnPressESC,
    })
  end
  r0_2.WBP_Mail_Root:Init(r0_2)
  r0_2:PlayInAnim()
end
function r0_0.ReceiveEnterState(r0_3, r1_3)
  -- line: [44, 53] id: 3
  r0_0.Super.ReceiveEnterState(r0_3, r1_3)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    r0_3.WBP_Mail_Root:SetFocus()
    r0_3:OnUpdateUIStyleByInputTypeChange(r0_3.GameInputModeSubsystem:GetCurrentInputType(), r0_3.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  if r0_3.WBP_Mail_Root.bMarkMailStar then
    r0_3.WBP_Mail_Root:PlayStarAnim()
  end
end
function r0_0.RefreshTabBottomKey(r0_4)
  -- line: [55, 94] id: 4
  if UIUtils.IsMobileInput() then
    return 
  end
  if r0_4.Common_Tab and r0_4.Common_Tab.UpdateBottomKeyInfo then
    local r1_4 = {}
    if r0_4.WBP_Mail_Root:CheckHaveRewardToReceiveAll() then
      table.insert(r1_4, {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Space",
            ClickCallback = r0_4.OnPressSPACE,
            Owner = r0_4,
          }
        },
        Desc = GText("UI_Mail_Recieveall"),
      })
    end
    if UIUtils.CheckScrollBoxCanScroll(r0_4.WBP_Mail_Root.ScrollBox_TaskDetail) then
      table.insert(r1_4, {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "RV",
            Owner = r0_4,
          }
        },
        Desc = GText("UI_Controller_Slide"),
        bLongPress = false,
      })
    end
    if r0_4.WBP_Mail_Root.GamePadState == "Hyperlink" then
      r1_4 = {}
      table.insert(r1_4, {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = r0_4,
          }
        },
        Desc = GText("UI_Controller_Go"),
        bLongPress = false,
      })
    end
    if r0_4.WBP_Mail_Root.GamePadState == "ListReward" then
      r1_4 = {}
      table.insert(r1_4, {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = r0_4,
          }
        },
        Desc = GText("UI_CTL_Select"),
        bLongPress = false,
      })
    end
    table.insert(r1_4, {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = r0_4.OnPressESC,
          Owner = r0_4,
        }
      },
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
          ClickCallback = r0_4.OnPressESC,
          Owner = r0_4,
        }
      },
      Desc = GText("UI_BACK"),
    })
    r0_4.Common_Tab:UpdateBottomKeyInfo(r1_4)
  end
end
function r0_0.OnUpdateUIStyleByInputTypeChange(r0_5, r1_5, r2_5)
  -- line: [96, 99] id: 5
  r0_5.Super.OnUpdateUIStyleByInputTypeChange(r0_5, r1_5, r2_5)
  r0_5.WBP_Mail_Root:OnUpdateUIStyleByInputTypeChange(r1_5, r2_5)
end
function r0_0.OnPreviewKeyDown(r0_6, r1_6, r2_6)
  -- line: [101, 104] id: 6
  r0_6.WBP_Mail_Root:OnMailRootPreviewKeyDown(r1_6, r2_6)
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end
function r0_0.OnKeyDown(r0_7, r1_7, r2_7)
  -- line: [106, 109] id: 7
  r0_7.WBP_Mail_Root:OnMailRootKeyDown(r1_7, r2_7)
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end
function r0_0.OnPressESC(r0_8)
  -- line: [111, 113] id: 8
  r0_8:PlayOutAnim()
end
function r0_0.OnPressSPACE(r0_9)
  -- line: [115, 117] id: 9
  r0_9.WBP_Mail_Root:OnPressSPACE()
end
function r0_0.PlayInAnim(r0_10)
  -- line: [119, 127] id: 10
  r0_10:BlockAllUIInput(true)
  r0_10:PlayAnimation(r0_10.In)
  r0_10:BindToAnimationFinished(r0_10.In, {
    r0_10,
    function()
      -- line: [122, 125] id: 11
      r0_10:BlockAllUIInput(false)
      r0_10.WBP_Mail_Root:UpdateFocusState("ListMail")
    end
  })
end
function r0_0.PlayOutAnim(r0_12)
  -- line: [129, 135] id: 12
  r0_12:PlayAnimation(r0_12.Out)
  r0_12:BlockAllUIInput(true)
  r0_12.WBP_Mail_Root:PlayOutAnim()
  AudioManager(r0_12):SetEventSoundParam(r0_12, "MailMain", {
    ToEnd = 1,
  })
  r0_12:BindToAnimationFinished(r0_12.Out, {
    r0_12,
    r0_12.CloseSelf
  })
end
function r0_0.CloseSelf(r0_13)
  -- line: [137, 141] id: 13
  r0_13:BlockAllUIInput(false)
  r0_13.WBP_Mail_Root:RemoveReddotListen()
  r0_13:Close()
end
return r0_0
