-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\BloodBar\WBP_Battle_Teammate_PC.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("BluePrints.UI.BloodBar.BloodBarUtils")
local r1_0 = Class("BluePrints.UI.BP_UIState_C")
function r1_0.Initialize(r0_1, r1_1)
  -- line: [13, 36] id: 1
  r0_1.Super.Initialize(r0_1)
  r0_1.MaxHp = 0
  r0_1.CurHp = 0
  r0_1.LastHp = 0
  r0_1.MaxShield = 0
  r0_1.CurShield = 0
  r0_1.LastShield = 0
  r0_1.CurOverShield = 0
  r0_1.LastOverShield = 0
  r0_1.Owner = nil
  r0_1.HpBar = nil
  r0_1.ShieldBar = nil
  r0_1.BarLength = 0
  r0_1.RoleId = 0
  r0_1.Eid = 0
  r0_1.LowHpPercent = 0.3
  r0_1.BloodState = {}
end
function r1_0.InitConfig(r0_2, r1_2)
  -- line: [38, 74] id: 2
  if not IsValid(r1_2) then
    return 
  end
  r0_2.Owner = r1_2
  r0_2.RoleId = r1_2.CurrentRoleId
  r0_2.Eid = r1_2.Eid
  r0_2:ClearBloodAllState(r0_2.Eid)
  r0_2:InitValue()
  r0_2.Group_HPBarRoot:ClearChildren()
  r0_2.Group_ShieldRoot:ClearChildren()
  r0_2:LoadHpBar()
  r0_2:CheckAndLoadShieldBar()
  r0_2:SetName()
  r0_2:SetImage(false)
  r0_2:UpdateCharBuffUI()
  r0_2:BindToAnimationFinished(r0_2.In, {
    r0_2,
    function()
      -- line: [54, 69] id: 3
      r0_2:UnbindAllFromAnimationFinished(r0_2.In)
      local r1_3 = UE4.USlateBlueprintLibrary.GetLocalSize(r0_2.Group_HPBarRoot:GetTickSpaceGeometry())
      if r0_2.HpBar then
        r0_2.HpBar:SetLength(r1_3.X)
        r0_2.HpBar:SetHeight(r1_3.Y)
      end
      if r0_2.ShieldBar then
        r0_2.ShieldBar:SetLength(r1_3.X * 0.98)
        r0_2.ShieldBar:SetHeight(r1_3.Y)
      end
    end
  })
  r0_2:InitUISettingByPlatform()
  r0_2:PlayAnimation(r0_2.In)
  r0_2.IsDestroied = nil
  r0_2:InitShortageUI()
end
function r1_0.InitWithOutCharacter(r0_4, r1_4)
  -- line: [76, 94] id: 4
  r0_4.RoleId = r1_4.CharId
  r0_4.Eid = r1_4.Eid
  r0_4.MaxShield = 1
  r0_4:SetName(r1_4)
  r0_4:SetImage(r1_4.TeamRecoveryState ~= ETeamRecoveryState.Alive)
  if not IsValid(Battle(r0_4):GetEntity(r0_4.Eid)) then
    r0_4:AddBloodState(r0_4.Eid, r0_0.AllBloodState.OverReach)
  else
    r0_4:RemoveBloodState(r0_4.Eid, r0_0.AllBloodState.OverReach)
  end
  r0_4:CheckAndLoadShieldBar()
  r0_4:LoadHpBar()
  r0_4.HpBar:SetBarPercent(1)
  r0_4.ShieldBar:SetBarPercent(1)
  r0_4:PlayAnimation(r0_4.In)
  r0_4.IsDestroied = nil
