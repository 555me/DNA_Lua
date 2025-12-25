-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Activity\Mobile\FeinaEvent\WBP_Activity_FeinaEvent_HUD_M_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.BP_UIState_C"
})
r0_0._components = {
  "BluePrints.UI.UIComponent.TouchComponent"
}
function r0_0.Construct(r0_1)
  -- line: [21, 38] id: 1
  r0_1.HideUITable = {
    Pos_Entry = 1,
    Pos_Drops = 1,
    Pos_SpecialDrops = 1,
    Pos_NewMonster = 1,
    Battle_Map = 1,
    Btn_Esc = 1,
    Btn_GuideBook = 1,
    Chat_Entry = 1,
    Buff = 1,
    Char_Skill = 1,
    Team = 1,
  }
  r0_1.PassiveEffectId = 18011
  r0_1.IsLoading = true
  r0_1.CollectLevel = 0
end
function r0_0.InitUIInfo(r0_2, r1_2, r2_2, r3_2, ...)
  -- line: [40, 58] id: 2
  r0_2.Super.InitUIInfo(r0_2, r1_2, r2_2, r3_2, ...)
  r0_2.Player = UE4.UGameplayStatics.GetPlayerCharacter(r0_2, 0)
  r0_2.FeinaPassive = r0_2.Player:GetPassiveEffectById(r0_2.PassiveEffectId)
  if not IsValid(r0_2.FeinaPassive) then
    DebugPrint("找不到FeinaPassive")
    return 
  end
  r0_2:InitDungeonInfo()
  r0_2.ColorMax = r0_2.FeinaPassive.ColorMax
  r0_2:InitEsc()
  r0_2:InitPaintIcon()
  r0_2:InitCollectProgress()
  r0_2:ChoosePaint(r0_2.FeinaPassive.ColorIndex)
  r0_2:InitButtons()
  r0_2:AddDispatcher(EventID.OnRepFeinaStar, r0_2, r0_2.OnCollectFeinaStar)
  r0_2:AddDispatcher(EventID.CloseLoading, r0_2, r0_2.OnCloseLoading)
  r0_2:AddDispatcher(EventID.OnMobileHookShow, r0_2, r0_2.OnMobileHookShow)
end
function r0_0.InitDungeonInfo(r0_3)
  -- line: [60, 71] id: 3
  local r1_3 = UE4.UGameplayStatics.GetGameState(r0_3)
  if not IsValid(r1_3) then
    DebugPrint("找不到GameState")
    return 
  end
  r0_3.DungeonId = r1_3.DungeonId
  local r3_3 = DataMgr.FeinaEventDungeon[r0_3.DungeonId].DungeonSDes
  r0_3.Text_Title:SetText(GText(DataMgr.FeinaEventDungeon[r0_3.DungeonId].DungeonName))
  r0_3.Text_Target:SetText(GText(r3_3))
end
function r0_0.InitEsc(r0_4)
  -- line: [73, 80] id: 4
  r0_4.Btn_Esc.bForceInvisible = nil
  r0_4.Btn_Esc.Btn_top.OnClicked:Add(r0_4, function()
    -- line: [75, 77] id: 5
    UIUtils.OpenEsc()
  end)
  r0_4.Btn_Esc:LoadImage(11)
end
function r0_0.PlayInAnim(r0_6)
  -- line: [82, 84] id: 6
  r0_6:PlayAnimation(r0_6.In)
end
function r0_0.PlayOutAnim(r0_7)
  -- line: [86, 88] id: 7
  r0_7:PlayAnimation(r0_7.Out)
end
function r0_0.InitPaintIcon(r0_8)
  -- line: [90, 104] id: 8
  for r4_8 = 1, 3, 1 do
    if r4_8 <= r0_8.ColorMax then
      r0_8["Paint0" .. r4_8]:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      r0_8["Paint0" .. r4_8]:InitPaint(r4_8)
    else
      r0_8["Paint0" .. r4_8]:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  if r0_8.ColorMax == 1 then
    r0_8.Btn_Change:SetVisibility(ESlateVisibility.Collapsed)
  else
    r0_8.Btn_Change:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end
