-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\Story\Talk\UI\BP_TalkBaseUINew_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
require("DataMgr")
local r0_0 = Class("BluePrints.UI.BP_UIState_C")
local r1_0 = {
  [require("BluePrints.UI.UI_PC.Impression.ImpressionConst").ImpressionItemHideUITag] = 1,
  Review = 1,
  Wiki = 1,
}
r0_0._components = {
  "BluePrints.Story.Talk.UI.TalkBaseUI_MobileKeyComponent"
}
local r2_0 = require("BluePrints.UI.BP_UIState_C")
local r3_0 = require("BluePrints.Story.Talk.View.TalkUtils")
local r4_0 = require("BluePrints.UI.WBP.Wiki.WikiController")
function r0_0.Initialize(r0_1, r1_1)
  -- line: [20, 22] id: 1
  r2_0.Initialize(r0_1, r1_1)
end
function r0_0.Construct(r0_2)
  -- line: [24, 48] id: 2
  r0_0.Super.Construct(r0_2)
  r0_2.UIDeactiveTimer = 0
  r0_2.bUIActive = false
  r0_2.CachedMouseLocation2D = nil
  r0_2.LongPressTimer = 0
  r0_2.TalkContext = GWorld.GameInstance:GetTalkContext()
  r0_2.bStoryInputModeEnabled = false
  r0_2.bInMobile = r0_2.TalkContext.bInMobile
  r0_2.DisableKeyTags = {}
  r0_2.bPlayKeyEnabled = true
  if r0_2.bInMobile then
    r0_2:InitMobileButtons()
  end
  r0_2.GameInputModeTag = "Talk"
end
function r0_0.Destruct(r0_3)
  -- line: [50, 62] id: 3
  r0_3:SetStoryInputModeEnabled(false)
  if r0_3.bInMobile then
    r0_3:UnInitMobileButtons()
  end
  if IsValid(r0_3.ImgItemUI) then
    r0_3.ImgItemUI:Close()
  end
  if IsValid(r0_3.ImgRecallUI) then
    r0_3.ImgRecallUI:Close()
  end
  r0_0.Super.Destruct(r0_3)
end
function r0_0.SetUpTalkTask(r0_4, r1_4)
  -- line: [64, 66] id: 4
  r0_4.TalkTask = r1_4
end
function r0_0.SetStoryInputModeEnabled(r0_5, r1_5)
  -- line: [68, 90] id: 5
  if r0_5.bStoryInputModeEnabled ~= r1_5 then
    r0_5.bStoryInputModeEnabled = r1_5
    DebugPrint("BP_TalkBaseUINew_C:SetStoryInputModeEnabled", r1_5)
    local r2_5 = UGameInputModeSubsystem.GetGameInputModeSubsystem(r0_5)
    if not r2_5 then
      return 
    end
    if r1_5 then
      local r3_5 = FGameInputModeParams()
      r3_5.WidgetToFocus = r0_5
      r3_5.MouseLockMode = EMouseLockMode.LockOnCapture
      r3_5.bHideCursorDuringCapture = false
      r3_5.bShowMouseCursor = true
      r2_5:EnableInputMode(r0_5.GameInputModeTag, EGameInputMode.GameAndUI, r3_5)
      UIManager(r0_5):SetUIInputEnable(false, r0_5.GameInputModeTag)
    else
      r2_5:DisableInputMode(r0_5.GameInputModeTag)
      UIManager(r0_5):SetUIInputEnable(true, r0_5.GameInputModeTag)
    end
  end
end
function r0_0.PreEnterTalkTask(r0_6, r1_6, r2_6, r3_6)
  -- line: [95, 106] id: 6
  local r4_6 = r2_6.TalkContext.TalkDelegateManager
  r0_6.DialoguePanelClicked_Delegate = r4_6:CreateDelegate(r1_6)
  r0_6.WholeDialogueTypingFinished_Delegate = r4_6:CreateDelegate(r1_6)
  r0_6.OptionItemClicked_Delegate = r4_6:CreateDelegate(r1_6)
  r0_6.AutoPlayChanged_Delegate = r4_6:CreateDelegate(r1_6)
  r0_6.SkipButtonClicked_Delegate = r4_6:CreateDelegate(r1_6)
  r0_6.StopStoryline_Delegate = r4_6:CreateDelegate(r1_6)
  if r3_6 then
    r3_6:Fire()
  end
end
function r0_0.PostEnterTalkTask(r0_7, r1_7, r2_7, r3_7)
  -- line: [111, 115] id: 7
  if r3_7 then
    r3_7:Fire()
  end
end
function r0_0.PreExitTalkTask(r0_8, r1_8, r2_8, r3_8)
  -- line: [120, 126] id: 8
  r0_8:ForceHideDialoguePic()
  if r3_8 then
    r3_8:Fire()
  end
end
function r0_0.PostExitTalkTask(r0_9, r1_9, r2_9, r3_9)
  -- line: [131, 135] id: 9
  if r3_9 then
    r3_9:Fire()
  end