end
function r1_0.SetNameMaterial(r0_5, r1_5)
  -- line: [96, 110] id: 5
  UResourceLibrary.LoadObjectAsync(r0_5, tostring(r1_5), {
    r0_5,
    function(r0_6, r1_6)
      -- line: [99, 108] id: 6
      if not IsValid(r0_6) then
        return 
      end
      local r2_6 = Battle(r0_5):GetEntity(r0_5.Eid)
      if not IsValid(r2_6) then
        return 
      end
      if r2_6:IsPhantom() and r1_5 ~= r0_5.NameMaterial_Phantom then
        return 
      end
      if r2_6:IsPlayer() and r1_5 ~= r0_5.NameMaterial_Player then
        return 
      end
      local r3_6 = r0_5.Text_Name.Font
      r3_6.FontMaterial = r1_6
      r0_5.Text_Name:SetFont(r3_6)
    end
  })
end
function r1_0.InitValue(r0_7, r1_7)
  -- line: [112, 132] id: 7
  local r2_7 = r0_7.Owner
  if not IsValid(r2_7) then
    return 
  end
  r0_7.MaxHp = r2_7:GetAttr("MaxHp")
  r0_7.CurHp = r2_7:GetAttr("Hp")
  r0_7.LastHp = r0_7.CurHp
  r0_7.MaxShield = r2_7:GetAttr("MaxES") and 0
  r0_7.CurShield = r2_7:GetAttr("ES") and 0
  r0_7.LastShield = r0_7.CurShield
  r0_7.CurOverShield = r2_7:GetAttr("OverShield") and 0
  r0_7.LastOverShield = r0_7.CurOverShield
  local r3_7 = r0_7.BloodState
  local r4_7 = r0_0.AllBloodState.Dead
  local r5_7 = r2_7:IsDead()
  if r5_7 then
    r5_7 = 1 and nil
  else
    goto label_52	-- block#10 is visited secondly
  end
  r3_7[r4_7] = r5_7
  if r1_7 == nil then
    r0_7:SetImage(r2_7:IsDead())
  else
    r0_7:SetImage(r1_7)
  end
end
function r1_0.InitUISettingByPlatform(r0_8)
  -- line: [134, 145] id: 8
  if CommonUtils.GetDeviceTypeByPlatformName(r0_8) == "Mobile" then
    local r1_8 = GWorld:GetAvatar()
    if not GWorld:IsStandAlone() then
      r0_8.Button_Area.OnClicked:Clear()
      r0_8.Button_Area.OnClicked:Add(r0_8, r0_8.OpenTeamInfo)
      r0_8.Button_Area:SetVisibility(UE4.ESlateVisibility.Visible)
    else
      r0_8.Button_Area:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
end
function r1_0.ReInit(r0_9)
  -- line: [147, 150] id: 9
  r0_9:InitValue()
  r0_9:UpdateBar()
end
function r1_0.UpdateBar(r0_10)
  -- line: [152, 208] id: 10
  if not IsValid(r0_10.Owner) then
    return 
  end
  r0_10.LastHp = r0_10.CurHp
  r0_10.LastShield = r0_10.CurShield
  r0_10.LastOverShield = r0_10.CurOverShield
  r0_10.CurHp = r0_10.Owner:GetAttr("Hp") and 0
  r0_10.CurShield = r0_10.Owner:GetAttr("ES") and 0
  r0_10.CurOverShield = r0_10.Owner:GetAttr("OverShield") and 0
  local r1_10 = r0_10.LastHp < r0_10.CurHp
  if r0_10.MaxShield > 0 and r0_10.ShieldBar then
    r0_10.ShieldBar:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    local r2_10 = math.clamp(r0_10.CurShield / r0_10.MaxShield, 0, 1)
    if r0_10.LastShield < r0_10.CurShield then
      r0_10.ShieldBar:SetBarPercent(r2_10, false)
      r0_10.ShieldBar:PlayRecoveryShield()
    else
      r0_10.ShieldBar:SetBarPercent(r2_10)
    end
  end
  if r0_10.HpBar then
    r0_10.HpBar:SetBarPercent(math.clamp(r0_10.CurHp / r0_10.MaxHp, 0, 1))
  end
  if r0_10.ShieldBar and r0_10.MaxShield > 0 then
    local r2_10 = math.clamp(r0_10.CurOverShield / r0_10.MaxShield, 0, 1)
    if r0_10.CurOverShield <= r0_10.LastOverShield then
      r0_10.ShieldBar:SetOverShieldPercent(r2_10)
      r0_10.ShieldBar:PlayOverShieldDeduct(true)
    elseif r0_10.LastOverShield < r0_10.CurOverShield then
      r0_10.ShieldBar:SetOverShieldPercent(r2_10)
      if r0_10.LastOverShield <= 0.00001 then
        r0_10.ShieldBar:ShowOrHideOverShieldGroup(true)
        r0_10.ShieldBar:OnFirstAddOverShield()
      end
      r0_10.ShieldBar:PlayOverShieldRecover()
    end
  end
  if r1_10 then
    r0_10:PlayHealAnimation()
  end
