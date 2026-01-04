-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\Dungeon\WBP_DungeonDefenseFloat_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class("BluePrints.UI.Dungeon.WBP_DungeonUIBase_C")
function r0_0.Initialize(r0_1, r1_1)
  -- line: [5, 26] id: 1
  r0_1.Super.Initialize(r0_1)
  r0_1.IsPause = false
  r0_1.LastShield = nil
  r0_1.LastHp = nil
  r0_1.UpdateTickTime = 0.5
  r0_1.LowHpPercent = 0.5
  r0_1.WavesRemained = nil
  r0_1.CurTargetActor = nil
  r0_1.ToastShowTime = 1
  r0_1.DefenseCoreNameSet = false
  rawset(r0_1, "NormalColor", FLinearColor(0.274677, 0.637597, 0.341915, 1))
  rawset(r0_1, "CriticalColor", FLinearColor(0.63, 0, 0, 1))
  if CommonUtils.GetDeviceTypeByPlatformName(r0_1) ~= "PC" then
    r0_1.UpdateTickTime = 1
  end
end
function r0_0.InitListenEvent(r0_2)
  -- line: [28, 42] id: 2
  r0_2.Super.InitListenEvent(r0_2)
  r0_2:AddDispatcher(EventID.CloseDungeonUI, r0_2, r0_2.CloseDungeonUI)
  r0_2:AddDispatcher(EventID.OnSetTempleLimit, r0_2, r0_2.OnSetTempleLimit)
  r0_2:AddDispatcher(EventID.OnTempleTimeChanged, r0_2, r0_2.OnTempleTimeChanged)
  r0_2:AddDispatcher(EventID.OnTempleScoreCollectChanged, r0_2, r0_2.OnTempleScoreCollectChanged)
  r0_2:AddDispatcher(EventID.OnDefenseWaveStart, r0_2, r0_2.OnDefenseWaveStart)
  r0_2:AddDispatcher(EventID.OnWaveStart, r0_2, r0_2.OnWaveStart)
  r0_2:AddDispatcher(EventID.OnWaveEnd, r0_2, r0_2.OnWaveEnd)
  r0_2:AddDispatcher(EventID.OnDefenceWaveEnd, r0_2, r0_2.OnDefenceWaveEnd)
end
function r0_0.UIStateChange_OnTarget(r0_3)
  -- line: [44, 74] id: 3
  if r0_3.TempleMode then
    return 
  end
  local r1_3 = UE4.UGameplayStatics.GetGameState(r0_3)
  if not r1_3 then
    return 
  end
  r0_3.IsRescueMode = r1_3.GameModeType == "Rescue"
  if r0_3.IsRescueMode then
    r0_3:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_3.BattlePanel:SetVisibility(UE4.ESlateVisibility.Visible)
    r0_3:AddTimer(r0_3.UpdateTickTime, r0_3.UpdateTargetInfo, true, 0, "UpdateMechanism", false)
    r0_3.DefenseCoreName:SetText(GText("UI_DUNGEON_HOSTAGE"))
    r0_3.LowHpPercent = 0.01
    r0_3:HideUselessWidget()
    r0_3.IsClient = IsClient(r0_3)
    r0_3:AddDispatcher(EventID.NotifyClientChangeHostageInvincible, r0_3, r0_3.SetInvincibility)
  else
    r0_3:TryOnDefenceCoreActive()
    r0_3:UpdateWaveCount()
    r0_3:AddTimer(r0_3.UpdateTickTime, r0_3.UpdateTargetInfo, true, 0, "UpdateMechanism", false)
  end
  if r0_3.IsSynthesisMode then
    r0_3:HideUselessWidget()
  end
  r0_3.BattlePanel:SetVisibility(UE4.ESlateVisibility.Visible)
end
function r0_0.CloseDungeonUI(r0_4)
  -- line: [76, 88] id: 4
  if r0_4.TempleMode then
    return 
  end
  if r0_4.IsSynthesisMode and UIManager(r0_4):GetUIObj("DefenseLowHealth") then
    UIManager(r0_4):UnLoadUINew("DefenseLowHealth")
  end
  r0_4:RemoveFromParent()
end
function r0_0.PauseCountDown(r0_5)
  -- line: [89, 91] id: 5
  r0_5.IsPause = true
end
function r0_0.ResumeCountDown(r0_6)
  -- line: [93, 95] id: 6
  r0_6.IsPause = false
