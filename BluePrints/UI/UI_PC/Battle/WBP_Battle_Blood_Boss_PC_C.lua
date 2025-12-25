-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\UI_PC\Battle\WBP_Battle_Blood_Boss_PC_C.lua
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
  -- line: [49, 123] id: 5
  local r1_5 = DataMgr.Monster[r0_5.Owner.UnitId]
  if r0_5.Owner:IsBossMonster() then
    if r1_5.BossUIValues.PhaseValues ~= nil then
      r0_5.PhaseValues = r1_5.BossUIValues.PhaseValues
    else
      r0_5.IsBossInPart = false
      r0_5.PhaseValues = {
        1
      }
    end
    if r1_5.BossUIValues.ShowES ~= nil then
      r0_5.ShowES = r1_5.BossUIValues.ShowES
    end
    r0_5.ToughnessHit = DataMgr.BattleMonster[r0_5.Owner.Data.BattleRoleId].DeductToughnessHit and {}
    r0_5.Part_Count = #r0_5.PhaseValues
    local r2_5 = 0
    for r6_5 = 1, r0_5.Part_Count, 1 do
      r2_5 = r2_5 + r0_5.PhaseValues[r6_5]
    end
    if r0_5.Part_Count == 1 or r0_0.BOSS_BLOOD_PART_MAX < r0_5.Part_Count or 1.00000001 < r2_5 or r2_5 < 0.999999999999 then
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
  r0_5:InitMultiHpBar(r1_5)
  r0_5.SizeBox_BossHP:ClearChildren()
  r0_5.Group_BuffRoot:ClearChildren()
  r0_5.HpBar = r2_0.LoadSubWidget(r0_5, r0_5.SizeBox_BossHP, "HPBar", true, r0_5.BloodBarLenght, r0_5.Hp / r0_5.MaxHp)
  if r0_5.HpBar and r0_5.bMultiHpBar then
    r0_5.HpBar:InitMultiHpBar(r0_5.MaxHpLayer)
    r0_5:SetMultiHpBarColor()
  end
  r0_5.WeaknessBar = r2_0.LoadSubWidget(r0_5, r0_5.Group_BuffRoot, "BuffBar", true)
  if r0_5.WeaknessBar then
    UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r0_5.WeaknessBar):SetAutoSize(true)
  end
  r0_5:InitBossWeakness()
  r0_5:InitChargeBar()
  r0_5:InitBossEvent()
  if not r0_5.Owner:IsBossMonster() then
    r0_5:AddTimer(r0_5.BossTickTime, function()
      -- line: [108, 111] id: 6
      EMUIAnimationSubsystem:EMPlayAnimation(r0_5, r0_5.Bar_In)
    end)
  else
    r0_5:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_5:AddTimer(0.1, function()
      -- line: [114, 120] id: 7
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
  -- line: [125, 157] id: 8
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
  -- line: [159, 164] id: 9
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
  -- line: [166, 206] id: 10
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
  -- line: [208, 226] id: 11
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
  -- line: [228, 254] id: 12
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
  -- line: [256, 312] id: 13
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
  -- line: [314, 316] id: 14
  r0_14:RefreshWeaknessIcons()
end
function r3_0.RefreshWeaknessIcons(r0_15)
  -- line: [318, 336] id: 15
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
  -- line: [339, 370] id: 16
  if r0_16.BossUIType ~= UE4.EBossUIType.ChargeLeft and r0_16.BossUIType ~= UE4.EBossUIType.ChargeRight then
    return 
  end
  r0_16:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_16.Bar_Energy:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  r0_16.PanelTip:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_16.PanelTipText:SetVisibility(UIConst.VisibilityOp.Collapsed)
  r0_16.EnergyWarnPercent = r0_16.Owner.Data.BloodUIParmas.WarnPercent
  r0_16.Text_Energy:SetText(GText("UI_Mechanism_ZhiLvGeCharge_Charge"))
  r0_16.IsWarning = false
  r0_16.TargetEnergy = 0
  r0_16.NowEnergy = 0
  r0_16.EnergyText = 0
  r0_16.DeltaEnergy = 0
  r0_16.UpdateProgressHandle = nil
  r0_16:UpdateEnergyBar(r0_16.Owner.Eid, r0_16.Owner.NowEnergy, true)
  r0_16:BindToAnimationFinished(r0_16.Energy_In, function()
    -- line: [362, 368] id: 17
    if r0_16.BossUIType == UE4.EBossUIType.ChargeLeft then
      r0_16:PlayAnimation(r0_16.Energy_ColorL)
    else
      r0_16:PlayAnimation(r0_16.Energy_ColorR)
    end
  end)
  r0_16:PlayAnimation(r0_16.Energy_In)
end
function r3_0.InitBossEvent(r0_18)
  -- line: [372, 383] id: 18
  r0_18:AddDispatcher(EventID.ShowBossBlood, r0_18, r0_18.RefreshBossInfoByAction)
  r0_18:AddDispatcher(EventID.StartTalk, r0_18, r0_18.HideBossBillboard)
  r0_18:AddDispatcher(EventID.EndTalk, r0_18, r0_18.ShowBossBillboard)
  r0_18:AddDispatcher(EventID.UpdateBossToughness, r0_18, r0_18.UpdateBossToughness)
  r0_18:AddDispatcher(EventID.RecoveryBossShield, r0_18, r0_18.RecoveryBossShield)
  r0_18:AddDispatcher(EventID.OnBloodEnergyChanged, r0_18, r0_18.UpdateEnergyBar)
  r0_18:AddDispatcher(EventID.UpdateDamageRate, r0_18, r0_18.UpdateDamageRate)
  if r0_18.bMultiHpBar then
    r0_18:AddDispatcher(EventID.OnMultiHpBarLayerChange, r0_18, r0_18.OnMultiHpBarLayerChange)
  end
end
function r3_0.InitMultiHpBar(r0_19, r1_19)
  -- line: [385, 404] id: 19
  r0_19.bMultiHpBar = false
  local r2_19 = nil
  if r1_19 and r1_19.BattleRoleId then
    r2_19 = DataMgr.BattleMonster[r1_19.BattleRoleId]
  end
  if not r2_19 or not r2_19.MultiHpBar or r2_19.MultiHpBar <= 1 then
    r0_19.Text_BloodNum:SetVisibility(UE.ESlateVisibility.Collapsed)
    r0_19.Group_BloodNum:SetVisibility(UE.ESlateVisibility.Collapsed)
    return 
  end
  r0_19.bMultiHpBar = true
  r0_19.CurMultiColorArrayIndex = 0
  r0_19.MaxHpLayer = r2_19.MultiHpBar
  r0_19.CurHpLayer = r2_19.MultiHpBar
  r0_19.Text_BloodNum:SetText(string.format("%d", r0_19.CurHpLayer))
  r0_19.Text_BloodNum:SetVisibility(UE.ESlateVisibility.SelfHitTestInvisible)
  r0_19.Group_BloodNum:SetVisibility(UE.ESlateVisibility.SelfHitTestInvisible)
  r0_19.BloodBarLenght = r0_19.BloodBarLenght - r0_19.Group_BloodNum.WidthOverride
end
function r3_0.OnMultiHpBarLayerChange(r0_20, r1_20, r2_20, r3_20)
  -- line: [406, 431] id: 20
  if r0_20.HpBar ~= r3_20 then
    return 
  end
  r2_20 = math.abs(math.floor(r0_20.Hp / r0_20.MaxHp * r0_20.MaxHpLayer) - r0_20.CurHpLayer)
  DebugPrint("WBP_Battle_Blood_Boss_PC_C:OnMultiHpBarLayerChange ChangeNum: ", r2_20)
  if r1_20 then
    r0_20.CurHpLayer = r0_20.CurHpLayer + r2_20
    r0_20.CurMultiColorArrayIndex = r0_20.CurMultiColorArrayIndex - r2_20
  else
    r0_20.CurHpLayer = r0_20.CurHpLayer - r2_20
    r0_20.CurMultiColorArrayIndex = r0_20.CurMultiColorArrayIndex + r2_20
  end
  local r5_20 = r0_20.MultiHpBarColorArray:Num()
  if r0_20.CurMultiColorArrayIndex < 0 then
    r0_20.CurMultiColorArrayIndex = r5_20 - math.abs(r0_20.CurMultiColorArrayIndex) % r5_20
  elseif r5_20 <= r0_20.CurMultiColorArrayIndex then
    r0_20.CurMultiColorArrayIndex = r0_20.CurMultiColorArrayIndex % r5_20
  end
  r0_20.Text_BloodNum:SetText(string.format("%d", r0_20.CurHpLayer))
  r0_20:SetMultiHpBarColor()
end
function r3_0.SetMultiHpBarColor(r0_21)
  -- line: [433, 444] id: 21
  if not r0_21.HpBar then
    return 
  end
  local r1_21 = r0_21.CurMultiColorArrayIndex + 1
  local r2_21 = (r1_21 + 1) % (r0_21.MultiHpBarColorArray:Num() + 1)
  if r2_21 <= 0 then
    r2_21 = 1
  end
  local r3_21 = r0_21.HpBar
  local r5_21 = r0_21.MultiHpBarColorArray[r1_21]
  local r6_21 = r0_21.MultiDeductBarColorArray[r1_21]
  local r7_21 = r0_21.CurHpLayer
  if r7_21 > 1 then
    r7_21 = r0_21.MultiHpBarColorArray[r2_21] and FLinearColor(1, 1, 1, 0.3)
  else
    goto label_32	-- block#6 is visited secondly
  end
  r3_21:OnChangeLayerSetColor(r5_21, r6_21, r7_21)
end
function r3_0.UpdateToughnessEffect(r0_22)
  -- line: [446, 457] id: 22
  if not r0_22.IsShowToughnessBar then
    return 
  end
  r0_22.ToughnessEffect:SetSize(FVector2D(r0_22.ToughnessLength * math.min(math.max((r0_22.LastTN - r0_22.NowTN) / r0_22.MaxTN, 0), 1), r0_22.ToughnessEffect:GetSize().Y))
  r0_22.ToughnessEffect:SetPosition(FVector2D(r0_22.ToughnessLength * r0_22.BossTNPercent, r0_22.ToughnessEffect:GetPosition().Y))
  EMUIAnimationSubsystem:EMPlayAnimation(r0_22, r0_22.Deduct_toughness)
end
function r3_0.RefreshBossInfoByAction(r0_23, r1_23, r2_23)
  -- line: [459, 489] id: 23
  if r0_23.Owner == nil then
    return 
  end
  r0_23.IsPlayHitAnimation = false
  if r1_23 == "Attack" then
    local r3_23 = UE4.UGameplayStatics.GetRealTimeSeconds(r0_23)
    local r4_23 = r2_23.SkillId
    if r4_23 then
      r4_23 = DataMgr.Skill[r2_23.SkillId] and nil
    else
      goto label_21	-- block#5 is visited secondly
    end
    if r4_23 and r4_23[1] then
      local r5_23 = r4_23[1][0].SkillType
      if r5_23 == "Attack" then
        r0_23.LastAttackTime = r3_23
      end
      if r5_23 == "Attack" or r5_23 == "FallAttack" or r5_23 == "HeavyAttack" or r5_23 == "SlideAttack" then
        r0_23.IsPlayHitAnimation = true
      end
    end
    if r0_23.ComboAttackTime < r3_23 - r0_23.LastAttackTime then
      r0_23.BossDelayTime = 0
    else
      r0_23.BossDelayTime = r1_0.BloodBarDelayTime
    end
  end
  r0_23:PlayWeaknessEffect(r2_23.DamageValues)
end
function r3_0.PlayWeaknessEffect(r0_24, r1_24)
  -- line: [491, 499] id: 24
  if not r0_24.WeaknessBar then
    return 
  end
  for r6_24, r7_24 in pairs(r1_24 and {}) do
    r0_24.WeaknessBar:PlayWeaknessEffect(r6_24)
  end
  -- close: r2_24
end
function r3_0.UpdateBossBlood(r0_25, r1_25)
  -- line: [501, 549] id: 25
  r0_25.MaxHp = r0_25.Owner:GetMaxBloodVolume()
  r0_25.LastShield = r0_25.Shield
  r0_25.LastHp = r0_25.Hp
  r0_25.Shield = r0_25.Owner:GetAttr("ES") and 0
  r0_25.BloodNowTime = UE4.UGameplayStatics.GetRealTimeSeconds(r0_25)
  r0_25.Hp = r0_25.Owner:GetCurrentBloodVolume()
  r0_25.StartReduceTime = r0_25.BloodNowTime
  local r2_25 = r0_25.LastShield - r0_25.Shield
  if r1_25 == "Attack" then
    local r3_25 = r0_25.Hp < r0_25.LastHp
    local r4_25 = r0_25.Shield < r0_25.LastShield
    r0_25.BossHpPercent = math.min(math.max(r0_25.Hp / r0_25.MaxHp, 0), 1)
    if r0_25.MaxShield <= 0.00000001 then
      r0_25.FixTime = r0_25.BossDelayTime
    else
      r0_25.Shield = math.min(math.max(r0_25.MaxShield * r0_25.BossShieldPercent - r2_25, 0), r0_25.Shield)
      r0_25.BossShieldPercent = math.min(math.max(r0_25.Shield / r0_25.MaxShield, 0), 1)
    end
    if r0_25.HpBar then
      r0_25.HpBar:SetBarPercent(r0_25.BossHpPercent)
      if r3_25 then
        r0_25.HpBar:PlayDeduct(false)
      elseif r0_25.bMultiHpBar then
        r0_25.HpBar:HealingCheckNeedChangeLayer()
      end
    end
    if r0_25.MaxShield > 0 and r0_25.ShieldBar then
      r0_25.ShieldBar:SetBarPercent(r0_25.BossShieldPercent)
      if r4_25 then
        r0_25.ShieldBar:PlayDeduct(false)
      end
    end
  elseif r1_25 == "Heal" then
    r0_25.BossHpPercent = math.min(math.max(r0_25.Hp / r0_25.MaxHp, 0), 1)
    r0_25.Blood_Boss:SetPercent(r0_25.BossHpPercent)
    r0_25.HpBar:SetBarPercent(r0_25.BossHpPercent)
    r0_25.LastHp = r0_25.Hp
  end
  r0_25:Show()
  if r0_25.Hp == 0 then
    r0_25:SetPanelTipVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r3_0.UpdateTakeDownTipText(r0_26)
  -- line: [551, 556] id: 26
  r0_26.TakeDownTip:SetText(GText("UI_STAT_SUFFER") .. "×" .. CommonUtils.Round((r0_26.Owner:GetAttr(UEMNameRegisterLibrary.GetAttrNameAttributeType("DamagedRate", "NoTag_BossDown")) + 1) * 100) .. "%")
end
function r3_0.UpdateDamageRate(r0_27, r1_27)
  -- line: [558, 563] id: 27
  if r0_27.Owner.Eid ~= r1_27 then
    return 
  end
  r0_27:UpdateTakeDownTipText()
end
function r3_0.ShowPanelTip(r0_28)
  -- line: [565, 577] id: 28
  if not r0_28.CanShowPanelTip then
    return 
  end
  r0_28:SetPanelTipVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  EMUIAnimationSubsystem:EMPlayAnimation(r0_28, r0_28.TakeDown)
  AudioManager(r0_28):PlayUISound(r0_28, "event:/ui/common/boss_shied_bar_loop", "BossShiedBarLoop", nil)
  if r0_28.NowTN / r0_28.MaxTN < 0.7 then
    r0_28:PlayAnimation(r0_28.Loop, 0, 0)
    r0_28.IsPlayOut = true
  end
end
function r3_0.UpdateBossToughness(r0_29, r1_29)
  -- line: [579, 640] id: 29
  if not IsValid(r0_29.Owner) or not r0_29.IsShowToughnessBar then
    return 
  end
  if not r0_29.MaxTN then
    r0_29.MaxTN = r0_29.Owner:GetAttr("MaxTN")
  end
  if not r0_29.NowTN then
    r0_29.NowTN = r0_29.MaxTN
  end
  r0_29.NowTNTime = UE4.UGameplayStatics.GetRealTimeSeconds(r0_29)
  r0_29.LastTN = r0_29.NowTN
  r0_29.NowTN = r0_29.Owner:GetAttr("TN")
  if r0_29.NowTN == r0_29.MaxTN then
    r0_29:SetPanelTipVisibility(UE4.ESlateVisibility.Collapsed)
    r0_29.VX_percent:SetVisibility(UE4.ESlateVisibility.Collapsed)
    if r0_29.TNEqualZero then
      r0_29.LastTN = r0_29.NowTN
      EMUIAnimationSubsystem:EMPlayAnimation(r0_29, r0_29.Toughness_Finsh)
      AudioManager(r0_29):PlayUISound(r0_29, "event:/ui/common/boss_shield_bar_loop_end", nil, nil)
    end
    r0_29.TNEqualZero = false
  end
  r0_29.TNReduce = r0_29.LastTN - r0_29.NowTN
  r0_29.LastTNPercent = r0_29.BossTNPercent
  r0_29.HelpBossTNPercent = math.max(r0_29.HelpBossTNPercent, r0_29.LastTNPercent)
  if r0_29.NowTN < 0.0000001 or r1_29 then
    r0_29.TNEqualZero = true
    r0_29.BossTNPercent = 0
    r0_29:SetToughnessBarPercent(r0_29.BossTNPercent)
  else
    if r0_29.TNReduce < 0 then
      if r0_29.TNEqualZero then
        r0_29.VX_percent:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      else
        r0_29.VX_percent:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
      r0_29:RecoverBossTN()
    elseif 0.00001 < r0_29.TNReduce or r0_29.NowTN == r0_29.MaxTN then
      r0_29.VX_percent:SetVisibility(UE4.ESlateVisibility.Collapsed)
      if r0_29:IsExistTimer("RealRecoveryTN") then
        r0_29:RemoveTimer("RealRecoveryTN")
      end
      r0_29.BossTNPercent = math.min(math.max(r0_29.NowTN / r0_29.MaxTN, 0), 1)
      r0_29:SetToughnessBarPercent(r0_29.BossTNPercent)
      r0_29:CheckToughnessPartBroken()
      r0_29:SetPanelTipVisibility(UE4.ESlateVisibility.Collapsed)
    end
    if 0.7 <= r0_29.NowTN / r0_29.MaxTN and r0_29.IsPlayOut then
      r0_29:StopAnimation(r0_29.Loop)
      r0_29:PlayAnimation(r0_29.Loop_Out)
      r0_29.IsPlayOut = false
    end
  end
  if r0_29.TNReduce > 0 then
    r0_29:ReduceBossTN()
  end
end
function r3_0.UpdateEnergyBar(r0_30, r1_30, r2_30, r3_30)
  -- line: [642, 672] id: 30
  if r1_30 ~= r0_30.Owner.Eid then
    return 
  end
  r0_30.TargetEnergy = r2_30
  r0_30.DeltaEnergy = (r0_30.TargetEnergy - r0_30.NowEnergy) / 10
  local function r4_30()
    -- line: [648, 668] id: 31
    r0_30.NowEnergy = r0_30.NowEnergy + r0_30.DeltaEnergy
    r0_30.NowEnergy = math.min(r0_30.NowEnergy, r0_30.TargetEnergy)
    UUIFunctionLibrary.BP_SetSingleScalarParamToImageMat(r0_30.Bar_Energy_L, "Percent", r0_30.NowEnergy / 100)
    UUIFunctionLibrary.BP_SetSingleScalarParamToImageMat(r0_30.Bar_Energy_R, "Percent", r0_30.NowEnergy / 100)
    if not r0_30.IsWarning and r0_30.EnergyWarnPercent <= r0_30.NowEnergy then
      r0_30.IsWarning = true
      r0_30:PlayAnimation(r0_30.Energy_Warning)
    end
    local r0_31 = math.floor(r0_30.NowEnergy)
    if r3_30 == true or r0_30.EnergyText < r0_31 then
      r0_30.TextBlock_Energy_Num:SetText(r0_31)
      EventManager:FireEvent(EventID.DoubleBossChargeTextUpdate, r0_30.IsWarning)
      r0_30.EnergyText = r0_31
    end
    if r0_30.TargetEnergy <= r0_30.NowEnergy then
      r0_30:RemoveTimer(r0_30.UpdateProgressHandle)
      r0_30.UpdateProgressHandle = nil
    end
  end
  if not r0_30.UpdateProgressHandle then
    r0_30.UpdateProgressHandle = r0_30:AddTimer(0.1, r4_30, true, 0, "UpdateChargeProgress", true)
  end
end
function r3_0.RecoverBossTN(r0_32)
  -- line: [674, 716] id: 32
  if not r0_32.IsShowToughnessBar then
    return 
  end
  if r0_32:IsExistTimer("RealReduceBossTN") then
    r0_32.DeductToughness:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_32:RemoveTimer("RealReduceBossTN")
  end
  r0_32.ToughnessLength = r0_32.ToughnessLength and 605
  r0_32.ToughnessWeakLength = r0_32.ToughnessWeakLength and 194
  local r1_32 = r1_0.MonsterTNRecoverTickInterival
  if r0_32.TNEqualZero then
    r1_32 = r1_0.BossTNToZeroRecoverTickInterival
  end
  local r2_32 = r1_32 / r1_0.BossTNRecoverTickFrequency
  r0_32:AddTimer(r2_32, function()
    -- line: [689, 714] id: 33
    local r0_33 = UE4.UGameplayStatics.GetRealTimeSeconds(r0_32)
    if r1_32 <= r0_33 - r0_32.NowTNTime then
      r0_32:RemoveTimer("RealRecoveryTN")
      r0_32.BossTNPercent = math.min(math.max(r0_32.NowTN / r0_32.MaxTN, 0), 1)
      r0_32:SetToughnessBarPercent(r0_32.BossTNPercent)
    end
    local r2_33 = math.min(math.floor(r0_32.NowTN + r0_32.TNReduce * (1 - (r0_33 - r0_32.NowTNTime) / r1_32)), r0_32.MaxTN)
    r0_32.LastTNPercent = r0_32.BossTNPercent
    r0_32.BossTNPercent = math.min(math.max(r2_33 / r0_32.MaxTN, 0), 1)
    local r3_33 = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r0_32.VX_percent)
    r3_33:SetPosition(FVector2D(r0_32.ToughnessLength * r0_32.BossTNPercent, r3_33:GetPosition().Y))
    local r4_33 = 1 - r0_32.BossTNPercent
    r0_32.VX_percent_L:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_32.VX_percent_R:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_32.VX_percent_L:SetRenderTranslation(FVector2D(-r0_32.ToughnessWeakLength * r4_33 + r0_32.ToughnessWeakLength / 2, 0))
    r0_32.VX_percent_R:SetRenderTranslation(FVector2D(r0_32.ToughnessWeakLength * r4_33 + -r0_32.ToughnessWeakLength / 2, 0))
    r0_32.HelpBossTNPercent = r0_32.BossTNPercent
    r0_32:SetToughnessBarPercent(r0_32.BossTNPercent)
    if r0_32.BossTNPercent > 0.999999 then
      r0_32.VX_percent:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end, true, -r2_32, "RealRecoveryTN")
