-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Client\Entities\Components\OnlineComp.lua
-- version: lua54
-- line: [0, 0] id: 0
local r0_0 = require("pb")
local r1_0 = require("BluePrints.Client.Wrapper.Decorator")
local r2_0 = {
  EnterRegionOnline = "HandleEnterRegionOnline",
  LeaveRegionOnline = "HandleLeaveRegionOnline",
  Move = "HandleMove",
  Action = "HandleAction",
  StopAction = "HandleStopAction",
  Hide = "HandleHide",
  NicknameChange = "HandleNicknameChange",
  LevelChange = "HandleLevelChange",
  CurrentPetChange = "HandleCurrentPetChange",
  CharInfoChange = "HandleCharInfoChange",
  UseExpression = "HandleUseExpression",
  TitleChange = "HandleTitleChange",
  OnLeaveRegionOnlineItem = "HandleOnLeaveRegionOnlineItem",
  OnUseRegionOnlineItem = "HandleOnUseRegionOnlineItem",
  OnChangeRegionOnlineItemState = "HandleOnChangeRegionOnlineItemState",
  OnDeadRegionOnlineItem = "HandleOnDeadRegionOnlineItem",
  OnUseCreateMount = "HandleOnUseCreateMount",
  OnDeadRegionOnlineMount = "HandleOnDeadRegionOnlineMount",
  OnChangeRegionOnlineMount = "HandleOnChangeRegionOnlineMount",
  ShareMountDatasChange = "HandleShareMountDatasChange",
  SwitchMeleeWeapon = "HandleSwitchMeleeWeapon",
  SwitchRangedWeapon = "HandleSwitchRangedWeapon",
  SwitchShowWeapon = "HandleSwitchShowWeapon",
  UseGouSuo = "HandleUseGouSuo",
  SwitchOnlineState = "HandleSwitchOnlineState",
  HeadFrame = "HandleHeadFrame",
  HeadIcon = "HandleHeadIcon",
}
return {
  EnterWorld = function(r0_1)
    -- line: [37, 43] id: 1
    r0_1.IsInRegionOnline = false
    r0_1.CurrentOnlineType = -1
    r0_1.PreEnterSubRegionId = -1
    r0_1.RegionAvatars = {}
    r0_1:InitMoveSyncMgr()
  end,
  RequestEnterOnline = function(r0_2, r1_2, r2_2, r3_2, r4_2)
    -- line: [45, 62] id: 2
    r0_2.logger.debug("[OnlineComp] CZC RequestEnterOnline: " .. r1_2, r0_2.IsInRegionOnline)
    r0_2.PreEnterSubRegionId = r1_2
    local r5_2 = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
    local r6_2 = {}
    local r7_2 = {
      ShowWeapon = r2_2 and CommonConst.OnlineShowWeapon.Melee,
    }
    r6_2.WeaponInfo = r7_2
    r7_2 = {
      UseState = 0,
      UniqueId = 0,
    }
    r6_2.UseMechanism = r7_2
    r6_2.CurrentState = r3_2 and CommonConst.OnlineState.Normal
    r6_2.UseTargetParam = {}
    r6_2.ActionBaseInfo = r5_2:GetPlayerLocationAndRotation()
    r0_2:CallServerMethod("RequestEnterOnline", r1_2, r6_2)
  end,
  OnRequestEnterOnline = function(r0_3, r1_3, r2_3, r3_3, r4_3)
    -- line: [64, 92] id: 3
    r0_3.logger.debug("[OnlineComp] CZC OnRequestEnterOnline: " .. r1_3 .. " ret: " .. r2_3)
    if r2_3 ~= ErrorCode.RET_SUCCESS then
      return 
    end
    r0_3:NotifyCharacterStartSync(r1_3)
    r0_3.IsInRegionOnline = true
    r0_3.PreEnterSubRegionId = -1
    r0_3.RegionAvatars = r3_3
    r0_3.CurrentOnlineType = r1_3
    r0_3.GlobalRegionItemCache = r4_3
    if not r3_3 then
      return 
    end
    PrintTable({
      OnRequestEnterOnline_others = r3_3,
      GlobalRegionItemCache = r4_3,
    }, 10)
    for r9_3, r10_3 in pairs(r3_3) do
      r0_3:AddRoleToCreate(r9_3, r10_3)
      r0_3:InitOnlineStateData(r9_3, r10_3)
    end
    -- close: r5_3
    r0_3:InitMechanismUser(r4_3)
    r0_3.InWorldChatChannel[CommonConst.ChatChannel.RegionOnline] = true
    if ChatController then
      ChatController:SendRequestEnterChatChannel(ChatCommon.ChannelDef.Region)
    end
    require("BluePrints.UI.WBP.BattleOnlineAction.OnlineActionController"):Init(true)
  end,
  RequestLeaveOnline = function(r0_4, r1_4)
    -- line: [94, 97] id: 4
    r0_4.logger.debug("[OnlineComp] CZC RequestLeaveOnline: " .. r1_4)
    r0_4:CallServerMethod("RequestLeaveOnline", r1_4)
  end,
  OnRequestLeaveOnline = function(r0_5, r1_5, r2_5)
    -- line: [99, 120] id: 5
    r0_5.logger.debug("[OnlineComp] CZC OnRequestLeaveOnline: " .. r1_5 .. " ret: " .. r2_5)
    if r2_5 ~= ErrorCode.RET_SUCCESS then
      return 
    end
    r0_5:DestoryAllOthers()
    r0_5:NotifyCharacterEndSync()
    r0_5.IsInRegionOnline = false
    r0_5.RegionAvatars = {}
    r0_5.CurrentOnlineType = -1
    r0_5.PreEnterSubRegionId = -1
    r0_5.InWorldChatChannel[CommonConst.ChatChannel.RegionOnline] = false
    if ChatController then
      ChatController:SendRequestLeaveChatChannel(ChatCommon.ChannelDef.Region)
    end
    local r3_5 = require("BluePrints.UI.WBP.BattleOnlineAction.OnlineActionController")
    if r3_5 then
      r3_5:Destory()
    end
  end,
  UseExpression = function(r0_6, r1_6, r2_6)
    -- line: [122, 124] id: 6
    DebugPrint("gmy@OnlineComp Component:UseExpression", r1_6, r2_6)
  end,
  GetActionMessage = function(r0_7, r1_7, r2_7)
    -- line: [127, 149] id: 7
    for r7_7, r8_7 in pairs(r2_7.IntMap) do
      r2_7[r7_7] = r8_7
    end
    -- close: r3_7
    for r7_7, r8_7 in pairs(r2_7.FloatMap) do
      r2_7[r7_7] = r8_7
    end
    -- close: r3_7
    for r7_7, r8_7 in pairs(r2_7.EnumMap) do
      r2_7[r7_7] = r8_7
    end
    -- close: r3_7
    for r7_7, r8_7 in pairs(r2_7.VectorMap) do
      r2_7[r7_7] = r8_7
    end
    -- close: r3_7
    for r7_7, r8_7 in pairs(r2_7.RotatorMap) do
      r2_7[r7_7] = r8_7
    end
    -- close: r3_7
    r2_7.IntMap = nil
    r2_7.FloatMap = nil
    r2_7.EnumMap = nil
    r2_7.VectorMap = nil
    r2_7.RotatorMap = nil
    r1_7.Action = r2_7
  end,
  UploadPlayerMessage = function(r0_8, r1_8, r2_8)
    -- line: [150, 167] id: 8
    if not CommonConst.OnlineClientMessageType[r2_8.Type] then
      return 
    end
    local r3_8 = {
      Type = r2_8.Type,
    }
    if r2_8.Type == "Action" and not r2_8.UsingActionNew then
      r0_8:GetActionMessage(r3_8, r2_8)
    else
      r3_8[r2_8.Type] = r2_8
    end
    r0_8:CallServer("UploadPlayerOnlineClientMessage", function(r0_9)
      -- line: [164, 165] id: 9
    end, r1_8, r0_0.encode(".OnlineClientMessage", r3_8))
  end,
  RegionOnlineRequests = function(r0_10, r1_10, r2_10)
    -- line: [169, 182] id: 10
    for r7_10, r8_10 in ipairs(r1_10) do
      r0_10:HandleSingleRegionOnlineRequest(r8_10)
    end
    -- close: r3_10
    for r7_10, r8_10 in ipairs(r2_10) do
      local r9_10 = r0_0.decode(".OnlineClientMessage", r8_10)
      local r10_10 = r9_10[r9_10.Type]
      if r10_10 then
        r10_10.Sender = r9_10.Sender
        r0_10:HandleSingleRegionOnlineRequest(r10_10)
      end
    end
    -- close: r3_10
  end,
  HandleSingleRegionOnlineRequest = function(r0_11, r1_11)
    -- line: [183, 189] id: 11
    local r3_11 = r2_0[r1_11.Type]
    if r3_11 and r0_11[r3_11] then
      r0_11[r3_11](r0_11, r1_11)
    end
  end,
  HandleEnterRegionOnline = function(r0_12, r1_12)
    -- line: [191, 203] id: 12
    PrintTable({
      HandleEnterRegionOnline = r1_12,
    }, 10)
    r0_12:AddRoleToCreate(r1_12.Sender, r1_12)
    r0_12:InitOnlineStateData(r1_12.Sender, r1_12)
    r0_12.RegionAvatars[r1_12.Sender] = {
      CharInfo = r1_12.CharInfo,
      CurrentPet = r1_12.CurrentPet,
      AvatarInfo = r1_12.AvatarInfo,
      RegionOnlineItem = r1_12.RegionOnlineItem,
      GlobalRegionItemCache = r1_12.GlobalRegionItemCache,
    }
    r0_12:InitMechanismUser(r1_12.GlobalRegionItemCache)
  end,
  HandleLeaveRegionOnline = function(r0_13, r1_13)
    -- line: [205, 210] id: 13
    PrintTable({
      HandleLeaveRegionOnline = r1_13,
    }, 10)
    r0_13:HandleLeaveRegionMechanism(r1_13)
    r0_13:RemoveRoleInfoAndDestroy(r1_13.Sender, r1_13)
    r0_13.RegionAvatars[r1_13.Sender] = nil
  end,
  HandleSwitchMeleeWeapon = function(r0_14, r1_14)
    -- line: [212, 215] id: 14
    PrintTable({
      HandleSwitchMeleeWeapon = r1_14,
    }, 10)
    r0_14:HandleSwitchWeapon(r1_14.Sender, r1_14, "Melee")
  end,
  HandleSwitchRangedWeapon = function(r0_15, r1_15)
    -- line: [217, 220] id: 15
    PrintTable({
      HandleSwitchRangedWeapon = r1_15,
    }, 10)
    r0_15:HandleSwitchWeapon(r1_15.Sender, r1_15, "Ranged")
  end,
  HandleSwitchShowWeapon = function(r0_16, r1_16)
    -- line: [222, 225] id: 16
    PrintTable({
      HandleSwitchShowWeapon = r1_16,
    }, 10)
    r0_16:HandleChangeUsingWeaponType(r1_16.Sender, r1_16)
  end,
  InitOnlineStateData = function(r0_17, r1_17, r2_17)
    -- line: [227, 238] id: 17
    DebugPrint("gmy@OnlineComp Component:InitOnlineStateData", r1_17, r2_17)
    r0_17.RoleUseTargetParam = r0_17.RoleUseTargetParam and {}
    r0_17.RoleUseTargetParam[r1_17] = r2_17.UseTargetParam
    r0_17.DeliveryStates = r0_17.DeliveryStates and {}
    if r2_17.CurrentState == CommonConst.OnlineState.UseDelivery then
      r0_17.DeliveryStates[r1_17] = true
    else
      r0_17.DeliveryStates[r1_17] = false
    end
  end,
  HandleSwitchOnlineState = function(r0_18, r1_18)
    -- line: [240, 249] id: 18
    PrintTable({
      HandleSwitchOnlineState = r1_18,
    }, 10)
    local r2_18 = r0_18:GetRoleInfo(r1_18.Sender)
    if r2_18 then
      r2_18.IsCrouching = false
    end
    r0_18:HandleGestureState(r1_18, false)
    r0_18:HandleFish(r1_18)
    r0_18:HandleDelivery(r1_18)
  end,
  InitOnlineStateAfterBorn = function(r0_19, r1_19, r2_19)
    -- line: [252, 266] id: 19
    DebugPrint("gmy@OnlineComp Component:InitOnlineStateAfterBorn", r1_19, r2_19)
    if r0_19.RoleUseTargetParam then
      local r3_19 = r0_19.RoleUseTargetParam[r1_19]
      local r4_19 = r0_19:GetRoleInfo(r1_19)
      if r4_19 then
        r4_19.IsCrouching = false
      end
      r0_19:HandleGestureState({
        Sender = r1_19,
        UseTargetParam = r3_19,
      }, true)
      r0_19:HandleFish({
        Sender = r1_19,
        UseTargetParam = r3_19,
      })
    end
    r0_19:HandleMechanism(r0_19.RegionAvatars, r0_19.GlobalRegionItemCache, r1_19)
    r0_19:TryPlayEndDelivery(r1_19, r2_19)
  end,
  HandleGestureState = function(r0_20, r1_20, r2_20)
    -- line: [268, 344] id: 20
    DebugPrint("gmy@OnlineComp Component:HandleGestureState", r1_20.Sender, r1_20.UseTargetParam, r1_20.UseTargetParam and r1_20.UseTargetParam.ResourceId)
    if r1_20 and r1_20.UseTargetParam and r1_20.UseTargetParam.ResourceId then
      local r3_20 = r1_20.UseTargetParam.ResourceId
      local r4_20 = r0_20:GetBornedChar(r1_20.Sender)
      local r5_20 = DebugPrint
      local r6_20 = "gmy@OnlineComp Component:HandleGestureState2"
      local r7_20 = r3_20
      local r8_20 = r4_20
      local r9_20 = r4_20 and r4_20:GetName()
      r5_20(r6_20, r7_20, r8_20, r9_20, r4_20 and r4_20.CurResourceId, r1_20.Sender, r1_20.State, r1_20.UseTargetParam)
      if r4_20 then
        r5_20 = DataMgr.Resource[r3_20]
        if r5_20 then
          DebugPrint("gmy@OnlineComp Component:HandleGestureState3", r3_20, r4_20.CurResourceId)
          if r3_20 ~= r4_20.CurResourceId then
            r6_20 = r1_20.ActionBaseInfo
            if r6_20 then
              r7_20 = r6_20.Location
              r8_20 = r6_20.Rotation
              PrintTable({
                HandleGestureState = {
                  Loc = r7_20,
                  Rot = r8_20,
                },
              }, 10)
              r4_20:K2_SetActorLocationAndRotation(FVector(r7_20.X, r7_20.Y, r7_20.Z), FRotator(r8_20.Pitch, r8_20.Yaw, r8_20.Roll), false, nil, false)
            end
            r7_20 = r5_20.PlayArmoryAnim
            if r7_20 then
              r8_20 = Const.ArmoryActionIdToArmoryTag[r7_20]
              if r8_20 == Const.Melee then
                r9_20 = r4_20.WeaponInfo and r4_20.WeaponInfo.MeleeWeapon
                if r9_20 then
                  local r10_20 = r9_20.WeaponId
                  if r4_20.MeleeWeapon and r4_20.MeleeWeapon.WeaponId ~= r10_20 then
                    r4_20.Weapons:Remove(r10_20)
                    r4_20.MeleeWeapon:Destroy()
                    r4_20.MeleeWeapon = nil
                  end
                  if r4_20.MeleeWeapon == nil then
                    r4_20.MeleeWeapon = r4_20:SpawnShowWeapon(r10_20, nil, nil, nil, r9_20)
                    r4_20:RawAddWeapon(r4_20.MeleeWeapon)
                  end
                end
              elseif r8_20 == Const.Ranged then
                r9_20 = r4_20.WeaponInfo and r4_20.WeaponInfo.RangedWeapon
                if r9_20 then
                  local r10_20 = r9_20.WeaponId
                  if r4_20.RangedWeapon and r4_20.RangedWeapon.WeaponId ~= r10_20 then
                    r4_20.Weapons:Remove(r10_20)
                    r4_20.RangedWeapon:Destroy()
                    r4_20.RangedWeapon = nil
                  end
                  if r4_20.RangedWeapon == nil then
                    r4_20.RangedWeapon = r4_20:SpawnShowWeapon(r10_20, nil, nil, nil, r9_20)
                    r4_20:RawAddWeapon(r4_20.RangedWeapon)
                  end
                end
              end
            end
            if r2_20 then
              r4_20:InitShowResourceBPFunction(r3_20)
            else
              r4_20:InvokeResourceBPFunction(r3_20)
            end
          end
        else
          DebugPrint("gmy@OnlineComp Component:HandleGestureState ResetIdleTag", r4_20.PlayerAnimInstance)
          if r4_20.PlayerAnimInstance then
            r4_20.PlayerAnimInstance:ResetIdleTag()
          end
        end
        r4_20.CurResourceId = r3_20
      end
    end
  end,
  HandleMove = function(r0_21, r1_21)
    -- line: [346, 353] id: 21
    local r2_21 = r0_21.RegionAvatars[r1_21.Sender]
    if r2_21 and r2_21.CurResourceId ~= 0 and r1_21.CurResourceId == 0 then
      r2_21.CurResourceId = 0
      r2_21.WeaponInfo = nil
    end
    r0_21:HandleMovePack(r1_21.Sender, r1_21)
  end,
  HandleAction = function(r0_22, r1_22)
    -- line: [355, 357] id: 22
    r0_22:HandleActionPack(r1_22.Sender, r1_22)
  end,
  HandleHide = function(r0_23, r1_23)
    -- line: [359, 361] id: 23
    r0_23:HandleHidePack(r1_23.Sender, r1_23)
  end,
  HandleStopAction = function(r0_24, r1_24)
    -- line: [363, 365] id: 24
    r0_24:ReceiveStopActionPack(r1_24.Sender, r1_24)
  end,
  HandleNicknameChange = function(r0_25, r1_25)
    -- line: [367, 373] id: 25
    local r2_25 = r0_25.RegionAvatars[r1_25.Sender]
    if r2_25 then
      r2_25.AvatarInfo.Nickname = r1_25.Nickname
      EventManager:FireEvent(EventID.OnlineRegionNickNameChange, r1_25.Sender, r2_25.AvatarInfo.Uid)
    end
  end,
  HandleHeadFrame = function(r0_26, r1_26)
    -- line: [375, 380] id: 26
    local r2_26 = r0_26.RegionAvatars[r1_26.Sender]
    if r2_26 then
      r2_26.AvatarInfo.HeadFrameId = r1_26.HeadFrameId
    end
  end,
  HandleHeadIcon = function(r0_27, r1_27)
    -- line: [382, 387] id: 27
    local r2_27 = r0_27.RegionAvatars[r1_27.Sender]
    if r2_27 then
      r2_27.AvatarInfo.HeadIconId = r1_27.HeadIconId
    end
  end,
  HandleLevelChange = function(r0_28, r1_28)
    -- line: [391, 396] id: 28
    local r2_28 = r0_28.RegionAvatars[r1_28.Sender]
    if r2_28 then
      r2_28.AvatarInfo.Level = r1_28.Level
    end
  end,
  HandleCurrentPetChange = function(r0_29, r1_29)
    -- line: [398, 406] id: 29
    if SenderInfo then
      SenderInfo.CurrentPet = r1_29.CurrentPet
    end
    local r2_29 = r0_29:GetRoleInfo(r1_29.Sender)
    if r2_29 then
      r2_29.CurrentPet = r1_29.CurrentPet
    end
  end,
  HandleCharInfoChange = function(r0_30, r1_30)
    -- line: [408, 414] id: 30
    local r2_30 = r0_30.RegionAvatars[r1_30.Sender]
    if r2_30 then
      r2_30.CharInfo = r1_30.CharInfo
    end
    r0_30:HandChangeRoleInfo(r1_30.Sender, r1_30)
  end,
  HandleTitleChange = function(r0_31, r1_31)
    -- line: [416, 433] id: 31
    local r2_31 = r0_31.RegionAvatars[r1_31.Sender]
    if r2_31 then
      if r1_31.TitleBefore then
        r2_31.AvatarInfo.TitleBefore = r1_31.TitleBefore
      end
      if r1_31.TitleAfter then
        r2_31.AvatarInfo.TitleAfter = r1_31.TitleAfter
      end
      if r1_31.TitleFrame then
        r2_31.AvatarInfo.TitleFrame = r1_31.TitleFrame
      end
    end
    if r2_31 then
      EventManager:FireEvent(EventID.OnlineRegionTitleChange, r1_31.Sender, r2_31.AvatarInfo.Uid, r2_31.AvatarInfo.TitleBefore, r2_31.AvatarInfo.TitleAfter, r2_31.AvatarInfo.TitleFrame)
    end
  end,
  HandleMechanism = function(r0_32, r1_32, r2_32, r3_32)
    -- line: [435, 489] id: 32
    local r4_32 = r0_32:GetBornedChar(r3_32)
    local r5_32 = UE4.UGameplayStatics.GetGameState(r4_32)
    local r6_32 = r0_32:GetMechanismUser(r3_32)
    print(_G.LogTag, "LXZ HandleMechanism", r6_32)
    if r6_32 and r6_32.UniqueId and r6_32.PointIdx then
      local r7_32 = r5_32.RegionOnlineMechanismMap:Find(r6_32.UniqueId)
      if r4_32 and r7_32 then
        local r8_32 = r7_32.ChestInteractiveComponent
        r4_32:InteractiveMechanism(r7_32.Eid, r4_32.Eid, r8_32.NextStateId, r8_32.CommonUIConfirmID, true, r6_32.PointIdx)
      end
    end
    local r8_32 = r1_32[r3_32].RegionOnlineItem
    print(_G.LogTag, "LXZ HandleMechanism222", r8_32, r4_32:GetName())
    PrintTable(r8_32, 10)
    if r8_32 then
      for r13_32, r14_32 in pairs(r8_32) do
        if r14_32.StateComponent then
          for r19_32, r20_32 in pairs(r14_32.StateComponent) do
            if r20_32.UseEid then
              r0_32:UpdateMechanismUser(r13_32, r19_32, r20_32.UseEid, true)
            end
          end
          -- close: r15_32
        end
        local r15_32 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
        if not r15_32.RegionOnlineMechanismMap:FindRef(r13_32) then
          local r16_32 = r14_32.Location
          local r17_32 = r14_32.Rotation
          local r18_32 = AEventMgr.CreateUnitContext()
          r18_32.UnitType = "Mechanism"
          r18_32.UnitId = r14_32.UnitId
          r18_32.Loc = FVector(r16_32.X, r16_32.Y, r16_32.Z)
          r18_32.Rotation = FRotator(r17_32.Pitch, r17_32.Yaw, r17_32.Roll)
          r18_32.NameParams:Add("Sender", CommonUtils.ObjId2Str(r14_32.OwnerAvatarEid))
          r18_32.NameParams:Add("UniqueId", r13_32)
          r15_32.EventMgr:CreateUnitNew(r18_32, true)
        else
          local r16_32 = r15_32.RegionOnlineMechanismMap:Find(r13_32)
          if r4_32 and r16_32 and r14_32.StateComponent then
            for r21_32, r22_32 in pairs(r14_32.StateComponent) do
              if r22_32.UseEid == r3_32 then
                local r23_32 = r16_32.ChestInteractiveComponent
                r4_32:InteractiveMechanism(r16_32.Eid, r4_32.Eid, r23_32.NextStateId, r23_32.CommonUIConfirmID, true, r21_32)
              end
            end
            -- close: r17_32
          end
        end
        PrintTable(r14_32, 10)
      end
      -- close: r9_32
    end
  end,
  HandleLeaveRegionMechanism = function(r0_33, r1_33)
    -- line: [492, 510] id: 33
    print(_G.LogTag, "LXZ HandleLeaveRegionMechanism")
    PrintTable(r1_33, 10)
    if r1_33.Sender == r0_33.Eid then
      return 
    end
    local r2_33 = r0_33:GetMechanismUser(r1_33.Sender)
    if r2_33 and r2_33.UniqueId and r2_33.PointIdx then
      r0_33:RealDeInteractive({
        UniqueId = r2_33.UniqueId,
        InteractiveId = r2_33.PointIdx,
        Sender = r1_33.Sender,
      })
    end
    r0_33:RealDeadRegionOnlineItem(UniqueId, r1_33.Sender, true)
  end,
  InitMechanismUser = function(r0_34, r1_34)
    -- line: [512, 527] id: 34
    print(_G.LogTag, "LXZ HandleMechanism InitMechanismUser", r1_34)
    PrintTable(r1_34, 10)
    for r6_34, r7_34 in pairs(r1_34) do
      local r8_34 = r7_34.UniqueId
      local r9_34 = r7_34.StateComponent
      if r8_34 and r9_34 then
        for r14_34, r15_34 in pairs(r9_34) do
          print(_G.LogTag, "LXZ HandleMechanism InitMechanismUser222", r14_34, UserAvatarEid)
          if r15_34.UseEid then
            r0_34:UpdateMechanismUser(r8_34, r14_34, r15_34.UseEid, true)
          end
        end
        -- close: r10_34
      end
    end
    -- close: r2_34
  end,
  UpdateMechanismUser = function(r0_35, r1_35, r2_35, r3_35, r4_35)
    -- line: [529, 549] id: 35
    local r5_35 = CommonUtils.ObjId2Str(r3_35)
    print(_G.LogTag, "LXZ HandleMechanism UpdateMechanismUser", r1_35, r2_35, r5_35, r4_35)
    if not r0_35.Mechanism2User then
      r0_35.Mechanism2User = {}
    end
    if not r0_35.User2Mechanism then
      r0_35.User2Mechanism = {}
    end
    if not r0_35.Mechanism2User[r1_35] then
      r0_35.Mechanism2User[r1_35] = {}
    end
    if r4_35 then
      print(_G.LogTag, "LXZ HandleMechanism UpdateMechanismUser222", r1_35, r2_35, r5_35, r4_35)
      r0_35.User2Mechanism[r5_35] = {
        UniqueId = r1_35,
        PointIdx = r2_35,
      }
      r0_35.Mechanism2User[r1_35][r2_35] = r5_35
    else
      r0_35.User2Mechanism[r5_35] = nil
      r0_35.Mechanism2User[r1_35][r2_35] = nil
    end
  end,
  GetMechanismUser = function(r0_36, r1_36)
    -- line: [551, 559] id: 36
    print(_G.LogTag, "LXZ GetMechanismUser")
    if not r0_36.User2Mechanism then
      return nil
    end
    local r2_36 = CommonUtils.ObjId2Str(r1_36)
    print(_G.LogTag, "LXZ GetMechanismUser111", r2_36)
    return r0_36.User2Mechanism[r2_36]
  end,
  HandleFish = function(r0_37, r1_37)
    -- line: [562, 617] id: 37
    if r1_37 and r1_37.UseTargetParam then
      local r2_37 = r0_37:GetRoleInfo(r1_37.Sender)
      if r2_37 then
        r2_37.IsCrouching = false
      end
      local r3_37 = r0_37:GetBornedChar(r1_37.Sender)
      if r3_37 then
        local r4_37 = r1_37.UseTargetParam.FishingRodId
        if r4_37 and r4_37 ~= 0 then
          if r3_37:GetEffectCreatureByTag("Fish"):Length() == 0 then
            local r6_37 = r1_37.UseTargetParam.CreatorId
            if r6_37 and r6_37 ~= 0 then
              local r7_37 = UE4.UGameplayStatics.GetGameState(r0_37)
              local r8_37 = r7_37.StaticCreatorMap:Find(r6_37)
              local r9_37 = nil
              if r8_37 and r8_37.ChildEids:Length() > 0 then
                r9_37 = r7_37.Battle:GetEntity(r8_37.ChildEids:GetRef(1))
              else
                r9_37 = r7_37.ManualActiveCombat:Find(r6_37)
              end
              if r9_37 then
                UDataSetFunctionLibrary.SetVector_ByEid(r7_37.Battle, r3_37.Eid, "FishPoint_Location", r9_37.FishPoint:K2_GetComponentLocation())
              end
            end
            r3_37:AsyncCreateEffectCreature(30101, FTransform(), true, nil)
          end
          r3_37:AddTimer(0.1, function()
            -- line: [591, 593] id: 38
            r0_37:UpdateFishingRodModelId(r3_37, r4_37)
          end, true, -0.1, "UpdateFishingRodModelId", false, r4_37)
        end
        local r5_37 = r1_37.UseTargetParam.FishId
        if r5_37 and r5_37 ~= 0 then
          local r6_37 = DataMgr.FishingMontage[r5_37]
          if r6_37 and r6_37.MontageName then
            if r3_37.FishMontageId ~= r5_37 then
              r3_37.FishMontageId = r5_37
              r3_37:PlayActionMontage("Interactive/Fishing", r6_37.MontageName, {}, false)
            end
          else
            local r7_37 = r3_37.Mesh:GetAnimInstance()
            local r8_37 = r7_37:GetCurrentActiveMontage()
            if r8_37 then
              r7_37:Montage_Stop(0, r8_37)
              r3_37:RemoveTimer("UpdateFishingRodModelId")
              r3_37:RemoveEffectCreature(30101)
            end
            r3_37.FishMontageId = r5_37
          end
        end
        -- close: r4_37
      end
      -- close: r2_37
    end
  end,
  UpdateFishingRodModelId = function(r0_39, r1_39, r2_39)
    -- line: [619, 638] id: 39
    local r3_39 = DataMgr.FishingRod[r2_39].EffectCreatureId
    local r4_39 = r1_39:GetEffectCreatureByTag("Fish")
    if r4_39:Length() == 0 then
      return 
    end
    r1_39:RemoveTimer("UpdateFishingRodModelId")
    for r9_39, r10_39 in pairs(r3_39) do
      for r15_39, r16_39 in pairs(r4_39) do
        if r10_39 == r16_39.EffectCreatureId then
          local r17_39 = DataMgr.FishingRod[r2_39]
          local r19_39 = r17_39.MaterialPath
          local r20_39 = r17_39.MaterialParam
          r1_39:UpdateEffectCreatureModel(r10_39, r17_39.MeshResourceId)
          r0_39:UpdateFishingRodMaterial(r1_39, r10_39, r19_39, r20_39)
        end
      end
      -- close: r11_39
    end
    -- close: r5_39
  end,
  UpdateFishingRodMaterial = function(r0_40, r1_40, r2_40, r3_40, r4_40)
    -- line: [640, 661] id: 40
    if not r1_40.EffectCreatures or not r1_40.EffectCreatures[r2_40] then
      return 
    end
    local r5_40 = r1_40.EffectCreatures[r2_40]
    for r9_40 = #r5_40, 1, -1 do
      local r10_40 = r5_40[r9_40]
      if IsValid(r10_40) then
        if r3_40 then
          r10_40.SkeletalMesh:SetMaterial(0, LoadObject(r3_40))
        end
        r10_40.FishMaterial = r10_40.SkeletalMesh:CreateAndSetMaterialInstanceDynamic(0)
        r10_40.SkeletalMesh:SetMaterial(0, r10_40.FishMaterial)
        if r4_40 then
          r10_40.FishMaterial:SetScalarParameterValue("PartSelect", r4_40)
        end
      else
        table.remove(r5_40, r9_40)
      end
    end
  end,
  HandleDelivery = function(r0_41, r1_41)
    -- line: [665, 694] id: 41
    local r3_41 = CommonConst.OnlineState.UseDelivery
    if r1_41.State == r3_41 then
      if r0_41.DeliveryStates then
        r3_41 = r1_41.Sender
        r0_41.DeliveryStates[r3_41] = true
      end
      DebugPrint("zwk Component:HandleSwitchOnlineState BeginDelivery")
      r3_41 = r1_41.Sender
      local r2_41 = r0_41.OtherRoleInfo[r3_41]
      if r2_41 then
        r2_41.IsCrouching = false
        r3_41 = r0_41:GetBornedChar(r1_41.Sender)
        if r3_41 then
          local function r4_41()
            -- line: [677, 680] id: 42
            r3_41:SetActorHideTag("DeliveryMontage", true)
          end
          r3_41:PlayTeleportAction({
            OnNotifyBegin = r4_41,
          }, false, true, false)
          r3_41:AddTimer(3, r4_41, false, 0, "DeliveryHide_" .. r1_41.Sender)
        end
        -- close: r3_41
      end
    else
      r3_41 = CommonConst
      r3_41 = r3_41.OnlineState
      r3_41 = r3_41.Normal
      if r1_41.State == r3_41 then
        r3_41 = CommonConst
        r3_41 = r3_41.OnlineState
        r3_41 = r3_41.UseDelivery
        if r1_41.PreState == r3_41 then
          r3_41 = "zwk Component:HandleSwitchOnlineState EndDelivery"
          DebugPrint(r3_41)
          r0_41:PlayEndDelivery(r1_41.Sender)
        end
      end
    end
  end,
  PlayEndDelivery = function(r0_43, r1_43)
    -- line: [696, 714] id: 43
    if r0_43.OtherRoleInfo[r1_43] then
      local r3_43 = r0_43:GetBornedChar(r1_43)
      if r3_43 and r0_43.DeliveryStates and r0_43.DeliveryStates[r1_43] then
        DebugPrint("zwk Component:HandleSwitchOnlineState 播放落地动作 ", r3_43:GetName(), r0_43.DeliveryStates)
        r3_43:RemoveTimer("DeliveryHide_" .. r1_43)
        r3_43:SetActorHideTag("DeliveryMontage", false)
        r3_43:PlayTeleportAction({}, false, true, false)
        r3_43.Mesh:GetAnimInstance():Montage_JumpToSection("End")
        if r0_43.DeliveryStates then
          r0_43.DeliveryStates[r1_43] = false
        end
      end
    end
  end,
  TryPlayEndDelivery = function(r0_44, r1_44, r2_44)
    -- line: [716, 721] id: 44
    if r0_44.DeliveryStates and r0_44.DeliveryStates[r1_44] then
      r0_44:PlayEndDelivery(r1_44)
    end
  end,
  RequestDeadRegionOnlineItem = function(r0_45, r1_45, r2_45, r3_45)
    -- line: [730, 739] id: 45
    print(_G.LogTag, "LXZ RequestDeadRegionOnlineItem2222")
    r0_45:CallServer("RequestDeadRegionOnlineItem", function(r0_46)
      -- line: [732, 737] id: 46
      r0_45.logger.debug("ZJT_ RequestDeadRegionOnlineItem ", r0_46, r1_45, ExpressionId)
      if r0_46 == 0 then
        r0_45:RealDeadRegionOnlineItem(r3_45, r2_45, false)
      end
    end, r1_45, r3_45)
  end,
  RequestChangeRegionOnlineItemState = function(r0_47, r1_47, r2_47, r3_47, r4_47, r5_47, r6_47)
    -- line: [745, 775] id: 47
    ScreenPrint("客户端发起联机动作申请 RequestChangeRegionOnlineItemState online_type：" .. tostring(r1_47) .. " ，UniqueId：" .. tostring(r2_47) .. " ，OwnerEid：" .. CommonUtils.ObjId2Str(r3_47) .. " ，InteractiveId：" .. tostring(r4_47) .. " ，NewState：" .. tostring(r5_47))
    r0_47.logger.debug("ZJT_ RequestChangeRegionOnlineItemState ", r1_47, r2_47, r3_47, r4_47, r5_47, CommonUtils.ObjId2Str(r3_47))
    r0_47:CallServer("RequestChangeRegionOnlineItemState", function(r0_48, r1_48)
      -- line: [748, 773] id: 48
      local r2_48 = UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
      if r2_48 then
        r2_48.WaitRegionOnlineSeatCB = false
      end
      if r0_48 == 0 then
        EventManager:FireEvent(EventID.OnReceivedOnlineActionApplicationAgree, r3_47, r2_47, r4_47)
        r0_47:RealInteractive({
          UniqueId = r2_47,
          InteractiveId = r4_47,
          Sender = r1_48.SenderEid,
          RequestEid = r1_48.SenderEid,
          IsGlobalOnlineItem = r6_47,
        })
        ScreenPrint("联机动作申请成功")
      elseif r0_48 == 52015 or r0_48 == 52025 then
        ScreenPrint("联机动作申请超时拒绝")
        EventManager:FireEvent(EventID.OnReceivedOnlineActionApplicationReject, r3_47, r2_47, r4_47)
      else
        ScreenPrint("联机动作申请失败 错误码：" .. tostring(r0_48))
      end
      r0_47.logger.debug("ZJT_ RequestChangeRegionOnlineItemState Callback ", r0_48, r1_47, r2_47, r3_47, r4_47, r5_47)
    end, r1_47, r2_47, r3_47, r4_47, r5_47)
  end,
  RequestLeaveRegionOnlineItem = function(r0_49, r1_49, r2_49, r3_49, r4_49)
    -- line: [780, 795] id: 49
    Traceback()
    r0_49.logger.debug("ZJT_ RequestLeaveRegionOnlineItem ", r1_49, r2_49, CommonUtils.ObjId2Str(r3_49), r4_49, CommonUtils.ObjId2Str(r3_49))
    r0_49:CallServer("RequestLeaveRegionOnlineItem", function(r0_50)
      -- line: [783, 793] id: 50
      r0_49.logger.debug("ZJT_ RequestLeaveRegionOnlineItem CallBack ", r0_50, r1_49, r2_49, r3_49, r4_49)
      if r0_50 == 0 then
        r0_49:RealDeInteractive({
          Sender = r0_49.Eid,
          UniqueId = r2_49,
          InteractiveId = r4_49,
        })
      end
    end, r1_49, r2_49, r3_49, r4_49)
  end,
  RequestUseOwnerRegionOnlineItem = function(r0_51, r1_51, r2_51, r3_51)
    -- line: [800, 805] id: 51
    ScreenPrint("收到申请 RequestUseOwnerRegionOnlineItem RequestEid：" .. tostring(CommonUtils.ObjId2Str(r1_51)) .. " ，UniqueId：" .. tostring(r2_51) .. " ，InteractiveId：" .. tostring(r3_51))
    EventManager:FireEvent(EventID.ReceivedOthersOnlineActionApplication, r1_51, r2_51, r3_51)
    r0_51.logger.debug("ZJT_ 111 RequestUseOwnerRegionOnlineItem ", CommonUtils.ObjId2Str(r1_51))
  end,
  OnRequestUseOwnerRegionOnlineItem = function(r0_52, r1_52, r2_52, r3_52, r4_52)
    -- line: [808, 819] id: 52
    ScreenPrint("回复申请 OnRequestUseOwnerRegionOnlineItem RequestEid：" .. tostring(CommonUtils.ObjId2Str(r1_52)) .. " ，RequestRes：" .. tostring(r2_52) .. " ，UniqueId：" .. tostring(r3_52) .. " ，InteractiveId：" .. tostring(r4_52))
    r0_52:CallServer("OnRequestUseOwnerRegionOnlineItem", function(r0_53, r1_53, r2_53, r3_53, r4_53)
      -- line: [810, 817] id: 53
      ScreenPrint("回复申请 OnRequestUseOwnerRegionOnlineItem 服务端返回结果 Ret：" .. tostring(r0_53) .. " ，UniqueId：" .. tostring(r3_53) .. " ，InteractiveId：" .. tostring(r4_53))
      r0_52.logger.debug("ZJT_ OnRequestUseOwnerRegionOnlineItem ", r0_53, r0_52.CurrentOnlineType, r2_53, r3_53, r4_53)
      if r0_53 ~= 0 then
        require("BluePrints.UI.WBP.BattleOnlineAction.OnlineActionController"):ShowToastByErrorCode(r0_53, false)
      end
    end, r0_52.CurrentOnlineType, r1_52, r2_52, r3_52, r4_52)
  end,
  UseCreateMechanism = function(r0_54, r1_54, r2_54, r3_54, r4_54)
    -- line: [824, 854] id: 54
    if not r4_54 then
      r4_54 = {}
    end
    local r5_54 = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
    local r6_54 = r5_54:GetRecentSafeLocation()
    r6_54.Z = r6_54.Z - r5_54.CapsuleComponent:GetScaledCapsuleHalfHeight()
    local r9_54 = {
      ResourceId = r2_54,
      UnitId = r3_54,
      Location = CommonUtils.LocationToTable(r6_54),
      Rotation = CommonUtils.RotationToTable(r5_54:K2_GetActorRotation()),
      CreateMechanism = r4_54,
      UnitType = "Mechanism",
    }
    r0_54:CallServer("UseCreateMechanism", function(r0_55, r1_55)
      -- line: [839, 852] id: 55
      if r0_55 == 0 then
        r9_54.Sender = r0_54.Eid
        r9_54.UniqueId = r1_55
        if r5_54.PlayerAnimInstance and r5_54.PlayerAnimInstance.IdleTagName == "Gesture01_Idle" then
          r0_54:RealCreateMechanism(r9_54)
          require("BluePrints.UI.WBP.BattleOnlineAction.OnlineActionController"):OnCreatOnlineAction(r1_55)
        else
          r0_54:RequestDeadRegionOnlineItem(r0_54.CurrentOnlineType, r0_54.Eid, r1_55)
        end
      end
      r0_54.logger.debug("ZJT_ UseCreateMechanism ", r0_55, r1_54, r2_54, r1_55)
    end, r1_54, r9_54)
  end,
  SwitchOnlineState = function(r0_56, r1_56, r2_56, r3_56, r4_56)
    -- line: [857, 875] id: 56
    if r4_56 == nil then
      r4_56 = true
    end
    local r5_56 = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
    if r0_56.IsInRegionOnline then
      r5_56.CurrentOnlineState = r2_56 and CommonConst.OnlineState.Normal
    end
    local r6_56 = {
      Type = "SwitchOnlineState",
      State = r2_56 and CommonConst.OnlineState.Normal,
      UseTargetParam = r3_56 and {},
      IsUpdateState = r4_56,
      ActionBaseInfo = r5_56:GetPlayerLocationAndRotation(),
    }
    DebugPrint("gmy@OnlineComp Component:SwitchOnlineState", r2_56)
    r0_56:UploadPlayerMessage(r1_56, r6_56)
  end,
  UseGouSuoMessage = function(r0_57, r1_57, r2_57)
    -- line: [877, 883] id: 57
    r0_57:UploadPlayerMessage(r1_57, {
      Type = "UseGouSuo",
      CreatorId = r2_57,
    })
  end,
  HandleUseGouSuo = function(r0_58, r1_58)
    -- line: [885, 902] id: 58
    local r2_58 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
    local r3_58 = r2_58.StaticCreatorMap:FindRef(r1_58.CreatorId)
    if not r3_58 then
      return 
    end
    local r4_58 = r0_58:GetBornedChar(r1_58.Sender)
    if not r4_58 then
      return 
    end
    for r8_58 = 1, r3_58.ChildEids:Length(), 1 do
      local r10_58 = r2_58.Battle:GetEntity(r3_58.ChildEids:GetRef(r8_58))
      if r10_58 then
        r10_58.HookInteractiveComponent:StartInteractive(r4_58)
      end
    end
  end,
  RequestUseCreateMount = function(r0_59, r1_59, r2_59, r3_59, r4_59)
    -- line: [905, 906] id: 59
  end,
  RequestHostInvitationOther = function(r0_60, r1_60, r2_60, r3_60, r4_60)
    -- line: [910, 928] id: 60
    ScreenPrint("客户端发起邀请 RequestHostInvitationOther InvitationEid：" .. CommonUtils.ObjId2Str(r1_60) .. " ，UniqueId：" .. tostring(r2_60) .. " ，InteractiveId：" .. tostring(r3_60) .. " ，NewState：" .. tostring(r4_60))
    r0_60:CallServer("RequestHostInvitationOther", function(r0_61)
      -- line: [912, 926] id: 61
      ScreenPrint("客户端发起邀请结果 Ret：" .. tostring(r0_61) .. " ，UniqueId：" .. tostring(r2_60) .. " ，InteractiveId：" .. tostring(r3_60) .. " ，NewState：" .. tostring(r4_60))
      if r0_61 == 52015 or r0_61 == 52025 then
        EventManager:FireEvent(EventID.OnReceivedOnlineActionInvitationReject, r1_60, r2_60, r3_60, r4_60)
      elseif r0_61 == 0 then
        EventManager:FireEvent(EventID.OnReceivedOnlineActionInvitationAgree, r1_60, r2_60, r3_60, r4_60)
      elseif r0_61 == 52024 then
        UIManager(r0_60):ShowUITip(UIConst.Tip_CommonToast, GText("UI_RegionOnline_Invite_Inviting"))
      else
        ScreenPrint("客户端发起邀请结果 未知错误 Ret：" .. tostring(r0_61) .. " ，UniqueId：" .. tostring(r2_60) .. " ，InteractiveId：" .. tostring(r3_60) .. " ，NewState：" .. tostring(r4_60))
      end
      r0_60.logger.debug("ZJT_ RequestHostInvitationOther ", r0_61)
    end, r0_60.CurrentOnlineType, r0_60.Eid, r1_60, r2_60, r3_60, r4_60 and 1)
  end,
  OnRequestOtherUserRegionOnlineItem = function(r0_62, r1_62, r2_62, r3_62, r4_62)
    -- line: [933, 954] id: 62
    ScreenPrint("回复邀请 OnRequestOtherUserRegionOnlineItem  InviterEid：" .. CommonUtils.ObjId2Str(r1_62) .. " ，RequestRes：" .. tostring(r2_62) .. " ，UniqueId：" .. tostring(r3_62) .. " ，InteractiveId：" .. tostring(r4_62))
    r0_62:CallServer("OnRequestOtherUserOnlineItem", function(r0_63)
      -- line: [935, 952] id: 63
      ScreenPrint("回复邀请结果 Ret：" .. tostring(r0_63) .. " ，UniqueId：" .. tostring(r3_62) .. " ，InteractiveId：" .. tostring(r4_62))
      r0_62.logger.debug("ZJT_ OnRequestOtherUserRegionOnlineItem ", r0_63, r0_62.CurrentOnlineType, r2_62)
      if r0_63 == 0 then
        r0_62:RealInteractive({
          UniqueId = r3_62,
          InteractiveId = r4_62,
          Sender = r0_62.Eid,
          RequestEid = r0_62.Eid,
          IsGlobalOnlineItem = false,
        })
        EventManager:FireEvent(EventID.OnReceivedOnlineActionInvitationAgree, r1_62, r3_62, r4_62)
      else
        require("BluePrints.UI.WBP.BattleOnlineAction.OnlineActionController"):ShowToastByErrorCode(r0_63, true)
      end
    end, r0_62.CurrentOnlineType, r1_62, r2_62, r3_62, r4_62)
  end,
  RequestOtherUserRegionOnlineItem = function(r0_64, r1_64, r2_64, r3_64)
    -- line: [959, 965] id: 64
    ScreenPrint("客户端收到邀请 RequestOtherUserRegionOnlineItem OwnerEid：" .. CommonUtils.ObjId2Str(r1_64) .. " ，UniqueId：" .. tostring(r2_64) .. " ，InteractiveId：" .. tostring(r3_64))
    EventManager:FireEvent(EventID.ReceivedOthersOnlineActionInvitation, r1_64, r2_64, r3_64)
  end,
  RequestDeadRegionOnlineMount = function(r0_65, r1_65, r2_65)
    -- line: [969, 974] id: 65
    r0_65:CallServer("RequestDeadRegionOnlineMount", function(r0_66)
      -- line: [970, 972] id: 66
      r0_65.logger.debug("ZJT_ RequestDeadRegionOnlineMount ", r0_66)
    end, r1_65, r2_65)
  end,
  RequestChangeRegionOnlineMount = function(r0_67, r1_67, r2_67, r3_67)
    -- line: [976, 981] id: 67
    r0_67:CallServer("RequestDeadRegionOnlineMount", function(r0_68)
      -- line: [977, 979] id: 68
      r0_67.logger.debug("ZJT_ RequestDeadRegionOnlineMount ", r0_68)
    end, r1_67, r2_67, r3_67)
  end,
  HandleOnChangeRegionOnlineMount = function(r0_69, r1_69)
    -- line: [983, 985] id: 69
    PrintTable({
      OnChangeRegionOnlineMount = r1_69,
    }, 10)
  end,
  RequestSendSuccess = function(r0_70, r1_70)
    -- line: [987, 997] id: 70
    r0_70.logger.debug("ZJT_ 请求发送成功 ", r1_70)
    if r1_70 == "OtherUser" then
      UIManager(r0_70):ShowUITip(UIConst.Tip_CommonToast, GText("UI_RegionOnline_Invitation_Sent"))
      return 
    end
    if r1_70 == "UseOwner" then
      return 
    end
  end,
  HandleShareMountDatasChange = function(r0_71, r1_71)
    -- line: [1001, 1002] id: 71
  end,
  HandleOnDeadRegionOnlineMount = function(r0_72, r1_72)
    -- line: [1004, 1005] id: 72
  end,
  HandleOnUseCreateMount = function(r0_73, r1_73)
    -- line: [1007, 1008] id: 73
  end,
  HandleOnLeaveRegionOnlineItem = function(r0_74, r1_74)
    -- line: [1010, 1017] id: 74
    r0_74.logger.debug("ZJT_ HandleOnLeaveRegionOnlineItem " .. CommonUtils.ObjId2Str(r0_74.Eid))
    PrintTable({
      message = r1_74,
    }, 10)
    if r1_74.Sender == r0_74.Eid then
      return 
    end
    r0_74:RealDeInteractive(r1_74)
  end,
  HandleOnUseRegionOnlineItem = function(r0_75, r1_75)
    -- line: [1019, 1023] id: 75
    r0_75.logger.debug("ZJT_ HandleOnUseRegionOnlineItem ")
    PrintTable({
      message = r1_75,
    }, 10)
    r0_75:RealCreateMechanism(r1_75)
  end,
  HandleOnChangeRegionOnlineItemState = function(r0_76, r1_76)
    -- line: [1025, 1032] id: 76
    r0_76.logger.debug("ZJT_ HandleOnChangeRegionOnlineItemState " .. CommonUtils.ObjId2Str(r0_76.Eid))
    PrintTable({
      message = r1_76,
    }, 10)
    if r1_76.Sender == r0_76.Eid then
      return 
    end
    r0_76:RealInteractive(r1_76)
  end,
  HandleOnDeadRegionOnlineItem = function(r0_77, r1_77)
    -- line: [1034, 1039] id: 77
    print(_G.LogTag, "LXZ RequestDeadRegionOnlineItem3333")
    r0_77.logger.debug("ZJT_ HandleOnDeadRegionOnlineItem ")
    PrintTable({
      message = r1_77,
    }, 10)
    r0_77:RealDeadRegionOnlineItem(r1_77.UniqueId, r1_77.Sender, false)
  end,
  RealCreateMechanism = function(r0_78, r1_78)
    -- line: [1041, 1060] id: 78
    local r2_78 = r1_78.Location
    local r3_78 = r1_78.Rotation
    local r4_78 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
    local r5_78 = AEventMgr.CreateUnitContext()
    r5_78.UnitType = "Mechanism"
    r5_78.UnitId = r1_78.UnitId
    r5_78.Loc = FVector(r2_78.X, r2_78.Y, r2_78.Z)
    r5_78.Rotation = FRotator(r3_78.Pitch, r3_78.Yaw, r3_78.Roll)
    local r6_78 = CommonUtils.ObjId2Str(r1_78.Sender)
    local r7_78 = r1_78.ResourceId
    r5_78.NameParams:Add("Sender", r6_78)
    r5_78.NameParams:Add("UniqueId", r1_78.UniqueId)
    r5_78.IntParams:Add("ResourceId", r7_78)
    print(_G.LogTag, "LXZ ResourceUseEffectCreateMechanism Real", r5_78.UnitId, r6_78, r0_78.Eid)
    r4_78.EventMgr:CreateUnitNew(r5_78, true)
    r4_78:RegisterPlayerMechanismRegionOnline(r6_78, r1_78.UniqueId)
  end,
  RealInteractive = function(r0_79, r1_79)
    -- line: [1062, 1094] id: 79
    PrintTable(r1_79, 10)
    r0_79:UpdateMechanismUser(r1_79.UniqueId, r1_79.InteractiveId, r1_79.Sender, true)
    local r2_79 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
    local r3_79 = nil
    if r1_79.RequestEid then
      if r1_79.RequestEid == r0_79.Eid then
        r3_79 = UGameplayStatics.GetPlayerCharacter(r2_79, 0)
      else
        r3_79 = r0_79:GetBornedChar(r1_79.RequestEid)
      end
    else
      r3_79 = r0_79:GetBornedChar(r1_79.Sender)
    end
    local r4_79 = r2_79.RegionOnlineMechanismMap:Find(r1_79.UniqueId)
    print(_G.LogTag, "LXZ HandleOnChangeRegionOnlineItemState111", r1_79.UniqueId, r4_79, r1_79.IsGlobalOnlineItem)
    if r1_79.Sender == r0_79.Eid then
      if not r3_79 or not r4_79 or not r4_79:IsCanOnlineInteractive(r3_79) then
        r0_79:RequestLeaveRegionOnlineItem(r0_79.CurrentOnlineType, r1_79.UniqueId, r0_79.Eid, r1_79.InteractiveId)
        return 
      end
      local r5_79 = r4_79.ChestInteractiveComponent
      print(_G.LogTag, "LXZ HandleOnChangeRegionOnlineItemState222", r4_79.Eid, r3_79.Eid, r5_79.NextStateId, r5_79.CommonUIConfirmID, r1_79.InteractiveId)
      r3_79:InteractiveMechanism(r4_79.Eid, r3_79.Eid, r5_79.NextStateId, r5_79.CommonUIConfirmID, true, r1_79.InteractiveId)
    else
      if not r4_79 then
        return 
      end
      local r5_79 = r4_79.ChestInteractiveComponent
      print(_G.LogTag, "LXZ HandleOnChangeRegionOnlineItemState333", r4_79.Eid, r3_79.Eid, r5_79.NextStateId, r5_79.CommonUIConfirmID, r1_79.InteractiveId)
      r3_79:InteractiveMechanism(r4_79.Eid, r3_79.Eid, r5_79.NextStateId, r5_79.CommonUIConfirmID, true, r1_79.InteractiveId)
    end
  end,
  RealDeInteractive = function(r0_80, r1_80)
    -- line: [1096, 1114] id: 80
    r0_80:UpdateMechanismUser(r1_80.UniqueId, r1_80.InteractiveId, r1_80.Sender, false)
    local r2_80 = UE4.UGameplayStatics.GetGameState(GWorld.GameInstance)
    local r3_80 = r0_80:GetBornedChar(r1_80.Sender)
    if r1_80.Sender == r0_80.Eid then
      r3_80 = UGameplayStatics.GetPlayerCharacter(r2_80, 0)
    end
    local r4_80 = r2_80.RegionOnlineMechanismMap:Find(r1_80.UniqueId)
    print(_G.LogTag, "LXZ HandleOnLeaveRegionOnlineItem RealDeInteractive", r1_80.UniqueId, r4_80:GetName())
    if not r3_80 then
      return 
    end
    if not r4_80 then
      return 
    end
    print(_G.LogTag, "LXZ HandleOnLeaveRegionOnlineItem RealDeInteractive", r1_80.UniqueId, r4_80:GetName(), r3_80:GetName())
    r3_80:DeInteractiveMechanism(r4_80.Eid, r3_80.Eid, 0, true, r4_80.ChestInteractiveComponent.NextStateId, true, r1_80.InteractiveId)
  end,
  RealDeadRegionOnlineItem = function(r0_81, r1_81, r2_81, r3_81)
    -- line: [1116, 1132] id: 81
    local r4_81 = UGameplayStatics.GetGameState(GWorld.GameInstance)
    local r5_81 = CommonUtils.ObjId2Str(r2_81)
    if not r3_81 then
      r4_81:RemoveMechanismRegionOnline(r1_81, EDestroyReason.OwnerTagChange)
      r4_81:RemovePlayerMechanismRegionOnline(r5_81, r1_81, false)
    else
      local r6_81 = r4_81.PlayerRegionOnlineMechanismMap:Find(r5_81)
      if not r6_81 then
        return 
      end
      for r11_81, r12_81 in pairs(r6_81.Array) do
        r4_81:RemoveMechanismRegionOnline(r12_81, EDestroyReason.OwnerLeaveRegion)
      end
      -- close: r7_81
      r4_81:RemovePlayerMechanismRegionOnline(r5_81, "", true)
    end
  end,
  GetBornedChar = function(r0_82, r1_82)
    -- line: [1138, 1146] id: 82
    local r2_82 = UE4.URegionSyncSubsystem.GetInstance(GWorld.GameInstance)
    if not r2_82 then
      return nil
    end
    return r2_82:GetBornedChar(CommonUtils.ObjId2Str(r1_82))
  end,
  GetRoleInfo = function(r0_83, r1_83)
    -- line: [1148, 1150] id: 83
    return r0_83.OtherRoleInfo[r1_83]
  end,
  GetRoleBornedEid = function(r0_84, r1_84)
    -- line: [1152, 1160] id: 84
    local r2_84 = UE4.URegionSyncSubsystem.GetInstance(GWorld.GameInstance)
    if not r2_84 then
      return nil
    end
    return r2_84:GetEntityEid(CommonUtils.ObjId2Str(r1_84))
  end,
  UpdateTotatlOnlineTime = function(r0_85)
    -- line: [1162, 1164] id: 85
    r0_85.logger.debug("ZJT_ UpdateTotatlOnlineTime ", r0_85.TotalRegionOnlineTime)
  end,
}