end
function r0_0.OnEnd(r0_7)
  -- line: [97, 100] id: 7
  print(_G.LogTag, "WBP_DungeonDefenseFloat_C:OnEnd()")
end
function r0_0.OnLoaded(r0_8, ...)
  -- line: [102, 138] id: 8
  r0_8.Super.OnLoaded(r0_8, ...)
  r0_8:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_8.BattlePanel:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_8.IsActive = nil
  r0_8:CheckDungeonMode()
  r0_8:OnDungeonUIStateUpdated()
  r0_8:InitWidgetInfo()
  r0_8:InitListenEvent()
  local r1_8 = r0_8.TempleMode
  if r1_8 then
    r0_8:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_8.BattlePanel:SetVisibility(UE4.ESlateVisibility.Visible)
    return 
  end
  ... = ... -- error: untaken top expr
  r0_8.IsRescueMode = r1_8
  r0_8.LastHpPercent = 1
  r0_8.SizeBox_HP:ClearChildren()
  r0_8.SizeBox_Shield:ClearChildren()
  r0_8:LoadHpBar()
  r0_8:LoadShieldBar()
end
function r0_0.ReActiveCurGuideAnim(r0_9)
  -- line: [140, 162] id: 9
  local r2_9 = UE4.UGameplayStatics.GetGameInstance(r0_9):GetGameUIManager()
  if r2_9 == nil or not UE4.UKismetSystemLibrary.IsValid(r2_9) then
    return 
  end
  local r3_9 = TArray("")
  for r8_9, r9_9 in pairs(UIConst.DUNGEONINDICATOR) do
    local r10_9 = r2_9:GetAllUINameByBPClass(UE4.UClass.Load(r9_9))
    if r10_9:Length() > 0 then
      for r14_9 = 1, r10_9:Length(), 1 do
        r3_9:Add(r10_9:GetRef(r14_9))
      end
    end
  end
  -- close: r4_9
  for r7_9 = 1, r3_9:Length(), 1 do
    local r9_9 = r2_9:GetUIObj(r3_9:GetRef(r7_9))
    if r9_9 ~= nil then
      r9_9:RePlayAppearAnim()
    end
  end
