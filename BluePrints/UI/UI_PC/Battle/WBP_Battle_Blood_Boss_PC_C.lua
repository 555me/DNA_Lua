-- filename: @E:/Pack/Branch/OBT10_Geili\Content/Script/BluePrints\UI\UI_PC\Battle\WBP_Battle_Blood_Boss_PC_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("CommonConst")
local r1_0 = require("Const")
local r2_0 = require("BluePrints.UI.BloodBar.BloodBarUtils")
local r3_0 = Class("BluePrints.UI.BP_UIState_C")
function r3_0.Initialize(r0_1, r1_1)
  -- line: [15, 18] id: 1
  r0_1.Super.Initialize(r0_1)
  r0_1.ShowES = true
end
function r3_0.OnLoaded(r0_2, ...)
  -- line: [20, 23] id: 2
  r0_2.Super.OnLoaded(r0_2, ...)
  r0_2:InitBossUI(...)
end
function r3_0.InitBossUI(r0_3, r1_3, r2_3, r3_3)
  -- line: [26, 47] id: 3
  r0_3.Owner = r1_3
  r0_3.IsBossInPart = r2_3
  r0_3.BossUIType = r3_3
  r0_3:K2_SetBuffsOwner(r0_3.Owner)
  local function r4_3()
    -- line: [31, 40] id: 4
    if not r0_3.Owner or not r0_3.Owner.BillboardComponent then
      return 
    end
    r0_3:RemoveTimer("DelayInitBossBloodUI")
    r0_3:RegisterOnBuffsChangedDelegate()
    r0_3:InitBossComponent()
    if r0_3.Owner.BillboardComponent then
      r0_3.Owner.BillboardComponent.bNeedUpdateBossUI = true
    end
    r0_3.InitSuccess = true
  end
  if not r0_3.Owner.BillboardComponent and IsClient(r0_3) then
    r0_3:AddTimer(0.1, r4_3, true, 0, "DelayInitBossBloodUI")
  else
    r4_3()
  end
end
function r3_0.InitBossComponent(r0_5)
  -- line: [49, 116] id: 5
  if r0_5.Owner:IsBossMonster() then
    if DataMgr.Monster[r0_5.Owner.UnitId].BossUIValues.PhaseValues ~= nil then
      r0_5.PhaseValues = DataMgr.Monster[r0_5.Owner.UnitId].BossUIValues.PhaseValues
    else
      r0_5.IsBossInPart = false
      r0_5.PhaseValues = {
        1
      }
    end
    if DataMgr.Monster[r0_5.Owner.UnitId].BossUIValues.ShowES ~= nil then
      r0_5.ShowES = DataMgr.Monster[r0_5.Owner.UnitId].BossUIValues.ShowES
    end
    r0_5.ToughnessHit = DataMgr.BattleMonster[r0_5.Owner.Data.BattleRoleId].DeductToughnessHit and {}
    r0_5.Part_Count = #r0_5.PhaseValues
    local r1_5 = 0
    for r5_5 = 1, r0_5.Part_Count, 1 do
      r1_5 = r1_5 + r0_5.PhaseValues[r5_5]
    end
    if r0_5.Part_Count == 1 or r0_0.BOSS_BLOOD_PART_MAX < r0_5.Part_Count or 1.00000001 < r1_5 or r1_5 < 0.999999999999 then
      r0_5.IsBossInPart = false
    end
    r0_5.IsShowToughnessBar = true
  else
    r0_5.IsBossInPart = false
    r0_5.PhaseValues = {
      1
    }
    r0_5.ToughnessHit = {}
    r0_5.IsShowToughnessBar = false
  end
  r0_5.Num_Lv_BP_1:SetText(GText("BATTLE_UI_BLOOD_LV"))
  r0_5.Boss_Part:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_5.SizeBox_Toughness:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_5:SetBossBarPosition()
  r0_5:InitBossParams()
  r0_5:InitBossConfig()
  r0_5:ResetBossPart()
  r0_5.SizeBox_BossHP:ClearChildren()
  r0_5.Group_BuffRoot:ClearChildren()
  r0_5.HpBar = r2_0.LoadSubWidget(r0_5, r0_5.SizeBox_BossHP, "HPBar", true, r0_5.BloodBarLenght, r0_5.Hp / r0_5.MaxHp)
  r0_5.WeaknessBar = r2_0.LoadSubWidget(r0_5, r0_5.Group_BuffRoot, "BuffBar", true)
  if r0_5.WeaknessBar then
    UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r0_5.WeaknessBar):SetAutoSize(true)
  end
  r0_5:InitBossWeakness()
  r0_5:InitChargeBar()
  r0_5:InitBossEvent()
  if not r0_5.Owner:IsBossMonster() then
    r0_5:AddTimer(r0_5.BossTickTime, function()
      -- line: [101, 104] id: 6
      EMUIAnimationSubsystem:EMPlayAnimation(r0_5, r0_5.Bar_In)
    end)
  else
    r0_5:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_5:AddTimer(0.1, function()
      -- line: [107, 113] id: 7
      if not r0_5.Owner.bHidden then
        r0_5:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
        r0_5:OutHideTag()
        r0_5:RemoveTimer("CheckCanShow")
      end
    end, true, 0, "CheckCanShow")
  end
  r0_5:UpdateBossInvincibleState()
