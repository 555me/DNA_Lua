-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Client\Entities\Components\RegionMoveSyncMgr.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("BluePrints.Client.Wrapper.Decorator")
local r1_0 = {}
local r2_0 = require("EMLuaConst")
function r1_0.InitMoveSyncMgr(r0_1)
  -- line: [7, 10] id: 1
  r0_1.OtherRoleInfo = {}
end
function r1_0.AddRoleToCreate(r0_2, r1_2, r2_2)
  -- line: [12, 44] id: 2
  if r2_0.RegionSyncSubsysEnable then
    r0_2:RegionSyncAddRoleToCreate(r1_2, r2_2)
    return 
  end
  if not r1_2 then
    r0_2.logger.debug("EnterWorldRole is Illegal ObjectId is nil")
    return 
  end
  local r3_2 = r0_2.OtherRoleInfo[r1_2]
  if r3_2 then
    r0_2.logger.debug("There alreay has same avatar in this region ", r1_2)
    return 
  end
  r0_2.OtherRoleInfo[r1_2] = {}
  r0_2.RoleUseTargetParam[r1_2] = {}
  local r4_2 = r2_2.CharInfo
  r3_2.ObjectId = r1_2
  r3_2.CharId = r4_2.CharId
  r3_2.BornState = Const.UnBorn
  r3_2.Uid = r2_2.AvatarInfo.Uid
  r3_2.AppearanceSuit = {}
  local r5_2 = r3_2.AppearanceSuit
  r5_2.IsCornerVisible = r4_2.IsCornerVisible
  r5_2.IsShowPartMesh = r4_2.IsShowPartMesh
  r5_2.AccessorySuit = r4_2.AccessorySuit
  r5_2.Colors = r4_2.Colors
  r5_2.SkinId = r4_2.SkinId
  r3_2.RegionWeaponInfo = r2_2.WeaponInfo
  r3_2.ShowWeapon = r2_2.ShowWeapon
  print(_G.LogTag, " TempRoleInfo.AppearanceSuit", r3_2.AppearanceSuit)
  PrintTable({
    AddRoleToCreate_RoleInfo = r2_2,
    AvatarId = r1_2,
  }, 100)
end
function r1_0.RemoveRoleInfoAndDestroy(r0_3, r1_3, r2_3)
  -- line: [46, 91] id: 3
  if r2_0.RegionSyncSubsysEnable then
    r0_3:RegionSyncRemoveRoleAndDestroy(r1_3, r2_3)
    return 
  end
  if not r1_3 then
    r0_3.logger.debug("[RegionOnline] LeaveWorldRole is Illegal ObjectId is nil")
    return 
  end
  local r3_3 = r0_3.OtherRoleInfo[r1_3]
  if not r3_3 then
    r0_3.logger.debug("[RegionOnline] There is no avatar in this region ", r1_3)
    return 
  end
  if r3_3.CharEid then
    local r4_3 = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
    if r4_3 then
      r4_3:RemovePlayerToInteract(r3_3.CharEid)
    end
  end
  if r3_3.BornState == Const.UnBorn then
    r0_3.OtherRoleInfo[r1_3] = nil
    return 
  end
  r3_3.BornState = Const.ShouldDetory
  if r3_3.BornState == Const.Borning then
    return 
  end
  if not r3_3.CharEid then
    return 
  end
  local r4_3 = Battle(r0_3):GetEntity(r3_3.CharEid)
  EventManager:FireEvent(EventID.OnlineRemoveOtherPlayer, r3_3.Uid)
  if r4_3 then
    r4_3:K2_DestroyActor()
  end
  r0_3.OtherRoleInfo[r1_3] = nil
  r0_3.RoleUseTargetParam[r1_3] = nil
  EventManager:FireEvent(EventID.RemoveRegionIndicatorInfo, r3_3.Uid)