end
function r0_0.UpdateTargetInfo(r0_10)
  -- line: [164, 266] id: 10
  local r1_10 = r0_10:GetTargetActor()
  if not r1_10 and not r0_10.IsClient then
    return 
  end
  if not r0_10:IsAnimationPlaying(r0_10.Shield_Glow) then
    r0_10.Shield_glowLine:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if not r0_10:IsAnimationPlaying(r0_10.HP_Glow) then
    r0_10.HP_glowLine:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if not r0_10.DefenseCoreNameSet and not r0_10.IsRescueMode and r1_10 and DataMgr.Mechanism[r1_10.UnitId].UnitName then
    r0_10.DefenseCoreName:SetText(GText(DataMgr.Mechanism[r1_10.UnitId].UnitName))
    r0_10.DefenseCoreNameSet = true
  end
  local r2_10 = r0_10:GetAttrFromTarget(r1_10, "ES")
  local r3_10 = r0_10:GetAttrFromTarget(r1_10, "MaxES")
  local r4_10 = r0_10:GetAttrFromTarget(r1_10, "Hp")
  local r5_10 = r0_10:GetAttrFromTarget(r1_10, "MaxHp")
  local r6_10 = r0_10:GetAttrFromTarget(r1_10, "OverShield")
  if not r0_10.LastHp then
    r0_10.LastHp = r4_10
  end
  if not r0_10.LastShield then
    r0_10.LastShield = r2_10
  end
  if not r0_10.LastOverShield then
    r0_10.LastOverShield = r6_10
  end
  local r7_10 = (r2_10 + r6_10) / r3_10
  local r8_10 = r0_10.ShieldBar
  local r9_10 = r0_10.HpBar
  local r10_10 = r0_10.LastShield
  local r11_10 = r0_10.LastHp
  if r2_10 < r10_10 then
    r8_10:SetBarPercent(r7_10)
    if r2_10 < r10_10 then
      r8_10:PlayDeduct(true)
    end
  elseif r10_10 < r2_10 then
    r8_10:SetBarPercent(r7_10, false)
    r8_10:PlayRecoveryShield()
  else
    r8_10:DirectSetBarPercent(r7_10, 0)
  end
  local r12_10 = r0_10.IsRescueMode
  if r12_10 then
    if r3_10 > 0 then
      r12_10 = r6_10 / r3_10 and 0
    else
      goto label_129	-- block#27 is visited secondly
    end
    if r6_10 < r0_10.LastOverShield or r12_10 < 0.001 then
      r8_10:SetOverShieldPercent(r12_10)
      r8_10:PlayOverShieldDeduct(true)
      if r12_10 < 0.001 then
        r8_10:ShowOrHideOverShieldGroup(false)
      end
    elseif r0_10.LastOverShield < r6_10 then
      r8_10:SetOverShieldPercent(r12_10)
      if r0_10.LastOverShield < 0.001 then
        r8_10:ShowOrHideOverShieldGroup(true)
      end
      r8_10:PlayOverShieldRecover()
    end
  end
  r12_10 = r4_10 / r5_10
  r9_10:SetBarPercent(r12_10)
  if r4_10 < r11_10 and r4_10 < r11_10 then
    r9_10:PlayDeduct(true)
  end
  if not r0_10.IsRescueMode then
    if not r1_10 or not r1_10.ForbideLowHealthUI then
      r0_10:LoadLowHealthUI(r12_10)
    end
    if r4_10 < r11_10 then
      if r12_10 < r0_10.LastHpPercent then
        r0_10:PlayGlowAnim(r4_10 / r5_10, r0_10.HP_glowLine, r0_10.Warning_Glow)
      else
        r0_10:PlayGlowAnim(r4_10 / r5_10, r0_10.HP_glowLine, r0_10.HP_Glow)
      end
    end
    if r2_10 < r10_10 then
      r0_10:PlayGlowAnim(r2_10 / r3_10, r0_10.Shield_glowLine, r0_10.Shield_Glow)
    end
  end
  if r12_10 < (r0_10.LowHpPercent and 0.5) then
    r9_10:SetProgressBarColorInner(r0_10.CriticalColor)
  else
    r9_10:SetProgressBarColorInner(r0_10.NormalColor)
  end
  r0_10.LastShield = r2_10
  r0_10.LastHp = r4_10
  r0_10.LastHpPercent = r12_10
  r0_10:SetBloodAndShieldNum(r4_10, r2_10, r12_10)
end
function r0_0.PlayGlowAnim(r0_11, r1_11, r2_11, r3_11)
  -- line: [268, 282] id: 11
  if r0_11.IsRescueMode then
    return 
  end
  local r5_11 = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r0_11.SizeBox_HP):GetSize()
  local r7_11 = FVector2D(0, 0)
  r7_11.X = r5_11.X * r0_11.SizeBox_HP.RenderTransform.Scale.X * r1_11
  local r8_11 = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r2_11)
  r7_11.Y = r8_11:GetPosition().Y
  r8_11:SetPosition(r7_11)
  r2_11:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  EMUIAnimationSubsystem:EMPlayAnimation(r0_11, r3_11)
end
function r0_0.SetInvincibility(r0_12, r1_12)
  -- line: [284, 296] id: 12
  if r1_12 == nil then
    r1_12 = true
  end
  if r0_12.HpBar then
    r0_12.HpBar:PlayInvincibility(r1_12)
  end
  if r0_12.ShieldBar then
    r0_12.ShieldBar:PlayInvincibility(r1_12)
  end
end
function r0_0.SetBloodAndShieldNum(r0_13, r1_13, r2_13, r3_13)
  -- line: [298, 326] id: 13
  r0_13.Num_Shield:SetText(math.floor(r2_13))
  r0_13.Num_Blood:SetText(math.floor(r1_13))
  local r4_13 = FSlateColor()
  local r5_13 = r3_13 < r0_13.LowHpPercent
  if r5_13 then
    r4_13.SpecifiedColor.R = 1
    r4_13.SpecifiedColor.G = 0.048
    r4_13.SpecifiedColor.B = 0.048
    r0_13.Num_Blood:SetColorAndOpacity(r4_13)
  else
    r4_13.SpecifiedColor.R = 0.258183
    r4_13.SpecifiedColor.G = 0.590619
    r4_13.SpecifiedColor.B = 0.318547
    r0_13.Num_Blood:SetColorAndOpacity(r4_13)
  end
  if r0_13.IsRescueMode then
    if r5_13 then
      r0_13.DefenseCoreName:SetColorAndOpacity(r4_13)
    else
      r4_13.SpecifiedColor.R = 1
      r4_13.SpecifiedColor.G = 1
      r4_13.SpecifiedColor.B = 1
      r0_13.DefenseCoreName:SetColorAndOpacity(r4_13)
    end
  end