end
function r3_0.InitBossParams(r0_8)
  -- line: [118, 150] id: 8
  r0_8.MaxHp = r0_8.Owner:GetMaxBloodVolume()
  r0_8.Hp = r0_8.Owner:GetCurrentBloodVolume()
  r0_8.LastHp = r0_8.Hp
  r0_8.Shield = r0_8.Owner:GetAttr("ES") and 0
  r0_8.LastShield = r0_8.Shield
  r0_8.MaxShield = r0_8.Owner:GetAttr("MaxES") and 0
  r0_8.BossUIBuffs = nil
  r0_8.Panel_Invincible = {}
  r0_8.BossTickTime = 0.033
  r0_8.BossAnimTime = r1_0.BloodBarAnimTime
  r0_8.BossDelayTime = r1_0.BloodBarDelayTime
  r0_8.LastAttackTime = 0
  r0_8.ComboAttackTime = 0.3
  r0_8.FixTime = 1
  r0_8.BossHpPercent = 1
  r0_8.BossShieldPercent = 1
  r0_8.BossTNPercent = 1
  r0_8.LastTNPercent = 1
  r0_8.HelpBossTNPercent = 1
  r0_8.LastTN = 0
  r0_8.NowTN = 0
  r0_8.TNDeductEffectHeight = 0
  r0_8.TNEqualZero = false
  r0_8.IsPlayHitAnimation = false
  r0_8.CanShowBossTouughness = true
  if r0_8.Owner.Data.BossUIValues and r0_8.Owner.Data.BossUIValues.HideTNUI then
    r0_8.CanShowBossTouughness = not r0_8.Owner.Data.BossUIValues.HideTNUI
  end
  r0_8.CanShowPanelTip = true
  r0_8.WeaknessList = {}
  r0_8.InvincinbleTags = {}
end
function r3_0.ShowToughnessBar(r0_9, r1_9)
  -- line: [152, 157] id: 9
  if not r0_9.IsShowToughnessBar then
    return 
  end
  local r2_9 = r0_9.SizeBox_Toughness
  local r4_9 = nil	-- notice: implicit variable refs by block#[5]
  if r1_9 then
    r4_9 = ESlateVisibility.SelfHitTestInvisible
    if not r4_9 then
      ::label_12::
      r4_9 = ESlateVisibility.Collapsed
    end
  else
    goto label_12	-- block#4 is visited secondly
  end
  r2_9:SetVisibility(r4_9)
end
function r3_0.InitBossConfig(r0_10)
  -- line: [159, 199] id: 10
  r0_10.Boss_Part:SetRenderOpacity(0)
  r0_10.Name_Boss_Part:SetText(GText(r0_10.Owner.Data.UnitName))
  local r2_10 = r0_10.Owner:GetAttr("Level")
  if r2_10 ~= nil then
    r0_10.Num_Lv_BP:SetText(r2_10)
    r0_10.Num_Lv_BP:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  r0_10.TakeDownTip:SetText(GText("UI_BOSSBATTLE_TAKEDOWN"))
  r0_10:SetPanelTipVisibility(UE4.ESlateVisibility.Collapsed)
  r0_10.Shield_Boss = r0_10.Bar_Shield_BP
  r0_10.Deduct_Shield_Boss = r0_10.Deduct_Shield_BP
  r0_10.Bg_Shield = r0_10.bg_bp_shield
  r0_10.Bg_Blood = r0_10.bg_bp_blood
  r0_10.Blood_Boss = r0_10.Bar_Blood_BP
  r0_10.Deduct_Blood_Boss = r0_10.Deduct_Blood_BP
  if r0_10.MaxShield <= 0 then
    r0_10.ShowES = false
  end
  if not r0_10.IsShowToughnessBar then
    r0_10.Toughness_Bar:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_10.DeductToughness:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    r0_10.Toughness_Bar:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_10.DeductToughness:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_10.TNDeductEffectSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r0_10.DeductToughness)
    r0_10.TNDeductEffectHeight = r0_10.TNDeductEffectSlot:GetSize().Y
  end
  r0_10.Boss_Part:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_10.HB_Buff_BP:ClearChildren()
end
function r3_0.SetBossBarPosition(r0_11)
  -- line: [201, 219] id: 11
  if r0_11.BossUIType and r0_11.BossUIType ~= EBossUIType.None then
    return 
  end
  local r1_11 = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(r0_11.Boss_Part)
  local r4_11 = UE4.UGameplayStatics.GetGameInstance(r0_11):GetGameUIManager():GetUI("BattleMain")
  local r5_11 = FVector2D(0, 80)
  if r4_11 ~= nil then
    r5_11 = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r4_11.Pos_Boss_Lifebar):GetPosition()
  end
  if r1_11 then
    local r6_11 = r1_11.Padding
    r6_11.Top = r5_11.Y
    r1_11:SetPadding(r6_11)
  end
end
function r3_0.ResetBossPart(r0_12)
  -- line: [221, 247] id: 12
  r0_12.ToughnessEffect = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r0_12.DeductToughness)
  r0_12.BloodBarLenght = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r0_12.SizeBoxBar):GetSize().X
  r0_12.BloodBarHeight = r0_12.SizeBox_BossHP.MinDesiredHeight
  local r2_12 = r0_12.BloodBarLenght
  if r0_12.IsBossInPart == true then
    local r3_12 = {}
    for r7_12 = 1, r0_12.Part_Count + -1, 1 do
      r3_12[r7_12] = r0_12.PhaseValues[r7_12] + (r3_12[r7_12 + -1] and 0)
    end
    for r7_12 = 1, #r3_12, 1 do
      r0_12["Split_" .. r7_12]:SetVisibility(UE4.ESlateVisibility.Visible)
      local r8_12 = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r0_12["Split_" .. r7_12])
      local r9_12 = r8_12:GetPosition()
      r9_12.X = r2_12 * r3_12[r7_12] - r8_12:GetSize().X / 2
      r8_12:SetPosition(r9_12)
    end
    for r7_12 = r0_12.Part_Count, r0_0.BOSS_BLOOD_PART_MAX + -1, 1 do
      r0_12["Split_" .. r7_12]:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  else
    for r6_12 = 1, r0_0.BOSS_BLOOD_PART_MAX + -1, 1 do
      r0_12["Split_" .. r6_12]:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
