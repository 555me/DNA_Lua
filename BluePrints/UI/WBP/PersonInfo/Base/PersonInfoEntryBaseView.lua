-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\WBP\PersonInfo\Base\PersonInfoEntryBaseView.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
local r0_0 = require("BluePrints.UI.WBP.PersonInfo.PersonInfoCommon")
local r1_0 = require("BluePrints.UI.WBP.PersonInfo.PersonInfoController")
local r2_0 = r1_0:GetModel()
return {
  _components = {
    "BluePrints.UI.WBP.Armory.MainComponent.Armory_PointerInputComponent"
  },
  Construct = function(r0_1)
    -- line: [14, 58] id: 1
    r0_1:RefreshBaseInfo()
    local r1_1 = coroutine.create(function()
      -- line: [17, 19] id: 2
      r0_1.PersonInfoMainPage:ModelViewIni()
    end)
    if r0_1.HideBegin and not r0_1:IsAnimationPlaying(r0_1.Bg_In) then
      r0_1:SetRenderOpacity(0)
    end
    r0_1:AddTimer(r0_1.delta1 and 0.05, function()
      -- line: [24, 57] id: 3
      DebugPrint("开始加载角色")
      if r1_0.CurPage == nil then
        return 
      end
      local r0_3, r1_3 = coroutine.resume(r1_1)
      if not r0_3 then
        ScreenPrint("[LUA_ERROR] Coroutine (model):\n" .. debug.traceback(r1_1, tostring(r1_3), 2))
      end
      r0_1:AddTimer(r0_1.delta2 and 0.1, function()
        -- line: [34, 56] id: 4
        DebugPrint("开始加载场景")
        if r1_0.CurPage == nil then
          return 
        end
        local r0_4, r1_4 = coroutine.resume(r1_1)
        if not r0_4 then
          ScreenPrint("[LUA_ERROR] Coroutine (scene):\n" .. debug.traceback(r1_1, tostring(r1_4), 2))
        end
        r0_1:AddTimer(r0_1.delta3 and 0.1, function()
          -- line: [46, 55] id: 5
          if r1_0.CurPage == nil then
            return 
          end
          local r0_5, r1_5 = coroutine.resume(r1_1)
          if not r0_5 then
            ScreenPrint("[LUA_ERROR] Coroutine (camera):\n" .. debug.traceback(r1_1, tostring(r1_5), 2))
          end
        end)
      end)
    end)
  end,
  OnLoaded = function(r0_6, ...)
    -- line: [59, 73] id: 6
    r0_6.Super.OnLoaded(r0_6, ...)
    r0_6.Platform = CommonUtils.GetDeviceTypeByPlatformName(r0_6)
    r0_6:AddTimer(r0_6.StartDelay and 0, function()
      -- line: [63, 71] id: 7
      if r0_6.HideBegin then
        r0_6:SetRenderOpacity(1)
      end
      DebugPrint("开始播动画")
      r0_6.WBP_Com_BgSwitch:PlayAnimationForward(r0_6.WBP_Com_BgSwitch.In, r0_6.AniSpeed and 1)
      r0_6:PlayInAnim()
    end)
  end,
  Close = function(r0_8)
    -- line: [74, 79] id: 8
    DebugPrint("开始关闭")
    r0_8.Content:ClearChildren()
    r0_8.PersonInfoMainPage:OnClose()
    r1_0:OnClose()
  end,
  PlayInAnim = function(r0_9)
    -- line: [80, 83] id: 9
    AudioManager(r0_9):PlayUISound(r0_9, "event:/ui/armory/open", "PersonInfoPageMain", nil)
    r0_9:PlayAnimationForward(r0_9.In)
  end,
  PlayOutAnim = function(r0_10)
    -- line: [84, 93] id: 10
    AudioManager(r0_10):SetEventSoundParam(r0_10, "PersonInfoPageMain", {
      ToEnd = 1,
    })
    r0_10:UnbindAllFromAnimationFinished(r0_10.Out)
    r0_10:BindToAnimationFinished(r0_10.Out, {
      r0_10,
      r0_10.Close
    })
    r0_10.PersonInfoMainPage:PlayAnimationForward(r0_10.PersonInfoMainPage.Out)
    r0_10:PlayAnimationForward(r0_10.Out)
  end,
  CheckIsCanCloseSelf = function(r0_11)
    -- line: [95, 105] id: 11
    if r0_11.PersonInfoMainPage.IsEditOpen then
      r0_11.PersonInfoMainPage.IsEditOpen = false
      r0_11.PersonInfoMainPage:PlayAnimation(r0_11.PersonInfoMainPage.Edit_List_Out)
      return false
    end
    if r0_11:IsAnimationPlaying(r0_11.In) then
      return false
    end
    return true
  end,
  CreatePersonInfoMainPage = function(r0_12, r1_12)
    -- line: [107, 124] id: 12
    r1_0.MainPage = r0_12
    local r2_12 = nil
    if CommonUtils.GetDeviceTypeByPlatformName(r0_12) == "PC" then
      r2_12 = UIManager(r0_12):CreateWidget(r1_12.PCBluePrint)
    else
      r2_12 = UIManager(r0_12):CreateWidget(r1_12.MobileBluePrint and r1_12.PCBluePrint)
    end
    if r2_12 == nil then
      return 
    end
    r0_12.Content:AddChildToOverlay(r2_12)
    local r3_12 = UE4.UWidgetLayoutLibrary.SlotAsOverlaySlot(r2_12)
    r3_12:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
    r3_12:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
    return r2_12
  end,
}