end
function r0_0.UpdateDungeonProgressDisplay(r0_14, r1_14)
  -- line: [328, 330] id: 14
  r0_14.Num_Wave_Now:SetText(r1_14)
end
function r0_0.TryOnDefenceCoreActive(r0_15)
  -- line: [336, 346] id: 15
  if r0_15:OnDefenceCoreActive() then
    return 
  else
    r0_15:AddTimer(0.1, function()
      -- line: [340, 344] id: 16
      if r0_15:OnDefenceCoreActive() then
        r0_15:RemoveTimer("TryOnDefenceCoreActive")
      end
    end, true, 0, "TryOnDefenceCoreActive")
  end
end
function r0_0.OnDefenceCoreActive(r0_17)
  -- line: [348, 380] id: 17
  if r0_17.TempleMode then
    return 
  end
  local r1_17 = r0_17:GetDefenseCore()
  if not r1_17 or r0_17.IsActive then
    return false
  end
  r0_17.IsActive = true
  r0_17.LowHpPercent = 0.5
  r0_17.TextBlock_1:SetText(GText("UI_Defense_Done"))
  r0_17.TextBlock_2:SetText(GText("UI_Defense_Remain"))
  r0_17.Num_Shield:SetText(math.floor(r1_17:GetAttr("MaxES")))
  r0_17.Num_Blood:SetText(math.floor(r1_17:GetAttr("MaxHp")))
  r0_17:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  r0_17.BattlePanel:SetVisibility(UE4.ESlateVisibility.Visible)
  if r0_17.IsNewDefenceMode then
    r0_17.Defensivewave:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_17.LeftWave:SetVisibility(UE4.ESlateVisibility.Collapsed)
    r0_17.Panel_Wave:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    r0_17.Text_Wave:SetText(GText("TARGET_DUNGEON_DEFENCE_WAVE"))
  end
  return true
end
function r0_0.OnDefenceCoreDead(r0_18, r1_18)
  -- line: [384, 396] id: 18
  if r0_18.TempleMode then
    return 
  end
  r0_18.HpBar:SetBarPercent(0)
  r0_18.Hp_glowLine:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_18:SetBloodAndShieldNum(0, 0, 0)
  local r3_18 = GWorld.GameInstance:GetGameUIManager():GetUIObj("DefenseLowHealth")
  if r3_18 then
    r3_18:OnDefenceCoreDead(r1_18)
  elseif r1_18 then
    r1_18()
  end
end
function r0_0.LoadLowHealthUI(r0_19, r1_19)
  -- line: [413, 443] id: 19
  if not r1_19 then
    return 
  end
  local r2_19 = GWorld.GameInstance:GetGameUIManager()
  if r1_19 <= 0.3 then
    if r0_19.LastHpPercent > 0.3 then
      local r3_19 = 1.5
      local r4_19 = GText("UI_Tosat_Defense_LowHealth")
      if r0_19.IsSynthesisMode then
        r4_19 = GText("DUNGEON_SYNTHESIS_106")
      end
      r2_19:ShowUITip(UIConst.Tip_CommonWarning, r4_19, r3_19)
      r0_19:AddTimer(r3_19 + 0.2, function()
        -- line: [427, 429] id: 20
        r2_19:LoadUINew("DefenseLowHealth")
      end, false, 0, nil, false)
    end
    local r3_19 = r2_19:GetUIObj("DefenseLowHealth")
    if r3_19 then
      r3_19.Text_Health:SetText(tostring(math.floor(r1_19 * 100)))
    end
  elseif r2_19:GetUIObj("DefenseLowHealth") then
    r2_19:UnLoadUINew("DefenseLowHealth")
  end
end
function r0_0.LoadSubWidget(r0_21, r1_21, r2_21, ...)
  -- line: [449, 455] id: 21
  if not r1_21 then
    return 
  end
  local r3_21 = r0_21:CreateWidgetNew(r2_21)
  r1_21:AddChild(r3_21)
  r3_21:Init(...)
  return r1_21:GetChildAt(0)
end
function r0_0.LoadHpBar(r0_22)
  -- line: [457, 460] id: 22
  r0_22.HpBar = r0_22:LoadSubWidget(r0_22.SizeBox_HP, "HPBar", false, UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r0_22.SizeBox_HP):GetSize().X)