end
function r0_0.RemoveInputMethodChangedListen(r0_10)
  -- line: [137, 141] id: 10
  if IsValid(r0_10) and IsValid(r0_10.GameInputModeSubsystem) then
    r0_10.GameInputModeSubsystem.OnInputMethodChanged:Remove(r0_10, r0_10.RefreshOpInfoByInputDevice)
  end
end
function r0_0.Tick(r0_11, r1_11, r2_11)
  -- line: [143, 150] id: 11
  if r0_11.LongPressTimer then
    r0_11.LongPressTimer = r0_11.LongPressTimer + r2_11
  else
    r0_11.LongPressTimer = 0
  end
  r0_11:UpdateUIActiveness(r2_11)
end
function r0_0.UpdateUIActiveness(r0_12, r1_12)
  -- line: [153, 185] id: 12
  if not r0_12.EnableDeactiveUI then
    return 
  end
  if r0_12.CachedMouseLocation2D then
    local r2_12 = UWidgetLayoutLibrary.GetMousePositionOnViewport(r0_12)
    if not UKismetMathLibrary.EqualEqual_Vector2DVector2D(r0_12.CachedMouseLocation2D, r2_12) then
      r0_12.UIDeactiveTimer = 0
      if r0_12.bUIActive == false then
        r0_12:OnPlayerActiveUI()
      end
      r0_12.bUIActive = true
    else
      r0_12.UIDeactiveTimer = r0_12.UIDeactiveTimer + r1_12
      if Const.TalkUIDeactiveTimeThreshold < r0_12.UIDeactiveTimer and r0_12.bUIActive == true then
        r0_12:OnPlayerDeactiveUI()
        r0_12.bUIActive = false
      end
    end
    r0_12.CachedMouseLocation2D = r2_12
  else
    r0_12.CachedMouseLocation2D = UWidgetLayoutLibrary.GetMousePositionOnViewport(r0_12)
    if r0_12.DefaultDeactiveUI then
      r0_12:OnPlayerDeactiveUI()
      r0_12.bUIActive = false
    end
  end
  if r0_12.bInMobile then
    UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0).bShowMouseCursor = false
  end
end
function r0_0.ActiveUI(r0_13)
  -- line: [187, 194] id: 13
  r0_13.UIDeactiveTimer = 0
  if r0_13.bUIActive == false then
    r0_13:OnPlayerActiveUI()
    r0_13.bUIActive = true
  end
end
function r0_0.OnTalkClickPressed(r0_14)
  -- line: [196, 198] id: 14
  r0_14.LongPressTimer = 0
end
function r0_0.OnTalkClickReleased(r0_15)
  -- line: [200, 208] id: 15
  DebugPrint("OnTalkClickReleased", r0_15.LongPressTimer)
  if r0_15.LongPressTimer < Const.ShortPressThreshold then
    if r0_15.WBP_Story_PlayKey_P then
      r0_15.WBP_Story_PlayKey_P:OnConfirmKeyReleased()
    end
    r0_15.DialoguePanelClicked_Delegate:Fire()
  end
end
function r0_0.SkipDialogueTyping(r0_16)
  -- line: [210, 216] id: 16
  if not r0_16:HasPageTypingFinished() then
    r0_16:ToPageEnd()
  elseif not r0_16:HasWholeDialogueTypingFinished() then
    r0_16:NextPage()
  end
end
function r0_0.SwitchEnableSkipButton(r0_17, r1_17)
  -- line: [218, 221] id: 17
  r0_17:ShowSkipButton(r1_17)
  r0_17:SwitchBindSkip(r1_17, r0_17, r0_17.OnSkipButtonClicked)
end
function r0_0.SwitchEnableConfirmButton(r0_18, r1_18)
  -- line: [223, 225] id: 18
  r0_18:ShowConfirmButton(r1_18)
end
function r0_0.SwitchEnableAutoPlayButton(r0_19, r1_19)
  -- line: [227, 230] id: 19
  r0_19:ShowAutoPlayButton(r1_19)
  r0_19:SwitchBindAutoPlay(r1_19, r0_19, r0_19.OnAutoPlayButtonClicked)
end
function r0_0.SwitchEnableReviewButton(r0_20, r1_20)
  -- line: [232, 235] id: 20
  r0_20:ShowReviewButton(r1_20)
  r0_20:SwitchBindReview(r1_20, r0_20, r0_20.OnReviewButtonClicked)
end
function r0_0.SwitchEnableWikiButton(r0_21, r1_21)
  -- line: [237, 240] id: 21
  r0_21:ShowWikiButton(r1_21)
  r0_21:SwitchBindWiki(r1_21, r0_21, r0_21.OnWikiButtonClicked)
