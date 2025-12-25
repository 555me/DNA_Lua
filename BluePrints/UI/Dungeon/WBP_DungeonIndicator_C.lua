-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\Dungeon\WBP_DungeonIndicator_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.BP_UIState_C",
  "BluePrints.Common.TimerMgr"
})
local r1_0 = FVector(2147483647, 2147483647, 2147483647)
function r0_0.DebugPrint(r0_1, ...)
  -- line: [18, 20] id: 1
  DebugPrint("DungeonIndicator", ...)
end
function r0_0.AssignVector(r0_2, r1_2, r2_2)
  -- line: [22, 24] id: 2
  r2_2.Z = r1_2.Z
  r2_2.Y = r1_2.Y
  r2_2.X = r1_2.X
end
function r0_0.AssignVector2D(r0_3, r1_3, r2_3)
  -- line: [26, 28] id: 3
  r2_3.Y = r1_3.Y
  r2_3.X = r1_3.X
end
function r0_0.GetVisible(r0_4)
  -- line: [37, 39] id: 4
  return r0_4.TargetVisibilityOnDoor
end
function r0_0.GetRealDistance(r0_5)
  -- line: [48, 50] id: 5
  return r0_5.PointRealDistance
end
function r0_0.GetIconPathName(r0_6)
  -- line: [52, 57] id: 6
  if r0_6.ConfigData == nil then
    return ""
  end
  return r0_6.SceneManager:GetGuideGuideAnimByBPPath(r0_6.ConfigData.GuideIconAni, r0_6.ConfigData.GuideIconBPPath)
end
function r0_0.Construct(r0_7)
  -- line: [131, 135] id: 7
  r0_7.Super.Construct(r0_7)
  r0_7.MobileOvalSizeXRatio = 0.41
  r0_7.MobileOvalSizeYRatio = 0.42
end
function r0_0.Destruct(r0_8)
  -- line: [137, 140] id: 8
  r0_8.Super.Destruct(r0_8)
  r0_8:ClearEventPreDestruct()
end
function r0_0.AttachEventOnLoaded(r0_9)
  -- line: [142, 153] id: 9
  if r0_9.GuideType == "Phantom" then
    EventManager:AddEvent(EventID.OnTeamRecoveryStateChange, r0_9, r0_9.SetPhantomGuideStateByEvent)
  end
  if r0_9.GuideType == "Hostage" then
    EventManager:AddEvent(EventID.TriggerHostageVisibility, r0_9, r0_9.ChangeHostageVisibility)
    EventManager:AddEvent(EventID.TriggerHostageGuideLoop, r0_9, r0_9.TriggerDeadGuideDisplay)
  end
  EventManager:AddEvent(EventID.RecycleClassToCachePool, r0_9, r0_9.DisappearCacheIndicatorClass)
end
function r0_0.ClearEventPreDestruct(r0_10)
  -- line: [155, 162] id: 10
  EventManager:RemoveEvent(EventID.OnTeamRecoveryStateChange, r0_10)
  EventManager:RemoveEvent(EventID.RecycleClassToCachePool, r0_10)
  EventManager:RemoveEvent(EventID.TriggerHostageVisibility, r0_10)
  EventManager:RemoveEvent(EventID.TriggerHostageGuideLoop, r0_10)
