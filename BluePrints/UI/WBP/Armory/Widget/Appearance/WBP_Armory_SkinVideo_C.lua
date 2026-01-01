-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\Armory\Widget\Appearance\WBP_Armory_SkinVideo_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = Class({
  "BluePrints.UI.BP_UIState_C"
})
function r0_0.Construct(r0_1)
  -- line: [13, 16] id: 1
  r0_0.Super.Construct(r0_1)
  rawset(r0_1, "IsPC", CommonUtils.GetDeviceTypeByPlatformName(r0_1) == "PC")
end
function r0_0.OnBackKeyDown(r0_2)
  -- line: [18, 20] id: 2
  r0_2:Close()
end
function r0_0.OnKeyDown(r0_3, r1_3, r2_3)
  -- line: [22, 29] id: 3
  local r4_3 = UE4.UFormulaFunctionLibrary.Key_GetFName(UE4.UKismetInputLibrary.GetKey(r2_3))
  if r4_3 == UE4.EKeys.Escape.KeyName or r4_3 == UIConst.GamePadKey.FaceButtonRight then
    r0_3:OnBackKeyDown()
    return UIUtils.Handled
  end
end
function r0_0.RefreshOpInfoByInputDevice(r0_4, r1_4, r2_4)
  -- line: [31, 33] id: 4
  r0_4:OnUpdateUIStyleByInputTypeChange(r1_4, r2_4)
end
function r0_0.OnUpdateUIStyleByInputTypeChange(r0_5, r1_5, r2_5)
  -- line: [35, 66] id: 5
  r0_0.Super.OnUpdateUIStyleByInputTypeChange(r0_5, r1_5, r2_5)
  r0_5.IsGamepadInput = r1_5 == ECommonInputType.Gamepad
  if r0_5.IsPC then
    r0_5.Key_Esc:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r0_5.Btn_Close:SetVisibility(UIConst.VisibilityOp.Collapsed)
    if r0_5.IsGamepadInput then
      r0_5.Key_Esc:CreateCommonKey({
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = r0_5.OnBackKeyDown,
            Owner = r0_5,
          }
        },
        Desc = GText("UI_BACK"),
      })
    else
      r0_5.Key_Esc:CreateCommonKey({
        KeyInfoList = {
          {
            Type = "Text",
            Text = CommonUtils:GetKeyText("Escape"),
            ClickCallback = r0_5.OnBackKeyDown,
            Owner = r0_5,
          }
        },
        Desc = GText("UI_BACK"),
      })
    end
  else
    r0_5.Key_Esc:SetVisibility(UIConst.VisibilityOp.Collapsed)
    r0_5.Btn_Close:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    r0_5.Btn_Close:Init("Close", r0_5, r0_5.OnBackKeyDown)
  end
end
function r0_0.InitUIInfo(r0_6, r1_6, r2_6, r3_6, r4_6)
  -- line: [69, 91] id: 6
  r0_0.Super.InitUIInfo(r0_6, r1_6, r2_6, r3_6, r4_6)
  r0_6:RefreshOpInfoByInputDevice(UIUtils.UtilsGetCurrentInputType())
  r0_6.VideoPlayer:BindEventToMediaPlayEnd(r0_6, r0_6.OnVideoPlayEnd)
  r0_6.VideoPlayer:SetIsNeedAudio(true)
  if not r4_6 then
    r4_6 = {}
  end
  rawset(r0_6, "DestructCB", r4_6.DestructCB)
  if r4_6.MediaSource then
    r0_6.VideoPlayer:SetUrlByMediaSource(r4_6.MediaSource)
  elseif r4_6.Url then
    r0_6.VideoPlayer:SetUrl(r4_6.Url)
  elseif r4_6.Path then
    local r5_6 = LoadObject(r4_6.Path)
    if r5_6 then
      r0_6.VideoPlayer:SetUrlByMediaSource(r5_6)
    end
  end
  if r4_6.SoundPath then
    AudioManager(r0_6):PlayUISound(r0_6, "event:/ui/common/gacha_amb", "GachaAmb", nil)
    AudioManager(r0_6):PlayUISound(r0_6, r4_6.SoundPath, "SkinVideoSound", nil)
  end
  r0_6.VideoPlayer:Play()
end
function r0_0.OnVideoPlayEnd(r0_7)
  -- line: [93, 95] id: 7
  r0_7:Close()
end
function r0_0.Destruct(r0_8)
  -- line: [97, 108] id: 8
  if rawget(r0_8, "bDestructed") then
    return 
  end
  rawset(r0_8, "bDestructed", true)
  AudioManager(r0_8):StopSound(r0_8, "SkinVideoSound")
  AudioManager(r0_8):SetEventSoundParam(r0_8, "GachaAmb", {
    ToEnd = 1,
  })
  r0_0.Super.Destruct(r0_8)
  if rawget(r0_8, "DestructCB") then
    r0_8.DestructCB()
  end
end
return r0_0
