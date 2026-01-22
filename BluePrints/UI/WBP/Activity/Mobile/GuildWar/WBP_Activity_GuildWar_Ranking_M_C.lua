-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Activity\Mobile\GuildWar\WBP_Activity_GuildWar_Ranking_M_C.lua
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
  -- line: [14, 24] id: 3
  r0_3.TabConfigData = {
    DynamicNode = {
      "Back",
      "Tip",
      "BottomKey"
    },
    TitleName = GText("RaidDungeon_Rank"),
    Tabs = r0_3.AllTabInfo,
    StyleName = "TextImage",
    OwnerPanel = r0_3,
    BackCallback = r0_3.CloseSelf,
  }
  r0_3.Tab:Init(r0_3.TabConfigData, true)
end
function r0_0.OnKeyDown(r0_4, r1_4, r2_4)
  -- line: [26, 34] id: 4
  if UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_4)) == "Escape" then
    r0_4:CloseSelf()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end
function r0_0.OnFocusReceived(r0_5)
  -- line: [37, 43] id: 5
  local r1_5 = r0_5.LastClickedItem
  if r1_5 and r1_5.SelfWidget then
    r0_5.List_Ranking:NavigateToIndex(r1_5.RankInfo.RankNum + -1)
  end
  return UIUtils.Handled
end
return r0_0
