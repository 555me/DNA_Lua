-- filename: @E:/Pack/Branch/OBT10_Geili\Content/Script/BluePrints\UI\WBP\Armory\ActorController\Armory_WeaponActorComponent.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("BluePrints.Client.BattleDumpUtils")
local r1_0 = {
  Init = function(r0_1)
    -- line: [6, 9] id: 1
    r0_1.WeaponCoroutineMap = {}
    r0_1.WeaponCoroutineArray = {}
  end,
}
local function r2_0(r0_2)
  -- line: [11, 13] id: 2
  return UE4.UKismetMathLibrary.MakeTransform(r0_2.UncalculatedTrans.Translation, r0_2.UncalculatedTrans.Rotation:ToRotator(), FVector(1, 1, 1))
end
local function r3_0(r0_3)
  -- line: [15, 28] id: 3
  local r1_3 = r2_0(r0_3)
  if r0_3.bPreviewSceneLoaded then
    r1_3.Translation.Z = r1_3.Translation.Z + 90
  end
  local r2_3 = FRotator(0, 0, 0)
  r0_3.ArmoryHelper:SetOriginalRotation(r2_3)
  r1_3.Rotation = r2_3:ToQuat()
  r0_3.ArmoryHelper.OriginalRootTrans = r1_3
  local r3_3 = r0_3.ArmoryHelper:CreateOrGetWeaponHelper()
  r3_3:K2_SetActorTransform(r1_3, false, HitResult, false)
  r0_3.ArmoryHelper:SetViewActor(r3_3)
end
local function r4_0(r0_4, r1_4)
  -- line: [30, 35] id: 4
  local r2_4 = r0_4.WeaponCoroutineMap[r1_4]
  if r2_4 then
    table.remove(r0_4.WeaponCoroutineArray, r2_4)
  end
end
local function r5_0(r0_5, r1_5, r2_5)
  -- line: [37, 41] id: 5
  r4_0(r0_5, r1_5)
  table.insert(r0_5.WeaponCoroutineArray, r2_5)
  r0_5.WeaponCoroutineMap[r1_5] = #r0_5.WeaponCoroutineArray
end
local function r6_0(r0_6, r1_6)
  -- line: [43, 48] id: 6
  local r2_6 = r0_6.WeaponCoroutineMap[r1_6]
  if r2_6 then
    return r0_6.WeaponCoroutineArray[r2_6]
  end
end
function r1_0.DoSomethingWithWeapon(r0_7, r1_7, r2_7, ...)
  -- line: [50, 62] id: 7
  local r3_7 = r6_0(r0_7, r1_7)
  if r3_7 then
    local r4_7 = coroutine.status(r3_7)
    if r4_7 == "running" or r4_7 == "suspended" then
      coroutine.close(r3_7)
      r4_0(r0_7, r1_7)
    end
  end
  r3_7 = coroutine.create(r2_7)
  r5_0(r0_7, r1_7, r3_7)
  coroutine.resume(r3_7, ...)
end
function r1_0.DoDeferedWeaponBehavior(r0_8)
  -- line: [64, 74] id: 8
  local r1_8 = {}
  for r6_8, r7_8 in ipairs(r0_8.WeaponCoroutineArray) do
    table.insert(r1_8, r7_8)
  end
  -- close: r2_8
  r0_8.WeaponCoroutineArray = {}
  r0_8.WeaponCoroutineMap = {}
  for r6_8, r7_8 in ipairs(r1_8) do
    coroutine.resume(r7_8)
  end
  -- close: r2_8
end
function r1_0.IsWeaponActorLoading(r0_9)
  -- line: [77, 79] id: 9
  return r0_9.IsArmoryWeaponLoading
end
function r1_0.ChangeWeaponModel(r0_10, r1_10, r2_10)
  -- line: [82, 104] id: 10
  r0_10:ResetActorRotation()
  if not r2_10 then
    r2_10 = r0_10.ArmoryPlayer
  end
  if r0_10.CurrentWeaponInfo == r1_10 and r2_10 then
    local r3_10 = r1_10:HasTag("Melee")
    if r3_10 then
      r3_10 = "Melee" and "Ranged"
    else
      goto label_18	-- block#6 is visited secondly
    end
    if r2_10[r3_10 .. "Weapon"] then
      return 
    end
  end
  local r3_10 = r0_10.CurrentWeaponInfo
  if r0_10.IsPreviewMode and (not r2_10 or r2_10.bHidden) then
    if r3_10 == r1_10 then
      return 
    end
    return r0_10:ChangeSingleWeapon(r1_10)
  end
  r0_10.bPlaySameMontage = true
  return r0_10:ChangePlayerWeapon(r1_10, r2_10)