end
function r0_0.OnLoaded(r0_11, ...)
  -- line: [164, 179] id: 11
  local r10_11 = nil	-- notice: implicit variable refs by block#[0]
  local r9_11 = nil	-- notice: implicit variable refs by block#[0]
  local r8_11 = nil	-- notice: implicit variable refs by block#[0]
  local r7_11 = nil	-- notice: implicit variable refs by block#[0]
  local r6_11 = nil	-- notice: implicit variable refs by block#[0]
  local r5_11 = nil	-- notice: implicit variable refs by block#[0]
  local r4_11 = nil	-- notice: implicit variable refs by block#[0]
  local r3_11 = nil	-- notice: implicit variable refs by block#[0]
  local r2_11 = nil	-- notice: implicit variable refs by block#[0]
  r0_11.Super.OnLoaded(r0_11, ...)
  local r1_11 = nil
  ... = ... -- error: untaken top expr
  r0_11.UseRealDistance = r10_11
  r0_11.RequireInAnimation = r9_11
  r0_11.RequireLookUpEntity = r8_11
  r0_11.RequireFollowingActor = r7_11
  r0_11.RequireDirectionArrow = r6_11
  r0_11.ConfigData = r5_11
  r1_11 = r4_11
  r0_11.TargetActor = r3_11
  r0_11.TargetEid = r2_11
  r2_11 = Battle(r0_11)
  r2_11 = r2_11:GetEntity(r0_11.TargetEid)
  r0_11.TargetActor = r2_11
  if r1_11 ~= nil then
    r0_11.TargetPointPos = r1_11
  end
  DebugPrint("HTY WBP_DungeonIndicatorUI_C:OnLoaded self.TargetPointPos", r0_11.TargetPointPos, "self.TargetEid", r0_11.TargetEid)
  r0_11:OnIndicatorLoaded()
end
function r0_0.Close(r0_12)
  -- line: [181, 190] id: 12
  if r0_12.IsFromPool then
    r0_12:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_12.IsActiveInPoor = false
    r0_12.GameState:AddIndicatorToPool(r0_12.GuideType, r0_12)
    r0_12.IndicatorStyle = EIndicatorStyle.Single
  else
    r0_12.Super.Close(r0_12)
  end
end
function r0_0.InitConfigData(r0_13)
  -- line: [210, 234] id: 13
  if IsValid(r0_13.TargetActor) then
    r0_13.GuideType = r0_13.TargetActor.UnitType
  end
  if r0_13.ConfigData ~= nil then
    local r1_13 = r0_13.SceneManager:GetGuideTypeByBPPath(r0_13.ConfigData.GuideIconAni, r0_13.ConfigData.GuideIconBPPath)
    if r1_13 ~= "" then
      r0_13.GuideType = r1_13
    end
  end
  if r0_13.ConfigData == nil then
    return 
  end
  r0_13:AttachEventOnLoaded()
  r0_13:OnInitConfig()
  local r3_13 = r0_13.SceneManager:GetGuideGuideAnimByBPPath(r0_13.ConfigData.GuideIconAni, r0_13.ConfigData.GuideIconBPPath) and ""
  local r4_13 = r0_13.ConfigData.GuideIconBPPath and ""
  r0_13:InitIndicatorByConfigData(r3_13, r4_13, r0_13.ConfigData.GuideText and "")
  r0_13:InitFlyToTarget()
end
function r0_0.RequestSnapShotInfo(r0_14)
  -- line: [236, 241] id: 14
  DebugPrint("RequestSnapShotInfo TargetEid", r0_14.TargetEid)
  UE4.UGameplayStatics.GetPlayerCharacter(UE4.UGameplayStatics.GetGameInstance(r0_14), 0).RPCComponent:RequestGuideInfo(r0_14.TargetEid)
end
function r0_0.SetGuideColor(r0_15, r1_15)
  -- line: [243, 251] id: 15
  local r2_15 = r0_15.WBP_GuidePoint_Base.GuideColorMap:Find(r1_15)
  if r2_15 ~= nil then
    r0_15.WBP_GuidePoint_Base.ArrowColor = r2_15.ArrowColor
    r0_15.WBP_GuidePoint_Base.GeometryColor = r2_15.GeometryColor
    r0_15.ImgMaterial:SetVectorParameterValue("ArrowColor", r2_15.ArrowColor)
    r0_15.ImgMaterial:SetVectorParameterValue("GeometryColor", r2_15.GeometryColor)
  end