end
function r1_0.DestoryAllOthers(r0_4)
  -- line: [93, 100] id: 4
  if not r0_4.OtherRoleInfo then
    return 
  end
  for r5_4, r6_4 in pairs(r0_4.OtherRoleInfo) do
    r0_4:RemoveRoleInfoAndDestroy(r6_4.ObjectId, r6_4)
  end
  -- close: r1_4
end
function r1_0.NotifyCharacterStartSync(r0_5, r1_5)
  -- line: [102, 119] id: 5
  local r2_5 = GWorld.GameInstance
  local r3_5 = UE4.URegionSyncSubsystem.GetInstance(r2_5)
  if r3_5 then
    r3_5.RegionOnlineId = r1_5
    r3_5:ClearAllRoleBornInfo()
  end
  NPCCreateSubSystem(r2_5):SetIsOnlineState(true, r1_5)
  local r4_5 = UE4.UGameplayStatics.GetPlayerCharacter(r2_5, 0)
  if r4_5 then
    r4_5:EnableRegionSync(true, r1_5)
  end
  EventManager:FireEvent(EventID.OnlineRegionChange, r0_5.IsInRegionOnline, true)
end
function r1_0.NotifyCharacterEndSync(r0_6, ...)
  -- line: [121, 137] id: 6
  local r1_6 = GWorld.GameInstance
  local r2_6 = UE4.URegionSyncSubsystem.GetInstance(r1_6)
  if r2_6 then
    r2_6.RegionOnlineId = 0
  end
  NPCCreateSubSystem(r1_6):SetIsOnlineState(false)
  local r3_6 = UE4.UGameplayStatics.GetPlayerCharacter(r1_6, 0)
  if r3_6 then
    r3_6:EnableRegionSync(false, 0)
  end
  EventManager:FireEvent(EventID.OnlineRegionChange, r0_6.IsInRegionOnline, false)
end
function r1_0.SendSyncInfo(r0_7, r1_7, r2_7)
  -- line: [139, 143] id: 7
  r1_7.ActionBaseInfo = r2_7
  r0_7:UploadPlayerMessage(r0_7.CurrentOnlineType, r1_7)
end
function r1_0.HandChangeRoleInfo(r0_8, r1_8, r2_8)
  -- line: [145, 202] id: 8
  if r2_0.RegionSyncSubsysEnable then
    r0_8:RegionSyncChangeRoleInfo(r1_8, r2_8)
    return 
  end
  if not r1_8 then
    r0_8.logger.debug("[RegionOnline] HandChangeRoleInfo is Illegal ObjectId is nil")
    return 
  end
  local r3_8 = r0_8.OtherRoleInfo[r1_8]
  if not r3_8 then
    r0_8.logger.debug("[RegionOnline] There is no avatar in this region ", r1_8)
    return 
  end
  if not r3_8.BornState then
    r0_8.logger.error("[RegionOnline] Role Havent create yet ", r1_8)
    return 
  end
  if r3_8.BornState < Const.Borning then
    return 
  end
  if r3_8.BornState < Const.Bonred then
    return 
  end
  if not r3_8.CharEid then
    r0_8.logger.error("[RegionOnline] Role Havent create yet ", r1_8)
    return 
  end
  local r4_8 = Battle(r0_8):GetEntity(r3_8.CharEid)
  if not r4_8 then
    r0_8.logger.error("[RegionOnline] Role Doesn\'t exist In This World ", r1_8)
    return 
  end
  if not r4_8.InitCharacterInfo then
    r0_8.logger.error("[RegionOnline] It\'s not a character ", r1_8)
    return 
  end
  local r5_8 = r2_8.CharInfo
  r3_8.CharId = r5_8.CharId
  r3_8.AppearanceSuit = {}
  local r6_8 = r3_8.AppearanceSuit
  r6_8.IsCornerVisible = r5_8.IsCornerVisible
  r6_8.IsShowPartMesh = r5_8.IsShowPartMesh
  r6_8.AccessorySuit = r5_8.AccessorySuit
  r6_8.Colors = r5_8.Colors
  r6_8.SkinId = r5_8.SkinId
  local r7_8 = {
    RoleId = r3_8.CharId,
    SkinId = r3_8.SkinId,
    FromOtherWorld = true,
    AppearanceSuit = r3_8.AppearanceSuit,
  }
  print(_G.LogTag, " HandChangeRoleInfo", r3_8.AppearanceSuit)
  r4_8:InitCharacterInfoForRegionPlayer(r7_8)
  if r4_8.MeleeWeapon then
    r4_8:ChangeUsingWeaponByType("Melee")
  end