end
function r1_0.LoadHpBar(r0_11)
  -- line: [210, 212] id: 11
  r0_11.HpBar = r0_0.LoadSubWidget(r0_11, r0_11.Group_HPBarRoot, "HPBar", false, 0)
end
function r1_0.CheckAndLoadShieldBar(r0_12)
  -- line: [214, 220] id: 12
  if r0_12.MaxShield <= 0 then
    r0_12.Group_ShieldRoot:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return 
  end
  r0_12.ShieldBar = r0_0.LoadSubWidget(r0_12, r0_12.Group_ShieldRoot, "ShieldBar", 0, 0)
end
function r1_0.SetName(r0_13, r1_13)
  -- line: [222, 291] id: 13
  r0_13.Text_Name:SetText("")
  if r0_13.Owner then
    if r0_13.Owner:IsPhantom() then
      r0_13:SetNameMaterial(r0_13.NameMaterial_Phantom)
      local r2_13 = DataMgr.BattleChar[r0_13.RoleId].CharName
      if string.find(DataMgr.TextMap_ContentEN[r2_13].ContentEN, "{nickname") and not IsStandAlone(r0_13) then
        local r3_13 = GameState(r0_13):GetPhantomState(r0_13.Owner.Eid)
        if not r3_13 then
          local r4_13 = r0_13.Owner.PhantomOwner
          if r4_13 then
            local r5_13 = GameState(r0_13):GetPlayerState(r4_13.Eid)
            if r5_13 and r5_13.PlayerName then
              r0_13.Text_Name:SetText(r5_13.PlayerName)
            end
          end
          r0_13.bPendingPhantomSetName = true
          return 
        end
        local r4_13 = r3_13.OwnerEid
        if r4_13 then
          local r5_13 = GameState(r0_13):GetPlayerState(r4_13)
          if r5_13 and r5_13.PlayerName then
            r0_13.Text_Name:SetText(r5_13.PlayerName)
          else
            r0_13.Text_Name:SetText(GText(r2_13))
            r0_13.bPendingPhantomSetName = true
            DebugPrint(ErrorTag, "WBP_Teammate_PC_C:SetName  主角魅影找不到它的OwnerPlayerName")
          end
        else
          DebugPrint(ErrorTag, "WBP_Teammate_PC_C:SetName  主角魅影找不到它的Owner， 无法赋予名称")
          r0_13.Text_Name:SetText("<ERROR>")
        end
      else
        r0_13.Text_Name:SetText(GText(r2_13))
      end
    elseif r0_13.Owner:IsPlayer() and r0_13.Owner.GetNickName then
      r0_13.Text_Name:SetText(r0_13.Owner:GetNickName())
      r0_13:SetNameMaterial(r0_13.NameMaterial_Player)
    end
  elseif r1_13 then
    if r1_13:IsA(AEMPlayerState) then
      r0_13.Text_Name:SetText(r1_13.PlayerName)
      r0_13:SetNameMaterial(r0_13.NameMaterial_Player)
    elseif r1_13:IsA(APhantomState) then
      r0_13:SetNameMaterial(r0_13.NameMaterial_Phantom)
      local r2_13 = DataMgr.BattleChar[r0_13.RoleId].CharName
      if string.find(DataMgr.TextMap_ContentEN[r2_13].ContentEN, "{nickname") and not IsStandAlone(r0_13) then
        local r4_13 = r1_13.OwnerEid
        if r4_13 then
          local r5_13 = GameState(r0_13):GetPlayerState(r4_13)
          if r5_13 and r5_13.PlayerName then
            r0_13.Text_Name:SetText(r5_13.PlayerName)
          else
            r0_13.Text_Name:SetText(GText(r2_13))
            r0_13.bPendingPhantomSetName = true
            DebugPrint(ErrorTag, "WBP_Teammate_PC_C:SetName  主角魅影找不到它的OwnerPlayerName")
          end
        else
          DebugPrint(ErrorTag, "WBP_Teammate_PC_C:SetName  主角魅影找不到它的Owner， 无法赋予名称")
          r0_13.Text_Name:SetText("<ERROR>")
        end
      else
        r0_13.Text_Name:SetText(GText(r2_13))
      end
    end
  end