end
function r3_0.ResetBossToughness(r0_13)
  -- line: [249, 305] id: 13
  EMUIAnimationSubsystem:EMPlayAnimation(r0_13, r0_13.Bar_In)
  if not r0_13.IsShowToughnessBar then
    r0_13.IsResetBossToughness = true
    return 
  end
  if r0_13.CanShowBossTouughness ~= false then
    r0_13.SizeBox_Toughness:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  r0_13.RetainerBox_Toughness_Bar:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_13.NowTN = r0_13.Owner:GetAttr("TN")
  r0_13.LastTN = r0_13.NowTN
  r0_13.MaxTN = r0_13.Owner:GetAttr("MaxTN")
  if r0_13.MaxTN <= 0.001 then
    r0_13:ShowOrHideToughnessBar(false)
    return 
  end
  r0_13.VX_percent:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_13.BossTNPercent = math.min(math.max(r0_13.NowTN / r0_13.MaxTN, 0), 1)
  r0_13.LastTNPercent = r0_13.BossTNPercent
  r0_13.HelpBossTNPercent = math.min(math.max(r0_13.NowTN / r0_13.MaxTN, 0), 1)
  r0_13:SetToughnessBarPercent(r0_13.BossTNPercent)
  r0_13.ToughnessNums = 0
  local r1_13 = {}
  if r0_13.ToughnessHit[0] == nil then
    r0_13.ToughnessNums = 1
    r1_13[r0_13.ToughnessNums] = 0
  end
  local r2_13 = 1
  for r7_13, r8_13 in pairs(r0_13.ToughnessHit) do
    r0_13.ToughnessNums = r0_13.ToughnessNums + 1
    r1_13[r0_13.ToughnessNums] = r7_13
    if r7_13 > 0 and r7_13 < 100 then
      r2_13 = r2_13 + 1
    end
  end
  -- close: r3_13
  r0_13:SetProgressbarSegmentNum(r0_13.Toughness_Bar, r2_13)
  r0_13:SetProgressbarSegmentNum(r0_13.Toughness_BarDeduct, r2_13)
  r0_13:SetProgressbarSegmentNum(r0_13.Toughness_Bar_Light, r2_13)
  r0_13:SetImageSegmentNum(r0_13.Image_ToughnessBarBG, r2_13)
  r0_13.ToughnessLength = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r0_13.SizeBoxBar):GetSize().X
  r0_13.ToughnessWeakLength = r0_13.SizeBox_percent_L.WidthOverride
  r0_13.VX_percent_L:SetRenderTranslation(FVector2D(-r0_13.ToughnessWeakLength + r0_13.ToughnessWeakLength / 2, 0))
  r0_13.VX_percent_R:SetRenderTranslation(FVector2D(r0_13.ToughnessWeakLength + -r0_13.ToughnessWeakLength / 2, 0))
  r0_13.DeductTNOriginalPositionX = 0
  r0_13.ToughnessPartOriginalPositionX = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r0_13.ToughnessPart):GetPosition().X
  r0_13:UpdateToughnessEffect()
  local r4_13 = {}
  for r8_13 = 2, r0_13.ToughnessNums, 1 do
    r4_13[r8_13 + -1] = r1_13[r8_13] / 100
  end
  r0_13.IsResetBossToughness = true
end
function r3_0.InitBossWeakness(r0_14)
  -- line: [307, 309] id: 14
  r0_14:RefreshWeaknessIcons()
end
function r3_0.RefreshWeaknessIcons(r0_15)
  -- line: [311, 329] id: 15
  local r2_15 = r0_15.Owner.BuffManager.Buffs
  if r0_15.WeaknessBar then
    local r3_15 = TArray(0)
    for r8_15, r9_15 in pairs(r2_15) do
      local r10_15 = DataMgr.Buff[r9_15.BuffId]
      if r10_15 and r10_15.WeaknessType then
        r3_15:Add(r9_15.BuffId)
      end
    end
    -- close: r4_15
    if r3_15:Num() > 0 then
      r0_15.Group_BuffRoot:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    else
      r0_15.Group_BuffRoot:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    r0_15.WeaknessBar:RefreshWeaknessIcons(r3_15)
  end
end
function r3_0.InitChargeBar(r0_16)
  -- line: [332, 360] id: 16
  if r0_16.BossUIType ~= UE4.EBossUIType.ChargeLeft and r0_16.BossUIType ~= UE4.EBossUIType.ChargeRight then
    return 
  end
  r0_16.Bar_Energy:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_16.PanelTip:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_16.PanelTipText:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_16.EnergyWarnPercent = r0_16.Owner.Data.BloodUIParmas.WarnPercent
  r0_16.Text_Energy:SetText(GText("UI_Mechanism_ZhiLvGeCharge_Charge"))
  r0_16.IsWarning = false
  r0_16.TargetEnergy = 0
  r0_16.NowEnergy = 0
  r0_16.DeltaEnergy = 0
  r0_16.UpdateProgressHandle = nil
  r0_16:UpdateEnergyBar(r0_16.Owner.Eid, r0_16.Owner.NowEnergy)
  r0_16:BindToAnimationFinished(r0_16.Energy_In, function()
    -- line: [352, 358] id: 17
    if r0_16.BossUIType == UE4.EBossUIType.ChargeLeft then
      r0_16:PlayAnimation(r0_16.Energy_ColorL)
    else
      r0_16:PlayAnimation(r0_16.Energy_ColorR)
    end
  end)
  r0_16:PlayAnimation(r0_16.Energy_In)
end
function r3_0.InitBossEvent(r0_18)
  -- line: [362, 369] id: 18
  r0_18:AddDispatcher(EventID.ShowBossBlood, r0_18, r0_18.RefreshBossInfoByAction)
  r0_18:AddDispatcher(EventID.StartTalk, r0_18, r0_18.HideBossBillboard)
  r0_18:AddDispatcher(EventID.EndTalk, r0_18, r0_18.ShowBossBillboard)
  r0_18:AddDispatcher(EventID.UpdateBossToughness, r0_18, r0_18.UpdateBossToughness)
  r0_18:AddDispatcher(EventID.RecoveryBossShield, r0_18, r0_18.RecoveryBossShield)
  r0_18:AddDispatcher(EventID.OnBloodEnergyChanged, r0_18, r0_18.UpdateEnergyBar)