end
function r1_0.HandleSwitchWeapon(r0_9, r1_9, r2_9, r3_9)
  -- line: [204, 250] id: 9
  if r2_0.RegionSyncSubsysEnable then
    r0_9:RegionSyncChangeWeaponInfo(r1_9, r2_9, r3_9)
    return 
  end
  if not r1_9 then
    r0_9.logger.debug("[RegionOnline] HandleChangeUsingWeaponType is Illegal ObjectId is nil")
    return 
  end
  local r4_9 = r0_9.OtherRoleInfo[r1_9]
  if not r4_9 then
    r0_9.logger.debug("[RegionOnline] There is no avatar in this region ", r1_9)
    return 
  end
  if not r4_9.BornState then
    r0_9.logger.error("[RegionOnline] Role Havent create yet ", r1_9)
    return 
  end
  if r4_9.BornState < Const.Borning then
    return 
  end
  if r4_9.BornState < Const.Bonred then
    return 
  end
  if not r4_9.CharEid then
    r0_9.logger.error("[RegionOnline] Role Havent create yet ", r1_9)
    return 
  end
  local r5_9 = Battle(r0_9):GetEntity(r4_9.CharEid)
  if not r5_9 then
    r0_9.logger.error("[RegionOnline] Role Doesn\'t exist In This World ", r1_9)
    return 
  end
  if not r5_9.ServerSetUpWeapons then
    r0_9.logger.error("[RegionOnline] It\'s not a character ", r1_9)
    return 
  end
  if r5_9[r3_9 .. "Weapon"] then
    r5_9:RemoveWeaponWithId(r5_9[r3_9 .. "Weapon"].WeaponId)
  end
  local r6_9 = {}
  Utils.FormatWeaponInfo(r6_9, r2_9.WeaponInfo)
  print(_G.LogTag, " HandleChangeUsingWeaponType", "ServerSetUp" .. r3_9 .. "Weapon", r5_9["ServerSetUp" .. r3_9 .. "Weapon"])
  r5_9["ServerSetUp" .. r3_9 .. "Weapon"](r5_9, r6_9)
  r5_9:ChangeUsingWeaponByType("Melee")
end
function r1_0.HandleChangeUsingWeaponType(r0_10, r1_10, r2_10)
  -- line: [252, 293] id: 10
  if r2_0.RegionSyncSubsysEnable then
    r0_10:RegionSyncChangeUsingWeaponType(r1_10, r2_10)
    return 
  end
  if not r1_10 then
    r0_10.logger.debug("[RegionOnline] HandleChangeUsingWeaponType is Illegal ObjectId is nil")
    return 
  end
  local r3_10 = r0_10.OtherRoleInfo[r1_10]
  if not r3_10 then
    r0_10.logger.debug("[RegionOnline] There is no avatar in this region ", r1_10)
    return 
  end
  if not r3_10.BornState then
    r0_10.logger.error("[RegionOnline] Role Havent create yet ", r1_10)
    return 
  end
  if r3_10.BornState < Const.Borning then
    return 
  end
  if r3_10.BornState < Const.Bonred then
    return 
  end
  if not r3_10.CharEid then
    r0_10.logger.error("[RegionOnline] Role Havent create yet ", r1_10)
    return 
  end
  local r4_10 = Battle(r0_10):GetEntity(r3_10.CharEid)
  if not r4_10 then
    r0_10.logger.error("[RegionOnline] Role Doesn\'t exist In This World ", r1_10)
    return 
  end
  if not r4_10.ChangeUsingWeaponByType then
    r0_10.logger.error("[RegionOnline] It\'s not a character ", r1_10)
    return 
  end
  if r2_10.ShowWeapon and r4_10[r2_10.ShowWeapon .. "Weapon"] then
    r4_10:ChangeUsingWeaponByType(r2_10.ShowWeapon)
  end