end
function r3_0.ReduceBossTN(r0_34)
  -- line: [718, 766] id: 34
  r0_34.Toughness_BarDeduct:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  local r1_34 = r0_34.BossDelayTime
  local r2_34 = 0.033
  local r3_34 = r1_0.BloodBarAnimTime
  local r4_34 = UE4.UGameplayStatics.GetTimeSeconds(r0_34)
  local r5_34 = r0_34.TNDeductEffectHeight
  local r6_34 = 1
  local r7_34 = r0_34.LastTNPercent - r0_34.BossTNPercent
  if r7_34 < 0.1 and 0.02 < r7_34 then
    r5_34 = ((r7_34 - 0.02) / 0.08 * 0.5 + 0.5) * r5_34
    r6_34 = (r7_34 - 0.02) / 0.08 * 0.5 + 0.5
  elseif r7_34 < 0.02 then
    r5_34 = r5_34 * 0.5
    r6_34 = 0.5
  end
  r6_34 = math.max(r6_34, 0.5)
  r5_34 = math.min(r5_34, r0_34.TNDeductEffectHeight)
  if r0_34:IsExistTimer("RealRecoveryTN") then
    r0_34:RemoveTimer("RealRecoveryTN")
  end
  if r0_34:IsExistTimer("RealReduceBossTN") then
    r0_34:RemoveTimer("RealReduceBossTN")
    r0_34.HelpBossTNPercent = r0_34.Toughness_BarDeduct.Percent
  end
  r2_0:SetDeductEffect(r5_34, r0_34.ToughnessLength, r0_34.DeductToughness, r0_34.HelpBossTNPercent, r0_34.BossTNPercent, r6_34, r0_34.DeductTNOriginalPositionX)
  r0_34:AddTimer(r2_34, function()
    -- line: [747, 764] id: 35
    local r1_35 = math.max(UE4.UGameplayStatics.GetTimeSeconds(r0_34) - r4_34, r1_34)
    if r3_34 + r1_34 < r1_35 then
      r0_34.Toughness_BarDeduct:SetPercent(r0_34.BossTNPercent)
      r0_34.HelpBossTNPercent = r0_34.BossTNPercent
      r0_34.DeductToughness:SetVisibility(UE4.ESlateVisibility.Collapsed)
      r0_34:RemoveTimer("RealReduceBossTN")
    else
      local r3_35 = (r3_34 + r1_34 - r1_35) / r3_34
      local r4_35 = r0_34.BossTNPercent + (r0_34.HelpBossTNPercent - r0_34.BossTNPercent) * r3_35
      local r5_35 = r6_34 * r3_35
      r0_34.Toughness_BarDeduct:SetPercent(r4_35)
      r2_0:SetDeductEffect(r5_34, r0_34.ToughnessLength, r0_34.DeductToughness, r4_35, r0_34.BossTNPercent, r5_35, r0_34.DeductTNOriginalPositionX)
    end
  end, true, r1_34, "RealReduceBossTN")
