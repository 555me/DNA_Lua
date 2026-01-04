-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Armory\ActorController\Armory_SceneActorComponent.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = {
  Init = function(r0_1)
    -- line: [4, 7] id: 1
    r0_1.SceneCoroutineMap = {}
    r0_1.SceneCoroutineArray = {}
  end,
}
local r1_0 = {}
local function r2_0(r0_2)
  -- line: [10, 13] id: 2
  r1_0[r0_2] = r1_0[r0_2] and 0
  r1_0[r0_2] = r1_0[r0_2] + 1
end
local function r3_0(r0_3)
  -- line: [14, 21] id: 3
  if r1_0[r0_3] then
    r1_0[r0_3] = r1_0[r0_3] + -1
    if r1_0[r0_3] <= 0 then
      r1_0[r0_3] = nil
    end
  end
end
local function r4_0(r0_4)
  -- line: [22, 24] id: 4
  return r1_0[r0_4] and r1_0[r0_4] > 0
end
local function r5_0(r0_5, r1_5)
  -- line: [26, 31] id: 5
  local r2_5 = r0_5.SceneCoroutineMap[r1_5]
  if r2_5 then
    table.remove(r0_5.SceneCoroutineArray, r2_5)
  end
end
local function r6_0(r0_6, r1_6, r2_6)
  -- line: [33, 37] id: 6
  r5_0(r0_6, r1_6)
  table.insert(r0_6.SceneCoroutineArray, r2_6)
  r0_6.SceneCoroutineMap[r1_6] = #r0_6.SceneCoroutineArray
end
local function r7_0(r0_7, r1_7)
  -- line: [39, 44] id: 7
  local r2_7 = r0_7.SceneCoroutineMap[r1_7]
  if r2_7 then
    return r0_7.SceneCoroutineArray[r2_7]
  end
end
local function r8_0()
  -- line: [46, 48] id: 8
  return next(r1_0) ~= nil
end
function r0_0.GetPreviewSceneTrans(r0_9)
  -- line: [51, 53] id: 9
  return r0_9.PreviewSceneTrans
end
function r0_0.TryLoadPreviewScene(r0_10)
  -- line: [55, 107] id: 10
  if r0_10.SmoothLoad then
    coroutine.yield()
  end
  if r8_0() then
    r0_10.EPreviewSceneType = r0_10.EPreviewSceneType and CommonConst.EPreviewSceneType.PreviewCommon
  end
  local r1_10 = r0_10.EPreviewSceneType and CommonConst.PreviewScenePaths[r0_10.EPreviewSceneType]
  if not r1_10 then
    return 
  end
  r0_10.PreviewSceneLocation = r0_10.PreviewSceneLocation and FVector(1000000, 1000000, 1000000)
  local r2_10 = r0_10.PreviewSceneLocation
  local r4_10 = UE4.UGameplayStatics.GetGameMode(r0_10.ViewUI):GetLevelLoader()
  local r5_10 = nil
  local r6_10 = nil
  local r7_10 = nil	-- notice: implicit variable refs by block#[18, 19]
  if r4_10 then
    r5_10 = FTransform()
    r5_10.Translation = r2_10
    r5_10.Rotation = FRotator(0, 0, 0):ToQuat()
    r7_10 = "PreviewLevel" .. r0_10.EPreviewSceneType
    if not r4_0(r7_10) then
      r0_10.IsPreviewSceneLoading = true
      r6_10 = r4_10:LoadPreviewLevel(r7_10, r1_10, function()
        -- line: [80, 84] id: 11
        r0_10.IsPreviewSceneLoading = false
        r0_10:SetPreviewLevelSkyBoxColor(r4_10, r7_10)
        r0_10:OnPreviewSceneLoaded()
      end, r2_10, FRotator(0, 0, 0))
      if r6_10 then
        r0_10.PreviewLevelName = r7_10
        r2_0(r7_10)
        r0_10.bPreviewSceneLoaded = true
      end
    else
      r6_10 = true
      r0_10.PreviewLevelName = r7_10
      r2_0(r7_10)
      r0_10.bPreviewSceneLoaded = true
      r0_10.ViewUI:AddTimer(0.01, function()
        -- line: [95, 98] id: 12
        r0_10:SetPreviewLevelSkyBoxColor(r4_10, r7_10)
        r0_10:OnPreviewSceneLoaded()
      end)
    end
    -- close: r7_10
  end
  r7_10 = r0_10.SmoothLoad
  if r7_10 then
    r7_10 = coroutine
    r7_10 = r7_10.yield
    r7_10()
  end
  if r6_10 then
    r0_10.PreviewSceneTrans = r5_10
  end
