# DNA_Lua

<div align="center">

**基于 Unreal Engine 和 UnLua 的大型多人在线动作游戏客户端**

[![Version](https://img.shields.io/badge/version-1.0.36-blue.svg)](https://github.com/yourusername/DNA_Lua)
[![Lua](https://img.shields.io/badge/Lua-5.x-blue.svg)](http://www.lua.org)
[![UnLua](https://img.shields.io/badge/UnLua-Framework-green.svg)](https://github.com/Tencent/UnLua)
[![UE](https://img.shields.io/badge/Unreal%20Engine-4%2F5-black.svg)](https://www.unrealengine.com)

</div>

## 📖 项目简介

DNA_Lua 是一个功能完整的大型多人在线动作游戏（MMORPG/ARPG）客户端 Lua 脚本项目，包含超过 **4800 个 Lua 文件**，涵盖了现代网络游戏所需的完整系统架构。

该项目基于 **UnLua** 框架，充分利用 Lua 的灵活性和 Unreal Engine 的强大渲染能力，实现了高性能、可热更新的游戏客户端解决方案。

## ✨ 主要特性

### 🎮 核心游戏系统
- **完整的角色系统**：玩家角色、怪物、NPC、召唤物等
- **战斗系统**：技能系统、Buff/Debuff、连击、韧性、伤害计算
- **属性系统**：攻击、防御、生命、能量等多维度属性
- **AI系统**：怪物AI、行为树、寻路系统

### 🏰 副本与玩法
- **多样化副本**：生存模式、防御模式、挖掘模式、深渊系统
- **Roguelike 玩法**：肉鸽模式支持
- **多人协作**：支持 2 人/多人副本匹配

### 🌐 网络与社交
- **自定义网络引擎**：基于 TCP 的客户端-服务器通信
- **匹配系统**：自动匹配和组队系统
- **多服务器支持**：开发服/生产服，支持多地区部署

### 🛠️ 开发者友好
- **热更新支持**：线上热修复系统（HotFix）
- **热重载**：开发期间 Lua 脚本实时重载
- **调试工具**：LuaPanda 调试器、日志系统、GM 命令
- **性能优化**：缓存系统、对象池、异步加载、LOD 优化

### 🎨 UI 系统
- 战斗 UI、血条系统、伤害飘字
- 副本 UI、匹配界面
- 锻造系统、道具系统
- 红点提示系统

## 📁 项目结构

```
DNA_Lua/
├── BluePrints/              # 游戏蓝图逻辑核心
│   ├── AI/                  # AI 系统
│   ├── AnimNotifiers/       # 动画通知器
│   ├── Camera/              # 相机控制
│   ├── Char/                # 角色系统（玩家、怪物、NPC）
│   ├── Client/              # 客户端逻辑
│   ├── Combat/              # 战斗系统（技能、Buff、伤害）
│   ├── Common/              # 通用组件
│   ├── GameMode/            # 游戏模式
│   ├── HeroUSDK/            # Hero SDK 集成
│   ├── HotUpdate/           # 热更新系统
│   ├── Item/                # 道具系统
│   ├── Managers/            # 各类管理器
│   ├── Maps/                # 地图相关
│   ├── Story/               # 剧情系统
│   ├── TakeRecorder/        # 录制器
│   └── UI/                  # UI 系统
├── Datas/                   # 数据表（721 个配置文件）
├── EMCache/                 # 缓存系统
├── NetworkEngine/           # 网络引擎
│   ├── Bot/                 # Bot 支持
│   ├── Common/              # 网络通用模块
│   ├── Proto/               # 协议定义
│   └── Rpc/                 # RPC 调用
├── StoryCreator/            # 剧情创建工具
├── Test/                    # 测试文件
└── Utils/                   # 工具库（时间、道具、UI 等）
```

## 🛠️ 技术栈

### 核心框架
- **Lua 5.x** - 主要脚本语言
- **UnLua** - Unreal Engine 的 Lua 绑定框架
- **Unreal Engine 4/5** - 游戏引擎

### 关键库
- **LuaPanda** - Lua 调试器
- **msgpack** - 消息打包
- **rapidjson/bson** - 数据序列化
- **Serpent** - Lua 表序列化

### 架构特点
- **ECS 架构思想**：Entity-Component-System 设计模式
- **自定义 Class 系统**：支持继承和组件化
- **数据分区缓存**：高效的数据管理系统
- **网络同步优化**：客户端预测 + 服务端权威

## 🚀 快速开始

### 前置要求

- Unreal Engine 4.27+ 或 Unreal Engine 5.x
- UnLua 插件已安装
- Lua 5.x 环境

### 运行流程

该项目是 Unreal Engine 项目的 Lua 脚本部分，需要配合完整的 UE 项目使用。

1. **初始化流程**：
   ```
   UnLua.lua → SetupClient.lua → BP_EMGameInstance_C.lua
   ```

2. **脚本自动加载**：
   - UnLua 框架会自动加载所有 Lua 脚本
   - 入口点在 `SetupClient.lua` 中定义

3. **服务器配置**：
   - 编辑 `ServerConfig.lua` 设置目标服务器
   - 支持开发服和生产服切换

### 开发调试

1. **热重载**：
   ```lua
   -- 修改 Lua 脚本后，在游戏中执行热重载
   UnLuaHotReload.Reload()
   ```

2. **调试器**：
   - 使用 LuaPanda 进行断点调试
   - 查看 `LuaPanda.lua` 配置调试器

3. **日志系统**：
   ```lua
   -- 使用自定义日志系统
   require("LogPrint")
   LogPrint("调试信息")
   ```

4. **GM 命令**：
   - 游戏内可使用 GM 命令快速测试
   - 参见 `GMInterface.lua`

## 🎯 核心系统说明

### 实体管理系统

```lua
-- 实体管理器负责所有游戏对象的生命周期
EntityManager:CreateEntity(entityType, config)
EntityManager:DestroyEntity(entityId)
```

### 数据管理系统

- **DataMgr**：管理 721 个数据表
- **分区缓存**：按需加载，优化内存占用
- 支持数据热更新

### 网络系统

```lua
-- TCP 客户端连接
TcpClient:Connect(ip, port)
TcpClient:SendMessage(msgId, msgData)
```

- 自定义协议栈
- RPC 远程调用支持
- 消息队列和断线重连

### 战斗系统

- **技能系统**：普攻、重攻、滑铲、射击、终极技能
- **Buff 系统**：支持叠加、互斥、驱散等机制
- **伤害计算**：包含暴击、防御、属性克制等
- **连击系统**：ComboCount 和连击奖励

### UI 架构

- **UMG + Lua**：C++ 定义界面，Lua 实现逻辑
- **红点系统**：自动化的红点提示管理
- **页面跳转**：统一的页面导航系统

## 📊 性能优化

项目包含多项性能优化措施：

- ✅ **对象池技术**：减少频繁创建销毁
- ✅ **异步加载**：资源预加载和异步加载
- ✅ **LOD 系统**：根据距离优化渲染
- ✅ **缓存策略**：数据分区缓存，减少查询
- ✅ **内存管理**：LuaMemoryManager 监控内存

## 🔥 热更新系统

### HotFix 热修复

```lua
-- 线上热修复支持
Hotfix:ApplyPatch(patchName)
```

### 热重载

- 开发期间支持 Lua 脚本实时重载
- 无需重启游戏即可看到代码修改效果

## 🌍 跨平台支持

- ✅ Windows
- ✅ Android
- ✅ iOS
- ✅ 其他 Unreal Engine 支持的平台

## 📝 版本历史

- **v1.0.36** - 最新版本
- **v1.0.35** - 功能更新
- **v1.0.34** - 功能更新
- **v1.0.31** - 游戏热修复补丁版本

查看完整提交历史：`git log --oneline`

## 📚 代码规范

- **命名规范**：遵循 Lua 和 Unreal 的混合命名风格
- **模块化设计**：每个系统独立封装
- **注释语言**：中文注释为主
- **文件组织**：按功能模块划分目录

## 🤝 开发团队

项目采用中文开发环境，适合中文开发团队协作。

## ⚠️ 注意事项

1. 该项目是 Unreal Engine 项目的 **Lua 脚本部分**，需要配合完整的 UE 项目使用
2. 修改服务器配置前请确认目标环境
3. 生产环境请关闭调试功能
4. 热更新前请做好备份和回滚准备

## 📄 许可证

请根据项目实际情况添加许可证信息。

## 🔗 相关链接

- [Unreal Engine 官网](https://www.unrealengine.com)
- [UnLua 项目](https://github.com/Tencent/UnLua)
- [Lua 官方文档](http://www.lua.org/manual/5.4/)

---

<div align="center">

**💡 提示**：这是一个功能完整的大型游戏项目，建议先熟悉核心系统再进行二次开发。

Made with ❤️ by DuetNightAbyssGame

</div>