end
function r3_0.UpdateToughnessEffect(r0_19)
  -- line: [371, 382] id: 19
  if not r0_19.IsShowToughnessBar then
    return 
  end
  r0_19.ToughnessEffect:SetSize(FVector2D(r0_19.ToughnessLength * math.min(math.max((r0_19.LastTN - r0_19.NowTN) / r0_19.MaxTN, 0), 1), r0_19.ToughnessEffect:GetSize().Y))
  r0_19.ToughnessEffect:SetPosition(FVector2D(r0_19.ToughnessLength * r0_19.BossTNPercent, r0_19.ToughnessEffect:GetPosition().Y))
  EMUIAnimationSubsystem:EMPlayAnimation(r0_19, r0_19.Deduct_toughness)
end
function r3_0.RefreshBossInfoByAction(r0_20, r1_20, r2_20)
  -- line: [384, 414] id: 20
  if r0_20.Owner == nil then
    return 
  end
  r0_20.IsPlayHitAnimation = false
  if r1_20 == "Attack" then
    local r3_20 = UE4.UGameplayStatics.GetRealTimeSeconds(r0_20)
    local r4_20 = r2_20.SkillId
    if r4_20 then
      r4_20 = DataMgr.Skill[r2_20.SkillId] and nil
    else
      goto label_21	-- block#5 is visited secondly
    end
    if r4_20 and r4_20[1] then
      local r5_20 = r4_20[1][0].SkillType
      if r5_20 == "Attack" then
        r0_20.LastAttackTime = r3_20
      end
      if r5_20 == "Attack" or r5_20 == "FallAttack" or r5_20 == "HeavyAttack" or r5_20 == "SlideAttack" then
        r0_20.IsPlayHitAnimation = true
      end
    end
    if r0_20.ComboAttackTime < r3_20 - r0_20.LastAttackTime then
      r0_20.BossDelayTime = 0
    else
      r0_20.BossDelayTime = r1_0.BloodBarDelayTime
    end
  end
  r0_20:PlayWeaknessEffect(r2_20.DamageValues)
end
function r3_0.PlayWeaknessEffect(r0_21, r1_21)
  -- line: [416, 424] id: 21
  if not r0_21.WeaknessBar then
    return 
  end
  for r6_21, r7_21 in pairs(r1_21 and {}) do
    r0_21.WeaknessBar:PlayWeaknessEffect(r6_21)
  end
  -- close: r2_21
end
function r3_0.UpdateBossBlood(r0_22, r1_22, r2_22)
  -- line: [426, 471] id: 22
  r0_22.LastShield = r0_22.Shield
  r0_22.LastHp = r0_22.Hp
  r0_22.Shield = r0_22.Owner:GetAttr("ES") and 0
  r0_22.BloodNowTime = UE4.UGameplayStatics.GetRealTimeSeconds(r0_22)
  r0_22.Hp = r0_22.Owner:GetCurrentBloodVolume()
  r0_22.StartReduceTime = r0_22.BloodNowTime
  r2_22 = r0_22.LastShield - r0_22.Shield
  if r1_22 == "Attack" then
    local r3_22 = r0_22.Hp < r0_22.LastHp
    local r4_22 = r0_22.Shield < r0_22.LastShield
    r0_22.BossHpPercent = math.min(math.max(r0_22.Hp / r0_22.MaxHp, 0), 1)
    if r0_22.MaxShield <= 0.00000001 then
      r0_22.FixTime = r0_22.BossDelayTime
    else
      r0_22.Shield = math.min(math.max(r0_22.MaxShield * r0_22.BossShieldPercent - r2_22, 0), r0_22.Shield)
      r0_22.BossShieldPercent = math.min(math.max(r0_22.Shield / r0_22.MaxShield, 0), 1)
    end
    if r0_22.HpBar then
      r0_22.HpBar:SetBarPercent(r0_22.BossHpPercent)
      if r3_22 then
        r0_22.HpBar:PlayDeduct(true)
      end
    end
    if r0_22.MaxShield > 0 and r0_22.ShieldBar then
      r0_22.ShieldBar:SetBarPercent(r0_22.BossShieldPercent)
      if r4_22 then
        r0_22.ShieldBar:PlayDeduct(true)
      end
    end
  elseif r1_22 == "Heal" then
    r0_22.BossHpPercent = math.min(math.max(r0_22.Hp / r0_22.MaxHp, 0), 1)
    r0_22.Blood_Boss:SetPercent(r0_22.BossHpPercent)
    r0_22.HpBar:SetBarPercent(r0_22.BossHpPercent)
    r0_22.LastHp = r0_22.Hp
  end
  r0_22:Show()
  if r0_22.Hp == 0 then
    r0_22:SetPanelTipVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r3_0.UpdateTakeDownTipText(r0_23)
  -- line: [473, 478] id: 23
  r0_23.TakeDownTip:SetText(GText("UI_STAT_SUFFER") .. "×" .. CommonUtils.Round((r0_23.Owner:GetAttr(UEMNameRegisterLibrary.GetAttrNameAttributeType("DamagedRate", "NoTag_BossDown")) + 1) * 100) .. "%")
end
function r3_0.ShowPanelTip(r0_24)
  -- line: [480, 492] id: 24
  if not r0_24.CanShowPanelTip then
    return 
  end
  r0_24:SetPanelTipVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  EMUIAnimationSubsystem:EMPlayAnimation(r0_24, r0_24.TakeDown)
  AudioManager(r0_24):PlayUISound(r0_24, "event:/ui/common/boss_shied_bar_loop", "BossShiedBarLoop", nil)
  if r0_24.NowTN / r0_24.MaxTN < 0.7 then
    r0_24:PlayAnimation(r0_24.Loop, 0, 0)
    r0_24.IsPlayOut = true
  end