end
function r0_0.OnInitConfig(r0_16)
  -- line: [253, 268] id: 16
  if r0_16["InitConfigDataWithType_" .. r0_16.GuideType] then
    r0_16["InitConfigDataWithType_" .. r0_16.GuideType](r0_16)
  end
  if r0_16.ConfigData.GuideIconAni == "/Game/UI/WBP/GuidePoint/WBP_GuidePoint_BlastRobot.WBP_GuidePoint_BlastRobot" and r0_16.Sustained and r0_16.TargetActor then
    r0_16:PlayAnimation(r0_16.Sustained, 0, 1, EUMGSequencePlayMode.Forward, (r0_16.Sustained:GetEndTime() - r0_16.Sustained:GetStartTime()) / r0_16.TargetActor.GuideDelayTime)
  end
  if r0_16.ConfigData.PlayerIndex and r0_16.ConfigData.PlayerIndex > 0 then
    r0_16.PlayerIndex = r0_16.ConfigData.PlayerIndex
  end
  r0_16:SetArrowWidgetColor()
end
function r0_0.InitFlyToTarget(r0_17)
  -- line: [270, 276] id: 17
  if r0_17.SpawnDown == false and (r0_17.GuideType == "Monster" or r0_17.GuideType == "Mechanism") then
    r0_17.FlyToTarget = false
  else
    r0_17.FlyToTarget = true
  end
end
function r0_0.SetArrowWidgetColor(r0_18)
  -- line: [278, 283] id: 18
  if r0_18.GuideType == "Monster" and r0_18.ConfigData.GuideIconBPPath == "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_TreasureHunter.T_Gp_TreasureHunter" then
    r0_18:SetArrowColor(r0_18.Color_Purple.SpecifiedColor)
  end
end
function r0_0.SetPhantomImgAvatar(r0_19)
  -- line: [285, 310] id: 19
  if r0_19.ConfigData.PlayerIndex and r0_19.ConfigData.PlayerIndex > 0 then
    UE4.UResourceLibrary.LoadObjectAsync(r0_19, r0_19.ConfigData.GuideIconBPPath, {
      r0_19,
      r0_0.OnPhantomImgIconLoadFinish
    })
    return 
  end
  if r0_19.ConfigData.BattleRoleId == nil or DataMgr.BattleChar[r0_19.ConfigData.BattleRoleId] == nil or DataMgr.BattleChar[r0_19.ConfigData.BattleRoleId].GuideIconImg == nil then
    return 
  end
  if r0_19.GuideType == "Phantom" and r0_19.Phantom ~= nil then
    if r0_19.CurPhantomGuideState == EPhantomGuideState.Alive then
      local r3_19 = "T_Normal_" .. DataMgr.BattleChar[r0_19.ConfigData.BattleRoleId].GuideIconImg
      UE4.UResourceLibrary.LoadObjectAsync(r0_19, "/Game/UI/Texture/Dynamic/Image/Head/Mini/" .. r3_19 .. "." .. r3_19, {
        r0_19,
        r0_0.OnPhantomImgIconLoadFinish
      })
    elseif r0_19.CurPhantomGuideState == EPhantomGuideState.Dead then
      local r3_19 = "T_Dead_" .. DataMgr.BattleChar[r0_19.ConfigData.BattleRoleId].GuideIconImg
      UE4.UResourceLibrary.LoadObjectAsync(r0_19, "/Game/UI/Texture/Dynamic/Image/Head/Mini/" .. r3_19 .. "." .. r3_19, {
        r0_19,
        r0_0.OnPhantomImgIconLoadFinish
      })
    end
  end
end
function r0_0.OnPhantomImgIconLoadFinish(r0_20, r1_20)
  -- line: [312, 316] id: 20
  if r1_20 then
    r0_20.Phantom.Img_Avatar:SetBrushResourceObject(r1_20)
  end
end
function r0_0.Reset(r0_21, r1_21, r2_21, r3_21, r4_21, r5_21, r6_21, r7_21, r8_21, r9_21, r10_21)
  -- line: [350, 400] id: 21
  if r4_21 ~= nil then
    r0_21.ConfigData = r4_21
  end
  r0_21.GameState = UE4.UGameplayStatics.GetGameState(r0_21)
  if not r0_21.GameState then
    DebugPrint("WBP_DungeonIndicatorUI_C Reset: GameState 不存在")
    r0_21:Close()
    return 
  end
  r0_21:Reset_Cpp(r1_21, r2_21, r3_21, r5_21, r6_21, r7_21, r8_21, r9_21, r10_21)