end
function r0_0.SetPreviewLevelSkyBoxColor(r0_13, r1_13, r2_13)
  -- line: [109, 135] id: 13
  if r0_13.SkyBoxColor and r0_13.EPreviewSceneType == CommonConst.EPreviewSceneType.BattlePass then
    local r3_13 = r1_13[r2_13]
    if not r3_13 then
      return 
    end
    local r4_13 = r3_13:GetLoadedLevel()
    if not r4_13 then
      return 
    end
    local r5_13 = r4_13.LevelScriptActor
    if not r5_13 then
      return 
    end
    local r7_13 = r5_13:GetUIShowBG().StaticMeshComponent
    local r8_13 = 0
    local r10_13 = r7_13:GetMaterials():Get(r8_13 + 1)
    if not r10_13:Cast(UMaterialInstanceDynamic:StaticClass()) then
      r10_13 = r7_13:CreateAndSetMaterialInstanceDynamic(r8_13)
    end
    r10_13:SetVectorParameterValue("BaseColor2", r0_13.SkyBoxColor.BaseColor2)
    r10_13:SetVectorParameterValue("StarColor", r0_13.SkyBoxColor.StarColor)
    r10_13:SetScalarParameterValue("ColorCurve", r0_13.SkyBoxColor.ColorCurve)
  end
end
function r0_0.UnloadPreviewScene(r0_14)
  -- line: [137, 153] id: 14
  if r0_14.bPreviewSceneLoaded then
    local r1_14 = "PreviewLevel" .. r0_14.EPreviewSceneType
    r0_14.bPreviewSceneLoaded = false
    r3_0(r1_14)
    if not r4_0(r1_14) then
      local r3_14 = UE4.UGameplayStatics.GetGameMode(r0_14.ViewUI):GetLevelLoader()
      if r3_14 then
        r3_14:UnloadPreviewLevel("PreviewLevel" .. r0_14.EPreviewSceneType)
        if IsValid(r0_14.ArmoryHelper) then
          r0_14.ArmoryHelper:OnPreviewSceneUnloaded()
        end
      end
    end
  end
end
function r0_0.WaitForPreviewSceneLoadFinished(r0_15)
  -- line: [155, 164] id: 15
  if r0_15.IsPreviewSceneLoading then
    if coroutine.isyieldable() then
      coroutine.yield()
    else
      return 
    end
  end
  return true
end
function r0_0.StartPreviewBGAnimation(r0_16, r1_16, r2_16)
  -- line: [166, 181] id: 16
  r0_16:DoSomethingWithScene("StartPreviewBGAnimation", function(...)
    -- line: [167, 179] id: 17
    if not r0_16:WaitForPreviewSceneLoadFinished() then
      return 
    end
    local r1_17 = nil
    if r1_16 then
      r1_17 = FVector(r1_16[1], r1_16[2], r1_16[3])
    else
      r1_17 = FVector(0, 0, 0)
    end
    r0_16.ArmoryHelper:StartPreviewBGAnimation(r1_17, r2_16)
  end)
end
function r0_0.DoSomethingWithScene(r0_18, r1_18, r2_18, ...)
  -- line: [183, 195] id: 18
  local r3_18 = r7_0(r0_18, r1_18)
  if r3_18 then
    local r4_18 = coroutine.status(r3_18)
    if r4_18 == "running" or r4_18 == "suspended" then
      coroutine.close(r3_18)
      r5_0(r0_18, r1_18)
    end
  end
  r3_18 = coroutine.create(r2_18)
  r6_0(r0_18, r1_18, r3_18)
  coroutine.resume(r3_18, ...)