end
function r1_0.OnDead(r0_14)
  -- line: [293, 298] id: 14
  r0_14:SetImage(true)
  r0_14:PlayAnimation(r0_14.LifeSwitch)
  r0_14:PlayHpBarGreyAnimation(false)
end
function r1_0.OnRecovery(r0_15, r1_15)
  -- line: [300, 325] id: 15
  if r1_15 ~= r0_15.Eid then
    return 
  end
  if not IsValid(r0_15.Owner) then
    r0_15:SetImage(false)
  end
  r0_15:InitValue(false)
  if r0_15.HpBar then
    r0_15.HpBar:ReInit()
  end
  if r0_15.ShieldBar then
    r0_15.ShieldBar:ReInit()
  end
  r0_15:PlayAnimation(r0_15.ReverseLifeSwitch)
  r0_15:PlayHpBarGreyAnimation(true)
  if r0_15.BloodState[r0_0.AllBloodState.OverReach] == nil then
    r0_15.Group_HPBarRoot:SetRenderOpacity(1)
    r0_15.Group_ShieldRoot:SetRenderOpacity(1)
    r0_15:RemoveBloodState(r0_15.Eid, r0_0.AllBloodState.OverReach)
  end
  r0_15:RemoveBloodState(r0_15.Eid, r0_0.AllBloodState.Dead)
end
function r1_0.OnTeammateRecoverStateChange(r0_16, r1_16, r2_16, r3_16)
  -- line: [327, 336] id: 16
  if r1_16 ~= r0_16.Eid then
    return 
  end
  if r2_16 == UE4.ETeamRecoveryState.Dying then
    r0_16:OnDead()
  elseif r2_16 == UE4.ETeamRecoveryState.Alive then
    r0_16:OnRecovery(r1_16)
  end
end
function r1_0.UpdateCharBuffUI(r0_17)
  -- line: [338, 343] id: 17
end
function r1_0.RefreshInvincibleState(r0_18)
  -- line: [345, 349] id: 18
  r0_18:SetInvincible(r0_18.Owner.bIsInvincible and r0_18.Owner:IsInvincible())
end
function r1_0.SetInvincible(r0_19, r1_19)
  -- line: [351, 377] id: 19
  r0_19.IsInvincibility = r1_19
  if r1_19 then
    r0_19:PlayAnimation(r0_19.Invincibility)
    r0_19.VX_Teammate_InvincibilLight:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    r0_19:StopAnimation(r0_19.Invincibility)
    r0_19:PlayAnimationReverse(r0_19.Invincibility)
    r0_19.VX_Teammate_InvincibilLight:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if r0_19.HpBar then
    if r0_19.HpBar:IsAnimationPlaying(r0_19.HpBar.Grey) then
      local r2_19 = r0_19.HpBar:IsAnimationPlayingForward(r0_19.HpBar.Grey)
      if r2_19 then
        r2_19 = 1 and 0
      else
        goto label_45	-- block#7 is visited secondly
      end
      r0_19.WaitingToPlayGreyAnim = r2_19
      r0_19.HpBar:StopAnimation(r0_19.HpBar.Grey)
    end
    r0_19.HpBar:PlayInvincibility(r1_19)
  end
  if r0_19.ShieldBar then
    r0_19.ShieldBar:PlayInvincibility(r1_19)
  end
  if not r1_19 and r0_19.WaitingToPlayGreyAnim ~= nil then
    r0_19:PlayHpBarGreyAnimation(r0_19.WaitingToPlayGreyAnim == 0)
  end
