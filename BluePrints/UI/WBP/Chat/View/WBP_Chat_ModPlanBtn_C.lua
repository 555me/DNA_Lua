-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Chat\View\WBP_Chat_ModPlanBtn_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = ModController:GetModel()
local r1_0 = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})
function r1_0.OnBtnClickInMod(r0_1)
  -- line: [17, 50] id: 1
  local r1_1 = ChatController:GetView()
  if r1_1.IsBeginToClose then
    return 
  end
  local r2_1 = nil
  if r0_1.TargetType == "Weapon" then
    local r3_1 = DataMgr.BattleWeapon[r0_1.TargetId]
    if r3_1.WeaponTag then
      if table.findValue(r3_1.WeaponTag, "Melee") then
        r2_1 = "Melee"
      elseif table.findValue(r3_1.WeaponTag, "Ranged") then
        r2_1 = "Ranged"
      end
    end
  else
    r2_1 = r0_1.TargetType
  end
  local r3_1 = r1_1.bBattle
  r1_1:Close()
  local r4_1 = nil
  if r0_1.bSelfMsg then
    r4_1 = ModCommon.MainUICase.Preview
  else
    r4_1 = ModCommon.MainUICase.CopyMode
  end
  r0_0:CreateDummyAvatarForCopyMode(r0_1.ModSuitInfo)
  ModController:OpenView(ModCommon.ArmoryMod, r0_1.TargetType, r2_1, {
    1
  }, nil, {
    Func = function()
      -- line: [46, 48] id: 2
      ChatController:OpenView(nil, r3_1)
    end,
  }, r4_1, nil)
  AudioManager(r0_1):PlayUISound(r0_1, "event:/ui/common/click_mod_suit_preset", nil, nil)
end
function r1_0.OnBtnClickInSkin(r0_3)
  -- line: [51, 69] id: 3
  local r1_3 = ChatController:GetView()
  if r1_3.IsBeginToClose then
    return 
  end
  if IsClient(r0_3) then
    UIManager(r0_3):ShowUITip("CommonToastMain", GText("UI_COMMONPOP_TITLE_100059"))
    return 
  end
  local r2_3 = r1_3.bBattle
  r1_3:Close()
  UIManager(r0_3):LoadUINew("ArmorySkin", {
    Type = r0_3.SkinType,
    SkinId = r0_3.SkinId,
    OpenPreviewDyeFromChat = true,
    Colors = r0_3.DyePlanInfo.Colors,
    OnCloseCallback = function()
      -- line: [65, 67] id: 4
      ChatController:OpenView(nil, r2_3)
    end,
  })
end
function r1_0.Destruct(r0_5)
  -- line: [70, 73] id: 5
end
function r1_0.InitMod(r0_6, r1_6, r2_6)
  -- line: [75, 110] id: 6
  r0_6.DyePlanInfo = nil
  r0_6.ModSuitInfo = r1_6
  local r4_6 = r1_6.TargetInfo[1]
  local r5_6 = r1_6.TargetInfo[2]
  r0_6.TargetType = r4_6
  r0_6.TargetId = r5_6
  r0_6.Text_Plan:SetText(GText(r1_6.TargetInfo[6]))
  local r6_6 = nil
  local r7_6 = "角色或武器被删除了!!!!"
  if r4_6 == "Char" then
    r6_6 = DataMgr.Char[r5_6]
    r7_6 = r6_6.CharName
  elseif r4_6 == "Weapon" then
    r6_6 = DataMgr.Weapon[r5_6]
    r7_6 = r6_6.WeaponName
  elseif r4_6 == "UWeapon" then
    r6_6 = DataMgr.UWeapon[r5_6]
    r7_6 = r6_6.WeaponName
  end
  if r6_6.Icon then
    UResourceLibrary.LoadObjectAsync(r0_6, r6_6.Icon, {
      r0_6,
      function(r0_7, r1_7)
        -- line: [96, 99] id: 7
        r0_6.Img_Avatar:GetDynamicMaterial():SetTextureParameterValue("IconMap", r1_7)
      end
    })
  end
  r0_6.Text_Avatar:SetText(GText(r7_6))
  r0_6.bSelfMsg = r2_6
  r0_6.Button_Area.OnClicked:Clear()
  r0_6.Button_Area.OnClicked:Add(r0_6, r0_6.OnBtnClickInMod)
end
function r1_0.InitDye(r0_8, r1_8, r2_8)
  -- line: [112, 143] id: 8
  r0_8.ModSuitInfo = nil
  r0_8.DyePlanInfo = r1_8
  local r4_8 = r1_8.SkinType
  local r5_8 = r1_8.SkinId
  local r6_8 = r1_8.TargetName
  r0_8.SkinType = r4_8
  r0_8.SkinId = r5_8
  r0_8.Text_Plan:SetText(GText(r1_8.PlanName))
  local r7_8 = nil
  if r4_8 == "Char" then
    r7_8 = DataMgr.Skin[r5_8]
  elseif r4_8 == "Weapon" then
    r7_8 = DataMgr.WeaponSkin[r5_8] and DataMgr.Weapon[r5_8]
  end
  if r7_8 and r7_8.Icon then
    UResourceLibrary.LoadObjectAsync(r0_8, r7_8.Icon, {
      r0_8,
      function(r0_9, r1_9)
        -- line: [129, 132] id: 9
        r0_8.Img_Avatar:GetDynamicMaterial():SetTextureParameterValue("IconMap", r1_9)
      end
    })
  end
  r0_8.Text_Avatar:SetText(GText(r6_8))
  r0_8.bSelfMsg = r2_8
  r0_8.Button_Area.OnClicked:Clear()
  r0_8.Button_Area.OnClicked:Add(r0_8, r0_8.OnBtnClickInSkin)
end
return r1_0