function r0_0.UpdatePaintIcon(r0_9, r1_9)
  -- line: [106, 113] id: 9
  r0_9.ColorMax = r1_9
  if r0_9.IsLoading then
    r0_9.NeedToast = true
  else
    r0_9:InitHUDToast()
  end
end
function r0_0.InitHUDToast(r0_10)
  -- line: [115, 128] id: 10
  r0_10:InitPaintIcon()
  AudioManager(r0_10):PlayUISound(r0_10, "event:/ui/activity/feina_brush_unlock", nil, nil)
  r0_10.Toast = r0_10:CreateWidgetNew("FeinaEventToast")
  r0_10.Pos_Toast:AddChild(r0_10.Toast)
  r0_10.Toast.Text_Toast:SetText(GText("FeinaEvent_DungeonColor_Unlock"))
  r0_10.Toast:PlayAnimation(r0_10.Toast.In)
  r0_10.Toast.Paint:InitPaint(r0_10.ColorMax)
  r0_10:AddTimer(r0_10.ToastExistTime, function()
    -- line: [125, 127] id: 11
    r0_10.Toast:PlayAnimation(r0_10.Toast.Out)
  end, false, nil, nil, false)
end
function r0_0.OnCloseLoading(r0_12)
  -- line: [130, 136] id: 12
  r0_12.IsLoading = false
  if r0_12.NeedToast then
    r0_12:InitHUDToast()
    r0_12.NeedToast = false
  end
end
function r0_0.InitCollectProgress(r0_13)
  -- line: [138, 150] id: 13
  if not r0_13.DungeonId then
    return 
  end
  r0_13.CollectTargets = DataMgr.FeinaEventDungeon[r0_13.DungeonId].Level
  for r5_13, r6_13 in ipairs(r0_13.CollectTargets) do
    r0_13.CollectProgress["Point0" .. r5_13].Text_Num:SetText(r6_13)
    r0_13.CollectProgress["Point0" .. r5_13]:PlayAnimation(r0_13.CollectProgress["Point0" .. r5_13].Normal)
    r0_13.MaxTargetNum = r6_13
  end
  -- close: r1_13
  r0_13.CollectProgress.Text_Num:SetText(0)
  r0_13.CollectProgress.Bar:SetPercent(0)
end
function r0_0.OnCollectFeinaStar(r0_14, r1_14)
  -- line: [152, 165] id: 14
  AudioManager(r0_14):PlayUISound(r0_14, "event:/ui/activity/feina_add_feather", nil, nil)
  r0_14:PlayAnimation(r0_14.Add)
  r0_14.CollectProgress:PlayAnimation(r0_14.CollectProgress.Add)
  r0_14.CollectProgress.Text_Num:SetText(r1_14)
  r0_14.CollectProgress.Bar:SetPercent(r1_14 / r0_14.MaxTargetNum)
  for r6_14, r7_14 in ipairs(r0_14.CollectTargets) do
    if r7_14 <= r1_14 and r0_14.CollectLevel < r6_14 then
      r0_14.CollectLevel = r6_14
      r0_14.CollectProgress["Point0" .. r6_14]:StopAnimation(r0_14.CollectProgress["Point0" .. r6_14].Normal)
      r0_14.CollectProgress["Point0" .. r6_14]:PlayAnimation(r0_14.CollectProgress["Point0" .. r6_14].Achieve)
    end
  end
  -- close: r2_14
end
function r0_0.ChangeColor(r0_15)
  -- line: [167, 171] id: 15
  r0_15:AddDelayFrameFunc(function()
    -- line: [168, 170] id: 16
    r0_15:ChoosePaint(r0_15.FeinaPassive.ColorIndex)
  end, 2)