end
function r1_0.HandleMovePack(r0_11, r1_11, r2_11)
  -- line: [295, 348] id: 11
  if r2_0.RegionSyncSubsysEnable then
    r0_11:RegionSyncUpdateMoveInfo(r1_11, r2_11)
    return 
  end
  if not r1_11 then
    r0_11.logger.debug("[RegionOnline] MovePack is Illegal ObjectId is nil")
    return 
  end
  local r3_11 = r0_11.OtherRoleInfo[r1_11]
  if not r3_11 then
    r0_11.logger.debug("[RegionOnline] There is no avatar in this region ", r1_11)
    return 
  end
  if not r3_11.BornState then
    r0_11.logger.error("[RegionOnline] Role Havent create yet ", r1_11)
    return 
  end
  if r3_11.BornState == Const.ShouldDetory then
    return 
  end
  if r3_11.BornState < Const.Borning then
    r0_11:SpawnOtherRole(r1_11, r2_11)
    return 
  end
  if r3_11.BornState < Const.Bonred then
    return 
  end
  local r4_11 = r0_11.RegionAvatars[r1_11]
  local r5_11 = Battle(r0_11):GetEntity(r3_11.CharEid)
  local r6_11 = GWorld.GameInstance
  local r7_11 = UE4.UGameplayStatics.GetPlayerCharacter(r6_11, 0)
  if r5_11 then
    r5_11:PackSyncInfo(r2_11, r7_11)
    if r5_11.CurResourceId == r2_11.ExpressionId then
      return 
    end
    if r2_11.ExpressionId then
      r5_11.CurResourceId = r2_11.ExpressionId
    end
  elseif r6_11 and r6_11.bRegionClientOnlyShowUI then
    r6_11:SyncPlayerHeadUI(r3_11.CharEid, FVector(r2_11.Location.X, r2_11.Location.Y, r2_11.Location.Z))
  end
end
function r1_0.HandleActionPack(r0_12, r1_12, r2_12)
  -- line: [349, 404] id: 12
  if r2_0.RegionSyncSubsysEnable then
    local r3_12 = r0_12:GetRoleInfo(r1_12)
    local r5_12 = nil	-- notice: implicit variable refs by block#[7]
    if r3_12 and r2_12.ActionBaseInfo then
      local r4_12 = r2_12.ActionBaseInfo.IsCrouching
      if r4_12 ~= nil then
        r5_12 = 0.1 < r4_12
      else
        goto label_18	-- block#5 is visited secondly
      end
      r3_12.IsCrouching = r5_12
      print(_G.LogTag, "RegionPlayerInitInfo Spawn Other Player Character Success", r3_12.IsCrouching, r4_12)
    end
    local r4_12 = r0_12:GetBornedChar(r1_12)
    if not r4_12 then
      return 
    end
    print(_G.LogTag, " HandleActionPack", "IsCrouching", r4_12)
    r5_12 = r2_12.ActionBaseInfo
    if r5_12 then
      r4_12:UpdateActionLocAndRot(r2_12)
    end
    r5_12 = r4_12:IsStateFeature(r2_12)
    r4_12:CacheAction("ReceivePrepareInfo_Lua", r2_12)
    if r4_12:CanRegionSyncDoAction_Immeditately() or r5_12 then
      print(_G.LogTag, "[RegionOnline] DoRegionCacheAction DoAction_Immeditately", r5_12, r2_12.ClassName)
      r4_12:DoRegionCacheAction()
    else
      print(_G.LogTag, "[RegionOnline] DoRegionCacheAction CacheAction", r2_12.ClassName)
    end
    return 
  end