end
function r0_0.ShowSkipButton(r0_22, r1_22)
  -- line: [243, 251] id: 22
  if r0_22.bInMobile then
    if IsValid(r0_22.Story_PlayBtn) then
      r0_22.Story_PlayBtn:ShowSkipButton(r1_22)
    end
  else
    r0_22.WBP_Story_PlayKey_P:ShowSkipButton(r1_22)
  end
end
function r0_0.ShowConfirmButton(r0_23, r1_23)
  -- line: [253, 258] id: 23
  if r0_23.bInMobile then
    return 
  end
  r0_23.WBP_Story_PlayKey_P:ShowConfirmButton(r1_23)
end
function r0_0.ShowAutoPlayButton(r0_24, r1_24)
  -- line: [260, 268] id: 24
  if r0_24.bInMobile then
    if IsValid(r0_24.Story_PlayBtn) then
      r0_24.Story_PlayBtn:ShowAutoPlayButton(r1_24)
    end
  else
    r0_24.WBP_Story_PlayKey_P:ShowAutoPlayButton(r1_24)
  end
end
function r0_0.ShowReviewButton(r0_25, r1_25)
  -- line: [270, 278] id: 25
  if r0_25.bInMobile then
    if IsValid(r0_25.Story_PlayBtn) then
      r0_25.Story_PlayBtn:ShowReviewButton(r1_25)
    end
  else
    r0_25.WBP_Story_PlayKey_P:ShowReviewButton(r1_25)
  end
end
function r0_0.ShowWikiButton(r0_26, r1_26)
  -- line: [280, 296] id: 26
  if r0_26.bInMobile then
    if IsValid(r0_26.Story_PlayBtn) then
      if r1_26 then
        r0_26.Story_PlayBtn:ShowEncyclopedia()
      else
        r0_26.Story_PlayBtn:HideEncyclopedia()
      end
    end
  elseif r1_26 then
    r0_26.WBP_Story_PlayKey_P:ShowEncyclopedia()
  else
    r0_26.WBP_Story_PlayKey_P:HideEncyclopedia()
  end
end
function r0_0.SwitchBindSkip(r0_27, r1_27, r2_27, r3_27)
  -- line: [298, 315] id: 27
  DebugPrint("BP_TalkBaseUINew_C:SwitchBindSkip", r1_27, r2_27, r3_27)
  if r0_27.bInMobile then
    if IsValid(r0_27.Story_PlayBtn) then
      r0_27.Story_PlayBtn:SwitchBindMobileSkip(r1_27, r2_27, r3_27)
    end
  else
    r0_27.WBP_Story_PlayKey_P:SwitchBindSkip(r1_27, r2_27, r3_27)
    r0_27:StopListeningForInputAction("TalkSkip", EInputEvent.IE_Pressed)
    r0_27:StopListeningForInputAction("TalkSkip", EInputEvent.IE_Released)
    if r1_27 then
      r0_27:ListenForInputAction("TalkSkip", EInputEvent.IE_Pressed, false, {
        r0_27.WBP_Story_PlayKey_P,
        r0_27.WBP_Story_PlayKey_P.OnSkipKeyPressed
      })
      r0_27:ListenForInputAction("TalkSkip", EInputEvent.IE_Released, false, {
        r0_27.WBP_Story_PlayKey_P,
        r0_27.WBP_Story_PlayKey_P.OnSkipKeyReleased
      })
      r0_27:ListenForInputAction("TalkSkip", EInputEvent.IE_Pressed, false, {
        r0_27,
        r0_27.ActiveUI
      })
      r0_27:ListenForInputAction("TalkSkip", EInputEvent.IE_Released, false, {
        r0_27,
        r0_27.ActiveUI
      })
    end
  end
end
function r0_0.SwitchBindAutoPlay(r0_28, r1_28, r2_28, r3_28)
  -- line: [317, 334] id: 28
  DebugPrint("BP_TalkBaseUINew_C:SwitchBindAutoPlay", r1_28, r2_28, r3_28)
  if r0_28.bInMobile then
    if IsValid(r0_28.Story_PlayBtn) then
      r0_28.Story_PlayBtn:SwitchBindMobileAutoPlay(r1_28, r2_28, r3_28)
    end
  else
    r0_28.WBP_Story_PlayKey_P:SwitchBindAutoPlay(r1_28, r2_28, r3_28)
    r0_28:StopListeningForInputAction("TalkAutoPlay", EInputEvent.IE_Pressed)
    r0_28:StopListeningForInputAction("TalkAutoPlay", EInputEvent.IE_Released)
    if r1_28 then
      r0_28:ListenForInputAction("TalkAutoPlay", EInputEvent.IE_Pressed, false, {
        r0_28.WBP_Story_PlayKey_P,
        r0_28.WBP_Story_PlayKey_P.OnAutoKeyPressed
      })
      r0_28:ListenForInputAction("TalkAutoPlay", EInputEvent.IE_Released, false, {
        r0_28.WBP_Story_PlayKey_P,
        r0_28.WBP_Story_PlayKey_P.OnAutoKeyReleased
      })
      r0_28:ListenForInputAction("TalkAutoPlay", EInputEvent.IE_Pressed, false, {
        r0_28,
        r0_28.ActiveUI
      })
      r0_28:ListenForInputAction("TalkAutoPlay", EInputEvent.IE_Released, false, {
        r0_28,
        r0_28.ActiveUI
      })
    end
  end