end
function r1_0.PlayWeaponAppearFX(r0_11)
  -- line: [106, 114] id: 11
  r0_11:DoSomethingWithWeapon("PlayWeaponAppearFX", function(...)
    -- line: [107, 112] id: 12
    local r0_12 = r0_11:GetWeaponActor()
    if r0_12 then
      r0_11:PlayAppearFX(r0_12.FXComponent)
    end
  end)
end
function r1_0.ChangePlayerWeapon(r0_13, r1_13, r2_13)
  -- line: [116, 141] id: 13
  r0_13.CurrentWeaponInfo = r1_13
  r0_13.CurrentWeaponAppearanceInfo = r1_13:DumpAppearanceInfo()
  if not r2_13 then
    r2_13 = r0_13.ArmoryPlayer
  end
  local r3_13 = r1_13:HasTag("Melee")
  if r3_13 then
    r3_13 = "Melee" and "Ranged"
  else
    goto label_15	-- block#4 is visited secondly
  end
  local r4_13 = r2_13[r3_13 .. "Weapon"]
  if r4_13 then
    r2_13.Weapons:Remove(r4_13.WeaponId)
    r4_13:Destroy()
  end
  r2_13[r3_13 .. "Weapon"] = nil
  local r5_13 = r0_13:GetAvatar()
  if not r5_13 then
    return 
  end
  local r7_13 = r2_13:AddWeapon(r1_13.WeaponId, AvatarUtils:GetWeaponBattleInfo(r5_13, r1_13) and r6_13[r3_13 .. "Weapon"])
  r7_13:InitWeaponAppearance(r1_13:DumpAppearanceInfo())
  r2_13.UsingWeapon = r7_13
  r7_13:SetWeaponTypeChanged(true)
  r7_13:SetActorHiddenInGame(true)
  r7_13:OnWeaponReady()
  return r7_13
end
function r1_0.AddPlayerUltraWeapons(r0_14, r1_14)
  -- line: [143, 156] id: 14
  local r2_14 = r0_14.CurrentCharFromAvatar and r0_14:GetAvatar()
  for r8_14, r9_14 in ipairs(r0_0:GetDefaultUltraWeaponInfo(r2_14, r0_14.CurrentCharInfo)) do
    local r10_14 = AvatarUtils:GetWeaponBattleInfo(r2_14, r9_14.UltraWeapon)
    local r11_14 = nil
    if r10_14.MeleeWeapon.WeaponId then
      r11_14 = r10_14.MeleeWeapon
    elseif r10_14.RangedWeapon.WeaponId then
      r11_14 = r10_14.RangedWeapon
    end
    r1_14:AddWeapon(r11_14.WeaponId, r11_14, r8_14)
  end
  -- close: r4_14
end
function r1_0.ChangePlayerWeaponByType(r0_15, r1_15, r2_15)
  -- line: [158, 184] id: 15
  if not r2_15 then
    r2_15 = r0_15.ArmoryPlayer
  end
  r2_15:ChangeUsingWeaponByType(nil)
  if r1_15 == nil then
    return 
  end
  local r3_15 = r2_15:GetWeaponByWeaponTag(r0_15.LastMontageAndCameraTag, 1)
  local r4_15 = r0_15:GetAvatar()
  if not r4_15 then
    return 
  end
  if r3_15 == nil then
    local r5_15 = nil
    if r1_15 == "Melee" then
      r5_15 = r4_15.Weapons[r4_15.MeleeWeapon]
    elseif r1_15 == "Ranged" then
      r5_15 = r4_15.Weapons[r4_15.RangedWeapon]
    else
      return 
    end
    r0_15:ChangePlayerWeapon(r5_15, r2_15)
  end
  r2_15:ChangeUsingWeaponByType(r0_15.LastMontageAndCameraTag)
  if r2_15.UsingWeapon then
    r2_15.UsingWeapon:SetWeaponTypeChanged(true)
  end