end
function r1_0.PlayHealAnimation(r0_20)
  -- line: [379, 402] id: 20
  if r0_20.CurHp == r0_20.MaxHp and r0_20.IsPlayingReturning then
    r0_20:StopReturning()
    return 
  end
  if r0_20.IsCharInHotUI then
    r0_20:UpdateCharHotUIState(true)
    return 
  end
  if not r0_20:IsAnimationPlaying(r0_20.BloodReturn) then
    r0_20:PlayAnimation(r0_20.BloodReturn)
  end
end
function r1_0.OpenTeamInfo(r0_21)
  -- line: [404, 410] id: 21
  local r1_21 = UIManager(r0_21):GetUIObj("BattleMain")
  if r1_21 ~= nil and type(r1_21.OpenTeamInfo) == "function" then
    r1_21.Team:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r1_21:OpenTeamInfo()
  end
end
function r1_0.UpdateCharHotUIState(r0_22, r1_22)
  -- line: [412, 423] id: 22
  r0_22.IsCharInHotUI = r1_22
  if r0_22.CurHp == r0_22.MaxHp and r0_22.IsPlayingReturning then
    r0_22:StopReturning()
    return 
  end
  if r1_22 then
    r0_22:StartReturing()
  else
    r0_22:StopReturning()
  end
end
function r1_0.StartReturing(r0_23)
  -- line: [425, 431] id: 23
  if not r0_23.PlayerBloodReturn then
    return 
  end
  r0_23:PlayAnimation(r0_23.BloodReturning)
  r0_23.IsPlayingReturning = true
end
function r1_0.StopReturning(r0_24)
  -- line: [433, 441] id: 24
  if not r0_24.PlayerBloodReturn then
    return 
  end
  r0_24:StopAnimation(r0_24.BloodReturning)
  r0_24:PlayAnimation(r0_24.BloodReturnEnd)
  r0_24.IsPlayingReturning = false
end
function r1_0.BuffSpecialEffect_InvincibleUI(r0_25, r1_25)
  -- line: [443, 445] id: 25
  r0_25:SetInvincible(r1_25)
end
function r1_0.SetImage(r0_26, r1_26)
  -- line: [447, 457] id: 26
  local r2_26 = "Texture2D\'/Game/UI/Texture/Dynamic/Image/Head/Mini/"
  local r3_26 = nil	-- notice: implicit variable refs by block#[3]
  if r1_26 then
    r3_26 = "T_Dead_"
    if not r3_26 then
      ::label_6::
      r3_26 = "T_Normal_"
    end
  else
    goto label_6	-- block#2 is visited secondly
  end
  local r5_26 = r3_26 .. DataMgr.BattleChar[r0_26.RoleId].GuideIconImg
  UE4.UResourceLibrary.LoadObjectAsync(r0_26, r2_26 .. r5_26 .. "." .. r5_26 .. "\'", {
    r0_26,
    r1_0.LoadImageFinish
  })
end
function r1_0.LoadImageFinish(r0_27, r1_27)
  -- line: [459, 467] id: 27
  if r1_27 and r0_27.Img_Head then
    local r2_27 = r0_27.Img_Head:GetDynamicMaterial()
    if r2_27 then
      r2_27:SetTextureParameterValue("MainTex", r1_27)
    end
  end
end
function r1_0.GetTeammatePlayerState(r0_28, r1_28)
  -- line: [469, 478] id: 28
  local r2_28 = UE4.UGameplayStatics.GetGameState(r0_28)
  local r3_28 = nil
  for r8_28, r9_28 in pairs(r2_28.PlayerArray) do
    if r9_28.Eid == r1_28 then
      r3_28 = r9_28
    end
  end
  -- close: r4_28
  return r3_28