end
function r0_0.LoadShieldBar(r0_23)
  -- line: [462, 466] id: 23
  local r2_23 = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(r0_23.SizeBox_Shield):GetSize()
  r0_23.ShieldBar = r0_23:LoadSubWidget(r0_23.SizeBox_Shield, "ShieldBar", r2_23.X, r2_23.Y)
end
function r0_0.HideUselessWidget(r0_24)
  -- line: [470, 487] id: 24
  local function r1_24(r0_25, r1_25)
    -- line: [471, 475] id: 25
    if r0_25 and r1_25 then
      r0_25:SetVisibility(r1_25)
    end
  end
  r1_24(r0_24.HorizontalBox_HP, UE4.ESlateVisibility.Collapsed)
  r1_24(r0_24.Deduct_Blood, UE4.ESlateVisibility.Collapsed)
  r1_24(r0_24.Deduct_Shield, UE4.ESlateVisibility.Collapsed)
  if r0_24.IsRescueMode then
    r1_24(r0_24.Defensivewave, UE4.ESlateVisibility.Collapsed)
    r1_24(r0_24.LeftWave, UE4.ESlateVisibility.Collapsed)
  end
  if r0_24.IsSynthesisMode then
    r1_24(r0_24.Defensivewave, UE4.ESlateVisibility.Collapsed)
    r1_24(r0_24.LeftWave, UE4.ESlateVisibility.Collapsed)
  end
end
function r0_0.GetTargetActor(r0_26)
  -- line: [491, 502] id: 26
  local r1_26 = nil
  if r0_26.IsRescueMode then
    r1_26 = r0_26:GetRescueActor()
  else
    r1_26 = r0_26:GetDefenseCore()
  end
  if IsValid(r1_26) then
    return r1_26
  end
end
function r0_0.GetDefenseCore(r0_27)
  -- line: [504, 527] id: 27
  if IsValid(r0_27.CurTargetActor) then
    return r0_27.CurTargetActor
  end
  local r1_27 = UE4.UGameplayStatics.GetGameState(r0_27)
  if not r1_27 then
    return 
  end
  local r2_27 = r1_27.DefBaseMap:Keys()
  if r2_27:Length() <= 0 then
    return 
  end
  local r4_27 = Battle(r0_27):GetEntity(r2_27:GetRef(1))
  if not r4_27 then
    return 
  end
  r0_27.CurTargetActor = r4_27
  return r0_27.CurTargetActor
end
function r0_0.GetRescueActor(r0_28)
  -- line: [529, 547] id: 28
  if IsValid(r0_28.CurTargetActor) then
    return r0_28.CurTargetActor
  end
  local r1_28 = UE4.UGameplayStatics.GetGameState(r0_28)
  if not r1_28 then
    return 
  end
  for r6_28, r7_28 in pairs(r1_28.MonsterMap) do
    if IsValid(r7_28) and r7_28.IsHostage then
      r0_28.CurTargetActor = r7_28
      break
    end
  end
  -- close: r2_28
  return r0_28.CurTargetActor
end
function r0_0.CheckDungeonMode(r0_29)
  -- line: [552, 576] id: 29
  local r1_29 = UE4.UGameplayStatics.GetGameInstance(r0_29)
  if not r1_29 then
    return 
  end
  r0_29.DungeonId = r1_29:GetCurrentDungeonId()
  r0_29.DungeonInfo = DataMgr.Dungeon[r0_29.DungeonId]
  if not r0_29.DungeonInfo then
    return 
  end
  if r0_29.DungeonInfo.DungeonWinMode == CommonConst.DungeonWinMode.Endless then
    r0_29.IsEndlessMode = true
  end
  if r0_29.DungeonInfo.DungeonType == "Defence" or r0_29.DungeonInfo.DungeonType == "DefenceMove" then
    r0_29.IsNewDefenceMode = true
  end
  if r0_29.DungeonInfo.DungeonType == "Temple" then
    r0_29.TempleMode = true
    r0_29.TempleInfo = DataMgr.Temple[r0_29.DungeonId]
    r0_29:InitTemple()
  end
  if r0_29.DungeonInfo.DungeonType == "Synthesis" then
    r0_29.IsSynthesisMode = true
  end