end
function r1_0.HandleHidePack(r0_13, r1_13, r2_13)
  -- line: [406, 443] id: 13
  if r2_0.RegionSyncSubsysEnable then
    print(_G.LogTag, "ReceiveHideInfo_LuaHandleHidePack", r2_13.ActorVisible)
    local r3_13 = r0_13:GetBornedChar(r1_13)
    if r3_13 then
      r3_13:ReceiveHideInfo_Lua(r2_13)
    end
    return 
  end
end
function r1_0.ReceiveStopActionPack(r0_14, r1_14, r2_14)
  -- line: [444, 485] id: 14
  if r2_0.RegionSyncSubsysEnable then
    local r3_14 = r0_14:GetRoleInfo(r1_14)
    if r3_14 and r2_14.ActionBaseInfo then
      local r4_14 = r2_14.ActionBaseInfo.IsCrouching
      local r5_14 = nil	-- notice: implicit variable refs by block#[7]
      if r4_14 ~= nil then
        r5_14 = 0.1 < r4_14
      else
        goto label_18	-- block#5 is visited secondly
      end
      r3_14.IsCrouching = r5_14
    end
    local r4_14 = r0_14:GetBornedChar(r1_14)
    if r4_14 then
      r4_14:ReceiveStopActionInfo_Lua(r2_14)
    end
    return 
  end
end
function r1_0.SpawnOtherRole(r0_15, r1_15, r2_15)
  -- line: [486, 498] id: 15
  local r3_15 = r0_15.OtherRoleInfo[r1_15]
  local r4_15 = GWorld.GameInstance
  print(_G.LogTag, " SpawnOtherRole", r4_15.OtherRoleCanCreatePerTick)
  if r4_15.OtherRoleCanCreatePerTick and r4_15.OtherRoleCanCreatePerTick <= 0 then
    return 
  end
  r3_15.BornState = Const.Borning
  r4_15:SpawnOtherRole(r1_15, r3_15, r2_15)
  if r4_15.OtherRoleCanCreatePerTick then
    r4_15.OtherRoleCanCreatePerTick = r4_15.OtherRoleCanCreatePerTick + -1
  end
end
function r1_0.RegionSyncSystemValid(r0_16, r1_16)
  -- line: [500, 516] id: 16
  if not r1_16 then
    r0_16.logger.error("[RegionOnline] EnterWorldRole is Illegal ObjectId is nil")
    return false
  end
  local r2_16 = GWorld.GameInstance
  if not r2_16 then
    r0_16.logger.error("[RegionOnline] Game Not Start Yet, GameInstance is nil")
    return false
  end
  if not UE4.URegionSyncSubsystem.GetInstance(r2_16) then
    r0_16.logger.error("[RegionOnline] RegionSycnSubsys is nil")
    return false
  end
  return true
