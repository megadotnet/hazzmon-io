# Hazzmon-io - Hazelcast 键监控与管理

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0)
[![Version](https://img.shields.io/badge/Version-1.2-green.svg)](https://github.com/sercancelenk/hazzmon-io)

一个功能强大的 Hazelcast 分布式数据结构监控和管理库。只需一行代码即可为您的 Hazelcast 集群键、映射和成员设置全面的监控。

📖 英文文档请参阅 [English Documentation](./README.md)

---

## 目录

- [项目简介](#项目简介)
- [功能特性](#功能特性)
- [技术栈](#技术栈)
- [环境要求](#环境要求)
- [安装与配置](#安装与配置)
- [项目结构](#项目结构)
- [使用指南](#使用指南)
- [开发规范](#开发规范)
- [常见问题排查](#常见问题排查)
- [截图展示](#截图展示)
- [贡献指南](#贡献指南)
- [许可证](#许可证)

---

## 项目简介

Hazzmon-io 是一个轻量级但功能强大的监控解决方案，专为使用 Hazelcast 作为分布式缓存和数据网格平台的 Java 应用程序设计。它由两个主要组件组成：

- **hazzmon-core**：后端服务，提供 REST API 用于监控 Hazelcast 实例、映射、键和集群成员
- **hazzmon-ui**：前端 Angular 应用程序，提供直观的 Web 界面进行实时监控和管理

该库可以无缝集成到 Spring Boot 应用程序中，只需最少的配置即可开始使用。

---

## 功能特性

- ✅ 实时监控 Hazelcast 集群成员和实例
- ✅ 详细查看映射统计信息和键分布
- ✅ 键级操作，包括查看、搜索和驱逐
- ✅ 与 Spring Boot 应用程序一键集成
- ✅ 采用现代框架构建的响应式 Web UI
- ✅ RESTful API 架构，易于扩展
- ✅ 支持多实例 Hazelcast 集群

---

## 技术栈

### 前端技术

| 技术 | 版本 | 作用说明 |
|------|------|----------|
| **Angular** | ~5.2.6 | 核心前端框架，用于构建单页应用程序 |
| **TypeScript** | ~2.7.2 | JavaScript 超集，提供类型检查和增强代码质量 |
| **Angular CLI** | ~1.7.3 | Angular 项目脚手架和构建的命令行工具 |
| **Bootstrap** | ^4.1.1 | CSS 框架，用于响应式布局和样式 |
| **PrimeNG** | ^5.2.3 | Angular 丰富的 UI 组件库 |
| **ng-bootstrap** | ^2.0.0 | 专为 Angular 构建的 Bootstrap 组件 |
| **RxJS** | 5.5.5 | 响应式编程库，用于异步数据处理 |
| **jQuery** | ^3.3.1 | JavaScript 库，用于 DOM 操作 |
| **Popper.js** | ^1.14.3 | 工具提示和弹出框定位引擎 |
| **Font Awesome** | ^4.7.0 | UI 元素图标工具包 |
| **Lodash** | ^4.17.10 | 常用编程任务工具库 |

### 后端技术

| 技术 | 版本 | 作用说明 |
|------|------|----------|
| **Java** | 1.8+ | 主要后端编程语言 |
| **Spring Boot** | 2.0.2.RELEASE (core) / 1.5.9.RELEASE (ui) | 快速开发应用框架 |
| **Spring Web** | 包含在 Starter 中 | RESTful Web 服务开发 |
| **Hazelcast** | ≥3.7.9 (provided) | 内存数据网格和分布式缓存 |
| **Hazelcast Spring** | Provided | Hazelcast 的 Spring 集成模块 |
| **Apache Commons Lang3** | 3.7 | 字符串处理等工具类 |
| **Apache Commons Collections4** | 4.1 | 扩展集合类型和工具 |
| **Apache Commons IO** | 2.6 | 文件 I/O 操作工具 |
| **Lombok** | 1.16.20 | 基于注解的样板代码简化 |

### 基础设施与中间件

| 技术 | 版本 | 作用说明 |
|------|------|----------|
| **Maven** | 3.x+ | 项目依赖管理和构建自动化 |
| **Node.js** | v9.4.0+ | 前端构建过程的 JavaScript 运行时 |
| **Yarn** | v1.6.0+ | Node.js 的快速可靠依赖管理 |

### 构建工具与开发

| 技术 | 版本 | 作用说明 |
|------|------|----------|
| **frontend-maven-plugin** | 1.6 | 将 Node.js/Yarn 构建集成到 Maven 生命周期 |
| **maven-antrun-plugin** | 1.7 | 在 Maven 构建期间执行 Ant 任务 |
| **Karma** | ~2.0.0 | 单元测试运行器 |
| **Jasmine** | ~2.8.0 | 行为驱动测试框架 |
| **Protractor** | ~5.1.2 | Angular 端到端测试框架 |
| **TSLint** | ~5.9.1 | TypeScript 代码质量静态分析工具 |
| **Codelyzer** | ^4.0.1 | Angular 风格指南合规性的 TSLint 规则 |

---

## 环境要求

### 最低系统要求

| 依赖项 | 最低版本 | 推荐版本 | 说明 |
|--------|----------|----------|------|
| **JDK** | 1.8 | 1.8 或 11 | OpenJDK 或 Oracle JDK |
| **Maven** | 3.3.9 | 3.6.0+ | 构建 Java 模块必需 |
| **Node.js** | 9.4.0 | 10.x 或 LTS | 由 frontend-maven-plugin 自动安装 |
| **Yarn** | 1.6.0 | 最新稳定版 | 由 frontend-maven-plugin 自动安装 |
| **Hazelcast** | 3.7.9 | 最新 3.x 或 4.x | 必须在项目类路径中（provided scope） |
| **Spring Boot** | 1.5.9 | 2.0.2+ | Core 使用 2.0.2，UI 使用 1.5.9 |

### 兼容操作系统

- **Windows**: Windows 7/8/10/11（推荐 64 位）
- **macOS**: macOS 10.12 (Sierra) 或更高版本
- **Linux**: Ubuntu 16.04+、CentOS 7+、Debian 9+ 或同等发行版

---

## 安装与配置

### 前置条件验证

开始前，请确保您的环境满足要求：

```bash
# 检查 Java 版本
java -version

# 检查 Maven 版本
mvn -version

# 检查 Node.js 版本（可选，将自动安装）
node -v

# 检查 Yarn 版本（可选，将自动安装）
yarn -v
```

### 分步安装

#### 1. 克隆仓库

```bash
git clone https://github.com/sercancelenk/hazzmon-io.git
cd hazzmon-io
```

#### 2. 构建并安装 hazzmon-core

```bash
cd hazzmon-core
mvn clean install -DskipTests
```

#### 3. 构建并安装 hazzmon-ui

```bash
cd ../hazzmon-ui
mvn -Pui-build clean process-resources -DskipTests
mvn install -DskipTests
```

**注意：** `ui-build` 配置文件将自动：
- 安装 Node.js v9.4.0 和 Yarn v1.6.0
- 运行 `yarn install` 获取前端依赖
- 执行代码检查和构建过程
- 将 Angular 应用程序打包为 JAR 文件

#### 4. 集成到您的项目

将以下依赖项添加到您项目的 `pom.xml` 中：

```xml
<dependency>
    <groupId>byzas.libs</groupId>
    <artifactId>hazzmon-core</artifactId>
    <version>1.2</version>
</dependency>

<dependency>
    <groupId>byzas.libs</groupId>
    <artifactId>hazzmon-ui</artifactId>
    <version>1.2</version>
</dependency>
```

#### 5. 在应用中启用 Hazzmon

将 `@EnableHazzmonListener` 注解添加到您的 Spring Boot 配置类：

```java
import byzas.libs.hazzmon.core.configuration.EnableHazzmonListener;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@EnableHazzmonListener
public class MyApplication {
    public static void main(String[] args) {
        SpringApplication.run(MyApplication.class, args);
    }
}
```

#### 6. 访问监控界面

启动您的 Spring Boot 应用程序并访问：

```
http://localhost:8080/hazzmon-ui.html
```

---

## 项目结构

```
hazzmon-io/
├── README.md                    # 英文文档
├── README-ZhCn.md               # 中文文档
├── _config.yml                  # Jekyll 站点配置
├── .gitignore                   # Git 忽略规则
│
├── hazzmon-core/                # 后端核心模块
│   ├── pom.xml                  # Maven 配置
│   ├── .gitignore
│   └── src/
│       └── main/
│           └── java/
│               └── byzas/libs/hazzmon/core/
│                   ├── configuration/
│                   │   ├── EnableHazzmonListener.java    # 主注解
│                   │   ├── HazzmonCommonConfiguration.java
│                   │   └── SinglePageAppConfig.java
│                   ├── controller/
│                   │   └── HazzmonCoreController.java    # REST 端点
│                   ├── model/
│                   │   ├── ClusterInfo.java
│                   │   ├── MapInfo.java
│                   │   ├── Key.java
│                   │   └── ...                           # 数据模型
│                   ├── service/
│                   │   ├── HazzmonCoreService.java
│                   │   └── impl/
│                   │       └── HazzmonCoreServiceImpl.java
│                   ├── util/
│                   │   ├── Constants.java
│                   │   └── SPAppContext.java
│                   └── filter/
│                       └── CorsFilter.java               # CORS 支持
│
└── hazzmon-ui/                  # 前端 UI 模块
    ├── pom.xml                  # Maven 配置（含前端插件）
    ├── package.json             # Node.js 依赖
    ├── yarn.lock                # Yarn 锁定文件
    ├── tsconfig.json            # TypeScript 配置
    ├── tslint.json              # TSLint 规则
    ├── karma.conf.js            # Karma 测试配置
    ├── protractor.conf.js       # Protractor E2E 配置
    ├── mvnw                     # Maven 包装器 (Unix)
    ├── mvnw.cmd                 # Maven 包装器 (Windows)
    ├── .gitignore
    ├── README.md                # Angular CLI 生成的 readme
    ├── e2e/                     # 端到端测试
    │   └── tsconfig.e2e.json
    └── src/
        ├── app/
        │   ├── app.module.ts           # Angular 根模块
        │   ├── app.routing.ts          # 应用路由
        │   ├── monitor/
        │   │   ├── monitor.module.ts
        │   │   ├── monitor-routing.module.ts
        │   │   ├── monitor.component.ts
        │   │   ├── home/               # 仪表板组件
        │   │   ├── instances/          # Hazelcast 实例视图
        │   │   ├── members/            # 集群成员视图
        │   │   ├── key/
        │   │   │   ├── list/           # 键列表
        │   │   │   ├── detail/         # 键详情
        │   │   │   └── eviction/       # 键驱逐
        │   │   └── common/
        │   │       └── service/
        │   │           └── urlutil.service.ts
        │   └── footer/
        │       └── footer.component.ts
        ├── assets/                     # 静态资源
        ├── environments/               # 环境配置
        ├── main.ts                     # 应用入口点
        ├── polyfills.ts                # 浏览器填充
        ├── styles.css                  # 全局样式
        └── test.ts                     # 测试入口点
```

---

## 使用指南

### 基础集成

1. 将依赖项添加到您的项目
2. 在配置类上添加 `@EnableHazzmonListener` 注解
3. 确保在应用中配置了 Hazelcast
4. 访问 `/hazzmon-ui.html` 端点

### 可用功能

- **仪表板**: 集群健康状况和统计信息概览
- **实例**: 查看应用中的所有 Hazelcast 实例
- **成员**: 监控集群成员及其状态
- **映射**: 浏览分布式映射及其内容
- **键**: 搜索、查看和驱逐特定键
- **统计**: 实时指标和性能数据

### API 端点

核心模块暴露以下 REST 端点：

| 端点 | 方法 | 描述 |
|------|------|------|
| `/api/hazzmon/instances` | GET | 列出所有 Hazelcast 实例 |
| `/api/hazzmon/members` | GET | 获取集群成员信息 |
| `/api/hazzmon/maps` | GET | 检索映射统计信息 |
| `/api/hazzmon/keys` | GET | 查询特定映射中的键 |
| `/api/hazzmon/keys/{key}` | GET | 获取详细键信息 |
| `/api/hazzmon/keys/evict` | POST | 驱逐指定键 |

---

## 开发规范

### 代码风格

- **后端 (Java)**: 遵循 Oracle Java 代码规范
- **前端 (TypeScript)**: 遵守 Angular 风格指南
- **代码检查**: 提交前运行 `mvn lint` 或 `yarn lint`

### 从源码构建

```bash
# 完整构建（包含测试）
mvn clean install

# 跳过测试以加快构建
mvn clean install -DskipTests

# 仅构建 UI 模块（含前端）
cd hazzmon-ui && mvn -Pui-build clean install
```

### 运行测试

```bash
# 后端单元测试
mvn test

# 前端单元测试
cd hazzmon-ui && yarn test

# 前端端到端测试
cd hazzmon-ui && yarn e2e
```

### 参与贡献

1. Fork 本仓库
2. 创建特性分支 (`git checkout -b feature/amazing-feature`)
3. 提交更改 (`git commit -m 'Add amazing feature'`)
4. 推送到分支 (`git push origin feature/amazing-feature`)
5. 提交 Pull Request

---

## 常见问题排查

### 常见问题及解决方案

#### 问题 1：构建失败，提示"Node.js 版本不兼容"

**解决方案：** frontend-maven-plugin 会自动安装正确的 Node.js 版本。确保使用 `ui-build` 配置文件：

```bash
mvn -Pui-build clean process-resources
```

#### 问题 2：Hazelcast 版本冲突

**解决方案：** 确保项目使用 Hazelcast 3.7.9 或更高版本。如需要，添加显式依赖：

```xml
<dependency>
    <groupId>com.hazelcast</groupId>
    <artifactId>hazelcast</artifactId>
    <version>3.9.4</version>
</dependency>
```

#### 问题 3：UI 页面返回 404

**解决方案：** 验证 hazzmon-core 和 hazzmon-ui 都在类路径中。检查 Spring Boot 的组件扫描是否包含 hazzmon 包。

#### 问题 4：浏览器控制台出现 CORS 错误

**解决方案：** CorsFilter 应该自动处理此问题。如果问题仍然存在，请在 Spring Security 配置中配置 CORS。

#### 问题 5：Windows 上 Maven 构建失败

**解决方案：** 以管理员身份运行 Maven 或调整文件权限。确保路径长度不超过 Windows 限制。

#### 问题 6：Angular 构建出现 RxJS 警告

**解决方案：** 这些是 Angular 5 和 RxJS 5.5 之间的兼容性警告，不影响功能，但建议新项目升级。

### 获取帮助

- 查看现有的 [GitHub Issues](https://github.com/sercancelenk/hazzmon-io/issues)
- 通过电子邮件联系维护者：sercancelenk@gmail.com
- 查阅 Hazelcast 文档了解集群配置

---

## 截图展示

### 仪表板概览
![仪表板](https://user-images.githubusercontent.com/289513/40587365-e84867ae-61d6-11e8-9667-6d16e7569b0b.png)

### 集群成员视图
![成员](https://user-images.githubusercontent.com/289513/40587392-1f47e50e-61d7-11e8-8413-23cb6a2dcad4.png)

### 映射统计
![映射](https://user-images.githubusercontent.com/289513/40587399-30bb62f2-61d7-11e8-8838-100803d7f2c2.png)

### 键详情
![键详情](https://user-images.githubusercontent.com/289513/40587402-36046aec-61d7-11e8-99ef-d79851c02a92.png)

### 键驱逐
![驱逐](https://user-images.githubusercontent.com/289513/40587405-3b5bf762-61d7-11e8-910e-222e681d332e.png)

---

## 贡献指南

我们欢迎来自社区的贡献！您可以通过以下方式提供帮助：

- 通过 GitHub Issues 报告错误和建议功能
- 提交包含错误修复或改进的 Pull Request
- 改进文档
- 分享您的使用案例和反馈

### 贡献者

- **Sercan CELENK** ([@sercancelenk](https://github.com/sercancelenk)) - 创始人 & 维护者
- **Caner Kurtul** ([@canerkurtul](https://github.com/canerkurtul)) - 特别感谢

详细的贡献指南请参阅 [贡献指南](CONTRIBUTING.md)（如有）。

---

## 许可证

本项目采用 Apache License 2.0 许可 - 详见 [LICENSE](LICENSE) 文件。

```
Copyright (C) 2016 MarkZhai (http://zhaiyifan.cn)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

---

## 捐赠

如果您觉得这个仓库对您有帮助，请考虑捐款以支持持续开发。联系方式：sercancelenk@gmail.com

---

**祝您监控愉快！🚀**