end
function r0_0.InitTemple(r0_30)
  -- line: [578, 598] id: 30
  r0_30.BattlePanel:SetVisibility(UE4.ESlateVisibility.Visible)
  r0_30.Bar_Blood:SetVisibility(ESlateVisibility.Collapsed)
  r0_30.Num_Shield:SetVisibility(ESlateVisibility.Collapsed)
  r0_30.Num_Blood:SetVisibility(ESlateVisibility.Collapsed)
  r0_30.DefendedWaveCount:SetVisibility(ESlateVisibility.Collapsed)
  r0_30.RemainingWaveCount:SetVisibility(ESlateVisibility.Collapsed)
  r0_30.DefenseCoreName:SetVisibility(ESlateVisibility.Hidden)
  r0_30.Spacer_Temple:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  local r1_30 = r0_30.TextBlock_1.ColorAndOpacity
  r1_30.SpecifiedColor.A = 1
  r0_30.TextBlock_1:SetColorAndOpacity(r1_30)
  r0_30.BattlePanel:SetVisibility(ESlateVisibility.Hidden)
  r0_30.IsCountDown = false
  if r0_30.TempleInfo.SucRule == "CountDown" then
    r0_30.IsCountDown = true
  else
    r0_30:InitTargetInfo()
  end
end
function r0_0.OnTempleTimeChanged(r0_31, r1_31, r2_31)
  -- line: [600, 611] id: 31
  if r0_31.TempleInfo.SucRule == "Time" then
    r0_31.TextBlock_2:SetText(GText("UI_TEMPLE_TOTAL_TIME") .. ": " .. r0_31:GetTimeStr(r1_31))
  end
  if r0_31.Limit == "TIME" then
    local r3_31 = r2_31 - r1_31
    if r3_31 >= 0 then
      r0_31.DefenseCoreName:SetText(GText("UI_TEMPLE_LIMIT_" .. r0_31.Limit) .. r0_31:GetTimeStr(r3_31))
    end
  end
end
function r0_0.OnSetTempleLimit(r0_32, r1_32, r2_32)
  -- line: [613, 626] id: 32
  r0_32.Limit = r1_32
  r0_32.DefenseCoreName:SetVisibility(ESlateVisibility.Visible)
  if r1_32 == "TIME" then
    r0_32.TimeThreshold = r2_32
    r0_32.DefenseCoreName:SetText(GText("UI_TEMPLE_LIMIT_" .. r0_32.Limit) .. r0_32:GetTimeStr(r2_32))
  else
    r0_32.DefenseCoreName:SetText(GText("UI_TEMPLE_LIMIT_" .. r0_32.Limit) .. r2_32)
  end
  if r0_32.IsCountDown then
    r0_32:InitTargetInfo()
  end
end
function r0_0.OnTempleScoreCollectChanged(r0_33, r1_33)
  -- line: [628, 630] id: 33
  r0_33.TextBlock_2:SetText(GText("UI_TEMPLE_TOTAL_" .. string.upper(r0_33.TempleInfo.SucRule)) .. ": " .. r1_33)
end
function r0_0.OnTempleDeathFallChanged(r0_34, r1_34)
  -- line: [632, 636] id: 34
  if r1_34 >= 0 then
    r0_34.DefenseCoreName:SetText(GText("UI_TEMPLE_LIMIT_" .. r0_34.Limit) .. r1_34)
  end
