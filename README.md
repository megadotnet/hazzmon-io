# Hazzmon-io - Hazelcast Keys Monitor & Management

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0)
[![Version](https://img.shields.io/badge/Version-1.2-green.svg)](https://github.com/sercancelenk/hazzmon-io)

A powerful monitoring and management library for Hazelcast distributed data structures in Java projects. With just one line of code, you can set up comprehensive monitoring for your Hazelcast cluster keys, maps, and members.

📖 For Chinese documentation, please refer to [中文版文档](./README-ZhCn.md)

---

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Technology Stack](#technology-stack)
- [Environment Requirements](#environment-requirements)
- [Installation & Setup](#installation--setup)
- [Project Structure](#project-structure)
- [Usage Guide](#usage-guide)
- [Development Guidelines](#development-guidelines)
- [Troubleshooting](#troubleshooting)
- [Screenshots](#screenshots)
- [Contributing](#contributing)
- [License](#license)

---

## Introduction

Hazzmon-io is a lightweight yet powerful monitoring solution designed for Java applications using Hazelcast as their distributed caching and data grid platform. It consists of two main components:

- **hazzmon-core**: Backend service that exposes REST APIs for monitoring Hazelcast instances, maps, keys, and cluster members
- **hazzmon-ui**: Frontend Angular application providing an intuitive web interface for real-time monitoring and management

The library seamlessly integrates with Spring Boot applications and requires minimal configuration to get started.

---

## Features

- ✅ Real-time monitoring of Hazelcast cluster members and instances
- ✅ Detailed view of map statistics and key distributions
- ✅ Key-level operations including viewing, searching, and eviction
- ✅ One-line integration with Spring Boot applications
- ✅ Responsive web UI built with modern frameworks
- ✅ RESTful API architecture for easy extensibility
- ✅ Support for multi-instance Hazelcast clusters

---

## Technology Stack

### Frontend Technologies

| Technology | Version | Purpose |
|------------|---------|---------|
| **Angular** | ~5.2.6 | Core frontend framework for building single-page application |
| **TypeScript** | ~2.7.2 | Typed JavaScript superset for enhanced code quality |
| **Angular CLI** | ~1.7.3 | Command-line interface for Angular project scaffolding and build |
| **Bootstrap** | ^4.1.1 | CSS framework for responsive layout and styling |
| **PrimeNG** | ^5.2.3 | Rich UI component library for Angular |
| **ng-bootstrap** | ^2.0.0 | Bootstrap components built specifically for Angular |
| **RxJS** | 5.5.5 | Reactive programming library for asynchronous data handling |
| **jQuery** | ^3.3.1 | JavaScript library for DOM manipulation |
| **Popper.js** | ^1.14.3 | Tooltip and popover positioning engine |
| **Font Awesome** | ^4.7.0 | Icon toolkit for UI elements |
| **Lodash** | ^4.17.10 | Utility library for common programming tasks |

### Backend Technologies

| Technology | Version | Purpose |
|------------|---------|---------|
| **Java** | 1.8+ | Primary backend programming language |
| **Spring Boot** | 2.0.2.RELEASE (core) / 1.5.9.RELEASE (ui) | Application framework for rapid development |
| **Spring Web** | Included in Starter | RESTful web service development |
| **Hazelcast** | ≥3.7.9 (provided) | In-memory data grid and distributed caching |
| **Hazelcast Spring** | Provided | Spring integration module for Hazelcast |
| **Apache Commons Lang3** | 3.7 | Utility classes for string manipulation and more |
| **Apache Commons Collections4** | 4.1 | Extended collection types and utilities |
| **Apache Commons IO** | 2.6 | File I/O operations utility |
| **Lombok** | 1.16.20 | Annotation-based boilerplate code reduction |

### Infrastructure & Middleware

| Technology | Version | Purpose |
|------------|---------|---------|
| **Maven** | 3.x+ | Project dependency management and build automation |
| **Node.js** | v9.4.0+ | JavaScript runtime for frontend build process |
| **Yarn** | v1.6.0+ | Fast, reliable dependency management for Node.js |

### Build Tools & Development

| Technology | Version | Purpose |
|------------|---------|---------|
| **frontend-maven-plugin** | 1.6 | Integrates Node.js/Yarn builds into Maven lifecycle |
| **maven-antrun-plugin** | 1.7 | Execute Ant tasks during Maven build |
| **Karma** | ~2.0.0 | Test runner for unit testing |
| **Jasmine** | ~2.8.0 | Behavior-driven testing framework |
| **Protractor** | ~5.1.2 | End-to-end testing framework for Angular |
| **TSLint** | ~5.9.1 | Static analysis tool for TypeScript code quality |
| **Codelyzer** | ^4.0.1 | TSLint rules for Angular style guide compliance |

---

## Environment Requirements

### Minimum System Requirements

| Dependency | Minimum Version | Recommended Version | Notes |
|------------|-----------------|---------------------|-------|
| **JDK** | 1.8 | 1.8 or 11 | OpenJDK or Oracle JDK |
| **Maven** | 3.3.9 | 3.6.0+ | Required for building Java modules |
| **Node.js** | 9.4.0 | 10.x or LTS | Auto-installed by frontend-maven-plugin |
| **Yarn** | 1.6.0 | Latest stable | Auto-installed by frontend-maven-plugin |
| **Hazelcast** | 3.7.9 | Latest 3.x or 4.x | Must be in project classpath (provided scope) |
| **Spring Boot** | 1.5.9 | 2.0.2+ | Core uses 2.0.2, UI uses 1.5.9 |

### Compatible Operating Systems

- **Windows**: Windows 7/8/10/11 (64-bit recommended)
- **macOS**: macOS 10.12 (Sierra) or later
- **Linux**: Ubuntu 16.04+, CentOS 7+, Debian 9+, or equivalent

---

## Installation & Setup

### Prerequisites Verification

Before starting, ensure your environment meets the requirements:

```bash
# Check Java version
java -version

# Check Maven version
mvn -version

# Check Node.js version (optional, will be auto-installed)
node -v

# Check Yarn version (optional, will be auto-installed)
yarn -v
```

### Step-by-Step Installation

#### 1. Clone the Repository

```bash
git clone https://github.com/sercancelenk/hazzmon-io.git
cd hazzmon-io
```

#### 2. Build and Install hazzmon-core

```bash
cd hazzmon-core
mvn clean install -DskipTests
```

#### 3. Build and Install hazzmon-ui

```bash
cd ../hazzmon-ui
mvn -Pui-build clean process-resources -DskipTests
mvn install -DskipTests
```

**Note:** The `ui-build` profile will automatically:
- Install Node.js v9.4.0 and Yarn v1.6.0
- Run `yarn install` to fetch frontend dependencies
- Execute linting and build processes
- Package the Angular application as a JAR file

#### 4. Integrate into Your Project

Add the following dependencies to your project's `pom.xml`:

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

#### 5. Enable Hazzmon in Your Application

Add the `@EnableHazzmonListener` annotation to your Spring Boot configuration class:

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

#### 6. Access the Monitoring UI

Start your Spring Boot application and navigate to:

```
http://localhost:8080/hazzmon-ui.html
```

---

## Project Structure

```
hazzmon-io/
├── README.md                    # English documentation
├── README-ZhCn.md               # Chinese documentation
├── _config.yml                  # Jekyll site configuration
├── .gitignore                   # Git ignore rules
│
├── hazzmon-core/                # Backend core module
│   ├── pom.xml                  # Maven configuration
│   ├── .gitignore
│   └── src/
│       └── main/
│           └── java/
│               └── byzas/libs/hazzmon/core/
│                   ├── configuration/
│                   │   ├── EnableHazzmonListener.java    # Main annotation
│                   │   ├── HazzmonCommonConfiguration.java
│                   │   └── SinglePageAppConfig.java
│                   ├── controller/
│                   │   └── HazzmonCoreController.java    # REST endpoints
│                   ├── model/
│                   │   ├── ClusterInfo.java
│                   │   ├── MapInfo.java
│                   │   ├── Key.java
│                   │   └── ...                           # Data models
│                   ├── service/
│                   │   ├── HazzmonCoreService.java
│                   │   └── impl/
│                   │       └── HazzmonCoreServiceImpl.java
│                   ├── util/
│                   │   ├── Constants.java
│                   │   └── SPAppContext.java
│                   └── filter/
│                       └── CorsFilter.java               # CORS support
│
└── hazzmon-ui/                  # Frontend UI module
    ├── pom.xml                  # Maven configuration (with frontend plugin)
    ├── package.json             # Node.js dependencies
    ├── yarn.lock                # Yarn lock file
    ├── tsconfig.json            # TypeScript configuration
    ├── tslint.json              # TSLint rules
    ├── karma.conf.js            # Karma test configuration
    ├── protractor.conf.js       # Protractor E2E config
    ├── mvnw                     # Maven wrapper (Unix)
    ├── mvnw.cmd                 # Maven wrapper (Windows)
    ├── .gitignore
    ├── README.md                # Angular CLI generated readme
    ├── e2e/                     # End-to-end tests
    │   └── tsconfig.e2e.json
    └── src/
        ├── app/
        │   ├── app.module.ts           # Root Angular module
        │   ├── app.routing.ts          # Application routes
        │   ├── monitor/
        │   │   ├── monitor.module.ts
        │   │   ├── monitor-routing.module.ts
        │   │   ├── monitor.component.ts
        │   │   ├── home/               # Dashboard component
        │   │   ├── instances/          # Hazelcast instances view
        │   │   ├── members/            # Cluster members view
        │   │   ├── key/
        │   │   │   ├── list/           # Key listing
        │   │   │   ├── detail/         # Key details
        │   │   │   └── eviction/       # Key eviction
        │   │   └── common/
        │   │       └── service/
        │   │           └── urlutil.service.ts
        │   └── footer/
        │       └── footer.component.ts
        ├── assets/                     # Static resources
        ├── environments/               # Environment configs
        ├── main.ts                     # Application entry point
        ├── polyfills.ts                # Browser polyfills
        ├── styles.css                  # Global styles
        └── test.ts                     # Test entry point
```

---

## Usage Guide

### Basic Integration

1. Add dependencies to your project
2. Annotate configuration class with `@EnableHazzmonListener`
3. Ensure Hazelcast is configured in your application
4. Access `/hazzmon-ui.html` endpoint

### Available Features

- **Dashboard**: Overview of cluster health and statistics
- **Instances**: View all Hazelcast instances in your application
- **Members**: Monitor cluster members and their status
- **Maps**: Browse distributed maps and their contents
- **Keys**: Search, view, and evict specific keys
- **Statistics**: Real-time metrics and performance data

### API Endpoints

The core module exposes the following REST endpoints:

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/hazzmon/instances` | GET | List all Hazelcast instances |
| `/api/hazzmon/members` | GET | Get cluster member information |
| `/api/hazzmon/maps` | GET | Retrieve map statistics |
| `/api/hazzmon/keys` | GET | Query keys in a specific map |
| `/api/hazzmon/keys/{key}` | GET | Get detailed key information |
| `/api/hazzmon/keys/evict` | POST | Evict specified keys |

---

## Development Guidelines

### Code Style

- **Backend (Java)**: Follow Oracle Java Code Conventions
- **Frontend (TypeScript)**: Adhere to Angular Style Guide
- **Linting**: Run `mvn lint` or `yarn lint` before committing

### Building from Source

```bash
# Full build with tests
mvn clean install

# Skip tests for faster builds
mvn clean install -DskipTests

# Build only UI module with frontend
cd hazzmon-ui && mvn -Pui-build clean install
```

### Running Tests

```bash
# Backend unit tests
mvn test

# Frontend unit tests
cd hazzmon-ui && yarn test

# Frontend end-to-end tests
cd hazzmon-ui && yarn e2e
```

### Making Contributions

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## Troubleshooting

### Common Issues and Solutions

#### Issue 1: Build fails with "Node.js version not compatible"

**Solution:** The frontend-maven-plugin will auto-install the correct Node.js version. Ensure you're using the `ui-build` profile:

```bash
mvn -Pui-build clean process-resources
```

#### Issue 2: Hazelcast version conflict

**Solution:** Ensure your project uses Hazelcast 3.7.9 or higher. Add explicit dependency if needed:

```xml
<dependency>
    <groupId>com.hazelcast</groupId>
    <artifactId>hazelcast</artifactId>
    <version>3.9.4</version>
</dependency>
```

#### Issue 3: UI page returns 404

**Solution:** Verify that both hazzmon-core and hazzmon-ui are in your classpath. Check Spring Boot's component scan includes the hazzmon packages.

#### Issue 4: CORS errors in browser console

**Solution:** The CorsFilter should handle this automatically. If issues persist, configure CORS in your Spring Security configuration.

#### Issue 5: Maven build fails on Windows

**Solution:** Run Maven as administrator or adjust file permissions. Ensure path length doesn't exceed Windows limits.

#### Issue 6: Angular build warnings about RxJS

**Solution:** These are compatibility warnings between Angular 5 and RxJS 5.5. They don't affect functionality but consider upgrading for new projects.

### Getting Help

- Check existing [GitHub Issues](https://github.com/sercancelenk/hazzmon-io/issues)
- Contact maintainers via email: sercancelenk@gmail.com
- Review Hazelcast documentation for cluster configuration

---

## Screenshots

### Dashboard Overview
![Dashboard](https://user-images.githubusercontent.com/289513/40587365-e84867ae-61d6-11e8-9667-6d16e7569b0b.png)

### Cluster Members View
![Members](https://user-images.githubusercontent.com/289513/40587392-1f47e50e-61d7-11e8-8413-23cb6a2dcad4.png)

### Map Statistics
![Maps](https://user-images.githubusercontent.com/289513/40587399-30bb62f2-61d7-11e8-8838-100803d7f2c2.png)

### Key Details
![Key Details](https://user-images.githubusercontent.com/289513/40587402-36046aec-61d7-11e8-99ef-d79851c02a92.png)

### Key Eviction
![Eviction](https://user-images.githubusercontent.com/289513/40587405-3b5bf762-61d7-11e8-910e-222e681d332e.png)

---

## Contributing

We welcome contributions from the community! Here's how you can help:

- Report bugs and suggest features via GitHub Issues
- Submit pull requests with bug fixes or improvements
- Improve documentation
- Share your use cases and feedback

### Contributors

- **Sercan CELENK** ([@sercancelenk](https://github.com/sercancelenk)) - Creator & Maintainer
- **Caner Kurtul** ([@canerkurtul](https://github.com/canerkurtul)) - Special thanks

For detailed contribution guidelines, please see our [Contribution Guide](CONTRIBUTING.md) (if available).

---

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

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

## Donation

If you find this repository helpful, consider making a donation to support continued development. Contact: sercancelenk@gmail.com

---

**Happy Monitoring! 🚀**