end
function r3_0.RecoveryBossShield(r0_36)
  -- line: [768, 777] id: 36
  if not r0_36.ShieldBar or r0_36.MaxShield <= 0 then
    return 
  end
  r0_36.LastShield = r0_36.Shield
  r0_36.Shield = r0_36.Owner:GetAttr("ES")
  r0_36.ShieldBar:SetBarPercent(math.clamp(r0_36.Shield / r0_36.MaxShield, 0, 1), false)
  r0_36.ShieldBar:PlayRecoveryShield()
end
function r3_0.CheckToughnessPartBroken(r0_37)
  -- line: [779, 793] id: 37
  if not r0_37.IsShowToughnessBar then
    return 
  end
  for r5_37, r6_37 in pairs(r0_37.ToughnessHit) do
    local r7_37 = tonumber(r5_37) / 100
    if r7_37 <= r0_37.LastTNPercent and r0_37.BossTNPercent < r7_37 then
      local r8_37 = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r0_37.ToughnessPart)
      r8_37:SetPosition(FVector2D(r0_37.ToughnessLength * r7_37 + r0_37.ToughnessPartOriginalPositionX, r8_37:GetPosition().Y))
      EMUIAnimationSubsystem:EMPlayAnimation(r0_37, r0_37.Toughness_Broken)
      AudioManager(r0_37):PlayUISound(r0_37, "event:/ui/common/boss_shield_bar_lose", nil, nil)
    end
  end
  -- close: r1_37
