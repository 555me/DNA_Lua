-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Team\View\WBP_Team_PhantomItem_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})
function r0_0.Construct(r0_1)
  -- line: [16, 18] id: 1
  r0_1.Text_LevelName:SetText(GText("BATTLE_UI_BLOOD_LV"))
end
function r0_0.Destruct(r0_2)
  -- line: [21, 22] id: 2
end
function r0_0.Init(r0_3, r1_3)
  -- line: [24, 46] id: 3
  r0_3.Text_Level:SetText(r1_3.CharLevel)
  local r4_3 = TeamCommon.Normal .. DataMgr.BattleChar[r1_3.CharId].GuideIconImg
  UE.UResourceLibrary.LoadObjectAsync(r0_3, "Texture2D\'/Game/UI/Texture/Dynamic/Image/Head/Mini/" .. r4_3 .. "." .. r4_3 .. "\'", {
    r0_3,
    r0_0.OnIconLoadFinish
  })
  local r5_3 = nil
  local r6_3 = nil
  local r7_3 = nil
  if r1_3.MeleeWeaponId ~= 0 then
    r5_3 = r1_3.MeleeWeaponId
    r6_3 = r1_3.MeleeWeaponLevel
    r7_3 = CommonConst.WeaponType.MeleeWeapon
  elseif r1_3.RangedWeaponId ~= 0 then
    r5_3 = r1_3.RangedWeaponId
    r6_3 = r1_3.RangedWeaponLevel
    r7_3 = CommonConst.WeaponType.RangedWeapon
  else
    DebugPrint(ErrorTag, LXYTag, "WBP_Team_PhantomItem_C::Init ,魅影的PhantonState上找不到武器")
    return 
  end
  r0_3.WBP_Team_PlayerInfo:Init(r5_3, r6_3, r7_3)
end
function r0_0.OnIconLoadFinish(r0_4, r1_4)
  -- line: [48, 52] id: 4
  if IsValid(r0_4) and r0_4.Img_Phaontom then
    r0_4.Img_Phaontom:SetBrushResourceObject(r1_4)
  end
end
return r0_0
-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Team\View\WBP_Team_PhantomItem_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})
function r0_0.Construct(r0_1)
  -- line: [16, 18] id: 1
  r0_1.Text_LevelName:SetText(GText("BATTLE_UI_BLOOD_LV"))
end
function r0_0.Destruct(r0_2)
  -- line: [21, 22] id: 2
end
function r0_0.Init(r0_3, r1_3)
  -- line: [24, 46] id: 3
  r0_3.Text_Level:SetText(r1_3.CharLevel)
  local r4_3 = TeamCommon.Normal .. DataMgr.BattleChar[r1_3.CharId].GuideIconImg
  UE.UResourceLibrary.LoadObjectAsync(r0_3, "Texture2D\'/Game/UI/Texture/Dynamic/Image/Head/Mini/" .. r4_3 .. "." .. r4_3 .. "\'", {
    r0_3,
    r0_0.OnIconLoadFinish
  })
  local r5_3 = nil
  local r6_3 = nil
  local r7_3 = nil
  if r1_3.MeleeWeaponId ~= 0 then
    r5_3 = r1_3.MeleeWeaponId
    r6_3 = r1_3.MeleeWeaponLevel
    r7_3 = CommonConst.WeaponType.MeleeWeapon
  elseif r1_3.RangedWeaponId ~= 0 then
    r5_3 = r1_3.RangedWeaponId
    r6_3 = r1_3.RangedWeaponLevel
    r7_3 = CommonConst.WeaponType.RangedWeapon
  else
    DebugPrint(ErrorTag, LXYTag, "WBP_Team_PhantomItem_C::Init ,魅影的PhantonState上找不到武器")
    return 
  end
  r0_3.WBP_Team_PlayerInfo:Init(r5_3, r6_3, r7_3)
end
function r0_0.OnIconLoadFinish(r0_4, r1_4)
  -- line: [48, 52] id: 4
  if IsValid(r0_4) and r0_4.Img_Phaontom then
    r0_4.Img_Phaontom:SetBrushResourceObject(r1_4)
  end
end
return r0_0