end
function r3_0.UpdateBossToughness(r0_25, r1_25)
  -- line: [494, 555] id: 25
  if not IsValid(r0_25.Owner) or not r0_25.IsShowToughnessBar then
    return 
  end
  if not r0_25.MaxTN then
    r0_25.MaxTN = r0_25.Owner:GetAttr("MaxTN")
  end
  if not r0_25.NowTN then
    r0_25.NowTN = r0_25.MaxTN
  end
  r0_25.NowTNTime = UE4.UGameplayStatics.GetRealTimeSeconds(r0_25)
  r0_25.LastTN = r0_25.NowTN
  r0_25.NowTN = r0_25.Owner:GetAttr("TN")
  if r0_25.NowTN == r0_25.MaxTN then
    r0_25:SetPanelTipVisibility(UE4.ESlateVisibility.Collapsed)
    r0_25.VX_percent:SetVisibility(UE4.ESlateVisibility.Collapsed)
    if r0_25.TNEqualZero then
      r0_25.LastTN = r0_25.NowTN
      EMUIAnimationSubsystem:EMPlayAnimation(r0_25, r0_25.Toughness_Finsh)
      AudioManager(r0_25):PlayUISound(r0_25, "event:/ui/common/boss_shield_bar_loop_end", nil, nil)
    end
    r0_25.TNEqualZero = false
  end
  r0_25.TNReduce = r0_25.LastTN - r0_25.NowTN
  r0_25.LastTNPercent = r0_25.BossTNPercent
  r0_25.HelpBossTNPercent = math.max(r0_25.HelpBossTNPercent, r0_25.LastTNPercent)
  if r0_25.NowTN < 0.0000001 or r1_25 then
    r0_25.TNEqualZero = true
    r0_25.BossTNPercent = 0
    r0_25:SetToughnessBarPercent(r0_25.BossTNPercent)
  else
    if r0_25.TNReduce < 0 then
      if r0_25.TNEqualZero then
        r0_25.VX_percent:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      else
        r0_25.VX_percent:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
      r0_25:RecoverBossTN()
    elseif 0.00001 < r0_25.TNReduce or r0_25.NowTN == r0_25.MaxTN then
      r0_25.VX_percent:SetVisibility(UE4.ESlateVisibility.Collapsed)
      if r0_25:IsExistTimer("RealRecoveryTN") then
        r0_25:RemoveTimer("RealRecoveryTN")
      end
      r0_25.BossTNPercent = math.min(math.max(r0_25.NowTN / r0_25.MaxTN, 0), 1)
      r0_25:SetToughnessBarPercent(r0_25.BossTNPercent)
      r0_25:CheckToughnessPartBroken()
      r0_25:SetPanelTipVisibility(UE4.ESlateVisibility.Collapsed)
    end
    if 0.7 <= r0_25.NowTN / r0_25.MaxTN and r0_25.IsPlayOut then
      r0_25:StopAnimation(r0_25.Loop)
      r0_25:PlayAnimation(r0_25.Loop_Out)
      r0_25.IsPlayOut = false
    end
  end
  if r0_25.TNReduce > 0 then
    r0_25:ReduceBossTN()
  end
end
function r3_0.UpdateEnergyBar(r0_26, r1_26, r2_26)
  -- line: [557, 581] id: 26
  if r1_26 ~= r0_26.Owner.Eid then
    return 
  end
  r0_26.TargetEnergy = r2_26
  r0_26.DeltaEnergy = (r0_26.TargetEnergy - r0_26.NowEnergy) / 10
  local function r3_26()
    -- line: [563, 577] id: 27
    r0_26.NowEnergy = r0_26.NowEnergy + r0_26.DeltaEnergy
    r0_26.NowEnergy = math.min(r0_26.NowEnergy, r0_26.TargetEnergy)
    r0_26.TextBlock_Energy_Num:SetText(math.floor(r0_26.NowEnergy))
    UUIFunctionLibrary.BP_SetSingleScalarParamToImageMat(r0_26.Bar_Energy_L, "Percent", r0_26.NowEnergy / 100)
    UUIFunctionLibrary.BP_SetSingleScalarParamToImageMat(r0_26.Bar_Energy_R, "Percent", r0_26.NowEnergy / 100)
    if not r0_26.IsWarning and r0_26.EnergyWarnPercent <= r0_26.NowEnergy then
      r0_26.IsWarning = true
      r0_26:PlayAnimation(r0_26.Energy_Warning)
    end
    if r0_26.TargetEnergy <= r0_26.NowEnergy then
      r0_26:RemoveTimer(r0_26.UpdateProgressHandle)
      r0_26.UpdateProgressHandle = nil
    end
  end
  if not r0_26.UpdateProgressHandle then
    r0_26.UpdateProgressHandle = r0_26:AddTimer(0.1, r3_26, true, 0, "UpdateChargeProgress", true)
  end
