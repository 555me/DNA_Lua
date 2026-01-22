-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Activity\PC\GuildWar\WBP_Activity_GuildWar_Ranking_P_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.WBP.Activity.PC.GuildWar.WBP_Activity_GuildWar_RankingBase"
})
function r0_0.Construct(r0_1)
  -- line: [6, 8] id: 1
  r0_1.Super.Construct(r0_1)
end
function r0_0.Destruct(r0_2)
  -- line: [10, 12] id: 2
  r0_2.Super.Destruct(r0_2)
end
function r0_0.InitCommonTab(r0_3)
  -- line: [14, 46] id: 3
  r0_3.NormalBottomKeyInfo = {
    {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "LS",
        }
      },
      Desc = GText("UI_CTL_PositionPlayer"),
      bLongPress = false,
    },
    {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "A",
        }
      },
      Desc = GText("UI_Controller_Check"),
      bLongPress = false,
    },
    {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "RH",
        }
      },
      Desc = GText("UI_CTL_RotatePreview"),
    },
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
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
  }
  r0_3.TabConfigData = {
    TitleName = GText("RaidDungeon_Rank"),
    LeftKey = "Q",
    RightKey = "E",
    DynamicNode = {
      "Back",
      "ResourceBar",
      "BottomKey"
    },
    StyleName = "TextImage",
    OwnerPanel = r0_3,
    BackCallback = r0_3.CloseSelf,
    BottomKeyInfo = r0_3.NormalBottomKeyInfo,
  }
  r0_3.Tab:Init(r0_3.TabConfigData, true)
end
function r0_0.UpdateTapBottomKeyInfo(r0_4, r1_4)
  -- line: [48, 67] id: 4
  if not r0_4.MenuBottomKeyInfo then
    r0_4.MenuBottomKeyInfo = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
          }
        },
        Desc = GText("UI_Tips_Ensure"),
        bLongPress = false,
      },
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
          }
        },
        Desc = GText("UI_BACK"),
        bLongPress = false,
      }
    }
  end
  if r1_4 then
    r0_4.Tab:UpdateBottomKeyInfo(r0_4.MenuBottomKeyInfo)
  else
    r0_4.Tab:UpdateBottomKeyInfo(r0_4.NormalBottomKeyInfo)
  end
end
function r0_0.OnKeyDown(r0_5, r1_5, r2_5)
  -- line: [69, 84] id: 5
  local r3_5 = UE4.UKismetInputLibrary.GetKey(r2_5)
  local r4_5 = UE4.UFormulaFunctionLibrary.Key_GetFName(r3_5)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(r3_5) then
    if r4_5 == "Gamepad_FaceButton_Right" then
      r0_5:CloseSelf()
    elseif r4_5 == "Gamepad_LeftThumbstick" then
      r0_5:OnMyselfButtonClicked()
    end
  elseif r4_5 == "Escape" then
    r0_5:CloseSelf()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end
function r0_0.OnAnalogValueChanged(r0_6, r1_6, r2_6)
  -- line: [86, 97] id: 6
  if UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_6)) == "Gamepad_RightX" then
    if r0_6.ActorController then
      r0_6.ActorController:OnDragging({
        X = UKismetInputLibrary.GetAnalogValue(r2_6) * 10,
      })
    end
    return UIUtils.Handled
  end
  return UIUtils.Unhandled
end
function r0_0.OnFocusReceived(r0_7)
  -- line: [100, 106] id: 7
  local r1_7 = r0_7.LastClickedItem
  if r1_7 and r1_7.SelfWidget then
    r0_7.List_Ranking:NavigateToIndex(r1_7.RankInfo.RankNum + -1)
  end
  return UIUtils.Handled
end
return r0_0