end
function r1_0.ClearBloodAllState(r0_29, r1_29)
  -- line: [482, 495] id: 29
  if r0_29.BloodState == nil or IsEmptyTable(r0_29.BloodState) then
    return 
  end
  for r6_29, r7_29 in pairs(r0_0.AllBloodState) do
    if r0_29.BloodState[r7_29] ~= nil then
      local r8_29 = r0_29["_RemoveBloodIn" .. r7_29 .. "State"]
      if r8_29 then
        r8_29(r0_29)
      end
    end
  end
  -- close: r2_29
end
function r1_0.CheckStateCondition(r0_30, r1_30)
  -- line: [497, 502] id: 30
  if r1_30 == r0_0.AllBloodState.Dead then
    return r0_30.Owner and not r0_30.Owner:IsPhantom()
  end
  return true
end
function r1_0.AddBloodState(r0_31, r1_31, r2_31)
  -- line: [504, 522] id: 31
  if r2_31 == nil or r1_31 ~= r0_31.Eid then
    return 
  end
  if r2_31 == r0_0.AllBloodState.OverReach and r0_31.BloodState[r0_0.AllBloodState.Dead] ~= nil then
    return 
  end
  if not r0_31:CheckStateCondition(r2_31) then
    return 
  end
  local r3_31 = r0_31["_SetBloodIn" .. r2_31 .. "State"]
  if r3_31 then
    r3_31(r0_31, r1_31)
  end
  r0_31.BloodState[r2_31] = 1
end
function r1_0.RemoveBloodState(r0_32, r1_32, r2_32)
  -- line: [524, 533] id: 32
  if r2_32 == nil or r1_32 ~= r0_32.Eid then
    return 
  end
  local r3_32 = r0_32["_RemoveBloodIn" .. r2_32 .. "State"]
  if r3_32 then
    r3_32(r0_32)
  end
  r0_32.BloodState[r2_32] = nil
end
function r1_0._SetBloodInDeadState(r0_33, r1_33)
  -- line: [535, 549] id: 33
  if r0_33.BloodState[r0_0.AllBloodState.OverReach] ~= nil then
    r0_33:_RemoveBloodInOverReachState()
  end
  if not r0_33.WidgetInDead then
    r0_33.WidgetInDead = r0_33:CreateWidgetNew("TeamBattlePlayerDead")
    if r0_33.WidgetInDead ~= nil then
      r0_33.Pos_Resurrection:AddChildToOverlay(r0_33.WidgetInDead)
    end
  end
  r0_33.Pos_Resurrection:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_33.WidgetInDead:Init(r0_33.Owner, r0_33:GetTeammatePlayerState(r1_33))
end
function r1_0._RemoveBloodInDeadState(r0_34)
  -- line: [551, 566] id: 34
  local function r1_34()
    -- line: [552, 558] id: 35
    r0_34.Pos_Resurrection:SetVisibility(UE4.ESlateVisibility.Collapsed)
    if r0_34.BloodState[r0_0.AllBloodState.OverReach] ~= nil then
      r0_34:_SetBloodInOverReachState()
    end
  end
  if r0_34.WidgetInDead then
    r0_34.WidgetInDead:Clear()
    r0_34:AddTimer(2, r1_34, false, 0, "BloodResurrectionAnim")
  else
    r1_34()
  end
end
function r1_0._SetBloodInOverReachState(r0_36, r1_36)
  -- line: [568, 593] id: 36
  if not r0_36:GetWorld() then
    return 
  end
  if not r0_36.WidgetInOverReach then
    r0_36.WidgetInOverReach = r0_36:CreateWidgetNew("TeamBattleOverReach")
    if r0_36.WidgetInOverReach ~= nil then
      r0_36.Pos_Overreach:AddChildToOverlay(r0_36.WidgetInOverReach)
      if r0_36.TimerHandleForAnim then
        r0_36:RemoveTimer(r0_36.TimerHandleForAnim)
      end
      r0_36.TimerHandleForAnim = r0_36:AddTimer(5, function()
        -- line: [585, 586] id: 37
        r0_36.WidgetInOverReach:PlayAnimation(r0_36.WidgetInOverReach.Loop)
      end, true, 0, "BloodOverReachLoopAnim")
    end
  end
  r0_36.Group_HPBarRoot:SetRenderOpacity(0.3)
  r0_36.Group_ShieldRoot:SetRenderOpacity(0.3)
  r0_36.Text_Overreach:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_36.Pos_Overreach:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end