end
function r1_0.RegionSyncAddRoleToCreate(r0_17, r1_17, r2_17)
  -- line: [518, 595] id: 17
  DebugPrint("[RegionOnline] RegionSyncAddRoleToCreate", r1_17, r2_17)
  if not r0_17:RegionSyncSystemValid(r1_17) then
    return 
  end
  local r4_17 = UE4.URegionSyncSubsystem.GetInstance(GWorld.GameInstance)
  local r5_17 = CommonUtils.ObjId2Str(r1_17)
  if not r4_17:CanAddThisRole(r5_17) then
    r0_17.logger.error("[RegionOnline] RegionSycnSubsys:CanAddThisRole is false")
    return 
  end
  local r6_17 = Const.ZeroVector
  local r7_17 = Const.ZeroRotator
  if r2_17.ActionBaseInfo and r2_17.ActionBaseInfo.Location then
    r6_17 = FVector(r2_17.ActionBaseInfo.Location.X, r2_17.ActionBaseInfo.Location.Y, r2_17.ActionBaseInfo.Location.Z)
  end
  if r2_17.ActionBaseInfo and r2_17.ActionBaseInfo.Rotation then
    r7_17 = FRotator(r2_17.ActionBaseInfo.Rotation.Pitch, r2_17.ActionBaseInfo.Rotation.Yaw, r2_17.ActionBaseInfo.Rotation.Roll)
  end
  local r8_17 = false
  if TeamController and TeamController:GetModel() then
    for r14_17, r15_17 in pairs((TeamController:GetModel():GetTeam() and {}).Members and {}) do
      if r15_17 and r15_17.Eid == r1_17 then
        r8_17 = true
        break
      end
    end
    -- close: r10_17
  end
  DebugPrint("[RegionOnline] RegionSyncUpdate AddRoleToCreate At ", r1_17, r6_17, r7_17)
  r4_17:AddRoleToRegionSys(r5_17, r6_17, r7_17, r8_17)
  r0_17.OtherRoleInfo[r1_17] = {}
  local r9_17 = r2_17.CharInfo
  local r10_17 = r0_17.OtherRoleInfo[r1_17]
  r10_17.IsCrouching = false
  local r12_17 = nil	-- notice: implicit variable refs by block#[27]
  if r2_17.ActionBaseInfo then
    local r11_17 = r2_17.ActionBaseInfo.IsCrouching
    if r11_17 ~= nil then
      r12_17 = 0.1 < r11_17
    else
      goto label_140	-- block#25 is visited secondly
    end
    r10_17.IsCrouching = r12_17
    print(_G.LogTag, "RegionPlayerInitInfo Spawn Other Player Character Success", r10_17.IsCrouching, r11_17)
    r12_17 = r2_17.ActionBaseInfo.ForceSyncLocation
    r10_17.ForceSyncLocation = r12_17
  end
  r10_17.FromOtherWorld = true
  r10_17.ObjectId = r1_17
  r10_17.RoleId = r9_17.CharId
  r10_17.SkinId = r9_17.SkinId
  r10_17.Uid = r2_17.AvatarInfo.Uid
  r10_17.AppearanceSuit = {}
  r10_17.CurrentPet = r2_17.CurrentPet
  r10_17.CurResourceId = r2_17.CurResourceId
  r10_17.CurrentState = r2_17.CurrentState
  r10_17.MountDatas = {}
  local r11_17 = r10_17.MountDatas
  r11_17.MountId = r2_17.MountDatas.MountId
  r11_17.MountState = r2_17.MountDatas.MountState
  r12_17 = r10_17.AppearanceSuit
  r12_17.IsCornerVisible = r9_17.IsCornerVisible
  r12_17.IsShowPartMesh = r9_17.IsShowPartMesh
  r12_17.AccessorySuit = r9_17.AccessorySuit
  r12_17.Colors = r9_17.Colors
  r12_17.SkinId = r9_17.SkinId
  if r2_17.WeaponInfo then
    local r13_17 = {}
    if r2_17.WeaponInfo.MeleeWeapon then
      Utils.FormatWeaponInfo(r13_17, r2_17.WeaponInfo.MeleeWeapon)
    end
    r10_17.MeleeWeapon = r13_17
    local r14_17 = {}
    if r2_17.WeaponInfo.RangedWeapon then
      Utils.FormatWeaponInfo(r14_17, r2_17.WeaponInfo.RangedWeapon)
    end
    r10_17.RangedWeapon = r14_17
  end
  r10_17.ShowWeapon = r2_17.ShowWeapon
  PrintTable({
    CZC_AddRoleToCreate_RoleInfo = r10_17,
    RoleInfo = r2_17,
    AvatarId = r1_17,
  }, 100)