end
function r0_0.SwitchBindReview(r0_29, r1_29, r2_29, r3_29)
  -- line: [336, 353] id: 29
  DebugPrint("BP_TalkBaseUINew_C:SwitchBindReview", r1_29, r2_29, r3_29)
  if r0_29.bInMobile then
    if IsValid(r0_29.Story_PlayBtn) then
      r0_29.Story_PlayBtn:SwitchBindMobileReview(r1_29, r2_29, r3_29)
    end
  else
    r0_29.WBP_Story_PlayKey_P:SwitchBindReview(r1_29, r2_29, r3_29)
    r0_29:StopListeningForInputAction("TalkReview", EInputEvent.IE_Pressed)
    r0_29:StopListeningForInputAction("TalkReview", EInputEvent.IE_Released)
    if r1_29 then
      r0_29:ListenForInputAction("TalkReview", EInputEvent.IE_Pressed, false, {
        r0_29.WBP_Story_PlayKey_P,
        r0_29.WBP_Story_PlayKey_P.OnReviewKeyPressed
      })
      r0_29:ListenForInputAction("TalkReview", EInputEvent.IE_Released, false, {
        r0_29.WBP_Story_PlayKey_P,
        r0_29.WBP_Story_PlayKey_P.OnReviewKeyReleased
      })
      r0_29:ListenForInputAction("TalkReview", EInputEvent.IE_Pressed, false, {
        r0_29,
        r0_29.ActiveUI
      })
      r0_29:ListenForInputAction("TalkReview", EInputEvent.IE_Released, false, {
        r0_29,
        r0_29.ActiveUI
      })
    end
  end
end
function r0_0.SwitchBindWiki(r0_30, r1_30, r2_30, r3_30)
  -- line: [355, 372] id: 30
  DebugPrint("BP_TalkBaseUINew_C:SwitchBindWiki", r1_30, r2_30, r3_30)
  if r0_30.bInMobile then
    if IsValid(r0_30.Story_PlayBtn) then
      r0_30.Story_PlayBtn:SwitchBindMobileWiki(r1_30, r2_30, r3_30)
    end
  else
    r0_30.WBP_Story_PlayKey_P:SwitchBindWiki(r1_30, r2_30, r3_30)
    r0_30:StopListeningForInputAction("TalkWiki", EInputEvent.IE_Pressed)
    r0_30:StopListeningForInputAction("TalkWiki", EInputEvent.IE_Released)
    if r1_30 then
      r0_30:ListenForInputAction("TalkWiki", EInputEvent.IE_Pressed, false, {
        r0_30.WBP_Story_PlayKey_P,
        r0_30.WBP_Story_PlayKey_P.OnWikiKeyPressed
      })
      r0_30:ListenForInputAction("TalkWiki", EInputEvent.IE_Released, false, {
        r0_30.WBP_Story_PlayKey_P,
        r0_30.WBP_Story_PlayKey_P.OnWikiKeyReleased
      })
      r0_30:ListenForInputAction("TalkWiki", EInputEvent.IE_Pressed, false, {
        r0_30,
        r0_30.ActiveUI
      })
      r0_30:ListenForInputAction("TalkWiki", EInputEvent.IE_Released, false, {
        r0_30,
        r0_30.ActiveUI
      })
    end
  end
end
function r0_0.OnSkipButtonClicked(r0_31)
  -- line: [374, 377] id: 31
  r0_31:SwitchEnableSkipButton(false)
  r0_31.SkipButtonClicked_Delegate:Fire()
end
function r0_0.OnAutoPlayButtonClicked(r0_32)
  -- line: [379, 398] id: 32
  if r0_32.bInMobile then
    r0_32:ChangeAutoPlay()
    r0_32:ChangeAutoPlayUI()
    if r0_32:IsAutoPlay() then
      r0_32:TryPlayNextPage()
    else
      r0_32:RemoveTimer("NextPage")
    end
    r0_32.AutoPlayChanged_Delegate:Fire(r0_32.bAutoPlay)
  else
    r0_32:SwitchAutoPlay()
    if r0_32:IsAutoPlay() then
      r0_32:TryPlayNextPage()
    else
      r0_32:RemoveTimer("NextPage")
    end
    r0_32.AutoPlayChanged_Delegate:Fire()
  end
end
function r0_0.OnReviewButtonClicked(r0_33)
  -- line: [400, 413] id: 33
  if UIManager(r0_33):GetUIObj("StoryReviewMain") and UIManager(r0_33):LoadUINew("StoryReviewMain", function()
    -- line: [404, 407] id: 34
    r0_33:Show("Review")
    r0_33:OnPauseResumed()
  end) then
    r0_33:Hide("Review")
    r0_33:OnPaused()
  end
