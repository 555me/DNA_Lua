-- filename: @C:/Pack/Branch/geili11\Content/Script/BluePrints\UI\GameLogin\WBP_ServerSelect_C.lua
-- version: lua54
-- line: [0, 0] id: 0
require("UnLua")
require("DataMgr")
local r0_0 = require("BluePrints/UI/GameLogin/DevServerList")
local r1_0 = Class("BluePrints.UI.BP_UIState_C")
local r2_0 = nil
local r3_0 = nil
local r4_0 = nil
local r5_0 = 0
function r1_0.Construct(r0_1)
  -- line: [23, 25] id: 1
  r0_1.Super.Construct(r0_1)
end
function r1_0.CloseUI(r0_2)
  -- line: [27, 32] id: 2
  AudioManager(r0_2):PlayUISound(r0_2, "event:/ui/common/click_btn_small", nil, nil)
  r0_2:Show(UIConst.VisibilityOp.Collapsed)
  r0_2:Close()
end
function r1_0.Show(r0_3, r1_3)
  -- line: [34, 47] id: 3
  r0_3:SetVisibility(r1_3)
  if r1_3 == UIConst.VisibilityOp.Visible then
    r0_3:PlayAnim("HideOrShow_Panel_Server")
    if r3_0 == nil then
      r0_3:RefreshSeverList()
    else
      r0_3:VerifyListViewCallBack()
      r0_3.ListView_Area:SetSelectedIndex(r5_0)
    end
  end
end
function r1_0.RefreshSeverList(r0_4)
  -- line: [50, 53] id: 4
  r0_4.CircularThrobber_1:SetVisibility(UIConst.VisibilityOp.Visible)
  r0_4:TryToGetServerList()
end
function r1_0.TryToGetServerList(r0_5)
  -- line: [56, 67] id: 5
  r0_5:AddTimer(0.5, r0_5.VerifyListViewCallBack, false, 0, "VerifyListView")
  r2_0 = {}
  for r5_5, r6_5 in pairs(r0_0) do
    if r5_5 < 1000 or 7000 <= r5_5 and r5_5 <= 7100 or 8000 <= r5_5 and r5_5 <= 8100 then
      r2_0[r5_5] = r6_5
    end
  end
  -- close: r1_5
end
function r1_0.VerifyListViewCallBack(r0_6)
  -- line: [69, 110] id: 6
  if r2_0 then
    r0_6.ListView_Area:ClearListItems()
    local r1_6 = r0_6:NewAreaItemContent(nil)
    r5_0 = 0
    r1_6.Area = r5_0
    r1_6.Name = "推荐"
    r0_6.ListView_Area:AddItem(r1_6)
    r3_0 = {
      {
        area = 1,
        name = "开发",
        servers = nil,
      },
      {
        area = 2,
        name = "开发2",
        servers = nil,
      },
      {
        area = 3,
        name = "QA",
        servers = nil,
      },
      {
        area = 4,
        name = "策划",
        servers = nil,
      },
      {
        area = 5,
        name = "其他",
        servers = nil,
      }
    }
    for r6_6, r7_6 in pairs(r2_0) do
      if r3_0[r7_6.area] == nil then
        r3_0[r7_6.area] = {
          area = r7_6.area,
          name = "Area " .. r7_6.area,
          servers = nil,
        }
      end
      if r3_0[r7_6.area].servers == nil then
        r3_0[r7_6.area].servers = {}
      end
      r3_0[r7_6.area].servers[r6_6] = r7_6
    end
    -- close: r2_6
    for r6_6, r7_6 in pairs(r3_0) do
      if r7_6.servers then
        r0_6.ListView_Area:AddItem(r0_6:NewAreaItemContent({
          area = r7_6.area,
          name = r7_6.name,
        }))
      end
    end
    -- close: r2_6
    r0_6.ListView_Area:BP_SetSelectedItem(r1_6)
    r0_6:RemoveTimer("VerifyListView")
    r0_6.CircularThrobber_1:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    print(_G.LogTag, "Failed to get server list, error code:")
  end
end
function r1_0.NewAreaItemContent(r0_7, r1_7)
  -- line: [112, 121] id: 7
  if r1_7 == nil then
    return NewObject(r0_7.AreaItemContentClass, r0_7.ListView_Area)
  end
  local r2_7 = NewObject(r0_7.AreaItemContentClass, r0_7.ListView_Area)
  r2_7.Area = r1_7.area
  r2_7.Name = r1_7.name
  r2_7.IsSelected = false
  return r2_7
end
function r1_0.NewServerItemContent(r0_8, r1_8)
  -- line: [123, 135] id: 8
  if r1_8 == nil then
    return NewObject(r0_8.ServerItemContentClass, r0_8.List)
  end
  local r2_8 = NewObject(r0_8.ServerItemContentClass, r0_8.List)
  r2_8.HostId = r1_8.hostnum
  r2_8.Area = r1_8.area
  r2_8.Name = r1_8.name
  r2_8.IP = r1_8.ip
  r2_8.Port = r1_8.port
  r2_8.IsSelected = false
  return r2_8
end
function r1_0.SwitchArea(r0_9, r1_9)
  -- line: [138, 179] id: 9
  if not GWorld.IsDev then
    return 
  end
  if r1_9 ~= r5_0 then
    UIUtils.PlayCommonBtnSe(r0_9)
  end
  if r3_0 ~= nil then
    r5_0 = r1_9
    r0_9.SelectedArea = r0_9.ListView_Area:BP_GetSelectedItem()
    r0_9.List:ClearListItems()
    r4_0 = {}
    if r1_9 == 0 then
      for r6_9, r7_9 in pairs(r2_0) do
        table.insert(r4_0, r7_9)
      end
      -- close: r2_9
    else
      for r6_9, r7_9 in pairs(r3_0) do
        if r7_9.area == r1_9 and r7_9.servers then
          for r12_9, r13_9 in pairs(r7_9.servers) do
            if r13_9.area == r1_9 then
              table.insert(r4_0, r13_9)
            end
          end
          -- close: r8_9
          break
        end
      end
      -- close: r2_9
    end
    table.sort(r4_0, function(r0_10, r1_10)
      -- line: [172, 174] id: 10
      return r0_10.hostnum < r1_10.hostnum
    end)
    r0_9:SearchServer(r0_9.Input_Search_Server:GetText())
  end
end
function r1_0.SearchServer(r0_11, r1_11)
  -- line: [181, 196] id: 11
  if r4_0 ~= nil then
    r0_11.List:ClearListItems()
    if r1_11 ~= nil then
      for r6_11, r7_11 in pairs(r4_0) do
        if string.find(r7_11.name, r1_11) ~= nil or string.find(r7_11.hostnum, r1_11) ~= nil then
          r0_11.List:AddItem(r0_11:NewServerItemContent(r7_11))
        end
      end
      -- close: r2_11
    else
      for r6_11, r7_11 in pairs(r4_0) do
        r0_11.List:AddItem(r0_11:NewServerItemContent(r7_11))
      end
      -- close: r2_11
    end
  end
end
function r1_0.Confirm(r0_12)
  -- line: [198, 206] id: 12
  local r1_12 = r0_12.List:BP_GetSelectedItem()
  if r1_12 ~= nil and r0_12.SelectedServer ~= r1_12 then
    r0_12.SelectedServer = r1_12
    r0_12.IsSelectionChanged = true
  else
    r0_12.IsSelectionChanged = false
  end
end
function r1_0.PlayUISound(r0_13, r1_13)
  -- line: [208, 210] id: 13
  AudioManager(r0_13):PlayUISound(r0_13, r1_13, nil, nil)
end
return r1_0