end
function r3_0.RecoverBossTN(r0_28)
  -- line: [583, 625] id: 28
  if not r0_28.IsShowToughnessBar then
    return 
  end
  if r0_28:IsExistTimer("RealReduceBossTN") then
    r0_28.DeductToughness:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_28:RemoveTimer("RealReduceBossTN")
  end
  r0_28.ToughnessLength = r0_28.ToughnessLength and 605
  r0_28.ToughnessWeakLength = r0_28.ToughnessWeakLength and 194
  local r1_28 = r1_0.MonsterTNRecoverTickInterival
  if r0_28.TNEqualZero then
    r1_28 = r1_0.BossTNToZeroRecoverTickInterival
  end
  local r2_28 = r1_28 / r1_0.BossTNRecoverTickFrequency
  r0_28:AddTimer(r2_28, function()
    -- line: [598, 623] id: 29
    local r0_29 = UE4.UGameplayStatics.GetRealTimeSeconds(r0_28)
    if r1_28 <= r0_29 - r0_28.NowTNTime then
      r0_28:RemoveTimer("RealRecoveryTN")
      r0_28.BossTNPercent = math.min(math.max(r0_28.NowTN / r0_28.MaxTN, 0), 1)
      r0_28:SetToughnessBarPercent(r0_28.BossTNPercent)
    end
    local r2_29 = math.min(math.floor(r0_28.NowTN + r0_28.TNReduce * (1 - (r0_29 - r0_28.NowTNTime) / r1_28)), r0_28.MaxTN)
    r0_28.LastTNPercent = r0_28.BossTNPercent
    r0_28.BossTNPercent = math.min(math.max(r2_29 / r0_28.MaxTN, 0), 1)
    local r3_29 = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r0_28.VX_percent)
    r3_29:SetPosition(FVector2D(r0_28.ToughnessLength * r0_28.BossTNPercent, r3_29:GetPosition().Y))
    local r4_29 = 1 - r0_28.BossTNPercent
    r0_28.VX_percent_L:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_28.VX_percent_R:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_28.VX_percent_L:SetRenderTranslation(FVector2D(-r0_28.ToughnessWeakLength * r4_29 + r0_28.ToughnessWeakLength / 2, 0))
    r0_28.VX_percent_R:SetRenderTranslation(FVector2D(r0_28.ToughnessWeakLength * r4_29 + -r0_28.ToughnessWeakLength / 2, 0))
    r0_28.HelpBossTNPercent = r0_28.BossTNPercent
    r0_28:SetToughnessBarPercent(r0_28.BossTNPercent)
    if r0_28.BossTNPercent > 0.999999 then
      r0_28.VX_percent:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end, true, -r2_28, "RealRecoveryTN")
end
function r3_0.ReduceBossTN(r0_30)
  -- line: [627, 675] id: 30
  r0_30.Toughness_BarDeduct:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  local r1_30 = r0_30.BossDelayTime
  local r2_30 = 0.033
  local r3_30 = r1_0.BloodBarAnimTime
  local r4_30 = UE4.UGameplayStatics.GetTimeSeconds(r0_30)
  local r5_30 = r0_30.TNDeductEffectHeight
  local r6_30 = 1
  local r7_30 = r0_30.LastTNPercent - r0_30.BossTNPercent
  if r7_30 < 0.1 and 0.02 < r7_30 then
    r5_30 = ((r7_30 - 0.02) / 0.08 * 0.5 + 0.5) * r5_30
    r6_30 = (r7_30 - 0.02) / 0.08 * 0.5 + 0.5
  elseif r7_30 < 0.02 then
    r5_30 = r5_30 * 0.5
    r6_30 = 0.5
  end
  r6_30 = math.max(r6_30, 0.5)
  r5_30 = math.min(r5_30, r0_30.TNDeductEffectHeight)
  if r0_30:IsExistTimer("RealRecoveryTN") then
    r0_30:RemoveTimer("RealRecoveryTN")
  end
  if r0_30:IsExistTimer("RealReduceBossTN") then
    r0_30:RemoveTimer("RealReduceBossTN")
    r0_30.HelpBossTNPercent = r0_30.Toughness_BarDeduct.Percent
  end
  r2_0:SetDeductEffect(r5_30, r0_30.ToughnessLength, r0_30.DeductToughness, r0_30.HelpBossTNPercent, r0_30.BossTNPercent, r6_30, r0_30.DeductTNOriginalPositionX)
  r0_30:AddTimer(r2_30, function()
    -- line: [656, 673] id: 31
    local r1_31 = math.max(UE4.UGameplayStatics.GetTimeSeconds(r0_30) - r4_30, r1_30)
    if r3_30 + r1_30 < r1_31 then
      r0_30.Toughness_BarDeduct:SetPercent(r0_30.BossTNPercent)
      r0_30.HelpBossTNPercent = r0_30.BossTNPercent
      r0_30.DeductToughness:SetVisibility(UE4.ESlateVisibility.Collapsed)
      r0_30:RemoveTimer("RealReduceBossTN")
    else
      local r3_31 = (r3_30 + r1_30 - r1_31) / r3_30
      local r4_31 = r0_30.BossTNPercent + (r0_30.HelpBossTNPercent - r0_30.BossTNPercent) * r3_31
      local r5_31 = r6_30 * r3_31
      r0_30.Toughness_BarDeduct:SetPercent(r4_31)
      r2_0:SetDeductEffect(r5_30, r0_30.ToughnessLength, r0_30.DeductToughness, r4_31, r0_30.BossTNPercent, r5_31, r0_30.DeductTNOriginalPositionX)
    end
  end, true, r1_30, "RealReduceBossTN")
end
function r3_0.RecoveryBossShield(r0_32)
  -- line: [677, 686] id: 32
  if not r0_32.ShieldBar or r0_32.MaxShield <= 0 then
    return 
  end
  r0_32.LastShield = r0_32.Shield
  r0_32.Shield = r0_32.Owner:GetAttr("ES")
  r0_32.ShieldBar:SetBarPercent(math.clamp(r0_32.Shield / r0_32.MaxShield, 0, 1), false)
  r0_32.ShieldBar:PlayRecoveryShield()