end
function r0_0.OnWikiButtonClicked(r0_35)
  -- line: [415, 425] id: 35
  if r4_0:OpenDialogueWiki(r0_35.WikiEntryIds, nil, function()
    -- line: [417, 420] id: 36
    r0_35:Show("Wiki")
    r0_35:OnPauseResumed()
  end) then
    r0_35:Hide("Wiki")
    r0_35:OnPaused()
  end
end
function r0_0.PlayWikiRemindAnim(r0_37)
  -- line: [427, 434] id: 37
  if r0_37.WBP_Story_PlayKey_P then
    r0_37.WBP_Story_PlayKey_P:PlayAnimation(r0_37.WBP_Story_PlayKey_P.Reminder)
  end
  if r0_37.Button_Encyclopedia then
    r0_37.Button_Encyclopedia:PlayAnimation(r0_37.Button_Encyclopedia.Reminder)
  end
end
function r0_0.TryShowWikiButton(r0_38, r1_38)
  -- line: [436, 447] id: 38
  if r0_38.HasShowWikiButton then
    return 
  end
  if r4_0:CheckEntriesUnlocked(r0_38.WikiEntryIds) then
    r0_38:SwitchEnableWikiButton(r1_38.TalkTaskData.bShowWikiButton)
    r0_38.HasShowWikiButton = true
  else
    DebugPrint("@ljh,Need show Wiki but locked")
  end
end
function r0_0.SetUIHidden(r0_39, r1_39)
  -- line: [449, 455] id: 39
  if r1_39 then
    r0_39:SetVisibility(UE.ESlateVisibility.Collapsed)
  else
    r0_39:SetVisibility(UE.ESlateVisibility.Visible)
  end
end
function r0_0.TryShowDialoguePic(r0_40, r1_40)
  -- line: [457, 471] id: 40
  if not r1_40 or not r1_40.DialoguePanelType then
    return 
  end
  local r2_40 = string.lower(r1_40.DialoguePanelType and "")
  local r3_40 = r3_0:FindTargetString(r2_40, "type")
  if not r3_40 then
    return 
  end
  if string.lower(r3_40) == "showpic" then
    local r4_40 = r3_0:FindTargetString(r2_40, "dir")
    DebugPrint("WBP_Simple_Common:ShowDialoguePic", r3_40, r4_40)
    r0_40:ShowPicture(r4_40)
  end
end
function r0_0.ShowPicture(r0_41, r1_41, r2_41, r3_41, r4_41)
  -- line: [473, 495] id: 41
  if r2_41 and r3_41 and r4_41 and r2_41 + r3_41 + r4_41 <= 0 then
    return 
  end
  local r5_41 = UStoryFunctionLibrary.LoadResourceWithGender(r0_41, r1_41, r0_41)
  DebugPrint("BP_TalkBaseUINew_C:@ShowPicture", r1_41, r5_41, r2_41, r3_41, r4_41)
  if r5_41 then
    if not IsValid(r0_41.ImgItemUI) then
      r0_41.ImgItemUI = UIManager(r0_41):_CreateWidgetNew("StoryImgItem")
      if not r0_41.ImgItemUI then
        DebugPrint("Error: 播放图片时控件无效,请检查WBP_Story_ImgItem蓝图")
        return 
      end
      local r6_41 = r0_41:GetZOrder()
      local r7_41 = r0_41.ImgItemUI
      local r9_41 = nil	-- notice: implicit variable refs by block#[12]
      if r6_41 > 0 then
        r9_41 = r6_41 + -1
        if not r9_41 then
          ::label_58::
          r9_41 = 0
        end
      else
        goto label_58	-- block#11 is visited secondly
      end
      r7_41:AddToViewport(r9_41)
    end
    r0_41.ImgItemUI:PlayFadeAnim(true, r5_41, r2_41, r3_41, r4_41)
  else
    DebugPrint("Error: 无法找到图片路径:", r1_41, ",请检查Dialogue配置")
  end
end
function r0_0.TryHideLastDialoguePic(r0_42)
  -- line: [497, 502] id: 42
  DebugPrint("BP_TalkBaseUINew_C:TryHideLastDialoguePic")
  if IsValid(r0_42.ImgItemUI) then
    r0_42.ImgItemUI:PlayFadeAnim(false)
  end
end
function r0_0.ForceHideDialoguePic(r0_43)
  -- line: [504, 508] id: 43
  if IsValid(r0_43.ImgItemUI) then
    r0_43.ImgItemUI:Close()
  end
end
function r0_0.SetUISkippable(r0_44, r1_44)
  -- line: [510, 512] id: 44
  r0_44.bUISkippable = r1_44
end
function r0_0.SetAutoPlayButtonHidden(r0_45, r1_45)
  -- line: [515, 516] id: 45
end
function r0_0.SetSkipButtonHidden(r0_46, r1_46)
  -- line: [519, 520] id: 46