end
function r0_0.InitTargetInfo(r0_35)
  -- line: [638, 678] id: 35
  local r1_35 = ""
  if r0_35.TempleInfo.SucRule == "Time" then
    r1_35 = "SECONDS"
    r0_35.TextBlock_2:SetText(GText("UI_TEMPLE_TOTAL_" .. string.upper(r0_35.TempleInfo.SucRule)) .. ": 00:00")
  elseif r0_35.TempleInfo.SucRule == "CountDown" then
    r1_35 = "SECONDS"
    r0_35.TextBlock_2:SetVisibility(ESlateVisibility.Collapsed)
  elseif r0_35.TempleInfo.SucRule == "Score" then
    r1_35 = "SCORE"
    r0_35.TextBlock_2:SetText(GText("UI_TEMPLE_TOTAL_" .. string.upper(r0_35.TempleInfo.SucRule)) .. ": 0")
  elseif r0_35.TempleInfo.SucRule == "Collect" then
    r1_35 = "COUNT"
    r0_35.TextBlock_2:SetText(GText("UI_TEMPLE_TOTAL_" .. string.upper(r0_35.TempleInfo.SucRule)) .. ": 0")
  end
  local r2_35 = GText("UI_TEMPLE_" .. r0_35.DungeonId)
  if #r0_35.TempleInfo.RewardId > 1 and #r0_35.TempleInfo.RatingRange > 1 then
    for r6_35 = 3, 1, -1 do
      local r7_35 = ""
      local r8_35 = r0_35.TempleInfo.RatingRange[r6_35]
      if r8_35 == 0 then
        r7_35 = GText("UI_TEMPLE_SUCRULE_ZERO")
      elseif r0_35.TempleInfo.SucRule == "CountDown" and r0_35.TempleInfo.UIShowType and r0_35.TempleInfo.UIShowType > 0 and r0_35.TimeThreshold and r0_35.TimeThreshold > 0 then
        r7_35 = string.format(GText("UI_TEMPLE_SUCRULE_COUNTDOWN_" .. r0_35.TempleInfo.UIShowType), r0_35.TimeThreshold - r8_35)
      elseif r1_35 == "SCORE" then
        r7_35 = GText("UI_TEMPLE_SUCRULE_" .. string.upper(r0_35.TempleInfo.SucRule)) .. r8_35
      else
        r7_35 = GText("UI_TEMPLE_SUCRULE_" .. string.upper(r0_35.TempleInfo.SucRule)) .. r8_35 .. GText("UI_TEMPLE_MEASURE_" .. r1_35)
      end
      r2_35 = r2_35 .. "\n" .. GText("UI_TEMPLE_BLANK") .. GText("UI_TEMPLE_STAR_" .. r6_35) .. r7_35
    end
  end
  r0_35.TextBlock_1:SetText(r2_35)
  r0_35.BattlePanel:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
end
function r0_0.GetWaveStartBP(r0_36)
  -- line: [682, 698] id: 36
  local r1_36 = UE4.UGameplayStatics.GetGameInstance(r0_36)
  if r1_36:GetGameUIManager() == nil then
    return 
  end
  local r3_36 = r1_36:GetGameUIManager()
  local r4_36 = r3_36:GetUIObj("WaveStartBP") and r3_36:LoadUINew("WaveStartBP")
  r4_36:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  return r4_36
end
function r0_0.OnDefenseWaveStart(r0_37)
  -- line: [700, 727] id: 37
  local r1_37 = UE4.UGameplayStatics.GetGameState(r0_37)
  if not r1_37 then
    return 
  end
  r0_37.HintTime = r1_37.DefenceWaveInterval
  local r2_37 = r0_37:GetWaveStartBP()
  if r2_37 then
    r2_37:SetVisibility(ESlateVisibility.Collapsed)
    r2_37.Text_WaveStart:SetText(GText("DUNGEON_DEFENCE_101"))
    r0_37:AddTimer(r0_37.HintTime, function()
      -- line: [711, 716] id: 38
      r2_37:SetVisibility(ESlateVisibility.HitTestInvisible)
      r2_37:PlayInAnimation()
      AudioManager(r0_37):PlayUISound(nil, "event:/ui/common/battle_warning", nil, nil)
    end)
    r0_37:AddTimer(r0_37.HintTime + r0_37.ToastShowTime, function()
      -- line: [718, 721] id: 39
      r2_37:PlayOutAnimation()
    end)
  end
  r0_37:ShowCountDown()
  r0_37:UpdateWaveCount()
  r0_37:AddTimer(r0_37.UpdateTickTime, r0_37.UpdateTargetInfo, true, 0, "UpdateMechanism", false)
end
function r0_0.OnWaveStart(r0_40)
  -- line: [729, 750] id: 40
  local r1_40 = UE4.UGameplayStatics.GetGameState(r0_40)
  if not r1_40 then
    return 
  end
  r0_40.HintTime = r1_40.DefenceWaveInterval
  local r2_40 = UE4.UGameplayStatics.GetGameInstance(r0_40)
  if r2_40:GetGameUIManager() == nil then
    return 
  end
  local r4_40 = r2_40:GetGameUIManager()
  local r5_40 = r4_40:GetUIObj("GuideTextFloat") and r4_40:LoadUI(UIConst.GUIDETEXTFLOAT, "GuideTextFloat", UIConst.ZORDER_FOR_SECONDARY_POPUP)
  if r5_40 then
    r5_40:ShowDungeonGuide("DUNGEON_TRAINING_101", r0_40.ToastShowTime)
  end
  r0_40:AddTimer(r0_40.ToastShowTime, r0_40.ShowCountDown)
