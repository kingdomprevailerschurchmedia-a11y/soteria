# Game Rules Engine Architecture

## Overview
The Game Rules Engine is the single source of truth for all gameplay behavior in Soteria. It enables remote configuration, A/B testing, and dynamic events without requiring app updates.

## Architecture Layers

### 1. Domain Layer (`domain/`)
- **Models**: Immutable data structures representing different rule categories (Timer, Rewards, Difficulty, Assists, etc.).
- **Repository Interface**: Defines the contract for fetching and syncing rules.

### 2. Data Layer (`data/`)
- **Repositories**: `RulesRepositoryImpl` handles the coordination between local and remote data.
- **Data Sources**: 
    - `LocalRulesDataSource`: Manages persistence via SharedPreferences (JSON).
    - `RemoteRulesDataSource`: Abstraction for Firebase Remote Config or a custom backend.
- **Cache**: Automatic offline caching of the latest successful rule fetch.

### 3. Application Layer (`application/`)
- **RulesResolver**: Implements the priority logic for layered rules.
- **GameRulesEngine**: High-level API for features to consume resolved rules.
- **State Management**: Riverpod providers for real-time rule updates and dashboard state.

## Rule Priority
Rules are resolved in the following order (highest priority wins):
1. **Emergency Override**: Critical hotfixes.
2. **Live Event Rules**: Time-limited modifiers (e.g., Weekend Double XP).
3. **Tournament Rules**: Specific rules for an active competition.
4. **Game Mode Rules**: Base rules for Practice, Pro, Versus, etc.
5. **Default Rules**: Hardcoded fallbacks in the application.

## Versioning & Migration
- Every rule payload includes a `version` string.
- `RulesVersionManager` tracks the current local version.
- On sync, the engine compares versions and updates if a newer version is available.
- Validation checks ensure that downloaded rules are compatible with the current app build.

## Developer Dashboard
The Rules Dashboard (`presentation/screens/rules_dashboard_screen.dart`) allows developers and QA to:
- Preview active rules for any game mode.
- Force a synchronization with the remote source.
- Verify versioning and priority levels.