end
function r0_0.InitConfigDataWithType_Pet(r0_22)
  -- line: [402, 408] id: 22
  if r0_22.ConfigData and r0_22.ConfigData.GuideDuration and r0_22.ConfigData.GuideCloseRange then
    r0_22.ShowTime = r0_22.ConfigData.GuideDuration
    r0_22.CloseDistance = r0_22.ConfigData.GuideCloseRange
    r0_22.RegionImagePath = r0_22.ConfigData.GuideIconBPPath2
  end
end
function r0_0.InitConfigDataWithType_Mechanism(r0_23)
  -- line: [410, 415] id: 23
  if r0_23.ConfigData and r0_23.ConfigData.GuideDuration and r0_23.ConfigData.GuideCloseRange then
    r0_23.ShowTime = r0_23.ConfigData.GuideDuration
    r0_23.CloseDistance = r0_23.ConfigData.GuideCloseRange
  end
end
function r0_0.CheckNeedPlayFinishAnim(r0_24)
  -- line: [417, 419] id: 24
  -- notice: unreachable block#4
  local r1_24 = r0_24.ConfigData
  if r1_24 ~= nil then
    r1_24 = r0_24.ConfigData.GuideIconAni
    if r1_24 ~= nil then
      r1_24 = r0_24.RequireInAnimation
    end
  else
    r1_24 = false
  end
  return r1_24
end
function r0_0.GetStyleNodeName(r0_25)
  -- line: [421, 426] id: 25
  if not r0_25.ConfigData then
    return ""
  end
  return "Panel_" .. r0_25.SceneManager:GetGuideGuideAnimByBPPath(r0_25.ConfigData.GuideIconAni, r0_25.ConfigData.GuideIconBPPath)
end
function r0_0.ChangeStyle(r0_26, r1_26, r2_26)
  -- line: [471, 511] id: 26
  if r0_26.ConfigData == nil or r0_26.ConfigData.GuideIconAni == nil then
    r0_26:DebugPrint("ChangeStyle: 指引点未显示")
    return 
  end
  if r0_26.IndicatorStyle == EIndicatorStyle.Disappearing then
    return 
  end
  if r1_26 == EIndicatorStyle.Multiple and r0_26.IsNeedMultipleShow then
    r0_26.IndicatorStyle = EIndicatorStyle.Multiple
    if r0_26.Text_Quantity ~= nil and r0_26.Panel_Quantity ~= nil then
      r0_26.Text_Quantity:SetText(tostring(r2_26))
      r0_26.Panel_Quantity:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
    if r0_26.Panel_GuidePoint_More ~= nil then
      r0_26.Panel_GuidePoint_More:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    elseif r0_26.WBP_GuidePoint_Base ~= nil and r0_26.ImgMaterial ~= nil then
      r0_26.ImgMaterial:SetScalarParameterValue("HasMore", 1)
    end
  elseif r1_26 == EIndicatorStyle.Single then
    r0_26.IndicatorStyle = EIndicatorStyle.Single
    if r0_26.Panel_Quantity ~= nil then
      r0_26.Panel_Quantity:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    if r0_26.Panel_GuidePoint_More ~= nil then
      r0_26.Panel_GuidePoint_More:SetVisibility(UE4.ESlateVisibility.Collapsed)
    elseif r0_26.WBP_GuidePoint_Base ~= nil and r0_26.ImgMaterial ~= nil then
      r0_26.ImgMaterial:SetScalarParameterValue("HasMore", 0)
    end
  end
end
function r0_0.SetVisibilityNotOnDoor(r0_27, r1_27)
  -- line: [513, 523] id: 27
  r0_27.TargetVisibility = r1_27
  if r0_27.TargetVisibility == true and r0_27.TargetVisibilityOnDoor == true then
    r0_27.Main:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  if r0_27.TargetVisibility == false then
    r0_27.Main:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r0_0.Show(r0_28, r1_28)
  -- line: [525, 527] id: 28
  r0_0.Super.Show(r0_28, r1_28)