end
function r0_0.OnDefenceWaveEnd(r0_41)
  -- line: [752, 764] id: 41
  local r1_41 = r0_41:GetWaveStartBP()
  if r1_41 then
    r1_41.Text_WaveStart:SetText(GText("DUNGEON_DEFENCE_102"))
    EMUIAnimationSubsystem:EMPlayAnimation(r1_41, r1_41.In)
    r0_41:AddTimer(r0_41.ToastShowTime, function()
      -- line: [759, 762] id: 42
      EMUIAnimationSubsystem:EMPlayAnimation(r1_41, r1_41.Out)
    end)
  end
end
function r0_0.OnWaveEnd(r0_43)
  -- line: [766, 781] id: 43
  local r1_43 = UE4.UGameplayStatics.GetGameInstance(r0_43)
  if r1_43:GetGameUIManager() == nil then
    return 
  end
  local r3_43 = r1_43:GetGameUIManager()
  local r4_43 = r3_43:GetUIObj("GuideTextFloat") and r3_43:LoadUI(UIConst.GUIDETEXTFLOAT, "GuideTextFloat", UIConst.ZORDER_FOR_SECONDARY_POPUP)
  if r4_43 then
    r4_43:ShowDungeonGuide("DUNGEON_TRAINING_102", r0_43.ToastShowTime)
  end
  r0_43:AddTimer(r0_43.ToastShowTime, r0_43.ShowCountDown)
end
function r0_0.ShowCountDown(r0_44)
  -- line: [783, 795] id: 44
  local r1_44 = UE4.UGameplayStatics.GetGameInstance(r0_44)
  if r1_44:GetGameUIManager() == nil then
    return 
  end
  local r3_44 = r1_44:GetGameUIManager()
  (r3_44:GetUIObj("GuideCountDown") and r3_44:LoadUINew("GuideCountDown")):InitializeData(r0_44.HintTime)
end
function r0_0.InitWidgetInfo(r0_45)
  -- line: [797, 812] id: 45
  r0_45.Bar_Blood:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_45.Num_Shield:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_45.Num_Blood:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  r0_45.DefendedWaveCount:SetVisibility(ESlateVisibility.Visible)
  r0_45.RemainingWaveCount:SetVisibility(ESlateVisibility.Visible)
  r0_45.DefenseCoreName:SetVisibility(ESlateVisibility.Visible)
  r0_45.Spacer_Temple:SetVisibility(UE4.ESlateVisibility.Collapsed)
  r0_45.TextBlock_1:SetVisibility(ESlateVisibility.Visible)
  local r1_45 = r0_45.TextBlock_1.ColorAndOpacity
  r1_45.SpecifiedColor.A = 0.8
  r0_45.TextBlock_1:SetColorAndOpacity(r1_45)
  r0_45.TextBlock_2:SetVisibility(ESlateVisibility.Visible)
  r0_45.DefenseCoreName:SetText(GText("UI_DUNGEON_HOSTAGE"))
end
function r0_0.UpdateWaveCount(r0_46)
  -- line: [814, 827] id: 46
  if not GameState then
    return 
  end
  local r1_46 = UE4.UGameplayStatics.GetGameState(r0_46)
  local r2_46 = (r1_46.DefenceWave + -1) % 3
  r0_46.WavesRemained = r1_46.DefenceWavesPerStage - r2_46
  if r0_46.IsNewDefenceMode then
    r0_46.Num_DefensedWave:SetText(r2_46)
    r0_46.Num_TotalWave:SetText(r1_46.DefenceWavesPerStage)
  else
    r0_46.DefendedWaveCount:SetText(r1_46.DefenceWave + -1)
    r0_46.RemainingWaveCount:SetText(r0_46.WavesRemained)
  end
end
function r0_0.GetAttrFromTarget(r0_47, r1_47, r2_47)
  -- line: [829, 839] id: 47
  if r1_47 then
    return r1_47:GetAttr(r2_47)
  end
  if r0_47.IsClient then
    local r3_47 = UE4.UGameplayStatics.GetGameState(r0_47)
    if not r3_47 then
      return 
    end
    return r3_47.HostageState["Hostage" .. r2_47] and 0
  end
end
return r0_0