end
function r1_0.ChangeSingleWeapon(r0_16, r1_16, r2_16)
  -- line: [187, 224] id: 16
  r0_16.ViewActorType = r0_16.ViewActorTypes.SingleWeapon
  r0_16.CurrentWeaponInfo = r1_16
  r0_16.CurrentWeaponAppearanceInfo = r1_16:DumpAppearanceInfo()
  r0_16:BeforeViewActorChanged()
  r0_16:SetSingleWeaponCamera(r1_16)
  if r0_16.IsArmoryWeaponLoading then
    r0_16.NextWeaponDataToLoad = r1_16
    return 
  end
  r0_16.NextWeaponDataToLoad = nil
  r0_16.IsArmoryWeaponLoading = true
  local r3_16 = nil
  if IsValid(r0_16.ArmoryWeapon) then
    r3_16 = r0_16.ArmoryWeapon.FXComponent
  end
  if not r3_16 then
    r3_16 = r0_16.ArmoryPlayer and r0_16.ArmoryPlayer.FXComponent
  end
  local r4_16 = UIManager(r0_16.ViewUI)
  local r7_16 = r0_16
  local r8_16 = {
    WeaponId = r1_16.WeaponId,
    AppearanceInfo = r1_16:DumpAppearanceInfo(),
  }
  r4_16:CreateShowWeapon(r7_16, r8_16, function(r0_17)
    -- line: [210, 213] id: 17
    r0_16:OnArmoryWeaponLoaded(r0_17)
    r0_16:SetWeaponActorEnhanceLevel(r1_16.EnhanceLevel)
  end)
  if r2_16 then
    return true
  end
  r0_16:HideWeaponActor("WeaponDisappearFX", true)
  r0_16.DelayFrame = 30
  r0_16:PlayDisappearFX(r3_16, function()
    -- line: [219, 222] id: 18
    r0_16:HideWeaponActor("WeaponDisappearFX", false)
    r0_16:PlayWeaponAppearFX()
  end)
  return true
end
function r1_0.GetSingleWeaponTag(r0_19, r1_19)
  -- line: [226, 244] id: 19
  local r2_19 = r0_19.ArmoryHelper:CreateOrGetWeaponHelper()
  if not r2_19 then
    return 
  end
  if not r1_19 then
    r1_19 = r0_19.CurrentWeaponInfo
  end
  if r0_19.SingleWeaponTagFrom == r1_19 then
    return r0_19.SingleWeaponTag
  end
  local r3_19 = r1_19:GetTags()
  local r4_19 = r2_19.CamDistance:ToTable()
  for r9_19, r10_19 in pairs(r3_19) do
    if r4_19[r9_19] then
      r0_19.SingleWeaponTag = r9_19
      r0_19.SingleWeaponTagFrom = r1_19
      return r0_19.SingleWeaponTag
    end
  end
  -- close: r5_19
end
function r1_0.SetSingleWeaponCameraStartInfo(r0_20, r1_20)
  -- line: [246, 256] id: 20
  r3_0(r0_20)
  local r4_20 = r0_20.ArmoryHelper:CreateOrGetWeaponHelper().CamDistance:ToTable()[r0_20:GetSingleWeaponTag(r1_20)] and 0
  local r5_20 = r0_20.ArmoryHelper:K2_GetActorLocation()
  local r6_20 = UKismetMathLibrary.FindLookAtRotation(r5_20 + r2_20:GetActorRightVector(), r5_20)
  r0_20.ArmoryHelper:SetCameraStartInfo(r5_20 + UKismetMathLibrary.GetForwardVector(r6_20) * -r4_20, r6_20)
end
function r1_0.SetSingleWeaponCamera(r0_21, r1_21)
  -- line: [258, 283] id: 21
  r3_0(r0_21)
  local r2_21 = r0_21.ArmoryHelper:CreateOrGetWeaponHelper()
  local r3_21 = r0_21:GetSingleWeaponTag(r1_21)
  local r4_21 = r2_21.CamDistance:ToTable()[r3_21] and 0
  local r5_21 = r0_21.ArmoryHelper:K2_GetActorLocation()
  local r6_21 = UKismetMathLibrary.FindLookAtRotation(r5_21 + r2_21:GetActorRightVector(), r5_21)
  local r7_21 = UKismetMathLibrary.GetForwardVector(r6_21) * -r4_21
  if r0_21.ExCameraOffset then
    r7_21 = r7_21 + r0_21.ExCameraOffset
  end
  r0_21.ArmoryHelper:TransformCamera(r7_21, r6_21, 0.5)
  r0_21.ArmoryHelper:StartFOVAnim(90, 0.5, 14)
  local r8_21 = r2_21.CamDistance_Min:ToTable()[r3_21] and 0
  local r9_21 = UKismetMathLibrary.GetForwardVector(r6_21) * -r8_21
  local r10_21 = r2_21.CamDistance_Max:ToTable()[r3_21] and 0
  local r11_21 = UKismetMathLibrary.GetForwardVector(r6_21) * -r10_21
  if r0_21.ExCameraOffset then
    r11_21 = r11_21 + r0_21.ExCameraOffset
    r0_21.ExCameraOffset = nil
  end
  r0_21.ArmoryHelper:SetCameraScrollRange(r9_21, r11_21, 0.5)
  if r8_21 ~= 0 or r10_21 ~= 0 then
    r0_21.ArmoryHelper.EnableCameraScrolling = true
  end