end
function r3_0.UpdateBossInvincibleState(r0_38, r1_38, r2_38)
  -- line: [795, 838] id: 38
  if r1_38 == nil then
    r1_38 = r0_38.Owner.bIsInvincible and r0_38.Owner:IsInvincible()
  end
  if r2_38 == nil then
    r2_38 = "DefaultTag"
  end
  if r1_38 then
    r0_38.InvincinbleTags[r2_38] = true
  else
    r0_38.InvincinbleTags[r2_38] = nil
  end
  r1_38 = not IsEmptyTable(r0_38.InvincinbleTags)
  if r1_38 then
    r0_38.VX_Boss_InvincibilLight:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_38.Toughness_Bar.WidgetStyle.FillImage.TintColor = r0_38.BossInvincibilityColor
    r0_38.Toughness_Bar_Light.WidgetStyle.FillImage.TintColor = r0_38.BossInvincibilityColor
    r0_38:AddTimer(r0_38.invincibility:GetEndTime(), function()
      -- line: [817, 820] id: 39
      EMUIAnimationSubsystem:EMPlayAnimation(r0_38, r0_38.invincibility)
    end, true, 0, "PlayLoopAnimation")
  else
    r0_38.VX_Boss_InvincibilLight:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_38.Toughness_Bar.WidgetStyle.FillImage.TintColor = r0_38.BossNormalColor
    r0_38.Toughness_Bar_Light.WidgetStyle.FillImage.TintColor = r0_38.BossNormalColor
    if r0_38:IsExistTimer("PlayLoopAnimation") then
      r0_38:RemoveTimer("PlayLoopAnimation")
      r0_38:StopAnimation(r0_38.invincibility)
    end
  end
  if r0_38.HpBar then
    r0_38.HpBar:PlayInvincibility(r1_38)
  end
  if r0_38.ShieldBar then
    r0_38.ShieldBar:PlayInvincibility(r1_38)
  end
