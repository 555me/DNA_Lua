-- filename: @C:/Pack/Branch/geili11\Content/Script/Datas\HotfixData.lua
-- version: lua54
-- line: [0, 0] id: 0
return {
  index = 5,
  script = "-- 请在此处编写HotFix代码,请组长编写\n\tDataMgr.ShopItem[140118].Price = 100\n\tDataMgr.ShopItem[140133].Price = 100\n\tDataMgr.ShopItem[140134].Price = 100\n\tDataMgr.ShopItem[140135].Price = 100\n\n\tUE4.URuntimeCommonFunctionLibrary.EnableGlobalAnimCache(GWorld and GWorld.GameInstance, false)\n\n\tDataMgr.Dungeon[90173].DungeonInitGuideUnitId[1] = 6002016\n\tDataMgr.Dungeon[90174].DungeonInitGuideUnitId[1] = 6001011\n\tDataMgr.Dungeon[90175].DungeonInitGuideUnitId[1] = 6002017\n\tDataMgr.Dungeon[90176].DungeonInitGuideUnitId[1] = 6013015\n\tDataMgr.Dungeon[90177].DungeonInitGuideUnitId[1] = 6007016\n\tDataMgr.Dungeon[90178].DungeonInitGuideUnitId[1] = 6004012\n\n\tDataMgr.MonsterSpawn[90173].MonsterSpawnInfos = {\n\t\t[1] = {\n\t\t\tUnitId = 6002016,\n\t\t\tUnitLevel = 0,\n\t\t\tUnitNum = 1,\n\t\t\tUnitNumFix = 1,\n\t\t}\n\t}\n\tDataMgr.MonsterSpawn[90174].MonsterSpawnInfos = {\n\t\t[1] = {\n\t\t\tUnitId = 6001011,\n\t\t\tUnitLevel = 0,\n\t\t\tUnitNum = 1,\n\t\t\tUnitNumFix = 1,\n\t\t}\n\t}\n\tDataMgr.MonsterSpawn[90175].MonsterSpawnInfos = {\n\t\t[1] = {\n\t\t\tUnitId = 6002017,\n\t\t\tUnitLevel = 0,\n\t\t\tUnitNum = 1,\n\t\t\tUnitNumFix = 1,\n\t\t}\n\t}\n\tDataMgr.MonsterSpawn[90176].MonsterSpawnInfos = {\n\t\t[1] = {\n\t\t\tUnitId = 6013015,\n\t\t\tUnitLevel = 0,\n\t\t\tUnitNum = 1,\n\t\t\tUnitNumFix = 1,\n\t\t}\n\t}\n\tDataMgr.MonsterSpawn[90177].MonsterSpawnInfos = {\n\t\t[1] = {\n\t\t\tUnitId = 6007016,\n\t\t\tUnitLevel = 0,\n\t\t\tUnitNum = 1,\n\t\t\tUnitNumFix = 1,\n\t\t}\n\t}\n\tDataMgr.MonsterSpawn[90178].MonsterSpawnInfos = {\n\t\t[1] = {\n\t\t\tUnitId = 6004012,\n\t\t\tUnitLevel = 0,\n\t\t\tUnitNum = 1,\n\t\t\tUnitNumFix = 1,\n\t\t}\n\t}\n\n\n",
  client_version = {
    ForceUpdateCheck = "1",
  },
  force_update_version = "1",
  patch_version = {
    ["1"] = "0",
  },
}