end
function r0_0.Hide(r0_29, r1_29)
  -- line: [529, 536] id: 29
  for r6_29, r7_29 in pairs(UIConst.DungeonIndicatorShowWidgets) do
    if r1_29 == "InUIConfigure" .. r7_29 then
      return 
    end
  end
  -- close: r2_29
  r0_0.Super.Hide(r0_29, r1_29)
end
function r0_0.PlayAppearAnim(r0_30)
  -- line: [560, 564] id: 30
  if r0_30.In ~= nil then
    r0_30:PlayAnimation(r0_30.In)
  end
end
function r0_0.RePlayAppearAnim(r0_31)
  -- line: [566, 572] id: 31
  if r0_31.Loop ~= nil then
    r0_31:PlayAnimation(r0_31.Loop, 0, 2)
  elseif r0_31.WBP_GuidePoint_Base then
    r0_31.WBP_GuidePoint_Base:PlayAnimation(r0_31.WBP_GuidePoint_Base.Loop, 0, 2)
  end
end
function r0_0.PlayLoopAnim(r0_32)
  -- line: [574, 580] id: 32
  if r0_32.Loop ~= nil then
    r0_32:PlayAnimation(r0_32.Loop, 0)
  elseif r0_32.WBP_GuidePoint_Base then
    r0_32.WBP_GuidePoint_Base:PlayAnimation(r0_32.WBP_GuidePoint_Base.Loop, 0)
  end
end
function r0_0.PlayConfigLoopAnim(r0_33)
  -- line: [582, 593] id: 33
  if r0_33.NeedPlayConfigLoop then
    r0_33:PlayLoopAnim()
  elseif r0_33.ConfigData and r0_33.ConfigData.GuideIconBPPath and r0_33.WBP_GuidePoint_Base then
    local r1_33 = r0_33.WBP_GuidePoint_Base.GuideColorMap:Find(r0_33.ConfigData.GuideIconBPPath)
    if r1_33 and r1_33.NeedPlayConfigLoop then
      r0_33:PlayLoopAnim()
    end
  end
end
function r0_0.GetCurSceneGuideEidEntityAsFSnapShotInfo(r0_34)
  -- line: [597, 604] id: 34
  local r1_34 = r0_34.SceneManager.CurSceneGuideEids[r0_34.TargetEid]
  if r1_34 ~= nil and r1_34.IsDataStruct == true then
    return r1_34.Entity
  else
    return FSnapShotInfo()
  end
end
function r0_0.GetCurSceneGuideEidEntityAsActor(r0_35)
  -- line: [606, 613] id: 35
  local r1_35 = r0_35.SceneManager.CurSceneGuideEids[r0_35.TargetEid]
  if r1_35 ~= nil and r1_35.IsDataStruct == false then
    return Battle(r0_35):GetEntity(r1_35.Entity)
  else
    return nil
  end
end
function r0_0.GetFromGText(r0_36, r1_36)
  -- line: [619, 621] id: 36
  return GText(r1_36) and ""
end
function r0_0.CaluCurGuideNeedShowPos(r0_37)
  -- line: [715, 717] id: 37
  return r0_37.SceneManager:CaluCurGuideNeedShowPos(r0_37.TargetEid, r0_37.DoorPosition, r0_37.DoorDirection)
end
function r0_0.SetMechanismRelativePosition(r0_38)
  -- line: [719, 728] id: 38
  if r0_38.TargetActor and r0_38.TargetActor.GetGuidePos then
    local r1_38 = r0_38.TargetActor:GetGuidePos()
    if r1_38 then
      r0_38.MechanismLoc.X = r1_38.X
      r0_38.MechanismLoc.Y = r1_38.Y
      r0_38.MechanismLoc.Z = r1_38.Z
    end
  end
end
function r0_0.SetArrowColor(r0_39, r1_39)
  -- line: [730, 736] id: 39
  if r0_39.Common_Arrows then
    r0_39.Common_Arrows:SetColorAndOpacity(r1_39)
  else
    r0_39.ImgMaterial:SetVectorParameterValue("ArrowColor", r1_39)
  end