end
function r0_0.SetTextBorderHidden(r0_47, r1_47)
  -- line: [522, 523] id: 47
end
function r0_0.SetTipImageHidden(r0_48, r1_48)
  -- line: [525, 526] id: 48
end
function r0_0.SetAutoPlayChecked(r0_49, r1_49)
  -- line: [528, 529] id: 49
end
function r0_0.SetBlackborderHidden(r0_50, r1_50)
  -- line: [531, 532] id: 50
end
function r0_0.PlayDialogue(r0_51, r1_51, r2_51, r3_51)
  -- line: [537, 538] id: 51
end
function r0_0.ShowOptions(r0_52, r1_52, r2_52, r3_52, r4_52)
  -- line: [541, 543] id: 52
  r4_52(1)
end
function r0_0.ClearOptions(r0_53)
  -- line: [545, 546] id: 53
end
function r0_0.FadeIn(r0_54, r1_54, r2_54)
  -- line: [550, 554] id: 54
  if r2_54 then
    r2_54.Func(r2_54.Obj, table.unpack(r2_54.Params and {}))
  end
end
function r0_0.FadeOut(r0_55, r1_55, r2_55)
  -- line: [558, 562] id: 55
  if r2_55 then
    r2_55.Func(r2_55.Obj, table.unpack(r2_55.Params and {}))
  end
end
function r0_0.ToPageEnd(r0_56)
  -- line: [564, 565] id: 56
end
function r0_0.NextPage(r0_57)
  -- line: [567, 571] id: 57
  r0_57:RemoveTimer("NextPage")
  r0_57.TypingText:NextPage()
  r0_57:SetTipImageHidden(true)
end
function r0_0.InitDialogueData(r0_58, r1_58)
  -- line: [573, 576] id: 58
  r0_58.DialogueData = r1_58
  r0_58.DialogueDuration = r1_58.Duration
end
function r0_0.TryPlayNextPage(r0_59)
  -- line: [578, 582] id: 59
  if r0_59:HasPageTypingFinished() and not r0_59:HasWholeDialogueTypingFinished() then
    r0_59:NextPage()
  end
end
function r0_0.OnWholeDialogueTypingFinished(r0_60, r1_60)
  -- line: [584, 595] id: 60
  DebugPrint("BP_TalkBaseUINew_C:OnWholeDialogueTypingFinished", r1_60, r0_60:IsAutoPlay(), r0_60.DialogueDuration)
  if r1_60 then
    r0_60.WholeDialogueTypingFinished_Delegate:Fire(r1_60)
  else
    r0_60:SetTipImageHidden(false)
    if r0_60:IsAutoPlay() then
      r0_60:AddTimer(r0_60.DialogueDuration, r0_60.NextPage, false, 0, "NextPage", true)
    end
  end
end
function r0_0.HasPageTypingFinished(r0_61)
  -- line: [597, 598] id: 61
end
function r0_0.HasWholeDialogueTypingFinished(r0_62)
  -- line: [600, 601] id: 62
end
function r0_0.OnPlayerActiveUI(r0_63)
  -- line: [604, 605] id: 63
end
function r0_0.OnPlayerDeactiveUI(r0_64)
  -- line: [608, 609] id: 64
end
function r0_0.OnNotPlayRecallGraph(r0_65)
  -- line: [611, 616] id: 65
  r0_65.LastRecallGraph = nil
  if IsValid(r0_65.ImgRecallUI) then
    r0_65.ImgRecallUI:OnCollapsingGraph()
  end
end
function r0_0.OnPlayRecallGraph(r0_66, r1_66, r2_66)
  -- line: [618, 645] id: 66
  local r3_66 = r1_66.DialogueGraphPath
  local r4_66 = r1_66.bNotRecall
  DebugPrint("OnPlayRecallGraph", r3_66, r0_66.LastRecallGraph, r4_66, r0_66.LastNotRecall)
  if r3_66 == r0_66.LastRecallGraph then
    if r4_66 == nil or r4_66 == r0_66.LastNotRecall then
      return 
    end
  else
    r0_66.LastNotRecall = false
  end
  r0_66.LastRecallGraph = r3_66
  if r4_66 ~= nil then
    r0_66.LastNotRecall = r4_66
  end
  r0_66.bShowingRecall = true
  if not r0_66.ImgRecallUI then
    r0_66.ImgRecallUI = UIManager(r0_66):_CreateWidgetNew("StoryImgRecall")
    if not r0_66.ImgRecallUI then
      DebugPrint("Error: 播放回忆图片时控件无效,请检查WBP_Story_ImgRecall蓝图")
      return 
    end
    local r5_66 = r0_66:GetZOrder()
    local r6_66 = r0_66.ImgRecallUI
    local r8_66 = nil	-- notice: implicit variable refs by block#[13]
    if r5_66 > 0 then
      r8_66 = r5_66 + -1
      if not r8_66 then
        ::label_52::
        r8_66 = 0
      end
    else
      goto label_52	-- block#12 is visited secondly
    end
    r6_66:AddToViewport(r8_66)
  end
  r0_66.ImgRecallUI:InitGraph(r3_66, r4_66, r2_66)
  r0_66:DelayPlayRecallAnim(true)
