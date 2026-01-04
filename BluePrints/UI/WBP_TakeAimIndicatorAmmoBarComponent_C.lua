-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP_TakeAimIndicatorAmmoBarComponent_C.lua
-- version: lua54
-- line: [0, 0] id: 0
return {
  SwitchAmmoBar = function(r0_1)
    -- line: [4, 27] id: 1
    local r1_1 = nil
    if r0_1.AmmoBarStyle then
      r1_1 = r0_1["Panel_Ammo_" .. r0_1.AmmoBarStyle]
      if not r1_1 then
        r1_1 = UIManager(r0_1):_CreateWidgetNew("BattleAmmo" .. r0_1.AmmoBarStyle)
        r1_1:Init(r0_1)
        r0_1["Panel_Ammo_" .. r0_1.AmmoBarStyle] = r1_1
        r0_1.Panel_Ammo:AddChild(r1_1)
      end
    end
    if r0_1.AmmoBarPanel then
      r0_1.LastAmmoBarPanel = r0_1.AmmoBarPanel
    end
    r0_1.AmmoBarPanel = r1_1
    if r0_1.LastAmmoBarPanel then
      r0_1.LastAmmoBarPanel:SwitchOut()
    end
    if r0_1.AmmoBarPanel then
      r0_1.AmmoBarPanel:SwitchIn()
      r0_1:RefreshAmmoBar()
    end
  end,
  RefreshAmmoBar = function(r0_2)
    -- line: [29, 33] id: 2
    if r0_2.AmmoBarPanel and r0_2.AmmoBarPanel.Refresh then
      r0_2.AmmoBarPanel:Refresh()
    end
  end,
  IsNoBullets = function(r0_3)
    -- line: [36, 55] id: 3
    local r1_3 = nil
    if IsValid(r0_3.OwnerPlayer) then
      r1_3 = r0_3.OwnerPlayer:GetSkill(r0_3.OwnerPlayer:GetSkillByType(UE.ESkillType.Shooting))
    end
    local r2_3 = r0_3.OwnerPlayer.RangedWeapon
    if IsValid(r2_3) then
      if r1_3 then
        local r4_3 = DataMgr.SkillNode[r1_3.BeginNodeId]
        if not r4_3 then
          return false
        end
        return not r2_3:IsAllBulletEnough((r4_3.CostBullet and 0))
      end
      return not r2_3:IsAllBulletEnough(0)
    end
    return false
  end,
  ShowOutOfBulletTip = function(r0_4)
    -- line: [57, 63] id: 4
    UIManager(r0_4):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, "BATTLE_BULLETNUMZERO")
    if r0_4:IsNoBullets() then
      r0_4:PlayOutOfBulletAnim()
    end
  end,
  ShowFullOfMagazineTip = function(r0_5)
    -- line: [65, 67] id: 5
    UIManager(r0_5):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, "BATTLE_MAGAZINECAPACITYMAX")
  end,
  PlayOutOfBulletAnim = function(r0_6)
    -- line: [69, 73] id: 6
    if r0_6.AmmoBarPanel and r0_6.AmmoBarPanel.PlayOutOfBulletAnim then
      r0_6.AmmoBarPanel:PlayOutOfBulletAnim()
    end
  end,
  LerpSetAmmoBarPercentInTick = function(r0_7, r1_7)
    -- line: [75, 79] id: 7
    if r0_7.IsLerpSetAmmo and r0_7.AmmoBarPanel and r0_7.AmmoBarPanel.LerpSetAmmoBarPercentInTick then
      r0_7.AmmoBarPanel:LerpSetAmmoBarPercentInTick(r1_7)
    end
  end,
  UpdateAmmoBarProgress = function(r0_8, r1_8)
    -- line: [82, 90] id: 8
    if r0_8.AmmoBarPanel and r0_8.AmmoBarPanel.UpdateAmmoBarProgress then
      if not IsValid(r0_8.CurrentWeapon) then
        return 
      end
      r0_8.AmmoBarPanel:UpdateAmmoBarProgress(r1_8)
      r0_8:UpdateAimStarOpacity()
    end
  end,
  TryToEnterReloadState = function(r0_9)
    -- line: [93, 106] id: 9
    if not IsValid(r0_9.CurrentWeapon) then
      return 
    end
    if r0_9:ShouldNotKeepReloading() then
      return 
    end
    if r0_9.CurState == "Reload" then
      return 
    end
    r0_9:EnterReloadState()
  end,
  EnterReloadState = function(r0_10)
    -- line: [108, 112] id: 10
    r0_10.Panel_Target:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_10.Panel_Kill:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_10:RealEnterReloadState()
  end,
  RealEnterReloadState = function(r0_11)
    -- line: [114, 118] id: 11
    r0_11.CurState = "Reload"
    r0_11:SwitchAimStar("BulletReload")
    r0_11.AmmoBarPanel:RealEnterReloadState()
  end,
  PlayReloadAnimInTick = function(r0_12, r1_12)
    -- line: [120, 124] id: 12
    if r0_12.IsReloadingBar and r0_12.AmmoBarPanel and r0_12.AmmoBarPanel.PlayReloadAnimInTick then
      r0_12.AmmoBarPanel:PlayReloadAnimInTick(r1_12)
    end
  end,
  ShouldNotKeepReloading = function(r0_13)
    -- line: [126, 133] id: 13
    if not IsValid(r0_13.CurrentWeapon) then
      return true
    end
    local r1_13 = r0_13.CurrentWeapon:GetAttr("MagazineBulletNum")
    local r3_13 = nil	-- notice: implicit variable refs by block#[6]
    if r0_13.CurrentWeapon:GetAttr("BulletNum") > 0 then
      r3_13 = r0_13.CurMagazineCapacity <= r1_13
    else
      goto label_21	-- block#5 is visited secondly
    end
    return r3_13
  end,
  GetFirstReloadAnimPlayTime = function(r0_14)
    -- line: [135, 143] id: 14
    if not IsValid(r0_14.OwnerPlayer) or r0_14.OwnerPlayer.GetCurMontageNotifyEventsTriggerTime == nil then
      return 
    end
    return r0_14.OwnerPlayer:GetCurMontageNotifyEventsTriggerTime():ToTable()["效果:hit1"] and 0
  end,
  GetAmmoBarStyle = function(r0_15, r1_15, r2_15, r3_15)
    -- line: [145, 161] id: 15
    if r3_15 and r0_15.SightUI2AmmoBarStyle[r3_15] then
      return r0_15.SightUI2AmmoBarStyle[r3_15]
    elseif r1_15 == "Melee" or r1_15 == "Bow" or r1_15 == "Archer" or r1_15 == "TrackingBow" or r1_15 == "AimStarButterfly" then
      return nil
    elseif r1_15 == "Funnel" then
      return "BarFunnel"
    elseif r1_15 == "Cannon" then
      if r2_15 and r0_15.MaxSingleMagazine and r0_15.MaxSingleMagazine < r2_15 then
        return "UnlimitedSingle"
      else
        return "Single"
      end
    else
      return "Bar"
    end
  end,
  IsReloadBreaked = function(r0_16)
    -- line: [163, 169] id: 16
    if r0_16.OwnerPlayer.CurrentSkillId ~= r0_16.OwnerPlayer:GetSkillByType(UE.ESkillType.Reload) or not IsValid(r0_16.CurrentWeapon) then
      return true
    else
      return false
    end
  end,
  TryToLeaveReloadState_End = function(r0_17)
    -- line: [171, 175] id: 17
    if r0_17.CurState == "Reload" and r0_17.AmmoBarPanel and r0_17.AmmoBarPanel.TryToLeaveReloadState then
      r0_17.AmmoBarPanel:TryToLeaveReloadState("LeaveNormal")
    end
  end,
  TryToLeaveReloadState_Stop = function(r0_18)
    -- line: [177, 181] id: 18
    if r0_18.CurState == "Reload" and r0_18.AmmoBarPanel and r0_18.AmmoBarPanel.TryToLeaveReloadState then
      r0_18.AmmoBarPanel:TryToLeaveReloadState("Break")
    end
  end,
  LeaveReloadState = function(r0_19, r1_19)
    -- line: [183, 189] id: 19
    if r0_19.AmmoBarPanel and r0_19.AmmoBarPanel.LeaveReloadState then
      r0_19.CurState = "Normal"
      r0_19:SwitchAimStar()
      r0_19.AmmoBarPanel:LeaveReloadState(r1_19)
    end
  end,
}