end
function r3_0.CheckToughnessPartBroken(r0_33)
  -- line: [688, 702] id: 33
  if not r0_33.IsShowToughnessBar then
    return 
  end
  for r5_33, r6_33 in pairs(r0_33.ToughnessHit) do
    local r7_33 = tonumber(r5_33) / 100
    if r7_33 <= r0_33.LastTNPercent and r0_33.BossTNPercent < r7_33 then
      local r8_33 = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r0_33.ToughnessPart)
      r8_33:SetPosition(FVector2D(r0_33.ToughnessLength * r7_33 + r0_33.ToughnessPartOriginalPositionX, r8_33:GetPosition().Y))
      EMUIAnimationSubsystem:EMPlayAnimation(r0_33, r0_33.Toughness_Broken)
      AudioManager(r0_33):PlayUISound(r0_33, "event:/ui/common/boss_shield_bar_lose", nil, nil)
    end
  end
  -- close: r1_33
end
function r3_0.UpdateBossInvincibleState(r0_34, r1_34, r2_34)
  -- line: [704, 747] id: 34
  if r1_34 == nil then
    r1_34 = r0_34.Owner.bIsInvincible and r0_34.Owner:IsInvincible()
  end
  if r2_34 == nil then
    r2_34 = "DefaultTag"
  end
  if r1_34 then
    r0_34.InvincinbleTags[r2_34] = true
  else
    r0_34.InvincinbleTags[r2_34] = nil
  end
  r1_34 = not IsEmptyTable(r0_34.InvincinbleTags)
  if r1_34 then
    r0_34.VX_Boss_InvincibilLight:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_34.Toughness_Bar.WidgetStyle.FillImage.TintColor = r0_34.BossInvincibilityColor
    r0_34.Toughness_Bar_Light.WidgetStyle.FillImage.TintColor = r0_34.BossInvincibilityColor
    r0_34:AddTimer(r0_34.invincibility:GetEndTime(), function()
      -- line: [726, 729] id: 35
      EMUIAnimationSubsystem:EMPlayAnimation(r0_34, r0_34.invincibility)
    end, true, 0, "PlayLoopAnimation")
  else
    r0_34.VX_Boss_InvincibilLight:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_34.Toughness_Bar.WidgetStyle.FillImage.TintColor = r0_34.BossNormalColor
    r0_34.Toughness_Bar_Light.WidgetStyle.FillImage.TintColor = r0_34.BossNormalColor
    if r0_34:IsExistTimer("PlayLoopAnimation") then
      r0_34:RemoveTimer("PlayLoopAnimation")
      r0_34:StopAnimation(r0_34.invincibility)
    end
  end
  if r0_34.HpBar then
    r0_34.HpBar:PlayInvincibility(r1_34)
  end
  if r0_34.ShieldBar then
    r0_34.ShieldBar:PlayInvincibility(r1_34)
  end
end
function r3_0.HideBossBillboard(r0_36, r1_36)
  -- line: [749, 752] id: 36
  if r1_36 then
    return 
  end
  r0_36.Boss_Part:SetVisibility(UE4.ESlateVisibility.Collapsed)
end
function r3_0.ShowBossBillboard(r0_37, r1_37)
  -- line: [754, 757] id: 37
  if r1_37 then
    return 
  end
  r0_37.Boss_Part:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end
function r3_0.CloseBossBlood(r0_38)
  -- line: [759, 767] id: 38
  r0_38:Close()
end
function r3_0.OutHideTag(r0_39)
  -- line: [769, 771] id: 39
  r0_39:AddTimer(r0_39.BossTickTime, r0_39.ResetBossToughness, false, 0, "ResetBossToughness")
end
function r3_0.SetProgressbarSegmentNum(r0_40, r1_40, r2_40)
  -- line: [775, 784] id: 40
  if not r1_40 then
    return 
  end
  if not r2_40 then
    r2_40 = 1
  end
  local r3_40 = UE4.UWidgetBlueprintLibrary.GetDynamicMaterial(r1_40.WidgetStyle.FillImage)
  if r3_40 then
    r3_40:SetScalarParameterValue("SegmentsNumber", r2_40)
  end
end
function r3_0.SetImageSegmentNum(r0_41, r1_41, r2_41)
  -- line: [786, 795] id: 41
  if not r1_41 then
    return 
  end
  if not r2_41 then
    r2_41 = 1
  end
  local r3_41 = r1_41:GetDynamicMaterial()
  if r3_41 then
    r3_41:SetScalarParameterValue("SegmentsNumber", r2_41)
  end
end
function r3_0.SetToughnessBarPercent(r0_42, r1_42)
  -- line: [797, 816] id: 42
  if not r1_42 then
    r1_42 = 0
  end
  r1_42 = math.clamp(r1_42, 0, 1)
  r0_42.Toughness_Bar_Light:SetPercent(r1_42)
  r0_42.Toughness_Bar:SetPercent(r1_42)
  local r2_42 = 1 - r1_42
  r0_42.Progress_CountDownLeft:SetPercent(r2_42)
  r0_42.Progress_CountDownRight:SetPercent(r2_42)
  if r2_42 > 0 and r2_42 <= 0.3 and not r0_42.IsPercent_Warning and r0_42.Owner:CharacterInTag("Defeated") then
    r0_42:PlayAnimation(r0_42.Percent_Warning)
    r0_42.IsPercent_Warning = true
  elseif r2_42 == 0 and r0_42.IsPercent_Warning then
    r0_42:PlayAnimationReverse(r0_42.Percent_Warning)
    r0_42.IsPercent_Warning = false
    r0_42:ShowToughnessBar(true)
  end
  if r2_42 == 0 then
    AudioManager(r0_42):StopSound(r0_42, "BossShiedBarLoop")
  end
end
function r3_0.StopBossShiedBarLoopSound(r0_43)
  -- line: [818, 820] id: 43
  AudioManager(r0_43):StopSound(r0_43, "BossShiedBarLoop")