end
function r3_0.HideBossBillboard(r0_40, r1_40)
  -- line: [840, 843] id: 40
  if not r1_40.bDisableGameInput then
    return 
  end
  r0_40.Boss_Part:SetVisibility(UE4.ESlateVisibility.Collapsed)
end
function r3_0.ShowBossBillboard(r0_41, r1_41)
  -- line: [845, 848] id: 41
  if not r1_41.bDisableGameInput then
    return 
  end
  r0_41.Boss_Part:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end
function r3_0.CloseBossBlood(r0_42)
  -- line: [850, 858] id: 42
  r0_42:Close()
end
function r3_0.OutHideTag(r0_43)
  -- line: [860, 862] id: 43
  r0_43:AddTimer(r0_43.BossTickTime, r0_43.ResetBossToughness, false, 0, "ResetBossToughness")
end
function r3_0.SetProgressbarSegmentNum(r0_44, r1_44, r2_44)
  -- line: [866, 875] id: 44
  if not r1_44 then
    return 
  end
  if not r2_44 then
    r2_44 = 1
  end
  local r3_44 = UE4.UWidgetBlueprintLibrary.GetDynamicMaterial(r1_44.WidgetStyle.FillImage)
  if r3_44 then
    r3_44:SetScalarParameterValue("SegmentsNumber", r2_44)
  end