end
function r0_0.DelayPlayRecallAnim(r0_67, r1_67)
  -- line: [647, 652] id: 67
  DebugPrint("BP_TalkBaseUINew_C@DelayPlayRecallAnim", r1_67)
  if IsValid(r0_67.ImgRecallUI) then
    r0_67.ImgRecallUI:PlayRecallAnim(r1_67)
  end
end
function r0_0.SetRecallGraphHidden(r0_68)
  -- line: [654, 658] id: 68
  if IsValid(r0_68.ImgRecallUI) then
    r0_68.ImgRecallUI:Close()
  end
end
function r0_0.AddDelegate_DialoguePanelClicked(r0_69, r1_69, r2_69, ...)
  -- line: [662, 664] id: 69
  r0_69.DialoguePanelClicked_Delegate:Add(r1_69, r2_69, ...)
end
function r0_0.RemoveDelegate_DialoguePanelClicked(r0_70, r1_70, r2_70)
  -- line: [667, 672] id: 70
  if r0_70.DialoguePanelClicked_Delegate == nil then
    return 
  end
  r0_70.DialoguePanelClicked_Delegate:Remove(r1_70, r2_70)
end
function r0_0.AddDelegate_AutoPlayChanged(r0_71, r1_71, r2_71, ...)
  -- line: [676, 678] id: 71
  r0_71.AutoPlayChanged_Delegate:Add(r1_71, r2_71, ...)
end
function r0_0.RemoveDelegate_AutoPlayChanged(r0_72, r1_72, r2_72)
  -- line: [682, 687] id: 72
  if r0_72.AutoPlayChanged_Delegate == nil then
    return 
  end
  r0_72.AutoPlayChanged_Delegate:Remove(r1_72, r2_72)
end
function r0_0.AddDelegate_SkipButtonClicked(r0_73, r1_73, r2_73, ...)
  -- line: [691, 693] id: 73
  r0_73.SkipButtonClicked_Delegate:Add(r1_73, r2_73, ...)
end
function r0_0.RemoveDelegate_SkipButtonClicked(r0_74, r1_74, r2_74)
  -- line: [697, 702] id: 74
  if r0_74.SkipButtonClicked_Delegate == nil then
    return 
  end
  r0_74.SkipButtonClicked_Delegate:Remove(r1_74, r2_74)
end
function r0_0.AddDelegate_WholeDialogueTypingFinished(r0_75, r1_75, r2_75, ...)
  -- line: [706, 708] id: 75
  r0_75.WholeDialogueTypingFinished_Delegate:Add(r1_75, r2_75, ...)
end
function r0_0.RemoveDelegate_WholeDialogueTypingFinished(r0_76, r1_76, r2_76)
  -- line: [712, 717] id: 76
  if r0_76.WholeDialogueTypingFinished_Delegate == nil then
    return 
  end
  r0_76.WholeDialogueTypingFinished_Delegate:Remove(r1_76, r2_76)
end
function r0_0.AddDelegate_StopStoryline(r0_77, r1_77, r2_77, ...)
  -- line: [721, 723] id: 77
  r0_77.StopStoryline_Delegate:Add(r1_77, r2_77, ...)
end
function r0_0.RemoveDelegate_StopStoryline(r0_78, r1_78, r2_78)
  -- line: [727, 731] id: 78
  if r0_78.StopStoryline_Delegate then
    r0_78.StopStoryline_Delegate:Remove(r1_78, r2_78)
  end
end
function r0_0.IsAutoPlay(r0_79)
  -- line: [733, 741] id: 79
  if r0_79.DialogueData and (r0_79.DialogueData.DialoguePanelType == "None" or r0_79.DialogueData.DialoguePanelType == "AllHide") then
    return true
  elseif not r0_79.bDefaultShowAutoPlayButton then
    return false
  else
    return GWorld.GameInstance.bGlobalAutoPlay
  end
end
function r0_0.SwitchAutoPlay(r0_80)
  -- line: [743, 745] id: 80
  GWorld.GameInstance.bGlobalAutoPlay = not GWorld.GameInstance.bGlobalAutoPlay
end
function r0_0.GetOverridenAutoPlayDurationTimer(r0_81)
  -- line: [747, 749] id: 81
  return nil
end
function r0_0.Clear(r0_82)
  -- line: [751, 753] id: 82
  DebugPrint("BP_TalkBaseUINew_C:Clear")