function r1_0._RemoveBloodInOverReachState(r0_38)
  -- line: [595, 601] id: 38
  r0_38.Group_HPBarRoot:SetRenderOpacity(1)
  r0_38.Group_ShieldRoot:SetRenderOpacity(1)
  r0_38.Text_Overreach:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_38.Pos_Overreach:SetVisibility(UE4.ESlateVisibility.Collapsed)
end
function r1_0.Construct(r0_39)
  -- line: [606, 616] id: 39
  r1_0.Super.Construct(r0_39)
  if IsStandAlone(r0_39) then
    r0_39:AddDispatcher(EventID.CharRecover, r0_39, r0_39.OnRecovery)
  else
    r0_39:AddDispatcher(EventID.OnTeamRecoveryStateChange, r0_39, r0_39.OnTeammateRecoverStateChange)
  end
  r0_39:AddDispatcher(EventID.OnRepOwnerEidPhantomState, r0_39, r0_39._SyncPlayerName)
  r0_39:AddDispatcher(EventID.OnRepPlayerName, r0_39, r0_39._SyncPlayerName)
  r0_39:AddDispatcher(EventID.OnCloseLoading, r0_39, r0_39._SyncPlayerName)
end
function r1_0._SyncPlayerName(r0_40)
  -- line: [618, 623] id: 40
  if r0_40.bPendingPhantomSetName then
    r0_40:SetName()
    r0_40.bPendingPhantomSetName = false
  end
end
function r1_0.InitShortageUI(r0_41)
  -- line: [628, 640] id: 41
  r0_41.ShortageItems = r0_41.ShortageItems and {}
  local r1_41 = "/Game/UI/WBP/Battle/Widget/WBP_Battle_Shortage.WBP_Battle_Shortage"
  local r2_41 = UIManager(r0_41):CreateWidget(r1_41)
  r0_41.Pos_Shortage:AddChildToWrapBox(r2_41)
  r2_41:InitConfig(r0_41.Owner, nil, 901)
  r0_41.ShortageItems[901] = r2_41
  local r3_41 = UIManager(r0_41):CreateWidget(r1_41)
  r0_41.Pos_Shortage:AddChildToWrapBox(r3_41)
  r3_41:InitConfig(r0_41.Owner, "/Game/UI/Texture/Dynamic/Atlas/Buff/T_Buff_Energy_Down.T_Buff_Energy_Down", 902)
  r0_41.ShortageItems[902] = r3_41
end
function r1_0.ShowShortageUI(r0_42, r1_42, r2_42)
  -- line: [642, 651] id: 42
  if not r0_42.ShortageItems[r1_42] then
    return 
  end
  if r2_42 then
    r0_42.ShortageItems[r1_42]:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    r0_42.ShortageItems[r1_42]:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r1_0.Destruct(r0_43)
  -- line: [654, 657] id: 43
  r0_43.IsDestroied = true
  r1_0.Super.Destruct(r0_43)
end
function r1_0.PlayHpBarGreyAnimation(r0_44, r1_44)
  -- line: [659, 670] id: 44
  local r2_44 = r0_44.IsInvincibility
  if not r2_44 then
    if not r1_44 then
      r0_44.HpBar:PlayAnimation(r0_44.HpBar.Grey)
    else
      r0_44.HpBar:PlayAnimationReverse(r0_44.HpBar.Grey)
    end
    r0_44.WaitingToPlayGreyAnim = nil
    return 
  end
  if r1_44 then
    r2_44 = 0 and 1
  else
    goto label_23	-- block#7 is visited secondly
  end
  r0_44.WaitingToPlayGreyAnim = r2_44
end
return r1_0