end
function r3_0.SetImageSegmentNum(r0_45, r1_45, r2_45)
  -- line: [877, 886] id: 45
  if not r1_45 then
    return 
  end
  if not r2_45 then
    r2_45 = 1
  end
  local r3_45 = r1_45:GetDynamicMaterial()
  if r3_45 then
    r3_45:SetScalarParameterValue("SegmentsNumber", r2_45)
  end
end
function r3_0.SetToughnessBarPercent(r0_46, r1_46)
  -- line: [888, 907] id: 46
  if not r1_46 then
    r1_46 = 0
  end
  r1_46 = math.clamp(r1_46, 0, 1)
  r0_46.Toughness_Bar_Light:SetPercent(r1_46)
  r0_46.Toughness_Bar:SetPercent(r1_46)
  local r2_46 = 1 - r1_46
  r0_46.Progress_CountDownLeft:SetPercent(r2_46)
  r0_46.Progress_CountDownRight:SetPercent(r2_46)
  if r2_46 > 0 and r2_46 <= 0.3 and not r0_46.IsPercent_Warning and r0_46.Owner:CharacterInTag("Defeated") then
    r0_46:PlayAnimation(r0_46.Percent_Warning)
    r0_46.IsPercent_Warning = true
  elseif r2_46 == 0 and r0_46.IsPercent_Warning then
    r0_46:PlayAnimationReverse(r0_46.Percent_Warning)
    r0_46.IsPercent_Warning = false
    r0_46:ShowToughnessBar(true)
  end
  if r2_46 == 0 then
    AudioManager(r0_46):StopSound(r0_46, "BossShiedBarLoop")
  end
