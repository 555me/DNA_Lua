-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Activity\Widget\GuildWar\WBP_Activity_GuildWar_EntranceItem_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class("BluePrints.UI.BP_EMUserWidget_C")
r0_0._components = {
  "BluePrints.UI.BP_EMUserWidgetUtils_C"
}
function r0_0.Construct(r0_1)
  -- line: [6, 11] id: 1
  r0_1.Btn_Click.OnClicked:Add(r0_1, r0_1.OnButonClicked)
  r0_1.Btn_Click.OnPressed:Add(r0_1, r0_1.OnButonPressed)
  r0_1.Btn_Click.OnHovered:Add(r0_1, r0_1.OnButonHovered)
  r0_1.Btn_Click.OnUnhovered:Add(r0_1, r0_1.OnButonUnhovered)
end
function r0_0.Destruct(r0_2)
  -- line: [13, 18] id: 2
  r0_2.Btn_Click.OnClicked:Remove(r0_2, r0_2.OnButonClicked)
  r0_2.Btn_Click.OnPressed:Remove(r0_2, r0_2.OnButonPressed)
  r0_2.Btn_Click.OnHovered:Remove(r0_2, r0_2.OnButonHovered)
  r0_2.Btn_Click.OnUnhovered:Remove(r0_2, r0_2.OnButonUnhovered)
end
function r0_0.Init(r0_3, r1_3, r2_3, r3_3, r4_3)
  -- line: [20, 29] id: 3
  r0_3.CallBackObj = r1_3
  r0_3.CallBack = r2_3
  if r3_3 then
    r0_3.Text_Name:SetText(GText(r3_3))
  end
  if r4_3 then
    r0_3:SetGamepadKey(r4_3)
  end
end
function r0_0.OnButonClicked(r0_4)
  -- line: [32, 48] id: 4
  if not r0_4.Forbbiden then
    r0_4:PlayAnimation(r0_4.Click)
  end
  if r0_4.CallBackObj and r0_4.CallBack then
    local r1_4 = r0_4.CallBackObj.RootWidget
    if r1_4 and type(r1_4.CheckIsInCloseSelfState) == "function" and r1_4:CheckIsInCloseSelfState() then
      DebugPrint("GuildWar_EntranceItem OnButonClicked, RootWidget is in close self state, So return")
      return 
    end
    AudioManager(r0_4):PlayUISound(r0_4, "event:/ui/activity/gerengonghuizhan_small_btn_click", "", nil)
    r0_4.CallBack(r0_4.CallBackObj)
  end
end
function r0_0.OnButonPressed(r0_5)
  -- line: [50, 54] id: 5
  if not r0_5.Forbbiden then
    r0_5:PlayAnimation(r0_5.Press)
  end
end
function r0_0.OnButonHovered(r0_6)
  -- line: [57, 61] id: 6
  if not r0_6.Forbbiden then
    r0_6:PlayAnimation(r0_6.Hover)
  end
end
function r0_0.OnButonUnhovered(r0_7)
  -- line: [63, 67] id: 7
  if not r0_7.Forbbiden then
    r0_7:PlayAnimation(r0_7.UnHover)
  end
end
function r0_0.SetCoinQuantity(r0_8, r1_8)
  -- line: [69, 74] id: 8
  if type(r1_8) ~= "number" then
    return 
  end
  r0_8.Text_Coin:SetText(r1_8)
end
function r0_0.SetCoinIconByShop(r0_9, r1_9)
  -- line: [76, 85] id: 9
  local r2_9 = DataMgr.Resource[r1_9]
  if not r2_9 or not r2_9.Icon then
    return 
  end
  local r3_9 = LoadObject(r2_9.Icon)
  if r3_9 then
    r0_9.Icon_Coin:SetBrushResourceObject(r3_9)
  end
end
function r0_0.SetForbiddenState(r0_10, r1_10)
  -- line: [87, 95] id: 10
  r0_10.Forbbiden = r1_10
  if r1_10 then
    r0_10:PlayAnimation(r0_10.Forbidden)
  else
    r0_10:PlayAnimation(r0_10.Normal)
  end
end
function r0_0.SetTimeText(r0_11, r1_11)
  -- line: [97, 109] id: 11
  if not r1_11 then
    return 
  end
  local r2_11 = UIUtils.GetLeftTimeStrStyle2
  local r2_11, r3_11 = r2_11(r1_11)
  local function r4_11()
    -- line: [103, 105] id: 12
    r0_11.Time:SetTimeText(GText("UI_Disptach_RemainTime"), r2_11)
  end
  r4_11()
  r0_11:AddTimer(60, r4_11, true, 0, "GuildWarShopRemainTime", true)
end
function r0_0.SetGamepadKey(r0_13, r1_13)
  -- line: [111, 113] id: 13
  r0_13.Key_Controller:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = r1_13,
      }
    },
  })
end
function r0_0.SetGamepadVisibility(r0_14, r1_14)
  -- line: [115, 117] id: 14
  r0_14.Key_Controller:SetVisibility(UIConst.VisibilityOp[r1_14])
end
function r0_0.SetReddotVisibility(r0_15, r1_15)
  -- line: [119, 121] id: 15
  r0_15.Reddot:SetVisibility(UIConst.VisibilityOp[r1_15])
end
AssembleComponents(r0_0)
return r0_0
