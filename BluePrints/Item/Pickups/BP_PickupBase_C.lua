-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Item\Pickups\BP_PickupBase_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("Utils.UIUtils")
local r1_0 = require("CommonConst")
local r2_0 = require("BluePrints.Item.Pickups.PickupUseComponent")
local r3_0 = Class({
  "BluePrints.Item.SceneItemBase"
})
function r3_0.AuthorityInitInfo(r0_1, r1_1)
  -- line: [8, 19] id: 1
  r0_1.MoveSpeed = 3000
end
function r3_0.ClientCreateInitInfo(r0_2, r1_2)
  -- line: [21, 33] id: 2
end
function r3_0.CreateRegionData(r0_3)
  -- line: [35, 50] id: 3
  local r1_3 = r0_3:K2_GetActorLocation()
  local r2_3 = r0_3:K2_GetActorRotation()
  r0_3.RegionData = {
    Location = {
      [1] = r1_3.X,
      [2] = r1_3.Y,
      [3] = r1_3.Z,
    },
    Rotation = {
      [1] = r2_3.Pitch,
      [2] = r2_3.Yaw,
      [3] = r2_3.Roll,
    },
  }
end
function r3_0.GetRarity(r0_4)
  -- line: [52, 54] id: 4
  return r0_4.Rarity
end
function r3_0.CheckUnitNeedStorage(r0_5)
  -- line: [56, 58] id: 5
  return r0_5.RegionDataType ~= ERegionDataType.RDT_None
end
function r3_0.CheckRarity(r0_6, r1_6)
  -- line: [60, 63] id: 6
  if not r1_6 then
    r1_6 = 3
  end
  return r1_6 <= r0_6.Data.Rarity
end
function r3_0.ClientInitInfo(r0_7, r1_7)
  -- line: [65, 99] id: 7
  r0_7.MoveSpeed = 3000
end
function r3_0.CheckIsNeedShowGuideCallback(r0_8, r1_8, r2_8)
  -- line: [101, 153] id: 8
  DebugPrint("BP_PickupBase_C:CheckIsNeedShowGuideCallback IsShowInMinimap", r1_8, "IsAllConditionAchieve", r2_8)
  local r3_8 = r0_8.Data
  if r3_8 == nil then
    if IsValid(r0_8.GuideIconComponent) then
      if r0_8.GuideIconComponent:GetWidget() then
        r0_8.GuideIconComponent:SetWidgetHiddenByTag(true, "Pickup")
      end
      r0_8.GuideIconComponent:SetHiddenInGame(true)
    end
    DebugPrint("BP_PickupBase_C:iteminfo nil")
    return 
  end
  if r2_8 then
    if r1_8 then
      EventManager:FireEvent(EventID.ShowDropInMinimap, r0_8, true)
      if IsValid(r0_8.GuideIconComponent) then
        if r0_8.GuideIconComponent:GetWidget() then
          r0_8.GuideIconComponent:SetWidgetHiddenByTag(true, "Pickup")
        end
        r0_8.GuideIconComponent:SetHiddenInGame(true)
      end
    else
      if not IsValid(r0_8.GuideIconComponent) then
        r0_8:CreateAndAddGuideIconComponent()
      end
      local r4_8 = UE4.UGameplayStatics.GetPlayerCharacter(r0_8, 0)
      r0_8.GuideIconComponent:InitGuide(r0_8, r0_8.ToCharacter and r4_8, r3_8.GuideIconBPPath, r0_8.GuideIconOffsetZ)
      if r0_8.GuideIconComponent:GetWidget() then
        r0_8.GuideIconComponent:SetWidgetHiddenByTag(false, "Pickup")
      end
      r0_8.GuideIconComponent:SetHiddenInGame(false)
    end
  elseif r1_8 then
    EventManager:FireEvent(EventID.ShowDropInMinimap, r0_8, false)
    if IsValid(r0_8.GuideIconComponent) then
      if r0_8.GuideIconComponent:GetWidget() then
        r0_8.GuideIconComponent:SetWidgetHiddenByTag(true, "Pickup")
      end
      r0_8.GuideIconComponent:SetHiddenInGame(true)
    end
  elseif IsValid(r0_8.GuideIconComponent) then
    if r0_8.GuideIconComponent:GetWidget() then
      r0_8.GuideIconComponent:SetWidgetHiddenByTag(true, "Pickup")
    end
    r0_8.GuideIconComponent:SetHiddenInGame(true)
  end
  return r2_8