end
function r3_0.StopBossShiedBarLoopSound(r0_47)
  -- line: [909, 911] id: 47
  AudioManager(r0_47):StopSound(r0_47, "BossShiedBarLoop")
end
function r3_0.ShowOrHideToughnessBar(r0_48, r1_48)
  -- line: [913, 920] id: 48
  r0_48.CanShowBossTouughness = r1_48
  if r1_48 then
    r0_48.SizeBox_Toughness:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    r0_48.SizeBox_Toughness:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r3_0.ShowOrHidePanelTip(r0_49, r1_49)
  -- line: [922, 929] id: 49
  r0_49.CanShowPanelTip = r1_49
  if r1_49 then
    r0_49:SetPanelTipVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    r0_49:SetPanelTipVisibility(UE4.ESlateVisibility.Collapsed)
  end
end
function r3_0.SetBossLockHpState(r0_50, r1_50, r2_50, r3_50)
  -- line: [931, 943] id: 50
  if not r2_50 then
    r2_50 = 0
  end
  local r4_50 = nil	-- notice: implicit variable refs by block#[10, 11]
  if r3_50 and r3_50 > 0 then
    r4_50 = r3_50
    if r4_50 then
      ::label_9::
      r4_50 = r2_50 / r0_50.MaxHp
    end
  else
    goto label_9	-- block#5 is visited secondly
  end
  local r5_50 = r0_50.Owner:GetAttr("Hp") / r0_50.MaxHp
  if not r1_50 then
    r0_50.HpBar:DirectSetBarPercent(r5_50)
  end
  r0_50.IsLockHp = r1_50
  r0_50:UpdateBossInvincibleState(r1_50, "LockHp")
  if r1_50 and r0_50.HpBar and r4_50 <= r5_50 then
    r0_50.HpBar:DirectSetBarPercent(r4_50)
  end