end
function r1_0.OnArmoryWeaponLoaded(r0_22, r1_22)
  -- line: [286, 306] id: 22
  r0_22.IsArmoryWeaponLoading = false
  if r0_22.bDestructed then
    DebugPrint("Error: 预览武器加载完成回调错误，可能是ActorController没有正确销毁")
    return 
  end
  if r0_22.NextWeaponDataToLoad then
    r0_22:ChangeSingleWeapon(r0_22.NextWeaponDataToLoad)
    return 
  end
  r0_22.ArmoryWeapon = r1_22
  CommonUtils:SetActorTickableWhenPaused(r1_22, true)
  r0_22:SetAccessoriesTickableWhenPaused(r1_22.Accessories)
  r0_22:ResetActorRotation()
  r0_22.ArmoryHelper:SetWeapon(r0_22.ArmoryWeapon)
  r0_22.ArmoryHelper:SetViewActor(r0_22.ArmoryWeapon)
  r0_22:DoDeferedWeaponBehavior()
  if r0_22.ViewActorType ~= r0_22.ViewActorTypes.SingleWeapon then
    r0_22:HideWeaponActor(r0_22.UIName, true)
  end
end
function r1_0.GetWeaponActor(r0_23)
  -- line: [310, 329] id: 23
  if r0_23.IsArmoryWeaponLoading then
    if coroutine.isyieldable() then
      coroutine.yield()
    else
      return 
    end
  end
  if IsValid(r0_23.ArmoryWeapon) then
    return r0_23.ArmoryWeapon
  end
  if not r0_23.ArmoryPlayer or not r0_23.CurrentWeaponInfo then
    return 
  end
  if r0_23.CurrentWeaponInfo:HasTag("Melee") then
    return r0_23.ArmoryPlayer.MeleeWeapon
  else
    return r0_23.ArmoryPlayer.RangedWeapon
  end
end
function r1_0.GetWeaponActorAsync(r0_24, r1_24, r2_24)
  -- line: [331, 339] id: 24
  r0_24:DoSomethingWithWeapon("GetWeaponActorAsync", function(r0_25, r1_25)
    -- line: [332, 337] id: 25
    local r2_25 = r0_24:GetWeaponActor()
    if r0_25 then
      r0_25(r1_25, r2_25)
    end
  end, r1_24, r2_24)
end
function r1_0.GetSingleWeaponActor(r0_26)
  -- line: [342, 353] id: 26
  if r0_26.IsArmoryWeaponLoading then
    if coroutine.isyieldable() then
      coroutine.yield()
    else
      return 
    end
  end
  if IsValid(r0_26.ArmoryWeapon) then
    return r0_26.ArmoryWeapon
  end
end
function r1_0.GetPlayerWeaponActor(r0_27)
  -- line: [356, 372] id: 27
  if r0_27.IsArmoryWeaponLoading then
    if coroutine.isyieldable() then
      coroutine.yield()
    else
      return 
    end
  end
  if not r0_27.ArmoryPlayer or not r0_27.CurrentWeaponInfo then
    return 
  end
  if r0_27.CurrentWeaponInfo:HasTag("Melee") then
    return r0_27.ArmoryPlayer.MeleeWeapon
  else
    return r0_27.ArmoryPlayer.RangedWeapon
  end
end
function r1_0.HideWeaponActor(r0_28, r1_28, r2_28)
  -- line: [374, 382] id: 28
  r0_28:DoSomethingWithWeapon("HideWeaponActor", function(...)
    -- line: [375, 380] id: 29
    local r0_29 = r0_28:GetWeaponActor()
    if r0_29 then
      r0_29:SetActorHideTag(r1_28, r2_28)
    end
  end)
end
function r1_0.BeforeViewActorChanged(r0_30)
  -- line: [384, 388] id: 30
  if r0_30.ViewActorType == r0_30.ViewActorTypes.SingleWeapon then
    r0_30:HideWeaponActor(r0_30.UIName, true)
  end
end
function r1_0.AfterViewActorChanged(r0_31)
  -- line: [390, 392] id: 31
  r0_31:HideWeaponActor(r0_31.UIName, false)
end
function r1_0.WeaponLvUpOrBreakUp(r0_32)
  -- line: [394, 397] id: 32
  r0_32.ArmoryPlayer.UsingWeapon.FXComponent:PlayEffectByIDParams(304, {
    bTickEvenWhenPaused = true,
    NotAttached = true,
  })
end
function r1_0.Component_OnDestruct(r0_33)
  -- line: [399, 406] id: 33
  r0_33.CurrentWeaponInfo = nil
  local r1_33 = UIManager(r0_33.ViewUI)
  if IsValid(r0_33.ArmoryWeapon) then
    r0_33.ArmoryWeapon:SetActorHideTag(r0_33.UIName, false)
  end
  r1_33:DestroyShowWeapon(r0_33)
end
return r1_0