end
function r3_0.OnActorReady(r0_9, r1_9)
  -- line: [177, 186] id: 9
  r3_0.Super.OnActorReady(r0_9, r1_9)
  if r2_0.PostInitFuncMap[r0_9.UseEffectType] ~= nil then
    r2_0.PostInitFuncMap[r0_9.UseEffectType](r2_0, r0_9)
  end
  local r2_9 = r1_9:FindObjectParams("AttachActor")
  if r2_9 then
    r0_9:K2_AttachToActor(r2_9, "", UE4.EAttachmentRule.SnapToTarget, UE4.EAttachmentRule.SnapToTarget, UE4.EAttachmentRule.SnapToTarget)
  end
end
function r3_0.OnPickedUp(r0_10, r1_10)
  -- line: [199, 202] id: 10
  r0_10:InvokeSource()
  r0_10:OnClientPickUp(r1_10)
end
function r3_0.OnClientPickUp(r0_11, r1_11)
  -- line: [203, 223] id: 11
  if IsDedicatedServer(r0_11) then
    return 
  end
  local r2_11 = r0_11.Data
  if r1_11:IsMainPlayer() then
    local r3_11 = r2_0.ClientGetItemCountFuncMap[r2_11.UseEffectType]
    local r4_11 = GWorld:GetAvatar()
    local r7_11 = nil	-- notice: implicit variable refs by block#[7]
    if r4_11 then
      local r5_11 = {}
      local r6_11 = r0_11.UnitId
      if r3_11 then
        r7_11 = r3_11(r0_11.UnitId)
        if not r7_11 then
          ::label_29::
          r7_11 = 1
        end
      else
        goto label_29	-- block#6 is visited secondly
      end
      r5_11[r6_11] = r7_11
      r4_11:ShowRewardUI(r5_11, "Drop")
    else
      local r5_11 = r0_0.ShowGotItemTipsUI
      local r6_11 = "Drop"
      r7_11 = r0_11.ItemId
      local r8_11 = nil	-- notice: implicit variable refs by block#[11]
      if r3_11 then
        r8_11 = r3_11(r0_11.UnitId)
        if not r8_11 then
          ::label_46::
          r8_11 = nil
        end
      else
        goto label_46	-- block#10 is visited secondly
      end
      r5_11(r6_11, r7_11, r8_11)
    end
    local r5_11 = DataMgr.Drop[r0_11.UnitId] and DataMgr.Drop[r0_11.UnitId].PickUpAudioPath
    if r5_11 then
      AudioManager(r0_11):PlaySeById(r0_11, r5_11)
    else
      AudioManager(r0_11):PlayDropPickupSe(r0_11, r0_11.AudioRarity)
    end
  end
end
function r3_0.OnRep_ServerInitSuccess(r0_12)
  -- line: [225, 233] id: 12
  if not r0_12.ServerInitSuccess then
    r0_12.InitSuccess = false
  end
end
function r3_0.OnRep_ServerInitCount(r0_13)
  -- line: [235, 241] id: 13
  r0_13.InitSuccess = false
  r0_13:K2_SetActorLocation(r0_13.ServerInitLocation, false, nil, false)
  r0_13.InfoForInitNew.UnitId = r0_13.UnitId
  r0_13.InfoForInitNew.UnitType = r0_13.UnitType
  r0_13:TryInitActorInfo("InitInfo")
end
function r3_0.DestroyByExceedMaxDropNum(r0_14)
  -- line: [244, 248] id: 14
  if r2_0.ExceedMaxDropNumFuncMap[r0_14.UseEffectType] ~= nil then
    r2_0.ExceedMaxDropNumFuncMap[r0_14.UseEffectType](r2_0, r0_14)
  end
end
function r3_0.SetLifeTime(r0_15, r1_15, r2_15)
  -- line: [250, 257] id: 15
  DebugPrint("THY_ 当前死亡的机关名称为： ", r0_15:GetName(), r0_15.UnitType, r1_15, r2_15, r0_15.IsCache)
  if r0_15.IsCache then
    return 
  end
  r0_15:AddTimer(r1_15, function()
    -- line: [253, 255] id: 16
    r0_15:EMActorDestroy(r2_15)
  end, false)
end
function r3_0.TriggerFallingCallable(r0_17)
  -- line: [259, 262] id: 17
  DebugPrint("OtherActor is Falling Dead. ActorName: ", r0_17:GetName(), ", UnitId: ", r0_17.UnitId, ", Eid: ", r0_17.Eid, ", CreatorId: ", r0_17.CreatorId, " CreatorType: ", r0_17.CreatorType, ", BornPos: ", r0_17.BornPos)
  r0_17:SetLifeTime(1, EDeathReason.TriggerFalling)