end
function r3_0.ShowOrHideToughnessBar(r0_44, r1_44)
  -- line: [822, 829] id: 44
  r0_44.CanShowBossTouughness = r1_44
  if r1_44 then
    r0_44.SizeBox_Toughness:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    r0_44.SizeBox_Toughness:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r3_0.ShowOrHidePanelTip(r0_45, r1_45)
  -- line: [831, 838] id: 45
  r0_45.CanShowPanelTip = r1_45
  if r1_45 then
    r0_45:SetPanelTipVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    r0_45:SetPanelTipVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r3_0.SetBossLockHpState(r0_46, r1_46, r2_46, r3_46)
  -- line: [840, 852] id: 46
  if not r2_46 then
    r2_46 = 0
  end
  local r4_46 = nil	-- notice: implicit variable refs by block#[10, 11]
  if r3_46 and r3_46 > 0 then
    r4_46 = r3_46
    if r4_46 then
      ::label_9::
      r4_46 = r2_46 / r0_46.MaxHp
    end
  else
    goto label_9	-- block#5 is visited secondly
  end
  local r5_46 = r0_46.Owner:GetAttr("Hp") / r0_46.MaxHp
  if not r1_46 then
    r0_46.HpBar:DirectSetBarPercent(r5_46)
  end
  r0_46.IsLockHp = r1_46
  r0_46:UpdateBossInvincibleState(r1_46, "LockHp")
  if r1_46 and r0_46.HpBar and r4_46 <= r5_46 then
    r0_46.HpBar:DirectSetBarPercent(r4_46)
  end
end
function r3_0.SetPanelTipVisibility(r0_47, r1_47)
  -- line: [854, 875] id: 47
  if r0_47.PanelTipVisibility == r1_47 then
    return 
  end
  r0_47.PanelTipVisibility = r1_47
  r0_47.PanelTip:SetVisibility(r1_47)
  if r0_47.PanelTipText then
    r0_47.PanelTipText:SetVisibility(r1_47)
  end
  if r1_47 == UE4.ESlateVisibility.Collapsed then
    local r2_47 = r0_47.HB_Buff_BP.Slot.Padding
    r2_47.Top = r0_47.Buff_BP_TopOffset_NoTips
    r0_47.HB_Buff_BP.Slot:SetPadding(r2_47)
    r0_47.TakeDownTip:SetText(GText("UI_BOSSBATTLE_TAKEDOWN"))
  else
    local r2_47 = r0_47.HB_Buff_BP.Slot.Padding
    r2_47.Top = r0_47.Buff_BP_TopOffset_HaveTips
    r0_47.HB_Buff_BP.Slot:SetPadding(r2_47)
    r0_47.VX_percent_L:SetRenderTranslation(FVector2D(-r0_47.ToughnessWeakLength * 1 + r0_47.ToughnessWeakLength / 2, 0))
    r0_47.VX_percent_R:SetRenderTranslation(FVector2D(r0_47.ToughnessWeakLength * 1 + -r0_47.ToughnessWeakLength / 2, 0))
  end
end
function r3_0.UnLoadSelf(r0_48)
  -- line: [877, 889] id: 48
  local r1_48 = UE4.UGameplayStatics.GetGameInstance(r0_48)
  local r2_48 = r1_48 and r1_48:GetGameUIManager()
  if not r0_48.BossUIType or r0_48.BossUIType == EBossUIType.None then
    r2_48:UnLoadUINew("BossBlood")
  else
    r0_48:SetVisibility(ESlateVisibility.Collapsed)
    local r3_48 = r2_48:GetUIObj("DoubleBossBlood")
    if r3_48 then
      r3_48:OnBossDead()
    end
  end
end
function r3_0.SetEquipartition(r0_49, r1_49, r2_49, r3_49, r4_49, r5_49)
  -- line: [891, 895] id: 49
  if r0_49.HpBar then
    r0_49.HpBar:SetEquipartition(r1_49, r2_49, r3_49, r4_49, r5_49, r0_49.Owner)
  end
end
function r3_0.InterruptEquipartition(r0_50)
  -- line: [897, 908] id: 50
  local r1_50 = true
  if r0_50.HpBar then
    r1_50 = r0_50.HpBar:InterruptEquipartition(r0_50.Owner)
  end
  if not r1_50 then
    return 
  end
  local r3_50 = UE4.UGameplayStatics.GetGameInstance(r0_50):GetGameUIManager()
  if r3_50 then
    r3_50:ShowUITip(UIConst.Tip_CommonToast, GText("TODO"))
  end
end
function r3_0.SetBossRecoverInfo(r0_51, r1_51, r2_51, r3_51)
  -- line: [910, 918] id: 51
  if r0_51.HpBar then
    r0_51:UpdateBossInvincibleState(true, "BossRecover")
    r0_51:AddTimer(r2_51 + r1_51, function()
      -- line: [913, 915] id: 52
      r0_51:UpdateBossInvincibleState(false, "BossRecover")
    end, false, nil, "BossRecoverTimer")
    r0_51.HpBar:SetBossRecoverInfo(r0_51.Owner, r1_51, r2_51, r3_51)
  end
end
function r3_0.InterruptBossRecover(r0_53)
  -- line: [920, 937] id: 53
  local r1_53 = true
  if r0_53.HpBar then
    r1_53 = r0_53.HpBar:InterruptBossRecover(r0_53.Owner)
  end
  if r0_53:IsExistTimer("BossRecoverTimer") then
    r0_53:RemoveTimer("BossRecoverTimer")
    r0_53:UpdateBossInvincibleState(false, "BossRecover")
  end
  if not r1_53 then
    return 
  end
  if r0_53.Owner and not r0_53.Owner:IsDead() then
    local r3_53 = UE4.UGameplayStatics.GetGameInstance(r0_53):GetGameUIManager()
    if r3_53 then
      r3_53:ShowUITip(UIConst.Tip_CommonToast, GText("TODO"))
    end
  end
end
function r3_0.UpdateEquipartitionInfo(r0_54, r1_54, r2_54)
  -- line: [939, 943] id: 54
  if r0_54.HpBar then
    r0_54.HpBar:UpdateEquipartitionInfo(r1_54, r2_54)
  end
end
return r3_0
