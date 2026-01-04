-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Client\Entities\CommonComponents\ResourceUseComponent.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("BluePrints.Client.CustomTypes.SimpleRewardBox")
return {
  EnterWorld = function(r0_1)
    -- line: [4, 6] id: 1
    r0_1.logger.debug("ZJT_ EnterWorld ResourceUseComponent ")
  end,
  UseItemInBattle = function(r0_2, r1_2, r2_2, r3_2, r4_2)
    -- line: [8, 64] id: 2
    if r0_2.IsAutoBattle then
      r0_2:BattleTestUseItemInBattle(r1_2, r2_2, r3_2, r4_2)
      return 
    end
    local r5_2 = DataMgr.Resource[r2_2]
    if not r5_2 then
      return 
    end
    local r6_2 = r5_2.UseEffectType
    local r7_2 = r5_2.UseBPFunction
    local r8_2 = r5_2.UseAddLevelTag
    local r9_2 = r5_2.PlayAnim
    local r10_2 = r5_2.PlayArmoryAnim
    local r11_2 = UE4.URuntimeCommonFunctionLibrary.GetPlayerControllerByAvatarEid(GWorld.GameInstance, CommonUtils.ObjId2Str(r1_2))
    if not IsValid(r11_2) then
      return 
    end
    local r12_2 = r11_2:GetMyPawn():Cast(UE4.APlayerCharacter)
    if not IsValid(r12_2) then
      return 
    end
    if r6_2 and r0_2["ResourceUseEffect" .. r6_2] then
      r0_2["ResourceUseEffect" .. r6_2](r0_2, r5_2, r12_2, r3_2, r4_2)
    end
    if r7_2 or r9_2 or r10_2 then
      DebugPrint("gmy@Component:UseItemInBattle UseBPFunction", r7_2, r0_2.IsInRegionOnline, r0_2.CurrentOnlineType)
      r12_2:InvokeResourceBPFunction(r2_2)
      EventManager:FireEvent(EventID.OnTheaterPerform, r2_2)
      local r13_2 = {
        char_id = r0_2:GetCurrentCharConfigID() and 0,
        map_id = WorldTravelSubsystem():GetCurrentSceneId() and 0,
        sub_region_id = r0_2.CurrentRegionId and 0,
        resource_id = r2_2 and 0,
      }
      HeroUSDKSubsystem():UploadTrackLog_Lua("gesture_use", r13_2)
      if r0_2.IsInRegionOnline and r0_2.CurrentOnlineType then
        r0_2:RequestUseGestureOnline(r12_2, r2_2)
      end
    end
    if r8_2 and r5_2.Type and r5_2.Type == "InfiniteBattleItem" then
      DebugPrint("gmy@Component:UseItemInBattle  UseAddLevelTag", r8_2)
      r12_2:AddUseResourceLevelTag(r2_2)
    end
    if not IsDedicatedServer(r12_2) then
      AudioManager(r0_2):PlayUISound(r0_2, "event:/ui/common/combat_bag_hide_use_item", "BattleItemUse", nil)
    end
  end,
  RequestUseGestureOnline = function(r0_3, r1_3, r2_3)
    -- line: [66, 74] id: 3
    DebugPrint("gmy@ResourceUseComponent Component:RequestUseGestureOnline", r2_3)
    local r3_3 = DataMgr.Resource[r2_3]
    if not r3_3 then
      return 
    end
    r1_3.CurResourceId = r2_3
    r0_3:SwitchOnlineState(r0_3.CurrentOnlineType, CommonConst.OnlineState.UseWheel, {
      ResourceId = r2_3,
    }, not r3_3.bIsNoLoopAction)
  end,
  RequestCancelGestureOnline = function(r0_4, r1_4)
    -- line: [76, 80] id: 4
    DebugPrint("gmy@ResourceUseComponent Component:RequestCancelGestureOnline")
    r1_4.CurResourceId = 0
    r0_4:SwitchOnlineState(r0_4.CurrentOnlineType, CommonConst.OnlineState.UseWheel, {
      ResourceId = 0,
    })
  end,
  BattleTestUseItemInBattle = function(r0_5, r1_5, r2_5, r3_5, r4_5)
    -- line: [82, 103] id: 5
    print(_G.LogTag, "BattleTestUseItemInBattle", r2_5, r4_5)
    r0_5.AutoTestRobotInfo = r0_5.AutoTestRobotInfo and {}
    table.insert(r0_5.AutoTestRobotInfo, r3_5.RoleInfo.RoleId)
    local r5_5 = DataMgr.Resource[r2_5]
    if not r5_5 then
      return 
    end
    local r6_5 = r5_5.UseEffectType
    local r7_5 = r5_5.UseBPFunction
    if r6_5 or r7_5 then
      local r8_5 = r0_5.Player
      if r6_5 and r0_5["ResourceUseEffect" .. r6_5] then
        r0_5["ResourceUseEffect" .. r6_5](r0_5, r5_5, r8_5, r3_5, r4_5)
      end
      if r7_5 then
        DebugPrint("gmy@Component:UseItemInBattle UseBPFunction", r7_5)
        r8_5:InvokeResourceBPFunction(r2_5)
      end
    end
  end,
  ResourceUseEffectAddHPValue = function(r0_6, r1_6, r2_6, r3_6, r4_6)
    -- line: [105, 115] id: 6
    local r5_6 = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
    if not r5_6 then
      return 
    end
    r5_6:HandleRewardDrop({
      [CommonConst.ResourceUseEffectDrop[r1_6.UseEffectType]] = {
        [tostring(r0_0:GetTag("Normal"))] = r1_6.UseParam,
      },
    }, r4_6, r2_6:GetTransform(), nil, nil)
  end,
  ResourceUseEffectCallMount = function(r0_7, r1_7, r2_7, r3_7, r4_7)
    -- line: [117, 118] id: 7
  end,
  ResourceUseEffectAddAmmo = function(r0_8, r1_8, r2_8, r3_8, r4_8)
    -- line: [121, 131] id: 8
    local r5_8 = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
    if not r5_8 then
      return 
    end
    r5_8:HandleRewardDrop({
      [CommonConst.ResourceUseEffectDrop[r1_8.UseEffectType]] = {
        [tostring(r0_0:GetTag("Normal"))] = r1_8.UseParam,
      },
    }, r4_8, r2_8:GetTransform(), nil, nil)
  end,
  ResourceUseEffectAddSPValue = function(r0_9, r1_9, r2_9, r3_9, r4_9)
    -- line: [133, 143] id: 9
    local r5_9 = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
    if not r5_9 then
      return 
    end
    r5_9:HandleRewardDrop({
      [CommonConst.ResourceUseEffectDrop[r1_9.UseEffectType]] = {
        [tostring(r0_0:GetTag("Normal"))] = r1_9.UseParam,
      },
    }, r4_9, r2_9:GetTransform(), nil, nil)
  end,
  ResourceUseEffectCallPhantom = function(r0_10, r1_10, r2_10, r3_10, r4_10)
    -- line: [145, 149] id: 10
    PrintTable({
      ResourceUseEffectCallPhantom = r3_10,
      Reason = r4_10,
    }, 4)
    r2_10:CreatePhantom(r1_10.UseParam, 1, r3_10, {
      IsSpawnByResource = 1,
    })
  end,
  ResourceUseEffectCancelPhantom = function(r0_11, r1_11, r2_11, r3_11, r4_11)
    -- line: [152, 156] id: 11
    PrintTable({
      ResourceUseEffectCallPhantom = r3_11,
      Reason = r4_11,
    }, 4)
    UE4.UPhantomFunctionLibrary.CancelAllPhantom(r2_11, EDestroyReason.PhantomUseResource)
  end,
  ResourceUseEffectUseBattleProp = function(r0_12, r1_12, r2_12, r3_12, r4_12)
    -- line: [158, 164] id: 12
    DebugPrint("gmy@ResourceUseComponent Component:ResourceUseEffectUseBattleProp", r1_12, r2_12, r3_12, r4_12, r1_12 and r1_12.UseParam)
    if r2_12 then
      r2_12:ResourceUseBattleProp(r1_12.UseParam)
    end
  end,
  ResourceUseEffectCreateMechanism = function(r0_13, r1_13, r2_13, r3_13, r4_13)
    -- line: [166, 196] id: 13
    print(_G.LogTag, "LXZ ResourceUseEffectCreateMechanism", r1_13.UseParam)
    if not r0_13.IsInRegionOnline or not r0_13.CurrentOnlineType then
      return 
    end
    if not r1_13.UseParam then
      return 
    end
    local r5_13 = DataMgr.Mechanism[r1_13.UseParam]
    if not r5_13 then
      return 
    end
    local r6_13 = r2_13:K2_GetActorLocation()
    local r7_13 = FHitResult()
    if r5_13.UnitParams and r5_13.UnitParams.InterPoint then
      for r12_13, r13_13 in pairs(r5_13.UnitParams.InterPoint) do
        if UE4.UKismetSystemLibrary.LineTraceSingle(r0_13, r6_13, FVector(r13_13[1], r13_13[2], r13_13[3]), ETraceTypeQuery.TraceScene, false, nil, 2, r7_13, false) then
          return 
        end
      end
      -- close: r8_13
    end
    local r8_13 = {}
    if r1_13.InteractPlayerNum then
      for r12_13 = 0, r1_13.InteractPlayerNum + -1, 1 do
        table.insert(r8_13, r12_13)
      end
    end
    r0_13:UseCreateMechanism(r0_13.CurrentOnlineType, r1_13.ResourceId, r1_13.UseParam, r8_13)
  end,
  DSSetRefreshRobberMonster = function(r0_14, r1_14)
    -- line: [199, 202] id: 14
    r0_14.logger.debug("ZJT_ DSSetRefreshRobberMonster ", r1_14)
    r0_14:Multicast("SetRefreshRobberMonster", r1_14)
  end,
}