end
function r1_0.RegionSyncChangeRoleInfo(r0_18, r1_18, r2_18)
  -- line: [597, 643] id: 18
  if not r0_18:RegionSyncSystemValid(r1_18) then
    return 
  end
  local r4_18 = UE4.URegionSyncSubsystem.GetInstance(GWorld.GameInstance)
  local r5_18 = CommonUtils.ObjId2Str(r1_18)
  if not r4_18:ObjIdValidation(r5_18) then
    r0_18.logger.error("RegionSycnSubsys:ObjIdValidation is false")
    return 
  end
  if not r0_18.OtherRoleInfo[r1_18] then
    r0_18.logger.error("Init Info is empty ", r1_18)
    return 
  end
  local r6_18 = r0_18.OtherRoleInfo[r1_18]
  local r7_18 = r2_18.CharInfo
  r6_18.ObjectId = r1_18
  r6_18.RoleId = r7_18.CharId
  r6_18.SkinId = r7_18.SkinId
  r6_18.AppearanceSuit = {}
  local r8_18 = r6_18.AppearanceSuit
  r8_18.IsCornerVisible = r7_18.IsCornerVisible
  r8_18.IsShowPartMesh = r7_18.IsShowPartMesh
  r8_18.AccessorySuit = r7_18.AccessorySuit
  r8_18.Colors = r7_18.Colors
  r8_18.SkinId = r7_18.SkinId
  if r2_18.WeaponInfo then
    local r9_18 = {}
    if r2_18.WeaponInfo.MeleeWeapon then
      Utils.FormatWeaponInfo(r9_18, r2_18.WeaponInfo.MeleeWeapon)
    end
    r6_18.MeleeWeapon = r9_18
    local r10_18 = {}
    if r2_18.WeaponInfo.RangedWeapon then
      Utils.FormatWeaponInfo(r10_18, r2_18.WeaponInfo.RangedWeapon)
    end
    r6_18.RangedWeapon = r10_18
  end
  r6_18.ShowWeapon = r2_18.ShowWeapon and "Melee"
  r6_18.IsCrouching = false
  PrintTable({
    RoleInfoUpdated = r6_18,
    AvatarId = r1_18,
    BornState = r4_18:GetRoleBornState(r5_18),
  }, 100)
  if r4_18:GetRoleBornState(r5_18) <= UE4.ERegionCharBornState.EBS_WatiForPreload then
    return 
  end
  r4_18:OnRoleInfoNeedUpdate(r5_18)
end
function r1_0.RegionSyncChangeWeaponInfo(r0_19, r1_19, r2_19, r3_19)
  -- line: [645, 673] id: 19
  if not r0_19:RegionSyncSystemValid(r1_19) then
    return 
  end
  local r5_19 = UE4.URegionSyncSubsystem.GetInstance(GWorld.GameInstance)
  local r6_19 = CommonUtils.ObjId2Str(r1_19)
  if not r5_19:ObjIdValidation(r6_19) then
    r0_19.logger.error("RegionSycnSubsys:ObjIdValidation is false")
    return 
  end
  if not r0_19.OtherRoleInfo[r1_19] then
    r0_19.logger.error("Init Info is empty ", r1_19)
    return 
  end
  local r7_19 = r0_19.OtherRoleInfo[r1_19]
  if r2_19.WeaponInfo then
    local r8_19 = {}
    Utils.FormatWeaponInfo(r8_19, r2_19.WeaponInfo)
    r7_19[r3_19 .. "Weapon"] = r8_19
  end
  r7_19.ShowWeapon = "Melee"
  PrintTable({
    WeaponInfoUpdated = r7_19,
    AvatarId = r1_19,
    BornState = r5_19:GetRoleBornState(r6_19),
  }, 100)
  if r5_19:GetRoleBornState(r6_19) <= UE4.ERegionCharBornState.EBS_WatiForPreload then
    return 
  end
  r5_19:OnRoleInfoNeedUpdate(r6_19)