end
function r0_0.InitABCTextInSabotage(r0_40, r1_40)
  -- line: [925, 953] id: 40
  if r1_40 ~= "Destroy" then
    return 
  end
  if r0_40.TargetEid == nil then
    r0_40:DebugPrint("InitABCTextInSabotage: TargetEid 不存在")
    return 
  end
  local r2_40 = UE4.UGameplayStatics.GetGameInstance(r0_40)
  if r2_40 == nil then
    r0_40:DebugPrint("InitABCTextInSabotage: GameInstance 不存在")
    return 
  end
  if r2_40:GetSceneManager() == nil then
    r0_40:DebugPrint("InitABCTextInSabotage: SceneManager 不存在")
    return 
  end
  local r4_40 = UE4.UGameplayStatics.GetPlayerCharacter(r0_40, 0)
  if r4_40 ~= nil then
    r4_40.RPCComponent:RequestSabotageGuideInfo_Client(r0_40, r0_40.SetABCTextInSabotage_Callback)
  end
end
function r0_0.SetABCTextInSabotage_Callback(r0_41, r1_41, r2_41)
  -- line: [956, 979] id: 41
  local r3_41 = 0
  for r8_41, r9_41 in pairs(r1_41) do
    if r9_41 == r0_41.TargetEid then
      r3_41 = r8_41
      break
    end
  end
  -- close: r4_41
  if r3_41 == 0 then
    return 
  end
  local r4_41 = string.char(string.byte("A") + r3_41 + -1)
  DebugPrint("WBP_DungeonIndicatorUI_C ABCLetter", r4_41, "Eid", r0_41.TargetEid, "index", r3_41)
  local r5_41 = GWorld.GameInstance:GetSceneManager()
  if r5_41 == nil then
    r0_41:DebugPrint("InitABCTextInSabotage: SceneManager 不存在")
    return 
  end
  UE4.UResourceLibrary.LoadObjectAsync(r0_41, r5_41:GetSabotageABCIconPath(r4_41), {
    r0_41,
    r0_0.OnGuideIconLoadFinish
  })
end
function r0_0.GetTextLetter(r0_42)
  -- line: [981, 988] id: 42
  if r0_42.Text_Letter == nil then
    return nil
  end
  return r0_42.Text_Letter:GetText()
end
function r0_0.GetExcavationEfficiency(r0_43)
  -- line: [992, 998] id: 43
  local r1_43 = Battle(r0_43):GetEntity(r0_43.TargetEid)
  if r1_43 ~= nil then
    return r1_43.Efficiency
  end
  return 0
end
function r0_0.GetExcavationABCLetter(r0_44)
  -- line: [1000, 1007] id: 44
  local r1_44 = Battle(r0_44):GetEntity(r0_44.TargetEid)
  if r1_44 ~= nil then
    return string.char(string.byte("A") + (r1_44.GuideOrderIndex + -1) % 6)
  end
  return " "
end
function r0_0.TriggerDeadGuideDisplay(r0_45, r1_45)
  -- line: [1138, 1164] id: 45
  if r0_45.WBP_GuidePoint_Base and r0_45.WBP_GuidePoint_Base.Loop and r1_45 then
    r0_45.WBP_GuidePoint_Base:PlayAnimation(r0_45.WBP_GuidePoint_Base.Loop, 0, 0)
    UE4.UResourceLibrary.LoadObjectAsync(r0_45, "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Rescue_HostageB.T_Gp_Rescue_HostageB", {
      r0_45,
      r0_0.OnGuideIconLoadFinish
    })
    EventManager:FireEvent(EventID.OnHostageDeadUpdateMiniMap, true)
    EventManager:FireEvent(EventID.TriggerHostageBattleMapChangeStyle, true)
  elseif not r1_45 then
    r0_45:StopAllAnimations()
    if r0_45.WBP_GuidePoint_Base then
      r0_45.WBP_GuidePoint_Base:StopAllAnimations()
    end
    UE4.UResourceLibrary.LoadObjectAsync(r0_45, "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Rescue_HostageA.T_Gp_Rescue_HostageA", {
      r0_45,
      r0_0.OnGuideIconLoadFinish
    })
    EventManager:FireEvent(EventID.OnHostageDeadUpdateMiniMap, false)
    EventManager:FireEvent(EventID.TriggerHostageBattleMapChangeStyle, false)
  end
  if r1_45 then
    r0_45:SetArrowColor(r0_45.Color_Red.SpecifiedColor)
  else
    r0_45:SetArrowColor(r0_45.Color_Blue.SpecifiedColor)
  end