end
function r0_0.OnPaused(r0_83)
  -- line: [755, 770] id: 83
  DebugPrint("BP_TalkBaseUINew_C:OnPaused")
  r0_83:SetPlayKeyEnabled(false, "Pause")
  if r0_83.TypingText then
    r0_83.TypingText:Pause(true)
  end
  if r0_83.TalkTask then
    r0_83.TalkTask:PauseTaskExternal(true, r0_83)
  end
  if r0_83:IsAutoPlay() then
    r0_83.WasAutoPlay = true
    r0_83:RemoveTimer("NextPage")
  end
  r0_83:SetIsEnabled(false)
end
function r0_0.OnPauseResumed(r0_84)
  -- line: [772, 787] id: 84
  DebugPrint("BP_TalkBaseUINew_C:OnPauseResumed")
  r0_84:SetPlayKeyEnabled(true, "Pause")
  if r0_84.TypingText then
    r0_84.TypingText:Pause(false)
  end
  if r0_84.TalkTask then
    r0_84.TalkTask:PauseTaskExternal(false, r0_84)
  end
  if r0_84.WasAutoPlay then
    r0_84.WasAutoPlay = nil
    r0_84:TryPlayNextPage()
  end
  r0_84:SetIsEnabled(true)
end
function r0_0.RefreshBaseInfo(r0_85)
  -- line: [789, 796] id: 85
  r0_85.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(UE4.UGameplayStatics.GetPlayerController(r0_85, 0))
  if IsValid(r0_85.GameInputModeSubsystem) then
    r0_85:RefreshOpInfoByInputDevice(r0_85.GameInputModeSubsystem:GetCurrentInputType(), r0_85.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end
function r0_0.OnInterrupted(r0_86)
  -- line: [807, 810] id: 86
  DebugPrint("BP_TalkBaseUINew_C:OnInterrupted")
  r0_86:Clear()
end
function r0_0.Hide(r0_87, r1_87)
  -- line: [812, 823] id: 87
  r0_0.Super.Hide(r0_87, r1_87)
  if not r1_87 or not r1_0[r1_87] then
    if IsValid(r0_87.ImgItemUI) then
      r0_87.ImgItemUI:SetVisibility(ESlateVisibility.Collapsed)
    end
    if IsValid(r0_87.ImgRecallUI) then
      r0_87.ImgRecallUI:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  r0_87:SetPlayKeyEnabled(false, "Visibility")
end
function r0_0.Show(r0_88, r1_88)
  -- line: [825, 836] id: 88
  r0_0.Super.Show(r0_88, r1_88)
  if IsValid(r0_88.ImgItemUI) then
    r0_88.ImgItemUI:SetVisibility(ESlateVisibility.HitTestInvisible)
  end
  if IsValid(r0_88.ImgRecallUI) then
    r0_88.ImgRecallUI:SetVisibility(ESlateVisibility.HitTestInvisible)
  end
  if IsEmptyTable(r0_88.HideTags) then
    r0_88:SetPlayKeyEnabled(true, "Visibility")
  end
end
function r0_0.SetPlayKeyEnabled(r0_89, r1_89, r2_89)
  -- line: [838, 860] id: 89
  if not IsValid(r0_89.WBP_Story_PlayKey_P) then
    return 
  end
  if r1_89 then
    if r2_89 then
      r0_89.DisableKeyTags[r2_89] = nil
    end
  else
    r0_89.DisableKeyTags[r2_89] = 1
  end
  local r3_89 = IsEmptyTable(r0_89.DisableKeyTags)
  if r0_89.bPlayKeyEnabled == r3_89 then
    return 
  end
  r0_89.bPlayKeyEnabled = r3_89
  if r3_89 then
    r0_89.WBP_Story_PlayKey_P:Enable()
  else
    r0_89.WBP_Story_PlayKey_P:Disable()
  end
end
function r0_0.SwitchWaitState(r0_90, r1_90)
  -- line: [862, 884] id: 90
  DebugPrint("BP_TalkBaseUINew_C:SwitchWaitState", r1_90)
  if r1_90 == nil or r0_90.WS_Type == nil then
    return 
  end
  if r0_90.UIWaitState and r1_90 == r0_90.UIWaitState then
    return 
  end
  if r1_90 then
    r0_90.WS_Type:SetActiveWidgetIndex(0)
    if r0_90.State_Wait then
      r0_90.State_Wait:UnbindAllFromAnimationFinished(r0_90.State_Wait.Loop)
      r0_90.State_Wait:StopAnimation(r0_90.State_Wait.Loop)
    end
  else
    r0_90.WS_Type:SetActiveWidgetIndex(1)
    if r0_90.State_Wait then
      r0_90.State_Wait:PlayAnimation(r0_90.State_Wait.Loop)
      r0_90.State_Wait:BindToAnimationFinished(r0_90.State_Wait.Loop, {
        r0_90,
        function()
          -- line: [880, 880] id: 91
          r0_90.State_Wait:PlayAnimation(r0_90.State_Wait.Loop)
        end
      })
    end
  end
  r0_90.UIWaitState = r1_90
end
function r0_0.ResetNormalButton(r0_92)
  -- line: [886, 887] id: 92
end
AssembleComponents(r0_0)
return r0_0