end
function r3_0.SetPanelTipVisibility(r0_51, r1_51)
  -- line: [945, 966] id: 51
  if r0_51.PanelTipVisibility == r1_51 then
    return 
  end
  r0_51.PanelTipVisibility = r1_51
  r0_51.PanelTip:SetVisibility(r1_51)
  if r0_51.PanelTipText then
    r0_51.PanelTipText:SetVisibility(r1_51)
  end
  if r1_51 == UE4.ESlateVisibility.Collapsed then
    local r2_51 = r0_51.HB_Buff_BP.Slot.Padding
    r2_51.Top = r0_51.Buff_BP_TopOffset_NoTips
    r0_51.HB_Buff_BP.Slot:SetPadding(r2_51)
    r0_51.TakeDownTip:SetText(GText("UI_BOSSBATTLE_TAKEDOWN"))
  else
    local r2_51 = r0_51.HB_Buff_BP.Slot.Padding
    r2_51.Top = r0_51.Buff_BP_TopOffset_HaveTips
    r0_51.HB_Buff_BP.Slot:SetPadding(r2_51)
    r0_51.VX_percent_L:SetRenderTranslation(FVector2D(-r0_51.ToughnessWeakLength * 1 + r0_51.ToughnessWeakLength / 2, 0))
    r0_51.VX_percent_R:SetRenderTranslation(FVector2D(r0_51.ToughnessWeakLength * 1 + -r0_51.ToughnessWeakLength / 2, 0))
  end
end
function r3_0.UnLoadSelf(r0_52)
  -- line: [968, 980] id: 52
  local r1_52 = UE4.UGameplayStatics.GetGameInstance(r0_52)
  local r2_52 = r1_52 and r1_52:GetGameUIManager()
  if not r0_52.BossUIType or r0_52.BossUIType == EBossUIType.None then
    r2_52:UnLoadUINew("BossBlood")
  else
    r0_52:SetVisibility(ESlateVisibility.Collapsed)
    local r3_52 = r2_52:GetUIObj("DoubleBossBlood")
    if r3_52 then
      r3_52:OnBossDead()
    end
  end
end
function r3_0.SetEquipartition(r0_53, r1_53, r2_53, r3_53, r4_53, r5_53)
  -- line: [982, 986] id: 53
  if r0_53.HpBar then
    r0_53.HpBar:SetEquipartition(r1_53, r2_53, r3_53, r4_53, r5_53, r0_53.Owner)
  end
end
function r3_0.InterruptEquipartition(r0_54)
  -- line: [988, 999] id: 54
  local r1_54 = true
  if r0_54.HpBar then
    r1_54 = r0_54.HpBar:InterruptEquipartition(r0_54.Owner)
  end
  if not r1_54 then
    return 
  end
  local r3_54 = UE4.UGameplayStatics.GetGameInstance(r0_54):GetGameUIManager()
  if r3_54 then
    r3_54:ShowUITip(UIConst.Tip_CommonToast, GText("TODO"))
  end
end
function r3_0.SetBossRecoverInfo(r0_55, r1_55, r2_55, r3_55)
  -- line: [1001, 1009] id: 55
  if r0_55.HpBar then
    r0_55:UpdateBossInvincibleState(true, "BossRecover")
    r0_55:AddTimer(r2_55 + r1_55, function()
      -- line: [1004, 1006] id: 56
      r0_55:UpdateBossInvincibleState(false, "BossRecover")
    end, false, nil, "BossRecoverTimer")
    r0_55.HpBar:SetBossRecoverInfo(r0_55.Owner, r1_55, r2_55, r3_55)
  end
end
function r3_0.InterruptBossRecover(r0_57)
  -- line: [1011, 1028] id: 57
  local r1_57 = true
  if r0_57.HpBar then
    r1_57 = r0_57.HpBar:InterruptBossRecover(r0_57.Owner)
  end
  if r0_57:IsExistTimer("BossRecoverTimer") then
    r0_57:RemoveTimer("BossRecoverTimer")
    r0_57:UpdateBossInvincibleState(false, "BossRecover")
  end
  if not r1_57 then
    return 
  end
  if r0_57.Owner and not r0_57.Owner:IsDead() then
    local r3_57 = UE4.UGameplayStatics.GetGameInstance(r0_57):GetGameUIManager()
    if r3_57 then
      r3_57:ShowUITip(UIConst.Tip_CommonToast, GText("TODO"))
    end
  end
end
function r3_0.UpdateEquipartitionInfo(r0_58, r1_58, r2_58)
  -- line: [1030, 1034] id: 58
  if r0_58.HpBar then
    r0_58.HpBar:UpdateEquipartitionInfo(r1_58, r2_58)
  end
end
return r3_0