end
function r0_0.OnGuideIconLoadFinish(r0_46, r1_46)
  -- line: [1166, 1175] id: 46
  if r1_46 ~= nil then
    if r0_46.Img_GuidePoint_Icon then
      r0_46.Img_GuidePoint_Icon:SetBrushResourceObject(r1_46)
    else
      r0_46.ImgMaterial:SetTextureParameterValue("GuideIcon", r1_46)
    end
  end
  r0_46.IsIconLoaded = true
end
function r0_0.ChangeHostageVisibility(r0_47, r1_47)
  -- line: [1177, 1183] id: 47
  if r1_47 then
    r0_47:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    r0_47:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r0_0.SetPhantomRecoverCountChangeFlagByEvent(r0_48)
  -- line: [1185, 1187] id: 48
  r0_48.IsChangeRecoverCount = true
end
function r0_0.SetPhantomGuideStateByEvent(r0_49, r1_49, r2_49, r3_49)
  -- line: [1189, 1211] id: 49
  if r0_49.TargetEid ~= r1_49 then
    return 
  end
  local r4_49 = r0_49.CurPhantomGuideState
  if r2_49 == UE4.ETeamRecoveryState.Dying then
    r0_49.CurPhantomGuideState = EPhantomGuideState.Dead
  elseif r2_49 == UE4.ETeamRecoveryState.IsWaitingRecover then
    r0_49.CurPhantomGuideState = EPhantomGuideState.Resurrecting
  elseif r2_49 == UE4.ETeamRecoveryState.Alive then
    r0_49.CurPhantomGuideState = EPhantomGuideState.Alive
  end
  if r2_49 == UE4.ETeamRecoveryState.Alive and r3_49 == UE4.ETeamRecoveryState.IsWaitingRecover then
    r0_49:SetPhantomRecoverCountChangeFlagByEvent()
  end
  r0_49.IsNeedChangeState = true
end
function r0_0.DisappearCacheIndicatorClass(r0_50, r1_50)
  -- line: [1213, 1218] id: 50
  if r0_50.TargetEid == r1_50 and r0_50.IsActiveInPoor then
    r0_50:Disappear()
    r0_50.IsActiveInPoor = false
  end
end
function r0_0.UpdatePhantomCanRecoveryCount(r0_51)
  -- line: [1220, 1228] id: 51
  if r0_51.TargetActor:IsDead() then
    local r1_51 = r0_51:GetCanRecoveryCount()
    if r1_51 > 0 and not r0_51.TargetActor:IsInRecovering() then
      r0_51.Panel_RemainTimes:SetRenderOpacity(1)
      r0_51.Text_Times:SetText(r1_51)
    end
  end
end
function r0_0.UpdateRecoveryBarCircle(r0_52)
  -- line: [1230, 1233] id: 52
  r0_52.Text_Percent:SetText(math.floor(r0_52.TargetActor:GetRecoveryPercent()))
  r0_52.Phantom.Bar_Circle:GetDynamicMaterial():SetScalarParameterValue("Percent", r0_52.TargetActor:GetRecoveryPercent() / 100)
end
function r0_0.GetCanPhantomRecoveryCount(r0_53)
  -- line: [1235, 1241] id: 53
  if r0_53.TargetActor:IsPhantom() then
    return r0_53.TargetActor:GetRecoveryMaxCount() - r0_53.TargetActor:GetRecoveryCount()
  end
  return 0