end
function r0_0.ChoosePaint(r0_17, r1_17)
  -- line: [173, 194] id: 17
  if r0_17.ColorMax < r1_17 then
    return 
  end
  if r1_17 == r0_17.ColorIndex then
    return 
  end
  r0_17.ColorIndex = r1_17
  AudioManager(r0_17):PlayUISound(r0_17, "event:/ui/activity/feina_brush_change", nil, nil)
  for r5_17 = 1, 3, 1 do
    if r5_17 <= r0_17.ColorMax then
      if r5_17 == r1_17 then
        r0_17["Paint0" .. r5_17]:PlayAnimation(r0_17["Paint0" .. r5_17].Click)
      else
        if r0_17["Paint0" .. r5_17]:IsAnimationPlaying(r0_17["Paint0" .. r5_17].Click) then
          r0_17["Paint0" .. r5_17]:StopAnimation(r0_17["Paint0" .. r5_17].Click)
        end
        r0_17["Paint0" .. r5_17]:PlayAnimation(r0_17["Paint0" .. r5_17].Normal)
      end
    end
  end
end
function r0_0.InitButtons(r0_18)
  -- line: [196, 218] id: 18
  if r0_18.Btn_Jump then
    r0_18.Btn_Jump.Btn_Click.OnPressed:Add(r0_18, function()
      -- line: [198, 200] id: 19
      r0_18:TryToPlayTargetCommand("Jump")
    end)
    r0_18.Btn_Jump.Btn_Click.OnReleased:Add(r0_18, function()
      -- line: [201, 203] id: 20
      r0_18:TryToStopTargetCommand("Jump")
    end)
  end
  if r0_18.Btn_Change then
    r0_18.Btn_Change.Btn_Click.OnPressed:Add(r0_18, function()
      -- line: [206, 208] id: 21
      r0_18:TryToPlayTargetCommand("Reload")
    end)
  end
  if r0_18.Btn_Shoot then
    r0_18:InitTouchLayer(r0_18.Player, 0, 0)
    r0_18.Btn_Shoot.OwnerPanel = r0_18
    r0_18.Btn_Shoot.OwnerPlayer = r0_18.Player
    r0_18:AddMovedSubTouchItem("FeinaRangedAtk", r0_18.Btn_Shoot.Joystick, nil, {
      Down = r0_18.Btn_Shoot.ButtonFireDown,
      Move = r0_18.Btn_Shoot.ButtonFireMove,
      Up = r0_18.Btn_Shoot.ButtonFireUp,
    }, {
      Type = "Circle",
      Param = {
        Radius = r0_18.Btn_Shoot.CircleLimitArea,
        NeedReset = false,
      },
      TouchTimes = -1,
      NeedResetPos = true,
    })
  end
end
function r0_0.TryToPlayTargetCommand(r0_22, r1_22, r2_22)
  -- line: [220, 235] id: 22
  if not IsValid(r0_22.Player) then
    return 
  end
  if not r0_22.Player.InitSuccess then
    return 
  end
  if r1_22 == "Fire" then
    r0_22.Player:ActionCallback("Fire", EInputEvent.IE_Pressed)
  elseif r1_22 == "Reload" then
    r0_22.Player:ActionCallback("ChargeBullet", EInputEvent.IE_Pressed)
    r0_22:ChangeColor()
  elseif r1_22 == "Jump" then
    r0_22.Player:ActionCallback("Jump", EInputEvent.IE_Pressed)
  end
end
function r0_0.TryToStopTargetCommand(r0_23, r1_23, r2_23)
  -- line: [237, 249] id: 23
  if not IsValid(r0_23.Player) then
    return 
  end
  if not r0_23.Player.InitSuccess then
    return 
  end
  if r1_23 == "Jump" then
    r0_23.Player:ActionCallback("Jump", EInputEvent.IE_Released)
  elseif r1_23 == "Fire" then
    r0_23.Player:ActionCallback("Fire", EInputEvent.IE_Released)
  end
end
function r0_0.OnMobileHookShow(r0_24, r1_24)
  -- line: [251, 254] id: 24
  r1_24.InteractiveUI = r0_24.HookLock
  r1_24.InteractiveUI:Init(r1_24)
end
AssembleComponents(r0_0)
return r0_0