end
function r0_0.DoDeferedSceneBehavior(r0_19)
  -- line: [197, 207] id: 19
  local r1_19 = {}
  for r6_19, r7_19 in ipairs(r0_19.SceneCoroutineArray) do
    table.insert(r1_19, r7_19)
  end
  -- close: r2_19
  r0_19.SceneCoroutineArray = {}
  r0_19.SceneCoroutineMap = {}
  for r6_19, r7_19 in ipairs(r1_19) do
    coroutine.resume(r7_19)
  end
  -- close: r2_19
end
function r0_0.IsSceneActorLoading(r0_20)
  -- line: [210, 212] id: 20
  return r0_20.IsPreviewSceneLoading
end
function r0_0.OnPreviewSceneLoaded(r0_21)
  -- line: [215, 219] id: 21
  r0_21.IsPreviewSceneLoading = false
  r0_21:DoDeferedSceneBehavior()
  r0_21:UpdateLighting()
end
function r0_0.UpdateLighting(r0_22)
  -- line: [221, 245] id: 22
  r0_22.bNotifyHelperUpdateLighting = false
  r0_22:DoSomethingWithScene("NotifyPreviewSceneUpdateLight", function(...)
    -- line: [223, 243] id: 23
    if not r0_22:WaitForPreviewSceneLoadFinished() then
      return 
    end
    UKismetSystemLibrary.ExecuteConsoleCommand(r0_22.ViewUI, "r.Shadow.ForceCacheUpdate 1", nil)
    r0_22:DoSomethingWithWeapon("CallBP_WaitForWeaponLoading", function()
      -- line: [229, 234] id: 24
      if r0_22.IsArmoryWeaponLoading then
        r0_22:GetWeaponActor()
      end
      r0_22:TryNotifyHelperUpdateLighting()
    end)
    r0_22:DoSomethingWithPlayer("CallBP_WaitForPlayerLoading", function()
      -- line: [236, 241] id: 25
      if r0_22.IsArmoryPlayerLoading then
        r0_22:GetPlayerActor()
      end
      r0_22:TryNotifyHelperUpdateLighting()
    end)
  end)
end
function r0_0.TryNotifyHelperUpdateLighting(r0_26)
  -- line: [247, 261] id: 26
  if r0_26.IsArmoryWeaponLoading or r0_26.IsArmoryPlayerLoading then
    return 
  end
  if r0_26.bNotifyHelperUpdateLighting then
    return 
  end
  if IsValid(r0_26.ArmoryHelper) and r0_26.ArmoryHelper:GetViewActor() then
    r0_26.bNotifyHelperUpdateLighting = true
    r0_26.ArmoryHelper:OnArmoryOpenOrClose(true)
    if r0_26.bPreviewSceneLoaded then
      r0_26.ArmoryHelper:OnPreviewSceneLoaded()
    end
  end
end
function r0_0.SwitchArmoryCamera(r0_27, r1_27)
  -- line: [263, 267] id: 27
  if r1_27 then
    r0_27.ArmoryHelper:OnArmoryOpenOrClose(true)
  end
end
function r0_0.UpdatePreviewSceneLight(r0_28, r1_28, r2_28)
  -- line: [269, 277] id: 28
  if r0_28.PreviewSceneLightSpecial == r1_28 and not r2_28 then
    return 
  end
  r0_28.PreviewSceneLightSpecial = r1_28
  if r0_28.ArmoryHelper and r0_28.ArmoryHelper.SetPreviewLightingState then
    r0_28.ArmoryHelper:SetPreviewLightingState(r1_28)
  end
end
function r0_0.Component_OnClosed(r0_29)
  -- line: [279, 281] id: 29
  r0_29.ArmoryHelper:OnArmoryOpenOrClose(false)
end
function r0_0.Component_OnDestruct(r0_30)
  -- line: [283, 293] id: 30
  r0_30:UnloadPreviewScene()
  local r1_30 = UE4.UGameplayStatics.GetPlayerCharacter(r0_30.ViewUI, 0)
  if r1_30 then
    r1_30.CharCameraComponent:SetComponentTickEnabled(true)
    if r0_30.EPreviewSceneType then
      UKismetSystemLibrary.ExecuteConsoleCommand(r1_30, "r.Shadow.ForceCacheUpdate 1", nil)
    end
  end
end
return r0_0