end
function r1_0.RegionSyncChangeUsingWeaponType(r0_20, r1_20, r2_20)
  -- line: [675, 705] id: 20
  if not r0_20:RegionSyncSystemValid(r1_20) then
    return 
  end
  local r4_20 = UE4.URegionSyncSubsystem.GetInstance(GWorld.GameInstance)
  local r5_20 = CommonUtils.ObjId2Str(r1_20)
  if not r4_20:ObjIdValidation(r5_20) then
    r0_20.logger.error("RegionSycnSubsys:ObjIdValidation is false")
    return 
  end
  if not r0_20.OtherRoleInfo[r1_20] then
    r0_20.logger.error("Init Info is empty ", r1_20)
    return 
  end
  r0_20.OtherRoleInfo[r1_20].ShowWeapon = r2_20.ShowWeapon
  if r4_20:GetRoleBornState(r5_20) <= UE4.ERegionCharBornState.EBS_WaitForBorn then
    return 
  end
  local r7_20 = r4_20:GetBornedChar(r5_20)
  if not r7_20 then
    r0_20.logger.error("Character is not Created yet", r1_20)
    return 
  end
  if not r7_20[(r2_20.ShowWeapon .. "Weapon")] then
    r0_20.logger.error("Character Doesn\'t have this weapon ", r2_20.ShowWeapon, r1_20)
    return 
  end
  r7_20:ChangeUsingWeaponByType(r2_20.ShowWeapon)
end
function r1_0.RegionSyncUpdateMoveInfo(r0_21, r1_21, r2_21)
  -- line: [707, 739] id: 21
  if not r0_21:RegionSyncSystemValid(r1_21) then
    return 
  end
  local r4_21 = UE4.URegionSyncSubsystem.GetInstance(GWorld.GameInstance)
  local r5_21 = CommonUtils.ObjId2Str(r1_21)
  if not r4_21:ObjIdValidation(r5_21) then
    r0_21.logger.error("RegionSycnSubsys:ObjIdValidation is false")
    return 
  end
  local r6_21 = r0_21.OtherRoleInfo[r1_21]
  if r6_21 then
    r6_21.CurResourceId = r2_21.CurResourceId
  end
  local r7_21 = FVector(r2_21.Location.X, r2_21.Location.Y, r2_21.Location.Z)
  r4_21:UpdateRoleLocAndRot(r5_21, r7_21, FRotator(r2_21.Rotation.Pitch, r2_21.Rotation.Yaw, r2_21.Rotation.Roll))
  if r4_21:GetRoleBornState(r5_21) <= UE4.ERegionCharBornState.EBS_WaitForBorn then
    return 
  end
  local r9_21 = r4_21:GetBornedChar(r5_21)
  if not r9_21 then
    r0_21.logger.error("Character is not Created yet", r1_21)
    return 
  end
  r2_21.IsCrouching = r6_21.IsCrouching
  r9_21:UpdateCharacterMoveInfo(r2_21)
  if r4_21.LocalPlayerChar then
    r4_21.LocalPlayerChar:CanPlayerBeInterCandidate(r9_21.Eid, r7_21)
  end
end
function r1_0.RegionSyncRemoveRoleAndDestroy(r0_22, r1_22, r2_22)
  -- line: [741, 761] id: 22
  if not r0_22:RegionSyncSystemValid(r1_22) then
    return 
  end
  local r4_22 = UE4.URegionSyncSubsystem.GetInstance(GWorld.GameInstance)
  local r5_22 = CommonUtils.ObjId2Str(r1_22)
  if r4_22:ObjIdValidation(r5_22) then
    r4_22:RemoveRoleBornInfo(r5_22, true)
  end
  local r6_22 = r0_22.OtherRoleInfo[r1_22]
  if r6_22 then
    EventManager:FireEvent(EventID.OnlineRemoveOtherPlayer, r6_22.Uid)
    r0_22.OtherRoleInfo[r1_22] = nil
  end
  if r6_22 then
    EventManager:FireEvent(EventID.RemoveRegionIndicatorInfo, r6_22.Uid)
  end
end
return r1_0