end
function r3_0.TriggerWaterFallingCallable(r0_18)
  -- line: [264, 266] id: 18
  r0_18:TriggerFallingCallable()
end
function r3_0.GetItemId(r0_19)
  -- line: [268, 270] id: 19
  return r0_19.UnitId
end
function r3_0.InvokeSource_lua(r0_20)
  -- line: [272, 278] id: 20
  print(_G.LogTag, "LXZ InvokeSource_lua", r0_20.SourceEid)
  if not r0_20.SourceEid then
    return 
  end
  EventManager:FireEvent(EventID.OnItemPickedUp, r0_20.SourceEid)
end
function r3_0.RedirectRarity(r0_21)
  -- line: [281, 286] id: 21
  local r1_21 = "Handle" .. r0_21.UseEffectType
  if r0_21[r1_21] then
    r0_21[r1_21](r0_21)
  end
end
function r3_0.HandleGetResource(r0_22)
  -- line: [288, 290] id: 22
  r0_22.Rarity = DataMgr.Resource[r0_22.UseParam].Rarity
end
function r3_0.HandleGetMod(r0_23)
  -- line: [292, 294] id: 23
  r0_23.Rarity = DataMgr.Mod[r0_23.UseParam].Rarity
end
function r3_0.AddPickupBaseToCache_Lua(r0_24)
  -- line: [305, 308] id: 24
end
function r3_0.OnEMActorDestroy(r0_25, r1_25)
  -- line: [322, 340] id: 25
  r3_0.Super.OnEMActorDestroy(r0_25, r1_25)
  if r1_25 ~= EDestroyReason.Pickup then
    return 
  end
  EventManager:RemoveEvent(EventID.OnPlayerGetResource, r0_25)
  if r0_25.UseEffectType == "GetResource" or r0_25.UseEffectType == "GetMod" or r0_25.UseEffectType == "GetWeapon" then
    return 
  end
  local r2_25 = UE4.UGameplayStatics.GetGameMode(r0_25)
  if not r2_25 then
    return 
  end
  local r3_25 = r2_25.PickUpSuccessCallback
  if r3_25 and r3_25[r0_25.UnitId] then
    for r9_25, r10_25 in pairs(CommonUtils.DeepCopy(r3_25[r0_25.UnitId])) do
      r10_25()
    end
    -- close: r5_25
  end
end
function r3_0.WaitForGetResourece(r0_26)
  -- line: [342, 344] id: 26
  EventManager:AddEvent(EventID.OnPlayerGetResource, r0_26, r0_26.OnPlayerGetResource)
end
function r3_0.OnPlayerGetResource(r0_27, r1_27)
  -- line: [346, 352] id: 27
  if r1_27 == r0_27.UseParam then
    DebugPrint("Pickup OnPlayerGetResource:", r0_27:GetName(), r0_27.UnitId, r0_27.CreatorId, r0_27.WorldRegionEid)
    r0_27:AfterPick()
  end
  EventManager:RemoveEvent(EventID.OnPlayerGetResource, r0_27)
end
function r3_0.ReceiveEndPlay(r0_28)
  -- line: [354, 357] id: 28
  r3_0.Super.ReceiveEndPlay(r0_28)
  EventManager:RemoveEvent(EventID.OnPlayerGetResource, r0_28)
end
function r3_0.WCOnEMActorDestroy(r0_29, r1_29, r2_29)
  -- line: [359, 387] id: 29
  local r3_29 = r2_29:GetWCSubSystem()
  if not IsValid(r3_29) then
    return 
  end
  if r0_29.BpBorn and (not r0_29:CheckManuItemRegionStorage() or r1_29 == EDestroyReason.RecoverSubRegionDataCacheButBpBornHasAlreadyDead) then
    return 
  end
  if r0_29.WorldRegionEid == "" then
    if r0_29.Data then
      GWorld.logger.errorlog("Error : Actor在Destroy时没有赋值WorldRegionEid", r0_29.UnitId, r0_29.UnitType, r0_29.Eid)
    end
  elseif not r3_29.IsInDungeon and r0_29.UseEffectType == "GetResource" then
    local r4_29 = GWorld:GetAvatar()
    if r4_29 then
      r4_29:RegionActorDead(r0_29, r1_29, r0_29.SubRegionId, r0_29.LevelName, true)
    end
  else
    r2_29:GetRegionDataMgrSubSystem():DeadRegionActorData(r0_29, r1_29)
  end
  r3_29:UnregisterEntryToWorldComposition(r0_29)
end
return r3_0