end
function r0_0.UpdateAlertUI(r0_54, r1_54)
  -- line: [1244, 1293] id: 54
  if r0_54.AlertValue > 0 and r0_54.ReadyShowAlert then
    r0_54.Guide_Node:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    r0_54.IsMax = false
    r0_54.ReadyShowAlert = false
    EMUIAnimationSubsystem:EMPlayAnimation(r0_54, r0_54.In)
    r0_54:SetArrowColor(r0_54.Color_White.SpecifiedColor)
    if r0_54.MaxAlertValue <= r0_54.AlertValue and not r0_54.IsMax then
      r0_54.IsMax = true
      EMUIAnimationSubsystem:EMPlayAnimation(r0_54, r0_54.Max)
      r0_54:SetArrowColor(r0_54.Color_Red.SpecifiedColor)
    end
  elseif r0_54.MaxAlertValue <= r0_54.AlertValue and not r0_54.IsMax then
    r0_54.IsMax = true
    EMUIAnimationSubsystem:EMPlayAnimation(r0_54, r0_54.Max)
    r0_54:SetArrowColor(r0_54.Color_Red.SpecifiedColor)
  elseif r0_54.AlertValue <= 0 and not r0_54.ReadyShowAlert then
    EMUIAnimationSubsystem:EMPlayAnimation(r0_54, r0_54.Out)
    r0_54.ReadyShowAlert = true
    r0_54.FirstDown = false
    r0_54.IsMax = false
    r0_54:StopAlertAudio()
  elseif r0_54.AlertValue > 0 and not r0_54.ReadyShowAlert and r0_54.LastAlertValue < r0_54.AlertValue and r0_54.CanUpAnim and r0_54.FirstDown then
    r0_54.IsMax = false
    EMUIAnimationSubsystem:EMPlayAnimation(r0_54, r0_54.Rising)
  elseif r0_54.AlertValue >= 0 and not r0_54.ReadyShowAlert and r0_54.AlertValue <= r0_54.LastAlertValue and r0_54.CanDownAim then
    r0_54.IsMax = false
    EMUIAnimationSubsystem:EMStopAnimation(r0_54, r0_54.Max)
    EMUIAnimationSubsystem:EMPlayAnimation(r0_54, r0_54.Rising, EUMGSequencePlayMode.Reverse)
    EMUIAnimationSubsystem:EMPlayAnimation(r0_54, r0_54.Normal)
  end
  if r0_54.AlertValue > 0 and r0_54.AlertValue <= r0_54.MaxAlertValue and r0_54.LastAlertValue <= r0_54.AlertValue then
    r0_54.CanUpAnim = false
    r0_54.CanDownAim = true
    r0_54:CalChange(r1_54)
  elseif r0_54.AlertValue >= 0 and r0_54.AlertValue <= r0_54.MaxAlertValue and r0_54.AlertValue <= r0_54.LastAlertValue then
    r0_54.CanUpAnim = true
    r0_54.CanDownAim = false
    r0_54.FirstDown = true
    r0_54:CalChange(r1_54)
  end
end
function r0_0.CalChange(r0_55, r1_55)
  -- line: [1295, 1305] id: 55
  local r2_55 = r1_55 / 0.02
  if r2_55 <= 0 then
    r2_55 = 1
  end
  local r3_55 = (r0_55.AlertValue - r0_55.LastAlertValue) / r2_55
  r2_55 = math.floor(r2_55)
  r0_55.Bar:SetPercent(r0_55.LastAlertValue / r0_55.MaxAlertValue)
  r0_55:AddTimer(0.02, r0_55.ChangeBar, true, -1, "ChangeBar", nil, r2_55, r3_55)
end
function r0_0.ChangeBar(r0_56, r1_56, r2_56)
  -- line: [1307, 1315] id: 56
  r0_56.TimerTimes = r0_56.TimerTimes + 1
  r0_56.Bar:SetPercent(r0_56.Bar.Percent + r2_56 / r0_56.MaxAlertValue)
  if r1_56 <= r0_56.TimerTimes then
    r0_56.TimerTimes = 0
    r0_56:RemoveTimer("ChangeBar")
  end
end
return r0_0
