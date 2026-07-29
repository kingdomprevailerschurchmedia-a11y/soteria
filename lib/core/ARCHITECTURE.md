# Soteria Core Architecture

This document describes the foundational architecture of the Soteria application. All new features must adhere to these principles.

## 1. Directory Structure

Soteria follows a **Feature-First Clean Architecture** pattern.

- `lib/core/`: Contains application-wide infrastructure (Design System, Logging, Analytics, Navigation).
- `lib/features/`: Contains business-specific modules organized by feature (e.g., `auth`, `home`, `quiz`).
  - Each feature is subdivided into `data/`, `domain/`, and `presentation/` layers.

## 2. Dependency Management

We use **Riverpod (with generator)** for state management and dependency injection.

- **Providers** should be located in the `presentation/providers/` directory of their respective feature.
- **Repository Interfaces** belong in the `domain/` layer.
- **Repository Implementations** belong in the `data/` layer.

## 3. Design System & Tokens

**NEVER** use hardcoded colors, spacing, or radius values. Use the tokens provided in `lib/core/design_system/`.

- Colors: `SoteriaColors.primary`
- Spacing: `SoteriaSpacing.s16`
- Radius: `SoteriaRadius.m`

## 4. Result Pattern

All asynchronous operations or repository methods should return a `Result<T>` sealed class.

```dart
Future<Result<User>> getUser();
```

Use `when` to handle the `Success`, `Error`, and `Loading` states in the UI.

## 5. Logging & Errors

- Use `loggerProvider` to log system events.
- Never use `print()`.
- Use the `ErrorHandler` to wrap critical async entry points.
- Map technical exceptions to user-friendly `Failure` objects using the `ErrorMapper`.

## 6. Performance & Quality

- All reusable widgets must support **Accessibility** (Semantics).
- Use `QualityChecker` to record any design system violations during development.
- Monitor frame timings and jank in the **Developer Dashboard**.

## 7. Developer Tools

- **Preview Gallery**: Every reusable widget must have a `@Preview` function and be registered in the `PreviewRegistry`.
- **Developer Dashboard**: Instant access to Feature Flags, Analytics logs, and Performance metrics. Accessible only in Debug builds.

## 8. Identity & Session Management

We use a two-tiered identity system:

1.  **AuthController**: Manages the high-level authentication state (status, user profile).
2.  **SessionController**: Manages the technical session lifecycle (restoration, token validity, idle timeouts).

-   **Guest Mode**: Guests can earn XP and Coins which are persisted locally using `GuestProgress`.
-   **Upgrades**: When a guest registers, the `AuthenticationRepository.migrateGuestData` interface should be used to sync local stats to the new account.
-   **Restoration**: The system automatically attempts to restore the previous session on boot via the `AppInitializationService`.
